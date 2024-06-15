
/home/brightnight/OScompetition/6.13晚final_main/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/wait：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a0e1                	j	10ca <__start_main>

0000000000001004 <test_wait>:
#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"

void test_wait(void){
    1004:	7179                	addi	sp,sp,-48
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f0a50513          	addi	a0,a0,-246 # 1f10 <__clone+0x28>
void test_wait(void){
    100e:	f406                	sd	ra,40(sp)
    1010:	f022                	sd	s0,32(sp)
    1012:	ec26                	sd	s1,24(sp)
    TEST_START(__func__);
    1014:	328000ef          	jal	ra,133c <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	fc850513          	addi	a0,a0,-56 # 1fe0 <__func__.0>
    1020:	31c000ef          	jal	ra,133c <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	f0450513          	addi	a0,a0,-252 # 1f28 <__clone+0x40>
    102c:	310000ef          	jal	ra,133c <puts>
    int cpid, wstatus;
    cpid = fork();
    1030:	4af000ef          	jal	ra,1cde <fork>
    if(cpid == 0){
    1034:	e129                	bnez	a0,1076 <test_wait+0x72>
	printf("This is child process\n");
    1036:	00001517          	auipc	a0,0x1
    103a:	f0250513          	addi	a0,a0,-254 # 1f38 <__clone+0x50>
    103e:	320000ef          	jal	ra,135e <printf>
        exit(0);
    1042:	4501                	li	a0,0
    1044:	4bd000ef          	jal	ra,1d00 <exit>
	if(ret == cpid)
	    printf("wait child success.\nwstatus: %d\n", wstatus);
	else
	    printf("wait child error.\n");
    }
    TEST_END(__func__);
    1048:	00001517          	auipc	a0,0x1
    104c:	f6850513          	addi	a0,a0,-152 # 1fb0 <__clone+0xc8>
    1050:	2ec000ef          	jal	ra,133c <puts>
    1054:	00001517          	auipc	a0,0x1
    1058:	f8c50513          	addi	a0,a0,-116 # 1fe0 <__func__.0>
    105c:	2e0000ef          	jal	ra,133c <puts>
    1060:	00001517          	auipc	a0,0x1
    1064:	ec850513          	addi	a0,a0,-312 # 1f28 <__clone+0x40>
    1068:	2d4000ef          	jal	ra,133c <puts>
}
    106c:	70a2                	ld	ra,40(sp)
    106e:	7402                	ld	s0,32(sp)
    1070:	64e2                	ld	s1,24(sp)
    1072:	6145                	addi	sp,sp,48
    1074:	8082                	ret
	pid_t ret = wait(&wstatus);
    1076:	842a                	mv	s0,a0
    1078:	0068                	addi	a0,sp,12
    107a:	54b000ef          	jal	ra,1dc4 <wait>
	assert(ret != -1);
    107e:	57fd                	li	a5,-1
	pid_t ret = wait(&wstatus);
    1080:	84aa                	mv	s1,a0
	assert(ret != -1);
    1082:	02f50363          	beq	a0,a5,10a8 <test_wait+0xa4>
	if(ret == cpid)
    1086:	00940963          	beq	s0,s1,1098 <test_wait+0x94>
	    printf("wait child error.\n");
    108a:	00001517          	auipc	a0,0x1
    108e:	f0e50513          	addi	a0,a0,-242 # 1f98 <__clone+0xb0>
    1092:	2cc000ef          	jal	ra,135e <printf>
    1096:	bf4d                	j	1048 <test_wait+0x44>
	    printf("wait child success.\nwstatus: %d\n", wstatus);
    1098:	45b2                	lw	a1,12(sp)
    109a:	00001517          	auipc	a0,0x1
    109e:	ed650513          	addi	a0,a0,-298 # 1f70 <__clone+0x88>
    10a2:	2bc000ef          	jal	ra,135e <printf>
    10a6:	b74d                	j	1048 <test_wait+0x44>
	assert(ret != -1);
    10a8:	00001517          	auipc	a0,0x1
    10ac:	ea850513          	addi	a0,a0,-344 # 1f50 <__clone+0x68>
    10b0:	532000ef          	jal	ra,15e2 <panic>
	if(ret == cpid)
    10b4:	fc941be3          	bne	s0,s1,108a <test_wait+0x86>
    10b8:	b7c5                	j	1098 <test_wait+0x94>

00000000000010ba <main>:

int main(void){
    10ba:	1141                	addi	sp,sp,-16
    10bc:	e406                	sd	ra,8(sp)
    test_wait();
    10be:	f47ff0ef          	jal	ra,1004 <test_wait>
    return 0;
}
    10c2:	60a2                	ld	ra,8(sp)
    10c4:	4501                	li	a0,0
    10c6:	0141                	addi	sp,sp,16
    10c8:	8082                	ret

00000000000010ca <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10ca:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10cc:	4108                	lw	a0,0(a0)
{
    10ce:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10d0:	05a1                	addi	a1,a1,8
{
    10d2:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10d4:	fe7ff0ef          	jal	ra,10ba <main>
    10d8:	429000ef          	jal	ra,1d00 <exit>
	return 0;
}
    10dc:	60a2                	ld	ra,8(sp)
    10de:	4501                	li	a0,0
    10e0:	0141                	addi	sp,sp,16
    10e2:	8082                	ret

00000000000010e4 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10e4:	7179                	addi	sp,sp,-48
    10e6:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10e8:	12054b63          	bltz	a0,121e <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10ec:	02b577bb          	remuw	a5,a0,a1
    10f0:	00001617          	auipc	a2,0x1
    10f4:	f0060613          	addi	a2,a2,-256 # 1ff0 <digits>
    buf[16] = 0;
    10f8:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10fc:	0005871b          	sext.w	a4,a1
    1100:	1782                	slli	a5,a5,0x20
    1102:	9381                	srli	a5,a5,0x20
    1104:	97b2                	add	a5,a5,a2
    1106:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    110a:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    110e:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1112:	1cb56363          	bltu	a0,a1,12d8 <printint.constprop.0+0x1f4>
        buf[i--] = digits[x % base];
    1116:	45b9                	li	a1,14
    1118:	02e877bb          	remuw	a5,a6,a4
    111c:	1782                	slli	a5,a5,0x20
    111e:	9381                	srli	a5,a5,0x20
    1120:	97b2                	add	a5,a5,a2
    1122:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1126:	02e856bb          	divuw	a3,a6,a4
        buf[i--] = digits[x % base];
    112a:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    112e:	0ce86e63          	bltu	a6,a4,120a <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    1132:	02e6f5bb          	remuw	a1,a3,a4
    } while ((x /= base) != 0);
    1136:	02e6d7bb          	divuw	a5,a3,a4
        buf[i--] = digits[x % base];
    113a:	1582                	slli	a1,a1,0x20
    113c:	9181                	srli	a1,a1,0x20
    113e:	95b2                	add	a1,a1,a2
    1140:	0005c583          	lbu	a1,0(a1)
    1144:	00b10aa3          	sb	a1,21(sp)
    } while ((x /= base) != 0);
    1148:	0007859b          	sext.w	a1,a5
    114c:	12e6ec63          	bltu	a3,a4,1284 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    1150:	02e7f6bb          	remuw	a3,a5,a4
    1154:	1682                	slli	a3,a3,0x20
    1156:	9281                	srli	a3,a3,0x20
    1158:	96b2                	add	a3,a3,a2
    115a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    115e:	02e7d83b          	divuw	a6,a5,a4
        buf[i--] = digits[x % base];
    1162:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1166:	12e5e863          	bltu	a1,a4,1296 <printint.constprop.0+0x1b2>
        buf[i--] = digits[x % base];
    116a:	02e876bb          	remuw	a3,a6,a4
    116e:	1682                	slli	a3,a3,0x20
    1170:	9281                	srli	a3,a3,0x20
    1172:	96b2                	add	a3,a3,a2
    1174:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1178:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    117c:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1180:	12e86463          	bltu	a6,a4,12a8 <printint.constprop.0+0x1c4>
        buf[i--] = digits[x % base];
    1184:	02e5f6bb          	remuw	a3,a1,a4
    1188:	1682                	slli	a3,a3,0x20
    118a:	9281                	srli	a3,a3,0x20
    118c:	96b2                	add	a3,a3,a2
    118e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1192:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1196:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    119a:	0ce5ec63          	bltu	a1,a4,1272 <printint.constprop.0+0x18e>
        buf[i--] = digits[x % base];
    119e:	02e876bb          	remuw	a3,a6,a4
    11a2:	1682                	slli	a3,a3,0x20
    11a4:	9281                	srli	a3,a3,0x20
    11a6:	96b2                	add	a3,a3,a2
    11a8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11ac:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11b0:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11b4:	10e86963          	bltu	a6,a4,12c6 <printint.constprop.0+0x1e2>
        buf[i--] = digits[x % base];
    11b8:	02e5f6bb          	remuw	a3,a1,a4
    11bc:	1682                	slli	a3,a3,0x20
    11be:	9281                	srli	a3,a3,0x20
    11c0:	96b2                	add	a3,a3,a2
    11c2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11c6:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11ca:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11ce:	10e5e763          	bltu	a1,a4,12dc <printint.constprop.0+0x1f8>
        buf[i--] = digits[x % base];
    11d2:	02e876bb          	remuw	a3,a6,a4
    11d6:	1682                	slli	a3,a3,0x20
    11d8:	9281                	srli	a3,a3,0x20
    11da:	96b2                	add	a3,a3,a2
    11dc:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11e0:	02e857bb          	divuw	a5,a6,a4
        buf[i--] = digits[x % base];
    11e4:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11e8:	10e86363          	bltu	a6,a4,12ee <printint.constprop.0+0x20a>
        buf[i--] = digits[x % base];
    11ec:	1782                	slli	a5,a5,0x20
    11ee:	9381                	srli	a5,a5,0x20
    11f0:	97b2                	add	a5,a5,a2
    11f2:	0007c783          	lbu	a5,0(a5)
    11f6:	4599                	li	a1,6
    11f8:	00f10723          	sb	a5,14(sp)

    if (sign)
    11fc:	00055763          	bgez	a0,120a <printint.constprop.0+0x126>
        buf[i--] = '-';
    1200:	02d00793          	li	a5,45
    1204:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1208:	4595                	li	a1,5
    write(f, s, l);
    120a:	003c                	addi	a5,sp,8
    120c:	4641                	li	a2,16
    120e:	9e0d                	subw	a2,a2,a1
    1210:	4505                	li	a0,1
    1212:	95be                	add	a1,a1,a5
    1214:	29d000ef          	jal	ra,1cb0 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1218:	70a2                	ld	ra,40(sp)
    121a:	6145                	addi	sp,sp,48
    121c:	8082                	ret
        x = -xx;
    121e:	40a0083b          	negw	a6,a0
        buf[i--] = digits[x % base];
    1222:	02b877bb          	remuw	a5,a6,a1
    1226:	00001617          	auipc	a2,0x1
    122a:	dca60613          	addi	a2,a2,-566 # 1ff0 <digits>
    buf[16] = 0;
    122e:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1232:	0005871b          	sext.w	a4,a1
    1236:	1782                	slli	a5,a5,0x20
    1238:	9381                	srli	a5,a5,0x20
    123a:	97b2                	add	a5,a5,a2
    123c:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1240:	02b858bb          	divuw	a7,a6,a1
        buf[i--] = digits[x % base];
    1244:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1248:	06b86963          	bltu	a6,a1,12ba <printint.constprop.0+0x1d6>
        buf[i--] = digits[x % base];
    124c:	02e8f7bb          	remuw	a5,a7,a4
    1250:	1782                	slli	a5,a5,0x20
    1252:	9381                	srli	a5,a5,0x20
    1254:	97b2                	add	a5,a5,a2
    1256:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    125a:	02e8d6bb          	divuw	a3,a7,a4
        buf[i--] = digits[x % base];
    125e:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    1262:	ece8f8e3          	bgeu	a7,a4,1132 <printint.constprop.0+0x4e>
        buf[i--] = '-';
    1266:	02d00793          	li	a5,45
    126a:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    126e:	45b5                	li	a1,13
    1270:	bf69                	j	120a <printint.constprop.0+0x126>
    1272:	45a9                	li	a1,10
    if (sign)
    1274:	f8055be3          	bgez	a0,120a <printint.constprop.0+0x126>
        buf[i--] = '-';
    1278:	02d00793          	li	a5,45
    127c:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1280:	45a5                	li	a1,9
    1282:	b761                	j	120a <printint.constprop.0+0x126>
    1284:	45b5                	li	a1,13
    if (sign)
    1286:	f80552e3          	bgez	a0,120a <printint.constprop.0+0x126>
        buf[i--] = '-';
    128a:	02d00793          	li	a5,45
    128e:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1292:	45b1                	li	a1,12
    1294:	bf9d                	j	120a <printint.constprop.0+0x126>
    1296:	45b1                	li	a1,12
    if (sign)
    1298:	f60559e3          	bgez	a0,120a <printint.constprop.0+0x126>
        buf[i--] = '-';
    129c:	02d00793          	li	a5,45
    12a0:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12a4:	45ad                	li	a1,11
    12a6:	b795                	j	120a <printint.constprop.0+0x126>
    12a8:	45ad                	li	a1,11
    if (sign)
    12aa:	f60550e3          	bgez	a0,120a <printint.constprop.0+0x126>
        buf[i--] = '-';
    12ae:	02d00793          	li	a5,45
    12b2:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12b6:	45a9                	li	a1,10
    12b8:	bf89                	j	120a <printint.constprop.0+0x126>
        buf[i--] = '-';
    12ba:	02d00793          	li	a5,45
    12be:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12c2:	45b9                	li	a1,14
    12c4:	b799                	j	120a <printint.constprop.0+0x126>
    12c6:	45a5                	li	a1,9
    if (sign)
    12c8:	f40551e3          	bgez	a0,120a <printint.constprop.0+0x126>
        buf[i--] = '-';
    12cc:	02d00793          	li	a5,45
    12d0:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12d4:	45a1                	li	a1,8
    12d6:	bf15                	j	120a <printint.constprop.0+0x126>
    i = 15;
    12d8:	45bd                	li	a1,15
    12da:	bf05                	j	120a <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    12dc:	45a1                	li	a1,8
    if (sign)
    12de:	f20556e3          	bgez	a0,120a <printint.constprop.0+0x126>
        buf[i--] = '-';
    12e2:	02d00793          	li	a5,45
    12e6:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12ea:	459d                	li	a1,7
    12ec:	bf39                	j	120a <printint.constprop.0+0x126>
    12ee:	459d                	li	a1,7
    if (sign)
    12f0:	f0055de3          	bgez	a0,120a <printint.constprop.0+0x126>
        buf[i--] = '-';
    12f4:	02d00793          	li	a5,45
    12f8:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12fc:	4599                	li	a1,6
    12fe:	b731                	j	120a <printint.constprop.0+0x126>

