
/home/brightnight/OScompetition/6.13晚final_main/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/fork：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a05d                	j	10a8 <__start_main>

0000000000001004 <test_fork>:
 * 成功测试时子进程的输出：
 * "  child process."
 */
static int fd[2];

void test_fork(void){
    1004:	1101                	addi	sp,sp,-32
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	eea50513          	addi	a0,a0,-278 # 1ef0 <__clone+0x2a>
void test_fork(void){
    100e:	ec06                	sd	ra,24(sp)
    TEST_START(__func__);
    1010:	30a000ef          	jal	ra,131a <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	f8c50513          	addi	a0,a0,-116 # 1fa0 <__func__.0>
    101c:	2fe000ef          	jal	ra,131a <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	ee850513          	addi	a0,a0,-280 # 1f08 <__clone+0x42>
    1028:	2f2000ef          	jal	ra,131a <puts>
    int cpid, wstatus;
    cpid = fork();
    102c:	491000ef          	jal	ra,1cbc <fork>
    assert(cpid != -1);
    1030:	57fd                	li	a5,-1
    1032:	04f50363          	beq	a0,a5,1078 <test_fork+0x74>

    if(cpid > 0){
    1036:	04a05763          	blez	a0,1084 <test_fork+0x80>
	wait(&wstatus);
    103a:	0068                	addi	a0,sp,12
    103c:	567000ef          	jal	ra,1da2 <wait>
	printf("  parent process. wstatus:%d\n", wstatus);
    1040:	45b2                	lw	a1,12(sp)
    1042:	00001517          	auipc	a0,0x1
    1046:	ef650513          	addi	a0,a0,-266 # 1f38 <__clone+0x72>
    104a:	2f2000ef          	jal	ra,133c <printf>
    }else{
	printf("  child process.\n");
	exit(0);
    }
    TEST_END(__func__);
    104e:	00001517          	auipc	a0,0x1
    1052:	f2250513          	addi	a0,a0,-222 # 1f70 <__clone+0xaa>
    1056:	2c4000ef          	jal	ra,131a <puts>
    105a:	00001517          	auipc	a0,0x1
    105e:	f4650513          	addi	a0,a0,-186 # 1fa0 <__func__.0>
    1062:	2b8000ef          	jal	ra,131a <puts>
    1066:	00001517          	auipc	a0,0x1
    106a:	ea250513          	addi	a0,a0,-350 # 1f08 <__clone+0x42>
    106e:	2ac000ef          	jal	ra,131a <puts>
}
    1072:	60e2                	ld	ra,24(sp)
    1074:	6105                	addi	sp,sp,32
    1076:	8082                	ret
    assert(cpid != -1);
    1078:	00001517          	auipc	a0,0x1
    107c:	ea050513          	addi	a0,a0,-352 # 1f18 <__clone+0x52>
    1080:	540000ef          	jal	ra,15c0 <panic>
	printf("  child process.\n");
    1084:	00001517          	auipc	a0,0x1
    1088:	ed450513          	addi	a0,a0,-300 # 1f58 <__clone+0x92>
    108c:	2b0000ef          	jal	ra,133c <printf>
	exit(0);
    1090:	4501                	li	a0,0
    1092:	44d000ef          	jal	ra,1cde <exit>
    1096:	bf65                	j	104e <test_fork+0x4a>

0000000000001098 <main>:

int main(void){
    1098:	1141                	addi	sp,sp,-16
    109a:	e406                	sd	ra,8(sp)
    test_fork();
    109c:	f69ff0ef          	jal	ra,1004 <test_fork>
    return 0;
}
    10a0:	60a2                	ld	ra,8(sp)
    10a2:	4501                	li	a0,0
    10a4:	0141                	addi	sp,sp,16
    10a6:	8082                	ret

00000000000010a8 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10a8:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10aa:	4108                	lw	a0,0(a0)
{
    10ac:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10ae:	05a1                	addi	a1,a1,8
{
    10b0:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10b2:	fe7ff0ef          	jal	ra,1098 <main>
    10b6:	429000ef          	jal	ra,1cde <exit>
	return 0;
}
    10ba:	60a2                	ld	ra,8(sp)
    10bc:	4501                	li	a0,0
    10be:	0141                	addi	sp,sp,16
    10c0:	8082                	ret

00000000000010c2 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10c2:	7179                	addi	sp,sp,-48
    10c4:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10c6:	12054b63          	bltz	a0,11fc <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10ca:	02b577bb          	remuw	a5,a0,a1
    10ce:	00001617          	auipc	a2,0x1
    10d2:	ee260613          	addi	a2,a2,-286 # 1fb0 <digits>
    buf[16] = 0;
    10d6:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10da:	0005871b          	sext.w	a4,a1
    10de:	1782                	slli	a5,a5,0x20
    10e0:	9381                	srli	a5,a5,0x20
    10e2:	97b2                	add	a5,a5,a2
    10e4:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10e8:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10ec:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10f0:	1cb56363          	bltu	a0,a1,12b6 <printint.constprop.0+0x1f4>
        buf[i--] = digits[x % base];
    10f4:	45b9                	li	a1,14
    10f6:	02e877bb          	remuw	a5,a6,a4
    10fa:	1782                	slli	a5,a5,0x20
    10fc:	9381                	srli	a5,a5,0x20
    10fe:	97b2                	add	a5,a5,a2
    1100:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1104:	02e856bb          	divuw	a3,a6,a4
        buf[i--] = digits[x % base];
    1108:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    110c:	0ce86e63          	bltu	a6,a4,11e8 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    1110:	02e6f5bb          	remuw	a1,a3,a4
    } while ((x /= base) != 0);
    1114:	02e6d7bb          	divuw	a5,a3,a4
        buf[i--] = digits[x % base];
    1118:	1582                	slli	a1,a1,0x20
    111a:	9181                	srli	a1,a1,0x20
    111c:	95b2                	add	a1,a1,a2
    111e:	0005c583          	lbu	a1,0(a1)
    1122:	00b10aa3          	sb	a1,21(sp)
    } while ((x /= base) != 0);
    1126:	0007859b          	sext.w	a1,a5
    112a:	12e6ec63          	bltu	a3,a4,1262 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    112e:	02e7f6bb          	remuw	a3,a5,a4
    1132:	1682                	slli	a3,a3,0x20
    1134:	9281                	srli	a3,a3,0x20
    1136:	96b2                	add	a3,a3,a2
    1138:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    113c:	02e7d83b          	divuw	a6,a5,a4
        buf[i--] = digits[x % base];
    1140:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1144:	12e5e863          	bltu	a1,a4,1274 <printint.constprop.0+0x1b2>
        buf[i--] = digits[x % base];
    1148:	02e876bb          	remuw	a3,a6,a4
    114c:	1682                	slli	a3,a3,0x20
    114e:	9281                	srli	a3,a3,0x20
    1150:	96b2                	add	a3,a3,a2
    1152:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1156:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    115a:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    115e:	12e86463          	bltu	a6,a4,1286 <printint.constprop.0+0x1c4>
        buf[i--] = digits[x % base];
    1162:	02e5f6bb          	remuw	a3,a1,a4
    1166:	1682                	slli	a3,a3,0x20
    1168:	9281                	srli	a3,a3,0x20
    116a:	96b2                	add	a3,a3,a2
    116c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1170:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1174:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    1178:	0ce5ec63          	bltu	a1,a4,1250 <printint.constprop.0+0x18e>
        buf[i--] = digits[x % base];
    117c:	02e876bb          	remuw	a3,a6,a4
    1180:	1682                	slli	a3,a3,0x20
    1182:	9281                	srli	a3,a3,0x20
    1184:	96b2                	add	a3,a3,a2
    1186:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    118a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    118e:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1192:	10e86963          	bltu	a6,a4,12a4 <printint.constprop.0+0x1e2>
        buf[i--] = digits[x % base];
    1196:	02e5f6bb          	remuw	a3,a1,a4
    119a:	1682                	slli	a3,a3,0x20
    119c:	9281                	srli	a3,a3,0x20
    119e:	96b2                	add	a3,a3,a2
    11a0:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11a4:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11a8:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11ac:	10e5e763          	bltu	a1,a4,12ba <printint.constprop.0+0x1f8>
        buf[i--] = digits[x % base];
    11b0:	02e876bb          	remuw	a3,a6,a4
    11b4:	1682                	slli	a3,a3,0x20
    11b6:	9281                	srli	a3,a3,0x20
    11b8:	96b2                	add	a3,a3,a2
    11ba:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11be:	02e857bb          	divuw	a5,a6,a4
        buf[i--] = digits[x % base];
    11c2:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11c6:	10e86363          	bltu	a6,a4,12cc <printint.constprop.0+0x20a>
        buf[i--] = digits[x % base];
    11ca:	1782                	slli	a5,a5,0x20
    11cc:	9381                	srli	a5,a5,0x20
    11ce:	97b2                	add	a5,a5,a2
    11d0:	0007c783          	lbu	a5,0(a5)
    11d4:	4599                	li	a1,6
    11d6:	00f10723          	sb	a5,14(sp)

    if (sign)
    11da:	00055763          	bgez	a0,11e8 <printint.constprop.0+0x126>
        buf[i--] = '-';
    11de:	02d00793          	li	a5,45
    11e2:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11e6:	4595                	li	a1,5
    write(f, s, l);
    11e8:	003c                	addi	a5,sp,8
    11ea:	4641                	li	a2,16
    11ec:	9e0d                	subw	a2,a2,a1
    11ee:	4505                	li	a0,1
    11f0:	95be                	add	a1,a1,a5
    11f2:	29d000ef          	jal	ra,1c8e <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11f6:	70a2                	ld	ra,40(sp)
    11f8:	6145                	addi	sp,sp,48
    11fa:	8082                	ret
        x = -xx;
    11fc:	40a0083b          	negw	a6,a0
        buf[i--] = digits[x % base];
    1200:	02b877bb          	remuw	a5,a6,a1
    1204:	00001617          	auipc	a2,0x1
    1208:	dac60613          	addi	a2,a2,-596 # 1fb0 <digits>
    buf[16] = 0;
    120c:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1210:	0005871b          	sext.w	a4,a1
    1214:	1782                	slli	a5,a5,0x20
    1216:	9381                	srli	a5,a5,0x20
    1218:	97b2                	add	a5,a5,a2
    121a:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    121e:	02b858bb          	divuw	a7,a6,a1
        buf[i--] = digits[x % base];
    1222:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1226:	06b86963          	bltu	a6,a1,1298 <printint.constprop.0+0x1d6>
        buf[i--] = digits[x % base];
    122a:	02e8f7bb          	remuw	a5,a7,a4
    122e:	1782                	slli	a5,a5,0x20
    1230:	9381                	srli	a5,a5,0x20
    1232:	97b2                	add	a5,a5,a2
    1234:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1238:	02e8d6bb          	divuw	a3,a7,a4
        buf[i--] = digits[x % base];
    123c:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    1240:	ece8f8e3          	bgeu	a7,a4,1110 <printint.constprop.0+0x4e>
        buf[i--] = '-';
    1244:	02d00793          	li	a5,45
    1248:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    124c:	45b5                	li	a1,13
    124e:	bf69                	j	11e8 <printint.constprop.0+0x126>
    1250:	45a9                	li	a1,10
    if (sign)
    1252:	f8055be3          	bgez	a0,11e8 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1256:	02d00793          	li	a5,45
    125a:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    125e:	45a5                	li	a1,9
    1260:	b761                	j	11e8 <printint.constprop.0+0x126>
    1262:	45b5                	li	a1,13
    if (sign)
    1264:	f80552e3          	bgez	a0,11e8 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1268:	02d00793          	li	a5,45
    126c:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1270:	45b1                	li	a1,12
    1272:	bf9d                	j	11e8 <printint.constprop.0+0x126>
    1274:	45b1                	li	a1,12
    if (sign)
    1276:	f60559e3          	bgez	a0,11e8 <printint.constprop.0+0x126>
        buf[i--] = '-';
    127a:	02d00793          	li	a5,45
    127e:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1282:	45ad                	li	a1,11
    1284:	b795                	j	11e8 <printint.constprop.0+0x126>
    1286:	45ad                	li	a1,11
    if (sign)
    1288:	f60550e3          	bgez	a0,11e8 <printint.constprop.0+0x126>
        buf[i--] = '-';
    128c:	02d00793          	li	a5,45
    1290:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1294:	45a9                	li	a1,10
    1296:	bf89                	j	11e8 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1298:	02d00793          	li	a5,45
    129c:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12a0:	45b9                	li	a1,14
    12a2:	b799                	j	11e8 <printint.constprop.0+0x126>
    12a4:	45a5                	li	a1,9
    if (sign)
    12a6:	f40551e3          	bgez	a0,11e8 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12aa:	02d00793          	li	a5,45
    12ae:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12b2:	45a1                	li	a1,8
    12b4:	bf15                	j	11e8 <printint.constprop.0+0x126>
    i = 15;
    12b6:	45bd                	li	a1,15
    12b8:	bf05                	j	11e8 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    12ba:	45a1                	li	a1,8
    if (sign)
    12bc:	f20556e3          	bgez	a0,11e8 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12c0:	02d00793          	li	a5,45
    12c4:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12c8:	459d                	li	a1,7
    12ca:	bf39                	j	11e8 <printint.constprop.0+0x126>
    12cc:	459d                	li	a1,7
    if (sign)
    12ce:	f0055de3          	bgez	a0,11e8 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12d2:	02d00793          	li	a5,45
    12d6:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12da:	4599                	li	a1,6
    12dc:	b731                	j	11e8 <printint.constprop.0+0x126>

