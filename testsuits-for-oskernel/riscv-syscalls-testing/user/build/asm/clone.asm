
/home/brightnight/OScompetition/6.13晚final_main/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/clone：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a0f5                	j	10ee <__start_main>

0000000000001004 <child_func>:
#include "unistd.h"

size_t stack[1024] = {0};
static int child_pid;

static int child_func(void){
    1004:	1141                	addi	sp,sp,-16
    printf("  Child says successfully!\n");
    1006:	00001517          	auipc	a0,0x1
    100a:	f3250513          	addi	a0,a0,-206 # 1f38 <__clone+0x2c>
static int child_func(void){
    100e:	e406                	sd	ra,8(sp)
    printf("  Child says successfully!\n");
    1010:	372000ef          	jal	ra,1382 <printf>
    return 0;
}
    1014:	60a2                	ld	ra,8(sp)
    1016:	4501                	li	a0,0
    1018:	0141                	addi	sp,sp,16
    101a:	8082                	ret

000000000000101c <test_clone>:

void test_clone(void){
    101c:	1101                	addi	sp,sp,-32
    TEST_START(__func__);
    101e:	00001517          	auipc	a0,0x1
    1022:	f3a50513          	addi	a0,a0,-198 # 1f58 <__clone+0x4c>
void test_clone(void){
    1026:	ec06                	sd	ra,24(sp)
    1028:	e822                	sd	s0,16(sp)
    TEST_START(__func__);
    102a:	336000ef          	jal	ra,1360 <puts>
    102e:	00003517          	auipc	a0,0x3
    1032:	fea50513          	addi	a0,a0,-22 # 4018 <__func__.0>
    1036:	32a000ef          	jal	ra,1360 <puts>
    103a:	00001517          	auipc	a0,0x1
    103e:	f3650513          	addi	a0,a0,-202 # 1f70 <__clone+0x64>
    1042:	31e000ef          	jal	ra,1360 <puts>
    int wstatus;
    child_pid = clone(child_func, NULL, stack, 1024, SIGCHLD);
    1046:	4745                	li	a4,17
    1048:	40000693          	li	a3,1024
    104c:	00001617          	auipc	a2,0x1
    1050:	fc460613          	addi	a2,a2,-60 # 2010 <stack>
    1054:	4581                	li	a1,0
    1056:	00000517          	auipc	a0,0x0
    105a:	fae50513          	addi	a0,a0,-82 # 1004 <child_func>
    105e:	4b5000ef          	jal	ra,1d12 <clone>
    1062:	00003417          	auipc	s0,0x3
    1066:	fae40413          	addi	s0,s0,-82 # 4010 <child_pid>
    106a:	c008                	sw	a0,0(s0)
    assert(child_pid != -1);
    106c:	57fd                	li	a5,-1
    106e:	04f50863          	beq	a0,a5,10be <test_clone+0xa2>
    if (child_pid == 0){
    1072:	e90d                	bnez	a0,10a4 <test_clone+0x88>
	exit(0);
    1074:	4b1000ef          	jal	ra,1d24 <exit>
	    printf("clone process successfully.\npid:%d\n", child_pid);
	else
	    printf("clone process error.\n");
    }

    TEST_END(__func__);
    1078:	00001517          	auipc	a0,0x1
    107c:	f6850513          	addi	a0,a0,-152 # 1fe0 <__clone+0xd4>
    1080:	2e0000ef          	jal	ra,1360 <puts>
    1084:	00003517          	auipc	a0,0x3
    1088:	f9450513          	addi	a0,a0,-108 # 4018 <__func__.0>
    108c:	2d4000ef          	jal	ra,1360 <puts>
    1090:	00001517          	auipc	a0,0x1
    1094:	ee050513          	addi	a0,a0,-288 # 1f70 <__clone+0x64>
    1098:	2c8000ef          	jal	ra,1360 <puts>
}
    109c:	60e2                	ld	ra,24(sp)
    109e:	6442                	ld	s0,16(sp)
    10a0:	6105                	addi	sp,sp,32
    10a2:	8082                	ret
	if(wait(&wstatus) == child_pid)
    10a4:	0068                	addi	a0,sp,12
    10a6:	543000ef          	jal	ra,1de8 <wait>
    10aa:	401c                	lw	a5,0(s0)
    10ac:	02f50163          	beq	a0,a5,10ce <test_clone+0xb2>
	    printf("clone process error.\n");
    10b0:	00001517          	auipc	a0,0x1
    10b4:	f1850513          	addi	a0,a0,-232 # 1fc8 <__clone+0xbc>
    10b8:	2ca000ef          	jal	ra,1382 <printf>
    10bc:	bf75                	j	1078 <test_clone+0x5c>
    assert(child_pid != -1);
    10be:	00001517          	auipc	a0,0x1
    10c2:	ec250513          	addi	a0,a0,-318 # 1f80 <__clone+0x74>
    10c6:	540000ef          	jal	ra,1606 <panic>
    if (child_pid == 0){
    10ca:	4008                	lw	a0,0(s0)
    10cc:	b75d                	j	1072 <test_clone+0x56>
	    printf("clone process successfully.\npid:%d\n", child_pid);
    10ce:	85aa                	mv	a1,a0
    10d0:	00001517          	auipc	a0,0x1
    10d4:	ed050513          	addi	a0,a0,-304 # 1fa0 <__clone+0x94>
    10d8:	2aa000ef          	jal	ra,1382 <printf>
    10dc:	bf71                	j	1078 <test_clone+0x5c>

00000000000010de <main>:

int main(void){
    10de:	1141                	addi	sp,sp,-16
    10e0:	e406                	sd	ra,8(sp)
    test_clone();
    10e2:	f3bff0ef          	jal	ra,101c <test_clone>
    return 0;
}
    10e6:	60a2                	ld	ra,8(sp)
    10e8:	4501                	li	a0,0
    10ea:	0141                	addi	sp,sp,16
    10ec:	8082                	ret

00000000000010ee <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10ee:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10f0:	4108                	lw	a0,0(a0)
{
    10f2:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10f4:	05a1                	addi	a1,a1,8
{
    10f6:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10f8:	fe7ff0ef          	jal	ra,10de <main>
    10fc:	429000ef          	jal	ra,1d24 <exit>
	return 0;
}
    1100:	60a2                	ld	ra,8(sp)
    1102:	4501                	li	a0,0
    1104:	0141                	addi	sp,sp,16
    1106:	8082                	ret

0000000000001108 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1108:	7179                	addi	sp,sp,-48
    110a:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    110c:	12054b63          	bltz	a0,1242 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1110:	02b577bb          	remuw	a5,a0,a1
    1114:	00003617          	auipc	a2,0x3
    1118:	f1460613          	addi	a2,a2,-236 # 4028 <digits>
    buf[16] = 0;
    111c:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1120:	0005871b          	sext.w	a4,a1
    1124:	1782                	slli	a5,a5,0x20
    1126:	9381                	srli	a5,a5,0x20
    1128:	97b2                	add	a5,a5,a2
    112a:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    112e:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1132:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1136:	1cb56363          	bltu	a0,a1,12fc <printint.constprop.0+0x1f4>
        buf[i--] = digits[x % base];
    113a:	45b9                	li	a1,14
    113c:	02e877bb          	remuw	a5,a6,a4
    1140:	1782                	slli	a5,a5,0x20
    1142:	9381                	srli	a5,a5,0x20
    1144:	97b2                	add	a5,a5,a2
    1146:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    114a:	02e856bb          	divuw	a3,a6,a4
        buf[i--] = digits[x % base];
    114e:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    1152:	0ce86e63          	bltu	a6,a4,122e <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    1156:	02e6f5bb          	remuw	a1,a3,a4
    } while ((x /= base) != 0);
    115a:	02e6d7bb          	divuw	a5,a3,a4
        buf[i--] = digits[x % base];
    115e:	1582                	slli	a1,a1,0x20
    1160:	9181                	srli	a1,a1,0x20
    1162:	95b2                	add	a1,a1,a2
    1164:	0005c583          	lbu	a1,0(a1)
    1168:	00b10aa3          	sb	a1,21(sp)
    } while ((x /= base) != 0);
    116c:	0007859b          	sext.w	a1,a5
    1170:	12e6ec63          	bltu	a3,a4,12a8 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    1174:	02e7f6bb          	remuw	a3,a5,a4
    1178:	1682                	slli	a3,a3,0x20
    117a:	9281                	srli	a3,a3,0x20
    117c:	96b2                	add	a3,a3,a2
    117e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1182:	02e7d83b          	divuw	a6,a5,a4
        buf[i--] = digits[x % base];
    1186:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    118a:	12e5e863          	bltu	a1,a4,12ba <printint.constprop.0+0x1b2>
        buf[i--] = digits[x % base];
    118e:	02e876bb          	remuw	a3,a6,a4
    1192:	1682                	slli	a3,a3,0x20
    1194:	9281                	srli	a3,a3,0x20
    1196:	96b2                	add	a3,a3,a2
    1198:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    119c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11a0:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    11a4:	12e86463          	bltu	a6,a4,12cc <printint.constprop.0+0x1c4>
        buf[i--] = digits[x % base];
    11a8:	02e5f6bb          	remuw	a3,a1,a4
    11ac:	1682                	slli	a3,a3,0x20
    11ae:	9281                	srli	a3,a3,0x20
    11b0:	96b2                	add	a3,a3,a2
    11b2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11b6:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11ba:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    11be:	0ce5ec63          	bltu	a1,a4,1296 <printint.constprop.0+0x18e>
        buf[i--] = digits[x % base];
    11c2:	02e876bb          	remuw	a3,a6,a4
    11c6:	1682                	slli	a3,a3,0x20
    11c8:	9281                	srli	a3,a3,0x20
    11ca:	96b2                	add	a3,a3,a2
    11cc:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11d0:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11d4:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11d8:	10e86963          	bltu	a6,a4,12ea <printint.constprop.0+0x1e2>
        buf[i--] = digits[x % base];
    11dc:	02e5f6bb          	remuw	a3,a1,a4
    11e0:	1682                	slli	a3,a3,0x20
    11e2:	9281                	srli	a3,a3,0x20
    11e4:	96b2                	add	a3,a3,a2
    11e6:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11ea:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11ee:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11f2:	10e5e763          	bltu	a1,a4,1300 <printint.constprop.0+0x1f8>
        buf[i--] = digits[x % base];
    11f6:	02e876bb          	remuw	a3,a6,a4
    11fa:	1682                	slli	a3,a3,0x20
    11fc:	9281                	srli	a3,a3,0x20
    11fe:	96b2                	add	a3,a3,a2
    1200:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1204:	02e857bb          	divuw	a5,a6,a4
        buf[i--] = digits[x % base];
    1208:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    120c:	10e86363          	bltu	a6,a4,1312 <printint.constprop.0+0x20a>
        buf[i--] = digits[x % base];
    1210:	1782                	slli	a5,a5,0x20
    1212:	9381                	srli	a5,a5,0x20
    1214:	97b2                	add	a5,a5,a2
    1216:	0007c783          	lbu	a5,0(a5)
    121a:	4599                	li	a1,6
    121c:	00f10723          	sb	a5,14(sp)

    if (sign)
    1220:	00055763          	bgez	a0,122e <printint.constprop.0+0x126>
        buf[i--] = '-';
    1224:	02d00793          	li	a5,45
    1228:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    122c:	4595                	li	a1,5
    write(f, s, l);
    122e:	003c                	addi	a5,sp,8
    1230:	4641                	li	a2,16
    1232:	9e0d                	subw	a2,a2,a1
    1234:	4505                	li	a0,1
    1236:	95be                	add	a1,a1,a5
    1238:	29d000ef          	jal	ra,1cd4 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    123c:	70a2                	ld	ra,40(sp)
    123e:	6145                	addi	sp,sp,48
    1240:	8082                	ret
        x = -xx;
    1242:	40a0083b          	negw	a6,a0
        buf[i--] = digits[x % base];
    1246:	02b877bb          	remuw	a5,a6,a1
    124a:	00003617          	auipc	a2,0x3
    124e:	dde60613          	addi	a2,a2,-546 # 4028 <digits>
    buf[16] = 0;
    1252:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1256:	0005871b          	sext.w	a4,a1
    125a:	1782                	slli	a5,a5,0x20
    125c:	9381                	srli	a5,a5,0x20
    125e:	97b2                	add	a5,a5,a2
    1260:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1264:	02b858bb          	divuw	a7,a6,a1
        buf[i--] = digits[x % base];
    1268:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    126c:	06b86963          	bltu	a6,a1,12de <printint.constprop.0+0x1d6>
        buf[i--] = digits[x % base];
    1270:	02e8f7bb          	remuw	a5,a7,a4
    1274:	1782                	slli	a5,a5,0x20
    1276:	9381                	srli	a5,a5,0x20
    1278:	97b2                	add	a5,a5,a2
    127a:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    127e:	02e8d6bb          	divuw	a3,a7,a4
        buf[i--] = digits[x % base];
    1282:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    1286:	ece8f8e3          	bgeu	a7,a4,1156 <printint.constprop.0+0x4e>
        buf[i--] = '-';
    128a:	02d00793          	li	a5,45
    128e:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1292:	45b5                	li	a1,13
    1294:	bf69                	j	122e <printint.constprop.0+0x126>
    1296:	45a9                	li	a1,10
    if (sign)
    1298:	f8055be3          	bgez	a0,122e <printint.constprop.0+0x126>
        buf[i--] = '-';
    129c:	02d00793          	li	a5,45
    12a0:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    12a4:	45a5                	li	a1,9
    12a6:	b761                	j	122e <printint.constprop.0+0x126>
    12a8:	45b5                	li	a1,13
    if (sign)
    12aa:	f80552e3          	bgez	a0,122e <printint.constprop.0+0x126>
        buf[i--] = '-';
    12ae:	02d00793          	li	a5,45
    12b2:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    12b6:	45b1                	li	a1,12
    12b8:	bf9d                	j	122e <printint.constprop.0+0x126>
    12ba:	45b1                	li	a1,12
    if (sign)
    12bc:	f60559e3          	bgez	a0,122e <printint.constprop.0+0x126>
        buf[i--] = '-';
    12c0:	02d00793          	li	a5,45
    12c4:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12c8:	45ad                	li	a1,11
    12ca:	b795                	j	122e <printint.constprop.0+0x126>
    12cc:	45ad                	li	a1,11
    if (sign)
    12ce:	f60550e3          	bgez	a0,122e <printint.constprop.0+0x126>
        buf[i--] = '-';
    12d2:	02d00793          	li	a5,45
    12d6:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12da:	45a9                	li	a1,10
    12dc:	bf89                	j	122e <printint.constprop.0+0x126>
        buf[i--] = '-';
    12de:	02d00793          	li	a5,45
    12e2:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12e6:	45b9                	li	a1,14
    12e8:	b799                	j	122e <printint.constprop.0+0x126>
    12ea:	45a5                	li	a1,9
    if (sign)
    12ec:	f40551e3          	bgez	a0,122e <printint.constprop.0+0x126>
        buf[i--] = '-';
    12f0:	02d00793          	li	a5,45
    12f4:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12f8:	45a1                	li	a1,8
    12fa:	bf15                	j	122e <printint.constprop.0+0x126>
    i = 15;
    12fc:	45bd                	li	a1,15
    12fe:	bf05                	j	122e <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    1300:	45a1                	li	a1,8
    if (sign)
    1302:	f20556e3          	bgez	a0,122e <printint.constprop.0+0x126>
        buf[i--] = '-';
    1306:	02d00793          	li	a5,45
    130a:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    130e:	459d                	li	a1,7
    1310:	bf39                	j	122e <printint.constprop.0+0x126>
    1312:	459d                	li	a1,7
    if (sign)
    1314:	f0055de3          	bgez	a0,122e <printint.constprop.0+0x126>
        buf[i--] = '-';
    1318:	02d00793          	li	a5,45
    131c:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1320:	4599                	li	a1,6
    1322:	b731                	j	122e <printint.constprop.0+0x126>

0000000000001324 <getchar>:
{
    1324:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1326:	00f10593          	addi	a1,sp,15
    132a:	4605                	li	a2,1
    132c:	4501                	li	a0,0
{
    132e:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1330:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1334:	197000ef          	jal	ra,1cca <read>
}
    1338:	60e2                	ld	ra,24(sp)
    133a:	00f14503          	lbu	a0,15(sp)
    133e:	6105                	addi	sp,sp,32
    1340:	8082                	ret

0000000000001342 <putchar>:
{
    1342:	1101                	addi	sp,sp,-32
    1344:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1346:	00f10593          	addi	a1,sp,15
    134a:	4605                	li	a2,1
    134c:	4505                	li	a0,1
{
    134e:	ec06                	sd	ra,24(sp)
    char byte = c;
    1350:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1354:	181000ef          	jal	ra,1cd4 <write>
}
    1358:	60e2                	ld	ra,24(sp)
    135a:	2501                	sext.w	a0,a0
    135c:	6105                	addi	sp,sp,32
    135e:	8082                	ret

0000000000001360 <puts>:
{
    1360:	1141                	addi	sp,sp,-16
    1362:	e406                	sd	ra,8(sp)
    1364:	e022                	sd	s0,0(sp)
    1366:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1368:	57e000ef          	jal	ra,18e6 <strlen>
    136c:	862a                	mv	a2,a0
    136e:	85a2                	mv	a1,s0
    1370:	4505                	li	a0,1
    1372:	163000ef          	jal	ra,1cd4 <write>
}
    1376:	60a2                	ld	ra,8(sp)
    1378:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    137a:	957d                	srai	a0,a0,0x3f
    return r;
    137c:	2501                	sext.w	a0,a0
}
    137e:	0141                	addi	sp,sp,16
    1380:	8082                	ret

0000000000001382 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1382:	7171                	addi	sp,sp,-176
    1384:	fc56                	sd	s5,56(sp)
    1386:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1388:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    138a:	18bc                	addi	a5,sp,120
{
    138c:	e8ca                	sd	s2,80(sp)
    138e:	e4ce                	sd	s3,72(sp)
    1390:	e0d2                	sd	s4,64(sp)
    1392:	f85a                	sd	s6,48(sp)
    1394:	f486                	sd	ra,104(sp)
    1396:	f0a2                	sd	s0,96(sp)
    1398:	eca6                	sd	s1,88(sp)
    139a:	fcae                	sd	a1,120(sp)
    139c:	e132                	sd	a2,128(sp)
    139e:	e536                	sd	a3,136(sp)
    13a0:	e93a                	sd	a4,144(sp)
    13a2:	f142                	sd	a6,160(sp)
    13a4:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    13a6:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    13a8:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    13ac:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    13b0:	00001b17          	auipc	s6,0x1
    13b4:	c40b0b13          	addi	s6,s6,-960 # 1ff0 <__clone+0xe4>
    buf[i++] = '0';
    13b8:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13bc:	00003997          	auipc	s3,0x3
    13c0:	c6c98993          	addi	s3,s3,-916 # 4028 <digits>
        if (!*s)
    13c4:	00054783          	lbu	a5,0(a0)
    13c8:	16078a63          	beqz	a5,153c <printf+0x1ba>
    13cc:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13ce:	19278163          	beq	a5,s2,1550 <printf+0x1ce>
    13d2:	00164783          	lbu	a5,1(a2)
    13d6:	0605                	addi	a2,a2,1
    13d8:	fbfd                	bnez	a5,13ce <printf+0x4c>
    13da:	84b2                	mv	s1,a2
        l = z - a;
    13dc:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13e0:	85aa                	mv	a1,a0
    13e2:	8622                	mv	a2,s0
    13e4:	4505                	li	a0,1
    13e6:	0ef000ef          	jal	ra,1cd4 <write>
        if (l)
    13ea:	18041c63          	bnez	s0,1582 <printf+0x200>
        if (s[1] == 0)
    13ee:	0014c783          	lbu	a5,1(s1)
    13f2:	14078563          	beqz	a5,153c <printf+0x1ba>
        switch (s[1])
    13f6:	1d478063          	beq	a5,s4,15b6 <printf+0x234>
    13fa:	18fa6663          	bltu	s4,a5,1586 <printf+0x204>
    13fe:	06400713          	li	a4,100
    1402:	1ae78063          	beq	a5,a4,15a2 <printf+0x220>
    1406:	07000713          	li	a4,112
    140a:	1ce79963          	bne	a5,a4,15dc <printf+0x25a>
            printptr(va_arg(ap, uint64));
    140e:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1410:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1414:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1416:	631c                	ld	a5,0(a4)
    1418:	0721                	addi	a4,a4,8
    141a:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    141c:	00479293          	slli	t0,a5,0x4
    1420:	00879f93          	slli	t6,a5,0x8
    1424:	00c79f13          	slli	t5,a5,0xc
    1428:	01079e93          	slli	t4,a5,0x10
    142c:	01479e13          	slli	t3,a5,0x14
    1430:	01879313          	slli	t1,a5,0x18
    1434:	01c79893          	slli	a7,a5,0x1c
    1438:	02479813          	slli	a6,a5,0x24
    143c:	02879513          	slli	a0,a5,0x28
    1440:	02c79593          	slli	a1,a5,0x2c
    1444:	03079693          	slli	a3,a5,0x30
    1448:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    144c:	03c7d413          	srli	s0,a5,0x3c
    1450:	01c7d39b          	srliw	t2,a5,0x1c
    1454:	03c2d293          	srli	t0,t0,0x3c
    1458:	03cfdf93          	srli	t6,t6,0x3c
    145c:	03cf5f13          	srli	t5,t5,0x3c
    1460:	03cede93          	srli	t4,t4,0x3c
    1464:	03ce5e13          	srli	t3,t3,0x3c
    1468:	03c35313          	srli	t1,t1,0x3c
    146c:	03c8d893          	srli	a7,a7,0x3c
    1470:	03c85813          	srli	a6,a6,0x3c
    1474:	9171                	srli	a0,a0,0x3c
    1476:	91f1                	srli	a1,a1,0x3c
    1478:	92f1                	srli	a3,a3,0x3c
    147a:	9371                	srli	a4,a4,0x3c
    147c:	96ce                	add	a3,a3,s3
    147e:	974e                	add	a4,a4,s3
    1480:	944e                	add	s0,s0,s3
    1482:	92ce                	add	t0,t0,s3
    1484:	9fce                	add	t6,t6,s3
    1486:	9f4e                	add	t5,t5,s3
    1488:	9ece                	add	t4,t4,s3
    148a:	9e4e                	add	t3,t3,s3
    148c:	934e                	add	t1,t1,s3
    148e:	98ce                	add	a7,a7,s3
    1490:	93ce                	add	t2,t2,s3
    1492:	984e                	add	a6,a6,s3
    1494:	954e                	add	a0,a0,s3
    1496:	95ce                	add	a1,a1,s3
    1498:	0006c083          	lbu	ra,0(a3)
    149c:	0002c283          	lbu	t0,0(t0)
    14a0:	00074683          	lbu	a3,0(a4)
    14a4:	000fcf83          	lbu	t6,0(t6)
    14a8:	000f4f03          	lbu	t5,0(t5)
    14ac:	000ece83          	lbu	t4,0(t4)
    14b0:	000e4e03          	lbu	t3,0(t3)
    14b4:	00034303          	lbu	t1,0(t1)
    14b8:	0008c883          	lbu	a7,0(a7)
    14bc:	0003c383          	lbu	t2,0(t2)
    14c0:	00084803          	lbu	a6,0(a6)
    14c4:	00054503          	lbu	a0,0(a0)
    14c8:	0005c583          	lbu	a1,0(a1)
    14cc:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14d0:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14d4:	9371                	srli	a4,a4,0x3c
    14d6:	8bbd                	andi	a5,a5,15
    14d8:	974e                	add	a4,a4,s3
    14da:	97ce                	add	a5,a5,s3
    14dc:	005105a3          	sb	t0,11(sp)
    14e0:	01f10623          	sb	t6,12(sp)
    14e4:	01e106a3          	sb	t5,13(sp)
    14e8:	01d10723          	sb	t4,14(sp)
    14ec:	01c107a3          	sb	t3,15(sp)
    14f0:	00610823          	sb	t1,16(sp)
    14f4:	011108a3          	sb	a7,17(sp)
    14f8:	00710923          	sb	t2,18(sp)
    14fc:	010109a3          	sb	a6,19(sp)
    1500:	00a10a23          	sb	a0,20(sp)
    1504:	00b10aa3          	sb	a1,21(sp)
    1508:	00110b23          	sb	ra,22(sp)
    150c:	00d10ba3          	sb	a3,23(sp)
    1510:	00810523          	sb	s0,10(sp)
    1514:	00074703          	lbu	a4,0(a4)
    1518:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    151c:	002c                	addi	a1,sp,8
    151e:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1520:	00e10c23          	sb	a4,24(sp)
    1524:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1528:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    152c:	7a8000ef          	jal	ra,1cd4 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1530:	00248513          	addi	a0,s1,2
        if (!*s)
    1534:	00054783          	lbu	a5,0(a0)
    1538:	e8079ae3          	bnez	a5,13cc <printf+0x4a>
    }
    va_end(ap);
}
    153c:	70a6                	ld	ra,104(sp)
    153e:	7406                	ld	s0,96(sp)
    1540:	64e6                	ld	s1,88(sp)
    1542:	6946                	ld	s2,80(sp)
    1544:	69a6                	ld	s3,72(sp)
    1546:	6a06                	ld	s4,64(sp)
    1548:	7ae2                	ld	s5,56(sp)
    154a:	7b42                	ld	s6,48(sp)
    154c:	614d                	addi	sp,sp,176
    154e:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1550:	00064783          	lbu	a5,0(a2)
    1554:	84b2                	mv	s1,a2
    1556:	01278963          	beq	a5,s2,1568 <printf+0x1e6>
    155a:	b549                	j	13dc <printf+0x5a>
    155c:	0024c783          	lbu	a5,2(s1)
    1560:	0605                	addi	a2,a2,1
    1562:	0489                	addi	s1,s1,2
    1564:	e7279ce3          	bne	a5,s2,13dc <printf+0x5a>
    1568:	0014c783          	lbu	a5,1(s1)
    156c:	ff2788e3          	beq	a5,s2,155c <printf+0x1da>
        l = z - a;
    1570:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1574:	85aa                	mv	a1,a0
    1576:	8622                	mv	a2,s0
    1578:	4505                	li	a0,1
    157a:	75a000ef          	jal	ra,1cd4 <write>
        if (l)
    157e:	e60408e3          	beqz	s0,13ee <printf+0x6c>
    1582:	8526                	mv	a0,s1
    1584:	b581                	j	13c4 <printf+0x42>
        switch (s[1])
    1586:	07800713          	li	a4,120
    158a:	04e79963          	bne	a5,a4,15dc <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    158e:	6782                	ld	a5,0(sp)
    1590:	45c1                	li	a1,16
    1592:	4388                	lw	a0,0(a5)
    1594:	07a1                	addi	a5,a5,8
    1596:	e03e                	sd	a5,0(sp)
    1598:	b71ff0ef          	jal	ra,1108 <printint.constprop.0>
        s += 2;
    159c:	00248513          	addi	a0,s1,2
    15a0:	bf51                	j	1534 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    15a2:	6782                	ld	a5,0(sp)
    15a4:	45a9                	li	a1,10
    15a6:	4388                	lw	a0,0(a5)
    15a8:	07a1                	addi	a5,a5,8
    15aa:	e03e                	sd	a5,0(sp)
    15ac:	b5dff0ef          	jal	ra,1108 <printint.constprop.0>
        s += 2;
    15b0:	00248513          	addi	a0,s1,2
    15b4:	b741                	j	1534 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    15b6:	6782                	ld	a5,0(sp)
    15b8:	6380                	ld	s0,0(a5)
    15ba:	07a1                	addi	a5,a5,8
    15bc:	e03e                	sd	a5,0(sp)
    15be:	c031                	beqz	s0,1602 <printf+0x280>
            l = strnlen(a, 200);
    15c0:	0c800593          	li	a1,200
    15c4:	8522                	mv	a0,s0
    15c6:	40c000ef          	jal	ra,19d2 <strnlen>
    write(f, s, l);
    15ca:	0005061b          	sext.w	a2,a0
    15ce:	85a2                	mv	a1,s0
    15d0:	4505                	li	a0,1
    15d2:	702000ef          	jal	ra,1cd4 <write>
        s += 2;
    15d6:	00248513          	addi	a0,s1,2
    15da:	bfa9                	j	1534 <printf+0x1b2>
    return write(stdout, &byte, 1);
    15dc:	4605                	li	a2,1
    15de:	002c                	addi	a1,sp,8
    15e0:	4505                	li	a0,1
    char byte = c;
    15e2:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15e6:	6ee000ef          	jal	ra,1cd4 <write>
    char byte = c;
    15ea:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15ee:	4605                	li	a2,1
    15f0:	002c                	addi	a1,sp,8
    15f2:	4505                	li	a0,1
    char byte = c;
    15f4:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15f8:	6dc000ef          	jal	ra,1cd4 <write>
        s += 2;
    15fc:	00248513          	addi	a0,s1,2
    1600:	bf15                	j	1534 <printf+0x1b2>
                a = "(null)";
    1602:	845a                	mv	s0,s6
    1604:	bf75                	j	15c0 <printf+0x23e>

0000000000001606 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1606:	1141                	addi	sp,sp,-16
    1608:	e406                	sd	ra,8(sp)
    puts(m);
    160a:	d57ff0ef          	jal	ra,1360 <puts>
    exit(-100);
}
    160e:	60a2                	ld	ra,8(sp)
    exit(-100);
    1610:	f9c00513          	li	a0,-100
}
    1614:	0141                	addi	sp,sp,16
    exit(-100);
    1616:	a739                	j	1d24 <exit>

