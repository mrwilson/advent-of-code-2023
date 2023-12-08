def parse: ({
    instructions: [ first/"" | .[] | if . == "R" then 1 else 0 end ]
});