include "assert";
include "day_08";

def test_input: (
    "RL",
    "",
    "AAA = (BBB, CCC)",
    "BBB = (DDD, EEE)",
    "CCC = (ZZZ, GGG)",
    "DDD = (DDD, DDD)",
    "EEE = (EEE, EEE)",
    "GGG = (GGG, GGG)",
    "ZZZ = (ZZZ, ZZZ)"
);


def should_parse_instructions_from_input: (
    [ test_input ] | parse | assert("Should parse instructions out of input"; .instructions == [1,0])
);