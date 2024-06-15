
/root/oskernel2024-trustos/pre_ctests/build/riscv64/close:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a865                	j	10ba <__start_main>

0000000000001004 <test_close>:
 * "  close success."
 * 测试失败则输出：
 * "  close error."
 */

void test_close(void) {
    1004:	1141                	add	sp,sp,-16
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f0250513          	add	a0,a0,-254 # 1f08 <__clone+0x2c>
void test_close(void) {
    100e:	e406                	sd	ra,8(sp)
    1010:	e022                	sd	s0,0(sp)
    TEST_START(__func__);
    1012:	2e0000ef          	jal	12f2 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	f8a50513          	add	a0,a0,-118 # 1fa0 <__func__.0>
    101e:	2d4000ef          	jal	12f2 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	efe50513          	add	a0,a0,-258 # 1f20 <__clone+0x44>
    102a:	2c8000ef          	jal	12f2 <puts>
    int fd = open("test_close.txt", O_CREATE | O_RDWR);
    102e:	04200593          	li	a1,66
    1032:	00001517          	auipc	a0,0x1
    1036:	efe50513          	add	a0,a0,-258 # 1f30 <__clone+0x54>
    103a:	423000ef          	jal	1c5c <open>
    103e:	842a                	mv	s0,a0
    //assert(fd > 0);
    const char *str = "  close error.\n";
    int str_len = strlen(str);
    1040:	00001517          	auipc	a0,0x1
    1044:	f0050513          	add	a0,a0,-256 # 1f40 <__clone+0x64>
    1048:	01f000ef          	jal	1866 <strlen>
    //assert(write(fd, str, str_len) == str_len);
    write(fd, str, str_len);
    104c:	0005061b          	sext.w	a2,a0
    1050:	00001597          	auipc	a1,0x1
    1054:	ef058593          	add	a1,a1,-272 # 1f40 <__clone+0x64>
    1058:	8522                	mv	a0,s0
    105a:	44b000ef          	jal	1ca4 <write>
    int rt = close(fd);	
    105e:	8522                	mv	a0,s0
    1060:	42f000ef          	jal	1c8e <close>
    assert(rt == 0);
    1064:	ed05                	bnez	a0,109c <test_close+0x98>
    printf("  close %d success.\n", fd);
    1066:	85a2                	mv	a1,s0
    1068:	00001517          	auipc	a0,0x1
    106c:	f0850513          	add	a0,a0,-248 # 1f70 <__clone+0x94>
    1070:	2a4000ef          	jal	1314 <printf>
	
    TEST_END(__func__);
    1074:	00001517          	auipc	a0,0x1
    1078:	f1450513          	add	a0,a0,-236 # 1f88 <__clone+0xac>
    107c:	276000ef          	jal	12f2 <puts>
    1080:	00001517          	auipc	a0,0x1
    1084:	f2050513          	add	a0,a0,-224 # 1fa0 <__func__.0>
    1088:	26a000ef          	jal	12f2 <puts>
}
    108c:	6402                	ld	s0,0(sp)
    108e:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    1090:	00001517          	auipc	a0,0x1
    1094:	e9050513          	add	a0,a0,-368 # 1f20 <__clone+0x44>
}
    1098:	0141                	add	sp,sp,16
    TEST_END(__func__);
    109a:	aca1                	j	12f2 <puts>
    assert(rt == 0);
    109c:	00001517          	auipc	a0,0x1
    10a0:	eb450513          	add	a0,a0,-332 # 1f50 <__clone+0x74>
    10a4:	4ee000ef          	jal	1592 <panic>
    10a8:	bf7d                	j	1066 <test_close+0x62>

00000000000010aa <main>:

int main(void) {
    10aa:	1141                	add	sp,sp,-16
    10ac:	e406                	sd	ra,8(sp)
    test_close();
    10ae:	f57ff0ef          	jal	1004 <test_close>
    return 0;
}
    10b2:	60a2                	ld	ra,8(sp)
    10b4:	4501                	li	a0,0
    10b6:	0141                	add	sp,sp,16
    10b8:	8082                	ret

