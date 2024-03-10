
/home/windflower/Desktop/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/times:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a869                	j	109c <__start_main>

0000000000001004 <test_times>:
	long tms_cstime; 
};

struct tms mytimes;

void test_times() {
    1004:	1141                	add	sp,sp,-16
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	eda50513          	add	a0,a0,-294 # 1ee0 <__clone+0x2c>
void test_times() {
    100e:	e406                	sd	ra,8(sp)
	TEST_START(__func__);
    1010:	2c4000ef          	jal	12d4 <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	f9c50513          	add	a0,a0,-100 # 1fb0 <__func__.0>
    101c:	2b8000ef          	jal	12d4 <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	ed850513          	add	a0,a0,-296 # 1ef8 <__clone+0x44>
    1028:	2ac000ef          	jal	12d4 <puts>

	int test_ret = times(&mytimes);
    102c:	00001517          	auipc	a0,0x1
    1030:	f6450513          	add	a0,a0,-156 # 1f90 <mytimes>
    1034:	4c9000ef          	jal	1cfc <times>
	assert(test_ret >= 0);
    1038:	04054363          	bltz	a0,107e <test_times+0x7a>

	printf("mytimes success\n{tms_utime:%d, tms_stime:%d, tms_cutime:%d, tms_cstime:%d}\n",
    103c:	00001797          	auipc	a5,0x1
    1040:	f5478793          	add	a5,a5,-172 # 1f90 <mytimes>
    1044:	6f98                	ld	a4,24(a5)
    1046:	6b94                	ld	a3,16(a5)
    1048:	6790                	ld	a2,8(a5)
    104a:	638c                	ld	a1,0(a5)
    104c:	00001517          	auipc	a0,0x1
    1050:	edc50513          	add	a0,a0,-292 # 1f28 <__clone+0x74>
    1054:	2a2000ef          	jal	12f6 <printf>
		mytimes.tms_utime, mytimes.tms_stime, mytimes.tms_cutime, mytimes.tms_cstime);
	TEST_END(__func__);
    1058:	00001517          	auipc	a0,0x1
    105c:	f2050513          	add	a0,a0,-224 # 1f78 <__clone+0xc4>
    1060:	274000ef          	jal	12d4 <puts>
    1064:	00001517          	auipc	a0,0x1
    1068:	f4c50513          	add	a0,a0,-180 # 1fb0 <__func__.0>
    106c:	268000ef          	jal	12d4 <puts>
}
    1070:	60a2                	ld	ra,8(sp)
	TEST_END(__func__);
    1072:	00001517          	auipc	a0,0x1
    1076:	e8650513          	add	a0,a0,-378 # 1ef8 <__clone+0x44>
}
    107a:	0141                	add	sp,sp,16
	TEST_END(__func__);
    107c:	aca1                	j	12d4 <puts>
	assert(test_ret >= 0);
    107e:	00001517          	auipc	a0,0x1
    1082:	e8a50513          	add	a0,a0,-374 # 1f08 <__clone+0x54>
    1086:	4ee000ef          	jal	1574 <panic>
    108a:	bf4d                	j	103c <test_times+0x38>

000000000000108c <main>:

int main(void) {
    108c:	1141                	add	sp,sp,-16
    108e:	e406                	sd	ra,8(sp)
	test_times();
    1090:	f75ff0ef          	jal	1004 <test_times>
	return 0;
}
    1094:	60a2                	ld	ra,8(sp)
    1096:	4501                	li	a0,0
    1098:	0141                	add	sp,sp,16
    109a:	8082                	ret

