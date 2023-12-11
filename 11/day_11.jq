include "utils";

def parse: (
    map(./"" | map(if . == "." then 0 else 1 end))
);

def empty_lines: (
    [., transpose] | map(map(all(. == 0)) | indices(true))
);

def expand_space($growth; $space): (
    [paths(numbers == 1)] | map([
        (first as $x | $x + ($space[0] | filter(. < $x) | length)*$growth),
        (last as $y  | $y + ($space[1] | filter(. < $y) | length)*$growth)
    ])
);

def distances_between_galaxies($growth): (
    expand_space($growth ; empty_lines) as $galaxies
    | [range(0; ($galaxies | length))]
    | [combinations(2)]
    | filter(first != last)
    | map([$galaxies[first], $galaxies[last]] | transpose | map(first - last | abs) | add)
    | add/2
);

def part1: (
    [inputs] | parse | distances_between_galaxies(1)
);

def part2: (
    [inputs] | parse | distances_between_galaxies(1000000-1)
);