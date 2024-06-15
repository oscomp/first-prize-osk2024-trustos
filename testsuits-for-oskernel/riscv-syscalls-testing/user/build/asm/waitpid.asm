
/home/brightnight/OScompetition/6.13晚final_main/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/waitpid：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a8e5                	j	10fa <__start_main>

0000000000001004 <test_waitpid>:
#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"

int i = 1000;
void test_waitpid(void){
    1004:	7179                	addi	sp,sp,-48
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f3a50513          	addi	a0,a0,-198 # 1f40 <__clone+0x28>
void test_waitpid(void){
    100e:	f406                	sd	ra,40(sp)
    1010:	f022                	sd	s0,32(sp)
    1012:	ec26                	sd	s1,24(sp)
    TEST_START(__func__);
    1014:	358000ef          	jal	ra,136c <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	ff050513          	addi	a0,a0,-16 # 2008 <__func__.0>
    1020:	34c000ef          	jal	ra,136c <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	f3450513          	addi	a0,a0,-204 # 1f58 <__clone+0x40>
    102c:	340000ef          	jal	ra,136c <puts>
    int cpid, wstatus;
    cpid = fork();
    1030:	4df000ef          	jal	ra,1d0e <fork>
    assert(cpid != -1);
    1034:	547d                	li	s0,-1
    cpid = fork();
    1036:	84aa                	mv	s1,a0
    assert(cpid != -1);
    1038:	04850963          	beq	a0,s0,108a <test_waitpid+0x86>
    if(cpid == 0){
    103c:	e93d                	bnez	a0,10b2 <test_waitpid+0xae>
	while(i--);
    103e:	00001797          	auipc	a5,0x1
    1042:	fe87a723          	sw	s0,-18(a5) # 202c <i>
	sched_yield();
    1046:	4bd000ef          	jal	ra,1d02 <sched_yield>
	printf("This is child process\n");
    104a:	00001517          	auipc	a0,0x1
    104e:	f3e50513          	addi	a0,a0,-194 # 1f88 <__clone+0x70>
    1052:	33c000ef          	jal	ra,138e <printf>
        exit(3);
    1056:	450d                	li	a0,3
    1058:	4d9000ef          	jal	ra,1d30 <exit>
	    printf("waitpid successfully.\nwstatus: %x\n", WEXITSTATUS(wstatus));
	else
	    printf("waitpid error.\n");

    }
    TEST_END(__func__);
    105c:	00001517          	auipc	a0,0x1
    1060:	f7c50513          	addi	a0,a0,-132 # 1fd8 <__clone+0xc0>
    1064:	308000ef          	jal	ra,136c <puts>
    1068:	00001517          	auipc	a0,0x1
    106c:	fa050513          	addi	a0,a0,-96 # 2008 <__func__.0>
    1070:	2fc000ef          	jal	ra,136c <puts>
    1074:	00001517          	auipc	a0,0x1
    1078:	ee450513          	addi	a0,a0,-284 # 1f58 <__clone+0x40>
    107c:	2f0000ef          	jal	ra,136c <puts>
}
    1080:	70a2                	ld	ra,40(sp)
    1082:	7402                	ld	s0,32(sp)
    1084:	64e2                	ld	s1,24(sp)
    1086:	6145                	addi	sp,sp,48
    1088:	8082                	ret
    assert(cpid != -1);
    108a:	00001517          	auipc	a0,0x1
    108e:	ede50513          	addi	a0,a0,-290 # 1f68 <__clone+0x50>
    1092:	580000ef          	jal	ra,1612 <panic>
	pid_t ret = waitpid(cpid, &wstatus, 0);
    1096:	4601                	li	a2,0
    1098:	006c                	addi	a1,sp,12
    109a:	557d                	li	a0,-1
    109c:	49f000ef          	jal	ra,1d3a <waitpid>
	assert(ret != -1);
    10a0:	00950f63          	beq	a0,s1,10be <test_waitpid+0xba>
	    printf("waitpid error.\n");
    10a4:	00001517          	auipc	a0,0x1
    10a8:	f2450513          	addi	a0,a0,-220 # 1fc8 <__clone+0xb0>
    10ac:	2e2000ef          	jal	ra,138e <printf>
    10b0:	b775                	j	105c <test_waitpid+0x58>
	pid_t ret = waitpid(cpid, &wstatus, 0);
    10b2:	4601                	li	a2,0
    10b4:	006c                	addi	a1,sp,12
    10b6:	485000ef          	jal	ra,1d3a <waitpid>
	assert(ret != -1);
    10ba:	00851963          	bne	a0,s0,10cc <test_waitpid+0xc8>
    10be:	00001517          	auipc	a0,0x1
    10c2:	eaa50513          	addi	a0,a0,-342 # 1f68 <__clone+0x50>
    10c6:	54c000ef          	jal	ra,1612 <panic>
    10ca:	557d                	li	a0,-1
	if(ret == cpid && WEXITSTATUS(wstatus) == 3)
    10cc:	fca49ce3          	bne	s1,a0,10a4 <test_waitpid+0xa0>
    10d0:	00d14703          	lbu	a4,13(sp)
    10d4:	478d                	li	a5,3
    10d6:	fcf717e3          	bne	a4,a5,10a4 <test_waitpid+0xa0>
	    printf("waitpid successfully.\nwstatus: %x\n", WEXITSTATUS(wstatus));
    10da:	458d                	li	a1,3
    10dc:	00001517          	auipc	a0,0x1
    10e0:	ec450513          	addi	a0,a0,-316 # 1fa0 <__clone+0x88>
    10e4:	2aa000ef          	jal	ra,138e <printf>
    10e8:	bf95                	j	105c <test_waitpid+0x58>

00000000000010ea <main>:

int main(void){
    10ea:	1141                	addi	sp,sp,-16
    10ec:	e406                	sd	ra,8(sp)
    test_waitpid();
    10ee:	f17ff0ef          	jal	ra,1004 <test_waitpid>
    return 0;
}
    10f2:	60a2                	ld	ra,8(sp)
    10f4:	4501                	li	a0,0
    10f6:	0141                	addi	sp,sp,16
    10f8:	8082                	ret

00000000000010fa <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10fa:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10fc:	4108                	lw	a0,0(a0)
{
    10fe:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    1100:	05a1                	addi	a1,a1,8
{
    1102:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1104:	fe7ff0ef          	jal	ra,10ea <main>
    1108:	429000ef          	jal	ra,1d30 <exit>
	return 0;
}
    110c:	60a2                	ld	ra,8(sp)
    110e:	4501                	li	a0,0
    1110:	0141                	addi	sp,sp,16
    1112:	8082                	ret

0000000000001114 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1114:	7179                	addi	sp,sp,-48
    1116:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1118:	12054b63          	bltz	a0,124e <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    111c:	02b577bb          	remuw	a5,a0,a1
    1120:	00001617          	auipc	a2,0x1
    1124:	ef860613          	addi	a2,a2,-264 # 2018 <digits>
    buf[16] = 0;
    1128:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    112c:	0005871b          	sext.w	a4,a1
    1130:	1782                	slli	a5,a5,0x20
    1132:	9381                	srli	a5,a5,0x20
    1134:	97b2                	add	a5,a5,a2
    1136:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    113a:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    113e:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1142:	1cb56363          	bltu	a0,a1,1308 <printint.constprop.0+0x1f4>
        buf[i--] = digits[x % base];
    1146:	45b9                	li	a1,14
    1148:	02e877bb          	remuw	a5,a6,a4
    114c:	1782                	slli	a5,a5,0x20
    114e:	9381                	srli	a5,a5,0x20
    1150:	97b2                	add	a5,a5,a2
    1152:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1156:	02e856bb          	divuw	a3,a6,a4
        buf[i--] = digits[x % base];
    115a:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    115e:	0ce86e63          	bltu	a6,a4,123a <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    1162:	02e6f5bb          	remuw	a1,a3,a4
    } while ((x /= base) != 0);
    1166:	02e6d7bb          	divuw	a5,a3,a4
        buf[i--] = digits[x % base];
    116a:	1582                	slli	a1,a1,0x20
    116c:	9181                	srli	a1,a1,0x20
    116e:	95b2                	add	a1,a1,a2
    1170:	0005c583          	lbu	a1,0(a1)
    1174:	00b10aa3          	sb	a1,21(sp)
    } while ((x /= base) != 0);
    1178:	0007859b          	sext.w	a1,a5
    117c:	12e6ec63          	bltu	a3,a4,12b4 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    1180:	02e7f6bb          	remuw	a3,a5,a4
    1184:	1682                	slli	a3,a3,0x20
    1186:	9281                	srli	a3,a3,0x20
    1188:	96b2                	add	a3,a3,a2
    118a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    118e:	02e7d83b          	divuw	a6,a5,a4
        buf[i--] = digits[x % base];
    1192:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1196:	12e5e863          	bltu	a1,a4,12c6 <printint.constprop.0+0x1b2>
        buf[i--] = digits[x % base];
    119a:	02e876bb          	remuw	a3,a6,a4
    119e:	1682                	slli	a3,a3,0x20
    11a0:	9281                	srli	a3,a3,0x20
    11a2:	96b2                	add	a3,a3,a2
    11a4:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11a8:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11ac:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    11b0:	12e86463          	bltu	a6,a4,12d8 <printint.constprop.0+0x1c4>
        buf[i--] = digits[x % base];
    11b4:	02e5f6bb          	remuw	a3,a1,a4
    11b8:	1682                	slli	a3,a3,0x20
    11ba:	9281                	srli	a3,a3,0x20
    11bc:	96b2                	add	a3,a3,a2
    11be:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11c2:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11c6:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    11ca:	0ce5ec63          	bltu	a1,a4,12a2 <printint.constprop.0+0x18e>
        buf[i--] = digits[x % base];
    11ce:	02e876bb          	remuw	a3,a6,a4
    11d2:	1682                	slli	a3,a3,0x20
    11d4:	9281                	srli	a3,a3,0x20
    11d6:	96b2                	add	a3,a3,a2
    11d8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11dc:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11e0:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11e4:	10e86963          	bltu	a6,a4,12f6 <printint.constprop.0+0x1e2>
        buf[i--] = digits[x % base];
    11e8:	02e5f6bb          	remuw	a3,a1,a4
    11ec:	1682                	slli	a3,a3,0x20
    11ee:	9281                	srli	a3,a3,0x20
    11f0:	96b2                	add	a3,a3,a2
    11f2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11f6:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11fa:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11fe:	10e5e763          	bltu	a1,a4,130c <printint.constprop.0+0x1f8>
        buf[i--] = digits[x % base];
    1202:	02e876bb          	remuw	a3,a6,a4
    1206:	1682                	slli	a3,a3,0x20
    1208:	9281                	srli	a3,a3,0x20
    120a:	96b2                	add	a3,a3,a2
    120c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1210:	02e857bb          	divuw	a5,a6,a4
        buf[i--] = digits[x % base];
    1214:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    1218:	10e86363          	bltu	a6,a4,131e <printint.constprop.0+0x20a>
        buf[i--] = digits[x % base];
    121c:	1782                	slli	a5,a5,0x20
    121e:	9381                	srli	a5,a5,0x20
    1220:	97b2                	add	a5,a5,a2
    1222:	0007c783          	lbu	a5,0(a5)
    1226:	4599                	li	a1,6
    1228:	00f10723          	sb	a5,14(sp)

    if (sign)
    122c:	00055763          	bgez	a0,123a <printint.constprop.0+0x126>
        buf[i--] = '-';
    1230:	02d00793          	li	a5,45
    1234:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1238:	4595                	li	a1,5
    write(f, s, l);
    123a:	003c                	addi	a5,sp,8
    123c:	4641                	li	a2,16
    123e:	9e0d                	subw	a2,a2,a1
    1240:	4505                	li	a0,1
    1242:	95be                	add	a1,a1,a5
    1244:	29d000ef          	jal	ra,1ce0 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1248:	70a2                	ld	ra,40(sp)
    124a:	6145                	addi	sp,sp,48
    124c:	8082                	ret
        x = -xx;
    124e:	40a0083b          	negw	a6,a0
        buf[i--] = digits[x % base];
    1252:	02b877bb          	remuw	a5,a6,a1
    1256:	00001617          	auipc	a2,0x1
    125a:	dc260613          	addi	a2,a2,-574 # 2018 <digits>
    buf[16] = 0;
    125e:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1262:	0005871b          	sext.w	a4,a1
    1266:	1782                	slli	a5,a5,0x20
    1268:	9381                	srli	a5,a5,0x20
    126a:	97b2                	add	a5,a5,a2
    126c:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1270:	02b858bb          	divuw	a7,a6,a1
        buf[i--] = digits[x % base];
    1274:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1278:	06b86963          	bltu	a6,a1,12ea <printint.constprop.0+0x1d6>
        buf[i--] = digits[x % base];
    127c:	02e8f7bb          	remuw	a5,a7,a4
    1280:	1782                	slli	a5,a5,0x20
    1282:	9381                	srli	a5,a5,0x20
    1284:	97b2                	add	a5,a5,a2
    1286:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    128a:	02e8d6bb          	divuw	a3,a7,a4
        buf[i--] = digits[x % base];
    128e:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    1292:	ece8f8e3          	bgeu	a7,a4,1162 <printint.constprop.0+0x4e>
        buf[i--] = '-';
    1296:	02d00793          	li	a5,45
    129a:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    129e:	45b5                	li	a1,13
    12a0:	bf69                	j	123a <printint.constprop.0+0x126>
    12a2:	45a9                	li	a1,10
    if (sign)
    12a4:	f8055be3          	bgez	a0,123a <printint.constprop.0+0x126>
        buf[i--] = '-';
    12a8:	02d00793          	li	a5,45
    12ac:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    12b0:	45a5                	li	a1,9
    12b2:	b761                	j	123a <printint.constprop.0+0x126>
    12b4:	45b5                	li	a1,13
    if (sign)
    12b6:	f80552e3          	bgez	a0,123a <printint.constprop.0+0x126>
        buf[i--] = '-';
    12ba:	02d00793          	li	a5,45
    12be:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    12c2:	45b1                	li	a1,12
    12c4:	bf9d                	j	123a <printint.constprop.0+0x126>
    12c6:	45b1                	li	a1,12
    if (sign)
    12c8:	f60559e3          	bgez	a0,123a <printint.constprop.0+0x126>
        buf[i--] = '-';
    12cc:	02d00793          	li	a5,45
    12d0:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12d4:	45ad                	li	a1,11
    12d6:	b795                	j	123a <printint.constprop.0+0x126>
    12d8:	45ad                	li	a1,11
    if (sign)
    12da:	f60550e3          	bgez	a0,123a <printint.constprop.0+0x126>
        buf[i--] = '-';
    12de:	02d00793          	li	a5,45
    12e2:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12e6:	45a9                	li	a1,10
    12e8:	bf89                	j	123a <printint.constprop.0+0x126>
        buf[i--] = '-';
    12ea:	02d00793          	li	a5,45
    12ee:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12f2:	45b9                	li	a1,14
    12f4:	b799                	j	123a <printint.constprop.0+0x126>
    12f6:	45a5                	li	a1,9
    if (sign)
    12f8:	f40551e3          	bgez	a0,123a <printint.constprop.0+0x126>
        buf[i--] = '-';
    12fc:	02d00793          	li	a5,45
    1300:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1304:	45a1                	li	a1,8
    1306:	bf15                	j	123a <printint.constprop.0+0x126>
    i = 15;
    1308:	45bd                	li	a1,15
    130a:	bf05                	j	123a <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    130c:	45a1                	li	a1,8
    if (sign)
    130e:	f20556e3          	bgez	a0,123a <printint.constprop.0+0x126>
        buf[i--] = '-';
    1312:	02d00793          	li	a5,45
    1316:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    131a:	459d                	li	a1,7
    131c:	bf39                	j	123a <printint.constprop.0+0x126>
    131e:	459d                	li	a1,7
    if (sign)
    1320:	f0055de3          	bgez	a0,123a <printint.constprop.0+0x126>
        buf[i--] = '-';
    1324:	02d00793          	li	a5,45
    1328:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    132c:	4599                	li	a1,6
    132e:	b731                	j	123a <printint.constprop.0+0x126>