000000000000109c <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    109c:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    109e:	4108                	lw	a0,0(a0)
{
    10a0:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10a2:	05a1                	add	a1,a1,8
{
    10a4:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10a6:	fe7ff0ef          	jal	108c <main>
    10aa:	423000ef          	jal	1ccc <exit>
	return 0;
}
    10ae:	60a2                	ld	ra,8(sp)
    10b0:	4501                	li	a0,0
    10b2:	0141                	add	sp,sp,16
    10b4:	8082                	ret

00000000000010b6 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10b6:	7179                	add	sp,sp,-48
    10b8:	f406                	sd	ra,40(sp)
    10ba:	0005081b          	sext.w	a6,a0
    10be:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10c0:	00055563          	bgez	a0,10ca <printint.constprop.0+0x14>
        x = -xx;
    10c4:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    10c8:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10ca:	02b8763b          	remuw	a2,a6,a1
    10ce:	00001697          	auipc	a3,0x1
    10d2:	ef268693          	add	a3,a3,-270 # 1fc0 <digits>
    buf[16] = 0;
    10d6:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10da:	0005871b          	sext.w	a4,a1
    10de:	1602                	sll	a2,a2,0x20
    10e0:	9201                	srl	a2,a2,0x20
    10e2:	9636                	add	a2,a2,a3
    10e4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10e8:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    10ec:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    10f0:	10b86c63          	bltu	a6,a1,1208 <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    10f4:	02e5763b          	remuw	a2,a0,a4
    10f8:	1602                	sll	a2,a2,0x20
    10fa:	9201                	srl	a2,a2,0x20
    10fc:	9636                	add	a2,a2,a3
    10fe:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1102:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1106:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    110a:	10e56863          	bltu	a0,a4,121a <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    110e:	02e5f63b          	remuw	a2,a1,a4
    1112:	1602                	sll	a2,a2,0x20
    1114:	9201                	srl	a2,a2,0x20
    1116:	9636                	add	a2,a2,a3
    1118:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    111c:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1120:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1124:	10e5e463          	bltu	a1,a4,122c <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    1128:	02e5763b          	remuw	a2,a0,a4
    112c:	1602                	sll	a2,a2,0x20
    112e:	9201                	srl	a2,a2,0x20
    1130:	9636                	add	a2,a2,a3
    1132:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1136:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    113a:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    113e:	10e56063          	bltu	a0,a4,123e <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    1142:	02e5f63b          	remuw	a2,a1,a4
    1146:	1602                	sll	a2,a2,0x20
    1148:	9201                	srl	a2,a2,0x20
    114a:	9636                	add	a2,a2,a3
    114c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1150:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1154:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1158:	0ee5ec63          	bltu	a1,a4,1250 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    115c:	02e5763b          	remuw	a2,a0,a4
    1160:	1602                	sll	a2,a2,0x20
    1162:	9201                	srl	a2,a2,0x20
    1164:	9636                	add	a2,a2,a3
    1166:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    116a:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    116e:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1172:	08e56263          	bltu	a0,a4,11f6 <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    1176:	02e5f63b          	remuw	a2,a1,a4
    117a:	1602                	sll	a2,a2,0x20
    117c:	9201                	srl	a2,a2,0x20
    117e:	9636                	add	a2,a2,a3
    1180:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1184:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1188:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    118c:	0ce5eb63          	bltu	a1,a4,1262 <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    1190:	02e5763b          	remuw	a2,a0,a4
    1194:	1602                	sll	a2,a2,0x20
    1196:	9201                	srl	a2,a2,0x20
    1198:	9636                	add	a2,a2,a3
    119a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    119e:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11a2:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11a6:	0ce56763          	bltu	a0,a4,1274 <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    11aa:	02e5f63b          	remuw	a2,a1,a4
    11ae:	1602                	sll	a2,a2,0x20
    11b0:	9201                	srl	a2,a2,0x20
    11b2:	9636                	add	a2,a2,a3
    11b4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b8:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11bc:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11c0:	0ce5e363          	bltu	a1,a4,1286 <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    11c4:	1782                	sll	a5,a5,0x20
    11c6:	9381                	srl	a5,a5,0x20
    11c8:	96be                	add	a3,a3,a5
    11ca:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    11ce:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    11d0:	00f10723          	sb	a5,14(sp)
    if (sign)
    11d4:	00088763          	beqz	a7,11e2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11d8:	02d00793          	li	a5,45
    11dc:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11e0:	4595                	li	a1,5
    write(f, s, l);
    11e2:	003c                	add	a5,sp,8
    11e4:	4641                	li	a2,16
    11e6:	9e0d                	subw	a2,a2,a1
    11e8:	4505                	li	a0,1
    11ea:	95be                	add	a1,a1,a5
    11ec:	291000ef          	jal	1c7c <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11f0:	70a2                	ld	ra,40(sp)
    11f2:	6145                	add	sp,sp,48
    11f4:	8082                	ret
    i++;
    11f6:	45a9                	li	a1,10
    if (sign)
    11f8:	fe0885e3          	beqz	a7,11e2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11fc:	02d00793          	li	a5,45
    1200:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1204:	45a5                	li	a1,9
    1206:	bff1                	j	11e2 <printint.constprop.0+0x12c>
    i++;
    1208:	45bd                	li	a1,15
    if (sign)
    120a:	fc088ce3          	beqz	a7,11e2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    120e:	02d00793          	li	a5,45
    1212:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1216:	45b9                	li	a1,14
    1218:	b7e9                	j	11e2 <printint.constprop.0+0x12c>
    i++;
    121a:	45b9                	li	a1,14
    if (sign)
    121c:	fc0883e3          	beqz	a7,11e2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1220:	02d00793          	li	a5,45
    1224:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1228:	45b5                	li	a1,13
    122a:	bf65                	j	11e2 <printint.constprop.0+0x12c>
    i++;
    122c:	45b5                	li	a1,13
    if (sign)
    122e:	fa088ae3          	beqz	a7,11e2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1232:	02d00793          	li	a5,45
    1236:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    123a:	45b1                	li	a1,12
    123c:	b75d                	j	11e2 <printint.constprop.0+0x12c>
    i++;
    123e:	45b1                	li	a1,12
    if (sign)
    1240:	fa0881e3          	beqz	a7,11e2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1244:	02d00793          	li	a5,45
    1248:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    124c:	45ad                	li	a1,11
    124e:	bf51                	j	11e2 <printint.constprop.0+0x12c>
    i++;
    1250:	45ad                	li	a1,11
    if (sign)
    1252:	f80888e3          	beqz	a7,11e2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1256:	02d00793          	li	a5,45
    125a:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    125e:	45a9                	li	a1,10
    1260:	b749                	j	11e2 <printint.constprop.0+0x12c>
    i++;
    1262:	45a5                	li	a1,9
    if (sign)
    1264:	f6088fe3          	beqz	a7,11e2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1268:	02d00793          	li	a5,45
    126c:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1270:	45a1                	li	a1,8
    1272:	bf85                	j	11e2 <printint.constprop.0+0x12c>
    i++;
    1274:	45a1                	li	a1,8
    if (sign)
    1276:	f60886e3          	beqz	a7,11e2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    127a:	02d00793          	li	a5,45
    127e:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1282:	459d                	li	a1,7
    1284:	bfb9                	j	11e2 <printint.constprop.0+0x12c>
    i++;
    1286:	459d                	li	a1,7
    if (sign)
    1288:	f4088de3          	beqz	a7,11e2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    128c:	02d00793          	li	a5,45
    1290:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1294:	4599                	li	a1,6
    1296:	b7b1                	j	11e2 <printint.constprop.0+0x12c>

0000000000001298 <getchar>:
{
    1298:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    129a:	00f10593          	add	a1,sp,15
    129e:	4605                	li	a2,1
    12a0:	4501                	li	a0,0
{
    12a2:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12a4:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12a8:	1cb000ef          	jal	1c72 <read>
}
    12ac:	60e2                	ld	ra,24(sp)
    12ae:	00f14503          	lbu	a0,15(sp)
    12b2:	6105                	add	sp,sp,32
    12b4:	8082                	ret

00000000000012b6 <putchar>:
{
    12b6:	1101                	add	sp,sp,-32
    12b8:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12ba:	00f10593          	add	a1,sp,15
    12be:	4605                	li	a2,1
    12c0:	4505                	li	a0,1
{
    12c2:	ec06                	sd	ra,24(sp)
    char byte = c;
    12c4:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12c8:	1b5000ef          	jal	1c7c <write>
}
    12cc:	60e2                	ld	ra,24(sp)
    12ce:	2501                	sext.w	a0,a0
    12d0:	6105                	add	sp,sp,32
    12d2:	8082                	ret

00000000000012d4 <puts>:
{
    12d4:	1141                	add	sp,sp,-16
    12d6:	e406                	sd	ra,8(sp)
    12d8:	e022                	sd	s0,0(sp)
    12da:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12dc:	56c000ef          	jal	1848 <strlen>
    12e0:	862a                	mv	a2,a0
    12e2:	85a2                	mv	a1,s0
    12e4:	4505                	li	a0,1
    12e6:	197000ef          	jal	1c7c <write>
}
    12ea:	60a2                	ld	ra,8(sp)
    12ec:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12ee:	957d                	sra	a0,a0,0x3f
    return r;
    12f0:	2501                	sext.w	a0,a0
}
    12f2:	0141                	add	sp,sp,16
    12f4:	8082                	ret

00000000000012f6 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12f6:	7131                	add	sp,sp,-192
    12f8:	e4d6                	sd	s5,72(sp)
    12fa:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12fc:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12fe:	013c                	add	a5,sp,136
{
    1300:	f0ca                	sd	s2,96(sp)
    1302:	ecce                	sd	s3,88(sp)
    1304:	e8d2                	sd	s4,80(sp)
    1306:	e0da                	sd	s6,64(sp)
    1308:	fc5e                	sd	s7,56(sp)
    130a:	fc86                	sd	ra,120(sp)
    130c:	f8a2                	sd	s0,112(sp)
    130e:	f4a6                	sd	s1,104(sp)
    1310:	e52e                	sd	a1,136(sp)
    1312:	e932                	sd	a2,144(sp)
    1314:	ed36                	sd	a3,152(sp)
    1316:	f13a                	sd	a4,160(sp)
    1318:	f942                	sd	a6,176(sp)
    131a:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    131c:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    131e:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1322:	07300a13          	li	s4,115
    1326:	07800b93          	li	s7,120
    132a:	06400b13          	li	s6,100
    buf[i++] = '0';
    132e:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x5870>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1332:	00001997          	auipc	s3,0x1
    1336:	c8e98993          	add	s3,s3,-882 # 1fc0 <digits>
        if (!*s)
    133a:	00054783          	lbu	a5,0(a0)
    133e:	16078863          	beqz	a5,14ae <printf+0x1b8>
    1342:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1344:	19278063          	beq	a5,s2,14c4 <printf+0x1ce>
    1348:	00164783          	lbu	a5,1(a2)
    134c:	0605                	add	a2,a2,1
    134e:	fbfd                	bnez	a5,1344 <printf+0x4e>
    1350:	84b2                	mv	s1,a2
        l = z - a;
    1352:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1356:	85aa                	mv	a1,a0
    1358:	8622                	mv	a2,s0
    135a:	4505                	li	a0,1
    135c:	121000ef          	jal	1c7c <write>
        if (l)
    1360:	18041763          	bnez	s0,14ee <printf+0x1f8>
        if (s[1] == 0)
    1364:	0014c783          	lbu	a5,1(s1)
    1368:	14078363          	beqz	a5,14ae <printf+0x1b8>
        switch (s[1])
    136c:	19478f63          	beq	a5,s4,150a <printf+0x214>
    1370:	18fa6163          	bltu	s4,a5,14f2 <printf+0x1fc>
    1374:	1b678e63          	beq	a5,s6,1530 <printf+0x23a>
    1378:	07000713          	li	a4,112
    137c:	1ce79463          	bne	a5,a4,1544 <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1380:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1382:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1386:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1388:	631c                	ld	a5,0(a4)
    138a:	0721                	add	a4,a4,8
    138c:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    138e:	00479293          	sll	t0,a5,0x4
    1392:	00879f93          	sll	t6,a5,0x8
    1396:	00c79f13          	sll	t5,a5,0xc
    139a:	01079e93          	sll	t4,a5,0x10
    139e:	01479e13          	sll	t3,a5,0x14
    13a2:	01879313          	sll	t1,a5,0x18
    13a6:	01c79893          	sll	a7,a5,0x1c
    13aa:	02479813          	sll	a6,a5,0x24
    13ae:	02879513          	sll	a0,a5,0x28
    13b2:	02c79593          	sll	a1,a5,0x2c
    13b6:	03079693          	sll	a3,a5,0x30
    13ba:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13be:	03c7d413          	srl	s0,a5,0x3c
    13c2:	01c7d39b          	srlw	t2,a5,0x1c
    13c6:	03c2d293          	srl	t0,t0,0x3c
    13ca:	03cfdf93          	srl	t6,t6,0x3c
    13ce:	03cf5f13          	srl	t5,t5,0x3c
    13d2:	03cede93          	srl	t4,t4,0x3c
    13d6:	03ce5e13          	srl	t3,t3,0x3c
    13da:	03c35313          	srl	t1,t1,0x3c
    13de:	03c8d893          	srl	a7,a7,0x3c
    13e2:	03c85813          	srl	a6,a6,0x3c
    13e6:	9171                	srl	a0,a0,0x3c
    13e8:	91f1                	srl	a1,a1,0x3c
    13ea:	92f1                	srl	a3,a3,0x3c
    13ec:	9371                	srl	a4,a4,0x3c
    13ee:	974e                	add	a4,a4,s3
    13f0:	944e                	add	s0,s0,s3
    13f2:	92ce                	add	t0,t0,s3
    13f4:	9fce                	add	t6,t6,s3
    13f6:	9f4e                	add	t5,t5,s3
    13f8:	9ece                	add	t4,t4,s3
    13fa:	9e4e                	add	t3,t3,s3
    13fc:	934e                	add	t1,t1,s3
    13fe:	98ce                	add	a7,a7,s3
    1400:	93ce                	add	t2,t2,s3
    1402:	984e                	add	a6,a6,s3
    1404:	954e                	add	a0,a0,s3
    1406:	95ce                	add	a1,a1,s3
    1408:	96ce                	add	a3,a3,s3
    140a:	00074083          	lbu	ra,0(a4)
    140e:	0002c283          	lbu	t0,0(t0)
    1412:	000fcf83          	lbu	t6,0(t6)
    1416:	000f4f03          	lbu	t5,0(t5)
    141a:	000ece83          	lbu	t4,0(t4)
    141e:	000e4e03          	lbu	t3,0(t3)
    1422:	00034303          	lbu	t1,0(t1)
    1426:	0008c883          	lbu	a7,0(a7)
    142a:	0003c383          	lbu	t2,0(t2)
    142e:	00084803          	lbu	a6,0(a6)
    1432:	00054503          	lbu	a0,0(a0)
    1436:	0005c583          	lbu	a1,0(a1)
    143a:	0006c683          	lbu	a3,0(a3)
    143e:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1442:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1446:	9371                	srl	a4,a4,0x3c
    1448:	8bbd                	and	a5,a5,15
    144a:	974e                	add	a4,a4,s3
    144c:	97ce                	add	a5,a5,s3
    144e:	005105a3          	sb	t0,11(sp)
    1452:	01f10623          	sb	t6,12(sp)
    1456:	01e106a3          	sb	t5,13(sp)
    145a:	01d10723          	sb	t4,14(sp)
    145e:	01c107a3          	sb	t3,15(sp)
    1462:	00610823          	sb	t1,16(sp)
    1466:	011108a3          	sb	a7,17(sp)
    146a:	00710923          	sb	t2,18(sp)
    146e:	010109a3          	sb	a6,19(sp)
    1472:	00a10a23          	sb	a0,20(sp)
    1476:	00b10aa3          	sb	a1,21(sp)
    147a:	00d10b23          	sb	a3,22(sp)
    147e:	00110ba3          	sb	ra,23(sp)
    1482:	00810523          	sb	s0,10(sp)
    1486:	00074703          	lbu	a4,0(a4)
    148a:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    148e:	002c                	add	a1,sp,8
    1490:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1492:	00e10c23          	sb	a4,24(sp)
    1496:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    149a:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    149e:	7de000ef          	jal	1c7c <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14a2:	00248513          	add	a0,s1,2
        if (!*s)
    14a6:	00054783          	lbu	a5,0(a0)
    14aa:	e8079ce3          	bnez	a5,1342 <printf+0x4c>
    }
    va_end(ap);
}
    14ae:	70e6                	ld	ra,120(sp)
    14b0:	7446                	ld	s0,112(sp)
    14b2:	74a6                	ld	s1,104(sp)
    14b4:	7906                	ld	s2,96(sp)
    14b6:	69e6                	ld	s3,88(sp)
    14b8:	6a46                	ld	s4,80(sp)
    14ba:	6aa6                	ld	s5,72(sp)
    14bc:	6b06                	ld	s6,64(sp)
    14be:	7be2                	ld	s7,56(sp)
    14c0:	6129                	add	sp,sp,192
    14c2:	8082                	ret
    14c4:	84b2                	mv	s1,a2
    14c6:	a039                	j	14d4 <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14c8:	0024c783          	lbu	a5,2(s1)
    14cc:	0605                	add	a2,a2,1
    14ce:	0489                	add	s1,s1,2
    14d0:	e92791e3          	bne	a5,s2,1352 <printf+0x5c>
    14d4:	0014c783          	lbu	a5,1(s1)
    14d8:	ff2788e3          	beq	a5,s2,14c8 <printf+0x1d2>
        l = z - a;
    14dc:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14e0:	85aa                	mv	a1,a0
    14e2:	8622                	mv	a2,s0
    14e4:	4505                	li	a0,1
    14e6:	796000ef          	jal	1c7c <write>
        if (l)
    14ea:	e6040de3          	beqz	s0,1364 <printf+0x6e>
    14ee:	8526                	mv	a0,s1
    14f0:	b5a9                	j	133a <printf+0x44>
        switch (s[1])
    14f2:	05779963          	bne	a5,s7,1544 <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    14f6:	6782                	ld	a5,0(sp)
    14f8:	45c1                	li	a1,16
    14fa:	4388                	lw	a0,0(a5)
    14fc:	07a1                	add	a5,a5,8
    14fe:	e03e                	sd	a5,0(sp)
    1500:	bb7ff0ef          	jal	10b6 <printint.constprop.0>
        s += 2;
    1504:	00248513          	add	a0,s1,2
    1508:	bf79                	j	14a6 <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    150a:	6782                	ld	a5,0(sp)
    150c:	6380                	ld	s0,0(a5)
    150e:	07a1                	add	a5,a5,8
    1510:	e03e                	sd	a5,0(sp)
    1512:	cc21                	beqz	s0,156a <printf+0x274>
            l = strnlen(a, 200);
    1514:	0c800593          	li	a1,200
    1518:	8522                	mv	a0,s0
    151a:	460000ef          	jal	197a <strnlen>
    write(f, s, l);
    151e:	0005061b          	sext.w	a2,a0
    1522:	85a2                	mv	a1,s0
    1524:	4505                	li	a0,1
    1526:	756000ef          	jal	1c7c <write>
        s += 2;
    152a:	00248513          	add	a0,s1,2
    152e:	bfa5                	j	14a6 <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    1530:	6782                	ld	a5,0(sp)
    1532:	45a9                	li	a1,10
    1534:	4388                	lw	a0,0(a5)
    1536:	07a1                	add	a5,a5,8
    1538:	e03e                	sd	a5,0(sp)
    153a:	b7dff0ef          	jal	10b6 <printint.constprop.0>
        s += 2;
    153e:	00248513          	add	a0,s1,2
    1542:	b795                	j	14a6 <printf+0x1b0>
    return write(stdout, &byte, 1);
    1544:	4605                	li	a2,1
    1546:	002c                	add	a1,sp,8
    1548:	4505                	li	a0,1
    char byte = c;
    154a:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    154e:	72e000ef          	jal	1c7c <write>
    char byte = c;
    1552:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1556:	4605                	li	a2,1
    1558:	002c                	add	a1,sp,8
    155a:	4505                	li	a0,1
    char byte = c;
    155c:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1560:	71c000ef          	jal	1c7c <write>
        s += 2;
    1564:	00248513          	add	a0,s1,2
    1568:	bf3d                	j	14a6 <printf+0x1b0>
                a = "(null)";
    156a:	00001417          	auipc	s0,0x1
    156e:	a1e40413          	add	s0,s0,-1506 # 1f88 <__clone+0xd4>
    1572:	b74d                	j	1514 <printf+0x21e>

0000000000001574 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1574:	1141                	add	sp,sp,-16
    1576:	e406                	sd	ra,8(sp)
    puts(m);
    1578:	d5dff0ef          	jal	12d4 <puts>
    exit(-100);
}
    157c:	60a2                	ld	ra,8(sp)
    exit(-100);
    157e:	f9c00513          	li	a0,-100
}
    1582:	0141                	add	sp,sp,16
    exit(-100);
    1584:	a7a1                	j	1ccc <exit>

