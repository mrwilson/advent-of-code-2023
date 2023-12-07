include "assert";
include "day_07";

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