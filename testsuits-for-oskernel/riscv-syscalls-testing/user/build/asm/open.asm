
/home/windflower/Desktop/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/open:     file format elf64-littleriscv


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
    1004:	716d                	add	sp,sp,-272
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	ef250513          	add	a0,a0,-270 # 1ef8 <__clone+0x2a>
void test_open() {
    100e:	e606                	sd	ra,264(sp)
    1010:	e222                	sd	s0,256(sp)
	TEST_START(__func__);
    1012:	2dc000ef          	jal	12ee <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	f5250513          	add	a0,a0,-174 # 1f68 <__func__.0>
    101e:	2d0000ef          	jal	12ee <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	eee50513          	add	a0,a0,-274 # 1f10 <__clone+0x42>
    102a:	2c4000ef          	jal	12ee <puts>
	// O_RDONLY = 0, O_WRONLY = 1
	int fd = open("./text.txt", 0);
    102e:	4581                	li	a1,0
    1030:	00001517          	auipc	a0,0x1
    1034:	ef050513          	add	a0,a0,-272 # 1f20 <__clone+0x52>
    1038:	421000ef          	jal	1c58 <open>
    103c:	842a                	mv	s0,a0
	assert(fd >= 0);
    103e:	04054d63          	bltz	a0,1098 <test_open+0x94>
	char buf[256];
	int size = read(fd, buf, 256);
    1042:	858a                	mv	a1,sp
    1044:	10000613          	li	a2,256
    1048:	8522                	mv	a0,s0
    104a:	443000ef          	jal	1c8c <read>
	if (size < 0) {
    104e:	0005079b          	sext.w	a5,a0
    1052:	fff7c793          	not	a5,a5
    1056:	97fd                	sra	a5,a5,0x3f
    1058:	00f57633          	and	a2,a0,a5
		size = 0;
	}
	write(STDOUT, buf, size);
    105c:	858a                	mv	a1,sp
    105e:	2601                	sext.w	a2,a2
    1060:	4505                	li	a0,1
    1062:	435000ef          	jal	1c96 <write>
	close(fd);
    1066:	8522                	mv	a0,s0
    1068:	419000ef          	jal	1c80 <close>
	TEST_END(__func__);
    106c:	00001517          	auipc	a0,0x1
    1070:	ee450513          	add	a0,a0,-284 # 1f50 <__clone+0x82>
    1074:	27a000ef          	jal	12ee <puts>
    1078:	00001517          	auipc	a0,0x1
    107c:	ef050513          	add	a0,a0,-272 # 1f68 <__func__.0>
    1080:	26e000ef          	jal	12ee <puts>
    1084:	00001517          	auipc	a0,0x1
    1088:	e8c50513          	add	a0,a0,-372 # 1f10 <__clone+0x42>
    108c:	262000ef          	jal	12ee <puts>
}
    1090:	60b2                	ld	ra,264(sp)
    1092:	6412                	ld	s0,256(sp)
    1094:	6151                	add	sp,sp,272
    1096:	8082                	ret
	assert(fd >= 0);
    1098:	00001517          	auipc	a0,0x1
    109c:	e9850513          	add	a0,a0,-360 # 1f30 <__clone+0x62>
    10a0:	4ee000ef          	jal	158e <panic>
    10a4:	bf79                	j	1042 <test_open+0x3e>

00000000000010a6 <main>:

int main(void) {
    10a6:	1141                	add	sp,sp,-16
    10a8:	e406                	sd	ra,8(sp)
	test_open();
    10aa:	f5bff0ef          	jal	1004 <test_open>
	return 0;
}
    10ae:	60a2                	ld	ra,8(sp)
    10b0:	4501                	li	a0,0
    10b2:	0141                	add	sp,sp,16
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
    10ba:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10bc:	05a1                	add	a1,a1,8
{
    10be:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10c0:	fe7ff0ef          	jal	10a6 <main>
    10c4:	423000ef          	jal	1ce6 <exit>
	return 0;
}
    10c8:	60a2                	ld	ra,8(sp)
    10ca:	4501                	li	a0,0
    10cc:	0141                	add	sp,sp,16
    10ce:	8082                	ret

00000000000010d0 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10d0:	7179                	add	sp,sp,-48
    10d2:	f406                	sd	ra,40(sp)
    10d4:	0005081b          	sext.w	a6,a0
    10d8:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10da:	00055563          	bgez	a0,10e4 <printint.constprop.0+0x14>
        x = -xx;
    10de:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    10e2:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10e4:	02b8763b          	remuw	a2,a6,a1
    10e8:	00001697          	auipc	a3,0x1
    10ec:	e9068693          	add	a3,a3,-368 # 1f78 <digits>
    buf[16] = 0;
    10f0:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10f4:	0005871b          	sext.w	a4,a1
    10f8:	1602                	sll	a2,a2,0x20
    10fa:	9201                	srl	a2,a2,0x20
    10fc:	9636                	add	a2,a2,a3
    10fe:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1102:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    1106:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    110a:	10b86c63          	bltu	a6,a1,1222 <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    110e:	02e5763b          	remuw	a2,a0,a4
    1112:	1602                	sll	a2,a2,0x20
    1114:	9201                	srl	a2,a2,0x20
    1116:	9636                	add	a2,a2,a3
    1118:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    111c:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1120:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1124:	10e56863          	bltu	a0,a4,1234 <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    1128:	02e5f63b          	remuw	a2,a1,a4
    112c:	1602                	sll	a2,a2,0x20
    112e:	9201                	srl	a2,a2,0x20
    1130:	9636                	add	a2,a2,a3
    1132:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1136:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    113a:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    113e:	10e5e463          	bltu	a1,a4,1246 <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    1142:	02e5763b          	remuw	a2,a0,a4
    1146:	1602                	sll	a2,a2,0x20
    1148:	9201                	srl	a2,a2,0x20
    114a:	9636                	add	a2,a2,a3
    114c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1150:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1154:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1158:	10e56063          	bltu	a0,a4,1258 <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    115c:	02e5f63b          	remuw	a2,a1,a4
    1160:	1602                	sll	a2,a2,0x20
    1162:	9201                	srl	a2,a2,0x20
    1164:	9636                	add	a2,a2,a3
    1166:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    116a:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    116e:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1172:	0ee5ec63          	bltu	a1,a4,126a <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    1176:	02e5763b          	remuw	a2,a0,a4
    117a:	1602                	sll	a2,a2,0x20
    117c:	9201                	srl	a2,a2,0x20
    117e:	9636                	add	a2,a2,a3
    1180:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1184:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1188:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    118c:	08e56263          	bltu	a0,a4,1210 <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    1190:	02e5f63b          	remuw	a2,a1,a4
    1194:	1602                	sll	a2,a2,0x20
    1196:	9201                	srl	a2,a2,0x20
    1198:	9636                	add	a2,a2,a3
    119a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    119e:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11a2:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11a6:	0ce5eb63          	bltu	a1,a4,127c <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    11aa:	02e5763b          	remuw	a2,a0,a4
    11ae:	1602                	sll	a2,a2,0x20
    11b0:	9201                	srl	a2,a2,0x20
    11b2:	9636                	add	a2,a2,a3
    11b4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b8:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11bc:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11c0:	0ce56763          	bltu	a0,a4,128e <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    11c4:	02e5f63b          	remuw	a2,a1,a4
    11c8:	1602                	sll	a2,a2,0x20
    11ca:	9201                	srl	a2,a2,0x20
    11cc:	9636                	add	a2,a2,a3
    11ce:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11d2:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11d6:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11da:	0ce5e363          	bltu	a1,a4,12a0 <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    11de:	1782                	sll	a5,a5,0x20
    11e0:	9381                	srl	a5,a5,0x20
    11e2:	96be                	add	a3,a3,a5
    11e4:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    11e8:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    11ea:	00f10723          	sb	a5,14(sp)
    if (sign)
    11ee:	00088763          	beqz	a7,11fc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11f2:	02d00793          	li	a5,45
    11f6:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11fa:	4595                	li	a1,5
    write(f, s, l);
    11fc:	003c                	add	a5,sp,8
    11fe:	4641                	li	a2,16
    1200:	9e0d                	subw	a2,a2,a1
    1202:	4505                	li	a0,1
    1204:	95be                	add	a1,a1,a5
    1206:	291000ef          	jal	1c96 <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    120a:	70a2                	ld	ra,40(sp)
    120c:	6145                	add	sp,sp,48
    120e:	8082                	ret
    i++;
    1210:	45a9                	li	a1,10
    if (sign)
    1212:	fe0885e3          	beqz	a7,11fc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1216:	02d00793          	li	a5,45
    121a:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    121e:	45a5                	li	a1,9
    1220:	bff1                	j	11fc <printint.constprop.0+0x12c>
    i++;
    1222:	45bd                	li	a1,15
    if (sign)
    1224:	fc088ce3          	beqz	a7,11fc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1228:	02d00793          	li	a5,45
    122c:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1230:	45b9                	li	a1,14
    1232:	b7e9                	j	11fc <printint.constprop.0+0x12c>
    i++;
    1234:	45b9                	li	a1,14
    if (sign)
    1236:	fc0883e3          	beqz	a7,11fc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    123a:	02d00793          	li	a5,45
    123e:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1242:	45b5                	li	a1,13
    1244:	bf65                	j	11fc <printint.constprop.0+0x12c>
    i++;
    1246:	45b5                	li	a1,13
    if (sign)
    1248:	fa088ae3          	beqz	a7,11fc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    124c:	02d00793          	li	a5,45
    1250:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1254:	45b1                	li	a1,12
    1256:	b75d                	j	11fc <printint.constprop.0+0x12c>
    i++;
    1258:	45b1                	li	a1,12
    if (sign)
    125a:	fa0881e3          	beqz	a7,11fc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    125e:	02d00793          	li	a5,45
    1262:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1266:	45ad                	li	a1,11
    1268:	bf51                	j	11fc <printint.constprop.0+0x12c>
    i++;
    126a:	45ad                	li	a1,11
    if (sign)
    126c:	f80888e3          	beqz	a7,11fc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1270:	02d00793          	li	a5,45
    1274:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1278:	45a9                	li	a1,10
    127a:	b749                	j	11fc <printint.constprop.0+0x12c>
    i++;
    127c:	45a5                	li	a1,9
    if (sign)
    127e:	f6088fe3          	beqz	a7,11fc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1282:	02d00793          	li	a5,45
    1286:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    128a:	45a1                	li	a1,8
    128c:	bf85                	j	11fc <printint.constprop.0+0x12c>
    i++;
    128e:	45a1                	li	a1,8
    if (sign)
    1290:	f60886e3          	beqz	a7,11fc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1294:	02d00793          	li	a5,45
    1298:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    129c:	459d                	li	a1,7
    129e:	bfb9                	j	11fc <printint.constprop.0+0x12c>
    i++;
    12a0:	459d                	li	a1,7
    if (sign)
    12a2:	f4088de3          	beqz	a7,11fc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12a6:	02d00793          	li	a5,45
    12aa:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12ae:	4599                	li	a1,6
    12b0:	b7b1                	j	11fc <printint.constprop.0+0x12c>

