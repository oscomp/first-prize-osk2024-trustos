#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"
#include "string.h"
/*
 * 成功测试时的输出：
 * "  Write to pipe successfully."
 */
static int fd[2];

void test_pipe(void){
    TEST_START(__func__);
    int cpid;
    char buf[128] = {'A','B'};
    int ret = pipe(fd);
    int wfd=open("wzytest.sh",O_RDONLY);
    fcntl(wfd,2,1);
    int newfd=fcntl(wfd,1030,10);
    fcntl(newfd,2,1);
    close(wfd);
    assert(ret != -1);
    if(fork()==0){
        close(newfd);
        close(fd[1]);
        read(fd[0],buf,128);
        printf("read from pipe :%s\n",buf);
        close(fd[0]);
        exit(0);
    }
    if(fork()==0){
        close(newfd);
        close(fd[0]);
        dup2(fd[1],1);
        close(fd[1]);
        char* argv[]={"busybox","echo","114514",NULL};
        char* env[]={NULL};
        write(fd[1],buf,128);
        execve("busybox",argv,env);
    }
    close(fd[0]);
    close(fd[1]);
    wait(NULL);
    wait(NULL);
    TEST_END(__func__);
}

int main(void){
    test_pipe();
    return 0;
}
