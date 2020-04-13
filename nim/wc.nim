proc isspace(c: char): bool = c == ' ' or c == '\n' or c == '\t' or c == '\v' or c == '\f' or c == '\r'

var word_count = 0

for line in stdin.lines:
    var in_space = true
    for c in line:
        if isspace(c):
            in_space = true
        else:
            if in_space:
                word_count += 1
            in_space = false

echo word_count