00000000000012b2 <getchar>:
{
    12b2:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12b4:	00f10593          	add	a1,sp,15
    12b8:	4605                	li	a2,1
    12ba:	4501                	li	a0,0
{
    12bc:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12be:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12c2:	1cb000ef          	jal	1c8c <read>
}
    12c6:	60e2                	ld	ra,24(sp)
    12c8:	00f14503          	lbu	a0,15(sp)
    12cc:	6105                	add	sp,sp,32
    12ce:	8082                	ret

00000000000012d0 <putchar>:
{
    12d0:	1101                	add	sp,sp,-32
    12d2:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12d4:	00f10593          	add	a1,sp,15
    12d8:	4605                	li	a2,1
    12da:	4505                	li	a0,1
{
    12dc:	ec06                	sd	ra,24(sp)
    char byte = c;
    12de:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12e2:	1b5000ef          	jal	1c96 <write>
}
    12e6:	60e2                	ld	ra,24(sp)
    12e8:	2501                	sext.w	a0,a0
    12ea:	6105                	add	sp,sp,32
    12ec:	8082                	ret

00000000000012ee <puts>:
{
    12ee:	1141                	add	sp,sp,-16
    12f0:	e406                	sd	ra,8(sp)
    12f2:	e022                	sd	s0,0(sp)
    12f4:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12f6:	56c000ef          	jal	1862 <strlen>
    12fa:	862a                	mv	a2,a0
    12fc:	85a2                	mv	a1,s0
    12fe:	4505                	li	a0,1
    1300:	197000ef          	jal	1c96 <write>
}
    1304:	60a2                	ld	ra,8(sp)
    1306:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1308:	957d                	sra	a0,a0,0x3f
    return r;
    130a:	2501                	sext.w	a0,a0
}
    130c:	0141                	add	sp,sp,16
    130e:	8082                	ret

0000000000001310 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1310:	7131                	add	sp,sp,-192
    1312:	e4d6                	sd	s5,72(sp)
    1314:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    1316:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1318:	013c                	add	a5,sp,136
{
    131a:	f0ca                	sd	s2,96(sp)
    131c:	ecce                	sd	s3,88(sp)
    131e:	e8d2                	sd	s4,80(sp)
    1320:	e0da                	sd	s6,64(sp)
    1322:	fc5e                	sd	s7,56(sp)
    1324:	fc86                	sd	ra,120(sp)
    1326:	f8a2                	sd	s0,112(sp)
    1328:	f4a6                	sd	s1,104(sp)
    132a:	e52e                	sd	a1,136(sp)
    132c:	e932                	sd	a2,144(sp)
    132e:	ed36                	sd	a3,152(sp)
    1330:	f13a                	sd	a4,160(sp)
    1332:	f942                	sd	a6,176(sp)
    1334:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1336:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1338:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    133c:	07300a13          	li	s4,115
    1340:	07800b93          	li	s7,120
    1344:	06400b13          	li	s6,100
    buf[i++] = '0';
    1348:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x58b8>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    134c:	00001997          	auipc	s3,0x1
    1350:	c2c98993          	add	s3,s3,-980 # 1f78 <digits>
        if (!*s)
    1354:	00054783          	lbu	a5,0(a0)
    1358:	16078863          	beqz	a5,14c8 <printf+0x1b8>
    135c:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    135e:	19278063          	beq	a5,s2,14de <printf+0x1ce>
    1362:	00164783          	lbu	a5,1(a2)
    1366:	0605                	add	a2,a2,1
    1368:	fbfd                	bnez	a5,135e <printf+0x4e>
    136a:	84b2                	mv	s1,a2
        l = z - a;
    136c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1370:	85aa                	mv	a1,a0
    1372:	8622                	mv	a2,s0
    1374:	4505                	li	a0,1
    1376:	121000ef          	jal	1c96 <write>
        if (l)
    137a:	18041763          	bnez	s0,1508 <printf+0x1f8>
        if (s[1] == 0)
    137e:	0014c783          	lbu	a5,1(s1)
    1382:	14078363          	beqz	a5,14c8 <printf+0x1b8>
        switch (s[1])
    1386:	19478f63          	beq	a5,s4,1524 <printf+0x214>
    138a:	18fa6163          	bltu	s4,a5,150c <printf+0x1fc>
    138e:	1b678e63          	beq	a5,s6,154a <printf+0x23a>
    1392:	07000713          	li	a4,112
    1396:	1ce79463          	bne	a5,a4,155e <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    139a:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    139c:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13a0:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13a2:	631c                	ld	a5,0(a4)
    13a4:	0721                	add	a4,a4,8
    13a6:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13a8:	00479293          	sll	t0,a5,0x4
    13ac:	00879f93          	sll	t6,a5,0x8
    13b0:	00c79f13          	sll	t5,a5,0xc
    13b4:	01079e93          	sll	t4,a5,0x10
    13b8:	01479e13          	sll	t3,a5,0x14
    13bc:	01879313          	sll	t1,a5,0x18
    13c0:	01c79893          	sll	a7,a5,0x1c
    13c4:	02479813          	sll	a6,a5,0x24
    13c8:	02879513          	sll	a0,a5,0x28
    13cc:	02c79593          	sll	a1,a5,0x2c
    13d0:	03079693          	sll	a3,a5,0x30
    13d4:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13d8:	03c7d413          	srl	s0,a5,0x3c
    13dc:	01c7d39b          	srlw	t2,a5,0x1c
    13e0:	03c2d293          	srl	t0,t0,0x3c
    13e4:	03cfdf93          	srl	t6,t6,0x3c
    13e8:	03cf5f13          	srl	t5,t5,0x3c
    13ec:	03cede93          	srl	t4,t4,0x3c
    13f0:	03ce5e13          	srl	t3,t3,0x3c
    13f4:	03c35313          	srl	t1,t1,0x3c
    13f8:	03c8d893          	srl	a7,a7,0x3c
    13fc:	03c85813          	srl	a6,a6,0x3c
    1400:	9171                	srl	a0,a0,0x3c
    1402:	91f1                	srl	a1,a1,0x3c
    1404:	92f1                	srl	a3,a3,0x3c
    1406:	9371                	srl	a4,a4,0x3c
    1408:	974e                	add	a4,a4,s3
    140a:	944e                	add	s0,s0,s3
    140c:	92ce                	add	t0,t0,s3
    140e:	9fce                	add	t6,t6,s3
    1410:	9f4e                	add	t5,t5,s3
    1412:	9ece                	add	t4,t4,s3
    1414:	9e4e                	add	t3,t3,s3
    1416:	934e                	add	t1,t1,s3
    1418:	98ce                	add	a7,a7,s3
    141a:	93ce                	add	t2,t2,s3
    141c:	984e                	add	a6,a6,s3
    141e:	954e                	add	a0,a0,s3
    1420:	95ce                	add	a1,a1,s3
    1422:	96ce                	add	a3,a3,s3
    1424:	00074083          	lbu	ra,0(a4)
    1428:	0002c283          	lbu	t0,0(t0)
    142c:	000fcf83          	lbu	t6,0(t6)
    1430:	000f4f03          	lbu	t5,0(t5)
    1434:	000ece83          	lbu	t4,0(t4)
    1438:	000e4e03          	lbu	t3,0(t3)
    143c:	00034303          	lbu	t1,0(t1)
    1440:	0008c883          	lbu	a7,0(a7)
    1444:	0003c383          	lbu	t2,0(t2)
    1448:	00084803          	lbu	a6,0(a6)
    144c:	00054503          	lbu	a0,0(a0)
    1450:	0005c583          	lbu	a1,0(a1)
    1454:	0006c683          	lbu	a3,0(a3)
    1458:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    145c:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1460:	9371                	srl	a4,a4,0x3c
    1462:	8bbd                	and	a5,a5,15
    1464:	974e                	add	a4,a4,s3
    1466:	97ce                	add	a5,a5,s3
    1468:	005105a3          	sb	t0,11(sp)
    146c:	01f10623          	sb	t6,12(sp)
    1470:	01e106a3          	sb	t5,13(sp)
    1474:	01d10723          	sb	t4,14(sp)
    1478:	01c107a3          	sb	t3,15(sp)
    147c:	00610823          	sb	t1,16(sp)
    1480:	011108a3          	sb	a7,17(sp)
    1484:	00710923          	sb	t2,18(sp)
    1488:	010109a3          	sb	a6,19(sp)
    148c:	00a10a23          	sb	a0,20(sp)
    1490:	00b10aa3          	sb	a1,21(sp)
    1494:	00d10b23          	sb	a3,22(sp)
    1498:	00110ba3          	sb	ra,23(sp)
    149c:	00810523          	sb	s0,10(sp)
    14a0:	00074703          	lbu	a4,0(a4)
    14a4:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14a8:	002c                	add	a1,sp,8
    14aa:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14ac:	00e10c23          	sb	a4,24(sp)
    14b0:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14b4:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14b8:	7de000ef          	jal	1c96 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14bc:	00248513          	add	a0,s1,2
        if (!*s)
    14c0:	00054783          	lbu	a5,0(a0)
    14c4:	e8079ce3          	bnez	a5,135c <printf+0x4c>
    }
    va_end(ap);
}
    14c8:	70e6                	ld	ra,120(sp)
    14ca:	7446                	ld	s0,112(sp)
    14cc:	74a6                	ld	s1,104(sp)
    14ce:	7906                	ld	s2,96(sp)
    14d0:	69e6                	ld	s3,88(sp)
    14d2:	6a46                	ld	s4,80(sp)
    14d4:	6aa6                	ld	s5,72(sp)
    14d6:	6b06                	ld	s6,64(sp)
    14d8:	7be2                	ld	s7,56(sp)
    14da:	6129                	add	sp,sp,192
    14dc:	8082                	ret
    14de:	84b2                	mv	s1,a2
    14e0:	a039                	j	14ee <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14e2:	0024c783          	lbu	a5,2(s1)
    14e6:	0605                	add	a2,a2,1
    14e8:	0489                	add	s1,s1,2
    14ea:	e92791e3          	bne	a5,s2,136c <printf+0x5c>
    14ee:	0014c783          	lbu	a5,1(s1)
    14f2:	ff2788e3          	beq	a5,s2,14e2 <printf+0x1d2>
        l = z - a;
    14f6:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14fa:	85aa                	mv	a1,a0
    14fc:	8622                	mv	a2,s0
    14fe:	4505                	li	a0,1
    1500:	796000ef          	jal	1c96 <write>
        if (l)
    1504:	e6040de3          	beqz	s0,137e <printf+0x6e>
    1508:	8526                	mv	a0,s1
    150a:	b5a9                	j	1354 <printf+0x44>
        switch (s[1])
    150c:	05779963          	bne	a5,s7,155e <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    1510:	6782                	ld	a5,0(sp)
    1512:	45c1                	li	a1,16
    1514:	4388                	lw	a0,0(a5)
    1516:	07a1                	add	a5,a5,8
    1518:	e03e                	sd	a5,0(sp)
    151a:	bb7ff0ef          	jal	10d0 <printint.constprop.0>
        s += 2;
    151e:	00248513          	add	a0,s1,2
    1522:	bf79                	j	14c0 <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    1524:	6782                	ld	a5,0(sp)
    1526:	6380                	ld	s0,0(a5)
    1528:	07a1                	add	a5,a5,8
    152a:	e03e                	sd	a5,0(sp)
    152c:	cc21                	beqz	s0,1584 <printf+0x274>
            l = strnlen(a, 200);
    152e:	0c800593          	li	a1,200
    1532:	8522                	mv	a0,s0
    1534:	460000ef          	jal	1994 <strnlen>
    write(f, s, l);
    1538:	0005061b          	sext.w	a2,a0
    153c:	85a2                	mv	a1,s0
    153e:	4505                	li	a0,1
    1540:	756000ef          	jal	1c96 <write>
        s += 2;
    1544:	00248513          	add	a0,s1,2
    1548:	bfa5                	j	14c0 <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    154a:	6782                	ld	a5,0(sp)
    154c:	45a9                	li	a1,10
    154e:	4388                	lw	a0,0(a5)
    1550:	07a1                	add	a5,a5,8
    1552:	e03e                	sd	a5,0(sp)
    1554:	b7dff0ef          	jal	10d0 <printint.constprop.0>
        s += 2;
    1558:	00248513          	add	a0,s1,2
    155c:	b795                	j	14c0 <printf+0x1b0>
    return write(stdout, &byte, 1);
    155e:	4605                	li	a2,1
    1560:	002c                	add	a1,sp,8
    1562:	4505                	li	a0,1
    char byte = c;
    1564:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1568:	72e000ef          	jal	1c96 <write>
    char byte = c;
    156c:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1570:	4605                	li	a2,1
    1572:	002c                	add	a1,sp,8
    1574:	4505                	li	a0,1
    char byte = c;
    1576:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    157a:	71c000ef          	jal	1c96 <write>
        s += 2;
    157e:	00248513          	add	a0,s1,2
    1582:	bf3d                	j	14c0 <printf+0x1b0>
                a = "(null)";
    1584:	00001417          	auipc	s0,0x1
    1588:	9dc40413          	add	s0,s0,-1572 # 1f60 <__clone+0x92>
    158c:	b74d                	j	152e <printf+0x21e>

