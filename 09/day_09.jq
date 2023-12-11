def parse: ./" " | map(tonumber);

def descend: (
    [.] | until(last | unique | length == 1; . + [(last | [.[1:], .[:-1] ] | transpose | map(first-last))])
);

def next_number: descend | map(last) | add;

def previous_number: (
    descend | map(first) | reduce .[] as $entry ([0,1] ; [ first+(last*$entry), last*-1]) | first
);

def part1: [ inputs | parse ] | map(next_number) | add;