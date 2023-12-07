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
    "32T3K 765" | parse | assert("Should parse into structure"; . == {
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
    "23456 0" | parse | sort_hand
    | assert("Should provide sort information :: high card"; . == [1,2,3,4,5,6])
);

def should_return_sort_information__one_pair: (
    "52354 0" | parse | sort_hand
    | assert("Should provide sort information :: one pair"; . == [2,5,2,3,5,4])
);

def should_return_sort_information__two_pair: (
    "23432 0" | parse | sort_hand
    | assert("Should provide sort information :: one pair"; . == [3,2,3,4,3,2])
);

def should_return_sort_information__three_of_a_kind: (
    "22234 0" | parse | sort_hand
    | assert("Should provide sort information :: three of a kind"; . == [4,2,2,2,3,4])
);

def should_return_sort_information__full_house: (
    "23332 0" | parse | sort_hand
    | assert("Should provide sort information :: three of a kind"; . == [5,2,3,3,3,2])
);

def should_return_sort_information__four_of_a_kind: (
    "23333 0" | parse | sort_hand
    | assert("Should provide sort information :: four of a kind"; . == [6,2,3,3,3,3])
);

def should_return_sort_information__five_of_a_kind: (
    "33333 0" | parse | sort_hand
    | assert("Should provide sort information :: five of a kind"; . == [7,3,3,3,3,3])
);

def should_rank_hands_for_test_input: (
    [ test_input ] | map(parse) | sort_by(sort_hand) | map(.original_hand)
    | assert("Should rank hands using score"; . == [
        [3,2,10,3,13],
        [13,10,11,11,10],
        [13,13,6,7,7],
        [10,5,5,11,5],
        [12,12,12,11,14]
    ])
);

def should_score_bids_for_all_hands: (
    [ test_input ] | score_hands | assert("Should score hands with bids"; . == 6440)
);