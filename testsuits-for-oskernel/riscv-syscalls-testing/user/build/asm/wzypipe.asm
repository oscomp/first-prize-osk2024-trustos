
/home/brightnight/OScompetition/6.13晚final_main/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/wzypipe：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a255                	j	11a6 <__start_main>

0000000000001004 <test_pipe>:
 * 成功测试时的输出：
 * "  Write to pipe successfully."
 */
static int fd[2];

void test_pipe(void){
    1004:	7155                	addi	sp,sp,-208
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	fea50513          	addi	a0,a0,-22 # 1ff0 <__clone+0x2c>
void test_pipe(void){
    100e:	e586                	sd	ra,200(sp)
    1010:	e1a2                	sd	s0,192(sp)
    1012:	fd26                	sd	s1,184(sp)
    1014:	f94a                	sd	s2,176(sp)
    TEST_START(__func__);
    1016:	402000ef          	jal	ra,1418 <puts>
    101a:	00001517          	auipc	a0,0x1
    101e:	09650513          	addi	a0,a0,150 # 20b0 <__func__.0>
    1022:	3f6000ef          	jal	ra,1418 <puts>
    1026:	00001517          	auipc	a0,0x1
    102a:	fe250513          	addi	a0,a0,-30 # 2008 <__clone+0x44>
    102e:	3ea000ef          	jal	ra,1418 <puts>
    int cpid;
    char buf[128] = {'A','B'};
    1032:	6791                	lui	a5,0x4
    1034:	24178793          	addi	a5,a5,577 # 4241 <digits+0x2161>
    int ret = pipe(fd);
    1038:	00001517          	auipc	a0,0x1
    103c:	07050513          	addi	a0,a0,112 # 20a8 <fd>
    char buf[128] = {'A','B'};
    1040:	f83e                	sd	a5,48(sp)
    1042:	fc02                	sd	zero,56(sp)
    1044:	e082                	sd	zero,64(sp)
    1046:	e482                	sd	zero,72(sp)
    1048:	e882                	sd	zero,80(sp)
    104a:	ec82                	sd	zero,88(sp)
    104c:	f082                	sd	zero,96(sp)
    104e:	f482                	sd	zero,104(sp)
    1050:	f882                	sd	zero,112(sp)
    1052:	fc82                	sd	zero,120(sp)
    1054:	e102                	sd	zero,128(sp)
    1056:	e502                	sd	zero,136(sp)
    1058:	e902                	sd	zero,144(sp)
    105a:	ed02                	sd	zero,152(sp)
    105c:	f102                	sd	zero,160(sp)
    105e:	f502                	sd	zero,168(sp)
    int ret = pipe(fd);
    1060:	727000ef          	jal	ra,1f86 <pipe>
    int wfd=open("wzytest.sh",O_RDONLY);
    1064:	4581                	li	a1,0
    int ret = pipe(fd);
    1066:	84aa                	mv	s1,a0
    int wfd=open("wzytest.sh",O_RDONLY);
    1068:	00001517          	auipc	a0,0x1
    106c:	fb050513          	addi	a0,a0,-80 # 2018 <__clone+0x54>
    1070:	4d5000ef          	jal	ra,1d44 <open>
    fcntl(wfd,2,1);
    1074:	4605                	li	a2,1
    1076:	4589                	li	a1,2
    int wfd=open("wzytest.sh",O_RDONLY);
    1078:	842a                	mv	s0,a0
    fcntl(wfd,2,1);
    107a:	4f3000ef          	jal	ra,1d6c <fcntl>
    int newfd=fcntl(wfd,1030,10);
    107e:	4629                	li	a2,10
    1080:	40600593          	li	a1,1030
    1084:	8522                	mv	a0,s0
    1086:	4e7000ef          	jal	ra,1d6c <fcntl>
    fcntl(newfd,2,1);
    108a:	4605                	li	a2,1
    108c:	4589                	li	a1,2
    int newfd=fcntl(wfd,1030,10);
    108e:	892a                	mv	s2,a0
    fcntl(newfd,2,1);
    1090:	4dd000ef          	jal	ra,1d6c <fcntl>
    close(wfd);
    1094:	8522                	mv	a0,s0
    1096:	4e1000ef          	jal	ra,1d76 <close>
    assert(ret != -1);
    109a:	57fd                	li	a5,-1
    109c:	0ef48663          	beq	s1,a5,1188 <test_pipe+0x184>
    if(fork()==0){
    10a0:	51b000ef          	jal	ra,1dba <fork>
    10a4:	00001417          	auipc	s0,0x1
    10a8:	00440413          	addi	s0,s0,4 # 20a8 <fd>
    10ac:	c921                	beqz	a0,10fc <test_pipe+0xf8>
        read(fd[0],buf,128);
        printf("read from pipe :%s\n",buf);
        close(fd[0]);
        exit(0);
    }
    if(fork()==0){
    10ae:	50d000ef          	jal	ra,1dba <fork>
    10b2:	c149                	beqz	a0,1134 <test_pipe+0x130>
        char* argv[]={"busybox","echo","114514",NULL};
        char* env[]={NULL};
        write(fd[1],buf,128);
        execve("busybox",argv,env);
    }
    close(fd[0]);
    10b4:	4008                	lw	a0,0(s0)
    10b6:	4c1000ef          	jal	ra,1d76 <close>
    close(fd[1]);
    10ba:	4048                	lw	a0,4(s0)
    10bc:	4bb000ef          	jal	ra,1d76 <close>
    wait(NULL);
    10c0:	4501                	li	a0,0
    10c2:	5df000ef          	jal	ra,1ea0 <wait>
    wait(NULL);
    10c6:	4501                	li	a0,0
    10c8:	5d9000ef          	jal	ra,1ea0 <wait>
    TEST_END(__func__);
    10cc:	00001517          	auipc	a0,0x1
    10d0:	f9c50513          	addi	a0,a0,-100 # 2068 <__clone+0xa4>
    10d4:	344000ef          	jal	ra,1418 <puts>
    10d8:	00001517          	auipc	a0,0x1
    10dc:	fd850513          	addi	a0,a0,-40 # 20b0 <__func__.0>
    10e0:	338000ef          	jal	ra,1418 <puts>
    10e4:	00001517          	auipc	a0,0x1
    10e8:	f2450513          	addi	a0,a0,-220 # 2008 <__clone+0x44>
    10ec:	32c000ef          	jal	ra,1418 <puts>
}
    10f0:	60ae                	ld	ra,200(sp)
    10f2:	640e                	ld	s0,192(sp)
    10f4:	74ea                	ld	s1,184(sp)
    10f6:	794a                	ld	s2,176(sp)
    10f8:	6169                	addi	sp,sp,208
    10fa:	8082                	ret
        close(newfd);
    10fc:	854a                	mv	a0,s2
    10fe:	479000ef          	jal	ra,1d76 <close>
        close(fd[1]);
    1102:	4048                	lw	a0,4(s0)
    1104:	473000ef          	jal	ra,1d76 <close>
        read(fd[0],buf,128);
    1108:	4008                	lw	a0,0(s0)
    110a:	08000613          	li	a2,128
    110e:	180c                	addi	a1,sp,48
    1110:	473000ef          	jal	ra,1d82 <read>
        printf("read from pipe :%s\n",buf);
    1114:	180c                	addi	a1,sp,48
    1116:	00001517          	auipc	a0,0x1
    111a:	f3250513          	addi	a0,a0,-206 # 2048 <__clone+0x84>
    111e:	31c000ef          	jal	ra,143a <printf>
        close(fd[0]);
    1122:	4008                	lw	a0,0(s0)
    1124:	453000ef          	jal	ra,1d76 <close>
        exit(0);
    1128:	4501                	li	a0,0
    112a:	4b3000ef          	jal	ra,1ddc <exit>
    if(fork()==0){
    112e:	48d000ef          	jal	ra,1dba <fork>
    1132:	f149                	bnez	a0,10b4 <test_pipe+0xb0>
        close(newfd);
    1134:	854a                	mv	a0,s2
    1136:	441000ef          	jal	ra,1d76 <close>
        close(fd[0]);
    113a:	4008                	lw	a0,0(s0)
    113c:	43b000ef          	jal	ra,1d76 <close>
        dup2(fd[1],1);
    1140:	4048                	lw	a0,4(s0)
    1142:	4585                	li	a1,1
    1144:	65b000ef          	jal	ra,1f9e <dup2>
        close(fd[1]);
    1148:	4048                	lw	a0,4(s0)
    114a:	42d000ef          	jal	ra,1d76 <close>
        char* argv[]={"busybox","echo","114514",NULL};
    114e:	00001797          	auipc	a5,0x1
    1152:	f6278793          	addi	a5,a5,-158 # 20b0 <__func__.0>
    1156:	0107b803          	ld	a6,16(a5)
    115a:	6f94                	ld	a3,24(a5)
    115c:	7398                	ld	a4,32(a5)
        write(fd[1],buf,128);
    115e:	4048                	lw	a0,4(s0)
        char* argv[]={"busybox","echo","114514",NULL};
    1160:	779c                	ld	a5,40(a5)
        write(fd[1],buf,128);
    1162:	180c                	addi	a1,sp,48
    1164:	08000613          	li	a2,128
        char* argv[]={"busybox","echo","114514",NULL};
    1168:	e842                	sd	a6,16(sp)
    116a:	ec36                	sd	a3,24(sp)
    116c:	f03a                	sd	a4,32(sp)
    116e:	f43e                	sd	a5,40(sp)
        char* env[]={NULL};
    1170:	e402                	sd	zero,8(sp)
        write(fd[1],buf,128);
    1172:	41b000ef          	jal	ra,1d8c <write>
        execve("busybox",argv,env);
    1176:	0030                	addi	a2,sp,8
    1178:	080c                	addi	a1,sp,16
    117a:	00001517          	auipc	a0,0x1
    117e:	ee650513          	addi	a0,a0,-282 # 2060 <__clone+0x9c>
    1182:	47f000ef          	jal	ra,1e00 <execve>
    1186:	b73d                	j	10b4 <test_pipe+0xb0>
    assert(ret != -1);
    1188:	00001517          	auipc	a0,0x1
    118c:	ea050513          	addi	a0,a0,-352 # 2028 <__clone+0x64>
    1190:	52e000ef          	jal	ra,16be <panic>
    1194:	b731                	j	10a0 <test_pipe+0x9c>

0000000000001196 <main>:

int main(void){
    1196:	1141                	addi	sp,sp,-16
    1198:	e406                	sd	ra,8(sp)
    test_pipe();
    119a:	e6bff0ef          	jal	ra,1004 <test_pipe>
    return 0;
}
    119e:	60a2                	ld	ra,8(sp)
    11a0:	4501                	li	a0,0
    11a2:	0141                	addi	sp,sp,16
    11a4:	8082                	ret

00000000000011a6 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    11a6:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    11a8:	4108                	lw	a0,0(a0)
{
    11aa:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    11ac:	05a1                	addi	a1,a1,8
{
    11ae:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    11b0:	fe7ff0ef          	jal	ra,1196 <main>
    11b4:	429000ef          	jal	ra,1ddc <exit>
	return 0;
}
    11b8:	60a2                	ld	ra,8(sp)
    11ba:	4501                	li	a0,0
    11bc:	0141                	addi	sp,sp,16
    11be:	8082                	ret

00000000000011c0 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    11c0:	7179                	addi	sp,sp,-48
    11c2:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    11c4:	12054b63          	bltz	a0,12fa <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    11c8:	02b577bb          	remuw	a5,a0,a1
    11cc:	00001617          	auipc	a2,0x1
    11d0:	f1460613          	addi	a2,a2,-236 # 20e0 <digits>
    buf[16] = 0;
    11d4:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    11d8:	0005871b          	sext.w	a4,a1
    11dc:	1782                	slli	a5,a5,0x20
    11de:	9381                	srli	a5,a5,0x20
    11e0:	97b2                	add	a5,a5,a2
    11e2:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    11e6:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    11ea:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    11ee:	1cb56363          	bltu	a0,a1,13b4 <printint.constprop.0+0x1f4>
        buf[i--] = digits[x % base];
    11f2:	45b9                	li	a1,14
    11f4:	02e877bb          	remuw	a5,a6,a4
    11f8:	1782                	slli	a5,a5,0x20
    11fa:	9381                	srli	a5,a5,0x20
    11fc:	97b2                	add	a5,a5,a2
    11fe:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1202:	02e856bb          	divuw	a3,a6,a4
        buf[i--] = digits[x % base];
    1206:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    120a:	0ce86e63          	bltu	a6,a4,12e6 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    120e:	02e6f5bb          	remuw	a1,a3,a4
    } while ((x /= base) != 0);
    1212:	02e6d7bb          	divuw	a5,a3,a4
        buf[i--] = digits[x % base];
    1216:	1582                	slli	a1,a1,0x20
    1218:	9181                	srli	a1,a1,0x20
    121a:	95b2                	add	a1,a1,a2
    121c:	0005c583          	lbu	a1,0(a1)
    1220:	00b10aa3          	sb	a1,21(sp)
    } while ((x /= base) != 0);
    1224:	0007859b          	sext.w	a1,a5
    1228:	12e6ec63          	bltu	a3,a4,1360 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    122c:	02e7f6bb          	remuw	a3,a5,a4
    1230:	1682                	slli	a3,a3,0x20
    1232:	9281                	srli	a3,a3,0x20
    1234:	96b2                	add	a3,a3,a2
    1236:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    123a:	02e7d83b          	divuw	a6,a5,a4
        buf[i--] = digits[x % base];
    123e:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1242:	12e5e863          	bltu	a1,a4,1372 <printint.constprop.0+0x1b2>
        buf[i--] = digits[x % base];
    1246:	02e876bb          	remuw	a3,a6,a4
    124a:	1682                	slli	a3,a3,0x20
    124c:	9281                	srli	a3,a3,0x20
    124e:	96b2                	add	a3,a3,a2
    1250:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1254:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1258:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    125c:	12e86463          	bltu	a6,a4,1384 <printint.constprop.0+0x1c4>
        buf[i--] = digits[x % base];
    1260:	02e5f6bb          	remuw	a3,a1,a4
    1264:	1682                	slli	a3,a3,0x20
    1266:	9281                	srli	a3,a3,0x20
    1268:	96b2                	add	a3,a3,a2
    126a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    126e:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1272:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    1276:	0ce5ec63          	bltu	a1,a4,134e <printint.constprop.0+0x18e>
        buf[i--] = digits[x % base];
    127a:	02e876bb          	remuw	a3,a6,a4
    127e:	1682                	slli	a3,a3,0x20
    1280:	9281                	srli	a3,a3,0x20
    1282:	96b2                	add	a3,a3,a2
    1284:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1288:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    128c:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1290:	10e86963          	bltu	a6,a4,13a2 <printint.constprop.0+0x1e2>
        buf[i--] = digits[x % base];
    1294:	02e5f6bb          	remuw	a3,a1,a4
    1298:	1682                	slli	a3,a3,0x20
    129a:	9281                	srli	a3,a3,0x20
    129c:	96b2                	add	a3,a3,a2
    129e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    12a2:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    12a6:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    12aa:	10e5e763          	bltu	a1,a4,13b8 <printint.constprop.0+0x1f8>
        buf[i--] = digits[x % base];
    12ae:	02e876bb          	remuw	a3,a6,a4
    12b2:	1682                	slli	a3,a3,0x20
    12b4:	9281                	srli	a3,a3,0x20
    12b6:	96b2                	add	a3,a3,a2
    12b8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    12bc:	02e857bb          	divuw	a5,a6,a4
        buf[i--] = digits[x % base];
    12c0:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    12c4:	10e86363          	bltu	a6,a4,13ca <printint.constprop.0+0x20a>
        buf[i--] = digits[x % base];
    12c8:	1782                	slli	a5,a5,0x20
    12ca:	9381                	srli	a5,a5,0x20
    12cc:	97b2                	add	a5,a5,a2
    12ce:	0007c783          	lbu	a5,0(a5)
    12d2:	4599                	li	a1,6
    12d4:	00f10723          	sb	a5,14(sp)

    if (sign)
    12d8:	00055763          	bgez	a0,12e6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12dc:	02d00793          	li	a5,45
    12e0:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    12e4:	4595                	li	a1,5
    write(f, s, l);
    12e6:	003c                	addi	a5,sp,8
    12e8:	4641                	li	a2,16
    12ea:	9e0d                	subw	a2,a2,a1
    12ec:	4505                	li	a0,1
    12ee:	95be                	add	a1,a1,a5
    12f0:	29d000ef          	jal	ra,1d8c <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    12f4:	70a2                	ld	ra,40(sp)
    12f6:	6145                	addi	sp,sp,48
    12f8:	8082                	ret
        x = -xx;
    12fa:	40a0083b          	negw	a6,a0
        buf[i--] = digits[x % base];
    12fe:	02b877bb          	remuw	a5,a6,a1
    1302:	00001617          	auipc	a2,0x1
    1306:	dde60613          	addi	a2,a2,-546 # 20e0 <digits>
    buf[16] = 0;
    130a:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    130e:	0005871b          	sext.w	a4,a1
    1312:	1782                	slli	a5,a5,0x20
    1314:	9381                	srli	a5,a5,0x20
    1316:	97b2                	add	a5,a5,a2
    1318:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    131c:	02b858bb          	divuw	a7,a6,a1
        buf[i--] = digits[x % base];
    1320:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1324:	06b86963          	bltu	a6,a1,1396 <printint.constprop.0+0x1d6>
        buf[i--] = digits[x % base];
    1328:	02e8f7bb          	remuw	a5,a7,a4
    132c:	1782                	slli	a5,a5,0x20
    132e:	9381                	srli	a5,a5,0x20
    1330:	97b2                	add	a5,a5,a2
    1332:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1336:	02e8d6bb          	divuw	a3,a7,a4
        buf[i--] = digits[x % base];
    133a:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    133e:	ece8f8e3          	bgeu	a7,a4,120e <printint.constprop.0+0x4e>
        buf[i--] = '-';
    1342:	02d00793          	li	a5,45
    1346:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    134a:	45b5                	li	a1,13
    134c:	bf69                	j	12e6 <printint.constprop.0+0x126>
    134e:	45a9                	li	a1,10
    if (sign)
    1350:	f8055be3          	bgez	a0,12e6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1354:	02d00793          	li	a5,45
    1358:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    135c:	45a5                	li	a1,9
    135e:	b761                	j	12e6 <printint.constprop.0+0x126>
    1360:	45b5                	li	a1,13
    if (sign)
    1362:	f80552e3          	bgez	a0,12e6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1366:	02d00793          	li	a5,45
    136a:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    136e:	45b1                	li	a1,12
    1370:	bf9d                	j	12e6 <printint.constprop.0+0x126>
    1372:	45b1                	li	a1,12
    if (sign)
    1374:	f60559e3          	bgez	a0,12e6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1378:	02d00793          	li	a5,45
    137c:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1380:	45ad                	li	a1,11
    1382:	b795                	j	12e6 <printint.constprop.0+0x126>
    1384:	45ad                	li	a1,11
    if (sign)
    1386:	f60550e3          	bgez	a0,12e6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    138a:	02d00793          	li	a5,45
    138e:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1392:	45a9                	li	a1,10
    1394:	bf89                	j	12e6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1396:	02d00793          	li	a5,45
    139a:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    139e:	45b9                	li	a1,14
    13a0:	b799                	j	12e6 <printint.constprop.0+0x126>
    13a2:	45a5                	li	a1,9
    if (sign)
    13a4:	f40551e3          	bgez	a0,12e6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    13a8:	02d00793          	li	a5,45
    13ac:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    13b0:	45a1                	li	a1,8
    13b2:	bf15                	j	12e6 <printint.constprop.0+0x126>
    i = 15;
    13b4:	45bd                	li	a1,15
    13b6:	bf05                	j	12e6 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    13b8:	45a1                	li	a1,8
    if (sign)
    13ba:	f20556e3          	bgez	a0,12e6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    13be:	02d00793          	li	a5,45
    13c2:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    13c6:	459d                	li	a1,7
    13c8:	bf39                	j	12e6 <printint.constprop.0+0x126>
    13ca:	459d                	li	a1,7
    if (sign)
    13cc:	f0055de3          	bgez	a0,12e6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    13d0:	02d00793          	li	a5,45
    13d4:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    13d8:	4599                	li	a1,6
    13da:	b731                	j	12e6 <printint.constprop.0+0x126>

00000000000013dc <getchar>:
{
    13dc:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    13de:	00f10593          	addi	a1,sp,15
    13e2:	4605                	li	a2,1
    13e4:	4501                	li	a0,0
{
    13e6:	ec06                	sd	ra,24(sp)
    char byte = 0;
    13e8:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    13ec:	197000ef          	jal	ra,1d82 <read>
}
    13f0:	60e2                	ld	ra,24(sp)
    13f2:	00f14503          	lbu	a0,15(sp)
    13f6:	6105                	addi	sp,sp,32
    13f8:	8082                	ret

00000000000013fa <putchar>:
{
    13fa:	1101                	addi	sp,sp,-32
    13fc:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    13fe:	00f10593          	addi	a1,sp,15
    1402:	4605                	li	a2,1
    1404:	4505                	li	a0,1
{
    1406:	ec06                	sd	ra,24(sp)
    char byte = c;
    1408:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    140c:	181000ef          	jal	ra,1d8c <write>
}
    1410:	60e2                	ld	ra,24(sp)
    1412:	2501                	sext.w	a0,a0
    1414:	6105                	addi	sp,sp,32
    1416:	8082                	ret

0000000000001418 <puts>:
{
    1418:	1141                	addi	sp,sp,-16
    141a:	e406                	sd	ra,8(sp)
    141c:	e022                	sd	s0,0(sp)
    141e:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1420:	57e000ef          	jal	ra,199e <strlen>
    1424:	862a                	mv	a2,a0
    1426:	85a2                	mv	a1,s0
    1428:	4505                	li	a0,1
    142a:	163000ef          	jal	ra,1d8c <write>
}
    142e:	60a2                	ld	ra,8(sp)
    1430:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1432:	957d                	srai	a0,a0,0x3f
    return r;
    1434:	2501                	sext.w	a0,a0
}
    1436:	0141                	addi	sp,sp,16
    1438:	8082                	ret

000000000000143a <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    143a:	7171                	addi	sp,sp,-176
    143c:	fc56                	sd	s5,56(sp)
    143e:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1440:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1442:	18bc                	addi	a5,sp,120
{
    1444:	e8ca                	sd	s2,80(sp)
    1446:	e4ce                	sd	s3,72(sp)
    1448:	e0d2                	sd	s4,64(sp)
    144a:	f85a                	sd	s6,48(sp)
    144c:	f486                	sd	ra,104(sp)
    144e:	f0a2                	sd	s0,96(sp)
    1450:	eca6                	sd	s1,88(sp)
    1452:	fcae                	sd	a1,120(sp)
    1454:	e132                	sd	a2,128(sp)
    1456:	e536                	sd	a3,136(sp)
    1458:	e93a                	sd	a4,144(sp)
    145a:	f142                	sd	a6,160(sp)
    145c:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    145e:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1460:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1464:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1468:	00001b17          	auipc	s6,0x1
    146c:	c20b0b13          	addi	s6,s6,-992 # 2088 <__clone+0xc4>
    buf[i++] = '0';
    1470:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1474:	00001997          	auipc	s3,0x1
    1478:	c6c98993          	addi	s3,s3,-916 # 20e0 <digits>
        if (!*s)
    147c:	00054783          	lbu	a5,0(a0)
    1480:	16078a63          	beqz	a5,15f4 <printf+0x1ba>
    1484:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1486:	19278163          	beq	a5,s2,1608 <printf+0x1ce>
    148a:	00164783          	lbu	a5,1(a2)
    148e:	0605                	addi	a2,a2,1
    1490:	fbfd                	bnez	a5,1486 <printf+0x4c>
    1492:	84b2                	mv	s1,a2
        l = z - a;
    1494:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1498:	85aa                	mv	a1,a0
    149a:	8622                	mv	a2,s0
    149c:	4505                	li	a0,1
    149e:	0ef000ef          	jal	ra,1d8c <write>
        if (l)
    14a2:	18041c63          	bnez	s0,163a <printf+0x200>
        if (s[1] == 0)
    14a6:	0014c783          	lbu	a5,1(s1)
    14aa:	14078563          	beqz	a5,15f4 <printf+0x1ba>
        switch (s[1])
    14ae:	1d478063          	beq	a5,s4,166e <printf+0x234>
    14b2:	18fa6663          	bltu	s4,a5,163e <printf+0x204>
    14b6:	06400713          	li	a4,100
    14ba:	1ae78063          	beq	a5,a4,165a <printf+0x220>
    14be:	07000713          	li	a4,112
    14c2:	1ce79963          	bne	a5,a4,1694 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    14c6:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    14c8:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    14cc:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    14ce:	631c                	ld	a5,0(a4)
    14d0:	0721                	addi	a4,a4,8
    14d2:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14d4:	00479293          	slli	t0,a5,0x4
    14d8:	00879f93          	slli	t6,a5,0x8
    14dc:	00c79f13          	slli	t5,a5,0xc
    14e0:	01079e93          	slli	t4,a5,0x10
    14e4:	01479e13          	slli	t3,a5,0x14
    14e8:	01879313          	slli	t1,a5,0x18
    14ec:	01c79893          	slli	a7,a5,0x1c
    14f0:	02479813          	slli	a6,a5,0x24
    14f4:	02879513          	slli	a0,a5,0x28
    14f8:	02c79593          	slli	a1,a5,0x2c
    14fc:	03079693          	slli	a3,a5,0x30
    1500:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1504:	03c7d413          	srli	s0,a5,0x3c
    1508:	01c7d39b          	srliw	t2,a5,0x1c
    150c:	03c2d293          	srli	t0,t0,0x3c
    1510:	03cfdf93          	srli	t6,t6,0x3c
    1514:	03cf5f13          	srli	t5,t5,0x3c
    1518:	03cede93          	srli	t4,t4,0x3c
    151c:	03ce5e13          	srli	t3,t3,0x3c
    1520:	03c35313          	srli	t1,t1,0x3c
    1524:	03c8d893          	srli	a7,a7,0x3c
    1528:	03c85813          	srli	a6,a6,0x3c
    152c:	9171                	srli	a0,a0,0x3c
    152e:	91f1                	srli	a1,a1,0x3c
    1530:	92f1                	srli	a3,a3,0x3c
    1532:	9371                	srli	a4,a4,0x3c
    1534:	96ce                	add	a3,a3,s3
    1536:	974e                	add	a4,a4,s3
    1538:	944e                	add	s0,s0,s3
    153a:	92ce                	add	t0,t0,s3
    153c:	9fce                	add	t6,t6,s3
    153e:	9f4e                	add	t5,t5,s3
    1540:	9ece                	add	t4,t4,s3
    1542:	9e4e                	add	t3,t3,s3
    1544:	934e                	add	t1,t1,s3
    1546:	98ce                	add	a7,a7,s3
    1548:	93ce                	add	t2,t2,s3
    154a:	984e                	add	a6,a6,s3
    154c:	954e                	add	a0,a0,s3
    154e:	95ce                	add	a1,a1,s3
    1550:	0006c083          	lbu	ra,0(a3)
    1554:	0002c283          	lbu	t0,0(t0)
    1558:	00074683          	lbu	a3,0(a4)
    155c:	000fcf83          	lbu	t6,0(t6)
    1560:	000f4f03          	lbu	t5,0(t5)
    1564:	000ece83          	lbu	t4,0(t4)
    1568:	000e4e03          	lbu	t3,0(t3)
    156c:	00034303          	lbu	t1,0(t1)
    1570:	0008c883          	lbu	a7,0(a7)
    1574:	0003c383          	lbu	t2,0(t2)
    1578:	00084803          	lbu	a6,0(a6)
    157c:	00054503          	lbu	a0,0(a0)
    1580:	0005c583          	lbu	a1,0(a1)
    1584:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1588:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    158c:	9371                	srli	a4,a4,0x3c
    158e:	8bbd                	andi	a5,a5,15
    1590:	974e                	add	a4,a4,s3
    1592:	97ce                	add	a5,a5,s3
    1594:	005105a3          	sb	t0,11(sp)
    1598:	01f10623          	sb	t6,12(sp)
    159c:	01e106a3          	sb	t5,13(sp)
    15a0:	01d10723          	sb	t4,14(sp)
    15a4:	01c107a3          	sb	t3,15(sp)
    15a8:	00610823          	sb	t1,16(sp)
    15ac:	011108a3          	sb	a7,17(sp)
    15b0:	00710923          	sb	t2,18(sp)
    15b4:	010109a3          	sb	a6,19(sp)
    15b8:	00a10a23          	sb	a0,20(sp)
    15bc:	00b10aa3          	sb	a1,21(sp)
    15c0:	00110b23          	sb	ra,22(sp)
    15c4:	00d10ba3          	sb	a3,23(sp)
    15c8:	00810523          	sb	s0,10(sp)
    15cc:	00074703          	lbu	a4,0(a4)
    15d0:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    15d4:	002c                	addi	a1,sp,8
    15d6:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    15d8:	00e10c23          	sb	a4,24(sp)
    15dc:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    15e0:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    15e4:	7a8000ef          	jal	ra,1d8c <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    15e8:	00248513          	addi	a0,s1,2
        if (!*s)
    15ec:	00054783          	lbu	a5,0(a0)
    15f0:	e8079ae3          	bnez	a5,1484 <printf+0x4a>
    }
    va_end(ap);
}
    15f4:	70a6                	ld	ra,104(sp)
    15f6:	7406                	ld	s0,96(sp)
    15f8:	64e6                	ld	s1,88(sp)
    15fa:	6946                	ld	s2,80(sp)
    15fc:	69a6                	ld	s3,72(sp)
    15fe:	6a06                	ld	s4,64(sp)
    1600:	7ae2                	ld	s5,56(sp)
    1602:	7b42                	ld	s6,48(sp)
    1604:	614d                	addi	sp,sp,176
    1606:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1608:	00064783          	lbu	a5,0(a2)
    160c:	84b2                	mv	s1,a2
    160e:	01278963          	beq	a5,s2,1620 <printf+0x1e6>
    1612:	b549                	j	1494 <printf+0x5a>
    1614:	0024c783          	lbu	a5,2(s1)
    1618:	0605                	addi	a2,a2,1
    161a:	0489                	addi	s1,s1,2
    161c:	e7279ce3          	bne	a5,s2,1494 <printf+0x5a>
    1620:	0014c783          	lbu	a5,1(s1)
    1624:	ff2788e3          	beq	a5,s2,1614 <printf+0x1da>
        l = z - a;
    1628:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    162c:	85aa                	mv	a1,a0
    162e:	8622                	mv	a2,s0
    1630:	4505                	li	a0,1
    1632:	75a000ef          	jal	ra,1d8c <write>
        if (l)
    1636:	e60408e3          	beqz	s0,14a6 <printf+0x6c>
    163a:	8526                	mv	a0,s1
    163c:	b581                	j	147c <printf+0x42>
        switch (s[1])
    163e:	07800713          	li	a4,120
    1642:	04e79963          	bne	a5,a4,1694 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    1646:	6782                	ld	a5,0(sp)
    1648:	45c1                	li	a1,16
    164a:	4388                	lw	a0,0(a5)
    164c:	07a1                	addi	a5,a5,8
    164e:	e03e                	sd	a5,0(sp)
    1650:	b71ff0ef          	jal	ra,11c0 <printint.constprop.0>
        s += 2;
    1654:	00248513          	addi	a0,s1,2
    1658:	bf51                	j	15ec <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    165a:	6782                	ld	a5,0(sp)
    165c:	45a9                	li	a1,10
    165e:	4388                	lw	a0,0(a5)
    1660:	07a1                	addi	a5,a5,8
    1662:	e03e                	sd	a5,0(sp)
    1664:	b5dff0ef          	jal	ra,11c0 <printint.constprop.0>
        s += 2;
    1668:	00248513          	addi	a0,s1,2
    166c:	b741                	j	15ec <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    166e:	6782                	ld	a5,0(sp)
    1670:	6380                	ld	s0,0(a5)
    1672:	07a1                	addi	a5,a5,8
    1674:	e03e                	sd	a5,0(sp)
    1676:	c031                	beqz	s0,16ba <printf+0x280>
            l = strnlen(a, 200);
    1678:	0c800593          	li	a1,200
    167c:	8522                	mv	a0,s0
    167e:	40c000ef          	jal	ra,1a8a <strnlen>
    write(f, s, l);
    1682:	0005061b          	sext.w	a2,a0
    1686:	85a2                	mv	a1,s0
    1688:	4505                	li	a0,1
    168a:	702000ef          	jal	ra,1d8c <write>
        s += 2;
    168e:	00248513          	addi	a0,s1,2
    1692:	bfa9                	j	15ec <printf+0x1b2>
    return write(stdout, &byte, 1);
    1694:	4605                	li	a2,1
    1696:	002c                	addi	a1,sp,8
    1698:	4505                	li	a0,1
    char byte = c;
    169a:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    169e:	6ee000ef          	jal	ra,1d8c <write>
    char byte = c;
    16a2:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    16a6:	4605                	li	a2,1
    16a8:	002c                	addi	a1,sp,8
    16aa:	4505                	li	a0,1
    char byte = c;
    16ac:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    16b0:	6dc000ef          	jal	ra,1d8c <write>
        s += 2;
    16b4:	00248513          	addi	a0,s1,2
    16b8:	bf15                	j	15ec <printf+0x1b2>
                a = "(null)";
    16ba:	845a                	mv	s0,s6
    16bc:	bf75                	j	1678 <printf+0x23e>

00000000000016be <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    16be:	1141                	addi	sp,sp,-16
    16c0:	e406                	sd	ra,8(sp)
    puts(m);
    16c2:	d57ff0ef          	jal	ra,1418 <puts>
    exit(-100);
}
    16c6:	60a2                	ld	ra,8(sp)
    exit(-100);
    16c8:	f9c00513          	li	a0,-100
}
    16cc:	0141                	addi	sp,sp,16
    exit(-100);
    16ce:	a739                	j	1ddc <exit>

