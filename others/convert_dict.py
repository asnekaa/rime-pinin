import argparse
import re
import shutil
import sys
from functools import lru_cache
from pathlib import Path


RULES = [
    (re.compile(r'ong$'),           r'ung'),
    (re.compile(r'^yi(.*)$'),       r'i\1'),
    (re.compile(r'^y(?!u)(.+)$'),   r'i\1'),
    (re.compile(r'^yu(.*)$'),       r'y\1'),
    (re.compile(r'^wu$'),           r'u'),
    (re.compile(r'^w'),             r'u'),
    (re.compile(r'^([jqx])u$'),     r'\1y'),
    (re.compile(r'^([nl])[üv]$'),   r'\1y'),
    (re.compile(r'^([nl])[üv]e$'),  r'\1ue'),
    (re.compile(r'^n(g?)$'),        r'en\1'),
    (re.compile(r'ng$'),            r'g'),
    (re.compile(r'^(.+)an$'),       r'\1w'),
    (re.compile(r'^(.+)ag$'),       r'\1r'),
    (re.compile(r'^(.+)e([ng])$'),  r'\1\2'),
    (re.compile(r'iu$'),            r'iou'),
    (re.compile(r'ui$'),            r'uei'),
    (re.compile(r'uo$'),            r'o'),
    (re.compile(r'iao$'),           r'io'),
    (re.compile(r'iou$'),           r'iu'),
    (re.compile(r'uai$'),           r'ui'),
    (re.compile(r'uei$'),           r'ue'),
    (re.compile(r'^([jqx])i(.+)$'), r'\1\2'),
]


TONE_MAP = {
    'ā': ('a', 1), 'á': ('a', 2), 'ǎ': ('a', 3), 'à': ('a', 4),
    'ō': ('o', 1), 'ó': ('o', 2), 'ǒ': ('o', 3), 'ò': ('o', 4),
    'ē': ('e', 1), 'é': ('e', 2), 'ě': ('e', 3), 'è': ('e', 4),
    'ī': ('i', 1), 'í': ('i', 2), 'ǐ': ('i', 3), 'ì': ('i', 4),
    'ū': ('u', 1), 'ú': ('u', 2), 'ǔ': ('u', 3), 'ù': ('u', 4),
    'ǖ': ('ü', 1), 'ǘ': ('ü', 2), 'ǚ': ('ü', 3), 'ǜ': ('ü', 4),
    'ń': ('n', 2), 'ň': ('n', 3), 'ǹ': ('n', 4),
    'ḿ': ('m', 2), 'm̀': ('m', 4),
}

TONE_MARKS = 'dfjkv'

SCRIPT_DIR = Path(__file__).resolve().parent
RIME_ROOT = SCRIPT_DIR.parent
DICT_DIR = RIME_ROOT / 'dicts'
DICT_SOURCES = (
    RIME_ROOT / 'rime-ice' / 'cn_dicts',
    RIME_ROOT / 'rime-wanxiang-data' / 'dicts',
)


def strip_tone(syl: str) -> tuple[str, int | None]:
    tone = None
    out = []
    i = 0

    while i < len(syl):
        mark = 'm̀' if syl.startswith('m̀', i) else syl[i]
        entry = TONE_MAP.get(mark)

        if entry is None:
            out.append(syl[i])
            i += 1
        else:
            base, tone = entry
            out.append(base)
            i += len(mark)

    return ''.join(out), tone


@lru_cache(maxsize=65536)
def process_syllable(syl: str, apply_tone: bool) -> str:
    if apply_tone:
        base, tone = strip_tone(syl)
    else:
        base, tone = syl, None

    for pat, rep in RULES:
        base = pat.sub(rep, base)

    if apply_tone:
        base += TONE_MARKS[(tone if tone is not None else 5) - 1]

    return base


def process_pinyin(pinyin: str, apply_tone: bool) -> str:
    return ' '.join(
        process_syllable(syl, apply_tone)
        for syl in pinyin.split()
    )


def is_pinyin_col(s: str) -> bool:
    return any(ch.isalpha() or ch in TONE_MAP for ch in s)