00000000000012de <getchar>:
{
    12de:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12e0:	00f10593          	addi	a1,sp,15
    12e4:	4605                	li	a2,1
    12e6:	4501                	li	a0,0
{
    12e8:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12ea:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12ee:	197000ef          	jal	ra,1c84 <read>
}
    12f2:	60e2                	ld	ra,24(sp)
    12f4:	00f14503          	lbu	a0,15(sp)
    12f8:	6105                	addi	sp,sp,32
    12fa:	8082                	ret

00000000000012fc <putchar>:
{
    12fc:	1101                	addi	sp,sp,-32
    12fe:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1300:	00f10593          	addi	a1,sp,15
    1304:	4605                	li	a2,1
    1306:	4505                	li	a0,1
{
    1308:	ec06                	sd	ra,24(sp)
    char byte = c;
    130a:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    130e:	181000ef          	jal	ra,1c8e <write>
}
    1312:	60e2                	ld	ra,24(sp)
    1314:	2501                	sext.w	a0,a0
    1316:	6105                	addi	sp,sp,32
    1318:	8082                	ret

000000000000131a <puts>:
{
    131a:	1141                	addi	sp,sp,-16
    131c:	e406                	sd	ra,8(sp)
    131e:	e022                	sd	s0,0(sp)
    1320:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1322:	57e000ef          	jal	ra,18a0 <strlen>
    1326:	862a                	mv	a2,a0
    1328:	85a2                	mv	a1,s0
    132a:	4505                	li	a0,1
    132c:	163000ef          	jal	ra,1c8e <write>
}
    1330:	60a2                	ld	ra,8(sp)
    1332:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1334:	957d                	srai	a0,a0,0x3f
    return r;
    1336:	2501                	sext.w	a0,a0
}
    1338:	0141                	addi	sp,sp,16
    133a:	8082                	ret

000000000000133c <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    133c:	7171                	addi	sp,sp,-176
    133e:	fc56                	sd	s5,56(sp)
    1340:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1342:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1344:	18bc                	addi	a5,sp,120
{
    1346:	e8ca                	sd	s2,80(sp)
    1348:	e4ce                	sd	s3,72(sp)
    134a:	e0d2                	sd	s4,64(sp)
    134c:	f85a                	sd	s6,48(sp)
    134e:	f486                	sd	ra,104(sp)
    1350:	f0a2                	sd	s0,96(sp)
    1352:	eca6                	sd	s1,88(sp)
    1354:	fcae                	sd	a1,120(sp)
    1356:	e132                	sd	a2,128(sp)
    1358:	e536                	sd	a3,136(sp)
    135a:	e93a                	sd	a4,144(sp)
    135c:	f142                	sd	a6,160(sp)
    135e:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1360:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1362:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1366:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    136a:	00001b17          	auipc	s6,0x1
    136e:	c16b0b13          	addi	s6,s6,-1002 # 1f80 <__clone+0xba>
    buf[i++] = '0';
    1372:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1376:	00001997          	auipc	s3,0x1
    137a:	c3a98993          	addi	s3,s3,-966 # 1fb0 <digits>
        if (!*s)
    137e:	00054783          	lbu	a5,0(a0)
    1382:	16078a63          	beqz	a5,14f6 <printf+0x1ba>
    1386:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1388:	19278163          	beq	a5,s2,150a <printf+0x1ce>
    138c:	00164783          	lbu	a5,1(a2)
    1390:	0605                	addi	a2,a2,1
    1392:	fbfd                	bnez	a5,1388 <printf+0x4c>
    1394:	84b2                	mv	s1,a2
        l = z - a;
    1396:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    139a:	85aa                	mv	a1,a0
    139c:	8622                	mv	a2,s0
    139e:	4505                	li	a0,1
    13a0:	0ef000ef          	jal	ra,1c8e <write>
        if (l)
    13a4:	18041c63          	bnez	s0,153c <printf+0x200>
        if (s[1] == 0)
    13a8:	0014c783          	lbu	a5,1(s1)
    13ac:	14078563          	beqz	a5,14f6 <printf+0x1ba>
        switch (s[1])
    13b0:	1d478063          	beq	a5,s4,1570 <printf+0x234>
    13b4:	18fa6663          	bltu	s4,a5,1540 <printf+0x204>
    13b8:	06400713          	li	a4,100
    13bc:	1ae78063          	beq	a5,a4,155c <printf+0x220>
    13c0:	07000713          	li	a4,112
    13c4:	1ce79963          	bne	a5,a4,1596 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    13c8:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13ca:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13ce:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13d0:	631c                	ld	a5,0(a4)
    13d2:	0721                	addi	a4,a4,8
    13d4:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13d6:	00479293          	slli	t0,a5,0x4
    13da:	00879f93          	slli	t6,a5,0x8
    13de:	00c79f13          	slli	t5,a5,0xc
    13e2:	01079e93          	slli	t4,a5,0x10
    13e6:	01479e13          	slli	t3,a5,0x14
    13ea:	01879313          	slli	t1,a5,0x18
    13ee:	01c79893          	slli	a7,a5,0x1c
    13f2:	02479813          	slli	a6,a5,0x24
    13f6:	02879513          	slli	a0,a5,0x28
    13fa:	02c79593          	slli	a1,a5,0x2c
    13fe:	03079693          	slli	a3,a5,0x30
    1402:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1406:	03c7d413          	srli	s0,a5,0x3c
    140a:	01c7d39b          	srliw	t2,a5,0x1c
    140e:	03c2d293          	srli	t0,t0,0x3c
    1412:	03cfdf93          	srli	t6,t6,0x3c
    1416:	03cf5f13          	srli	t5,t5,0x3c
    141a:	03cede93          	srli	t4,t4,0x3c
    141e:	03ce5e13          	srli	t3,t3,0x3c
    1422:	03c35313          	srli	t1,t1,0x3c
    1426:	03c8d893          	srli	a7,a7,0x3c
    142a:	03c85813          	srli	a6,a6,0x3c
    142e:	9171                	srli	a0,a0,0x3c
    1430:	91f1                	srli	a1,a1,0x3c
    1432:	92f1                	srli	a3,a3,0x3c
    1434:	9371                	srli	a4,a4,0x3c
    1436:	96ce                	add	a3,a3,s3
    1438:	974e                	add	a4,a4,s3
    143a:	944e                	add	s0,s0,s3
    143c:	92ce                	add	t0,t0,s3
    143e:	9fce                	add	t6,t6,s3
    1440:	9f4e                	add	t5,t5,s3
    1442:	9ece                	add	t4,t4,s3
    1444:	9e4e                	add	t3,t3,s3
    1446:	934e                	add	t1,t1,s3
    1448:	98ce                	add	a7,a7,s3
    144a:	93ce                	add	t2,t2,s3
    144c:	984e                	add	a6,a6,s3
    144e:	954e                	add	a0,a0,s3
    1450:	95ce                	add	a1,a1,s3
    1452:	0006c083          	lbu	ra,0(a3)
    1456:	0002c283          	lbu	t0,0(t0)
    145a:	00074683          	lbu	a3,0(a4)
    145e:	000fcf83          	lbu	t6,0(t6)
    1462:	000f4f03          	lbu	t5,0(t5)
    1466:	000ece83          	lbu	t4,0(t4)
    146a:	000e4e03          	lbu	t3,0(t3)
    146e:	00034303          	lbu	t1,0(t1)
    1472:	0008c883          	lbu	a7,0(a7)
    1476:	0003c383          	lbu	t2,0(t2)
    147a:	00084803          	lbu	a6,0(a6)
    147e:	00054503          	lbu	a0,0(a0)
    1482:	0005c583          	lbu	a1,0(a1)
    1486:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    148a:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    148e:	9371                	srli	a4,a4,0x3c
    1490:	8bbd                	andi	a5,a5,15
    1492:	974e                	add	a4,a4,s3
    1494:	97ce                	add	a5,a5,s3
    1496:	005105a3          	sb	t0,11(sp)
    149a:	01f10623          	sb	t6,12(sp)
    149e:	01e106a3          	sb	t5,13(sp)
    14a2:	01d10723          	sb	t4,14(sp)
    14a6:	01c107a3          	sb	t3,15(sp)
    14aa:	00610823          	sb	t1,16(sp)
    14ae:	011108a3          	sb	a7,17(sp)
    14b2:	00710923          	sb	t2,18(sp)
    14b6:	010109a3          	sb	a6,19(sp)
    14ba:	00a10a23          	sb	a0,20(sp)
    14be:	00b10aa3          	sb	a1,21(sp)
    14c2:	00110b23          	sb	ra,22(sp)
    14c6:	00d10ba3          	sb	a3,23(sp)
    14ca:	00810523          	sb	s0,10(sp)
    14ce:	00074703          	lbu	a4,0(a4)
    14d2:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14d6:	002c                	addi	a1,sp,8
    14d8:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14da:	00e10c23          	sb	a4,24(sp)
    14de:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14e2:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14e6:	7a8000ef          	jal	ra,1c8e <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14ea:	00248513          	addi	a0,s1,2
        if (!*s)
    14ee:	00054783          	lbu	a5,0(a0)
    14f2:	e8079ae3          	bnez	a5,1386 <printf+0x4a>
    }
    va_end(ap);
}
    14f6:	70a6                	ld	ra,104(sp)
    14f8:	7406                	ld	s0,96(sp)
    14fa:	64e6                	ld	s1,88(sp)
    14fc:	6946                	ld	s2,80(sp)
    14fe:	69a6                	ld	s3,72(sp)
    1500:	6a06                	ld	s4,64(sp)
    1502:	7ae2                	ld	s5,56(sp)
    1504:	7b42                	ld	s6,48(sp)
    1506:	614d                	addi	sp,sp,176
    1508:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    150a:	00064783          	lbu	a5,0(a2)
    150e:	84b2                	mv	s1,a2
    1510:	01278963          	beq	a5,s2,1522 <printf+0x1e6>
    1514:	b549                	j	1396 <printf+0x5a>
    1516:	0024c783          	lbu	a5,2(s1)
    151a:	0605                	addi	a2,a2,1
    151c:	0489                	addi	s1,s1,2
    151e:	e7279ce3          	bne	a5,s2,1396 <printf+0x5a>
    1522:	0014c783          	lbu	a5,1(s1)
    1526:	ff2788e3          	beq	a5,s2,1516 <printf+0x1da>
        l = z - a;
    152a:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    152e:	85aa                	mv	a1,a0
    1530:	8622                	mv	a2,s0
    1532:	4505                	li	a0,1
    1534:	75a000ef          	jal	ra,1c8e <write>
        if (l)
    1538:	e60408e3          	beqz	s0,13a8 <printf+0x6c>
    153c:	8526                	mv	a0,s1
    153e:	b581                	j	137e <printf+0x42>
        switch (s[1])
    1540:	07800713          	li	a4,120
    1544:	04e79963          	bne	a5,a4,1596 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    1548:	6782                	ld	a5,0(sp)
    154a:	45c1                	li	a1,16
    154c:	4388                	lw	a0,0(a5)
    154e:	07a1                	addi	a5,a5,8
    1550:	e03e                	sd	a5,0(sp)
    1552:	b71ff0ef          	jal	ra,10c2 <printint.constprop.0>
        s += 2;
    1556:	00248513          	addi	a0,s1,2
    155a:	bf51                	j	14ee <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    155c:	6782                	ld	a5,0(sp)
    155e:	45a9                	li	a1,10
    1560:	4388                	lw	a0,0(a5)
    1562:	07a1                	addi	a5,a5,8
    1564:	e03e                	sd	a5,0(sp)
    1566:	b5dff0ef          	jal	ra,10c2 <printint.constprop.0>
        s += 2;
    156a:	00248513          	addi	a0,s1,2
    156e:	b741                	j	14ee <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1570:	6782                	ld	a5,0(sp)
    1572:	6380                	ld	s0,0(a5)
    1574:	07a1                	addi	a5,a5,8
    1576:	e03e                	sd	a5,0(sp)
    1578:	c031                	beqz	s0,15bc <printf+0x280>
            l = strnlen(a, 200);
    157a:	0c800593          	li	a1,200
    157e:	8522                	mv	a0,s0
    1580:	40c000ef          	jal	ra,198c <strnlen>
    write(f, s, l);
    1584:	0005061b          	sext.w	a2,a0
    1588:	85a2                	mv	a1,s0
    158a:	4505                	li	a0,1
    158c:	702000ef          	jal	ra,1c8e <write>
        s += 2;
    1590:	00248513          	addi	a0,s1,2
    1594:	bfa9                	j	14ee <printf+0x1b2>
    return write(stdout, &byte, 1);
    1596:	4605                	li	a2,1
    1598:	002c                	addi	a1,sp,8
    159a:	4505                	li	a0,1
    char byte = c;
    159c:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15a0:	6ee000ef          	jal	ra,1c8e <write>
    char byte = c;
    15a4:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15a8:	4605                	li	a2,1
    15aa:	002c                	addi	a1,sp,8
    15ac:	4505                	li	a0,1
    char byte = c;
    15ae:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15b2:	6dc000ef          	jal	ra,1c8e <write>
        s += 2;
    15b6:	00248513          	addi	a0,s1,2
    15ba:	bf15                	j	14ee <printf+0x1b2>
                a = "(null)";
    15bc:	845a                	mv	s0,s6
    15be:	bf75                	j	157a <printf+0x23e>

