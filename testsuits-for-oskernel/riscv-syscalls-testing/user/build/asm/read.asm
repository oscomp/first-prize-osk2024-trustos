
/home/windflower/Desktop/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/read:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a06d                	j	10ac <__start_main>

0000000000001004 <test_read>:
#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"

void test_read() {
    1004:	712d                	add	sp,sp,-288
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	eea50513          	add	a0,a0,-278 # 1ef0 <__clone+0x2c>
void test_read() {
    100e:	ee06                	sd	ra,280(sp)
    1010:	ea22                	sd	s0,272(sp)
	TEST_START(__func__);
    1012:	2d2000ef          	jal	12e4 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	f4a50513          	add	a0,a0,-182 # 1f60 <__func__.0>
    101e:	2c6000ef          	jal	12e4 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	ee650513          	add	a0,a0,-282 # 1f08 <__clone+0x44>
    102a:	2ba000ef          	jal	12e4 <puts>
	int fd = open("./text.txt", 0);
    102e:	4581                	li	a1,0
    1030:	00001517          	auipc	a0,0x1
    1034:	ee850513          	add	a0,a0,-280 # 1f18 <__clone+0x54>
    1038:	417000ef          	jal	1c4e <open>
	char buf[256];
	int size = read(fd, buf, 256);
    103c:	10000613          	li	a2,256
    1040:	080c                	add	a1,sp,16
	int fd = open("./text.txt", 0);
    1042:	842a                	mv	s0,a0
	int size = read(fd, buf, 256);
    1044:	43f000ef          	jal	1c82 <read>
    1048:	0005061b          	sext.w	a2,a0
	assert(size >= 0);
    104c:	02064f63          	bltz	a2,108a <test_read+0x86>

	write(STDOUT, buf, size);
    1050:	080c                	add	a1,sp,16
    1052:	4505                	li	a0,1
    1054:	439000ef          	jal	1c8c <write>
	close(fd);
    1058:	8522                	mv	a0,s0
    105a:	41d000ef          	jal	1c76 <close>
	TEST_END(__func__);
    105e:	00001517          	auipc	a0,0x1
    1062:	eea50513          	add	a0,a0,-278 # 1f48 <__clone+0x84>
    1066:	27e000ef          	jal	12e4 <puts>
    106a:	00001517          	auipc	a0,0x1
    106e:	ef650513          	add	a0,a0,-266 # 1f60 <__func__.0>
    1072:	272000ef          	jal	12e4 <puts>
    1076:	00001517          	auipc	a0,0x1
    107a:	e9250513          	add	a0,a0,-366 # 1f08 <__clone+0x44>
    107e:	266000ef          	jal	12e4 <puts>
}
    1082:	60f2                	ld	ra,280(sp)
    1084:	6452                	ld	s0,272(sp)
    1086:	6115                	add	sp,sp,288
    1088:	8082                	ret
	assert(size >= 0);
    108a:	00001517          	auipc	a0,0x1
    108e:	e9e50513          	add	a0,a0,-354 # 1f28 <__clone+0x64>
    1092:	e432                	sd	a2,8(sp)
    1094:	4f0000ef          	jal	1584 <panic>
    1098:	6622                	ld	a2,8(sp)
    109a:	bf5d                	j	1050 <test_read+0x4c>

000000000000109c <main>:

int main(void) {
    109c:	1141                	add	sp,sp,-16
    109e:	e406                	sd	ra,8(sp)
	test_read();
    10a0:	f65ff0ef          	jal	1004 <test_read>
	return 0;
}
    10a4:	60a2                	ld	ra,8(sp)
    10a6:	4501                	li	a0,0
    10a8:	0141                	add	sp,sp,16
    10aa:	8082                	ret

00000000000010ac <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10ac:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10ae:	4108                	lw	a0,0(a0)
{
    10b0:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10b2:	05a1                	add	a1,a1,8
{
    10b4:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10b6:	fe7ff0ef          	jal	109c <main>
    10ba:	423000ef          	jal	1cdc <exit>
	return 0;
}
    10be:	60a2                	ld	ra,8(sp)
    10c0:	4501                	li	a0,0
    10c2:	0141                	add	sp,sp,16
    10c4:	8082                	ret

00000000000010c6 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10c6:	7179                	add	sp,sp,-48
    10c8:	f406                	sd	ra,40(sp)
    10ca:	0005081b          	sext.w	a6,a0
    10ce:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10d0:	00055563          	bgez	a0,10da <printint.constprop.0+0x14>
        x = -xx;
    10d4:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    10d8:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10da:	02b8763b          	remuw	a2,a6,a1
    10de:	00001697          	auipc	a3,0x1
    10e2:	e9268693          	add	a3,a3,-366 # 1f70 <digits>
    buf[16] = 0;
    10e6:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10ea:	0005871b          	sext.w	a4,a1
    10ee:	1602                	sll	a2,a2,0x20
    10f0:	9201                	srl	a2,a2,0x20
    10f2:	9636                	add	a2,a2,a3
    10f4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10f8:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    10fc:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1100:	10b86c63          	bltu	a6,a1,1218 <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    1104:	02e5763b          	remuw	a2,a0,a4
    1108:	1602                	sll	a2,a2,0x20
    110a:	9201                	srl	a2,a2,0x20
    110c:	9636                	add	a2,a2,a3
    110e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1112:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1116:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    111a:	10e56863          	bltu	a0,a4,122a <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    111e:	02e5f63b          	remuw	a2,a1,a4
    1122:	1602                	sll	a2,a2,0x20
    1124:	9201                	srl	a2,a2,0x20
    1126:	9636                	add	a2,a2,a3
    1128:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    112c:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1130:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1134:	10e5e463          	bltu	a1,a4,123c <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    1138:	02e5763b          	remuw	a2,a0,a4
    113c:	1602                	sll	a2,a2,0x20
    113e:	9201                	srl	a2,a2,0x20
    1140:	9636                	add	a2,a2,a3
    1142:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1146:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    114a:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    114e:	10e56063          	bltu	a0,a4,124e <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    1152:	02e5f63b          	remuw	a2,a1,a4
    1156:	1602                	sll	a2,a2,0x20
    1158:	9201                	srl	a2,a2,0x20
    115a:	9636                	add	a2,a2,a3
    115c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1160:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1164:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1168:	0ee5ec63          	bltu	a1,a4,1260 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    116c:	02e5763b          	remuw	a2,a0,a4
    1170:	1602                	sll	a2,a2,0x20
    1172:	9201                	srl	a2,a2,0x20
    1174:	9636                	add	a2,a2,a3
    1176:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    117a:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    117e:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1182:	08e56263          	bltu	a0,a4,1206 <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    1186:	02e5f63b          	remuw	a2,a1,a4
    118a:	1602                	sll	a2,a2,0x20
    118c:	9201                	srl	a2,a2,0x20
    118e:	9636                	add	a2,a2,a3
    1190:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1194:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1198:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    119c:	0ce5eb63          	bltu	a1,a4,1272 <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    11a0:	02e5763b          	remuw	a2,a0,a4
    11a4:	1602                	sll	a2,a2,0x20
    11a6:	9201                	srl	a2,a2,0x20
    11a8:	9636                	add	a2,a2,a3
    11aa:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ae:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11b2:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11b6:	0ce56763          	bltu	a0,a4,1284 <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    11ba:	02e5f63b          	remuw	a2,a1,a4
    11be:	1602                	sll	a2,a2,0x20
    11c0:	9201                	srl	a2,a2,0x20
    11c2:	9636                	add	a2,a2,a3
    11c4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c8:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11cc:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11d0:	0ce5e363          	bltu	a1,a4,1296 <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    11d4:	1782                	sll	a5,a5,0x20
    11d6:	9381                	srl	a5,a5,0x20
    11d8:	96be                	add	a3,a3,a5
    11da:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    11de:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    11e0:	00f10723          	sb	a5,14(sp)
    if (sign)
    11e4:	00088763          	beqz	a7,11f2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11e8:	02d00793          	li	a5,45
    11ec:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11f0:	4595                	li	a1,5
    write(f, s, l);
    11f2:	003c                	add	a5,sp,8
    11f4:	4641                	li	a2,16
    11f6:	9e0d                	subw	a2,a2,a1
    11f8:	4505                	li	a0,1
    11fa:	95be                	add	a1,a1,a5
    11fc:	291000ef          	jal	1c8c <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1200:	70a2                	ld	ra,40(sp)
    1202:	6145                	add	sp,sp,48
    1204:	8082                	ret
    i++;
    1206:	45a9                	li	a1,10
    if (sign)
    1208:	fe0885e3          	beqz	a7,11f2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    120c:	02d00793          	li	a5,45
    1210:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1214:	45a5                	li	a1,9
    1216:	bff1                	j	11f2 <printint.constprop.0+0x12c>
    i++;
    1218:	45bd                	li	a1,15
    if (sign)
    121a:	fc088ce3          	beqz	a7,11f2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    121e:	02d00793          	li	a5,45
    1222:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1226:	45b9                	li	a1,14
    1228:	b7e9                	j	11f2 <printint.constprop.0+0x12c>
    i++;
    122a:	45b9                	li	a1,14
    if (sign)
    122c:	fc0883e3          	beqz	a7,11f2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1230:	02d00793          	li	a5,45
    1234:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1238:	45b5                	li	a1,13
    123a:	bf65                	j	11f2 <printint.constprop.0+0x12c>
    i++;
    123c:	45b5                	li	a1,13
    if (sign)
    123e:	fa088ae3          	beqz	a7,11f2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1242:	02d00793          	li	a5,45
    1246:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    124a:	45b1                	li	a1,12
    124c:	b75d                	j	11f2 <printint.constprop.0+0x12c>
    i++;
    124e:	45b1                	li	a1,12
    if (sign)
    1250:	fa0881e3          	beqz	a7,11f2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1254:	02d00793          	li	a5,45
    1258:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    125c:	45ad                	li	a1,11
    125e:	bf51                	j	11f2 <printint.constprop.0+0x12c>
    i++;
    1260:	45ad                	li	a1,11
    if (sign)
    1262:	f80888e3          	beqz	a7,11f2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1266:	02d00793          	li	a5,45
    126a:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    126e:	45a9                	li	a1,10
    1270:	b749                	j	11f2 <printint.constprop.0+0x12c>
    i++;
    1272:	45a5                	li	a1,9
    if (sign)
    1274:	f6088fe3          	beqz	a7,11f2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1278:	02d00793          	li	a5,45
    127c:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1280:	45a1                	li	a1,8
    1282:	bf85                	j	11f2 <printint.constprop.0+0x12c>
    i++;
    1284:	45a1                	li	a1,8
    if (sign)
    1286:	f60886e3          	beqz	a7,11f2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    128a:	02d00793          	li	a5,45
    128e:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1292:	459d                	li	a1,7
    1294:	bfb9                	j	11f2 <printint.constprop.0+0x12c>
    i++;
    1296:	459d                	li	a1,7
    if (sign)
    1298:	f4088de3          	beqz	a7,11f2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    129c:	02d00793          	li	a5,45
    12a0:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12a4:	4599                	li	a1,6
    12a6:	b7b1                	j	11f2 <printint.constprop.0+0x12c>

00000000000012a8 <getchar>:
{
    12a8:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12aa:	00f10593          	add	a1,sp,15
    12ae:	4605                	li	a2,1
    12b0:	4501                	li	a0,0
{
    12b2:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12b4:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12b8:	1cb000ef          	jal	1c82 <read>
}
    12bc:	60e2                	ld	ra,24(sp)
    12be:	00f14503          	lbu	a0,15(sp)
    12c2:	6105                	add	sp,sp,32
    12c4:	8082                	ret

00000000000012c6 <putchar>:
{
    12c6:	1101                	add	sp,sp,-32
    12c8:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12ca:	00f10593          	add	a1,sp,15
    12ce:	4605                	li	a2,1
    12d0:	4505                	li	a0,1
{
    12d2:	ec06                	sd	ra,24(sp)
    char byte = c;
    12d4:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12d8:	1b5000ef          	jal	1c8c <write>
}
    12dc:	60e2                	ld	ra,24(sp)
    12de:	2501                	sext.w	a0,a0
    12e0:	6105                	add	sp,sp,32
    12e2:	8082                	ret

00000000000012e4 <puts>:
{
    12e4:	1141                	add	sp,sp,-16
    12e6:	e406                	sd	ra,8(sp)
    12e8:	e022                	sd	s0,0(sp)
    12ea:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12ec:	56c000ef          	jal	1858 <strlen>
    12f0:	862a                	mv	a2,a0
    12f2:	85a2                	mv	a1,s0
    12f4:	4505                	li	a0,1
    12f6:	197000ef          	jal	1c8c <write>
}
    12fa:	60a2                	ld	ra,8(sp)
    12fc:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12fe:	957d                	sra	a0,a0,0x3f
    return r;
    1300:	2501                	sext.w	a0,a0
}
    1302:	0141                	add	sp,sp,16
    1304:	8082                	ret

0000000000001306 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1306:	7131                	add	sp,sp,-192
    1308:	e4d6                	sd	s5,72(sp)
    130a:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    130c:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    130e:	013c                	add	a5,sp,136
{
    1310:	f0ca                	sd	s2,96(sp)
    1312:	ecce                	sd	s3,88(sp)
    1314:	e8d2                	sd	s4,80(sp)
    1316:	e0da                	sd	s6,64(sp)
    1318:	fc5e                	sd	s7,56(sp)
    131a:	fc86                	sd	ra,120(sp)
    131c:	f8a2                	sd	s0,112(sp)
    131e:	f4a6                	sd	s1,104(sp)
    1320:	e52e                	sd	a1,136(sp)
    1322:	e932                	sd	a2,144(sp)
    1324:	ed36                	sd	a3,152(sp)
    1326:	f13a                	sd	a4,160(sp)
    1328:	f942                	sd	a6,176(sp)
    132a:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    132c:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    132e:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1332:	07300a13          	li	s4,115
    1336:	07800b93          	li	s7,120
    133a:	06400b13          	li	s6,100
    buf[i++] = '0';
    133e:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x58c0>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1342:	00001997          	auipc	s3,0x1
    1346:	c2e98993          	add	s3,s3,-978 # 1f70 <digits>
        if (!*s)
    134a:	00054783          	lbu	a5,0(a0)
    134e:	16078863          	beqz	a5,14be <printf+0x1b8>
    1352:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1354:	19278063          	beq	a5,s2,14d4 <printf+0x1ce>
    1358:	00164783          	lbu	a5,1(a2)
    135c:	0605                	add	a2,a2,1
    135e:	fbfd                	bnez	a5,1354 <printf+0x4e>
    1360:	84b2                	mv	s1,a2
        l = z - a;
    1362:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1366:	85aa                	mv	a1,a0
    1368:	8622                	mv	a2,s0
    136a:	4505                	li	a0,1
    136c:	121000ef          	jal	1c8c <write>
        if (l)
    1370:	18041763          	bnez	s0,14fe <printf+0x1f8>
        if (s[1] == 0)
    1374:	0014c783          	lbu	a5,1(s1)
    1378:	14078363          	beqz	a5,14be <printf+0x1b8>
        switch (s[1])
    137c:	19478f63          	beq	a5,s4,151a <printf+0x214>
    1380:	18fa6163          	bltu	s4,a5,1502 <printf+0x1fc>
    1384:	1b678e63          	beq	a5,s6,1540 <printf+0x23a>
    1388:	07000713          	li	a4,112
    138c:	1ce79463          	bne	a5,a4,1554 <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1390:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1392:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1396:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1398:	631c                	ld	a5,0(a4)
    139a:	0721                	add	a4,a4,8
    139c:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    139e:	00479293          	sll	t0,a5,0x4
    13a2:	00879f93          	sll	t6,a5,0x8
    13a6:	00c79f13          	sll	t5,a5,0xc
    13aa:	01079e93          	sll	t4,a5,0x10
    13ae:	01479e13          	sll	t3,a5,0x14
    13b2:	01879313          	sll	t1,a5,0x18
    13b6:	01c79893          	sll	a7,a5,0x1c
    13ba:	02479813          	sll	a6,a5,0x24
    13be:	02879513          	sll	a0,a5,0x28
    13c2:	02c79593          	sll	a1,a5,0x2c
    13c6:	03079693          	sll	a3,a5,0x30
    13ca:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13ce:	03c7d413          	srl	s0,a5,0x3c
    13d2:	01c7d39b          	srlw	t2,a5,0x1c
    13d6:	03c2d293          	srl	t0,t0,0x3c
    13da:	03cfdf93          	srl	t6,t6,0x3c
    13de:	03cf5f13          	srl	t5,t5,0x3c
    13e2:	03cede93          	srl	t4,t4,0x3c
    13e6:	03ce5e13          	srl	t3,t3,0x3c
    13ea:	03c35313          	srl	t1,t1,0x3c
    13ee:	03c8d893          	srl	a7,a7,0x3c
    13f2:	03c85813          	srl	a6,a6,0x3c
    13f6:	9171                	srl	a0,a0,0x3c
    13f8:	91f1                	srl	a1,a1,0x3c
    13fa:	92f1                	srl	a3,a3,0x3c
    13fc:	9371                	srl	a4,a4,0x3c
    13fe:	974e                	add	a4,a4,s3
    1400:	944e                	add	s0,s0,s3
    1402:	92ce                	add	t0,t0,s3
    1404:	9fce                	add	t6,t6,s3
    1406:	9f4e                	add	t5,t5,s3
    1408:	9ece                	add	t4,t4,s3
    140a:	9e4e                	add	t3,t3,s3
    140c:	934e                	add	t1,t1,s3
    140e:	98ce                	add	a7,a7,s3
    1410:	93ce                	add	t2,t2,s3
    1412:	984e                	add	a6,a6,s3
    1414:	954e                	add	a0,a0,s3
    1416:	95ce                	add	a1,a1,s3
    1418:	96ce                	add	a3,a3,s3
    141a:	00074083          	lbu	ra,0(a4)
    141e:	0002c283          	lbu	t0,0(t0)
    1422:	000fcf83          	lbu	t6,0(t6)
    1426:	000f4f03          	lbu	t5,0(t5)
    142a:	000ece83          	lbu	t4,0(t4)
    142e:	000e4e03          	lbu	t3,0(t3)
    1432:	00034303          	lbu	t1,0(t1)
    1436:	0008c883          	lbu	a7,0(a7)
    143a:	0003c383          	lbu	t2,0(t2)
    143e:	00084803          	lbu	a6,0(a6)
    1442:	00054503          	lbu	a0,0(a0)
    1446:	0005c583          	lbu	a1,0(a1)
    144a:	0006c683          	lbu	a3,0(a3)
    144e:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1452:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1456:	9371                	srl	a4,a4,0x3c
    1458:	8bbd                	and	a5,a5,15
    145a:	974e                	add	a4,a4,s3
    145c:	97ce                	add	a5,a5,s3
    145e:	005105a3          	sb	t0,11(sp)
    1462:	01f10623          	sb	t6,12(sp)
    1466:	01e106a3          	sb	t5,13(sp)
    146a:	01d10723          	sb	t4,14(sp)
    146e:	01c107a3          	sb	t3,15(sp)
    1472:	00610823          	sb	t1,16(sp)
    1476:	011108a3          	sb	a7,17(sp)
    147a:	00710923          	sb	t2,18(sp)
    147e:	010109a3          	sb	a6,19(sp)
    1482:	00a10a23          	sb	a0,20(sp)
    1486:	00b10aa3          	sb	a1,21(sp)
    148a:	00d10b23          	sb	a3,22(sp)
    148e:	00110ba3          	sb	ra,23(sp)
    1492:	00810523          	sb	s0,10(sp)
    1496:	00074703          	lbu	a4,0(a4)
    149a:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    149e:	002c                	add	a1,sp,8
    14a0:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14a2:	00e10c23          	sb	a4,24(sp)
    14a6:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14aa:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14ae:	7de000ef          	jal	1c8c <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14b2:	00248513          	add	a0,s1,2
        if (!*s)
    14b6:	00054783          	lbu	a5,0(a0)
    14ba:	e8079ce3          	bnez	a5,1352 <printf+0x4c>
    }
    va_end(ap);
}
    14be:	70e6                	ld	ra,120(sp)
    14c0:	7446                	ld	s0,112(sp)
    14c2:	74a6                	ld	s1,104(sp)
    14c4:	7906                	ld	s2,96(sp)
    14c6:	69e6                	ld	s3,88(sp)
    14c8:	6a46                	ld	s4,80(sp)
    14ca:	6aa6                	ld	s5,72(sp)
    14cc:	6b06                	ld	s6,64(sp)
    14ce:	7be2                	ld	s7,56(sp)
    14d0:	6129                	add	sp,sp,192
    14d2:	8082                	ret
    14d4:	84b2                	mv	s1,a2
    14d6:	a039                	j	14e4 <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14d8:	0024c783          	lbu	a5,2(s1)
    14dc:	0605                	add	a2,a2,1
    14de:	0489                	add	s1,s1,2
    14e0:	e92791e3          	bne	a5,s2,1362 <printf+0x5c>
    14e4:	0014c783          	lbu	a5,1(s1)
    14e8:	ff2788e3          	beq	a5,s2,14d8 <printf+0x1d2>
        l = z - a;
    14ec:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14f0:	85aa                	mv	a1,a0
    14f2:	8622                	mv	a2,s0
    14f4:	4505                	li	a0,1
    14f6:	796000ef          	jal	1c8c <write>
        if (l)
    14fa:	e6040de3          	beqz	s0,1374 <printf+0x6e>
    14fe:	8526                	mv	a0,s1
    1500:	b5a9                	j	134a <printf+0x44>
        switch (s[1])
    1502:	05779963          	bne	a5,s7,1554 <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    1506:	6782                	ld	a5,0(sp)
    1508:	45c1                	li	a1,16
    150a:	4388                	lw	a0,0(a5)
    150c:	07a1                	add	a5,a5,8
    150e:	e03e                	sd	a5,0(sp)
    1510:	bb7ff0ef          	jal	10c6 <printint.constprop.0>
        s += 2;
    1514:	00248513          	add	a0,s1,2
    1518:	bf79                	j	14b6 <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    151a:	6782                	ld	a5,0(sp)
    151c:	6380                	ld	s0,0(a5)
    151e:	07a1                	add	a5,a5,8
    1520:	e03e                	sd	a5,0(sp)
    1522:	cc21                	beqz	s0,157a <printf+0x274>
            l = strnlen(a, 200);
    1524:	0c800593          	li	a1,200
    1528:	8522                	mv	a0,s0
    152a:	460000ef          	jal	198a <strnlen>
    write(f, s, l);
    152e:	0005061b          	sext.w	a2,a0
    1532:	85a2                	mv	a1,s0
    1534:	4505                	li	a0,1
    1536:	756000ef          	jal	1c8c <write>
        s += 2;
    153a:	00248513          	add	a0,s1,2
    153e:	bfa5                	j	14b6 <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    1540:	6782                	ld	a5,0(sp)
    1542:	45a9                	li	a1,10
    1544:	4388                	lw	a0,0(a5)
    1546:	07a1                	add	a5,a5,8
    1548:	e03e                	sd	a5,0(sp)
    154a:	b7dff0ef          	jal	10c6 <printint.constprop.0>
        s += 2;
    154e:	00248513          	add	a0,s1,2
    1552:	b795                	j	14b6 <printf+0x1b0>
    return write(stdout, &byte, 1);
    1554:	4605                	li	a2,1
    1556:	002c                	add	a1,sp,8
    1558:	4505                	li	a0,1
    char byte = c;
    155a:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    155e:	72e000ef          	jal	1c8c <write>
    char byte = c;
    1562:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1566:	4605                	li	a2,1
    1568:	002c                	add	a1,sp,8
    156a:	4505                	li	a0,1
    char byte = c;
    156c:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1570:	71c000ef          	jal	1c8c <write>
        s += 2;
    1574:	00248513          	add	a0,s1,2
    1578:	bf3d                	j	14b6 <printf+0x1b0>
                a = "(null)";
    157a:	00001417          	auipc	s0,0x1
    157e:	9de40413          	add	s0,s0,-1570 # 1f58 <__clone+0x94>
    1582:	b74d                	j	1524 <printf+0x21e>

0000000000001584 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1584:	1141                	add	sp,sp,-16
    1586:	e406                	sd	ra,8(sp)
    puts(m);
    1588:	d5dff0ef          	jal	12e4 <puts>
    exit(-100);
}
    158c:	60a2                	ld	ra,8(sp)
    exit(-100);
    158e:	f9c00513          	li	a0,-100
}
    1592:	0141                	add	sp,sp,16
    exit(-100);
    1594:	a7a1                	j	1cdc <exit>

