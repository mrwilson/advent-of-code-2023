def assert($description; $assertion):
    if $assertion then . else error("\($description), , was \(.)") end;