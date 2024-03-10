
/home/windflower/Desktop/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/uname:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a86d                	j	10bc <__start_main>

0000000000001004 <test_uname>:
	char domainname[65];
};

struct utsname un;

void test_uname() {
    1004:	1141                	add	sp,sp,-16
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	efa50513          	add	a0,a0,-262 # 1f00 <__clone+0x2c>
void test_uname() {
    100e:	e406                	sd	ra,8(sp)
	TEST_START(__func__);
    1010:	2e4000ef          	jal	12f4 <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	0f450513          	add	a0,a0,244 # 2108 <__func__.0>
    101c:	2d8000ef          	jal	12f4 <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	ef850513          	add	a0,a0,-264 # 1f18 <__clone+0x44>
    1028:	2cc000ef          	jal	12f4 <puts>
	int test_ret = uname(&un);
    102c:	00001517          	auipc	a0,0x1
    1030:	f5450513          	add	a0,a0,-172 # 1f80 <un>
    1034:	611000ef          	jal	1e44 <uname>
	assert(test_ret >= 0);
    1038:	06054363          	bltz	a0,109e <test_uname+0x9a>

	printf("Uname: %s %s %s %s %s %s\n", 
    103c:	00001817          	auipc	a6,0x1
    1040:	08980813          	add	a6,a6,137 # 20c5 <un+0x145>
    1044:	00001797          	auipc	a5,0x1
    1048:	04078793          	add	a5,a5,64 # 2084 <un+0x104>
    104c:	00001717          	auipc	a4,0x1
    1050:	ff770713          	add	a4,a4,-9 # 2043 <un+0xc3>
    1054:	00001697          	auipc	a3,0x1
    1058:	fae68693          	add	a3,a3,-82 # 2002 <un+0x82>
    105c:	00001617          	auipc	a2,0x1
    1060:	f6560613          	add	a2,a2,-155 # 1fc1 <un+0x41>
    1064:	00001597          	auipc	a1,0x1
    1068:	f1c58593          	add	a1,a1,-228 # 1f80 <un>
    106c:	00001517          	auipc	a0,0x1
    1070:	edc50513          	add	a0,a0,-292 # 1f48 <__clone+0x74>
    1074:	2a2000ef          	jal	1316 <printf>
		un.sysname, un.nodename, un.release, un.version, un.machine, un.domainname);

	TEST_END(__func__);
    1078:	00001517          	auipc	a0,0x1
    107c:	ef050513          	add	a0,a0,-272 # 1f68 <__clone+0x94>
    1080:	274000ef          	jal	12f4 <puts>
    1084:	00001517          	auipc	a0,0x1
    1088:	08450513          	add	a0,a0,132 # 2108 <__func__.0>
    108c:	268000ef          	jal	12f4 <puts>
}
    1090:	60a2                	ld	ra,8(sp)
	TEST_END(__func__);
    1092:	00001517          	auipc	a0,0x1
    1096:	e8650513          	add	a0,a0,-378 # 1f18 <__clone+0x44>
}
    109a:	0141                	add	sp,sp,16
	TEST_END(__func__);
    109c:	aca1                	j	12f4 <puts>
	assert(test_ret >= 0);
    109e:	00001517          	auipc	a0,0x1
    10a2:	e8a50513          	add	a0,a0,-374 # 1f28 <__clone+0x54>
    10a6:	4ee000ef          	jal	1594 <panic>
    10aa:	bf49                	j	103c <test_uname+0x38>

00000000000010ac <main>:

int main(void) {
    10ac:	1141                	add	sp,sp,-16
    10ae:	e406                	sd	ra,8(sp)
	test_uname();
    10b0:	f55ff0ef          	jal	1004 <test_uname>
	return 0;
}
    10b4:	60a2                	ld	ra,8(sp)
    10b6:	4501                	li	a0,0
    10b8:	0141                	add	sp,sp,16
    10ba:	8082                	ret

