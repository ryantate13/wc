package main

import (
    "bufio"
    "fmt"
    "io"
    "os"
)

func isspace(c rune) bool {
	return c == ' ' || c == '\n' || c == '\t' || c == '\v' || c == '\f' || c == '\r'
}

func main() {
    word_count := 0
    in_space := true

    r := bufio.NewReader(os.Stdin)

    for {
		c, _, err := r.ReadRune()
		if err == io.EOF {
			break
		}
		if isspace(c) {
			in_space = true;
		} else {
			if in_space {
				word_count = word_count + 1;
			}
			in_space = false;
		}
	}


    fmt.Println(word_count)
}