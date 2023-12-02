
def parse: (
    ./": " | first as $game | last as $reveals | {
        "game" : ($game/" " | last | tonumber),
        "reveals" : ($reveals/"; "  | map(./", " | map(./" ") | map({ "\(last)": (first | tonumber) }) | reduce .[] as $item ({} ; . * $item)))
    }
);

def enforce_cube_limit:
    select(.reveals | all(.red <= 12 and .green <= 13 and .blue <= 14));


def part1:
    [inputs | parse | enforce_cube_limit | .game] | add;