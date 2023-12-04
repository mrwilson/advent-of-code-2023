def parse: (
    capture("Card +(?<id>[0-9]+): (?<winning_numbers>[0-9 ]+) \\| (?<card_numbers>[0-9 ]+)")
        | .id |= tonumber
        | .winning_numbers |= (./" " | map(tonumber))
        | .card_numbers |= (split(" +"; null) | map(tonumber))
);

def matching_numbers: (
    .winning_numbers as $winning_numbers
        | .card_numbers
        | map([.] | select(inside($winning_numbers)))
        | flatten
        | sort
);