000000000000158e <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    158e:	1141                	add	sp,sp,-16
    1590:	e406                	sd	ra,8(sp)
    puts(m);
    1592:	d5dff0ef          	jal	12ee <puts>
    exit(-100);
}
    1596:	60a2                	ld	ra,8(sp)
    exit(-100);
    1598:	f9c00513          	li	a0,-100
}
    159c:	0141                	add	sp,sp,16
    exit(-100);
    159e:	a7a1                	j	1ce6 <exit>

00000000000015a0 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a0:	02000793          	li	a5,32
    15a4:	00f50663          	beq	a0,a5,15b0 <isspace+0x10>
    15a8:	355d                	addw	a0,a0,-9
    15aa:	00553513          	sltiu	a0,a0,5
    15ae:	8082                	ret
    15b0:	4505                	li	a0,1
}
    15b2:	8082                	ret

00000000000015b4 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15b4:	fd05051b          	addw	a0,a0,-48
}
    15b8:	00a53513          	sltiu	a0,a0,10
    15bc:	8082                	ret

00000000000015be <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15be:	02000713          	li	a4,32
    15c2:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15c4:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15c8:	ff76879b          	addw	a5,a3,-9
    15cc:	06e68063          	beq	a3,a4,162c <atoi+0x6e>
    15d0:	0006859b          	sext.w	a1,a3
    15d4:	04f67c63          	bgeu	a2,a5,162c <atoi+0x6e>
        s++;
    switch (*s)
    15d8:	02b00793          	li	a5,43
    15dc:	06f68563          	beq	a3,a5,1646 <atoi+0x88>
    15e0:	02d00793          	li	a5,45
    15e4:	04f69663          	bne	a3,a5,1630 <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15e8:	00154683          	lbu	a3,1(a0)
    15ec:	47a5                	li	a5,9
        s++;
    15ee:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    15f2:	fd06869b          	addw	a3,a3,-48
    15f6:	8636                	mv	a2,a3
    while (isdigit(*s))
    15f8:	04d7e563          	bltu	a5,a3,1642 <atoi+0x84>
        neg = 1;
    15fc:	4885                	li	a7,1
    int n = 0, neg = 0;
    15fe:	4501                	li	a0,0
    while (isdigit(*s))
    1600:	4825                	li	a6,9
    1602:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1606:	0025179b          	sllw	a5,a0,0x2
    160a:	9fa9                	addw	a5,a5,a0
    160c:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    1610:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    1614:	85b2                	mv	a1,a2
    1616:	40c7853b          	subw	a0,a5,a2
    161a:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    161c:	8636                	mv	a2,a3
    while (isdigit(*s))
    161e:	fed872e3          	bgeu	a6,a3,1602 <atoi+0x44>
    return neg ? n : -n;
    1622:	02089163          	bnez	a7,1644 <atoi+0x86>
    1626:	40f5853b          	subw	a0,a1,a5
    162a:	8082                	ret
        s++;
    162c:	0505                	add	a0,a0,1
    162e:	bf59                	j	15c4 <atoi+0x6>
    while (isdigit(*s))
    1630:	fd05859b          	addw	a1,a1,-48
    1634:	47a5                	li	a5,9
    1636:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1638:	4881                	li	a7,0
    163a:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    163e:	fcb7f0e3          	bgeu	a5,a1,15fe <atoi+0x40>
    return neg ? n : -n;
    1642:	4501                	li	a0,0
}
    1644:	8082                	ret
    while (isdigit(*s))
    1646:	00154683          	lbu	a3,1(a0)
    164a:	47a5                	li	a5,9
        s++;
    164c:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1650:	fd06869b          	addw	a3,a3,-48
    1654:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    1656:	4881                	li	a7,0
    while (isdigit(*s))
    1658:	fad7f3e3          	bgeu	a5,a3,15fe <atoi+0x40>
    return neg ? n : -n;
    165c:	4501                	li	a0,0
    165e:	8082                	ret