00000000000015c0 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15c0:	1141                	addi	sp,sp,-16
    15c2:	e406                	sd	ra,8(sp)
    puts(m);
    15c4:	d57ff0ef          	jal	ra,131a <puts>
    exit(-100);
}
    15c8:	60a2                	ld	ra,8(sp)
    exit(-100);
    15ca:	f9c00513          	li	a0,-100
}
    15ce:	0141                	addi	sp,sp,16
    exit(-100);
    15d0:	a739                	j	1cde <exit>

00000000000015d2 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d2:	02000793          	li	a5,32
    15d6:	00f50663          	beq	a0,a5,15e2 <isspace+0x10>
    15da:	355d                	addiw	a0,a0,-9
    15dc:	00553513          	sltiu	a0,a0,5
    15e0:	8082                	ret
    15e2:	4505                	li	a0,1
}
    15e4:	8082                	ret

00000000000015e6 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15e6:	fd05051b          	addiw	a0,a0,-48
}
    15ea:	00a53513          	sltiu	a0,a0,10
    15ee:	8082                	ret

00000000000015f0 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15f0:	02000613          	li	a2,32
    15f4:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15f6:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15fa:	ff77869b          	addiw	a3,a5,-9
    15fe:	04c78c63          	beq	a5,a2,1656 <atoi+0x66>
    1602:	0007871b          	sext.w	a4,a5
    1606:	04d5f863          	bgeu	a1,a3,1656 <atoi+0x66>
        s++;
    switch (*s)
    160a:	02b00693          	li	a3,43
    160e:	04d78963          	beq	a5,a3,1660 <atoi+0x70>
    1612:	02d00693          	li	a3,45
    1616:	06d78263          	beq	a5,a3,167a <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    161a:	fd07061b          	addiw	a2,a4,-48
    161e:	47a5                	li	a5,9
    1620:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1622:	4e01                	li	t3,0
    while (isdigit(*s))
    1624:	04c7e963          	bltu	a5,a2,1676 <atoi+0x86>
    int n = 0, neg = 0;
    1628:	4501                	li	a0,0
    while (isdigit(*s))
    162a:	4825                	li	a6,9
    162c:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    1630:	0025179b          	slliw	a5,a0,0x2
    1634:	9fa9                	addw	a5,a5,a0
    1636:	fd07031b          	addiw	t1,a4,-48
    163a:	0017989b          	slliw	a7,a5,0x1
    while (isdigit(*s))
    163e:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1642:	0685                	addi	a3,a3,1
    1644:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1648:	0006071b          	sext.w	a4,a2
    164c:	feb870e3          	bgeu	a6,a1,162c <atoi+0x3c>
    return neg ? n : -n;
    1650:	000e0563          	beqz	t3,165a <atoi+0x6a>
}
    1654:	8082                	ret
        s++;
    1656:	0505                	addi	a0,a0,1
    1658:	bf79                	j	15f6 <atoi+0x6>
    return neg ? n : -n;
    165a:	4113053b          	subw	a0,t1,a7
    165e:	8082                	ret
    while (isdigit(*s))
    1660:	00154703          	lbu	a4,1(a0)
    1664:	47a5                	li	a5,9
        s++;
    1666:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    166a:	fd07061b          	addiw	a2,a4,-48
    int n = 0, neg = 0;
    166e:	4e01                	li	t3,0
    while (isdigit(*s))
    1670:	2701                	sext.w	a4,a4
    1672:	fac7fbe3          	bgeu	a5,a2,1628 <atoi+0x38>
    1676:	4501                	li	a0,0
}
    1678:	8082                	ret
    while (isdigit(*s))
    167a:	00154703          	lbu	a4,1(a0)
    167e:	47a5                	li	a5,9
        s++;
    1680:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1684:	fd07061b          	addiw	a2,a4,-48
    1688:	2701                	sext.w	a4,a4
    168a:	fec7e6e3          	bltu	a5,a2,1676 <atoi+0x86>
        neg = 1;
    168e:	4e05                	li	t3,1
    1690:	bf61                	j	1628 <atoi+0x38>