0000000000001300 <getchar>:
{
    1300:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1302:	00f10593          	addi	a1,sp,15
    1306:	4605                	li	a2,1
    1308:	4501                	li	a0,0
{
    130a:	ec06                	sd	ra,24(sp)
    char byte = 0;
    130c:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1310:	197000ef          	jal	ra,1ca6 <read>
}
    1314:	60e2                	ld	ra,24(sp)
    1316:	00f14503          	lbu	a0,15(sp)
    131a:	6105                	addi	sp,sp,32
    131c:	8082                	ret

000000000000131e <putchar>:
{
    131e:	1101                	addi	sp,sp,-32
    1320:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1322:	00f10593          	addi	a1,sp,15
    1326:	4605                	li	a2,1
    1328:	4505                	li	a0,1
{
    132a:	ec06                	sd	ra,24(sp)
    char byte = c;
    132c:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1330:	181000ef          	jal	ra,1cb0 <write>
}
    1334:	60e2                	ld	ra,24(sp)
    1336:	2501                	sext.w	a0,a0
    1338:	6105                	addi	sp,sp,32
    133a:	8082                	ret

000000000000133c <puts>:
{
    133c:	1141                	addi	sp,sp,-16
    133e:	e406                	sd	ra,8(sp)
    1340:	e022                	sd	s0,0(sp)
    1342:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1344:	57e000ef          	jal	ra,18c2 <strlen>
    1348:	862a                	mv	a2,a0
    134a:	85a2                	mv	a1,s0
    134c:	4505                	li	a0,1
    134e:	163000ef          	jal	ra,1cb0 <write>
}
    1352:	60a2                	ld	ra,8(sp)
    1354:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1356:	957d                	srai	a0,a0,0x3f
    return r;
    1358:	2501                	sext.w	a0,a0
}
    135a:	0141                	addi	sp,sp,16
    135c:	8082                	ret

000000000000135e <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    135e:	7171                	addi	sp,sp,-176
    1360:	fc56                	sd	s5,56(sp)
    1362:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1364:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1366:	18bc                	addi	a5,sp,120
{
    1368:	e8ca                	sd	s2,80(sp)
    136a:	e4ce                	sd	s3,72(sp)
    136c:	e0d2                	sd	s4,64(sp)
    136e:	f85a                	sd	s6,48(sp)
    1370:	f486                	sd	ra,104(sp)
    1372:	f0a2                	sd	s0,96(sp)
    1374:	eca6                	sd	s1,88(sp)
    1376:	fcae                	sd	a1,120(sp)
    1378:	e132                	sd	a2,128(sp)
    137a:	e536                	sd	a3,136(sp)
    137c:	e93a                	sd	a4,144(sp)
    137e:	f142                	sd	a6,160(sp)
    1380:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1382:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1384:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1388:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    138c:	00001b17          	auipc	s6,0x1
    1390:	c34b0b13          	addi	s6,s6,-972 # 1fc0 <__clone+0xd8>
    buf[i++] = '0';
    1394:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1398:	00001997          	auipc	s3,0x1
    139c:	c5898993          	addi	s3,s3,-936 # 1ff0 <digits>
        if (!*s)
    13a0:	00054783          	lbu	a5,0(a0)
    13a4:	16078a63          	beqz	a5,1518 <printf+0x1ba>
    13a8:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13aa:	19278163          	beq	a5,s2,152c <printf+0x1ce>
    13ae:	00164783          	lbu	a5,1(a2)
    13b2:	0605                	addi	a2,a2,1
    13b4:	fbfd                	bnez	a5,13aa <printf+0x4c>
    13b6:	84b2                	mv	s1,a2
        l = z - a;
    13b8:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13bc:	85aa                	mv	a1,a0
    13be:	8622                	mv	a2,s0
    13c0:	4505                	li	a0,1
    13c2:	0ef000ef          	jal	ra,1cb0 <write>
        if (l)
    13c6:	18041c63          	bnez	s0,155e <printf+0x200>
        if (s[1] == 0)
    13ca:	0014c783          	lbu	a5,1(s1)
    13ce:	14078563          	beqz	a5,1518 <printf+0x1ba>
        switch (s[1])
    13d2:	1d478063          	beq	a5,s4,1592 <printf+0x234>
    13d6:	18fa6663          	bltu	s4,a5,1562 <printf+0x204>
    13da:	06400713          	li	a4,100
    13de:	1ae78063          	beq	a5,a4,157e <printf+0x220>
    13e2:	07000713          	li	a4,112
    13e6:	1ce79963          	bne	a5,a4,15b8 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    13ea:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13ec:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13f0:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13f2:	631c                	ld	a5,0(a4)
    13f4:	0721                	addi	a4,a4,8
    13f6:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13f8:	00479293          	slli	t0,a5,0x4
    13fc:	00879f93          	slli	t6,a5,0x8
    1400:	00c79f13          	slli	t5,a5,0xc
    1404:	01079e93          	slli	t4,a5,0x10
    1408:	01479e13          	slli	t3,a5,0x14
    140c:	01879313          	slli	t1,a5,0x18
    1410:	01c79893          	slli	a7,a5,0x1c
    1414:	02479813          	slli	a6,a5,0x24
    1418:	02879513          	slli	a0,a5,0x28
    141c:	02c79593          	slli	a1,a5,0x2c
    1420:	03079693          	slli	a3,a5,0x30
    1424:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1428:	03c7d413          	srli	s0,a5,0x3c
    142c:	01c7d39b          	srliw	t2,a5,0x1c
    1430:	03c2d293          	srli	t0,t0,0x3c
    1434:	03cfdf93          	srli	t6,t6,0x3c
    1438:	03cf5f13          	srli	t5,t5,0x3c
    143c:	03cede93          	srli	t4,t4,0x3c
    1440:	03ce5e13          	srli	t3,t3,0x3c
    1444:	03c35313          	srli	t1,t1,0x3c
    1448:	03c8d893          	srli	a7,a7,0x3c
    144c:	03c85813          	srli	a6,a6,0x3c
    1450:	9171                	srli	a0,a0,0x3c
    1452:	91f1                	srli	a1,a1,0x3c
    1454:	92f1                	srli	a3,a3,0x3c
    1456:	9371                	srli	a4,a4,0x3c
    1458:	96ce                	add	a3,a3,s3
    145a:	974e                	add	a4,a4,s3
    145c:	944e                	add	s0,s0,s3
    145e:	92ce                	add	t0,t0,s3
    1460:	9fce                	add	t6,t6,s3
    1462:	9f4e                	add	t5,t5,s3
    1464:	9ece                	add	t4,t4,s3
    1466:	9e4e                	add	t3,t3,s3
    1468:	934e                	add	t1,t1,s3
    146a:	98ce                	add	a7,a7,s3
    146c:	93ce                	add	t2,t2,s3
    146e:	984e                	add	a6,a6,s3
    1470:	954e                	add	a0,a0,s3
    1472:	95ce                	add	a1,a1,s3
    1474:	0006c083          	lbu	ra,0(a3)
    1478:	0002c283          	lbu	t0,0(t0)
    147c:	00074683          	lbu	a3,0(a4)
    1480:	000fcf83          	lbu	t6,0(t6)
    1484:	000f4f03          	lbu	t5,0(t5)
    1488:	000ece83          	lbu	t4,0(t4)
    148c:	000e4e03          	lbu	t3,0(t3)
    1490:	00034303          	lbu	t1,0(t1)
    1494:	0008c883          	lbu	a7,0(a7)
    1498:	0003c383          	lbu	t2,0(t2)
    149c:	00084803          	lbu	a6,0(a6)
    14a0:	00054503          	lbu	a0,0(a0)
    14a4:	0005c583          	lbu	a1,0(a1)
    14a8:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14ac:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14b0:	9371                	srli	a4,a4,0x3c
    14b2:	8bbd                	andi	a5,a5,15
    14b4:	974e                	add	a4,a4,s3
    14b6:	97ce                	add	a5,a5,s3
    14b8:	005105a3          	sb	t0,11(sp)
    14bc:	01f10623          	sb	t6,12(sp)
    14c0:	01e106a3          	sb	t5,13(sp)
    14c4:	01d10723          	sb	t4,14(sp)
    14c8:	01c107a3          	sb	t3,15(sp)
    14cc:	00610823          	sb	t1,16(sp)
    14d0:	011108a3          	sb	a7,17(sp)
    14d4:	00710923          	sb	t2,18(sp)
    14d8:	010109a3          	sb	a6,19(sp)
    14dc:	00a10a23          	sb	a0,20(sp)
    14e0:	00b10aa3          	sb	a1,21(sp)
    14e4:	00110b23          	sb	ra,22(sp)
    14e8:	00d10ba3          	sb	a3,23(sp)
    14ec:	00810523          	sb	s0,10(sp)
    14f0:	00074703          	lbu	a4,0(a4)
    14f4:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14f8:	002c                	addi	a1,sp,8
    14fa:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14fc:	00e10c23          	sb	a4,24(sp)
    1500:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1504:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1508:	7a8000ef          	jal	ra,1cb0 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    150c:	00248513          	addi	a0,s1,2
        if (!*s)
    1510:	00054783          	lbu	a5,0(a0)
    1514:	e8079ae3          	bnez	a5,13a8 <printf+0x4a>
    }
    va_end(ap);
}
    1518:	70a6                	ld	ra,104(sp)
    151a:	7406                	ld	s0,96(sp)
    151c:	64e6                	ld	s1,88(sp)
    151e:	6946                	ld	s2,80(sp)
    1520:	69a6                	ld	s3,72(sp)
    1522:	6a06                	ld	s4,64(sp)
    1524:	7ae2                	ld	s5,56(sp)
    1526:	7b42                	ld	s6,48(sp)
    1528:	614d                	addi	sp,sp,176
    152a:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    152c:	00064783          	lbu	a5,0(a2)
    1530:	84b2                	mv	s1,a2
    1532:	01278963          	beq	a5,s2,1544 <printf+0x1e6>
    1536:	b549                	j	13b8 <printf+0x5a>
    1538:	0024c783          	lbu	a5,2(s1)
    153c:	0605                	addi	a2,a2,1
    153e:	0489                	addi	s1,s1,2
    1540:	e7279ce3          	bne	a5,s2,13b8 <printf+0x5a>
    1544:	0014c783          	lbu	a5,1(s1)
    1548:	ff2788e3          	beq	a5,s2,1538 <printf+0x1da>
        l = z - a;
    154c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1550:	85aa                	mv	a1,a0
    1552:	8622                	mv	a2,s0
    1554:	4505                	li	a0,1
    1556:	75a000ef          	jal	ra,1cb0 <write>
        if (l)
    155a:	e60408e3          	beqz	s0,13ca <printf+0x6c>
    155e:	8526                	mv	a0,s1
    1560:	b581                	j	13a0 <printf+0x42>
        switch (s[1])
    1562:	07800713          	li	a4,120
    1566:	04e79963          	bne	a5,a4,15b8 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    156a:	6782                	ld	a5,0(sp)
    156c:	45c1                	li	a1,16
    156e:	4388                	lw	a0,0(a5)
    1570:	07a1                	addi	a5,a5,8
    1572:	e03e                	sd	a5,0(sp)
    1574:	b71ff0ef          	jal	ra,10e4 <printint.constprop.0>
        s += 2;
    1578:	00248513          	addi	a0,s1,2
    157c:	bf51                	j	1510 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    157e:	6782                	ld	a5,0(sp)
    1580:	45a9                	li	a1,10
    1582:	4388                	lw	a0,0(a5)
    1584:	07a1                	addi	a5,a5,8
    1586:	e03e                	sd	a5,0(sp)
    1588:	b5dff0ef          	jal	ra,10e4 <printint.constprop.0>
        s += 2;
    158c:	00248513          	addi	a0,s1,2
    1590:	b741                	j	1510 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1592:	6782                	ld	a5,0(sp)
    1594:	6380                	ld	s0,0(a5)
    1596:	07a1                	addi	a5,a5,8
    1598:	e03e                	sd	a5,0(sp)
    159a:	c031                	beqz	s0,15de <printf+0x280>
            l = strnlen(a, 200);
    159c:	0c800593          	li	a1,200
    15a0:	8522                	mv	a0,s0
    15a2:	40c000ef          	jal	ra,19ae <strnlen>
    write(f, s, l);
    15a6:	0005061b          	sext.w	a2,a0
    15aa:	85a2                	mv	a1,s0
    15ac:	4505                	li	a0,1
    15ae:	702000ef          	jal	ra,1cb0 <write>
        s += 2;
    15b2:	00248513          	addi	a0,s1,2
    15b6:	bfa9                	j	1510 <printf+0x1b2>
    return write(stdout, &byte, 1);
    15b8:	4605                	li	a2,1
    15ba:	002c                	addi	a1,sp,8
    15bc:	4505                	li	a0,1
    char byte = c;
    15be:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15c2:	6ee000ef          	jal	ra,1cb0 <write>
    char byte = c;
    15c6:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15ca:	4605                	li	a2,1
    15cc:	002c                	addi	a1,sp,8
    15ce:	4505                	li	a0,1
    char byte = c;
    15d0:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15d4:	6dc000ef          	jal	ra,1cb0 <write>
        s += 2;
    15d8:	00248513          	addi	a0,s1,2
    15dc:	bf15                	j	1510 <printf+0x1b2>
                a = "(null)";
    15de:	845a                	mv	s0,s6
    15e0:	bf75                	j	159c <printf+0x23e>

