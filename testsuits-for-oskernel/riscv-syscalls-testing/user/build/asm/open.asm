
/home/brightnight/OScompetition/6.13晚final_main/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/open：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a855                	j	10b6 <__start_main>

0000000000001004 <test_open>:
#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"

void test_open() {
    1004:	716d                	addi	sp,sp,-272
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	efa50513          	addi	a0,a0,-262 # 1f00 <__clone+0x2c>
void test_open() {
    100e:	e606                	sd	ra,264(sp)
    1010:	e222                	sd	s0,256(sp)
	TEST_START(__func__);
    1012:	316000ef          	jal	ra,1328 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	f7250513          	addi	a0,a0,-142 # 1f88 <__func__.0>
    101e:	30a000ef          	jal	ra,1328 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	ef650513          	addi	a0,a0,-266 # 1f18 <__clone+0x44>
    102a:	2fe000ef          	jal	ra,1328 <puts>
	// O_RDONLY = 0, O_WRONLY = 1
	int fd = open("./text.txt", 0);
    102e:	4581                	li	a1,0
    1030:	00001517          	auipc	a0,0x1
    1034:	ef850513          	addi	a0,a0,-264 # 1f28 <__clone+0x54>
    1038:	41d000ef          	jal	ra,1c54 <open>
    103c:	842a                	mv	s0,a0
	assert(fd >= 0);
    103e:	04054d63          	bltz	a0,1098 <test_open+0x94>
	char buf[256];
	int size = read(fd, buf, 256);
    1042:	858a                	mv	a1,sp
    1044:	10000613          	li	a2,256
    1048:	8522                	mv	a0,s0
    104a:	449000ef          	jal	ra,1c92 <read>
	if (size < 0) {
		size = 0;
	}
	write(STDOUT, buf, size);
    104e:	0005079b          	sext.w	a5,a0
    1052:	fff7c793          	not	a5,a5
    1056:	97fd                	srai	a5,a5,0x3f
    1058:	00f57633          	and	a2,a0,a5
    105c:	858a                	mv	a1,sp
    105e:	2601                	sext.w	a2,a2
    1060:	4505                	li	a0,1
    1062:	43b000ef          	jal	ra,1c9c <write>
	close(fd);
    1066:	8522                	mv	a0,s0
    1068:	41f000ef          	jal	ra,1c86 <close>
	TEST_END(__func__);
    106c:	00001517          	auipc	a0,0x1
    1070:	eec50513          	addi	a0,a0,-276 # 1f58 <__clone+0x84>
    1074:	2b4000ef          	jal	ra,1328 <puts>
    1078:	00001517          	auipc	a0,0x1
    107c:	f1050513          	addi	a0,a0,-240 # 1f88 <__func__.0>
    1080:	2a8000ef          	jal	ra,1328 <puts>
    1084:	00001517          	auipc	a0,0x1
    1088:	e9450513          	addi	a0,a0,-364 # 1f18 <__clone+0x44>
    108c:	29c000ef          	jal	ra,1328 <puts>
}
    1090:	60b2                	ld	ra,264(sp)
    1092:	6412                	ld	s0,256(sp)
    1094:	6151                	addi	sp,sp,272
    1096:	8082                	ret
	assert(fd >= 0);
    1098:	00001517          	auipc	a0,0x1
    109c:	ea050513          	addi	a0,a0,-352 # 1f38 <__clone+0x64>
    10a0:	52e000ef          	jal	ra,15ce <panic>
    10a4:	bf79                	j	1042 <test_open+0x3e>

00000000000010a6 <main>:

int main(void) {
    10a6:	1141                	addi	sp,sp,-16
    10a8:	e406                	sd	ra,8(sp)
	test_open();
    10aa:	f5bff0ef          	jal	ra,1004 <test_open>
	return 0;
}
    10ae:	60a2                	ld	ra,8(sp)
    10b0:	4501                	li	a0,0
    10b2:	0141                	addi	sp,sp,16
    10b4:	8082                	ret

00000000000010b6 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10b6:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10b8:	4108                	lw	a0,0(a0)
{
    10ba:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10bc:	05a1                	addi	a1,a1,8
{
    10be:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10c0:	fe7ff0ef          	jal	ra,10a6 <main>
    10c4:	429000ef          	jal	ra,1cec <exit>
	return 0;
}
    10c8:	60a2                	ld	ra,8(sp)
    10ca:	4501                	li	a0,0
    10cc:	0141                	addi	sp,sp,16
    10ce:	8082                	ret

00000000000010d0 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10d0:	7179                	addi	sp,sp,-48
    10d2:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10d4:	12054b63          	bltz	a0,120a <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10d8:	02b577bb          	remuw	a5,a0,a1
    10dc:	00001617          	auipc	a2,0x1
    10e0:	ebc60613          	addi	a2,a2,-324 # 1f98 <digits>
    buf[16] = 0;
    10e4:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10e8:	0005871b          	sext.w	a4,a1
    10ec:	1782                	slli	a5,a5,0x20
    10ee:	9381                	srli	a5,a5,0x20
    10f0:	97b2                	add	a5,a5,a2
    10f2:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10f6:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10fa:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10fe:	1cb56363          	bltu	a0,a1,12c4 <printint.constprop.0+0x1f4>
        buf[i--] = digits[x % base];
    1102:	45b9                	li	a1,14
    1104:	02e877bb          	remuw	a5,a6,a4
    1108:	1782                	slli	a5,a5,0x20
    110a:	9381                	srli	a5,a5,0x20
    110c:	97b2                	add	a5,a5,a2
    110e:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1112:	02e856bb          	divuw	a3,a6,a4
        buf[i--] = digits[x % base];
    1116:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    111a:	0ce86e63          	bltu	a6,a4,11f6 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    111e:	02e6f5bb          	remuw	a1,a3,a4
    } while ((x /= base) != 0);
    1122:	02e6d7bb          	divuw	a5,a3,a4
        buf[i--] = digits[x % base];
    1126:	1582                	slli	a1,a1,0x20
    1128:	9181                	srli	a1,a1,0x20
    112a:	95b2                	add	a1,a1,a2
    112c:	0005c583          	lbu	a1,0(a1)
    1130:	00b10aa3          	sb	a1,21(sp)
    } while ((x /= base) != 0);
    1134:	0007859b          	sext.w	a1,a5
    1138:	12e6ec63          	bltu	a3,a4,1270 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    113c:	02e7f6bb          	remuw	a3,a5,a4
    1140:	1682                	slli	a3,a3,0x20
    1142:	9281                	srli	a3,a3,0x20
    1144:	96b2                	add	a3,a3,a2
    1146:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    114a:	02e7d83b          	divuw	a6,a5,a4
        buf[i--] = digits[x % base];
    114e:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1152:	12e5e863          	bltu	a1,a4,1282 <printint.constprop.0+0x1b2>
        buf[i--] = digits[x % base];
    1156:	02e876bb          	remuw	a3,a6,a4
    115a:	1682                	slli	a3,a3,0x20
    115c:	9281                	srli	a3,a3,0x20
    115e:	96b2                	add	a3,a3,a2
    1160:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1164:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1168:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    116c:	12e86463          	bltu	a6,a4,1294 <printint.constprop.0+0x1c4>
        buf[i--] = digits[x % base];
    1170:	02e5f6bb          	remuw	a3,a1,a4
    1174:	1682                	slli	a3,a3,0x20
    1176:	9281                	srli	a3,a3,0x20
    1178:	96b2                	add	a3,a3,a2
    117a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    117e:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1182:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    1186:	0ce5ec63          	bltu	a1,a4,125e <printint.constprop.0+0x18e>
        buf[i--] = digits[x % base];
    118a:	02e876bb          	remuw	a3,a6,a4
    118e:	1682                	slli	a3,a3,0x20
    1190:	9281                	srli	a3,a3,0x20
    1192:	96b2                	add	a3,a3,a2
    1194:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1198:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    119c:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11a0:	10e86963          	bltu	a6,a4,12b2 <printint.constprop.0+0x1e2>
        buf[i--] = digits[x % base];
    11a4:	02e5f6bb          	remuw	a3,a1,a4
    11a8:	1682                	slli	a3,a3,0x20
    11aa:	9281                	srli	a3,a3,0x20
    11ac:	96b2                	add	a3,a3,a2
    11ae:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11b2:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11b6:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11ba:	10e5e763          	bltu	a1,a4,12c8 <printint.constprop.0+0x1f8>
        buf[i--] = digits[x % base];
    11be:	02e876bb          	remuw	a3,a6,a4
    11c2:	1682                	slli	a3,a3,0x20
    11c4:	9281                	srli	a3,a3,0x20
    11c6:	96b2                	add	a3,a3,a2
    11c8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11cc:	02e857bb          	divuw	a5,a6,a4
        buf[i--] = digits[x % base];
    11d0:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11d4:	10e86363          	bltu	a6,a4,12da <printint.constprop.0+0x20a>
        buf[i--] = digits[x % base];
    11d8:	1782                	slli	a5,a5,0x20
    11da:	9381                	srli	a5,a5,0x20
    11dc:	97b2                	add	a5,a5,a2
    11de:	0007c783          	lbu	a5,0(a5)
    11e2:	4599                	li	a1,6
    11e4:	00f10723          	sb	a5,14(sp)

    if (sign)
    11e8:	00055763          	bgez	a0,11f6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    11ec:	02d00793          	li	a5,45
    11f0:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11f4:	4595                	li	a1,5
    write(f, s, l);
    11f6:	003c                	addi	a5,sp,8
    11f8:	4641                	li	a2,16
    11fa:	9e0d                	subw	a2,a2,a1
    11fc:	4505                	li	a0,1
    11fe:	95be                	add	a1,a1,a5
    1200:	29d000ef          	jal	ra,1c9c <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1204:	70a2                	ld	ra,40(sp)
    1206:	6145                	addi	sp,sp,48
    1208:	8082                	ret
        x = -xx;
    120a:	40a0083b          	negw	a6,a0
        buf[i--] = digits[x % base];
    120e:	02b877bb          	remuw	a5,a6,a1
    1212:	00001617          	auipc	a2,0x1
    1216:	d8660613          	addi	a2,a2,-634 # 1f98 <digits>
    buf[16] = 0;
    121a:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    121e:	0005871b          	sext.w	a4,a1
    1222:	1782                	slli	a5,a5,0x20
    1224:	9381                	srli	a5,a5,0x20
    1226:	97b2                	add	a5,a5,a2
    1228:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    122c:	02b858bb          	divuw	a7,a6,a1
        buf[i--] = digits[x % base];
    1230:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1234:	06b86963          	bltu	a6,a1,12a6 <printint.constprop.0+0x1d6>
        buf[i--] = digits[x % base];
    1238:	02e8f7bb          	remuw	a5,a7,a4
    123c:	1782                	slli	a5,a5,0x20
    123e:	9381                	srli	a5,a5,0x20
    1240:	97b2                	add	a5,a5,a2
    1242:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1246:	02e8d6bb          	divuw	a3,a7,a4
        buf[i--] = digits[x % base];
    124a:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    124e:	ece8f8e3          	bgeu	a7,a4,111e <printint.constprop.0+0x4e>
        buf[i--] = '-';
    1252:	02d00793          	li	a5,45
    1256:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    125a:	45b5                	li	a1,13
    125c:	bf69                	j	11f6 <printint.constprop.0+0x126>
    125e:	45a9                	li	a1,10
    if (sign)
    1260:	f8055be3          	bgez	a0,11f6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1264:	02d00793          	li	a5,45
    1268:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    126c:	45a5                	li	a1,9
    126e:	b761                	j	11f6 <printint.constprop.0+0x126>
    1270:	45b5                	li	a1,13
    if (sign)
    1272:	f80552e3          	bgez	a0,11f6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1276:	02d00793          	li	a5,45
    127a:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    127e:	45b1                	li	a1,12
    1280:	bf9d                	j	11f6 <printint.constprop.0+0x126>
    1282:	45b1                	li	a1,12
    if (sign)
    1284:	f60559e3          	bgez	a0,11f6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1288:	02d00793          	li	a5,45
    128c:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1290:	45ad                	li	a1,11
    1292:	b795                	j	11f6 <printint.constprop.0+0x126>
    1294:	45ad                	li	a1,11
    if (sign)
    1296:	f60550e3          	bgez	a0,11f6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    129a:	02d00793          	li	a5,45
    129e:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12a2:	45a9                	li	a1,10
    12a4:	bf89                	j	11f6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12a6:	02d00793          	li	a5,45
    12aa:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12ae:	45b9                	li	a1,14
    12b0:	b799                	j	11f6 <printint.constprop.0+0x126>
    12b2:	45a5                	li	a1,9
    if (sign)
    12b4:	f40551e3          	bgez	a0,11f6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12b8:	02d00793          	li	a5,45
    12bc:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12c0:	45a1                	li	a1,8
    12c2:	bf15                	j	11f6 <printint.constprop.0+0x126>
    i = 15;
    12c4:	45bd                	li	a1,15
    12c6:	bf05                	j	11f6 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    12c8:	45a1                	li	a1,8
    if (sign)
    12ca:	f20556e3          	bgez	a0,11f6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12ce:	02d00793          	li	a5,45
    12d2:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12d6:	459d                	li	a1,7
    12d8:	bf39                	j	11f6 <printint.constprop.0+0x126>
    12da:	459d                	li	a1,7
    if (sign)
    12dc:	f0055de3          	bgez	a0,11f6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12e0:	02d00793          	li	a5,45
    12e4:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12e8:	4599                	li	a1,6
    12ea:	b731                	j	11f6 <printint.constprop.0+0x126>

