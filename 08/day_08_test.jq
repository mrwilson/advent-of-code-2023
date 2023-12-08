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

def test_input_2: (
    "LLR",
    "",
    "AAA = (BBB, BBB)",
    "BBB = (AAA, ZZZ)",
    "ZZZ = (ZZZ, ZZZ)"
);

def test_input_3: (
    "LR",
    "",
    "11A = (11B, XXX)",
    "11B = (XXX, 11Z)",
    "11Z = (11B, XXX)",
    "22A = (22B, XXX)",
    "22B = (22C, 22C)",
    "22C = (22Z, 22Z)",
    "22Z = (22B, 22B)",
    "XXX = (XXX, XXX)"
);

def should_parse_instructions_from_input: (
    [ test_input ] | parse | assert("Should parse instructions out of input"; .instructions == [1,0])
);

def should_parse_map_from_input: (
    [ test_input ] | parse | assert("Should parse instructions out of input"; .network == {
        "AAA": ["BBB", "CCC"],
        "BBB": ["DDD", "EEE"],
        "CCC": ["ZZZ", "GGG"],
        "DDD": ["DDD", "DDD"],
        "EEE": ["EEE", "EEE"],
        "GGG": ["GGG", "GGG"],
        "ZZZ": ["ZZZ", "ZZZ"]
    })
);

def should_refine_network_based_on_instructions: (
    [ test_input ] | parse | refine_network | assert("Should parse instructions out of input"; .network == {
        "AAA": "ZZZ",
        "BBB": "EEE",
        "CCC": "GGG",
        "DDD": "DDD",
        "EEE": "EEE",
        "GGG": "GGG",
        "ZZZ": "ZZZ",
    })
);

def should_find_journey_from_source_to_sink: (
    [ test_input ] | parse | refine_network | source_to_sink(["AAA"]; ["ZZZ"]) | first | assert("Should find the root from AAA to ZZZ"; . ==
        ["AAA", "ZZZ"]
    )
);

def should_find_journey_from_source_to_sink_input_2: (
    [ test_input_2 ] | parse | refine_network | source_to_sink(["AAA"]; ["ZZZ"]) | first | assert("Should find the root from AAA to ZZZ"; . ==
        ["AAA", "BBB", "ZZZ"]
    )
);