0000000000001586 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1586:	02000793          	li	a5,32
    158a:	00f50663          	beq	a0,a5,1596 <isspace+0x10>
    158e:	355d                	addw	a0,a0,-9
    1590:	00553513          	sltiu	a0,a0,5
    1594:	8082                	ret
    1596:	4505                	li	a0,1
}
    1598:	8082                	ret

000000000000159a <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    159a:	fd05051b          	addw	a0,a0,-48
}
    159e:	00a53513          	sltiu	a0,a0,10
    15a2:	8082                	ret

00000000000015a4 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a4:	02000713          	li	a4,32
    15a8:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15aa:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ae:	ff76879b          	addw	a5,a3,-9
    15b2:	06e68063          	beq	a3,a4,1612 <atoi+0x6e>
    15b6:	0006859b          	sext.w	a1,a3
    15ba:	04f67c63          	bgeu	a2,a5,1612 <atoi+0x6e>
        s++;
    switch (*s)
    15be:	02b00793          	li	a5,43
    15c2:	06f68563          	beq	a3,a5,162c <atoi+0x88>
    15c6:	02d00793          	li	a5,45
    15ca:	04f69663          	bne	a3,a5,1616 <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15ce:	00154683          	lbu	a3,1(a0)
    15d2:	47a5                	li	a5,9
        s++;
    15d4:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    15d8:	fd06869b          	addw	a3,a3,-48
    15dc:	8636                	mv	a2,a3
    while (isdigit(*s))
    15de:	04d7e563          	bltu	a5,a3,1628 <atoi+0x84>
        neg = 1;
    15e2:	4885                	li	a7,1
    int n = 0, neg = 0;
    15e4:	4501                	li	a0,0
    while (isdigit(*s))
    15e6:	4825                	li	a6,9
    15e8:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    15ec:	0025179b          	sllw	a5,a0,0x2
    15f0:	9fa9                	addw	a5,a5,a0
    15f2:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    15f6:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    15fa:	85b2                	mv	a1,a2
    15fc:	40c7853b          	subw	a0,a5,a2
    1600:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    1602:	8636                	mv	a2,a3
    while (isdigit(*s))
    1604:	fed872e3          	bgeu	a6,a3,15e8 <atoi+0x44>
    return neg ? n : -n;
    1608:	02089163          	bnez	a7,162a <atoi+0x86>
    160c:	40f5853b          	subw	a0,a1,a5
    1610:	8082                	ret
        s++;
    1612:	0505                	add	a0,a0,1
    1614:	bf59                	j	15aa <atoi+0x6>
    while (isdigit(*s))
    1616:	fd05859b          	addw	a1,a1,-48
    161a:	47a5                	li	a5,9
    161c:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    161e:	4881                	li	a7,0
    1620:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    1624:	fcb7f0e3          	bgeu	a5,a1,15e4 <atoi+0x40>
    return neg ? n : -n;
    1628:	4501                	li	a0,0
}
    162a:	8082                	ret
    while (isdigit(*s))
    162c:	00154683          	lbu	a3,1(a0)
    1630:	47a5                	li	a5,9
        s++;
    1632:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1636:	fd06869b          	addw	a3,a3,-48
    163a:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    163c:	4881                	li	a7,0
    while (isdigit(*s))
    163e:	fad7f3e3          	bgeu	a5,a3,15e4 <atoi+0x40>
    return neg ? n : -n;
    1642:	4501                	li	a0,0
    1644:	8082                	ret

