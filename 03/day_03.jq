def parse: (
    ./"" | map(. as $original | try tonumber catch (if $original == "." then null else -1 end))
);