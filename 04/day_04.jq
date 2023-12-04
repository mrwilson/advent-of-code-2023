def parse: (
    capture("Card +(?<id>[0-9]+): +(?<winning_numbers>[0-9 ]+) \\| +(?<card_numbers>[0-9 ]+)")
        | .id |= tonumber
        | .winning_numbers |= (split(" +"; null) | map(tonumber))
        | .card_numbers |= (split(" +"; null) | map(tonumber))
);

def matching_numbers: (
    .winning_numbers as $winning_numbers
        | .card_numbers
        | map([.] | select(inside($winning_numbers)))
        | flatten
        | sort
);

def scores_for_cards: (
    map(matching_numbers | length | if . == 0 then 0 else pow(2; .-1) end)
);

def matches_for_cards: (
    map({ id: .id, score: matching_numbers | length, copies: 1 })
);

def make_copies($id; $cards; $updates): (
    ($cards | map(select(.id == $id)) | first | .copies) as $copies |
        reduce $updates[] as $u ($cards; setpath([$u-1, "copies"]; getpath([$u-1,"copies"]) + $copies))
);

def count_copies: (
    . as $scores
    | map({id: .id, copies: [range(.id+1;.id+.score+1)]})
    | reduce .[] as $card ($scores; . as $s2 | $card | make_copies(.id; $s2; .copies))
    | map(.copies)
    | add
);

def part1:
    [inputs | parse ] | scores_for_cards | add;

def part2:
    [inputs | parse ] | matches_for_cards | count_copies;