00000000000010bc <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10bc:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10be:	4108                	lw	a0,0(a0)
{
    10c0:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10c2:	05a1                	add	a1,a1,8
{
    10c4:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10c6:	fe7ff0ef          	jal	10ac <main>
    10ca:	423000ef          	jal	1cec <exit>
	return 0;
}
    10ce:	60a2                	ld	ra,8(sp)
    10d0:	4501                	li	a0,0
    10d2:	0141                	add	sp,sp,16
    10d4:	8082                	ret

00000000000010d6 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10d6:	7179                	add	sp,sp,-48
    10d8:	f406                	sd	ra,40(sp)
    10da:	0005081b          	sext.w	a6,a0
    10de:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10e0:	00055563          	bgez	a0,10ea <printint.constprop.0+0x14>
        x = -xx;
    10e4:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    10e8:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10ea:	02b8763b          	remuw	a2,a6,a1
    10ee:	00001697          	auipc	a3,0x1
    10f2:	02a68693          	add	a3,a3,42 # 2118 <digits>
    buf[16] = 0;
    10f6:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10fa:	0005871b          	sext.w	a4,a1
    10fe:	1602                	sll	a2,a2,0x20
    1100:	9201                	srl	a2,a2,0x20
    1102:	9636                	add	a2,a2,a3
    1104:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1108:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    110c:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1110:	10b86c63          	bltu	a6,a1,1228 <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    1114:	02e5763b          	remuw	a2,a0,a4
    1118:	1602                	sll	a2,a2,0x20
    111a:	9201                	srl	a2,a2,0x20
    111c:	9636                	add	a2,a2,a3
    111e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1122:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1126:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    112a:	10e56863          	bltu	a0,a4,123a <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    112e:	02e5f63b          	remuw	a2,a1,a4
    1132:	1602                	sll	a2,a2,0x20
    1134:	9201                	srl	a2,a2,0x20
    1136:	9636                	add	a2,a2,a3
    1138:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    113c:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1140:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1144:	10e5e463          	bltu	a1,a4,124c <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    1148:	02e5763b          	remuw	a2,a0,a4
    114c:	1602                	sll	a2,a2,0x20
    114e:	9201                	srl	a2,a2,0x20
    1150:	9636                	add	a2,a2,a3
    1152:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1156:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    115a:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    115e:	10e56063          	bltu	a0,a4,125e <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    1162:	02e5f63b          	remuw	a2,a1,a4
    1166:	1602                	sll	a2,a2,0x20
    1168:	9201                	srl	a2,a2,0x20
    116a:	9636                	add	a2,a2,a3
    116c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1170:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1174:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1178:	0ee5ec63          	bltu	a1,a4,1270 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    117c:	02e5763b          	remuw	a2,a0,a4
    1180:	1602                	sll	a2,a2,0x20
    1182:	9201                	srl	a2,a2,0x20
    1184:	9636                	add	a2,a2,a3
    1186:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    118a:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    118e:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1192:	08e56263          	bltu	a0,a4,1216 <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    1196:	02e5f63b          	remuw	a2,a1,a4
    119a:	1602                	sll	a2,a2,0x20
    119c:	9201                	srl	a2,a2,0x20
    119e:	9636                	add	a2,a2,a3
    11a0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a4:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11a8:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11ac:	0ce5eb63          	bltu	a1,a4,1282 <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    11b0:	02e5763b          	remuw	a2,a0,a4
    11b4:	1602                	sll	a2,a2,0x20
    11b6:	9201                	srl	a2,a2,0x20
    11b8:	9636                	add	a2,a2,a3
    11ba:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11be:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11c2:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11c6:	0ce56763          	bltu	a0,a4,1294 <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    11ca:	02e5f63b          	remuw	a2,a1,a4
    11ce:	1602                	sll	a2,a2,0x20
    11d0:	9201                	srl	a2,a2,0x20
    11d2:	9636                	add	a2,a2,a3
    11d4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11d8:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11dc:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11e0:	0ce5e363          	bltu	a1,a4,12a6 <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    11e4:	1782                	sll	a5,a5,0x20
    11e6:	9381                	srl	a5,a5,0x20
    11e8:	96be                	add	a3,a3,a5
    11ea:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    11ee:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    11f0:	00f10723          	sb	a5,14(sp)
    if (sign)
    11f4:	00088763          	beqz	a7,1202 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11f8:	02d00793          	li	a5,45
    11fc:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1200:	4595                	li	a1,5
    write(f, s, l);
    1202:	003c                	add	a5,sp,8
    1204:	4641                	li	a2,16
    1206:	9e0d                	subw	a2,a2,a1
    1208:	4505                	li	a0,1
    120a:	95be                	add	a1,a1,a5
    120c:	291000ef          	jal	1c9c <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1210:	70a2                	ld	ra,40(sp)
    1212:	6145                	add	sp,sp,48
    1214:	8082                	ret
    i++;
    1216:	45a9                	li	a1,10
    if (sign)
    1218:	fe0885e3          	beqz	a7,1202 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    121c:	02d00793          	li	a5,45
    1220:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1224:	45a5                	li	a1,9
    1226:	bff1                	j	1202 <printint.constprop.0+0x12c>
    i++;
    1228:	45bd                	li	a1,15
    if (sign)
    122a:	fc088ce3          	beqz	a7,1202 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    122e:	02d00793          	li	a5,45
    1232:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1236:	45b9                	li	a1,14
    1238:	b7e9                	j	1202 <printint.constprop.0+0x12c>
    i++;
    123a:	45b9                	li	a1,14
    if (sign)
    123c:	fc0883e3          	beqz	a7,1202 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1240:	02d00793          	li	a5,45
    1244:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1248:	45b5                	li	a1,13
    124a:	bf65                	j	1202 <printint.constprop.0+0x12c>
    i++;
    124c:	45b5                	li	a1,13
    if (sign)
    124e:	fa088ae3          	beqz	a7,1202 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1252:	02d00793          	li	a5,45
    1256:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    125a:	45b1                	li	a1,12
    125c:	b75d                	j	1202 <printint.constprop.0+0x12c>
    i++;
    125e:	45b1                	li	a1,12
    if (sign)
    1260:	fa0881e3          	beqz	a7,1202 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1264:	02d00793          	li	a5,45
    1268:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    126c:	45ad                	li	a1,11
    126e:	bf51                	j	1202 <printint.constprop.0+0x12c>
    i++;
    1270:	45ad                	li	a1,11
    if (sign)
    1272:	f80888e3          	beqz	a7,1202 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1276:	02d00793          	li	a5,45
    127a:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    127e:	45a9                	li	a1,10
    1280:	b749                	j	1202 <printint.constprop.0+0x12c>
    i++;
    1282:	45a5                	li	a1,9
    if (sign)
    1284:	f6088fe3          	beqz	a7,1202 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1288:	02d00793          	li	a5,45
    128c:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1290:	45a1                	li	a1,8
    1292:	bf85                	j	1202 <printint.constprop.0+0x12c>
    i++;
    1294:	45a1                	li	a1,8
    if (sign)
    1296:	f60886e3          	beqz	a7,1202 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    129a:	02d00793          	li	a5,45
    129e:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12a2:	459d                	li	a1,7
    12a4:	bfb9                	j	1202 <printint.constprop.0+0x12c>
    i++;
    12a6:	459d                	li	a1,7
    if (sign)
    12a8:	f4088de3          	beqz	a7,1202 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12ac:	02d00793          	li	a5,45
    12b0:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12b4:	4599                	li	a1,6
    12b6:	b7b1                	j	1202 <printint.constprop.0+0x12c>

00000000000012b8 <getchar>:
{
    12b8:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12ba:	00f10593          	add	a1,sp,15
    12be:	4605                	li	a2,1
    12c0:	4501                	li	a0,0
{
    12c2:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12c4:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12c8:	1cb000ef          	jal	1c92 <read>
}
    12cc:	60e2                	ld	ra,24(sp)
    12ce:	00f14503          	lbu	a0,15(sp)
    12d2:	6105                	add	sp,sp,32
    12d4:	8082                	ret

00000000000012d6 <putchar>:
{
    12d6:	1101                	add	sp,sp,-32
    12d8:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12da:	00f10593          	add	a1,sp,15
    12de:	4605                	li	a2,1
    12e0:	4505                	li	a0,1
{
    12e2:	ec06                	sd	ra,24(sp)
    char byte = c;
    12e4:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12e8:	1b5000ef          	jal	1c9c <write>
}
    12ec:	60e2                	ld	ra,24(sp)
    12ee:	2501                	sext.w	a0,a0
    12f0:	6105                	add	sp,sp,32
    12f2:	8082                	ret

00000000000012f4 <puts>:
{
    12f4:	1141                	add	sp,sp,-16
    12f6:	e406                	sd	ra,8(sp)
    12f8:	e022                	sd	s0,0(sp)
    12fa:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12fc:	56c000ef          	jal	1868 <strlen>
    1300:	862a                	mv	a2,a0
    1302:	85a2                	mv	a1,s0
    1304:	4505                	li	a0,1
    1306:	197000ef          	jal	1c9c <write>
}
    130a:	60a2                	ld	ra,8(sp)
    130c:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    130e:	957d                	sra	a0,a0,0x3f
    return r;
    1310:	2501                	sext.w	a0,a0
}
    1312:	0141                	add	sp,sp,16
    1314:	8082                	ret

0000000000001316 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1316:	7131                	add	sp,sp,-192
    1318:	e4d6                	sd	s5,72(sp)
    131a:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    131c:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    131e:	013c                	add	a5,sp,136
{
    1320:	f0ca                	sd	s2,96(sp)
    1322:	ecce                	sd	s3,88(sp)
    1324:	e8d2                	sd	s4,80(sp)
    1326:	e0da                	sd	s6,64(sp)
    1328:	fc5e                	sd	s7,56(sp)
    132a:	fc86                	sd	ra,120(sp)
    132c:	f8a2                	sd	s0,112(sp)
    132e:	f4a6                	sd	s1,104(sp)
    1330:	e52e                	sd	a1,136(sp)
    1332:	e932                	sd	a2,144(sp)
    1334:	ed36                	sd	a3,152(sp)
    1336:	f13a                	sd	a4,160(sp)
    1338:	f942                	sd	a6,176(sp)
    133a:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    133c:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    133e:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1342:	07300a13          	li	s4,115
    1346:	07800b93          	li	s7,120
    134a:	06400b13          	li	s6,100
    buf[i++] = '0';
    134e:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x5718>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1352:	00001997          	auipc	s3,0x1
    1356:	dc698993          	add	s3,s3,-570 # 2118 <digits>
        if (!*s)
    135a:	00054783          	lbu	a5,0(a0)
    135e:	16078863          	beqz	a5,14ce <printf+0x1b8>
    1362:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1364:	19278063          	beq	a5,s2,14e4 <printf+0x1ce>
    1368:	00164783          	lbu	a5,1(a2)
    136c:	0605                	add	a2,a2,1
    136e:	fbfd                	bnez	a5,1364 <printf+0x4e>
    1370:	84b2                	mv	s1,a2
        l = z - a;
    1372:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1376:	85aa                	mv	a1,a0
    1378:	8622                	mv	a2,s0
    137a:	4505                	li	a0,1
    137c:	121000ef          	jal	1c9c <write>
        if (l)
    1380:	18041763          	bnez	s0,150e <printf+0x1f8>
        if (s[1] == 0)
    1384:	0014c783          	lbu	a5,1(s1)
    1388:	14078363          	beqz	a5,14ce <printf+0x1b8>
        switch (s[1])
    138c:	19478f63          	beq	a5,s4,152a <printf+0x214>
    1390:	18fa6163          	bltu	s4,a5,1512 <printf+0x1fc>
    1394:	1b678e63          	beq	a5,s6,1550 <printf+0x23a>
    1398:	07000713          	li	a4,112
    139c:	1ce79463          	bne	a5,a4,1564 <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13a0:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13a2:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13a6:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13a8:	631c                	ld	a5,0(a4)
    13aa:	0721                	add	a4,a4,8
    13ac:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13ae:	00479293          	sll	t0,a5,0x4
    13b2:	00879f93          	sll	t6,a5,0x8
    13b6:	00c79f13          	sll	t5,a5,0xc
    13ba:	01079e93          	sll	t4,a5,0x10
    13be:	01479e13          	sll	t3,a5,0x14
    13c2:	01879313          	sll	t1,a5,0x18
    13c6:	01c79893          	sll	a7,a5,0x1c
    13ca:	02479813          	sll	a6,a5,0x24
    13ce:	02879513          	sll	a0,a5,0x28
    13d2:	02c79593          	sll	a1,a5,0x2c
    13d6:	03079693          	sll	a3,a5,0x30
    13da:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13de:	03c7d413          	srl	s0,a5,0x3c
    13e2:	01c7d39b          	srlw	t2,a5,0x1c
    13e6:	03c2d293          	srl	t0,t0,0x3c
    13ea:	03cfdf93          	srl	t6,t6,0x3c
    13ee:	03cf5f13          	srl	t5,t5,0x3c
    13f2:	03cede93          	srl	t4,t4,0x3c
    13f6:	03ce5e13          	srl	t3,t3,0x3c
    13fa:	03c35313          	srl	t1,t1,0x3c
    13fe:	03c8d893          	srl	a7,a7,0x3c
    1402:	03c85813          	srl	a6,a6,0x3c
    1406:	9171                	srl	a0,a0,0x3c
    1408:	91f1                	srl	a1,a1,0x3c
    140a:	92f1                	srl	a3,a3,0x3c
    140c:	9371                	srl	a4,a4,0x3c
    140e:	974e                	add	a4,a4,s3
    1410:	944e                	add	s0,s0,s3
    1412:	92ce                	add	t0,t0,s3
    1414:	9fce                	add	t6,t6,s3
    1416:	9f4e                	add	t5,t5,s3
    1418:	9ece                	add	t4,t4,s3
    141a:	9e4e                	add	t3,t3,s3
    141c:	934e                	add	t1,t1,s3
    141e:	98ce                	add	a7,a7,s3
    1420:	93ce                	add	t2,t2,s3
    1422:	984e                	add	a6,a6,s3
    1424:	954e                	add	a0,a0,s3
    1426:	95ce                	add	a1,a1,s3
    1428:	96ce                	add	a3,a3,s3
    142a:	00074083          	lbu	ra,0(a4)
    142e:	0002c283          	lbu	t0,0(t0)
    1432:	000fcf83          	lbu	t6,0(t6)
    1436:	000f4f03          	lbu	t5,0(t5)
    143a:	000ece83          	lbu	t4,0(t4)
    143e:	000e4e03          	lbu	t3,0(t3)
    1442:	00034303          	lbu	t1,0(t1)
    1446:	0008c883          	lbu	a7,0(a7)
    144a:	0003c383          	lbu	t2,0(t2)
    144e:	00084803          	lbu	a6,0(a6)
    1452:	00054503          	lbu	a0,0(a0)
    1456:	0005c583          	lbu	a1,0(a1)
    145a:	0006c683          	lbu	a3,0(a3)
    145e:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1462:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1466:	9371                	srl	a4,a4,0x3c
    1468:	8bbd                	and	a5,a5,15
    146a:	974e                	add	a4,a4,s3
    146c:	97ce                	add	a5,a5,s3
    146e:	005105a3          	sb	t0,11(sp)
    1472:	01f10623          	sb	t6,12(sp)
    1476:	01e106a3          	sb	t5,13(sp)
    147a:	01d10723          	sb	t4,14(sp)
    147e:	01c107a3          	sb	t3,15(sp)
    1482:	00610823          	sb	t1,16(sp)
    1486:	011108a3          	sb	a7,17(sp)
    148a:	00710923          	sb	t2,18(sp)
    148e:	010109a3          	sb	a6,19(sp)
    1492:	00a10a23          	sb	a0,20(sp)
    1496:	00b10aa3          	sb	a1,21(sp)
    149a:	00d10b23          	sb	a3,22(sp)
    149e:	00110ba3          	sb	ra,23(sp)
    14a2:	00810523          	sb	s0,10(sp)
    14a6:	00074703          	lbu	a4,0(a4)
    14aa:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14ae:	002c                	add	a1,sp,8
    14b0:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14b2:	00e10c23          	sb	a4,24(sp)
    14b6:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14ba:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14be:	7de000ef          	jal	1c9c <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14c2:	00248513          	add	a0,s1,2
        if (!*s)
    14c6:	00054783          	lbu	a5,0(a0)
    14ca:	e8079ce3          	bnez	a5,1362 <printf+0x4c>
    }
    va_end(ap);
}
    14ce:	70e6                	ld	ra,120(sp)
    14d0:	7446                	ld	s0,112(sp)
    14d2:	74a6                	ld	s1,104(sp)
    14d4:	7906                	ld	s2,96(sp)
    14d6:	69e6                	ld	s3,88(sp)
    14d8:	6a46                	ld	s4,80(sp)
    14da:	6aa6                	ld	s5,72(sp)
    14dc:	6b06                	ld	s6,64(sp)
    14de:	7be2                	ld	s7,56(sp)
    14e0:	6129                	add	sp,sp,192
    14e2:	8082                	ret
    14e4:	84b2                	mv	s1,a2
    14e6:	a039                	j	14f4 <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14e8:	0024c783          	lbu	a5,2(s1)
    14ec:	0605                	add	a2,a2,1
    14ee:	0489                	add	s1,s1,2
    14f0:	e92791e3          	bne	a5,s2,1372 <printf+0x5c>
    14f4:	0014c783          	lbu	a5,1(s1)
    14f8:	ff2788e3          	beq	a5,s2,14e8 <printf+0x1d2>
        l = z - a;
    14fc:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1500:	85aa                	mv	a1,a0
    1502:	8622                	mv	a2,s0
    1504:	4505                	li	a0,1
    1506:	796000ef          	jal	1c9c <write>
        if (l)
    150a:	e6040de3          	beqz	s0,1384 <printf+0x6e>
    150e:	8526                	mv	a0,s1
    1510:	b5a9                	j	135a <printf+0x44>
        switch (s[1])
    1512:	05779963          	bne	a5,s7,1564 <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    1516:	6782                	ld	a5,0(sp)
    1518:	45c1                	li	a1,16
    151a:	4388                	lw	a0,0(a5)
    151c:	07a1                	add	a5,a5,8
    151e:	e03e                	sd	a5,0(sp)
    1520:	bb7ff0ef          	jal	10d6 <printint.constprop.0>
        s += 2;
    1524:	00248513          	add	a0,s1,2
    1528:	bf79                	j	14c6 <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    152a:	6782                	ld	a5,0(sp)
    152c:	6380                	ld	s0,0(a5)
    152e:	07a1                	add	a5,a5,8
    1530:	e03e                	sd	a5,0(sp)
    1532:	cc21                	beqz	s0,158a <printf+0x274>
            l = strnlen(a, 200);
    1534:	0c800593          	li	a1,200
    1538:	8522                	mv	a0,s0
    153a:	460000ef          	jal	199a <strnlen>
    write(f, s, l);
    153e:	0005061b          	sext.w	a2,a0
    1542:	85a2                	mv	a1,s0
    1544:	4505                	li	a0,1
    1546:	756000ef          	jal	1c9c <write>
        s += 2;
    154a:	00248513          	add	a0,s1,2
    154e:	bfa5                	j	14c6 <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    1550:	6782                	ld	a5,0(sp)
    1552:	45a9                	li	a1,10
    1554:	4388                	lw	a0,0(a5)
    1556:	07a1                	add	a5,a5,8
    1558:	e03e                	sd	a5,0(sp)
    155a:	b7dff0ef          	jal	10d6 <printint.constprop.0>
        s += 2;
    155e:	00248513          	add	a0,s1,2
    1562:	b795                	j	14c6 <printf+0x1b0>
    return write(stdout, &byte, 1);
    1564:	4605                	li	a2,1
    1566:	002c                	add	a1,sp,8
    1568:	4505                	li	a0,1
    char byte = c;
    156a:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    156e:	72e000ef          	jal	1c9c <write>
    char byte = c;
    1572:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1576:	4605                	li	a2,1
    1578:	002c                	add	a1,sp,8
    157a:	4505                	li	a0,1
    char byte = c;
    157c:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1580:	71c000ef          	jal	1c9c <write>
        s += 2;
    1584:	00248513          	add	a0,s1,2
    1588:	bf3d                	j	14c6 <printf+0x1b0>
                a = "(null)";
    158a:	00001417          	auipc	s0,0x1
    158e:	9ee40413          	add	s0,s0,-1554 # 1f78 <__clone+0xa4>
    1592:	b74d                	j	1534 <printf+0x21e>

0000000000001594 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1594:	1141                	add	sp,sp,-16
    1596:	e406                	sd	ra,8(sp)
    puts(m);
    1598:	d5dff0ef          	jal	12f4 <puts>
    exit(-100);
}
    159c:	60a2                	ld	ra,8(sp)
    exit(-100);
    159e:	f9c00513          	li	a0,-100
}
    15a2:	0141                	add	sp,sp,16
    exit(-100);
    15a4:	a7a1                	j	1cec <exit>

