#include <stdio.h>
// main function
int main() {
    int a[4] = {1,5,89,5};
    int b[4] = {90,1,1,2};
    int c[4] = {0};

    scanf("%d",&(a[1]));
    scanf("%d",&(b[1]));

    for(int i=0;i<4;i++)
    {
    	c[i] = a[i] * b[i];
    }

    printf("%d",c[1]);
}
