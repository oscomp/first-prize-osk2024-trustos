#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"

struct iovec {
    uintptr_t iov_base; /* Starting address */
    size_t iov_len; /* Length in bytes */
} iov[10];
char buf[10][100];
void test_rdwrv() {
	TEST_START(__func__);
	int fd = open("./vtest.txt", O_RDONLY);
    iov[0].iov_base=buf[0];
    iov[0].iov_len=7;
    iov[1].iov_base=buf[1];
    iov[1].iov_len=8;
    iov[2].iov_base=buf[2];
    iov[2].iov_len=13;
    iov[3].iov_base=buf[3];
    iov[3].iov_len=13;
    iov[4].iov_base=buf[4];
    iov[4].iov_len=14;
	int size = readv(fd, iov, 5);
	close(fd);
	assert(size >= 0);
    for(int i=0;i<5;i++){
        write(STDOUT,buf[i],iov[i].iov_len);
    }
    printf("\nreadv finished!\n");
    writev(STDOUT,iov,5);
    printf("\nwritev for stdout finished\n");
    int fd2=open("./writev.txt",O_WRONLY|O_CREATE);
    writev(fd2,iov,5);
    close(fd2);
    int fd3=open("./writev.txt",O_RDONLY);
    char buf[114];
    read(fd3,buf,114);
    printf("%s",buf);
    printf("\nwritev for file finished!\n");
    close(fd3);
	TEST_END(__func__);
}

int main(void) {
	test_rdwrv();
	return 0;
}