00000000000010ba <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10ba:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10bc:	4108                	lw	a0,0(a0)
{
    10be:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10c0:	05a1                	add	a1,a1,8
{
    10c2:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10c4:	fe7ff0ef          	jal	10aa <main>
    10c8:	42d000ef          	jal	1cf4 <exit>
	return 0;
}
    10cc:	60a2                	ld	ra,8(sp)
    10ce:	4501                	li	a0,0
    10d0:	0141                	add	sp,sp,16
    10d2:	8082                	ret

00000000000010d4 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10d4:	7179                	add	sp,sp,-48
    10d6:	f406                	sd	ra,40(sp)
    10d8:	0005081b          	sext.w	a6,a0
    10dc:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10de:	00055563          	bgez	a0,10e8 <printint.constprop.0+0x14>
        x = -xx;
    10e2:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    10e6:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10e8:	02b8763b          	remuw	a2,a6,a1
    10ec:	00001697          	auipc	a3,0x1
    10f0:	ec468693          	add	a3,a3,-316 # 1fb0 <digits>
    buf[16] = 0;
    10f4:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10f8:	0005871b          	sext.w	a4,a1
    10fc:	1602                	sll	a2,a2,0x20
    10fe:	9201                	srl	a2,a2,0x20
    1100:	9636                	add	a2,a2,a3
    1102:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1106:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    110a:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    110e:	10b86c63          	bltu	a6,a1,1226 <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    1112:	02e5763b          	remuw	a2,a0,a4
    1116:	1602                	sll	a2,a2,0x20
    1118:	9201                	srl	a2,a2,0x20
    111a:	9636                	add	a2,a2,a3
    111c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1120:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1124:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1128:	10e56863          	bltu	a0,a4,1238 <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    112c:	02e5f63b          	remuw	a2,a1,a4
    1130:	1602                	sll	a2,a2,0x20
    1132:	9201                	srl	a2,a2,0x20
    1134:	9636                	add	a2,a2,a3
    1136:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    113a:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    113e:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1142:	10e5e463          	bltu	a1,a4,124a <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    1146:	02e5763b          	remuw	a2,a0,a4
    114a:	1602                	sll	a2,a2,0x20
    114c:	9201                	srl	a2,a2,0x20
    114e:	9636                	add	a2,a2,a3
    1150:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1154:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1158:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    115c:	10e56063          	bltu	a0,a4,125c <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    1160:	02e5f63b          	remuw	a2,a1,a4
    1164:	1602                	sll	a2,a2,0x20
    1166:	9201                	srl	a2,a2,0x20
    1168:	9636                	add	a2,a2,a3
    116a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    116e:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1172:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1176:	0ee5ec63          	bltu	a1,a4,126e <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    117a:	02e5763b          	remuw	a2,a0,a4
    117e:	1602                	sll	a2,a2,0x20
    1180:	9201                	srl	a2,a2,0x20
    1182:	9636                	add	a2,a2,a3
    1184:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1188:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    118c:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1190:	08e56263          	bltu	a0,a4,1214 <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    1194:	02e5f63b          	remuw	a2,a1,a4
    1198:	1602                	sll	a2,a2,0x20
    119a:	9201                	srl	a2,a2,0x20
    119c:	9636                	add	a2,a2,a3
    119e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a2:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11a6:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11aa:	0ce5eb63          	bltu	a1,a4,1280 <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    11ae:	02e5763b          	remuw	a2,a0,a4
    11b2:	1602                	sll	a2,a2,0x20
    11b4:	9201                	srl	a2,a2,0x20
    11b6:	9636                	add	a2,a2,a3
    11b8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11bc:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11c0:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11c4:	0ce56763          	bltu	a0,a4,1292 <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    11c8:	02e5f63b          	remuw	a2,a1,a4
    11cc:	1602                	sll	a2,a2,0x20
    11ce:	9201                	srl	a2,a2,0x20
    11d0:	9636                	add	a2,a2,a3
    11d2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11d6:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11da:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11de:	0ce5e363          	bltu	a1,a4,12a4 <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    11e2:	1782                	sll	a5,a5,0x20
    11e4:	9381                	srl	a5,a5,0x20
    11e6:	96be                	add	a3,a3,a5
    11e8:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    11ec:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    11ee:	00f10723          	sb	a5,14(sp)
    if (sign)
    11f2:	00088763          	beqz	a7,1200 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11f6:	02d00793          	li	a5,45
    11fa:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11fe:	4595                	li	a1,5
    write(f, s, l);
    1200:	003c                	add	a5,sp,8
    1202:	4641                	li	a2,16
    1204:	9e0d                	subw	a2,a2,a1
    1206:	4505                	li	a0,1
    1208:	95be                	add	a1,a1,a5
    120a:	29b000ef          	jal	1ca4 <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    120e:	70a2                	ld	ra,40(sp)
    1210:	6145                	add	sp,sp,48
    1212:	8082                	ret
    i++;
    1214:	45a9                	li	a1,10
    if (sign)
    1216:	fe0885e3          	beqz	a7,1200 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    121a:	02d00793          	li	a5,45
    121e:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1222:	45a5                	li	a1,9
    1224:	bff1                	j	1200 <printint.constprop.0+0x12c>
    i++;
    1226:	45bd                	li	a1,15
    if (sign)
    1228:	fc088ce3          	beqz	a7,1200 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    122c:	02d00793          	li	a5,45
    1230:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1234:	45b9                	li	a1,14
    1236:	b7e9                	j	1200 <printint.constprop.0+0x12c>
    i++;
    1238:	45b9                	li	a1,14
    if (sign)
    123a:	fc0883e3          	beqz	a7,1200 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    123e:	02d00793          	li	a5,45
    1242:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1246:	45b5                	li	a1,13
    1248:	bf65                	j	1200 <printint.constprop.0+0x12c>
    i++;
    124a:	45b5                	li	a1,13
    if (sign)
    124c:	fa088ae3          	beqz	a7,1200 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1250:	02d00793          	li	a5,45
    1254:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1258:	45b1                	li	a1,12
    125a:	b75d                	j	1200 <printint.constprop.0+0x12c>
    i++;
    125c:	45b1                	li	a1,12
    if (sign)
    125e:	fa0881e3          	beqz	a7,1200 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1262:	02d00793          	li	a5,45
    1266:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    126a:	45ad                	li	a1,11
    126c:	bf51                	j	1200 <printint.constprop.0+0x12c>
    i++;
    126e:	45ad                	li	a1,11
    if (sign)
    1270:	f80888e3          	beqz	a7,1200 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1274:	02d00793          	li	a5,45
    1278:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    127c:	45a9                	li	a1,10
    127e:	b749                	j	1200 <printint.constprop.0+0x12c>
    i++;
    1280:	45a5                	li	a1,9
    if (sign)
    1282:	f6088fe3          	beqz	a7,1200 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1286:	02d00793          	li	a5,45
    128a:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    128e:	45a1                	li	a1,8
    1290:	bf85                	j	1200 <printint.constprop.0+0x12c>
    i++;
    1292:	45a1                	li	a1,8
    if (sign)
    1294:	f60886e3          	beqz	a7,1200 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1298:	02d00793          	li	a5,45
    129c:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12a0:	459d                	li	a1,7
    12a2:	bfb9                	j	1200 <printint.constprop.0+0x12c>
    i++;
    12a4:	459d                	li	a1,7
    if (sign)
    12a6:	f4088de3          	beqz	a7,1200 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12aa:	02d00793          	li	a5,45
    12ae:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12b2:	4599                	li	a1,6
    12b4:	b7b1                	j	1200 <printint.constprop.0+0x12c>

00000000000012b6 <getchar>:
{
    12b6:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12b8:	00f10593          	add	a1,sp,15
    12bc:	4605                	li	a2,1
    12be:	4501                	li	a0,0
{
    12c0:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12c2:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12c6:	1d5000ef          	jal	1c9a <read>
}
    12ca:	60e2                	ld	ra,24(sp)
    12cc:	00f14503          	lbu	a0,15(sp)
    12d0:	6105                	add	sp,sp,32
    12d2:	8082                	ret

00000000000012d4 <putchar>:
{
    12d4:	1101                	add	sp,sp,-32
    12d6:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12d8:	00f10593          	add	a1,sp,15
    12dc:	4605                	li	a2,1
    12de:	4505                	li	a0,1
{
    12e0:	ec06                	sd	ra,24(sp)
    char byte = c;
    12e2:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12e6:	1bf000ef          	jal	1ca4 <write>
}
    12ea:	60e2                	ld	ra,24(sp)
    12ec:	2501                	sext.w	a0,a0
    12ee:	6105                	add	sp,sp,32
    12f0:	8082                	ret

00000000000012f2 <puts>:
{
    12f2:	1141                	add	sp,sp,-16
    12f4:	e406                	sd	ra,8(sp)
    12f6:	e022                	sd	s0,0(sp)
    12f8:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12fa:	56c000ef          	jal	1866 <strlen>
    12fe:	862a                	mv	a2,a0
    1300:	85a2                	mv	a1,s0
    1302:	4505                	li	a0,1
    1304:	1a1000ef          	jal	1ca4 <write>
}
    1308:	60a2                	ld	ra,8(sp)
    130a:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    130c:	957d                	sra	a0,a0,0x3f
    return r;
    130e:	2501                	sext.w	a0,a0
}
    1310:	0141                	add	sp,sp,16
    1312:	8082                	ret

0000000000001314 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1314:	7131                	add	sp,sp,-192
    1316:	e4d6                	sd	s5,72(sp)
    1318:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    131a:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    131c:	013c                	add	a5,sp,136
{
    131e:	f0ca                	sd	s2,96(sp)
    1320:	ecce                	sd	s3,88(sp)
    1322:	e8d2                	sd	s4,80(sp)
    1324:	e0da                	sd	s6,64(sp)
    1326:	fc5e                	sd	s7,56(sp)
    1328:	fc86                	sd	ra,120(sp)
    132a:	f8a2                	sd	s0,112(sp)
    132c:	f4a6                	sd	s1,104(sp)
    132e:	e52e                	sd	a1,136(sp)
    1330:	e932                	sd	a2,144(sp)
    1332:	ed36                	sd	a3,152(sp)
    1334:	f13a                	sd	a4,160(sp)
    1336:	f942                	sd	a6,176(sp)
    1338:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    133a:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    133c:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1340:	07300a13          	li	s4,115
    1344:	07800b93          	li	s7,120
    1348:	06400b13          	li	s6,100
    buf[i++] = '0';
    134c:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x5880>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1350:	00001997          	auipc	s3,0x1
    1354:	c6098993          	add	s3,s3,-928 # 1fb0 <digits>
        if (!*s)
    1358:	00054783          	lbu	a5,0(a0)
    135c:	16078863          	beqz	a5,14cc <printf+0x1b8>
    1360:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1362:	19278063          	beq	a5,s2,14e2 <printf+0x1ce>
    1366:	00164783          	lbu	a5,1(a2)
    136a:	0605                	add	a2,a2,1
    136c:	fbfd                	bnez	a5,1362 <printf+0x4e>
    136e:	84b2                	mv	s1,a2
        l = z - a;
    1370:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1374:	85aa                	mv	a1,a0
    1376:	8622                	mv	a2,s0
    1378:	4505                	li	a0,1
    137a:	12b000ef          	jal	1ca4 <write>
        if (l)
    137e:	18041763          	bnez	s0,150c <printf+0x1f8>
        if (s[1] == 0)
    1382:	0014c783          	lbu	a5,1(s1)
    1386:	14078363          	beqz	a5,14cc <printf+0x1b8>
        switch (s[1])
    138a:	19478f63          	beq	a5,s4,1528 <printf+0x214>
    138e:	18fa6163          	bltu	s4,a5,1510 <printf+0x1fc>
    1392:	1b678e63          	beq	a5,s6,154e <printf+0x23a>
    1396:	07000713          	li	a4,112
    139a:	1ce79463          	bne	a5,a4,1562 <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    139e:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13a0:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13a4:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13a6:	631c                	ld	a5,0(a4)
    13a8:	0721                	add	a4,a4,8
    13aa:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13ac:	00479293          	sll	t0,a5,0x4
    13b0:	00879f93          	sll	t6,a5,0x8
    13b4:	00c79f13          	sll	t5,a5,0xc
    13b8:	01079e93          	sll	t4,a5,0x10
    13bc:	01479e13          	sll	t3,a5,0x14
    13c0:	01879313          	sll	t1,a5,0x18
    13c4:	01c79893          	sll	a7,a5,0x1c
    13c8:	02479813          	sll	a6,a5,0x24
    13cc:	02879513          	sll	a0,a5,0x28
    13d0:	02c79593          	sll	a1,a5,0x2c
    13d4:	03079693          	sll	a3,a5,0x30
    13d8:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13dc:	03c7d413          	srl	s0,a5,0x3c
    13e0:	01c7d39b          	srlw	t2,a5,0x1c
    13e4:	03c2d293          	srl	t0,t0,0x3c
    13e8:	03cfdf93          	srl	t6,t6,0x3c
    13ec:	03cf5f13          	srl	t5,t5,0x3c
    13f0:	03cede93          	srl	t4,t4,0x3c
    13f4:	03ce5e13          	srl	t3,t3,0x3c
    13f8:	03c35313          	srl	t1,t1,0x3c
    13fc:	03c8d893          	srl	a7,a7,0x3c
    1400:	03c85813          	srl	a6,a6,0x3c
    1404:	9171                	srl	a0,a0,0x3c
    1406:	91f1                	srl	a1,a1,0x3c
    1408:	92f1                	srl	a3,a3,0x3c
    140a:	9371                	srl	a4,a4,0x3c
    140c:	974e                	add	a4,a4,s3
    140e:	944e                	add	s0,s0,s3
    1410:	92ce                	add	t0,t0,s3
    1412:	9fce                	add	t6,t6,s3
    1414:	9f4e                	add	t5,t5,s3
    1416:	9ece                	add	t4,t4,s3
    1418:	9e4e                	add	t3,t3,s3
    141a:	934e                	add	t1,t1,s3
    141c:	98ce                	add	a7,a7,s3
    141e:	93ce                	add	t2,t2,s3
    1420:	984e                	add	a6,a6,s3
    1422:	954e                	add	a0,a0,s3
    1424:	95ce                	add	a1,a1,s3
    1426:	96ce                	add	a3,a3,s3
    1428:	00074083          	lbu	ra,0(a4)
    142c:	0002c283          	lbu	t0,0(t0)
    1430:	000fcf83          	lbu	t6,0(t6)
    1434:	000f4f03          	lbu	t5,0(t5)
    1438:	000ece83          	lbu	t4,0(t4)
    143c:	000e4e03          	lbu	t3,0(t3)
    1440:	00034303          	lbu	t1,0(t1)
    1444:	0008c883          	lbu	a7,0(a7)
    1448:	0003c383          	lbu	t2,0(t2)
    144c:	00084803          	lbu	a6,0(a6)
    1450:	00054503          	lbu	a0,0(a0)
    1454:	0005c583          	lbu	a1,0(a1)
    1458:	0006c683          	lbu	a3,0(a3)
    145c:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1460:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1464:	9371                	srl	a4,a4,0x3c
    1466:	8bbd                	and	a5,a5,15
    1468:	974e                	add	a4,a4,s3
    146a:	97ce                	add	a5,a5,s3
    146c:	005105a3          	sb	t0,11(sp)
    1470:	01f10623          	sb	t6,12(sp)
    1474:	01e106a3          	sb	t5,13(sp)
    1478:	01d10723          	sb	t4,14(sp)
    147c:	01c107a3          	sb	t3,15(sp)
    1480:	00610823          	sb	t1,16(sp)
    1484:	011108a3          	sb	a7,17(sp)
    1488:	00710923          	sb	t2,18(sp)
    148c:	010109a3          	sb	a6,19(sp)
    1490:	00a10a23          	sb	a0,20(sp)
    1494:	00b10aa3          	sb	a1,21(sp)
    1498:	00d10b23          	sb	a3,22(sp)
    149c:	00110ba3          	sb	ra,23(sp)
    14a0:	00810523          	sb	s0,10(sp)
    14a4:	00074703          	lbu	a4,0(a4)
    14a8:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14ac:	002c                	add	a1,sp,8
    14ae:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14b0:	00e10c23          	sb	a4,24(sp)
    14b4:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14b8:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14bc:	7e8000ef          	jal	1ca4 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14c0:	00248513          	add	a0,s1,2
        if (!*s)
    14c4:	00054783          	lbu	a5,0(a0)
    14c8:	e8079ce3          	bnez	a5,1360 <printf+0x4c>
    }
    va_end(ap);
}
    14cc:	70e6                	ld	ra,120(sp)
    14ce:	7446                	ld	s0,112(sp)
    14d0:	74a6                	ld	s1,104(sp)
    14d2:	7906                	ld	s2,96(sp)
    14d4:	69e6                	ld	s3,88(sp)
    14d6:	6a46                	ld	s4,80(sp)
    14d8:	6aa6                	ld	s5,72(sp)
    14da:	6b06                	ld	s6,64(sp)
    14dc:	7be2                	ld	s7,56(sp)
    14de:	6129                	add	sp,sp,192
    14e0:	8082                	ret
    14e2:	84b2                	mv	s1,a2
    14e4:	a039                	j	14f2 <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14e6:	0024c783          	lbu	a5,2(s1)
    14ea:	0605                	add	a2,a2,1
    14ec:	0489                	add	s1,s1,2
    14ee:	e92791e3          	bne	a5,s2,1370 <printf+0x5c>
    14f2:	0014c783          	lbu	a5,1(s1)
    14f6:	ff2788e3          	beq	a5,s2,14e6 <printf+0x1d2>
        l = z - a;
    14fa:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14fe:	85aa                	mv	a1,a0
    1500:	8622                	mv	a2,s0
    1502:	4505                	li	a0,1
    1504:	7a0000ef          	jal	1ca4 <write>
        if (l)
    1508:	e6040de3          	beqz	s0,1382 <printf+0x6e>
    150c:	8526                	mv	a0,s1
    150e:	b5a9                	j	1358 <printf+0x44>
        switch (s[1])
    1510:	05779963          	bne	a5,s7,1562 <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    1514:	6782                	ld	a5,0(sp)
    1516:	45c1                	li	a1,16
    1518:	4388                	lw	a0,0(a5)
    151a:	07a1                	add	a5,a5,8
    151c:	e03e                	sd	a5,0(sp)
    151e:	bb7ff0ef          	jal	10d4 <printint.constprop.0>
        s += 2;
    1522:	00248513          	add	a0,s1,2
    1526:	bf79                	j	14c4 <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    1528:	6782                	ld	a5,0(sp)
    152a:	6380                	ld	s0,0(a5)
    152c:	07a1                	add	a5,a5,8
    152e:	e03e                	sd	a5,0(sp)
    1530:	cc21                	beqz	s0,1588 <printf+0x274>
            l = strnlen(a, 200);
    1532:	0c800593          	li	a1,200
    1536:	8522                	mv	a0,s0
    1538:	460000ef          	jal	1998 <strnlen>
    write(f, s, l);
    153c:	0005061b          	sext.w	a2,a0
    1540:	85a2                	mv	a1,s0
    1542:	4505                	li	a0,1
    1544:	760000ef          	jal	1ca4 <write>
        s += 2;
    1548:	00248513          	add	a0,s1,2
    154c:	bfa5                	j	14c4 <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    154e:	6782                	ld	a5,0(sp)
    1550:	45a9                	li	a1,10
    1552:	4388                	lw	a0,0(a5)
    1554:	07a1                	add	a5,a5,8
    1556:	e03e                	sd	a5,0(sp)
    1558:	b7dff0ef          	jal	10d4 <printint.constprop.0>
        s += 2;
    155c:	00248513          	add	a0,s1,2
    1560:	b795                	j	14c4 <printf+0x1b0>
    return write(stdout, &byte, 1);
    1562:	4605                	li	a2,1
    1564:	002c                	add	a1,sp,8
    1566:	4505                	li	a0,1
    char byte = c;
    1568:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    156c:	738000ef          	jal	1ca4 <write>
    char byte = c;
    1570:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1574:	4605                	li	a2,1
    1576:	002c                	add	a1,sp,8
    1578:	4505                	li	a0,1
    char byte = c;
    157a:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    157e:	726000ef          	jal	1ca4 <write>
        s += 2;
    1582:	00248513          	add	a0,s1,2
    1586:	bf3d                	j	14c4 <printf+0x1b0>
                a = "(null)";
    1588:	00001417          	auipc	s0,0x1
    158c:	a1040413          	add	s0,s0,-1520 # 1f98 <__clone+0xbc>
    1590:	b74d                	j	1532 <printf+0x21e>

0000000000001592 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1592:	1141                	add	sp,sp,-16
    1594:	e406                	sd	ra,8(sp)
    puts(m);
    1596:	d5dff0ef          	jal	12f2 <puts>
    exit(-100);
}
    159a:	60a2                	ld	ra,8(sp)
    exit(-100);
    159c:	f9c00513          	li	a0,-100
}
    15a0:	0141                	add	sp,sp,16
    exit(-100);
    15a2:	af89                	j	1cf4 <exit>

