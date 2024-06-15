
/root/oskernel2024-trustos/pre_ctests/build/riscv64/dup:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a069                	j	108c <__start_main>

0000000000001004 <test_dup>:
/*
 * 测试通过时应输出：
 * "  new fd is 3."
 */

void test_dup(){
    1004:	1101                	add	sp,sp,-32
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	ed250513          	add	a0,a0,-302 # 1ed8 <__clone+0x2a>
void test_dup(){
    100e:	ec06                	sd	ra,24(sp)
	TEST_START(__func__);
    1010:	2b4000ef          	jal	12c4 <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	f3c50513          	add	a0,a0,-196 # 1f50 <__func__.0>
    101c:	2a8000ef          	jal	12c4 <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	ed050513          	add	a0,a0,-304 # 1ef0 <__clone+0x42>
    1028:	29c000ef          	jal	12c4 <puts>
	int fd = dup(STDOUT);
    102c:	4505                	li	a0,1
    102e:	651000ef          	jal	1e7e <dup>
    1032:	85aa                	mv	a1,a0
	assert(fd >=0);
    1034:	02054b63          	bltz	a0,106a <test_dup+0x66>
	printf("  new fd is %d.\n", fd);
    1038:	00001517          	auipc	a0,0x1
    103c:	ee850513          	add	a0,a0,-280 # 1f20 <__clone+0x72>
    1040:	2a6000ef          	jal	12e6 <printf>
	TEST_END(__func__);
    1044:	00001517          	auipc	a0,0x1
    1048:	ef450513          	add	a0,a0,-268 # 1f38 <__clone+0x8a>
    104c:	278000ef          	jal	12c4 <puts>
    1050:	00001517          	auipc	a0,0x1
    1054:	f0050513          	add	a0,a0,-256 # 1f50 <__func__.0>
    1058:	26c000ef          	jal	12c4 <puts>
}
    105c:	60e2                	ld	ra,24(sp)
	TEST_END(__func__);
    105e:	00001517          	auipc	a0,0x1
    1062:	e9250513          	add	a0,a0,-366 # 1ef0 <__clone+0x42>
}
    1066:	6105                	add	sp,sp,32
	TEST_END(__func__);
    1068:	acb1                	j	12c4 <puts>
    106a:	e42a                	sd	a0,8(sp)
	assert(fd >=0);
    106c:	00001517          	auipc	a0,0x1
    1070:	e9450513          	add	a0,a0,-364 # 1f00 <__clone+0x52>
    1074:	4f0000ef          	jal	1564 <panic>
    1078:	65a2                	ld	a1,8(sp)
    107a:	bf7d                	j	1038 <test_dup+0x34>

000000000000107c <main>:

int main(void) {
    107c:	1141                	add	sp,sp,-16
    107e:	e406                	sd	ra,8(sp)
	test_dup();
    1080:	f85ff0ef          	jal	1004 <test_dup>
	return 0;
}
    1084:	60a2                	ld	ra,8(sp)
    1086:	4501                	li	a0,0
    1088:	0141                	add	sp,sp,16
    108a:	8082                	ret

