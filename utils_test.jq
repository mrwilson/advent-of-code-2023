include "assert";
include "utils";

def should_compute_gcd: (
    [ [2, 6], [1071, 462] ] | map(gcd(first; last)) | assert("Should compute gcd"; . == [2, 21])
);