0000000000001692 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1692:	16060d63          	beqz	a2,180c <memset+0x17a>
    1696:	40a007b3          	neg	a5,a0
    169a:	8b9d                	andi	a5,a5,7
    169c:	00778693          	addi	a3,a5,7
    16a0:	482d                	li	a6,11
    16a2:	0ff5f713          	zext.b	a4,a1
    16a6:	fff60593          	addi	a1,a2,-1
    16aa:	1706e263          	bltu	a3,a6,180e <memset+0x17c>
    16ae:	16d5ea63          	bltu	a1,a3,1822 <memset+0x190>
    16b2:	16078563          	beqz	a5,181c <memset+0x18a>
    16b6:	00e50023          	sb	a4,0(a0)
    16ba:	4685                	li	a3,1
    16bc:	00150593          	addi	a1,a0,1
    16c0:	14d78c63          	beq	a5,a3,1818 <memset+0x186>
    16c4:	00e500a3          	sb	a4,1(a0)
    16c8:	4689                	li	a3,2
    16ca:	00250593          	addi	a1,a0,2
    16ce:	14d78d63          	beq	a5,a3,1828 <memset+0x196>
    16d2:	00e50123          	sb	a4,2(a0)
    16d6:	468d                	li	a3,3
    16d8:	00350593          	addi	a1,a0,3
    16dc:	12d78b63          	beq	a5,a3,1812 <memset+0x180>
    16e0:	00e501a3          	sb	a4,3(a0)
    16e4:	4691                	li	a3,4
    16e6:	00450593          	addi	a1,a0,4
    16ea:	14d78163          	beq	a5,a3,182c <memset+0x19a>
    16ee:	00e50223          	sb	a4,4(a0)
    16f2:	4695                	li	a3,5
    16f4:	00550593          	addi	a1,a0,5
    16f8:	12d78c63          	beq	a5,a3,1830 <memset+0x19e>
    16fc:	00e502a3          	sb	a4,5(a0)
    1700:	469d                	li	a3,7
    1702:	00650593          	addi	a1,a0,6
    1706:	12d79763          	bne	a5,a3,1834 <memset+0x1a2>
    170a:	00750593          	addi	a1,a0,7
    170e:	00e50323          	sb	a4,6(a0)
    1712:	481d                	li	a6,7
    1714:	00871693          	slli	a3,a4,0x8
    1718:	01071893          	slli	a7,a4,0x10
    171c:	8ed9                	or	a3,a3,a4
    171e:	01871313          	slli	t1,a4,0x18
    1722:	0116e6b3          	or	a3,a3,a7
    1726:	0066e6b3          	or	a3,a3,t1
    172a:	02071893          	slli	a7,a4,0x20
    172e:	02871e13          	slli	t3,a4,0x28
    1732:	0116e6b3          	or	a3,a3,a7
    1736:	40f60333          	sub	t1,a2,a5
    173a:	03071893          	slli	a7,a4,0x30
    173e:	01c6e6b3          	or	a3,a3,t3
    1742:	0116e6b3          	or	a3,a3,a7
    1746:	03871e13          	slli	t3,a4,0x38
    174a:	97aa                	add	a5,a5,a0
    174c:	ff837893          	andi	a7,t1,-8
    1750:	01c6e6b3          	or	a3,a3,t3
    1754:	98be                	add	a7,a7,a5
    1756:	e394                	sd	a3,0(a5)
    1758:	07a1                	addi	a5,a5,8
    175a:	ff179ee3          	bne	a5,a7,1756 <memset+0xc4>
    175e:	ff837893          	andi	a7,t1,-8
    1762:	011587b3          	add	a5,a1,a7
    1766:	010886bb          	addw	a3,a7,a6
    176a:	0b130663          	beq	t1,a7,1816 <memset+0x184>
    176e:	00e78023          	sb	a4,0(a5)
    1772:	0016859b          	addiw	a1,a3,1
    1776:	08c5fb63          	bgeu	a1,a2,180c <memset+0x17a>
    177a:	00e780a3          	sb	a4,1(a5)
    177e:	0026859b          	addiw	a1,a3,2
    1782:	08c5f563          	bgeu	a1,a2,180c <memset+0x17a>
    1786:	00e78123          	sb	a4,2(a5)
    178a:	0036859b          	addiw	a1,a3,3
    178e:	06c5ff63          	bgeu	a1,a2,180c <memset+0x17a>
    1792:	00e781a3          	sb	a4,3(a5)
    1796:	0046859b          	addiw	a1,a3,4
    179a:	06c5f963          	bgeu	a1,a2,180c <memset+0x17a>
    179e:	00e78223          	sb	a4,4(a5)
    17a2:	0056859b          	addiw	a1,a3,5
    17a6:	06c5f363          	bgeu	a1,a2,180c <memset+0x17a>
    17aa:	00e782a3          	sb	a4,5(a5)
    17ae:	0066859b          	addiw	a1,a3,6
    17b2:	04c5fd63          	bgeu	a1,a2,180c <memset+0x17a>
    17b6:	00e78323          	sb	a4,6(a5)
    17ba:	0076859b          	addiw	a1,a3,7
    17be:	04c5f763          	bgeu	a1,a2,180c <memset+0x17a>
    17c2:	00e783a3          	sb	a4,7(a5)
    17c6:	0086859b          	addiw	a1,a3,8
    17ca:	04c5f163          	bgeu	a1,a2,180c <memset+0x17a>
    17ce:	00e78423          	sb	a4,8(a5)
    17d2:	0096859b          	addiw	a1,a3,9
    17d6:	02c5fb63          	bgeu	a1,a2,180c <memset+0x17a>
    17da:	00e784a3          	sb	a4,9(a5)
    17de:	00a6859b          	addiw	a1,a3,10
    17e2:	02c5f563          	bgeu	a1,a2,180c <memset+0x17a>
    17e6:	00e78523          	sb	a4,10(a5)
    17ea:	00b6859b          	addiw	a1,a3,11
    17ee:	00c5ff63          	bgeu	a1,a2,180c <memset+0x17a>
    17f2:	00e785a3          	sb	a4,11(a5)
    17f6:	00c6859b          	addiw	a1,a3,12
    17fa:	00c5f963          	bgeu	a1,a2,180c <memset+0x17a>
    17fe:	00e78623          	sb	a4,12(a5)
    1802:	26b5                	addiw	a3,a3,13
    1804:	00c6f463          	bgeu	a3,a2,180c <memset+0x17a>
    1808:	00e786a3          	sb	a4,13(a5)
        ;
    return dest;
}
    180c:	8082                	ret
    180e:	46ad                	li	a3,11
    1810:	bd79                	j	16ae <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1812:	480d                	li	a6,3
    1814:	b701                	j	1714 <memset+0x82>
    1816:	8082                	ret
    1818:	4805                	li	a6,1
    181a:	bded                	j	1714 <memset+0x82>
    181c:	85aa                	mv	a1,a0
    181e:	4801                	li	a6,0
    1820:	bdd5                	j	1714 <memset+0x82>
    1822:	87aa                	mv	a5,a0
    1824:	4681                	li	a3,0
    1826:	b7a1                	j	176e <memset+0xdc>
    1828:	4809                	li	a6,2
    182a:	b5ed                	j	1714 <memset+0x82>
    182c:	4811                	li	a6,4
    182e:	b5dd                	j	1714 <memset+0x82>
    1830:	4815                	li	a6,5
    1832:	b5cd                	j	1714 <memset+0x82>
    1834:	4819                	li	a6,6
    1836:	bdf9                	j	1714 <memset+0x82>