0000000000001330 <getchar>:
{
    1330:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1332:	00f10593          	addi	a1,sp,15
    1336:	4605                	li	a2,1
    1338:	4501                	li	a0,0
{
    133a:	ec06                	sd	ra,24(sp)
    char byte = 0;
    133c:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1340:	197000ef          	jal	ra,1cd6 <read>
}
    1344:	60e2                	ld	ra,24(sp)
    1346:	00f14503          	lbu	a0,15(sp)
    134a:	6105                	addi	sp,sp,32
    134c:	8082                	ret

000000000000134e <putchar>:
{
    134e:	1101                	addi	sp,sp,-32
    1350:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1352:	00f10593          	addi	a1,sp,15
    1356:	4605                	li	a2,1
    1358:	4505                	li	a0,1
{
    135a:	ec06                	sd	ra,24(sp)
    char byte = c;
    135c:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1360:	181000ef          	jal	ra,1ce0 <write>
}
    1364:	60e2                	ld	ra,24(sp)
    1366:	2501                	sext.w	a0,a0
    1368:	6105                	addi	sp,sp,32
    136a:	8082                	ret

000000000000136c <puts>:
{
    136c:	1141                	addi	sp,sp,-16
    136e:	e406                	sd	ra,8(sp)
    1370:	e022                	sd	s0,0(sp)
    1372:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1374:	57e000ef          	jal	ra,18f2 <strlen>
    1378:	862a                	mv	a2,a0
    137a:	85a2                	mv	a1,s0
    137c:	4505                	li	a0,1
    137e:	163000ef          	jal	ra,1ce0 <write>
}
    1382:	60a2                	ld	ra,8(sp)
    1384:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1386:	957d                	srai	a0,a0,0x3f
    return r;
    1388:	2501                	sext.w	a0,a0
}
    138a:	0141                	addi	sp,sp,16
    138c:	8082                	ret

000000000000138e <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    138e:	7171                	addi	sp,sp,-176
    1390:	fc56                	sd	s5,56(sp)
    1392:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1394:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1396:	18bc                	addi	a5,sp,120
{
    1398:	e8ca                	sd	s2,80(sp)
    139a:	e4ce                	sd	s3,72(sp)
    139c:	e0d2                	sd	s4,64(sp)
    139e:	f85a                	sd	s6,48(sp)
    13a0:	f486                	sd	ra,104(sp)
    13a2:	f0a2                	sd	s0,96(sp)
    13a4:	eca6                	sd	s1,88(sp)
    13a6:	fcae                	sd	a1,120(sp)
    13a8:	e132                	sd	a2,128(sp)
    13aa:	e536                	sd	a3,136(sp)
    13ac:	e93a                	sd	a4,144(sp)
    13ae:	f142                	sd	a6,160(sp)
    13b0:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    13b2:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    13b4:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    13b8:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    13bc:	00001b17          	auipc	s6,0x1
    13c0:	c2cb0b13          	addi	s6,s6,-980 # 1fe8 <__clone+0xd0>
    buf[i++] = '0';
    13c4:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13c8:	00001997          	auipc	s3,0x1
    13cc:	c5098993          	addi	s3,s3,-944 # 2018 <digits>
        if (!*s)
    13d0:	00054783          	lbu	a5,0(a0)
    13d4:	16078a63          	beqz	a5,1548 <printf+0x1ba>
    13d8:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13da:	19278163          	beq	a5,s2,155c <printf+0x1ce>
    13de:	00164783          	lbu	a5,1(a2)
    13e2:	0605                	addi	a2,a2,1
    13e4:	fbfd                	bnez	a5,13da <printf+0x4c>
    13e6:	84b2                	mv	s1,a2
        l = z - a;
    13e8:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13ec:	85aa                	mv	a1,a0
    13ee:	8622                	mv	a2,s0
    13f0:	4505                	li	a0,1
    13f2:	0ef000ef          	jal	ra,1ce0 <write>
        if (l)
    13f6:	18041c63          	bnez	s0,158e <printf+0x200>
        if (s[1] == 0)
    13fa:	0014c783          	lbu	a5,1(s1)
    13fe:	14078563          	beqz	a5,1548 <printf+0x1ba>
        switch (s[1])
    1402:	1d478063          	beq	a5,s4,15c2 <printf+0x234>
    1406:	18fa6663          	bltu	s4,a5,1592 <printf+0x204>
    140a:	06400713          	li	a4,100
    140e:	1ae78063          	beq	a5,a4,15ae <printf+0x220>
    1412:	07000713          	li	a4,112
    1416:	1ce79963          	bne	a5,a4,15e8 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    141a:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    141c:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1420:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1422:	631c                	ld	a5,0(a4)
    1424:	0721                	addi	a4,a4,8
    1426:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1428:	00479293          	slli	t0,a5,0x4
    142c:	00879f93          	slli	t6,a5,0x8
    1430:	00c79f13          	slli	t5,a5,0xc
    1434:	01079e93          	slli	t4,a5,0x10
    1438:	01479e13          	slli	t3,a5,0x14
    143c:	01879313          	slli	t1,a5,0x18
    1440:	01c79893          	slli	a7,a5,0x1c
    1444:	02479813          	slli	a6,a5,0x24
    1448:	02879513          	slli	a0,a5,0x28
    144c:	02c79593          	slli	a1,a5,0x2c
    1450:	03079693          	slli	a3,a5,0x30
    1454:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1458:	03c7d413          	srli	s0,a5,0x3c
    145c:	01c7d39b          	srliw	t2,a5,0x1c
    1460:	03c2d293          	srli	t0,t0,0x3c
    1464:	03cfdf93          	srli	t6,t6,0x3c
    1468:	03cf5f13          	srli	t5,t5,0x3c
    146c:	03cede93          	srli	t4,t4,0x3c
    1470:	03ce5e13          	srli	t3,t3,0x3c
    1474:	03c35313          	srli	t1,t1,0x3c
    1478:	03c8d893          	srli	a7,a7,0x3c
    147c:	03c85813          	srli	a6,a6,0x3c
    1480:	9171                	srli	a0,a0,0x3c
    1482:	91f1                	srli	a1,a1,0x3c
    1484:	92f1                	srli	a3,a3,0x3c
    1486:	9371                	srli	a4,a4,0x3c
    1488:	96ce                	add	a3,a3,s3
    148a:	974e                	add	a4,a4,s3
    148c:	944e                	add	s0,s0,s3
    148e:	92ce                	add	t0,t0,s3
    1490:	9fce                	add	t6,t6,s3
    1492:	9f4e                	add	t5,t5,s3
    1494:	9ece                	add	t4,t4,s3
    1496:	9e4e                	add	t3,t3,s3
    1498:	934e                	add	t1,t1,s3
    149a:	98ce                	add	a7,a7,s3
    149c:	93ce                	add	t2,t2,s3
    149e:	984e                	add	a6,a6,s3
    14a0:	954e                	add	a0,a0,s3
    14a2:	95ce                	add	a1,a1,s3
    14a4:	0006c083          	lbu	ra,0(a3)
    14a8:	0002c283          	lbu	t0,0(t0)
    14ac:	00074683          	lbu	a3,0(a4)
    14b0:	000fcf83          	lbu	t6,0(t6)
    14b4:	000f4f03          	lbu	t5,0(t5)
    14b8:	000ece83          	lbu	t4,0(t4)
    14bc:	000e4e03          	lbu	t3,0(t3)
    14c0:	00034303          	lbu	t1,0(t1)
    14c4:	0008c883          	lbu	a7,0(a7)
    14c8:	0003c383          	lbu	t2,0(t2)
    14cc:	00084803          	lbu	a6,0(a6)
    14d0:	00054503          	lbu	a0,0(a0)
    14d4:	0005c583          	lbu	a1,0(a1)
    14d8:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14dc:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14e0:	9371                	srli	a4,a4,0x3c
    14e2:	8bbd                	andi	a5,a5,15
    14e4:	974e                	add	a4,a4,s3
    14e6:	97ce                	add	a5,a5,s3
    14e8:	005105a3          	sb	t0,11(sp)
    14ec:	01f10623          	sb	t6,12(sp)
    14f0:	01e106a3          	sb	t5,13(sp)
    14f4:	01d10723          	sb	t4,14(sp)
    14f8:	01c107a3          	sb	t3,15(sp)
    14fc:	00610823          	sb	t1,16(sp)
    1500:	011108a3          	sb	a7,17(sp)
    1504:	00710923          	sb	t2,18(sp)
    1508:	010109a3          	sb	a6,19(sp)
    150c:	00a10a23          	sb	a0,20(sp)
    1510:	00b10aa3          	sb	a1,21(sp)
    1514:	00110b23          	sb	ra,22(sp)
    1518:	00d10ba3          	sb	a3,23(sp)
    151c:	00810523          	sb	s0,10(sp)
    1520:	00074703          	lbu	a4,0(a4)
    1524:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1528:	002c                	addi	a1,sp,8
    152a:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    152c:	00e10c23          	sb	a4,24(sp)
    1530:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1534:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1538:	7a8000ef          	jal	ra,1ce0 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    153c:	00248513          	addi	a0,s1,2
        if (!*s)
    1540:	00054783          	lbu	a5,0(a0)
    1544:	e8079ae3          	bnez	a5,13d8 <printf+0x4a>
    }
    va_end(ap);
}
    1548:	70a6                	ld	ra,104(sp)
    154a:	7406                	ld	s0,96(sp)
    154c:	64e6                	ld	s1,88(sp)
    154e:	6946                	ld	s2,80(sp)
    1550:	69a6                	ld	s3,72(sp)
    1552:	6a06                	ld	s4,64(sp)
    1554:	7ae2                	ld	s5,56(sp)
    1556:	7b42                	ld	s6,48(sp)
    1558:	614d                	addi	sp,sp,176
    155a:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    155c:	00064783          	lbu	a5,0(a2)
    1560:	84b2                	mv	s1,a2
    1562:	01278963          	beq	a5,s2,1574 <printf+0x1e6>
    1566:	b549                	j	13e8 <printf+0x5a>
    1568:	0024c783          	lbu	a5,2(s1)
    156c:	0605                	addi	a2,a2,1
    156e:	0489                	addi	s1,s1,2
    1570:	e7279ce3          	bne	a5,s2,13e8 <printf+0x5a>
    1574:	0014c783          	lbu	a5,1(s1)
    1578:	ff2788e3          	beq	a5,s2,1568 <printf+0x1da>
        l = z - a;
    157c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1580:	85aa                	mv	a1,a0
    1582:	8622                	mv	a2,s0
    1584:	4505                	li	a0,1
    1586:	75a000ef          	jal	ra,1ce0 <write>
        if (l)
    158a:	e60408e3          	beqz	s0,13fa <printf+0x6c>
    158e:	8526                	mv	a0,s1
    1590:	b581                	j	13d0 <printf+0x42>
        switch (s[1])
    1592:	07800713          	li	a4,120
    1596:	04e79963          	bne	a5,a4,15e8 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    159a:	6782                	ld	a5,0(sp)
    159c:	45c1                	li	a1,16
    159e:	4388                	lw	a0,0(a5)
    15a0:	07a1                	addi	a5,a5,8
    15a2:	e03e                	sd	a5,0(sp)
    15a4:	b71ff0ef          	jal	ra,1114 <printint.constprop.0>
        s += 2;
    15a8:	00248513          	addi	a0,s1,2
    15ac:	bf51                	j	1540 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    15ae:	6782                	ld	a5,0(sp)
    15b0:	45a9                	li	a1,10
    15b2:	4388                	lw	a0,0(a5)
    15b4:	07a1                	addi	a5,a5,8
    15b6:	e03e                	sd	a5,0(sp)
    15b8:	b5dff0ef          	jal	ra,1114 <printint.constprop.0>
        s += 2;
    15bc:	00248513          	addi	a0,s1,2
    15c0:	b741                	j	1540 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    15c2:	6782                	ld	a5,0(sp)
    15c4:	6380                	ld	s0,0(a5)
    15c6:	07a1                	addi	a5,a5,8
    15c8:	e03e                	sd	a5,0(sp)
    15ca:	c031                	beqz	s0,160e <printf+0x280>
            l = strnlen(a, 200);
    15cc:	0c800593          	li	a1,200
    15d0:	8522                	mv	a0,s0
    15d2:	40c000ef          	jal	ra,19de <strnlen>
    write(f, s, l);
    15d6:	0005061b          	sext.w	a2,a0
    15da:	85a2                	mv	a1,s0
    15dc:	4505                	li	a0,1
    15de:	702000ef          	jal	ra,1ce0 <write>
        s += 2;
    15e2:	00248513          	addi	a0,s1,2
    15e6:	bfa9                	j	1540 <printf+0x1b2>
    return write(stdout, &byte, 1);
    15e8:	4605                	li	a2,1
    15ea:	002c                	addi	a1,sp,8
    15ec:	4505                	li	a0,1
    char byte = c;
    15ee:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15f2:	6ee000ef          	jal	ra,1ce0 <write>
    char byte = c;
    15f6:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15fa:	4605                	li	a2,1
    15fc:	002c                	addi	a1,sp,8
    15fe:	4505                	li	a0,1
    char byte = c;
    1600:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1604:	6dc000ef          	jal	ra,1ce0 <write>
        s += 2;
    1608:	00248513          	addi	a0,s1,2
    160c:	bf15                	j	1540 <printf+0x1b2>
                a = "(null)";
    160e:	845a                	mv	s0,s6
    1610:	bf75                	j	15cc <printf+0x23e>

