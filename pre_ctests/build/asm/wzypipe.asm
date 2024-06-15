
/root/oskernel2024-trustos/pre_ctests/build/riscv64/wzypipe:     file format elf64-littleriscv


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
    1004:	7155                	add	sp,sp,-208
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	fea50513          	add	a0,a0,-22 # 1ff0 <__clone+0x28>
void test_pipe(void){
    100e:	e586                	sd	ra,200(sp)
    1010:	e1a2                	sd	s0,192(sp)
    1012:	fd26                	sd	s1,184(sp)
    1014:	f94a                	sd	s2,176(sp)
    TEST_START(__func__);
    1016:	3c8000ef          	jal	13de <puts>
    101a:	00001517          	auipc	a0,0x1
    101e:	07e50513          	add	a0,a0,126 # 2098 <__func__.0>
    1022:	3bc000ef          	jal	13de <puts>
    1026:	00001517          	auipc	a0,0x1
    102a:	fe250513          	add	a0,a0,-30 # 2008 <__clone+0x40>
    102e:	3b0000ef          	jal	13de <puts>
    int cpid;
    char buf[128] = {'A','B'};
    1032:	6791                	lui	a5,0x4
    1034:	24178793          	add	a5,a5,577 # 4241 <digits+0x2179>
    int ret = pipe(fd);
    1038:	00001517          	auipc	a0,0x1
    103c:	05850513          	add	a0,a0,88 # 2090 <fd>
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
    1060:	72b000ef          	jal	1f8a <pipe>
    int wfd=open("wzytest.sh",O_RDONLY);
    1064:	4581                	li	a1,0
    int ret = pipe(fd);
    1066:	84aa                	mv	s1,a0
    int wfd=open("wzytest.sh",O_RDONLY);
    1068:	00001517          	auipc	a0,0x1
    106c:	fb050513          	add	a0,a0,-80 # 2018 <__clone+0x50>
    1070:	4d9000ef          	jal	1d48 <open>
    fcntl(wfd,2,1);
    1074:	4605                	li	a2,1
    1076:	4589                	li	a1,2
    int wfd=open("wzytest.sh",O_RDONLY);
    1078:	842a                	mv	s0,a0
    fcntl(wfd,2,1);
    107a:	4f7000ef          	jal	1d70 <fcntl>
    int newfd=fcntl(wfd,1030,10);
    107e:	4629                	li	a2,10
    1080:	40600593          	li	a1,1030
    1084:	8522                	mv	a0,s0
    1086:	4eb000ef          	jal	1d70 <fcntl>
    fcntl(newfd,2,1);
    108a:	4605                	li	a2,1
    108c:	4589                	li	a1,2
    int newfd=fcntl(wfd,1030,10);
    108e:	892a                	mv	s2,a0
    fcntl(newfd,2,1);
    1090:	4e1000ef          	jal	1d70 <fcntl>
    close(wfd);
    1094:	8522                	mv	a0,s0
    1096:	4e5000ef          	jal	1d7a <close>
    assert(ret != -1);
    109a:	57fd                	li	a5,-1
    109c:	0ef48663          	beq	s1,a5,1188 <test_pipe+0x184>
    if(fork()==0){
    10a0:	51f000ef          	jal	1dbe <fork>
    10a4:	00001417          	auipc	s0,0x1
    10a8:	fec40413          	add	s0,s0,-20 # 2090 <fd>
    10ac:	c921                	beqz	a0,10fc <test_pipe+0xf8>
        read(fd[0],buf,128);
        printf("read from pipe :%s\n",buf);
        close(fd[0]);
        exit(0);
    }
    if(fork()==0){
    10ae:	511000ef          	jal	1dbe <fork>
    10b2:	c149                	beqz	a0,1134 <test_pipe+0x130>
        char* argv[]={"busybox","echo","114514",NULL};
        char* env[]={NULL};
        write(fd[1],buf,128);
        execve("busybox",argv,env);
    }
    close(fd[0]);
    10b4:	4008                	lw	a0,0(s0)
    10b6:	4c5000ef          	jal	1d7a <close>
    close(fd[1]);
    10ba:	4048                	lw	a0,4(s0)
    10bc:	4bf000ef          	jal	1d7a <close>
    wait(NULL);
    10c0:	4501                	li	a0,0
    10c2:	5e3000ef          	jal	1ea4 <wait>
    wait(NULL);
    10c6:	4501                	li	a0,0
    10c8:	5dd000ef          	jal	1ea4 <wait>
    TEST_END(__func__);
    10cc:	00001517          	auipc	a0,0x1
    10d0:	f9c50513          	add	a0,a0,-100 # 2068 <__clone+0xa0>
    10d4:	30a000ef          	jal	13de <puts>
    10d8:	00001517          	auipc	a0,0x1
    10dc:	fc050513          	add	a0,a0,-64 # 2098 <__func__.0>
    10e0:	2fe000ef          	jal	13de <puts>
    10e4:	00001517          	auipc	a0,0x1
    10e8:	f2450513          	add	a0,a0,-220 # 2008 <__clone+0x40>
    10ec:	2f2000ef          	jal	13de <puts>
}
    10f0:	60ae                	ld	ra,200(sp)
    10f2:	640e                	ld	s0,192(sp)
    10f4:	74ea                	ld	s1,184(sp)
    10f6:	794a                	ld	s2,176(sp)
    10f8:	6169                	add	sp,sp,208
    10fa:	8082                	ret
        close(newfd);
    10fc:	854a                	mv	a0,s2
    10fe:	47d000ef          	jal	1d7a <close>
        close(fd[1]);
    1102:	4048                	lw	a0,4(s0)
    1104:	477000ef          	jal	1d7a <close>
        read(fd[0],buf,128);
    1108:	4008                	lw	a0,0(s0)
    110a:	08000613          	li	a2,128
    110e:	180c                	add	a1,sp,48
    1110:	477000ef          	jal	1d86 <read>
        printf("read from pipe :%s\n",buf);
    1114:	180c                	add	a1,sp,48
    1116:	00001517          	auipc	a0,0x1
    111a:	f3250513          	add	a0,a0,-206 # 2048 <__clone+0x80>
    111e:	2e2000ef          	jal	1400 <printf>
        close(fd[0]);
    1122:	4008                	lw	a0,0(s0)
    1124:	457000ef          	jal	1d7a <close>
        exit(0);
    1128:	4501                	li	a0,0
    112a:	4b7000ef          	jal	1de0 <exit>
    if(fork()==0){
    112e:	491000ef          	jal	1dbe <fork>
    1132:	f149                	bnez	a0,10b4 <test_pipe+0xb0>
        close(newfd);
    1134:	854a                	mv	a0,s2
    1136:	445000ef          	jal	1d7a <close>
        close(fd[0]);
    113a:	4008                	lw	a0,0(s0)
    113c:	43f000ef          	jal	1d7a <close>
        dup2(fd[1],1);
    1140:	4048                	lw	a0,4(s0)
    1142:	4585                	li	a1,1
    1144:	65f000ef          	jal	1fa2 <dup2>
        close(fd[1]);
    1148:	4048                	lw	a0,4(s0)
    114a:	431000ef          	jal	1d7a <close>
        char* argv[]={"busybox","echo","114514",NULL};
    114e:	00001797          	auipc	a5,0x1
    1152:	f4a78793          	add	a5,a5,-182 # 2098 <__func__.0>
    1156:	0107b803          	ld	a6,16(a5)
    115a:	6f94                	ld	a3,24(a5)
    115c:	7398                	ld	a4,32(a5)
        write(fd[1],buf,128);
    115e:	4048                	lw	a0,4(s0)
        char* argv[]={"busybox","echo","114514",NULL};
    1160:	779c                	ld	a5,40(a5)
        write(fd[1],buf,128);
    1162:	180c                	add	a1,sp,48
    1164:	08000613          	li	a2,128
        char* argv[]={"busybox","echo","114514",NULL};
    1168:	e842                	sd	a6,16(sp)
    116a:	ec36                	sd	a3,24(sp)
    116c:	f03a                	sd	a4,32(sp)
    116e:	f43e                	sd	a5,40(sp)
        char* env[]={NULL};
    1170:	e402                	sd	zero,8(sp)
        write(fd[1],buf,128);
    1172:	41f000ef          	jal	1d90 <write>
        execve("busybox",argv,env);
    1176:	0030                	add	a2,sp,8
    1178:	080c                	add	a1,sp,16
    117a:	00001517          	auipc	a0,0x1
    117e:	ee650513          	add	a0,a0,-282 # 2060 <__clone+0x98>
    1182:	483000ef          	jal	1e04 <execve>
    1186:	b73d                	j	10b4 <test_pipe+0xb0>
    assert(ret != -1);
    1188:	00001517          	auipc	a0,0x1
    118c:	ea050513          	add	a0,a0,-352 # 2028 <__clone+0x60>
    1190:	4ee000ef          	jal	167e <panic>
    1194:	b731                	j	10a0 <test_pipe+0x9c>

0000000000001196 <main>:

int main(void){
    1196:	1141                	add	sp,sp,-16
    1198:	e406                	sd	ra,8(sp)
    test_pipe();
    119a:	e6bff0ef          	jal	1004 <test_pipe>
    return 0;
}
    119e:	60a2                	ld	ra,8(sp)
    11a0:	4501                	li	a0,0
    11a2:	0141                	add	sp,sp,16
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
    11aa:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    11ac:	05a1                	add	a1,a1,8
{
    11ae:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    11b0:	fe7ff0ef          	jal	1196 <main>
    11b4:	42d000ef          	jal	1de0 <exit>
	return 0;
}
    11b8:	60a2                	ld	ra,8(sp)
    11ba:	4501                	li	a0,0
    11bc:	0141                	add	sp,sp,16
    11be:	8082                	ret

00000000000011c0 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    11c0:	7179                	add	sp,sp,-48
    11c2:	f406                	sd	ra,40(sp)
    11c4:	0005081b          	sext.w	a6,a0
    11c8:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    11ca:	00055563          	bgez	a0,11d4 <printint.constprop.0+0x14>
        x = -xx;
    11ce:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    11d2:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    11d4:	02b8763b          	remuw	a2,a6,a1
    11d8:	00001697          	auipc	a3,0x1
    11dc:	ef068693          	add	a3,a3,-272 # 20c8 <digits>
    buf[16] = 0;
    11e0:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    11e4:	0005871b          	sext.w	a4,a1
    11e8:	1602                	sll	a2,a2,0x20
    11ea:	9201                	srl	a2,a2,0x20
    11ec:	9636                	add	a2,a2,a3
    11ee:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11f2:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    11f6:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    11fa:	10b86c63          	bltu	a6,a1,1312 <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    11fe:	02e5763b          	remuw	a2,a0,a4
    1202:	1602                	sll	a2,a2,0x20
    1204:	9201                	srl	a2,a2,0x20
    1206:	9636                	add	a2,a2,a3
    1208:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    120c:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1210:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1214:	10e56863          	bltu	a0,a4,1324 <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    1218:	02e5f63b          	remuw	a2,a1,a4
    121c:	1602                	sll	a2,a2,0x20
    121e:	9201                	srl	a2,a2,0x20
    1220:	9636                	add	a2,a2,a3
    1222:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1226:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    122a:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    122e:	10e5e463          	bltu	a1,a4,1336 <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    1232:	02e5763b          	remuw	a2,a0,a4
    1236:	1602                	sll	a2,a2,0x20
    1238:	9201                	srl	a2,a2,0x20
    123a:	9636                	add	a2,a2,a3
    123c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1240:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1244:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1248:	10e56063          	bltu	a0,a4,1348 <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    124c:	02e5f63b          	remuw	a2,a1,a4
    1250:	1602                	sll	a2,a2,0x20
    1252:	9201                	srl	a2,a2,0x20
    1254:	9636                	add	a2,a2,a3
    1256:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    125a:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    125e:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1262:	0ee5ec63          	bltu	a1,a4,135a <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    1266:	02e5763b          	remuw	a2,a0,a4
    126a:	1602                	sll	a2,a2,0x20
    126c:	9201                	srl	a2,a2,0x20
    126e:	9636                	add	a2,a2,a3
    1270:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1274:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1278:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    127c:	08e56263          	bltu	a0,a4,1300 <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    1280:	02e5f63b          	remuw	a2,a1,a4
    1284:	1602                	sll	a2,a2,0x20
    1286:	9201                	srl	a2,a2,0x20
    1288:	9636                	add	a2,a2,a3
    128a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    128e:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1292:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1296:	0ce5eb63          	bltu	a1,a4,136c <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    129a:	02e5763b          	remuw	a2,a0,a4
    129e:	1602                	sll	a2,a2,0x20
    12a0:	9201                	srl	a2,a2,0x20
    12a2:	9636                	add	a2,a2,a3
    12a4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    12a8:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    12ac:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    12b0:	0ce56763          	bltu	a0,a4,137e <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    12b4:	02e5f63b          	remuw	a2,a1,a4
    12b8:	1602                	sll	a2,a2,0x20
    12ba:	9201                	srl	a2,a2,0x20
    12bc:	9636                	add	a2,a2,a3
    12be:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    12c2:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    12c6:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    12ca:	0ce5e363          	bltu	a1,a4,1390 <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    12ce:	1782                	sll	a5,a5,0x20
    12d0:	9381                	srl	a5,a5,0x20
    12d2:	96be                	add	a3,a3,a5
    12d4:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    12d8:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    12da:	00f10723          	sb	a5,14(sp)
    if (sign)
    12de:	00088763          	beqz	a7,12ec <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12e2:	02d00793          	li	a5,45
    12e6:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    12ea:	4595                	li	a1,5
    write(f, s, l);
    12ec:	003c                	add	a5,sp,8
    12ee:	4641                	li	a2,16
    12f0:	9e0d                	subw	a2,a2,a1
    12f2:	4505                	li	a0,1
    12f4:	95be                	add	a1,a1,a5
    12f6:	29b000ef          	jal	1d90 <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    12fa:	70a2                	ld	ra,40(sp)
    12fc:	6145                	add	sp,sp,48
    12fe:	8082                	ret
    i++;
    1300:	45a9                	li	a1,10
    if (sign)
    1302:	fe0885e3          	beqz	a7,12ec <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1306:	02d00793          	li	a5,45
    130a:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    130e:	45a5                	li	a1,9
    1310:	bff1                	j	12ec <printint.constprop.0+0x12c>
    i++;
    1312:	45bd                	li	a1,15
    if (sign)
    1314:	fc088ce3          	beqz	a7,12ec <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1318:	02d00793          	li	a5,45
    131c:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1320:	45b9                	li	a1,14
    1322:	b7e9                	j	12ec <printint.constprop.0+0x12c>
    i++;
    1324:	45b9                	li	a1,14
    if (sign)
    1326:	fc0883e3          	beqz	a7,12ec <printint.constprop.0+0x12c>
        buf[i--] = '-';
    132a:	02d00793          	li	a5,45
    132e:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1332:	45b5                	li	a1,13
    1334:	bf65                	j	12ec <printint.constprop.0+0x12c>
    i++;
    1336:	45b5                	li	a1,13
    if (sign)
    1338:	fa088ae3          	beqz	a7,12ec <printint.constprop.0+0x12c>
        buf[i--] = '-';
    133c:	02d00793          	li	a5,45
    1340:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1344:	45b1                	li	a1,12
    1346:	b75d                	j	12ec <printint.constprop.0+0x12c>
    i++;
    1348:	45b1                	li	a1,12
    if (sign)
    134a:	fa0881e3          	beqz	a7,12ec <printint.constprop.0+0x12c>
        buf[i--] = '-';
    134e:	02d00793          	li	a5,45
    1352:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1356:	45ad                	li	a1,11
    1358:	bf51                	j	12ec <printint.constprop.0+0x12c>
    i++;
    135a:	45ad                	li	a1,11
    if (sign)
    135c:	f80888e3          	beqz	a7,12ec <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1360:	02d00793          	li	a5,45
    1364:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1368:	45a9                	li	a1,10
    136a:	b749                	j	12ec <printint.constprop.0+0x12c>
    i++;
    136c:	45a5                	li	a1,9
    if (sign)
    136e:	f6088fe3          	beqz	a7,12ec <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1372:	02d00793          	li	a5,45
    1376:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    137a:	45a1                	li	a1,8
    137c:	bf85                	j	12ec <printint.constprop.0+0x12c>
    i++;
    137e:	45a1                	li	a1,8
    if (sign)
    1380:	f60886e3          	beqz	a7,12ec <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1384:	02d00793          	li	a5,45
    1388:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    138c:	459d                	li	a1,7
    138e:	bfb9                	j	12ec <printint.constprop.0+0x12c>
    i++;
    1390:	459d                	li	a1,7
    if (sign)
    1392:	f4088de3          	beqz	a7,12ec <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1396:	02d00793          	li	a5,45
    139a:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    139e:	4599                	li	a1,6
    13a0:	b7b1                	j	12ec <printint.constprop.0+0x12c>

00000000000013a2 <getchar>:
{
    13a2:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    13a4:	00f10593          	add	a1,sp,15
    13a8:	4605                	li	a2,1
    13aa:	4501                	li	a0,0
{
    13ac:	ec06                	sd	ra,24(sp)
    char byte = 0;
    13ae:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    13b2:	1d5000ef          	jal	1d86 <read>
}
    13b6:	60e2                	ld	ra,24(sp)
    13b8:	00f14503          	lbu	a0,15(sp)
    13bc:	6105                	add	sp,sp,32
    13be:	8082                	ret

00000000000013c0 <putchar>:
{
    13c0:	1101                	add	sp,sp,-32
    13c2:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    13c4:	00f10593          	add	a1,sp,15
    13c8:	4605                	li	a2,1
    13ca:	4505                	li	a0,1
{
    13cc:	ec06                	sd	ra,24(sp)
    char byte = c;
    13ce:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    13d2:	1bf000ef          	jal	1d90 <write>
}
    13d6:	60e2                	ld	ra,24(sp)
    13d8:	2501                	sext.w	a0,a0
    13da:	6105                	add	sp,sp,32
    13dc:	8082                	ret

00000000000013de <puts>:
{
    13de:	1141                	add	sp,sp,-16
    13e0:	e406                	sd	ra,8(sp)
    13e2:	e022                	sd	s0,0(sp)
    13e4:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    13e6:	56c000ef          	jal	1952 <strlen>
    13ea:	862a                	mv	a2,a0
    13ec:	85a2                	mv	a1,s0
    13ee:	4505                	li	a0,1
    13f0:	1a1000ef          	jal	1d90 <write>
}
    13f4:	60a2                	ld	ra,8(sp)
    13f6:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    13f8:	957d                	sra	a0,a0,0x3f
    return r;
    13fa:	2501                	sext.w	a0,a0
}
    13fc:	0141                	add	sp,sp,16
    13fe:	8082                	ret

0000000000001400 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1400:	7131                	add	sp,sp,-192
    1402:	e4d6                	sd	s5,72(sp)
    1404:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    1406:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1408:	013c                	add	a5,sp,136
{
    140a:	f0ca                	sd	s2,96(sp)
    140c:	ecce                	sd	s3,88(sp)
    140e:	e8d2                	sd	s4,80(sp)
    1410:	e0da                	sd	s6,64(sp)
    1412:	fc5e                	sd	s7,56(sp)
    1414:	fc86                	sd	ra,120(sp)
    1416:	f8a2                	sd	s0,112(sp)
    1418:	f4a6                	sd	s1,104(sp)
    141a:	e52e                	sd	a1,136(sp)
    141c:	e932                	sd	a2,144(sp)
    141e:	ed36                	sd	a3,152(sp)
    1420:	f13a                	sd	a4,160(sp)
    1422:	f942                	sd	a6,176(sp)
    1424:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1426:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1428:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    142c:	07300a13          	li	s4,115
    1430:	07800b93          	li	s7,120
    1434:	06400b13          	li	s6,100
    buf[i++] = '0';
    1438:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x5768>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    143c:	00001997          	auipc	s3,0x1
    1440:	c8c98993          	add	s3,s3,-884 # 20c8 <digits>
        if (!*s)
    1444:	00054783          	lbu	a5,0(a0)
    1448:	16078863          	beqz	a5,15b8 <printf+0x1b8>
    144c:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    144e:	19278063          	beq	a5,s2,15ce <printf+0x1ce>
    1452:	00164783          	lbu	a5,1(a2)
    1456:	0605                	add	a2,a2,1
    1458:	fbfd                	bnez	a5,144e <printf+0x4e>
    145a:	84b2                	mv	s1,a2
        l = z - a;
    145c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1460:	85aa                	mv	a1,a0
    1462:	8622                	mv	a2,s0
    1464:	4505                	li	a0,1
    1466:	12b000ef          	jal	1d90 <write>
        if (l)
    146a:	18041763          	bnez	s0,15f8 <printf+0x1f8>
        if (s[1] == 0)
    146e:	0014c783          	lbu	a5,1(s1)
    1472:	14078363          	beqz	a5,15b8 <printf+0x1b8>
        switch (s[1])
    1476:	19478f63          	beq	a5,s4,1614 <printf+0x214>
    147a:	18fa6163          	bltu	s4,a5,15fc <printf+0x1fc>
    147e:	1b678e63          	beq	a5,s6,163a <printf+0x23a>
    1482:	07000713          	li	a4,112
    1486:	1ce79463          	bne	a5,a4,164e <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    148a:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    148c:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1490:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1492:	631c                	ld	a5,0(a4)
    1494:	0721                	add	a4,a4,8
    1496:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1498:	00479293          	sll	t0,a5,0x4
    149c:	00879f93          	sll	t6,a5,0x8
    14a0:	00c79f13          	sll	t5,a5,0xc
    14a4:	01079e93          	sll	t4,a5,0x10
    14a8:	01479e13          	sll	t3,a5,0x14
    14ac:	01879313          	sll	t1,a5,0x18
    14b0:	01c79893          	sll	a7,a5,0x1c
    14b4:	02479813          	sll	a6,a5,0x24
    14b8:	02879513          	sll	a0,a5,0x28
    14bc:	02c79593          	sll	a1,a5,0x2c
    14c0:	03079693          	sll	a3,a5,0x30
    14c4:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14c8:	03c7d413          	srl	s0,a5,0x3c
    14cc:	01c7d39b          	srlw	t2,a5,0x1c
    14d0:	03c2d293          	srl	t0,t0,0x3c
    14d4:	03cfdf93          	srl	t6,t6,0x3c
    14d8:	03cf5f13          	srl	t5,t5,0x3c
    14dc:	03cede93          	srl	t4,t4,0x3c
    14e0:	03ce5e13          	srl	t3,t3,0x3c
    14e4:	03c35313          	srl	t1,t1,0x3c
    14e8:	03c8d893          	srl	a7,a7,0x3c
    14ec:	03c85813          	srl	a6,a6,0x3c
    14f0:	9171                	srl	a0,a0,0x3c
    14f2:	91f1                	srl	a1,a1,0x3c
    14f4:	92f1                	srl	a3,a3,0x3c
    14f6:	9371                	srl	a4,a4,0x3c
    14f8:	974e                	add	a4,a4,s3
    14fa:	944e                	add	s0,s0,s3
    14fc:	92ce                	add	t0,t0,s3
    14fe:	9fce                	add	t6,t6,s3
    1500:	9f4e                	add	t5,t5,s3
    1502:	9ece                	add	t4,t4,s3
    1504:	9e4e                	add	t3,t3,s3
    1506:	934e                	add	t1,t1,s3
    1508:	98ce                	add	a7,a7,s3
    150a:	93ce                	add	t2,t2,s3
    150c:	984e                	add	a6,a6,s3
    150e:	954e                	add	a0,a0,s3
    1510:	95ce                	add	a1,a1,s3
    1512:	96ce                	add	a3,a3,s3
    1514:	00074083          	lbu	ra,0(a4)
    1518:	0002c283          	lbu	t0,0(t0)
    151c:	000fcf83          	lbu	t6,0(t6)
    1520:	000f4f03          	lbu	t5,0(t5)
    1524:	000ece83          	lbu	t4,0(t4)
    1528:	000e4e03          	lbu	t3,0(t3)
    152c:	00034303          	lbu	t1,0(t1)
    1530:	0008c883          	lbu	a7,0(a7)
    1534:	0003c383          	lbu	t2,0(t2)
    1538:	00084803          	lbu	a6,0(a6)
    153c:	00054503          	lbu	a0,0(a0)
    1540:	0005c583          	lbu	a1,0(a1)
    1544:	0006c683          	lbu	a3,0(a3)
    1548:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    154c:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1550:	9371                	srl	a4,a4,0x3c
    1552:	8bbd                	and	a5,a5,15
    1554:	974e                	add	a4,a4,s3
    1556:	97ce                	add	a5,a5,s3
    1558:	005105a3          	sb	t0,11(sp)
    155c:	01f10623          	sb	t6,12(sp)
    1560:	01e106a3          	sb	t5,13(sp)
    1564:	01d10723          	sb	t4,14(sp)
    1568:	01c107a3          	sb	t3,15(sp)
    156c:	00610823          	sb	t1,16(sp)
    1570:	011108a3          	sb	a7,17(sp)
    1574:	00710923          	sb	t2,18(sp)
    1578:	010109a3          	sb	a6,19(sp)
    157c:	00a10a23          	sb	a0,20(sp)
    1580:	00b10aa3          	sb	a1,21(sp)
    1584:	00d10b23          	sb	a3,22(sp)
    1588:	00110ba3          	sb	ra,23(sp)
    158c:	00810523          	sb	s0,10(sp)
    1590:	00074703          	lbu	a4,0(a4)
    1594:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1598:	002c                	add	a1,sp,8
    159a:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    159c:	00e10c23          	sb	a4,24(sp)
    15a0:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    15a4:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    15a8:	7e8000ef          	jal	1d90 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    15ac:	00248513          	add	a0,s1,2
        if (!*s)
    15b0:	00054783          	lbu	a5,0(a0)
    15b4:	e8079ce3          	bnez	a5,144c <printf+0x4c>
    }
    va_end(ap);
}
    15b8:	70e6                	ld	ra,120(sp)
    15ba:	7446                	ld	s0,112(sp)
    15bc:	74a6                	ld	s1,104(sp)
    15be:	7906                	ld	s2,96(sp)
    15c0:	69e6                	ld	s3,88(sp)
    15c2:	6a46                	ld	s4,80(sp)
    15c4:	6aa6                	ld	s5,72(sp)
    15c6:	6b06                	ld	s6,64(sp)
    15c8:	7be2                	ld	s7,56(sp)
    15ca:	6129                	add	sp,sp,192
    15cc:	8082                	ret
    15ce:	84b2                	mv	s1,a2
    15d0:	a039                	j	15de <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    15d2:	0024c783          	lbu	a5,2(s1)
    15d6:	0605                	add	a2,a2,1
    15d8:	0489                	add	s1,s1,2
    15da:	e92791e3          	bne	a5,s2,145c <printf+0x5c>
    15de:	0014c783          	lbu	a5,1(s1)
    15e2:	ff2788e3          	beq	a5,s2,15d2 <printf+0x1d2>
        l = z - a;
    15e6:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    15ea:	85aa                	mv	a1,a0
    15ec:	8622                	mv	a2,s0
    15ee:	4505                	li	a0,1
    15f0:	7a0000ef          	jal	1d90 <write>
        if (l)
    15f4:	e6040de3          	beqz	s0,146e <printf+0x6e>
    15f8:	8526                	mv	a0,s1
    15fa:	b5a9                	j	1444 <printf+0x44>
        switch (s[1])
    15fc:	05779963          	bne	a5,s7,164e <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    1600:	6782                	ld	a5,0(sp)
    1602:	45c1                	li	a1,16
    1604:	4388                	lw	a0,0(a5)
    1606:	07a1                	add	a5,a5,8
    1608:	e03e                	sd	a5,0(sp)
    160a:	bb7ff0ef          	jal	11c0 <printint.constprop.0>
        s += 2;
    160e:	00248513          	add	a0,s1,2
    1612:	bf79                	j	15b0 <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    1614:	6782                	ld	a5,0(sp)
    1616:	6380                	ld	s0,0(a5)
    1618:	07a1                	add	a5,a5,8
    161a:	e03e                	sd	a5,0(sp)
    161c:	cc21                	beqz	s0,1674 <printf+0x274>
            l = strnlen(a, 200);
    161e:	0c800593          	li	a1,200
    1622:	8522                	mv	a0,s0
    1624:	460000ef          	jal	1a84 <strnlen>
    write(f, s, l);
    1628:	0005061b          	sext.w	a2,a0
    162c:	85a2                	mv	a1,s0
    162e:	4505                	li	a0,1
    1630:	760000ef          	jal	1d90 <write>
        s += 2;
    1634:	00248513          	add	a0,s1,2
    1638:	bfa5                	j	15b0 <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    163a:	6782                	ld	a5,0(sp)
    163c:	45a9                	li	a1,10
    163e:	4388                	lw	a0,0(a5)
    1640:	07a1                	add	a5,a5,8
    1642:	e03e                	sd	a5,0(sp)
    1644:	b7dff0ef          	jal	11c0 <printint.constprop.0>
        s += 2;
    1648:	00248513          	add	a0,s1,2
    164c:	b795                	j	15b0 <printf+0x1b0>
    return write(stdout, &byte, 1);
    164e:	4605                	li	a2,1
    1650:	002c                	add	a1,sp,8
    1652:	4505                	li	a0,1
    char byte = c;
    1654:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1658:	738000ef          	jal	1d90 <write>
    char byte = c;
    165c:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1660:	4605                	li	a2,1
    1662:	002c                	add	a1,sp,8
    1664:	4505                	li	a0,1
    char byte = c;
    1666:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    166a:	726000ef          	jal	1d90 <write>
        s += 2;
    166e:	00248513          	add	a0,s1,2
    1672:	bf3d                	j	15b0 <printf+0x1b0>
                a = "(null)";
    1674:	00001417          	auipc	s0,0x1
    1678:	a1440413          	add	s0,s0,-1516 # 2088 <__clone+0xc0>
    167c:	b74d                	j	161e <printf+0x21e>

000000000000167e <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    167e:	1141                	add	sp,sp,-16
    1680:	e406                	sd	ra,8(sp)
    puts(m);
    1682:	d5dff0ef          	jal	13de <puts>
    exit(-100);
}
    1686:	60a2                	ld	ra,8(sp)
    exit(-100);
    1688:	f9c00513          	li	a0,-100
}
    168c:	0141                	add	sp,sp,16
    exit(-100);
    168e:	af89                	j	1de0 <exit>

