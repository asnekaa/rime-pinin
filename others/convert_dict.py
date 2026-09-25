import re
from functools import lru_cache
from pathlib import Path

RULES = [
    (re.compile(r'^yi$'),           r'y'),
    (re.compile(r'^yin$'),          r'yn'),
    (re.compile(r'^ying$'),         r'yng'),
    (re.compile(r'^wu$'),           r'w'),
    (re.compile(r'^([jqxy])[uv]'),  r'\1ü'),
    (re.compile(r'^([nl])v$'),      r'\1ü'),
    (re.compile(r'^([nl])[uv]e$'),  r'\1üe'),
    (re.compile(r'^yong$'),         r'yüng'),
    (re.compile(r'iong$'),          r'üng'),
    (re.compile(r'ong$'),           r'ung'),
    (re.compile(r'^yo$'),           r'yüo'),
    (re.compile(r'^y$'),            r'i'),
    (re.compile(r'^y([^ü])'),       r'i\1'),
    (re.compile(r'^w'),             r'u'),
    (re.compile(r'^yü'),            r'ü'),
    (re.compile(r'ü'),              r'y'),
    (re.compile(r'ui$'),            r'uei'),
    (re.compile(r'an$'),            r'w'),
    (re.compile(r'ang$'),           r'v'),
    (re.compile(r'en$'),            r'ñ'),
    (re.compile(r'eng$'),           r'ng'),
    (re.compile(r'ng$'),            r'ŋ'),
    (re.compile(r'^(.+)n$'),        r'\1ñ'),
    (re.compile(r'^zh'),            r'ẑ'),
    (re.compile(r'^ch'),            r'ĉ'),
    (re.compile(r'^sh'),            r'ŝ'),
    (re.compile(r'^([zcsrẑĉŝ])i$'), r'\1'),
    (re.compile(r'uo$'),            r'o'),
    (re.compile(r'uai$'),           r'ui'),
    (re.compile(r'uei$'),           r'ue'),
    (re.compile(r'iao$'),           r'io'),
    (re.compile(r'iou$'),           r'iu'),
]

TONE_MAP = {
    'ā': ('a', 1), 'á': ('a', 2), 'ǎ': ('a', 3), 'à': ('a', 4),
    'ō': ('o', 1), 'ó': ('o', 2), 'ǒ': ('o', 3), 'ò': ('o', 4),
    'ē': ('e', 1), 'é': ('e', 2), 'ě': ('e', 3), 'è': ('e', 4),
    'ī': ('i', 1), 'í': ('i', 2), 'ǐ': ('i', 3), 'ì': ('i', 4),
    'ū': ('u', 1), 'ú': ('u', 2), 'ǔ': ('u', 3), 'ù': ('u', 4),
    'ǖ': ('ü', 1), 'ǘ': ('ü', 2), 'ǚ': ('ü', 3), 'ǜ': ('ü', 4),
    'ń': ('n', 2), 'ň': ('n', 3), 'ǹ': ('n', 4),
}

TONE_MARKS = ['-', '/', '|', '\\', '·']

SCRIPT_DIR = Path(__file__).resolve().parent
RIME_ROOT = SCRIPT_DIR.parent
DICT_DIR = RIME_ROOT / 'dicts'


def strip_tone(syl: str):
    tone = None
    out = []

    for ch in syl:
        if ch in TONE_MAP:
            base, t = TONE_MAP[ch]
            out.append(base)
            tone = t
        else:
            out.append(ch)

    return ''.join(out), tone


@lru_cache(maxsize=65536)
def process_syllable(syl: str, apply_tone: bool) -> str:
    base, tone = strip_tone(syl)

    if tone is not None and base == 'n':
        base = 'ñ'

    for pat, rep in RULES:
        base = pat.sub(rep, base)

    if apply_tone:
        t = tone if tone is not None else 5
        base += TONE_MARKS[t - 1]

    return base


def process_pinyin(pinyin: str, apply_tone: bool) -> str:
    return ' '.join(
        process_syllable(s, apply_tone)
        for s in pinyin.split()
    )


def file_has_tone(content: str) -> bool:
    for line in content.splitlines():
        if not line or line.startswith('#') or '\t' not in line:
            continue

        parts = line.split('\t')

        if len(parts) < 2 or not is_pinyin_col(parts[1]):
            continue

        for ch in parts[1]:
            if ch in TONE_MAP:
                return True

    return False


def is_pinyin_col(s: str) -> bool:
    for ch in s:
        if ch.isalpha() or ch in TONE_MAP:
            return True

    return False


def print_progress(filename: str, current: int, total: int, count: int):
    percent = current / total * 100 if total else 100

    print(
        f'\r[{percent:7.2f}%] '
        f'{filename} | '
        f'{current}/{total} 行 | '
        f'已转换 {count} 条',
        end='',
        flush=True,
    )


def convert_file(path: Path) -> int:
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
            print_progress(
                path.name,
                i,
                total_lines,
                count,
            )

    print()

    if count == 0:
        return 0

    new_content = '\n'.join(out_lines)

    if original.endswith('\n'):
        new_content += '\n'

    tmp = path.with_name(path.name + '.tmp')
    tmp.write_text(
        new_content,
        encoding='utf-8',
        newline='',
    )
    tmp.replace(path)

    return count


def main() -> None:
    if not DICT_DIR.is_dir():
        print(f'目录不存在: {DICT_DIR}')
        return

    files = sorted(
        p for p in DICT_DIR.iterdir()
        if p.is_file()
    )

    if not files:
        print(f'目录为空: {DICT_DIR}')
        return

    total = 0

    print(f'开始处理，共 {len(files)} 个文件')
    print(f'目标目录: {DICT_DIR}')
    print()

    for index, f in enumerate(files, 1):
        print(f'[{index}/{len(files)}] {f.name}')

        n = convert_file(f)

        if n < 0:
            print(f'  跳过（非 UTF-8）: {f.name}')
        else:
            print(f'  完成：{n} 条')
            total += n

        print()

    print(f'共转换 {total} 条，目标目录: {DICT_DIR}')
    print(f'缓存条目: {process_syllable.cache_info().currsize}')


if __name__ == '__main__':
    main()