0000000000001646 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1646:	16060f63          	beqz	a2,17c4 <memset+0x17e>
    164a:	40a006b3          	neg	a3,a0
    164e:	0076f793          	and	a5,a3,7
    1652:	00778813          	add	a6,a5,7
    1656:	48ad                	li	a7,11
    1658:	0ff5f713          	zext.b	a4,a1
    165c:	fff60593          	add	a1,a2,-1
    1660:	17186363          	bltu	a6,a7,17c6 <memset+0x180>
    1664:	1705eb63          	bltu	a1,a6,17da <memset+0x194>
    1668:	16078163          	beqz	a5,17ca <memset+0x184>
    166c:	00e50023          	sb	a4,0(a0)
    1670:	0066f593          	and	a1,a3,6
    1674:	14058e63          	beqz	a1,17d0 <memset+0x18a>
    1678:	00e500a3          	sb	a4,1(a0)
    167c:	4589                	li	a1,2
    167e:	00250813          	add	a6,a0,2
    1682:	04f5f663          	bgeu	a1,a5,16ce <memset+0x88>
    1686:	00e50123          	sb	a4,2(a0)
    168a:	8a91                	and	a3,a3,4
    168c:	00350813          	add	a6,a0,3
    1690:	458d                	li	a1,3
    1692:	ce95                	beqz	a3,16ce <memset+0x88>
    1694:	00e501a3          	sb	a4,3(a0)
    1698:	4691                	li	a3,4
    169a:	00450813          	add	a6,a0,4
    169e:	4591                	li	a1,4
    16a0:	02f6f763          	bgeu	a3,a5,16ce <memset+0x88>
    16a4:	00e50223          	sb	a4,4(a0)
    16a8:	4695                	li	a3,5
    16aa:	00550813          	add	a6,a0,5
    16ae:	4595                	li	a1,5
    16b0:	00d78f63          	beq	a5,a3,16ce <memset+0x88>
    16b4:	00e502a3          	sb	a4,5(a0)
    16b8:	469d                	li	a3,7
    16ba:	00650813          	add	a6,a0,6
    16be:	4599                	li	a1,6
    16c0:	00d79763          	bne	a5,a3,16ce <memset+0x88>
    16c4:	00750813          	add	a6,a0,7
    16c8:	00e50323          	sb	a4,6(a0)
    16cc:	459d                	li	a1,7
    16ce:	00871693          	sll	a3,a4,0x8
    16d2:	01071313          	sll	t1,a4,0x10
    16d6:	8ed9                	or	a3,a3,a4
    16d8:	01871893          	sll	a7,a4,0x18
    16dc:	0066e6b3          	or	a3,a3,t1
    16e0:	0116e6b3          	or	a3,a3,a7
    16e4:	02071313          	sll	t1,a4,0x20
    16e8:	02871893          	sll	a7,a4,0x28
    16ec:	0066e6b3          	or	a3,a3,t1
    16f0:	40f60e33          	sub	t3,a2,a5
    16f4:	03071313          	sll	t1,a4,0x30
    16f8:	0116e6b3          	or	a3,a3,a7
    16fc:	0066e6b3          	or	a3,a3,t1
    1700:	03871893          	sll	a7,a4,0x38
    1704:	97aa                	add	a5,a5,a0
    1706:	ff8e7313          	and	t1,t3,-8
    170a:	0116e6b3          	or	a3,a3,a7
    170e:	00f308b3          	add	a7,t1,a5
    1712:	e394                	sd	a3,0(a5)
    1714:	07a1                	add	a5,a5,8
    1716:	ff179ee3          	bne	a5,a7,1712 <memset+0xcc>
    171a:	006806b3          	add	a3,a6,t1
    171e:	00b307bb          	addw	a5,t1,a1
    1722:	0bc30b63          	beq	t1,t3,17d8 <memset+0x192>
    1726:	00e68023          	sb	a4,0(a3)
    172a:	0017859b          	addw	a1,a5,1
    172e:	08c5fb63          	bgeu	a1,a2,17c4 <memset+0x17e>
    1732:	00e680a3          	sb	a4,1(a3)
    1736:	0027859b          	addw	a1,a5,2
    173a:	08c5f563          	bgeu	a1,a2,17c4 <memset+0x17e>
    173e:	00e68123          	sb	a4,2(a3)
    1742:	0037859b          	addw	a1,a5,3
    1746:	06c5ff63          	bgeu	a1,a2,17c4 <memset+0x17e>
    174a:	00e681a3          	sb	a4,3(a3)
    174e:	0047859b          	addw	a1,a5,4
    1752:	06c5f963          	bgeu	a1,a2,17c4 <memset+0x17e>
    1756:	00e68223          	sb	a4,4(a3)
    175a:	0057859b          	addw	a1,a5,5
    175e:	06c5f363          	bgeu	a1,a2,17c4 <memset+0x17e>
    1762:	00e682a3          	sb	a4,5(a3)
    1766:	0067859b          	addw	a1,a5,6
    176a:	04c5fd63          	bgeu	a1,a2,17c4 <memset+0x17e>
    176e:	00e68323          	sb	a4,6(a3)
    1772:	0077859b          	addw	a1,a5,7
    1776:	04c5f763          	bgeu	a1,a2,17c4 <memset+0x17e>
    177a:	00e683a3          	sb	a4,7(a3)
    177e:	0087859b          	addw	a1,a5,8
    1782:	04c5f163          	bgeu	a1,a2,17c4 <memset+0x17e>
    1786:	00e68423          	sb	a4,8(a3)
    178a:	0097859b          	addw	a1,a5,9
    178e:	02c5fb63          	bgeu	a1,a2,17c4 <memset+0x17e>
    1792:	00e684a3          	sb	a4,9(a3)
    1796:	00a7859b          	addw	a1,a5,10
    179a:	02c5f563          	bgeu	a1,a2,17c4 <memset+0x17e>
    179e:	00e68523          	sb	a4,10(a3)
    17a2:	00b7859b          	addw	a1,a5,11
    17a6:	00c5ff63          	bgeu	a1,a2,17c4 <memset+0x17e>
    17aa:	00e685a3          	sb	a4,11(a3)
    17ae:	00c7859b          	addw	a1,a5,12
    17b2:	00c5f963          	bgeu	a1,a2,17c4 <memset+0x17e>
    17b6:	00e68623          	sb	a4,12(a3)
    17ba:	27b5                	addw	a5,a5,13
    17bc:	00c7f463          	bgeu	a5,a2,17c4 <memset+0x17e>
    17c0:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17c4:	8082                	ret
    17c6:	482d                	li	a6,11
    17c8:	bd71                	j	1664 <memset+0x1e>
    char *p = dest;
    17ca:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17cc:	4581                	li	a1,0
    17ce:	b701                	j	16ce <memset+0x88>
    17d0:	00150813          	add	a6,a0,1
    17d4:	4585                	li	a1,1
    17d6:	bde5                	j	16ce <memset+0x88>
    17d8:	8082                	ret
    char *p = dest;
    17da:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17dc:	4781                	li	a5,0
    17de:	b7a1                	j	1726 <memset+0xe0>