00000000000016d0 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    16d0:	02000793          	li	a5,32
    16d4:	00f50663          	beq	a0,a5,16e0 <isspace+0x10>
    16d8:	355d                	addiw	a0,a0,-9
    16da:	00553513          	sltiu	a0,a0,5
    16de:	8082                	ret
    16e0:	4505                	li	a0,1
}
    16e2:	8082                	ret

00000000000016e4 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    16e4:	fd05051b          	addiw	a0,a0,-48
}
    16e8:	00a53513          	sltiu	a0,a0,10
    16ec:	8082                	ret

00000000000016ee <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    16ee:	02000613          	li	a2,32
    16f2:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    16f4:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    16f8:	ff77869b          	addiw	a3,a5,-9
    16fc:	04c78c63          	beq	a5,a2,1754 <atoi+0x66>
    1700:	0007871b          	sext.w	a4,a5
    1704:	04d5f863          	bgeu	a1,a3,1754 <atoi+0x66>
        s++;
    switch (*s)
    1708:	02b00693          	li	a3,43
    170c:	04d78963          	beq	a5,a3,175e <atoi+0x70>
    1710:	02d00693          	li	a3,45
    1714:	06d78263          	beq	a5,a3,1778 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1718:	fd07061b          	addiw	a2,a4,-48
    171c:	47a5                	li	a5,9
    171e:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1720:	4e01                	li	t3,0
    while (isdigit(*s))
    1722:	04c7e963          	bltu	a5,a2,1774 <atoi+0x86>
    int n = 0, neg = 0;
    1726:	4501                	li	a0,0
    while (isdigit(*s))
    1728:	4825                	li	a6,9
    172a:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    172e:	0025179b          	slliw	a5,a0,0x2
    1732:	9fa9                	addw	a5,a5,a0
    1734:	fd07031b          	addiw	t1,a4,-48
    1738:	0017989b          	slliw	a7,a5,0x1
    while (isdigit(*s))
    173c:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1740:	0685                	addi	a3,a3,1
    1742:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1746:	0006071b          	sext.w	a4,a2
    174a:	feb870e3          	bgeu	a6,a1,172a <atoi+0x3c>
    return neg ? n : -n;
    174e:	000e0563          	beqz	t3,1758 <atoi+0x6a>
}
    1752:	8082                	ret
        s++;
    1754:	0505                	addi	a0,a0,1
    1756:	bf79                	j	16f4 <atoi+0x6>
    return neg ? n : -n;
    1758:	4113053b          	subw	a0,t1,a7
    175c:	8082                	ret
    while (isdigit(*s))
    175e:	00154703          	lbu	a4,1(a0)
    1762:	47a5                	li	a5,9
        s++;
    1764:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1768:	fd07061b          	addiw	a2,a4,-48
    int n = 0, neg = 0;
    176c:	4e01                	li	t3,0
    while (isdigit(*s))
    176e:	2701                	sext.w	a4,a4
    1770:	fac7fbe3          	bgeu	a5,a2,1726 <atoi+0x38>
    1774:	4501                	li	a0,0
}
    1776:	8082                	ret
    while (isdigit(*s))
    1778:	00154703          	lbu	a4,1(a0)
    177c:	47a5                	li	a5,9
        s++;
    177e:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1782:	fd07061b          	addiw	a2,a4,-48
    1786:	2701                	sext.w	a4,a4
    1788:	fec7e6e3          	bltu	a5,a2,1774 <atoi+0x86>
        neg = 1;
    178c:	4e05                	li	t3,1
    178e:	bf61                	j	1726 <atoi+0x38>

