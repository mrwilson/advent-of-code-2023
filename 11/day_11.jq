def parse: (
    map(./"" | map(if . == "." then 0 else 1 end))
);

def double_empty_space: (
    reduce .[] as $row ([]; if ($row | all(. == 0)) then . + [$row] + [$row] else . + [$row] end)
);