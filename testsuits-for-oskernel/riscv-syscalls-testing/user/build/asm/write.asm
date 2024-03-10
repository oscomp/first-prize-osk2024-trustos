
/home/windflower/Desktop/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/write:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a851                	j	1096 <__start_main>

0000000000001004 <test_write>:
#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"

void test_write(){
    1004:	1141                	add	sp,sp,-16
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	ed250513          	add	a0,a0,-302 # 1ed8 <__clone+0x2a>
void test_write(){
    100e:	e406                	sd	ra,8(sp)
    1010:	e022                	sd	s0,0(sp)
	TEST_START(__func__);
    1012:	2bc000ef          	jal	12ce <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	f4a50513          	add	a0,a0,-182 # 1f60 <__func__.0>
    101e:	2b0000ef          	jal	12ce <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	ece50513          	add	a0,a0,-306 # 1ef0 <__clone+0x42>
    102a:	2a4000ef          	jal	12ce <puts>
	const char *str = "Hello operating system contest.\n";
	int str_len = strlen(str);
    102e:	00001517          	auipc	a0,0x1
    1032:	ed250513          	add	a0,a0,-302 # 1f00 <__clone+0x52>
    1036:	00d000ef          	jal	1842 <strlen>
    103a:	0005041b          	sext.w	s0,a0
	assert(write(STDOUT, str, str_len) == str_len);
    103e:	8622                	mv	a2,s0
    1040:	00001597          	auipc	a1,0x1
    1044:	ec058593          	add	a1,a1,-320 # 1f00 <__clone+0x52>
    1048:	4505                	li	a0,1
    104a:	42d000ef          	jal	1c76 <write>
    104e:	00850863          	beq	a0,s0,105e <test_write+0x5a>
    1052:	00001517          	auipc	a0,0x1
    1056:	ed650513          	add	a0,a0,-298 # 1f28 <__clone+0x7a>
    105a:	514000ef          	jal	156e <panic>
	TEST_END(__func__);
    105e:	00001517          	auipc	a0,0x1
    1062:	eea50513          	add	a0,a0,-278 # 1f48 <__clone+0x9a>
    1066:	268000ef          	jal	12ce <puts>
    106a:	00001517          	auipc	a0,0x1
    106e:	ef650513          	add	a0,a0,-266 # 1f60 <__func__.0>
    1072:	25c000ef          	jal	12ce <puts>
}
    1076:	6402                	ld	s0,0(sp)
    1078:	60a2                	ld	ra,8(sp)
	TEST_END(__func__);
    107a:	00001517          	auipc	a0,0x1
    107e:	e7650513          	add	a0,a0,-394 # 1ef0 <__clone+0x42>
}
    1082:	0141                	add	sp,sp,16
	TEST_END(__func__);
    1084:	a4a9                	j	12ce <puts>

0000000000001086 <main>:

int main(void) {
    1086:	1141                	add	sp,sp,-16
    1088:	e406                	sd	ra,8(sp)
	test_write();
    108a:	f7bff0ef          	jal	1004 <test_write>
	return 0;
}
    108e:	60a2                	ld	ra,8(sp)
    1090:	4501                	li	a0,0
    1092:	0141                	add	sp,sp,16
    1094:	8082                	ret

