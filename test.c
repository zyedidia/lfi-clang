#include <stdio.h>
#include <stdlib.h>
int main() {
    int* p = malloc(1024);
    printf("Hello world: %p\n", p);
    return 0;
}
