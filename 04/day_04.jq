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
    { scores: map(matching_numbers | length), copies: map(1) }
);

def part1:
    [inputs | parse ] | scores_for_cards | add;