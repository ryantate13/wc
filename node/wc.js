const isspace = c => (
	c === ' '  ||
	c === '\n' ||
	c === '\t' ||
	c === '\v' ||
	c === '\f' ||
	c === '\r'
);

let word_count = 0;
let in_space = true;

process.stdin.resume();

process.stdin.on('data', chars => {
	for (const c of chars.toString())
		if(isspace(c))
			in_space = true;
		else {
			if(in_space)
				++word_count;
			in_space = false;
		}
});

process.stdin.on('end', () => {
	console.log(word_count);
});