0000000000001660 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1660:	16060f63          	beqz	a2,17de <memset+0x17e>
    1664:	40a006b3          	neg	a3,a0
    1668:	0076f793          	and	a5,a3,7
    166c:	00778813          	add	a6,a5,7
    1670:	48ad                	li	a7,11
    1672:	0ff5f713          	zext.b	a4,a1
    1676:	fff60593          	add	a1,a2,-1
    167a:	17186363          	bltu	a6,a7,17e0 <memset+0x180>
    167e:	1705eb63          	bltu	a1,a6,17f4 <memset+0x194>
    1682:	16078163          	beqz	a5,17e4 <memset+0x184>
    1686:	00e50023          	sb	a4,0(a0)
    168a:	0066f593          	and	a1,a3,6
    168e:	14058e63          	beqz	a1,17ea <memset+0x18a>
    1692:	00e500a3          	sb	a4,1(a0)
    1696:	4589                	li	a1,2
    1698:	00250813          	add	a6,a0,2
    169c:	04f5f663          	bgeu	a1,a5,16e8 <memset+0x88>
    16a0:	00e50123          	sb	a4,2(a0)
    16a4:	8a91                	and	a3,a3,4
    16a6:	00350813          	add	a6,a0,3
    16aa:	458d                	li	a1,3
    16ac:	ce95                	beqz	a3,16e8 <memset+0x88>
    16ae:	00e501a3          	sb	a4,3(a0)
    16b2:	4691                	li	a3,4
    16b4:	00450813          	add	a6,a0,4
    16b8:	4591                	li	a1,4
    16ba:	02f6f763          	bgeu	a3,a5,16e8 <memset+0x88>
    16be:	00e50223          	sb	a4,4(a0)
    16c2:	4695                	li	a3,5
    16c4:	00550813          	add	a6,a0,5
    16c8:	4595                	li	a1,5
    16ca:	00d78f63          	beq	a5,a3,16e8 <memset+0x88>
    16ce:	00e502a3          	sb	a4,5(a0)
    16d2:	469d                	li	a3,7
    16d4:	00650813          	add	a6,a0,6
    16d8:	4599                	li	a1,6
    16da:	00d79763          	bne	a5,a3,16e8 <memset+0x88>
    16de:	00750813          	add	a6,a0,7
    16e2:	00e50323          	sb	a4,6(a0)
    16e6:	459d                	li	a1,7
    16e8:	00871693          	sll	a3,a4,0x8
    16ec:	01071313          	sll	t1,a4,0x10
    16f0:	8ed9                	or	a3,a3,a4
    16f2:	01871893          	sll	a7,a4,0x18
    16f6:	0066e6b3          	or	a3,a3,t1
    16fa:	0116e6b3          	or	a3,a3,a7
    16fe:	02071313          	sll	t1,a4,0x20
    1702:	02871893          	sll	a7,a4,0x28
    1706:	0066e6b3          	or	a3,a3,t1
    170a:	40f60e33          	sub	t3,a2,a5
    170e:	03071313          	sll	t1,a4,0x30
    1712:	0116e6b3          	or	a3,a3,a7
    1716:	0066e6b3          	or	a3,a3,t1
    171a:	03871893          	sll	a7,a4,0x38
    171e:	97aa                	add	a5,a5,a0
    1720:	ff8e7313          	and	t1,t3,-8
    1724:	0116e6b3          	or	a3,a3,a7
    1728:	00f308b3          	add	a7,t1,a5
    172c:	e394                	sd	a3,0(a5)
    172e:	07a1                	add	a5,a5,8
    1730:	ff179ee3          	bne	a5,a7,172c <memset+0xcc>
    1734:	006806b3          	add	a3,a6,t1
    1738:	00b307bb          	addw	a5,t1,a1
    173c:	0bc30b63          	beq	t1,t3,17f2 <memset+0x192>
    1740:	00e68023          	sb	a4,0(a3)
    1744:	0017859b          	addw	a1,a5,1
    1748:	08c5fb63          	bgeu	a1,a2,17de <memset+0x17e>
    174c:	00e680a3          	sb	a4,1(a3)
    1750:	0027859b          	addw	a1,a5,2
    1754:	08c5f563          	bgeu	a1,a2,17de <memset+0x17e>
    1758:	00e68123          	sb	a4,2(a3)
    175c:	0037859b          	addw	a1,a5,3
    1760:	06c5ff63          	bgeu	a1,a2,17de <memset+0x17e>
    1764:	00e681a3          	sb	a4,3(a3)
    1768:	0047859b          	addw	a1,a5,4
    176c:	06c5f963          	bgeu	a1,a2,17de <memset+0x17e>
    1770:	00e68223          	sb	a4,4(a3)
    1774:	0057859b          	addw	a1,a5,5
    1778:	06c5f363          	bgeu	a1,a2,17de <memset+0x17e>
    177c:	00e682a3          	sb	a4,5(a3)
    1780:	0067859b          	addw	a1,a5,6
    1784:	04c5fd63          	bgeu	a1,a2,17de <memset+0x17e>
    1788:	00e68323          	sb	a4,6(a3)
    178c:	0077859b          	addw	a1,a5,7
    1790:	04c5f763          	bgeu	a1,a2,17de <memset+0x17e>
    1794:	00e683a3          	sb	a4,7(a3)
    1798:	0087859b          	addw	a1,a5,8
    179c:	04c5f163          	bgeu	a1,a2,17de <memset+0x17e>
    17a0:	00e68423          	sb	a4,8(a3)
    17a4:	0097859b          	addw	a1,a5,9
    17a8:	02c5fb63          	bgeu	a1,a2,17de <memset+0x17e>
    17ac:	00e684a3          	sb	a4,9(a3)
    17b0:	00a7859b          	addw	a1,a5,10
    17b4:	02c5f563          	bgeu	a1,a2,17de <memset+0x17e>
    17b8:	00e68523          	sb	a4,10(a3)
    17bc:	00b7859b          	addw	a1,a5,11
    17c0:	00c5ff63          	bgeu	a1,a2,17de <memset+0x17e>
    17c4:	00e685a3          	sb	a4,11(a3)
    17c8:	00c7859b          	addw	a1,a5,12
    17cc:	00c5f963          	bgeu	a1,a2,17de <memset+0x17e>
    17d0:	00e68623          	sb	a4,12(a3)
    17d4:	27b5                	addw	a5,a5,13
    17d6:	00c7f463          	bgeu	a5,a2,17de <memset+0x17e>
    17da:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17de:	8082                	ret
    17e0:	482d                	li	a6,11
    17e2:	bd71                	j	167e <memset+0x1e>
    char *p = dest;
    17e4:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17e6:	4581                	li	a1,0
    17e8:	b701                	j	16e8 <memset+0x88>
    17ea:	00150813          	add	a6,a0,1
    17ee:	4585                	li	a1,1
    17f0:	bde5                	j	16e8 <memset+0x88>
    17f2:	8082                	ret
    char *p = dest;
    17f4:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17f6:	4781                	li	a5,0
    17f8:	b7a1                	j	1740 <memset+0xe0>