00000000000015a6 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a6:	02000793          	li	a5,32
    15aa:	00f50663          	beq	a0,a5,15b6 <isspace+0x10>
    15ae:	355d                	addw	a0,a0,-9
    15b0:	00553513          	sltiu	a0,a0,5
    15b4:	8082                	ret
    15b6:	4505                	li	a0,1
}
    15b8:	8082                	ret

00000000000015ba <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15ba:	fd05051b          	addw	a0,a0,-48
}
    15be:	00a53513          	sltiu	a0,a0,10
    15c2:	8082                	ret

00000000000015c4 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15c4:	02000713          	li	a4,32
    15c8:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15ca:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ce:	ff76879b          	addw	a5,a3,-9
    15d2:	06e68063          	beq	a3,a4,1632 <atoi+0x6e>
    15d6:	0006859b          	sext.w	a1,a3
    15da:	04f67c63          	bgeu	a2,a5,1632 <atoi+0x6e>
        s++;
    switch (*s)
    15de:	02b00793          	li	a5,43
    15e2:	06f68563          	beq	a3,a5,164c <atoi+0x88>
    15e6:	02d00793          	li	a5,45
    15ea:	04f69663          	bne	a3,a5,1636 <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15ee:	00154683          	lbu	a3,1(a0)
    15f2:	47a5                	li	a5,9
        s++;
    15f4:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    15f8:	fd06869b          	addw	a3,a3,-48
    15fc:	8636                	mv	a2,a3
    while (isdigit(*s))
    15fe:	04d7e563          	bltu	a5,a3,1648 <atoi+0x84>
        neg = 1;
    1602:	4885                	li	a7,1
    int n = 0, neg = 0;
    1604:	4501                	li	a0,0
    while (isdigit(*s))
    1606:	4825                	li	a6,9
    1608:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    160c:	0025179b          	sllw	a5,a0,0x2
    1610:	9fa9                	addw	a5,a5,a0
    1612:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    1616:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    161a:	85b2                	mv	a1,a2
    161c:	40c7853b          	subw	a0,a5,a2
    1620:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    1622:	8636                	mv	a2,a3
    while (isdigit(*s))
    1624:	fed872e3          	bgeu	a6,a3,1608 <atoi+0x44>
    return neg ? n : -n;
    1628:	02089163          	bnez	a7,164a <atoi+0x86>
    162c:	40f5853b          	subw	a0,a1,a5
    1630:	8082                	ret
        s++;
    1632:	0505                	add	a0,a0,1
    1634:	bf59                	j	15ca <atoi+0x6>
    while (isdigit(*s))
    1636:	fd05859b          	addw	a1,a1,-48
    163a:	47a5                	li	a5,9
    163c:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    163e:	4881                	li	a7,0
    1640:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    1644:	fcb7f0e3          	bgeu	a5,a1,1604 <atoi+0x40>
    return neg ? n : -n;
    1648:	4501                	li	a0,0
}
    164a:	8082                	ret
    while (isdigit(*s))
    164c:	00154683          	lbu	a3,1(a0)
    1650:	47a5                	li	a5,9
        s++;
    1652:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1656:	fd06869b          	addw	a3,a3,-48
    165a:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    165c:	4881                	li	a7,0
    while (isdigit(*s))
    165e:	fad7f3e3          	bgeu	a5,a3,1604 <atoi+0x40>
    return neg ? n : -n;
    1662:	4501                	li	a0,0
    1664:	8082                	ret