0000000000001096 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1096:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1098:	4108                	lw	a0,0(a0)
{
    109a:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    109c:	05a1                	add	a1,a1,8
{
    109e:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10a0:	fe7ff0ef          	jal	1086 <main>
    10a4:	423000ef          	jal	1cc6 <exit>
	return 0;
}
    10a8:	60a2                	ld	ra,8(sp)
    10aa:	4501                	li	a0,0
    10ac:	0141                	add	sp,sp,16
    10ae:	8082                	ret

00000000000010b0 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10b0:	7179                	add	sp,sp,-48
    10b2:	f406                	sd	ra,40(sp)
    10b4:	0005081b          	sext.w	a6,a0
    10b8:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10ba:	00055563          	bgez	a0,10c4 <printint.constprop.0+0x14>
        x = -xx;
    10be:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    10c2:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10c4:	02b8763b          	remuw	a2,a6,a1
    10c8:	00001697          	auipc	a3,0x1
    10cc:	ea868693          	add	a3,a3,-344 # 1f70 <digits>
    buf[16] = 0;
    10d0:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10d4:	0005871b          	sext.w	a4,a1
    10d8:	1602                	sll	a2,a2,0x20
    10da:	9201                	srl	a2,a2,0x20
    10dc:	9636                	add	a2,a2,a3
    10de:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10e2:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    10e6:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    10ea:	10b86c63          	bltu	a6,a1,1202 <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    10ee:	02e5763b          	remuw	a2,a0,a4
    10f2:	1602                	sll	a2,a2,0x20
    10f4:	9201                	srl	a2,a2,0x20
    10f6:	9636                	add	a2,a2,a3
    10f8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10fc:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1100:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1104:	10e56863          	bltu	a0,a4,1214 <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    1108:	02e5f63b          	remuw	a2,a1,a4
    110c:	1602                	sll	a2,a2,0x20
    110e:	9201                	srl	a2,a2,0x20
    1110:	9636                	add	a2,a2,a3
    1112:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1116:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    111a:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    111e:	10e5e463          	bltu	a1,a4,1226 <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    1122:	02e5763b          	remuw	a2,a0,a4
    1126:	1602                	sll	a2,a2,0x20
    1128:	9201                	srl	a2,a2,0x20
    112a:	9636                	add	a2,a2,a3
    112c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1130:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1134:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1138:	10e56063          	bltu	a0,a4,1238 <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    113c:	02e5f63b          	remuw	a2,a1,a4
    1140:	1602                	sll	a2,a2,0x20
    1142:	9201                	srl	a2,a2,0x20
    1144:	9636                	add	a2,a2,a3
    1146:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    114a:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    114e:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1152:	0ee5ec63          	bltu	a1,a4,124a <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    1156:	02e5763b          	remuw	a2,a0,a4
    115a:	1602                	sll	a2,a2,0x20
    115c:	9201                	srl	a2,a2,0x20
    115e:	9636                	add	a2,a2,a3
    1160:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1164:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1168:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    116c:	08e56263          	bltu	a0,a4,11f0 <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    1170:	02e5f63b          	remuw	a2,a1,a4
    1174:	1602                	sll	a2,a2,0x20
    1176:	9201                	srl	a2,a2,0x20
    1178:	9636                	add	a2,a2,a3
    117a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    117e:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1182:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1186:	0ce5eb63          	bltu	a1,a4,125c <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    118a:	02e5763b          	remuw	a2,a0,a4
    118e:	1602                	sll	a2,a2,0x20
    1190:	9201                	srl	a2,a2,0x20
    1192:	9636                	add	a2,a2,a3
    1194:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1198:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    119c:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11a0:	0ce56763          	bltu	a0,a4,126e <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    11a4:	02e5f63b          	remuw	a2,a1,a4
    11a8:	1602                	sll	a2,a2,0x20
    11aa:	9201                	srl	a2,a2,0x20
    11ac:	9636                	add	a2,a2,a3
    11ae:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b2:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11b6:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11ba:	0ce5e363          	bltu	a1,a4,1280 <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    11be:	1782                	sll	a5,a5,0x20
    11c0:	9381                	srl	a5,a5,0x20
    11c2:	96be                	add	a3,a3,a5
    11c4:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    11c8:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    11ca:	00f10723          	sb	a5,14(sp)
    if (sign)
    11ce:	00088763          	beqz	a7,11dc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11d2:	02d00793          	li	a5,45
    11d6:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11da:	4595                	li	a1,5
    write(f, s, l);
    11dc:	003c                	add	a5,sp,8
    11de:	4641                	li	a2,16
    11e0:	9e0d                	subw	a2,a2,a1
    11e2:	4505                	li	a0,1
    11e4:	95be                	add	a1,a1,a5
    11e6:	291000ef          	jal	1c76 <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11ea:	70a2                	ld	ra,40(sp)
    11ec:	6145                	add	sp,sp,48
    11ee:	8082                	ret
    i++;
    11f0:	45a9                	li	a1,10
    if (sign)
    11f2:	fe0885e3          	beqz	a7,11dc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11f6:	02d00793          	li	a5,45
    11fa:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    11fe:	45a5                	li	a1,9
    1200:	bff1                	j	11dc <printint.constprop.0+0x12c>
    i++;
    1202:	45bd                	li	a1,15
    if (sign)
    1204:	fc088ce3          	beqz	a7,11dc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1208:	02d00793          	li	a5,45
    120c:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1210:	45b9                	li	a1,14
    1212:	b7e9                	j	11dc <printint.constprop.0+0x12c>
    i++;
    1214:	45b9                	li	a1,14
    if (sign)
    1216:	fc0883e3          	beqz	a7,11dc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    121a:	02d00793          	li	a5,45
    121e:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1222:	45b5                	li	a1,13
    1224:	bf65                	j	11dc <printint.constprop.0+0x12c>
    i++;
    1226:	45b5                	li	a1,13
    if (sign)
    1228:	fa088ae3          	beqz	a7,11dc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    122c:	02d00793          	li	a5,45
    1230:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1234:	45b1                	li	a1,12
    1236:	b75d                	j	11dc <printint.constprop.0+0x12c>
    i++;
    1238:	45b1                	li	a1,12
    if (sign)
    123a:	fa0881e3          	beqz	a7,11dc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    123e:	02d00793          	li	a5,45
    1242:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1246:	45ad                	li	a1,11
    1248:	bf51                	j	11dc <printint.constprop.0+0x12c>
    i++;
    124a:	45ad                	li	a1,11
    if (sign)
    124c:	f80888e3          	beqz	a7,11dc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1250:	02d00793          	li	a5,45
    1254:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1258:	45a9                	li	a1,10
    125a:	b749                	j	11dc <printint.constprop.0+0x12c>
    i++;
    125c:	45a5                	li	a1,9
    if (sign)
    125e:	f6088fe3          	beqz	a7,11dc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1262:	02d00793          	li	a5,45
    1266:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    126a:	45a1                	li	a1,8
    126c:	bf85                	j	11dc <printint.constprop.0+0x12c>
    i++;
    126e:	45a1                	li	a1,8
    if (sign)
    1270:	f60886e3          	beqz	a7,11dc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1274:	02d00793          	li	a5,45
    1278:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    127c:	459d                	li	a1,7
    127e:	bfb9                	j	11dc <printint.constprop.0+0x12c>
    i++;
    1280:	459d                	li	a1,7
    if (sign)
    1282:	f4088de3          	beqz	a7,11dc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1286:	02d00793          	li	a5,45
    128a:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    128e:	4599                	li	a1,6
    1290:	b7b1                	j	11dc <printint.constprop.0+0x12c>

0000000000001292 <getchar>:
{
    1292:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    1294:	00f10593          	add	a1,sp,15
    1298:	4605                	li	a2,1
    129a:	4501                	li	a0,0
{
    129c:	ec06                	sd	ra,24(sp)
    char byte = 0;
    129e:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12a2:	1cb000ef          	jal	1c6c <read>
}
    12a6:	60e2                	ld	ra,24(sp)
    12a8:	00f14503          	lbu	a0,15(sp)
    12ac:	6105                	add	sp,sp,32
    12ae:	8082                	ret

00000000000012b0 <putchar>:
{
    12b0:	1101                	add	sp,sp,-32
    12b2:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12b4:	00f10593          	add	a1,sp,15
    12b8:	4605                	li	a2,1
    12ba:	4505                	li	a0,1
{
    12bc:	ec06                	sd	ra,24(sp)
    char byte = c;
    12be:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12c2:	1b5000ef          	jal	1c76 <write>
}
    12c6:	60e2                	ld	ra,24(sp)
    12c8:	2501                	sext.w	a0,a0
    12ca:	6105                	add	sp,sp,32
    12cc:	8082                	ret

00000000000012ce <puts>:
{
    12ce:	1141                	add	sp,sp,-16
    12d0:	e406                	sd	ra,8(sp)
    12d2:	e022                	sd	s0,0(sp)
    12d4:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12d6:	56c000ef          	jal	1842 <strlen>
    12da:	862a                	mv	a2,a0
    12dc:	85a2                	mv	a1,s0
    12de:	4505                	li	a0,1
    12e0:	197000ef          	jal	1c76 <write>
}
    12e4:	60a2                	ld	ra,8(sp)
    12e6:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12e8:	957d                	sra	a0,a0,0x3f
    return r;
    12ea:	2501                	sext.w	a0,a0
}
    12ec:	0141                	add	sp,sp,16
    12ee:	8082                	ret

00000000000012f0 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12f0:	7131                	add	sp,sp,-192
    12f2:	e4d6                	sd	s5,72(sp)
    12f4:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12f6:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12f8:	013c                	add	a5,sp,136
{
    12fa:	f0ca                	sd	s2,96(sp)
    12fc:	ecce                	sd	s3,88(sp)
    12fe:	e8d2                	sd	s4,80(sp)
    1300:	e0da                	sd	s6,64(sp)
    1302:	fc5e                	sd	s7,56(sp)
    1304:	fc86                	sd	ra,120(sp)
    1306:	f8a2                	sd	s0,112(sp)
    1308:	f4a6                	sd	s1,104(sp)
    130a:	e52e                	sd	a1,136(sp)
    130c:	e932                	sd	a2,144(sp)
    130e:	ed36                	sd	a3,152(sp)
    1310:	f13a                	sd	a4,160(sp)
    1312:	f942                	sd	a6,176(sp)
    1314:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1316:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1318:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    131c:	07300a13          	li	s4,115
    1320:	07800b93          	li	s7,120
    1324:	06400b13          	li	s6,100
    buf[i++] = '0';
    1328:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x58c0>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    132c:	00001997          	auipc	s3,0x1
    1330:	c4498993          	add	s3,s3,-956 # 1f70 <digits>
        if (!*s)
    1334:	00054783          	lbu	a5,0(a0)
    1338:	16078863          	beqz	a5,14a8 <printf+0x1b8>
    133c:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    133e:	19278063          	beq	a5,s2,14be <printf+0x1ce>
    1342:	00164783          	lbu	a5,1(a2)
    1346:	0605                	add	a2,a2,1
    1348:	fbfd                	bnez	a5,133e <printf+0x4e>
    134a:	84b2                	mv	s1,a2
        l = z - a;
    134c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1350:	85aa                	mv	a1,a0
    1352:	8622                	mv	a2,s0
    1354:	4505                	li	a0,1
    1356:	121000ef          	jal	1c76 <write>
        if (l)
    135a:	18041763          	bnez	s0,14e8 <printf+0x1f8>
        if (s[1] == 0)
    135e:	0014c783          	lbu	a5,1(s1)
    1362:	14078363          	beqz	a5,14a8 <printf+0x1b8>
        switch (s[1])
    1366:	19478f63          	beq	a5,s4,1504 <printf+0x214>
    136a:	18fa6163          	bltu	s4,a5,14ec <printf+0x1fc>
    136e:	1b678e63          	beq	a5,s6,152a <printf+0x23a>
    1372:	07000713          	li	a4,112
    1376:	1ce79463          	bne	a5,a4,153e <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    137a:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    137c:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1380:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1382:	631c                	ld	a5,0(a4)
    1384:	0721                	add	a4,a4,8
    1386:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1388:	00479293          	sll	t0,a5,0x4
    138c:	00879f93          	sll	t6,a5,0x8
    1390:	00c79f13          	sll	t5,a5,0xc
    1394:	01079e93          	sll	t4,a5,0x10
    1398:	01479e13          	sll	t3,a5,0x14
    139c:	01879313          	sll	t1,a5,0x18
    13a0:	01c79893          	sll	a7,a5,0x1c
    13a4:	02479813          	sll	a6,a5,0x24
    13a8:	02879513          	sll	a0,a5,0x28
    13ac:	02c79593          	sll	a1,a5,0x2c
    13b0:	03079693          	sll	a3,a5,0x30
    13b4:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13b8:	03c7d413          	srl	s0,a5,0x3c
    13bc:	01c7d39b          	srlw	t2,a5,0x1c
    13c0:	03c2d293          	srl	t0,t0,0x3c
    13c4:	03cfdf93          	srl	t6,t6,0x3c
    13c8:	03cf5f13          	srl	t5,t5,0x3c
    13cc:	03cede93          	srl	t4,t4,0x3c
    13d0:	03ce5e13          	srl	t3,t3,0x3c
    13d4:	03c35313          	srl	t1,t1,0x3c
    13d8:	03c8d893          	srl	a7,a7,0x3c
    13dc:	03c85813          	srl	a6,a6,0x3c
    13e0:	9171                	srl	a0,a0,0x3c
    13e2:	91f1                	srl	a1,a1,0x3c
    13e4:	92f1                	srl	a3,a3,0x3c
    13e6:	9371                	srl	a4,a4,0x3c
    13e8:	974e                	add	a4,a4,s3
    13ea:	944e                	add	s0,s0,s3
    13ec:	92ce                	add	t0,t0,s3
    13ee:	9fce                	add	t6,t6,s3
    13f0:	9f4e                	add	t5,t5,s3
    13f2:	9ece                	add	t4,t4,s3
    13f4:	9e4e                	add	t3,t3,s3
    13f6:	934e                	add	t1,t1,s3
    13f8:	98ce                	add	a7,a7,s3
    13fa:	93ce                	add	t2,t2,s3
    13fc:	984e                	add	a6,a6,s3
    13fe:	954e                	add	a0,a0,s3
    1400:	95ce                	add	a1,a1,s3
    1402:	96ce                	add	a3,a3,s3
    1404:	00074083          	lbu	ra,0(a4)
    1408:	0002c283          	lbu	t0,0(t0)
    140c:	000fcf83          	lbu	t6,0(t6)
    1410:	000f4f03          	lbu	t5,0(t5)
    1414:	000ece83          	lbu	t4,0(t4)
    1418:	000e4e03          	lbu	t3,0(t3)
    141c:	00034303          	lbu	t1,0(t1)
    1420:	0008c883          	lbu	a7,0(a7)
    1424:	0003c383          	lbu	t2,0(t2)
    1428:	00084803          	lbu	a6,0(a6)
    142c:	00054503          	lbu	a0,0(a0)
    1430:	0005c583          	lbu	a1,0(a1)
    1434:	0006c683          	lbu	a3,0(a3)
    1438:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    143c:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1440:	9371                	srl	a4,a4,0x3c
    1442:	8bbd                	and	a5,a5,15
    1444:	974e                	add	a4,a4,s3
    1446:	97ce                	add	a5,a5,s3
    1448:	005105a3          	sb	t0,11(sp)
    144c:	01f10623          	sb	t6,12(sp)
    1450:	01e106a3          	sb	t5,13(sp)
    1454:	01d10723          	sb	t4,14(sp)
    1458:	01c107a3          	sb	t3,15(sp)
    145c:	00610823          	sb	t1,16(sp)
    1460:	011108a3          	sb	a7,17(sp)
    1464:	00710923          	sb	t2,18(sp)
    1468:	010109a3          	sb	a6,19(sp)
    146c:	00a10a23          	sb	a0,20(sp)
    1470:	00b10aa3          	sb	a1,21(sp)
    1474:	00d10b23          	sb	a3,22(sp)
    1478:	00110ba3          	sb	ra,23(sp)
    147c:	00810523          	sb	s0,10(sp)
    1480:	00074703          	lbu	a4,0(a4)
    1484:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1488:	002c                	add	a1,sp,8
    148a:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    148c:	00e10c23          	sb	a4,24(sp)
    1490:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1494:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1498:	7de000ef          	jal	1c76 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    149c:	00248513          	add	a0,s1,2
        if (!*s)
    14a0:	00054783          	lbu	a5,0(a0)
    14a4:	e8079ce3          	bnez	a5,133c <printf+0x4c>
    }
    va_end(ap);
}
    14a8:	70e6                	ld	ra,120(sp)
    14aa:	7446                	ld	s0,112(sp)
    14ac:	74a6                	ld	s1,104(sp)
    14ae:	7906                	ld	s2,96(sp)
    14b0:	69e6                	ld	s3,88(sp)
    14b2:	6a46                	ld	s4,80(sp)
    14b4:	6aa6                	ld	s5,72(sp)
    14b6:	6b06                	ld	s6,64(sp)
    14b8:	7be2                	ld	s7,56(sp)
    14ba:	6129                	add	sp,sp,192
    14bc:	8082                	ret
    14be:	84b2                	mv	s1,a2
    14c0:	a039                	j	14ce <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14c2:	0024c783          	lbu	a5,2(s1)
    14c6:	0605                	add	a2,a2,1
    14c8:	0489                	add	s1,s1,2
    14ca:	e92791e3          	bne	a5,s2,134c <printf+0x5c>
    14ce:	0014c783          	lbu	a5,1(s1)
    14d2:	ff2788e3          	beq	a5,s2,14c2 <printf+0x1d2>
        l = z - a;
    14d6:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14da:	85aa                	mv	a1,a0
    14dc:	8622                	mv	a2,s0
    14de:	4505                	li	a0,1
    14e0:	796000ef          	jal	1c76 <write>
        if (l)
    14e4:	e6040de3          	beqz	s0,135e <printf+0x6e>
    14e8:	8526                	mv	a0,s1
    14ea:	b5a9                	j	1334 <printf+0x44>
        switch (s[1])
    14ec:	05779963          	bne	a5,s7,153e <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    14f0:	6782                	ld	a5,0(sp)
    14f2:	45c1                	li	a1,16
    14f4:	4388                	lw	a0,0(a5)
    14f6:	07a1                	add	a5,a5,8
    14f8:	e03e                	sd	a5,0(sp)
    14fa:	bb7ff0ef          	jal	10b0 <printint.constprop.0>
        s += 2;
    14fe:	00248513          	add	a0,s1,2
    1502:	bf79                	j	14a0 <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    1504:	6782                	ld	a5,0(sp)
    1506:	6380                	ld	s0,0(a5)
    1508:	07a1                	add	a5,a5,8
    150a:	e03e                	sd	a5,0(sp)
    150c:	cc21                	beqz	s0,1564 <printf+0x274>
            l = strnlen(a, 200);
    150e:	0c800593          	li	a1,200
    1512:	8522                	mv	a0,s0
    1514:	460000ef          	jal	1974 <strnlen>
    write(f, s, l);
    1518:	0005061b          	sext.w	a2,a0
    151c:	85a2                	mv	a1,s0
    151e:	4505                	li	a0,1
    1520:	756000ef          	jal	1c76 <write>
        s += 2;
    1524:	00248513          	add	a0,s1,2
    1528:	bfa5                	j	14a0 <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    152a:	6782                	ld	a5,0(sp)
    152c:	45a9                	li	a1,10
    152e:	4388                	lw	a0,0(a5)
    1530:	07a1                	add	a5,a5,8
    1532:	e03e                	sd	a5,0(sp)
    1534:	b7dff0ef          	jal	10b0 <printint.constprop.0>
        s += 2;
    1538:	00248513          	add	a0,s1,2
    153c:	b795                	j	14a0 <printf+0x1b0>
    return write(stdout, &byte, 1);
    153e:	4605                	li	a2,1
    1540:	002c                	add	a1,sp,8
    1542:	4505                	li	a0,1
    char byte = c;
    1544:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1548:	72e000ef          	jal	1c76 <write>
    char byte = c;
    154c:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1550:	4605                	li	a2,1
    1552:	002c                	add	a1,sp,8
    1554:	4505                	li	a0,1
    char byte = c;
    1556:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    155a:	71c000ef          	jal	1c76 <write>
        s += 2;
    155e:	00248513          	add	a0,s1,2
    1562:	bf3d                	j	14a0 <printf+0x1b0>
                a = "(null)";
    1564:	00001417          	auipc	s0,0x1
    1568:	9f440413          	add	s0,s0,-1548 # 1f58 <__clone+0xaa>
    156c:	b74d                	j	150e <printf+0x21e>

000000000000156e <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    156e:	1141                	add	sp,sp,-16
    1570:	e406                	sd	ra,8(sp)
    puts(m);
    1572:	d5dff0ef          	jal	12ce <puts>
    exit(-100);
}
    1576:	60a2                	ld	ra,8(sp)
    exit(-100);
    1578:	f9c00513          	li	a0,-100
}
    157c:	0141                	add	sp,sp,16
    exit(-100);
    157e:	a7a1                	j	1cc6 <exit>