0000000000001690 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1690:	02000793          	li	a5,32
    1694:	00f50663          	beq	a0,a5,16a0 <isspace+0x10>
    1698:	355d                	addw	a0,a0,-9
    169a:	00553513          	sltiu	a0,a0,5
    169e:	8082                	ret
    16a0:	4505                	li	a0,1
}
    16a2:	8082                	ret

00000000000016a4 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    16a4:	fd05051b          	addw	a0,a0,-48
}
    16a8:	00a53513          	sltiu	a0,a0,10
    16ac:	8082                	ret

00000000000016ae <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    16ae:	02000713          	li	a4,32
    16b2:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    16b4:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    16b8:	ff76879b          	addw	a5,a3,-9
    16bc:	06e68063          	beq	a3,a4,171c <atoi+0x6e>
    16c0:	0006859b          	sext.w	a1,a3
    16c4:	04f67c63          	bgeu	a2,a5,171c <atoi+0x6e>
        s++;
    switch (*s)
    16c8:	02b00793          	li	a5,43
    16cc:	06f68563          	beq	a3,a5,1736 <atoi+0x88>
    16d0:	02d00793          	li	a5,45
    16d4:	04f69663          	bne	a3,a5,1720 <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    16d8:	00154683          	lbu	a3,1(a0)
    16dc:	47a5                	li	a5,9
        s++;
    16de:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    16e2:	fd06869b          	addw	a3,a3,-48
    16e6:	8636                	mv	a2,a3
    while (isdigit(*s))
    16e8:	04d7e563          	bltu	a5,a3,1732 <atoi+0x84>
        neg = 1;
    16ec:	4885                	li	a7,1
    int n = 0, neg = 0;
    16ee:	4501                	li	a0,0
    while (isdigit(*s))
    16f0:	4825                	li	a6,9
    16f2:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    16f6:	0025179b          	sllw	a5,a0,0x2
    16fa:	9fa9                	addw	a5,a5,a0
    16fc:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    1700:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    1704:	85b2                	mv	a1,a2
    1706:	40c7853b          	subw	a0,a5,a2
    170a:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    170c:	8636                	mv	a2,a3
    while (isdigit(*s))
    170e:	fed872e3          	bgeu	a6,a3,16f2 <atoi+0x44>
    return neg ? n : -n;
    1712:	02089163          	bnez	a7,1734 <atoi+0x86>
    1716:	40f5853b          	subw	a0,a1,a5
    171a:	8082                	ret
        s++;
    171c:	0505                	add	a0,a0,1
    171e:	bf59                	j	16b4 <atoi+0x6>
    while (isdigit(*s))
    1720:	fd05859b          	addw	a1,a1,-48
    1724:	47a5                	li	a5,9
    1726:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1728:	4881                	li	a7,0
    172a:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    172e:	fcb7f0e3          	bgeu	a5,a1,16ee <atoi+0x40>
    return neg ? n : -n;
    1732:	4501                	li	a0,0
}
    1734:	8082                	ret
    while (isdigit(*s))
    1736:	00154683          	lbu	a3,1(a0)
    173a:	47a5                	li	a5,9
        s++;
    173c:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1740:	fd06869b          	addw	a3,a3,-48
    1744:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    1746:	4881                	li	a7,0
    while (isdigit(*s))
    1748:	fad7f3e3          	bgeu	a5,a3,16ee <atoi+0x40>
    return neg ? n : -n;
    174c:	4501                	li	a0,0
    174e:	8082                	ret

