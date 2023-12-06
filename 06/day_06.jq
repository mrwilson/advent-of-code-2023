def parse: (
    map(split(": +"; null) | last | split(" +"; null) | map(tonumber)) | transpose
);