0000000000001580 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1580:	02000793          	li	a5,32
    1584:	00f50663          	beq	a0,a5,1590 <isspace+0x10>
    1588:	355d                	addw	a0,a0,-9
    158a:	00553513          	sltiu	a0,a0,5
    158e:	8082                	ret
    1590:	4505                	li	a0,1
}
    1592:	8082                	ret

0000000000001594 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1594:	fd05051b          	addw	a0,a0,-48
}
    1598:	00a53513          	sltiu	a0,a0,10
    159c:	8082                	ret

000000000000159e <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    159e:	02000713          	li	a4,32
    15a2:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15a4:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a8:	ff76879b          	addw	a5,a3,-9
    15ac:	06e68063          	beq	a3,a4,160c <atoi+0x6e>
    15b0:	0006859b          	sext.w	a1,a3
    15b4:	04f67c63          	bgeu	a2,a5,160c <atoi+0x6e>
        s++;
    switch (*s)
    15b8:	02b00793          	li	a5,43
    15bc:	06f68563          	beq	a3,a5,1626 <atoi+0x88>
    15c0:	02d00793          	li	a5,45
    15c4:	04f69663          	bne	a3,a5,1610 <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15c8:	00154683          	lbu	a3,1(a0)
    15cc:	47a5                	li	a5,9
        s++;
    15ce:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    15d2:	fd06869b          	addw	a3,a3,-48
    15d6:	8636                	mv	a2,a3
    while (isdigit(*s))
    15d8:	04d7e563          	bltu	a5,a3,1622 <atoi+0x84>
        neg = 1;
    15dc:	4885                	li	a7,1
    int n = 0, neg = 0;
    15de:	4501                	li	a0,0
    while (isdigit(*s))
    15e0:	4825                	li	a6,9
    15e2:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    15e6:	0025179b          	sllw	a5,a0,0x2
    15ea:	9fa9                	addw	a5,a5,a0
    15ec:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    15f0:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    15f4:	85b2                	mv	a1,a2
    15f6:	40c7853b          	subw	a0,a5,a2
    15fa:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    15fc:	8636                	mv	a2,a3
    while (isdigit(*s))
    15fe:	fed872e3          	bgeu	a6,a3,15e2 <atoi+0x44>
    return neg ? n : -n;
    1602:	02089163          	bnez	a7,1624 <atoi+0x86>
    1606:	40f5853b          	subw	a0,a1,a5
    160a:	8082                	ret
        s++;
    160c:	0505                	add	a0,a0,1
    160e:	bf59                	j	15a4 <atoi+0x6>
    while (isdigit(*s))
    1610:	fd05859b          	addw	a1,a1,-48
    1614:	47a5                	li	a5,9
    1616:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1618:	4881                	li	a7,0
    161a:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    161e:	fcb7f0e3          	bgeu	a5,a1,15de <atoi+0x40>
    return neg ? n : -n;
    1622:	4501                	li	a0,0
}
    1624:	8082                	ret
    while (isdigit(*s))
    1626:	00154683          	lbu	a3,1(a0)
    162a:	47a5                	li	a5,9
        s++;
    162c:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1630:	fd06869b          	addw	a3,a3,-48
    1634:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    1636:	4881                	li	a7,0
    while (isdigit(*s))
    1638:	fad7f3e3          	bgeu	a5,a3,15de <atoi+0x40>
    return neg ? n : -n;
    163c:	4501                	li	a0,0
    163e:	8082                	ret