00000000000012ec <getchar>:
{
    12ec:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12ee:	00f10593          	addi	a1,sp,15
    12f2:	4605                	li	a2,1
    12f4:	4501                	li	a0,0
{
    12f6:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12f8:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12fc:	197000ef          	jal	ra,1c92 <read>
}
    1300:	60e2                	ld	ra,24(sp)
    1302:	00f14503          	lbu	a0,15(sp)
    1306:	6105                	addi	sp,sp,32
    1308:	8082                	ret

000000000000130a <putchar>:
{
    130a:	1101                	addi	sp,sp,-32
    130c:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    130e:	00f10593          	addi	a1,sp,15
    1312:	4605                	li	a2,1
    1314:	4505                	li	a0,1
{
    1316:	ec06                	sd	ra,24(sp)
    char byte = c;
    1318:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    131c:	181000ef          	jal	ra,1c9c <write>
}
    1320:	60e2                	ld	ra,24(sp)
    1322:	2501                	sext.w	a0,a0
    1324:	6105                	addi	sp,sp,32
    1326:	8082                	ret

0000000000001328 <puts>:
{
    1328:	1141                	addi	sp,sp,-16
    132a:	e406                	sd	ra,8(sp)
    132c:	e022                	sd	s0,0(sp)
    132e:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1330:	57e000ef          	jal	ra,18ae <strlen>
    1334:	862a                	mv	a2,a0
    1336:	85a2                	mv	a1,s0
    1338:	4505                	li	a0,1
    133a:	163000ef          	jal	ra,1c9c <write>
}
    133e:	60a2                	ld	ra,8(sp)
    1340:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1342:	957d                	srai	a0,a0,0x3f
    return r;
    1344:	2501                	sext.w	a0,a0
}
    1346:	0141                	addi	sp,sp,16
    1348:	8082                	ret

000000000000134a <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    134a:	7171                	addi	sp,sp,-176
    134c:	fc56                	sd	s5,56(sp)
    134e:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1350:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1352:	18bc                	addi	a5,sp,120
{
    1354:	e8ca                	sd	s2,80(sp)
    1356:	e4ce                	sd	s3,72(sp)
    1358:	e0d2                	sd	s4,64(sp)
    135a:	f85a                	sd	s6,48(sp)
    135c:	f486                	sd	ra,104(sp)
    135e:	f0a2                	sd	s0,96(sp)
    1360:	eca6                	sd	s1,88(sp)
    1362:	fcae                	sd	a1,120(sp)
    1364:	e132                	sd	a2,128(sp)
    1366:	e536                	sd	a3,136(sp)
    1368:	e93a                	sd	a4,144(sp)
    136a:	f142                	sd	a6,160(sp)
    136c:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    136e:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1370:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1374:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1378:	00001b17          	auipc	s6,0x1
    137c:	bf0b0b13          	addi	s6,s6,-1040 # 1f68 <__clone+0x94>
    buf[i++] = '0';
    1380:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1384:	00001997          	auipc	s3,0x1
    1388:	c1498993          	addi	s3,s3,-1004 # 1f98 <digits>
        if (!*s)
    138c:	00054783          	lbu	a5,0(a0)
    1390:	16078a63          	beqz	a5,1504 <printf+0x1ba>
    1394:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1396:	19278163          	beq	a5,s2,1518 <printf+0x1ce>
    139a:	00164783          	lbu	a5,1(a2)
    139e:	0605                	addi	a2,a2,1
    13a0:	fbfd                	bnez	a5,1396 <printf+0x4c>
    13a2:	84b2                	mv	s1,a2
        l = z - a;
    13a4:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13a8:	85aa                	mv	a1,a0
    13aa:	8622                	mv	a2,s0
    13ac:	4505                	li	a0,1
    13ae:	0ef000ef          	jal	ra,1c9c <write>
        if (l)
    13b2:	18041c63          	bnez	s0,154a <printf+0x200>
        if (s[1] == 0)
    13b6:	0014c783          	lbu	a5,1(s1)
    13ba:	14078563          	beqz	a5,1504 <printf+0x1ba>
        switch (s[1])
    13be:	1d478063          	beq	a5,s4,157e <printf+0x234>
    13c2:	18fa6663          	bltu	s4,a5,154e <printf+0x204>
    13c6:	06400713          	li	a4,100
    13ca:	1ae78063          	beq	a5,a4,156a <printf+0x220>
    13ce:	07000713          	li	a4,112
    13d2:	1ce79963          	bne	a5,a4,15a4 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    13d6:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13d8:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13dc:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13de:	631c                	ld	a5,0(a4)
    13e0:	0721                	addi	a4,a4,8
    13e2:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13e4:	00479293          	slli	t0,a5,0x4
    13e8:	00879f93          	slli	t6,a5,0x8
    13ec:	00c79f13          	slli	t5,a5,0xc
    13f0:	01079e93          	slli	t4,a5,0x10
    13f4:	01479e13          	slli	t3,a5,0x14
    13f8:	01879313          	slli	t1,a5,0x18
    13fc:	01c79893          	slli	a7,a5,0x1c
    1400:	02479813          	slli	a6,a5,0x24
    1404:	02879513          	slli	a0,a5,0x28
    1408:	02c79593          	slli	a1,a5,0x2c
    140c:	03079693          	slli	a3,a5,0x30
    1410:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1414:	03c7d413          	srli	s0,a5,0x3c
    1418:	01c7d39b          	srliw	t2,a5,0x1c
    141c:	03c2d293          	srli	t0,t0,0x3c
    1420:	03cfdf93          	srli	t6,t6,0x3c
    1424:	03cf5f13          	srli	t5,t5,0x3c
    1428:	03cede93          	srli	t4,t4,0x3c
    142c:	03ce5e13          	srli	t3,t3,0x3c
    1430:	03c35313          	srli	t1,t1,0x3c
    1434:	03c8d893          	srli	a7,a7,0x3c
    1438:	03c85813          	srli	a6,a6,0x3c
    143c:	9171                	srli	a0,a0,0x3c
    143e:	91f1                	srli	a1,a1,0x3c
    1440:	92f1                	srli	a3,a3,0x3c
    1442:	9371                	srli	a4,a4,0x3c
    1444:	96ce                	add	a3,a3,s3
    1446:	974e                	add	a4,a4,s3
    1448:	944e                	add	s0,s0,s3
    144a:	92ce                	add	t0,t0,s3
    144c:	9fce                	add	t6,t6,s3
    144e:	9f4e                	add	t5,t5,s3
    1450:	9ece                	add	t4,t4,s3
    1452:	9e4e                	add	t3,t3,s3
    1454:	934e                	add	t1,t1,s3
    1456:	98ce                	add	a7,a7,s3
    1458:	93ce                	add	t2,t2,s3
    145a:	984e                	add	a6,a6,s3
    145c:	954e                	add	a0,a0,s3
    145e:	95ce                	add	a1,a1,s3
    1460:	0006c083          	lbu	ra,0(a3)
    1464:	0002c283          	lbu	t0,0(t0)
    1468:	00074683          	lbu	a3,0(a4)
    146c:	000fcf83          	lbu	t6,0(t6)
    1470:	000f4f03          	lbu	t5,0(t5)
    1474:	000ece83          	lbu	t4,0(t4)
    1478:	000e4e03          	lbu	t3,0(t3)
    147c:	00034303          	lbu	t1,0(t1)
    1480:	0008c883          	lbu	a7,0(a7)
    1484:	0003c383          	lbu	t2,0(t2)
    1488:	00084803          	lbu	a6,0(a6)
    148c:	00054503          	lbu	a0,0(a0)
    1490:	0005c583          	lbu	a1,0(a1)
    1494:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1498:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    149c:	9371                	srli	a4,a4,0x3c
    149e:	8bbd                	andi	a5,a5,15
    14a0:	974e                	add	a4,a4,s3
    14a2:	97ce                	add	a5,a5,s3
    14a4:	005105a3          	sb	t0,11(sp)
    14a8:	01f10623          	sb	t6,12(sp)
    14ac:	01e106a3          	sb	t5,13(sp)
    14b0:	01d10723          	sb	t4,14(sp)
    14b4:	01c107a3          	sb	t3,15(sp)
    14b8:	00610823          	sb	t1,16(sp)
    14bc:	011108a3          	sb	a7,17(sp)
    14c0:	00710923          	sb	t2,18(sp)
    14c4:	010109a3          	sb	a6,19(sp)
    14c8:	00a10a23          	sb	a0,20(sp)
    14cc:	00b10aa3          	sb	a1,21(sp)
    14d0:	00110b23          	sb	ra,22(sp)
    14d4:	00d10ba3          	sb	a3,23(sp)
    14d8:	00810523          	sb	s0,10(sp)
    14dc:	00074703          	lbu	a4,0(a4)
    14e0:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14e4:	002c                	addi	a1,sp,8
    14e6:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14e8:	00e10c23          	sb	a4,24(sp)
    14ec:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14f0:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14f4:	7a8000ef          	jal	ra,1c9c <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14f8:	00248513          	addi	a0,s1,2
        if (!*s)
    14fc:	00054783          	lbu	a5,0(a0)
    1500:	e8079ae3          	bnez	a5,1394 <printf+0x4a>
    }
    va_end(ap);
}
    1504:	70a6                	ld	ra,104(sp)
    1506:	7406                	ld	s0,96(sp)
    1508:	64e6                	ld	s1,88(sp)
    150a:	6946                	ld	s2,80(sp)
    150c:	69a6                	ld	s3,72(sp)
    150e:	6a06                	ld	s4,64(sp)
    1510:	7ae2                	ld	s5,56(sp)
    1512:	7b42                	ld	s6,48(sp)
    1514:	614d                	addi	sp,sp,176
    1516:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1518:	00064783          	lbu	a5,0(a2)
    151c:	84b2                	mv	s1,a2
    151e:	01278963          	beq	a5,s2,1530 <printf+0x1e6>
    1522:	b549                	j	13a4 <printf+0x5a>
    1524:	0024c783          	lbu	a5,2(s1)
    1528:	0605                	addi	a2,a2,1
    152a:	0489                	addi	s1,s1,2
    152c:	e7279ce3          	bne	a5,s2,13a4 <printf+0x5a>
    1530:	0014c783          	lbu	a5,1(s1)
    1534:	ff2788e3          	beq	a5,s2,1524 <printf+0x1da>
        l = z - a;
    1538:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    153c:	85aa                	mv	a1,a0
    153e:	8622                	mv	a2,s0
    1540:	4505                	li	a0,1
    1542:	75a000ef          	jal	ra,1c9c <write>
        if (l)
    1546:	e60408e3          	beqz	s0,13b6 <printf+0x6c>
    154a:	8526                	mv	a0,s1
    154c:	b581                	j	138c <printf+0x42>
        switch (s[1])
    154e:	07800713          	li	a4,120
    1552:	04e79963          	bne	a5,a4,15a4 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    1556:	6782                	ld	a5,0(sp)
    1558:	45c1                	li	a1,16
    155a:	4388                	lw	a0,0(a5)
    155c:	07a1                	addi	a5,a5,8
    155e:	e03e                	sd	a5,0(sp)
    1560:	b71ff0ef          	jal	ra,10d0 <printint.constprop.0>
        s += 2;
    1564:	00248513          	addi	a0,s1,2
    1568:	bf51                	j	14fc <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    156a:	6782                	ld	a5,0(sp)
    156c:	45a9                	li	a1,10
    156e:	4388                	lw	a0,0(a5)
    1570:	07a1                	addi	a5,a5,8
    1572:	e03e                	sd	a5,0(sp)
    1574:	b5dff0ef          	jal	ra,10d0 <printint.constprop.0>
        s += 2;
    1578:	00248513          	addi	a0,s1,2
    157c:	b741                	j	14fc <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    157e:	6782                	ld	a5,0(sp)
    1580:	6380                	ld	s0,0(a5)
    1582:	07a1                	addi	a5,a5,8
    1584:	e03e                	sd	a5,0(sp)
    1586:	c031                	beqz	s0,15ca <printf+0x280>
            l = strnlen(a, 200);
    1588:	0c800593          	li	a1,200
    158c:	8522                	mv	a0,s0
    158e:	40c000ef          	jal	ra,199a <strnlen>
    write(f, s, l);
    1592:	0005061b          	sext.w	a2,a0
    1596:	85a2                	mv	a1,s0
    1598:	4505                	li	a0,1
    159a:	702000ef          	jal	ra,1c9c <write>
        s += 2;
    159e:	00248513          	addi	a0,s1,2
    15a2:	bfa9                	j	14fc <printf+0x1b2>
    return write(stdout, &byte, 1);
    15a4:	4605                	li	a2,1
    15a6:	002c                	addi	a1,sp,8
    15a8:	4505                	li	a0,1
    char byte = c;
    15aa:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15ae:	6ee000ef          	jal	ra,1c9c <write>
    char byte = c;
    15b2:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15b6:	4605                	li	a2,1
    15b8:	002c                	addi	a1,sp,8
    15ba:	4505                	li	a0,1
    char byte = c;
    15bc:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15c0:	6dc000ef          	jal	ra,1c9c <write>
        s += 2;
    15c4:	00248513          	addi	a0,s1,2
    15c8:	bf15                	j	14fc <printf+0x1b2>
                a = "(null)";
    15ca:	845a                	mv	s0,s6
    15cc:	bf75                	j	1588 <printf+0x23e>