0000000000001666 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1666:	16060f63          	beqz	a2,17e4 <memset+0x17e>
    166a:	40a006b3          	neg	a3,a0
    166e:	0076f793          	and	a5,a3,7
    1672:	00778813          	add	a6,a5,7
    1676:	48ad                	li	a7,11
    1678:	0ff5f713          	zext.b	a4,a1
    167c:	fff60593          	add	a1,a2,-1
    1680:	17186363          	bltu	a6,a7,17e6 <memset+0x180>
    1684:	1705eb63          	bltu	a1,a6,17fa <memset+0x194>
    1688:	16078163          	beqz	a5,17ea <memset+0x184>
    168c:	00e50023          	sb	a4,0(a0)
    1690:	0066f593          	and	a1,a3,6
    1694:	14058e63          	beqz	a1,17f0 <memset+0x18a>
    1698:	00e500a3          	sb	a4,1(a0)
    169c:	4589                	li	a1,2
    169e:	00250813          	add	a6,a0,2
    16a2:	04f5f663          	bgeu	a1,a5,16ee <memset+0x88>
    16a6:	00e50123          	sb	a4,2(a0)
    16aa:	8a91                	and	a3,a3,4
    16ac:	00350813          	add	a6,a0,3
    16b0:	458d                	li	a1,3
    16b2:	ce95                	beqz	a3,16ee <memset+0x88>
    16b4:	00e501a3          	sb	a4,3(a0)
    16b8:	4691                	li	a3,4
    16ba:	00450813          	add	a6,a0,4
    16be:	4591                	li	a1,4
    16c0:	02f6f763          	bgeu	a3,a5,16ee <memset+0x88>
    16c4:	00e50223          	sb	a4,4(a0)
    16c8:	4695                	li	a3,5
    16ca:	00550813          	add	a6,a0,5
    16ce:	4595                	li	a1,5
    16d0:	00d78f63          	beq	a5,a3,16ee <memset+0x88>
    16d4:	00e502a3          	sb	a4,5(a0)
    16d8:	469d                	li	a3,7
    16da:	00650813          	add	a6,a0,6
    16de:	4599                	li	a1,6
    16e0:	00d79763          	bne	a5,a3,16ee <memset+0x88>
    16e4:	00750813          	add	a6,a0,7
    16e8:	00e50323          	sb	a4,6(a0)
    16ec:	459d                	li	a1,7
    16ee:	00871693          	sll	a3,a4,0x8
    16f2:	01071313          	sll	t1,a4,0x10
    16f6:	8ed9                	or	a3,a3,a4
    16f8:	01871893          	sll	a7,a4,0x18
    16fc:	0066e6b3          	or	a3,a3,t1
    1700:	0116e6b3          	or	a3,a3,a7
    1704:	02071313          	sll	t1,a4,0x20
    1708:	02871893          	sll	a7,a4,0x28
    170c:	0066e6b3          	or	a3,a3,t1
    1710:	40f60e33          	sub	t3,a2,a5
    1714:	03071313          	sll	t1,a4,0x30
    1718:	0116e6b3          	or	a3,a3,a7
    171c:	0066e6b3          	or	a3,a3,t1
    1720:	03871893          	sll	a7,a4,0x38
    1724:	97aa                	add	a5,a5,a0
    1726:	ff8e7313          	and	t1,t3,-8
    172a:	0116e6b3          	or	a3,a3,a7
    172e:	00f308b3          	add	a7,t1,a5
    1732:	e394                	sd	a3,0(a5)
    1734:	07a1                	add	a5,a5,8
    1736:	ff179ee3          	bne	a5,a7,1732 <memset+0xcc>
    173a:	006806b3          	add	a3,a6,t1
    173e:	00b307bb          	addw	a5,t1,a1
    1742:	0bc30b63          	beq	t1,t3,17f8 <memset+0x192>
    1746:	00e68023          	sb	a4,0(a3)
    174a:	0017859b          	addw	a1,a5,1
    174e:	08c5fb63          	bgeu	a1,a2,17e4 <memset+0x17e>
    1752:	00e680a3          	sb	a4,1(a3)
    1756:	0027859b          	addw	a1,a5,2
    175a:	08c5f563          	bgeu	a1,a2,17e4 <memset+0x17e>
    175e:	00e68123          	sb	a4,2(a3)
    1762:	0037859b          	addw	a1,a5,3
    1766:	06c5ff63          	bgeu	a1,a2,17e4 <memset+0x17e>
    176a:	00e681a3          	sb	a4,3(a3)
    176e:	0047859b          	addw	a1,a5,4
    1772:	06c5f963          	bgeu	a1,a2,17e4 <memset+0x17e>
    1776:	00e68223          	sb	a4,4(a3)
    177a:	0057859b          	addw	a1,a5,5
    177e:	06c5f363          	bgeu	a1,a2,17e4 <memset+0x17e>
    1782:	00e682a3          	sb	a4,5(a3)
    1786:	0067859b          	addw	a1,a5,6
    178a:	04c5fd63          	bgeu	a1,a2,17e4 <memset+0x17e>
    178e:	00e68323          	sb	a4,6(a3)
    1792:	0077859b          	addw	a1,a5,7
    1796:	04c5f763          	bgeu	a1,a2,17e4 <memset+0x17e>
    179a:	00e683a3          	sb	a4,7(a3)
    179e:	0087859b          	addw	a1,a5,8
    17a2:	04c5f163          	bgeu	a1,a2,17e4 <memset+0x17e>
    17a6:	00e68423          	sb	a4,8(a3)
    17aa:	0097859b          	addw	a1,a5,9
    17ae:	02c5fb63          	bgeu	a1,a2,17e4 <memset+0x17e>
    17b2:	00e684a3          	sb	a4,9(a3)
    17b6:	00a7859b          	addw	a1,a5,10
    17ba:	02c5f563          	bgeu	a1,a2,17e4 <memset+0x17e>
    17be:	00e68523          	sb	a4,10(a3)
    17c2:	00b7859b          	addw	a1,a5,11
    17c6:	00c5ff63          	bgeu	a1,a2,17e4 <memset+0x17e>
    17ca:	00e685a3          	sb	a4,11(a3)
    17ce:	00c7859b          	addw	a1,a5,12
    17d2:	00c5f963          	bgeu	a1,a2,17e4 <memset+0x17e>
    17d6:	00e68623          	sb	a4,12(a3)
    17da:	27b5                	addw	a5,a5,13
    17dc:	00c7f463          	bgeu	a5,a2,17e4 <memset+0x17e>
    17e0:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17e4:	8082                	ret
    17e6:	482d                	li	a6,11
    17e8:	bd71                	j	1684 <memset+0x1e>
    char *p = dest;
    17ea:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17ec:	4581                	li	a1,0
    17ee:	b701                	j	16ee <memset+0x88>
    17f0:	00150813          	add	a6,a0,1
    17f4:	4585                	li	a1,1
    17f6:	bde5                	j	16ee <memset+0x88>
    17f8:	8082                	ret
    char *p = dest;
    17fa:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17fc:	4781                	li	a5,0
    17fe:	b7a1                	j	1746 <memset+0xe0>