000000000000108c <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    108c:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    108e:	4108                	lw	a0,0(a0)
{
    1090:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    1092:	05a1                	add	a1,a1,8
{
    1094:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1096:	fe7ff0ef          	jal	107c <main>
    109a:	42d000ef          	jal	1cc6 <exit>
	return 0;
}
    109e:	60a2                	ld	ra,8(sp)
    10a0:	4501                	li	a0,0
    10a2:	0141                	add	sp,sp,16
    10a4:	8082                	ret

00000000000010a6 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10a6:	7179                	add	sp,sp,-48
    10a8:	f406                	sd	ra,40(sp)
    10aa:	0005081b          	sext.w	a6,a0
    10ae:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10b0:	00055563          	bgez	a0,10ba <printint.constprop.0+0x14>
        x = -xx;
    10b4:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    10b8:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10ba:	02b8763b          	remuw	a2,a6,a1
    10be:	00001697          	auipc	a3,0x1
    10c2:	ea268693          	add	a3,a3,-350 # 1f60 <digits>
    buf[16] = 0;
    10c6:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10ca:	0005871b          	sext.w	a4,a1
    10ce:	1602                	sll	a2,a2,0x20
    10d0:	9201                	srl	a2,a2,0x20
    10d2:	9636                	add	a2,a2,a3
    10d4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10d8:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    10dc:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    10e0:	10b86c63          	bltu	a6,a1,11f8 <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    10e4:	02e5763b          	remuw	a2,a0,a4
    10e8:	1602                	sll	a2,a2,0x20
    10ea:	9201                	srl	a2,a2,0x20
    10ec:	9636                	add	a2,a2,a3
    10ee:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10f2:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    10f6:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    10fa:	10e56863          	bltu	a0,a4,120a <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    10fe:	02e5f63b          	remuw	a2,a1,a4
    1102:	1602                	sll	a2,a2,0x20
    1104:	9201                	srl	a2,a2,0x20
    1106:	9636                	add	a2,a2,a3
    1108:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    110c:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1110:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1114:	10e5e463          	bltu	a1,a4,121c <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    1118:	02e5763b          	remuw	a2,a0,a4
    111c:	1602                	sll	a2,a2,0x20
    111e:	9201                	srl	a2,a2,0x20
    1120:	9636                	add	a2,a2,a3
    1122:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1126:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    112a:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    112e:	10e56063          	bltu	a0,a4,122e <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    1132:	02e5f63b          	remuw	a2,a1,a4
    1136:	1602                	sll	a2,a2,0x20
    1138:	9201                	srl	a2,a2,0x20
    113a:	9636                	add	a2,a2,a3
    113c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1140:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1144:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1148:	0ee5ec63          	bltu	a1,a4,1240 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    114c:	02e5763b          	remuw	a2,a0,a4
    1150:	1602                	sll	a2,a2,0x20
    1152:	9201                	srl	a2,a2,0x20
    1154:	9636                	add	a2,a2,a3
    1156:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    115a:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    115e:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1162:	08e56263          	bltu	a0,a4,11e6 <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    1166:	02e5f63b          	remuw	a2,a1,a4
    116a:	1602                	sll	a2,a2,0x20
    116c:	9201                	srl	a2,a2,0x20
    116e:	9636                	add	a2,a2,a3
    1170:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1174:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1178:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    117c:	0ce5eb63          	bltu	a1,a4,1252 <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    1180:	02e5763b          	remuw	a2,a0,a4
    1184:	1602                	sll	a2,a2,0x20
    1186:	9201                	srl	a2,a2,0x20
    1188:	9636                	add	a2,a2,a3
    118a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    118e:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1192:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1196:	0ce56763          	bltu	a0,a4,1264 <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    119a:	02e5f63b          	remuw	a2,a1,a4
    119e:	1602                	sll	a2,a2,0x20
    11a0:	9201                	srl	a2,a2,0x20
    11a2:	9636                	add	a2,a2,a3
    11a4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a8:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11ac:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11b0:	0ce5e363          	bltu	a1,a4,1276 <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    11b4:	1782                	sll	a5,a5,0x20
    11b6:	9381                	srl	a5,a5,0x20
    11b8:	96be                	add	a3,a3,a5
    11ba:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    11be:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    11c0:	00f10723          	sb	a5,14(sp)
    if (sign)
    11c4:	00088763          	beqz	a7,11d2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11c8:	02d00793          	li	a5,45
    11cc:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11d0:	4595                	li	a1,5
    write(f, s, l);
    11d2:	003c                	add	a5,sp,8
    11d4:	4641                	li	a2,16
    11d6:	9e0d                	subw	a2,a2,a1
    11d8:	4505                	li	a0,1
    11da:	95be                	add	a1,a1,a5
    11dc:	29b000ef          	jal	1c76 <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11e0:	70a2                	ld	ra,40(sp)
    11e2:	6145                	add	sp,sp,48
    11e4:	8082                	ret
    i++;
    11e6:	45a9                	li	a1,10
    if (sign)
    11e8:	fe0885e3          	beqz	a7,11d2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11ec:	02d00793          	li	a5,45
    11f0:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    11f4:	45a5                	li	a1,9
    11f6:	bff1                	j	11d2 <printint.constprop.0+0x12c>
    i++;
    11f8:	45bd                	li	a1,15
    if (sign)
    11fa:	fc088ce3          	beqz	a7,11d2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11fe:	02d00793          	li	a5,45
    1202:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1206:	45b9                	li	a1,14
    1208:	b7e9                	j	11d2 <printint.constprop.0+0x12c>
    i++;
    120a:	45b9                	li	a1,14
    if (sign)
    120c:	fc0883e3          	beqz	a7,11d2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1210:	02d00793          	li	a5,45
    1214:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1218:	45b5                	li	a1,13
    121a:	bf65                	j	11d2 <printint.constprop.0+0x12c>
    i++;
    121c:	45b5                	li	a1,13
    if (sign)
    121e:	fa088ae3          	beqz	a7,11d2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1222:	02d00793          	li	a5,45
    1226:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    122a:	45b1                	li	a1,12
    122c:	b75d                	j	11d2 <printint.constprop.0+0x12c>
    i++;
    122e:	45b1                	li	a1,12
    if (sign)
    1230:	fa0881e3          	beqz	a7,11d2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1234:	02d00793          	li	a5,45
    1238:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    123c:	45ad                	li	a1,11
    123e:	bf51                	j	11d2 <printint.constprop.0+0x12c>
    i++;
    1240:	45ad                	li	a1,11
    if (sign)
    1242:	f80888e3          	beqz	a7,11d2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1246:	02d00793          	li	a5,45
    124a:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    124e:	45a9                	li	a1,10
    1250:	b749                	j	11d2 <printint.constprop.0+0x12c>
    i++;
    1252:	45a5                	li	a1,9
    if (sign)
    1254:	f6088fe3          	beqz	a7,11d2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1258:	02d00793          	li	a5,45
    125c:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1260:	45a1                	li	a1,8
    1262:	bf85                	j	11d2 <printint.constprop.0+0x12c>
    i++;
    1264:	45a1                	li	a1,8
    if (sign)
    1266:	f60886e3          	beqz	a7,11d2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    126a:	02d00793          	li	a5,45
    126e:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1272:	459d                	li	a1,7
    1274:	bfb9                	j	11d2 <printint.constprop.0+0x12c>
    i++;
    1276:	459d                	li	a1,7
    if (sign)
    1278:	f4088de3          	beqz	a7,11d2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    127c:	02d00793          	li	a5,45
    1280:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1284:	4599                	li	a1,6
    1286:	b7b1                	j	11d2 <printint.constprop.0+0x12c>

0000000000001288 <getchar>:
{
    1288:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    128a:	00f10593          	add	a1,sp,15
    128e:	4605                	li	a2,1
    1290:	4501                	li	a0,0
{
    1292:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1294:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1298:	1d5000ef          	jal	1c6c <read>
}
    129c:	60e2                	ld	ra,24(sp)
    129e:	00f14503          	lbu	a0,15(sp)
    12a2:	6105                	add	sp,sp,32
    12a4:	8082                	ret

00000000000012a6 <putchar>:
{
    12a6:	1101                	add	sp,sp,-32
    12a8:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12aa:	00f10593          	add	a1,sp,15
    12ae:	4605                	li	a2,1
    12b0:	4505                	li	a0,1
{
    12b2:	ec06                	sd	ra,24(sp)
    char byte = c;
    12b4:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12b8:	1bf000ef          	jal	1c76 <write>
}
    12bc:	60e2                	ld	ra,24(sp)
    12be:	2501                	sext.w	a0,a0
    12c0:	6105                	add	sp,sp,32
    12c2:	8082                	ret

00000000000012c4 <puts>:
{
    12c4:	1141                	add	sp,sp,-16
    12c6:	e406                	sd	ra,8(sp)
    12c8:	e022                	sd	s0,0(sp)
    12ca:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12cc:	56c000ef          	jal	1838 <strlen>
    12d0:	862a                	mv	a2,a0
    12d2:	85a2                	mv	a1,s0
    12d4:	4505                	li	a0,1
    12d6:	1a1000ef          	jal	1c76 <write>
}
    12da:	60a2                	ld	ra,8(sp)
    12dc:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12de:	957d                	sra	a0,a0,0x3f
    return r;
    12e0:	2501                	sext.w	a0,a0
}
    12e2:	0141                	add	sp,sp,16
    12e4:	8082                	ret

00000000000012e6 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12e6:	7131                	add	sp,sp,-192
    12e8:	e4d6                	sd	s5,72(sp)
    12ea:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12ec:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12ee:	013c                	add	a5,sp,136
{
    12f0:	f0ca                	sd	s2,96(sp)
    12f2:	ecce                	sd	s3,88(sp)
    12f4:	e8d2                	sd	s4,80(sp)
    12f6:	e0da                	sd	s6,64(sp)
    12f8:	fc5e                	sd	s7,56(sp)
    12fa:	fc86                	sd	ra,120(sp)
    12fc:	f8a2                	sd	s0,112(sp)
    12fe:	f4a6                	sd	s1,104(sp)
    1300:	e52e                	sd	a1,136(sp)
    1302:	e932                	sd	a2,144(sp)
    1304:	ed36                	sd	a3,152(sp)
    1306:	f13a                	sd	a4,160(sp)
    1308:	f942                	sd	a6,176(sp)
    130a:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    130c:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    130e:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1312:	07300a13          	li	s4,115
    1316:	07800b93          	li	s7,120
    131a:	06400b13          	li	s6,100
    buf[i++] = '0';
    131e:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x58d0>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1322:	00001997          	auipc	s3,0x1
    1326:	c3e98993          	add	s3,s3,-962 # 1f60 <digits>
        if (!*s)
    132a:	00054783          	lbu	a5,0(a0)
    132e:	16078863          	beqz	a5,149e <printf+0x1b8>
    1332:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1334:	19278063          	beq	a5,s2,14b4 <printf+0x1ce>
    1338:	00164783          	lbu	a5,1(a2)
    133c:	0605                	add	a2,a2,1
    133e:	fbfd                	bnez	a5,1334 <printf+0x4e>
    1340:	84b2                	mv	s1,a2
        l = z - a;
    1342:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1346:	85aa                	mv	a1,a0
    1348:	8622                	mv	a2,s0
    134a:	4505                	li	a0,1
    134c:	12b000ef          	jal	1c76 <write>
        if (l)
    1350:	18041763          	bnez	s0,14de <printf+0x1f8>
        if (s[1] == 0)
    1354:	0014c783          	lbu	a5,1(s1)
    1358:	14078363          	beqz	a5,149e <printf+0x1b8>
        switch (s[1])
    135c:	19478f63          	beq	a5,s4,14fa <printf+0x214>
    1360:	18fa6163          	bltu	s4,a5,14e2 <printf+0x1fc>
    1364:	1b678e63          	beq	a5,s6,1520 <printf+0x23a>
    1368:	07000713          	li	a4,112
    136c:	1ce79463          	bne	a5,a4,1534 <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1370:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1372:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1376:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1378:	631c                	ld	a5,0(a4)
    137a:	0721                	add	a4,a4,8
    137c:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    137e:	00479293          	sll	t0,a5,0x4
    1382:	00879f93          	sll	t6,a5,0x8
    1386:	00c79f13          	sll	t5,a5,0xc
    138a:	01079e93          	sll	t4,a5,0x10
    138e:	01479e13          	sll	t3,a5,0x14
    1392:	01879313          	sll	t1,a5,0x18
    1396:	01c79893          	sll	a7,a5,0x1c
    139a:	02479813          	sll	a6,a5,0x24
    139e:	02879513          	sll	a0,a5,0x28
    13a2:	02c79593          	sll	a1,a5,0x2c
    13a6:	03079693          	sll	a3,a5,0x30
    13aa:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13ae:	03c7d413          	srl	s0,a5,0x3c
    13b2:	01c7d39b          	srlw	t2,a5,0x1c
    13b6:	03c2d293          	srl	t0,t0,0x3c
    13ba:	03cfdf93          	srl	t6,t6,0x3c
    13be:	03cf5f13          	srl	t5,t5,0x3c
    13c2:	03cede93          	srl	t4,t4,0x3c
    13c6:	03ce5e13          	srl	t3,t3,0x3c
    13ca:	03c35313          	srl	t1,t1,0x3c
    13ce:	03c8d893          	srl	a7,a7,0x3c
    13d2:	03c85813          	srl	a6,a6,0x3c
    13d6:	9171                	srl	a0,a0,0x3c
    13d8:	91f1                	srl	a1,a1,0x3c
    13da:	92f1                	srl	a3,a3,0x3c
    13dc:	9371                	srl	a4,a4,0x3c
    13de:	974e                	add	a4,a4,s3
    13e0:	944e                	add	s0,s0,s3
    13e2:	92ce                	add	t0,t0,s3
    13e4:	9fce                	add	t6,t6,s3
    13e6:	9f4e                	add	t5,t5,s3
    13e8:	9ece                	add	t4,t4,s3
    13ea:	9e4e                	add	t3,t3,s3
    13ec:	934e                	add	t1,t1,s3
    13ee:	98ce                	add	a7,a7,s3
    13f0:	93ce                	add	t2,t2,s3
    13f2:	984e                	add	a6,a6,s3
    13f4:	954e                	add	a0,a0,s3
    13f6:	95ce                	add	a1,a1,s3
    13f8:	96ce                	add	a3,a3,s3
    13fa:	00074083          	lbu	ra,0(a4)
    13fe:	0002c283          	lbu	t0,0(t0)
    1402:	000fcf83          	lbu	t6,0(t6)
    1406:	000f4f03          	lbu	t5,0(t5)
    140a:	000ece83          	lbu	t4,0(t4)
    140e:	000e4e03          	lbu	t3,0(t3)
    1412:	00034303          	lbu	t1,0(t1)
    1416:	0008c883          	lbu	a7,0(a7)
    141a:	0003c383          	lbu	t2,0(t2)
    141e:	00084803          	lbu	a6,0(a6)
    1422:	00054503          	lbu	a0,0(a0)
    1426:	0005c583          	lbu	a1,0(a1)
    142a:	0006c683          	lbu	a3,0(a3)
    142e:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1432:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1436:	9371                	srl	a4,a4,0x3c
    1438:	8bbd                	and	a5,a5,15
    143a:	974e                	add	a4,a4,s3
    143c:	97ce                	add	a5,a5,s3
    143e:	005105a3          	sb	t0,11(sp)
    1442:	01f10623          	sb	t6,12(sp)
    1446:	01e106a3          	sb	t5,13(sp)
    144a:	01d10723          	sb	t4,14(sp)
    144e:	01c107a3          	sb	t3,15(sp)
    1452:	00610823          	sb	t1,16(sp)
    1456:	011108a3          	sb	a7,17(sp)
    145a:	00710923          	sb	t2,18(sp)
    145e:	010109a3          	sb	a6,19(sp)
    1462:	00a10a23          	sb	a0,20(sp)
    1466:	00b10aa3          	sb	a1,21(sp)
    146a:	00d10b23          	sb	a3,22(sp)
    146e:	00110ba3          	sb	ra,23(sp)
    1472:	00810523          	sb	s0,10(sp)
    1476:	00074703          	lbu	a4,0(a4)
    147a:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    147e:	002c                	add	a1,sp,8
    1480:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1482:	00e10c23          	sb	a4,24(sp)
    1486:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    148a:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    148e:	7e8000ef          	jal	1c76 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1492:	00248513          	add	a0,s1,2
        if (!*s)
    1496:	00054783          	lbu	a5,0(a0)
    149a:	e8079ce3          	bnez	a5,1332 <printf+0x4c>
    }
    va_end(ap);
}
    149e:	70e6                	ld	ra,120(sp)
    14a0:	7446                	ld	s0,112(sp)
    14a2:	74a6                	ld	s1,104(sp)
    14a4:	7906                	ld	s2,96(sp)
    14a6:	69e6                	ld	s3,88(sp)
    14a8:	6a46                	ld	s4,80(sp)
    14aa:	6aa6                	ld	s5,72(sp)
    14ac:	6b06                	ld	s6,64(sp)
    14ae:	7be2                	ld	s7,56(sp)
    14b0:	6129                	add	sp,sp,192
    14b2:	8082                	ret
    14b4:	84b2                	mv	s1,a2
    14b6:	a039                	j	14c4 <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14b8:	0024c783          	lbu	a5,2(s1)
    14bc:	0605                	add	a2,a2,1
    14be:	0489                	add	s1,s1,2
    14c0:	e92791e3          	bne	a5,s2,1342 <printf+0x5c>
    14c4:	0014c783          	lbu	a5,1(s1)
    14c8:	ff2788e3          	beq	a5,s2,14b8 <printf+0x1d2>
        l = z - a;
    14cc:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14d0:	85aa                	mv	a1,a0
    14d2:	8622                	mv	a2,s0
    14d4:	4505                	li	a0,1
    14d6:	7a0000ef          	jal	1c76 <write>
        if (l)
    14da:	e6040de3          	beqz	s0,1354 <printf+0x6e>
    14de:	8526                	mv	a0,s1
    14e0:	b5a9                	j	132a <printf+0x44>
        switch (s[1])
    14e2:	05779963          	bne	a5,s7,1534 <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    14e6:	6782                	ld	a5,0(sp)
    14e8:	45c1                	li	a1,16
    14ea:	4388                	lw	a0,0(a5)
    14ec:	07a1                	add	a5,a5,8
    14ee:	e03e                	sd	a5,0(sp)
    14f0:	bb7ff0ef          	jal	10a6 <printint.constprop.0>
        s += 2;
    14f4:	00248513          	add	a0,s1,2
    14f8:	bf79                	j	1496 <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    14fa:	6782                	ld	a5,0(sp)
    14fc:	6380                	ld	s0,0(a5)
    14fe:	07a1                	add	a5,a5,8
    1500:	e03e                	sd	a5,0(sp)
    1502:	cc21                	beqz	s0,155a <printf+0x274>
            l = strnlen(a, 200);
    1504:	0c800593          	li	a1,200
    1508:	8522                	mv	a0,s0
    150a:	460000ef          	jal	196a <strnlen>
    write(f, s, l);
    150e:	0005061b          	sext.w	a2,a0
    1512:	85a2                	mv	a1,s0
    1514:	4505                	li	a0,1
    1516:	760000ef          	jal	1c76 <write>
        s += 2;
    151a:	00248513          	add	a0,s1,2
    151e:	bfa5                	j	1496 <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    1520:	6782                	ld	a5,0(sp)
    1522:	45a9                	li	a1,10
    1524:	4388                	lw	a0,0(a5)
    1526:	07a1                	add	a5,a5,8
    1528:	e03e                	sd	a5,0(sp)
    152a:	b7dff0ef          	jal	10a6 <printint.constprop.0>
        s += 2;
    152e:	00248513          	add	a0,s1,2
    1532:	b795                	j	1496 <printf+0x1b0>
    return write(stdout, &byte, 1);
    1534:	4605                	li	a2,1
    1536:	002c                	add	a1,sp,8
    1538:	4505                	li	a0,1
    char byte = c;
    153a:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    153e:	738000ef          	jal	1c76 <write>
    char byte = c;
    1542:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1546:	4605                	li	a2,1
    1548:	002c                	add	a1,sp,8
    154a:	4505                	li	a0,1
    char byte = c;
    154c:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1550:	726000ef          	jal	1c76 <write>
        s += 2;
    1554:	00248513          	add	a0,s1,2
    1558:	bf3d                	j	1496 <printf+0x1b0>
                a = "(null)";
    155a:	00001417          	auipc	s0,0x1
    155e:	9ee40413          	add	s0,s0,-1554 # 1f48 <__clone+0x9a>
    1562:	b74d                	j	1504 <printf+0x21e>

0000000000001564 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1564:	1141                	add	sp,sp,-16
    1566:	e406                	sd	ra,8(sp)
    puts(m);
    1568:	d5dff0ef          	jal	12c4 <puts>
    exit(-100);
}
    156c:	60a2                	ld	ra,8(sp)
    exit(-100);
    156e:	f9c00513          	li	a0,-100
}
    1572:	0141                	add	sp,sp,16
    exit(-100);
    1574:	af89                	j	1cc6 <exit>

