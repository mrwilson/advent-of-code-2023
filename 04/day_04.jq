def parse: (
    capture("Card (?<id>[0-9]+): (?<winning_numbers>[0-9 ]+) | .*")
        | .id |= tonumber
        | .winning_numbers |= (./" " | map(tonumber))
);