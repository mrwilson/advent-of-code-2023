# advent-of-code-2023

![Run all tests](https://github.com/mrwilson/advent-of-code-2023/actions/workflows/test.yaml/badge.svg)

My second attempt at AoC using jq.

## How does this all work?

Each day's puzzles live under the corresponding numeric directory `NN/`

Each directory will have:
- `day_NN.jq` (the solution)
- `day_NN_test.jq` (the tests)
- input.txt (puzzle input from the AoC site)

Tests are executed using [jqunit](https://github.com/mrwilson/jqunit) with matchers provided in `assert.jq`