00000000000015a4 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a4:	02000793          	li	a5,32
    15a8:	00f50663          	beq	a0,a5,15b4 <isspace+0x10>
    15ac:	355d                	addw	a0,a0,-9
    15ae:	00553513          	sltiu	a0,a0,5
    15b2:	8082                	ret
    15b4:	4505                	li	a0,1
}
    15b6:	8082                	ret

00000000000015b8 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15b8:	fd05051b          	addw	a0,a0,-48
}
    15bc:	00a53513          	sltiu	a0,a0,10
    15c0:	8082                	ret

00000000000015c2 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15c2:	02000713          	li	a4,32
    15c6:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15c8:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15cc:	ff76879b          	addw	a5,a3,-9
    15d0:	06e68063          	beq	a3,a4,1630 <atoi+0x6e>
    15d4:	0006859b          	sext.w	a1,a3
    15d8:	04f67c63          	bgeu	a2,a5,1630 <atoi+0x6e>
        s++;
    switch (*s)
    15dc:	02b00793          	li	a5,43
    15e0:	06f68563          	beq	a3,a5,164a <atoi+0x88>
    15e4:	02d00793          	li	a5,45
    15e8:	04f69663          	bne	a3,a5,1634 <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15ec:	00154683          	lbu	a3,1(a0)
    15f0:	47a5                	li	a5,9
        s++;
    15f2:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    15f6:	fd06869b          	addw	a3,a3,-48
    15fa:	8636                	mv	a2,a3
    while (isdigit(*s))
    15fc:	04d7e563          	bltu	a5,a3,1646 <atoi+0x84>
        neg = 1;
    1600:	4885                	li	a7,1
    int n = 0, neg = 0;
    1602:	4501                	li	a0,0
    while (isdigit(*s))
    1604:	4825                	li	a6,9
    1606:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    160a:	0025179b          	sllw	a5,a0,0x2
    160e:	9fa9                	addw	a5,a5,a0
    1610:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    1614:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    1618:	85b2                	mv	a1,a2
    161a:	40c7853b          	subw	a0,a5,a2
    161e:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    1620:	8636                	mv	a2,a3
    while (isdigit(*s))
    1622:	fed872e3          	bgeu	a6,a3,1606 <atoi+0x44>
    return neg ? n : -n;
    1626:	02089163          	bnez	a7,1648 <atoi+0x86>
    162a:	40f5853b          	subw	a0,a1,a5
    162e:	8082                	ret
        s++;
    1630:	0505                	add	a0,a0,1
    1632:	bf59                	j	15c8 <atoi+0x6>
    while (isdigit(*s))
    1634:	fd05859b          	addw	a1,a1,-48
    1638:	47a5                	li	a5,9
    163a:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    163c:	4881                	li	a7,0
    163e:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    1642:	fcb7f0e3          	bgeu	a5,a1,1602 <atoi+0x40>
    return neg ? n : -n;
    1646:	4501                	li	a0,0
}
    1648:	8082                	ret
    while (isdigit(*s))
    164a:	00154683          	lbu	a3,1(a0)
    164e:	47a5                	li	a5,9
        s++;
    1650:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1654:	fd06869b          	addw	a3,a3,-48
    1658:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    165a:	4881                	li	a7,0
    while (isdigit(*s))
    165c:	fad7f3e3          	bgeu	a5,a3,1602 <atoi+0x40>
    return neg ? n : -n;
    1660:	4501                	li	a0,0
    1662:	8082                	ret