00000000000015e2 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15e2:	1141                	addi	sp,sp,-16
    15e4:	e406                	sd	ra,8(sp)
    puts(m);
    15e6:	d57ff0ef          	jal	ra,133c <puts>
    exit(-100);
}
    15ea:	60a2                	ld	ra,8(sp)
    exit(-100);
    15ec:	f9c00513          	li	a0,-100
}
    15f0:	0141                	addi	sp,sp,16
    exit(-100);
    15f2:	a739                	j	1d00 <exit>

00000000000015f4 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15f4:	02000793          	li	a5,32
    15f8:	00f50663          	beq	a0,a5,1604 <isspace+0x10>
    15fc:	355d                	addiw	a0,a0,-9
    15fe:	00553513          	sltiu	a0,a0,5
    1602:	8082                	ret
    1604:	4505                	li	a0,1
}
    1606:	8082                	ret

0000000000001608 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1608:	fd05051b          	addiw	a0,a0,-48
}
    160c:	00a53513          	sltiu	a0,a0,10
    1610:	8082                	ret

0000000000001612 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1612:	02000613          	li	a2,32
    1616:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1618:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    161c:	ff77869b          	addiw	a3,a5,-9
    1620:	04c78c63          	beq	a5,a2,1678 <atoi+0x66>
    1624:	0007871b          	sext.w	a4,a5
    1628:	04d5f863          	bgeu	a1,a3,1678 <atoi+0x66>
        s++;
    switch (*s)
    162c:	02b00693          	li	a3,43
    1630:	04d78963          	beq	a5,a3,1682 <atoi+0x70>
    1634:	02d00693          	li	a3,45
    1638:	06d78263          	beq	a5,a3,169c <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    163c:	fd07061b          	addiw	a2,a4,-48
    1640:	47a5                	li	a5,9
    1642:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1644:	4e01                	li	t3,0
    while (isdigit(*s))
    1646:	04c7e963          	bltu	a5,a2,1698 <atoi+0x86>
    int n = 0, neg = 0;
    164a:	4501                	li	a0,0
    while (isdigit(*s))
    164c:	4825                	li	a6,9
    164e:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    1652:	0025179b          	slliw	a5,a0,0x2
    1656:	9fa9                	addw	a5,a5,a0
    1658:	fd07031b          	addiw	t1,a4,-48
    165c:	0017989b          	slliw	a7,a5,0x1
    while (isdigit(*s))
    1660:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1664:	0685                	addi	a3,a3,1
    1666:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    166a:	0006071b          	sext.w	a4,a2
    166e:	feb870e3          	bgeu	a6,a1,164e <atoi+0x3c>
    return neg ? n : -n;
    1672:	000e0563          	beqz	t3,167c <atoi+0x6a>
}
    1676:	8082                	ret
        s++;
    1678:	0505                	addi	a0,a0,1
    167a:	bf79                	j	1618 <atoi+0x6>
    return neg ? n : -n;
    167c:	4113053b          	subw	a0,t1,a7
    1680:	8082                	ret
    while (isdigit(*s))
    1682:	00154703          	lbu	a4,1(a0)
    1686:	47a5                	li	a5,9
        s++;
    1688:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    168c:	fd07061b          	addiw	a2,a4,-48
    int n = 0, neg = 0;
    1690:	4e01                	li	t3,0
    while (isdigit(*s))
    1692:	2701                	sext.w	a4,a4
    1694:	fac7fbe3          	bgeu	a5,a2,164a <atoi+0x38>
    1698:	4501                	li	a0,0
}
    169a:	8082                	ret
    while (isdigit(*s))
    169c:	00154703          	lbu	a4,1(a0)
    16a0:	47a5                	li	a5,9
        s++;
    16a2:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    16a6:	fd07061b          	addiw	a2,a4,-48
    16aa:	2701                	sext.w	a4,a4
    16ac:	fec7e6e3          	bltu	a5,a2,1698 <atoi+0x86>
        neg = 1;
    16b0:	4e05                	li	t3,1
    16b2:	bf61                	j	164a <atoi+0x38>