00000000000015ce <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15ce:	1141                	addi	sp,sp,-16
    15d0:	e406                	sd	ra,8(sp)
    puts(m);
    15d2:	d57ff0ef          	jal	ra,1328 <puts>
    exit(-100);
}
    15d6:	60a2                	ld	ra,8(sp)
    exit(-100);
    15d8:	f9c00513          	li	a0,-100
}
    15dc:	0141                	addi	sp,sp,16
    exit(-100);
    15de:	a739                	j	1cec <exit>

00000000000015e0 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15e0:	02000793          	li	a5,32
    15e4:	00f50663          	beq	a0,a5,15f0 <isspace+0x10>
    15e8:	355d                	addiw	a0,a0,-9
    15ea:	00553513          	sltiu	a0,a0,5
    15ee:	8082                	ret
    15f0:	4505                	li	a0,1
}
    15f2:	8082                	ret

00000000000015f4 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15f4:	fd05051b          	addiw	a0,a0,-48
}
    15f8:	00a53513          	sltiu	a0,a0,10
    15fc:	8082                	ret

00000000000015fe <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15fe:	02000613          	li	a2,32
    1602:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1604:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1608:	ff77869b          	addiw	a3,a5,-9
    160c:	04c78c63          	beq	a5,a2,1664 <atoi+0x66>
    1610:	0007871b          	sext.w	a4,a5
    1614:	04d5f863          	bgeu	a1,a3,1664 <atoi+0x66>
        s++;
    switch (*s)
    1618:	02b00693          	li	a3,43
    161c:	04d78963          	beq	a5,a3,166e <atoi+0x70>
    1620:	02d00693          	li	a3,45
    1624:	06d78263          	beq	a5,a3,1688 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1628:	fd07061b          	addiw	a2,a4,-48
    162c:	47a5                	li	a5,9
    162e:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1630:	4e01                	li	t3,0
    while (isdigit(*s))
    1632:	04c7e963          	bltu	a5,a2,1684 <atoi+0x86>
    int n = 0, neg = 0;
    1636:	4501                	li	a0,0
    while (isdigit(*s))
    1638:	4825                	li	a6,9
    163a:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    163e:	0025179b          	slliw	a5,a0,0x2
    1642:	9fa9                	addw	a5,a5,a0
    1644:	fd07031b          	addiw	t1,a4,-48
    1648:	0017989b          	slliw	a7,a5,0x1
    while (isdigit(*s))
    164c:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1650:	0685                	addi	a3,a3,1
    1652:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1656:	0006071b          	sext.w	a4,a2
    165a:	feb870e3          	bgeu	a6,a1,163a <atoi+0x3c>
    return neg ? n : -n;
    165e:	000e0563          	beqz	t3,1668 <atoi+0x6a>
}
    1662:	8082                	ret
        s++;
    1664:	0505                	addi	a0,a0,1
    1666:	bf79                	j	1604 <atoi+0x6>
    return neg ? n : -n;
    1668:	4113053b          	subw	a0,t1,a7
    166c:	8082                	ret
    while (isdigit(*s))
    166e:	00154703          	lbu	a4,1(a0)
    1672:	47a5                	li	a5,9
        s++;
    1674:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1678:	fd07061b          	addiw	a2,a4,-48
    int n = 0, neg = 0;
    167c:	4e01                	li	t3,0
    while (isdigit(*s))
    167e:	2701                	sext.w	a4,a4
    1680:	fac7fbe3          	bgeu	a5,a2,1636 <atoi+0x38>
    1684:	4501                	li	a0,0
}
    1686:	8082                	ret
    while (isdigit(*s))
    1688:	00154703          	lbu	a4,1(a0)
    168c:	47a5                	li	a5,9
        s++;
    168e:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1692:	fd07061b          	addiw	a2,a4,-48
    1696:	2701                	sext.w	a4,a4
    1698:	fec7e6e3          	bltu	a5,a2,1684 <atoi+0x86>
        neg = 1;
    169c:	4e05                	li	t3,1
    169e:	bf61                	j	1636 <atoi+0x38>

