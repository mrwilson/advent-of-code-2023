def filter(f):
    map(select(f));

def gcd($a; $b): [$a, $b] | until(last == 0; [last, first % last]) | first;