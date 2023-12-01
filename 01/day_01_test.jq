include "day_01";
include "assert";

def test_input: (
    "1abc2",
    "pqr3stu8vwx",
    "a1b2c3d4e5f",
    "treb7uchet"
);

def should_extract_calibration_value:
    [ test_input ] | first | calibration | assert("Value for 1abc2 should be 12, was \(.)"; . == 12);

def should_correct_calibration_values:
    [ test_input | calibration ] | add | assert("Total for test input should be 142, was \(.)"; . == 142);