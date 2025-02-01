#include <stdio.h>

int main() {
    int a = 2;
    unsigned char * binary = (unsigned char*)&a;
    if (binary[0] == 2) {
        printf("Little Endian\n");
    } else {
        printf("Big Endian\n");
    }
    printf("%d \n", a);
    return 0;
}