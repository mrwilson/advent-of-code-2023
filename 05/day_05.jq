def parse: ({
    seeds: (first/": " | last | split(" +"; null) | map(tonumber) )
});