def assert($description; $assertion):
    if $assertion then . else error("\($description)") end;