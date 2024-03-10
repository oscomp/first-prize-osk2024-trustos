
/home/windflower/Desktop/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/dup2:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a871                	j	109e <__start_main>

0000000000001004 <test_dup2>:

/*
 * 测试通过时应输出：
 * "  from fd 100"
 */
void test_dup2(){
    1004:	1141                	add	sp,sp,-16
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	eda50513          	add	a0,a0,-294 # 1ee0 <__clone+0x2a>
void test_dup2(){
    100e:	e406                	sd	ra,8(sp)
	TEST_START(__func__);
    1010:	2c6000ef          	jal	12d6 <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	f3c50513          	add	a0,a0,-196 # 1f50 <__func__.0>
    101c:	2ba000ef          	jal	12d6 <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	ed850513          	add	a0,a0,-296 # 1ef8 <__clone+0x42>
    1028:	2ae000ef          	jal	12d6 <puts>
	int fd = dup2(STDOUT, 100);
    102c:	06400593          	li	a1,100
    1030:	4505                	li	a0,1
    1032:	65f000ef          	jal	1e90 <dup2>
	assert(fd != -1);
    1036:	57fd                	li	a5,-1
    1038:	04f50463          	beq	a0,a5,1080 <test_dup2+0x7c>
	const char *str = "  from fd 100\n";
	write(100, str, strlen(str));
    103c:	00001517          	auipc	a0,0x1
    1040:	eec50513          	add	a0,a0,-276 # 1f28 <__clone+0x72>
    1044:	007000ef          	jal	184a <strlen>
    1048:	862a                	mv	a2,a0
    104a:	00001597          	auipc	a1,0x1
    104e:	ede58593          	add	a1,a1,-290 # 1f28 <__clone+0x72>
    1052:	06400513          	li	a0,100
    1056:	429000ef          	jal	1c7e <write>
	TEST_END(__func__);
    105a:	00001517          	auipc	a0,0x1
    105e:	ede50513          	add	a0,a0,-290 # 1f38 <__clone+0x82>
    1062:	274000ef          	jal	12d6 <puts>
    1066:	00001517          	auipc	a0,0x1
    106a:	eea50513          	add	a0,a0,-278 # 1f50 <__func__.0>
    106e:	268000ef          	jal	12d6 <puts>
}
    1072:	60a2                	ld	ra,8(sp)
	TEST_END(__func__);
    1074:	00001517          	auipc	a0,0x1
    1078:	e8450513          	add	a0,a0,-380 # 1ef8 <__clone+0x42>
}
    107c:	0141                	add	sp,sp,16
	TEST_END(__func__);
    107e:	aca1                	j	12d6 <puts>
	assert(fd != -1);
    1080:	00001517          	auipc	a0,0x1
    1084:	e8850513          	add	a0,a0,-376 # 1f08 <__clone+0x52>
    1088:	4ee000ef          	jal	1576 <panic>
    108c:	bf45                	j	103c <test_dup2+0x38>

000000000000108e <main>:

int main(void) {
    108e:	1141                	add	sp,sp,-16
    1090:	e406                	sd	ra,8(sp)
	test_dup2();
    1092:	f73ff0ef          	jal	1004 <test_dup2>
	return 0;
}
    1096:	60a2                	ld	ra,8(sp)
    1098:	4501                	li	a0,0
    109a:	0141                	add	sp,sp,16
    109c:	8082                	ret

