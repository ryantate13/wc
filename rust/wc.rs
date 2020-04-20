use std::io;
use std::io::Read;

fn isspace(c: char) -> bool {
    return c == ' ' || c == '\n' || c == '\t' || c == '\x0B' || c == '\x0C' || c == '\r';
}

fn main() {
    let mut word_count: u32 = 0;
    let mut in_space: bool = true;
    for c in io::stdin().lock().bytes() {
        if isspace(c.unwrap().into()) {
            in_space = true;
        } else {
            if in_space {
                word_count += 1;
            }
            in_space = false;
        }
    }
    println!("{:?}", word_count);
}