0000000000001750 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1750:	16060f63          	beqz	a2,18ce <memset+0x17e>
    1754:	40a006b3          	neg	a3,a0
    1758:	0076f793          	and	a5,a3,7
    175c:	00778813          	add	a6,a5,7
    1760:	48ad                	li	a7,11
    1762:	0ff5f713          	zext.b	a4,a1
    1766:	fff60593          	add	a1,a2,-1
    176a:	17186363          	bltu	a6,a7,18d0 <memset+0x180>
    176e:	1705eb63          	bltu	a1,a6,18e4 <memset+0x194>
    1772:	16078163          	beqz	a5,18d4 <memset+0x184>
    1776:	00e50023          	sb	a4,0(a0)
    177a:	0066f593          	and	a1,a3,6
    177e:	14058e63          	beqz	a1,18da <memset+0x18a>
    1782:	00e500a3          	sb	a4,1(a0)
    1786:	4589                	li	a1,2
    1788:	00250813          	add	a6,a0,2
    178c:	04f5f663          	bgeu	a1,a5,17d8 <memset+0x88>
    1790:	00e50123          	sb	a4,2(a0)
    1794:	8a91                	and	a3,a3,4
    1796:	00350813          	add	a6,a0,3
    179a:	458d                	li	a1,3
    179c:	ce95                	beqz	a3,17d8 <memset+0x88>
    179e:	00e501a3          	sb	a4,3(a0)
    17a2:	4691                	li	a3,4
    17a4:	00450813          	add	a6,a0,4
    17a8:	4591                	li	a1,4
    17aa:	02f6f763          	bgeu	a3,a5,17d8 <memset+0x88>
    17ae:	00e50223          	sb	a4,4(a0)
    17b2:	4695                	li	a3,5
    17b4:	00550813          	add	a6,a0,5
    17b8:	4595                	li	a1,5
    17ba:	00d78f63          	beq	a5,a3,17d8 <memset+0x88>
    17be:	00e502a3          	sb	a4,5(a0)
    17c2:	469d                	li	a3,7
    17c4:	00650813          	add	a6,a0,6
    17c8:	4599                	li	a1,6
    17ca:	00d79763          	bne	a5,a3,17d8 <memset+0x88>
    17ce:	00750813          	add	a6,a0,7
    17d2:	00e50323          	sb	a4,6(a0)
    17d6:	459d                	li	a1,7
    17d8:	00871693          	sll	a3,a4,0x8
    17dc:	01071313          	sll	t1,a4,0x10
    17e0:	8ed9                	or	a3,a3,a4
    17e2:	01871893          	sll	a7,a4,0x18
    17e6:	0066e6b3          	or	a3,a3,t1
    17ea:	0116e6b3          	or	a3,a3,a7
    17ee:	02071313          	sll	t1,a4,0x20
    17f2:	02871893          	sll	a7,a4,0x28
    17f6:	0066e6b3          	or	a3,a3,t1
    17fa:	40f60e33          	sub	t3,a2,a5
    17fe:	03071313          	sll	t1,a4,0x30
    1802:	0116e6b3          	or	a3,a3,a7
    1806:	0066e6b3          	or	a3,a3,t1
    180a:	03871893          	sll	a7,a4,0x38
    180e:	97aa                	add	a5,a5,a0
    1810:	ff8e7313          	and	t1,t3,-8
    1814:	0116e6b3          	or	a3,a3,a7
    1818:	00f308b3          	add	a7,t1,a5
    181c:	e394                	sd	a3,0(a5)
    181e:	07a1                	add	a5,a5,8
    1820:	ff179ee3          	bne	a5,a7,181c <memset+0xcc>
    1824:	006806b3          	add	a3,a6,t1
    1828:	00b307bb          	addw	a5,t1,a1
    182c:	0bc30b63          	beq	t1,t3,18e2 <memset+0x192>
    1830:	00e68023          	sb	a4,0(a3)
    1834:	0017859b          	addw	a1,a5,1
    1838:	08c5fb63          	bgeu	a1,a2,18ce <memset+0x17e>
    183c:	00e680a3          	sb	a4,1(a3)
    1840:	0027859b          	addw	a1,a5,2
    1844:	08c5f563          	bgeu	a1,a2,18ce <memset+0x17e>
    1848:	00e68123          	sb	a4,2(a3)
    184c:	0037859b          	addw	a1,a5,3
    1850:	06c5ff63          	bgeu	a1,a2,18ce <memset+0x17e>
    1854:	00e681a3          	sb	a4,3(a3)
    1858:	0047859b          	addw	a1,a5,4
    185c:	06c5f963          	bgeu	a1,a2,18ce <memset+0x17e>
    1860:	00e68223          	sb	a4,4(a3)
    1864:	0057859b          	addw	a1,a5,5
    1868:	06c5f363          	bgeu	a1,a2,18ce <memset+0x17e>
    186c:	00e682a3          	sb	a4,5(a3)
    1870:	0067859b          	addw	a1,a5,6
    1874:	04c5fd63          	bgeu	a1,a2,18ce <memset+0x17e>
    1878:	00e68323          	sb	a4,6(a3)
    187c:	0077859b          	addw	a1,a5,7
    1880:	04c5f763          	bgeu	a1,a2,18ce <memset+0x17e>
    1884:	00e683a3          	sb	a4,7(a3)
    1888:	0087859b          	addw	a1,a5,8
    188c:	04c5f163          	bgeu	a1,a2,18ce <memset+0x17e>
    1890:	00e68423          	sb	a4,8(a3)
    1894:	0097859b          	addw	a1,a5,9
    1898:	02c5fb63          	bgeu	a1,a2,18ce <memset+0x17e>
    189c:	00e684a3          	sb	a4,9(a3)
    18a0:	00a7859b          	addw	a1,a5,10
    18a4:	02c5f563          	bgeu	a1,a2,18ce <memset+0x17e>
    18a8:	00e68523          	sb	a4,10(a3)
    18ac:	00b7859b          	addw	a1,a5,11
    18b0:	00c5ff63          	bgeu	a1,a2,18ce <memset+0x17e>
    18b4:	00e685a3          	sb	a4,11(a3)
    18b8:	00c7859b          	addw	a1,a5,12
    18bc:	00c5f963          	bgeu	a1,a2,18ce <memset+0x17e>
    18c0:	00e68623          	sb	a4,12(a3)
    18c4:	27b5                	addw	a5,a5,13
    18c6:	00c7f463          	bgeu	a5,a2,18ce <memset+0x17e>
    18ca:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    18ce:	8082                	ret
    18d0:	482d                	li	a6,11
    18d2:	bd71                	j	176e <memset+0x1e>
    char *p = dest;
    18d4:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    18d6:	4581                	li	a1,0
    18d8:	b701                	j	17d8 <memset+0x88>
    18da:	00150813          	add	a6,a0,1
    18de:	4585                	li	a1,1
    18e0:	bde5                	j	17d8 <memset+0x88>
    18e2:	8082                	ret
    char *p = dest;
    18e4:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    18e6:	4781                	li	a5,0
    18e8:	b7a1                	j	1830 <memset+0xe0>