0000000000001618 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1618:	02000793          	li	a5,32
    161c:	00f50663          	beq	a0,a5,1628 <isspace+0x10>
    1620:	355d                	addiw	a0,a0,-9
    1622:	00553513          	sltiu	a0,a0,5
    1626:	8082                	ret
    1628:	4505                	li	a0,1
}
    162a:	8082                	ret

000000000000162c <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    162c:	fd05051b          	addiw	a0,a0,-48
}
    1630:	00a53513          	sltiu	a0,a0,10
    1634:	8082                	ret

0000000000001636 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1636:	02000613          	li	a2,32
    163a:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    163c:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1640:	ff77869b          	addiw	a3,a5,-9
    1644:	04c78c63          	beq	a5,a2,169c <atoi+0x66>
    1648:	0007871b          	sext.w	a4,a5
    164c:	04d5f863          	bgeu	a1,a3,169c <atoi+0x66>
        s++;
    switch (*s)
    1650:	02b00693          	li	a3,43
    1654:	04d78963          	beq	a5,a3,16a6 <atoi+0x70>
    1658:	02d00693          	li	a3,45
    165c:	06d78263          	beq	a5,a3,16c0 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1660:	fd07061b          	addiw	a2,a4,-48
    1664:	47a5                	li	a5,9
    1666:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1668:	4e01                	li	t3,0
    while (isdigit(*s))
    166a:	04c7e963          	bltu	a5,a2,16bc <atoi+0x86>
    int n = 0, neg = 0;
    166e:	4501                	li	a0,0
    while (isdigit(*s))
    1670:	4825                	li	a6,9
    1672:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    1676:	0025179b          	slliw	a5,a0,0x2
    167a:	9fa9                	addw	a5,a5,a0
    167c:	fd07031b          	addiw	t1,a4,-48
    1680:	0017989b          	slliw	a7,a5,0x1
    while (isdigit(*s))
    1684:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1688:	0685                	addi	a3,a3,1
    168a:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    168e:	0006071b          	sext.w	a4,a2
    1692:	feb870e3          	bgeu	a6,a1,1672 <atoi+0x3c>
    return neg ? n : -n;
    1696:	000e0563          	beqz	t3,16a0 <atoi+0x6a>
}
    169a:	8082                	ret
        s++;
    169c:	0505                	addi	a0,a0,1
    169e:	bf79                	j	163c <atoi+0x6>
    return neg ? n : -n;
    16a0:	4113053b          	subw	a0,t1,a7
    16a4:	8082                	ret
    while (isdigit(*s))
    16a6:	00154703          	lbu	a4,1(a0)
    16aa:	47a5                	li	a5,9
        s++;
    16ac:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    16b0:	fd07061b          	addiw	a2,a4,-48
    int n = 0, neg = 0;
    16b4:	4e01                	li	t3,0
    while (isdigit(*s))
    16b6:	2701                	sext.w	a4,a4
    16b8:	fac7fbe3          	bgeu	a5,a2,166e <atoi+0x38>
    16bc:	4501                	li	a0,0
}
    16be:	8082                	ret
    while (isdigit(*s))
    16c0:	00154703          	lbu	a4,1(a0)
    16c4:	47a5                	li	a5,9
        s++;
    16c6:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    16ca:	fd07061b          	addiw	a2,a4,-48
    16ce:	2701                	sext.w	a4,a4
    16d0:	fec7e6e3          	bltu	a5,a2,16bc <atoi+0x86>
        neg = 1;
    16d4:	4e05                	li	t3,1
    16d6:	bf61                	j	166e <atoi+0x38>

