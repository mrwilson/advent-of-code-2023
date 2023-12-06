include "assert";
include "day_06";

def test_input: (
    "Time:      7  15   30",
    "Distance:  9  40  200"
);

def should_parse_input: (
    [ test_input ] | parse | assert("Should parse input"; . == [
        [7, 9],
        [15, 40],
        [30, 200]
    ])
);

def should_calculate_rounded_quadratic_roots: (
    [7, 9] | roots | assert("Should parse input"; . == [2, 5])
);

def should_calculate_ways_to_win: (
    [ test_input ] | parse | ways_to_win | assert("Should multiply ways to win"; . == 4 * 8 * 9)
);

def should_parse_input_for_part_2: (
    [ test_input ] | parse_part_2 | assert("Should parse input for part 2"; . == [71530,940200])
);