00000000000018ea <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    18ea:	00054783          	lbu	a5,0(a0)
    18ee:	0005c703          	lbu	a4,0(a1)
    18f2:	00e79863          	bne	a5,a4,1902 <strcmp+0x18>
    18f6:	0505                	add	a0,a0,1
    18f8:	0585                	add	a1,a1,1
    18fa:	fbe5                	bnez	a5,18ea <strcmp>
    18fc:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    18fe:	9d19                	subw	a0,a0,a4
    1900:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1902:	0007851b          	sext.w	a0,a5
    1906:	bfe5                	j	18fe <strcmp+0x14>

0000000000001908 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1908:	ca15                	beqz	a2,193c <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    190a:	00054783          	lbu	a5,0(a0)
    if (!n--)
    190e:	167d                	add	a2,a2,-1
    1910:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1914:	eb99                	bnez	a5,192a <strncmp+0x22>
    1916:	a815                	j	194a <strncmp+0x42>
    1918:	00a68e63          	beq	a3,a0,1934 <strncmp+0x2c>
    191c:	0505                	add	a0,a0,1
    191e:	00f71b63          	bne	a4,a5,1934 <strncmp+0x2c>
    1922:	00054783          	lbu	a5,0(a0)
    1926:	cf89                	beqz	a5,1940 <strncmp+0x38>
    1928:	85b2                	mv	a1,a2
    192a:	0005c703          	lbu	a4,0(a1)
    192e:	00158613          	add	a2,a1,1
    1932:	f37d                	bnez	a4,1918 <strncmp+0x10>
        ;
    return *l - *r;
    1934:	0007851b          	sext.w	a0,a5
    1938:	9d19                	subw	a0,a0,a4
    193a:	8082                	ret
        return 0;
    193c:	4501                	li	a0,0
}
    193e:	8082                	ret
    return *l - *r;
    1940:	0015c703          	lbu	a4,1(a1)
    1944:	4501                	li	a0,0
    1946:	9d19                	subw	a0,a0,a4
    1948:	8082                	ret
    194a:	0005c703          	lbu	a4,0(a1)
    194e:	4501                	li	a0,0
    1950:	b7e5                	j	1938 <strncmp+0x30>

