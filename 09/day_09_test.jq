include "assert";
include "day_09";

def test_input: (
    "0 3 6 9 12 15",
    "1 3 6 10 15 21",
    "10 13 16 21 30 45"
);

def should_parse_input: (
    [ test_input | parse ] | assert("Should parse list of numbers"; . == [
        [0,3,6,9,12,15], [1,3,6,10,15,21], [10,13,16,21,30,45]
    ])
);

def should_descend_until_equal_differences: (
    [ test_input | parse ] | last | descend | assert("Should find point where all differences are equal"; . == [
        [10,13,16,21,30,45],
        [3,3,5,9,15],
        [0,2,4,6],
        [2,2,2]
    ])
);

def should_find_next_number: (
    [ test_input | parse ] | map(next_number)
    | assert("Should find point where all differences are equal"; . == [18,28,68])
);

def should_find_previous_number: (
    [ test_input | parse ] | map(previous_number)
    | assert("Should find previous numbers"; . == [-3,0,5])
);