0000000000001790 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1790:	16060d63          	beqz	a2,190a <memset+0x17a>
    1794:	40a007b3          	neg	a5,a0
    1798:	8b9d                	andi	a5,a5,7
    179a:	00778693          	addi	a3,a5,7
    179e:	482d                	li	a6,11
    17a0:	0ff5f713          	zext.b	a4,a1
    17a4:	fff60593          	addi	a1,a2,-1
    17a8:	1706e263          	bltu	a3,a6,190c <memset+0x17c>
    17ac:	16d5ea63          	bltu	a1,a3,1920 <memset+0x190>
    17b0:	16078563          	beqz	a5,191a <memset+0x18a>
    17b4:	00e50023          	sb	a4,0(a0)
    17b8:	4685                	li	a3,1
    17ba:	00150593          	addi	a1,a0,1
    17be:	14d78c63          	beq	a5,a3,1916 <memset+0x186>
    17c2:	00e500a3          	sb	a4,1(a0)
    17c6:	4689                	li	a3,2
    17c8:	00250593          	addi	a1,a0,2
    17cc:	14d78d63          	beq	a5,a3,1926 <memset+0x196>
    17d0:	00e50123          	sb	a4,2(a0)
    17d4:	468d                	li	a3,3
    17d6:	00350593          	addi	a1,a0,3
    17da:	12d78b63          	beq	a5,a3,1910 <memset+0x180>
    17de:	00e501a3          	sb	a4,3(a0)
    17e2:	4691                	li	a3,4
    17e4:	00450593          	addi	a1,a0,4
    17e8:	14d78163          	beq	a5,a3,192a <memset+0x19a>
    17ec:	00e50223          	sb	a4,4(a0)
    17f0:	4695                	li	a3,5
    17f2:	00550593          	addi	a1,a0,5
    17f6:	12d78c63          	beq	a5,a3,192e <memset+0x19e>
    17fa:	00e502a3          	sb	a4,5(a0)
    17fe:	469d                	li	a3,7
    1800:	00650593          	addi	a1,a0,6
    1804:	12d79763          	bne	a5,a3,1932 <memset+0x1a2>
    1808:	00750593          	addi	a1,a0,7
    180c:	00e50323          	sb	a4,6(a0)
    1810:	481d                	li	a6,7
    1812:	00871693          	slli	a3,a4,0x8
    1816:	01071893          	slli	a7,a4,0x10
    181a:	8ed9                	or	a3,a3,a4
    181c:	01871313          	slli	t1,a4,0x18
    1820:	0116e6b3          	or	a3,a3,a7
    1824:	0066e6b3          	or	a3,a3,t1
    1828:	02071893          	slli	a7,a4,0x20
    182c:	02871e13          	slli	t3,a4,0x28
    1830:	0116e6b3          	or	a3,a3,a7
    1834:	40f60333          	sub	t1,a2,a5
    1838:	03071893          	slli	a7,a4,0x30
    183c:	01c6e6b3          	or	a3,a3,t3
    1840:	0116e6b3          	or	a3,a3,a7
    1844:	03871e13          	slli	t3,a4,0x38
    1848:	97aa                	add	a5,a5,a0
    184a:	ff837893          	andi	a7,t1,-8
    184e:	01c6e6b3          	or	a3,a3,t3
    1852:	98be                	add	a7,a7,a5
    1854:	e394                	sd	a3,0(a5)
    1856:	07a1                	addi	a5,a5,8
    1858:	ff179ee3          	bne	a5,a7,1854 <memset+0xc4>
    185c:	ff837893          	andi	a7,t1,-8
    1860:	011587b3          	add	a5,a1,a7
    1864:	010886bb          	addw	a3,a7,a6
    1868:	0b130663          	beq	t1,a7,1914 <memset+0x184>
    186c:	00e78023          	sb	a4,0(a5)
    1870:	0016859b          	addiw	a1,a3,1
    1874:	08c5fb63          	bgeu	a1,a2,190a <memset+0x17a>
    1878:	00e780a3          	sb	a4,1(a5)
    187c:	0026859b          	addiw	a1,a3,2
    1880:	08c5f563          	bgeu	a1,a2,190a <memset+0x17a>
    1884:	00e78123          	sb	a4,2(a5)
    1888:	0036859b          	addiw	a1,a3,3
    188c:	06c5ff63          	bgeu	a1,a2,190a <memset+0x17a>
    1890:	00e781a3          	sb	a4,3(a5)
    1894:	0046859b          	addiw	a1,a3,4
    1898:	06c5f963          	bgeu	a1,a2,190a <memset+0x17a>
    189c:	00e78223          	sb	a4,4(a5)
    18a0:	0056859b          	addiw	a1,a3,5
    18a4:	06c5f363          	bgeu	a1,a2,190a <memset+0x17a>
    18a8:	00e782a3          	sb	a4,5(a5)
    18ac:	0066859b          	addiw	a1,a3,6
    18b0:	04c5fd63          	bgeu	a1,a2,190a <memset+0x17a>
    18b4:	00e78323          	sb	a4,6(a5)
    18b8:	0076859b          	addiw	a1,a3,7
    18bc:	04c5f763          	bgeu	a1,a2,190a <memset+0x17a>
    18c0:	00e783a3          	sb	a4,7(a5)
    18c4:	0086859b          	addiw	a1,a3,8
    18c8:	04c5f163          	bgeu	a1,a2,190a <memset+0x17a>
    18cc:	00e78423          	sb	a4,8(a5)
    18d0:	0096859b          	addiw	a1,a3,9
    18d4:	02c5fb63          	bgeu	a1,a2,190a <memset+0x17a>
    18d8:	00e784a3          	sb	a4,9(a5)
    18dc:	00a6859b          	addiw	a1,a3,10
    18e0:	02c5f563          	bgeu	a1,a2,190a <memset+0x17a>
    18e4:	00e78523          	sb	a4,10(a5)
    18e8:	00b6859b          	addiw	a1,a3,11
    18ec:	00c5ff63          	bgeu	a1,a2,190a <memset+0x17a>
    18f0:	00e785a3          	sb	a4,11(a5)
    18f4:	00c6859b          	addiw	a1,a3,12
    18f8:	00c5f963          	bgeu	a1,a2,190a <memset+0x17a>
    18fc:	00e78623          	sb	a4,12(a5)
    1900:	26b5                	addiw	a3,a3,13
    1902:	00c6f463          	bgeu	a3,a2,190a <memset+0x17a>
    1906:	00e786a3          	sb	a4,13(a5)
        ;
    return dest;
}
    190a:	8082                	ret
    190c:	46ad                	li	a3,11
    190e:	bd79                	j	17ac <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1910:	480d                	li	a6,3
    1912:	b701                	j	1812 <memset+0x82>
    1914:	8082                	ret
    1916:	4805                	li	a6,1
    1918:	bded                	j	1812 <memset+0x82>
    191a:	85aa                	mv	a1,a0
    191c:	4801                	li	a6,0
    191e:	bdd5                	j	1812 <memset+0x82>
    1920:	87aa                	mv	a5,a0
    1922:	4681                	li	a3,0
    1924:	b7a1                	j	186c <memset+0xdc>
    1926:	4809                	li	a6,2
    1928:	b5ed                	j	1812 <memset+0x82>
    192a:	4811                	li	a6,4
    192c:	b5dd                	j	1812 <memset+0x82>
    192e:	4815                	li	a6,5
    1930:	b5cd                	j	1812 <memset+0x82>
    1932:	4819                	li	a6,6
    1934:	bdf9                	j	1812 <memset+0x82>