00000000000017fa <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17fa:	00054783          	lbu	a5,0(a0)
    17fe:	0005c703          	lbu	a4,0(a1)
    1802:	00e79863          	bne	a5,a4,1812 <strcmp+0x18>
    1806:	0505                	add	a0,a0,1
    1808:	0585                	add	a1,a1,1
    180a:	fbe5                	bnez	a5,17fa <strcmp>
    180c:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    180e:	9d19                	subw	a0,a0,a4
    1810:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1812:	0007851b          	sext.w	a0,a5
    1816:	bfe5                	j	180e <strcmp+0x14>

0000000000001818 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1818:	ca15                	beqz	a2,184c <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    181a:	00054783          	lbu	a5,0(a0)
    if (!n--)
    181e:	167d                	add	a2,a2,-1
    1820:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1824:	eb99                	bnez	a5,183a <strncmp+0x22>
    1826:	a815                	j	185a <strncmp+0x42>
    1828:	00a68e63          	beq	a3,a0,1844 <strncmp+0x2c>
    182c:	0505                	add	a0,a0,1
    182e:	00f71b63          	bne	a4,a5,1844 <strncmp+0x2c>
    1832:	00054783          	lbu	a5,0(a0)
    1836:	cf89                	beqz	a5,1850 <strncmp+0x38>
    1838:	85b2                	mv	a1,a2
    183a:	0005c703          	lbu	a4,0(a1)
    183e:	00158613          	add	a2,a1,1
    1842:	f37d                	bnez	a4,1828 <strncmp+0x10>
        ;
    return *l - *r;
    1844:	0007851b          	sext.w	a0,a5
    1848:	9d19                	subw	a0,a0,a4
    184a:	8082                	ret
        return 0;
    184c:	4501                	li	a0,0
}
    184e:	8082                	ret
    return *l - *r;
    1850:	0015c703          	lbu	a4,1(a1)
    1854:	4501                	li	a0,0
    1856:	9d19                	subw	a0,a0,a4
    1858:	8082                	ret
    185a:	0005c703          	lbu	a4,0(a1)
    185e:	4501                	li	a0,0
    1860:	b7e5                	j	1848 <strncmp+0x30>

0000000000001862 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1862:	00757793          	and	a5,a0,7
    1866:	cf89                	beqz	a5,1880 <strlen+0x1e>
    1868:	87aa                	mv	a5,a0
    186a:	a029                	j	1874 <strlen+0x12>
    186c:	0785                	add	a5,a5,1
    186e:	0077f713          	and	a4,a5,7
    1872:	cb01                	beqz	a4,1882 <strlen+0x20>
        if (!*s)
    1874:	0007c703          	lbu	a4,0(a5)
    1878:	fb75                	bnez	a4,186c <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    187a:	40a78533          	sub	a0,a5,a0
}
    187e:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1880:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1882:	feff05b7          	lui	a1,0xfeff0
    1886:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedf87>
    188a:	f0101637          	lui	a2,0xf0101
    188e:	05c2                	sll	a1,a1,0x10
    1890:	0612                	sll	a2,a2,0x4
    1892:	6394                	ld	a3,0(a5)
    1894:	eff58593          	add	a1,a1,-257
    1898:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff189>
    189c:	05c2                	sll	a1,a1,0x10
    189e:	0642                	sll	a2,a2,0x10
    18a0:	eff58593          	add	a1,a1,-257
    18a4:	10160613          	add	a2,a2,257
    18a8:	00b68733          	add	a4,a3,a1
    18ac:	063e                	sll	a2,a2,0xf
    18ae:	fff6c693          	not	a3,a3
    18b2:	8f75                	and	a4,a4,a3
    18b4:	08060613          	add	a2,a2,128
    18b8:	8f71                	and	a4,a4,a2
    18ba:	eb11                	bnez	a4,18ce <strlen+0x6c>
    18bc:	6794                	ld	a3,8(a5)
    18be:	07a1                	add	a5,a5,8
    18c0:	00b68733          	add	a4,a3,a1
    18c4:	fff6c693          	not	a3,a3
    18c8:	8f75                	and	a4,a4,a3
    18ca:	8f71                	and	a4,a4,a2
    18cc:	db65                	beqz	a4,18bc <strlen+0x5a>
    for (; *s; s++)
    18ce:	0007c703          	lbu	a4,0(a5)
    18d2:	d745                	beqz	a4,187a <strlen+0x18>
    18d4:	0017c703          	lbu	a4,1(a5)
    18d8:	0785                	add	a5,a5,1
    18da:	d345                	beqz	a4,187a <strlen+0x18>
    18dc:	0017c703          	lbu	a4,1(a5)
    18e0:	0785                	add	a5,a5,1
    18e2:	fb6d                	bnez	a4,18d4 <strlen+0x72>
    18e4:	bf59                	j	187a <strlen+0x18>