000000000000109e <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    109e:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10a0:	4108                	lw	a0,0(a0)
{
    10a2:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10a4:	05a1                	add	a1,a1,8
{
    10a6:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10a8:	fe7ff0ef          	jal	108e <main>
    10ac:	423000ef          	jal	1cce <exit>
	return 0;
}
    10b0:	60a2                	ld	ra,8(sp)
    10b2:	4501                	li	a0,0
    10b4:	0141                	add	sp,sp,16
    10b6:	8082                	ret

00000000000010b8 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10b8:	7179                	add	sp,sp,-48
    10ba:	f406                	sd	ra,40(sp)
    10bc:	0005081b          	sext.w	a6,a0
    10c0:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10c2:	00055563          	bgez	a0,10cc <printint.constprop.0+0x14>
        x = -xx;
    10c6:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    10ca:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10cc:	02b8763b          	remuw	a2,a6,a1
    10d0:	00001697          	auipc	a3,0x1
    10d4:	e9068693          	add	a3,a3,-368 # 1f60 <digits>
    buf[16] = 0;
    10d8:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10dc:	0005871b          	sext.w	a4,a1
    10e0:	1602                	sll	a2,a2,0x20
    10e2:	9201                	srl	a2,a2,0x20
    10e4:	9636                	add	a2,a2,a3
    10e6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10ea:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    10ee:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    10f2:	10b86c63          	bltu	a6,a1,120a <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    10f6:	02e5763b          	remuw	a2,a0,a4
    10fa:	1602                	sll	a2,a2,0x20
    10fc:	9201                	srl	a2,a2,0x20
    10fe:	9636                	add	a2,a2,a3
    1100:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1104:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1108:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    110c:	10e56863          	bltu	a0,a4,121c <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    1110:	02e5f63b          	remuw	a2,a1,a4
    1114:	1602                	sll	a2,a2,0x20
    1116:	9201                	srl	a2,a2,0x20
    1118:	9636                	add	a2,a2,a3
    111a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    111e:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1122:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1126:	10e5e463          	bltu	a1,a4,122e <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    112a:	02e5763b          	remuw	a2,a0,a4
    112e:	1602                	sll	a2,a2,0x20
    1130:	9201                	srl	a2,a2,0x20
    1132:	9636                	add	a2,a2,a3
    1134:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1138:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    113c:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1140:	10e56063          	bltu	a0,a4,1240 <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    1144:	02e5f63b          	remuw	a2,a1,a4
    1148:	1602                	sll	a2,a2,0x20
    114a:	9201                	srl	a2,a2,0x20
    114c:	9636                	add	a2,a2,a3
    114e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1152:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1156:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    115a:	0ee5ec63          	bltu	a1,a4,1252 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    115e:	02e5763b          	remuw	a2,a0,a4
    1162:	1602                	sll	a2,a2,0x20
    1164:	9201                	srl	a2,a2,0x20
    1166:	9636                	add	a2,a2,a3
    1168:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    116c:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1170:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1174:	08e56263          	bltu	a0,a4,11f8 <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    1178:	02e5f63b          	remuw	a2,a1,a4
    117c:	1602                	sll	a2,a2,0x20
    117e:	9201                	srl	a2,a2,0x20
    1180:	9636                	add	a2,a2,a3
    1182:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1186:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    118a:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    118e:	0ce5eb63          	bltu	a1,a4,1264 <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    1192:	02e5763b          	remuw	a2,a0,a4
    1196:	1602                	sll	a2,a2,0x20
    1198:	9201                	srl	a2,a2,0x20
    119a:	9636                	add	a2,a2,a3
    119c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a0:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11a4:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11a8:	0ce56763          	bltu	a0,a4,1276 <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    11ac:	02e5f63b          	remuw	a2,a1,a4
    11b0:	1602                	sll	a2,a2,0x20
    11b2:	9201                	srl	a2,a2,0x20
    11b4:	9636                	add	a2,a2,a3
    11b6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ba:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11be:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11c2:	0ce5e363          	bltu	a1,a4,1288 <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    11c6:	1782                	sll	a5,a5,0x20
    11c8:	9381                	srl	a5,a5,0x20
    11ca:	96be                	add	a3,a3,a5
    11cc:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    11d0:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    11d2:	00f10723          	sb	a5,14(sp)
    if (sign)
    11d6:	00088763          	beqz	a7,11e4 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11da:	02d00793          	li	a5,45
    11de:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11e2:	4595                	li	a1,5
    write(f, s, l);
    11e4:	003c                	add	a5,sp,8
    11e6:	4641                	li	a2,16
    11e8:	9e0d                	subw	a2,a2,a1
    11ea:	4505                	li	a0,1
    11ec:	95be                	add	a1,a1,a5
    11ee:	291000ef          	jal	1c7e <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11f2:	70a2                	ld	ra,40(sp)
    11f4:	6145                	add	sp,sp,48
    11f6:	8082                	ret
    i++;
    11f8:	45a9                	li	a1,10
    if (sign)
    11fa:	fe0885e3          	beqz	a7,11e4 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11fe:	02d00793          	li	a5,45
    1202:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1206:	45a5                	li	a1,9
    1208:	bff1                	j	11e4 <printint.constprop.0+0x12c>
    i++;
    120a:	45bd                	li	a1,15
    if (sign)
    120c:	fc088ce3          	beqz	a7,11e4 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1210:	02d00793          	li	a5,45
    1214:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1218:	45b9                	li	a1,14
    121a:	b7e9                	j	11e4 <printint.constprop.0+0x12c>
    i++;
    121c:	45b9                	li	a1,14
    if (sign)
    121e:	fc0883e3          	beqz	a7,11e4 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1222:	02d00793          	li	a5,45
    1226:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    122a:	45b5                	li	a1,13
    122c:	bf65                	j	11e4 <printint.constprop.0+0x12c>
    i++;
    122e:	45b5                	li	a1,13
    if (sign)
    1230:	fa088ae3          	beqz	a7,11e4 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1234:	02d00793          	li	a5,45
    1238:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    123c:	45b1                	li	a1,12
    123e:	b75d                	j	11e4 <printint.constprop.0+0x12c>
    i++;
    1240:	45b1                	li	a1,12
    if (sign)
    1242:	fa0881e3          	beqz	a7,11e4 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1246:	02d00793          	li	a5,45
    124a:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    124e:	45ad                	li	a1,11
    1250:	bf51                	j	11e4 <printint.constprop.0+0x12c>
    i++;
    1252:	45ad                	li	a1,11
    if (sign)
    1254:	f80888e3          	beqz	a7,11e4 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1258:	02d00793          	li	a5,45
    125c:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1260:	45a9                	li	a1,10
    1262:	b749                	j	11e4 <printint.constprop.0+0x12c>
    i++;
    1264:	45a5                	li	a1,9
    if (sign)
    1266:	f6088fe3          	beqz	a7,11e4 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    126a:	02d00793          	li	a5,45
    126e:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1272:	45a1                	li	a1,8
    1274:	bf85                	j	11e4 <printint.constprop.0+0x12c>
    i++;
    1276:	45a1                	li	a1,8
    if (sign)
    1278:	f60886e3          	beqz	a7,11e4 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    127c:	02d00793          	li	a5,45
    1280:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1284:	459d                	li	a1,7
    1286:	bfb9                	j	11e4 <printint.constprop.0+0x12c>
    i++;
    1288:	459d                	li	a1,7
    if (sign)
    128a:	f4088de3          	beqz	a7,11e4 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    128e:	02d00793          	li	a5,45
    1292:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1296:	4599                	li	a1,6
    1298:	b7b1                	j	11e4 <printint.constprop.0+0x12c>

000000000000129a <getchar>:
{
    129a:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    129c:	00f10593          	add	a1,sp,15
    12a0:	4605                	li	a2,1
    12a2:	4501                	li	a0,0
{
    12a4:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12a6:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12aa:	1cb000ef          	jal	1c74 <read>
}
    12ae:	60e2                	ld	ra,24(sp)
    12b0:	00f14503          	lbu	a0,15(sp)
    12b4:	6105                	add	sp,sp,32
    12b6:	8082                	ret

00000000000012b8 <putchar>:
{
    12b8:	1101                	add	sp,sp,-32
    12ba:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12bc:	00f10593          	add	a1,sp,15
    12c0:	4605                	li	a2,1
    12c2:	4505                	li	a0,1
{
    12c4:	ec06                	sd	ra,24(sp)
    char byte = c;
    12c6:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12ca:	1b5000ef          	jal	1c7e <write>
}
    12ce:	60e2                	ld	ra,24(sp)
    12d0:	2501                	sext.w	a0,a0
    12d2:	6105                	add	sp,sp,32
    12d4:	8082                	ret

00000000000012d6 <puts>:
{
    12d6:	1141                	add	sp,sp,-16
    12d8:	e406                	sd	ra,8(sp)
    12da:	e022                	sd	s0,0(sp)
    12dc:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12de:	56c000ef          	jal	184a <strlen>
    12e2:	862a                	mv	a2,a0
    12e4:	85a2                	mv	a1,s0
    12e6:	4505                	li	a0,1
    12e8:	197000ef          	jal	1c7e <write>
}
    12ec:	60a2                	ld	ra,8(sp)
    12ee:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12f0:	957d                	sra	a0,a0,0x3f
    return r;
    12f2:	2501                	sext.w	a0,a0
}
    12f4:	0141                	add	sp,sp,16
    12f6:	8082                	ret

00000000000012f8 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12f8:	7131                	add	sp,sp,-192
    12fa:	e4d6                	sd	s5,72(sp)
    12fc:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12fe:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1300:	013c                	add	a5,sp,136
{
    1302:	f0ca                	sd	s2,96(sp)
    1304:	ecce                	sd	s3,88(sp)
    1306:	e8d2                	sd	s4,80(sp)
    1308:	e0da                	sd	s6,64(sp)
    130a:	fc5e                	sd	s7,56(sp)
    130c:	fc86                	sd	ra,120(sp)
    130e:	f8a2                	sd	s0,112(sp)
    1310:	f4a6                	sd	s1,104(sp)
    1312:	e52e                	sd	a1,136(sp)
    1314:	e932                	sd	a2,144(sp)
    1316:	ed36                	sd	a3,152(sp)
    1318:	f13a                	sd	a4,160(sp)
    131a:	f942                	sd	a6,176(sp)
    131c:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    131e:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1320:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1324:	07300a13          	li	s4,115
    1328:	07800b93          	li	s7,120
    132c:	06400b13          	li	s6,100
    buf[i++] = '0';
    1330:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x58d0>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1334:	00001997          	auipc	s3,0x1
    1338:	c2c98993          	add	s3,s3,-980 # 1f60 <digits>
        if (!*s)
    133c:	00054783          	lbu	a5,0(a0)
    1340:	16078863          	beqz	a5,14b0 <printf+0x1b8>
    1344:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1346:	19278063          	beq	a5,s2,14c6 <printf+0x1ce>
    134a:	00164783          	lbu	a5,1(a2)
    134e:	0605                	add	a2,a2,1
    1350:	fbfd                	bnez	a5,1346 <printf+0x4e>
    1352:	84b2                	mv	s1,a2
        l = z - a;
    1354:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1358:	85aa                	mv	a1,a0
    135a:	8622                	mv	a2,s0
    135c:	4505                	li	a0,1
    135e:	121000ef          	jal	1c7e <write>
        if (l)
    1362:	18041763          	bnez	s0,14f0 <printf+0x1f8>
        if (s[1] == 0)
    1366:	0014c783          	lbu	a5,1(s1)
    136a:	14078363          	beqz	a5,14b0 <printf+0x1b8>
        switch (s[1])
    136e:	19478f63          	beq	a5,s4,150c <printf+0x214>
    1372:	18fa6163          	bltu	s4,a5,14f4 <printf+0x1fc>
    1376:	1b678e63          	beq	a5,s6,1532 <printf+0x23a>
    137a:	07000713          	li	a4,112
    137e:	1ce79463          	bne	a5,a4,1546 <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1382:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1384:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1388:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    138a:	631c                	ld	a5,0(a4)
    138c:	0721                	add	a4,a4,8
    138e:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1390:	00479293          	sll	t0,a5,0x4
    1394:	00879f93          	sll	t6,a5,0x8
    1398:	00c79f13          	sll	t5,a5,0xc
    139c:	01079e93          	sll	t4,a5,0x10
    13a0:	01479e13          	sll	t3,a5,0x14
    13a4:	01879313          	sll	t1,a5,0x18
    13a8:	01c79893          	sll	a7,a5,0x1c
    13ac:	02479813          	sll	a6,a5,0x24
    13b0:	02879513          	sll	a0,a5,0x28
    13b4:	02c79593          	sll	a1,a5,0x2c
    13b8:	03079693          	sll	a3,a5,0x30
    13bc:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13c0:	03c7d413          	srl	s0,a5,0x3c
    13c4:	01c7d39b          	srlw	t2,a5,0x1c
    13c8:	03c2d293          	srl	t0,t0,0x3c
    13cc:	03cfdf93          	srl	t6,t6,0x3c
    13d0:	03cf5f13          	srl	t5,t5,0x3c
    13d4:	03cede93          	srl	t4,t4,0x3c
    13d8:	03ce5e13          	srl	t3,t3,0x3c
    13dc:	03c35313          	srl	t1,t1,0x3c
    13e0:	03c8d893          	srl	a7,a7,0x3c
    13e4:	03c85813          	srl	a6,a6,0x3c
    13e8:	9171                	srl	a0,a0,0x3c
    13ea:	91f1                	srl	a1,a1,0x3c
    13ec:	92f1                	srl	a3,a3,0x3c
    13ee:	9371                	srl	a4,a4,0x3c
    13f0:	974e                	add	a4,a4,s3
    13f2:	944e                	add	s0,s0,s3
    13f4:	92ce                	add	t0,t0,s3
    13f6:	9fce                	add	t6,t6,s3
    13f8:	9f4e                	add	t5,t5,s3
    13fa:	9ece                	add	t4,t4,s3
    13fc:	9e4e                	add	t3,t3,s3
    13fe:	934e                	add	t1,t1,s3
    1400:	98ce                	add	a7,a7,s3
    1402:	93ce                	add	t2,t2,s3
    1404:	984e                	add	a6,a6,s3
    1406:	954e                	add	a0,a0,s3
    1408:	95ce                	add	a1,a1,s3
    140a:	96ce                	add	a3,a3,s3
    140c:	00074083          	lbu	ra,0(a4)
    1410:	0002c283          	lbu	t0,0(t0)
    1414:	000fcf83          	lbu	t6,0(t6)
    1418:	000f4f03          	lbu	t5,0(t5)
    141c:	000ece83          	lbu	t4,0(t4)
    1420:	000e4e03          	lbu	t3,0(t3)
    1424:	00034303          	lbu	t1,0(t1)
    1428:	0008c883          	lbu	a7,0(a7)
    142c:	0003c383          	lbu	t2,0(t2)
    1430:	00084803          	lbu	a6,0(a6)
    1434:	00054503          	lbu	a0,0(a0)
    1438:	0005c583          	lbu	a1,0(a1)
    143c:	0006c683          	lbu	a3,0(a3)
    1440:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1444:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1448:	9371                	srl	a4,a4,0x3c
    144a:	8bbd                	and	a5,a5,15
    144c:	974e                	add	a4,a4,s3
    144e:	97ce                	add	a5,a5,s3
    1450:	005105a3          	sb	t0,11(sp)
    1454:	01f10623          	sb	t6,12(sp)
    1458:	01e106a3          	sb	t5,13(sp)
    145c:	01d10723          	sb	t4,14(sp)
    1460:	01c107a3          	sb	t3,15(sp)
    1464:	00610823          	sb	t1,16(sp)
    1468:	011108a3          	sb	a7,17(sp)
    146c:	00710923          	sb	t2,18(sp)
    1470:	010109a3          	sb	a6,19(sp)
    1474:	00a10a23          	sb	a0,20(sp)
    1478:	00b10aa3          	sb	a1,21(sp)
    147c:	00d10b23          	sb	a3,22(sp)
    1480:	00110ba3          	sb	ra,23(sp)
    1484:	00810523          	sb	s0,10(sp)
    1488:	00074703          	lbu	a4,0(a4)
    148c:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1490:	002c                	add	a1,sp,8
    1492:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1494:	00e10c23          	sb	a4,24(sp)
    1498:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    149c:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14a0:	7de000ef          	jal	1c7e <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14a4:	00248513          	add	a0,s1,2
        if (!*s)
    14a8:	00054783          	lbu	a5,0(a0)
    14ac:	e8079ce3          	bnez	a5,1344 <printf+0x4c>
    }
    va_end(ap);
}
    14b0:	70e6                	ld	ra,120(sp)
    14b2:	7446                	ld	s0,112(sp)
    14b4:	74a6                	ld	s1,104(sp)
    14b6:	7906                	ld	s2,96(sp)
    14b8:	69e6                	ld	s3,88(sp)
    14ba:	6a46                	ld	s4,80(sp)
    14bc:	6aa6                	ld	s5,72(sp)
    14be:	6b06                	ld	s6,64(sp)
    14c0:	7be2                	ld	s7,56(sp)
    14c2:	6129                	add	sp,sp,192
    14c4:	8082                	ret
    14c6:	84b2                	mv	s1,a2
    14c8:	a039                	j	14d6 <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14ca:	0024c783          	lbu	a5,2(s1)
    14ce:	0605                	add	a2,a2,1
    14d0:	0489                	add	s1,s1,2
    14d2:	e92791e3          	bne	a5,s2,1354 <printf+0x5c>
    14d6:	0014c783          	lbu	a5,1(s1)
    14da:	ff2788e3          	beq	a5,s2,14ca <printf+0x1d2>
        l = z - a;
    14de:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14e2:	85aa                	mv	a1,a0
    14e4:	8622                	mv	a2,s0
    14e6:	4505                	li	a0,1
    14e8:	796000ef          	jal	1c7e <write>
        if (l)
    14ec:	e6040de3          	beqz	s0,1366 <printf+0x6e>
    14f0:	8526                	mv	a0,s1
    14f2:	b5a9                	j	133c <printf+0x44>
        switch (s[1])
    14f4:	05779963          	bne	a5,s7,1546 <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    14f8:	6782                	ld	a5,0(sp)
    14fa:	45c1                	li	a1,16
    14fc:	4388                	lw	a0,0(a5)
    14fe:	07a1                	add	a5,a5,8
    1500:	e03e                	sd	a5,0(sp)
    1502:	bb7ff0ef          	jal	10b8 <printint.constprop.0>
        s += 2;
    1506:	00248513          	add	a0,s1,2
    150a:	bf79                	j	14a8 <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    150c:	6782                	ld	a5,0(sp)
    150e:	6380                	ld	s0,0(a5)
    1510:	07a1                	add	a5,a5,8
    1512:	e03e                	sd	a5,0(sp)
    1514:	cc21                	beqz	s0,156c <printf+0x274>
            l = strnlen(a, 200);
    1516:	0c800593          	li	a1,200
    151a:	8522                	mv	a0,s0
    151c:	460000ef          	jal	197c <strnlen>
    write(f, s, l);
    1520:	0005061b          	sext.w	a2,a0
    1524:	85a2                	mv	a1,s0
    1526:	4505                	li	a0,1
    1528:	756000ef          	jal	1c7e <write>
        s += 2;
    152c:	00248513          	add	a0,s1,2
    1530:	bfa5                	j	14a8 <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    1532:	6782                	ld	a5,0(sp)
    1534:	45a9                	li	a1,10
    1536:	4388                	lw	a0,0(a5)
    1538:	07a1                	add	a5,a5,8
    153a:	e03e                	sd	a5,0(sp)
    153c:	b7dff0ef          	jal	10b8 <printint.constprop.0>
        s += 2;
    1540:	00248513          	add	a0,s1,2
    1544:	b795                	j	14a8 <printf+0x1b0>
    return write(stdout, &byte, 1);
    1546:	4605                	li	a2,1
    1548:	002c                	add	a1,sp,8
    154a:	4505                	li	a0,1
    char byte = c;
    154c:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1550:	72e000ef          	jal	1c7e <write>
    char byte = c;
    1554:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1558:	4605                	li	a2,1
    155a:	002c                	add	a1,sp,8
    155c:	4505                	li	a0,1
    char byte = c;
    155e:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1562:	71c000ef          	jal	1c7e <write>
        s += 2;
    1566:	00248513          	add	a0,s1,2
    156a:	bf3d                	j	14a8 <printf+0x1b0>
                a = "(null)";
    156c:	00001417          	auipc	s0,0x1
    1570:	9dc40413          	add	s0,s0,-1572 # 1f48 <__clone+0x92>
    1574:	b74d                	j	1516 <printf+0x21e>

0000000000001576 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1576:	1141                	add	sp,sp,-16
    1578:	e406                	sd	ra,8(sp)
    puts(m);
    157a:	d5dff0ef          	jal	12d6 <puts>
    exit(-100);
}
    157e:	60a2                	ld	ra,8(sp)
    exit(-100);
    1580:	f9c00513          	li	a0,-100
}
    1584:	0141                	add	sp,sp,16
    exit(-100);
    1586:	a7a1                	j	1cce <exit>