0000000000001640 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1640:	16060f63          	beqz	a2,17be <memset+0x17e>
    1644:	40a006b3          	neg	a3,a0
    1648:	0076f793          	and	a5,a3,7
    164c:	00778813          	add	a6,a5,7
    1650:	48ad                	li	a7,11
    1652:	0ff5f713          	zext.b	a4,a1
    1656:	fff60593          	add	a1,a2,-1
    165a:	17186363          	bltu	a6,a7,17c0 <memset+0x180>
    165e:	1705eb63          	bltu	a1,a6,17d4 <memset+0x194>
    1662:	16078163          	beqz	a5,17c4 <memset+0x184>
    1666:	00e50023          	sb	a4,0(a0)
    166a:	0066f593          	and	a1,a3,6
    166e:	14058e63          	beqz	a1,17ca <memset+0x18a>
    1672:	00e500a3          	sb	a4,1(a0)
    1676:	4589                	li	a1,2
    1678:	00250813          	add	a6,a0,2
    167c:	04f5f663          	bgeu	a1,a5,16c8 <memset+0x88>
    1680:	00e50123          	sb	a4,2(a0)
    1684:	8a91                	and	a3,a3,4
    1686:	00350813          	add	a6,a0,3
    168a:	458d                	li	a1,3
    168c:	ce95                	beqz	a3,16c8 <memset+0x88>
    168e:	00e501a3          	sb	a4,3(a0)
    1692:	4691                	li	a3,4
    1694:	00450813          	add	a6,a0,4
    1698:	4591                	li	a1,4
    169a:	02f6f763          	bgeu	a3,a5,16c8 <memset+0x88>
    169e:	00e50223          	sb	a4,4(a0)
    16a2:	4695                	li	a3,5
    16a4:	00550813          	add	a6,a0,5
    16a8:	4595                	li	a1,5
    16aa:	00d78f63          	beq	a5,a3,16c8 <memset+0x88>
    16ae:	00e502a3          	sb	a4,5(a0)
    16b2:	469d                	li	a3,7
    16b4:	00650813          	add	a6,a0,6
    16b8:	4599                	li	a1,6
    16ba:	00d79763          	bne	a5,a3,16c8 <memset+0x88>
    16be:	00750813          	add	a6,a0,7
    16c2:	00e50323          	sb	a4,6(a0)
    16c6:	459d                	li	a1,7
    16c8:	00871693          	sll	a3,a4,0x8
    16cc:	01071313          	sll	t1,a4,0x10
    16d0:	8ed9                	or	a3,a3,a4
    16d2:	01871893          	sll	a7,a4,0x18
    16d6:	0066e6b3          	or	a3,a3,t1
    16da:	0116e6b3          	or	a3,a3,a7
    16de:	02071313          	sll	t1,a4,0x20
    16e2:	02871893          	sll	a7,a4,0x28
    16e6:	0066e6b3          	or	a3,a3,t1
    16ea:	40f60e33          	sub	t3,a2,a5
    16ee:	03071313          	sll	t1,a4,0x30
    16f2:	0116e6b3          	or	a3,a3,a7
    16f6:	0066e6b3          	or	a3,a3,t1
    16fa:	03871893          	sll	a7,a4,0x38
    16fe:	97aa                	add	a5,a5,a0
    1700:	ff8e7313          	and	t1,t3,-8
    1704:	0116e6b3          	or	a3,a3,a7
    1708:	00f308b3          	add	a7,t1,a5
    170c:	e394                	sd	a3,0(a5)
    170e:	07a1                	add	a5,a5,8
    1710:	ff179ee3          	bne	a5,a7,170c <memset+0xcc>
    1714:	006806b3          	add	a3,a6,t1
    1718:	00b307bb          	addw	a5,t1,a1
    171c:	0bc30b63          	beq	t1,t3,17d2 <memset+0x192>
    1720:	00e68023          	sb	a4,0(a3)
    1724:	0017859b          	addw	a1,a5,1
    1728:	08c5fb63          	bgeu	a1,a2,17be <memset+0x17e>
    172c:	00e680a3          	sb	a4,1(a3)
    1730:	0027859b          	addw	a1,a5,2
    1734:	08c5f563          	bgeu	a1,a2,17be <memset+0x17e>
    1738:	00e68123          	sb	a4,2(a3)
    173c:	0037859b          	addw	a1,a5,3
    1740:	06c5ff63          	bgeu	a1,a2,17be <memset+0x17e>
    1744:	00e681a3          	sb	a4,3(a3)
    1748:	0047859b          	addw	a1,a5,4
    174c:	06c5f963          	bgeu	a1,a2,17be <memset+0x17e>
    1750:	00e68223          	sb	a4,4(a3)
    1754:	0057859b          	addw	a1,a5,5
    1758:	06c5f363          	bgeu	a1,a2,17be <memset+0x17e>
    175c:	00e682a3          	sb	a4,5(a3)
    1760:	0067859b          	addw	a1,a5,6
    1764:	04c5fd63          	bgeu	a1,a2,17be <memset+0x17e>
    1768:	00e68323          	sb	a4,6(a3)
    176c:	0077859b          	addw	a1,a5,7
    1770:	04c5f763          	bgeu	a1,a2,17be <memset+0x17e>
    1774:	00e683a3          	sb	a4,7(a3)
    1778:	0087859b          	addw	a1,a5,8
    177c:	04c5f163          	bgeu	a1,a2,17be <memset+0x17e>
    1780:	00e68423          	sb	a4,8(a3)
    1784:	0097859b          	addw	a1,a5,9
    1788:	02c5fb63          	bgeu	a1,a2,17be <memset+0x17e>
    178c:	00e684a3          	sb	a4,9(a3)
    1790:	00a7859b          	addw	a1,a5,10
    1794:	02c5f563          	bgeu	a1,a2,17be <memset+0x17e>
    1798:	00e68523          	sb	a4,10(a3)
    179c:	00b7859b          	addw	a1,a5,11
    17a0:	00c5ff63          	bgeu	a1,a2,17be <memset+0x17e>
    17a4:	00e685a3          	sb	a4,11(a3)
    17a8:	00c7859b          	addw	a1,a5,12
    17ac:	00c5f963          	bgeu	a1,a2,17be <memset+0x17e>
    17b0:	00e68623          	sb	a4,12(a3)
    17b4:	27b5                	addw	a5,a5,13
    17b6:	00c7f463          	bgeu	a5,a2,17be <memset+0x17e>
    17ba:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17be:	8082                	ret
    17c0:	482d                	li	a6,11
    17c2:	bd71                	j	165e <memset+0x1e>
    char *p = dest;
    17c4:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17c6:	4581                	li	a1,0
    17c8:	b701                	j	16c8 <memset+0x88>
    17ca:	00150813          	add	a6,a0,1
    17ce:	4585                	li	a1,1
    17d0:	bde5                	j	16c8 <memset+0x88>
    17d2:	8082                	ret
    char *p = dest;
    17d4:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17d6:	4781                	li	a5,0
    17d8:	b7a1                	j	1720 <memset+0xe0>

