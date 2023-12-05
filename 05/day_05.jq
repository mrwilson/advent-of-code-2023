include "utils";

def parse: (
    join("\n")
    | split("\n\n"; null)
    | {
        seeds: (first/": " | last | split(" +"; null) | map({ src: tonumber, len: 1}) ),
        maps:  (. - [first] | map(split("\n"; null) | (first/" " | first/"-" | last) as $name | {
                "\($name)": (. - [first] | map(split(" +"; null) | map(tonumber) | { dst: .[0], src: .[1], len: .[2]} ))
            })) | add
    }
);


def merge($map): (
    if  (.src + .len) <= ($map.src + $map.len)  and .src >= $map.src then
        [ { src: (.src + ($map.dst - $map.src)), len: .len } ]
    elif    ($map.src + $map.len) <= (.src + .len)  and $map.src >= .src then
        [
            { src: .src, len: ($map.src - .src) },
            { src: $map.dst, len: $map.len },
            { src: ($map.src + $map.len), len: (.src + .len - ($map.src + $map.len))}
        ]
    elif (.src + .len) > $map.src and ($map.src + $map.len) > (.src + .len) then
        [ { src: .src, len: (.src + .len - $map.src) }, { src: $map.dst, len: (.len - ($map.src - .src)) }]
    elif .src < ($map.src + $map.len) and $map.src < .src then
        [ { src: ($map.dst - $map.src + .src), len: ($map.src + $map.len - .src) }, { src: ($map.src+$map.len), len: (.len - ($map.src + $map.len - .src)) }]
    else
        [.]
    end
);

def next($value; $map): (
    $map
    | filter(($value.src + $value.len) <= .src or (.src + .len) <= $value.src | not)
    | map(. as $rule | $value | merge($rule))
    | flatten
    | if . == [] then [$value] else . end
);

def find_locations: (
    .maps as $map
    | .seeds
    | map(next(.;$map.soil)[])
    | map(next(.;$map.fertilizer)[])
    | map(next(.;$map.water)[])
    | map(next(.;$map.light)[])
    | map(next(.;$map.temperature)[])
    | map(next(.;$map.humidity)[])
    | map(next(.;$map.location)[])
    | map(.src)
);


def find_locations_recursive: (
    .maps as $map
    | .seeds
    | reduce .[] as $seed({seeds:[]};
        if .start == null then .start |= $seed
        else .seeds += [{ src: .start.src, len: $seed.src }] | .start = null
        end
    )
    | .seeds
    | map(next(.;$map.soil)[])
    | map(next(.;$map.fertilizer)[])
    | map(next(.;$map.water)[])
    | map(next(.;$map.light)[])
    | map(next(.;$map.temperature)[])
    | map(next(.;$map.humidity)[])
    | map(next(.;$map.location)[])
    | map(.src)
);


def part1:
    [ inputs ] | parse | find_locations | min;

def part2:
    error("Gave up on implementation a range-based solution. Test input fine, but real input zero-ed out");