0000000000001588 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1588:	02000793          	li	a5,32
    158c:	00f50663          	beq	a0,a5,1598 <isspace+0x10>
    1590:	355d                	addw	a0,a0,-9
    1592:	00553513          	sltiu	a0,a0,5
    1596:	8082                	ret
    1598:	4505                	li	a0,1
}
    159a:	8082                	ret

000000000000159c <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    159c:	fd05051b          	addw	a0,a0,-48
}
    15a0:	00a53513          	sltiu	a0,a0,10
    15a4:	8082                	ret

00000000000015a6 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a6:	02000713          	li	a4,32
    15aa:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15ac:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15b0:	ff76879b          	addw	a5,a3,-9
    15b4:	06e68063          	beq	a3,a4,1614 <atoi+0x6e>
    15b8:	0006859b          	sext.w	a1,a3
    15bc:	04f67c63          	bgeu	a2,a5,1614 <atoi+0x6e>
        s++;
    switch (*s)
    15c0:	02b00793          	li	a5,43
    15c4:	06f68563          	beq	a3,a5,162e <atoi+0x88>
    15c8:	02d00793          	li	a5,45
    15cc:	04f69663          	bne	a3,a5,1618 <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15d0:	00154683          	lbu	a3,1(a0)
    15d4:	47a5                	li	a5,9
        s++;
    15d6:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    15da:	fd06869b          	addw	a3,a3,-48
    15de:	8636                	mv	a2,a3
    while (isdigit(*s))
    15e0:	04d7e563          	bltu	a5,a3,162a <atoi+0x84>
        neg = 1;
    15e4:	4885                	li	a7,1
    int n = 0, neg = 0;
    15e6:	4501                	li	a0,0
    while (isdigit(*s))
    15e8:	4825                	li	a6,9
    15ea:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    15ee:	0025179b          	sllw	a5,a0,0x2
    15f2:	9fa9                	addw	a5,a5,a0
    15f4:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    15f8:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    15fc:	85b2                	mv	a1,a2
    15fe:	40c7853b          	subw	a0,a5,a2
    1602:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    1604:	8636                	mv	a2,a3
    while (isdigit(*s))
    1606:	fed872e3          	bgeu	a6,a3,15ea <atoi+0x44>
    return neg ? n : -n;
    160a:	02089163          	bnez	a7,162c <atoi+0x86>
    160e:	40f5853b          	subw	a0,a1,a5
    1612:	8082                	ret
        s++;
    1614:	0505                	add	a0,a0,1
    1616:	bf59                	j	15ac <atoi+0x6>
    while (isdigit(*s))
    1618:	fd05859b          	addw	a1,a1,-48
    161c:	47a5                	li	a5,9
    161e:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1620:	4881                	li	a7,0
    1622:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    1626:	fcb7f0e3          	bgeu	a5,a1,15e6 <atoi+0x40>
    return neg ? n : -n;
    162a:	4501                	li	a0,0
}
    162c:	8082                	ret
    while (isdigit(*s))
    162e:	00154683          	lbu	a3,1(a0)
    1632:	47a5                	li	a5,9
        s++;
    1634:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1638:	fd06869b          	addw	a3,a3,-48
    163c:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    163e:	4881                	li	a7,0
    while (isdigit(*s))
    1640:	fad7f3e3          	bgeu	a5,a3,15e6 <atoi+0x40>
    return neg ? n : -n;
    1644:	4501                	li	a0,0
    1646:	8082                	ret