00000000000016d8 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16d8:	16060d63          	beqz	a2,1852 <memset+0x17a>
    16dc:	40a007b3          	neg	a5,a0
    16e0:	8b9d                	andi	a5,a5,7
    16e2:	00778693          	addi	a3,a5,7
    16e6:	482d                	li	a6,11
    16e8:	0ff5f713          	zext.b	a4,a1
    16ec:	fff60593          	addi	a1,a2,-1
    16f0:	1706e263          	bltu	a3,a6,1854 <memset+0x17c>
    16f4:	16d5ea63          	bltu	a1,a3,1868 <memset+0x190>
    16f8:	16078563          	beqz	a5,1862 <memset+0x18a>
    16fc:	00e50023          	sb	a4,0(a0)
    1700:	4685                	li	a3,1
    1702:	00150593          	addi	a1,a0,1
    1706:	14d78c63          	beq	a5,a3,185e <memset+0x186>
    170a:	00e500a3          	sb	a4,1(a0)
    170e:	4689                	li	a3,2
    1710:	00250593          	addi	a1,a0,2
    1714:	14d78d63          	beq	a5,a3,186e <memset+0x196>
    1718:	00e50123          	sb	a4,2(a0)
    171c:	468d                	li	a3,3
    171e:	00350593          	addi	a1,a0,3
    1722:	12d78b63          	beq	a5,a3,1858 <memset+0x180>
    1726:	00e501a3          	sb	a4,3(a0)
    172a:	4691                	li	a3,4
    172c:	00450593          	addi	a1,a0,4
    1730:	14d78163          	beq	a5,a3,1872 <memset+0x19a>
    1734:	00e50223          	sb	a4,4(a0)
    1738:	4695                	li	a3,5
    173a:	00550593          	addi	a1,a0,5
    173e:	12d78c63          	beq	a5,a3,1876 <memset+0x19e>
    1742:	00e502a3          	sb	a4,5(a0)
    1746:	469d                	li	a3,7
    1748:	00650593          	addi	a1,a0,6
    174c:	12d79763          	bne	a5,a3,187a <memset+0x1a2>
    1750:	00750593          	addi	a1,a0,7
    1754:	00e50323          	sb	a4,6(a0)
    1758:	481d                	li	a6,7
    175a:	00871693          	slli	a3,a4,0x8
    175e:	01071893          	slli	a7,a4,0x10
    1762:	8ed9                	or	a3,a3,a4
    1764:	01871313          	slli	t1,a4,0x18
    1768:	0116e6b3          	or	a3,a3,a7
    176c:	0066e6b3          	or	a3,a3,t1
    1770:	02071893          	slli	a7,a4,0x20
    1774:	02871e13          	slli	t3,a4,0x28
    1778:	0116e6b3          	or	a3,a3,a7
    177c:	40f60333          	sub	t1,a2,a5
    1780:	03071893          	slli	a7,a4,0x30
    1784:	01c6e6b3          	or	a3,a3,t3
    1788:	0116e6b3          	or	a3,a3,a7
    178c:	03871e13          	slli	t3,a4,0x38
    1790:	97aa                	add	a5,a5,a0
    1792:	ff837893          	andi	a7,t1,-8
    1796:	01c6e6b3          	or	a3,a3,t3
    179a:	98be                	add	a7,a7,a5
    179c:	e394                	sd	a3,0(a5)
    179e:	07a1                	addi	a5,a5,8
    17a0:	ff179ee3          	bne	a5,a7,179c <memset+0xc4>
    17a4:	ff837893          	andi	a7,t1,-8
    17a8:	011587b3          	add	a5,a1,a7
    17ac:	010886bb          	addw	a3,a7,a6
    17b0:	0b130663          	beq	t1,a7,185c <memset+0x184>
    17b4:	00e78023          	sb	a4,0(a5)
    17b8:	0016859b          	addiw	a1,a3,1
    17bc:	08c5fb63          	bgeu	a1,a2,1852 <memset+0x17a>
    17c0:	00e780a3          	sb	a4,1(a5)
    17c4:	0026859b          	addiw	a1,a3,2
    17c8:	08c5f563          	bgeu	a1,a2,1852 <memset+0x17a>
    17cc:	00e78123          	sb	a4,2(a5)
    17d0:	0036859b          	addiw	a1,a3,3
    17d4:	06c5ff63          	bgeu	a1,a2,1852 <memset+0x17a>
    17d8:	00e781a3          	sb	a4,3(a5)
    17dc:	0046859b          	addiw	a1,a3,4
    17e0:	06c5f963          	bgeu	a1,a2,1852 <memset+0x17a>
    17e4:	00e78223          	sb	a4,4(a5)
    17e8:	0056859b          	addiw	a1,a3,5
    17ec:	06c5f363          	bgeu	a1,a2,1852 <memset+0x17a>
    17f0:	00e782a3          	sb	a4,5(a5)
    17f4:	0066859b          	addiw	a1,a3,6
    17f8:	04c5fd63          	bgeu	a1,a2,1852 <memset+0x17a>
    17fc:	00e78323          	sb	a4,6(a5)
    1800:	0076859b          	addiw	a1,a3,7
    1804:	04c5f763          	bgeu	a1,a2,1852 <memset+0x17a>
    1808:	00e783a3          	sb	a4,7(a5)
    180c:	0086859b          	addiw	a1,a3,8
    1810:	04c5f163          	bgeu	a1,a2,1852 <memset+0x17a>
    1814:	00e78423          	sb	a4,8(a5)
    1818:	0096859b          	addiw	a1,a3,9
    181c:	02c5fb63          	bgeu	a1,a2,1852 <memset+0x17a>
    1820:	00e784a3          	sb	a4,9(a5)
    1824:	00a6859b          	addiw	a1,a3,10
    1828:	02c5f563          	bgeu	a1,a2,1852 <memset+0x17a>
    182c:	00e78523          	sb	a4,10(a5)
    1830:	00b6859b          	addiw	a1,a3,11
    1834:	00c5ff63          	bgeu	a1,a2,1852 <memset+0x17a>
    1838:	00e785a3          	sb	a4,11(a5)
    183c:	00c6859b          	addiw	a1,a3,12
    1840:	00c5f963          	bgeu	a1,a2,1852 <memset+0x17a>
    1844:	00e78623          	sb	a4,12(a5)
    1848:	26b5                	addiw	a3,a3,13
    184a:	00c6f463          	bgeu	a3,a2,1852 <memset+0x17a>
    184e:	00e786a3          	sb	a4,13(a5)
        ;
    return dest;
}
    1852:	8082                	ret
    1854:	46ad                	li	a3,11
    1856:	bd79                	j	16f4 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1858:	480d                	li	a6,3
    185a:	b701                	j	175a <memset+0x82>
    185c:	8082                	ret
    185e:	4805                	li	a6,1
    1860:	bded                	j	175a <memset+0x82>
    1862:	85aa                	mv	a1,a0
    1864:	4801                	li	a6,0
    1866:	bdd5                	j	175a <memset+0x82>
    1868:	87aa                	mv	a5,a0
    186a:	4681                	li	a3,0
    186c:	b7a1                	j	17b4 <memset+0xdc>
    186e:	4809                	li	a6,2
    1870:	b5ed                	j	175a <memset+0x82>
    1872:	4811                	li	a6,4
    1874:	b5dd                	j	175a <memset+0x82>
    1876:	4815                	li	a6,5
    1878:	b5cd                	j	175a <memset+0x82>
    187a:	4819                	li	a6,6
    187c:	bdf9                	j	175a <memset+0x82>