00000000000016b4 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16b4:	16060d63          	beqz	a2,182e <memset+0x17a>
    16b8:	40a007b3          	neg	a5,a0
    16bc:	8b9d                	andi	a5,a5,7
    16be:	00778693          	addi	a3,a5,7
    16c2:	482d                	li	a6,11
    16c4:	0ff5f713          	zext.b	a4,a1
    16c8:	fff60593          	addi	a1,a2,-1
    16cc:	1706e263          	bltu	a3,a6,1830 <memset+0x17c>
    16d0:	16d5ea63          	bltu	a1,a3,1844 <memset+0x190>
    16d4:	16078563          	beqz	a5,183e <memset+0x18a>
    16d8:	00e50023          	sb	a4,0(a0)
    16dc:	4685                	li	a3,1
    16de:	00150593          	addi	a1,a0,1
    16e2:	14d78c63          	beq	a5,a3,183a <memset+0x186>
    16e6:	00e500a3          	sb	a4,1(a0)
    16ea:	4689                	li	a3,2
    16ec:	00250593          	addi	a1,a0,2
    16f0:	14d78d63          	beq	a5,a3,184a <memset+0x196>
    16f4:	00e50123          	sb	a4,2(a0)
    16f8:	468d                	li	a3,3
    16fa:	00350593          	addi	a1,a0,3
    16fe:	12d78b63          	beq	a5,a3,1834 <memset+0x180>
    1702:	00e501a3          	sb	a4,3(a0)
    1706:	4691                	li	a3,4
    1708:	00450593          	addi	a1,a0,4
    170c:	14d78163          	beq	a5,a3,184e <memset+0x19a>
    1710:	00e50223          	sb	a4,4(a0)
    1714:	4695                	li	a3,5
    1716:	00550593          	addi	a1,a0,5
    171a:	12d78c63          	beq	a5,a3,1852 <memset+0x19e>
    171e:	00e502a3          	sb	a4,5(a0)
    1722:	469d                	li	a3,7
    1724:	00650593          	addi	a1,a0,6
    1728:	12d79763          	bne	a5,a3,1856 <memset+0x1a2>
    172c:	00750593          	addi	a1,a0,7
    1730:	00e50323          	sb	a4,6(a0)
    1734:	481d                	li	a6,7
    1736:	00871693          	slli	a3,a4,0x8
    173a:	01071893          	slli	a7,a4,0x10
    173e:	8ed9                	or	a3,a3,a4
    1740:	01871313          	slli	t1,a4,0x18
    1744:	0116e6b3          	or	a3,a3,a7
    1748:	0066e6b3          	or	a3,a3,t1
    174c:	02071893          	slli	a7,a4,0x20
    1750:	02871e13          	slli	t3,a4,0x28
    1754:	0116e6b3          	or	a3,a3,a7
    1758:	40f60333          	sub	t1,a2,a5
    175c:	03071893          	slli	a7,a4,0x30
    1760:	01c6e6b3          	or	a3,a3,t3
    1764:	0116e6b3          	or	a3,a3,a7
    1768:	03871e13          	slli	t3,a4,0x38
    176c:	97aa                	add	a5,a5,a0
    176e:	ff837893          	andi	a7,t1,-8
    1772:	01c6e6b3          	or	a3,a3,t3
    1776:	98be                	add	a7,a7,a5
    1778:	e394                	sd	a3,0(a5)
    177a:	07a1                	addi	a5,a5,8
    177c:	ff179ee3          	bne	a5,a7,1778 <memset+0xc4>
    1780:	ff837893          	andi	a7,t1,-8
    1784:	011587b3          	add	a5,a1,a7
    1788:	010886bb          	addw	a3,a7,a6
    178c:	0b130663          	beq	t1,a7,1838 <memset+0x184>
    1790:	00e78023          	sb	a4,0(a5)
    1794:	0016859b          	addiw	a1,a3,1
    1798:	08c5fb63          	bgeu	a1,a2,182e <memset+0x17a>
    179c:	00e780a3          	sb	a4,1(a5)
    17a0:	0026859b          	addiw	a1,a3,2
    17a4:	08c5f563          	bgeu	a1,a2,182e <memset+0x17a>
    17a8:	00e78123          	sb	a4,2(a5)
    17ac:	0036859b          	addiw	a1,a3,3
    17b0:	06c5ff63          	bgeu	a1,a2,182e <memset+0x17a>
    17b4:	00e781a3          	sb	a4,3(a5)
    17b8:	0046859b          	addiw	a1,a3,4
    17bc:	06c5f963          	bgeu	a1,a2,182e <memset+0x17a>
    17c0:	00e78223          	sb	a4,4(a5)
    17c4:	0056859b          	addiw	a1,a3,5
    17c8:	06c5f363          	bgeu	a1,a2,182e <memset+0x17a>
    17cc:	00e782a3          	sb	a4,5(a5)
    17d0:	0066859b          	addiw	a1,a3,6
    17d4:	04c5fd63          	bgeu	a1,a2,182e <memset+0x17a>
    17d8:	00e78323          	sb	a4,6(a5)
    17dc:	0076859b          	addiw	a1,a3,7
    17e0:	04c5f763          	bgeu	a1,a2,182e <memset+0x17a>
    17e4:	00e783a3          	sb	a4,7(a5)
    17e8:	0086859b          	addiw	a1,a3,8
    17ec:	04c5f163          	bgeu	a1,a2,182e <memset+0x17a>
    17f0:	00e78423          	sb	a4,8(a5)
    17f4:	0096859b          	addiw	a1,a3,9
    17f8:	02c5fb63          	bgeu	a1,a2,182e <memset+0x17a>
    17fc:	00e784a3          	sb	a4,9(a5)
    1800:	00a6859b          	addiw	a1,a3,10
    1804:	02c5f563          	bgeu	a1,a2,182e <memset+0x17a>
    1808:	00e78523          	sb	a4,10(a5)
    180c:	00b6859b          	addiw	a1,a3,11
    1810:	00c5ff63          	bgeu	a1,a2,182e <memset+0x17a>
    1814:	00e785a3          	sb	a4,11(a5)
    1818:	00c6859b          	addiw	a1,a3,12
    181c:	00c5f963          	bgeu	a1,a2,182e <memset+0x17a>
    1820:	00e78623          	sb	a4,12(a5)
    1824:	26b5                	addiw	a3,a3,13
    1826:	00c6f463          	bgeu	a3,a2,182e <memset+0x17a>
    182a:	00e786a3          	sb	a4,13(a5)
        ;
    return dest;
}
    182e:	8082                	ret
    1830:	46ad                	li	a3,11
    1832:	bd79                	j	16d0 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1834:	480d                	li	a6,3
    1836:	b701                	j	1736 <memset+0x82>
    1838:	8082                	ret
    183a:	4805                	li	a6,1
    183c:	bded                	j	1736 <memset+0x82>
    183e:	85aa                	mv	a1,a0
    1840:	4801                	li	a6,0
    1842:	bdd5                	j	1736 <memset+0x82>
    1844:	87aa                	mv	a5,a0
    1846:	4681                	li	a3,0
    1848:	b7a1                	j	1790 <memset+0xdc>
    184a:	4809                	li	a6,2
    184c:	b5ed                	j	1736 <memset+0x82>
    184e:	4811                	li	a6,4
    1850:	b5dd                	j	1736 <memset+0x82>
    1852:	4815                	li	a6,5
    1854:	b5cd                	j	1736 <memset+0x82>
    1856:	4819                	li	a6,6
    1858:	bdf9                	j	1736 <memset+0x82>

