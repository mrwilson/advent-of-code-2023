include "utils";

def parse: (
    join("\n")
    | split("\n\n"; null)
    | {
        seeds: (first/": " | last | split(" +"; null) | map(tonumber) ),
        maps:  (. - [first] | map(split("\n"; null) | (first/" " | first/"-" | last) as $name | {
                "\($name)": (. - [first] | map(split(" +"; null) | map(tonumber) | { dst: .[0], src: .[1], len: .[2]} ))
            })) | add
    }
);

def next($value; $map): (
    $map
    | filter( .src <= $value and $value <= (.src + .len))
    | first | if . == null then $value else .dst + ($value - .src) end
);