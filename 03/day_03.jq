def parse: (
    ./"" | map(. as $original | try tonumber catch (if $original == "." then null else -1 end))
);

def symbols:
    paths(numbers < 0);

def part_numbers: (
    [
        [ paths(numbers >= 0) ]
        | group_by(.[0])[]
        | reduce .[] as $digit (null;
            if (.digits | length) == 0 then .digits = [$digit]
            elif .digits[-1][1] + 1 == $digit[1] then .digits += [$digit]
            else
             .numbers += [.digits] | .digits = [$digit]
            end
        )
        | .numbers += [.digits]
        | .numbers
    ]
    | flatten(1)
);