00000000000017e0 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17e0:	00054783          	lbu	a5,0(a0)
    17e4:	0005c703          	lbu	a4,0(a1)
    17e8:	00e79863          	bne	a5,a4,17f8 <strcmp+0x18>
    17ec:	0505                	add	a0,a0,1
    17ee:	0585                	add	a1,a1,1
    17f0:	fbe5                	bnez	a5,17e0 <strcmp>
    17f2:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    17f4:	9d19                	subw	a0,a0,a4
    17f6:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    17f8:	0007851b          	sext.w	a0,a5
    17fc:	bfe5                	j	17f4 <strcmp+0x14>

00000000000017fe <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    17fe:	ca15                	beqz	a2,1832 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1800:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1804:	167d                	add	a2,a2,-1
    1806:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    180a:	eb99                	bnez	a5,1820 <strncmp+0x22>
    180c:	a815                	j	1840 <strncmp+0x42>
    180e:	00a68e63          	beq	a3,a0,182a <strncmp+0x2c>
    1812:	0505                	add	a0,a0,1
    1814:	00f71b63          	bne	a4,a5,182a <strncmp+0x2c>
    1818:	00054783          	lbu	a5,0(a0)
    181c:	cf89                	beqz	a5,1836 <strncmp+0x38>
    181e:	85b2                	mv	a1,a2
    1820:	0005c703          	lbu	a4,0(a1)
    1824:	00158613          	add	a2,a1,1
    1828:	f37d                	bnez	a4,180e <strncmp+0x10>
        ;
    return *l - *r;
    182a:	0007851b          	sext.w	a0,a5
    182e:	9d19                	subw	a0,a0,a4
    1830:	8082                	ret
        return 0;
    1832:	4501                	li	a0,0
}
    1834:	8082                	ret
    return *l - *r;
    1836:	0015c703          	lbu	a4,1(a1)
    183a:	4501                	li	a0,0
    183c:	9d19                	subw	a0,a0,a4
    183e:	8082                	ret
    1840:	0005c703          	lbu	a4,0(a1)
    1844:	4501                	li	a0,0
    1846:	b7e5                	j	182e <strncmp+0x30>

0000000000001848 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1848:	00757793          	and	a5,a0,7
    184c:	cf89                	beqz	a5,1866 <strlen+0x1e>
    184e:	87aa                	mv	a5,a0
    1850:	a029                	j	185a <strlen+0x12>
    1852:	0785                	add	a5,a5,1
    1854:	0077f713          	and	a4,a5,7
    1858:	cb01                	beqz	a4,1868 <strlen+0x20>
        if (!*s)
    185a:	0007c703          	lbu	a4,0(a5)
    185e:	fb75                	bnez	a4,1852 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1860:	40a78533          	sub	a0,a5,a0
}
    1864:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1866:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1868:	feff05b7          	lui	a1,0xfeff0
    186c:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedf3f>
    1870:	f0101637          	lui	a2,0xf0101
    1874:	05c2                	sll	a1,a1,0x10
    1876:	0612                	sll	a2,a2,0x4
    1878:	6394                	ld	a3,0(a5)
    187a:	eff58593          	add	a1,a1,-257
    187e:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff141>
    1882:	05c2                	sll	a1,a1,0x10
    1884:	0642                	sll	a2,a2,0x10
    1886:	eff58593          	add	a1,a1,-257
    188a:	10160613          	add	a2,a2,257
    188e:	00b68733          	add	a4,a3,a1
    1892:	063e                	sll	a2,a2,0xf
    1894:	fff6c693          	not	a3,a3
    1898:	8f75                	and	a4,a4,a3
    189a:	08060613          	add	a2,a2,128
    189e:	8f71                	and	a4,a4,a2
    18a0:	eb11                	bnez	a4,18b4 <strlen+0x6c>
    18a2:	6794                	ld	a3,8(a5)
    18a4:	07a1                	add	a5,a5,8
    18a6:	00b68733          	add	a4,a3,a1
    18aa:	fff6c693          	not	a3,a3
    18ae:	8f75                	and	a4,a4,a3
    18b0:	8f71                	and	a4,a4,a2
    18b2:	db65                	beqz	a4,18a2 <strlen+0x5a>
    for (; *s; s++)
    18b4:	0007c703          	lbu	a4,0(a5)
    18b8:	d745                	beqz	a4,1860 <strlen+0x18>
    18ba:	0017c703          	lbu	a4,1(a5)
    18be:	0785                	add	a5,a5,1
    18c0:	d345                	beqz	a4,1860 <strlen+0x18>
    18c2:	0017c703          	lbu	a4,1(a5)
    18c6:	0785                	add	a5,a5,1
    18c8:	fb6d                	bnez	a4,18ba <strlen+0x72>
    18ca:	bf59                	j	1860 <strlen+0x18>

00000000000018cc <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18cc:	00757713          	and	a4,a0,7
{
    18d0:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18d2:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18d6:	cb19                	beqz	a4,18ec <memchr+0x20>
    18d8:	ce59                	beqz	a2,1976 <memchr+0xaa>
    18da:	0007c703          	lbu	a4,0(a5)
    18de:	00b70963          	beq	a4,a1,18f0 <memchr+0x24>
    18e2:	0785                	add	a5,a5,1
    18e4:	0077f713          	and	a4,a5,7
    18e8:	167d                	add	a2,a2,-1
    18ea:	f77d                	bnez	a4,18d8 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18ec:	4501                	li	a0,0
    if (n && *s != c)
    18ee:	c649                	beqz	a2,1978 <memchr+0xac>
    18f0:	0007c703          	lbu	a4,0(a5)
    18f4:	06b70663          	beq	a4,a1,1960 <memchr+0x94>
        size_t k = ONES * c;
    18f8:	01010737          	lui	a4,0x1010
    18fc:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e141>
    1900:	0742                	sll	a4,a4,0x10
    1902:	10170713          	add	a4,a4,257
    1906:	0742                	sll	a4,a4,0x10
    1908:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    190c:	469d                	li	a3,7
        size_t k = ONES * c;
    190e:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1912:	04c6f763          	bgeu	a3,a2,1960 <memchr+0x94>
    1916:	f0101837          	lui	a6,0xf0101
    191a:	feff08b7          	lui	a7,0xfeff0
    191e:	0812                	sll	a6,a6,0x4
    1920:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedf3f>
    1924:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff141>
    1928:	08c2                	sll	a7,a7,0x10
    192a:	0842                	sll	a6,a6,0x10
    192c:	eff88893          	add	a7,a7,-257
    1930:	10180813          	add	a6,a6,257
    1934:	08c2                	sll	a7,a7,0x10
    1936:	083e                	sll	a6,a6,0xf
    1938:	eff88893          	add	a7,a7,-257
    193c:	08080813          	add	a6,a6,128
    1940:	431d                	li	t1,7
    1942:	a029                	j	194c <memchr+0x80>
    1944:	1661                	add	a2,a2,-8
    1946:	07a1                	add	a5,a5,8
    1948:	02c37663          	bgeu	t1,a2,1974 <memchr+0xa8>
    194c:	6398                	ld	a4,0(a5)
    194e:	8f29                	xor	a4,a4,a0
    1950:	011706b3          	add	a3,a4,a7
    1954:	fff74713          	not	a4,a4
    1958:	8f75                	and	a4,a4,a3
    195a:	01077733          	and	a4,a4,a6
    195e:	d37d                	beqz	a4,1944 <memchr+0x78>
        s = (const void *)w;
    1960:	853e                	mv	a0,a5
    1962:	a019                	j	1968 <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    1964:	0505                	add	a0,a0,1
    1966:	ca01                	beqz	a2,1976 <memchr+0xaa>
    1968:	00054783          	lbu	a5,0(a0)
    196c:	167d                	add	a2,a2,-1
    196e:	feb79be3          	bne	a5,a1,1964 <memchr+0x98>
    1972:	8082                	ret
    1974:	f675                	bnez	a2,1960 <memchr+0x94>
    return n ? (void *)s : 0;
    1976:	4501                	li	a0,0
}
    1978:	8082                	ret