0000000000001838 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1838:	00054783          	lbu	a5,0(a0)
    183c:	0005c703          	lbu	a4,0(a1)
    1840:	00e79863          	bne	a5,a4,1850 <strcmp+0x18>
    1844:	0505                	addi	a0,a0,1
    1846:	0585                	addi	a1,a1,1
    1848:	fbe5                	bnez	a5,1838 <strcmp>
    184a:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    184c:	9d19                	subw	a0,a0,a4
    184e:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1850:	0007851b          	sext.w	a0,a5
    1854:	bfe5                	j	184c <strcmp+0x14>

0000000000001856 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1856:	ca15                	beqz	a2,188a <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1858:	00054783          	lbu	a5,0(a0)
    if (!n--)
    185c:	167d                	addi	a2,a2,-1
    185e:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1862:	eb99                	bnez	a5,1878 <strncmp+0x22>
    1864:	a815                	j	1898 <strncmp+0x42>
    1866:	00a68e63          	beq	a3,a0,1882 <strncmp+0x2c>
    186a:	0505                	addi	a0,a0,1
    186c:	00f71b63          	bne	a4,a5,1882 <strncmp+0x2c>
    1870:	00054783          	lbu	a5,0(a0)
    1874:	cf89                	beqz	a5,188e <strncmp+0x38>
    1876:	85b2                	mv	a1,a2
    1878:	0005c703          	lbu	a4,0(a1)
    187c:	00158613          	addi	a2,a1,1
    1880:	f37d                	bnez	a4,1866 <strncmp+0x10>
        ;
    return *l - *r;
    1882:	0007851b          	sext.w	a0,a5
    1886:	9d19                	subw	a0,a0,a4
    1888:	8082                	ret
        return 0;
    188a:	4501                	li	a0,0
}
    188c:	8082                	ret
    return *l - *r;
    188e:	0015c703          	lbu	a4,1(a1)
    1892:	4501                	li	a0,0
    1894:	9d19                	subw	a0,a0,a4
    1896:	8082                	ret
    1898:	0005c703          	lbu	a4,0(a1)
    189c:	4501                	li	a0,0
    189e:	b7e5                	j	1886 <strncmp+0x30>

00000000000018a0 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18a0:	00757793          	andi	a5,a0,7
    18a4:	cf89                	beqz	a5,18be <strlen+0x1e>
    18a6:	87aa                	mv	a5,a0
    18a8:	a029                	j	18b2 <strlen+0x12>
    18aa:	0785                	addi	a5,a5,1
    18ac:	0077f713          	andi	a4,a5,7
    18b0:	cb01                	beqz	a4,18c0 <strlen+0x20>
        if (!*s)
    18b2:	0007c703          	lbu	a4,0(a5)
    18b6:	fb75                	bnez	a4,18aa <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18b8:	40a78533          	sub	a0,a5,a0
}
    18bc:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18be:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18c0:	6394                	ld	a3,0(a5)
    18c2:	00000597          	auipc	a1,0x0
    18c6:	6c65b583          	ld	a1,1734(a1) # 1f88 <__clone+0xc2>
    18ca:	00000617          	auipc	a2,0x0
    18ce:	6c663603          	ld	a2,1734(a2) # 1f90 <__clone+0xca>
    18d2:	a019                	j	18d8 <strlen+0x38>
    18d4:	6794                	ld	a3,8(a5)
    18d6:	07a1                	addi	a5,a5,8
    18d8:	00b68733          	add	a4,a3,a1
    18dc:	fff6c693          	not	a3,a3
    18e0:	8f75                	and	a4,a4,a3
    18e2:	8f71                	and	a4,a4,a2
    18e4:	db65                	beqz	a4,18d4 <strlen+0x34>
    for (; *s; s++)
    18e6:	0007c703          	lbu	a4,0(a5)
    18ea:	d779                	beqz	a4,18b8 <strlen+0x18>
    18ec:	0017c703          	lbu	a4,1(a5)
    18f0:	0785                	addi	a5,a5,1
    18f2:	d379                	beqz	a4,18b8 <strlen+0x18>
    18f4:	0017c703          	lbu	a4,1(a5)
    18f8:	0785                	addi	a5,a5,1
    18fa:	fb6d                	bnez	a4,18ec <strlen+0x4c>
    18fc:	bf75                	j	18b8 <strlen+0x18>

