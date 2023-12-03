include "assert";
include "day_03";

def test_input: (
    "467..114..",
    "...*......",
    "..35..633.",
    "......#...",
    "617*......",
    ".....+.58.",
    "..592.....",
    "......755.",
    "...$.*....",
    ".664.598.."
);

def should_transform_input_to_grid: (
    [ test_input | parse ] | assert("Should make a grid of numbers"; . == [
        [4,6,7,null,null,1,1,4,null,null],
        [null,null,null,-1,null,null,null,null,null,null],
        [null,null,3,5,null,null,6,3,3,null],
        [null,null,null,null,null,null,-1,null,null,null],
        [6,1,7,-1,null,null,null,null,null,null],
        [null,null,null,null,null,-1,null,5,8,null],
        [null,null,5,9,2,null,null,null,null,null],
        [null,null,null,null,null,null,7,5,5,null],
        [null,null,null,-1,null,-1,null,null,null,null],
        [null,6,6,4,null,5,9,8,null,null]
    ])
);

def should_extract_coordinates_of_symbols:
    [ [ test_input | parse ] | symbols ] | assert("Should get coordinates of symbols"; . == [
        [1,3],[3,6],[4,3],[5,5],[8,3],[8,5]
    ]);