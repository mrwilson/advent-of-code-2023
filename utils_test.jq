include "assert";
include "utils";

def should_filter_list: (
    [1,2,3,4,5]
    | assert("Filter is equivalent to Map+Select"; filter(. % 2 == 0) == map(select(. % 2 == 0)))
);

def should_compute_gcd: (
    [[2, 6], [1071, 462]] | map(gcd(first; last)) | assert("Should compute gcd"; . == [2, 21])
);