0000000000001596 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1596:	02000793          	li	a5,32
    159a:	00f50663          	beq	a0,a5,15a6 <isspace+0x10>
    159e:	355d                	addw	a0,a0,-9
    15a0:	00553513          	sltiu	a0,a0,5
    15a4:	8082                	ret
    15a6:	4505                	li	a0,1
}
    15a8:	8082                	ret

00000000000015aa <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15aa:	fd05051b          	addw	a0,a0,-48
}
    15ae:	00a53513          	sltiu	a0,a0,10
    15b2:	8082                	ret

00000000000015b4 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15b4:	02000713          	li	a4,32
    15b8:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15ba:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15be:	ff76879b          	addw	a5,a3,-9
    15c2:	06e68063          	beq	a3,a4,1622 <atoi+0x6e>
    15c6:	0006859b          	sext.w	a1,a3
    15ca:	04f67c63          	bgeu	a2,a5,1622 <atoi+0x6e>
        s++;
    switch (*s)
    15ce:	02b00793          	li	a5,43
    15d2:	06f68563          	beq	a3,a5,163c <atoi+0x88>
    15d6:	02d00793          	li	a5,45
    15da:	04f69663          	bne	a3,a5,1626 <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15de:	00154683          	lbu	a3,1(a0)
    15e2:	47a5                	li	a5,9
        s++;
    15e4:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    15e8:	fd06869b          	addw	a3,a3,-48
    15ec:	8636                	mv	a2,a3
    while (isdigit(*s))
    15ee:	04d7e563          	bltu	a5,a3,1638 <atoi+0x84>
        neg = 1;
    15f2:	4885                	li	a7,1
    int n = 0, neg = 0;
    15f4:	4501                	li	a0,0
    while (isdigit(*s))
    15f6:	4825                	li	a6,9
    15f8:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    15fc:	0025179b          	sllw	a5,a0,0x2
    1600:	9fa9                	addw	a5,a5,a0
    1602:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    1606:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    160a:	85b2                	mv	a1,a2
    160c:	40c7853b          	subw	a0,a5,a2
    1610:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    1612:	8636                	mv	a2,a3
    while (isdigit(*s))
    1614:	fed872e3          	bgeu	a6,a3,15f8 <atoi+0x44>
    return neg ? n : -n;
    1618:	02089163          	bnez	a7,163a <atoi+0x86>
    161c:	40f5853b          	subw	a0,a1,a5
    1620:	8082                	ret
        s++;
    1622:	0505                	add	a0,a0,1
    1624:	bf59                	j	15ba <atoi+0x6>
    while (isdigit(*s))
    1626:	fd05859b          	addw	a1,a1,-48
    162a:	47a5                	li	a5,9
    162c:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    162e:	4881                	li	a7,0
    1630:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    1634:	fcb7f0e3          	bgeu	a5,a1,15f4 <atoi+0x40>
    return neg ? n : -n;
    1638:	4501                	li	a0,0
}
    163a:	8082                	ret
    while (isdigit(*s))
    163c:	00154683          	lbu	a3,1(a0)
    1640:	47a5                	li	a5,9
        s++;
    1642:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1646:	fd06869b          	addw	a3,a3,-48
    164a:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    164c:	4881                	li	a7,0
    while (isdigit(*s))
    164e:	fad7f3e3          	bgeu	a5,a3,15f4 <atoi+0x40>
    return neg ? n : -n;
    1652:	4501                	li	a0,0
    1654:	8082                	ret

