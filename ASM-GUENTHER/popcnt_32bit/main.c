#include <stdio.h>
#include <stdlib.h>

extern long popcnt(unsigned int a);

int main(int argc, const char *argv []){
 (void)argc;
 (void)argv;
  long a=1024;
  printf("%ld \n", popcnt(a));
 exit(EXIT_SUCCESS);
}