def file_has_tone(content: str) -> bool:
    return any(
        any(mark in parts[1] for mark in TONE_MAP)
        for line in content.splitlines()
        if line and not line.startswith('#') and '\t' in line
        for parts in [line.split('\t', 2)]
        if len(parts) >= 2 and is_pinyin_col(parts[1])
    )


def sync_dicts() -> int:
    staged: dict[str, Path] = {}

    for source in DICT_SOURCES:
        if not source.is_dir():
            print(f'  跳过（目录不存在）: {source}')
            continue

        found = sorted(p for p in source.glob('*.dict.yaml') if p.is_file())

        for path in found:
            staged[path.name] = path

        print(f'  {source.name}: {len(found)} 个')

    if not staged:
        print('  没有找到来源词库，dicts 保持原样')
        return 0

    removed = 0

    for path in sorted(DICT_DIR.glob('*.dict.yaml')):
        if path.is_file():
            path.unlink()
            removed += 1

    copied = 0

    for name, source in sorted(staged.items()):
        shutil.copyfile(source, DICT_DIR / name)
        copied += 1

    print(f'  删除 {removed} 个旧文件，复制 {copied} 个新文件')
    return copied


def print_progress(filename: str, current: int, total: int, count: int) -> None:
    percent = current / total * 100 if total else 100

    print(
        f'\r[{percent:7.2f}%] '
        f'{filename} | '
        f'{current}/{total} 行 | '
        f'已转换 {count} 条',
        end='',
        flush=True,
    )


def convert_file(path: Path, dry_run: bool) -> int:
    try:
        original = path.read_text(encoding='utf-8')
    except UnicodeDecodeError:
        return -1

    apply_tone = file_has_tone(original)
    lines = original.splitlines()
    total_lines = len(lines)
    out_lines = []
    count = 0
    progress_step = max(1000, total_lines // 100)

    for i, line in enumerate(lines, 1):
        if not line or line.startswith('#') or '\t' not in line:
            out_lines.append(line)
        else:
            parts = line.split('\t')

            if len(parts) < 2 or not is_pinyin_col(parts[1]):
                out_lines.append(line)
            else:
                new_pinyin = process_pinyin(parts[1], apply_tone)

                if new_pinyin != parts[1]:
                    count += 1

                parts[1] = new_pinyin
                out_lines.append('\t'.join(parts))

        if i % progress_step == 0 or i == total_lines:
            print_progress(path.name, i, total_lines, count)

    print()

    if count == 0 or dry_run:
        return count

    new_content = '\n'.join(out_lines)

    if original.endswith('\n'):
        new_content += '\n'

    tmp = path.with_name(path.name + '.tmp')
    tmp.write_text(new_content, encoding='utf-8', newline='')
    tmp.replace(path)

    return count


def main() -> None:
    parser = argparse.ArgumentParser(description='把词库拼音列转成 Pinin 编码。')
    parser.add_argument('--dry-run', action='store_true', help='只统计会改多少条，不写文件')
    parser.add_argument('--no-sync', action='store_true', help='不删除/复制 dicts，直接在现有文件上改')
    args = parser.parse_args()

    if not DICT_DIR.is_dir():
        print(f'目录不存在: {DICT_DIR}')
        return

    if args.dry_run:
        print('模式: 试运行（不写文件）')
        print()

    if not args.no_sync:
        print('同步来源词库 → dicts')
        sync_dicts()
        print()

    files = sorted(p for p in DICT_DIR.iterdir() if p.is_file())

    if not files:
        print(f'目录为空: {DICT_DIR}')
        return

    print(f'目标目录: {DICT_DIR}')
    print(f'开始处理，共 {len(files)} 个文件')
    print()

    total = 0

    for index, path in enumerate(files, 1):
        print(f'[{index}/{len(files)}] {path.name}')

        count = convert_file(path, args.dry_run)

        if count < 0:
            print(f'  跳过（非 UTF-8）: {path.name}')
        else:
            print(f'  完成：转换 {count} 条')
            total += count

        print()

    print(f'共转换 {total} 条，目标目录: {DICT_DIR}')
    print(f'缓存条目: {process_syllable.cache_info().currsize}')


if __name__ == '__main__':
    sys.exit(main())