0000000000001952 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1952:	00757793          	and	a5,a0,7
    1956:	cf89                	beqz	a5,1970 <strlen+0x1e>
    1958:	87aa                	mv	a5,a0
    195a:	a029                	j	1964 <strlen+0x12>
    195c:	0785                	add	a5,a5,1
    195e:	0077f713          	and	a4,a5,7
    1962:	cb01                	beqz	a4,1972 <strlen+0x20>
        if (!*s)
    1964:	0007c703          	lbu	a4,0(a5)
    1968:	fb75                	bnez	a4,195c <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    196a:	40a78533          	sub	a0,a5,a0
}
    196e:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1970:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1972:	feff05b7          	lui	a1,0xfeff0
    1976:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefede37>
    197a:	f0101637          	lui	a2,0xf0101
    197e:	05c2                	sll	a1,a1,0x10
    1980:	0612                	sll	a2,a2,0x4
    1982:	6394                	ld	a3,0(a5)
    1984:	eff58593          	add	a1,a1,-257
    1988:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff039>
    198c:	05c2                	sll	a1,a1,0x10
    198e:	0642                	sll	a2,a2,0x10
    1990:	eff58593          	add	a1,a1,-257
    1994:	10160613          	add	a2,a2,257
    1998:	00b68733          	add	a4,a3,a1
    199c:	063e                	sll	a2,a2,0xf
    199e:	fff6c693          	not	a3,a3
    19a2:	8f75                	and	a4,a4,a3
    19a4:	08060613          	add	a2,a2,128
    19a8:	8f71                	and	a4,a4,a2
    19aa:	eb11                	bnez	a4,19be <strlen+0x6c>
    19ac:	6794                	ld	a3,8(a5)
    19ae:	07a1                	add	a5,a5,8
    19b0:	00b68733          	add	a4,a3,a1
    19b4:	fff6c693          	not	a3,a3
    19b8:	8f75                	and	a4,a4,a3
    19ba:	8f71                	and	a4,a4,a2
    19bc:	db65                	beqz	a4,19ac <strlen+0x5a>
    for (; *s; s++)
    19be:	0007c703          	lbu	a4,0(a5)
    19c2:	d745                	beqz	a4,196a <strlen+0x18>
    19c4:	0017c703          	lbu	a4,1(a5)
    19c8:	0785                	add	a5,a5,1
    19ca:	d345                	beqz	a4,196a <strlen+0x18>
    19cc:	0017c703          	lbu	a4,1(a5)
    19d0:	0785                	add	a5,a5,1
    19d2:	fb6d                	bnez	a4,19c4 <strlen+0x72>
    19d4:	bf59                	j	196a <strlen+0x18>