000000000000187e <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    187e:	00054783          	lbu	a5,0(a0)
    1882:	0005c703          	lbu	a4,0(a1)
    1886:	00e79863          	bne	a5,a4,1896 <strcmp+0x18>
    188a:	0505                	addi	a0,a0,1
    188c:	0585                	addi	a1,a1,1
    188e:	fbe5                	bnez	a5,187e <strcmp>
    1890:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1892:	9d19                	subw	a0,a0,a4
    1894:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1896:	0007851b          	sext.w	a0,a5
    189a:	bfe5                	j	1892 <strcmp+0x14>

000000000000189c <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    189c:	ca15                	beqz	a2,18d0 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    189e:	00054783          	lbu	a5,0(a0)
    if (!n--)
    18a2:	167d                	addi	a2,a2,-1
    18a4:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18a8:	eb99                	bnez	a5,18be <strncmp+0x22>
    18aa:	a815                	j	18de <strncmp+0x42>
    18ac:	00a68e63          	beq	a3,a0,18c8 <strncmp+0x2c>
    18b0:	0505                	addi	a0,a0,1
    18b2:	00f71b63          	bne	a4,a5,18c8 <strncmp+0x2c>
    18b6:	00054783          	lbu	a5,0(a0)
    18ba:	cf89                	beqz	a5,18d4 <strncmp+0x38>
    18bc:	85b2                	mv	a1,a2
    18be:	0005c703          	lbu	a4,0(a1)
    18c2:	00158613          	addi	a2,a1,1
    18c6:	f37d                	bnez	a4,18ac <strncmp+0x10>
        ;
    return *l - *r;
    18c8:	0007851b          	sext.w	a0,a5
    18cc:	9d19                	subw	a0,a0,a4
    18ce:	8082                	ret
        return 0;
    18d0:	4501                	li	a0,0
}
    18d2:	8082                	ret
    return *l - *r;
    18d4:	0015c703          	lbu	a4,1(a1)
    18d8:	4501                	li	a0,0
    18da:	9d19                	subw	a0,a0,a4
    18dc:	8082                	ret
    18de:	0005c703          	lbu	a4,0(a1)
    18e2:	4501                	li	a0,0
    18e4:	b7e5                	j	18cc <strncmp+0x30>