0000000000001656 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1656:	16060f63          	beqz	a2,17d4 <memset+0x17e>
    165a:	40a006b3          	neg	a3,a0
    165e:	0076f793          	and	a5,a3,7
    1662:	00778813          	add	a6,a5,7
    1666:	48ad                	li	a7,11
    1668:	0ff5f713          	zext.b	a4,a1
    166c:	fff60593          	add	a1,a2,-1
    1670:	17186363          	bltu	a6,a7,17d6 <memset+0x180>
    1674:	1705eb63          	bltu	a1,a6,17ea <memset+0x194>
    1678:	16078163          	beqz	a5,17da <memset+0x184>
    167c:	00e50023          	sb	a4,0(a0)
    1680:	0066f593          	and	a1,a3,6
    1684:	14058e63          	beqz	a1,17e0 <memset+0x18a>
    1688:	00e500a3          	sb	a4,1(a0)
    168c:	4589                	li	a1,2
    168e:	00250813          	add	a6,a0,2
    1692:	04f5f663          	bgeu	a1,a5,16de <memset+0x88>
    1696:	00e50123          	sb	a4,2(a0)
    169a:	8a91                	and	a3,a3,4
    169c:	00350813          	add	a6,a0,3
    16a0:	458d                	li	a1,3
    16a2:	ce95                	beqz	a3,16de <memset+0x88>
    16a4:	00e501a3          	sb	a4,3(a0)
    16a8:	4691                	li	a3,4
    16aa:	00450813          	add	a6,a0,4
    16ae:	4591                	li	a1,4
    16b0:	02f6f763          	bgeu	a3,a5,16de <memset+0x88>
    16b4:	00e50223          	sb	a4,4(a0)
    16b8:	4695                	li	a3,5
    16ba:	00550813          	add	a6,a0,5
    16be:	4595                	li	a1,5
    16c0:	00d78f63          	beq	a5,a3,16de <memset+0x88>
    16c4:	00e502a3          	sb	a4,5(a0)
    16c8:	469d                	li	a3,7
    16ca:	00650813          	add	a6,a0,6
    16ce:	4599                	li	a1,6
    16d0:	00d79763          	bne	a5,a3,16de <memset+0x88>
    16d4:	00750813          	add	a6,a0,7
    16d8:	00e50323          	sb	a4,6(a0)
    16dc:	459d                	li	a1,7
    16de:	00871693          	sll	a3,a4,0x8
    16e2:	01071313          	sll	t1,a4,0x10
    16e6:	8ed9                	or	a3,a3,a4
    16e8:	01871893          	sll	a7,a4,0x18
    16ec:	0066e6b3          	or	a3,a3,t1
    16f0:	0116e6b3          	or	a3,a3,a7
    16f4:	02071313          	sll	t1,a4,0x20
    16f8:	02871893          	sll	a7,a4,0x28
    16fc:	0066e6b3          	or	a3,a3,t1
    1700:	40f60e33          	sub	t3,a2,a5
    1704:	03071313          	sll	t1,a4,0x30
    1708:	0116e6b3          	or	a3,a3,a7
    170c:	0066e6b3          	or	a3,a3,t1
    1710:	03871893          	sll	a7,a4,0x38
    1714:	97aa                	add	a5,a5,a0
    1716:	ff8e7313          	and	t1,t3,-8
    171a:	0116e6b3          	or	a3,a3,a7
    171e:	00f308b3          	add	a7,t1,a5
    1722:	e394                	sd	a3,0(a5)
    1724:	07a1                	add	a5,a5,8
    1726:	ff179ee3          	bne	a5,a7,1722 <memset+0xcc>
    172a:	006806b3          	add	a3,a6,t1
    172e:	00b307bb          	addw	a5,t1,a1
    1732:	0bc30b63          	beq	t1,t3,17e8 <memset+0x192>
    1736:	00e68023          	sb	a4,0(a3)
    173a:	0017859b          	addw	a1,a5,1
    173e:	08c5fb63          	bgeu	a1,a2,17d4 <memset+0x17e>
    1742:	00e680a3          	sb	a4,1(a3)
    1746:	0027859b          	addw	a1,a5,2
    174a:	08c5f563          	bgeu	a1,a2,17d4 <memset+0x17e>
    174e:	00e68123          	sb	a4,2(a3)
    1752:	0037859b          	addw	a1,a5,3
    1756:	06c5ff63          	bgeu	a1,a2,17d4 <memset+0x17e>
    175a:	00e681a3          	sb	a4,3(a3)
    175e:	0047859b          	addw	a1,a5,4
    1762:	06c5f963          	bgeu	a1,a2,17d4 <memset+0x17e>
    1766:	00e68223          	sb	a4,4(a3)
    176a:	0057859b          	addw	a1,a5,5
    176e:	06c5f363          	bgeu	a1,a2,17d4 <memset+0x17e>
    1772:	00e682a3          	sb	a4,5(a3)
    1776:	0067859b          	addw	a1,a5,6
    177a:	04c5fd63          	bgeu	a1,a2,17d4 <memset+0x17e>
    177e:	00e68323          	sb	a4,6(a3)
    1782:	0077859b          	addw	a1,a5,7
    1786:	04c5f763          	bgeu	a1,a2,17d4 <memset+0x17e>
    178a:	00e683a3          	sb	a4,7(a3)
    178e:	0087859b          	addw	a1,a5,8
    1792:	04c5f163          	bgeu	a1,a2,17d4 <memset+0x17e>
    1796:	00e68423          	sb	a4,8(a3)
    179a:	0097859b          	addw	a1,a5,9
    179e:	02c5fb63          	bgeu	a1,a2,17d4 <memset+0x17e>
    17a2:	00e684a3          	sb	a4,9(a3)
    17a6:	00a7859b          	addw	a1,a5,10
    17aa:	02c5f563          	bgeu	a1,a2,17d4 <memset+0x17e>
    17ae:	00e68523          	sb	a4,10(a3)
    17b2:	00b7859b          	addw	a1,a5,11
    17b6:	00c5ff63          	bgeu	a1,a2,17d4 <memset+0x17e>
    17ba:	00e685a3          	sb	a4,11(a3)
    17be:	00c7859b          	addw	a1,a5,12
    17c2:	00c5f963          	bgeu	a1,a2,17d4 <memset+0x17e>
    17c6:	00e68623          	sb	a4,12(a3)
    17ca:	27b5                	addw	a5,a5,13
    17cc:	00c7f463          	bgeu	a5,a2,17d4 <memset+0x17e>
    17d0:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17d4:	8082                	ret
    17d6:	482d                	li	a6,11
    17d8:	bd71                	j	1674 <memset+0x1e>
    char *p = dest;
    17da:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17dc:	4581                	li	a1,0
    17de:	b701                	j	16de <memset+0x88>
    17e0:	00150813          	add	a6,a0,1
    17e4:	4585                	li	a1,1
    17e6:	bde5                	j	16de <memset+0x88>
    17e8:	8082                	ret
    char *p = dest;
    17ea:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17ec:	4781                	li	a5,0
    17ee:	b7a1                	j	1736 <memset+0xe0>