00000000000016a0 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16a0:	16060d63          	beqz	a2,181a <memset+0x17a>
    16a4:	40a007b3          	neg	a5,a0
    16a8:	8b9d                	andi	a5,a5,7
    16aa:	00778693          	addi	a3,a5,7
    16ae:	482d                	li	a6,11
    16b0:	0ff5f713          	zext.b	a4,a1
    16b4:	fff60593          	addi	a1,a2,-1
    16b8:	1706e263          	bltu	a3,a6,181c <memset+0x17c>
    16bc:	16d5ea63          	bltu	a1,a3,1830 <memset+0x190>
    16c0:	16078563          	beqz	a5,182a <memset+0x18a>
    16c4:	00e50023          	sb	a4,0(a0)
    16c8:	4685                	li	a3,1
    16ca:	00150593          	addi	a1,a0,1
    16ce:	14d78c63          	beq	a5,a3,1826 <memset+0x186>
    16d2:	00e500a3          	sb	a4,1(a0)
    16d6:	4689                	li	a3,2
    16d8:	00250593          	addi	a1,a0,2
    16dc:	14d78d63          	beq	a5,a3,1836 <memset+0x196>
    16e0:	00e50123          	sb	a4,2(a0)
    16e4:	468d                	li	a3,3
    16e6:	00350593          	addi	a1,a0,3
    16ea:	12d78b63          	beq	a5,a3,1820 <memset+0x180>
    16ee:	00e501a3          	sb	a4,3(a0)
    16f2:	4691                	li	a3,4
    16f4:	00450593          	addi	a1,a0,4
    16f8:	14d78163          	beq	a5,a3,183a <memset+0x19a>
    16fc:	00e50223          	sb	a4,4(a0)
    1700:	4695                	li	a3,5
    1702:	00550593          	addi	a1,a0,5
    1706:	12d78c63          	beq	a5,a3,183e <memset+0x19e>
    170a:	00e502a3          	sb	a4,5(a0)
    170e:	469d                	li	a3,7
    1710:	00650593          	addi	a1,a0,6
    1714:	12d79763          	bne	a5,a3,1842 <memset+0x1a2>
    1718:	00750593          	addi	a1,a0,7
    171c:	00e50323          	sb	a4,6(a0)
    1720:	481d                	li	a6,7
    1722:	00871693          	slli	a3,a4,0x8
    1726:	01071893          	slli	a7,a4,0x10
    172a:	8ed9                	or	a3,a3,a4
    172c:	01871313          	slli	t1,a4,0x18
    1730:	0116e6b3          	or	a3,a3,a7
    1734:	0066e6b3          	or	a3,a3,t1
    1738:	02071893          	slli	a7,a4,0x20
    173c:	02871e13          	slli	t3,a4,0x28
    1740:	0116e6b3          	or	a3,a3,a7
    1744:	40f60333          	sub	t1,a2,a5
    1748:	03071893          	slli	a7,a4,0x30
    174c:	01c6e6b3          	or	a3,a3,t3
    1750:	0116e6b3          	or	a3,a3,a7
    1754:	03871e13          	slli	t3,a4,0x38
    1758:	97aa                	add	a5,a5,a0
    175a:	ff837893          	andi	a7,t1,-8
    175e:	01c6e6b3          	or	a3,a3,t3
    1762:	98be                	add	a7,a7,a5
    1764:	e394                	sd	a3,0(a5)
    1766:	07a1                	addi	a5,a5,8
    1768:	ff179ee3          	bne	a5,a7,1764 <memset+0xc4>
    176c:	ff837893          	andi	a7,t1,-8
    1770:	011587b3          	add	a5,a1,a7
    1774:	010886bb          	addw	a3,a7,a6
    1778:	0b130663          	beq	t1,a7,1824 <memset+0x184>
    177c:	00e78023          	sb	a4,0(a5)
    1780:	0016859b          	addiw	a1,a3,1
    1784:	08c5fb63          	bgeu	a1,a2,181a <memset+0x17a>
    1788:	00e780a3          	sb	a4,1(a5)
    178c:	0026859b          	addiw	a1,a3,2
    1790:	08c5f563          	bgeu	a1,a2,181a <memset+0x17a>
    1794:	00e78123          	sb	a4,2(a5)
    1798:	0036859b          	addiw	a1,a3,3
    179c:	06c5ff63          	bgeu	a1,a2,181a <memset+0x17a>
    17a0:	00e781a3          	sb	a4,3(a5)
    17a4:	0046859b          	addiw	a1,a3,4
    17a8:	06c5f963          	bgeu	a1,a2,181a <memset+0x17a>
    17ac:	00e78223          	sb	a4,4(a5)
    17b0:	0056859b          	addiw	a1,a3,5
    17b4:	06c5f363          	bgeu	a1,a2,181a <memset+0x17a>
    17b8:	00e782a3          	sb	a4,5(a5)
    17bc:	0066859b          	addiw	a1,a3,6
    17c0:	04c5fd63          	bgeu	a1,a2,181a <memset+0x17a>
    17c4:	00e78323          	sb	a4,6(a5)
    17c8:	0076859b          	addiw	a1,a3,7
    17cc:	04c5f763          	bgeu	a1,a2,181a <memset+0x17a>
    17d0:	00e783a3          	sb	a4,7(a5)
    17d4:	0086859b          	addiw	a1,a3,8
    17d8:	04c5f163          	bgeu	a1,a2,181a <memset+0x17a>
    17dc:	00e78423          	sb	a4,8(a5)
    17e0:	0096859b          	addiw	a1,a3,9
    17e4:	02c5fb63          	bgeu	a1,a2,181a <memset+0x17a>
    17e8:	00e784a3          	sb	a4,9(a5)
    17ec:	00a6859b          	addiw	a1,a3,10
    17f0:	02c5f563          	bgeu	a1,a2,181a <memset+0x17a>
    17f4:	00e78523          	sb	a4,10(a5)
    17f8:	00b6859b          	addiw	a1,a3,11
    17fc:	00c5ff63          	bgeu	a1,a2,181a <memset+0x17a>
    1800:	00e785a3          	sb	a4,11(a5)
    1804:	00c6859b          	addiw	a1,a3,12
    1808:	00c5f963          	bgeu	a1,a2,181a <memset+0x17a>
    180c:	00e78623          	sb	a4,12(a5)
    1810:	26b5                	addiw	a3,a3,13
    1812:	00c6f463          	bgeu	a3,a2,181a <memset+0x17a>
    1816:	00e786a3          	sb	a4,13(a5)
        ;
    return dest;
}
    181a:	8082                	ret
    181c:	46ad                	li	a3,11
    181e:	bd79                	j	16bc <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1820:	480d                	li	a6,3
    1822:	b701                	j	1722 <memset+0x82>
    1824:	8082                	ret
    1826:	4805                	li	a6,1
    1828:	bded                	j	1722 <memset+0x82>
    182a:	85aa                	mv	a1,a0
    182c:	4801                	li	a6,0
    182e:	bdd5                	j	1722 <memset+0x82>
    1830:	87aa                	mv	a5,a0
    1832:	4681                	li	a3,0
    1834:	b7a1                	j	177c <memset+0xdc>
    1836:	4809                	li	a6,2
    1838:	b5ed                	j	1722 <memset+0x82>
    183a:	4811                	li	a6,4
    183c:	b5dd                	j	1722 <memset+0x82>
    183e:	4815                	li	a6,5
    1840:	b5cd                	j	1722 <memset+0x82>
    1842:	4819                	li	a6,6
    1844:	bdf9                	j	1722 <memset+0x82>

