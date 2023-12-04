include "assert";
include "day_04";

def test_input: (
    "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53",
    "Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19",
    "Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1",
    "Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83",
    "Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36",
    "Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11"
);

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

def should_get_matching_numbers: (
    "Card    1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53"
        | parse
        | matching_numbers
        | assert("Should identify matching numbers"; . == [17,48,83,86])
);

def should_get_scores_for_all_cards: (
    [ test_input | parse ]
        | scores_for_cards
        | assert("Should score all cards"; . == [8,2,2,1,0,0])
);