0000000000001648 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1648:	16060f63          	beqz	a2,17c6 <memset+0x17e>
    164c:	40a006b3          	neg	a3,a0
    1650:	0076f793          	and	a5,a3,7
    1654:	00778813          	add	a6,a5,7
    1658:	48ad                	li	a7,11
    165a:	0ff5f713          	zext.b	a4,a1
    165e:	fff60593          	add	a1,a2,-1
    1662:	17186363          	bltu	a6,a7,17c8 <memset+0x180>
    1666:	1705eb63          	bltu	a1,a6,17dc <memset+0x194>
    166a:	16078163          	beqz	a5,17cc <memset+0x184>
    166e:	00e50023          	sb	a4,0(a0)
    1672:	0066f593          	and	a1,a3,6
    1676:	14058e63          	beqz	a1,17d2 <memset+0x18a>
    167a:	00e500a3          	sb	a4,1(a0)
    167e:	4589                	li	a1,2
    1680:	00250813          	add	a6,a0,2
    1684:	04f5f663          	bgeu	a1,a5,16d0 <memset+0x88>
    1688:	00e50123          	sb	a4,2(a0)
    168c:	8a91                	and	a3,a3,4
    168e:	00350813          	add	a6,a0,3
    1692:	458d                	li	a1,3
    1694:	ce95                	beqz	a3,16d0 <memset+0x88>
    1696:	00e501a3          	sb	a4,3(a0)
    169a:	4691                	li	a3,4
    169c:	00450813          	add	a6,a0,4
    16a0:	4591                	li	a1,4
    16a2:	02f6f763          	bgeu	a3,a5,16d0 <memset+0x88>
    16a6:	00e50223          	sb	a4,4(a0)
    16aa:	4695                	li	a3,5
    16ac:	00550813          	add	a6,a0,5
    16b0:	4595                	li	a1,5
    16b2:	00d78f63          	beq	a5,a3,16d0 <memset+0x88>
    16b6:	00e502a3          	sb	a4,5(a0)
    16ba:	469d                	li	a3,7
    16bc:	00650813          	add	a6,a0,6
    16c0:	4599                	li	a1,6
    16c2:	00d79763          	bne	a5,a3,16d0 <memset+0x88>
    16c6:	00750813          	add	a6,a0,7
    16ca:	00e50323          	sb	a4,6(a0)
    16ce:	459d                	li	a1,7
    16d0:	00871693          	sll	a3,a4,0x8
    16d4:	01071313          	sll	t1,a4,0x10
    16d8:	8ed9                	or	a3,a3,a4
    16da:	01871893          	sll	a7,a4,0x18
    16de:	0066e6b3          	or	a3,a3,t1
    16e2:	0116e6b3          	or	a3,a3,a7
    16e6:	02071313          	sll	t1,a4,0x20
    16ea:	02871893          	sll	a7,a4,0x28
    16ee:	0066e6b3          	or	a3,a3,t1
    16f2:	40f60e33          	sub	t3,a2,a5
    16f6:	03071313          	sll	t1,a4,0x30
    16fa:	0116e6b3          	or	a3,a3,a7
    16fe:	0066e6b3          	or	a3,a3,t1
    1702:	03871893          	sll	a7,a4,0x38
    1706:	97aa                	add	a5,a5,a0
    1708:	ff8e7313          	and	t1,t3,-8
    170c:	0116e6b3          	or	a3,a3,a7
    1710:	00f308b3          	add	a7,t1,a5
    1714:	e394                	sd	a3,0(a5)
    1716:	07a1                	add	a5,a5,8
    1718:	ff179ee3          	bne	a5,a7,1714 <memset+0xcc>
    171c:	006806b3          	add	a3,a6,t1
    1720:	00b307bb          	addw	a5,t1,a1
    1724:	0bc30b63          	beq	t1,t3,17da <memset+0x192>
    1728:	00e68023          	sb	a4,0(a3)
    172c:	0017859b          	addw	a1,a5,1
    1730:	08c5fb63          	bgeu	a1,a2,17c6 <memset+0x17e>
    1734:	00e680a3          	sb	a4,1(a3)
    1738:	0027859b          	addw	a1,a5,2
    173c:	08c5f563          	bgeu	a1,a2,17c6 <memset+0x17e>
    1740:	00e68123          	sb	a4,2(a3)
    1744:	0037859b          	addw	a1,a5,3
    1748:	06c5ff63          	bgeu	a1,a2,17c6 <memset+0x17e>
    174c:	00e681a3          	sb	a4,3(a3)
    1750:	0047859b          	addw	a1,a5,4
    1754:	06c5f963          	bgeu	a1,a2,17c6 <memset+0x17e>
    1758:	00e68223          	sb	a4,4(a3)
    175c:	0057859b          	addw	a1,a5,5
    1760:	06c5f363          	bgeu	a1,a2,17c6 <memset+0x17e>
    1764:	00e682a3          	sb	a4,5(a3)
    1768:	0067859b          	addw	a1,a5,6
    176c:	04c5fd63          	bgeu	a1,a2,17c6 <memset+0x17e>
    1770:	00e68323          	sb	a4,6(a3)
    1774:	0077859b          	addw	a1,a5,7
    1778:	04c5f763          	bgeu	a1,a2,17c6 <memset+0x17e>
    177c:	00e683a3          	sb	a4,7(a3)
    1780:	0087859b          	addw	a1,a5,8
    1784:	04c5f163          	bgeu	a1,a2,17c6 <memset+0x17e>
    1788:	00e68423          	sb	a4,8(a3)
    178c:	0097859b          	addw	a1,a5,9
    1790:	02c5fb63          	bgeu	a1,a2,17c6 <memset+0x17e>
    1794:	00e684a3          	sb	a4,9(a3)
    1798:	00a7859b          	addw	a1,a5,10
    179c:	02c5f563          	bgeu	a1,a2,17c6 <memset+0x17e>
    17a0:	00e68523          	sb	a4,10(a3)
    17a4:	00b7859b          	addw	a1,a5,11
    17a8:	00c5ff63          	bgeu	a1,a2,17c6 <memset+0x17e>
    17ac:	00e685a3          	sb	a4,11(a3)
    17b0:	00c7859b          	addw	a1,a5,12
    17b4:	00c5f963          	bgeu	a1,a2,17c6 <memset+0x17e>
    17b8:	00e68623          	sb	a4,12(a3)
    17bc:	27b5                	addw	a5,a5,13
    17be:	00c7f463          	bgeu	a5,a2,17c6 <memset+0x17e>
    17c2:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17c6:	8082                	ret
    17c8:	482d                	li	a6,11
    17ca:	bd71                	j	1666 <memset+0x1e>
    char *p = dest;
    17cc:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17ce:	4581                	li	a1,0
    17d0:	b701                	j	16d0 <memset+0x88>
    17d2:	00150813          	add	a6,a0,1
    17d6:	4585                	li	a1,1
    17d8:	bde5                	j	16d0 <memset+0x88>
    17da:	8082                	ret
    char *p = dest;
    17dc:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17de:	4781                	li	a5,0
    17e0:	b7a1                	j	1728 <memset+0xe0>

