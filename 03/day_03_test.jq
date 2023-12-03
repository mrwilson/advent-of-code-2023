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
        [null,null,null,-2,null,null,null,null,null,null],
        [null,null,3,5,null,null,6,3,3,null],
        [null,null,null,null,null,null,-1,null,null,null],
        [6,1,7,-2,null,null,null,null,null,null],
        [null,null,null,null,null,-1,null,5,8,null],
        [null,null,5,9,2,null,null,null,null,null],
        [null,null,null,null,null,null,7,5,5,null],
        [null,null,null,-1,null,-2,null,null,null,null],
        [null,6,6,4,null,5,9,8,null,null]
    ])
);

def should_extract_coordinates_of_symbols:
    [ [ test_input | parse ] | symbols ] | assert("Should get coordinates of symbols"; . == [
        [1,3],[3,6],[4,3],[5,5],[8,3],[8,5]
    ]);

def should_extract_list_of_digits_for_part_numbers:
    [ test_input | parse ] | part_numbers | assert("Should get coordinates of symbols"; . == [
        [[0,0],[0,1],[0,2]],
        [[0,5],[0,6],[0,7]],
        [[2,2],[2,3]],
        [[2,6],[2,7],[2,8]],
        [[4,0],[4,1],[4,2]],
        [[5,7],[5,8]],
        [[6,2],[6,3],[6,4]],
        [[7,6],[7,7],[7,8]],
        [[9,1],[9,2],[9,3]],
        [[9,5],[9,6],[9,7]]
    ]
);

def should_test_for_adjacency_to_symbol: (
    [[2,6],[2,7],[2,8]] | is_adjacent_to([[3,6],[5,5]]) | assert("Should be adjacent"; . == true)
);

def should_test_for_lack_of_adjacency_to_symbol: (
    [[5,7],[5,8]] | is_adjacent_to([[3,6],[5,5]]) | assert("Should be adjacent"; . == false)
);

def should_reverse_value_lookup: (
    [ test_input | parse ] as $grid
        | [[0,0],[0,1],[0,2]]
        | reverse_value_lookup($grid)
        | assert("Should retrieve original value"; . == 467)
);

def should_make_a_leap: (
    [ test_input | parse ] | values_for_part_numbers | assert("Should sum up part value numbers"; . == 4361)
);

def should_extract_coordinates_of_gears:
    [ [ test_input | parse ] | gears ] | assert("Should get coordinates of gears"; . == [
        [1,3],[4,3],[8,5]
    ]);

def should_find_parts_nearby_gears:
   [ test_input | parse ] | parts_nearby_gears | map(.gear) | assert("Should get coordinates of gears"; . == [
       [1,3],[8,5]
   ]);