00000000000019d6 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19d6:	00757713          	and	a4,a0,7
{
    19da:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    19dc:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19e0:	cb19                	beqz	a4,19f6 <memchr+0x20>
    19e2:	ce59                	beqz	a2,1a80 <memchr+0xaa>
    19e4:	0007c703          	lbu	a4,0(a5)
    19e8:	00b70963          	beq	a4,a1,19fa <memchr+0x24>
    19ec:	0785                	add	a5,a5,1
    19ee:	0077f713          	and	a4,a5,7
    19f2:	167d                	add	a2,a2,-1
    19f4:	f77d                	bnez	a4,19e2 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    19f6:	4501                	li	a0,0
    if (n && *s != c)
    19f8:	c649                	beqz	a2,1a82 <memchr+0xac>
    19fa:	0007c703          	lbu	a4,0(a5)
    19fe:	06b70663          	beq	a4,a1,1a6a <memchr+0x94>
        size_t k = ONES * c;
    1a02:	01010737          	lui	a4,0x1010
    1a06:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e039>
    1a0a:	0742                	sll	a4,a4,0x10
    1a0c:	10170713          	add	a4,a4,257
    1a10:	0742                	sll	a4,a4,0x10
    1a12:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a16:	469d                	li	a3,7
        size_t k = ONES * c;
    1a18:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a1c:	04c6f763          	bgeu	a3,a2,1a6a <memchr+0x94>
    1a20:	f0101837          	lui	a6,0xf0101
    1a24:	feff08b7          	lui	a7,0xfeff0
    1a28:	0812                	sll	a6,a6,0x4
    1a2a:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefede37>
    1a2e:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff039>
    1a32:	08c2                	sll	a7,a7,0x10
    1a34:	0842                	sll	a6,a6,0x10
    1a36:	eff88893          	add	a7,a7,-257
    1a3a:	10180813          	add	a6,a6,257
    1a3e:	08c2                	sll	a7,a7,0x10
    1a40:	083e                	sll	a6,a6,0xf
    1a42:	eff88893          	add	a7,a7,-257
    1a46:	08080813          	add	a6,a6,128
    1a4a:	431d                	li	t1,7
    1a4c:	a029                	j	1a56 <memchr+0x80>
    1a4e:	1661                	add	a2,a2,-8
    1a50:	07a1                	add	a5,a5,8
    1a52:	02c37663          	bgeu	t1,a2,1a7e <memchr+0xa8>
    1a56:	6398                	ld	a4,0(a5)
    1a58:	8f29                	xor	a4,a4,a0
    1a5a:	011706b3          	add	a3,a4,a7
    1a5e:	fff74713          	not	a4,a4
    1a62:	8f75                	and	a4,a4,a3
    1a64:	01077733          	and	a4,a4,a6
    1a68:	d37d                	beqz	a4,1a4e <memchr+0x78>
        s = (const void *)w;
    1a6a:	853e                	mv	a0,a5
    1a6c:	a019                	j	1a72 <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    1a6e:	0505                	add	a0,a0,1
    1a70:	ca01                	beqz	a2,1a80 <memchr+0xaa>
    1a72:	00054783          	lbu	a5,0(a0)
    1a76:	167d                	add	a2,a2,-1
    1a78:	feb79be3          	bne	a5,a1,1a6e <memchr+0x98>
    1a7c:	8082                	ret
    1a7e:	f675                	bnez	a2,1a6a <memchr+0x94>
    return n ? (void *)s : 0;
    1a80:	4501                	li	a0,0
}
    1a82:	8082                	ret

0000000000001a84 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1a84:	1101                	add	sp,sp,-32
    1a86:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1a88:	862e                	mv	a2,a1
{
    1a8a:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1a8c:	4581                	li	a1,0
{
    1a8e:	e426                	sd	s1,8(sp)
    1a90:	ec06                	sd	ra,24(sp)
    1a92:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1a94:	f43ff0ef          	jal	19d6 <memchr>
    return p ? p - s : n;
    1a98:	c519                	beqz	a0,1aa6 <strnlen+0x22>
}
    1a9a:	60e2                	ld	ra,24(sp)
    1a9c:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1a9e:	8d05                	sub	a0,a0,s1
}
    1aa0:	64a2                	ld	s1,8(sp)
    1aa2:	6105                	add	sp,sp,32
    1aa4:	8082                	ret
    1aa6:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1aa8:	8522                	mv	a0,s0
}
    1aaa:	6442                	ld	s0,16(sp)
    1aac:	64a2                	ld	s1,8(sp)
    1aae:	6105                	add	sp,sp,32
    1ab0:	8082                	ret

0000000000001ab2 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1ab2:	00b547b3          	xor	a5,a0,a1
    1ab6:	8b9d                	and	a5,a5,7
    1ab8:	efb1                	bnez	a5,1b14 <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1aba:	0075f793          	and	a5,a1,7
    1abe:	ebb5                	bnez	a5,1b32 <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1ac0:	feff0637          	lui	a2,0xfeff0
    1ac4:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefede37>
    1ac8:	f01016b7          	lui	a3,0xf0101
    1acc:	0642                	sll	a2,a2,0x10
    1ace:	0692                	sll	a3,a3,0x4
    1ad0:	6198                	ld	a4,0(a1)
    1ad2:	eff60613          	add	a2,a2,-257
    1ad6:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff039>
    1ada:	0642                	sll	a2,a2,0x10
    1adc:	06c2                	sll	a3,a3,0x10
    1ade:	eff60613          	add	a2,a2,-257
    1ae2:	10168693          	add	a3,a3,257
    1ae6:	00c707b3          	add	a5,a4,a2
    1aea:	fff74813          	not	a6,a4
    1aee:	06be                	sll	a3,a3,0xf
    1af0:	0107f7b3          	and	a5,a5,a6
    1af4:	08068693          	add	a3,a3,128
    1af8:	8ff5                	and	a5,a5,a3
    1afa:	ef89                	bnez	a5,1b14 <strcpy+0x62>
    1afc:	05a1                	add	a1,a1,8
    1afe:	e118                	sd	a4,0(a0)
    1b00:	6198                	ld	a4,0(a1)
    1b02:	0521                	add	a0,a0,8
    1b04:	00c707b3          	add	a5,a4,a2
    1b08:	fff74813          	not	a6,a4
    1b0c:	0107f7b3          	and	a5,a5,a6
    1b10:	8ff5                	and	a5,a5,a3
    1b12:	d7ed                	beqz	a5,1afc <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1b14:	0005c783          	lbu	a5,0(a1)
    1b18:	00f50023          	sb	a5,0(a0)
    1b1c:	c785                	beqz	a5,1b44 <strcpy+0x92>
    1b1e:	0015c783          	lbu	a5,1(a1)
    1b22:	0505                	add	a0,a0,1
    1b24:	0585                	add	a1,a1,1
    1b26:	00f50023          	sb	a5,0(a0)
    1b2a:	fbf5                	bnez	a5,1b1e <strcpy+0x6c>
        ;
    return d;
}
    1b2c:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1b2e:	0505                	add	a0,a0,1
    1b30:	db41                	beqz	a4,1ac0 <strcpy+0xe>
            if (!(*d = *s))
    1b32:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1b36:	0585                	add	a1,a1,1
    1b38:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1b3c:	00f50023          	sb	a5,0(a0)
    1b40:	f7fd                	bnez	a5,1b2e <strcpy+0x7c>
}
    1b42:	8082                	ret
    1b44:	8082                	ret