00000000000017e2 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17e2:	00054783          	lbu	a5,0(a0)
    17e6:	0005c703          	lbu	a4,0(a1)
    17ea:	00e79863          	bne	a5,a4,17fa <strcmp+0x18>
    17ee:	0505                	add	a0,a0,1
    17f0:	0585                	add	a1,a1,1
    17f2:	fbe5                	bnez	a5,17e2 <strcmp>
    17f4:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    17f6:	9d19                	subw	a0,a0,a4
    17f8:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    17fa:	0007851b          	sext.w	a0,a5
    17fe:	bfe5                	j	17f6 <strcmp+0x14>

0000000000001800 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1800:	ca15                	beqz	a2,1834 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1802:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1806:	167d                	add	a2,a2,-1
    1808:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    180c:	eb99                	bnez	a5,1822 <strncmp+0x22>
    180e:	a815                	j	1842 <strncmp+0x42>
    1810:	00a68e63          	beq	a3,a0,182c <strncmp+0x2c>
    1814:	0505                	add	a0,a0,1
    1816:	00f71b63          	bne	a4,a5,182c <strncmp+0x2c>
    181a:	00054783          	lbu	a5,0(a0)
    181e:	cf89                	beqz	a5,1838 <strncmp+0x38>
    1820:	85b2                	mv	a1,a2
    1822:	0005c703          	lbu	a4,0(a1)
    1826:	00158613          	add	a2,a1,1
    182a:	f37d                	bnez	a4,1810 <strncmp+0x10>
        ;
    return *l - *r;
    182c:	0007851b          	sext.w	a0,a5
    1830:	9d19                	subw	a0,a0,a4
    1832:	8082                	ret
        return 0;
    1834:	4501                	li	a0,0
}
    1836:	8082                	ret
    return *l - *r;
    1838:	0015c703          	lbu	a4,1(a1)
    183c:	4501                	li	a0,0
    183e:	9d19                	subw	a0,a0,a4
    1840:	8082                	ret
    1842:	0005c703          	lbu	a4,0(a1)
    1846:	4501                	li	a0,0
    1848:	b7e5                	j	1830 <strncmp+0x30>

000000000000184a <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    184a:	00757793          	and	a5,a0,7
    184e:	cf89                	beqz	a5,1868 <strlen+0x1e>
    1850:	87aa                	mv	a5,a0
    1852:	a029                	j	185c <strlen+0x12>
    1854:	0785                	add	a5,a5,1
    1856:	0077f713          	and	a4,a5,7
    185a:	cb01                	beqz	a4,186a <strlen+0x20>
        if (!*s)
    185c:	0007c703          	lbu	a4,0(a5)
    1860:	fb75                	bnez	a4,1854 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1862:	40a78533          	sub	a0,a5,a0
}
    1866:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1868:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    186a:	feff05b7          	lui	a1,0xfeff0
    186e:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedf9f>
    1872:	f0101637          	lui	a2,0xf0101
    1876:	05c2                	sll	a1,a1,0x10
    1878:	0612                	sll	a2,a2,0x4
    187a:	6394                	ld	a3,0(a5)
    187c:	eff58593          	add	a1,a1,-257
    1880:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff1a1>
    1884:	05c2                	sll	a1,a1,0x10
    1886:	0642                	sll	a2,a2,0x10
    1888:	eff58593          	add	a1,a1,-257
    188c:	10160613          	add	a2,a2,257
    1890:	00b68733          	add	a4,a3,a1
    1894:	063e                	sll	a2,a2,0xf
    1896:	fff6c693          	not	a3,a3
    189a:	8f75                	and	a4,a4,a3
    189c:	08060613          	add	a2,a2,128
    18a0:	8f71                	and	a4,a4,a2
    18a2:	eb11                	bnez	a4,18b6 <strlen+0x6c>
    18a4:	6794                	ld	a3,8(a5)
    18a6:	07a1                	add	a5,a5,8
    18a8:	00b68733          	add	a4,a3,a1
    18ac:	fff6c693          	not	a3,a3
    18b0:	8f75                	and	a4,a4,a3
    18b2:	8f71                	and	a4,a4,a2
    18b4:	db65                	beqz	a4,18a4 <strlen+0x5a>
    for (; *s; s++)
    18b6:	0007c703          	lbu	a4,0(a5)
    18ba:	d745                	beqz	a4,1862 <strlen+0x18>
    18bc:	0017c703          	lbu	a4,1(a5)
    18c0:	0785                	add	a5,a5,1
    18c2:	d345                	beqz	a4,1862 <strlen+0x18>
    18c4:	0017c703          	lbu	a4,1(a5)
    18c8:	0785                	add	a5,a5,1
    18ca:	fb6d                	bnez	a4,18bc <strlen+0x72>
    18cc:	bf59                	j	1862 <strlen+0x18>

00000000000018ce <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18ce:	00757713          	and	a4,a0,7
{
    18d2:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18d4:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18d8:	cb19                	beqz	a4,18ee <memchr+0x20>
    18da:	ce59                	beqz	a2,1978 <memchr+0xaa>
    18dc:	0007c703          	lbu	a4,0(a5)
    18e0:	00b70963          	beq	a4,a1,18f2 <memchr+0x24>
    18e4:	0785                	add	a5,a5,1
    18e6:	0077f713          	and	a4,a5,7
    18ea:	167d                	add	a2,a2,-1
    18ec:	f77d                	bnez	a4,18da <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18ee:	4501                	li	a0,0
    if (n && *s != c)
    18f0:	c649                	beqz	a2,197a <memchr+0xac>
    18f2:	0007c703          	lbu	a4,0(a5)
    18f6:	06b70663          	beq	a4,a1,1962 <memchr+0x94>
        size_t k = ONES * c;
    18fa:	01010737          	lui	a4,0x1010
    18fe:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e1a1>
    1902:	0742                	sll	a4,a4,0x10
    1904:	10170713          	add	a4,a4,257
    1908:	0742                	sll	a4,a4,0x10
    190a:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    190e:	469d                	li	a3,7
        size_t k = ONES * c;
    1910:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1914:	04c6f763          	bgeu	a3,a2,1962 <memchr+0x94>
    1918:	f0101837          	lui	a6,0xf0101
    191c:	feff08b7          	lui	a7,0xfeff0
    1920:	0812                	sll	a6,a6,0x4
    1922:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedf9f>
    1926:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff1a1>
    192a:	08c2                	sll	a7,a7,0x10
    192c:	0842                	sll	a6,a6,0x10
    192e:	eff88893          	add	a7,a7,-257
    1932:	10180813          	add	a6,a6,257
    1936:	08c2                	sll	a7,a7,0x10
    1938:	083e                	sll	a6,a6,0xf
    193a:	eff88893          	add	a7,a7,-257
    193e:	08080813          	add	a6,a6,128
    1942:	431d                	li	t1,7
    1944:	a029                	j	194e <memchr+0x80>
    1946:	1661                	add	a2,a2,-8
    1948:	07a1                	add	a5,a5,8
    194a:	02c37663          	bgeu	t1,a2,1976 <memchr+0xa8>
    194e:	6398                	ld	a4,0(a5)
    1950:	8f29                	xor	a4,a4,a0
    1952:	011706b3          	add	a3,a4,a7
    1956:	fff74713          	not	a4,a4
    195a:	8f75                	and	a4,a4,a3
    195c:	01077733          	and	a4,a4,a6
    1960:	d37d                	beqz	a4,1946 <memchr+0x78>
        s = (const void *)w;
    1962:	853e                	mv	a0,a5
    1964:	a019                	j	196a <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    1966:	0505                	add	a0,a0,1
    1968:	ca01                	beqz	a2,1978 <memchr+0xaa>
    196a:	00054783          	lbu	a5,0(a0)
    196e:	167d                	add	a2,a2,-1
    1970:	feb79be3          	bne	a5,a1,1966 <memchr+0x98>
    1974:	8082                	ret
    1976:	f675                	bnez	a2,1962 <memchr+0x94>
    return n ? (void *)s : 0;
    1978:	4501                	li	a0,0
}
    197a:	8082                	ret

