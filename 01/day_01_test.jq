include "day_01";
include "assert";

def test_input_part_1: (
    "1abc2",
    "pqr3stu8vwx",
    "a1b2c3d4e5f",
    "treb7uchet"
);

def test_input_part_2: (
    "two1nine",
    "eightwothree",
    "abcone2threexyz",
    "xtwone3four",
    "4nineeightseven2",
    "zoneight234",
    "7pqrstsixteen"
);

def should_extract_calibration_value:
    [ test_input_part_1 ] | first | calibration | assert("Value for 1abc2 should be 12"; . == 12);

def should_correct_calibration_values:
    [ test_input_part_1 | calibration ] | add | assert("Total for test input should be 142"; . == 142);

def should_replace_words_with_numbers: (
    "onetwothreefourfivesixseveneightnine"
        | replace_words_with_numbers
        | assert("Replaced value should be 123456789"; . == "o1et2ot3ef4rf5es6xs7ne8tn9e")
);

def should_allow_for_overlapping_numbers: (
    "eightwoneight"
        | replace_words_with_numbers
        | calibration
        | assert("Replaced value should be 88"; . == 88)
);

def should_correct_calibration_values_part_2: (
    [ test_input_part_2 | replace_words_with_numbers | calibration ]
        | add | assert("Total for test input should be 281"; . == 281)
);