0000000000001612 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1612:	1141                	addi	sp,sp,-16
    1614:	e406                	sd	ra,8(sp)
    puts(m);
    1616:	d57ff0ef          	jal	ra,136c <puts>
    exit(-100);
}
    161a:	60a2                	ld	ra,8(sp)
    exit(-100);
    161c:	f9c00513          	li	a0,-100
}
    1620:	0141                	addi	sp,sp,16
    exit(-100);
    1622:	a739                	j	1d30 <exit>

0000000000001624 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1624:	02000793          	li	a5,32
    1628:	00f50663          	beq	a0,a5,1634 <isspace+0x10>
    162c:	355d                	addiw	a0,a0,-9
    162e:	00553513          	sltiu	a0,a0,5
    1632:	8082                	ret
    1634:	4505                	li	a0,1
}
    1636:	8082                	ret

0000000000001638 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1638:	fd05051b          	addiw	a0,a0,-48
}
    163c:	00a53513          	sltiu	a0,a0,10
    1640:	8082                	ret

0000000000001642 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1642:	02000613          	li	a2,32
    1646:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1648:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    164c:	ff77869b          	addiw	a3,a5,-9
    1650:	04c78c63          	beq	a5,a2,16a8 <atoi+0x66>
    1654:	0007871b          	sext.w	a4,a5
    1658:	04d5f863          	bgeu	a1,a3,16a8 <atoi+0x66>
        s++;
    switch (*s)
    165c:	02b00693          	li	a3,43
    1660:	04d78963          	beq	a5,a3,16b2 <atoi+0x70>
    1664:	02d00693          	li	a3,45
    1668:	06d78263          	beq	a5,a3,16cc <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    166c:	fd07061b          	addiw	a2,a4,-48
    1670:	47a5                	li	a5,9
    1672:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1674:	4e01                	li	t3,0
    while (isdigit(*s))
    1676:	04c7e963          	bltu	a5,a2,16c8 <atoi+0x86>
    int n = 0, neg = 0;
    167a:	4501                	li	a0,0
    while (isdigit(*s))
    167c:	4825                	li	a6,9
    167e:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    1682:	0025179b          	slliw	a5,a0,0x2
    1686:	9fa9                	addw	a5,a5,a0
    1688:	fd07031b          	addiw	t1,a4,-48
    168c:	0017989b          	slliw	a7,a5,0x1
    while (isdigit(*s))
    1690:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1694:	0685                	addi	a3,a3,1
    1696:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    169a:	0006071b          	sext.w	a4,a2
    169e:	feb870e3          	bgeu	a6,a1,167e <atoi+0x3c>
    return neg ? n : -n;
    16a2:	000e0563          	beqz	t3,16ac <atoi+0x6a>
}
    16a6:	8082                	ret
        s++;
    16a8:	0505                	addi	a0,a0,1
    16aa:	bf79                	j	1648 <atoi+0x6>
    return neg ? n : -n;
    16ac:	4113053b          	subw	a0,t1,a7
    16b0:	8082                	ret
    while (isdigit(*s))
    16b2:	00154703          	lbu	a4,1(a0)
    16b6:	47a5                	li	a5,9
        s++;
    16b8:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    16bc:	fd07061b          	addiw	a2,a4,-48
    int n = 0, neg = 0;
    16c0:	4e01                	li	t3,0
    while (isdigit(*s))
    16c2:	2701                	sext.w	a4,a4
    16c4:	fac7fbe3          	bgeu	a5,a2,167a <atoi+0x38>
    16c8:	4501                	li	a0,0
}
    16ca:	8082                	ret
    while (isdigit(*s))
    16cc:	00154703          	lbu	a4,1(a0)
    16d0:	47a5                	li	a5,9
        s++;
    16d2:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    16d6:	fd07061b          	addiw	a2,a4,-48
    16da:	2701                	sext.w	a4,a4
    16dc:	fec7e6e3          	bltu	a5,a2,16c8 <atoi+0x86>
        neg = 1;
    16e0:	4e05                	li	t3,1
    16e2:	bf61                	j	167a <atoi+0x38>

