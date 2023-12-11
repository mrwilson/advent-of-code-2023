def parse: ./" " | map(tonumber);

def descend: (
    [.] | until(last | unique | length == 1; . + [last | [.[1:], .[:-1] ] | transpose | map(first-last)])
);

def next_number: descend | map(last) | add;

def previous_number: reverse | descend | map(last) | add;

def part1: [ inputs | parse ] | map(next_number) | add;

def part2: [ inputs | parse ] | map(previous_number) | add;