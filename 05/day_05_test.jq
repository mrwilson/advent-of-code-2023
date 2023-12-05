include "assert";
include "day_05";

def test_input: (
	"seeds: 79 14 55 13",
	"",
	"seed-to-soil map:",
	"50 98 2",
	"52 50 48",
	"",
	"soil-to-fertilizer map:",
	"0 15 37",
	"37 52 2",
	"39 0 15",
	"",
	"fertilizer-to-water map:",
	"49 53 8",
	"0 11 42",
	"42 0 7",
	"57 7 4",
	"",
	"water-to-light map:",
	"88 18 7",
	"18 25 70",
	"",
	"light-to-temperature map:",
	"45 77 23",
	"81 45 19",
	"68 64 13",
	"",
	"temperature-to-humidity map:",
	"0 69 1",
	"1 0 69",
	"",
	"humidity-to-location map:",
	"60 56 37",
    "56 93 4"
);

def should_parse_seeds_from_input: (
    [ test_input ]
        | parse
        | assert("Should extract seeds"; .seeds == [79,14,55,13])
);

def should_parse_maps_from_input: (
    [ test_input ]
        | parse
        | assert("Should extract maps"; .maps == {
            "soil":[
                {"dst":50,"src":98,"len":2},{"dst":52,"src":50,"len":48}
            ],
            "fertilizer":[
                {"dst":0,"src":15,"len":37},{"dst":37,"src":52,"len":2},{"dst":39,"src":0,"len":15}
            ],
            "water":[
                {"dst":49,"src":53,"len":8},{"dst":0,"src":11,"len":42},{"dst":42,"src":0,"len":7},{"dst":57,"src":7,"len":4}
            ],
            "light":[
                {"dst":88,"src":18,"len":7},{"dst":18,"src":25,"len":70}
            ],
            "temperature":[
                {"dst":45,"src":77,"len":23},{"dst":81,"src":45,"len":19},{"dst":68,"src":64,"len":13}
            ],
            "humidity":[
                {"dst":0,"src":69,"len":1},{"dst":1,"src":0,"len":69}
            ],
            "location":[
                {"dst":60,"src":56,"len":37},{"dst":56,"src":93,"len":4}
            ]
        })
);

def should_take_next_step: (
    [test_input] | parse | next(.seeds[0]; .maps.soil) | assert("Should take next step"; . == 81)
);

def should_take_next_step_for_all_seeds: (
    [test_input] | parse | .maps as $maps
        | .seeds | map(next(.; $maps.soil)) | assert("Should take next step for all seeds"; . == [81,14,57,13])
);

def should_find_locations: (
    [test_input] | parse | find_locations | assert("Should take next step for all seeds"; . == [82,43,86,35])
);