00000000000018e6 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18e6:	00757793          	andi	a5,a0,7
    18ea:	cf89                	beqz	a5,1904 <strlen+0x1e>
    18ec:	87aa                	mv	a5,a0
    18ee:	a029                	j	18f8 <strlen+0x12>
    18f0:	0785                	addi	a5,a5,1
    18f2:	0077f713          	andi	a4,a5,7
    18f6:	cb01                	beqz	a4,1906 <strlen+0x20>
        if (!*s)
    18f8:	0007c703          	lbu	a4,0(a5)
    18fc:	fb75                	bnez	a4,18f0 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18fe:	40a78533          	sub	a0,a5,a0
}
    1902:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1904:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1906:	6394                	ld	a3,0(a5)
    1908:	00000597          	auipc	a1,0x0
    190c:	6f05b583          	ld	a1,1776(a1) # 1ff8 <__clone+0xec>
    1910:	00000617          	auipc	a2,0x0
    1914:	6f063603          	ld	a2,1776(a2) # 2000 <__clone+0xf4>
    1918:	a019                	j	191e <strlen+0x38>
    191a:	6794                	ld	a3,8(a5)
    191c:	07a1                	addi	a5,a5,8
    191e:	00b68733          	add	a4,a3,a1
    1922:	fff6c693          	not	a3,a3
    1926:	8f75                	and	a4,a4,a3
    1928:	8f71                	and	a4,a4,a2
    192a:	db65                	beqz	a4,191a <strlen+0x34>
    for (; *s; s++)
    192c:	0007c703          	lbu	a4,0(a5)
    1930:	d779                	beqz	a4,18fe <strlen+0x18>
    1932:	0017c703          	lbu	a4,1(a5)
    1936:	0785                	addi	a5,a5,1
    1938:	d379                	beqz	a4,18fe <strlen+0x18>
    193a:	0017c703          	lbu	a4,1(a5)
    193e:	0785                	addi	a5,a5,1
    1940:	fb6d                	bnez	a4,1932 <strlen+0x4c>
    1942:	bf75                	j	18fe <strlen+0x18>