0000000000001800 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1800:	00054783          	lbu	a5,0(a0)
    1804:	0005c703          	lbu	a4,0(a1)
    1808:	00e79863          	bne	a5,a4,1818 <strcmp+0x18>
    180c:	0505                	add	a0,a0,1
    180e:	0585                	add	a1,a1,1
    1810:	fbe5                	bnez	a5,1800 <strcmp>
    1812:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1814:	9d19                	subw	a0,a0,a4
    1816:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1818:	0007851b          	sext.w	a0,a5
    181c:	bfe5                	j	1814 <strcmp+0x14>

000000000000181e <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    181e:	ca15                	beqz	a2,1852 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1820:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1824:	167d                	add	a2,a2,-1
    1826:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    182a:	eb99                	bnez	a5,1840 <strncmp+0x22>
    182c:	a815                	j	1860 <strncmp+0x42>
    182e:	00a68e63          	beq	a3,a0,184a <strncmp+0x2c>
    1832:	0505                	add	a0,a0,1
    1834:	00f71b63          	bne	a4,a5,184a <strncmp+0x2c>
    1838:	00054783          	lbu	a5,0(a0)
    183c:	cf89                	beqz	a5,1856 <strncmp+0x38>
    183e:	85b2                	mv	a1,a2
    1840:	0005c703          	lbu	a4,0(a1)
    1844:	00158613          	add	a2,a1,1
    1848:	f37d                	bnez	a4,182e <strncmp+0x10>
        ;
    return *l - *r;
    184a:	0007851b          	sext.w	a0,a5
    184e:	9d19                	subw	a0,a0,a4
    1850:	8082                	ret
        return 0;
    1852:	4501                	li	a0,0
}
    1854:	8082                	ret
    return *l - *r;
    1856:	0015c703          	lbu	a4,1(a1)
    185a:	4501                	li	a0,0
    185c:	9d19                	subw	a0,a0,a4
    185e:	8082                	ret
    1860:	0005c703          	lbu	a4,0(a1)
    1864:	4501                	li	a0,0
    1866:	b7e5                	j	184e <strncmp+0x30>

