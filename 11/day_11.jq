include "utils";

def parse: (
    map(./"" | map(if . == "." then 0 else 1 end))
);

def double_empty_space: (
    reduce .[] as $row ([]; if ($row | all(. == 0)) then . + [$row] + [$row] else . + [$row] end)
);

def expand: double_empty_space | transpose | double_empty_space | transpose;

def distances_between_galaxies: (
    [paths(numbers == 1)] as $galaxies
    | [range(0; ($galaxies | length))]
    | [combinations(2)]
    | filter(first != last)
    | map([$galaxies[first], $galaxies[last]] | transpose | map(first - last | abs) | add)
    | add/2
);