00000000000016e4 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16e4:	16060d63          	beqz	a2,185e <memset+0x17a>
    16e8:	40a007b3          	neg	a5,a0
    16ec:	8b9d                	andi	a5,a5,7
    16ee:	00778693          	addi	a3,a5,7
    16f2:	482d                	li	a6,11
    16f4:	0ff5f713          	zext.b	a4,a1
    16f8:	fff60593          	addi	a1,a2,-1
    16fc:	1706e263          	bltu	a3,a6,1860 <memset+0x17c>
    1700:	16d5ea63          	bltu	a1,a3,1874 <memset+0x190>
    1704:	16078563          	beqz	a5,186e <memset+0x18a>
    1708:	00e50023          	sb	a4,0(a0)
    170c:	4685                	li	a3,1
    170e:	00150593          	addi	a1,a0,1
    1712:	14d78c63          	beq	a5,a3,186a <memset+0x186>
    1716:	00e500a3          	sb	a4,1(a0)
    171a:	4689                	li	a3,2
    171c:	00250593          	addi	a1,a0,2
    1720:	14d78d63          	beq	a5,a3,187a <memset+0x196>
    1724:	00e50123          	sb	a4,2(a0)
    1728:	468d                	li	a3,3
    172a:	00350593          	addi	a1,a0,3
    172e:	12d78b63          	beq	a5,a3,1864 <memset+0x180>
    1732:	00e501a3          	sb	a4,3(a0)
    1736:	4691                	li	a3,4
    1738:	00450593          	addi	a1,a0,4
    173c:	14d78163          	beq	a5,a3,187e <memset+0x19a>
    1740:	00e50223          	sb	a4,4(a0)
    1744:	4695                	li	a3,5
    1746:	00550593          	addi	a1,a0,5
    174a:	12d78c63          	beq	a5,a3,1882 <memset+0x19e>
    174e:	00e502a3          	sb	a4,5(a0)
    1752:	469d                	li	a3,7
    1754:	00650593          	addi	a1,a0,6
    1758:	12d79763          	bne	a5,a3,1886 <memset+0x1a2>
    175c:	00750593          	addi	a1,a0,7
    1760:	00e50323          	sb	a4,6(a0)
    1764:	481d                	li	a6,7
    1766:	00871693          	slli	a3,a4,0x8
    176a:	01071893          	slli	a7,a4,0x10
    176e:	8ed9                	or	a3,a3,a4
    1770:	01871313          	slli	t1,a4,0x18
    1774:	0116e6b3          	or	a3,a3,a7
    1778:	0066e6b3          	or	a3,a3,t1
    177c:	02071893          	slli	a7,a4,0x20
    1780:	02871e13          	slli	t3,a4,0x28
    1784:	0116e6b3          	or	a3,a3,a7
    1788:	40f60333          	sub	t1,a2,a5
    178c:	03071893          	slli	a7,a4,0x30
    1790:	01c6e6b3          	or	a3,a3,t3
    1794:	0116e6b3          	or	a3,a3,a7
    1798:	03871e13          	slli	t3,a4,0x38
    179c:	97aa                	add	a5,a5,a0
    179e:	ff837893          	andi	a7,t1,-8
    17a2:	01c6e6b3          	or	a3,a3,t3
    17a6:	98be                	add	a7,a7,a5
    17a8:	e394                	sd	a3,0(a5)
    17aa:	07a1                	addi	a5,a5,8
    17ac:	ff179ee3          	bne	a5,a7,17a8 <memset+0xc4>
    17b0:	ff837893          	andi	a7,t1,-8
    17b4:	011587b3          	add	a5,a1,a7
    17b8:	010886bb          	addw	a3,a7,a6
    17bc:	0b130663          	beq	t1,a7,1868 <memset+0x184>
    17c0:	00e78023          	sb	a4,0(a5)
    17c4:	0016859b          	addiw	a1,a3,1
    17c8:	08c5fb63          	bgeu	a1,a2,185e <memset+0x17a>
    17cc:	00e780a3          	sb	a4,1(a5)
    17d0:	0026859b          	addiw	a1,a3,2
    17d4:	08c5f563          	bgeu	a1,a2,185e <memset+0x17a>
    17d8:	00e78123          	sb	a4,2(a5)
    17dc:	0036859b          	addiw	a1,a3,3
    17e0:	06c5ff63          	bgeu	a1,a2,185e <memset+0x17a>
    17e4:	00e781a3          	sb	a4,3(a5)
    17e8:	0046859b          	addiw	a1,a3,4
    17ec:	06c5f963          	bgeu	a1,a2,185e <memset+0x17a>
    17f0:	00e78223          	sb	a4,4(a5)
    17f4:	0056859b          	addiw	a1,a3,5
    17f8:	06c5f363          	bgeu	a1,a2,185e <memset+0x17a>
    17fc:	00e782a3          	sb	a4,5(a5)
    1800:	0066859b          	addiw	a1,a3,6
    1804:	04c5fd63          	bgeu	a1,a2,185e <memset+0x17a>
    1808:	00e78323          	sb	a4,6(a5)
    180c:	0076859b          	addiw	a1,a3,7
    1810:	04c5f763          	bgeu	a1,a2,185e <memset+0x17a>
    1814:	00e783a3          	sb	a4,7(a5)
    1818:	0086859b          	addiw	a1,a3,8
    181c:	04c5f163          	bgeu	a1,a2,185e <memset+0x17a>
    1820:	00e78423          	sb	a4,8(a5)
    1824:	0096859b          	addiw	a1,a3,9
    1828:	02c5fb63          	bgeu	a1,a2,185e <memset+0x17a>
    182c:	00e784a3          	sb	a4,9(a5)
    1830:	00a6859b          	addiw	a1,a3,10
    1834:	02c5f563          	bgeu	a1,a2,185e <memset+0x17a>
    1838:	00e78523          	sb	a4,10(a5)
    183c:	00b6859b          	addiw	a1,a3,11
    1840:	00c5ff63          	bgeu	a1,a2,185e <memset+0x17a>
    1844:	00e785a3          	sb	a4,11(a5)
    1848:	00c6859b          	addiw	a1,a3,12
    184c:	00c5f963          	bgeu	a1,a2,185e <memset+0x17a>
    1850:	00e78623          	sb	a4,12(a5)
    1854:	26b5                	addiw	a3,a3,13
    1856:	00c6f463          	bgeu	a3,a2,185e <memset+0x17a>
    185a:	00e786a3          	sb	a4,13(a5)
        ;
    return dest;
}
    185e:	8082                	ret
    1860:	46ad                	li	a3,11
    1862:	bd79                	j	1700 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1864:	480d                	li	a6,3
    1866:	b701                	j	1766 <memset+0x82>
    1868:	8082                	ret
    186a:	4805                	li	a6,1
    186c:	bded                	j	1766 <memset+0x82>
    186e:	85aa                	mv	a1,a0
    1870:	4801                	li	a6,0
    1872:	bdd5                	j	1766 <memset+0x82>
    1874:	87aa                	mv	a5,a0
    1876:	4681                	li	a3,0
    1878:	b7a1                	j	17c0 <memset+0xdc>
    187a:	4809                	li	a6,2
    187c:	b5ed                	j	1766 <memset+0x82>
    187e:	4811                	li	a6,4
    1880:	b5dd                	j	1766 <memset+0x82>
    1882:	4815                	li	a6,5
    1884:	b5cd                	j	1766 <memset+0x82>
    1886:	4819                	li	a6,6
    1888:	bdf9                	j	1766 <memset+0x82>

