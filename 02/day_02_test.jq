include "assert";
include "day_02";

def test_input: (
    "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green",
    "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue",
    "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red",
    "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red",
    "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"
);

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

def should_exclude_games_with_too_many_cubes: (
    [ test_input | parse | enforce_cube_limit | .game ] | assert("Should only allow legal games"; . == [1,2,5])
);

def should_calculate_game_power: (
    "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
        | parse
        | game_power
        | assert("Should calculate game power as minimum of cubes"; . == { "green": 2, "blue": 6, "red": 4 })
);