0000000000001846 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1846:	00054783          	lbu	a5,0(a0)
    184a:	0005c703          	lbu	a4,0(a1)
    184e:	00e79863          	bne	a5,a4,185e <strcmp+0x18>
    1852:	0505                	addi	a0,a0,1
    1854:	0585                	addi	a1,a1,1
    1856:	fbe5                	bnez	a5,1846 <strcmp>
    1858:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    185a:	9d19                	subw	a0,a0,a4
    185c:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    185e:	0007851b          	sext.w	a0,a5
    1862:	bfe5                	j	185a <strcmp+0x14>

0000000000001864 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1864:	ca15                	beqz	a2,1898 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1866:	00054783          	lbu	a5,0(a0)
    if (!n--)
    186a:	167d                	addi	a2,a2,-1
    186c:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1870:	eb99                	bnez	a5,1886 <strncmp+0x22>
    1872:	a815                	j	18a6 <strncmp+0x42>
    1874:	00a68e63          	beq	a3,a0,1890 <strncmp+0x2c>
    1878:	0505                	addi	a0,a0,1
    187a:	00f71b63          	bne	a4,a5,1890 <strncmp+0x2c>
    187e:	00054783          	lbu	a5,0(a0)
    1882:	cf89                	beqz	a5,189c <strncmp+0x38>
    1884:	85b2                	mv	a1,a2
    1886:	0005c703          	lbu	a4,0(a1)
    188a:	00158613          	addi	a2,a1,1
    188e:	f37d                	bnez	a4,1874 <strncmp+0x10>
        ;
    return *l - *r;
    1890:	0007851b          	sext.w	a0,a5
    1894:	9d19                	subw	a0,a0,a4
    1896:	8082                	ret
        return 0;
    1898:	4501                	li	a0,0
}
    189a:	8082                	ret
    return *l - *r;
    189c:	0015c703          	lbu	a4,1(a1)
    18a0:	4501                	li	a0,0
    18a2:	9d19                	subw	a0,a0,a4
    18a4:	8082                	ret
    18a6:	0005c703          	lbu	a4,0(a1)
    18aa:	4501                	li	a0,0
    18ac:	b7e5                	j	1894 <strncmp+0x30>

00000000000018ae <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18ae:	00757793          	andi	a5,a0,7
    18b2:	cf89                	beqz	a5,18cc <strlen+0x1e>
    18b4:	87aa                	mv	a5,a0
    18b6:	a029                	j	18c0 <strlen+0x12>
    18b8:	0785                	addi	a5,a5,1
    18ba:	0077f713          	andi	a4,a5,7
    18be:	cb01                	beqz	a4,18ce <strlen+0x20>
        if (!*s)
    18c0:	0007c703          	lbu	a4,0(a5)
    18c4:	fb75                	bnez	a4,18b8 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18c6:	40a78533          	sub	a0,a5,a0
}
    18ca:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18cc:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18ce:	6394                	ld	a3,0(a5)
    18d0:	00000597          	auipc	a1,0x0
    18d4:	6a05b583          	ld	a1,1696(a1) # 1f70 <__clone+0x9c>
    18d8:	00000617          	auipc	a2,0x0
    18dc:	6a063603          	ld	a2,1696(a2) # 1f78 <__clone+0xa4>
    18e0:	a019                	j	18e6 <strlen+0x38>
    18e2:	6794                	ld	a3,8(a5)
    18e4:	07a1                	addi	a5,a5,8
    18e6:	00b68733          	add	a4,a3,a1
    18ea:	fff6c693          	not	a3,a3
    18ee:	8f75                	and	a4,a4,a3
    18f0:	8f71                	and	a4,a4,a2
    18f2:	db65                	beqz	a4,18e2 <strlen+0x34>
    for (; *s; s++)
    18f4:	0007c703          	lbu	a4,0(a5)
    18f8:	d779                	beqz	a4,18c6 <strlen+0x18>
    18fa:	0017c703          	lbu	a4,1(a5)
    18fe:	0785                	addi	a5,a5,1
    1900:	d379                	beqz	a4,18c6 <strlen+0x18>
    1902:	0017c703          	lbu	a4,1(a5)
    1906:	0785                	addi	a5,a5,1
    1908:	fb6d                	bnez	a4,18fa <strlen+0x4c>
    190a:	bf75                	j	18c6 <strlen+0x18>