000000000000188a <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    188a:	00054783          	lbu	a5,0(a0)
    188e:	0005c703          	lbu	a4,0(a1)
    1892:	00e79863          	bne	a5,a4,18a2 <strcmp+0x18>
    1896:	0505                	addi	a0,a0,1
    1898:	0585                	addi	a1,a1,1
    189a:	fbe5                	bnez	a5,188a <strcmp>
    189c:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    189e:	9d19                	subw	a0,a0,a4
    18a0:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    18a2:	0007851b          	sext.w	a0,a5
    18a6:	bfe5                	j	189e <strcmp+0x14>

00000000000018a8 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    18a8:	ca15                	beqz	a2,18dc <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18aa:	00054783          	lbu	a5,0(a0)
    if (!n--)
    18ae:	167d                	addi	a2,a2,-1
    18b0:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18b4:	eb99                	bnez	a5,18ca <strncmp+0x22>
    18b6:	a815                	j	18ea <strncmp+0x42>
    18b8:	00a68e63          	beq	a3,a0,18d4 <strncmp+0x2c>
    18bc:	0505                	addi	a0,a0,1
    18be:	00f71b63          	bne	a4,a5,18d4 <strncmp+0x2c>
    18c2:	00054783          	lbu	a5,0(a0)
    18c6:	cf89                	beqz	a5,18e0 <strncmp+0x38>
    18c8:	85b2                	mv	a1,a2
    18ca:	0005c703          	lbu	a4,0(a1)
    18ce:	00158613          	addi	a2,a1,1
    18d2:	f37d                	bnez	a4,18b8 <strncmp+0x10>
        ;
    return *l - *r;
    18d4:	0007851b          	sext.w	a0,a5
    18d8:	9d19                	subw	a0,a0,a4
    18da:	8082                	ret
        return 0;
    18dc:	4501                	li	a0,0
}
    18de:	8082                	ret
    return *l - *r;
    18e0:	0015c703          	lbu	a4,1(a1)
    18e4:	4501                	li	a0,0
    18e6:	9d19                	subw	a0,a0,a4
    18e8:	8082                	ret
    18ea:	0005c703          	lbu	a4,0(a1)
    18ee:	4501                	li	a0,0
    18f0:	b7e5                	j	18d8 <strncmp+0x30>

00000000000018f2 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18f2:	00757793          	andi	a5,a0,7
    18f6:	cf89                	beqz	a5,1910 <strlen+0x1e>
    18f8:	87aa                	mv	a5,a0
    18fa:	a029                	j	1904 <strlen+0x12>
    18fc:	0785                	addi	a5,a5,1
    18fe:	0077f713          	andi	a4,a5,7
    1902:	cb01                	beqz	a4,1912 <strlen+0x20>
        if (!*s)
    1904:	0007c703          	lbu	a4,0(a5)
    1908:	fb75                	bnez	a4,18fc <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    190a:	40a78533          	sub	a0,a5,a0
}
    190e:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1910:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1912:	6394                	ld	a3,0(a5)
    1914:	00000597          	auipc	a1,0x0
    1918:	6dc5b583          	ld	a1,1756(a1) # 1ff0 <__clone+0xd8>
    191c:	00000617          	auipc	a2,0x0
    1920:	6dc63603          	ld	a2,1756(a2) # 1ff8 <__clone+0xe0>
    1924:	a019                	j	192a <strlen+0x38>
    1926:	6794                	ld	a3,8(a5)
    1928:	07a1                	addi	a5,a5,8
    192a:	00b68733          	add	a4,a3,a1
    192e:	fff6c693          	not	a3,a3
    1932:	8f75                	and	a4,a4,a3
    1934:	8f71                	and	a4,a4,a2
    1936:	db65                	beqz	a4,1926 <strlen+0x34>
    for (; *s; s++)
    1938:	0007c703          	lbu	a4,0(a5)
    193c:	d779                	beqz	a4,190a <strlen+0x18>
    193e:	0017c703          	lbu	a4,1(a5)
    1942:	0785                	addi	a5,a5,1
    1944:	d379                	beqz	a4,190a <strlen+0x18>
    1946:	0017c703          	lbu	a4,1(a5)
    194a:	0785                	addi	a5,a5,1
    194c:	fb6d                	bnez	a4,193e <strlen+0x4c>
    194e:	bf75                	j	190a <strlen+0x18>

