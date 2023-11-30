include "day_00";
include "test";

def should_double_inputs:
    2 | double | assert("2 * 2 = 4"; . == 4);

def should_triple_inputs:
    2 | triple | assert("2 * 3 = 6"; . == 6);