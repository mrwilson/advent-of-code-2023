def parse: ({
    instructions: [ first/"" | .[] | if . == "R" then 1 else 0 end ],
    network: (.[2:] | map(split("[^A-Z]+"; null) | { "\(.[0])": [.[1], .[2] ] }) | add)
});

def refine_network: (
    .instructions as $instructions
    | .network as $network
    | .network | keys
    | map(. as $node | reduce $instructions[] as $step (.; $network[.][$step]) | { "\($node)": . })
    | { instructions: $instructions, network: add }
);

def source_to_sink: (
    .network as $network
    | ["AAA"]
    | until(last == "ZZZ"; . + [$network[last]])

);