#include <stdio.h>
#include <ctype.h>
#include <stdbool.h>

int main(){
  int word_count = 0;
  char c;
  bool in_space = true;

  while((c = getchar()) != EOF){
    if(isspace(c))
      in_space = true;
    else {
      if(in_space)
        ++word_count;
      in_space = false;
    }
  }

  printf("%d\n", word_count);
}