0000000000001664 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1664:	16060f63          	beqz	a2,17e2 <memset+0x17e>
    1668:	40a006b3          	neg	a3,a0
    166c:	0076f793          	and	a5,a3,7
    1670:	00778813          	add	a6,a5,7
    1674:	48ad                	li	a7,11
    1676:	0ff5f713          	zext.b	a4,a1
    167a:	fff60593          	add	a1,a2,-1
    167e:	17186363          	bltu	a6,a7,17e4 <memset+0x180>
    1682:	1705eb63          	bltu	a1,a6,17f8 <memset+0x194>
    1686:	16078163          	beqz	a5,17e8 <memset+0x184>
    168a:	00e50023          	sb	a4,0(a0)
    168e:	0066f593          	and	a1,a3,6
    1692:	14058e63          	beqz	a1,17ee <memset+0x18a>
    1696:	00e500a3          	sb	a4,1(a0)
    169a:	4589                	li	a1,2
    169c:	00250813          	add	a6,a0,2
    16a0:	04f5f663          	bgeu	a1,a5,16ec <memset+0x88>
    16a4:	00e50123          	sb	a4,2(a0)
    16a8:	8a91                	and	a3,a3,4
    16aa:	00350813          	add	a6,a0,3
    16ae:	458d                	li	a1,3
    16b0:	ce95                	beqz	a3,16ec <memset+0x88>
    16b2:	00e501a3          	sb	a4,3(a0)
    16b6:	4691                	li	a3,4
    16b8:	00450813          	add	a6,a0,4
    16bc:	4591                	li	a1,4
    16be:	02f6f763          	bgeu	a3,a5,16ec <memset+0x88>
    16c2:	00e50223          	sb	a4,4(a0)
    16c6:	4695                	li	a3,5
    16c8:	00550813          	add	a6,a0,5
    16cc:	4595                	li	a1,5
    16ce:	00d78f63          	beq	a5,a3,16ec <memset+0x88>
    16d2:	00e502a3          	sb	a4,5(a0)
    16d6:	469d                	li	a3,7
    16d8:	00650813          	add	a6,a0,6
    16dc:	4599                	li	a1,6
    16de:	00d79763          	bne	a5,a3,16ec <memset+0x88>
    16e2:	00750813          	add	a6,a0,7
    16e6:	00e50323          	sb	a4,6(a0)
    16ea:	459d                	li	a1,7
    16ec:	00871693          	sll	a3,a4,0x8
    16f0:	01071313          	sll	t1,a4,0x10
    16f4:	8ed9                	or	a3,a3,a4
    16f6:	01871893          	sll	a7,a4,0x18
    16fa:	0066e6b3          	or	a3,a3,t1
    16fe:	0116e6b3          	or	a3,a3,a7
    1702:	02071313          	sll	t1,a4,0x20
    1706:	02871893          	sll	a7,a4,0x28
    170a:	0066e6b3          	or	a3,a3,t1
    170e:	40f60e33          	sub	t3,a2,a5
    1712:	03071313          	sll	t1,a4,0x30
    1716:	0116e6b3          	or	a3,a3,a7
    171a:	0066e6b3          	or	a3,a3,t1
    171e:	03871893          	sll	a7,a4,0x38
    1722:	97aa                	add	a5,a5,a0
    1724:	ff8e7313          	and	t1,t3,-8
    1728:	0116e6b3          	or	a3,a3,a7
    172c:	00f308b3          	add	a7,t1,a5
    1730:	e394                	sd	a3,0(a5)
    1732:	07a1                	add	a5,a5,8
    1734:	ff179ee3          	bne	a5,a7,1730 <memset+0xcc>
    1738:	006806b3          	add	a3,a6,t1
    173c:	00b307bb          	addw	a5,t1,a1
    1740:	0bc30b63          	beq	t1,t3,17f6 <memset+0x192>
    1744:	00e68023          	sb	a4,0(a3)
    1748:	0017859b          	addw	a1,a5,1
    174c:	08c5fb63          	bgeu	a1,a2,17e2 <memset+0x17e>
    1750:	00e680a3          	sb	a4,1(a3)
    1754:	0027859b          	addw	a1,a5,2
    1758:	08c5f563          	bgeu	a1,a2,17e2 <memset+0x17e>
    175c:	00e68123          	sb	a4,2(a3)
    1760:	0037859b          	addw	a1,a5,3
    1764:	06c5ff63          	bgeu	a1,a2,17e2 <memset+0x17e>
    1768:	00e681a3          	sb	a4,3(a3)
    176c:	0047859b          	addw	a1,a5,4
    1770:	06c5f963          	bgeu	a1,a2,17e2 <memset+0x17e>
    1774:	00e68223          	sb	a4,4(a3)
    1778:	0057859b          	addw	a1,a5,5
    177c:	06c5f363          	bgeu	a1,a2,17e2 <memset+0x17e>
    1780:	00e682a3          	sb	a4,5(a3)
    1784:	0067859b          	addw	a1,a5,6
    1788:	04c5fd63          	bgeu	a1,a2,17e2 <memset+0x17e>
    178c:	00e68323          	sb	a4,6(a3)
    1790:	0077859b          	addw	a1,a5,7
    1794:	04c5f763          	bgeu	a1,a2,17e2 <memset+0x17e>
    1798:	00e683a3          	sb	a4,7(a3)
    179c:	0087859b          	addw	a1,a5,8
    17a0:	04c5f163          	bgeu	a1,a2,17e2 <memset+0x17e>
    17a4:	00e68423          	sb	a4,8(a3)
    17a8:	0097859b          	addw	a1,a5,9
    17ac:	02c5fb63          	bgeu	a1,a2,17e2 <memset+0x17e>
    17b0:	00e684a3          	sb	a4,9(a3)
    17b4:	00a7859b          	addw	a1,a5,10
    17b8:	02c5f563          	bgeu	a1,a2,17e2 <memset+0x17e>
    17bc:	00e68523          	sb	a4,10(a3)
    17c0:	00b7859b          	addw	a1,a5,11
    17c4:	00c5ff63          	bgeu	a1,a2,17e2 <memset+0x17e>
    17c8:	00e685a3          	sb	a4,11(a3)
    17cc:	00c7859b          	addw	a1,a5,12
    17d0:	00c5f963          	bgeu	a1,a2,17e2 <memset+0x17e>
    17d4:	00e68623          	sb	a4,12(a3)
    17d8:	27b5                	addw	a5,a5,13
    17da:	00c7f463          	bgeu	a5,a2,17e2 <memset+0x17e>
    17de:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17e2:	8082                	ret
    17e4:	482d                	li	a6,11
    17e6:	bd71                	j	1682 <memset+0x1e>
    char *p = dest;
    17e8:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17ea:	4581                	li	a1,0
    17ec:	b701                	j	16ec <memset+0x88>
    17ee:	00150813          	add	a6,a0,1
    17f2:	4585                	li	a1,1
    17f4:	bde5                	j	16ec <memset+0x88>
    17f6:	8082                	ret
    char *p = dest;
    17f8:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17fa:	4781                	li	a5,0
    17fc:	b7a1                	j	1744 <memset+0xe0>