00000000000018e6 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18e6:	00757713          	and	a4,a0,7
{
    18ea:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18ec:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18f0:	cb19                	beqz	a4,1906 <memchr+0x20>
    18f2:	ce59                	beqz	a2,1990 <memchr+0xaa>
    18f4:	0007c703          	lbu	a4,0(a5)
    18f8:	00b70963          	beq	a4,a1,190a <memchr+0x24>
    18fc:	0785                	add	a5,a5,1
    18fe:	0077f713          	and	a4,a5,7
    1902:	167d                	add	a2,a2,-1
    1904:	f77d                	bnez	a4,18f2 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1906:	4501                	li	a0,0
    if (n && *s != c)
    1908:	c649                	beqz	a2,1992 <memchr+0xac>
    190a:	0007c703          	lbu	a4,0(a5)
    190e:	06b70663          	beq	a4,a1,197a <memchr+0x94>
        size_t k = ONES * c;
    1912:	01010737          	lui	a4,0x1010
    1916:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e189>
    191a:	0742                	sll	a4,a4,0x10
    191c:	10170713          	add	a4,a4,257
    1920:	0742                	sll	a4,a4,0x10
    1922:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1926:	469d                	li	a3,7
        size_t k = ONES * c;
    1928:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    192c:	04c6f763          	bgeu	a3,a2,197a <memchr+0x94>
    1930:	f0101837          	lui	a6,0xf0101
    1934:	feff08b7          	lui	a7,0xfeff0
    1938:	0812                	sll	a6,a6,0x4
    193a:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedf87>
    193e:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff189>
    1942:	08c2                	sll	a7,a7,0x10
    1944:	0842                	sll	a6,a6,0x10
    1946:	eff88893          	add	a7,a7,-257
    194a:	10180813          	add	a6,a6,257
    194e:	08c2                	sll	a7,a7,0x10
    1950:	083e                	sll	a6,a6,0xf
    1952:	eff88893          	add	a7,a7,-257
    1956:	08080813          	add	a6,a6,128
    195a:	431d                	li	t1,7
    195c:	a029                	j	1966 <memchr+0x80>
    195e:	1661                	add	a2,a2,-8
    1960:	07a1                	add	a5,a5,8
    1962:	02c37663          	bgeu	t1,a2,198e <memchr+0xa8>
    1966:	6398                	ld	a4,0(a5)
    1968:	8f29                	xor	a4,a4,a0
    196a:	011706b3          	add	a3,a4,a7
    196e:	fff74713          	not	a4,a4
    1972:	8f75                	and	a4,a4,a3
    1974:	01077733          	and	a4,a4,a6
    1978:	d37d                	beqz	a4,195e <memchr+0x78>
        s = (const void *)w;
    197a:	853e                	mv	a0,a5
    197c:	a019                	j	1982 <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    197e:	0505                	add	a0,a0,1
    1980:	ca01                	beqz	a2,1990 <memchr+0xaa>
    1982:	00054783          	lbu	a5,0(a0)
    1986:	167d                	add	a2,a2,-1
    1988:	feb79be3          	bne	a5,a1,197e <memchr+0x98>
    198c:	8082                	ret
    198e:	f675                	bnez	a2,197a <memchr+0x94>
    return n ? (void *)s : 0;
    1990:	4501                	li	a0,0
}
    1992:	8082                	ret

0000000000001994 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1994:	1101                	add	sp,sp,-32
    1996:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1998:	862e                	mv	a2,a1
{
    199a:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    199c:	4581                	li	a1,0
{
    199e:	e426                	sd	s1,8(sp)
    19a0:	ec06                	sd	ra,24(sp)
    19a2:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19a4:	f43ff0ef          	jal	18e6 <memchr>
    return p ? p - s : n;
    19a8:	c519                	beqz	a0,19b6 <strnlen+0x22>
}
    19aa:	60e2                	ld	ra,24(sp)
    19ac:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19ae:	8d05                	sub	a0,a0,s1
}
    19b0:	64a2                	ld	s1,8(sp)
    19b2:	6105                	add	sp,sp,32
    19b4:	8082                	ret
    19b6:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19b8:	8522                	mv	a0,s0
}
    19ba:	6442                	ld	s0,16(sp)
    19bc:	64a2                	ld	s1,8(sp)
    19be:	6105                	add	sp,sp,32
    19c0:	8082                	ret

00000000000019c2 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19c2:	00b547b3          	xor	a5,a0,a1
    19c6:	8b9d                	and	a5,a5,7
    19c8:	efb1                	bnez	a5,1a24 <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19ca:	0075f793          	and	a5,a1,7
    19ce:	ebb5                	bnez	a5,1a42 <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19d0:	feff0637          	lui	a2,0xfeff0
    19d4:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedf87>
    19d8:	f01016b7          	lui	a3,0xf0101
    19dc:	0642                	sll	a2,a2,0x10
    19de:	0692                	sll	a3,a3,0x4
    19e0:	6198                	ld	a4,0(a1)
    19e2:	eff60613          	add	a2,a2,-257
    19e6:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff189>
    19ea:	0642                	sll	a2,a2,0x10
    19ec:	06c2                	sll	a3,a3,0x10
    19ee:	eff60613          	add	a2,a2,-257
    19f2:	10168693          	add	a3,a3,257
    19f6:	00c707b3          	add	a5,a4,a2
    19fa:	fff74813          	not	a6,a4
    19fe:	06be                	sll	a3,a3,0xf
    1a00:	0107f7b3          	and	a5,a5,a6
    1a04:	08068693          	add	a3,a3,128
    1a08:	8ff5                	and	a5,a5,a3
    1a0a:	ef89                	bnez	a5,1a24 <strcpy+0x62>
    1a0c:	05a1                	add	a1,a1,8
    1a0e:	e118                	sd	a4,0(a0)
    1a10:	6198                	ld	a4,0(a1)
    1a12:	0521                	add	a0,a0,8
    1a14:	00c707b3          	add	a5,a4,a2
    1a18:	fff74813          	not	a6,a4
    1a1c:	0107f7b3          	and	a5,a5,a6
    1a20:	8ff5                	and	a5,a5,a3
    1a22:	d7ed                	beqz	a5,1a0c <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a24:	0005c783          	lbu	a5,0(a1)
    1a28:	00f50023          	sb	a5,0(a0)
    1a2c:	c785                	beqz	a5,1a54 <strcpy+0x92>
    1a2e:	0015c783          	lbu	a5,1(a1)
    1a32:	0505                	add	a0,a0,1
    1a34:	0585                	add	a1,a1,1
    1a36:	00f50023          	sb	a5,0(a0)
    1a3a:	fbf5                	bnez	a5,1a2e <strcpy+0x6c>
        ;
    return d;
}
    1a3c:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a3e:	0505                	add	a0,a0,1
    1a40:	db41                	beqz	a4,19d0 <strcpy+0xe>
            if (!(*d = *s))
    1a42:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a46:	0585                	add	a1,a1,1
    1a48:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a4c:	00f50023          	sb	a5,0(a0)
    1a50:	f7fd                	bnez	a5,1a3e <strcpy+0x7c>
}
    1a52:	8082                	ret
    1a54:	8082                	ret

