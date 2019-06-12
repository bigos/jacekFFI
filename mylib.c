#include <stdio.h>

int myMult(int x, int y, int (* cba)()) {
    int res = x * y;
    printf("%d\n", res);

    printf("callbacked %d\n", (cba)(3));

    return (res * 2);
}
