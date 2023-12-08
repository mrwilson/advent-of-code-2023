include "utils";

def parse: ({
    instructions: [ first/"" | .[] | if . == "R" then 1 else 0 end ],
    network: (.[2:] | map(split("[^0-9A-Z]+"; null) | { "\(.[0])": [.[1], .[2] ] }) | add)
});

def refine_network: (
    .instructions as $instructions
    | .network as $network
    | .network | keys
    | map(. as $node | reduce $instructions[] as $step (.; $network[.][$step]) | { "\($node)": . })
    | { instructions: $instructions, network: add }
);

def source_to_sink($starts; $terminals): (
    .network as $network
    | $starts
    | map([.] | until([last] | inside($terminals); . + [$network[last]]))
);

def ghost_source_to_sink: (
    (.instructions | length) as $steps
    | (.network | keys | [filter(endswith("A")), filter(endswith("Z"))]) as [$starts, $terminals]
    | source_to_sink($starts; $terminals)
    | map((length - 1) * $steps)
);

def part1: (
    [ inputs ] | parse | refine_network | [(source_to_sink(["AAA"]; ["ZZZ"]) | first | length - 1), (.instructions | length)] | first * last
);

def part2: (
    [ inputs ]
    | parse
    | refine_network
    | ghost_source_to_sink
    | reduce .[] as $steps(1; (. * $steps)/gcd(.; $steps))
);