0000000000001576 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1576:	02000793          	li	a5,32
    157a:	00f50663          	beq	a0,a5,1586 <isspace+0x10>
    157e:	355d                	addw	a0,a0,-9
    1580:	00553513          	sltiu	a0,a0,5
    1584:	8082                	ret
    1586:	4505                	li	a0,1
}
    1588:	8082                	ret

000000000000158a <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    158a:	fd05051b          	addw	a0,a0,-48
}
    158e:	00a53513          	sltiu	a0,a0,10
    1592:	8082                	ret

0000000000001594 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1594:	02000713          	li	a4,32
    1598:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    159a:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    159e:	ff76879b          	addw	a5,a3,-9
    15a2:	06e68063          	beq	a3,a4,1602 <atoi+0x6e>
    15a6:	0006859b          	sext.w	a1,a3
    15aa:	04f67c63          	bgeu	a2,a5,1602 <atoi+0x6e>
        s++;
    switch (*s)
    15ae:	02b00793          	li	a5,43
    15b2:	06f68563          	beq	a3,a5,161c <atoi+0x88>
    15b6:	02d00793          	li	a5,45
    15ba:	04f69663          	bne	a3,a5,1606 <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15be:	00154683          	lbu	a3,1(a0)
    15c2:	47a5                	li	a5,9
        s++;
    15c4:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    15c8:	fd06869b          	addw	a3,a3,-48
    15cc:	8636                	mv	a2,a3
    while (isdigit(*s))
    15ce:	04d7e563          	bltu	a5,a3,1618 <atoi+0x84>
        neg = 1;
    15d2:	4885                	li	a7,1
    int n = 0, neg = 0;
    15d4:	4501                	li	a0,0
    while (isdigit(*s))
    15d6:	4825                	li	a6,9
    15d8:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    15dc:	0025179b          	sllw	a5,a0,0x2
    15e0:	9fa9                	addw	a5,a5,a0
    15e2:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    15e6:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    15ea:	85b2                	mv	a1,a2
    15ec:	40c7853b          	subw	a0,a5,a2
    15f0:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    15f2:	8636                	mv	a2,a3
    while (isdigit(*s))
    15f4:	fed872e3          	bgeu	a6,a3,15d8 <atoi+0x44>
    return neg ? n : -n;
    15f8:	02089163          	bnez	a7,161a <atoi+0x86>
    15fc:	40f5853b          	subw	a0,a1,a5
    1600:	8082                	ret
        s++;
    1602:	0505                	add	a0,a0,1
    1604:	bf59                	j	159a <atoi+0x6>
    while (isdigit(*s))
    1606:	fd05859b          	addw	a1,a1,-48
    160a:	47a5                	li	a5,9
    160c:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    160e:	4881                	li	a7,0
    1610:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    1614:	fcb7f0e3          	bgeu	a5,a1,15d4 <atoi+0x40>
    return neg ? n : -n;
    1618:	4501                	li	a0,0
}
    161a:	8082                	ret
    while (isdigit(*s))
    161c:	00154683          	lbu	a3,1(a0)
    1620:	47a5                	li	a5,9
        s++;
    1622:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1626:	fd06869b          	addw	a3,a3,-48
    162a:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    162c:	4881                	li	a7,0
    while (isdigit(*s))
    162e:	fad7f3e3          	bgeu	a5,a3,15d4 <atoi+0x40>
    return neg ? n : -n;
    1632:	4501                	li	a0,0
    1634:	8082                	ret