0000000000001868 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1868:	00757793          	and	a5,a0,7
    186c:	cf89                	beqz	a5,1886 <strlen+0x1e>
    186e:	87aa                	mv	a5,a0
    1870:	a029                	j	187a <strlen+0x12>
    1872:	0785                	add	a5,a5,1
    1874:	0077f713          	and	a4,a5,7
    1878:	cb01                	beqz	a4,1888 <strlen+0x20>
        if (!*s)
    187a:	0007c703          	lbu	a4,0(a5)
    187e:	fb75                	bnez	a4,1872 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1880:	40a78533          	sub	a0,a5,a0
}
    1884:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1886:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1888:	feff05b7          	lui	a1,0xfeff0
    188c:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedde7>
    1890:	f0101637          	lui	a2,0xf0101
    1894:	05c2                	sll	a1,a1,0x10
    1896:	0612                	sll	a2,a2,0x4
    1898:	6394                	ld	a3,0(a5)
    189a:	eff58593          	add	a1,a1,-257
    189e:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00fefe9>
    18a2:	05c2                	sll	a1,a1,0x10
    18a4:	0642                	sll	a2,a2,0x10
    18a6:	eff58593          	add	a1,a1,-257
    18aa:	10160613          	add	a2,a2,257
    18ae:	00b68733          	add	a4,a3,a1
    18b2:	063e                	sll	a2,a2,0xf
    18b4:	fff6c693          	not	a3,a3
    18b8:	8f75                	and	a4,a4,a3
    18ba:	08060613          	add	a2,a2,128
    18be:	8f71                	and	a4,a4,a2
    18c0:	eb11                	bnez	a4,18d4 <strlen+0x6c>
    18c2:	6794                	ld	a3,8(a5)
    18c4:	07a1                	add	a5,a5,8
    18c6:	00b68733          	add	a4,a3,a1
    18ca:	fff6c693          	not	a3,a3
    18ce:	8f75                	and	a4,a4,a3
    18d0:	8f71                	and	a4,a4,a2
    18d2:	db65                	beqz	a4,18c2 <strlen+0x5a>
    for (; *s; s++)
    18d4:	0007c703          	lbu	a4,0(a5)
    18d8:	d745                	beqz	a4,1880 <strlen+0x18>
    18da:	0017c703          	lbu	a4,1(a5)
    18de:	0785                	add	a5,a5,1
    18e0:	d345                	beqz	a4,1880 <strlen+0x18>
    18e2:	0017c703          	lbu	a4,1(a5)
    18e6:	0785                	add	a5,a5,1
    18e8:	fb6d                	bnez	a4,18da <strlen+0x72>
    18ea:	bf59                	j	1880 <strlen+0x18>

00000000000018ec <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18ec:	00757713          	and	a4,a0,7
{
    18f0:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18f2:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18f6:	cb19                	beqz	a4,190c <memchr+0x20>
    18f8:	ce59                	beqz	a2,1996 <memchr+0xaa>
    18fa:	0007c703          	lbu	a4,0(a5)
    18fe:	00b70963          	beq	a4,a1,1910 <memchr+0x24>
    1902:	0785                	add	a5,a5,1
    1904:	0077f713          	and	a4,a5,7
    1908:	167d                	add	a2,a2,-1
    190a:	f77d                	bnez	a4,18f8 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    190c:	4501                	li	a0,0
    if (n && *s != c)
    190e:	c649                	beqz	a2,1998 <memchr+0xac>
    1910:	0007c703          	lbu	a4,0(a5)
    1914:	06b70663          	beq	a4,a1,1980 <memchr+0x94>
        size_t k = ONES * c;
    1918:	01010737          	lui	a4,0x1010
    191c:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100dfe9>
    1920:	0742                	sll	a4,a4,0x10
    1922:	10170713          	add	a4,a4,257
    1926:	0742                	sll	a4,a4,0x10
    1928:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    192c:	469d                	li	a3,7
        size_t k = ONES * c;
    192e:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1932:	04c6f763          	bgeu	a3,a2,1980 <memchr+0x94>
    1936:	f0101837          	lui	a6,0xf0101
    193a:	feff08b7          	lui	a7,0xfeff0
    193e:	0812                	sll	a6,a6,0x4
    1940:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedde7>
    1944:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00fefe9>
    1948:	08c2                	sll	a7,a7,0x10
    194a:	0842                	sll	a6,a6,0x10
    194c:	eff88893          	add	a7,a7,-257
    1950:	10180813          	add	a6,a6,257
    1954:	08c2                	sll	a7,a7,0x10
    1956:	083e                	sll	a6,a6,0xf
    1958:	eff88893          	add	a7,a7,-257
    195c:	08080813          	add	a6,a6,128
    1960:	431d                	li	t1,7
    1962:	a029                	j	196c <memchr+0x80>
    1964:	1661                	add	a2,a2,-8
    1966:	07a1                	add	a5,a5,8
    1968:	02c37663          	bgeu	t1,a2,1994 <memchr+0xa8>
    196c:	6398                	ld	a4,0(a5)
    196e:	8f29                	xor	a4,a4,a0
    1970:	011706b3          	add	a3,a4,a7
    1974:	fff74713          	not	a4,a4
    1978:	8f75                	and	a4,a4,a3
    197a:	01077733          	and	a4,a4,a6
    197e:	d37d                	beqz	a4,1964 <memchr+0x78>
        s = (const void *)w;
    1980:	853e                	mv	a0,a5
    1982:	a019                	j	1988 <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    1984:	0505                	add	a0,a0,1
    1986:	ca01                	beqz	a2,1996 <memchr+0xaa>
    1988:	00054783          	lbu	a5,0(a0)
    198c:	167d                	add	a2,a2,-1
    198e:	feb79be3          	bne	a5,a1,1984 <memchr+0x98>
    1992:	8082                	ret
    1994:	f675                	bnez	a2,1980 <memchr+0x94>
    return n ? (void *)s : 0;
    1996:	4501                	li	a0,0
}
    1998:	8082                	ret

