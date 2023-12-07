def parse: (
    { T: "10", J: "11", Q: "12", K: "13", A: "14" } as $face
    | capture("(?<hand>[0-9TJQKA]+) (?<bid>[0-9]+)")
    | .bid |= tonumber
    | .hand |= (./""
        | map(. as $card | $face | getpath([$card])//$card | tonumber)
        | group_by(.)
        | map([{card: first, count: length}])
        | add
    )
);