0000000000001944 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1944:	00757713          	andi	a4,a0,7
{
    1948:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    194a:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    194e:	cb19                	beqz	a4,1964 <memchr+0x20>
    1950:	ce25                	beqz	a2,19c8 <memchr+0x84>
    1952:	0007c703          	lbu	a4,0(a5)
    1956:	04b70e63          	beq	a4,a1,19b2 <memchr+0x6e>
    195a:	0785                	addi	a5,a5,1
    195c:	0077f713          	andi	a4,a5,7
    1960:	167d                	addi	a2,a2,-1
    1962:	f77d                	bnez	a4,1950 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1964:	4501                	li	a0,0
    if (n && *s != c)
    1966:	c235                	beqz	a2,19ca <memchr+0x86>
    1968:	0007c703          	lbu	a4,0(a5)
    196c:	04b70363          	beq	a4,a1,19b2 <memchr+0x6e>
        size_t k = ONES * c;
    1970:	00000517          	auipc	a0,0x0
    1974:	69853503          	ld	a0,1688(a0) # 2008 <__clone+0xfc>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1978:	471d                	li	a4,7
        size_t k = ONES * c;
    197a:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    197e:	02c77a63          	bgeu	a4,a2,19b2 <memchr+0x6e>
    1982:	00000897          	auipc	a7,0x0
    1986:	6768b883          	ld	a7,1654(a7) # 1ff8 <__clone+0xec>
    198a:	00000817          	auipc	a6,0x0
    198e:	67683803          	ld	a6,1654(a6) # 2000 <__clone+0xf4>
    1992:	431d                	li	t1,7
    1994:	a029                	j	199e <memchr+0x5a>
    1996:	1661                	addi	a2,a2,-8
    1998:	07a1                	addi	a5,a5,8
    199a:	02c37963          	bgeu	t1,a2,19cc <memchr+0x88>
    199e:	6398                	ld	a4,0(a5)
    19a0:	8f29                	xor	a4,a4,a0
    19a2:	011706b3          	add	a3,a4,a7
    19a6:	fff74713          	not	a4,a4
    19aa:	8f75                	and	a4,a4,a3
    19ac:	01077733          	and	a4,a4,a6
    19b0:	d37d                	beqz	a4,1996 <memchr+0x52>
{
    19b2:	853e                	mv	a0,a5
    19b4:	97b2                	add	a5,a5,a2
    19b6:	a021                	j	19be <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    19b8:	0505                	addi	a0,a0,1
    19ba:	00f50763          	beq	a0,a5,19c8 <memchr+0x84>
    19be:	00054703          	lbu	a4,0(a0)
    19c2:	feb71be3          	bne	a4,a1,19b8 <memchr+0x74>
    19c6:	8082                	ret
    return n ? (void *)s : 0;
    19c8:	4501                	li	a0,0
}
    19ca:	8082                	ret
    return n ? (void *)s : 0;
    19cc:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    19ce:	f275                	bnez	a2,19b2 <memchr+0x6e>
}
    19d0:	8082                	ret

00000000000019d2 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19d2:	1101                	addi	sp,sp,-32
    19d4:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19d6:	862e                	mv	a2,a1
{
    19d8:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19da:	4581                	li	a1,0
{
    19dc:	e426                	sd	s1,8(sp)
    19de:	ec06                	sd	ra,24(sp)
    19e0:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19e2:	f63ff0ef          	jal	ra,1944 <memchr>
    return p ? p - s : n;
    19e6:	c519                	beqz	a0,19f4 <strnlen+0x22>
}
    19e8:	60e2                	ld	ra,24(sp)
    19ea:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19ec:	8d05                	sub	a0,a0,s1
}
    19ee:	64a2                	ld	s1,8(sp)
    19f0:	6105                	addi	sp,sp,32
    19f2:	8082                	ret
    19f4:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19f6:	8522                	mv	a0,s0
}
    19f8:	6442                	ld	s0,16(sp)
    19fa:	64a2                	ld	s1,8(sp)
    19fc:	6105                	addi	sp,sp,32
    19fe:	8082                	ret

0000000000001a00 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a00:	00a5c7b3          	xor	a5,a1,a0
    1a04:	8b9d                	andi	a5,a5,7
    1a06:	eb95                	bnez	a5,1a3a <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a08:	0075f793          	andi	a5,a1,7
    1a0c:	e7b1                	bnez	a5,1a58 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a0e:	6198                	ld	a4,0(a1)
    1a10:	00000617          	auipc	a2,0x0
    1a14:	5e863603          	ld	a2,1512(a2) # 1ff8 <__clone+0xec>
    1a18:	00000817          	auipc	a6,0x0
    1a1c:	5e883803          	ld	a6,1512(a6) # 2000 <__clone+0xf4>
    1a20:	a029                	j	1a2a <strcpy+0x2a>
    1a22:	05a1                	addi	a1,a1,8
    1a24:	e118                	sd	a4,0(a0)
    1a26:	6198                	ld	a4,0(a1)
    1a28:	0521                	addi	a0,a0,8
    1a2a:	00c707b3          	add	a5,a4,a2
    1a2e:	fff74693          	not	a3,a4
    1a32:	8ff5                	and	a5,a5,a3
    1a34:	0107f7b3          	and	a5,a5,a6
    1a38:	d7ed                	beqz	a5,1a22 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a3a:	0005c783          	lbu	a5,0(a1)
    1a3e:	00f50023          	sb	a5,0(a0)
    1a42:	c785                	beqz	a5,1a6a <strcpy+0x6a>
    1a44:	0015c783          	lbu	a5,1(a1)
    1a48:	0505                	addi	a0,a0,1
    1a4a:	0585                	addi	a1,a1,1
    1a4c:	00f50023          	sb	a5,0(a0)
    1a50:	fbf5                	bnez	a5,1a44 <strcpy+0x44>
        ;
    return d;
}
    1a52:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a54:	0505                	addi	a0,a0,1
    1a56:	df45                	beqz	a4,1a0e <strcpy+0xe>
            if (!(*d = *s))
    1a58:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a5c:	0585                	addi	a1,a1,1
    1a5e:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1a62:	00f50023          	sb	a5,0(a0)
    1a66:	f7fd                	bnez	a5,1a54 <strcpy+0x54>
}
    1a68:	8082                	ret
    1a6a:	8082                	ret