00000000000017f0 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17f0:	00054783          	lbu	a5,0(a0)
    17f4:	0005c703          	lbu	a4,0(a1)
    17f8:	00e79863          	bne	a5,a4,1808 <strcmp+0x18>
    17fc:	0505                	add	a0,a0,1
    17fe:	0585                	add	a1,a1,1
    1800:	fbe5                	bnez	a5,17f0 <strcmp>
    1802:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1804:	9d19                	subw	a0,a0,a4
    1806:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1808:	0007851b          	sext.w	a0,a5
    180c:	bfe5                	j	1804 <strcmp+0x14>

000000000000180e <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    180e:	ca15                	beqz	a2,1842 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1810:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1814:	167d                	add	a2,a2,-1
    1816:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    181a:	eb99                	bnez	a5,1830 <strncmp+0x22>
    181c:	a815                	j	1850 <strncmp+0x42>
    181e:	00a68e63          	beq	a3,a0,183a <strncmp+0x2c>
    1822:	0505                	add	a0,a0,1
    1824:	00f71b63          	bne	a4,a5,183a <strncmp+0x2c>
    1828:	00054783          	lbu	a5,0(a0)
    182c:	cf89                	beqz	a5,1846 <strncmp+0x38>
    182e:	85b2                	mv	a1,a2
    1830:	0005c703          	lbu	a4,0(a1)
    1834:	00158613          	add	a2,a1,1
    1838:	f37d                	bnez	a4,181e <strncmp+0x10>
        ;
    return *l - *r;
    183a:	0007851b          	sext.w	a0,a5
    183e:	9d19                	subw	a0,a0,a4
    1840:	8082                	ret
        return 0;
    1842:	4501                	li	a0,0
}
    1844:	8082                	ret
    return *l - *r;
    1846:	0015c703          	lbu	a4,1(a1)
    184a:	4501                	li	a0,0
    184c:	9d19                	subw	a0,a0,a4
    184e:	8082                	ret
    1850:	0005c703          	lbu	a4,0(a1)
    1854:	4501                	li	a0,0
    1856:	b7e5                	j	183e <strncmp+0x30>