000000000000197c <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    197c:	1101                	add	sp,sp,-32
    197e:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1980:	862e                	mv	a2,a1
{
    1982:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1984:	4581                	li	a1,0
{
    1986:	e426                	sd	s1,8(sp)
    1988:	ec06                	sd	ra,24(sp)
    198a:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    198c:	f43ff0ef          	jal	18ce <memchr>
    return p ? p - s : n;
    1990:	c519                	beqz	a0,199e <strnlen+0x22>
}
    1992:	60e2                	ld	ra,24(sp)
    1994:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1996:	8d05                	sub	a0,a0,s1
}
    1998:	64a2                	ld	s1,8(sp)
    199a:	6105                	add	sp,sp,32
    199c:	8082                	ret
    199e:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19a0:	8522                	mv	a0,s0
}
    19a2:	6442                	ld	s0,16(sp)
    19a4:	64a2                	ld	s1,8(sp)
    19a6:	6105                	add	sp,sp,32
    19a8:	8082                	ret

00000000000019aa <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19aa:	00b547b3          	xor	a5,a0,a1
    19ae:	8b9d                	and	a5,a5,7
    19b0:	efb1                	bnez	a5,1a0c <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19b2:	0075f793          	and	a5,a1,7
    19b6:	ebb5                	bnez	a5,1a2a <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19b8:	feff0637          	lui	a2,0xfeff0
    19bc:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedf9f>
    19c0:	f01016b7          	lui	a3,0xf0101
    19c4:	0642                	sll	a2,a2,0x10
    19c6:	0692                	sll	a3,a3,0x4
    19c8:	6198                	ld	a4,0(a1)
    19ca:	eff60613          	add	a2,a2,-257
    19ce:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff1a1>
    19d2:	0642                	sll	a2,a2,0x10
    19d4:	06c2                	sll	a3,a3,0x10
    19d6:	eff60613          	add	a2,a2,-257
    19da:	10168693          	add	a3,a3,257
    19de:	00c707b3          	add	a5,a4,a2
    19e2:	fff74813          	not	a6,a4
    19e6:	06be                	sll	a3,a3,0xf
    19e8:	0107f7b3          	and	a5,a5,a6
    19ec:	08068693          	add	a3,a3,128
    19f0:	8ff5                	and	a5,a5,a3
    19f2:	ef89                	bnez	a5,1a0c <strcpy+0x62>
    19f4:	05a1                	add	a1,a1,8
    19f6:	e118                	sd	a4,0(a0)
    19f8:	6198                	ld	a4,0(a1)
    19fa:	0521                	add	a0,a0,8
    19fc:	00c707b3          	add	a5,a4,a2
    1a00:	fff74813          	not	a6,a4
    1a04:	0107f7b3          	and	a5,a5,a6
    1a08:	8ff5                	and	a5,a5,a3
    1a0a:	d7ed                	beqz	a5,19f4 <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a0c:	0005c783          	lbu	a5,0(a1)
    1a10:	00f50023          	sb	a5,0(a0)
    1a14:	c785                	beqz	a5,1a3c <strcpy+0x92>
    1a16:	0015c783          	lbu	a5,1(a1)
    1a1a:	0505                	add	a0,a0,1
    1a1c:	0585                	add	a1,a1,1
    1a1e:	00f50023          	sb	a5,0(a0)
    1a22:	fbf5                	bnez	a5,1a16 <strcpy+0x6c>
        ;
    return d;
}
    1a24:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a26:	0505                	add	a0,a0,1
    1a28:	db41                	beqz	a4,19b8 <strcpy+0xe>
            if (!(*d = *s))
    1a2a:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a2e:	0585                	add	a1,a1,1
    1a30:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a34:	00f50023          	sb	a5,0(a0)
    1a38:	f7fd                	bnez	a5,1a26 <strcpy+0x7c>
}
    1a3a:	8082                	ret
    1a3c:	8082                	ret

