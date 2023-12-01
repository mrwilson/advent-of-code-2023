def calibration:
    ./"" | map(try tonumber catch null) | del(..|nulls) | first*10 + last;

def part1:
    [ inputs | calibration ] | add;