000000000000185a <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    185a:	00054783          	lbu	a5,0(a0)
    185e:	0005c703          	lbu	a4,0(a1)
    1862:	00e79863          	bne	a5,a4,1872 <strcmp+0x18>
    1866:	0505                	addi	a0,a0,1
    1868:	0585                	addi	a1,a1,1
    186a:	fbe5                	bnez	a5,185a <strcmp>
    186c:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    186e:	9d19                	subw	a0,a0,a4
    1870:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1872:	0007851b          	sext.w	a0,a5
    1876:	bfe5                	j	186e <strcmp+0x14>

0000000000001878 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1878:	ca15                	beqz	a2,18ac <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    187a:	00054783          	lbu	a5,0(a0)
    if (!n--)
    187e:	167d                	addi	a2,a2,-1
    1880:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1884:	eb99                	bnez	a5,189a <strncmp+0x22>
    1886:	a815                	j	18ba <strncmp+0x42>
    1888:	00a68e63          	beq	a3,a0,18a4 <strncmp+0x2c>
    188c:	0505                	addi	a0,a0,1
    188e:	00f71b63          	bne	a4,a5,18a4 <strncmp+0x2c>
    1892:	00054783          	lbu	a5,0(a0)
    1896:	cf89                	beqz	a5,18b0 <strncmp+0x38>
    1898:	85b2                	mv	a1,a2
    189a:	0005c703          	lbu	a4,0(a1)
    189e:	00158613          	addi	a2,a1,1
    18a2:	f37d                	bnez	a4,1888 <strncmp+0x10>
        ;
    return *l - *r;
    18a4:	0007851b          	sext.w	a0,a5
    18a8:	9d19                	subw	a0,a0,a4
    18aa:	8082                	ret
        return 0;
    18ac:	4501                	li	a0,0
}
    18ae:	8082                	ret
    return *l - *r;
    18b0:	0015c703          	lbu	a4,1(a1)
    18b4:	4501                	li	a0,0
    18b6:	9d19                	subw	a0,a0,a4
    18b8:	8082                	ret
    18ba:	0005c703          	lbu	a4,0(a1)
    18be:	4501                	li	a0,0
    18c0:	b7e5                	j	18a8 <strncmp+0x30>

00000000000018c2 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18c2:	00757793          	andi	a5,a0,7
    18c6:	cf89                	beqz	a5,18e0 <strlen+0x1e>
    18c8:	87aa                	mv	a5,a0
    18ca:	a029                	j	18d4 <strlen+0x12>
    18cc:	0785                	addi	a5,a5,1
    18ce:	0077f713          	andi	a4,a5,7
    18d2:	cb01                	beqz	a4,18e2 <strlen+0x20>
        if (!*s)
    18d4:	0007c703          	lbu	a4,0(a5)
    18d8:	fb75                	bnez	a4,18cc <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18da:	40a78533          	sub	a0,a5,a0
}
    18de:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18e0:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18e2:	6394                	ld	a3,0(a5)
    18e4:	00000597          	auipc	a1,0x0
    18e8:	6e45b583          	ld	a1,1764(a1) # 1fc8 <__clone+0xe0>
    18ec:	00000617          	auipc	a2,0x0
    18f0:	6e463603          	ld	a2,1764(a2) # 1fd0 <__clone+0xe8>
    18f4:	a019                	j	18fa <strlen+0x38>
    18f6:	6794                	ld	a3,8(a5)
    18f8:	07a1                	addi	a5,a5,8
    18fa:	00b68733          	add	a4,a3,a1
    18fe:	fff6c693          	not	a3,a3
    1902:	8f75                	and	a4,a4,a3
    1904:	8f71                	and	a4,a4,a2
    1906:	db65                	beqz	a4,18f6 <strlen+0x34>
    for (; *s; s++)
    1908:	0007c703          	lbu	a4,0(a5)
    190c:	d779                	beqz	a4,18da <strlen+0x18>
    190e:	0017c703          	lbu	a4,1(a5)
    1912:	0785                	addi	a5,a5,1
    1914:	d379                	beqz	a4,18da <strlen+0x18>
    1916:	0017c703          	lbu	a4,1(a5)
    191a:	0785                	addi	a5,a5,1
    191c:	fb6d                	bnez	a4,190e <strlen+0x4c>
    191e:	bf75                	j	18da <strlen+0x18>