0000000000001636 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1636:	16060f63          	beqz	a2,17b4 <memset+0x17e>
    163a:	40a006b3          	neg	a3,a0
    163e:	0076f793          	and	a5,a3,7
    1642:	00778813          	add	a6,a5,7
    1646:	48ad                	li	a7,11
    1648:	0ff5f713          	zext.b	a4,a1
    164c:	fff60593          	add	a1,a2,-1
    1650:	17186363          	bltu	a6,a7,17b6 <memset+0x180>
    1654:	1705eb63          	bltu	a1,a6,17ca <memset+0x194>
    1658:	16078163          	beqz	a5,17ba <memset+0x184>
    165c:	00e50023          	sb	a4,0(a0)
    1660:	0066f593          	and	a1,a3,6
    1664:	14058e63          	beqz	a1,17c0 <memset+0x18a>
    1668:	00e500a3          	sb	a4,1(a0)
    166c:	4589                	li	a1,2
    166e:	00250813          	add	a6,a0,2
    1672:	04f5f663          	bgeu	a1,a5,16be <memset+0x88>
    1676:	00e50123          	sb	a4,2(a0)
    167a:	8a91                	and	a3,a3,4
    167c:	00350813          	add	a6,a0,3
    1680:	458d                	li	a1,3
    1682:	ce95                	beqz	a3,16be <memset+0x88>
    1684:	00e501a3          	sb	a4,3(a0)
    1688:	4691                	li	a3,4
    168a:	00450813          	add	a6,a0,4
    168e:	4591                	li	a1,4
    1690:	02f6f763          	bgeu	a3,a5,16be <memset+0x88>
    1694:	00e50223          	sb	a4,4(a0)
    1698:	4695                	li	a3,5
    169a:	00550813          	add	a6,a0,5
    169e:	4595                	li	a1,5
    16a0:	00d78f63          	beq	a5,a3,16be <memset+0x88>
    16a4:	00e502a3          	sb	a4,5(a0)
    16a8:	469d                	li	a3,7
    16aa:	00650813          	add	a6,a0,6
    16ae:	4599                	li	a1,6
    16b0:	00d79763          	bne	a5,a3,16be <memset+0x88>
    16b4:	00750813          	add	a6,a0,7
    16b8:	00e50323          	sb	a4,6(a0)
    16bc:	459d                	li	a1,7
    16be:	00871693          	sll	a3,a4,0x8
    16c2:	01071313          	sll	t1,a4,0x10
    16c6:	8ed9                	or	a3,a3,a4
    16c8:	01871893          	sll	a7,a4,0x18
    16cc:	0066e6b3          	or	a3,a3,t1
    16d0:	0116e6b3          	or	a3,a3,a7
    16d4:	02071313          	sll	t1,a4,0x20
    16d8:	02871893          	sll	a7,a4,0x28
    16dc:	0066e6b3          	or	a3,a3,t1
    16e0:	40f60e33          	sub	t3,a2,a5
    16e4:	03071313          	sll	t1,a4,0x30
    16e8:	0116e6b3          	or	a3,a3,a7
    16ec:	0066e6b3          	or	a3,a3,t1
    16f0:	03871893          	sll	a7,a4,0x38
    16f4:	97aa                	add	a5,a5,a0
    16f6:	ff8e7313          	and	t1,t3,-8
    16fa:	0116e6b3          	or	a3,a3,a7
    16fe:	00f308b3          	add	a7,t1,a5
    1702:	e394                	sd	a3,0(a5)
    1704:	07a1                	add	a5,a5,8
    1706:	ff179ee3          	bne	a5,a7,1702 <memset+0xcc>
    170a:	006806b3          	add	a3,a6,t1
    170e:	00b307bb          	addw	a5,t1,a1
    1712:	0bc30b63          	beq	t1,t3,17c8 <memset+0x192>
    1716:	00e68023          	sb	a4,0(a3)
    171a:	0017859b          	addw	a1,a5,1
    171e:	08c5fb63          	bgeu	a1,a2,17b4 <memset+0x17e>
    1722:	00e680a3          	sb	a4,1(a3)
    1726:	0027859b          	addw	a1,a5,2
    172a:	08c5f563          	bgeu	a1,a2,17b4 <memset+0x17e>
    172e:	00e68123          	sb	a4,2(a3)
    1732:	0037859b          	addw	a1,a5,3
    1736:	06c5ff63          	bgeu	a1,a2,17b4 <memset+0x17e>
    173a:	00e681a3          	sb	a4,3(a3)
    173e:	0047859b          	addw	a1,a5,4
    1742:	06c5f963          	bgeu	a1,a2,17b4 <memset+0x17e>
    1746:	00e68223          	sb	a4,4(a3)
    174a:	0057859b          	addw	a1,a5,5
    174e:	06c5f363          	bgeu	a1,a2,17b4 <memset+0x17e>
    1752:	00e682a3          	sb	a4,5(a3)
    1756:	0067859b          	addw	a1,a5,6
    175a:	04c5fd63          	bgeu	a1,a2,17b4 <memset+0x17e>
    175e:	00e68323          	sb	a4,6(a3)
    1762:	0077859b          	addw	a1,a5,7
    1766:	04c5f763          	bgeu	a1,a2,17b4 <memset+0x17e>
    176a:	00e683a3          	sb	a4,7(a3)
    176e:	0087859b          	addw	a1,a5,8
    1772:	04c5f163          	bgeu	a1,a2,17b4 <memset+0x17e>
    1776:	00e68423          	sb	a4,8(a3)
    177a:	0097859b          	addw	a1,a5,9
    177e:	02c5fb63          	bgeu	a1,a2,17b4 <memset+0x17e>
    1782:	00e684a3          	sb	a4,9(a3)
    1786:	00a7859b          	addw	a1,a5,10
    178a:	02c5f563          	bgeu	a1,a2,17b4 <memset+0x17e>
    178e:	00e68523          	sb	a4,10(a3)
    1792:	00b7859b          	addw	a1,a5,11
    1796:	00c5ff63          	bgeu	a1,a2,17b4 <memset+0x17e>
    179a:	00e685a3          	sb	a4,11(a3)
    179e:	00c7859b          	addw	a1,a5,12
    17a2:	00c5f963          	bgeu	a1,a2,17b4 <memset+0x17e>
    17a6:	00e68623          	sb	a4,12(a3)
    17aa:	27b5                	addw	a5,a5,13
    17ac:	00c7f463          	bgeu	a5,a2,17b4 <memset+0x17e>
    17b0:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17b4:	8082                	ret
    17b6:	482d                	li	a6,11
    17b8:	bd71                	j	1654 <memset+0x1e>
    char *p = dest;
    17ba:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17bc:	4581                	li	a1,0
    17be:	b701                	j	16be <memset+0x88>
    17c0:	00150813          	add	a6,a0,1
    17c4:	4585                	li	a1,1
    17c6:	bde5                	j	16be <memset+0x88>
    17c8:	8082                	ret
    char *p = dest;
    17ca:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17cc:	4781                	li	a5,0
    17ce:	b7a1                	j	1716 <memset+0xe0>