0000000000001858 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1858:	00757793          	and	a5,a0,7
    185c:	cf89                	beqz	a5,1876 <strlen+0x1e>
    185e:	87aa                	mv	a5,a0
    1860:	a029                	j	186a <strlen+0x12>
    1862:	0785                	add	a5,a5,1
    1864:	0077f713          	and	a4,a5,7
    1868:	cb01                	beqz	a4,1878 <strlen+0x20>
        if (!*s)
    186a:	0007c703          	lbu	a4,0(a5)
    186e:	fb75                	bnez	a4,1862 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1870:	40a78533          	sub	a0,a5,a0
}
    1874:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1876:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1878:	feff05b7          	lui	a1,0xfeff0
    187c:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedf8f>
    1880:	f0101637          	lui	a2,0xf0101
    1884:	05c2                	sll	a1,a1,0x10
    1886:	0612                	sll	a2,a2,0x4
    1888:	6394                	ld	a3,0(a5)
    188a:	eff58593          	add	a1,a1,-257
    188e:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff191>
    1892:	05c2                	sll	a1,a1,0x10
    1894:	0642                	sll	a2,a2,0x10
    1896:	eff58593          	add	a1,a1,-257
    189a:	10160613          	add	a2,a2,257
    189e:	00b68733          	add	a4,a3,a1
    18a2:	063e                	sll	a2,a2,0xf
    18a4:	fff6c693          	not	a3,a3
    18a8:	8f75                	and	a4,a4,a3
    18aa:	08060613          	add	a2,a2,128
    18ae:	8f71                	and	a4,a4,a2
    18b0:	eb11                	bnez	a4,18c4 <strlen+0x6c>
    18b2:	6794                	ld	a3,8(a5)
    18b4:	07a1                	add	a5,a5,8
    18b6:	00b68733          	add	a4,a3,a1
    18ba:	fff6c693          	not	a3,a3
    18be:	8f75                	and	a4,a4,a3
    18c0:	8f71                	and	a4,a4,a2
    18c2:	db65                	beqz	a4,18b2 <strlen+0x5a>
    for (; *s; s++)
    18c4:	0007c703          	lbu	a4,0(a5)
    18c8:	d745                	beqz	a4,1870 <strlen+0x18>
    18ca:	0017c703          	lbu	a4,1(a5)
    18ce:	0785                	add	a5,a5,1
    18d0:	d345                	beqz	a4,1870 <strlen+0x18>
    18d2:	0017c703          	lbu	a4,1(a5)
    18d6:	0785                	add	a5,a5,1
    18d8:	fb6d                	bnez	a4,18ca <strlen+0x72>
    18da:	bf59                	j	1870 <strlen+0x18>

00000000000018dc <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18dc:	00757713          	and	a4,a0,7
{
    18e0:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18e2:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18e6:	cb19                	beqz	a4,18fc <memchr+0x20>
    18e8:	ce59                	beqz	a2,1986 <memchr+0xaa>
    18ea:	0007c703          	lbu	a4,0(a5)
    18ee:	00b70963          	beq	a4,a1,1900 <memchr+0x24>
    18f2:	0785                	add	a5,a5,1
    18f4:	0077f713          	and	a4,a5,7
    18f8:	167d                	add	a2,a2,-1
    18fa:	f77d                	bnez	a4,18e8 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18fc:	4501                	li	a0,0
    if (n && *s != c)
    18fe:	c649                	beqz	a2,1988 <memchr+0xac>
    1900:	0007c703          	lbu	a4,0(a5)
    1904:	06b70663          	beq	a4,a1,1970 <memchr+0x94>
        size_t k = ONES * c;
    1908:	01010737          	lui	a4,0x1010
    190c:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e191>
    1910:	0742                	sll	a4,a4,0x10
    1912:	10170713          	add	a4,a4,257
    1916:	0742                	sll	a4,a4,0x10
    1918:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    191c:	469d                	li	a3,7
        size_t k = ONES * c;
    191e:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1922:	04c6f763          	bgeu	a3,a2,1970 <memchr+0x94>
    1926:	f0101837          	lui	a6,0xf0101
    192a:	feff08b7          	lui	a7,0xfeff0
    192e:	0812                	sll	a6,a6,0x4
    1930:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedf8f>
    1934:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff191>
    1938:	08c2                	sll	a7,a7,0x10
    193a:	0842                	sll	a6,a6,0x10
    193c:	eff88893          	add	a7,a7,-257
    1940:	10180813          	add	a6,a6,257
    1944:	08c2                	sll	a7,a7,0x10
    1946:	083e                	sll	a6,a6,0xf
    1948:	eff88893          	add	a7,a7,-257
    194c:	08080813          	add	a6,a6,128
    1950:	431d                	li	t1,7
    1952:	a029                	j	195c <memchr+0x80>
    1954:	1661                	add	a2,a2,-8
    1956:	07a1                	add	a5,a5,8
    1958:	02c37663          	bgeu	t1,a2,1984 <memchr+0xa8>
    195c:	6398                	ld	a4,0(a5)
    195e:	8f29                	xor	a4,a4,a0
    1960:	011706b3          	add	a3,a4,a7
    1964:	fff74713          	not	a4,a4
    1968:	8f75                	and	a4,a4,a3
    196a:	01077733          	and	a4,a4,a6
    196e:	d37d                	beqz	a4,1954 <memchr+0x78>
        s = (const void *)w;
    1970:	853e                	mv	a0,a5
    1972:	a019                	j	1978 <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    1974:	0505                	add	a0,a0,1
    1976:	ca01                	beqz	a2,1986 <memchr+0xaa>
    1978:	00054783          	lbu	a5,0(a0)
    197c:	167d                	add	a2,a2,-1
    197e:	feb79be3          	bne	a5,a1,1974 <memchr+0x98>
    1982:	8082                	ret
    1984:	f675                	bnez	a2,1970 <memchr+0x94>
    return n ? (void *)s : 0;
    1986:	4501                	li	a0,0
}
    1988:	8082                	ret