00000000000017da <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17da:	00054783          	lbu	a5,0(a0)
    17de:	0005c703          	lbu	a4,0(a1)
    17e2:	00e79863          	bne	a5,a4,17f2 <strcmp+0x18>
    17e6:	0505                	add	a0,a0,1
    17e8:	0585                	add	a1,a1,1
    17ea:	fbe5                	bnez	a5,17da <strcmp>
    17ec:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    17ee:	9d19                	subw	a0,a0,a4
    17f0:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    17f2:	0007851b          	sext.w	a0,a5
    17f6:	bfe5                	j	17ee <strcmp+0x14>

00000000000017f8 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    17f8:	ca15                	beqz	a2,182c <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17fa:	00054783          	lbu	a5,0(a0)
    if (!n--)
    17fe:	167d                	add	a2,a2,-1
    1800:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1804:	eb99                	bnez	a5,181a <strncmp+0x22>
    1806:	a815                	j	183a <strncmp+0x42>
    1808:	00a68e63          	beq	a3,a0,1824 <strncmp+0x2c>
    180c:	0505                	add	a0,a0,1
    180e:	00f71b63          	bne	a4,a5,1824 <strncmp+0x2c>
    1812:	00054783          	lbu	a5,0(a0)
    1816:	cf89                	beqz	a5,1830 <strncmp+0x38>
    1818:	85b2                	mv	a1,a2
    181a:	0005c703          	lbu	a4,0(a1)
    181e:	00158613          	add	a2,a1,1
    1822:	f37d                	bnez	a4,1808 <strncmp+0x10>
        ;
    return *l - *r;
    1824:	0007851b          	sext.w	a0,a5
    1828:	9d19                	subw	a0,a0,a4
    182a:	8082                	ret
        return 0;
    182c:	4501                	li	a0,0
}
    182e:	8082                	ret
    return *l - *r;
    1830:	0015c703          	lbu	a4,1(a1)
    1834:	4501                	li	a0,0
    1836:	9d19                	subw	a0,a0,a4
    1838:	8082                	ret
    183a:	0005c703          	lbu	a4,0(a1)
    183e:	4501                	li	a0,0
    1840:	b7e5                	j	1828 <strncmp+0x30>

0000000000001842 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1842:	00757793          	and	a5,a0,7
    1846:	cf89                	beqz	a5,1860 <strlen+0x1e>
    1848:	87aa                	mv	a5,a0
    184a:	a029                	j	1854 <strlen+0x12>
    184c:	0785                	add	a5,a5,1
    184e:	0077f713          	and	a4,a5,7
    1852:	cb01                	beqz	a4,1862 <strlen+0x20>
        if (!*s)
    1854:	0007c703          	lbu	a4,0(a5)
    1858:	fb75                	bnez	a4,184c <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    185a:	40a78533          	sub	a0,a5,a0
}
    185e:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1860:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1862:	feff05b7          	lui	a1,0xfeff0
    1866:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedf8f>
    186a:	f0101637          	lui	a2,0xf0101
    186e:	05c2                	sll	a1,a1,0x10
    1870:	0612                	sll	a2,a2,0x4
    1872:	6394                	ld	a3,0(a5)
    1874:	eff58593          	add	a1,a1,-257
    1878:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff191>
    187c:	05c2                	sll	a1,a1,0x10
    187e:	0642                	sll	a2,a2,0x10
    1880:	eff58593          	add	a1,a1,-257
    1884:	10160613          	add	a2,a2,257
    1888:	00b68733          	add	a4,a3,a1
    188c:	063e                	sll	a2,a2,0xf
    188e:	fff6c693          	not	a3,a3
    1892:	8f75                	and	a4,a4,a3
    1894:	08060613          	add	a2,a2,128
    1898:	8f71                	and	a4,a4,a2
    189a:	eb11                	bnez	a4,18ae <strlen+0x6c>
    189c:	6794                	ld	a3,8(a5)
    189e:	07a1                	add	a5,a5,8
    18a0:	00b68733          	add	a4,a3,a1
    18a4:	fff6c693          	not	a3,a3
    18a8:	8f75                	and	a4,a4,a3
    18aa:	8f71                	and	a4,a4,a2
    18ac:	db65                	beqz	a4,189c <strlen+0x5a>
    for (; *s; s++)
    18ae:	0007c703          	lbu	a4,0(a5)
    18b2:	d745                	beqz	a4,185a <strlen+0x18>
    18b4:	0017c703          	lbu	a4,1(a5)
    18b8:	0785                	add	a5,a5,1
    18ba:	d345                	beqz	a4,185a <strlen+0x18>
    18bc:	0017c703          	lbu	a4,1(a5)
    18c0:	0785                	add	a5,a5,1
    18c2:	fb6d                	bnez	a4,18b4 <strlen+0x72>
    18c4:	bf59                	j	185a <strlen+0x18>

00000000000018c6 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18c6:	00757713          	and	a4,a0,7
{
    18ca:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18cc:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18d0:	cb19                	beqz	a4,18e6 <memchr+0x20>
    18d2:	ce59                	beqz	a2,1970 <memchr+0xaa>
    18d4:	0007c703          	lbu	a4,0(a5)
    18d8:	00b70963          	beq	a4,a1,18ea <memchr+0x24>
    18dc:	0785                	add	a5,a5,1
    18de:	0077f713          	and	a4,a5,7
    18e2:	167d                	add	a2,a2,-1
    18e4:	f77d                	bnez	a4,18d2 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18e6:	4501                	li	a0,0
    if (n && *s != c)
    18e8:	c649                	beqz	a2,1972 <memchr+0xac>
    18ea:	0007c703          	lbu	a4,0(a5)
    18ee:	06b70663          	beq	a4,a1,195a <memchr+0x94>
        size_t k = ONES * c;
    18f2:	01010737          	lui	a4,0x1010
    18f6:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e191>
    18fa:	0742                	sll	a4,a4,0x10
    18fc:	10170713          	add	a4,a4,257
    1900:	0742                	sll	a4,a4,0x10
    1902:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1906:	469d                	li	a3,7
        size_t k = ONES * c;
    1908:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    190c:	04c6f763          	bgeu	a3,a2,195a <memchr+0x94>
    1910:	f0101837          	lui	a6,0xf0101
    1914:	feff08b7          	lui	a7,0xfeff0
    1918:	0812                	sll	a6,a6,0x4
    191a:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedf8f>
    191e:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff191>
    1922:	08c2                	sll	a7,a7,0x10
    1924:	0842                	sll	a6,a6,0x10
    1926:	eff88893          	add	a7,a7,-257
    192a:	10180813          	add	a6,a6,257
    192e:	08c2                	sll	a7,a7,0x10
    1930:	083e                	sll	a6,a6,0xf
    1932:	eff88893          	add	a7,a7,-257
    1936:	08080813          	add	a6,a6,128
    193a:	431d                	li	t1,7
    193c:	a029                	j	1946 <memchr+0x80>
    193e:	1661                	add	a2,a2,-8
    1940:	07a1                	add	a5,a5,8
    1942:	02c37663          	bgeu	t1,a2,196e <memchr+0xa8>
    1946:	6398                	ld	a4,0(a5)
    1948:	8f29                	xor	a4,a4,a0
    194a:	011706b3          	add	a3,a4,a7
    194e:	fff74713          	not	a4,a4
    1952:	8f75                	and	a4,a4,a3
    1954:	01077733          	and	a4,a4,a6
    1958:	d37d                	beqz	a4,193e <memchr+0x78>
        s = (const void *)w;
    195a:	853e                	mv	a0,a5
    195c:	a019                	j	1962 <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    195e:	0505                	add	a0,a0,1
    1960:	ca01                	beqz	a2,1970 <memchr+0xaa>
    1962:	00054783          	lbu	a5,0(a0)
    1966:	167d                	add	a2,a2,-1
    1968:	feb79be3          	bne	a5,a1,195e <memchr+0x98>
    196c:	8082                	ret
    196e:	f675                	bnez	a2,195a <memchr+0x94>
    return n ? (void *)s : 0;
    1970:	4501                	li	a0,0
}
    1972:	8082                	ret

