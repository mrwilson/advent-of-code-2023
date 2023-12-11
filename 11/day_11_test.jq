include "assert";
include "day_11";

def test_input: (
    "...#......",
    ".......#..",
    "#.........",
    "..........",
    "......#...",
    ".#........",
    ".........#",
    "..........",
    ".......#..",
    "#...#....."
);

def should_parse_input: (
    [ test_input ] | parse | assert("Parse sky as grid"; . == [
        [0,0,0,1,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,1,0,0],
        [1,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,1,0,0,0],
        [0,1,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,1],
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,1,0,0],
        [1,0,0,0,1,0,0,0,0,0]
    ])
);

def should_double_empty_space__rows: (
    [ test_input ] | parse | expand | assert("Should increase size of grid"; length == 12)
);

def should_double_empty_space__columns: (
    [ test_input ] | parse | expand | transpose | assert("Should increase size of grid"; length == 13)
);

def should_find_empty_lines: (
    [ test_input ] | parse | empty_lines | assert("Should find empty lines"; . == [
        [3, 7],
        [2, 5, 8]
    ])
);

def should_get_distances_between_galaxies: (
    [ test_input ] | parse
    | expand
    | distances_between_galaxies
    | assert("Should find distances between galaxies"; . == 374)
);