000000000000198a <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    198a:	1101                	add	sp,sp,-32
    198c:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    198e:	862e                	mv	a2,a1
{
    1990:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1992:	4581                	li	a1,0
{
    1994:	e426                	sd	s1,8(sp)
    1996:	ec06                	sd	ra,24(sp)
    1998:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    199a:	f43ff0ef          	jal	18dc <memchr>
    return p ? p - s : n;
    199e:	c519                	beqz	a0,19ac <strnlen+0x22>
}
    19a0:	60e2                	ld	ra,24(sp)
    19a2:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19a4:	8d05                	sub	a0,a0,s1
}
    19a6:	64a2                	ld	s1,8(sp)
    19a8:	6105                	add	sp,sp,32
    19aa:	8082                	ret
    19ac:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19ae:	8522                	mv	a0,s0
}
    19b0:	6442                	ld	s0,16(sp)
    19b2:	64a2                	ld	s1,8(sp)
    19b4:	6105                	add	sp,sp,32
    19b6:	8082                	ret

00000000000019b8 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19b8:	00b547b3          	xor	a5,a0,a1
    19bc:	8b9d                	and	a5,a5,7
    19be:	efb1                	bnez	a5,1a1a <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19c0:	0075f793          	and	a5,a1,7
    19c4:	ebb5                	bnez	a5,1a38 <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19c6:	feff0637          	lui	a2,0xfeff0
    19ca:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedf8f>
    19ce:	f01016b7          	lui	a3,0xf0101
    19d2:	0642                	sll	a2,a2,0x10
    19d4:	0692                	sll	a3,a3,0x4
    19d6:	6198                	ld	a4,0(a1)
    19d8:	eff60613          	add	a2,a2,-257
    19dc:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff191>
    19e0:	0642                	sll	a2,a2,0x10
    19e2:	06c2                	sll	a3,a3,0x10
    19e4:	eff60613          	add	a2,a2,-257
    19e8:	10168693          	add	a3,a3,257
    19ec:	00c707b3          	add	a5,a4,a2
    19f0:	fff74813          	not	a6,a4
    19f4:	06be                	sll	a3,a3,0xf
    19f6:	0107f7b3          	and	a5,a5,a6
    19fa:	08068693          	add	a3,a3,128
    19fe:	8ff5                	and	a5,a5,a3
    1a00:	ef89                	bnez	a5,1a1a <strcpy+0x62>
    1a02:	05a1                	add	a1,a1,8
    1a04:	e118                	sd	a4,0(a0)
    1a06:	6198                	ld	a4,0(a1)
    1a08:	0521                	add	a0,a0,8
    1a0a:	00c707b3          	add	a5,a4,a2
    1a0e:	fff74813          	not	a6,a4
    1a12:	0107f7b3          	and	a5,a5,a6
    1a16:	8ff5                	and	a5,a5,a3
    1a18:	d7ed                	beqz	a5,1a02 <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a1a:	0005c783          	lbu	a5,0(a1)
    1a1e:	00f50023          	sb	a5,0(a0)
    1a22:	c785                	beqz	a5,1a4a <strcpy+0x92>
    1a24:	0015c783          	lbu	a5,1(a1)
    1a28:	0505                	add	a0,a0,1
    1a2a:	0585                	add	a1,a1,1
    1a2c:	00f50023          	sb	a5,0(a0)
    1a30:	fbf5                	bnez	a5,1a24 <strcpy+0x6c>
        ;
    return d;
}
    1a32:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a34:	0505                	add	a0,a0,1
    1a36:	db41                	beqz	a4,19c6 <strcpy+0xe>
            if (!(*d = *s))
    1a38:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a3c:	0585                	add	a1,a1,1
    1a3e:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a42:	00f50023          	sb	a5,0(a0)
    1a46:	f7fd                	bnez	a5,1a34 <strcpy+0x7c>
}
    1a48:	8082                	ret
    1a4a:	8082                	ret

