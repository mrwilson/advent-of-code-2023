def parse: (
    capture("Card (?<id>[0-9]+):.*")
        | .id |= tonumber
);