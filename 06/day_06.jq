def parse: (
    map(split(": +"; null) | last | split(" +"; null) | map(tonumber)) | transpose
);

def roots: (
    first as $b | last as $c
    | ($b*$b - 4*$c)
    | sqrt
    | [ ($b - .)/2, ($b + .)/2 ]
    | [ (first + 1 | floor), (last -1 | ceil) ]
);

def ways_to_win: (
    map(roots | last - first + 1) | reduce .[] as $way (1; . * $way)
);