0000000000001a4c <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a4c:	00b547b3          	xor	a5,a0,a1
    1a50:	8b9d                	and	a5,a5,7
    1a52:	efbd                	bnez	a5,1ad0 <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a54:	0075f793          	and	a5,a1,7
    1a58:	1c078563          	beqz	a5,1c22 <strncpy+0x1d6>
    1a5c:	ea11                	bnez	a2,1a70 <strncpy+0x24>
    1a5e:	8082                	ret
    1a60:	0585                	add	a1,a1,1
    1a62:	0075f793          	and	a5,a1,7
    1a66:	167d                	add	a2,a2,-1
    1a68:	0505                	add	a0,a0,1
    1a6a:	1a078c63          	beqz	a5,1c22 <strncpy+0x1d6>
    1a6e:	ca3d                	beqz	a2,1ae4 <strncpy+0x98>
    1a70:	0005c783          	lbu	a5,0(a1)
    1a74:	00f50023          	sb	a5,0(a0)
    1a78:	f7e5                	bnez	a5,1a60 <strncpy+0x14>
            ;
        if (!n || !*s)
    1a7a:	0005c783          	lbu	a5,0(a1)
    1a7e:	c7a5                	beqz	a5,1ae6 <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a80:	479d                	li	a5,7
    1a82:	04c7f863          	bgeu	a5,a2,1ad2 <strncpy+0x86>
    1a86:	f01016b7          	lui	a3,0xf0101
    1a8a:	feff0837          	lui	a6,0xfeff0
    1a8e:	0692                	sll	a3,a3,0x4
    1a90:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedf8f>
    1a94:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff191>
    1a98:	0842                	sll	a6,a6,0x10
    1a9a:	06c2                	sll	a3,a3,0x10
    1a9c:	eff80813          	add	a6,a6,-257
    1aa0:	10168693          	add	a3,a3,257
    1aa4:	0842                	sll	a6,a6,0x10
    1aa6:	06be                	sll	a3,a3,0xf
    1aa8:	eff80813          	add	a6,a6,-257
    1aac:	08068693          	add	a3,a3,128
    1ab0:	431d                	li	t1,7
    1ab2:	6198                	ld	a4,0(a1)
    1ab4:	010707b3          	add	a5,a4,a6
    1ab8:	fff74893          	not	a7,a4
    1abc:	0117f7b3          	and	a5,a5,a7
    1ac0:	8ff5                	and	a5,a5,a3
    1ac2:	eb81                	bnez	a5,1ad2 <strncpy+0x86>
            *wd = *ws;
    1ac4:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ac6:	1661                	add	a2,a2,-8
    1ac8:	05a1                	add	a1,a1,8
    1aca:	0521                	add	a0,a0,8
    1acc:	fec363e3          	bltu	t1,a2,1ab2 <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1ad0:	ca11                	beqz	a2,1ae4 <strncpy+0x98>
    1ad2:	0005c783          	lbu	a5,0(a1)
    1ad6:	0585                	add	a1,a1,1
    1ad8:	00f50023          	sb	a5,0(a0)
    1adc:	c789                	beqz	a5,1ae6 <strncpy+0x9a>
    1ade:	167d                	add	a2,a2,-1
    1ae0:	0505                	add	a0,a0,1
    1ae2:	fa65                	bnez	a2,1ad2 <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1ae4:	8082                	ret
    1ae6:	40a00733          	neg	a4,a0
    1aea:	00777793          	and	a5,a4,7
    1aee:	00778693          	add	a3,a5,7
    1af2:	482d                	li	a6,11
    1af4:	fff60593          	add	a1,a2,-1
    1af8:	1106ef63          	bltu	a3,a6,1c16 <strncpy+0x1ca>
    1afc:	12d5ee63          	bltu	a1,a3,1c38 <strncpy+0x1ec>
    1b00:	12078563          	beqz	a5,1c2a <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b04:	00050023          	sb	zero,0(a0)
    1b08:	00677693          	and	a3,a4,6
    1b0c:	12068263          	beqz	a3,1c30 <strncpy+0x1e4>
    1b10:	000500a3          	sb	zero,1(a0)
    1b14:	4689                	li	a3,2
    1b16:	12f6f463          	bgeu	a3,a5,1c3e <strncpy+0x1f2>
    1b1a:	00050123          	sb	zero,2(a0)
    1b1e:	8b11                	and	a4,a4,4
    1b20:	cf6d                	beqz	a4,1c1a <strncpy+0x1ce>
    1b22:	000501a3          	sb	zero,3(a0)
    1b26:	4711                	li	a4,4
    1b28:	00450693          	add	a3,a0,4
    1b2c:	02f77363          	bgeu	a4,a5,1b52 <strncpy+0x106>
    1b30:	00050223          	sb	zero,4(a0)
    1b34:	4715                	li	a4,5
    1b36:	00550693          	add	a3,a0,5
    1b3a:	00e78c63          	beq	a5,a4,1b52 <strncpy+0x106>
    1b3e:	000502a3          	sb	zero,5(a0)
    1b42:	471d                	li	a4,7
    1b44:	10e79163          	bne	a5,a4,1c46 <strncpy+0x1fa>
    1b48:	00750693          	add	a3,a0,7
    1b4c:	00050323          	sb	zero,6(a0)
    1b50:	471d                	li	a4,7
    1b52:	40f608b3          	sub	a7,a2,a5
    1b56:	ff88f813          	and	a6,a7,-8
    1b5a:	97aa                	add	a5,a5,a0
    1b5c:	010785b3          	add	a1,a5,a6
    1b60:	0007b023          	sd	zero,0(a5)
    1b64:	07a1                	add	a5,a5,8
    1b66:	feb79de3          	bne	a5,a1,1b60 <strncpy+0x114>
    1b6a:	00e807bb          	addw	a5,a6,a4
    1b6e:	01068733          	add	a4,a3,a6
    1b72:	0b088b63          	beq	a7,a6,1c28 <strncpy+0x1dc>
    1b76:	00070023          	sb	zero,0(a4)
    1b7a:	0017869b          	addw	a3,a5,1
    1b7e:	f6c6f3e3          	bgeu	a3,a2,1ae4 <strncpy+0x98>
    1b82:	000700a3          	sb	zero,1(a4)
    1b86:	0027869b          	addw	a3,a5,2
    1b8a:	f4c6fde3          	bgeu	a3,a2,1ae4 <strncpy+0x98>
    1b8e:	00070123          	sb	zero,2(a4)
    1b92:	0037869b          	addw	a3,a5,3
    1b96:	f4c6f7e3          	bgeu	a3,a2,1ae4 <strncpy+0x98>
    1b9a:	000701a3          	sb	zero,3(a4)
    1b9e:	0047869b          	addw	a3,a5,4
    1ba2:	f4c6f1e3          	bgeu	a3,a2,1ae4 <strncpy+0x98>
    1ba6:	00070223          	sb	zero,4(a4)
    1baa:	0057869b          	addw	a3,a5,5
    1bae:	f2c6fbe3          	bgeu	a3,a2,1ae4 <strncpy+0x98>
    1bb2:	000702a3          	sb	zero,5(a4)
    1bb6:	0067869b          	addw	a3,a5,6
    1bba:	f2c6f5e3          	bgeu	a3,a2,1ae4 <strncpy+0x98>
    1bbe:	00070323          	sb	zero,6(a4)
    1bc2:	0077869b          	addw	a3,a5,7
    1bc6:	f0c6ffe3          	bgeu	a3,a2,1ae4 <strncpy+0x98>
    1bca:	000703a3          	sb	zero,7(a4)
    1bce:	0087869b          	addw	a3,a5,8
    1bd2:	f0c6f9e3          	bgeu	a3,a2,1ae4 <strncpy+0x98>
    1bd6:	00070423          	sb	zero,8(a4)
    1bda:	0097869b          	addw	a3,a5,9
    1bde:	f0c6f3e3          	bgeu	a3,a2,1ae4 <strncpy+0x98>
    1be2:	000704a3          	sb	zero,9(a4)
    1be6:	00a7869b          	addw	a3,a5,10
    1bea:	eec6fde3          	bgeu	a3,a2,1ae4 <strncpy+0x98>
    1bee:	00070523          	sb	zero,10(a4)
    1bf2:	00b7869b          	addw	a3,a5,11
    1bf6:	eec6f7e3          	bgeu	a3,a2,1ae4 <strncpy+0x98>
    1bfa:	000705a3          	sb	zero,11(a4)
    1bfe:	00c7869b          	addw	a3,a5,12
    1c02:	eec6f1e3          	bgeu	a3,a2,1ae4 <strncpy+0x98>
    1c06:	00070623          	sb	zero,12(a4)
    1c0a:	27b5                	addw	a5,a5,13
    1c0c:	ecc7fce3          	bgeu	a5,a2,1ae4 <strncpy+0x98>
    1c10:	000706a3          	sb	zero,13(a4)
}
    1c14:	8082                	ret
    1c16:	46ad                	li	a3,11
    1c18:	b5d5                	j	1afc <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c1a:	00350693          	add	a3,a0,3
    1c1e:	470d                	li	a4,3
    1c20:	bf0d                	j	1b52 <strncpy+0x106>
        if (!n || !*s)
    1c22:	e4061ce3          	bnez	a2,1a7a <strncpy+0x2e>
}
    1c26:	8082                	ret
    1c28:	8082                	ret
    char *p = dest;
    1c2a:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c2c:	4701                	li	a4,0
    1c2e:	b715                	j	1b52 <strncpy+0x106>
    1c30:	00150693          	add	a3,a0,1
    1c34:	4705                	li	a4,1
    1c36:	bf31                	j	1b52 <strncpy+0x106>
    char *p = dest;
    1c38:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c3a:	4781                	li	a5,0
    1c3c:	bf2d                	j	1b76 <strncpy+0x12a>
    1c3e:	00250693          	add	a3,a0,2
    1c42:	4709                	li	a4,2
    1c44:	b739                	j	1b52 <strncpy+0x106>
    1c46:	00650693          	add	a3,a0,6
    1c4a:	4719                	li	a4,6
    1c4c:	b719                	j	1b52 <strncpy+0x106>

0000000000001c4e <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c4e:	87aa                	mv	a5,a0
    1c50:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c52:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c56:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c5a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c5c:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c5e:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c62:	2501                	sext.w	a0,a0
    1c64:	8082                	ret

0000000000001c66 <openat>:
    register long a7 __asm__("a7") = n;
    1c66:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c6a:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c6e:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c72:	2501                	sext.w	a0,a0
    1c74:	8082                	ret

0000000000001c76 <close>:
    register long a7 __asm__("a7") = n;
    1c76:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c7a:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c7e:	2501                	sext.w	a0,a0
    1c80:	8082                	ret

0000000000001c82 <read>:
    register long a7 __asm__("a7") = n;
    1c82:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c86:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c8a:	8082                	ret

0000000000001c8c <write>:
    register long a7 __asm__("a7") = n;
    1c8c:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c90:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c94:	8082                	ret

0000000000001c96 <getpid>:
    register long a7 __asm__("a7") = n;
    1c96:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c9a:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c9e:	2501                	sext.w	a0,a0
    1ca0:	8082                	ret

0000000000001ca2 <getppid>:
    register long a7 __asm__("a7") = n;
    1ca2:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1ca6:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1caa:	2501                	sext.w	a0,a0
    1cac:	8082                	ret