0000000000001a6c <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a6c:	00a5c7b3          	xor	a5,a1,a0
    1a70:	8b9d                	andi	a5,a5,7
    1a72:	1a079863          	bnez	a5,1c22 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a76:	0075f793          	andi	a5,a1,7
    1a7a:	16078463          	beqz	a5,1be2 <strncpy+0x176>
    1a7e:	ea01                	bnez	a2,1a8e <strncpy+0x22>
    1a80:	a421                	j	1c88 <strncpy+0x21c>
    1a82:	167d                	addi	a2,a2,-1
    1a84:	0505                	addi	a0,a0,1
    1a86:	14070e63          	beqz	a4,1be2 <strncpy+0x176>
    1a8a:	1a060863          	beqz	a2,1c3a <strncpy+0x1ce>
    1a8e:	0005c783          	lbu	a5,0(a1)
    1a92:	0585                	addi	a1,a1,1
    1a94:	0075f713          	andi	a4,a1,7
    1a98:	00f50023          	sb	a5,0(a0)
    1a9c:	f3fd                	bnez	a5,1a82 <strncpy+0x16>
    1a9e:	4805                	li	a6,1
    1aa0:	1a061863          	bnez	a2,1c50 <strncpy+0x1e4>
    1aa4:	40a007b3          	neg	a5,a0
    1aa8:	8b9d                	andi	a5,a5,7
    1aaa:	4681                	li	a3,0
    1aac:	18061a63          	bnez	a2,1c40 <strncpy+0x1d4>
    1ab0:	00778713          	addi	a4,a5,7
    1ab4:	45ad                	li	a1,11
    1ab6:	18b76363          	bltu	a4,a1,1c3c <strncpy+0x1d0>
    1aba:	1ae6eb63          	bltu	a3,a4,1c70 <strncpy+0x204>
    1abe:	1a078363          	beqz	a5,1c64 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ac2:	00050023          	sb	zero,0(a0)
    1ac6:	4685                	li	a3,1
    1ac8:	00150713          	addi	a4,a0,1
    1acc:	18d78f63          	beq	a5,a3,1c6a <strncpy+0x1fe>
    1ad0:	000500a3          	sb	zero,1(a0)
    1ad4:	4689                	li	a3,2
    1ad6:	00250713          	addi	a4,a0,2
    1ada:	18d78e63          	beq	a5,a3,1c76 <strncpy+0x20a>
    1ade:	00050123          	sb	zero,2(a0)
    1ae2:	468d                	li	a3,3
    1ae4:	00350713          	addi	a4,a0,3
    1ae8:	16d78c63          	beq	a5,a3,1c60 <strncpy+0x1f4>
    1aec:	000501a3          	sb	zero,3(a0)
    1af0:	4691                	li	a3,4
    1af2:	00450713          	addi	a4,a0,4
    1af6:	18d78263          	beq	a5,a3,1c7a <strncpy+0x20e>
    1afa:	00050223          	sb	zero,4(a0)
    1afe:	4695                	li	a3,5
    1b00:	00550713          	addi	a4,a0,5
    1b04:	16d78d63          	beq	a5,a3,1c7e <strncpy+0x212>
    1b08:	000502a3          	sb	zero,5(a0)
    1b0c:	469d                	li	a3,7
    1b0e:	00650713          	addi	a4,a0,6
    1b12:	16d79863          	bne	a5,a3,1c82 <strncpy+0x216>
    1b16:	00750713          	addi	a4,a0,7
    1b1a:	00050323          	sb	zero,6(a0)
    1b1e:	40f80833          	sub	a6,a6,a5
    1b22:	ff887593          	andi	a1,a6,-8
    1b26:	97aa                	add	a5,a5,a0
    1b28:	95be                	add	a1,a1,a5
    1b2a:	0007b023          	sd	zero,0(a5)
    1b2e:	07a1                	addi	a5,a5,8
    1b30:	feb79de3          	bne	a5,a1,1b2a <strncpy+0xbe>
    1b34:	ff887593          	andi	a1,a6,-8
    1b38:	9ead                	addw	a3,a3,a1
    1b3a:	00b707b3          	add	a5,a4,a1
    1b3e:	12b80863          	beq	a6,a1,1c6e <strncpy+0x202>
    1b42:	00078023          	sb	zero,0(a5)
    1b46:	0016871b          	addiw	a4,a3,1
    1b4a:	0ec77863          	bgeu	a4,a2,1c3a <strncpy+0x1ce>
    1b4e:	000780a3          	sb	zero,1(a5)
    1b52:	0026871b          	addiw	a4,a3,2
    1b56:	0ec77263          	bgeu	a4,a2,1c3a <strncpy+0x1ce>
    1b5a:	00078123          	sb	zero,2(a5)
    1b5e:	0036871b          	addiw	a4,a3,3
    1b62:	0cc77c63          	bgeu	a4,a2,1c3a <strncpy+0x1ce>
    1b66:	000781a3          	sb	zero,3(a5)
    1b6a:	0046871b          	addiw	a4,a3,4
    1b6e:	0cc77663          	bgeu	a4,a2,1c3a <strncpy+0x1ce>
    1b72:	00078223          	sb	zero,4(a5)
    1b76:	0056871b          	addiw	a4,a3,5
    1b7a:	0cc77063          	bgeu	a4,a2,1c3a <strncpy+0x1ce>
    1b7e:	000782a3          	sb	zero,5(a5)
    1b82:	0066871b          	addiw	a4,a3,6
    1b86:	0ac77a63          	bgeu	a4,a2,1c3a <strncpy+0x1ce>
    1b8a:	00078323          	sb	zero,6(a5)
    1b8e:	0076871b          	addiw	a4,a3,7
    1b92:	0ac77463          	bgeu	a4,a2,1c3a <strncpy+0x1ce>
    1b96:	000783a3          	sb	zero,7(a5)
    1b9a:	0086871b          	addiw	a4,a3,8
    1b9e:	08c77e63          	bgeu	a4,a2,1c3a <strncpy+0x1ce>
    1ba2:	00078423          	sb	zero,8(a5)
    1ba6:	0096871b          	addiw	a4,a3,9
    1baa:	08c77863          	bgeu	a4,a2,1c3a <strncpy+0x1ce>
    1bae:	000784a3          	sb	zero,9(a5)
    1bb2:	00a6871b          	addiw	a4,a3,10
    1bb6:	08c77263          	bgeu	a4,a2,1c3a <strncpy+0x1ce>
    1bba:	00078523          	sb	zero,10(a5)
    1bbe:	00b6871b          	addiw	a4,a3,11
    1bc2:	06c77c63          	bgeu	a4,a2,1c3a <strncpy+0x1ce>
    1bc6:	000785a3          	sb	zero,11(a5)
    1bca:	00c6871b          	addiw	a4,a3,12
    1bce:	06c77663          	bgeu	a4,a2,1c3a <strncpy+0x1ce>
    1bd2:	00078623          	sb	zero,12(a5)
    1bd6:	26b5                	addiw	a3,a3,13
    1bd8:	06c6f163          	bgeu	a3,a2,1c3a <strncpy+0x1ce>
    1bdc:	000786a3          	sb	zero,13(a5)
    1be0:	8082                	ret
            ;
        if (!n || !*s)
    1be2:	c645                	beqz	a2,1c8a <strncpy+0x21e>
    1be4:	0005c783          	lbu	a5,0(a1)
    1be8:	ea078be3          	beqz	a5,1a9e <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bec:	479d                	li	a5,7
    1bee:	02c7ff63          	bgeu	a5,a2,1c2c <strncpy+0x1c0>
    1bf2:	00000897          	auipc	a7,0x0
    1bf6:	4068b883          	ld	a7,1030(a7) # 1ff8 <__clone+0xec>
    1bfa:	00000817          	auipc	a6,0x0
    1bfe:	40683803          	ld	a6,1030(a6) # 2000 <__clone+0xf4>
    1c02:	431d                	li	t1,7
    1c04:	6198                	ld	a4,0(a1)
    1c06:	011707b3          	add	a5,a4,a7
    1c0a:	fff74693          	not	a3,a4
    1c0e:	8ff5                	and	a5,a5,a3
    1c10:	0107f7b3          	and	a5,a5,a6
    1c14:	ef81                	bnez	a5,1c2c <strncpy+0x1c0>
            *wd = *ws;
    1c16:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1c18:	1661                	addi	a2,a2,-8
    1c1a:	05a1                	addi	a1,a1,8
    1c1c:	0521                	addi	a0,a0,8
    1c1e:	fec363e3          	bltu	t1,a2,1c04 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1c22:	e609                	bnez	a2,1c2c <strncpy+0x1c0>
    1c24:	a08d                	j	1c86 <strncpy+0x21a>
    1c26:	167d                	addi	a2,a2,-1
    1c28:	0505                	addi	a0,a0,1
    1c2a:	ca01                	beqz	a2,1c3a <strncpy+0x1ce>
    1c2c:	0005c783          	lbu	a5,0(a1)
    1c30:	0585                	addi	a1,a1,1
    1c32:	00f50023          	sb	a5,0(a0)
    1c36:	fbe5                	bnez	a5,1c26 <strncpy+0x1ba>
        ;
tail:
    1c38:	b59d                	j	1a9e <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1c3a:	8082                	ret
    1c3c:	472d                	li	a4,11
    1c3e:	bdb5                	j	1aba <strncpy+0x4e>
    1c40:	00778713          	addi	a4,a5,7
    1c44:	45ad                	li	a1,11
    1c46:	fff60693          	addi	a3,a2,-1
    1c4a:	e6b778e3          	bgeu	a4,a1,1aba <strncpy+0x4e>
    1c4e:	b7fd                	j	1c3c <strncpy+0x1d0>
    1c50:	40a007b3          	neg	a5,a0
    1c54:	8832                	mv	a6,a2
    1c56:	8b9d                	andi	a5,a5,7
    1c58:	4681                	li	a3,0
    1c5a:	e4060be3          	beqz	a2,1ab0 <strncpy+0x44>
    1c5e:	b7cd                	j	1c40 <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c60:	468d                	li	a3,3
    1c62:	bd75                	j	1b1e <strncpy+0xb2>
    1c64:	872a                	mv	a4,a0
    1c66:	4681                	li	a3,0
    1c68:	bd5d                	j	1b1e <strncpy+0xb2>
    1c6a:	4685                	li	a3,1
    1c6c:	bd4d                	j	1b1e <strncpy+0xb2>
    1c6e:	8082                	ret
    1c70:	87aa                	mv	a5,a0
    1c72:	4681                	li	a3,0
    1c74:	b5f9                	j	1b42 <strncpy+0xd6>
    1c76:	4689                	li	a3,2
    1c78:	b55d                	j	1b1e <strncpy+0xb2>
    1c7a:	4691                	li	a3,4
    1c7c:	b54d                	j	1b1e <strncpy+0xb2>
    1c7e:	4695                	li	a3,5
    1c80:	bd79                	j	1b1e <strncpy+0xb2>
    1c82:	4699                	li	a3,6
    1c84:	bd69                	j	1b1e <strncpy+0xb2>
    1c86:	8082                	ret
    1c88:	8082                	ret
    1c8a:	8082                	ret

0000000000001c8c <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c8c:	87aa                	mv	a5,a0
    1c8e:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c90:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c94:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c98:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c9a:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c9c:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1ca0:	2501                	sext.w	a0,a0
    1ca2:	8082                	ret

0000000000001ca4 <openat>:
    register long a7 __asm__("a7") = n;
    1ca4:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1ca8:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cac:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1cb0:	2501                	sext.w	a0,a0
    1cb2:	8082                	ret

0000000000001cb4 <fcntl>:
    register long a7 __asm__("a7") = n;
    1cb4:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cb6:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1cba:	2501                	sext.w	a0,a0
    1cbc:	8082                	ret