0000000000001a3e <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a3e:	00b547b3          	xor	a5,a0,a1
    1a42:	8b9d                	and	a5,a5,7
    1a44:	efbd                	bnez	a5,1ac2 <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a46:	0075f793          	and	a5,a1,7
    1a4a:	1c078563          	beqz	a5,1c14 <strncpy+0x1d6>
    1a4e:	ea11                	bnez	a2,1a62 <strncpy+0x24>
    1a50:	8082                	ret
    1a52:	0585                	add	a1,a1,1
    1a54:	0075f793          	and	a5,a1,7
    1a58:	167d                	add	a2,a2,-1
    1a5a:	0505                	add	a0,a0,1
    1a5c:	1a078c63          	beqz	a5,1c14 <strncpy+0x1d6>
    1a60:	ca3d                	beqz	a2,1ad6 <strncpy+0x98>
    1a62:	0005c783          	lbu	a5,0(a1)
    1a66:	00f50023          	sb	a5,0(a0)
    1a6a:	f7e5                	bnez	a5,1a52 <strncpy+0x14>
            ;
        if (!n || !*s)
    1a6c:	0005c783          	lbu	a5,0(a1)
    1a70:	c7a5                	beqz	a5,1ad8 <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a72:	479d                	li	a5,7
    1a74:	04c7f863          	bgeu	a5,a2,1ac4 <strncpy+0x86>
    1a78:	f01016b7          	lui	a3,0xf0101
    1a7c:	feff0837          	lui	a6,0xfeff0
    1a80:	0692                	sll	a3,a3,0x4
    1a82:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedf9f>
    1a86:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff1a1>
    1a8a:	0842                	sll	a6,a6,0x10
    1a8c:	06c2                	sll	a3,a3,0x10
    1a8e:	eff80813          	add	a6,a6,-257
    1a92:	10168693          	add	a3,a3,257
    1a96:	0842                	sll	a6,a6,0x10
    1a98:	06be                	sll	a3,a3,0xf
    1a9a:	eff80813          	add	a6,a6,-257
    1a9e:	08068693          	add	a3,a3,128
    1aa2:	431d                	li	t1,7
    1aa4:	6198                	ld	a4,0(a1)
    1aa6:	010707b3          	add	a5,a4,a6
    1aaa:	fff74893          	not	a7,a4
    1aae:	0117f7b3          	and	a5,a5,a7
    1ab2:	8ff5                	and	a5,a5,a3
    1ab4:	eb81                	bnez	a5,1ac4 <strncpy+0x86>
            *wd = *ws;
    1ab6:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ab8:	1661                	add	a2,a2,-8
    1aba:	05a1                	add	a1,a1,8
    1abc:	0521                	add	a0,a0,8
    1abe:	fec363e3          	bltu	t1,a2,1aa4 <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1ac2:	ca11                	beqz	a2,1ad6 <strncpy+0x98>
    1ac4:	0005c783          	lbu	a5,0(a1)
    1ac8:	0585                	add	a1,a1,1
    1aca:	00f50023          	sb	a5,0(a0)
    1ace:	c789                	beqz	a5,1ad8 <strncpy+0x9a>
    1ad0:	167d                	add	a2,a2,-1
    1ad2:	0505                	add	a0,a0,1
    1ad4:	fa65                	bnez	a2,1ac4 <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1ad6:	8082                	ret
    1ad8:	40a00733          	neg	a4,a0
    1adc:	00777793          	and	a5,a4,7
    1ae0:	00778693          	add	a3,a5,7
    1ae4:	482d                	li	a6,11
    1ae6:	fff60593          	add	a1,a2,-1
    1aea:	1106ef63          	bltu	a3,a6,1c08 <strncpy+0x1ca>
    1aee:	12d5ee63          	bltu	a1,a3,1c2a <strncpy+0x1ec>
    1af2:	12078563          	beqz	a5,1c1c <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1af6:	00050023          	sb	zero,0(a0)
    1afa:	00677693          	and	a3,a4,6
    1afe:	12068263          	beqz	a3,1c22 <strncpy+0x1e4>
    1b02:	000500a3          	sb	zero,1(a0)
    1b06:	4689                	li	a3,2
    1b08:	12f6f463          	bgeu	a3,a5,1c30 <strncpy+0x1f2>
    1b0c:	00050123          	sb	zero,2(a0)
    1b10:	8b11                	and	a4,a4,4
    1b12:	cf6d                	beqz	a4,1c0c <strncpy+0x1ce>
    1b14:	000501a3          	sb	zero,3(a0)
    1b18:	4711                	li	a4,4
    1b1a:	00450693          	add	a3,a0,4
    1b1e:	02f77363          	bgeu	a4,a5,1b44 <strncpy+0x106>
    1b22:	00050223          	sb	zero,4(a0)
    1b26:	4715                	li	a4,5
    1b28:	00550693          	add	a3,a0,5
    1b2c:	00e78c63          	beq	a5,a4,1b44 <strncpy+0x106>
    1b30:	000502a3          	sb	zero,5(a0)
    1b34:	471d                	li	a4,7
    1b36:	10e79163          	bne	a5,a4,1c38 <strncpy+0x1fa>
    1b3a:	00750693          	add	a3,a0,7
    1b3e:	00050323          	sb	zero,6(a0)
    1b42:	471d                	li	a4,7
    1b44:	40f608b3          	sub	a7,a2,a5
    1b48:	ff88f813          	and	a6,a7,-8
    1b4c:	97aa                	add	a5,a5,a0
    1b4e:	010785b3          	add	a1,a5,a6
    1b52:	0007b023          	sd	zero,0(a5)
    1b56:	07a1                	add	a5,a5,8
    1b58:	feb79de3          	bne	a5,a1,1b52 <strncpy+0x114>
    1b5c:	00e807bb          	addw	a5,a6,a4
    1b60:	01068733          	add	a4,a3,a6
    1b64:	0b088b63          	beq	a7,a6,1c1a <strncpy+0x1dc>
    1b68:	00070023          	sb	zero,0(a4)
    1b6c:	0017869b          	addw	a3,a5,1
    1b70:	f6c6f3e3          	bgeu	a3,a2,1ad6 <strncpy+0x98>
    1b74:	000700a3          	sb	zero,1(a4)
    1b78:	0027869b          	addw	a3,a5,2
    1b7c:	f4c6fde3          	bgeu	a3,a2,1ad6 <strncpy+0x98>
    1b80:	00070123          	sb	zero,2(a4)
    1b84:	0037869b          	addw	a3,a5,3
    1b88:	f4c6f7e3          	bgeu	a3,a2,1ad6 <strncpy+0x98>
    1b8c:	000701a3          	sb	zero,3(a4)
    1b90:	0047869b          	addw	a3,a5,4
    1b94:	f4c6f1e3          	bgeu	a3,a2,1ad6 <strncpy+0x98>
    1b98:	00070223          	sb	zero,4(a4)
    1b9c:	0057869b          	addw	a3,a5,5
    1ba0:	f2c6fbe3          	bgeu	a3,a2,1ad6 <strncpy+0x98>
    1ba4:	000702a3          	sb	zero,5(a4)
    1ba8:	0067869b          	addw	a3,a5,6
    1bac:	f2c6f5e3          	bgeu	a3,a2,1ad6 <strncpy+0x98>
    1bb0:	00070323          	sb	zero,6(a4)
    1bb4:	0077869b          	addw	a3,a5,7
    1bb8:	f0c6ffe3          	bgeu	a3,a2,1ad6 <strncpy+0x98>
    1bbc:	000703a3          	sb	zero,7(a4)
    1bc0:	0087869b          	addw	a3,a5,8
    1bc4:	f0c6f9e3          	bgeu	a3,a2,1ad6 <strncpy+0x98>
    1bc8:	00070423          	sb	zero,8(a4)
    1bcc:	0097869b          	addw	a3,a5,9
    1bd0:	f0c6f3e3          	bgeu	a3,a2,1ad6 <strncpy+0x98>
    1bd4:	000704a3          	sb	zero,9(a4)
    1bd8:	00a7869b          	addw	a3,a5,10
    1bdc:	eec6fde3          	bgeu	a3,a2,1ad6 <strncpy+0x98>
    1be0:	00070523          	sb	zero,10(a4)
    1be4:	00b7869b          	addw	a3,a5,11
    1be8:	eec6f7e3          	bgeu	a3,a2,1ad6 <strncpy+0x98>
    1bec:	000705a3          	sb	zero,11(a4)
    1bf0:	00c7869b          	addw	a3,a5,12
    1bf4:	eec6f1e3          	bgeu	a3,a2,1ad6 <strncpy+0x98>
    1bf8:	00070623          	sb	zero,12(a4)
    1bfc:	27b5                	addw	a5,a5,13
    1bfe:	ecc7fce3          	bgeu	a5,a2,1ad6 <strncpy+0x98>
    1c02:	000706a3          	sb	zero,13(a4)
}
    1c06:	8082                	ret
    1c08:	46ad                	li	a3,11
    1c0a:	b5d5                	j	1aee <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c0c:	00350693          	add	a3,a0,3
    1c10:	470d                	li	a4,3
    1c12:	bf0d                	j	1b44 <strncpy+0x106>
        if (!n || !*s)
    1c14:	e4061ce3          	bnez	a2,1a6c <strncpy+0x2e>
}
    1c18:	8082                	ret
    1c1a:	8082                	ret
    char *p = dest;
    1c1c:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c1e:	4701                	li	a4,0
    1c20:	b715                	j	1b44 <strncpy+0x106>
    1c22:	00150693          	add	a3,a0,1
    1c26:	4705                	li	a4,1
    1c28:	bf31                	j	1b44 <strncpy+0x106>
    char *p = dest;
    1c2a:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c2c:	4781                	li	a5,0
    1c2e:	bf2d                	j	1b68 <strncpy+0x12a>
    1c30:	00250693          	add	a3,a0,2
    1c34:	4709                	li	a4,2
    1c36:	b739                	j	1b44 <strncpy+0x106>
    1c38:	00650693          	add	a3,a0,6
    1c3c:	4719                	li	a4,6
    1c3e:	b719                	j	1b44 <strncpy+0x106>

0000000000001c40 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c40:	87aa                	mv	a5,a0
    1c42:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c44:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c48:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c4c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c4e:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c50:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c54:	2501                	sext.w	a0,a0
    1c56:	8082                	ret

0000000000001c58 <openat>:
    register long a7 __asm__("a7") = n;
    1c58:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c5c:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c60:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c64:	2501                	sext.w	a0,a0
    1c66:	8082                	ret

0000000000001c68 <close>:
    register long a7 __asm__("a7") = n;
    1c68:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c6c:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c70:	2501                	sext.w	a0,a0
    1c72:	8082                	ret

0000000000001c74 <read>:
    register long a7 __asm__("a7") = n;
    1c74:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c78:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c7c:	8082                	ret

0000000000001c7e <write>:
    register long a7 __asm__("a7") = n;
    1c7e:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c82:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c86:	8082                	ret

0000000000001c88 <getpid>:
    register long a7 __asm__("a7") = n;
    1c88:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c8c:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c90:	2501                	sext.w	a0,a0
    1c92:	8082                	ret

0000000000001c94 <getppid>:
    register long a7 __asm__("a7") = n;
    1c94:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c98:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c9c:	2501                	sext.w	a0,a0
    1c9e:	8082                	ret