00000000000018fe <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18fe:	00757713          	andi	a4,a0,7
{
    1902:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1904:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1908:	cb19                	beqz	a4,191e <memchr+0x20>
    190a:	ce25                	beqz	a2,1982 <memchr+0x84>
    190c:	0007c703          	lbu	a4,0(a5)
    1910:	04b70e63          	beq	a4,a1,196c <memchr+0x6e>
    1914:	0785                	addi	a5,a5,1
    1916:	0077f713          	andi	a4,a5,7
    191a:	167d                	addi	a2,a2,-1
    191c:	f77d                	bnez	a4,190a <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    191e:	4501                	li	a0,0
    if (n && *s != c)
    1920:	c235                	beqz	a2,1984 <memchr+0x86>
    1922:	0007c703          	lbu	a4,0(a5)
    1926:	04b70363          	beq	a4,a1,196c <memchr+0x6e>
        size_t k = ONES * c;
    192a:	00000517          	auipc	a0,0x0
    192e:	66e53503          	ld	a0,1646(a0) # 1f98 <__clone+0xd2>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1932:	471d                	li	a4,7
        size_t k = ONES * c;
    1934:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1938:	02c77a63          	bgeu	a4,a2,196c <memchr+0x6e>
    193c:	00000897          	auipc	a7,0x0
    1940:	64c8b883          	ld	a7,1612(a7) # 1f88 <__clone+0xc2>
    1944:	00000817          	auipc	a6,0x0
    1948:	64c83803          	ld	a6,1612(a6) # 1f90 <__clone+0xca>
    194c:	431d                	li	t1,7
    194e:	a029                	j	1958 <memchr+0x5a>
    1950:	1661                	addi	a2,a2,-8
    1952:	07a1                	addi	a5,a5,8
    1954:	02c37963          	bgeu	t1,a2,1986 <memchr+0x88>
    1958:	6398                	ld	a4,0(a5)
    195a:	8f29                	xor	a4,a4,a0
    195c:	011706b3          	add	a3,a4,a7
    1960:	fff74713          	not	a4,a4
    1964:	8f75                	and	a4,a4,a3
    1966:	01077733          	and	a4,a4,a6
    196a:	d37d                	beqz	a4,1950 <memchr+0x52>
{
    196c:	853e                	mv	a0,a5
    196e:	97b2                	add	a5,a5,a2
    1970:	a021                	j	1978 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1972:	0505                	addi	a0,a0,1
    1974:	00f50763          	beq	a0,a5,1982 <memchr+0x84>
    1978:	00054703          	lbu	a4,0(a0)
    197c:	feb71be3          	bne	a4,a1,1972 <memchr+0x74>
    1980:	8082                	ret
    return n ? (void *)s : 0;
    1982:	4501                	li	a0,0
}
    1984:	8082                	ret
    return n ? (void *)s : 0;
    1986:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1988:	f275                	bnez	a2,196c <memchr+0x6e>
}
    198a:	8082                	ret

000000000000198c <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    198c:	1101                	addi	sp,sp,-32
    198e:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1990:	862e                	mv	a2,a1
{
    1992:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1994:	4581                	li	a1,0
{
    1996:	e426                	sd	s1,8(sp)
    1998:	ec06                	sd	ra,24(sp)
    199a:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    199c:	f63ff0ef          	jal	ra,18fe <memchr>
    return p ? p - s : n;
    19a0:	c519                	beqz	a0,19ae <strnlen+0x22>
}
    19a2:	60e2                	ld	ra,24(sp)
    19a4:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19a6:	8d05                	sub	a0,a0,s1
}
    19a8:	64a2                	ld	s1,8(sp)
    19aa:	6105                	addi	sp,sp,32
    19ac:	8082                	ret
    19ae:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19b0:	8522                	mv	a0,s0
}
    19b2:	6442                	ld	s0,16(sp)
    19b4:	64a2                	ld	s1,8(sp)
    19b6:	6105                	addi	sp,sp,32
    19b8:	8082                	ret

00000000000019ba <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19ba:	00a5c7b3          	xor	a5,a1,a0
    19be:	8b9d                	andi	a5,a5,7
    19c0:	eb95                	bnez	a5,19f4 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19c2:	0075f793          	andi	a5,a1,7
    19c6:	e7b1                	bnez	a5,1a12 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19c8:	6198                	ld	a4,0(a1)
    19ca:	00000617          	auipc	a2,0x0
    19ce:	5be63603          	ld	a2,1470(a2) # 1f88 <__clone+0xc2>
    19d2:	00000817          	auipc	a6,0x0
    19d6:	5be83803          	ld	a6,1470(a6) # 1f90 <__clone+0xca>
    19da:	a029                	j	19e4 <strcpy+0x2a>
    19dc:	05a1                	addi	a1,a1,8
    19de:	e118                	sd	a4,0(a0)
    19e0:	6198                	ld	a4,0(a1)
    19e2:	0521                	addi	a0,a0,8
    19e4:	00c707b3          	add	a5,a4,a2
    19e8:	fff74693          	not	a3,a4
    19ec:	8ff5                	and	a5,a5,a3
    19ee:	0107f7b3          	and	a5,a5,a6
    19f2:	d7ed                	beqz	a5,19dc <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19f4:	0005c783          	lbu	a5,0(a1)
    19f8:	00f50023          	sb	a5,0(a0)
    19fc:	c785                	beqz	a5,1a24 <strcpy+0x6a>
    19fe:	0015c783          	lbu	a5,1(a1)
    1a02:	0505                	addi	a0,a0,1
    1a04:	0585                	addi	a1,a1,1
    1a06:	00f50023          	sb	a5,0(a0)
    1a0a:	fbf5                	bnez	a5,19fe <strcpy+0x44>
        ;
    return d;
}
    1a0c:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a0e:	0505                	addi	a0,a0,1
    1a10:	df45                	beqz	a4,19c8 <strcpy+0xe>
            if (!(*d = *s))
    1a12:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a16:	0585                	addi	a1,a1,1
    1a18:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1a1c:	00f50023          	sb	a5,0(a0)
    1a20:	f7fd                	bnez	a5,1a0e <strcpy+0x54>
}
    1a22:	8082                	ret
    1a24:	8082                	ret