00000000000017d0 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17d0:	00054783          	lbu	a5,0(a0)
    17d4:	0005c703          	lbu	a4,0(a1)
    17d8:	00e79863          	bne	a5,a4,17e8 <strcmp+0x18>
    17dc:	0505                	add	a0,a0,1
    17de:	0585                	add	a1,a1,1
    17e0:	fbe5                	bnez	a5,17d0 <strcmp>
    17e2:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    17e4:	9d19                	subw	a0,a0,a4
    17e6:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    17e8:	0007851b          	sext.w	a0,a5
    17ec:	bfe5                	j	17e4 <strcmp+0x14>

00000000000017ee <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    17ee:	ca15                	beqz	a2,1822 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17f0:	00054783          	lbu	a5,0(a0)
    if (!n--)
    17f4:	167d                	add	a2,a2,-1
    17f6:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17fa:	eb99                	bnez	a5,1810 <strncmp+0x22>
    17fc:	a815                	j	1830 <strncmp+0x42>
    17fe:	00a68e63          	beq	a3,a0,181a <strncmp+0x2c>
    1802:	0505                	add	a0,a0,1
    1804:	00f71b63          	bne	a4,a5,181a <strncmp+0x2c>
    1808:	00054783          	lbu	a5,0(a0)
    180c:	cf89                	beqz	a5,1826 <strncmp+0x38>
    180e:	85b2                	mv	a1,a2
    1810:	0005c703          	lbu	a4,0(a1)
    1814:	00158613          	add	a2,a1,1
    1818:	f37d                	bnez	a4,17fe <strncmp+0x10>
        ;
    return *l - *r;
    181a:	0007851b          	sext.w	a0,a5
    181e:	9d19                	subw	a0,a0,a4
    1820:	8082                	ret
        return 0;
    1822:	4501                	li	a0,0
}
    1824:	8082                	ret
    return *l - *r;
    1826:	0015c703          	lbu	a4,1(a1)
    182a:	4501                	li	a0,0
    182c:	9d19                	subw	a0,a0,a4
    182e:	8082                	ret
    1830:	0005c703          	lbu	a4,0(a1)
    1834:	4501                	li	a0,0
    1836:	b7e5                	j	181e <strncmp+0x30>

