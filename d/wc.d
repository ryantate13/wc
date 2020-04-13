import std.stdio;

bool isspace(char c){
	return c == ' '
		|| c == '\n'
		|| c == '\t'
		|| c == '\v'
		|| c == '\f'
		|| c == '\r';
}

void main() {
	int word_count = 0;
	bool in_space = true;
    foreach (ubyte[] ch; stdin.byChunk(1))
    {
        if(isspace(ch[0]))
			in_space = true;
		else {
			if(in_space)
				++word_count;
			in_space = false;
		}
    }
    writeln(word_count);
}