000000000000197a <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    197a:	1101                	add	sp,sp,-32
    197c:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    197e:	862e                	mv	a2,a1
{
    1980:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1982:	4581                	li	a1,0
{
    1984:	e426                	sd	s1,8(sp)
    1986:	ec06                	sd	ra,24(sp)
    1988:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    198a:	f43ff0ef          	jal	18cc <memchr>
    return p ? p - s : n;
    198e:	c519                	beqz	a0,199c <strnlen+0x22>
}
    1990:	60e2                	ld	ra,24(sp)
    1992:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1994:	8d05                	sub	a0,a0,s1
}
    1996:	64a2                	ld	s1,8(sp)
    1998:	6105                	add	sp,sp,32
    199a:	8082                	ret
    199c:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    199e:	8522                	mv	a0,s0
}
    19a0:	6442                	ld	s0,16(sp)
    19a2:	64a2                	ld	s1,8(sp)
    19a4:	6105                	add	sp,sp,32
    19a6:	8082                	ret

00000000000019a8 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19a8:	00b547b3          	xor	a5,a0,a1
    19ac:	8b9d                	and	a5,a5,7
    19ae:	efb1                	bnez	a5,1a0a <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19b0:	0075f793          	and	a5,a1,7
    19b4:	ebb5                	bnez	a5,1a28 <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19b6:	feff0637          	lui	a2,0xfeff0
    19ba:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedf3f>
    19be:	f01016b7          	lui	a3,0xf0101
    19c2:	0642                	sll	a2,a2,0x10
    19c4:	0692                	sll	a3,a3,0x4
    19c6:	6198                	ld	a4,0(a1)
    19c8:	eff60613          	add	a2,a2,-257
    19cc:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff141>
    19d0:	0642                	sll	a2,a2,0x10
    19d2:	06c2                	sll	a3,a3,0x10
    19d4:	eff60613          	add	a2,a2,-257
    19d8:	10168693          	add	a3,a3,257
    19dc:	00c707b3          	add	a5,a4,a2
    19e0:	fff74813          	not	a6,a4
    19e4:	06be                	sll	a3,a3,0xf
    19e6:	0107f7b3          	and	a5,a5,a6
    19ea:	08068693          	add	a3,a3,128
    19ee:	8ff5                	and	a5,a5,a3
    19f0:	ef89                	bnez	a5,1a0a <strcpy+0x62>
    19f2:	05a1                	add	a1,a1,8
    19f4:	e118                	sd	a4,0(a0)
    19f6:	6198                	ld	a4,0(a1)
    19f8:	0521                	add	a0,a0,8
    19fa:	00c707b3          	add	a5,a4,a2
    19fe:	fff74813          	not	a6,a4
    1a02:	0107f7b3          	and	a5,a5,a6
    1a06:	8ff5                	and	a5,a5,a3
    1a08:	d7ed                	beqz	a5,19f2 <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a0a:	0005c783          	lbu	a5,0(a1)
    1a0e:	00f50023          	sb	a5,0(a0)
    1a12:	c785                	beqz	a5,1a3a <strcpy+0x92>
    1a14:	0015c783          	lbu	a5,1(a1)
    1a18:	0505                	add	a0,a0,1
    1a1a:	0585                	add	a1,a1,1
    1a1c:	00f50023          	sb	a5,0(a0)
    1a20:	fbf5                	bnez	a5,1a14 <strcpy+0x6c>
        ;
    return d;
}
    1a22:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a24:	0505                	add	a0,a0,1
    1a26:	db41                	beqz	a4,19b6 <strcpy+0xe>
            if (!(*d = *s))
    1a28:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a2c:	0585                	add	a1,a1,1
    1a2e:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a32:	00f50023          	sb	a5,0(a0)
    1a36:	f7fd                	bnez	a5,1a24 <strcpy+0x7c>
}
    1a38:	8082                	ret
    1a3a:	8082                	ret