0000000000001a56 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a56:	00b547b3          	xor	a5,a0,a1
    1a5a:	8b9d                	and	a5,a5,7
    1a5c:	efbd                	bnez	a5,1ada <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a5e:	0075f793          	and	a5,a1,7
    1a62:	1c078563          	beqz	a5,1c2c <strncpy+0x1d6>
    1a66:	ea11                	bnez	a2,1a7a <strncpy+0x24>
    1a68:	8082                	ret
    1a6a:	0585                	add	a1,a1,1
    1a6c:	0075f793          	and	a5,a1,7
    1a70:	167d                	add	a2,a2,-1
    1a72:	0505                	add	a0,a0,1
    1a74:	1a078c63          	beqz	a5,1c2c <strncpy+0x1d6>
    1a78:	ca3d                	beqz	a2,1aee <strncpy+0x98>
    1a7a:	0005c783          	lbu	a5,0(a1)
    1a7e:	00f50023          	sb	a5,0(a0)
    1a82:	f7e5                	bnez	a5,1a6a <strncpy+0x14>
            ;
        if (!n || !*s)
    1a84:	0005c783          	lbu	a5,0(a1)
    1a88:	c7a5                	beqz	a5,1af0 <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a8a:	479d                	li	a5,7
    1a8c:	04c7f863          	bgeu	a5,a2,1adc <strncpy+0x86>
    1a90:	f01016b7          	lui	a3,0xf0101
    1a94:	feff0837          	lui	a6,0xfeff0
    1a98:	0692                	sll	a3,a3,0x4
    1a9a:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedf87>
    1a9e:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff189>
    1aa2:	0842                	sll	a6,a6,0x10
    1aa4:	06c2                	sll	a3,a3,0x10
    1aa6:	eff80813          	add	a6,a6,-257
    1aaa:	10168693          	add	a3,a3,257
    1aae:	0842                	sll	a6,a6,0x10
    1ab0:	06be                	sll	a3,a3,0xf
    1ab2:	eff80813          	add	a6,a6,-257
    1ab6:	08068693          	add	a3,a3,128
    1aba:	431d                	li	t1,7
    1abc:	6198                	ld	a4,0(a1)
    1abe:	010707b3          	add	a5,a4,a6
    1ac2:	fff74893          	not	a7,a4
    1ac6:	0117f7b3          	and	a5,a5,a7
    1aca:	8ff5                	and	a5,a5,a3
    1acc:	eb81                	bnez	a5,1adc <strncpy+0x86>
            *wd = *ws;
    1ace:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ad0:	1661                	add	a2,a2,-8
    1ad2:	05a1                	add	a1,a1,8
    1ad4:	0521                	add	a0,a0,8
    1ad6:	fec363e3          	bltu	t1,a2,1abc <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1ada:	ca11                	beqz	a2,1aee <strncpy+0x98>
    1adc:	0005c783          	lbu	a5,0(a1)
    1ae0:	0585                	add	a1,a1,1
    1ae2:	00f50023          	sb	a5,0(a0)
    1ae6:	c789                	beqz	a5,1af0 <strncpy+0x9a>
    1ae8:	167d                	add	a2,a2,-1
    1aea:	0505                	add	a0,a0,1
    1aec:	fa65                	bnez	a2,1adc <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1aee:	8082                	ret
    1af0:	40a00733          	neg	a4,a0
    1af4:	00777793          	and	a5,a4,7
    1af8:	00778693          	add	a3,a5,7
    1afc:	482d                	li	a6,11
    1afe:	fff60593          	add	a1,a2,-1
    1b02:	1106ef63          	bltu	a3,a6,1c20 <strncpy+0x1ca>
    1b06:	12d5ee63          	bltu	a1,a3,1c42 <strncpy+0x1ec>
    1b0a:	12078563          	beqz	a5,1c34 <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b0e:	00050023          	sb	zero,0(a0)
    1b12:	00677693          	and	a3,a4,6
    1b16:	12068263          	beqz	a3,1c3a <strncpy+0x1e4>
    1b1a:	000500a3          	sb	zero,1(a0)
    1b1e:	4689                	li	a3,2
    1b20:	12f6f463          	bgeu	a3,a5,1c48 <strncpy+0x1f2>
    1b24:	00050123          	sb	zero,2(a0)
    1b28:	8b11                	and	a4,a4,4
    1b2a:	cf6d                	beqz	a4,1c24 <strncpy+0x1ce>
    1b2c:	000501a3          	sb	zero,3(a0)
    1b30:	4711                	li	a4,4
    1b32:	00450693          	add	a3,a0,4
    1b36:	02f77363          	bgeu	a4,a5,1b5c <strncpy+0x106>
    1b3a:	00050223          	sb	zero,4(a0)
    1b3e:	4715                	li	a4,5
    1b40:	00550693          	add	a3,a0,5
    1b44:	00e78c63          	beq	a5,a4,1b5c <strncpy+0x106>
    1b48:	000502a3          	sb	zero,5(a0)
    1b4c:	471d                	li	a4,7
    1b4e:	10e79163          	bne	a5,a4,1c50 <strncpy+0x1fa>
    1b52:	00750693          	add	a3,a0,7
    1b56:	00050323          	sb	zero,6(a0)
    1b5a:	471d                	li	a4,7
    1b5c:	40f608b3          	sub	a7,a2,a5
    1b60:	ff88f813          	and	a6,a7,-8
    1b64:	97aa                	add	a5,a5,a0
    1b66:	010785b3          	add	a1,a5,a6
    1b6a:	0007b023          	sd	zero,0(a5)
    1b6e:	07a1                	add	a5,a5,8
    1b70:	feb79de3          	bne	a5,a1,1b6a <strncpy+0x114>
    1b74:	00e807bb          	addw	a5,a6,a4
    1b78:	01068733          	add	a4,a3,a6
    1b7c:	0b088b63          	beq	a7,a6,1c32 <strncpy+0x1dc>
    1b80:	00070023          	sb	zero,0(a4)
    1b84:	0017869b          	addw	a3,a5,1
    1b88:	f6c6f3e3          	bgeu	a3,a2,1aee <strncpy+0x98>
    1b8c:	000700a3          	sb	zero,1(a4)
    1b90:	0027869b          	addw	a3,a5,2
    1b94:	f4c6fde3          	bgeu	a3,a2,1aee <strncpy+0x98>
    1b98:	00070123          	sb	zero,2(a4)
    1b9c:	0037869b          	addw	a3,a5,3
    1ba0:	f4c6f7e3          	bgeu	a3,a2,1aee <strncpy+0x98>
    1ba4:	000701a3          	sb	zero,3(a4)
    1ba8:	0047869b          	addw	a3,a5,4
    1bac:	f4c6f1e3          	bgeu	a3,a2,1aee <strncpy+0x98>
    1bb0:	00070223          	sb	zero,4(a4)
    1bb4:	0057869b          	addw	a3,a5,5
    1bb8:	f2c6fbe3          	bgeu	a3,a2,1aee <strncpy+0x98>
    1bbc:	000702a3          	sb	zero,5(a4)
    1bc0:	0067869b          	addw	a3,a5,6
    1bc4:	f2c6f5e3          	bgeu	a3,a2,1aee <strncpy+0x98>
    1bc8:	00070323          	sb	zero,6(a4)
    1bcc:	0077869b          	addw	a3,a5,7
    1bd0:	f0c6ffe3          	bgeu	a3,a2,1aee <strncpy+0x98>
    1bd4:	000703a3          	sb	zero,7(a4)
    1bd8:	0087869b          	addw	a3,a5,8
    1bdc:	f0c6f9e3          	bgeu	a3,a2,1aee <strncpy+0x98>
    1be0:	00070423          	sb	zero,8(a4)
    1be4:	0097869b          	addw	a3,a5,9
    1be8:	f0c6f3e3          	bgeu	a3,a2,1aee <strncpy+0x98>
    1bec:	000704a3          	sb	zero,9(a4)
    1bf0:	00a7869b          	addw	a3,a5,10
    1bf4:	eec6fde3          	bgeu	a3,a2,1aee <strncpy+0x98>
    1bf8:	00070523          	sb	zero,10(a4)
    1bfc:	00b7869b          	addw	a3,a5,11
    1c00:	eec6f7e3          	bgeu	a3,a2,1aee <strncpy+0x98>
    1c04:	000705a3          	sb	zero,11(a4)
    1c08:	00c7869b          	addw	a3,a5,12
    1c0c:	eec6f1e3          	bgeu	a3,a2,1aee <strncpy+0x98>
    1c10:	00070623          	sb	zero,12(a4)
    1c14:	27b5                	addw	a5,a5,13
    1c16:	ecc7fce3          	bgeu	a5,a2,1aee <strncpy+0x98>
    1c1a:	000706a3          	sb	zero,13(a4)
}
    1c1e:	8082                	ret
    1c20:	46ad                	li	a3,11
    1c22:	b5d5                	j	1b06 <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c24:	00350693          	add	a3,a0,3
    1c28:	470d                	li	a4,3
    1c2a:	bf0d                	j	1b5c <strncpy+0x106>
        if (!n || !*s)
    1c2c:	e4061ce3          	bnez	a2,1a84 <strncpy+0x2e>
}
    1c30:	8082                	ret
    1c32:	8082                	ret
    char *p = dest;
    1c34:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c36:	4701                	li	a4,0
    1c38:	b715                	j	1b5c <strncpy+0x106>
    1c3a:	00150693          	add	a3,a0,1
    1c3e:	4705                	li	a4,1
    1c40:	bf31                	j	1b5c <strncpy+0x106>
    char *p = dest;
    1c42:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c44:	4781                	li	a5,0
    1c46:	bf2d                	j	1b80 <strncpy+0x12a>
    1c48:	00250693          	add	a3,a0,2
    1c4c:	4709                	li	a4,2
    1c4e:	b739                	j	1b5c <strncpy+0x106>
    1c50:	00650693          	add	a3,a0,6
    1c54:	4719                	li	a4,6
    1c56:	b719                	j	1b5c <strncpy+0x106>

0000000000001c58 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c58:	87aa                	mv	a5,a0
    1c5a:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c5c:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c60:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c64:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c66:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c68:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c6c:	2501                	sext.w	a0,a0
    1c6e:	8082                	ret

0000000000001c70 <openat>:
    register long a7 __asm__("a7") = n;
    1c70:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c74:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c78:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c7c:	2501                	sext.w	a0,a0
    1c7e:	8082                	ret

0000000000001c80 <close>:
    register long a7 __asm__("a7") = n;
    1c80:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c84:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c88:	2501                	sext.w	a0,a0
    1c8a:	8082                	ret

0000000000001c8c <read>:
    register long a7 __asm__("a7") = n;
    1c8c:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c90:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c94:	8082                	ret

0000000000001c96 <write>:
    register long a7 __asm__("a7") = n;
    1c96:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c9a:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c9e:	8082                	ret

0000000000001ca0 <getpid>:
    register long a7 __asm__("a7") = n;
    1ca0:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1ca4:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1ca8:	2501                	sext.w	a0,a0
    1caa:	8082                	ret