0000000000001a26 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a26:	00a5c7b3          	xor	a5,a1,a0
    1a2a:	8b9d                	andi	a5,a5,7
    1a2c:	1a079863          	bnez	a5,1bdc <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a30:	0075f793          	andi	a5,a1,7
    1a34:	16078463          	beqz	a5,1b9c <strncpy+0x176>
    1a38:	ea01                	bnez	a2,1a48 <strncpy+0x22>
    1a3a:	a421                	j	1c42 <strncpy+0x21c>
    1a3c:	167d                	addi	a2,a2,-1
    1a3e:	0505                	addi	a0,a0,1
    1a40:	14070e63          	beqz	a4,1b9c <strncpy+0x176>
    1a44:	1a060863          	beqz	a2,1bf4 <strncpy+0x1ce>
    1a48:	0005c783          	lbu	a5,0(a1)
    1a4c:	0585                	addi	a1,a1,1
    1a4e:	0075f713          	andi	a4,a1,7
    1a52:	00f50023          	sb	a5,0(a0)
    1a56:	f3fd                	bnez	a5,1a3c <strncpy+0x16>
    1a58:	4805                	li	a6,1
    1a5a:	1a061863          	bnez	a2,1c0a <strncpy+0x1e4>
    1a5e:	40a007b3          	neg	a5,a0
    1a62:	8b9d                	andi	a5,a5,7
    1a64:	4681                	li	a3,0
    1a66:	18061a63          	bnez	a2,1bfa <strncpy+0x1d4>
    1a6a:	00778713          	addi	a4,a5,7
    1a6e:	45ad                	li	a1,11
    1a70:	18b76363          	bltu	a4,a1,1bf6 <strncpy+0x1d0>
    1a74:	1ae6eb63          	bltu	a3,a4,1c2a <strncpy+0x204>
    1a78:	1a078363          	beqz	a5,1c1e <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a7c:	00050023          	sb	zero,0(a0)
    1a80:	4685                	li	a3,1
    1a82:	00150713          	addi	a4,a0,1
    1a86:	18d78f63          	beq	a5,a3,1c24 <strncpy+0x1fe>
    1a8a:	000500a3          	sb	zero,1(a0)
    1a8e:	4689                	li	a3,2
    1a90:	00250713          	addi	a4,a0,2
    1a94:	18d78e63          	beq	a5,a3,1c30 <strncpy+0x20a>
    1a98:	00050123          	sb	zero,2(a0)
    1a9c:	468d                	li	a3,3
    1a9e:	00350713          	addi	a4,a0,3
    1aa2:	16d78c63          	beq	a5,a3,1c1a <strncpy+0x1f4>
    1aa6:	000501a3          	sb	zero,3(a0)
    1aaa:	4691                	li	a3,4
    1aac:	00450713          	addi	a4,a0,4
    1ab0:	18d78263          	beq	a5,a3,1c34 <strncpy+0x20e>
    1ab4:	00050223          	sb	zero,4(a0)
    1ab8:	4695                	li	a3,5
    1aba:	00550713          	addi	a4,a0,5
    1abe:	16d78d63          	beq	a5,a3,1c38 <strncpy+0x212>
    1ac2:	000502a3          	sb	zero,5(a0)
    1ac6:	469d                	li	a3,7
    1ac8:	00650713          	addi	a4,a0,6
    1acc:	16d79863          	bne	a5,a3,1c3c <strncpy+0x216>
    1ad0:	00750713          	addi	a4,a0,7
    1ad4:	00050323          	sb	zero,6(a0)
    1ad8:	40f80833          	sub	a6,a6,a5
    1adc:	ff887593          	andi	a1,a6,-8
    1ae0:	97aa                	add	a5,a5,a0
    1ae2:	95be                	add	a1,a1,a5
    1ae4:	0007b023          	sd	zero,0(a5)
    1ae8:	07a1                	addi	a5,a5,8
    1aea:	feb79de3          	bne	a5,a1,1ae4 <strncpy+0xbe>
    1aee:	ff887593          	andi	a1,a6,-8
    1af2:	9ead                	addw	a3,a3,a1
    1af4:	00b707b3          	add	a5,a4,a1
    1af8:	12b80863          	beq	a6,a1,1c28 <strncpy+0x202>
    1afc:	00078023          	sb	zero,0(a5)
    1b00:	0016871b          	addiw	a4,a3,1
    1b04:	0ec77863          	bgeu	a4,a2,1bf4 <strncpy+0x1ce>
    1b08:	000780a3          	sb	zero,1(a5)
    1b0c:	0026871b          	addiw	a4,a3,2
    1b10:	0ec77263          	bgeu	a4,a2,1bf4 <strncpy+0x1ce>
    1b14:	00078123          	sb	zero,2(a5)
    1b18:	0036871b          	addiw	a4,a3,3
    1b1c:	0cc77c63          	bgeu	a4,a2,1bf4 <strncpy+0x1ce>
    1b20:	000781a3          	sb	zero,3(a5)
    1b24:	0046871b          	addiw	a4,a3,4
    1b28:	0cc77663          	bgeu	a4,a2,1bf4 <strncpy+0x1ce>
    1b2c:	00078223          	sb	zero,4(a5)
    1b30:	0056871b          	addiw	a4,a3,5
    1b34:	0cc77063          	bgeu	a4,a2,1bf4 <strncpy+0x1ce>
    1b38:	000782a3          	sb	zero,5(a5)
    1b3c:	0066871b          	addiw	a4,a3,6
    1b40:	0ac77a63          	bgeu	a4,a2,1bf4 <strncpy+0x1ce>
    1b44:	00078323          	sb	zero,6(a5)
    1b48:	0076871b          	addiw	a4,a3,7
    1b4c:	0ac77463          	bgeu	a4,a2,1bf4 <strncpy+0x1ce>
    1b50:	000783a3          	sb	zero,7(a5)
    1b54:	0086871b          	addiw	a4,a3,8
    1b58:	08c77e63          	bgeu	a4,a2,1bf4 <strncpy+0x1ce>
    1b5c:	00078423          	sb	zero,8(a5)
    1b60:	0096871b          	addiw	a4,a3,9
    1b64:	08c77863          	bgeu	a4,a2,1bf4 <strncpy+0x1ce>
    1b68:	000784a3          	sb	zero,9(a5)
    1b6c:	00a6871b          	addiw	a4,a3,10
    1b70:	08c77263          	bgeu	a4,a2,1bf4 <strncpy+0x1ce>
    1b74:	00078523          	sb	zero,10(a5)
    1b78:	00b6871b          	addiw	a4,a3,11
    1b7c:	06c77c63          	bgeu	a4,a2,1bf4 <strncpy+0x1ce>
    1b80:	000785a3          	sb	zero,11(a5)
    1b84:	00c6871b          	addiw	a4,a3,12
    1b88:	06c77663          	bgeu	a4,a2,1bf4 <strncpy+0x1ce>
    1b8c:	00078623          	sb	zero,12(a5)
    1b90:	26b5                	addiw	a3,a3,13
    1b92:	06c6f163          	bgeu	a3,a2,1bf4 <strncpy+0x1ce>
    1b96:	000786a3          	sb	zero,13(a5)
    1b9a:	8082                	ret
            ;
        if (!n || !*s)
    1b9c:	c645                	beqz	a2,1c44 <strncpy+0x21e>
    1b9e:	0005c783          	lbu	a5,0(a1)
    1ba2:	ea078be3          	beqz	a5,1a58 <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ba6:	479d                	li	a5,7
    1ba8:	02c7ff63          	bgeu	a5,a2,1be6 <strncpy+0x1c0>
    1bac:	00000897          	auipc	a7,0x0
    1bb0:	3dc8b883          	ld	a7,988(a7) # 1f88 <__clone+0xc2>
    1bb4:	00000817          	auipc	a6,0x0
    1bb8:	3dc83803          	ld	a6,988(a6) # 1f90 <__clone+0xca>
    1bbc:	431d                	li	t1,7
    1bbe:	6198                	ld	a4,0(a1)
    1bc0:	011707b3          	add	a5,a4,a7
    1bc4:	fff74693          	not	a3,a4
    1bc8:	8ff5                	and	a5,a5,a3
    1bca:	0107f7b3          	and	a5,a5,a6
    1bce:	ef81                	bnez	a5,1be6 <strncpy+0x1c0>
            *wd = *ws;
    1bd0:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bd2:	1661                	addi	a2,a2,-8
    1bd4:	05a1                	addi	a1,a1,8
    1bd6:	0521                	addi	a0,a0,8
    1bd8:	fec363e3          	bltu	t1,a2,1bbe <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1bdc:	e609                	bnez	a2,1be6 <strncpy+0x1c0>
    1bde:	a08d                	j	1c40 <strncpy+0x21a>
    1be0:	167d                	addi	a2,a2,-1
    1be2:	0505                	addi	a0,a0,1
    1be4:	ca01                	beqz	a2,1bf4 <strncpy+0x1ce>
    1be6:	0005c783          	lbu	a5,0(a1)
    1bea:	0585                	addi	a1,a1,1
    1bec:	00f50023          	sb	a5,0(a0)
    1bf0:	fbe5                	bnez	a5,1be0 <strncpy+0x1ba>
        ;
tail:
    1bf2:	b59d                	j	1a58 <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1bf4:	8082                	ret
    1bf6:	472d                	li	a4,11
    1bf8:	bdb5                	j	1a74 <strncpy+0x4e>
    1bfa:	00778713          	addi	a4,a5,7
    1bfe:	45ad                	li	a1,11
    1c00:	fff60693          	addi	a3,a2,-1
    1c04:	e6b778e3          	bgeu	a4,a1,1a74 <strncpy+0x4e>
    1c08:	b7fd                	j	1bf6 <strncpy+0x1d0>
    1c0a:	40a007b3          	neg	a5,a0
    1c0e:	8832                	mv	a6,a2
    1c10:	8b9d                	andi	a5,a5,7
    1c12:	4681                	li	a3,0
    1c14:	e4060be3          	beqz	a2,1a6a <strncpy+0x44>
    1c18:	b7cd                	j	1bfa <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c1a:	468d                	li	a3,3
    1c1c:	bd75                	j	1ad8 <strncpy+0xb2>
    1c1e:	872a                	mv	a4,a0
    1c20:	4681                	li	a3,0
    1c22:	bd5d                	j	1ad8 <strncpy+0xb2>
    1c24:	4685                	li	a3,1
    1c26:	bd4d                	j	1ad8 <strncpy+0xb2>
    1c28:	8082                	ret
    1c2a:	87aa                	mv	a5,a0
    1c2c:	4681                	li	a3,0
    1c2e:	b5f9                	j	1afc <strncpy+0xd6>
    1c30:	4689                	li	a3,2
    1c32:	b55d                	j	1ad8 <strncpy+0xb2>
    1c34:	4691                	li	a3,4
    1c36:	b54d                	j	1ad8 <strncpy+0xb2>
    1c38:	4695                	li	a3,5
    1c3a:	bd79                	j	1ad8 <strncpy+0xb2>
    1c3c:	4699                	li	a3,6
    1c3e:	bd69                	j	1ad8 <strncpy+0xb2>
    1c40:	8082                	ret
    1c42:	8082                	ret
    1c44:	8082                	ret

0000000000001c46 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c46:	87aa                	mv	a5,a0
    1c48:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c4a:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c4e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c52:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c54:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c56:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c5a:	2501                	sext.w	a0,a0
    1c5c:	8082                	ret

0000000000001c5e <openat>:
    register long a7 __asm__("a7") = n;
    1c5e:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c62:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c66:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c6a:	2501                	sext.w	a0,a0
    1c6c:	8082                	ret

0000000000001c6e <fcntl>:
    register long a7 __asm__("a7") = n;
    1c6e:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c70:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1c74:	2501                	sext.w	a0,a0
    1c76:	8082                	ret

0000000000001c78 <close>:
    register long a7 __asm__("a7") = n;
    1c78:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c7c:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c80:	2501                	sext.w	a0,a0
    1c82:	8082                	ret

0000000000001c84 <read>:
    register long a7 __asm__("a7") = n;
    1c84:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c88:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c8c:	8082                	ret