000000000000190c <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    190c:	00757713          	andi	a4,a0,7
{
    1910:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1912:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1916:	cb19                	beqz	a4,192c <memchr+0x20>
    1918:	ce25                	beqz	a2,1990 <memchr+0x84>
    191a:	0007c703          	lbu	a4,0(a5)
    191e:	04b70e63          	beq	a4,a1,197a <memchr+0x6e>
    1922:	0785                	addi	a5,a5,1
    1924:	0077f713          	andi	a4,a5,7
    1928:	167d                	addi	a2,a2,-1
    192a:	f77d                	bnez	a4,1918 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    192c:	4501                	li	a0,0
    if (n && *s != c)
    192e:	c235                	beqz	a2,1992 <memchr+0x86>
    1930:	0007c703          	lbu	a4,0(a5)
    1934:	04b70363          	beq	a4,a1,197a <memchr+0x6e>
        size_t k = ONES * c;
    1938:	00000517          	auipc	a0,0x0
    193c:	64853503          	ld	a0,1608(a0) # 1f80 <__clone+0xac>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1940:	471d                	li	a4,7
        size_t k = ONES * c;
    1942:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1946:	02c77a63          	bgeu	a4,a2,197a <memchr+0x6e>
    194a:	00000897          	auipc	a7,0x0
    194e:	6268b883          	ld	a7,1574(a7) # 1f70 <__clone+0x9c>
    1952:	00000817          	auipc	a6,0x0
    1956:	62683803          	ld	a6,1574(a6) # 1f78 <__clone+0xa4>
    195a:	431d                	li	t1,7
    195c:	a029                	j	1966 <memchr+0x5a>
    195e:	1661                	addi	a2,a2,-8
    1960:	07a1                	addi	a5,a5,8
    1962:	02c37963          	bgeu	t1,a2,1994 <memchr+0x88>
    1966:	6398                	ld	a4,0(a5)
    1968:	8f29                	xor	a4,a4,a0
    196a:	011706b3          	add	a3,a4,a7
    196e:	fff74713          	not	a4,a4
    1972:	8f75                	and	a4,a4,a3
    1974:	01077733          	and	a4,a4,a6
    1978:	d37d                	beqz	a4,195e <memchr+0x52>
{
    197a:	853e                	mv	a0,a5
    197c:	97b2                	add	a5,a5,a2
    197e:	a021                	j	1986 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1980:	0505                	addi	a0,a0,1
    1982:	00f50763          	beq	a0,a5,1990 <memchr+0x84>
    1986:	00054703          	lbu	a4,0(a0)
    198a:	feb71be3          	bne	a4,a1,1980 <memchr+0x74>
    198e:	8082                	ret
    return n ? (void *)s : 0;
    1990:	4501                	li	a0,0
}
    1992:	8082                	ret
    return n ? (void *)s : 0;
    1994:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1996:	f275                	bnez	a2,197a <memchr+0x6e>
}
    1998:	8082                	ret

000000000000199a <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    199a:	1101                	addi	sp,sp,-32
    199c:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    199e:	862e                	mv	a2,a1
{
    19a0:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19a2:	4581                	li	a1,0
{
    19a4:	e426                	sd	s1,8(sp)
    19a6:	ec06                	sd	ra,24(sp)
    19a8:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19aa:	f63ff0ef          	jal	ra,190c <memchr>
    return p ? p - s : n;
    19ae:	c519                	beqz	a0,19bc <strnlen+0x22>
}
    19b0:	60e2                	ld	ra,24(sp)
    19b2:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19b4:	8d05                	sub	a0,a0,s1
}
    19b6:	64a2                	ld	s1,8(sp)
    19b8:	6105                	addi	sp,sp,32
    19ba:	8082                	ret
    19bc:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19be:	8522                	mv	a0,s0
}
    19c0:	6442                	ld	s0,16(sp)
    19c2:	64a2                	ld	s1,8(sp)
    19c4:	6105                	addi	sp,sp,32
    19c6:	8082                	ret

00000000000019c8 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19c8:	00a5c7b3          	xor	a5,a1,a0
    19cc:	8b9d                	andi	a5,a5,7
    19ce:	eb95                	bnez	a5,1a02 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19d0:	0075f793          	andi	a5,a1,7
    19d4:	e7b1                	bnez	a5,1a20 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19d6:	6198                	ld	a4,0(a1)
    19d8:	00000617          	auipc	a2,0x0
    19dc:	59863603          	ld	a2,1432(a2) # 1f70 <__clone+0x9c>
    19e0:	00000817          	auipc	a6,0x0
    19e4:	59883803          	ld	a6,1432(a6) # 1f78 <__clone+0xa4>
    19e8:	a029                	j	19f2 <strcpy+0x2a>
    19ea:	05a1                	addi	a1,a1,8
    19ec:	e118                	sd	a4,0(a0)
    19ee:	6198                	ld	a4,0(a1)
    19f0:	0521                	addi	a0,a0,8
    19f2:	00c707b3          	add	a5,a4,a2
    19f6:	fff74693          	not	a3,a4
    19fa:	8ff5                	and	a5,a5,a3
    19fc:	0107f7b3          	and	a5,a5,a6
    1a00:	d7ed                	beqz	a5,19ea <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a02:	0005c783          	lbu	a5,0(a1)
    1a06:	00f50023          	sb	a5,0(a0)
    1a0a:	c785                	beqz	a5,1a32 <strcpy+0x6a>
    1a0c:	0015c783          	lbu	a5,1(a1)
    1a10:	0505                	addi	a0,a0,1
    1a12:	0585                	addi	a1,a1,1
    1a14:	00f50023          	sb	a5,0(a0)
    1a18:	fbf5                	bnez	a5,1a0c <strcpy+0x44>
        ;
    return d;
}
    1a1a:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a1c:	0505                	addi	a0,a0,1
    1a1e:	df45                	beqz	a4,19d6 <strcpy+0xe>
            if (!(*d = *s))
    1a20:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a24:	0585                	addi	a1,a1,1
    1a26:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1a2a:	00f50023          	sb	a5,0(a0)
    1a2e:	f7fd                	bnez	a5,1a1c <strcpy+0x54>
}
    1a30:	8082                	ret
    1a32:	8082                	ret