00000000000017fe <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17fe:	00054783          	lbu	a5,0(a0)
    1802:	0005c703          	lbu	a4,0(a1)
    1806:	00e79863          	bne	a5,a4,1816 <strcmp+0x18>
    180a:	0505                	add	a0,a0,1
    180c:	0585                	add	a1,a1,1
    180e:	fbe5                	bnez	a5,17fe <strcmp>
    1810:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1812:	9d19                	subw	a0,a0,a4
    1814:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1816:	0007851b          	sext.w	a0,a5
    181a:	bfe5                	j	1812 <strcmp+0x14>

000000000000181c <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    181c:	ca15                	beqz	a2,1850 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    181e:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1822:	167d                	add	a2,a2,-1
    1824:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1828:	eb99                	bnez	a5,183e <strncmp+0x22>
    182a:	a815                	j	185e <strncmp+0x42>
    182c:	00a68e63          	beq	a3,a0,1848 <strncmp+0x2c>
    1830:	0505                	add	a0,a0,1
    1832:	00f71b63          	bne	a4,a5,1848 <strncmp+0x2c>
    1836:	00054783          	lbu	a5,0(a0)
    183a:	cf89                	beqz	a5,1854 <strncmp+0x38>
    183c:	85b2                	mv	a1,a2
    183e:	0005c703          	lbu	a4,0(a1)
    1842:	00158613          	add	a2,a1,1
    1846:	f37d                	bnez	a4,182c <strncmp+0x10>
        ;
    return *l - *r;
    1848:	0007851b          	sext.w	a0,a5
    184c:	9d19                	subw	a0,a0,a4
    184e:	8082                	ret
        return 0;
    1850:	4501                	li	a0,0
}
    1852:	8082                	ret
    return *l - *r;
    1854:	0015c703          	lbu	a4,1(a1)
    1858:	4501                	li	a0,0
    185a:	9d19                	subw	a0,a0,a4
    185c:	8082                	ret
    185e:	0005c703          	lbu	a4,0(a1)
    1862:	4501                	li	a0,0
    1864:	b7e5                	j	184c <strncmp+0x30>

0000000000001866 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1866:	00757793          	and	a5,a0,7
    186a:	cf89                	beqz	a5,1884 <strlen+0x1e>
    186c:	87aa                	mv	a5,a0
    186e:	a029                	j	1878 <strlen+0x12>
    1870:	0785                	add	a5,a5,1
    1872:	0077f713          	and	a4,a5,7
    1876:	cb01                	beqz	a4,1886 <strlen+0x20>
        if (!*s)
    1878:	0007c703          	lbu	a4,0(a5)
    187c:	fb75                	bnez	a4,1870 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    187e:	40a78533          	sub	a0,a5,a0
}
    1882:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1884:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1886:	feff05b7          	lui	a1,0xfeff0
    188a:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedf4f>
    188e:	f0101637          	lui	a2,0xf0101
    1892:	05c2                	sll	a1,a1,0x10
    1894:	0612                	sll	a2,a2,0x4
    1896:	6394                	ld	a3,0(a5)
    1898:	eff58593          	add	a1,a1,-257
    189c:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff151>
    18a0:	05c2                	sll	a1,a1,0x10
    18a2:	0642                	sll	a2,a2,0x10
    18a4:	eff58593          	add	a1,a1,-257
    18a8:	10160613          	add	a2,a2,257
    18ac:	00b68733          	add	a4,a3,a1
    18b0:	063e                	sll	a2,a2,0xf
    18b2:	fff6c693          	not	a3,a3
    18b6:	8f75                	and	a4,a4,a3
    18b8:	08060613          	add	a2,a2,128
    18bc:	8f71                	and	a4,a4,a2
    18be:	eb11                	bnez	a4,18d2 <strlen+0x6c>
    18c0:	6794                	ld	a3,8(a5)
    18c2:	07a1                	add	a5,a5,8
    18c4:	00b68733          	add	a4,a3,a1
    18c8:	fff6c693          	not	a3,a3
    18cc:	8f75                	and	a4,a4,a3
    18ce:	8f71                	and	a4,a4,a2
    18d0:	db65                	beqz	a4,18c0 <strlen+0x5a>
    for (; *s; s++)
    18d2:	0007c703          	lbu	a4,0(a5)
    18d6:	d745                	beqz	a4,187e <strlen+0x18>
    18d8:	0017c703          	lbu	a4,1(a5)
    18dc:	0785                	add	a5,a5,1
    18de:	d345                	beqz	a4,187e <strlen+0x18>
    18e0:	0017c703          	lbu	a4,1(a5)
    18e4:	0785                	add	a5,a5,1
    18e6:	fb6d                	bnez	a4,18d8 <strlen+0x72>
    18e8:	bf59                	j	187e <strlen+0x18>

