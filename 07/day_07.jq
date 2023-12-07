include "utils";

def parse($part): (
    { T: "10", J: (if $part == 1 then "11" else "-1" end), Q: "12", K: "13", A: "14" } as $face
    | capture("(?<hand>[0-9TJQKA]+) (?<bid>[0-9]+)")
    | .bid |= tonumber
    | .original_hand = (.hand/"" | map(. as $card | $face | getpath([$card])//$card | tonumber))
    | .hand = (.original_hand | group_by(.) | map([{card: first, count: length}]) | add)
);

def sort_hand($part): (
    (.hand | length) as $unique_cards
    | .original_hand as $hand
    |   if $unique_cards == 5 then [1] + .original_hand
        elif $unique_cards == 4 then [2] + .original_hand
        elif $unique_cards == 3 and (.hand | map(.count) | max) == 2 then [3] + .original_hand
        elif $unique_cards == 3 and (.hand | map(.count) | max) == 3 then [4] + .original_hand
        elif $unique_cards == 2 and (.hand | map(.count) | max) == 3 then [5] + .original_hand
        elif $unique_cards == 2 and (.hand | map(.count) | max) == 4 then [6] + .original_hand
        elif $unique_cards == 1 then [7] + .original_hand
    else error("Not implemented") end
    | .[0] += (if $part == 1 then 0 else ($hand | filter(. == -1) | length) end)
);

def score_hands($part): (
    sort_by(sort_hand($part))
    | reduce .[] as $hand ([1, 0]; [first + 1, last + (first * $hand.bid)])
    | last
);

def part1: (
    [ inputs ] | map(parse(1)) | score_hands(1)
);