000000000000199a <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    199a:	1101                	add	sp,sp,-32
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
    19aa:	f43ff0ef          	jal	18ec <memchr>
    return p ? p - s : n;
    19ae:	c519                	beqz	a0,19bc <strnlen+0x22>
}
    19b0:	60e2                	ld	ra,24(sp)
    19b2:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19b4:	8d05                	sub	a0,a0,s1
}
    19b6:	64a2                	ld	s1,8(sp)
    19b8:	6105                	add	sp,sp,32
    19ba:	8082                	ret
    19bc:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19be:	8522                	mv	a0,s0
}
    19c0:	6442                	ld	s0,16(sp)
    19c2:	64a2                	ld	s1,8(sp)
    19c4:	6105                	add	sp,sp,32
    19c6:	8082                	ret

00000000000019c8 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19c8:	00b547b3          	xor	a5,a0,a1
    19cc:	8b9d                	and	a5,a5,7
    19ce:	efb1                	bnez	a5,1a2a <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19d0:	0075f793          	and	a5,a1,7
    19d4:	ebb5                	bnez	a5,1a48 <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19d6:	feff0637          	lui	a2,0xfeff0
    19da:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedde7>
    19de:	f01016b7          	lui	a3,0xf0101
    19e2:	0642                	sll	a2,a2,0x10
    19e4:	0692                	sll	a3,a3,0x4
    19e6:	6198                	ld	a4,0(a1)
    19e8:	eff60613          	add	a2,a2,-257
    19ec:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00fefe9>
    19f0:	0642                	sll	a2,a2,0x10
    19f2:	06c2                	sll	a3,a3,0x10
    19f4:	eff60613          	add	a2,a2,-257
    19f8:	10168693          	add	a3,a3,257
    19fc:	00c707b3          	add	a5,a4,a2
    1a00:	fff74813          	not	a6,a4
    1a04:	06be                	sll	a3,a3,0xf
    1a06:	0107f7b3          	and	a5,a5,a6
    1a0a:	08068693          	add	a3,a3,128
    1a0e:	8ff5                	and	a5,a5,a3
    1a10:	ef89                	bnez	a5,1a2a <strcpy+0x62>
    1a12:	05a1                	add	a1,a1,8
    1a14:	e118                	sd	a4,0(a0)
    1a16:	6198                	ld	a4,0(a1)
    1a18:	0521                	add	a0,a0,8
    1a1a:	00c707b3          	add	a5,a4,a2
    1a1e:	fff74813          	not	a6,a4
    1a22:	0107f7b3          	and	a5,a5,a6
    1a26:	8ff5                	and	a5,a5,a3
    1a28:	d7ed                	beqz	a5,1a12 <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a2a:	0005c783          	lbu	a5,0(a1)
    1a2e:	00f50023          	sb	a5,0(a0)
    1a32:	c785                	beqz	a5,1a5a <strcpy+0x92>
    1a34:	0015c783          	lbu	a5,1(a1)
    1a38:	0505                	add	a0,a0,1
    1a3a:	0585                	add	a1,a1,1
    1a3c:	00f50023          	sb	a5,0(a0)
    1a40:	fbf5                	bnez	a5,1a34 <strcpy+0x6c>
        ;
    return d;
}
    1a42:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a44:	0505                	add	a0,a0,1
    1a46:	db41                	beqz	a4,19d6 <strcpy+0xe>
            if (!(*d = *s))
    1a48:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a4c:	0585                	add	a1,a1,1
    1a4e:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a52:	00f50023          	sb	a5,0(a0)
    1a56:	f7fd                	bnez	a5,1a44 <strcpy+0x7c>
}
    1a58:	8082                	ret
    1a5a:	8082                	ret