0000000000001a34 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a34:	00a5c7b3          	xor	a5,a1,a0
    1a38:	8b9d                	andi	a5,a5,7
    1a3a:	1a079863          	bnez	a5,1bea <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a3e:	0075f793          	andi	a5,a1,7
    1a42:	16078463          	beqz	a5,1baa <strncpy+0x176>
    1a46:	ea01                	bnez	a2,1a56 <strncpy+0x22>
    1a48:	a421                	j	1c50 <strncpy+0x21c>
    1a4a:	167d                	addi	a2,a2,-1
    1a4c:	0505                	addi	a0,a0,1
    1a4e:	14070e63          	beqz	a4,1baa <strncpy+0x176>
    1a52:	1a060863          	beqz	a2,1c02 <strncpy+0x1ce>
    1a56:	0005c783          	lbu	a5,0(a1)
    1a5a:	0585                	addi	a1,a1,1
    1a5c:	0075f713          	andi	a4,a1,7
    1a60:	00f50023          	sb	a5,0(a0)
    1a64:	f3fd                	bnez	a5,1a4a <strncpy+0x16>
    1a66:	4805                	li	a6,1
    1a68:	1a061863          	bnez	a2,1c18 <strncpy+0x1e4>
    1a6c:	40a007b3          	neg	a5,a0
    1a70:	8b9d                	andi	a5,a5,7
    1a72:	4681                	li	a3,0
    1a74:	18061a63          	bnez	a2,1c08 <strncpy+0x1d4>
    1a78:	00778713          	addi	a4,a5,7
    1a7c:	45ad                	li	a1,11
    1a7e:	18b76363          	bltu	a4,a1,1c04 <strncpy+0x1d0>
    1a82:	1ae6eb63          	bltu	a3,a4,1c38 <strncpy+0x204>
    1a86:	1a078363          	beqz	a5,1c2c <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a8a:	00050023          	sb	zero,0(a0)
    1a8e:	4685                	li	a3,1
    1a90:	00150713          	addi	a4,a0,1
    1a94:	18d78f63          	beq	a5,a3,1c32 <strncpy+0x1fe>
    1a98:	000500a3          	sb	zero,1(a0)
    1a9c:	4689                	li	a3,2
    1a9e:	00250713          	addi	a4,a0,2
    1aa2:	18d78e63          	beq	a5,a3,1c3e <strncpy+0x20a>
    1aa6:	00050123          	sb	zero,2(a0)
    1aaa:	468d                	li	a3,3
    1aac:	00350713          	addi	a4,a0,3
    1ab0:	16d78c63          	beq	a5,a3,1c28 <strncpy+0x1f4>
    1ab4:	000501a3          	sb	zero,3(a0)
    1ab8:	4691                	li	a3,4
    1aba:	00450713          	addi	a4,a0,4
    1abe:	18d78263          	beq	a5,a3,1c42 <strncpy+0x20e>
    1ac2:	00050223          	sb	zero,4(a0)
    1ac6:	4695                	li	a3,5
    1ac8:	00550713          	addi	a4,a0,5
    1acc:	16d78d63          	beq	a5,a3,1c46 <strncpy+0x212>
    1ad0:	000502a3          	sb	zero,5(a0)
    1ad4:	469d                	li	a3,7
    1ad6:	00650713          	addi	a4,a0,6
    1ada:	16d79863          	bne	a5,a3,1c4a <strncpy+0x216>
    1ade:	00750713          	addi	a4,a0,7
    1ae2:	00050323          	sb	zero,6(a0)
    1ae6:	40f80833          	sub	a6,a6,a5
    1aea:	ff887593          	andi	a1,a6,-8
    1aee:	97aa                	add	a5,a5,a0
    1af0:	95be                	add	a1,a1,a5
    1af2:	0007b023          	sd	zero,0(a5)
    1af6:	07a1                	addi	a5,a5,8
    1af8:	feb79de3          	bne	a5,a1,1af2 <strncpy+0xbe>
    1afc:	ff887593          	andi	a1,a6,-8
    1b00:	9ead                	addw	a3,a3,a1
    1b02:	00b707b3          	add	a5,a4,a1
    1b06:	12b80863          	beq	a6,a1,1c36 <strncpy+0x202>
    1b0a:	00078023          	sb	zero,0(a5)
    1b0e:	0016871b          	addiw	a4,a3,1
    1b12:	0ec77863          	bgeu	a4,a2,1c02 <strncpy+0x1ce>
    1b16:	000780a3          	sb	zero,1(a5)
    1b1a:	0026871b          	addiw	a4,a3,2
    1b1e:	0ec77263          	bgeu	a4,a2,1c02 <strncpy+0x1ce>
    1b22:	00078123          	sb	zero,2(a5)
    1b26:	0036871b          	addiw	a4,a3,3
    1b2a:	0cc77c63          	bgeu	a4,a2,1c02 <strncpy+0x1ce>
    1b2e:	000781a3          	sb	zero,3(a5)
    1b32:	0046871b          	addiw	a4,a3,4
    1b36:	0cc77663          	bgeu	a4,a2,1c02 <strncpy+0x1ce>
    1b3a:	00078223          	sb	zero,4(a5)
    1b3e:	0056871b          	addiw	a4,a3,5
    1b42:	0cc77063          	bgeu	a4,a2,1c02 <strncpy+0x1ce>
    1b46:	000782a3          	sb	zero,5(a5)
    1b4a:	0066871b          	addiw	a4,a3,6
    1b4e:	0ac77a63          	bgeu	a4,a2,1c02 <strncpy+0x1ce>
    1b52:	00078323          	sb	zero,6(a5)
    1b56:	0076871b          	addiw	a4,a3,7
    1b5a:	0ac77463          	bgeu	a4,a2,1c02 <strncpy+0x1ce>
    1b5e:	000783a3          	sb	zero,7(a5)
    1b62:	0086871b          	addiw	a4,a3,8
    1b66:	08c77e63          	bgeu	a4,a2,1c02 <strncpy+0x1ce>
    1b6a:	00078423          	sb	zero,8(a5)
    1b6e:	0096871b          	addiw	a4,a3,9
    1b72:	08c77863          	bgeu	a4,a2,1c02 <strncpy+0x1ce>
    1b76:	000784a3          	sb	zero,9(a5)
    1b7a:	00a6871b          	addiw	a4,a3,10
    1b7e:	08c77263          	bgeu	a4,a2,1c02 <strncpy+0x1ce>
    1b82:	00078523          	sb	zero,10(a5)
    1b86:	00b6871b          	addiw	a4,a3,11
    1b8a:	06c77c63          	bgeu	a4,a2,1c02 <strncpy+0x1ce>
    1b8e:	000785a3          	sb	zero,11(a5)
    1b92:	00c6871b          	addiw	a4,a3,12
    1b96:	06c77663          	bgeu	a4,a2,1c02 <strncpy+0x1ce>
    1b9a:	00078623          	sb	zero,12(a5)
    1b9e:	26b5                	addiw	a3,a3,13
    1ba0:	06c6f163          	bgeu	a3,a2,1c02 <strncpy+0x1ce>
    1ba4:	000786a3          	sb	zero,13(a5)
    1ba8:	8082                	ret
            ;
        if (!n || !*s)
    1baa:	c645                	beqz	a2,1c52 <strncpy+0x21e>
    1bac:	0005c783          	lbu	a5,0(a1)
    1bb0:	ea078be3          	beqz	a5,1a66 <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bb4:	479d                	li	a5,7
    1bb6:	02c7ff63          	bgeu	a5,a2,1bf4 <strncpy+0x1c0>
    1bba:	00000897          	auipc	a7,0x0
    1bbe:	3b68b883          	ld	a7,950(a7) # 1f70 <__clone+0x9c>
    1bc2:	00000817          	auipc	a6,0x0
    1bc6:	3b683803          	ld	a6,950(a6) # 1f78 <__clone+0xa4>
    1bca:	431d                	li	t1,7
    1bcc:	6198                	ld	a4,0(a1)
    1bce:	011707b3          	add	a5,a4,a7
    1bd2:	fff74693          	not	a3,a4
    1bd6:	8ff5                	and	a5,a5,a3
    1bd8:	0107f7b3          	and	a5,a5,a6
    1bdc:	ef81                	bnez	a5,1bf4 <strncpy+0x1c0>
            *wd = *ws;
    1bde:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1be0:	1661                	addi	a2,a2,-8
    1be2:	05a1                	addi	a1,a1,8
    1be4:	0521                	addi	a0,a0,8
    1be6:	fec363e3          	bltu	t1,a2,1bcc <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1bea:	e609                	bnez	a2,1bf4 <strncpy+0x1c0>
    1bec:	a08d                	j	1c4e <strncpy+0x21a>
    1bee:	167d                	addi	a2,a2,-1
    1bf0:	0505                	addi	a0,a0,1
    1bf2:	ca01                	beqz	a2,1c02 <strncpy+0x1ce>
    1bf4:	0005c783          	lbu	a5,0(a1)
    1bf8:	0585                	addi	a1,a1,1
    1bfa:	00f50023          	sb	a5,0(a0)
    1bfe:	fbe5                	bnez	a5,1bee <strncpy+0x1ba>
        ;
tail:
    1c00:	b59d                	j	1a66 <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1c02:	8082                	ret
    1c04:	472d                	li	a4,11
    1c06:	bdb5                	j	1a82 <strncpy+0x4e>
    1c08:	00778713          	addi	a4,a5,7
    1c0c:	45ad                	li	a1,11
    1c0e:	fff60693          	addi	a3,a2,-1
    1c12:	e6b778e3          	bgeu	a4,a1,1a82 <strncpy+0x4e>
    1c16:	b7fd                	j	1c04 <strncpy+0x1d0>
    1c18:	40a007b3          	neg	a5,a0
    1c1c:	8832                	mv	a6,a2
    1c1e:	8b9d                	andi	a5,a5,7
    1c20:	4681                	li	a3,0
    1c22:	e4060be3          	beqz	a2,1a78 <strncpy+0x44>
    1c26:	b7cd                	j	1c08 <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c28:	468d                	li	a3,3
    1c2a:	bd75                	j	1ae6 <strncpy+0xb2>
    1c2c:	872a                	mv	a4,a0
    1c2e:	4681                	li	a3,0
    1c30:	bd5d                	j	1ae6 <strncpy+0xb2>
    1c32:	4685                	li	a3,1
    1c34:	bd4d                	j	1ae6 <strncpy+0xb2>
    1c36:	8082                	ret
    1c38:	87aa                	mv	a5,a0
    1c3a:	4681                	li	a3,0
    1c3c:	b5f9                	j	1b0a <strncpy+0xd6>
    1c3e:	4689                	li	a3,2
    1c40:	b55d                	j	1ae6 <strncpy+0xb2>
    1c42:	4691                	li	a3,4
    1c44:	b54d                	j	1ae6 <strncpy+0xb2>
    1c46:	4695                	li	a3,5
    1c48:	bd79                	j	1ae6 <strncpy+0xb2>
    1c4a:	4699                	li	a3,6
    1c4c:	bd69                	j	1ae6 <strncpy+0xb2>
    1c4e:	8082                	ret
    1c50:	8082                	ret
    1c52:	8082                	ret

0000000000001c54 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c54:	87aa                	mv	a5,a0
    1c56:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c58:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c5c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c60:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c62:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c64:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c68:	2501                	sext.w	a0,a0
    1c6a:	8082                	ret

0000000000001c6c <openat>:
    register long a7 __asm__("a7") = n;
    1c6c:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c70:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c74:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c78:	2501                	sext.w	a0,a0
    1c7a:	8082                	ret

0000000000001c7c <fcntl>:
    register long a7 __asm__("a7") = n;
    1c7c:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c7e:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1c82:	2501                	sext.w	a0,a0
    1c84:	8082                	ret

0000000000001c86 <close>:
    register long a7 __asm__("a7") = n;
    1c86:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c8a:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c8e:	2501                	sext.w	a0,a0
    1c90:	8082                	ret

0000000000001c92 <read>:
    register long a7 __asm__("a7") = n;
    1c92:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c96:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c9a:	8082                	ret

0000000000001c9c <write>:
    register long a7 __asm__("a7") = n;
    1c9c:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ca0:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1ca4:	8082                	ret