0000000000001950 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1950:	00757713          	andi	a4,a0,7
{
    1954:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1956:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    195a:	cb19                	beqz	a4,1970 <memchr+0x20>
    195c:	ce25                	beqz	a2,19d4 <memchr+0x84>
    195e:	0007c703          	lbu	a4,0(a5)
    1962:	04b70e63          	beq	a4,a1,19be <memchr+0x6e>
    1966:	0785                	addi	a5,a5,1
    1968:	0077f713          	andi	a4,a5,7
    196c:	167d                	addi	a2,a2,-1
    196e:	f77d                	bnez	a4,195c <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1970:	4501                	li	a0,0
    if (n && *s != c)
    1972:	c235                	beqz	a2,19d6 <memchr+0x86>
    1974:	0007c703          	lbu	a4,0(a5)
    1978:	04b70363          	beq	a4,a1,19be <memchr+0x6e>
        size_t k = ONES * c;
    197c:	00000517          	auipc	a0,0x0
    1980:	68453503          	ld	a0,1668(a0) # 2000 <__clone+0xe8>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1984:	471d                	li	a4,7
        size_t k = ONES * c;
    1986:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    198a:	02c77a63          	bgeu	a4,a2,19be <memchr+0x6e>
    198e:	00000897          	auipc	a7,0x0
    1992:	6628b883          	ld	a7,1634(a7) # 1ff0 <__clone+0xd8>
    1996:	00000817          	auipc	a6,0x0
    199a:	66283803          	ld	a6,1634(a6) # 1ff8 <__clone+0xe0>
    199e:	431d                	li	t1,7
    19a0:	a029                	j	19aa <memchr+0x5a>
    19a2:	1661                	addi	a2,a2,-8
    19a4:	07a1                	addi	a5,a5,8
    19a6:	02c37963          	bgeu	t1,a2,19d8 <memchr+0x88>
    19aa:	6398                	ld	a4,0(a5)
    19ac:	8f29                	xor	a4,a4,a0
    19ae:	011706b3          	add	a3,a4,a7
    19b2:	fff74713          	not	a4,a4
    19b6:	8f75                	and	a4,a4,a3
    19b8:	01077733          	and	a4,a4,a6
    19bc:	d37d                	beqz	a4,19a2 <memchr+0x52>
{
    19be:	853e                	mv	a0,a5
    19c0:	97b2                	add	a5,a5,a2
    19c2:	a021                	j	19ca <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    19c4:	0505                	addi	a0,a0,1
    19c6:	00f50763          	beq	a0,a5,19d4 <memchr+0x84>
    19ca:	00054703          	lbu	a4,0(a0)
    19ce:	feb71be3          	bne	a4,a1,19c4 <memchr+0x74>
    19d2:	8082                	ret
    return n ? (void *)s : 0;
    19d4:	4501                	li	a0,0
}
    19d6:	8082                	ret
    return n ? (void *)s : 0;
    19d8:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    19da:	f275                	bnez	a2,19be <memchr+0x6e>
}
    19dc:	8082                	ret

00000000000019de <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19de:	1101                	addi	sp,sp,-32
    19e0:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19e2:	862e                	mv	a2,a1
{
    19e4:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19e6:	4581                	li	a1,0
{
    19e8:	e426                	sd	s1,8(sp)
    19ea:	ec06                	sd	ra,24(sp)
    19ec:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19ee:	f63ff0ef          	jal	ra,1950 <memchr>
    return p ? p - s : n;
    19f2:	c519                	beqz	a0,1a00 <strnlen+0x22>
}
    19f4:	60e2                	ld	ra,24(sp)
    19f6:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19f8:	8d05                	sub	a0,a0,s1
}
    19fa:	64a2                	ld	s1,8(sp)
    19fc:	6105                	addi	sp,sp,32
    19fe:	8082                	ret
    1a00:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1a02:	8522                	mv	a0,s0
}
    1a04:	6442                	ld	s0,16(sp)
    1a06:	64a2                	ld	s1,8(sp)
    1a08:	6105                	addi	sp,sp,32
    1a0a:	8082                	ret

0000000000001a0c <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a0c:	00a5c7b3          	xor	a5,a1,a0
    1a10:	8b9d                	andi	a5,a5,7
    1a12:	eb95                	bnez	a5,1a46 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a14:	0075f793          	andi	a5,a1,7
    1a18:	e7b1                	bnez	a5,1a64 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a1a:	6198                	ld	a4,0(a1)
    1a1c:	00000617          	auipc	a2,0x0
    1a20:	5d463603          	ld	a2,1492(a2) # 1ff0 <__clone+0xd8>
    1a24:	00000817          	auipc	a6,0x0
    1a28:	5d483803          	ld	a6,1492(a6) # 1ff8 <__clone+0xe0>
    1a2c:	a029                	j	1a36 <strcpy+0x2a>
    1a2e:	05a1                	addi	a1,a1,8
    1a30:	e118                	sd	a4,0(a0)
    1a32:	6198                	ld	a4,0(a1)
    1a34:	0521                	addi	a0,a0,8
    1a36:	00c707b3          	add	a5,a4,a2
    1a3a:	fff74693          	not	a3,a4
    1a3e:	8ff5                	and	a5,a5,a3
    1a40:	0107f7b3          	and	a5,a5,a6
    1a44:	d7ed                	beqz	a5,1a2e <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a46:	0005c783          	lbu	a5,0(a1)
    1a4a:	00f50023          	sb	a5,0(a0)
    1a4e:	c785                	beqz	a5,1a76 <strcpy+0x6a>
    1a50:	0015c783          	lbu	a5,1(a1)
    1a54:	0505                	addi	a0,a0,1
    1a56:	0585                	addi	a1,a1,1
    1a58:	00f50023          	sb	a5,0(a0)
    1a5c:	fbf5                	bnez	a5,1a50 <strcpy+0x44>
        ;
    return d;
}
    1a5e:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a60:	0505                	addi	a0,a0,1
    1a62:	df45                	beqz	a4,1a1a <strcpy+0xe>
            if (!(*d = *s))
    1a64:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a68:	0585                	addi	a1,a1,1
    1a6a:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1a6e:	00f50023          	sb	a5,0(a0)
    1a72:	f7fd                	bnez	a5,1a60 <strcpy+0x54>
}
    1a74:	8082                	ret
    1a76:	8082                	ret