0000000000001838 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1838:	00757793          	and	a5,a0,7
    183c:	cf89                	beqz	a5,1856 <strlen+0x1e>
    183e:	87aa                	mv	a5,a0
    1840:	a029                	j	184a <strlen+0x12>
    1842:	0785                	add	a5,a5,1
    1844:	0077f713          	and	a4,a5,7
    1848:	cb01                	beqz	a4,1858 <strlen+0x20>
        if (!*s)
    184a:	0007c703          	lbu	a4,0(a5)
    184e:	fb75                	bnez	a4,1842 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1850:	40a78533          	sub	a0,a5,a0
}
    1854:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1856:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1858:	feff05b7          	lui	a1,0xfeff0
    185c:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedf9f>
    1860:	f0101637          	lui	a2,0xf0101
    1864:	05c2                	sll	a1,a1,0x10
    1866:	0612                	sll	a2,a2,0x4
    1868:	6394                	ld	a3,0(a5)
    186a:	eff58593          	add	a1,a1,-257
    186e:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff1a1>
    1872:	05c2                	sll	a1,a1,0x10
    1874:	0642                	sll	a2,a2,0x10
    1876:	eff58593          	add	a1,a1,-257
    187a:	10160613          	add	a2,a2,257
    187e:	00b68733          	add	a4,a3,a1
    1882:	063e                	sll	a2,a2,0xf
    1884:	fff6c693          	not	a3,a3
    1888:	8f75                	and	a4,a4,a3
    188a:	08060613          	add	a2,a2,128
    188e:	8f71                	and	a4,a4,a2
    1890:	eb11                	bnez	a4,18a4 <strlen+0x6c>
    1892:	6794                	ld	a3,8(a5)
    1894:	07a1                	add	a5,a5,8
    1896:	00b68733          	add	a4,a3,a1
    189a:	fff6c693          	not	a3,a3
    189e:	8f75                	and	a4,a4,a3
    18a0:	8f71                	and	a4,a4,a2
    18a2:	db65                	beqz	a4,1892 <strlen+0x5a>
    for (; *s; s++)
    18a4:	0007c703          	lbu	a4,0(a5)
    18a8:	d745                	beqz	a4,1850 <strlen+0x18>
    18aa:	0017c703          	lbu	a4,1(a5)
    18ae:	0785                	add	a5,a5,1
    18b0:	d345                	beqz	a4,1850 <strlen+0x18>
    18b2:	0017c703          	lbu	a4,1(a5)
    18b6:	0785                	add	a5,a5,1
    18b8:	fb6d                	bnez	a4,18aa <strlen+0x72>
    18ba:	bf59                	j	1850 <strlen+0x18>

00000000000018bc <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18bc:	00757713          	and	a4,a0,7
{
    18c0:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18c2:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18c6:	cb19                	beqz	a4,18dc <memchr+0x20>
    18c8:	ce59                	beqz	a2,1966 <memchr+0xaa>
    18ca:	0007c703          	lbu	a4,0(a5)
    18ce:	00b70963          	beq	a4,a1,18e0 <memchr+0x24>
    18d2:	0785                	add	a5,a5,1
    18d4:	0077f713          	and	a4,a5,7
    18d8:	167d                	add	a2,a2,-1
    18da:	f77d                	bnez	a4,18c8 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18dc:	4501                	li	a0,0
    if (n && *s != c)
    18de:	c649                	beqz	a2,1968 <memchr+0xac>
    18e0:	0007c703          	lbu	a4,0(a5)
    18e4:	06b70663          	beq	a4,a1,1950 <memchr+0x94>
        size_t k = ONES * c;
    18e8:	01010737          	lui	a4,0x1010
    18ec:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e1a1>
    18f0:	0742                	sll	a4,a4,0x10
    18f2:	10170713          	add	a4,a4,257
    18f6:	0742                	sll	a4,a4,0x10
    18f8:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18fc:	469d                	li	a3,7
        size_t k = ONES * c;
    18fe:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1902:	04c6f763          	bgeu	a3,a2,1950 <memchr+0x94>
    1906:	f0101837          	lui	a6,0xf0101
    190a:	feff08b7          	lui	a7,0xfeff0
    190e:	0812                	sll	a6,a6,0x4
    1910:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedf9f>
    1914:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff1a1>
    1918:	08c2                	sll	a7,a7,0x10
    191a:	0842                	sll	a6,a6,0x10
    191c:	eff88893          	add	a7,a7,-257
    1920:	10180813          	add	a6,a6,257
    1924:	08c2                	sll	a7,a7,0x10
    1926:	083e                	sll	a6,a6,0xf
    1928:	eff88893          	add	a7,a7,-257
    192c:	08080813          	add	a6,a6,128
    1930:	431d                	li	t1,7
    1932:	a029                	j	193c <memchr+0x80>
    1934:	1661                	add	a2,a2,-8
    1936:	07a1                	add	a5,a5,8
    1938:	02c37663          	bgeu	t1,a2,1964 <memchr+0xa8>
    193c:	6398                	ld	a4,0(a5)
    193e:	8f29                	xor	a4,a4,a0
    1940:	011706b3          	add	a3,a4,a7
    1944:	fff74713          	not	a4,a4
    1948:	8f75                	and	a4,a4,a3
    194a:	01077733          	and	a4,a4,a6
    194e:	d37d                	beqz	a4,1934 <memchr+0x78>
        s = (const void *)w;
    1950:	853e                	mv	a0,a5
    1952:	a019                	j	1958 <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    1954:	0505                	add	a0,a0,1
    1956:	ca01                	beqz	a2,1966 <memchr+0xaa>
    1958:	00054783          	lbu	a5,0(a0)
    195c:	167d                	add	a2,a2,-1
    195e:	feb79be3          	bne	a5,a1,1954 <memchr+0x98>
    1962:	8082                	ret
    1964:	f675                	bnez	a2,1950 <memchr+0x94>
    return n ? (void *)s : 0;
    1966:	4501                	li	a0,0
}
    1968:	8082                	ret