0000000000001974 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1974:	1101                	add	sp,sp,-32
    1976:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1978:	862e                	mv	a2,a1
{
    197a:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    197c:	4581                	li	a1,0
{
    197e:	e426                	sd	s1,8(sp)
    1980:	ec06                	sd	ra,24(sp)
    1982:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1984:	f43ff0ef          	jal	18c6 <memchr>
    return p ? p - s : n;
    1988:	c519                	beqz	a0,1996 <strnlen+0x22>
}
    198a:	60e2                	ld	ra,24(sp)
    198c:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    198e:	8d05                	sub	a0,a0,s1
}
    1990:	64a2                	ld	s1,8(sp)
    1992:	6105                	add	sp,sp,32
    1994:	8082                	ret
    1996:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1998:	8522                	mv	a0,s0
}
    199a:	6442                	ld	s0,16(sp)
    199c:	64a2                	ld	s1,8(sp)
    199e:	6105                	add	sp,sp,32
    19a0:	8082                	ret

00000000000019a2 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19a2:	00b547b3          	xor	a5,a0,a1
    19a6:	8b9d                	and	a5,a5,7
    19a8:	efb1                	bnez	a5,1a04 <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19aa:	0075f793          	and	a5,a1,7
    19ae:	ebb5                	bnez	a5,1a22 <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19b0:	feff0637          	lui	a2,0xfeff0
    19b4:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedf8f>
    19b8:	f01016b7          	lui	a3,0xf0101
    19bc:	0642                	sll	a2,a2,0x10
    19be:	0692                	sll	a3,a3,0x4
    19c0:	6198                	ld	a4,0(a1)
    19c2:	eff60613          	add	a2,a2,-257
    19c6:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff191>
    19ca:	0642                	sll	a2,a2,0x10
    19cc:	06c2                	sll	a3,a3,0x10
    19ce:	eff60613          	add	a2,a2,-257
    19d2:	10168693          	add	a3,a3,257
    19d6:	00c707b3          	add	a5,a4,a2
    19da:	fff74813          	not	a6,a4
    19de:	06be                	sll	a3,a3,0xf
    19e0:	0107f7b3          	and	a5,a5,a6
    19e4:	08068693          	add	a3,a3,128
    19e8:	8ff5                	and	a5,a5,a3
    19ea:	ef89                	bnez	a5,1a04 <strcpy+0x62>
    19ec:	05a1                	add	a1,a1,8
    19ee:	e118                	sd	a4,0(a0)
    19f0:	6198                	ld	a4,0(a1)
    19f2:	0521                	add	a0,a0,8
    19f4:	00c707b3          	add	a5,a4,a2
    19f8:	fff74813          	not	a6,a4
    19fc:	0107f7b3          	and	a5,a5,a6
    1a00:	8ff5                	and	a5,a5,a3
    1a02:	d7ed                	beqz	a5,19ec <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a04:	0005c783          	lbu	a5,0(a1)
    1a08:	00f50023          	sb	a5,0(a0)
    1a0c:	c785                	beqz	a5,1a34 <strcpy+0x92>
    1a0e:	0015c783          	lbu	a5,1(a1)
    1a12:	0505                	add	a0,a0,1
    1a14:	0585                	add	a1,a1,1
    1a16:	00f50023          	sb	a5,0(a0)
    1a1a:	fbf5                	bnez	a5,1a0e <strcpy+0x6c>
        ;
    return d;
}
    1a1c:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a1e:	0505                	add	a0,a0,1
    1a20:	db41                	beqz	a4,19b0 <strcpy+0xe>
            if (!(*d = *s))
    1a22:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a26:	0585                	add	a1,a1,1
    1a28:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a2c:	00f50023          	sb	a5,0(a0)
    1a30:	f7fd                	bnez	a5,1a1e <strcpy+0x7c>
}
    1a32:	8082                	ret
    1a34:	8082                	ret

