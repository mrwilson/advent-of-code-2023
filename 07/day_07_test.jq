include "assert";
include "day_07";

def test_input: (
    "32T3K 765",
    "T55J5 684",
    "KK677 28",
    "KTJJT 220",
    "QQQJA 483"
);

def should_parse_out_hand: (
    "32T3K 765" | parse(1) | assert("Should parse into structure"; . == {
        bid: 765,
        hand: [
            { "card": 2, "count": 1 },
            { "card": 3, "count": 2 },
            { "card": 10, "count": 1 },
            { "card": 13, "count": 1 }
        ],
        original_hand: [ 3, 2, 10, 3, 13 ]
    })
);

def should_return_sort_information__high_card: (
    "23456 0" | parse(1) | sort_hand(1)
    | assert("Should provide sort information :: high card"; . == [1,2,3,4,5,6])
);

def should_return_sort_information__one_pair: (
    "52354 0" | parse(1) | sort_hand(1)
    | assert("Should provide sort information :: one pair"; . == [2,5,2,3,5,4])
);

def should_return_sort_information__two_pair: (
    "23432 0" | parse(1) | sort_hand(1)
    | assert("Should provide sort information :: one pair"; . == [3,2,3,4,3,2])
);

def should_return_sort_information__three_of_a_kind: (
    "22234 0" | parse(1) | sort_hand(1)
    | assert("Should provide sort information :: three of a kind"; . == [4,2,2,2,3,4])
);

def should_return_sort_information__full_house: (
    "23332 0" | parse(1) | sort_hand(1)
    | assert("Should provide sort information :: three of a kind"; . == [5,2,3,3,3,2])
);

def should_return_sort_information__four_of_a_kind: (
    "23333 0" | parse(1) | sort_hand(1)
    | assert("Should provide sort information :: four of a kind"; . == [6,2,3,3,3,3])
);

def should_return_sort_information__five_of_a_kind: (
    "33333 0" | parse(1) | sort_hand(1)
    | assert("Should provide sort information :: five of a kind"; . == [7,3,3,3,3,3])
);

def should_rank_hands_for_test_input: (
    [ test_input ] | map(parse(1)) | sort_by(sort_hand(1)) | map(.original_hand)
    | assert("Should rank hands using score"; . == [
        [3,2,10,3,13],
        [13,10,11,11,10],
        [13,13,6,7,7],
        [10,5,5,11,5],
        [12,12,12,11,14]
    ])
);

def should_score_bids_for_all_hands: (
    [ test_input ] | map(parse(1)) | score_hands(1) | assert("Should score hands with bids"; . == 6440)
);

def should_parse_j_as_joker: (
    [test_input] | map(parse(2)) | map(sort_hand(2) | first)
    | assert("Should parse jokers as lowest value"; . == [2,6,3,6,6])
);

def should_score_bids_for_all_hands_part_2: (
    [ test_input ] | map(parse(2)) | score_hands(2) | assert("Should score hands with bids"; . == 5905)
);

def should_upgrade_hands_with_jokers: (
    [
        [1, 0], # No jokers
        [1, 1], # High card
        [2, 1], # 1 Pair, J is not in the pair
        [2, 2], # 1 Pair, J is in the pair
        [3, 1], # 2 Pair, J is not in a pair
        [3, 2], # 2 Pair, J is in a pair
        [4, 1], # 3 of a kind, J is not in the 3
        [4, 3], # 3 of a kind, J is in the 3
        [5, 2], [5, 3], # Full house, doesn't matter which pair
        [6, 1], [6, 4], # 4 of a kind, doesn't matter which is a J
        [7, 5] # Only one way it can go
    ] | map(upgrade_rank_with_jokers) | assert("Should remap hand ranks based on number of jokers"; . == [
        1,2,4,4,5,6,6,6,7,7,7,7,7
    ])

);