0000000000001b46 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b46:	00b547b3          	xor	a5,a0,a1
    1b4a:	8b9d                	and	a5,a5,7
    1b4c:	efbd                	bnez	a5,1bca <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b4e:	0075f793          	and	a5,a1,7
    1b52:	1c078563          	beqz	a5,1d1c <strncpy+0x1d6>
    1b56:	ea11                	bnez	a2,1b6a <strncpy+0x24>
    1b58:	8082                	ret
    1b5a:	0585                	add	a1,a1,1
    1b5c:	0075f793          	and	a5,a1,7
    1b60:	167d                	add	a2,a2,-1
    1b62:	0505                	add	a0,a0,1
    1b64:	1a078c63          	beqz	a5,1d1c <strncpy+0x1d6>
    1b68:	ca3d                	beqz	a2,1bde <strncpy+0x98>
    1b6a:	0005c783          	lbu	a5,0(a1)
    1b6e:	00f50023          	sb	a5,0(a0)
    1b72:	f7e5                	bnez	a5,1b5a <strncpy+0x14>
            ;
        if (!n || !*s)
    1b74:	0005c783          	lbu	a5,0(a1)
    1b78:	c7a5                	beqz	a5,1be0 <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b7a:	479d                	li	a5,7
    1b7c:	04c7f863          	bgeu	a5,a2,1bcc <strncpy+0x86>
    1b80:	f01016b7          	lui	a3,0xf0101
    1b84:	feff0837          	lui	a6,0xfeff0
    1b88:	0692                	sll	a3,a3,0x4
    1b8a:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefede37>
    1b8e:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff039>
    1b92:	0842                	sll	a6,a6,0x10
    1b94:	06c2                	sll	a3,a3,0x10
    1b96:	eff80813          	add	a6,a6,-257
    1b9a:	10168693          	add	a3,a3,257
    1b9e:	0842                	sll	a6,a6,0x10
    1ba0:	06be                	sll	a3,a3,0xf
    1ba2:	eff80813          	add	a6,a6,-257
    1ba6:	08068693          	add	a3,a3,128
    1baa:	431d                	li	t1,7
    1bac:	6198                	ld	a4,0(a1)
    1bae:	010707b3          	add	a5,a4,a6
    1bb2:	fff74893          	not	a7,a4
    1bb6:	0117f7b3          	and	a5,a5,a7
    1bba:	8ff5                	and	a5,a5,a3
    1bbc:	eb81                	bnez	a5,1bcc <strncpy+0x86>
            *wd = *ws;
    1bbe:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bc0:	1661                	add	a2,a2,-8
    1bc2:	05a1                	add	a1,a1,8
    1bc4:	0521                	add	a0,a0,8
    1bc6:	fec363e3          	bltu	t1,a2,1bac <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1bca:	ca11                	beqz	a2,1bde <strncpy+0x98>
    1bcc:	0005c783          	lbu	a5,0(a1)
    1bd0:	0585                	add	a1,a1,1
    1bd2:	00f50023          	sb	a5,0(a0)
    1bd6:	c789                	beqz	a5,1be0 <strncpy+0x9a>
    1bd8:	167d                	add	a2,a2,-1
    1bda:	0505                	add	a0,a0,1
    1bdc:	fa65                	bnez	a2,1bcc <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1bde:	8082                	ret
    1be0:	40a00733          	neg	a4,a0
    1be4:	00777793          	and	a5,a4,7
    1be8:	00778693          	add	a3,a5,7
    1bec:	482d                	li	a6,11
    1bee:	fff60593          	add	a1,a2,-1
    1bf2:	1106ef63          	bltu	a3,a6,1d10 <strncpy+0x1ca>
    1bf6:	12d5ee63          	bltu	a1,a3,1d32 <strncpy+0x1ec>
    1bfa:	12078563          	beqz	a5,1d24 <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bfe:	00050023          	sb	zero,0(a0)
    1c02:	00677693          	and	a3,a4,6
    1c06:	12068263          	beqz	a3,1d2a <strncpy+0x1e4>
    1c0a:	000500a3          	sb	zero,1(a0)
    1c0e:	4689                	li	a3,2
    1c10:	12f6f463          	bgeu	a3,a5,1d38 <strncpy+0x1f2>
    1c14:	00050123          	sb	zero,2(a0)
    1c18:	8b11                	and	a4,a4,4
    1c1a:	cf6d                	beqz	a4,1d14 <strncpy+0x1ce>
    1c1c:	000501a3          	sb	zero,3(a0)
    1c20:	4711                	li	a4,4
    1c22:	00450693          	add	a3,a0,4
    1c26:	02f77363          	bgeu	a4,a5,1c4c <strncpy+0x106>
    1c2a:	00050223          	sb	zero,4(a0)
    1c2e:	4715                	li	a4,5
    1c30:	00550693          	add	a3,a0,5
    1c34:	00e78c63          	beq	a5,a4,1c4c <strncpy+0x106>
    1c38:	000502a3          	sb	zero,5(a0)
    1c3c:	471d                	li	a4,7
    1c3e:	10e79163          	bne	a5,a4,1d40 <strncpy+0x1fa>
    1c42:	00750693          	add	a3,a0,7
    1c46:	00050323          	sb	zero,6(a0)
    1c4a:	471d                	li	a4,7
    1c4c:	40f608b3          	sub	a7,a2,a5
    1c50:	ff88f813          	and	a6,a7,-8
    1c54:	97aa                	add	a5,a5,a0
    1c56:	010785b3          	add	a1,a5,a6
    1c5a:	0007b023          	sd	zero,0(a5)
    1c5e:	07a1                	add	a5,a5,8
    1c60:	feb79de3          	bne	a5,a1,1c5a <strncpy+0x114>
    1c64:	00e807bb          	addw	a5,a6,a4
    1c68:	01068733          	add	a4,a3,a6
    1c6c:	0b088b63          	beq	a7,a6,1d22 <strncpy+0x1dc>
    1c70:	00070023          	sb	zero,0(a4)
    1c74:	0017869b          	addw	a3,a5,1
    1c78:	f6c6f3e3          	bgeu	a3,a2,1bde <strncpy+0x98>
    1c7c:	000700a3          	sb	zero,1(a4)
    1c80:	0027869b          	addw	a3,a5,2
    1c84:	f4c6fde3          	bgeu	a3,a2,1bde <strncpy+0x98>
    1c88:	00070123          	sb	zero,2(a4)
    1c8c:	0037869b          	addw	a3,a5,3
    1c90:	f4c6f7e3          	bgeu	a3,a2,1bde <strncpy+0x98>
    1c94:	000701a3          	sb	zero,3(a4)
    1c98:	0047869b          	addw	a3,a5,4
    1c9c:	f4c6f1e3          	bgeu	a3,a2,1bde <strncpy+0x98>
    1ca0:	00070223          	sb	zero,4(a4)
    1ca4:	0057869b          	addw	a3,a5,5
    1ca8:	f2c6fbe3          	bgeu	a3,a2,1bde <strncpy+0x98>
    1cac:	000702a3          	sb	zero,5(a4)
    1cb0:	0067869b          	addw	a3,a5,6
    1cb4:	f2c6f5e3          	bgeu	a3,a2,1bde <strncpy+0x98>
    1cb8:	00070323          	sb	zero,6(a4)
    1cbc:	0077869b          	addw	a3,a5,7
    1cc0:	f0c6ffe3          	bgeu	a3,a2,1bde <strncpy+0x98>
    1cc4:	000703a3          	sb	zero,7(a4)
    1cc8:	0087869b          	addw	a3,a5,8
    1ccc:	f0c6f9e3          	bgeu	a3,a2,1bde <strncpy+0x98>
    1cd0:	00070423          	sb	zero,8(a4)
    1cd4:	0097869b          	addw	a3,a5,9
    1cd8:	f0c6f3e3          	bgeu	a3,a2,1bde <strncpy+0x98>
    1cdc:	000704a3          	sb	zero,9(a4)
    1ce0:	00a7869b          	addw	a3,a5,10
    1ce4:	eec6fde3          	bgeu	a3,a2,1bde <strncpy+0x98>
    1ce8:	00070523          	sb	zero,10(a4)
    1cec:	00b7869b          	addw	a3,a5,11
    1cf0:	eec6f7e3          	bgeu	a3,a2,1bde <strncpy+0x98>
    1cf4:	000705a3          	sb	zero,11(a4)
    1cf8:	00c7869b          	addw	a3,a5,12
    1cfc:	eec6f1e3          	bgeu	a3,a2,1bde <strncpy+0x98>
    1d00:	00070623          	sb	zero,12(a4)
    1d04:	27b5                	addw	a5,a5,13
    1d06:	ecc7fce3          	bgeu	a5,a2,1bde <strncpy+0x98>
    1d0a:	000706a3          	sb	zero,13(a4)
}
    1d0e:	8082                	ret
    1d10:	46ad                	li	a3,11
    1d12:	b5d5                	j	1bf6 <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d14:	00350693          	add	a3,a0,3
    1d18:	470d                	li	a4,3
    1d1a:	bf0d                	j	1c4c <strncpy+0x106>
        if (!n || !*s)
    1d1c:	e4061ce3          	bnez	a2,1b74 <strncpy+0x2e>
}
    1d20:	8082                	ret
    1d22:	8082                	ret
    char *p = dest;
    1d24:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d26:	4701                	li	a4,0
    1d28:	b715                	j	1c4c <strncpy+0x106>
    1d2a:	00150693          	add	a3,a0,1
    1d2e:	4705                	li	a4,1
    1d30:	bf31                	j	1c4c <strncpy+0x106>
    char *p = dest;
    1d32:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d34:	4781                	li	a5,0
    1d36:	bf2d                	j	1c70 <strncpy+0x12a>
    1d38:	00250693          	add	a3,a0,2
    1d3c:	4709                	li	a4,2
    1d3e:	b739                	j	1c4c <strncpy+0x106>
    1d40:	00650693          	add	a3,a0,6
    1d44:	4719                	li	a4,6
    1d46:	b719                	j	1c4c <strncpy+0x106>

0000000000001d48 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d48:	87aa                	mv	a5,a0
    1d4a:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d4c:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d50:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d54:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d56:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d58:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d5c:	2501                	sext.w	a0,a0
    1d5e:	8082                	ret

0000000000001d60 <openat>:
    register long a7 __asm__("a7") = n;
    1d60:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d64:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d68:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d6c:	2501                	sext.w	a0,a0
    1d6e:	8082                	ret

0000000000001d70 <fcntl>:
    register long a7 __asm__("a7") = n;
    1d70:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d72:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1d76:	2501                	sext.w	a0,a0
    1d78:	8082                	ret

