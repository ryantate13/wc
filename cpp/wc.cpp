#include <iostream>
using namespace std;

bool isspace(char c){
	return c == ' '
		|| c == '\n'
		|| c == '\t'
		|| c == '\v'
		|| c == '\f'
		|| c == '\r';
}

int main(){
	int word_count = 0;
	char c;
	bool in_space = true;

	while (cin.get(c)){
		if(isspace(c))
			in_space = true;
		else {
			if(in_space)
				++word_count;
			in_space = false;
		}
	}

	cout << word_count << endl;
}