0000000000001a5c <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a5c:	00b547b3          	xor	a5,a0,a1
    1a60:	8b9d                	and	a5,a5,7
    1a62:	efbd                	bnez	a5,1ae0 <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a64:	0075f793          	and	a5,a1,7
    1a68:	1c078563          	beqz	a5,1c32 <strncpy+0x1d6>
    1a6c:	ea11                	bnez	a2,1a80 <strncpy+0x24>
    1a6e:	8082                	ret
    1a70:	0585                	add	a1,a1,1
    1a72:	0075f793          	and	a5,a1,7
    1a76:	167d                	add	a2,a2,-1
    1a78:	0505                	add	a0,a0,1
    1a7a:	1a078c63          	beqz	a5,1c32 <strncpy+0x1d6>
    1a7e:	ca3d                	beqz	a2,1af4 <strncpy+0x98>
    1a80:	0005c783          	lbu	a5,0(a1)
    1a84:	00f50023          	sb	a5,0(a0)
    1a88:	f7e5                	bnez	a5,1a70 <strncpy+0x14>
            ;
        if (!n || !*s)
    1a8a:	0005c783          	lbu	a5,0(a1)
    1a8e:	c7a5                	beqz	a5,1af6 <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a90:	479d                	li	a5,7
    1a92:	04c7f863          	bgeu	a5,a2,1ae2 <strncpy+0x86>
    1a96:	f01016b7          	lui	a3,0xf0101
    1a9a:	feff0837          	lui	a6,0xfeff0
    1a9e:	0692                	sll	a3,a3,0x4
    1aa0:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedde7>
    1aa4:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00fefe9>
    1aa8:	0842                	sll	a6,a6,0x10
    1aaa:	06c2                	sll	a3,a3,0x10
    1aac:	eff80813          	add	a6,a6,-257
    1ab0:	10168693          	add	a3,a3,257
    1ab4:	0842                	sll	a6,a6,0x10
    1ab6:	06be                	sll	a3,a3,0xf
    1ab8:	eff80813          	add	a6,a6,-257
    1abc:	08068693          	add	a3,a3,128
    1ac0:	431d                	li	t1,7
    1ac2:	6198                	ld	a4,0(a1)
    1ac4:	010707b3          	add	a5,a4,a6
    1ac8:	fff74893          	not	a7,a4
    1acc:	0117f7b3          	and	a5,a5,a7
    1ad0:	8ff5                	and	a5,a5,a3
    1ad2:	eb81                	bnez	a5,1ae2 <strncpy+0x86>
            *wd = *ws;
    1ad4:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ad6:	1661                	add	a2,a2,-8
    1ad8:	05a1                	add	a1,a1,8
    1ada:	0521                	add	a0,a0,8
    1adc:	fec363e3          	bltu	t1,a2,1ac2 <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1ae0:	ca11                	beqz	a2,1af4 <strncpy+0x98>
    1ae2:	0005c783          	lbu	a5,0(a1)
    1ae6:	0585                	add	a1,a1,1
    1ae8:	00f50023          	sb	a5,0(a0)
    1aec:	c789                	beqz	a5,1af6 <strncpy+0x9a>
    1aee:	167d                	add	a2,a2,-1
    1af0:	0505                	add	a0,a0,1
    1af2:	fa65                	bnez	a2,1ae2 <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1af4:	8082                	ret
    1af6:	40a00733          	neg	a4,a0
    1afa:	00777793          	and	a5,a4,7
    1afe:	00778693          	add	a3,a5,7
    1b02:	482d                	li	a6,11
    1b04:	fff60593          	add	a1,a2,-1
    1b08:	1106ef63          	bltu	a3,a6,1c26 <strncpy+0x1ca>
    1b0c:	12d5ee63          	bltu	a1,a3,1c48 <strncpy+0x1ec>
    1b10:	12078563          	beqz	a5,1c3a <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b14:	00050023          	sb	zero,0(a0)
    1b18:	00677693          	and	a3,a4,6
    1b1c:	12068263          	beqz	a3,1c40 <strncpy+0x1e4>
    1b20:	000500a3          	sb	zero,1(a0)
    1b24:	4689                	li	a3,2
    1b26:	12f6f463          	bgeu	a3,a5,1c4e <strncpy+0x1f2>
    1b2a:	00050123          	sb	zero,2(a0)
    1b2e:	8b11                	and	a4,a4,4
    1b30:	cf6d                	beqz	a4,1c2a <strncpy+0x1ce>
    1b32:	000501a3          	sb	zero,3(a0)
    1b36:	4711                	li	a4,4
    1b38:	00450693          	add	a3,a0,4
    1b3c:	02f77363          	bgeu	a4,a5,1b62 <strncpy+0x106>
    1b40:	00050223          	sb	zero,4(a0)
    1b44:	4715                	li	a4,5
    1b46:	00550693          	add	a3,a0,5
    1b4a:	00e78c63          	beq	a5,a4,1b62 <strncpy+0x106>
    1b4e:	000502a3          	sb	zero,5(a0)
    1b52:	471d                	li	a4,7
    1b54:	10e79163          	bne	a5,a4,1c56 <strncpy+0x1fa>
    1b58:	00750693          	add	a3,a0,7
    1b5c:	00050323          	sb	zero,6(a0)
    1b60:	471d                	li	a4,7
    1b62:	40f608b3          	sub	a7,a2,a5
    1b66:	ff88f813          	and	a6,a7,-8
    1b6a:	97aa                	add	a5,a5,a0
    1b6c:	010785b3          	add	a1,a5,a6
    1b70:	0007b023          	sd	zero,0(a5)
    1b74:	07a1                	add	a5,a5,8
    1b76:	feb79de3          	bne	a5,a1,1b70 <strncpy+0x114>
    1b7a:	00e807bb          	addw	a5,a6,a4
    1b7e:	01068733          	add	a4,a3,a6
    1b82:	0b088b63          	beq	a7,a6,1c38 <strncpy+0x1dc>
    1b86:	00070023          	sb	zero,0(a4)
    1b8a:	0017869b          	addw	a3,a5,1
    1b8e:	f6c6f3e3          	bgeu	a3,a2,1af4 <strncpy+0x98>
    1b92:	000700a3          	sb	zero,1(a4)
    1b96:	0027869b          	addw	a3,a5,2
    1b9a:	f4c6fde3          	bgeu	a3,a2,1af4 <strncpy+0x98>
    1b9e:	00070123          	sb	zero,2(a4)
    1ba2:	0037869b          	addw	a3,a5,3
    1ba6:	f4c6f7e3          	bgeu	a3,a2,1af4 <strncpy+0x98>
    1baa:	000701a3          	sb	zero,3(a4)
    1bae:	0047869b          	addw	a3,a5,4
    1bb2:	f4c6f1e3          	bgeu	a3,a2,1af4 <strncpy+0x98>
    1bb6:	00070223          	sb	zero,4(a4)
    1bba:	0057869b          	addw	a3,a5,5
    1bbe:	f2c6fbe3          	bgeu	a3,a2,1af4 <strncpy+0x98>
    1bc2:	000702a3          	sb	zero,5(a4)
    1bc6:	0067869b          	addw	a3,a5,6
    1bca:	f2c6f5e3          	bgeu	a3,a2,1af4 <strncpy+0x98>
    1bce:	00070323          	sb	zero,6(a4)
    1bd2:	0077869b          	addw	a3,a5,7
    1bd6:	f0c6ffe3          	bgeu	a3,a2,1af4 <strncpy+0x98>
    1bda:	000703a3          	sb	zero,7(a4)
    1bde:	0087869b          	addw	a3,a5,8
    1be2:	f0c6f9e3          	bgeu	a3,a2,1af4 <strncpy+0x98>
    1be6:	00070423          	sb	zero,8(a4)
    1bea:	0097869b          	addw	a3,a5,9
    1bee:	f0c6f3e3          	bgeu	a3,a2,1af4 <strncpy+0x98>
    1bf2:	000704a3          	sb	zero,9(a4)
    1bf6:	00a7869b          	addw	a3,a5,10
    1bfa:	eec6fde3          	bgeu	a3,a2,1af4 <strncpy+0x98>
    1bfe:	00070523          	sb	zero,10(a4)
    1c02:	00b7869b          	addw	a3,a5,11
    1c06:	eec6f7e3          	bgeu	a3,a2,1af4 <strncpy+0x98>
    1c0a:	000705a3          	sb	zero,11(a4)
    1c0e:	00c7869b          	addw	a3,a5,12
    1c12:	eec6f1e3          	bgeu	a3,a2,1af4 <strncpy+0x98>
    1c16:	00070623          	sb	zero,12(a4)
    1c1a:	27b5                	addw	a5,a5,13
    1c1c:	ecc7fce3          	bgeu	a5,a2,1af4 <strncpy+0x98>
    1c20:	000706a3          	sb	zero,13(a4)
}
    1c24:	8082                	ret
    1c26:	46ad                	li	a3,11
    1c28:	b5d5                	j	1b0c <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c2a:	00350693          	add	a3,a0,3
    1c2e:	470d                	li	a4,3
    1c30:	bf0d                	j	1b62 <strncpy+0x106>
        if (!n || !*s)
    1c32:	e4061ce3          	bnez	a2,1a8a <strncpy+0x2e>
}
    1c36:	8082                	ret
    1c38:	8082                	ret
    char *p = dest;
    1c3a:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c3c:	4701                	li	a4,0
    1c3e:	b715                	j	1b62 <strncpy+0x106>
    1c40:	00150693          	add	a3,a0,1
    1c44:	4705                	li	a4,1
    1c46:	bf31                	j	1b62 <strncpy+0x106>
    char *p = dest;
    1c48:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c4a:	4781                	li	a5,0
    1c4c:	bf2d                	j	1b86 <strncpy+0x12a>
    1c4e:	00250693          	add	a3,a0,2
    1c52:	4709                	li	a4,2
    1c54:	b739                	j	1b62 <strncpy+0x106>
    1c56:	00650693          	add	a3,a0,6
    1c5a:	4719                	li	a4,6
    1c5c:	b719                	j	1b62 <strncpy+0x106>

0000000000001c5e <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c5e:	87aa                	mv	a5,a0
    1c60:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c62:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c66:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c6a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c6c:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c6e:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c72:	2501                	sext.w	a0,a0
    1c74:	8082                	ret

0000000000001c76 <openat>:
    register long a7 __asm__("a7") = n;
    1c76:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c7a:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c7e:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
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
    1d28:	1141                	add	sp,sp,-16
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
    1d4e:	0141                	add	sp,sp,16
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
    1d6e:	1141                	add	sp,sp,-16
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
    1d84:	0141                	add	sp,sp,16
    1d86:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d88:	4502                	lw	a0,0(sp)
}
    1d8a:	0141                	add	sp,sp,16
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
    1df4:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1df6:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dfa:	9301                	srl	a4,a4,0x20
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
    1e04:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e06:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e0a:	9201                	srl	a2,a2,0x20
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
    1e74:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e76:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e7a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e7e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e80:	9201                	srl	a2,a2,0x20
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
    1ed4:	15c1                	add	a1,a1,-16
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