000000000000196a <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    196a:	1101                	add	sp,sp,-32
    196c:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    196e:	862e                	mv	a2,a1
{
    1970:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1972:	4581                	li	a1,0
{
    1974:	e426                	sd	s1,8(sp)
    1976:	ec06                	sd	ra,24(sp)
    1978:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    197a:	f43ff0ef          	jal	18bc <memchr>
    return p ? p - s : n;
    197e:	c519                	beqz	a0,198c <strnlen+0x22>
}
    1980:	60e2                	ld	ra,24(sp)
    1982:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1984:	8d05                	sub	a0,a0,s1
}
    1986:	64a2                	ld	s1,8(sp)
    1988:	6105                	add	sp,sp,32
    198a:	8082                	ret
    198c:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    198e:	8522                	mv	a0,s0
}
    1990:	6442                	ld	s0,16(sp)
    1992:	64a2                	ld	s1,8(sp)
    1994:	6105                	add	sp,sp,32
    1996:	8082                	ret

0000000000001998 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1998:	00b547b3          	xor	a5,a0,a1
    199c:	8b9d                	and	a5,a5,7
    199e:	efb1                	bnez	a5,19fa <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19a0:	0075f793          	and	a5,a1,7
    19a4:	ebb5                	bnez	a5,1a18 <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19a6:	feff0637          	lui	a2,0xfeff0
    19aa:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedf9f>
    19ae:	f01016b7          	lui	a3,0xf0101
    19b2:	0642                	sll	a2,a2,0x10
    19b4:	0692                	sll	a3,a3,0x4
    19b6:	6198                	ld	a4,0(a1)
    19b8:	eff60613          	add	a2,a2,-257
    19bc:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff1a1>
    19c0:	0642                	sll	a2,a2,0x10
    19c2:	06c2                	sll	a3,a3,0x10
    19c4:	eff60613          	add	a2,a2,-257
    19c8:	10168693          	add	a3,a3,257
    19cc:	00c707b3          	add	a5,a4,a2
    19d0:	fff74813          	not	a6,a4
    19d4:	06be                	sll	a3,a3,0xf
    19d6:	0107f7b3          	and	a5,a5,a6
    19da:	08068693          	add	a3,a3,128
    19de:	8ff5                	and	a5,a5,a3
    19e0:	ef89                	bnez	a5,19fa <strcpy+0x62>
    19e2:	05a1                	add	a1,a1,8
    19e4:	e118                	sd	a4,0(a0)
    19e6:	6198                	ld	a4,0(a1)
    19e8:	0521                	add	a0,a0,8
    19ea:	00c707b3          	add	a5,a4,a2
    19ee:	fff74813          	not	a6,a4
    19f2:	0107f7b3          	and	a5,a5,a6
    19f6:	8ff5                	and	a5,a5,a3
    19f8:	d7ed                	beqz	a5,19e2 <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19fa:	0005c783          	lbu	a5,0(a1)
    19fe:	00f50023          	sb	a5,0(a0)
    1a02:	c785                	beqz	a5,1a2a <strcpy+0x92>
    1a04:	0015c783          	lbu	a5,1(a1)
    1a08:	0505                	add	a0,a0,1
    1a0a:	0585                	add	a1,a1,1
    1a0c:	00f50023          	sb	a5,0(a0)
    1a10:	fbf5                	bnez	a5,1a04 <strcpy+0x6c>
        ;
    return d;
}
    1a12:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a14:	0505                	add	a0,a0,1
    1a16:	db41                	beqz	a4,19a6 <strcpy+0xe>
            if (!(*d = *s))
    1a18:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a1c:	0585                	add	a1,a1,1
    1a1e:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a22:	00f50023          	sb	a5,0(a0)
    1a26:	f7fd                	bnez	a5,1a14 <strcpy+0x7c>
}
    1a28:	8082                	ret
    1a2a:	8082                	ret

