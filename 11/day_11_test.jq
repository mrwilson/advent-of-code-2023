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
    [ test_input ] | parse | double_empty_space | assert("Should increase size of grid"; length == 12)
);

def should_double_empty_space__columns: (
    [ test_input ] | parse | transpose | double_empty_space | assert("Should increase size of grid"; length == 13)
);