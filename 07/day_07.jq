include "utils";

def parse($part): (
    { T: "10", J: (if $part == 1 then "11" else "-1" end), Q: "12", K: "13", A: "14" } as $face
    | capture("(?<hand>[0-9TJQKA]+) (?<bid>[0-9]+)")
    | .bid |= tonumber
    | .original_hand = (.hand/"" | map(. as $card | $face | getpath([$card])//$card | tonumber))
    | .hand = (.original_hand | group_by(.) | map([{card: first, count: length}]) | add)
);

def upgrade_rank_with_jokers: (
    first as $original_rank
    | last as $jokers
    |   if $jokers == 0 then $original_rank
        elif $original_rank == 2 then 4                         # 1 pair -> 3 of a kind
        elif $original_rank == 3 and $jokers == 1 then 5        # 2 pair -> full house
        elif $original_rank == 3 and $jokers == 2 then 6        # 2 pair -> 4 of a kind
        elif $original_rank == 4 then 6                         # 3 of a kind -> 4 of a kind
        elif (5 <= $original_rank and $original_rank <= 7) then 7 # Full house, 4 of a kind, 5 of a kind
        else $original_rank + 1
        end
);

def sort_hand($part): (
    (.hand | length) as $unique_cards
    | .original_hand as $hand
    | (.hand | map(.count) | max) as $most_copies
    | ($hand | filter(. == -1) | length) as $jokers
    |   if $unique_cards == 5 then [1] + .original_hand
        elif $unique_cards == 4 then [2] + .original_hand
        elif $unique_cards == 3 and $most_copies == 2 then [3] + .original_hand
        elif $unique_cards == 3 and $most_copies == 3 then [4] + .original_hand
        elif $unique_cards == 2 and $most_copies == 3 then [5] + .original_hand
        elif $unique_cards == 2 and $most_copies == 4 then [6] + .original_hand
        elif $unique_cards == 1 then [7] + .original_hand
    else error("Not implemented") end
    | if $part == 2 then .[0] = ([first, $jokers] | upgrade_rank_with_jokers) end

);

def score_hands($part): (
    sort_by(sort_hand($part))
    | reduce .[] as $hand ([1, 0]; [first + 1, last + (first * $hand.bid)])
    | last
);

def part1: (
    [ inputs ] | map(parse(1)) | score_hands(1)
);

def part2: (
    [ inputs ] | map(parse(2)) | score_hands(2)
);