0000000000001920 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1920:	00757713          	andi	a4,a0,7
{
    1924:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1926:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    192a:	cb19                	beqz	a4,1940 <memchr+0x20>
    192c:	ce25                	beqz	a2,19a4 <memchr+0x84>
    192e:	0007c703          	lbu	a4,0(a5)
    1932:	04b70e63          	beq	a4,a1,198e <memchr+0x6e>
    1936:	0785                	addi	a5,a5,1
    1938:	0077f713          	andi	a4,a5,7
    193c:	167d                	addi	a2,a2,-1
    193e:	f77d                	bnez	a4,192c <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1940:	4501                	li	a0,0
    if (n && *s != c)
    1942:	c235                	beqz	a2,19a6 <memchr+0x86>
    1944:	0007c703          	lbu	a4,0(a5)
    1948:	04b70363          	beq	a4,a1,198e <memchr+0x6e>
        size_t k = ONES * c;
    194c:	00000517          	auipc	a0,0x0
    1950:	68c53503          	ld	a0,1676(a0) # 1fd8 <__clone+0xf0>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1954:	471d                	li	a4,7
        size_t k = ONES * c;
    1956:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    195a:	02c77a63          	bgeu	a4,a2,198e <memchr+0x6e>
    195e:	00000897          	auipc	a7,0x0
    1962:	66a8b883          	ld	a7,1642(a7) # 1fc8 <__clone+0xe0>
    1966:	00000817          	auipc	a6,0x0
    196a:	66a83803          	ld	a6,1642(a6) # 1fd0 <__clone+0xe8>
    196e:	431d                	li	t1,7
    1970:	a029                	j	197a <memchr+0x5a>
    1972:	1661                	addi	a2,a2,-8
    1974:	07a1                	addi	a5,a5,8
    1976:	02c37963          	bgeu	t1,a2,19a8 <memchr+0x88>
    197a:	6398                	ld	a4,0(a5)
    197c:	8f29                	xor	a4,a4,a0
    197e:	011706b3          	add	a3,a4,a7
    1982:	fff74713          	not	a4,a4
    1986:	8f75                	and	a4,a4,a3
    1988:	01077733          	and	a4,a4,a6
    198c:	d37d                	beqz	a4,1972 <memchr+0x52>
{
    198e:	853e                	mv	a0,a5
    1990:	97b2                	add	a5,a5,a2
    1992:	a021                	j	199a <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1994:	0505                	addi	a0,a0,1
    1996:	00f50763          	beq	a0,a5,19a4 <memchr+0x84>
    199a:	00054703          	lbu	a4,0(a0)
    199e:	feb71be3          	bne	a4,a1,1994 <memchr+0x74>
    19a2:	8082                	ret
    return n ? (void *)s : 0;
    19a4:	4501                	li	a0,0
}
    19a6:	8082                	ret
    return n ? (void *)s : 0;
    19a8:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    19aa:	f275                	bnez	a2,198e <memchr+0x6e>
}
    19ac:	8082                	ret

00000000000019ae <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19ae:	1101                	addi	sp,sp,-32
    19b0:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19b2:	862e                	mv	a2,a1
{
    19b4:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19b6:	4581                	li	a1,0
{
    19b8:	e426                	sd	s1,8(sp)
    19ba:	ec06                	sd	ra,24(sp)
    19bc:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19be:	f63ff0ef          	jal	ra,1920 <memchr>
    return p ? p - s : n;
    19c2:	c519                	beqz	a0,19d0 <strnlen+0x22>
}
    19c4:	60e2                	ld	ra,24(sp)
    19c6:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19c8:	8d05                	sub	a0,a0,s1
}
    19ca:	64a2                	ld	s1,8(sp)
    19cc:	6105                	addi	sp,sp,32
    19ce:	8082                	ret
    19d0:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19d2:	8522                	mv	a0,s0
}
    19d4:	6442                	ld	s0,16(sp)
    19d6:	64a2                	ld	s1,8(sp)
    19d8:	6105                	addi	sp,sp,32
    19da:	8082                	ret

00000000000019dc <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19dc:	00a5c7b3          	xor	a5,a1,a0
    19e0:	8b9d                	andi	a5,a5,7
    19e2:	eb95                	bnez	a5,1a16 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19e4:	0075f793          	andi	a5,a1,7
    19e8:	e7b1                	bnez	a5,1a34 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19ea:	6198                	ld	a4,0(a1)
    19ec:	00000617          	auipc	a2,0x0
    19f0:	5dc63603          	ld	a2,1500(a2) # 1fc8 <__clone+0xe0>
    19f4:	00000817          	auipc	a6,0x0
    19f8:	5dc83803          	ld	a6,1500(a6) # 1fd0 <__clone+0xe8>
    19fc:	a029                	j	1a06 <strcpy+0x2a>
    19fe:	05a1                	addi	a1,a1,8
    1a00:	e118                	sd	a4,0(a0)
    1a02:	6198                	ld	a4,0(a1)
    1a04:	0521                	addi	a0,a0,8
    1a06:	00c707b3          	add	a5,a4,a2
    1a0a:	fff74693          	not	a3,a4
    1a0e:	8ff5                	and	a5,a5,a3
    1a10:	0107f7b3          	and	a5,a5,a6
    1a14:	d7ed                	beqz	a5,19fe <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a16:	0005c783          	lbu	a5,0(a1)
    1a1a:	00f50023          	sb	a5,0(a0)
    1a1e:	c785                	beqz	a5,1a46 <strcpy+0x6a>
    1a20:	0015c783          	lbu	a5,1(a1)
    1a24:	0505                	addi	a0,a0,1
    1a26:	0585                	addi	a1,a1,1
    1a28:	00f50023          	sb	a5,0(a0)
    1a2c:	fbf5                	bnez	a5,1a20 <strcpy+0x44>
        ;
    return d;
}
    1a2e:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a30:	0505                	addi	a0,a0,1
    1a32:	df45                	beqz	a4,19ea <strcpy+0xe>
            if (!(*d = *s))
    1a34:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a38:	0585                	addi	a1,a1,1
    1a3a:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1a3e:	00f50023          	sb	a5,0(a0)
    1a42:	f7fd                	bnez	a5,1a30 <strcpy+0x54>
}
    1a44:	8082                	ret
    1a46:	8082                	ret

