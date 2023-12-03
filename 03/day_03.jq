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

def neighbours($x; $y):
    [
        [$x-1, $y-1], [$x-1, $y], [$x-1, $y+1],
        [$x,   $y-1], [$x,   $y], [$x,   $y+1],
        [$x+1, $y-1], [$x+1, $y], [$x+1, $y+1]
    ];

def is_adjacent_to($symbols):
    map(neighbours(.[0]; .[1])) | flatten(1) | unique | ($symbols - .) != $symbols;

def reverse_value_lookup($grid):
    [.[] as $coordinate | $grid | getpath($coordinate) ] | 100*(.[-3]//0) + 10*(.[-2]//0) + .[-1];

def values_for_part_numbers: (
    . as $grid
    | [(. | symbols)] as $symbols
    | part_numbers
    | map(select(is_adjacent_to($symbols)))
    | [ .[] | reverse_value_lookup($grid)]
    | add
);