0000000000001a78 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a78:	00a5c7b3          	xor	a5,a1,a0
    1a7c:	8b9d                	andi	a5,a5,7
    1a7e:	1a079863          	bnez	a5,1c2e <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a82:	0075f793          	andi	a5,a1,7
    1a86:	16078463          	beqz	a5,1bee <strncpy+0x176>
    1a8a:	ea01                	bnez	a2,1a9a <strncpy+0x22>
    1a8c:	a421                	j	1c94 <strncpy+0x21c>
    1a8e:	167d                	addi	a2,a2,-1
    1a90:	0505                	addi	a0,a0,1
    1a92:	14070e63          	beqz	a4,1bee <strncpy+0x176>
    1a96:	1a060863          	beqz	a2,1c46 <strncpy+0x1ce>
    1a9a:	0005c783          	lbu	a5,0(a1)
    1a9e:	0585                	addi	a1,a1,1
    1aa0:	0075f713          	andi	a4,a1,7
    1aa4:	00f50023          	sb	a5,0(a0)
    1aa8:	f3fd                	bnez	a5,1a8e <strncpy+0x16>
    1aaa:	4805                	li	a6,1
    1aac:	1a061863          	bnez	a2,1c5c <strncpy+0x1e4>
    1ab0:	40a007b3          	neg	a5,a0
    1ab4:	8b9d                	andi	a5,a5,7
    1ab6:	4681                	li	a3,0
    1ab8:	18061a63          	bnez	a2,1c4c <strncpy+0x1d4>
    1abc:	00778713          	addi	a4,a5,7
    1ac0:	45ad                	li	a1,11
    1ac2:	18b76363          	bltu	a4,a1,1c48 <strncpy+0x1d0>
    1ac6:	1ae6eb63          	bltu	a3,a4,1c7c <strncpy+0x204>
    1aca:	1a078363          	beqz	a5,1c70 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ace:	00050023          	sb	zero,0(a0)
    1ad2:	4685                	li	a3,1
    1ad4:	00150713          	addi	a4,a0,1
    1ad8:	18d78f63          	beq	a5,a3,1c76 <strncpy+0x1fe>
    1adc:	000500a3          	sb	zero,1(a0)
    1ae0:	4689                	li	a3,2
    1ae2:	00250713          	addi	a4,a0,2
    1ae6:	18d78e63          	beq	a5,a3,1c82 <strncpy+0x20a>
    1aea:	00050123          	sb	zero,2(a0)
    1aee:	468d                	li	a3,3
    1af0:	00350713          	addi	a4,a0,3
    1af4:	16d78c63          	beq	a5,a3,1c6c <strncpy+0x1f4>
    1af8:	000501a3          	sb	zero,3(a0)
    1afc:	4691                	li	a3,4
    1afe:	00450713          	addi	a4,a0,4
    1b02:	18d78263          	beq	a5,a3,1c86 <strncpy+0x20e>
    1b06:	00050223          	sb	zero,4(a0)
    1b0a:	4695                	li	a3,5
    1b0c:	00550713          	addi	a4,a0,5
    1b10:	16d78d63          	beq	a5,a3,1c8a <strncpy+0x212>
    1b14:	000502a3          	sb	zero,5(a0)
    1b18:	469d                	li	a3,7
    1b1a:	00650713          	addi	a4,a0,6
    1b1e:	16d79863          	bne	a5,a3,1c8e <strncpy+0x216>
    1b22:	00750713          	addi	a4,a0,7
    1b26:	00050323          	sb	zero,6(a0)
    1b2a:	40f80833          	sub	a6,a6,a5
    1b2e:	ff887593          	andi	a1,a6,-8
    1b32:	97aa                	add	a5,a5,a0
    1b34:	95be                	add	a1,a1,a5
    1b36:	0007b023          	sd	zero,0(a5)
    1b3a:	07a1                	addi	a5,a5,8
    1b3c:	feb79de3          	bne	a5,a1,1b36 <strncpy+0xbe>
    1b40:	ff887593          	andi	a1,a6,-8
    1b44:	9ead                	addw	a3,a3,a1
    1b46:	00b707b3          	add	a5,a4,a1
    1b4a:	12b80863          	beq	a6,a1,1c7a <strncpy+0x202>
    1b4e:	00078023          	sb	zero,0(a5)
    1b52:	0016871b          	addiw	a4,a3,1
    1b56:	0ec77863          	bgeu	a4,a2,1c46 <strncpy+0x1ce>
    1b5a:	000780a3          	sb	zero,1(a5)
    1b5e:	0026871b          	addiw	a4,a3,2
    1b62:	0ec77263          	bgeu	a4,a2,1c46 <strncpy+0x1ce>
    1b66:	00078123          	sb	zero,2(a5)
    1b6a:	0036871b          	addiw	a4,a3,3
    1b6e:	0cc77c63          	bgeu	a4,a2,1c46 <strncpy+0x1ce>
    1b72:	000781a3          	sb	zero,3(a5)
    1b76:	0046871b          	addiw	a4,a3,4
    1b7a:	0cc77663          	bgeu	a4,a2,1c46 <strncpy+0x1ce>
    1b7e:	00078223          	sb	zero,4(a5)
    1b82:	0056871b          	addiw	a4,a3,5
    1b86:	0cc77063          	bgeu	a4,a2,1c46 <strncpy+0x1ce>
    1b8a:	000782a3          	sb	zero,5(a5)
    1b8e:	0066871b          	addiw	a4,a3,6
    1b92:	0ac77a63          	bgeu	a4,a2,1c46 <strncpy+0x1ce>
    1b96:	00078323          	sb	zero,6(a5)
    1b9a:	0076871b          	addiw	a4,a3,7
    1b9e:	0ac77463          	bgeu	a4,a2,1c46 <strncpy+0x1ce>
    1ba2:	000783a3          	sb	zero,7(a5)
    1ba6:	0086871b          	addiw	a4,a3,8
    1baa:	08c77e63          	bgeu	a4,a2,1c46 <strncpy+0x1ce>
    1bae:	00078423          	sb	zero,8(a5)
    1bb2:	0096871b          	addiw	a4,a3,9
    1bb6:	08c77863          	bgeu	a4,a2,1c46 <strncpy+0x1ce>
    1bba:	000784a3          	sb	zero,9(a5)
    1bbe:	00a6871b          	addiw	a4,a3,10
    1bc2:	08c77263          	bgeu	a4,a2,1c46 <strncpy+0x1ce>
    1bc6:	00078523          	sb	zero,10(a5)
    1bca:	00b6871b          	addiw	a4,a3,11
    1bce:	06c77c63          	bgeu	a4,a2,1c46 <strncpy+0x1ce>
    1bd2:	000785a3          	sb	zero,11(a5)
    1bd6:	00c6871b          	addiw	a4,a3,12
    1bda:	06c77663          	bgeu	a4,a2,1c46 <strncpy+0x1ce>
    1bde:	00078623          	sb	zero,12(a5)
    1be2:	26b5                	addiw	a3,a3,13
    1be4:	06c6f163          	bgeu	a3,a2,1c46 <strncpy+0x1ce>
    1be8:	000786a3          	sb	zero,13(a5)
    1bec:	8082                	ret
            ;
        if (!n || !*s)
    1bee:	c645                	beqz	a2,1c96 <strncpy+0x21e>
    1bf0:	0005c783          	lbu	a5,0(a1)
    1bf4:	ea078be3          	beqz	a5,1aaa <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bf8:	479d                	li	a5,7
    1bfa:	02c7ff63          	bgeu	a5,a2,1c38 <strncpy+0x1c0>
    1bfe:	00000897          	auipc	a7,0x0
    1c02:	3f28b883          	ld	a7,1010(a7) # 1ff0 <__clone+0xd8>
    1c06:	00000817          	auipc	a6,0x0
    1c0a:	3f283803          	ld	a6,1010(a6) # 1ff8 <__clone+0xe0>
    1c0e:	431d                	li	t1,7
    1c10:	6198                	ld	a4,0(a1)
    1c12:	011707b3          	add	a5,a4,a7
    1c16:	fff74693          	not	a3,a4
    1c1a:	8ff5                	and	a5,a5,a3
    1c1c:	0107f7b3          	and	a5,a5,a6
    1c20:	ef81                	bnez	a5,1c38 <strncpy+0x1c0>
            *wd = *ws;
    1c22:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1c24:	1661                	addi	a2,a2,-8
    1c26:	05a1                	addi	a1,a1,8
    1c28:	0521                	addi	a0,a0,8
    1c2a:	fec363e3          	bltu	t1,a2,1c10 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1c2e:	e609                	bnez	a2,1c38 <strncpy+0x1c0>
    1c30:	a08d                	j	1c92 <strncpy+0x21a>
    1c32:	167d                	addi	a2,a2,-1
    1c34:	0505                	addi	a0,a0,1
    1c36:	ca01                	beqz	a2,1c46 <strncpy+0x1ce>
    1c38:	0005c783          	lbu	a5,0(a1)
    1c3c:	0585                	addi	a1,a1,1
    1c3e:	00f50023          	sb	a5,0(a0)
    1c42:	fbe5                	bnez	a5,1c32 <strncpy+0x1ba>
        ;
tail:
    1c44:	b59d                	j	1aaa <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1c46:	8082                	ret
    1c48:	472d                	li	a4,11
    1c4a:	bdb5                	j	1ac6 <strncpy+0x4e>
    1c4c:	00778713          	addi	a4,a5,7
    1c50:	45ad                	li	a1,11
    1c52:	fff60693          	addi	a3,a2,-1
    1c56:	e6b778e3          	bgeu	a4,a1,1ac6 <strncpy+0x4e>
    1c5a:	b7fd                	j	1c48 <strncpy+0x1d0>
    1c5c:	40a007b3          	neg	a5,a0
    1c60:	8832                	mv	a6,a2
    1c62:	8b9d                	andi	a5,a5,7
    1c64:	4681                	li	a3,0
    1c66:	e4060be3          	beqz	a2,1abc <strncpy+0x44>
    1c6a:	b7cd                	j	1c4c <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c6c:	468d                	li	a3,3
    1c6e:	bd75                	j	1b2a <strncpy+0xb2>
    1c70:	872a                	mv	a4,a0
    1c72:	4681                	li	a3,0
    1c74:	bd5d                	j	1b2a <strncpy+0xb2>
    1c76:	4685                	li	a3,1
    1c78:	bd4d                	j	1b2a <strncpy+0xb2>
    1c7a:	8082                	ret
    1c7c:	87aa                	mv	a5,a0
    1c7e:	4681                	li	a3,0
    1c80:	b5f9                	j	1b4e <strncpy+0xd6>
    1c82:	4689                	li	a3,2
    1c84:	b55d                	j	1b2a <strncpy+0xb2>
    1c86:	4691                	li	a3,4
    1c88:	b54d                	j	1b2a <strncpy+0xb2>
    1c8a:	4695                	li	a3,5
    1c8c:	bd79                	j	1b2a <strncpy+0xb2>
    1c8e:	4699                	li	a3,6
    1c90:	bd69                	j	1b2a <strncpy+0xb2>
    1c92:	8082                	ret
    1c94:	8082                	ret
    1c96:	8082                	ret

0000000000001c98 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c98:	87aa                	mv	a5,a0
    1c9a:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c9c:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1ca0:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ca4:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1ca6:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ca8:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1cac:	2501                	sext.w	a0,a0
    1cae:	8082                	ret

0000000000001cb0 <openat>:
    register long a7 __asm__("a7") = n;
    1cb0:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1cb4:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cb8:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1cbc:	2501                	sext.w	a0,a0
    1cbe:	8082                	ret