0000000000001cbe <close>:
    register long a7 __asm__("a7") = n;
    1cbe:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1cc2:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1cc6:	2501                	sext.w	a0,a0
    1cc8:	8082                	ret

0000000000001cca <read>:
    register long a7 __asm__("a7") = n;
    1cca:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cce:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1cd2:	8082                	ret

0000000000001cd4 <write>:
    register long a7 __asm__("a7") = n;
    1cd4:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cd8:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1cdc:	8082                	ret

0000000000001cde <getpid>:
    register long a7 __asm__("a7") = n;
    1cde:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1ce2:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1ce6:	2501                	sext.w	a0,a0
    1ce8:	8082                	ret

0000000000001cea <getppid>:
    register long a7 __asm__("a7") = n;
    1cea:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1cee:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cf2:	2501                	sext.w	a0,a0
    1cf4:	8082                	ret

0000000000001cf6 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cf6:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cfa:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cfe:	2501                	sext.w	a0,a0
    1d00:	8082                	ret

0000000000001d02 <fork>:
    register long a7 __asm__("a7") = n;
    1d02:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d06:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d08:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d0a:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d0e:	2501                	sext.w	a0,a0
    1d10:	8082                	ret

0000000000001d12 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d12:	85b2                	mv	a1,a2
    1d14:	863a                	mv	a2,a4
    if (stack)
    1d16:	c191                	beqz	a1,1d1a <clone+0x8>
	stack += stack_size;
    1d18:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d1a:	4781                	li	a5,0
    1d1c:	4701                	li	a4,0
    1d1e:	4681                	li	a3,0
    1d20:	2601                	sext.w	a2,a2
    1d22:	a2ed                	j	1f0c <__clone>

0000000000001d24 <exit>:
    register long a7 __asm__("a7") = n;
    1d24:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d28:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d2c:	8082                	ret

0000000000001d2e <waitpid>:
    register long a7 __asm__("a7") = n;
    1d2e:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d32:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d34:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d38:	2501                	sext.w	a0,a0
    1d3a:	8082                	ret

0000000000001d3c <exec>:
    register long a7 __asm__("a7") = n;
    1d3c:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d40:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d44:	2501                	sext.w	a0,a0
    1d46:	8082                	ret

0000000000001d48 <execve>:
    register long a7 __asm__("a7") = n;
    1d48:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d4c:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d50:	2501                	sext.w	a0,a0
    1d52:	8082                	ret

0000000000001d54 <times>:
    register long a7 __asm__("a7") = n;
    1d54:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d58:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d5c:	2501                	sext.w	a0,a0
    1d5e:	8082                	ret

0000000000001d60 <get_time>:

int64 get_time()
{
    1d60:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d62:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d66:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d68:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d6a:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d6e:	2501                	sext.w	a0,a0
    1d70:	ed09                	bnez	a0,1d8a <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d72:	67a2                	ld	a5,8(sp)
    1d74:	3e800713          	li	a4,1000
    1d78:	00015503          	lhu	a0,0(sp)
    1d7c:	02e7d7b3          	divu	a5,a5,a4
    1d80:	02e50533          	mul	a0,a0,a4
    1d84:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d86:	0141                	addi	sp,sp,16
    1d88:	8082                	ret
        return -1;
    1d8a:	557d                	li	a0,-1
    1d8c:	bfed                	j	1d86 <get_time+0x26>

0000000000001d8e <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d8e:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d92:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d96:	2501                	sext.w	a0,a0
    1d98:	8082                	ret

0000000000001d9a <time>:
    register long a7 __asm__("a7") = n;
    1d9a:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d9e:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1da2:	2501                	sext.w	a0,a0
    1da4:	8082                	ret

0000000000001da6 <sleep>:

int sleep(unsigned long long time)
{
    1da6:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1da8:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1daa:	850a                	mv	a0,sp
    1dac:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1dae:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1db2:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db4:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1db8:	e501                	bnez	a0,1dc0 <sleep+0x1a>
    return 0;
    1dba:	4501                	li	a0,0
}
    1dbc:	0141                	addi	sp,sp,16
    1dbe:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1dc0:	4502                	lw	a0,0(sp)
}
    1dc2:	0141                	addi	sp,sp,16
    1dc4:	8082                	ret

0000000000001dc6 <set_priority>:
    register long a7 __asm__("a7") = n;
    1dc6:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1dca:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1dce:	2501                	sext.w	a0,a0
    1dd0:	8082                	ret

0000000000001dd2 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1dd2:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1dd6:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1dda:	8082                	ret

0000000000001ddc <munmap>:
    register long a7 __asm__("a7") = n;
    1ddc:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1de0:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1de4:	2501                	sext.w	a0,a0
    1de6:	8082                	ret

0000000000001de8 <wait>:

int wait(int *code)
{
    1de8:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dea:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1dee:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1df0:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1df2:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1df4:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1df8:	2501                	sext.w	a0,a0
    1dfa:	8082                	ret

0000000000001dfc <spawn>:
    register long a7 __asm__("a7") = n;
    1dfc:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e00:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e04:	2501                	sext.w	a0,a0
    1e06:	8082                	ret

0000000000001e08 <mailread>:
    register long a7 __asm__("a7") = n;
    1e08:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e0c:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e10:	2501                	sext.w	a0,a0
    1e12:	8082                	ret

0000000000001e14 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e14:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e18:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e1c:	2501                	sext.w	a0,a0
    1e1e:	8082                	ret

0000000000001e20 <fstat>:
    register long a7 __asm__("a7") = n;
    1e20:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e24:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e2c:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e2e:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e32:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e34:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e38:	2501                	sext.w	a0,a0
    1e3a:	8082                	ret

0000000000001e3c <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e3c:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e3e:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e42:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e44:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e48:	2501                	sext.w	a0,a0
    1e4a:	8082                	ret

0000000000001e4c <link>:

int link(char *old_path, char *new_path)
{
    1e4c:	87aa                	mv	a5,a0
    1e4e:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e50:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e54:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e58:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e5a:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e5e:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e60:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e64:	2501                	sext.w	a0,a0
    1e66:	8082                	ret

0000000000001e68 <unlink>:

int unlink(char *path)
{
    1e68:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e6a:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e6e:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e72:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e74:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e78:	2501                	sext.w	a0,a0
    1e7a:	8082                	ret

0000000000001e7c <uname>:
    register long a7 __asm__("a7") = n;
    1e7c:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e80:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e84:	2501                	sext.w	a0,a0
    1e86:	8082                	ret

0000000000001e88 <brk>:
    register long a7 __asm__("a7") = n;
    1e88:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e8c:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e90:	2501                	sext.w	a0,a0
    1e92:	8082                	ret

0000000000001e94 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e94:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e96:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e9a:	8082                	ret

0000000000001e9c <chdir>:
    register long a7 __asm__("a7") = n;
    1e9c:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1ea0:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1ea4:	2501                	sext.w	a0,a0
    1ea6:	8082                	ret

0000000000001ea8 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1ea8:	862e                	mv	a2,a1
    1eaa:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1eac:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1eae:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1eb2:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1eb6:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1eb8:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eba:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1ebe:	2501                	sext.w	a0,a0
    1ec0:	8082                	ret

0000000000001ec2 <getdents>:
    register long a7 __asm__("a7") = n;
    1ec2:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ec6:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1eca:	2501                	sext.w	a0,a0
    1ecc:	8082                	ret

0000000000001ece <pipe>:
    register long a7 __asm__("a7") = n;
    1ece:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1ed2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed4:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1ed8:	2501                	sext.w	a0,a0
    1eda:	8082                	ret

0000000000001edc <dup>:
    register long a7 __asm__("a7") = n;
    1edc:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1ede:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1ee2:	2501                	sext.w	a0,a0
    1ee4:	8082                	ret

0000000000001ee6 <dup2>:
    register long a7 __asm__("a7") = n;
    1ee6:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1ee8:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eea:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1eee:	2501                	sext.w	a0,a0
    1ef0:	8082                	ret

0000000000001ef2 <mount>:
    register long a7 __asm__("a7") = n;
    1ef2:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ef6:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1efa:	2501                	sext.w	a0,a0
    1efc:	8082                	ret

0000000000001efe <umount>:
    register long a7 __asm__("a7") = n;
    1efe:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f02:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f04:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f08:	2501                	sext.w	a0,a0
    1f0a:	8082                	ret

0000000000001f0c <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f0c:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1f0e:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f10:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f12:	8532                	mv	a0,a2
	mv a2, a4
    1f14:	863a                	mv	a2,a4
	mv a3, a5
    1f16:	86be                	mv	a3,a5
	mv a4, a6
    1f18:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f1a:	0dc00893          	li	a7,220
	ecall
    1f1e:	00000073          	ecall

	beqz a0, 1f
    1f22:	c111                	beqz	a0,1f26 <__clone+0x1a>
	# Parent
	ret
    1f24:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f26:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f28:	6522                	ld	a0,8(sp)
	jalr a1
    1f2a:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f2c:	05d00893          	li	a7,93
	ecall
    1f30:	00000073          	ecall
