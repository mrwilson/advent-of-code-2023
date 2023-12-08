def parse: ({
    instructions: [ first/"" | .[] | if . == "R" then 1 else 0 end ],
    network: (.[2:] | map(split("[^A-Z]+"; null) | { "\(.[0])": [.[1], .[2] ] }) | add)
});