0000000000001936 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1936:	00054783          	lbu	a5,0(a0)
    193a:	0005c703          	lbu	a4,0(a1)
    193e:	00e79863          	bne	a5,a4,194e <strcmp+0x18>
    1942:	0505                	addi	a0,a0,1
    1944:	0585                	addi	a1,a1,1
    1946:	fbe5                	bnez	a5,1936 <strcmp>
    1948:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    194a:	9d19                	subw	a0,a0,a4
    194c:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    194e:	0007851b          	sext.w	a0,a5
    1952:	bfe5                	j	194a <strcmp+0x14>

0000000000001954 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1954:	ca15                	beqz	a2,1988 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1956:	00054783          	lbu	a5,0(a0)
    if (!n--)
    195a:	167d                	addi	a2,a2,-1
    195c:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1960:	eb99                	bnez	a5,1976 <strncmp+0x22>
    1962:	a815                	j	1996 <strncmp+0x42>
    1964:	00a68e63          	beq	a3,a0,1980 <strncmp+0x2c>
    1968:	0505                	addi	a0,a0,1
    196a:	00f71b63          	bne	a4,a5,1980 <strncmp+0x2c>
    196e:	00054783          	lbu	a5,0(a0)
    1972:	cf89                	beqz	a5,198c <strncmp+0x38>
    1974:	85b2                	mv	a1,a2
    1976:	0005c703          	lbu	a4,0(a1)
    197a:	00158613          	addi	a2,a1,1
    197e:	f37d                	bnez	a4,1964 <strncmp+0x10>
        ;
    return *l - *r;
    1980:	0007851b          	sext.w	a0,a5
    1984:	9d19                	subw	a0,a0,a4
    1986:	8082                	ret
        return 0;
    1988:	4501                	li	a0,0
}
    198a:	8082                	ret
    return *l - *r;
    198c:	0015c703          	lbu	a4,1(a1)
    1990:	4501                	li	a0,0
    1992:	9d19                	subw	a0,a0,a4
    1994:	8082                	ret
    1996:	0005c703          	lbu	a4,0(a1)
    199a:	4501                	li	a0,0
    199c:	b7e5                	j	1984 <strncmp+0x30>