00000000000018ea <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18ea:	00757713          	and	a4,a0,7
{
    18ee:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18f0:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18f4:	cb19                	beqz	a4,190a <memchr+0x20>
    18f6:	ce59                	beqz	a2,1994 <memchr+0xaa>
    18f8:	0007c703          	lbu	a4,0(a5)
    18fc:	00b70963          	beq	a4,a1,190e <memchr+0x24>
    1900:	0785                	add	a5,a5,1
    1902:	0077f713          	and	a4,a5,7
    1906:	167d                	add	a2,a2,-1
    1908:	f77d                	bnez	a4,18f6 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    190a:	4501                	li	a0,0
    if (n && *s != c)
    190c:	c649                	beqz	a2,1996 <memchr+0xac>
    190e:	0007c703          	lbu	a4,0(a5)
    1912:	06b70663          	beq	a4,a1,197e <memchr+0x94>
        size_t k = ONES * c;
    1916:	01010737          	lui	a4,0x1010
    191a:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e151>
    191e:	0742                	sll	a4,a4,0x10
    1920:	10170713          	add	a4,a4,257
    1924:	0742                	sll	a4,a4,0x10
    1926:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    192a:	469d                	li	a3,7
        size_t k = ONES * c;
    192c:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1930:	04c6f763          	bgeu	a3,a2,197e <memchr+0x94>
    1934:	f0101837          	lui	a6,0xf0101
    1938:	feff08b7          	lui	a7,0xfeff0
    193c:	0812                	sll	a6,a6,0x4
    193e:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedf4f>
    1942:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff151>
    1946:	08c2                	sll	a7,a7,0x10
    1948:	0842                	sll	a6,a6,0x10
    194a:	eff88893          	add	a7,a7,-257
    194e:	10180813          	add	a6,a6,257
    1952:	08c2                	sll	a7,a7,0x10
    1954:	083e                	sll	a6,a6,0xf
    1956:	eff88893          	add	a7,a7,-257
    195a:	08080813          	add	a6,a6,128
    195e:	431d                	li	t1,7
    1960:	a029                	j	196a <memchr+0x80>
    1962:	1661                	add	a2,a2,-8
    1964:	07a1                	add	a5,a5,8
    1966:	02c37663          	bgeu	t1,a2,1992 <memchr+0xa8>
    196a:	6398                	ld	a4,0(a5)
    196c:	8f29                	xor	a4,a4,a0
    196e:	011706b3          	add	a3,a4,a7
    1972:	fff74713          	not	a4,a4
    1976:	8f75                	and	a4,a4,a3
    1978:	01077733          	and	a4,a4,a6
    197c:	d37d                	beqz	a4,1962 <memchr+0x78>
        s = (const void *)w;
    197e:	853e                	mv	a0,a5
    1980:	a019                	j	1986 <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    1982:	0505                	add	a0,a0,1
    1984:	ca01                	beqz	a2,1994 <memchr+0xaa>
    1986:	00054783          	lbu	a5,0(a0)
    198a:	167d                	add	a2,a2,-1
    198c:	feb79be3          	bne	a5,a1,1982 <memchr+0x98>
    1990:	8082                	ret
    1992:	f675                	bnez	a2,197e <memchr+0x94>
    return n ? (void *)s : 0;
    1994:	4501                	li	a0,0
}
    1996:	8082                	ret

0000000000001998 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1998:	1101                	add	sp,sp,-32
    199a:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    199c:	862e                	mv	a2,a1
{
    199e:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19a0:	4581                	li	a1,0
{
    19a2:	e426                	sd	s1,8(sp)
    19a4:	ec06                	sd	ra,24(sp)
    19a6:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19a8:	f43ff0ef          	jal	18ea <memchr>
    return p ? p - s : n;
    19ac:	c519                	beqz	a0,19ba <strnlen+0x22>
}
    19ae:	60e2                	ld	ra,24(sp)
    19b0:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19b2:	8d05                	sub	a0,a0,s1
}
    19b4:	64a2                	ld	s1,8(sp)
    19b6:	6105                	add	sp,sp,32
    19b8:	8082                	ret
    19ba:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19bc:	8522                	mv	a0,s0
}
    19be:	6442                	ld	s0,16(sp)
    19c0:	64a2                	ld	s1,8(sp)
    19c2:	6105                	add	sp,sp,32
    19c4:	8082                	ret

00000000000019c6 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19c6:	00b547b3          	xor	a5,a0,a1
    19ca:	8b9d                	and	a5,a5,7
    19cc:	efb1                	bnez	a5,1a28 <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19ce:	0075f793          	and	a5,a1,7
    19d2:	ebb5                	bnez	a5,1a46 <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19d4:	feff0637          	lui	a2,0xfeff0
    19d8:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedf4f>
    19dc:	f01016b7          	lui	a3,0xf0101
    19e0:	0642                	sll	a2,a2,0x10
    19e2:	0692                	sll	a3,a3,0x4
    19e4:	6198                	ld	a4,0(a1)
    19e6:	eff60613          	add	a2,a2,-257
    19ea:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff151>
    19ee:	0642                	sll	a2,a2,0x10
    19f0:	06c2                	sll	a3,a3,0x10
    19f2:	eff60613          	add	a2,a2,-257
    19f6:	10168693          	add	a3,a3,257
    19fa:	00c707b3          	add	a5,a4,a2
    19fe:	fff74813          	not	a6,a4
    1a02:	06be                	sll	a3,a3,0xf
    1a04:	0107f7b3          	and	a5,a5,a6
    1a08:	08068693          	add	a3,a3,128
    1a0c:	8ff5                	and	a5,a5,a3
    1a0e:	ef89                	bnez	a5,1a28 <strcpy+0x62>
    1a10:	05a1                	add	a1,a1,8
    1a12:	e118                	sd	a4,0(a0)
    1a14:	6198                	ld	a4,0(a1)
    1a16:	0521                	add	a0,a0,8
    1a18:	00c707b3          	add	a5,a4,a2
    1a1c:	fff74813          	not	a6,a4
    1a20:	0107f7b3          	and	a5,a5,a6
    1a24:	8ff5                	and	a5,a5,a3
    1a26:	d7ed                	beqz	a5,1a10 <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a28:	0005c783          	lbu	a5,0(a1)
    1a2c:	00f50023          	sb	a5,0(a0)
    1a30:	c785                	beqz	a5,1a58 <strcpy+0x92>
    1a32:	0015c783          	lbu	a5,1(a1)
    1a36:	0505                	add	a0,a0,1
    1a38:	0585                	add	a1,a1,1
    1a3a:	00f50023          	sb	a5,0(a0)
    1a3e:	fbf5                	bnez	a5,1a32 <strcpy+0x6c>
        ;
    return d;
}
    1a40:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a42:	0505                	add	a0,a0,1
    1a44:	db41                	beqz	a4,19d4 <strcpy+0xe>
            if (!(*d = *s))
    1a46:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a4a:	0585                	add	a1,a1,1
    1a4c:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a50:	00f50023          	sb	a5,0(a0)
    1a54:	f7fd                	bnez	a5,1a42 <strcpy+0x7c>
}
    1a56:	8082                	ret
    1a58:	8082                	ret

