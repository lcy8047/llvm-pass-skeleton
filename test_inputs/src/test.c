#include <stdio.h>

int add( int a, int b )
{
    return a + b;
}

int main ( void )
{
    int n1 = 2;
    int n2 = 3;

    printf( "%d", add( n1, n2 ) );

    return 0;
}