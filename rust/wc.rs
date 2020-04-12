use std::io;
use std::io::BufRead;

fn isspace(c: char) -> bool {
	return c == ' '
		|| c == '\t'
		|| c == '\x0B'
		|| c == '\x0C'
		|| c == '\r';
}

fn main(){
	let mut word_count: u32 = 0;
	for line in io::stdin().lock().lines() {
		let mut in_space: bool = true;
		for c in line.unwrap().chars() {
			if isspace(c) {
				in_space = true;
			}
			else {
				if in_space {
					word_count += 1;
				}
				in_space = false;
			}
		}
	}
	println!("{:?}", word_count);
}