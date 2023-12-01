def calibration:
    ./"" | map(try tonumber catch null) | del(..|nulls) | first*10 + last;

def replace_words_with_numbers: (
    ./"" | reduce .[] as $char (""; (. + $char) |
        sub("one"; "1") | sub("two"; "2") | sub("three"; "3") | sub("four"; "4") | sub("five"; "5") |
        sub("six"; "6") | sub("seven"; "7") | sub("eight"; "8") | sub("nine"; "9")
    )
);

def part1:
    [ inputs | calibration ] | add;

def part2:
    [ inputs | replace_words_with_numbers | calibration ] | add;