0000000000001ca6 <getpid>:
    register long a7 __asm__("a7") = n;
    1ca6:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1caa:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1cae:	2501                	sext.w	a0,a0
    1cb0:	8082                	ret

0000000000001cb2 <getppid>:
    register long a7 __asm__("a7") = n;
    1cb2:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1cb6:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cba:	2501                	sext.w	a0,a0
    1cbc:	8082                	ret

0000000000001cbe <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cbe:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cc2:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cc6:	2501                	sext.w	a0,a0
    1cc8:	8082                	ret

0000000000001cca <fork>:
    register long a7 __asm__("a7") = n;
    1cca:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cce:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cd0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cd2:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cd6:	2501                	sext.w	a0,a0
    1cd8:	8082                	ret

0000000000001cda <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cda:	85b2                	mv	a1,a2
    1cdc:	863a                	mv	a2,a4
    if (stack)
    1cde:	c191                	beqz	a1,1ce2 <clone+0x8>
	stack += stack_size;
    1ce0:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1ce2:	4781                	li	a5,0
    1ce4:	4701                	li	a4,0
    1ce6:	4681                	li	a3,0
    1ce8:	2601                	sext.w	a2,a2
    1cea:	a2ed                	j	1ed4 <__clone>

0000000000001cec <exit>:
    register long a7 __asm__("a7") = n;
    1cec:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cf0:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cf4:	8082                	ret

0000000000001cf6 <waitpid>:
    register long a7 __asm__("a7") = n;
    1cf6:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cfa:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cfc:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d00:	2501                	sext.w	a0,a0
    1d02:	8082                	ret

0000000000001d04 <exec>:
    register long a7 __asm__("a7") = n;
    1d04:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d08:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d0c:	2501                	sext.w	a0,a0
    1d0e:	8082                	ret

0000000000001d10 <execve>:
    register long a7 __asm__("a7") = n;
    1d10:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d14:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d18:	2501                	sext.w	a0,a0
    1d1a:	8082                	ret

0000000000001d1c <times>:
    register long a7 __asm__("a7") = n;
    1d1c:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d20:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d24:	2501                	sext.w	a0,a0
    1d26:	8082                	ret

0000000000001d28 <get_time>:

int64 get_time()
{
    1d28:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d2a:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d2e:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d30:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d32:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d36:	2501                	sext.w	a0,a0
    1d38:	ed09                	bnez	a0,1d52 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d3a:	67a2                	ld	a5,8(sp)
    1d3c:	3e800713          	li	a4,1000
    1d40:	00015503          	lhu	a0,0(sp)
    1d44:	02e7d7b3          	divu	a5,a5,a4
    1d48:	02e50533          	mul	a0,a0,a4
    1d4c:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d4e:	0141                	addi	sp,sp,16
    1d50:	8082                	ret
        return -1;
    1d52:	557d                	li	a0,-1
    1d54:	bfed                	j	1d4e <get_time+0x26>

0000000000001d56 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d56:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d5a:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d5e:	2501                	sext.w	a0,a0
    1d60:	8082                	ret

0000000000001d62 <time>:
    register long a7 __asm__("a7") = n;
    1d62:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d66:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d6a:	2501                	sext.w	a0,a0
    1d6c:	8082                	ret

0000000000001d6e <sleep>:

int sleep(unsigned long long time)
{
    1d6e:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d70:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d72:	850a                	mv	a0,sp
    1d74:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d76:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d7a:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d7c:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d80:	e501                	bnez	a0,1d88 <sleep+0x1a>
    return 0;
    1d82:	4501                	li	a0,0
}
    1d84:	0141                	addi	sp,sp,16
    1d86:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d88:	4502                	lw	a0,0(sp)
}
    1d8a:	0141                	addi	sp,sp,16
    1d8c:	8082                	ret

0000000000001d8e <set_priority>:
    register long a7 __asm__("a7") = n;
    1d8e:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d92:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d96:	2501                	sext.w	a0,a0
    1d98:	8082                	ret

0000000000001d9a <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d9a:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d9e:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1da2:	8082                	ret

0000000000001da4 <munmap>:
    register long a7 __asm__("a7") = n;
    1da4:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1da8:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1dac:	2501                	sext.w	a0,a0
    1dae:	8082                	ret

0000000000001db0 <wait>:

int wait(int *code)
{
    1db0:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1db2:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1db6:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1db8:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1dba:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dbc:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1dc0:	2501                	sext.w	a0,a0
    1dc2:	8082                	ret

0000000000001dc4 <spawn>:
    register long a7 __asm__("a7") = n;
    1dc4:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1dc8:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dcc:	2501                	sext.w	a0,a0
    1dce:	8082                	ret

0000000000001dd0 <mailread>:
    register long a7 __asm__("a7") = n;
    1dd0:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dd4:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dd8:	2501                	sext.w	a0,a0
    1dda:	8082                	ret

0000000000001ddc <mailwrite>:
    register long a7 __asm__("a7") = n;
    1ddc:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de0:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1de4:	2501                	sext.w	a0,a0
    1de6:	8082                	ret

0000000000001de8 <fstat>:
    register long a7 __asm__("a7") = n;
    1de8:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dec:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1df0:	2501                	sext.w	a0,a0
    1df2:	8082                	ret

0000000000001df4 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1df4:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1df6:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dfa:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dfc:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e00:	2501                	sext.w	a0,a0
    1e02:	8082                	ret

0000000000001e04 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e04:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e06:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e0a:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e0c:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e10:	2501                	sext.w	a0,a0
    1e12:	8082                	ret

0000000000001e14 <link>:

int link(char *old_path, char *new_path)
{
    1e14:	87aa                	mv	a5,a0
    1e16:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e18:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e1c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e20:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e22:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e26:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e28:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e2c:	2501                	sext.w	a0,a0
    1e2e:	8082                	ret

0000000000001e30 <unlink>:

int unlink(char *path)
{
    1e30:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e32:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e36:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e3a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e3c:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e40:	2501                	sext.w	a0,a0
    1e42:	8082                	ret

0000000000001e44 <uname>:
    register long a7 __asm__("a7") = n;
    1e44:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e48:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e4c:	2501                	sext.w	a0,a0
    1e4e:	8082                	ret

0000000000001e50 <brk>:
    register long a7 __asm__("a7") = n;
    1e50:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e54:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e58:	2501                	sext.w	a0,a0
    1e5a:	8082                	ret

0000000000001e5c <getcwd>:
    register long a7 __asm__("a7") = n;
    1e5c:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5e:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e62:	8082                	ret

0000000000001e64 <chdir>:
    register long a7 __asm__("a7") = n;
    1e64:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e68:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e6c:	2501                	sext.w	a0,a0
    1e6e:	8082                	ret

0000000000001e70 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e70:	862e                	mv	a2,a1
    1e72:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e74:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e76:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e7a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e7e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e80:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e82:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e86:	2501                	sext.w	a0,a0
    1e88:	8082                	ret

0000000000001e8a <getdents>:
    register long a7 __asm__("a7") = n;
    1e8a:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e8e:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e92:	2501                	sext.w	a0,a0
    1e94:	8082                	ret

0000000000001e96 <pipe>:
    register long a7 __asm__("a7") = n;
    1e96:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e9a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e9c:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1ea0:	2501                	sext.w	a0,a0
    1ea2:	8082                	ret

0000000000001ea4 <dup>:
    register long a7 __asm__("a7") = n;
    1ea4:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1ea6:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1eaa:	2501                	sext.w	a0,a0
    1eac:	8082                	ret

0000000000001eae <dup2>:
    register long a7 __asm__("a7") = n;
    1eae:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1eb0:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eb2:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1eb6:	2501                	sext.w	a0,a0
    1eb8:	8082                	ret

0000000000001eba <mount>:
    register long a7 __asm__("a7") = n;
    1eba:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ebe:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ec2:	2501                	sext.w	a0,a0
    1ec4:	8082                	ret

0000000000001ec6 <umount>:
    register long a7 __asm__("a7") = n;
    1ec6:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1eca:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ecc:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ed0:	2501                	sext.w	a0,a0
    1ed2:	8082                	ret

0000000000001ed4 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ed4:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1ed6:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ed8:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1eda:	8532                	mv	a0,a2
	mv a2, a4
    1edc:	863a                	mv	a2,a4
	mv a3, a5
    1ede:	86be                	mv	a3,a5
	mv a4, a6
    1ee0:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ee2:	0dc00893          	li	a7,220
	ecall
    1ee6:	00000073          	ecall

	beqz a0, 1f
    1eea:	c111                	beqz	a0,1eee <__clone+0x1a>
	# Parent
	ret
    1eec:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1eee:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ef0:	6522                	ld	a0,8(sp)
	jalr a1
    1ef2:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ef4:	05d00893          	li	a7,93
	ecall
    1ef8:	00000073          	ecall