0000000000001a3c <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a3c:	00b547b3          	xor	a5,a0,a1
    1a40:	8b9d                	and	a5,a5,7
    1a42:	efbd                	bnez	a5,1ac0 <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a44:	0075f793          	and	a5,a1,7
    1a48:	1c078563          	beqz	a5,1c12 <strncpy+0x1d6>
    1a4c:	ea11                	bnez	a2,1a60 <strncpy+0x24>
    1a4e:	8082                	ret
    1a50:	0585                	add	a1,a1,1
    1a52:	0075f793          	and	a5,a1,7
    1a56:	167d                	add	a2,a2,-1
    1a58:	0505                	add	a0,a0,1
    1a5a:	1a078c63          	beqz	a5,1c12 <strncpy+0x1d6>
    1a5e:	ca3d                	beqz	a2,1ad4 <strncpy+0x98>
    1a60:	0005c783          	lbu	a5,0(a1)
    1a64:	00f50023          	sb	a5,0(a0)
    1a68:	f7e5                	bnez	a5,1a50 <strncpy+0x14>
            ;
        if (!n || !*s)
    1a6a:	0005c783          	lbu	a5,0(a1)
    1a6e:	c7a5                	beqz	a5,1ad6 <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a70:	479d                	li	a5,7
    1a72:	04c7f863          	bgeu	a5,a2,1ac2 <strncpy+0x86>
    1a76:	f01016b7          	lui	a3,0xf0101
    1a7a:	feff0837          	lui	a6,0xfeff0
    1a7e:	0692                	sll	a3,a3,0x4
    1a80:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedf3f>
    1a84:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff141>
    1a88:	0842                	sll	a6,a6,0x10
    1a8a:	06c2                	sll	a3,a3,0x10
    1a8c:	eff80813          	add	a6,a6,-257
    1a90:	10168693          	add	a3,a3,257
    1a94:	0842                	sll	a6,a6,0x10
    1a96:	06be                	sll	a3,a3,0xf
    1a98:	eff80813          	add	a6,a6,-257
    1a9c:	08068693          	add	a3,a3,128
    1aa0:	431d                	li	t1,7
    1aa2:	6198                	ld	a4,0(a1)
    1aa4:	010707b3          	add	a5,a4,a6
    1aa8:	fff74893          	not	a7,a4
    1aac:	0117f7b3          	and	a5,a5,a7
    1ab0:	8ff5                	and	a5,a5,a3
    1ab2:	eb81                	bnez	a5,1ac2 <strncpy+0x86>
            *wd = *ws;
    1ab4:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ab6:	1661                	add	a2,a2,-8
    1ab8:	05a1                	add	a1,a1,8
    1aba:	0521                	add	a0,a0,8
    1abc:	fec363e3          	bltu	t1,a2,1aa2 <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1ac0:	ca11                	beqz	a2,1ad4 <strncpy+0x98>
    1ac2:	0005c783          	lbu	a5,0(a1)
    1ac6:	0585                	add	a1,a1,1
    1ac8:	00f50023          	sb	a5,0(a0)
    1acc:	c789                	beqz	a5,1ad6 <strncpy+0x9a>
    1ace:	167d                	add	a2,a2,-1
    1ad0:	0505                	add	a0,a0,1
    1ad2:	fa65                	bnez	a2,1ac2 <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1ad4:	8082                	ret
    1ad6:	40a00733          	neg	a4,a0
    1ada:	00777793          	and	a5,a4,7
    1ade:	00778693          	add	a3,a5,7
    1ae2:	482d                	li	a6,11
    1ae4:	fff60593          	add	a1,a2,-1
    1ae8:	1106ef63          	bltu	a3,a6,1c06 <strncpy+0x1ca>
    1aec:	12d5ee63          	bltu	a1,a3,1c28 <strncpy+0x1ec>
    1af0:	12078563          	beqz	a5,1c1a <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1af4:	00050023          	sb	zero,0(a0)
    1af8:	00677693          	and	a3,a4,6
    1afc:	12068263          	beqz	a3,1c20 <strncpy+0x1e4>
    1b00:	000500a3          	sb	zero,1(a0)
    1b04:	4689                	li	a3,2
    1b06:	12f6f463          	bgeu	a3,a5,1c2e <strncpy+0x1f2>
    1b0a:	00050123          	sb	zero,2(a0)
    1b0e:	8b11                	and	a4,a4,4
    1b10:	cf6d                	beqz	a4,1c0a <strncpy+0x1ce>
    1b12:	000501a3          	sb	zero,3(a0)
    1b16:	4711                	li	a4,4
    1b18:	00450693          	add	a3,a0,4
    1b1c:	02f77363          	bgeu	a4,a5,1b42 <strncpy+0x106>
    1b20:	00050223          	sb	zero,4(a0)
    1b24:	4715                	li	a4,5
    1b26:	00550693          	add	a3,a0,5
    1b2a:	00e78c63          	beq	a5,a4,1b42 <strncpy+0x106>
    1b2e:	000502a3          	sb	zero,5(a0)
    1b32:	471d                	li	a4,7
    1b34:	10e79163          	bne	a5,a4,1c36 <strncpy+0x1fa>
    1b38:	00750693          	add	a3,a0,7
    1b3c:	00050323          	sb	zero,6(a0)
    1b40:	471d                	li	a4,7
    1b42:	40f608b3          	sub	a7,a2,a5
    1b46:	ff88f813          	and	a6,a7,-8
    1b4a:	97aa                	add	a5,a5,a0
    1b4c:	010785b3          	add	a1,a5,a6
    1b50:	0007b023          	sd	zero,0(a5)
    1b54:	07a1                	add	a5,a5,8
    1b56:	feb79de3          	bne	a5,a1,1b50 <strncpy+0x114>
    1b5a:	00e807bb          	addw	a5,a6,a4
    1b5e:	01068733          	add	a4,a3,a6
    1b62:	0b088b63          	beq	a7,a6,1c18 <strncpy+0x1dc>
    1b66:	00070023          	sb	zero,0(a4)
    1b6a:	0017869b          	addw	a3,a5,1
    1b6e:	f6c6f3e3          	bgeu	a3,a2,1ad4 <strncpy+0x98>
    1b72:	000700a3          	sb	zero,1(a4)
    1b76:	0027869b          	addw	a3,a5,2
    1b7a:	f4c6fde3          	bgeu	a3,a2,1ad4 <strncpy+0x98>
    1b7e:	00070123          	sb	zero,2(a4)
    1b82:	0037869b          	addw	a3,a5,3
    1b86:	f4c6f7e3          	bgeu	a3,a2,1ad4 <strncpy+0x98>
    1b8a:	000701a3          	sb	zero,3(a4)
    1b8e:	0047869b          	addw	a3,a5,4
    1b92:	f4c6f1e3          	bgeu	a3,a2,1ad4 <strncpy+0x98>
    1b96:	00070223          	sb	zero,4(a4)
    1b9a:	0057869b          	addw	a3,a5,5
    1b9e:	f2c6fbe3          	bgeu	a3,a2,1ad4 <strncpy+0x98>
    1ba2:	000702a3          	sb	zero,5(a4)
    1ba6:	0067869b          	addw	a3,a5,6
    1baa:	f2c6f5e3          	bgeu	a3,a2,1ad4 <strncpy+0x98>
    1bae:	00070323          	sb	zero,6(a4)
    1bb2:	0077869b          	addw	a3,a5,7
    1bb6:	f0c6ffe3          	bgeu	a3,a2,1ad4 <strncpy+0x98>
    1bba:	000703a3          	sb	zero,7(a4)
    1bbe:	0087869b          	addw	a3,a5,8
    1bc2:	f0c6f9e3          	bgeu	a3,a2,1ad4 <strncpy+0x98>
    1bc6:	00070423          	sb	zero,8(a4)
    1bca:	0097869b          	addw	a3,a5,9
    1bce:	f0c6f3e3          	bgeu	a3,a2,1ad4 <strncpy+0x98>
    1bd2:	000704a3          	sb	zero,9(a4)
    1bd6:	00a7869b          	addw	a3,a5,10
    1bda:	eec6fde3          	bgeu	a3,a2,1ad4 <strncpy+0x98>
    1bde:	00070523          	sb	zero,10(a4)
    1be2:	00b7869b          	addw	a3,a5,11
    1be6:	eec6f7e3          	bgeu	a3,a2,1ad4 <strncpy+0x98>
    1bea:	000705a3          	sb	zero,11(a4)
    1bee:	00c7869b          	addw	a3,a5,12
    1bf2:	eec6f1e3          	bgeu	a3,a2,1ad4 <strncpy+0x98>
    1bf6:	00070623          	sb	zero,12(a4)
    1bfa:	27b5                	addw	a5,a5,13
    1bfc:	ecc7fce3          	bgeu	a5,a2,1ad4 <strncpy+0x98>
    1c00:	000706a3          	sb	zero,13(a4)
}
    1c04:	8082                	ret
    1c06:	46ad                	li	a3,11
    1c08:	b5d5                	j	1aec <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c0a:	00350693          	add	a3,a0,3
    1c0e:	470d                	li	a4,3
    1c10:	bf0d                	j	1b42 <strncpy+0x106>
        if (!n || !*s)
    1c12:	e4061ce3          	bnez	a2,1a6a <strncpy+0x2e>
}
    1c16:	8082                	ret
    1c18:	8082                	ret
    char *p = dest;
    1c1a:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c1c:	4701                	li	a4,0
    1c1e:	b715                	j	1b42 <strncpy+0x106>
    1c20:	00150693          	add	a3,a0,1
    1c24:	4705                	li	a4,1
    1c26:	bf31                	j	1b42 <strncpy+0x106>
    char *p = dest;
    1c28:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c2a:	4781                	li	a5,0
    1c2c:	bf2d                	j	1b66 <strncpy+0x12a>
    1c2e:	00250693          	add	a3,a0,2
    1c32:	4709                	li	a4,2
    1c34:	b739                	j	1b42 <strncpy+0x106>
    1c36:	00650693          	add	a3,a0,6
    1c3a:	4719                	li	a4,6
    1c3c:	b719                	j	1b42 <strncpy+0x106>

0000000000001c3e <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c3e:	87aa                	mv	a5,a0
    1c40:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c42:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c46:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c4a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c4c:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c4e:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c52:	2501                	sext.w	a0,a0
    1c54:	8082                	ret

0000000000001c56 <openat>:
    register long a7 __asm__("a7") = n;
    1c56:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c5a:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c5e:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c62:	2501                	sext.w	a0,a0
    1c64:	8082                	ret

0000000000001c66 <close>:
    register long a7 __asm__("a7") = n;
    1c66:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c6a:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c6e:	2501                	sext.w	a0,a0
    1c70:	8082                	ret

0000000000001c72 <read>:
    register long a7 __asm__("a7") = n;
    1c72:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c76:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c7a:	8082                	ret

0000000000001c7c <write>:
    register long a7 __asm__("a7") = n;
    1c7c:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c80:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c84:	8082                	ret

0000000000001c86 <getpid>:
    register long a7 __asm__("a7") = n;
    1c86:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c8a:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c8e:	2501                	sext.w	a0,a0
    1c90:	8082                	ret

0000000000001c92 <getppid>:
    register long a7 __asm__("a7") = n;
    1c92:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c96:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c9a:	2501                	sext.w	a0,a0
    1c9c:	8082                	ret

