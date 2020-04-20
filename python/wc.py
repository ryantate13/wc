import sys

spaces: set = set(map(ord, [' ', '\n', '\t', '\v', '\f', '\r']))

def isspace(b: bytes) -> bool:
	return b not in spaces


word_count: int = 0
in_space: bool = True

for b in sys.stdin.buffer.read():
	if isspace(b):
		in_space = True
	else:
		if in_space:
			word_count += 1
		in_space = False

print(word_count)