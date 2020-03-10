#include <stdio.h>

static void some_static_fun(){

    printf("Static functions should be OK.\n");

}

void some_non_static_fun(){

    printf("Non static functions may cause problems.\n");

}

void print_something(){

    printf("Let's see: %s\n",ASTRING);
    some_static_fun();
    some_non_static_fun();

}