000000000000199e <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    199e:	00757793          	andi	a5,a0,7
    19a2:	cf89                	beqz	a5,19bc <strlen+0x1e>
    19a4:	87aa                	mv	a5,a0
    19a6:	a029                	j	19b0 <strlen+0x12>
    19a8:	0785                	addi	a5,a5,1
    19aa:	0077f713          	andi	a4,a5,7
    19ae:	cb01                	beqz	a4,19be <strlen+0x20>
        if (!*s)
    19b0:	0007c703          	lbu	a4,0(a5)
    19b4:	fb75                	bnez	a4,19a8 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    19b6:	40a78533          	sub	a0,a5,a0
}
    19ba:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    19bc:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    19be:	6394                	ld	a3,0(a5)
    19c0:	00000597          	auipc	a1,0x0
    19c4:	6d05b583          	ld	a1,1744(a1) # 2090 <__clone+0xcc>
    19c8:	00000617          	auipc	a2,0x0
    19cc:	6d063603          	ld	a2,1744(a2) # 2098 <__clone+0xd4>
    19d0:	a019                	j	19d6 <strlen+0x38>
    19d2:	6794                	ld	a3,8(a5)
    19d4:	07a1                	addi	a5,a5,8
    19d6:	00b68733          	add	a4,a3,a1
    19da:	fff6c693          	not	a3,a3
    19de:	8f75                	and	a4,a4,a3
    19e0:	8f71                	and	a4,a4,a2
    19e2:	db65                	beqz	a4,19d2 <strlen+0x34>
    for (; *s; s++)
    19e4:	0007c703          	lbu	a4,0(a5)
    19e8:	d779                	beqz	a4,19b6 <strlen+0x18>
    19ea:	0017c703          	lbu	a4,1(a5)
    19ee:	0785                	addi	a5,a5,1
    19f0:	d379                	beqz	a4,19b6 <strlen+0x18>
    19f2:	0017c703          	lbu	a4,1(a5)
    19f6:	0785                	addi	a5,a5,1
    19f8:	fb6d                	bnez	a4,19ea <strlen+0x4c>
    19fa:	bf75                	j	19b6 <strlen+0x18>

