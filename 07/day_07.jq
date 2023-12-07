include "utils";

def parse: (
    { T: "10", J: "11", Q: "12", K: "13", A: "14" } as $face
    | capture("(?<hand>[0-9TJQKA]+) (?<bid>[0-9]+)")
    | .bid |= tonumber
    | .original_hand = (.hand/"" | map(. as $card | $face | getpath([$card])//$card | tonumber))
    | .hand = (.original_hand | group_by(.) | map([{card: first, count: length}]) | add)
);

def sort_hand: (
    (.hand | length) as $unique_cards
    |   if $unique_cards == 5 then [1] + .original_hand
        elif $unique_cards == 4 then [2] + .original_hand
        elif $unique_cards == 3 then [3] + .original_hand

    else error("Not implemented") end
);