0000000000001ca0 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1ca0:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1ca4:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1ca8:	2501                	sext.w	a0,a0
    1caa:	8082                	ret

0000000000001cac <fork>:
    register long a7 __asm__("a7") = n;
    1cac:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cb0:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cb2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cb4:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cb8:	2501                	sext.w	a0,a0
    1cba:	8082                	ret

0000000000001cbc <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cbc:	85b2                	mv	a1,a2
    1cbe:	863a                	mv	a2,a4
    if (stack)
    1cc0:	c191                	beqz	a1,1cc4 <clone+0x8>
	stack += stack_size;
    1cc2:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cc4:	4781                	li	a5,0
    1cc6:	4701                	li	a4,0
    1cc8:	4681                	li	a3,0
    1cca:	2601                	sext.w	a2,a2
    1ccc:	a2ed                	j	1eb6 <__clone>

0000000000001cce <exit>:
    register long a7 __asm__("a7") = n;
    1cce:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cd2:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cd6:	8082                	ret

0000000000001cd8 <waitpid>:
    register long a7 __asm__("a7") = n;
    1cd8:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cdc:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cde:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1ce2:	2501                	sext.w	a0,a0
    1ce4:	8082                	ret

0000000000001ce6 <exec>:
    register long a7 __asm__("a7") = n;
    1ce6:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cea:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cee:	2501                	sext.w	a0,a0
    1cf0:	8082                	ret

0000000000001cf2 <execve>:
    register long a7 __asm__("a7") = n;
    1cf2:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cf6:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cfa:	2501                	sext.w	a0,a0
    1cfc:	8082                	ret

0000000000001cfe <times>:
    register long a7 __asm__("a7") = n;
    1cfe:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d02:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d06:	2501                	sext.w	a0,a0
    1d08:	8082                	ret

0000000000001d0a <get_time>:

int64 get_time()
{
    1d0a:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d0c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d10:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d12:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d14:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d18:	2501                	sext.w	a0,a0
    1d1a:	ed09                	bnez	a0,1d34 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d1c:	67a2                	ld	a5,8(sp)
    1d1e:	3e800713          	li	a4,1000
    1d22:	00015503          	lhu	a0,0(sp)
    1d26:	02e7d7b3          	divu	a5,a5,a4
    1d2a:	02e50533          	mul	a0,a0,a4
    1d2e:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d30:	0141                	add	sp,sp,16
    1d32:	8082                	ret
        return -1;
    1d34:	557d                	li	a0,-1
    1d36:	bfed                	j	1d30 <get_time+0x26>

0000000000001d38 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d38:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d3c:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d40:	2501                	sext.w	a0,a0
    1d42:	8082                	ret

0000000000001d44 <time>:
    register long a7 __asm__("a7") = n;
    1d44:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d48:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d4c:	2501                	sext.w	a0,a0
    1d4e:	8082                	ret

0000000000001d50 <sleep>:

int sleep(unsigned long long time)
{
    1d50:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d52:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d54:	850a                	mv	a0,sp
    1d56:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d58:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d5c:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d5e:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d62:	e501                	bnez	a0,1d6a <sleep+0x1a>
    return 0;
    1d64:	4501                	li	a0,0
}
    1d66:	0141                	add	sp,sp,16
    1d68:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d6a:	4502                	lw	a0,0(sp)
}
    1d6c:	0141                	add	sp,sp,16
    1d6e:	8082                	ret

0000000000001d70 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d70:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d74:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d78:	2501                	sext.w	a0,a0
    1d7a:	8082                	ret

0000000000001d7c <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d7c:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d80:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d84:	8082                	ret

0000000000001d86 <munmap>:
    register long a7 __asm__("a7") = n;
    1d86:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d8a:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d8e:	2501                	sext.w	a0,a0
    1d90:	8082                	ret

0000000000001d92 <wait>:

int wait(int *code)
{
    1d92:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d94:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d98:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d9a:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d9c:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d9e:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1da2:	2501                	sext.w	a0,a0
    1da4:	8082                	ret

0000000000001da6 <spawn>:
    register long a7 __asm__("a7") = n;
    1da6:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1daa:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dae:	2501                	sext.w	a0,a0
    1db0:	8082                	ret

0000000000001db2 <mailread>:
    register long a7 __asm__("a7") = n;
    1db2:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db6:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dba:	2501                	sext.w	a0,a0
    1dbc:	8082                	ret

0000000000001dbe <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dbe:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dc2:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dc6:	2501                	sext.w	a0,a0
    1dc8:	8082                	ret

0000000000001dca <fstat>:
    register long a7 __asm__("a7") = n;
    1dca:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dce:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dd2:	2501                	sext.w	a0,a0
    1dd4:	8082                	ret

0000000000001dd6 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dd6:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dd8:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1ddc:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dde:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1de2:	2501                	sext.w	a0,a0
    1de4:	8082                	ret

0000000000001de6 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1de6:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1de8:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1dec:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dee:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1df2:	2501                	sext.w	a0,a0
    1df4:	8082                	ret

0000000000001df6 <link>:

int link(char *old_path, char *new_path)
{
    1df6:	87aa                	mv	a5,a0
    1df8:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1dfa:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1dfe:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e02:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e04:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e08:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e0a:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e0e:	2501                	sext.w	a0,a0
    1e10:	8082                	ret

0000000000001e12 <unlink>:

int unlink(char *path)
{
    1e12:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e14:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e18:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e1c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e1e:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e22:	2501                	sext.w	a0,a0
    1e24:	8082                	ret

0000000000001e26 <uname>:
    register long a7 __asm__("a7") = n;
    1e26:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e2a:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e2e:	2501                	sext.w	a0,a0
    1e30:	8082                	ret

0000000000001e32 <brk>:
    register long a7 __asm__("a7") = n;
    1e32:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e36:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e3a:	2501                	sext.w	a0,a0
    1e3c:	8082                	ret

0000000000001e3e <getcwd>:
    register long a7 __asm__("a7") = n;
    1e3e:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e40:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e44:	8082                	ret

0000000000001e46 <chdir>:
    register long a7 __asm__("a7") = n;
    1e46:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e4a:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e4e:	2501                	sext.w	a0,a0
    1e50:	8082                	ret

0000000000001e52 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e52:	862e                	mv	a2,a1
    1e54:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e56:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e58:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e5c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e60:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e62:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e64:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e68:	2501                	sext.w	a0,a0
    1e6a:	8082                	ret

0000000000001e6c <getdents>:
    register long a7 __asm__("a7") = n;
    1e6c:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e70:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e74:	2501                	sext.w	a0,a0
    1e76:	8082                	ret

0000000000001e78 <pipe>:
    register long a7 __asm__("a7") = n;
    1e78:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e7c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e7e:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e82:	2501                	sext.w	a0,a0
    1e84:	8082                	ret

0000000000001e86 <dup>:
    register long a7 __asm__("a7") = n;
    1e86:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e88:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e8c:	2501                	sext.w	a0,a0
    1e8e:	8082                	ret

0000000000001e90 <dup2>:
    register long a7 __asm__("a7") = n;
    1e90:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e92:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e94:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e98:	2501                	sext.w	a0,a0
    1e9a:	8082                	ret

0000000000001e9c <mount>:
    register long a7 __asm__("a7") = n;
    1e9c:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ea0:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ea4:	2501                	sext.w	a0,a0
    1ea6:	8082                	ret

0000000000001ea8 <umount>:
    register long a7 __asm__("a7") = n;
    1ea8:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1eac:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eae:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1eb2:	2501                	sext.w	a0,a0
    1eb4:	8082                	ret

0000000000001eb6 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1eb6:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1eb8:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1eba:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ebc:	8532                	mv	a0,a2
	mv a2, a4
    1ebe:	863a                	mv	a2,a4
	mv a3, a5
    1ec0:	86be                	mv	a3,a5
	mv a4, a6
    1ec2:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ec4:	0dc00893          	li	a7,220
	ecall
    1ec8:	00000073          	ecall

	beqz a0, 1f
    1ecc:	c111                	beqz	a0,1ed0 <__clone+0x1a>
	# Parent
	ret
    1ece:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ed0:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ed2:	6522                	ld	a0,8(sp)
	jalr a1
    1ed4:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ed6:	05d00893          	li	a7,93
	ecall
    1eda:	00000073          	ecall