0000000000001a36 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a36:	00b547b3          	xor	a5,a0,a1
    1a3a:	8b9d                	and	a5,a5,7
    1a3c:	efbd                	bnez	a5,1aba <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a3e:	0075f793          	and	a5,a1,7
    1a42:	1c078563          	beqz	a5,1c0c <strncpy+0x1d6>
    1a46:	ea11                	bnez	a2,1a5a <strncpy+0x24>
    1a48:	8082                	ret
    1a4a:	0585                	add	a1,a1,1
    1a4c:	0075f793          	and	a5,a1,7
    1a50:	167d                	add	a2,a2,-1
    1a52:	0505                	add	a0,a0,1
    1a54:	1a078c63          	beqz	a5,1c0c <strncpy+0x1d6>
    1a58:	ca3d                	beqz	a2,1ace <strncpy+0x98>
    1a5a:	0005c783          	lbu	a5,0(a1)
    1a5e:	00f50023          	sb	a5,0(a0)
    1a62:	f7e5                	bnez	a5,1a4a <strncpy+0x14>
            ;
        if (!n || !*s)
    1a64:	0005c783          	lbu	a5,0(a1)
    1a68:	c7a5                	beqz	a5,1ad0 <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a6a:	479d                	li	a5,7
    1a6c:	04c7f863          	bgeu	a5,a2,1abc <strncpy+0x86>
    1a70:	f01016b7          	lui	a3,0xf0101
    1a74:	feff0837          	lui	a6,0xfeff0
    1a78:	0692                	sll	a3,a3,0x4
    1a7a:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedf8f>
    1a7e:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff191>
    1a82:	0842                	sll	a6,a6,0x10
    1a84:	06c2                	sll	a3,a3,0x10
    1a86:	eff80813          	add	a6,a6,-257
    1a8a:	10168693          	add	a3,a3,257
    1a8e:	0842                	sll	a6,a6,0x10
    1a90:	06be                	sll	a3,a3,0xf
    1a92:	eff80813          	add	a6,a6,-257
    1a96:	08068693          	add	a3,a3,128
    1a9a:	431d                	li	t1,7
    1a9c:	6198                	ld	a4,0(a1)
    1a9e:	010707b3          	add	a5,a4,a6
    1aa2:	fff74893          	not	a7,a4
    1aa6:	0117f7b3          	and	a5,a5,a7
    1aaa:	8ff5                	and	a5,a5,a3
    1aac:	eb81                	bnez	a5,1abc <strncpy+0x86>
            *wd = *ws;
    1aae:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ab0:	1661                	add	a2,a2,-8
    1ab2:	05a1                	add	a1,a1,8
    1ab4:	0521                	add	a0,a0,8
    1ab6:	fec363e3          	bltu	t1,a2,1a9c <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1aba:	ca11                	beqz	a2,1ace <strncpy+0x98>
    1abc:	0005c783          	lbu	a5,0(a1)
    1ac0:	0585                	add	a1,a1,1
    1ac2:	00f50023          	sb	a5,0(a0)
    1ac6:	c789                	beqz	a5,1ad0 <strncpy+0x9a>
    1ac8:	167d                	add	a2,a2,-1
    1aca:	0505                	add	a0,a0,1
    1acc:	fa65                	bnez	a2,1abc <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1ace:	8082                	ret
    1ad0:	40a00733          	neg	a4,a0
    1ad4:	00777793          	and	a5,a4,7
    1ad8:	00778693          	add	a3,a5,7
    1adc:	482d                	li	a6,11
    1ade:	fff60593          	add	a1,a2,-1
    1ae2:	1106ef63          	bltu	a3,a6,1c00 <strncpy+0x1ca>
    1ae6:	12d5ee63          	bltu	a1,a3,1c22 <strncpy+0x1ec>
    1aea:	12078563          	beqz	a5,1c14 <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1aee:	00050023          	sb	zero,0(a0)
    1af2:	00677693          	and	a3,a4,6
    1af6:	12068263          	beqz	a3,1c1a <strncpy+0x1e4>
    1afa:	000500a3          	sb	zero,1(a0)
    1afe:	4689                	li	a3,2
    1b00:	12f6f463          	bgeu	a3,a5,1c28 <strncpy+0x1f2>
    1b04:	00050123          	sb	zero,2(a0)
    1b08:	8b11                	and	a4,a4,4
    1b0a:	cf6d                	beqz	a4,1c04 <strncpy+0x1ce>
    1b0c:	000501a3          	sb	zero,3(a0)
    1b10:	4711                	li	a4,4
    1b12:	00450693          	add	a3,a0,4
    1b16:	02f77363          	bgeu	a4,a5,1b3c <strncpy+0x106>
    1b1a:	00050223          	sb	zero,4(a0)
    1b1e:	4715                	li	a4,5
    1b20:	00550693          	add	a3,a0,5
    1b24:	00e78c63          	beq	a5,a4,1b3c <strncpy+0x106>
    1b28:	000502a3          	sb	zero,5(a0)
    1b2c:	471d                	li	a4,7
    1b2e:	10e79163          	bne	a5,a4,1c30 <strncpy+0x1fa>
    1b32:	00750693          	add	a3,a0,7
    1b36:	00050323          	sb	zero,6(a0)
    1b3a:	471d                	li	a4,7
    1b3c:	40f608b3          	sub	a7,a2,a5
    1b40:	ff88f813          	and	a6,a7,-8
    1b44:	97aa                	add	a5,a5,a0
    1b46:	010785b3          	add	a1,a5,a6
    1b4a:	0007b023          	sd	zero,0(a5)
    1b4e:	07a1                	add	a5,a5,8
    1b50:	feb79de3          	bne	a5,a1,1b4a <strncpy+0x114>
    1b54:	00e807bb          	addw	a5,a6,a4
    1b58:	01068733          	add	a4,a3,a6
    1b5c:	0b088b63          	beq	a7,a6,1c12 <strncpy+0x1dc>
    1b60:	00070023          	sb	zero,0(a4)
    1b64:	0017869b          	addw	a3,a5,1
    1b68:	f6c6f3e3          	bgeu	a3,a2,1ace <strncpy+0x98>
    1b6c:	000700a3          	sb	zero,1(a4)
    1b70:	0027869b          	addw	a3,a5,2
    1b74:	f4c6fde3          	bgeu	a3,a2,1ace <strncpy+0x98>
    1b78:	00070123          	sb	zero,2(a4)
    1b7c:	0037869b          	addw	a3,a5,3
    1b80:	f4c6f7e3          	bgeu	a3,a2,1ace <strncpy+0x98>
    1b84:	000701a3          	sb	zero,3(a4)
    1b88:	0047869b          	addw	a3,a5,4
    1b8c:	f4c6f1e3          	bgeu	a3,a2,1ace <strncpy+0x98>
    1b90:	00070223          	sb	zero,4(a4)
    1b94:	0057869b          	addw	a3,a5,5
    1b98:	f2c6fbe3          	bgeu	a3,a2,1ace <strncpy+0x98>
    1b9c:	000702a3          	sb	zero,5(a4)
    1ba0:	0067869b          	addw	a3,a5,6
    1ba4:	f2c6f5e3          	bgeu	a3,a2,1ace <strncpy+0x98>
    1ba8:	00070323          	sb	zero,6(a4)
    1bac:	0077869b          	addw	a3,a5,7
    1bb0:	f0c6ffe3          	bgeu	a3,a2,1ace <strncpy+0x98>
    1bb4:	000703a3          	sb	zero,7(a4)
    1bb8:	0087869b          	addw	a3,a5,8
    1bbc:	f0c6f9e3          	bgeu	a3,a2,1ace <strncpy+0x98>
    1bc0:	00070423          	sb	zero,8(a4)
    1bc4:	0097869b          	addw	a3,a5,9
    1bc8:	f0c6f3e3          	bgeu	a3,a2,1ace <strncpy+0x98>
    1bcc:	000704a3          	sb	zero,9(a4)
    1bd0:	00a7869b          	addw	a3,a5,10
    1bd4:	eec6fde3          	bgeu	a3,a2,1ace <strncpy+0x98>
    1bd8:	00070523          	sb	zero,10(a4)
    1bdc:	00b7869b          	addw	a3,a5,11
    1be0:	eec6f7e3          	bgeu	a3,a2,1ace <strncpy+0x98>
    1be4:	000705a3          	sb	zero,11(a4)
    1be8:	00c7869b          	addw	a3,a5,12
    1bec:	eec6f1e3          	bgeu	a3,a2,1ace <strncpy+0x98>
    1bf0:	00070623          	sb	zero,12(a4)
    1bf4:	27b5                	addw	a5,a5,13
    1bf6:	ecc7fce3          	bgeu	a5,a2,1ace <strncpy+0x98>
    1bfa:	000706a3          	sb	zero,13(a4)
}
    1bfe:	8082                	ret
    1c00:	46ad                	li	a3,11
    1c02:	b5d5                	j	1ae6 <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c04:	00350693          	add	a3,a0,3
    1c08:	470d                	li	a4,3
    1c0a:	bf0d                	j	1b3c <strncpy+0x106>
        if (!n || !*s)
    1c0c:	e4061ce3          	bnez	a2,1a64 <strncpy+0x2e>
}
    1c10:	8082                	ret
    1c12:	8082                	ret
    char *p = dest;
    1c14:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c16:	4701                	li	a4,0
    1c18:	b715                	j	1b3c <strncpy+0x106>
    1c1a:	00150693          	add	a3,a0,1
    1c1e:	4705                	li	a4,1
    1c20:	bf31                	j	1b3c <strncpy+0x106>
    char *p = dest;
    1c22:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c24:	4781                	li	a5,0
    1c26:	bf2d                	j	1b60 <strncpy+0x12a>
    1c28:	00250693          	add	a3,a0,2
    1c2c:	4709                	li	a4,2
    1c2e:	b739                	j	1b3c <strncpy+0x106>
    1c30:	00650693          	add	a3,a0,6
    1c34:	4719                	li	a4,6
    1c36:	b719                	j	1b3c <strncpy+0x106>

0000000000001c38 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c38:	87aa                	mv	a5,a0
    1c3a:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c3c:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c40:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c44:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c46:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c48:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c4c:	2501                	sext.w	a0,a0
    1c4e:	8082                	ret

0000000000001c50 <openat>:
    register long a7 __asm__("a7") = n;
    1c50:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c54:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c58:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c5c:	2501                	sext.w	a0,a0
    1c5e:	8082                	ret

0000000000001c60 <close>:
    register long a7 __asm__("a7") = n;
    1c60:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c64:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c68:	2501                	sext.w	a0,a0
    1c6a:	8082                	ret

0000000000001c6c <read>:
    register long a7 __asm__("a7") = n;
    1c6c:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c70:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c74:	8082                	ret

0000000000001c76 <write>:
    register long a7 __asm__("a7") = n;
    1c76:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c7a:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c7e:	8082                	ret

0000000000001c80 <getpid>:
    register long a7 __asm__("a7") = n;
    1c80:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c84:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c88:	2501                	sext.w	a0,a0
    1c8a:	8082                	ret

