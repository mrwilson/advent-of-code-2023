def parse: (
    map(split(": +"; null) | last | split(" +"; null) | map(tonumber)) | transpose
);

def parse_part_2: (
    map(split(": +"; null) | last | gsub(" "; "") | tonumber)
);

def roots: (
    first as $b | last as $c
    | ($b*$b - 4*$c) | sqrt
    | [ ($b - .)/2, ($b + .)/2 ]
    | [ (first + 1 | floor), (last -1 | ceil) ]
);

def ways_to_win: (
    map(roots | last - first + 1) | reduce .[] as $way (1; . * $way)
);

def part1:
    [ inputs ] | parse | ways_to_win;

def part2:
    [inputs] | [parse_part_2] | ways_to_win;