0000000000001d7a <close>:
    register long a7 __asm__("a7") = n;
    1d7a:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d7e:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d82:	2501                	sext.w	a0,a0
    1d84:	8082                	ret

0000000000001d86 <read>:
    register long a7 __asm__("a7") = n;
    1d86:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d8a:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d8e:	8082                	ret

0000000000001d90 <write>:
    register long a7 __asm__("a7") = n;
    1d90:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d94:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d98:	8082                	ret

0000000000001d9a <getpid>:
    register long a7 __asm__("a7") = n;
    1d9a:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d9e:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1da2:	2501                	sext.w	a0,a0
    1da4:	8082                	ret

0000000000001da6 <getppid>:
    register long a7 __asm__("a7") = n;
    1da6:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1daa:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1dae:	2501                	sext.w	a0,a0
    1db0:	8082                	ret

0000000000001db2 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1db2:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1db6:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1dba:	2501                	sext.w	a0,a0
    1dbc:	8082                	ret

0000000000001dbe <fork>:
    register long a7 __asm__("a7") = n;
    1dbe:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1dc2:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1dc4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc6:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1dca:	2501                	sext.w	a0,a0
    1dcc:	8082                	ret

0000000000001dce <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1dce:	85b2                	mv	a1,a2
    1dd0:	863a                	mv	a2,a4
    if (stack)
    1dd2:	c191                	beqz	a1,1dd6 <clone+0x8>
	stack += stack_size;
    1dd4:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1dd6:	4781                	li	a5,0
    1dd8:	4701                	li	a4,0
    1dda:	4681                	li	a3,0
    1ddc:	2601                	sext.w	a2,a2
    1dde:	a2ed                	j	1fc8 <__clone>

0000000000001de0 <exit>:
    register long a7 __asm__("a7") = n;
    1de0:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1de4:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1de8:	8082                	ret

0000000000001dea <waitpid>:
    register long a7 __asm__("a7") = n;
    1dea:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1dee:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1df0:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1df4:	2501                	sext.w	a0,a0
    1df6:	8082                	ret

0000000000001df8 <exec>:
    register long a7 __asm__("a7") = n;
    1df8:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1dfc:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e00:	2501                	sext.w	a0,a0
    1e02:	8082                	ret

0000000000001e04 <execve>:
    register long a7 __asm__("a7") = n;
    1e04:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e08:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1e0c:	2501                	sext.w	a0,a0
    1e0e:	8082                	ret

0000000000001e10 <times>:
    register long a7 __asm__("a7") = n;
    1e10:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e14:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e18:	2501                	sext.w	a0,a0
    1e1a:	8082                	ret

0000000000001e1c <get_time>:

int64 get_time()
{
    1e1c:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e1e:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e22:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e24:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e26:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e2a:	2501                	sext.w	a0,a0
    1e2c:	ed09                	bnez	a0,1e46 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e2e:	67a2                	ld	a5,8(sp)
    1e30:	3e800713          	li	a4,1000
    1e34:	00015503          	lhu	a0,0(sp)
    1e38:	02e7d7b3          	divu	a5,a5,a4
    1e3c:	02e50533          	mul	a0,a0,a4
    1e40:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e42:	0141                	add	sp,sp,16
    1e44:	8082                	ret
        return -1;
    1e46:	557d                	li	a0,-1
    1e48:	bfed                	j	1e42 <get_time+0x26>

0000000000001e4a <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e4a:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e4e:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e52:	2501                	sext.w	a0,a0
    1e54:	8082                	ret

0000000000001e56 <time>:
    register long a7 __asm__("a7") = n;
    1e56:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e5a:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e5e:	2501                	sext.w	a0,a0
    1e60:	8082                	ret

0000000000001e62 <sleep>:

int sleep(unsigned long long time)
{
    1e62:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e64:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e66:	850a                	mv	a0,sp
    1e68:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e6a:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e6e:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e70:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e74:	e501                	bnez	a0,1e7c <sleep+0x1a>
    return 0;
    1e76:	4501                	li	a0,0
}
    1e78:	0141                	add	sp,sp,16
    1e7a:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e7c:	4502                	lw	a0,0(sp)
}
    1e7e:	0141                	add	sp,sp,16
    1e80:	8082                	ret

0000000000001e82 <set_priority>:
    register long a7 __asm__("a7") = n;
    1e82:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e86:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e8a:	2501                	sext.w	a0,a0
    1e8c:	8082                	ret

0000000000001e8e <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e8e:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e92:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e96:	8082                	ret

0000000000001e98 <munmap>:
    register long a7 __asm__("a7") = n;
    1e98:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e9c:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1ea0:	2501                	sext.w	a0,a0
    1ea2:	8082                	ret

0000000000001ea4 <wait>:

int wait(int *code)
{
    1ea4:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1ea6:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1eaa:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1eac:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1eae:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1eb0:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1eb4:	2501                	sext.w	a0,a0
    1eb6:	8082                	ret

0000000000001eb8 <spawn>:
    register long a7 __asm__("a7") = n;
    1eb8:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1ebc:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1ec0:	2501                	sext.w	a0,a0
    1ec2:	8082                	ret

0000000000001ec4 <mailread>:
    register long a7 __asm__("a7") = n;
    1ec4:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec8:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1ecc:	2501                	sext.w	a0,a0
    1ece:	8082                	ret

0000000000001ed0 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1ed0:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ed4:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1ed8:	2501                	sext.w	a0,a0
    1eda:	8082                	ret

0000000000001edc <fstat>:
    register long a7 __asm__("a7") = n;
    1edc:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ee0:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1ee4:	2501                	sext.w	a0,a0
    1ee6:	8082                	ret

0000000000001ee8 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1ee8:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1eea:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1eee:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ef0:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1ef4:	2501                	sext.w	a0,a0
    1ef6:	8082                	ret

0000000000001ef8 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1ef8:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1efa:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1efe:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f00:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f04:	2501                	sext.w	a0,a0
    1f06:	8082                	ret

0000000000001f08 <link>:

int link(char *old_path, char *new_path)
{
    1f08:	87aa                	mv	a5,a0
    1f0a:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f0c:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f10:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f14:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f16:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f1a:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f1c:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f20:	2501                	sext.w	a0,a0
    1f22:	8082                	ret

0000000000001f24 <unlink>:

int unlink(char *path)
{
    1f24:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f26:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f2a:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f2e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f30:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f34:	2501                	sext.w	a0,a0
    1f36:	8082                	ret

0000000000001f38 <uname>:
    register long a7 __asm__("a7") = n;
    1f38:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f3c:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f40:	2501                	sext.w	a0,a0
    1f42:	8082                	ret

0000000000001f44 <brk>:
    register long a7 __asm__("a7") = n;
    1f44:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f48:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f4c:	2501                	sext.w	a0,a0
    1f4e:	8082                	ret

0000000000001f50 <getcwd>:
    register long a7 __asm__("a7") = n;
    1f50:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f52:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f56:	8082                	ret

0000000000001f58 <chdir>:
    register long a7 __asm__("a7") = n;
    1f58:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f5c:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f60:	2501                	sext.w	a0,a0
    1f62:	8082                	ret

0000000000001f64 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f64:	862e                	mv	a2,a1
    1f66:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1f68:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f6a:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f6e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f72:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f74:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f76:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1f7a:	2501                	sext.w	a0,a0
    1f7c:	8082                	ret

0000000000001f7e <getdents>:
    register long a7 __asm__("a7") = n;
    1f7e:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f82:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f86:	2501                	sext.w	a0,a0
    1f88:	8082                	ret

0000000000001f8a <pipe>:
    register long a7 __asm__("a7") = n;
    1f8a:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f8e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f90:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f94:	2501                	sext.w	a0,a0
    1f96:	8082                	ret

0000000000001f98 <dup>:
    register long a7 __asm__("a7") = n;
    1f98:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f9a:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f9e:	2501                	sext.w	a0,a0
    1fa0:	8082                	ret

0000000000001fa2 <dup2>:
    register long a7 __asm__("a7") = n;
    1fa2:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1fa4:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fa6:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1faa:	2501                	sext.w	a0,a0
    1fac:	8082                	ret

0000000000001fae <mount>:
    register long a7 __asm__("a7") = n;
    1fae:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fb2:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1fb6:	2501                	sext.w	a0,a0
    1fb8:	8082                	ret

0000000000001fba <umount>:
    register long a7 __asm__("a7") = n;
    1fba:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1fbe:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fc0:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1fc4:	2501                	sext.w	a0,a0
    1fc6:	8082                	ret

0000000000001fc8 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1fc8:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1fca:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1fcc:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1fce:	8532                	mv	a0,a2
	mv a2, a4
    1fd0:	863a                	mv	a2,a4
	mv a3, a5
    1fd2:	86be                	mv	a3,a5
	mv a4, a6
    1fd4:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1fd6:	0dc00893          	li	a7,220
	ecall
    1fda:	00000073          	ecall

	beqz a0, 1f
    1fde:	c111                	beqz	a0,1fe2 <__clone+0x1a>
	# Parent
	ret
    1fe0:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1fe2:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1fe4:	6522                	ld	a0,8(sp)
	jalr a1
    1fe6:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1fe8:	05d00893          	li	a7,93
	ecall
    1fec:	00000073          	ecall