00000000000019fc <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19fc:	00757713          	andi	a4,a0,7
{
    1a00:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1a02:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a06:	cb19                	beqz	a4,1a1c <memchr+0x20>
    1a08:	ce25                	beqz	a2,1a80 <memchr+0x84>
    1a0a:	0007c703          	lbu	a4,0(a5)
    1a0e:	04b70e63          	beq	a4,a1,1a6a <memchr+0x6e>
    1a12:	0785                	addi	a5,a5,1
    1a14:	0077f713          	andi	a4,a5,7
    1a18:	167d                	addi	a2,a2,-1
    1a1a:	f77d                	bnez	a4,1a08 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1a1c:	4501                	li	a0,0
    if (n && *s != c)
    1a1e:	c235                	beqz	a2,1a82 <memchr+0x86>
    1a20:	0007c703          	lbu	a4,0(a5)
    1a24:	04b70363          	beq	a4,a1,1a6a <memchr+0x6e>
        size_t k = ONES * c;
    1a28:	00000517          	auipc	a0,0x0
    1a2c:	67853503          	ld	a0,1656(a0) # 20a0 <__clone+0xdc>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a30:	471d                	li	a4,7
        size_t k = ONES * c;
    1a32:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a36:	02c77a63          	bgeu	a4,a2,1a6a <memchr+0x6e>
    1a3a:	00000897          	auipc	a7,0x0
    1a3e:	6568b883          	ld	a7,1622(a7) # 2090 <__clone+0xcc>
    1a42:	00000817          	auipc	a6,0x0
    1a46:	65683803          	ld	a6,1622(a6) # 2098 <__clone+0xd4>
    1a4a:	431d                	li	t1,7
    1a4c:	a029                	j	1a56 <memchr+0x5a>
    1a4e:	1661                	addi	a2,a2,-8
    1a50:	07a1                	addi	a5,a5,8
    1a52:	02c37963          	bgeu	t1,a2,1a84 <memchr+0x88>
    1a56:	6398                	ld	a4,0(a5)
    1a58:	8f29                	xor	a4,a4,a0
    1a5a:	011706b3          	add	a3,a4,a7
    1a5e:	fff74713          	not	a4,a4
    1a62:	8f75                	and	a4,a4,a3
    1a64:	01077733          	and	a4,a4,a6
    1a68:	d37d                	beqz	a4,1a4e <memchr+0x52>
{
    1a6a:	853e                	mv	a0,a5
    1a6c:	97b2                	add	a5,a5,a2
    1a6e:	a021                	j	1a76 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1a70:	0505                	addi	a0,a0,1
    1a72:	00f50763          	beq	a0,a5,1a80 <memchr+0x84>
    1a76:	00054703          	lbu	a4,0(a0)
    1a7a:	feb71be3          	bne	a4,a1,1a70 <memchr+0x74>
    1a7e:	8082                	ret
    return n ? (void *)s : 0;
    1a80:	4501                	li	a0,0
}
    1a82:	8082                	ret
    return n ? (void *)s : 0;
    1a84:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1a86:	f275                	bnez	a2,1a6a <memchr+0x6e>
}
    1a88:	8082                	ret

0000000000001a8a <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1a8a:	1101                	addi	sp,sp,-32
    1a8c:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1a8e:	862e                	mv	a2,a1
{
    1a90:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1a92:	4581                	li	a1,0
{
    1a94:	e426                	sd	s1,8(sp)
    1a96:	ec06                	sd	ra,24(sp)
    1a98:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1a9a:	f63ff0ef          	jal	ra,19fc <memchr>
    return p ? p - s : n;
    1a9e:	c519                	beqz	a0,1aac <strnlen+0x22>
}
    1aa0:	60e2                	ld	ra,24(sp)
    1aa2:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1aa4:	8d05                	sub	a0,a0,s1
}
    1aa6:	64a2                	ld	s1,8(sp)
    1aa8:	6105                	addi	sp,sp,32
    1aaa:	8082                	ret
    1aac:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1aae:	8522                	mv	a0,s0
}
    1ab0:	6442                	ld	s0,16(sp)
    1ab2:	64a2                	ld	s1,8(sp)
    1ab4:	6105                	addi	sp,sp,32
    1ab6:	8082                	ret

0000000000001ab8 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1ab8:	00a5c7b3          	xor	a5,a1,a0
    1abc:	8b9d                	andi	a5,a5,7
    1abe:	eb95                	bnez	a5,1af2 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1ac0:	0075f793          	andi	a5,a1,7
    1ac4:	e7b1                	bnez	a5,1b10 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1ac6:	6198                	ld	a4,0(a1)
    1ac8:	00000617          	auipc	a2,0x0
    1acc:	5c863603          	ld	a2,1480(a2) # 2090 <__clone+0xcc>
    1ad0:	00000817          	auipc	a6,0x0
    1ad4:	5c883803          	ld	a6,1480(a6) # 2098 <__clone+0xd4>
    1ad8:	a029                	j	1ae2 <strcpy+0x2a>
    1ada:	05a1                	addi	a1,a1,8
    1adc:	e118                	sd	a4,0(a0)
    1ade:	6198                	ld	a4,0(a1)
    1ae0:	0521                	addi	a0,a0,8
    1ae2:	00c707b3          	add	a5,a4,a2
    1ae6:	fff74693          	not	a3,a4
    1aea:	8ff5                	and	a5,a5,a3
    1aec:	0107f7b3          	and	a5,a5,a6
    1af0:	d7ed                	beqz	a5,1ada <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1af2:	0005c783          	lbu	a5,0(a1)
    1af6:	00f50023          	sb	a5,0(a0)
    1afa:	c785                	beqz	a5,1b22 <strcpy+0x6a>
    1afc:	0015c783          	lbu	a5,1(a1)
    1b00:	0505                	addi	a0,a0,1
    1b02:	0585                	addi	a1,a1,1
    1b04:	00f50023          	sb	a5,0(a0)
    1b08:	fbf5                	bnez	a5,1afc <strcpy+0x44>
        ;
    return d;
}
    1b0a:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1b0c:	0505                	addi	a0,a0,1
    1b0e:	df45                	beqz	a4,1ac6 <strcpy+0xe>
            if (!(*d = *s))
    1b10:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1b14:	0585                	addi	a1,a1,1
    1b16:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1b1a:	00f50023          	sb	a5,0(a0)
    1b1e:	f7fd                	bnez	a5,1b0c <strcpy+0x54>
}
    1b20:	8082                	ret
    1b22:	8082                	ret

