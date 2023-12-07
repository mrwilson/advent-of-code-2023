include "utils";

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

def sort_hand: (
    (.hand | length) as $unique_cards
    |   if $unique_cards == 5 then [1, (.hand | map(.card) | max) ]
        elif $unique_cards == 4 then [2, (.hand | filter(.count == 2) | first | .card) ]

    else error("Not implemented") end
);