
def parse: (
    ./": " | first as $game | last as $reveals | {
        "game" : ($game/" " | last | tonumber),
        "reveals" : ($reveals/"; "  | map(./", " | map(./" ") | map({ "\(last)": (first | tonumber) }) | reduce .[] as $item ({} ; . * $item)))
    }
);
