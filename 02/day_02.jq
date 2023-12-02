
def parse: (
    ./":" | first as $game | last as $reveals | {
        "game" : ($game/" " | last | tonumber)
    }
);