0000000000001a48 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a48:	00a5c7b3          	xor	a5,a1,a0
    1a4c:	8b9d                	andi	a5,a5,7
    1a4e:	1a079863          	bnez	a5,1bfe <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a52:	0075f793          	andi	a5,a1,7
    1a56:	16078463          	beqz	a5,1bbe <strncpy+0x176>
    1a5a:	ea01                	bnez	a2,1a6a <strncpy+0x22>
    1a5c:	a421                	j	1c64 <strncpy+0x21c>
    1a5e:	167d                	addi	a2,a2,-1
    1a60:	0505                	addi	a0,a0,1
    1a62:	14070e63          	beqz	a4,1bbe <strncpy+0x176>
    1a66:	1a060863          	beqz	a2,1c16 <strncpy+0x1ce>
    1a6a:	0005c783          	lbu	a5,0(a1)
    1a6e:	0585                	addi	a1,a1,1
    1a70:	0075f713          	andi	a4,a1,7
    1a74:	00f50023          	sb	a5,0(a0)
    1a78:	f3fd                	bnez	a5,1a5e <strncpy+0x16>
    1a7a:	4805                	li	a6,1
    1a7c:	1a061863          	bnez	a2,1c2c <strncpy+0x1e4>
    1a80:	40a007b3          	neg	a5,a0
    1a84:	8b9d                	andi	a5,a5,7
    1a86:	4681                	li	a3,0
    1a88:	18061a63          	bnez	a2,1c1c <strncpy+0x1d4>
    1a8c:	00778713          	addi	a4,a5,7
    1a90:	45ad                	li	a1,11
    1a92:	18b76363          	bltu	a4,a1,1c18 <strncpy+0x1d0>
    1a96:	1ae6eb63          	bltu	a3,a4,1c4c <strncpy+0x204>
    1a9a:	1a078363          	beqz	a5,1c40 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a9e:	00050023          	sb	zero,0(a0)
    1aa2:	4685                	li	a3,1
    1aa4:	00150713          	addi	a4,a0,1
    1aa8:	18d78f63          	beq	a5,a3,1c46 <strncpy+0x1fe>
    1aac:	000500a3          	sb	zero,1(a0)
    1ab0:	4689                	li	a3,2
    1ab2:	00250713          	addi	a4,a0,2
    1ab6:	18d78e63          	beq	a5,a3,1c52 <strncpy+0x20a>
    1aba:	00050123          	sb	zero,2(a0)
    1abe:	468d                	li	a3,3
    1ac0:	00350713          	addi	a4,a0,3
    1ac4:	16d78c63          	beq	a5,a3,1c3c <strncpy+0x1f4>
    1ac8:	000501a3          	sb	zero,3(a0)
    1acc:	4691                	li	a3,4
    1ace:	00450713          	addi	a4,a0,4
    1ad2:	18d78263          	beq	a5,a3,1c56 <strncpy+0x20e>
    1ad6:	00050223          	sb	zero,4(a0)
    1ada:	4695                	li	a3,5
    1adc:	00550713          	addi	a4,a0,5
    1ae0:	16d78d63          	beq	a5,a3,1c5a <strncpy+0x212>
    1ae4:	000502a3          	sb	zero,5(a0)
    1ae8:	469d                	li	a3,7
    1aea:	00650713          	addi	a4,a0,6
    1aee:	16d79863          	bne	a5,a3,1c5e <strncpy+0x216>
    1af2:	00750713          	addi	a4,a0,7
    1af6:	00050323          	sb	zero,6(a0)
    1afa:	40f80833          	sub	a6,a6,a5
    1afe:	ff887593          	andi	a1,a6,-8
    1b02:	97aa                	add	a5,a5,a0
    1b04:	95be                	add	a1,a1,a5
    1b06:	0007b023          	sd	zero,0(a5)
    1b0a:	07a1                	addi	a5,a5,8
    1b0c:	feb79de3          	bne	a5,a1,1b06 <strncpy+0xbe>
    1b10:	ff887593          	andi	a1,a6,-8
    1b14:	9ead                	addw	a3,a3,a1
    1b16:	00b707b3          	add	a5,a4,a1
    1b1a:	12b80863          	beq	a6,a1,1c4a <strncpy+0x202>
    1b1e:	00078023          	sb	zero,0(a5)
    1b22:	0016871b          	addiw	a4,a3,1
    1b26:	0ec77863          	bgeu	a4,a2,1c16 <strncpy+0x1ce>
    1b2a:	000780a3          	sb	zero,1(a5)
    1b2e:	0026871b          	addiw	a4,a3,2
    1b32:	0ec77263          	bgeu	a4,a2,1c16 <strncpy+0x1ce>
    1b36:	00078123          	sb	zero,2(a5)
    1b3a:	0036871b          	addiw	a4,a3,3
    1b3e:	0cc77c63          	bgeu	a4,a2,1c16 <strncpy+0x1ce>
    1b42:	000781a3          	sb	zero,3(a5)
    1b46:	0046871b          	addiw	a4,a3,4
    1b4a:	0cc77663          	bgeu	a4,a2,1c16 <strncpy+0x1ce>
    1b4e:	00078223          	sb	zero,4(a5)
    1b52:	0056871b          	addiw	a4,a3,5
    1b56:	0cc77063          	bgeu	a4,a2,1c16 <strncpy+0x1ce>
    1b5a:	000782a3          	sb	zero,5(a5)
    1b5e:	0066871b          	addiw	a4,a3,6
    1b62:	0ac77a63          	bgeu	a4,a2,1c16 <strncpy+0x1ce>
    1b66:	00078323          	sb	zero,6(a5)
    1b6a:	0076871b          	addiw	a4,a3,7
    1b6e:	0ac77463          	bgeu	a4,a2,1c16 <strncpy+0x1ce>
    1b72:	000783a3          	sb	zero,7(a5)
    1b76:	0086871b          	addiw	a4,a3,8
    1b7a:	08c77e63          	bgeu	a4,a2,1c16 <strncpy+0x1ce>
    1b7e:	00078423          	sb	zero,8(a5)
    1b82:	0096871b          	addiw	a4,a3,9
    1b86:	08c77863          	bgeu	a4,a2,1c16 <strncpy+0x1ce>
    1b8a:	000784a3          	sb	zero,9(a5)
    1b8e:	00a6871b          	addiw	a4,a3,10
    1b92:	08c77263          	bgeu	a4,a2,1c16 <strncpy+0x1ce>
    1b96:	00078523          	sb	zero,10(a5)
    1b9a:	00b6871b          	addiw	a4,a3,11
    1b9e:	06c77c63          	bgeu	a4,a2,1c16 <strncpy+0x1ce>
    1ba2:	000785a3          	sb	zero,11(a5)
    1ba6:	00c6871b          	addiw	a4,a3,12
    1baa:	06c77663          	bgeu	a4,a2,1c16 <strncpy+0x1ce>
    1bae:	00078623          	sb	zero,12(a5)
    1bb2:	26b5                	addiw	a3,a3,13
    1bb4:	06c6f163          	bgeu	a3,a2,1c16 <strncpy+0x1ce>
    1bb8:	000786a3          	sb	zero,13(a5)
    1bbc:	8082                	ret
            ;
        if (!n || !*s)
    1bbe:	c645                	beqz	a2,1c66 <strncpy+0x21e>
    1bc0:	0005c783          	lbu	a5,0(a1)
    1bc4:	ea078be3          	beqz	a5,1a7a <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bc8:	479d                	li	a5,7
    1bca:	02c7ff63          	bgeu	a5,a2,1c08 <strncpy+0x1c0>
    1bce:	00000897          	auipc	a7,0x0
    1bd2:	3fa8b883          	ld	a7,1018(a7) # 1fc8 <__clone+0xe0>
    1bd6:	00000817          	auipc	a6,0x0
    1bda:	3fa83803          	ld	a6,1018(a6) # 1fd0 <__clone+0xe8>
    1bde:	431d                	li	t1,7
    1be0:	6198                	ld	a4,0(a1)
    1be2:	011707b3          	add	a5,a4,a7
    1be6:	fff74693          	not	a3,a4
    1bea:	8ff5                	and	a5,a5,a3
    1bec:	0107f7b3          	and	a5,a5,a6
    1bf0:	ef81                	bnez	a5,1c08 <strncpy+0x1c0>
            *wd = *ws;
    1bf2:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bf4:	1661                	addi	a2,a2,-8
    1bf6:	05a1                	addi	a1,a1,8
    1bf8:	0521                	addi	a0,a0,8
    1bfa:	fec363e3          	bltu	t1,a2,1be0 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1bfe:	e609                	bnez	a2,1c08 <strncpy+0x1c0>
    1c00:	a08d                	j	1c62 <strncpy+0x21a>
    1c02:	167d                	addi	a2,a2,-1
    1c04:	0505                	addi	a0,a0,1
    1c06:	ca01                	beqz	a2,1c16 <strncpy+0x1ce>
    1c08:	0005c783          	lbu	a5,0(a1)
    1c0c:	0585                	addi	a1,a1,1
    1c0e:	00f50023          	sb	a5,0(a0)
    1c12:	fbe5                	bnez	a5,1c02 <strncpy+0x1ba>
        ;
tail:
    1c14:	b59d                	j	1a7a <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1c16:	8082                	ret
    1c18:	472d                	li	a4,11
    1c1a:	bdb5                	j	1a96 <strncpy+0x4e>
    1c1c:	00778713          	addi	a4,a5,7
    1c20:	45ad                	li	a1,11
    1c22:	fff60693          	addi	a3,a2,-1
    1c26:	e6b778e3          	bgeu	a4,a1,1a96 <strncpy+0x4e>
    1c2a:	b7fd                	j	1c18 <strncpy+0x1d0>
    1c2c:	40a007b3          	neg	a5,a0
    1c30:	8832                	mv	a6,a2
    1c32:	8b9d                	andi	a5,a5,7
    1c34:	4681                	li	a3,0
    1c36:	e4060be3          	beqz	a2,1a8c <strncpy+0x44>
    1c3a:	b7cd                	j	1c1c <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c3c:	468d                	li	a3,3
    1c3e:	bd75                	j	1afa <strncpy+0xb2>
    1c40:	872a                	mv	a4,a0
    1c42:	4681                	li	a3,0
    1c44:	bd5d                	j	1afa <strncpy+0xb2>
    1c46:	4685                	li	a3,1
    1c48:	bd4d                	j	1afa <strncpy+0xb2>
    1c4a:	8082                	ret
    1c4c:	87aa                	mv	a5,a0
    1c4e:	4681                	li	a3,0
    1c50:	b5f9                	j	1b1e <strncpy+0xd6>
    1c52:	4689                	li	a3,2
    1c54:	b55d                	j	1afa <strncpy+0xb2>
    1c56:	4691                	li	a3,4
    1c58:	b54d                	j	1afa <strncpy+0xb2>
    1c5a:	4695                	li	a3,5
    1c5c:	bd79                	j	1afa <strncpy+0xb2>
    1c5e:	4699                	li	a3,6
    1c60:	bd69                	j	1afa <strncpy+0xb2>
    1c62:	8082                	ret
    1c64:	8082                	ret
    1c66:	8082                	ret

0000000000001c68 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c68:	87aa                	mv	a5,a0
    1c6a:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c6c:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c70:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c74:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c76:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c78:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c7c:	2501                	sext.w	a0,a0
    1c7e:	8082                	ret

0000000000001c80 <openat>:
    register long a7 __asm__("a7") = n;
    1c80:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c84:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c88:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c8c:	2501                	sext.w	a0,a0
    1c8e:	8082                	ret

0000000000001c90 <fcntl>:
    register long a7 __asm__("a7") = n;
    1c90:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c92:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1c96:	2501                	sext.w	a0,a0
    1c98:	8082                	ret

0000000000001c9a <close>:
    register long a7 __asm__("a7") = n;
    1c9a:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c9e:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1ca2:	2501                	sext.w	a0,a0
    1ca4:	8082                	ret