0000000000001cac <getppid>:
    register long a7 __asm__("a7") = n;
    1cac:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1cb0:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cb4:	2501                	sext.w	a0,a0
    1cb6:	8082                	ret

0000000000001cb8 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cb8:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cbc:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cc0:	2501                	sext.w	a0,a0
    1cc2:	8082                	ret

0000000000001cc4 <fork>:
    register long a7 __asm__("a7") = n;
    1cc4:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cc8:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cca:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ccc:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cd0:	2501                	sext.w	a0,a0
    1cd2:	8082                	ret

0000000000001cd4 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cd4:	85b2                	mv	a1,a2
    1cd6:	863a                	mv	a2,a4
    if (stack)
    1cd8:	c191                	beqz	a1,1cdc <clone+0x8>
	stack += stack_size;
    1cda:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cdc:	4781                	li	a5,0
    1cde:	4701                	li	a4,0
    1ce0:	4681                	li	a3,0
    1ce2:	2601                	sext.w	a2,a2
    1ce4:	a2ed                	j	1ece <__clone>

0000000000001ce6 <exit>:
    register long a7 __asm__("a7") = n;
    1ce6:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cea:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cee:	8082                	ret

0000000000001cf0 <waitpid>:
    register long a7 __asm__("a7") = n;
    1cf0:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cf4:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cf6:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cfa:	2501                	sext.w	a0,a0
    1cfc:	8082                	ret

0000000000001cfe <exec>:
    register long a7 __asm__("a7") = n;
    1cfe:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d02:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d06:	2501                	sext.w	a0,a0
    1d08:	8082                	ret

0000000000001d0a <execve>:
    register long a7 __asm__("a7") = n;
    1d0a:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d0e:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d12:	2501                	sext.w	a0,a0
    1d14:	8082                	ret

0000000000001d16 <times>:
    register long a7 __asm__("a7") = n;
    1d16:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d1a:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d1e:	2501                	sext.w	a0,a0
    1d20:	8082                	ret

0000000000001d22 <get_time>:

int64 get_time()
{
    1d22:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d24:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d28:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d2a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d2c:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d30:	2501                	sext.w	a0,a0
    1d32:	ed09                	bnez	a0,1d4c <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d34:	67a2                	ld	a5,8(sp)
    1d36:	3e800713          	li	a4,1000
    1d3a:	00015503          	lhu	a0,0(sp)
    1d3e:	02e7d7b3          	divu	a5,a5,a4
    1d42:	02e50533          	mul	a0,a0,a4
    1d46:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d48:	0141                	add	sp,sp,16
    1d4a:	8082                	ret
        return -1;
    1d4c:	557d                	li	a0,-1
    1d4e:	bfed                	j	1d48 <get_time+0x26>

0000000000001d50 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d50:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d54:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d58:	2501                	sext.w	a0,a0
    1d5a:	8082                	ret

0000000000001d5c <time>:
    register long a7 __asm__("a7") = n;
    1d5c:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d60:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d64:	2501                	sext.w	a0,a0
    1d66:	8082                	ret

0000000000001d68 <sleep>:

int sleep(unsigned long long time)
{
    1d68:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d6a:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d6c:	850a                	mv	a0,sp
    1d6e:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d70:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d74:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d76:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d7a:	e501                	bnez	a0,1d82 <sleep+0x1a>
    return 0;
    1d7c:	4501                	li	a0,0
}
    1d7e:	0141                	add	sp,sp,16
    1d80:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d82:	4502                	lw	a0,0(sp)
}
    1d84:	0141                	add	sp,sp,16
    1d86:	8082                	ret

0000000000001d88 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d88:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d8c:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d90:	2501                	sext.w	a0,a0
    1d92:	8082                	ret

0000000000001d94 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d94:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d98:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d9c:	8082                	ret

0000000000001d9e <munmap>:
    register long a7 __asm__("a7") = n;
    1d9e:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1da2:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1da6:	2501                	sext.w	a0,a0
    1da8:	8082                	ret

0000000000001daa <wait>:

int wait(int *code)
{
    1daa:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dac:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1db0:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1db2:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1db4:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1db6:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1dba:	2501                	sext.w	a0,a0
    1dbc:	8082                	ret

0000000000001dbe <spawn>:
    register long a7 __asm__("a7") = n;
    1dbe:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1dc2:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dc6:	2501                	sext.w	a0,a0
    1dc8:	8082                	ret

0000000000001dca <mailread>:
    register long a7 __asm__("a7") = n;
    1dca:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dce:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dd2:	2501                	sext.w	a0,a0
    1dd4:	8082                	ret

0000000000001dd6 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dd6:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dda:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dde:	2501                	sext.w	a0,a0
    1de0:	8082                	ret

0000000000001de2 <fstat>:
    register long a7 __asm__("a7") = n;
    1de2:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1de6:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dea:	2501                	sext.w	a0,a0
    1dec:	8082                	ret

0000000000001dee <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dee:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1df0:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1df4:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1df6:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1dfa:	2501                	sext.w	a0,a0
    1dfc:	8082                	ret

0000000000001dfe <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1dfe:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e00:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e04:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e06:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e0a:	2501                	sext.w	a0,a0
    1e0c:	8082                	ret

0000000000001e0e <link>:

int link(char *old_path, char *new_path)
{
    1e0e:	87aa                	mv	a5,a0
    1e10:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e12:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e16:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e1a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e1c:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e20:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e22:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e26:	2501                	sext.w	a0,a0
    1e28:	8082                	ret

0000000000001e2a <unlink>:

int unlink(char *path)
{
    1e2a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e2c:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e30:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e34:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e36:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e3a:	2501                	sext.w	a0,a0
    1e3c:	8082                	ret

0000000000001e3e <uname>:
    register long a7 __asm__("a7") = n;
    1e3e:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e42:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e46:	2501                	sext.w	a0,a0
    1e48:	8082                	ret

0000000000001e4a <brk>:
    register long a7 __asm__("a7") = n;
    1e4a:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e4e:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e52:	2501                	sext.w	a0,a0
    1e54:	8082                	ret

0000000000001e56 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e56:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e58:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e5c:	8082                	ret

0000000000001e5e <chdir>:
    register long a7 __asm__("a7") = n;
    1e5e:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e62:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e66:	2501                	sext.w	a0,a0
    1e68:	8082                	ret

0000000000001e6a <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e6a:	862e                	mv	a2,a1
    1e6c:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e6e:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e70:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e74:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e78:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e7a:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e7c:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e80:	2501                	sext.w	a0,a0
    1e82:	8082                	ret

0000000000001e84 <getdents>:
    register long a7 __asm__("a7") = n;
    1e84:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e88:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e8c:	2501                	sext.w	a0,a0
    1e8e:	8082                	ret

0000000000001e90 <pipe>:
    register long a7 __asm__("a7") = n;
    1e90:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e94:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e96:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e9a:	2501                	sext.w	a0,a0
    1e9c:	8082                	ret

0000000000001e9e <dup>:
    register long a7 __asm__("a7") = n;
    1e9e:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1ea0:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1ea4:	2501                	sext.w	a0,a0
    1ea6:	8082                	ret

0000000000001ea8 <dup2>:
    register long a7 __asm__("a7") = n;
    1ea8:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1eaa:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eac:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1eb0:	2501                	sext.w	a0,a0
    1eb2:	8082                	ret

0000000000001eb4 <mount>:
    register long a7 __asm__("a7") = n;
    1eb4:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1eb8:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ebc:	2501                	sext.w	a0,a0
    1ebe:	8082                	ret

0000000000001ec0 <umount>:
    register long a7 __asm__("a7") = n;
    1ec0:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ec4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec6:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1eca:	2501                	sext.w	a0,a0
    1ecc:	8082                	ret

0000000000001ece <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ece:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1ed0:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ed2:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ed4:	8532                	mv	a0,a2
	mv a2, a4
    1ed6:	863a                	mv	a2,a4
	mv a3, a5
    1ed8:	86be                	mv	a3,a5
	mv a4, a6
    1eda:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1edc:	0dc00893          	li	a7,220
	ecall
    1ee0:	00000073          	ecall

	beqz a0, 1f
    1ee4:	c111                	beqz	a0,1ee8 <__clone+0x1a>
	# Parent
	ret
    1ee6:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ee8:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1eea:	6522                	ld	a0,8(sp)
	jalr a1
    1eec:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1eee:	05d00893          	li	a7,93
	ecall
    1ef2:	00000073          	ecall
