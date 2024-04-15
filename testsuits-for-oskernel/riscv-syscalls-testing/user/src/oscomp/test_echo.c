#include "stdio.h"

/*
 * for execve
 */

int main(int argc, char *argv[]){
    printf("argc is %d\n",argc);
    for(int i=0;i<argc;i++){
        printf("argv %d : %s \n",i,argv[i]);
    }
    printf("  I am test_echo.\nexecve success.\n");
    TEST_END(__func__);
    return 0;
}