0000000000001b24 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b24:	00a5c7b3          	xor	a5,a1,a0
    1b28:	8b9d                	andi	a5,a5,7
    1b2a:	1a079863          	bnez	a5,1cda <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b2e:	0075f793          	andi	a5,a1,7
    1b32:	16078463          	beqz	a5,1c9a <strncpy+0x176>
    1b36:	ea01                	bnez	a2,1b46 <strncpy+0x22>
    1b38:	a421                	j	1d40 <strncpy+0x21c>
    1b3a:	167d                	addi	a2,a2,-1
    1b3c:	0505                	addi	a0,a0,1
    1b3e:	14070e63          	beqz	a4,1c9a <strncpy+0x176>
    1b42:	1a060863          	beqz	a2,1cf2 <strncpy+0x1ce>
    1b46:	0005c783          	lbu	a5,0(a1)
    1b4a:	0585                	addi	a1,a1,1
    1b4c:	0075f713          	andi	a4,a1,7
    1b50:	00f50023          	sb	a5,0(a0)
    1b54:	f3fd                	bnez	a5,1b3a <strncpy+0x16>
    1b56:	4805                	li	a6,1
    1b58:	1a061863          	bnez	a2,1d08 <strncpy+0x1e4>
    1b5c:	40a007b3          	neg	a5,a0
    1b60:	8b9d                	andi	a5,a5,7
    1b62:	4681                	li	a3,0
    1b64:	18061a63          	bnez	a2,1cf8 <strncpy+0x1d4>
    1b68:	00778713          	addi	a4,a5,7
    1b6c:	45ad                	li	a1,11
    1b6e:	18b76363          	bltu	a4,a1,1cf4 <strncpy+0x1d0>
    1b72:	1ae6eb63          	bltu	a3,a4,1d28 <strncpy+0x204>
    1b76:	1a078363          	beqz	a5,1d1c <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b7a:	00050023          	sb	zero,0(a0)
    1b7e:	4685                	li	a3,1
    1b80:	00150713          	addi	a4,a0,1
    1b84:	18d78f63          	beq	a5,a3,1d22 <strncpy+0x1fe>
    1b88:	000500a3          	sb	zero,1(a0)
    1b8c:	4689                	li	a3,2
    1b8e:	00250713          	addi	a4,a0,2
    1b92:	18d78e63          	beq	a5,a3,1d2e <strncpy+0x20a>
    1b96:	00050123          	sb	zero,2(a0)
    1b9a:	468d                	li	a3,3
    1b9c:	00350713          	addi	a4,a0,3
    1ba0:	16d78c63          	beq	a5,a3,1d18 <strncpy+0x1f4>
    1ba4:	000501a3          	sb	zero,3(a0)
    1ba8:	4691                	li	a3,4
    1baa:	00450713          	addi	a4,a0,4
    1bae:	18d78263          	beq	a5,a3,1d32 <strncpy+0x20e>
    1bb2:	00050223          	sb	zero,4(a0)
    1bb6:	4695                	li	a3,5
    1bb8:	00550713          	addi	a4,a0,5
    1bbc:	16d78d63          	beq	a5,a3,1d36 <strncpy+0x212>
    1bc0:	000502a3          	sb	zero,5(a0)
    1bc4:	469d                	li	a3,7
    1bc6:	00650713          	addi	a4,a0,6
    1bca:	16d79863          	bne	a5,a3,1d3a <strncpy+0x216>
    1bce:	00750713          	addi	a4,a0,7
    1bd2:	00050323          	sb	zero,6(a0)
    1bd6:	40f80833          	sub	a6,a6,a5
    1bda:	ff887593          	andi	a1,a6,-8
    1bde:	97aa                	add	a5,a5,a0
    1be0:	95be                	add	a1,a1,a5
    1be2:	0007b023          	sd	zero,0(a5)
    1be6:	07a1                	addi	a5,a5,8
    1be8:	feb79de3          	bne	a5,a1,1be2 <strncpy+0xbe>
    1bec:	ff887593          	andi	a1,a6,-8
    1bf0:	9ead                	addw	a3,a3,a1
    1bf2:	00b707b3          	add	a5,a4,a1
    1bf6:	12b80863          	beq	a6,a1,1d26 <strncpy+0x202>
    1bfa:	00078023          	sb	zero,0(a5)
    1bfe:	0016871b          	addiw	a4,a3,1
    1c02:	0ec77863          	bgeu	a4,a2,1cf2 <strncpy+0x1ce>
    1c06:	000780a3          	sb	zero,1(a5)
    1c0a:	0026871b          	addiw	a4,a3,2
    1c0e:	0ec77263          	bgeu	a4,a2,1cf2 <strncpy+0x1ce>
    1c12:	00078123          	sb	zero,2(a5)
    1c16:	0036871b          	addiw	a4,a3,3
    1c1a:	0cc77c63          	bgeu	a4,a2,1cf2 <strncpy+0x1ce>
    1c1e:	000781a3          	sb	zero,3(a5)
    1c22:	0046871b          	addiw	a4,a3,4
    1c26:	0cc77663          	bgeu	a4,a2,1cf2 <strncpy+0x1ce>
    1c2a:	00078223          	sb	zero,4(a5)
    1c2e:	0056871b          	addiw	a4,a3,5
    1c32:	0cc77063          	bgeu	a4,a2,1cf2 <strncpy+0x1ce>
    1c36:	000782a3          	sb	zero,5(a5)
    1c3a:	0066871b          	addiw	a4,a3,6
    1c3e:	0ac77a63          	bgeu	a4,a2,1cf2 <strncpy+0x1ce>
    1c42:	00078323          	sb	zero,6(a5)
    1c46:	0076871b          	addiw	a4,a3,7
    1c4a:	0ac77463          	bgeu	a4,a2,1cf2 <strncpy+0x1ce>
    1c4e:	000783a3          	sb	zero,7(a5)
    1c52:	0086871b          	addiw	a4,a3,8
    1c56:	08c77e63          	bgeu	a4,a2,1cf2 <strncpy+0x1ce>
    1c5a:	00078423          	sb	zero,8(a5)
    1c5e:	0096871b          	addiw	a4,a3,9
    1c62:	08c77863          	bgeu	a4,a2,1cf2 <strncpy+0x1ce>
    1c66:	000784a3          	sb	zero,9(a5)
    1c6a:	00a6871b          	addiw	a4,a3,10
    1c6e:	08c77263          	bgeu	a4,a2,1cf2 <strncpy+0x1ce>
    1c72:	00078523          	sb	zero,10(a5)
    1c76:	00b6871b          	addiw	a4,a3,11
    1c7a:	06c77c63          	bgeu	a4,a2,1cf2 <strncpy+0x1ce>
    1c7e:	000785a3          	sb	zero,11(a5)
    1c82:	00c6871b          	addiw	a4,a3,12
    1c86:	06c77663          	bgeu	a4,a2,1cf2 <strncpy+0x1ce>
    1c8a:	00078623          	sb	zero,12(a5)
    1c8e:	26b5                	addiw	a3,a3,13
    1c90:	06c6f163          	bgeu	a3,a2,1cf2 <strncpy+0x1ce>
    1c94:	000786a3          	sb	zero,13(a5)
    1c98:	8082                	ret
            ;
        if (!n || !*s)
    1c9a:	c645                	beqz	a2,1d42 <strncpy+0x21e>
    1c9c:	0005c783          	lbu	a5,0(a1)
    1ca0:	ea078be3          	beqz	a5,1b56 <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ca4:	479d                	li	a5,7
    1ca6:	02c7ff63          	bgeu	a5,a2,1ce4 <strncpy+0x1c0>
    1caa:	00000897          	auipc	a7,0x0
    1cae:	3e68b883          	ld	a7,998(a7) # 2090 <__clone+0xcc>
    1cb2:	00000817          	auipc	a6,0x0
    1cb6:	3e683803          	ld	a6,998(a6) # 2098 <__clone+0xd4>
    1cba:	431d                	li	t1,7
    1cbc:	6198                	ld	a4,0(a1)
    1cbe:	011707b3          	add	a5,a4,a7
    1cc2:	fff74693          	not	a3,a4
    1cc6:	8ff5                	and	a5,a5,a3
    1cc8:	0107f7b3          	and	a5,a5,a6
    1ccc:	ef81                	bnez	a5,1ce4 <strncpy+0x1c0>
            *wd = *ws;
    1cce:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1cd0:	1661                	addi	a2,a2,-8
    1cd2:	05a1                	addi	a1,a1,8
    1cd4:	0521                	addi	a0,a0,8
    1cd6:	fec363e3          	bltu	t1,a2,1cbc <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1cda:	e609                	bnez	a2,1ce4 <strncpy+0x1c0>
    1cdc:	a08d                	j	1d3e <strncpy+0x21a>
    1cde:	167d                	addi	a2,a2,-1
    1ce0:	0505                	addi	a0,a0,1
    1ce2:	ca01                	beqz	a2,1cf2 <strncpy+0x1ce>
    1ce4:	0005c783          	lbu	a5,0(a1)
    1ce8:	0585                	addi	a1,a1,1
    1cea:	00f50023          	sb	a5,0(a0)
    1cee:	fbe5                	bnez	a5,1cde <strncpy+0x1ba>
        ;
tail:
    1cf0:	b59d                	j	1b56 <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1cf2:	8082                	ret
    1cf4:	472d                	li	a4,11
    1cf6:	bdb5                	j	1b72 <strncpy+0x4e>
    1cf8:	00778713          	addi	a4,a5,7
    1cfc:	45ad                	li	a1,11
    1cfe:	fff60693          	addi	a3,a2,-1
    1d02:	e6b778e3          	bgeu	a4,a1,1b72 <strncpy+0x4e>
    1d06:	b7fd                	j	1cf4 <strncpy+0x1d0>
    1d08:	40a007b3          	neg	a5,a0
    1d0c:	8832                	mv	a6,a2
    1d0e:	8b9d                	andi	a5,a5,7
    1d10:	4681                	li	a3,0
    1d12:	e4060be3          	beqz	a2,1b68 <strncpy+0x44>
    1d16:	b7cd                	j	1cf8 <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d18:	468d                	li	a3,3
    1d1a:	bd75                	j	1bd6 <strncpy+0xb2>
    1d1c:	872a                	mv	a4,a0
    1d1e:	4681                	li	a3,0
    1d20:	bd5d                	j	1bd6 <strncpy+0xb2>
    1d22:	4685                	li	a3,1
    1d24:	bd4d                	j	1bd6 <strncpy+0xb2>
    1d26:	8082                	ret
    1d28:	87aa                	mv	a5,a0
    1d2a:	4681                	li	a3,0
    1d2c:	b5f9                	j	1bfa <strncpy+0xd6>
    1d2e:	4689                	li	a3,2
    1d30:	b55d                	j	1bd6 <strncpy+0xb2>
    1d32:	4691                	li	a3,4
    1d34:	b54d                	j	1bd6 <strncpy+0xb2>
    1d36:	4695                	li	a3,5
    1d38:	bd79                	j	1bd6 <strncpy+0xb2>
    1d3a:	4699                	li	a3,6
    1d3c:	bd69                	j	1bd6 <strncpy+0xb2>
    1d3e:	8082                	ret
    1d40:	8082                	ret
    1d42:	8082                	ret

0000000000001d44 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d44:	87aa                	mv	a5,a0
    1d46:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d48:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d4c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d50:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d52:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d54:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d58:	2501                	sext.w	a0,a0
    1d5a:	8082                	ret