0000000000001ca6 <read>:
    register long a7 __asm__("a7") = n;
    1ca6:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1caa:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1cae:	8082                	ret

0000000000001cb0 <write>:
    register long a7 __asm__("a7") = n;
    1cb0:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cb4:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1cb8:	8082                	ret

0000000000001cba <getpid>:
    register long a7 __asm__("a7") = n;
    1cba:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1cbe:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1cc2:	2501                	sext.w	a0,a0
    1cc4:	8082                	ret

0000000000001cc6 <getppid>:
    register long a7 __asm__("a7") = n;
    1cc6:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1cca:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cce:	2501                	sext.w	a0,a0
    1cd0:	8082                	ret

0000000000001cd2 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cd2:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cd6:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cda:	2501                	sext.w	a0,a0
    1cdc:	8082                	ret

0000000000001cde <fork>:
    register long a7 __asm__("a7") = n;
    1cde:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1ce2:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1ce4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ce6:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cea:	2501                	sext.w	a0,a0
    1cec:	8082                	ret

0000000000001cee <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cee:	85b2                	mv	a1,a2
    1cf0:	863a                	mv	a2,a4
    if (stack)
    1cf2:	c191                	beqz	a1,1cf6 <clone+0x8>
	stack += stack_size;
    1cf4:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cf6:	4781                	li	a5,0
    1cf8:	4701                	li	a4,0
    1cfa:	4681                	li	a3,0
    1cfc:	2601                	sext.w	a2,a2
    1cfe:	a2ed                	j	1ee8 <__clone>

0000000000001d00 <exit>:
    register long a7 __asm__("a7") = n;
    1d00:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d04:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d08:	8082                	ret

0000000000001d0a <waitpid>:
    register long a7 __asm__("a7") = n;
    1d0a:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d0e:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d10:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d14:	2501                	sext.w	a0,a0
    1d16:	8082                	ret

0000000000001d18 <exec>:
    register long a7 __asm__("a7") = n;
    1d18:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d1c:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d20:	2501                	sext.w	a0,a0
    1d22:	8082                	ret

0000000000001d24 <execve>:
    register long a7 __asm__("a7") = n;
    1d24:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d28:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d2c:	2501                	sext.w	a0,a0
    1d2e:	8082                	ret

0000000000001d30 <times>:
    register long a7 __asm__("a7") = n;
    1d30:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d34:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d38:	2501                	sext.w	a0,a0
    1d3a:	8082                	ret

0000000000001d3c <get_time>:

int64 get_time()
{
    1d3c:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d3e:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d42:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d44:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d46:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d4a:	2501                	sext.w	a0,a0
    1d4c:	ed09                	bnez	a0,1d66 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d4e:	67a2                	ld	a5,8(sp)
    1d50:	3e800713          	li	a4,1000
    1d54:	00015503          	lhu	a0,0(sp)
    1d58:	02e7d7b3          	divu	a5,a5,a4
    1d5c:	02e50533          	mul	a0,a0,a4
    1d60:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d62:	0141                	addi	sp,sp,16
    1d64:	8082                	ret
        return -1;
    1d66:	557d                	li	a0,-1
    1d68:	bfed                	j	1d62 <get_time+0x26>

0000000000001d6a <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d6a:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d6e:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d72:	2501                	sext.w	a0,a0
    1d74:	8082                	ret

0000000000001d76 <time>:
    register long a7 __asm__("a7") = n;
    1d76:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d7a:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d7e:	2501                	sext.w	a0,a0
    1d80:	8082                	ret

0000000000001d82 <sleep>:

int sleep(unsigned long long time)
{
    1d82:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d84:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d86:	850a                	mv	a0,sp
    1d88:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d8a:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d8e:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d90:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d94:	e501                	bnez	a0,1d9c <sleep+0x1a>
    return 0;
    1d96:	4501                	li	a0,0
}
    1d98:	0141                	addi	sp,sp,16
    1d9a:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d9c:	4502                	lw	a0,0(sp)
}
    1d9e:	0141                	addi	sp,sp,16
    1da0:	8082                	ret

0000000000001da2 <set_priority>:
    register long a7 __asm__("a7") = n;
    1da2:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1da6:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1daa:	2501                	sext.w	a0,a0
    1dac:	8082                	ret

0000000000001dae <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1dae:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1db2:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1db6:	8082                	ret

0000000000001db8 <munmap>:
    register long a7 __asm__("a7") = n;
    1db8:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dbc:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1dc0:	2501                	sext.w	a0,a0
    1dc2:	8082                	ret

0000000000001dc4 <wait>:

int wait(int *code)
{
    1dc4:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dc6:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1dca:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1dcc:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1dce:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dd0:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1dd4:	2501                	sext.w	a0,a0
    1dd6:	8082                	ret

0000000000001dd8 <spawn>:
    register long a7 __asm__("a7") = n;
    1dd8:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1ddc:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1de0:	2501                	sext.w	a0,a0
    1de2:	8082                	ret

0000000000001de4 <mailread>:
    register long a7 __asm__("a7") = n;
    1de4:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1de8:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dec:	2501                	sext.w	a0,a0
    1dee:	8082                	ret

0000000000001df0 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1df0:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df4:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1df8:	2501                	sext.w	a0,a0
    1dfa:	8082                	ret

0000000000001dfc <fstat>:
    register long a7 __asm__("a7") = n;
    1dfc:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e00:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e04:	2501                	sext.w	a0,a0
    1e06:	8082                	ret

0000000000001e08 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e08:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e0a:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e0e:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e10:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e14:	2501                	sext.w	a0,a0
    1e16:	8082                	ret

0000000000001e18 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e18:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e1a:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e1e:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e20:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e24:	2501                	sext.w	a0,a0
    1e26:	8082                	ret

0000000000001e28 <link>:

int link(char *old_path, char *new_path)
{
    1e28:	87aa                	mv	a5,a0
    1e2a:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e2c:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e30:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e34:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e36:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e3a:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e3c:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e40:	2501                	sext.w	a0,a0
    1e42:	8082                	ret

0000000000001e44 <unlink>:

int unlink(char *path)
{
    1e44:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e46:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e4a:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e4e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e50:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e54:	2501                	sext.w	a0,a0
    1e56:	8082                	ret

0000000000001e58 <uname>:
    register long a7 __asm__("a7") = n;
    1e58:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e5c:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e60:	2501                	sext.w	a0,a0
    1e62:	8082                	ret

0000000000001e64 <brk>:
    register long a7 __asm__("a7") = n;
    1e64:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e68:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e6c:	2501                	sext.w	a0,a0
    1e6e:	8082                	ret

0000000000001e70 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e70:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e72:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e76:	8082                	ret

0000000000001e78 <chdir>:
    register long a7 __asm__("a7") = n;
    1e78:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e7c:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e80:	2501                	sext.w	a0,a0
    1e82:	8082                	ret

0000000000001e84 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e84:	862e                	mv	a2,a1
    1e86:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e88:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e8a:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e8e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e92:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e94:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e96:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e9a:	2501                	sext.w	a0,a0
    1e9c:	8082                	ret

0000000000001e9e <getdents>:
    register long a7 __asm__("a7") = n;
    1e9e:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ea2:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1ea6:	2501                	sext.w	a0,a0
    1ea8:	8082                	ret

0000000000001eaa <pipe>:
    register long a7 __asm__("a7") = n;
    1eaa:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1eae:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb0:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1eb4:	2501                	sext.w	a0,a0
    1eb6:	8082                	ret

0000000000001eb8 <dup>:
    register long a7 __asm__("a7") = n;
    1eb8:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1eba:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1ebe:	2501                	sext.w	a0,a0
    1ec0:	8082                	ret

0000000000001ec2 <dup2>:
    register long a7 __asm__("a7") = n;
    1ec2:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1ec4:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ec6:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1eca:	2501                	sext.w	a0,a0
    1ecc:	8082                	ret

0000000000001ece <mount>:
    register long a7 __asm__("a7") = n;
    1ece:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ed2:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ed6:	2501                	sext.w	a0,a0
    1ed8:	8082                	ret

0000000000001eda <umount>:
    register long a7 __asm__("a7") = n;
    1eda:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ede:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ee0:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ee4:	2501                	sext.w	a0,a0
    1ee6:	8082                	ret

0000000000001ee8 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ee8:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1eea:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1eec:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1eee:	8532                	mv	a0,a2
	mv a2, a4
    1ef0:	863a                	mv	a2,a4
	mv a3, a5
    1ef2:	86be                	mv	a3,a5
	mv a4, a6
    1ef4:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ef6:	0dc00893          	li	a7,220
	ecall
    1efa:	00000073          	ecall

	beqz a0, 1f
    1efe:	c111                	beqz	a0,1f02 <__clone+0x1a>
	# Parent
	ret
    1f00:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f02:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f04:	6522                	ld	a0,8(sp)
	jalr a1
    1f06:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f08:	05d00893          	li	a7,93
	ecall
    1f0c:	00000073          	ecall
