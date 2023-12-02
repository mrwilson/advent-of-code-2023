include "assert";
include "day_02";

def has_entry($key; $value): .[$key] == $value;

def should_parse_input_with_game_number: (
    "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
        | parse
        | assert("Should parse game to object"; has_entry("game"; 1))
);

def should_parse_input_with_reveals: (
    "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
        | parse
        | assert("Should parse game to object, \(.)"; has_entry("reveals"; [
            { "blue": 3, "red": 4 },
            { "red": 1, "green": 2, "blue": 6 },
            { "green": 2 }
        ]))
);
