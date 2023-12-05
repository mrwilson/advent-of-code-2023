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
        | assert("Should extract seeds"; .seeds == [
            { src: 79, len: 1 },
            { src: 14, len: 1 },
            { src: 55, len: 1 },
            { src: 13, len: 1 }
        ])

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
    [test_input] | parse | next(.seeds[0]; .maps.soil) | assert("Should take next step"; . == { src: 81, len: 1 })
);

def should_take_next_step_for_all_seeds: (
    [test_input] | parse | .maps as $maps
        | .seeds | map(next(.; $maps.soil)) | assert("Should take next step for all seeds"; . == [
            {"src":81,"len":1},
            {"src":14,"len":1},
            {"src":57,"len":1},
            {"src":13,"len":1}
        ])
);

def should_find_locations: (
    [test_input] | parse | find_locations | assert("Should take next step for all seeds"; . == [82,43,86,35])
);

def should_merge_ranges_internal: (
    { "src": 5, len: 2 } | merge({ "src": 5, "dst": 100, len: 5}) | assert("Should merge ranges based on map";
        . == [{"src": 100, "len": 2 }]
    )
);

def should_merge_ranges_lower_overlap: (
    { "src": -10, len: 20 } | merge({ "src": 0, "dst": 100, len: 20}) | assert("Should merge ranges based on map";
        . == [{"src": -10, "len": 10 }, {"src": 100, "len": 10 }]
    )
);

def should_merge_ranges_upper_overlap: (
    { "src": 5, len: 10 } | merge({ "src": 0, "dst": 100, len: 10}) | assert("Should merge ranges based on map";
        . == [{"src": 105, "len": 5 }, {"src": 10, "len": 5 }]
    )
);

def should_merge_ranges_map_inside_range: (
    { "src": 0, len: 20 } | merge({ "src": 5, "dst": 100, len: 10}) | assert("Should merge ranges based on map";
        . == [{"src": 0, "len": 5 }, {"src": 100, "len": 10 }, {"src":15, "len":5 }]
    )
);