0000000000001c8e <write>:
    register long a7 __asm__("a7") = n;
    1c8e:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c92:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c96:	8082                	ret

0000000000001c98 <getpid>:
    register long a7 __asm__("a7") = n;
    1c98:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c9c:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1ca0:	2501                	sext.w	a0,a0
    1ca2:	8082                	ret

0000000000001ca4 <getppid>:
    register long a7 __asm__("a7") = n;
    1ca4:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1ca8:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cac:	2501                	sext.w	a0,a0
    1cae:	8082                	ret

0000000000001cb0 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cb0:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cb4:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cb8:	2501                	sext.w	a0,a0
    1cba:	8082                	ret

0000000000001cbc <fork>:
    register long a7 __asm__("a7") = n;
    1cbc:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cc0:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cc2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cc4:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cc8:	2501                	sext.w	a0,a0
    1cca:	8082                	ret

0000000000001ccc <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1ccc:	85b2                	mv	a1,a2
    1cce:	863a                	mv	a2,a4
    if (stack)
    1cd0:	c191                	beqz	a1,1cd4 <clone+0x8>
	stack += stack_size;
    1cd2:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cd4:	4781                	li	a5,0
    1cd6:	4701                	li	a4,0
    1cd8:	4681                	li	a3,0
    1cda:	2601                	sext.w	a2,a2
    1cdc:	a2ed                	j	1ec6 <__clone>

0000000000001cde <exit>:
    register long a7 __asm__("a7") = n;
    1cde:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1ce2:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1ce6:	8082                	ret

0000000000001ce8 <waitpid>:
    register long a7 __asm__("a7") = n;
    1ce8:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cec:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cee:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cf2:	2501                	sext.w	a0,a0
    1cf4:	8082                	ret

0000000000001cf6 <exec>:
    register long a7 __asm__("a7") = n;
    1cf6:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cfa:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cfe:	2501                	sext.w	a0,a0
    1d00:	8082                	ret

0000000000001d02 <execve>:
    register long a7 __asm__("a7") = n;
    1d02:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d06:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d0a:	2501                	sext.w	a0,a0
    1d0c:	8082                	ret

0000000000001d0e <times>:
    register long a7 __asm__("a7") = n;
    1d0e:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d12:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d16:	2501                	sext.w	a0,a0
    1d18:	8082                	ret

0000000000001d1a <get_time>:

int64 get_time()
{
    1d1a:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d1c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d20:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d22:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d24:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d28:	2501                	sext.w	a0,a0
    1d2a:	ed09                	bnez	a0,1d44 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d2c:	67a2                	ld	a5,8(sp)
    1d2e:	3e800713          	li	a4,1000
    1d32:	00015503          	lhu	a0,0(sp)
    1d36:	02e7d7b3          	divu	a5,a5,a4
    1d3a:	02e50533          	mul	a0,a0,a4
    1d3e:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d40:	0141                	addi	sp,sp,16
    1d42:	8082                	ret
        return -1;
    1d44:	557d                	li	a0,-1
    1d46:	bfed                	j	1d40 <get_time+0x26>

0000000000001d48 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d48:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d4c:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d50:	2501                	sext.w	a0,a0
    1d52:	8082                	ret

0000000000001d54 <time>:
    register long a7 __asm__("a7") = n;
    1d54:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d58:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d5c:	2501                	sext.w	a0,a0
    1d5e:	8082                	ret

0000000000001d60 <sleep>:

int sleep(unsigned long long time)
{
    1d60:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d62:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d64:	850a                	mv	a0,sp
    1d66:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d68:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d6c:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d6e:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d72:	e501                	bnez	a0,1d7a <sleep+0x1a>
    return 0;
    1d74:	4501                	li	a0,0
}
    1d76:	0141                	addi	sp,sp,16
    1d78:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d7a:	4502                	lw	a0,0(sp)
}
    1d7c:	0141                	addi	sp,sp,16
    1d7e:	8082                	ret

0000000000001d80 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d80:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d84:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d88:	2501                	sext.w	a0,a0
    1d8a:	8082                	ret

0000000000001d8c <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d8c:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d90:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d94:	8082                	ret

0000000000001d96 <munmap>:
    register long a7 __asm__("a7") = n;
    1d96:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d9a:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d9e:	2501                	sext.w	a0,a0
    1da0:	8082                	ret

0000000000001da2 <wait>:

int wait(int *code)
{
    1da2:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1da4:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1da8:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1daa:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1dac:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dae:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1db2:	2501                	sext.w	a0,a0
    1db4:	8082                	ret

0000000000001db6 <spawn>:
    register long a7 __asm__("a7") = n;
    1db6:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1dba:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	8082                	ret

0000000000001dc2 <mailread>:
    register long a7 __asm__("a7") = n;
    1dc2:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc6:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dca:	2501                	sext.w	a0,a0
    1dcc:	8082                	ret

0000000000001dce <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dce:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd2:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dd6:	2501                	sext.w	a0,a0
    1dd8:	8082                	ret

0000000000001dda <fstat>:
    register long a7 __asm__("a7") = n;
    1dda:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dde:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1de2:	2501                	sext.w	a0,a0
    1de4:	8082                	ret

0000000000001de6 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1de6:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1de8:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dec:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dee:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1df2:	2501                	sext.w	a0,a0
    1df4:	8082                	ret

0000000000001df6 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1df6:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1df8:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1dfc:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dfe:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e02:	2501                	sext.w	a0,a0
    1e04:	8082                	ret

0000000000001e06 <link>:

int link(char *old_path, char *new_path)
{
    1e06:	87aa                	mv	a5,a0
    1e08:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e0a:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e0e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e12:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e14:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e18:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e1a:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e1e:	2501                	sext.w	a0,a0
    1e20:	8082                	ret

0000000000001e22 <unlink>:

int unlink(char *path)
{
    1e22:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e24:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e28:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e2c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e2e:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e32:	2501                	sext.w	a0,a0
    1e34:	8082                	ret

0000000000001e36 <uname>:
    register long a7 __asm__("a7") = n;
    1e36:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e3a:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e3e:	2501                	sext.w	a0,a0
    1e40:	8082                	ret

0000000000001e42 <brk>:
    register long a7 __asm__("a7") = n;
    1e42:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e46:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e4a:	2501                	sext.w	a0,a0
    1e4c:	8082                	ret

0000000000001e4e <getcwd>:
    register long a7 __asm__("a7") = n;
    1e4e:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e50:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e54:	8082                	ret

0000000000001e56 <chdir>:
    register long a7 __asm__("a7") = n;
    1e56:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e5a:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e5e:	2501                	sext.w	a0,a0
    1e60:	8082                	ret

0000000000001e62 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e62:	862e                	mv	a2,a1
    1e64:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e66:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e68:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e6c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e70:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e72:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e74:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e78:	2501                	sext.w	a0,a0
    1e7a:	8082                	ret

0000000000001e7c <getdents>:
    register long a7 __asm__("a7") = n;
    1e7c:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e80:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e84:	2501                	sext.w	a0,a0
    1e86:	8082                	ret

0000000000001e88 <pipe>:
    register long a7 __asm__("a7") = n;
    1e88:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e8c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e8e:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e92:	2501                	sext.w	a0,a0
    1e94:	8082                	ret

0000000000001e96 <dup>:
    register long a7 __asm__("a7") = n;
    1e96:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e98:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e9c:	2501                	sext.w	a0,a0
    1e9e:	8082                	ret

0000000000001ea0 <dup2>:
    register long a7 __asm__("a7") = n;
    1ea0:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1ea2:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ea4:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ea8:	2501                	sext.w	a0,a0
    1eaa:	8082                	ret

0000000000001eac <mount>:
    register long a7 __asm__("a7") = n;
    1eac:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1eb0:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1eb4:	2501                	sext.w	a0,a0
    1eb6:	8082                	ret

0000000000001eb8 <umount>:
    register long a7 __asm__("a7") = n;
    1eb8:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ebc:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ebe:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ec2:	2501                	sext.w	a0,a0
    1ec4:	8082                	ret

0000000000001ec6 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ec6:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1ec8:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1eca:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ecc:	8532                	mv	a0,a2
	mv a2, a4
    1ece:	863a                	mv	a2,a4
	mv a3, a5
    1ed0:	86be                	mv	a3,a5
	mv a4, a6
    1ed2:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ed4:	0dc00893          	li	a7,220
	ecall
    1ed8:	00000073          	ecall

	beqz a0, 1f
    1edc:	c111                	beqz	a0,1ee0 <__clone+0x1a>
	# Parent
	ret
    1ede:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ee0:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ee2:	6522                	ld	a0,8(sp)
	jalr a1
    1ee4:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ee6:	05d00893          	li	a7,93
	ecall
    1eea:	00000073          	ecall