0000000000001cae <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cae:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cb2:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cb6:	2501                	sext.w	a0,a0
    1cb8:	8082                	ret

0000000000001cba <fork>:
    register long a7 __asm__("a7") = n;
    1cba:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cbe:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cc0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cc2:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cc6:	2501                	sext.w	a0,a0
    1cc8:	8082                	ret

0000000000001cca <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cca:	85b2                	mv	a1,a2
    1ccc:	863a                	mv	a2,a4
    if (stack)
    1cce:	c191                	beqz	a1,1cd2 <clone+0x8>
	stack += stack_size;
    1cd0:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cd2:	4781                	li	a5,0
    1cd4:	4701                	li	a4,0
    1cd6:	4681                	li	a3,0
    1cd8:	2601                	sext.w	a2,a2
    1cda:	a2ed                	j	1ec4 <__clone>

0000000000001cdc <exit>:
    register long a7 __asm__("a7") = n;
    1cdc:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1ce0:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1ce4:	8082                	ret

0000000000001ce6 <waitpid>:
    register long a7 __asm__("a7") = n;
    1ce6:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cea:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cec:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cf0:	2501                	sext.w	a0,a0
    1cf2:	8082                	ret

0000000000001cf4 <exec>:
    register long a7 __asm__("a7") = n;
    1cf4:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cf8:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cfc:	2501                	sext.w	a0,a0
    1cfe:	8082                	ret

0000000000001d00 <execve>:
    register long a7 __asm__("a7") = n;
    1d00:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d04:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d08:	2501                	sext.w	a0,a0
    1d0a:	8082                	ret

0000000000001d0c <times>:
    register long a7 __asm__("a7") = n;
    1d0c:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d10:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d14:	2501                	sext.w	a0,a0
    1d16:	8082                	ret

0000000000001d18 <get_time>:

int64 get_time()
{
    1d18:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d1a:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d1e:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d20:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d22:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d26:	2501                	sext.w	a0,a0
    1d28:	ed09                	bnez	a0,1d42 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d2a:	67a2                	ld	a5,8(sp)
    1d2c:	3e800713          	li	a4,1000
    1d30:	00015503          	lhu	a0,0(sp)
    1d34:	02e7d7b3          	divu	a5,a5,a4
    1d38:	02e50533          	mul	a0,a0,a4
    1d3c:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d3e:	0141                	add	sp,sp,16
    1d40:	8082                	ret
        return -1;
    1d42:	557d                	li	a0,-1
    1d44:	bfed                	j	1d3e <get_time+0x26>

0000000000001d46 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d46:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d4a:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d4e:	2501                	sext.w	a0,a0
    1d50:	8082                	ret

0000000000001d52 <time>:
    register long a7 __asm__("a7") = n;
    1d52:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d56:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d5a:	2501                	sext.w	a0,a0
    1d5c:	8082                	ret

0000000000001d5e <sleep>:

int sleep(unsigned long long time)
{
    1d5e:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d60:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d62:	850a                	mv	a0,sp
    1d64:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d66:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d6a:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d6c:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d70:	e501                	bnez	a0,1d78 <sleep+0x1a>
    return 0;
    1d72:	4501                	li	a0,0
}
    1d74:	0141                	add	sp,sp,16
    1d76:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d78:	4502                	lw	a0,0(sp)
}
    1d7a:	0141                	add	sp,sp,16
    1d7c:	8082                	ret

0000000000001d7e <set_priority>:
    register long a7 __asm__("a7") = n;
    1d7e:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d82:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d86:	2501                	sext.w	a0,a0
    1d88:	8082                	ret

0000000000001d8a <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d8a:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d8e:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d92:	8082                	ret

0000000000001d94 <munmap>:
    register long a7 __asm__("a7") = n;
    1d94:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d98:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d9c:	2501                	sext.w	a0,a0
    1d9e:	8082                	ret

0000000000001da0 <wait>:

int wait(int *code)
{
    1da0:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1da2:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1da6:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1da8:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1daa:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dac:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1db0:	2501                	sext.w	a0,a0
    1db2:	8082                	ret

0000000000001db4 <spawn>:
    register long a7 __asm__("a7") = n;
    1db4:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1db8:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dbc:	2501                	sext.w	a0,a0
    1dbe:	8082                	ret

0000000000001dc0 <mailread>:
    register long a7 __asm__("a7") = n;
    1dc0:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc4:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dc8:	2501                	sext.w	a0,a0
    1dca:	8082                	ret

0000000000001dcc <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dcc:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd0:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dd4:	2501                	sext.w	a0,a0
    1dd6:	8082                	ret

0000000000001dd8 <fstat>:
    register long a7 __asm__("a7") = n;
    1dd8:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ddc:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1de0:	2501                	sext.w	a0,a0
    1de2:	8082                	ret

0000000000001de4 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1de4:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1de6:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dea:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dec:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1df0:	2501                	sext.w	a0,a0
    1df2:	8082                	ret

0000000000001df4 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1df4:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1df6:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1dfa:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dfc:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e00:	2501                	sext.w	a0,a0
    1e02:	8082                	ret

0000000000001e04 <link>:

int link(char *old_path, char *new_path)
{
    1e04:	87aa                	mv	a5,a0
    1e06:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e08:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e0c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e10:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e12:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e16:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e18:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e1c:	2501                	sext.w	a0,a0
    1e1e:	8082                	ret

0000000000001e20 <unlink>:

int unlink(char *path)
{
    1e20:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e22:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e26:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e2a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e2c:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e30:	2501                	sext.w	a0,a0
    1e32:	8082                	ret

0000000000001e34 <uname>:
    register long a7 __asm__("a7") = n;
    1e34:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e38:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e3c:	2501                	sext.w	a0,a0
    1e3e:	8082                	ret

0000000000001e40 <brk>:
    register long a7 __asm__("a7") = n;
    1e40:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e44:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e48:	2501                	sext.w	a0,a0
    1e4a:	8082                	ret

0000000000001e4c <getcwd>:
    register long a7 __asm__("a7") = n;
    1e4c:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e4e:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e52:	8082                	ret

0000000000001e54 <chdir>:
    register long a7 __asm__("a7") = n;
    1e54:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e58:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e5c:	2501                	sext.w	a0,a0
    1e5e:	8082                	ret

0000000000001e60 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e60:	862e                	mv	a2,a1
    1e62:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e64:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e66:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e6a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e6e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e70:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e72:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e76:	2501                	sext.w	a0,a0
    1e78:	8082                	ret

0000000000001e7a <getdents>:
    register long a7 __asm__("a7") = n;
    1e7a:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e7e:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e82:	2501                	sext.w	a0,a0
    1e84:	8082                	ret

0000000000001e86 <pipe>:
    register long a7 __asm__("a7") = n;
    1e86:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e8a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e8c:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e90:	2501                	sext.w	a0,a0
    1e92:	8082                	ret

0000000000001e94 <dup>:
    register long a7 __asm__("a7") = n;
    1e94:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e96:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e9a:	2501                	sext.w	a0,a0
    1e9c:	8082                	ret

0000000000001e9e <dup2>:
    register long a7 __asm__("a7") = n;
    1e9e:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1ea0:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ea2:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ea6:	2501                	sext.w	a0,a0
    1ea8:	8082                	ret

0000000000001eaa <mount>:
    register long a7 __asm__("a7") = n;
    1eaa:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1eae:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1eb2:	2501                	sext.w	a0,a0
    1eb4:	8082                	ret

0000000000001eb6 <umount>:
    register long a7 __asm__("a7") = n;
    1eb6:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1eba:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ebc:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ec0:	2501                	sext.w	a0,a0
    1ec2:	8082                	ret

0000000000001ec4 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ec4:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1ec6:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ec8:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1eca:	8532                	mv	a0,a2
	mv a2, a4
    1ecc:	863a                	mv	a2,a4
	mv a3, a5
    1ece:	86be                	mv	a3,a5
	mv a4, a6
    1ed0:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ed2:	0dc00893          	li	a7,220
	ecall
    1ed6:	00000073          	ecall

	beqz a0, 1f
    1eda:	c111                	beqz	a0,1ede <__clone+0x1a>
	# Parent
	ret
    1edc:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ede:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ee0:	6522                	ld	a0,8(sp)
	jalr a1
    1ee2:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ee4:	05d00893          	li	a7,93
	ecall
    1ee8:	00000073          	ecall