0000000000001a5a <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a5a:	00b547b3          	xor	a5,a0,a1
    1a5e:	8b9d                	and	a5,a5,7
    1a60:	efbd                	bnez	a5,1ade <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a62:	0075f793          	and	a5,a1,7
    1a66:	1c078563          	beqz	a5,1c30 <strncpy+0x1d6>
    1a6a:	ea11                	bnez	a2,1a7e <strncpy+0x24>
    1a6c:	8082                	ret
    1a6e:	0585                	add	a1,a1,1
    1a70:	0075f793          	and	a5,a1,7
    1a74:	167d                	add	a2,a2,-1
    1a76:	0505                	add	a0,a0,1
    1a78:	1a078c63          	beqz	a5,1c30 <strncpy+0x1d6>
    1a7c:	ca3d                	beqz	a2,1af2 <strncpy+0x98>
    1a7e:	0005c783          	lbu	a5,0(a1)
    1a82:	00f50023          	sb	a5,0(a0)
    1a86:	f7e5                	bnez	a5,1a6e <strncpy+0x14>
            ;
        if (!n || !*s)
    1a88:	0005c783          	lbu	a5,0(a1)
    1a8c:	c7a5                	beqz	a5,1af4 <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a8e:	479d                	li	a5,7
    1a90:	04c7f863          	bgeu	a5,a2,1ae0 <strncpy+0x86>
    1a94:	f01016b7          	lui	a3,0xf0101
    1a98:	feff0837          	lui	a6,0xfeff0
    1a9c:	0692                	sll	a3,a3,0x4
    1a9e:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedf4f>
    1aa2:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff151>
    1aa6:	0842                	sll	a6,a6,0x10
    1aa8:	06c2                	sll	a3,a3,0x10
    1aaa:	eff80813          	add	a6,a6,-257
    1aae:	10168693          	add	a3,a3,257
    1ab2:	0842                	sll	a6,a6,0x10
    1ab4:	06be                	sll	a3,a3,0xf
    1ab6:	eff80813          	add	a6,a6,-257
    1aba:	08068693          	add	a3,a3,128
    1abe:	431d                	li	t1,7
    1ac0:	6198                	ld	a4,0(a1)
    1ac2:	010707b3          	add	a5,a4,a6
    1ac6:	fff74893          	not	a7,a4
    1aca:	0117f7b3          	and	a5,a5,a7
    1ace:	8ff5                	and	a5,a5,a3
    1ad0:	eb81                	bnez	a5,1ae0 <strncpy+0x86>
            *wd = *ws;
    1ad2:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ad4:	1661                	add	a2,a2,-8
    1ad6:	05a1                	add	a1,a1,8
    1ad8:	0521                	add	a0,a0,8
    1ada:	fec363e3          	bltu	t1,a2,1ac0 <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1ade:	ca11                	beqz	a2,1af2 <strncpy+0x98>
    1ae0:	0005c783          	lbu	a5,0(a1)
    1ae4:	0585                	add	a1,a1,1
    1ae6:	00f50023          	sb	a5,0(a0)
    1aea:	c789                	beqz	a5,1af4 <strncpy+0x9a>
    1aec:	167d                	add	a2,a2,-1
    1aee:	0505                	add	a0,a0,1
    1af0:	fa65                	bnez	a2,1ae0 <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1af2:	8082                	ret
    1af4:	40a00733          	neg	a4,a0
    1af8:	00777793          	and	a5,a4,7
    1afc:	00778693          	add	a3,a5,7
    1b00:	482d                	li	a6,11
    1b02:	fff60593          	add	a1,a2,-1
    1b06:	1106ef63          	bltu	a3,a6,1c24 <strncpy+0x1ca>
    1b0a:	12d5ee63          	bltu	a1,a3,1c46 <strncpy+0x1ec>
    1b0e:	12078563          	beqz	a5,1c38 <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b12:	00050023          	sb	zero,0(a0)
    1b16:	00677693          	and	a3,a4,6
    1b1a:	12068263          	beqz	a3,1c3e <strncpy+0x1e4>
    1b1e:	000500a3          	sb	zero,1(a0)
    1b22:	4689                	li	a3,2
    1b24:	12f6f463          	bgeu	a3,a5,1c4c <strncpy+0x1f2>
    1b28:	00050123          	sb	zero,2(a0)
    1b2c:	8b11                	and	a4,a4,4
    1b2e:	cf6d                	beqz	a4,1c28 <strncpy+0x1ce>
    1b30:	000501a3          	sb	zero,3(a0)
    1b34:	4711                	li	a4,4
    1b36:	00450693          	add	a3,a0,4
    1b3a:	02f77363          	bgeu	a4,a5,1b60 <strncpy+0x106>
    1b3e:	00050223          	sb	zero,4(a0)
    1b42:	4715                	li	a4,5
    1b44:	00550693          	add	a3,a0,5
    1b48:	00e78c63          	beq	a5,a4,1b60 <strncpy+0x106>
    1b4c:	000502a3          	sb	zero,5(a0)
    1b50:	471d                	li	a4,7
    1b52:	10e79163          	bne	a5,a4,1c54 <strncpy+0x1fa>
    1b56:	00750693          	add	a3,a0,7
    1b5a:	00050323          	sb	zero,6(a0)
    1b5e:	471d                	li	a4,7
    1b60:	40f608b3          	sub	a7,a2,a5
    1b64:	ff88f813          	and	a6,a7,-8
    1b68:	97aa                	add	a5,a5,a0
    1b6a:	010785b3          	add	a1,a5,a6
    1b6e:	0007b023          	sd	zero,0(a5)
    1b72:	07a1                	add	a5,a5,8
    1b74:	feb79de3          	bne	a5,a1,1b6e <strncpy+0x114>
    1b78:	00e807bb          	addw	a5,a6,a4
    1b7c:	01068733          	add	a4,a3,a6
    1b80:	0b088b63          	beq	a7,a6,1c36 <strncpy+0x1dc>
    1b84:	00070023          	sb	zero,0(a4)
    1b88:	0017869b          	addw	a3,a5,1
    1b8c:	f6c6f3e3          	bgeu	a3,a2,1af2 <strncpy+0x98>
    1b90:	000700a3          	sb	zero,1(a4)
    1b94:	0027869b          	addw	a3,a5,2
    1b98:	f4c6fde3          	bgeu	a3,a2,1af2 <strncpy+0x98>
    1b9c:	00070123          	sb	zero,2(a4)
    1ba0:	0037869b          	addw	a3,a5,3
    1ba4:	f4c6f7e3          	bgeu	a3,a2,1af2 <strncpy+0x98>
    1ba8:	000701a3          	sb	zero,3(a4)
    1bac:	0047869b          	addw	a3,a5,4
    1bb0:	f4c6f1e3          	bgeu	a3,a2,1af2 <strncpy+0x98>
    1bb4:	00070223          	sb	zero,4(a4)
    1bb8:	0057869b          	addw	a3,a5,5
    1bbc:	f2c6fbe3          	bgeu	a3,a2,1af2 <strncpy+0x98>
    1bc0:	000702a3          	sb	zero,5(a4)
    1bc4:	0067869b          	addw	a3,a5,6
    1bc8:	f2c6f5e3          	bgeu	a3,a2,1af2 <strncpy+0x98>
    1bcc:	00070323          	sb	zero,6(a4)
    1bd0:	0077869b          	addw	a3,a5,7
    1bd4:	f0c6ffe3          	bgeu	a3,a2,1af2 <strncpy+0x98>
    1bd8:	000703a3          	sb	zero,7(a4)
    1bdc:	0087869b          	addw	a3,a5,8
    1be0:	f0c6f9e3          	bgeu	a3,a2,1af2 <strncpy+0x98>
    1be4:	00070423          	sb	zero,8(a4)
    1be8:	0097869b          	addw	a3,a5,9
    1bec:	f0c6f3e3          	bgeu	a3,a2,1af2 <strncpy+0x98>
    1bf0:	000704a3          	sb	zero,9(a4)
    1bf4:	00a7869b          	addw	a3,a5,10
    1bf8:	eec6fde3          	bgeu	a3,a2,1af2 <strncpy+0x98>
    1bfc:	00070523          	sb	zero,10(a4)
    1c00:	00b7869b          	addw	a3,a5,11
    1c04:	eec6f7e3          	bgeu	a3,a2,1af2 <strncpy+0x98>
    1c08:	000705a3          	sb	zero,11(a4)
    1c0c:	00c7869b          	addw	a3,a5,12
    1c10:	eec6f1e3          	bgeu	a3,a2,1af2 <strncpy+0x98>
    1c14:	00070623          	sb	zero,12(a4)
    1c18:	27b5                	addw	a5,a5,13
    1c1a:	ecc7fce3          	bgeu	a5,a2,1af2 <strncpy+0x98>
    1c1e:	000706a3          	sb	zero,13(a4)
}
    1c22:	8082                	ret
    1c24:	46ad                	li	a3,11
    1c26:	b5d5                	j	1b0a <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c28:	00350693          	add	a3,a0,3
    1c2c:	470d                	li	a4,3
    1c2e:	bf0d                	j	1b60 <strncpy+0x106>
        if (!n || !*s)
    1c30:	e4061ce3          	bnez	a2,1a88 <strncpy+0x2e>
}
    1c34:	8082                	ret
    1c36:	8082                	ret
    char *p = dest;
    1c38:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c3a:	4701                	li	a4,0
    1c3c:	b715                	j	1b60 <strncpy+0x106>
    1c3e:	00150693          	add	a3,a0,1
    1c42:	4705                	li	a4,1
    1c44:	bf31                	j	1b60 <strncpy+0x106>
    char *p = dest;
    1c46:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c48:	4781                	li	a5,0
    1c4a:	bf2d                	j	1b84 <strncpy+0x12a>
    1c4c:	00250693          	add	a3,a0,2
    1c50:	4709                	li	a4,2
    1c52:	b739                	j	1b60 <strncpy+0x106>
    1c54:	00650693          	add	a3,a0,6
    1c58:	4719                	li	a4,6
    1c5a:	b719                	j	1b60 <strncpy+0x106>

0000000000001c5c <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c5c:	87aa                	mv	a5,a0
    1c5e:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c60:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c64:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c68:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c6a:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c6c:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c70:	2501                	sext.w	a0,a0
    1c72:	8082                	ret

0000000000001c74 <openat>:
    register long a7 __asm__("a7") = n;
    1c74:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c78:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c7c:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c80:	2501                	sext.w	a0,a0
    1c82:	8082                	ret

0000000000001c84 <fcntl>:
    register long a7 __asm__("a7") = n;
    1c84:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c86:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1c8a:	2501                	sext.w	a0,a0
    1c8c:	8082                	ret

0000000000001c8e <close>:
    register long a7 __asm__("a7") = n;
    1c8e:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c92:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c96:	2501                	sext.w	a0,a0
    1c98:	8082                	ret

0000000000001c9a <read>:
    register long a7 __asm__("a7") = n;
    1c9a:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c9e:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1ca2:	8082                	ret

0000000000001ca4 <write>:
    register long a7 __asm__("a7") = n;
    1ca4:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ca8:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1cac:	8082                	ret

