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