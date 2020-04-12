import sys

def isspace(c: str) -> bool:
    return c == ' ' or c == '\t' or c == '\v' or c == '\f' or c == '\r'


word_count: int = 0

for line in sys.stdin:
	in_space: bool = True
	for c in line:
		if isspace(c):
			in_space = True
		else:
			if in_space:
				word_count += 1
			in_space = False

print(word_count)