0000000000001cc0 <fcntl>:
    register long a7 __asm__("a7") = n;
    1cc0:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cc2:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1cc6:	2501                	sext.w	a0,a0
    1cc8:	8082                	ret

0000000000001cca <close>:
    register long a7 __asm__("a7") = n;
    1cca:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1cce:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1cd2:	2501                	sext.w	a0,a0
    1cd4:	8082                	ret

0000000000001cd6 <read>:
    register long a7 __asm__("a7") = n;
    1cd6:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cda:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1cde:	8082                	ret

0000000000001ce0 <write>:
    register long a7 __asm__("a7") = n;
    1ce0:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ce4:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1ce8:	8082                	ret

0000000000001cea <getpid>:
    register long a7 __asm__("a7") = n;
    1cea:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1cee:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1cf2:	2501                	sext.w	a0,a0
    1cf4:	8082                	ret

0000000000001cf6 <getppid>:
    register long a7 __asm__("a7") = n;
    1cf6:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1cfa:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cfe:	2501                	sext.w	a0,a0
    1d00:	8082                	ret

0000000000001d02 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d02:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d06:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d0a:	2501                	sext.w	a0,a0
    1d0c:	8082                	ret

0000000000001d0e <fork>:
    register long a7 __asm__("a7") = n;
    1d0e:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d12:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d14:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d16:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d1a:	2501                	sext.w	a0,a0
    1d1c:	8082                	ret

0000000000001d1e <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d1e:	85b2                	mv	a1,a2
    1d20:	863a                	mv	a2,a4
    if (stack)
    1d22:	c191                	beqz	a1,1d26 <clone+0x8>
	stack += stack_size;
    1d24:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d26:	4781                	li	a5,0
    1d28:	4701                	li	a4,0
    1d2a:	4681                	li	a3,0
    1d2c:	2601                	sext.w	a2,a2
    1d2e:	a2ed                	j	1f18 <__clone>

0000000000001d30 <exit>:
    register long a7 __asm__("a7") = n;
    1d30:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d34:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d38:	8082                	ret

0000000000001d3a <waitpid>:
    register long a7 __asm__("a7") = n;
    1d3a:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d3e:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d40:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d44:	2501                	sext.w	a0,a0
    1d46:	8082                	ret

0000000000001d48 <exec>:
    register long a7 __asm__("a7") = n;
    1d48:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d4c:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d50:	2501                	sext.w	a0,a0
    1d52:	8082                	ret

0000000000001d54 <execve>:
    register long a7 __asm__("a7") = n;
    1d54:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d58:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d5c:	2501                	sext.w	a0,a0
    1d5e:	8082                	ret

0000000000001d60 <times>:
    register long a7 __asm__("a7") = n;
    1d60:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d64:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d68:	2501                	sext.w	a0,a0
    1d6a:	8082                	ret

0000000000001d6c <get_time>:

int64 get_time()
{
    1d6c:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d6e:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d72:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d74:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d76:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d7a:	2501                	sext.w	a0,a0
    1d7c:	ed09                	bnez	a0,1d96 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d7e:	67a2                	ld	a5,8(sp)
    1d80:	3e800713          	li	a4,1000
    1d84:	00015503          	lhu	a0,0(sp)
    1d88:	02e7d7b3          	divu	a5,a5,a4
    1d8c:	02e50533          	mul	a0,a0,a4
    1d90:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d92:	0141                	addi	sp,sp,16
    1d94:	8082                	ret
        return -1;
    1d96:	557d                	li	a0,-1
    1d98:	bfed                	j	1d92 <get_time+0x26>

0000000000001d9a <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d9a:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d9e:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1da2:	2501                	sext.w	a0,a0
    1da4:	8082                	ret

0000000000001da6 <time>:
    register long a7 __asm__("a7") = n;
    1da6:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1daa:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1dae:	2501                	sext.w	a0,a0
    1db0:	8082                	ret

0000000000001db2 <sleep>:

int sleep(unsigned long long time)
{
    1db2:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1db4:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1db6:	850a                	mv	a0,sp
    1db8:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1dba:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1dbe:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc0:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1dc4:	e501                	bnez	a0,1dcc <sleep+0x1a>
    return 0;
    1dc6:	4501                	li	a0,0
}
    1dc8:	0141                	addi	sp,sp,16
    1dca:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1dcc:	4502                	lw	a0,0(sp)
}
    1dce:	0141                	addi	sp,sp,16
    1dd0:	8082                	ret

0000000000001dd2 <set_priority>:
    register long a7 __asm__("a7") = n;
    1dd2:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1dd6:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1dda:	2501                	sext.w	a0,a0
    1ddc:	8082                	ret

0000000000001dde <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1dde:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1de2:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1de6:	8082                	ret

0000000000001de8 <munmap>:
    register long a7 __asm__("a7") = n;
    1de8:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dec:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1df0:	2501                	sext.w	a0,a0
    1df2:	8082                	ret

0000000000001df4 <wait>:

int wait(int *code)
{
    1df4:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1df6:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1dfa:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1dfc:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1dfe:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e00:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e04:	2501                	sext.w	a0,a0
    1e06:	8082                	ret

0000000000001e08 <spawn>:
    register long a7 __asm__("a7") = n;
    1e08:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e0c:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e10:	2501                	sext.w	a0,a0
    1e12:	8082                	ret

0000000000001e14 <mailread>:
    register long a7 __asm__("a7") = n;
    1e14:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e18:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e1c:	2501                	sext.w	a0,a0
    1e1e:	8082                	ret

0000000000001e20 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e20:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e24:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <fstat>:
    register long a7 __asm__("a7") = n;
    1e2c:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e30:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e38:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e3a:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e3e:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e40:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e44:	2501                	sext.w	a0,a0
    1e46:	8082                	ret

0000000000001e48 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e48:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e4a:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e4e:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e50:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e54:	2501                	sext.w	a0,a0
    1e56:	8082                	ret

0000000000001e58 <link>:

int link(char *old_path, char *new_path)
{
    1e58:	87aa                	mv	a5,a0
    1e5a:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e5c:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e60:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e64:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e66:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e6a:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e6c:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e70:	2501                	sext.w	a0,a0
    1e72:	8082                	ret

0000000000001e74 <unlink>:

int unlink(char *path)
{
    1e74:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e76:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e7a:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e7e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e80:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e84:	2501                	sext.w	a0,a0
    1e86:	8082                	ret

0000000000001e88 <uname>:
    register long a7 __asm__("a7") = n;
    1e88:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e8c:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e90:	2501                	sext.w	a0,a0
    1e92:	8082                	ret

0000000000001e94 <brk>:
    register long a7 __asm__("a7") = n;
    1e94:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e98:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e9c:	2501                	sext.w	a0,a0
    1e9e:	8082                	ret

0000000000001ea0 <getcwd>:
    register long a7 __asm__("a7") = n;
    1ea0:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea2:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1ea6:	8082                	ret

0000000000001ea8 <chdir>:
    register long a7 __asm__("a7") = n;
    1ea8:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1eac:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1eb0:	2501                	sext.w	a0,a0
    1eb2:	8082                	ret

0000000000001eb4 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1eb4:	862e                	mv	a2,a1
    1eb6:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1eb8:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1eba:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1ebe:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ec2:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1ec4:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ec6:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1eca:	2501                	sext.w	a0,a0
    1ecc:	8082                	ret

0000000000001ece <getdents>:
    register long a7 __asm__("a7") = n;
    1ece:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ed2:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1ed6:	2501                	sext.w	a0,a0
    1ed8:	8082                	ret

0000000000001eda <pipe>:
    register long a7 __asm__("a7") = n;
    1eda:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1ede:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ee0:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1ee4:	2501                	sext.w	a0,a0
    1ee6:	8082                	ret

0000000000001ee8 <dup>:
    register long a7 __asm__("a7") = n;
    1ee8:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1eea:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1eee:	2501                	sext.w	a0,a0
    1ef0:	8082                	ret

0000000000001ef2 <dup2>:
    register long a7 __asm__("a7") = n;
    1ef2:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1ef4:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ef6:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1efa:	2501                	sext.w	a0,a0
    1efc:	8082                	ret

0000000000001efe <mount>:
    register long a7 __asm__("a7") = n;
    1efe:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f02:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f06:	2501                	sext.w	a0,a0
    1f08:	8082                	ret

0000000000001f0a <umount>:
    register long a7 __asm__("a7") = n;
    1f0a:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f0e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f10:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f14:	2501                	sext.w	a0,a0
    1f16:	8082                	ret

0000000000001f18 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f18:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1f1a:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f1c:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f1e:	8532                	mv	a0,a2
	mv a2, a4
    1f20:	863a                	mv	a2,a4
	mv a3, a5
    1f22:	86be                	mv	a3,a5
	mv a4, a6
    1f24:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f26:	0dc00893          	li	a7,220
	ecall
    1f2a:	00000073          	ecall

	beqz a0, 1f
    1f2e:	c111                	beqz	a0,1f32 <__clone+0x1a>
	# Parent
	ret
    1f30:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f32:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f34:	6522                	ld	a0,8(sp)
	jalr a1
    1f36:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f38:	05d00893          	li	a7,93
	ecall
    1f3c:	00000073          	ecall