0000000000001c9e <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c9e:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1ca2:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1ca6:	2501                	sext.w	a0,a0
    1ca8:	8082                	ret

0000000000001caa <fork>:
    register long a7 __asm__("a7") = n;
    1caa:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cae:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cb0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cb2:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cb6:	2501                	sext.w	a0,a0
    1cb8:	8082                	ret

0000000000001cba <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cba:	85b2                	mv	a1,a2
    1cbc:	863a                	mv	a2,a4
    if (stack)
    1cbe:	c191                	beqz	a1,1cc2 <clone+0x8>
	stack += stack_size;
    1cc0:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cc2:	4781                	li	a5,0
    1cc4:	4701                	li	a4,0
    1cc6:	4681                	li	a3,0
    1cc8:	2601                	sext.w	a2,a2
    1cca:	a2ed                	j	1eb4 <__clone>

0000000000001ccc <exit>:
    register long a7 __asm__("a7") = n;
    1ccc:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cd0:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cd4:	8082                	ret

0000000000001cd6 <waitpid>:
    register long a7 __asm__("a7") = n;
    1cd6:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cda:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cdc:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1ce0:	2501                	sext.w	a0,a0
    1ce2:	8082                	ret

0000000000001ce4 <exec>:
    register long a7 __asm__("a7") = n;
    1ce4:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1ce8:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cec:	2501                	sext.w	a0,a0
    1cee:	8082                	ret

0000000000001cf0 <execve>:
    register long a7 __asm__("a7") = n;
    1cf0:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cf4:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cf8:	2501                	sext.w	a0,a0
    1cfa:	8082                	ret

0000000000001cfc <times>:
    register long a7 __asm__("a7") = n;
    1cfc:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d00:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d04:	2501                	sext.w	a0,a0
    1d06:	8082                	ret

0000000000001d08 <get_time>:

int64 get_time()
{
    1d08:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d0a:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d0e:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d10:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d12:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d16:	2501                	sext.w	a0,a0
    1d18:	ed09                	bnez	a0,1d32 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d1a:	67a2                	ld	a5,8(sp)
    1d1c:	3e800713          	li	a4,1000
    1d20:	00015503          	lhu	a0,0(sp)
    1d24:	02e7d7b3          	divu	a5,a5,a4
    1d28:	02e50533          	mul	a0,a0,a4
    1d2c:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d2e:	0141                	add	sp,sp,16
    1d30:	8082                	ret
        return -1;
    1d32:	557d                	li	a0,-1
    1d34:	bfed                	j	1d2e <get_time+0x26>

0000000000001d36 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d36:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d3a:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d3e:	2501                	sext.w	a0,a0
    1d40:	8082                	ret

0000000000001d42 <time>:
    register long a7 __asm__("a7") = n;
    1d42:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d46:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d4a:	2501                	sext.w	a0,a0
    1d4c:	8082                	ret

0000000000001d4e <sleep>:

int sleep(unsigned long long time)
{
    1d4e:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d50:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d52:	850a                	mv	a0,sp
    1d54:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d56:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d5a:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d5c:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d60:	e501                	bnez	a0,1d68 <sleep+0x1a>
    return 0;
    1d62:	4501                	li	a0,0
}
    1d64:	0141                	add	sp,sp,16
    1d66:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d68:	4502                	lw	a0,0(sp)
}
    1d6a:	0141                	add	sp,sp,16
    1d6c:	8082                	ret

0000000000001d6e <set_priority>:
    register long a7 __asm__("a7") = n;
    1d6e:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d72:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d76:	2501                	sext.w	a0,a0
    1d78:	8082                	ret

0000000000001d7a <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d7a:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d7e:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d82:	8082                	ret

0000000000001d84 <munmap>:
    register long a7 __asm__("a7") = n;
    1d84:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d88:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d8c:	2501                	sext.w	a0,a0
    1d8e:	8082                	ret

0000000000001d90 <wait>:

int wait(int *code)
{
    1d90:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d92:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d96:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d98:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d9a:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d9c:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1da0:	2501                	sext.w	a0,a0
    1da2:	8082                	ret

0000000000001da4 <spawn>:
    register long a7 __asm__("a7") = n;
    1da4:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1da8:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dac:	2501                	sext.w	a0,a0
    1dae:	8082                	ret

0000000000001db0 <mailread>:
    register long a7 __asm__("a7") = n;
    1db0:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db4:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1db8:	2501                	sext.w	a0,a0
    1dba:	8082                	ret

0000000000001dbc <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dbc:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dc0:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dc4:	2501                	sext.w	a0,a0
    1dc6:	8082                	ret

0000000000001dc8 <fstat>:
    register long a7 __asm__("a7") = n;
    1dc8:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dcc:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dd0:	2501                	sext.w	a0,a0
    1dd2:	8082                	ret

0000000000001dd4 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dd4:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dd6:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dda:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ddc:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1de0:	2501                	sext.w	a0,a0
    1de2:	8082                	ret

0000000000001de4 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1de4:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1de6:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1dea:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dec:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1df0:	2501                	sext.w	a0,a0
    1df2:	8082                	ret

0000000000001df4 <link>:

int link(char *old_path, char *new_path)
{
    1df4:	87aa                	mv	a5,a0
    1df6:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1df8:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1dfc:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e00:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e02:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e06:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e08:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e0c:	2501                	sext.w	a0,a0
    1e0e:	8082                	ret

0000000000001e10 <unlink>:

int unlink(char *path)
{
    1e10:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e12:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e16:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e1a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e1c:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e20:	2501                	sext.w	a0,a0
    1e22:	8082                	ret

0000000000001e24 <uname>:
    register long a7 __asm__("a7") = n;
    1e24:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e28:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e2c:	2501                	sext.w	a0,a0
    1e2e:	8082                	ret

0000000000001e30 <brk>:
    register long a7 __asm__("a7") = n;
    1e30:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e34:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e38:	2501                	sext.w	a0,a0
    1e3a:	8082                	ret

0000000000001e3c <getcwd>:
    register long a7 __asm__("a7") = n;
    1e3c:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e3e:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e42:	8082                	ret

0000000000001e44 <chdir>:
    register long a7 __asm__("a7") = n;
    1e44:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e48:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e4c:	2501                	sext.w	a0,a0
    1e4e:	8082                	ret

0000000000001e50 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e50:	862e                	mv	a2,a1
    1e52:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e54:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e56:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e5a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e5e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e60:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e62:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e66:	2501                	sext.w	a0,a0
    1e68:	8082                	ret

0000000000001e6a <getdents>:
    register long a7 __asm__("a7") = n;
    1e6a:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e6e:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e72:	2501                	sext.w	a0,a0
    1e74:	8082                	ret

0000000000001e76 <pipe>:
    register long a7 __asm__("a7") = n;
    1e76:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e7a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e7c:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e80:	2501                	sext.w	a0,a0
    1e82:	8082                	ret

0000000000001e84 <dup>:
    register long a7 __asm__("a7") = n;
    1e84:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e86:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e8a:	2501                	sext.w	a0,a0
    1e8c:	8082                	ret

0000000000001e8e <dup2>:
    register long a7 __asm__("a7") = n;
    1e8e:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e90:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e92:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e96:	2501                	sext.w	a0,a0
    1e98:	8082                	ret

0000000000001e9a <mount>:
    register long a7 __asm__("a7") = n;
    1e9a:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e9e:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ea2:	2501                	sext.w	a0,a0
    1ea4:	8082                	ret

0000000000001ea6 <umount>:
    register long a7 __asm__("a7") = n;
    1ea6:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1eaa:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eac:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1eb0:	2501                	sext.w	a0,a0
    1eb2:	8082                	ret

0000000000001eb4 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1eb4:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1eb6:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1eb8:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1eba:	8532                	mv	a0,a2
	mv a2, a4
    1ebc:	863a                	mv	a2,a4
	mv a3, a5
    1ebe:	86be                	mv	a3,a5
	mv a4, a6
    1ec0:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ec2:	0dc00893          	li	a7,220
	ecall
    1ec6:	00000073          	ecall

	beqz a0, 1f
    1eca:	c111                	beqz	a0,1ece <__clone+0x1a>
	# Parent
	ret
    1ecc:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ece:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ed0:	6522                	ld	a0,8(sp)
	jalr a1
    1ed2:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ed4:	05d00893          	li	a7,93
	ecall
    1ed8:	00000073          	ecall
