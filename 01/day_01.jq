def calibration:
    ./"" | map(try tonumber catch null) | del(..|nulls) | first*10 + last;

def replace_words_with_numbers: (
    gsub("one"; "o1e") | gsub("two"; "t2o") | gsub("three"; "t3e") |
    gsub("four"; "f4r") | gsub("five"; "f5e") |  gsub("six"; "s6x") |
    gsub("seven"; "s7n") | gsub("eight"; "e8t") | gsub("nine"; "n9e")
);

def part1:
    [ inputs | calibration ] | add;

def part2:
    [ inputs | replace_words_with_numbers | calibration ] | add;