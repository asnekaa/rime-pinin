import re
from pathlib import Path

RULES = [
    (r'^yi$',                 r'y'),
    (r'^yin$',                r'yn'),
    (r'^ying$',               r'yng'),
    (r'^wu$',                 r'w'),
    (r'^([jqxy])[uv]',        r'\1ü'),
    (r'^([nl])v$',            r'\1ü'),
    (r'^([nl])[uv]e$',        r'\1üe'),
    (r'^yong$',               r'yüng'),
    (r'iong$',                r'üng'),
    (r'ong$',                 r'ung'),
    (r'^yo$',                 r'yüo'),
    (r'^y$',                  r'i'),
    (r'^y([^ü])',             r'i\1'),
    (r'^w',                   r'u'),
    (r'^yü',                  r'ü'),
    (r'ü',                    r'y'),
    (r'ui$',                  r'uei'),
    (r'an$',                  r'w'),
    (r'ang$',                 r'v'),
    (r'en$',                  r'n'),
    (r'eng$',                 r'ng'),
    (r'ng$',                  r'g'),
    (r'^([zcsr]|zh|ch|sh)i$', r'\1'),
    (r'^zh',                  r'j'),
    (r'^ch',                  r'q'),
    (r'^sh',                  r'x'),
    (r'uo$',                  r'o'),
    (r'uai$',                 r'ui'),
    (r'uei$',                 r'ue'),
    (r'iao$',                 r'io'),
    (r'iou$',                 r'iu')
]

TONE_MAP = {
    'ā': ('a', 1), 'á': ('a', 2), 'ǎ': ('a', 3), 'à': ('a', 4),
    'ō': ('o', 1), 'ó': ('o', 2), 'ǒ': ('o', 3), 'ò': ('o', 4),
    'ē': ('e', 1), 'é': ('e', 2), 'ě': ('e', 3), 'è': ('e', 4),
    'ī': ('i', 1), 'í': ('i', 2), 'ǐ': ('i', 3), 'ì': ('i', 4),
    'ū': ('u', 1), 'ú': ('u', 2), 'ǔ': ('u', 3), 'ù': ('u', 4),
    'ǖ': ('ü', 1), 'ǘ': ('ü', 2), 'ǚ': ('ü', 3), 'ǜ': ('ü', 4),
    'ń': ('n', 2), 'ň': ('n', 3), 'ǹ': ('n', 4)
}

TONE_MARKS = ['①', '②', '③', '④', '⑤']

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


def process_syllable(syl: str, apply_tone: bool) -> str:
    base, tone = strip_tone(syl)
    for pat, rep in RULES:
        base = re.sub(pat, rep, base)
    if apply_tone:
        t = tone if tone is not None else 5
        base += TONE_MARKS[t - 1]
    return base


def process_pinyin(pinyin: str, apply_tone: bool) -> str:
    return ' '.join(process_syllable(s, apply_tone) for s in pinyin.split())


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


def convert_file(path: Path) -> int:
    try:
        original = path.read_text(encoding='utf-8')
    except UnicodeDecodeError:
        return -1

    apply_tone = file_has_tone(original)

    out_lines = []
    count = 0
    for line in original.splitlines():
        if not line or line.startswith('#') or '\t' not in line:
            out_lines.append(line)
            continue
        parts = line.split('\t')
        if len(parts) < 2 or not is_pinyin_col(parts[1]):
            out_lines.append(line)
            continue
        new_pinyin = process_pinyin(parts[1], apply_tone)
        if new_pinyin != parts[1]:
            count += 1
        parts[1] = new_pinyin
        out_lines.append('\t'.join(parts))

    if count == 0:
        return 0

    new_content = '\n'.join(out_lines)
    if original.endswith('\n'):
        new_content += '\n'

    tmp = path.with_name(path.name + '.tmp')
    tmp.write_text(new_content, encoding='utf-8', newline='')
    tmp.replace(path)
    return count


def main() -> None:
    if not DICT_DIR.is_dir():
        print(f'目录不存在: {DICT_DIR}')
        return

    files = sorted(p for p in DICT_DIR.iterdir() if p.is_file())
    if not files:
        print(f'目录为空: {DICT_DIR}')
        return

    total = 0
    for f in files:
        n = convert_file(f)
        if n < 0:
            print(f'  跳过（非 UTF-8）: {f.name}')
        else:
            print(f'{n:>7} 条  {f.name}')
            total += n
    print(f'共转换 {total} 条，目标目录: {DICT_DIR}')


if __name__ == '__main__':
    main()