0000000000001d5c <openat>:
    register long a7 __asm__("a7") = n;
    1d5c:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d60:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d64:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d68:	2501                	sext.w	a0,a0
    1d6a:	8082                	ret

0000000000001d6c <fcntl>:
    register long a7 __asm__("a7") = n;
    1d6c:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d6e:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1d72:	2501                	sext.w	a0,a0
    1d74:	8082                	ret

0000000000001d76 <close>:
    register long a7 __asm__("a7") = n;
    1d76:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d7a:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d7e:	2501                	sext.w	a0,a0
    1d80:	8082                	ret

0000000000001d82 <read>:
    register long a7 __asm__("a7") = n;
    1d82:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d86:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d8a:	8082                	ret

0000000000001d8c <write>:
    register long a7 __asm__("a7") = n;
    1d8c:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d90:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d94:	8082                	ret

0000000000001d96 <getpid>:
    register long a7 __asm__("a7") = n;
    1d96:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d9a:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d9e:	2501                	sext.w	a0,a0
    1da0:	8082                	ret

0000000000001da2 <getppid>:
    register long a7 __asm__("a7") = n;
    1da2:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1da6:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1daa:	2501                	sext.w	a0,a0
    1dac:	8082                	ret

0000000000001dae <sched_yield>:
    register long a7 __asm__("a7") = n;
    1dae:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1db2:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1db6:	2501                	sext.w	a0,a0
    1db8:	8082                	ret

0000000000001dba <fork>:
    register long a7 __asm__("a7") = n;
    1dba:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1dbe:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1dc0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc2:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1dc6:	2501                	sext.w	a0,a0
    1dc8:	8082                	ret

0000000000001dca <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1dca:	85b2                	mv	a1,a2
    1dcc:	863a                	mv	a2,a4
    if (stack)
    1dce:	c191                	beqz	a1,1dd2 <clone+0x8>
	stack += stack_size;
    1dd0:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1dd2:	4781                	li	a5,0
    1dd4:	4701                	li	a4,0
    1dd6:	4681                	li	a3,0
    1dd8:	2601                	sext.w	a2,a2
    1dda:	a2ed                	j	1fc4 <__clone>

0000000000001ddc <exit>:
    register long a7 __asm__("a7") = n;
    1ddc:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1de0:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1de4:	8082                	ret

0000000000001de6 <waitpid>:
    register long a7 __asm__("a7") = n;
    1de6:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1dea:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dec:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1df0:	2501                	sext.w	a0,a0
    1df2:	8082                	ret

0000000000001df4 <exec>:
    register long a7 __asm__("a7") = n;
    1df4:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1df8:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1dfc:	2501                	sext.w	a0,a0
    1dfe:	8082                	ret

0000000000001e00 <execve>:
    register long a7 __asm__("a7") = n;
    1e00:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e04:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1e08:	2501                	sext.w	a0,a0
    1e0a:	8082                	ret

0000000000001e0c <times>:
    register long a7 __asm__("a7") = n;
    1e0c:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e10:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e14:	2501                	sext.w	a0,a0
    1e16:	8082                	ret

0000000000001e18 <get_time>:

int64 get_time()
{
    1e18:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e1a:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e1e:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e20:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e22:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e26:	2501                	sext.w	a0,a0
    1e28:	ed09                	bnez	a0,1e42 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e2a:	67a2                	ld	a5,8(sp)
    1e2c:	3e800713          	li	a4,1000
    1e30:	00015503          	lhu	a0,0(sp)
    1e34:	02e7d7b3          	divu	a5,a5,a4
    1e38:	02e50533          	mul	a0,a0,a4
    1e3c:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e3e:	0141                	addi	sp,sp,16
    1e40:	8082                	ret
        return -1;
    1e42:	557d                	li	a0,-1
    1e44:	bfed                	j	1e3e <get_time+0x26>

0000000000001e46 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e46:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e4a:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e4e:	2501                	sext.w	a0,a0
    1e50:	8082                	ret

0000000000001e52 <time>:
    register long a7 __asm__("a7") = n;
    1e52:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e56:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e5a:	2501                	sext.w	a0,a0
    1e5c:	8082                	ret

0000000000001e5e <sleep>:

int sleep(unsigned long long time)
{
    1e5e:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e60:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e62:	850a                	mv	a0,sp
    1e64:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e66:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e6a:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e6c:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e70:	e501                	bnez	a0,1e78 <sleep+0x1a>
    return 0;
    1e72:	4501                	li	a0,0
}
    1e74:	0141                	addi	sp,sp,16
    1e76:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e78:	4502                	lw	a0,0(sp)
}
    1e7a:	0141                	addi	sp,sp,16
    1e7c:	8082                	ret

0000000000001e7e <set_priority>:
    register long a7 __asm__("a7") = n;
    1e7e:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e82:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e86:	2501                	sext.w	a0,a0
    1e88:	8082                	ret

0000000000001e8a <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e8a:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e8e:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e92:	8082                	ret

0000000000001e94 <munmap>:
    register long a7 __asm__("a7") = n;
    1e94:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e98:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e9c:	2501                	sext.w	a0,a0
    1e9e:	8082                	ret

0000000000001ea0 <wait>:

int wait(int *code)
{
    1ea0:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1ea2:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1ea6:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1ea8:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1eaa:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1eac:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1eb0:	2501                	sext.w	a0,a0
    1eb2:	8082                	ret

0000000000001eb4 <spawn>:
    register long a7 __asm__("a7") = n;
    1eb4:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1eb8:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1ebc:	2501                	sext.w	a0,a0
    1ebe:	8082                	ret

0000000000001ec0 <mailread>:
    register long a7 __asm__("a7") = n;
    1ec0:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec4:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1ec8:	2501                	sext.w	a0,a0
    1eca:	8082                	ret

0000000000001ecc <mailwrite>:
    register long a7 __asm__("a7") = n;
    1ecc:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ed0:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1ed4:	2501                	sext.w	a0,a0
    1ed6:	8082                	ret

0000000000001ed8 <fstat>:
    register long a7 __asm__("a7") = n;
    1ed8:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1edc:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1ee0:	2501                	sext.w	a0,a0
    1ee2:	8082                	ret

0000000000001ee4 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1ee4:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1ee6:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1eea:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1eec:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1ef0:	2501                	sext.w	a0,a0
    1ef2:	8082                	ret

0000000000001ef4 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1ef4:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ef6:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1efa:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1efc:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f00:	2501                	sext.w	a0,a0
    1f02:	8082                	ret

0000000000001f04 <link>:

int link(char *old_path, char *new_path)
{
    1f04:	87aa                	mv	a5,a0
    1f06:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f08:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f0c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f10:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f12:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f16:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f18:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f1c:	2501                	sext.w	a0,a0
    1f1e:	8082                	ret

0000000000001f20 <unlink>:

int unlink(char *path)
{
    1f20:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f22:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f26:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f2a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f2c:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f30:	2501                	sext.w	a0,a0
    1f32:	8082                	ret

0000000000001f34 <uname>:
    register long a7 __asm__("a7") = n;
    1f34:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f38:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f3c:	2501                	sext.w	a0,a0
    1f3e:	8082                	ret

0000000000001f40 <brk>:
    register long a7 __asm__("a7") = n;
    1f40:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f44:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f48:	2501                	sext.w	a0,a0
    1f4a:	8082                	ret

0000000000001f4c <getcwd>:
    register long a7 __asm__("a7") = n;
    1f4c:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f4e:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f52:	8082                	ret

0000000000001f54 <chdir>:
    register long a7 __asm__("a7") = n;
    1f54:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f58:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f5c:	2501                	sext.w	a0,a0
    1f5e:	8082                	ret

0000000000001f60 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f60:	862e                	mv	a2,a1
    1f62:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1f64:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f66:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f6a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f6e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f70:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f72:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1f76:	2501                	sext.w	a0,a0
    1f78:	8082                	ret

0000000000001f7a <getdents>:
    register long a7 __asm__("a7") = n;
    1f7a:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f7e:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f82:	2501                	sext.w	a0,a0
    1f84:	8082                	ret

0000000000001f86 <pipe>:
    register long a7 __asm__("a7") = n;
    1f86:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f8a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f8c:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f90:	2501                	sext.w	a0,a0
    1f92:	8082                	ret

0000000000001f94 <dup>:
    register long a7 __asm__("a7") = n;
    1f94:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f96:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f9a:	2501                	sext.w	a0,a0
    1f9c:	8082                	ret

0000000000001f9e <dup2>:
    register long a7 __asm__("a7") = n;
    1f9e:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1fa0:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fa2:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1fa6:	2501                	sext.w	a0,a0
    1fa8:	8082                	ret

0000000000001faa <mount>:
    register long a7 __asm__("a7") = n;
    1faa:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fae:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1fb2:	2501                	sext.w	a0,a0
    1fb4:	8082                	ret

0000000000001fb6 <umount>:
    register long a7 __asm__("a7") = n;
    1fb6:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1fba:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fbc:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1fc0:	2501                	sext.w	a0,a0
    1fc2:	8082                	ret

0000000000001fc4 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1fc4:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1fc6:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1fc8:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1fca:	8532                	mv	a0,a2
	mv a2, a4
    1fcc:	863a                	mv	a2,a4
	mv a3, a5
    1fce:	86be                	mv	a3,a5
	mv a4, a6
    1fd0:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1fd2:	0dc00893          	li	a7,220
	ecall
    1fd6:	00000073          	ecall

	beqz a0, 1f
    1fda:	c111                	beqz	a0,1fde <__clone+0x1a>
	# Parent
	ret
    1fdc:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1fde:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1fe0:	6522                	ld	a0,8(sp)
	jalr a1
    1fe2:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1fe4:	05d00893          	li	a7,93
	ecall
    1fe8:	00000073          	ecall
