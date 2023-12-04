include "assert";
include "day_04";

def should_parse_line_with_card_number: (
    "Card    1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53"
        | parse
        | assert("Should parse scratchcard"; .id == 1)
);

def should_parse_line_with_winning_numbers: (
    "Card    1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53"
        | parse
        | assert("Should parse scratchcard"; .winning_numbers == [41,48,83,86,17])
);

def should_parse_line_with_card_numbers: (
    "Card    1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53"
        | parse
        | assert("Should parse scratchcard"; .card_numbers == [83,86,6,31,17,9,48,53])
);