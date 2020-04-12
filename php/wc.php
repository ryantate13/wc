<?php

function isspace($c){
	return $c === ' '
		|| $c === "\n"
		|| $c === "\t"
		|| $c === "\v"
		|| $c === "\f"
		|| $c === "\r";
}

$word_count = 0;
$in_space = true;

while (($c = fgetc(STDIN)) !== false) {
    if(isspace($c))
		$in_space = true;
	else {
		if($in_space)
			++$word_count;
		$in_space = false;
	}
}

echo "$word_count\n";