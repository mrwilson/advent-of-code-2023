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

def should_find_empty_lines: (
    [ test_input ] | parse | empty_lines | assert("Should find empty lines"; . == [
        [3, 7],
        [2, 5, 8]
    ])
);

def should_expand_space: (
    [ test_input ] | parse | expand_space(1 ; empty_lines) | assert("Should expand space"; . == [
        [0,4],[1,9],[2,0],[5,8],[6,1],[7,12],[10,9],[11,0],[11,5]
    ])
);

def should_get_distances_between_galaxies: (
    [ test_input ] | parse
    | distances_between_galaxies(1)
    | assert("Should find distances between galaxies"; . == 374)
);

def should_get_distances_between_galaxies__expand_10: (
    [ test_input ] | parse
    | distances_between_galaxies(9)
    | assert("Should find distances between galaxies"; . == 1030)
);

def should_get_distances_between_galaxies__expand_100: (
    [ test_input ] | parse
    | distances_between_galaxies(99)
    | assert("Should find distances between galaxies"; . == 8410)
);