0000000000001a2c <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a2c:	00b547b3          	xor	a5,a0,a1
    1a30:	8b9d                	and	a5,a5,7
    1a32:	efbd                	bnez	a5,1ab0 <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a34:	0075f793          	and	a5,a1,7
    1a38:	1c078563          	beqz	a5,1c02 <strncpy+0x1d6>
    1a3c:	ea11                	bnez	a2,1a50 <strncpy+0x24>
    1a3e:	8082                	ret
    1a40:	0585                	add	a1,a1,1
    1a42:	0075f793          	and	a5,a1,7
    1a46:	167d                	add	a2,a2,-1
    1a48:	0505                	add	a0,a0,1
    1a4a:	1a078c63          	beqz	a5,1c02 <strncpy+0x1d6>
    1a4e:	ca3d                	beqz	a2,1ac4 <strncpy+0x98>
    1a50:	0005c783          	lbu	a5,0(a1)
    1a54:	00f50023          	sb	a5,0(a0)
    1a58:	f7e5                	bnez	a5,1a40 <strncpy+0x14>
            ;
        if (!n || !*s)
    1a5a:	0005c783          	lbu	a5,0(a1)
    1a5e:	c7a5                	beqz	a5,1ac6 <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a60:	479d                	li	a5,7
    1a62:	04c7f863          	bgeu	a5,a2,1ab2 <strncpy+0x86>
    1a66:	f01016b7          	lui	a3,0xf0101
    1a6a:	feff0837          	lui	a6,0xfeff0
    1a6e:	0692                	sll	a3,a3,0x4
    1a70:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedf9f>
    1a74:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff1a1>
    1a78:	0842                	sll	a6,a6,0x10
    1a7a:	06c2                	sll	a3,a3,0x10
    1a7c:	eff80813          	add	a6,a6,-257
    1a80:	10168693          	add	a3,a3,257
    1a84:	0842                	sll	a6,a6,0x10
    1a86:	06be                	sll	a3,a3,0xf
    1a88:	eff80813          	add	a6,a6,-257
    1a8c:	08068693          	add	a3,a3,128
    1a90:	431d                	li	t1,7
    1a92:	6198                	ld	a4,0(a1)
    1a94:	010707b3          	add	a5,a4,a6
    1a98:	fff74893          	not	a7,a4
    1a9c:	0117f7b3          	and	a5,a5,a7
    1aa0:	8ff5                	and	a5,a5,a3
    1aa2:	eb81                	bnez	a5,1ab2 <strncpy+0x86>
            *wd = *ws;
    1aa4:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1aa6:	1661                	add	a2,a2,-8
    1aa8:	05a1                	add	a1,a1,8
    1aaa:	0521                	add	a0,a0,8
    1aac:	fec363e3          	bltu	t1,a2,1a92 <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1ab0:	ca11                	beqz	a2,1ac4 <strncpy+0x98>
    1ab2:	0005c783          	lbu	a5,0(a1)
    1ab6:	0585                	add	a1,a1,1
    1ab8:	00f50023          	sb	a5,0(a0)
    1abc:	c789                	beqz	a5,1ac6 <strncpy+0x9a>
    1abe:	167d                	add	a2,a2,-1
    1ac0:	0505                	add	a0,a0,1
    1ac2:	fa65                	bnez	a2,1ab2 <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1ac4:	8082                	ret
    1ac6:	40a00733          	neg	a4,a0
    1aca:	00777793          	and	a5,a4,7
    1ace:	00778693          	add	a3,a5,7
    1ad2:	482d                	li	a6,11
    1ad4:	fff60593          	add	a1,a2,-1
    1ad8:	1106ef63          	bltu	a3,a6,1bf6 <strncpy+0x1ca>
    1adc:	12d5ee63          	bltu	a1,a3,1c18 <strncpy+0x1ec>
    1ae0:	12078563          	beqz	a5,1c0a <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ae4:	00050023          	sb	zero,0(a0)
    1ae8:	00677693          	and	a3,a4,6
    1aec:	12068263          	beqz	a3,1c10 <strncpy+0x1e4>
    1af0:	000500a3          	sb	zero,1(a0)
    1af4:	4689                	li	a3,2
    1af6:	12f6f463          	bgeu	a3,a5,1c1e <strncpy+0x1f2>
    1afa:	00050123          	sb	zero,2(a0)
    1afe:	8b11                	and	a4,a4,4
    1b00:	cf6d                	beqz	a4,1bfa <strncpy+0x1ce>
    1b02:	000501a3          	sb	zero,3(a0)
    1b06:	4711                	li	a4,4
    1b08:	00450693          	add	a3,a0,4
    1b0c:	02f77363          	bgeu	a4,a5,1b32 <strncpy+0x106>
    1b10:	00050223          	sb	zero,4(a0)
    1b14:	4715                	li	a4,5
    1b16:	00550693          	add	a3,a0,5
    1b1a:	00e78c63          	beq	a5,a4,1b32 <strncpy+0x106>
    1b1e:	000502a3          	sb	zero,5(a0)
    1b22:	471d                	li	a4,7
    1b24:	10e79163          	bne	a5,a4,1c26 <strncpy+0x1fa>
    1b28:	00750693          	add	a3,a0,7
    1b2c:	00050323          	sb	zero,6(a0)
    1b30:	471d                	li	a4,7
    1b32:	40f608b3          	sub	a7,a2,a5
    1b36:	ff88f813          	and	a6,a7,-8
    1b3a:	97aa                	add	a5,a5,a0
    1b3c:	010785b3          	add	a1,a5,a6
    1b40:	0007b023          	sd	zero,0(a5)
    1b44:	07a1                	add	a5,a5,8
    1b46:	feb79de3          	bne	a5,a1,1b40 <strncpy+0x114>
    1b4a:	00e807bb          	addw	a5,a6,a4
    1b4e:	01068733          	add	a4,a3,a6
    1b52:	0b088b63          	beq	a7,a6,1c08 <strncpy+0x1dc>
    1b56:	00070023          	sb	zero,0(a4)
    1b5a:	0017869b          	addw	a3,a5,1
    1b5e:	f6c6f3e3          	bgeu	a3,a2,1ac4 <strncpy+0x98>
    1b62:	000700a3          	sb	zero,1(a4)
    1b66:	0027869b          	addw	a3,a5,2
    1b6a:	f4c6fde3          	bgeu	a3,a2,1ac4 <strncpy+0x98>
    1b6e:	00070123          	sb	zero,2(a4)
    1b72:	0037869b          	addw	a3,a5,3
    1b76:	f4c6f7e3          	bgeu	a3,a2,1ac4 <strncpy+0x98>
    1b7a:	000701a3          	sb	zero,3(a4)
    1b7e:	0047869b          	addw	a3,a5,4
    1b82:	f4c6f1e3          	bgeu	a3,a2,1ac4 <strncpy+0x98>
    1b86:	00070223          	sb	zero,4(a4)
    1b8a:	0057869b          	addw	a3,a5,5
    1b8e:	f2c6fbe3          	bgeu	a3,a2,1ac4 <strncpy+0x98>
    1b92:	000702a3          	sb	zero,5(a4)
    1b96:	0067869b          	addw	a3,a5,6
    1b9a:	f2c6f5e3          	bgeu	a3,a2,1ac4 <strncpy+0x98>
    1b9e:	00070323          	sb	zero,6(a4)
    1ba2:	0077869b          	addw	a3,a5,7
    1ba6:	f0c6ffe3          	bgeu	a3,a2,1ac4 <strncpy+0x98>
    1baa:	000703a3          	sb	zero,7(a4)
    1bae:	0087869b          	addw	a3,a5,8
    1bb2:	f0c6f9e3          	bgeu	a3,a2,1ac4 <strncpy+0x98>
    1bb6:	00070423          	sb	zero,8(a4)
    1bba:	0097869b          	addw	a3,a5,9
    1bbe:	f0c6f3e3          	bgeu	a3,a2,1ac4 <strncpy+0x98>
    1bc2:	000704a3          	sb	zero,9(a4)
    1bc6:	00a7869b          	addw	a3,a5,10
    1bca:	eec6fde3          	bgeu	a3,a2,1ac4 <strncpy+0x98>
    1bce:	00070523          	sb	zero,10(a4)
    1bd2:	00b7869b          	addw	a3,a5,11
    1bd6:	eec6f7e3          	bgeu	a3,a2,1ac4 <strncpy+0x98>
    1bda:	000705a3          	sb	zero,11(a4)
    1bde:	00c7869b          	addw	a3,a5,12
    1be2:	eec6f1e3          	bgeu	a3,a2,1ac4 <strncpy+0x98>
    1be6:	00070623          	sb	zero,12(a4)
    1bea:	27b5                	addw	a5,a5,13
    1bec:	ecc7fce3          	bgeu	a5,a2,1ac4 <strncpy+0x98>
    1bf0:	000706a3          	sb	zero,13(a4)
}
    1bf4:	8082                	ret
    1bf6:	46ad                	li	a3,11
    1bf8:	b5d5                	j	1adc <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bfa:	00350693          	add	a3,a0,3
    1bfe:	470d                	li	a4,3
    1c00:	bf0d                	j	1b32 <strncpy+0x106>
        if (!n || !*s)
    1c02:	e4061ce3          	bnez	a2,1a5a <strncpy+0x2e>
}
    1c06:	8082                	ret
    1c08:	8082                	ret
    char *p = dest;
    1c0a:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c0c:	4701                	li	a4,0
    1c0e:	b715                	j	1b32 <strncpy+0x106>
    1c10:	00150693          	add	a3,a0,1
    1c14:	4705                	li	a4,1
    1c16:	bf31                	j	1b32 <strncpy+0x106>
    char *p = dest;
    1c18:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c1a:	4781                	li	a5,0
    1c1c:	bf2d                	j	1b56 <strncpy+0x12a>
    1c1e:	00250693          	add	a3,a0,2
    1c22:	4709                	li	a4,2
    1c24:	b739                	j	1b32 <strncpy+0x106>
    1c26:	00650693          	add	a3,a0,6
    1c2a:	4719                	li	a4,6
    1c2c:	b719                	j	1b32 <strncpy+0x106>

0000000000001c2e <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c2e:	87aa                	mv	a5,a0
    1c30:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c32:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c36:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c3a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c3c:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c3e:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c42:	2501                	sext.w	a0,a0
    1c44:	8082                	ret

0000000000001c46 <openat>:
    register long a7 __asm__("a7") = n;
    1c46:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c4a:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c4e:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c52:	2501                	sext.w	a0,a0
    1c54:	8082                	ret

0000000000001c56 <fcntl>:
    register long a7 __asm__("a7") = n;
    1c56:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c58:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
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
