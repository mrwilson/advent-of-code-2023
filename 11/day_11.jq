def parse: (
    map(./"" | map(if . == "." then 0 else 1 end))
);