0000000000001cae <getpid>:
    register long a7 __asm__("a7") = n;
    1cae:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1cb2:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1cb6:	2501                	sext.w	a0,a0
    1cb8:	8082                	ret

0000000000001cba <getppid>:
    register long a7 __asm__("a7") = n;
    1cba:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1cbe:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cc2:	2501                	sext.w	a0,a0
    1cc4:	8082                	ret

0000000000001cc6 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cc6:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cca:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cce:	2501                	sext.w	a0,a0
    1cd0:	8082                	ret

0000000000001cd2 <fork>:
    register long a7 __asm__("a7") = n;
    1cd2:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cd6:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cd8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cda:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cde:	2501                	sext.w	a0,a0
    1ce0:	8082                	ret

0000000000001ce2 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1ce2:	85b2                	mv	a1,a2
    1ce4:	863a                	mv	a2,a4
    if (stack)
    1ce6:	c191                	beqz	a1,1cea <clone+0x8>
	stack += stack_size;
    1ce8:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cea:	4781                	li	a5,0
    1cec:	4701                	li	a4,0
    1cee:	4681                	li	a3,0
    1cf0:	2601                	sext.w	a2,a2
    1cf2:	a2ed                	j	1edc <__clone>

0000000000001cf4 <exit>:
    register long a7 __asm__("a7") = n;
    1cf4:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cf8:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cfc:	8082                	ret

0000000000001cfe <waitpid>:
    register long a7 __asm__("a7") = n;
    1cfe:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d02:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d04:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d08:	2501                	sext.w	a0,a0
    1d0a:	8082                	ret

0000000000001d0c <exec>:
    register long a7 __asm__("a7") = n;
    1d0c:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d10:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d14:	2501                	sext.w	a0,a0
    1d16:	8082                	ret

0000000000001d18 <execve>:
    register long a7 __asm__("a7") = n;
    1d18:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d1c:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d20:	2501                	sext.w	a0,a0
    1d22:	8082                	ret

0000000000001d24 <times>:
    register long a7 __asm__("a7") = n;
    1d24:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d28:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d2c:	2501                	sext.w	a0,a0
    1d2e:	8082                	ret

0000000000001d30 <get_time>:

int64 get_time()
{
    1d30:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d32:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d36:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d38:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d3a:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d3e:	2501                	sext.w	a0,a0
    1d40:	ed09                	bnez	a0,1d5a <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d42:	67a2                	ld	a5,8(sp)
    1d44:	3e800713          	li	a4,1000
    1d48:	00015503          	lhu	a0,0(sp)
    1d4c:	02e7d7b3          	divu	a5,a5,a4
    1d50:	02e50533          	mul	a0,a0,a4
    1d54:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d56:	0141                	add	sp,sp,16
    1d58:	8082                	ret
        return -1;
    1d5a:	557d                	li	a0,-1
    1d5c:	bfed                	j	1d56 <get_time+0x26>

0000000000001d5e <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d5e:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d62:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d66:	2501                	sext.w	a0,a0
    1d68:	8082                	ret

0000000000001d6a <time>:
    register long a7 __asm__("a7") = n;
    1d6a:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d6e:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d72:	2501                	sext.w	a0,a0
    1d74:	8082                	ret

0000000000001d76 <sleep>:

int sleep(unsigned long long time)
{
    1d76:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d78:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d7a:	850a                	mv	a0,sp
    1d7c:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d7e:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d82:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d84:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d88:	e501                	bnez	a0,1d90 <sleep+0x1a>
    return 0;
    1d8a:	4501                	li	a0,0
}
    1d8c:	0141                	add	sp,sp,16
    1d8e:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d90:	4502                	lw	a0,0(sp)
}
    1d92:	0141                	add	sp,sp,16
    1d94:	8082                	ret

0000000000001d96 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d96:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d9a:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d9e:	2501                	sext.w	a0,a0
    1da0:	8082                	ret

0000000000001da2 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1da2:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1da6:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1daa:	8082                	ret

0000000000001dac <munmap>:
    register long a7 __asm__("a7") = n;
    1dac:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db0:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1db4:	2501                	sext.w	a0,a0
    1db6:	8082                	ret

0000000000001db8 <wait>:

int wait(int *code)
{
    1db8:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dba:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1dbe:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1dc0:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1dc2:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dc4:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1dc8:	2501                	sext.w	a0,a0
    1dca:	8082                	ret

0000000000001dcc <spawn>:
    register long a7 __asm__("a7") = n;
    1dcc:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1dd0:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dd4:	2501                	sext.w	a0,a0
    1dd6:	8082                	ret

0000000000001dd8 <mailread>:
    register long a7 __asm__("a7") = n;
    1dd8:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ddc:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1de0:	2501                	sext.w	a0,a0
    1de2:	8082                	ret

0000000000001de4 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1de4:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de8:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dec:	2501                	sext.w	a0,a0
    1dee:	8082                	ret

0000000000001df0 <fstat>:
    register long a7 __asm__("a7") = n;
    1df0:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1df4:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1df8:	2501                	sext.w	a0,a0
    1dfa:	8082                	ret

0000000000001dfc <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dfc:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dfe:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e02:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e04:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e08:	2501                	sext.w	a0,a0
    1e0a:	8082                	ret

0000000000001e0c <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e0c:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e0e:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e12:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e14:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e18:	2501                	sext.w	a0,a0
    1e1a:	8082                	ret

0000000000001e1c <link>:

int link(char *old_path, char *new_path)
{
    1e1c:	87aa                	mv	a5,a0
    1e1e:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e20:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e24:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e28:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e2a:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e2e:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e30:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <unlink>:

int unlink(char *path)
{
    1e38:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e3a:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e3e:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e42:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e44:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e48:	2501                	sext.w	a0,a0
    1e4a:	8082                	ret

0000000000001e4c <uname>:
    register long a7 __asm__("a7") = n;
    1e4c:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e50:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e54:	2501                	sext.w	a0,a0
    1e56:	8082                	ret

0000000000001e58 <brk>:
    register long a7 __asm__("a7") = n;
    1e58:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e5c:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e60:	2501                	sext.w	a0,a0
    1e62:	8082                	ret

0000000000001e64 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e64:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e66:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e6a:	8082                	ret

0000000000001e6c <chdir>:
    register long a7 __asm__("a7") = n;
    1e6c:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e70:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e74:	2501                	sext.w	a0,a0
    1e76:	8082                	ret

0000000000001e78 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e78:	862e                	mv	a2,a1
    1e7a:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e7c:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e7e:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e82:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e86:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e88:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e8a:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e8e:	2501                	sext.w	a0,a0
    1e90:	8082                	ret

0000000000001e92 <getdents>:
    register long a7 __asm__("a7") = n;
    1e92:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e96:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e9a:	2501                	sext.w	a0,a0
    1e9c:	8082                	ret

0000000000001e9e <pipe>:
    register long a7 __asm__("a7") = n;
    1e9e:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1ea2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea4:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1ea8:	2501                	sext.w	a0,a0
    1eaa:	8082                	ret

0000000000001eac <dup>:
    register long a7 __asm__("a7") = n;
    1eac:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1eae:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1eb2:	2501                	sext.w	a0,a0
    1eb4:	8082                	ret

0000000000001eb6 <dup2>:
    register long a7 __asm__("a7") = n;
    1eb6:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1eb8:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eba:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ebe:	2501                	sext.w	a0,a0
    1ec0:	8082                	ret

0000000000001ec2 <mount>:
    register long a7 __asm__("a7") = n;
    1ec2:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ec6:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1eca:	2501                	sext.w	a0,a0
    1ecc:	8082                	ret

0000000000001ece <umount>:
    register long a7 __asm__("a7") = n;
    1ece:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ed2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed4:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ed8:	2501                	sext.w	a0,a0
    1eda:	8082                	ret

0000000000001edc <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1edc:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1ede:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ee0:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ee2:	8532                	mv	a0,a2
	mv a2, a4
    1ee4:	863a                	mv	a2,a4
	mv a3, a5
    1ee6:	86be                	mv	a3,a5
	mv a4, a6
    1ee8:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1eea:	0dc00893          	li	a7,220
	ecall
    1eee:	00000073          	ecall

	beqz a0, 1f
    1ef2:	c111                	beqz	a0,1ef6 <__clone+0x1a>
	# Parent
	ret
    1ef4:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ef6:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ef8:	6522                	ld	a0,8(sp)
	jalr a1
    1efa:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1efc:	05d00893          	li	a7,93
	ecall
    1f00:	00000073          	ecall