0000000000001c8c <getppid>:
    register long a7 __asm__("a7") = n;
    1c8c:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c90:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c94:	2501                	sext.w	a0,a0
    1c96:	8082                	ret

0000000000001c98 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c98:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c9c:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1ca0:	2501                	sext.w	a0,a0
    1ca2:	8082                	ret

0000000000001ca4 <fork>:
    register long a7 __asm__("a7") = n;
    1ca4:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1ca8:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1caa:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cac:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cb0:	2501                	sext.w	a0,a0
    1cb2:	8082                	ret

0000000000001cb4 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cb4:	85b2                	mv	a1,a2
    1cb6:	863a                	mv	a2,a4
    if (stack)
    1cb8:	c191                	beqz	a1,1cbc <clone+0x8>
	stack += stack_size;
    1cba:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cbc:	4781                	li	a5,0
    1cbe:	4701                	li	a4,0
    1cc0:	4681                	li	a3,0
    1cc2:	2601                	sext.w	a2,a2
    1cc4:	a2ed                	j	1eae <__clone>

0000000000001cc6 <exit>:
    register long a7 __asm__("a7") = n;
    1cc6:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cca:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cce:	8082                	ret

0000000000001cd0 <waitpid>:
    register long a7 __asm__("a7") = n;
    1cd0:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cd4:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cd6:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cda:	2501                	sext.w	a0,a0
    1cdc:	8082                	ret

0000000000001cde <exec>:
    register long a7 __asm__("a7") = n;
    1cde:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1ce2:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1ce6:	2501                	sext.w	a0,a0
    1ce8:	8082                	ret

0000000000001cea <execve>:
    register long a7 __asm__("a7") = n;
    1cea:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cee:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cf2:	2501                	sext.w	a0,a0
    1cf4:	8082                	ret

0000000000001cf6 <times>:
    register long a7 __asm__("a7") = n;
    1cf6:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cfa:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1cfe:	2501                	sext.w	a0,a0
    1d00:	8082                	ret

0000000000001d02 <get_time>:

int64 get_time()
{
    1d02:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d04:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d08:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d0a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d0c:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d10:	2501                	sext.w	a0,a0
    1d12:	ed09                	bnez	a0,1d2c <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d14:	67a2                	ld	a5,8(sp)
    1d16:	3e800713          	li	a4,1000
    1d1a:	00015503          	lhu	a0,0(sp)
    1d1e:	02e7d7b3          	divu	a5,a5,a4
    1d22:	02e50533          	mul	a0,a0,a4
    1d26:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d28:	0141                	add	sp,sp,16
    1d2a:	8082                	ret
        return -1;
    1d2c:	557d                	li	a0,-1
    1d2e:	bfed                	j	1d28 <get_time+0x26>

0000000000001d30 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d30:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d34:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d38:	2501                	sext.w	a0,a0
    1d3a:	8082                	ret

0000000000001d3c <time>:
    register long a7 __asm__("a7") = n;
    1d3c:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d40:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d44:	2501                	sext.w	a0,a0
    1d46:	8082                	ret

0000000000001d48 <sleep>:

int sleep(unsigned long long time)
{
    1d48:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d4a:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d4c:	850a                	mv	a0,sp
    1d4e:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d50:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d54:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d56:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d5a:	e501                	bnez	a0,1d62 <sleep+0x1a>
    return 0;
    1d5c:	4501                	li	a0,0
}
    1d5e:	0141                	add	sp,sp,16
    1d60:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d62:	4502                	lw	a0,0(sp)
}
    1d64:	0141                	add	sp,sp,16
    1d66:	8082                	ret

0000000000001d68 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d68:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d6c:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d70:	2501                	sext.w	a0,a0
    1d72:	8082                	ret

0000000000001d74 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d74:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d78:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d7c:	8082                	ret

0000000000001d7e <munmap>:
    register long a7 __asm__("a7") = n;
    1d7e:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d82:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d86:	2501                	sext.w	a0,a0
    1d88:	8082                	ret

0000000000001d8a <wait>:

int wait(int *code)
{
    1d8a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d8c:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d90:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d92:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d94:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d96:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d9a:	2501                	sext.w	a0,a0
    1d9c:	8082                	ret

0000000000001d9e <spawn>:
    register long a7 __asm__("a7") = n;
    1d9e:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1da2:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1da6:	2501                	sext.w	a0,a0
    1da8:	8082                	ret

0000000000001daa <mailread>:
    register long a7 __asm__("a7") = n;
    1daa:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dae:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1db2:	2501                	sext.w	a0,a0
    1db4:	8082                	ret

0000000000001db6 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1db6:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dba:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	8082                	ret

0000000000001dc2 <fstat>:
    register long a7 __asm__("a7") = n;
    1dc2:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc6:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dca:	2501                	sext.w	a0,a0
    1dcc:	8082                	ret

0000000000001dce <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dce:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dd0:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dd4:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dd6:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1dda:	2501                	sext.w	a0,a0
    1ddc:	8082                	ret

0000000000001dde <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1dde:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1de0:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1de4:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de6:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1dea:	2501                	sext.w	a0,a0
    1dec:	8082                	ret

0000000000001dee <link>:

int link(char *old_path, char *new_path)
{
    1dee:	87aa                	mv	a5,a0
    1df0:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1df2:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1df6:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1dfa:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1dfc:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e00:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e02:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e06:	2501                	sext.w	a0,a0
    1e08:	8082                	ret

0000000000001e0a <unlink>:

int unlink(char *path)
{
    1e0a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e0c:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e10:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e14:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e16:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e1a:	2501                	sext.w	a0,a0
    1e1c:	8082                	ret

0000000000001e1e <uname>:
    register long a7 __asm__("a7") = n;
    1e1e:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e22:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e26:	2501                	sext.w	a0,a0
    1e28:	8082                	ret

0000000000001e2a <brk>:
    register long a7 __asm__("a7") = n;
    1e2a:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e2e:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e32:	2501                	sext.w	a0,a0
    1e34:	8082                	ret

0000000000001e36 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e36:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e38:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e3c:	8082                	ret

0000000000001e3e <chdir>:
    register long a7 __asm__("a7") = n;
    1e3e:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e42:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e46:	2501                	sext.w	a0,a0
    1e48:	8082                	ret

0000000000001e4a <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e4a:	862e                	mv	a2,a1
    1e4c:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e4e:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e50:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e54:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e58:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e5a:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e5c:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e60:	2501                	sext.w	a0,a0
    1e62:	8082                	ret

0000000000001e64 <getdents>:
    register long a7 __asm__("a7") = n;
    1e64:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e68:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e6c:	2501                	sext.w	a0,a0
    1e6e:	8082                	ret

0000000000001e70 <pipe>:
    register long a7 __asm__("a7") = n;
    1e70:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e74:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e76:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e7a:	2501                	sext.w	a0,a0
    1e7c:	8082                	ret

0000000000001e7e <dup>:
    register long a7 __asm__("a7") = n;
    1e7e:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e80:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e84:	2501                	sext.w	a0,a0
    1e86:	8082                	ret

0000000000001e88 <dup2>:
    register long a7 __asm__("a7") = n;
    1e88:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e8a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e8c:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e90:	2501                	sext.w	a0,a0
    1e92:	8082                	ret

0000000000001e94 <mount>:
    register long a7 __asm__("a7") = n;
    1e94:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e98:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e9c:	2501                	sext.w	a0,a0
    1e9e:	8082                	ret

0000000000001ea0 <umount>:
    register long a7 __asm__("a7") = n;
    1ea0:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ea4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea6:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1eaa:	2501                	sext.w	a0,a0
    1eac:	8082                	ret

0000000000001eae <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1eae:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1eb0:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1eb2:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1eb4:	8532                	mv	a0,a2
	mv a2, a4
    1eb6:	863a                	mv	a2,a4
	mv a3, a5
    1eb8:	86be                	mv	a3,a5
	mv a4, a6
    1eba:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ebc:	0dc00893          	li	a7,220
	ecall
    1ec0:	00000073          	ecall

	beqz a0, 1f
    1ec4:	c111                	beqz	a0,1ec8 <__clone+0x1a>
	# Parent
	ret
    1ec6:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ec8:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1eca:	6522                	ld	a0,8(sp)
	jalr a1
    1ecc:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ece:	05d00893          	li	a7,93
	ecall
    1ed2:	00000073          	ecall
