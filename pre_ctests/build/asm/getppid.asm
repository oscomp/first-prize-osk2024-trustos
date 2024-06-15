
/root/oskernel2024-trustos/pre_ctests/build/riscv64/getppid:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a051                	j	1086 <__start_main>

0000000000001004 <test_getppid>:
 * 不能通过测试则输出：
 * "  getppid error."
 */

int test_getppid()
{
    1004:	1141                	add	sp,sp,-16
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	eba50513          	add	a0,a0,-326 # 1ec0 <__clone+0x2a>
{
    100e:	e406                	sd	ra,8(sp)
    TEST_START(__func__);
    1010:	2ae000ef          	jal	12be <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	f2450513          	add	a0,a0,-220 # 1f38 <__func__.0>
    101c:	2a2000ef          	jal	12be <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	eb850513          	add	a0,a0,-328 # 1ed8 <__clone+0x42>
    1028:	296000ef          	jal	12be <puts>
    pid_t ppid = getppid();
    102c:	449000ef          	jal	1c74 <getppid>
    if(ppid > 0) printf("  getppid success. ppid : %d\n", ppid);
    1030:	02a05c63          	blez	a0,1068 <test_getppid+0x64>
    1034:	85aa                	mv	a1,a0
    1036:	00001517          	auipc	a0,0x1
    103a:	eb250513          	add	a0,a0,-334 # 1ee8 <__clone+0x52>
    103e:	2a2000ef          	jal	12e0 <printf>
    else printf("  getppid error.\n");
    TEST_END(__func__);
    1042:	00001517          	auipc	a0,0x1
    1046:	ede50513          	add	a0,a0,-290 # 1f20 <__clone+0x8a>
    104a:	274000ef          	jal	12be <puts>
    104e:	00001517          	auipc	a0,0x1
    1052:	eea50513          	add	a0,a0,-278 # 1f38 <__func__.0>
    1056:	268000ef          	jal	12be <puts>
}
    105a:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    105c:	00001517          	auipc	a0,0x1
    1060:	e7c50513          	add	a0,a0,-388 # 1ed8 <__clone+0x42>
}
    1064:	0141                	add	sp,sp,16
    TEST_END(__func__);
    1066:	aca1                	j	12be <puts>
    else printf("  getppid error.\n");
    1068:	00001517          	auipc	a0,0x1
    106c:	ea050513          	add	a0,a0,-352 # 1f08 <__clone+0x72>
    1070:	270000ef          	jal	12e0 <printf>
    1074:	b7f9                	j	1042 <test_getppid+0x3e>

0000000000001076 <main>:

int main(void) {
    1076:	1141                	add	sp,sp,-16
    1078:	e406                	sd	ra,8(sp)
	test_getppid();
    107a:	f8bff0ef          	jal	1004 <test_getppid>
	return 0;
}
    107e:	60a2                	ld	ra,8(sp)
    1080:	4501                	li	a0,0
    1082:	0141                	add	sp,sp,16
    1084:	8082                	ret

0000000000001086 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1086:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1088:	4108                	lw	a0,0(a0)
{
    108a:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    108c:	05a1                	add	a1,a1,8
{
    108e:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1090:	fe7ff0ef          	jal	1076 <main>
    1094:	41b000ef          	jal	1cae <exit>
	return 0;
}
    1098:	60a2                	ld	ra,8(sp)
    109a:	4501                	li	a0,0
    109c:	0141                	add	sp,sp,16
    109e:	8082                	ret

00000000000010a0 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10a0:	7179                	add	sp,sp,-48
    10a2:	f406                	sd	ra,40(sp)
    10a4:	0005081b          	sext.w	a6,a0
    10a8:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10aa:	00055563          	bgez	a0,10b4 <printint.constprop.0+0x14>
        x = -xx;
    10ae:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    10b2:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10b4:	02b8763b          	remuw	a2,a6,a1
    10b8:	00001697          	auipc	a3,0x1
    10bc:	e9068693          	add	a3,a3,-368 # 1f48 <digits>
    buf[16] = 0;
    10c0:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10c4:	0005871b          	sext.w	a4,a1
    10c8:	1602                	sll	a2,a2,0x20
    10ca:	9201                	srl	a2,a2,0x20
    10cc:	9636                	add	a2,a2,a3
    10ce:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10d2:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    10d6:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    10da:	10b86c63          	bltu	a6,a1,11f2 <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    10de:	02e5763b          	remuw	a2,a0,a4
    10e2:	1602                	sll	a2,a2,0x20
    10e4:	9201                	srl	a2,a2,0x20
    10e6:	9636                	add	a2,a2,a3
    10e8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10ec:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    10f0:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    10f4:	10e56863          	bltu	a0,a4,1204 <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    10f8:	02e5f63b          	remuw	a2,a1,a4
    10fc:	1602                	sll	a2,a2,0x20
    10fe:	9201                	srl	a2,a2,0x20
    1100:	9636                	add	a2,a2,a3
    1102:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1106:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    110a:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    110e:	10e5e463          	bltu	a1,a4,1216 <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    1112:	02e5763b          	remuw	a2,a0,a4
    1116:	1602                	sll	a2,a2,0x20
    1118:	9201                	srl	a2,a2,0x20
    111a:	9636                	add	a2,a2,a3
    111c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1120:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1124:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1128:	10e56063          	bltu	a0,a4,1228 <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    112c:	02e5f63b          	remuw	a2,a1,a4
    1130:	1602                	sll	a2,a2,0x20
    1132:	9201                	srl	a2,a2,0x20
    1134:	9636                	add	a2,a2,a3
    1136:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    113a:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    113e:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1142:	0ee5ec63          	bltu	a1,a4,123a <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    1146:	02e5763b          	remuw	a2,a0,a4
    114a:	1602                	sll	a2,a2,0x20
    114c:	9201                	srl	a2,a2,0x20
    114e:	9636                	add	a2,a2,a3
    1150:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1154:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1158:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    115c:	08e56263          	bltu	a0,a4,11e0 <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    1160:	02e5f63b          	remuw	a2,a1,a4
    1164:	1602                	sll	a2,a2,0x20
    1166:	9201                	srl	a2,a2,0x20
    1168:	9636                	add	a2,a2,a3
    116a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    116e:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1172:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1176:	0ce5eb63          	bltu	a1,a4,124c <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    117a:	02e5763b          	remuw	a2,a0,a4
    117e:	1602                	sll	a2,a2,0x20
    1180:	9201                	srl	a2,a2,0x20
    1182:	9636                	add	a2,a2,a3
    1184:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1188:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    118c:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1190:	0ce56763          	bltu	a0,a4,125e <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    1194:	02e5f63b          	remuw	a2,a1,a4
    1198:	1602                	sll	a2,a2,0x20
    119a:	9201                	srl	a2,a2,0x20
    119c:	9636                	add	a2,a2,a3
    119e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a2:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11a6:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11aa:	0ce5e363          	bltu	a1,a4,1270 <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    11ae:	1782                	sll	a5,a5,0x20
    11b0:	9381                	srl	a5,a5,0x20
    11b2:	96be                	add	a3,a3,a5
    11b4:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    11b8:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    11ba:	00f10723          	sb	a5,14(sp)
    if (sign)
    11be:	00088763          	beqz	a7,11cc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11c2:	02d00793          	li	a5,45
    11c6:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11ca:	4595                	li	a1,5
    write(f, s, l);
    11cc:	003c                	add	a5,sp,8
    11ce:	4641                	li	a2,16
    11d0:	9e0d                	subw	a2,a2,a1
    11d2:	4505                	li	a0,1
    11d4:	95be                	add	a1,a1,a5
    11d6:	289000ef          	jal	1c5e <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11da:	70a2                	ld	ra,40(sp)
    11dc:	6145                	add	sp,sp,48
    11de:	8082                	ret
    i++;
    11e0:	45a9                	li	a1,10
    if (sign)
    11e2:	fe0885e3          	beqz	a7,11cc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11e6:	02d00793          	li	a5,45
    11ea:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    11ee:	45a5                	li	a1,9
    11f0:	bff1                	j	11cc <printint.constprop.0+0x12c>
    i++;
    11f2:	45bd                	li	a1,15
    if (sign)
    11f4:	fc088ce3          	beqz	a7,11cc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11f8:	02d00793          	li	a5,45
    11fc:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1200:	45b9                	li	a1,14
    1202:	b7e9                	j	11cc <printint.constprop.0+0x12c>
    i++;
    1204:	45b9                	li	a1,14
    if (sign)
    1206:	fc0883e3          	beqz	a7,11cc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    120a:	02d00793          	li	a5,45
    120e:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1212:	45b5                	li	a1,13
    1214:	bf65                	j	11cc <printint.constprop.0+0x12c>
    i++;
    1216:	45b5                	li	a1,13
    if (sign)
    1218:	fa088ae3          	beqz	a7,11cc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    121c:	02d00793          	li	a5,45
    1220:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1224:	45b1                	li	a1,12
    1226:	b75d                	j	11cc <printint.constprop.0+0x12c>
    i++;
    1228:	45b1                	li	a1,12
    if (sign)
    122a:	fa0881e3          	beqz	a7,11cc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    122e:	02d00793          	li	a5,45
    1232:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1236:	45ad                	li	a1,11
    1238:	bf51                	j	11cc <printint.constprop.0+0x12c>
    i++;
    123a:	45ad                	li	a1,11
    if (sign)
    123c:	f80888e3          	beqz	a7,11cc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1240:	02d00793          	li	a5,45
    1244:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1248:	45a9                	li	a1,10
    124a:	b749                	j	11cc <printint.constprop.0+0x12c>
    i++;
    124c:	45a5                	li	a1,9
    if (sign)
    124e:	f6088fe3          	beqz	a7,11cc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1252:	02d00793          	li	a5,45
    1256:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    125a:	45a1                	li	a1,8
    125c:	bf85                	j	11cc <printint.constprop.0+0x12c>
    i++;
    125e:	45a1                	li	a1,8
    if (sign)
    1260:	f60886e3          	beqz	a7,11cc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1264:	02d00793          	li	a5,45
    1268:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    126c:	459d                	li	a1,7
    126e:	bfb9                	j	11cc <printint.constprop.0+0x12c>
    i++;
    1270:	459d                	li	a1,7
    if (sign)
    1272:	f4088de3          	beqz	a7,11cc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1276:	02d00793          	li	a5,45
    127a:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    127e:	4599                	li	a1,6
    1280:	b7b1                	j	11cc <printint.constprop.0+0x12c>

0000000000001282 <getchar>:
{
    1282:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    1284:	00f10593          	add	a1,sp,15
    1288:	4605                	li	a2,1
    128a:	4501                	li	a0,0
{
    128c:	ec06                	sd	ra,24(sp)
    char byte = 0;
    128e:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1292:	1c3000ef          	jal	1c54 <read>
}
    1296:	60e2                	ld	ra,24(sp)
    1298:	00f14503          	lbu	a0,15(sp)
    129c:	6105                	add	sp,sp,32
    129e:	8082                	ret

00000000000012a0 <putchar>:
{
    12a0:	1101                	add	sp,sp,-32
    12a2:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12a4:	00f10593          	add	a1,sp,15
    12a8:	4605                	li	a2,1
    12aa:	4505                	li	a0,1
{
    12ac:	ec06                	sd	ra,24(sp)
    char byte = c;
    12ae:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12b2:	1ad000ef          	jal	1c5e <write>
}
    12b6:	60e2                	ld	ra,24(sp)
    12b8:	2501                	sext.w	a0,a0
    12ba:	6105                	add	sp,sp,32
    12bc:	8082                	ret

00000000000012be <puts>:
{
    12be:	1141                	add	sp,sp,-16
    12c0:	e406                	sd	ra,8(sp)
    12c2:	e022                	sd	s0,0(sp)
    12c4:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12c6:	55a000ef          	jal	1820 <strlen>
    12ca:	862a                	mv	a2,a0
    12cc:	85a2                	mv	a1,s0
    12ce:	4505                	li	a0,1
    12d0:	18f000ef          	jal	1c5e <write>
}
    12d4:	60a2                	ld	ra,8(sp)
    12d6:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12d8:	957d                	sra	a0,a0,0x3f
    return r;
    12da:	2501                	sext.w	a0,a0
}
    12dc:	0141                	add	sp,sp,16
    12de:	8082                	ret

00000000000012e0 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12e0:	7131                	add	sp,sp,-192
    12e2:	e4d6                	sd	s5,72(sp)
    12e4:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12e6:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12e8:	013c                	add	a5,sp,136
{
    12ea:	f0ca                	sd	s2,96(sp)
    12ec:	ecce                	sd	s3,88(sp)
    12ee:	e8d2                	sd	s4,80(sp)
    12f0:	e0da                	sd	s6,64(sp)
    12f2:	fc5e                	sd	s7,56(sp)
    12f4:	fc86                	sd	ra,120(sp)
    12f6:	f8a2                	sd	s0,112(sp)
    12f8:	f4a6                	sd	s1,104(sp)
    12fa:	e52e                	sd	a1,136(sp)
    12fc:	e932                	sd	a2,144(sp)
    12fe:	ed36                	sd	a3,152(sp)
    1300:	f13a                	sd	a4,160(sp)
    1302:	f942                	sd	a6,176(sp)
    1304:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1306:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1308:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    130c:	07300a13          	li	s4,115
    1310:	07800b93          	li	s7,120
    1314:	06400b13          	li	s6,100
    buf[i++] = '0';
    1318:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x58e8>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    131c:	00001997          	auipc	s3,0x1
    1320:	c2c98993          	add	s3,s3,-980 # 1f48 <digits>
        if (!*s)
    1324:	00054783          	lbu	a5,0(a0)
    1328:	16078863          	beqz	a5,1498 <printf+0x1b8>
    132c:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    132e:	19278063          	beq	a5,s2,14ae <printf+0x1ce>
    1332:	00164783          	lbu	a5,1(a2)
    1336:	0605                	add	a2,a2,1
    1338:	fbfd                	bnez	a5,132e <printf+0x4e>
    133a:	84b2                	mv	s1,a2
        l = z - a;
    133c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1340:	85aa                	mv	a1,a0
    1342:	8622                	mv	a2,s0
    1344:	4505                	li	a0,1
    1346:	119000ef          	jal	1c5e <write>
        if (l)
    134a:	18041763          	bnez	s0,14d8 <printf+0x1f8>
        if (s[1] == 0)
    134e:	0014c783          	lbu	a5,1(s1)
    1352:	14078363          	beqz	a5,1498 <printf+0x1b8>
        switch (s[1])
    1356:	19478f63          	beq	a5,s4,14f4 <printf+0x214>
    135a:	18fa6163          	bltu	s4,a5,14dc <printf+0x1fc>
    135e:	1b678e63          	beq	a5,s6,151a <printf+0x23a>
    1362:	07000713          	li	a4,112
    1366:	1ce79463          	bne	a5,a4,152e <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    136a:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    136c:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1370:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1372:	631c                	ld	a5,0(a4)
    1374:	0721                	add	a4,a4,8
    1376:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1378:	00479293          	sll	t0,a5,0x4
    137c:	00879f93          	sll	t6,a5,0x8
    1380:	00c79f13          	sll	t5,a5,0xc
    1384:	01079e93          	sll	t4,a5,0x10
    1388:	01479e13          	sll	t3,a5,0x14
    138c:	01879313          	sll	t1,a5,0x18
    1390:	01c79893          	sll	a7,a5,0x1c
    1394:	02479813          	sll	a6,a5,0x24
    1398:	02879513          	sll	a0,a5,0x28
    139c:	02c79593          	sll	a1,a5,0x2c
    13a0:	03079693          	sll	a3,a5,0x30
    13a4:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13a8:	03c7d413          	srl	s0,a5,0x3c
    13ac:	01c7d39b          	srlw	t2,a5,0x1c
    13b0:	03c2d293          	srl	t0,t0,0x3c
    13b4:	03cfdf93          	srl	t6,t6,0x3c
    13b8:	03cf5f13          	srl	t5,t5,0x3c
    13bc:	03cede93          	srl	t4,t4,0x3c
    13c0:	03ce5e13          	srl	t3,t3,0x3c
    13c4:	03c35313          	srl	t1,t1,0x3c
    13c8:	03c8d893          	srl	a7,a7,0x3c
    13cc:	03c85813          	srl	a6,a6,0x3c
    13d0:	9171                	srl	a0,a0,0x3c
    13d2:	91f1                	srl	a1,a1,0x3c
    13d4:	92f1                	srl	a3,a3,0x3c
    13d6:	9371                	srl	a4,a4,0x3c
    13d8:	974e                	add	a4,a4,s3
    13da:	944e                	add	s0,s0,s3
    13dc:	92ce                	add	t0,t0,s3
    13de:	9fce                	add	t6,t6,s3
    13e0:	9f4e                	add	t5,t5,s3
    13e2:	9ece                	add	t4,t4,s3
    13e4:	9e4e                	add	t3,t3,s3
    13e6:	934e                	add	t1,t1,s3
    13e8:	98ce                	add	a7,a7,s3
    13ea:	93ce                	add	t2,t2,s3
    13ec:	984e                	add	a6,a6,s3
    13ee:	954e                	add	a0,a0,s3
    13f0:	95ce                	add	a1,a1,s3
    13f2:	96ce                	add	a3,a3,s3
    13f4:	00074083          	lbu	ra,0(a4)
    13f8:	0002c283          	lbu	t0,0(t0)
    13fc:	000fcf83          	lbu	t6,0(t6)
    1400:	000f4f03          	lbu	t5,0(t5)
    1404:	000ece83          	lbu	t4,0(t4)
    1408:	000e4e03          	lbu	t3,0(t3)
    140c:	00034303          	lbu	t1,0(t1)
    1410:	0008c883          	lbu	a7,0(a7)
    1414:	0003c383          	lbu	t2,0(t2)
    1418:	00084803          	lbu	a6,0(a6)
    141c:	00054503          	lbu	a0,0(a0)
    1420:	0005c583          	lbu	a1,0(a1)
    1424:	0006c683          	lbu	a3,0(a3)
    1428:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    142c:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1430:	9371                	srl	a4,a4,0x3c
    1432:	8bbd                	and	a5,a5,15
    1434:	974e                	add	a4,a4,s3
    1436:	97ce                	add	a5,a5,s3
    1438:	005105a3          	sb	t0,11(sp)
    143c:	01f10623          	sb	t6,12(sp)
    1440:	01e106a3          	sb	t5,13(sp)
    1444:	01d10723          	sb	t4,14(sp)
    1448:	01c107a3          	sb	t3,15(sp)
    144c:	00610823          	sb	t1,16(sp)
    1450:	011108a3          	sb	a7,17(sp)
    1454:	00710923          	sb	t2,18(sp)
    1458:	010109a3          	sb	a6,19(sp)
    145c:	00a10a23          	sb	a0,20(sp)
    1460:	00b10aa3          	sb	a1,21(sp)
    1464:	00d10b23          	sb	a3,22(sp)
    1468:	00110ba3          	sb	ra,23(sp)
    146c:	00810523          	sb	s0,10(sp)
    1470:	00074703          	lbu	a4,0(a4)
    1474:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1478:	002c                	add	a1,sp,8
    147a:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    147c:	00e10c23          	sb	a4,24(sp)
    1480:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1484:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1488:	7d6000ef          	jal	1c5e <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    148c:	00248513          	add	a0,s1,2
        if (!*s)
    1490:	00054783          	lbu	a5,0(a0)
    1494:	e8079ce3          	bnez	a5,132c <printf+0x4c>
    }
    va_end(ap);
}
    1498:	70e6                	ld	ra,120(sp)
    149a:	7446                	ld	s0,112(sp)
    149c:	74a6                	ld	s1,104(sp)
    149e:	7906                	ld	s2,96(sp)
    14a0:	69e6                	ld	s3,88(sp)
    14a2:	6a46                	ld	s4,80(sp)
    14a4:	6aa6                	ld	s5,72(sp)
    14a6:	6b06                	ld	s6,64(sp)
    14a8:	7be2                	ld	s7,56(sp)
    14aa:	6129                	add	sp,sp,192
    14ac:	8082                	ret
    14ae:	84b2                	mv	s1,a2
    14b0:	a039                	j	14be <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14b2:	0024c783          	lbu	a5,2(s1)
    14b6:	0605                	add	a2,a2,1
    14b8:	0489                	add	s1,s1,2
    14ba:	e92791e3          	bne	a5,s2,133c <printf+0x5c>
    14be:	0014c783          	lbu	a5,1(s1)
    14c2:	ff2788e3          	beq	a5,s2,14b2 <printf+0x1d2>
        l = z - a;
    14c6:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14ca:	85aa                	mv	a1,a0
    14cc:	8622                	mv	a2,s0
    14ce:	4505                	li	a0,1
    14d0:	78e000ef          	jal	1c5e <write>
        if (l)
    14d4:	e6040de3          	beqz	s0,134e <printf+0x6e>
    14d8:	8526                	mv	a0,s1
    14da:	b5a9                	j	1324 <printf+0x44>
        switch (s[1])
    14dc:	05779963          	bne	a5,s7,152e <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    14e0:	6782                	ld	a5,0(sp)
    14e2:	45c1                	li	a1,16
    14e4:	4388                	lw	a0,0(a5)
    14e6:	07a1                	add	a5,a5,8
    14e8:	e03e                	sd	a5,0(sp)
    14ea:	bb7ff0ef          	jal	10a0 <printint.constprop.0>
        s += 2;
    14ee:	00248513          	add	a0,s1,2
    14f2:	bf79                	j	1490 <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    14f4:	6782                	ld	a5,0(sp)
    14f6:	6380                	ld	s0,0(a5)
    14f8:	07a1                	add	a5,a5,8
    14fa:	e03e                	sd	a5,0(sp)
    14fc:	cc21                	beqz	s0,1554 <printf+0x274>
            l = strnlen(a, 200);
    14fe:	0c800593          	li	a1,200
    1502:	8522                	mv	a0,s0
    1504:	44e000ef          	jal	1952 <strnlen>
    write(f, s, l);
    1508:	0005061b          	sext.w	a2,a0
    150c:	85a2                	mv	a1,s0
    150e:	4505                	li	a0,1
    1510:	74e000ef          	jal	1c5e <write>
        s += 2;
    1514:	00248513          	add	a0,s1,2
    1518:	bfa5                	j	1490 <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    151a:	6782                	ld	a5,0(sp)
    151c:	45a9                	li	a1,10
    151e:	4388                	lw	a0,0(a5)
    1520:	07a1                	add	a5,a5,8
    1522:	e03e                	sd	a5,0(sp)
    1524:	b7dff0ef          	jal	10a0 <printint.constprop.0>
        s += 2;
    1528:	00248513          	add	a0,s1,2
    152c:	b795                	j	1490 <printf+0x1b0>
    return write(stdout, &byte, 1);
    152e:	4605                	li	a2,1
    1530:	002c                	add	a1,sp,8
    1532:	4505                	li	a0,1
    char byte = c;
    1534:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1538:	726000ef          	jal	1c5e <write>
    char byte = c;
    153c:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1540:	4605                	li	a2,1
    1542:	002c                	add	a1,sp,8
    1544:	4505                	li	a0,1
    char byte = c;
    1546:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    154a:	714000ef          	jal	1c5e <write>
        s += 2;
    154e:	00248513          	add	a0,s1,2
    1552:	bf3d                	j	1490 <printf+0x1b0>
                a = "(null)";
    1554:	00001417          	auipc	s0,0x1
    1558:	9dc40413          	add	s0,s0,-1572 # 1f30 <__clone+0x9a>
    155c:	b74d                	j	14fe <printf+0x21e>

000000000000155e <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    155e:	02000793          	li	a5,32
    1562:	00f50663          	beq	a0,a5,156e <isspace+0x10>
    1566:	355d                	addw	a0,a0,-9
    1568:	00553513          	sltiu	a0,a0,5
    156c:	8082                	ret
    156e:	4505                	li	a0,1
}
    1570:	8082                	ret

0000000000001572 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1572:	fd05051b          	addw	a0,a0,-48
}
    1576:	00a53513          	sltiu	a0,a0,10
    157a:	8082                	ret

000000000000157c <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    157c:	02000713          	li	a4,32
    1580:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1582:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1586:	ff76879b          	addw	a5,a3,-9
    158a:	06e68063          	beq	a3,a4,15ea <atoi+0x6e>
    158e:	0006859b          	sext.w	a1,a3
    1592:	04f67c63          	bgeu	a2,a5,15ea <atoi+0x6e>
        s++;
    switch (*s)
    1596:	02b00793          	li	a5,43
    159a:	06f68563          	beq	a3,a5,1604 <atoi+0x88>
    159e:	02d00793          	li	a5,45
    15a2:	04f69663          	bne	a3,a5,15ee <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15a6:	00154683          	lbu	a3,1(a0)
    15aa:	47a5                	li	a5,9
        s++;
    15ac:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    15b0:	fd06869b          	addw	a3,a3,-48
    15b4:	8636                	mv	a2,a3
    while (isdigit(*s))
    15b6:	04d7e563          	bltu	a5,a3,1600 <atoi+0x84>
        neg = 1;
    15ba:	4885                	li	a7,1
    int n = 0, neg = 0;
    15bc:	4501                	li	a0,0
    while (isdigit(*s))
    15be:	4825                	li	a6,9
    15c0:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    15c4:	0025179b          	sllw	a5,a0,0x2
    15c8:	9fa9                	addw	a5,a5,a0
    15ca:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    15ce:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    15d2:	85b2                	mv	a1,a2
    15d4:	40c7853b          	subw	a0,a5,a2
    15d8:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    15da:	8636                	mv	a2,a3
    while (isdigit(*s))
    15dc:	fed872e3          	bgeu	a6,a3,15c0 <atoi+0x44>
    return neg ? n : -n;
    15e0:	02089163          	bnez	a7,1602 <atoi+0x86>
    15e4:	40f5853b          	subw	a0,a1,a5
    15e8:	8082                	ret
        s++;
    15ea:	0505                	add	a0,a0,1
    15ec:	bf59                	j	1582 <atoi+0x6>
    while (isdigit(*s))
    15ee:	fd05859b          	addw	a1,a1,-48
    15f2:	47a5                	li	a5,9
    15f4:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    15f6:	4881                	li	a7,0
    15f8:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    15fc:	fcb7f0e3          	bgeu	a5,a1,15bc <atoi+0x40>
    return neg ? n : -n;
    1600:	4501                	li	a0,0
}
    1602:	8082                	ret
    while (isdigit(*s))
    1604:	00154683          	lbu	a3,1(a0)
    1608:	47a5                	li	a5,9
        s++;
    160a:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    160e:	fd06869b          	addw	a3,a3,-48
    1612:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    1614:	4881                	li	a7,0
    while (isdigit(*s))
    1616:	fad7f3e3          	bgeu	a5,a3,15bc <atoi+0x40>
    return neg ? n : -n;
    161a:	4501                	li	a0,0
    161c:	8082                	ret

000000000000161e <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    161e:	16060f63          	beqz	a2,179c <memset+0x17e>
    1622:	40a006b3          	neg	a3,a0
    1626:	0076f793          	and	a5,a3,7
    162a:	00778813          	add	a6,a5,7
    162e:	48ad                	li	a7,11
    1630:	0ff5f713          	zext.b	a4,a1
    1634:	fff60593          	add	a1,a2,-1
    1638:	17186363          	bltu	a6,a7,179e <memset+0x180>
    163c:	1705eb63          	bltu	a1,a6,17b2 <memset+0x194>
    1640:	16078163          	beqz	a5,17a2 <memset+0x184>
    1644:	00e50023          	sb	a4,0(a0)
    1648:	0066f593          	and	a1,a3,6
    164c:	14058e63          	beqz	a1,17a8 <memset+0x18a>
    1650:	00e500a3          	sb	a4,1(a0)
    1654:	4589                	li	a1,2
    1656:	00250813          	add	a6,a0,2
    165a:	04f5f663          	bgeu	a1,a5,16a6 <memset+0x88>
    165e:	00e50123          	sb	a4,2(a0)
    1662:	8a91                	and	a3,a3,4
    1664:	00350813          	add	a6,a0,3
    1668:	458d                	li	a1,3
    166a:	ce95                	beqz	a3,16a6 <memset+0x88>
    166c:	00e501a3          	sb	a4,3(a0)
    1670:	4691                	li	a3,4
    1672:	00450813          	add	a6,a0,4
    1676:	4591                	li	a1,4
    1678:	02f6f763          	bgeu	a3,a5,16a6 <memset+0x88>
    167c:	00e50223          	sb	a4,4(a0)
    1680:	4695                	li	a3,5
    1682:	00550813          	add	a6,a0,5
    1686:	4595                	li	a1,5
    1688:	00d78f63          	beq	a5,a3,16a6 <memset+0x88>
    168c:	00e502a3          	sb	a4,5(a0)
    1690:	469d                	li	a3,7
    1692:	00650813          	add	a6,a0,6
    1696:	4599                	li	a1,6
    1698:	00d79763          	bne	a5,a3,16a6 <memset+0x88>
    169c:	00750813          	add	a6,a0,7
    16a0:	00e50323          	sb	a4,6(a0)
    16a4:	459d                	li	a1,7
    16a6:	00871693          	sll	a3,a4,0x8
    16aa:	01071313          	sll	t1,a4,0x10
    16ae:	8ed9                	or	a3,a3,a4
    16b0:	01871893          	sll	a7,a4,0x18
    16b4:	0066e6b3          	or	a3,a3,t1
    16b8:	0116e6b3          	or	a3,a3,a7
    16bc:	02071313          	sll	t1,a4,0x20
    16c0:	02871893          	sll	a7,a4,0x28
    16c4:	0066e6b3          	or	a3,a3,t1
    16c8:	40f60e33          	sub	t3,a2,a5
    16cc:	03071313          	sll	t1,a4,0x30
    16d0:	0116e6b3          	or	a3,a3,a7
    16d4:	0066e6b3          	or	a3,a3,t1
    16d8:	03871893          	sll	a7,a4,0x38
    16dc:	97aa                	add	a5,a5,a0
    16de:	ff8e7313          	and	t1,t3,-8
    16e2:	0116e6b3          	or	a3,a3,a7
    16e6:	00f308b3          	add	a7,t1,a5
    16ea:	e394                	sd	a3,0(a5)
    16ec:	07a1                	add	a5,a5,8
    16ee:	ff179ee3          	bne	a5,a7,16ea <memset+0xcc>
    16f2:	006806b3          	add	a3,a6,t1
    16f6:	00b307bb          	addw	a5,t1,a1
    16fa:	0bc30b63          	beq	t1,t3,17b0 <memset+0x192>
    16fe:	00e68023          	sb	a4,0(a3)
    1702:	0017859b          	addw	a1,a5,1
    1706:	08c5fb63          	bgeu	a1,a2,179c <memset+0x17e>
    170a:	00e680a3          	sb	a4,1(a3)
    170e:	0027859b          	addw	a1,a5,2
    1712:	08c5f563          	bgeu	a1,a2,179c <memset+0x17e>
    1716:	00e68123          	sb	a4,2(a3)
    171a:	0037859b          	addw	a1,a5,3
    171e:	06c5ff63          	bgeu	a1,a2,179c <memset+0x17e>
    1722:	00e681a3          	sb	a4,3(a3)
    1726:	0047859b          	addw	a1,a5,4
    172a:	06c5f963          	bgeu	a1,a2,179c <memset+0x17e>
    172e:	00e68223          	sb	a4,4(a3)
    1732:	0057859b          	addw	a1,a5,5
    1736:	06c5f363          	bgeu	a1,a2,179c <memset+0x17e>
    173a:	00e682a3          	sb	a4,5(a3)
    173e:	0067859b          	addw	a1,a5,6
    1742:	04c5fd63          	bgeu	a1,a2,179c <memset+0x17e>
    1746:	00e68323          	sb	a4,6(a3)
    174a:	0077859b          	addw	a1,a5,7
    174e:	04c5f763          	bgeu	a1,a2,179c <memset+0x17e>
    1752:	00e683a3          	sb	a4,7(a3)
    1756:	0087859b          	addw	a1,a5,8
    175a:	04c5f163          	bgeu	a1,a2,179c <memset+0x17e>
    175e:	00e68423          	sb	a4,8(a3)
    1762:	0097859b          	addw	a1,a5,9
    1766:	02c5fb63          	bgeu	a1,a2,179c <memset+0x17e>
    176a:	00e684a3          	sb	a4,9(a3)
    176e:	00a7859b          	addw	a1,a5,10
    1772:	02c5f563          	bgeu	a1,a2,179c <memset+0x17e>
    1776:	00e68523          	sb	a4,10(a3)
    177a:	00b7859b          	addw	a1,a5,11
    177e:	00c5ff63          	bgeu	a1,a2,179c <memset+0x17e>
    1782:	00e685a3          	sb	a4,11(a3)
    1786:	00c7859b          	addw	a1,a5,12
    178a:	00c5f963          	bgeu	a1,a2,179c <memset+0x17e>
    178e:	00e68623          	sb	a4,12(a3)
    1792:	27b5                	addw	a5,a5,13
    1794:	00c7f463          	bgeu	a5,a2,179c <memset+0x17e>
    1798:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    179c:	8082                	ret
    179e:	482d                	li	a6,11
    17a0:	bd71                	j	163c <memset+0x1e>
    char *p = dest;
    17a2:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17a4:	4581                	li	a1,0
    17a6:	b701                	j	16a6 <memset+0x88>
    17a8:	00150813          	add	a6,a0,1
    17ac:	4585                	li	a1,1
    17ae:	bde5                	j	16a6 <memset+0x88>
    17b0:	8082                	ret
    char *p = dest;
    17b2:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17b4:	4781                	li	a5,0
    17b6:	b7a1                	j	16fe <memset+0xe0>

00000000000017b8 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17b8:	00054783          	lbu	a5,0(a0)
    17bc:	0005c703          	lbu	a4,0(a1)
    17c0:	00e79863          	bne	a5,a4,17d0 <strcmp+0x18>
    17c4:	0505                	add	a0,a0,1
    17c6:	0585                	add	a1,a1,1
    17c8:	fbe5                	bnez	a5,17b8 <strcmp>
    17ca:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    17cc:	9d19                	subw	a0,a0,a4
    17ce:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    17d0:	0007851b          	sext.w	a0,a5
    17d4:	bfe5                	j	17cc <strcmp+0x14>

00000000000017d6 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    17d6:	ca15                	beqz	a2,180a <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17d8:	00054783          	lbu	a5,0(a0)
    if (!n--)
    17dc:	167d                	add	a2,a2,-1
    17de:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17e2:	eb99                	bnez	a5,17f8 <strncmp+0x22>
    17e4:	a815                	j	1818 <strncmp+0x42>
    17e6:	00a68e63          	beq	a3,a0,1802 <strncmp+0x2c>
    17ea:	0505                	add	a0,a0,1
    17ec:	00f71b63          	bne	a4,a5,1802 <strncmp+0x2c>
    17f0:	00054783          	lbu	a5,0(a0)
    17f4:	cf89                	beqz	a5,180e <strncmp+0x38>
    17f6:	85b2                	mv	a1,a2
    17f8:	0005c703          	lbu	a4,0(a1)
    17fc:	00158613          	add	a2,a1,1
    1800:	f37d                	bnez	a4,17e6 <strncmp+0x10>
        ;
    return *l - *r;
    1802:	0007851b          	sext.w	a0,a5
    1806:	9d19                	subw	a0,a0,a4
    1808:	8082                	ret
        return 0;
    180a:	4501                	li	a0,0
}
    180c:	8082                	ret
    return *l - *r;
    180e:	0015c703          	lbu	a4,1(a1)
    1812:	4501                	li	a0,0
    1814:	9d19                	subw	a0,a0,a4
    1816:	8082                	ret
    1818:	0005c703          	lbu	a4,0(a1)
    181c:	4501                	li	a0,0
    181e:	b7e5                	j	1806 <strncmp+0x30>

0000000000001820 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1820:	00757793          	and	a5,a0,7
    1824:	cf89                	beqz	a5,183e <strlen+0x1e>
    1826:	87aa                	mv	a5,a0
    1828:	a029                	j	1832 <strlen+0x12>
    182a:	0785                	add	a5,a5,1
    182c:	0077f713          	and	a4,a5,7
    1830:	cb01                	beqz	a4,1840 <strlen+0x20>
        if (!*s)
    1832:	0007c703          	lbu	a4,0(a5)
    1836:	fb75                	bnez	a4,182a <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1838:	40a78533          	sub	a0,a5,a0
}
    183c:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    183e:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1840:	feff05b7          	lui	a1,0xfeff0
    1844:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedfb7>
    1848:	f0101637          	lui	a2,0xf0101
    184c:	05c2                	sll	a1,a1,0x10
    184e:	0612                	sll	a2,a2,0x4
    1850:	6394                	ld	a3,0(a5)
    1852:	eff58593          	add	a1,a1,-257
    1856:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff1b9>
    185a:	05c2                	sll	a1,a1,0x10
    185c:	0642                	sll	a2,a2,0x10
    185e:	eff58593          	add	a1,a1,-257
    1862:	10160613          	add	a2,a2,257
    1866:	00b68733          	add	a4,a3,a1
    186a:	063e                	sll	a2,a2,0xf
    186c:	fff6c693          	not	a3,a3
    1870:	8f75                	and	a4,a4,a3
    1872:	08060613          	add	a2,a2,128
    1876:	8f71                	and	a4,a4,a2
    1878:	eb11                	bnez	a4,188c <strlen+0x6c>
    187a:	6794                	ld	a3,8(a5)
    187c:	07a1                	add	a5,a5,8
    187e:	00b68733          	add	a4,a3,a1
    1882:	fff6c693          	not	a3,a3
    1886:	8f75                	and	a4,a4,a3
    1888:	8f71                	and	a4,a4,a2
    188a:	db65                	beqz	a4,187a <strlen+0x5a>
    for (; *s; s++)
    188c:	0007c703          	lbu	a4,0(a5)
    1890:	d745                	beqz	a4,1838 <strlen+0x18>
    1892:	0017c703          	lbu	a4,1(a5)
    1896:	0785                	add	a5,a5,1
    1898:	d345                	beqz	a4,1838 <strlen+0x18>
    189a:	0017c703          	lbu	a4,1(a5)
    189e:	0785                	add	a5,a5,1
    18a0:	fb6d                	bnez	a4,1892 <strlen+0x72>
    18a2:	bf59                	j	1838 <strlen+0x18>

00000000000018a4 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18a4:	00757713          	and	a4,a0,7
{
    18a8:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18aa:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18ae:	cb19                	beqz	a4,18c4 <memchr+0x20>
    18b0:	ce59                	beqz	a2,194e <memchr+0xaa>
    18b2:	0007c703          	lbu	a4,0(a5)
    18b6:	00b70963          	beq	a4,a1,18c8 <memchr+0x24>
    18ba:	0785                	add	a5,a5,1
    18bc:	0077f713          	and	a4,a5,7
    18c0:	167d                	add	a2,a2,-1
    18c2:	f77d                	bnez	a4,18b0 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18c4:	4501                	li	a0,0
    if (n && *s != c)
    18c6:	c649                	beqz	a2,1950 <memchr+0xac>
    18c8:	0007c703          	lbu	a4,0(a5)
    18cc:	06b70663          	beq	a4,a1,1938 <memchr+0x94>
        size_t k = ONES * c;
    18d0:	01010737          	lui	a4,0x1010
    18d4:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e1b9>
    18d8:	0742                	sll	a4,a4,0x10
    18da:	10170713          	add	a4,a4,257
    18de:	0742                	sll	a4,a4,0x10
    18e0:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18e4:	469d                	li	a3,7
        size_t k = ONES * c;
    18e6:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18ea:	04c6f763          	bgeu	a3,a2,1938 <memchr+0x94>
    18ee:	f0101837          	lui	a6,0xf0101
    18f2:	feff08b7          	lui	a7,0xfeff0
    18f6:	0812                	sll	a6,a6,0x4
    18f8:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedfb7>
    18fc:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff1b9>
    1900:	08c2                	sll	a7,a7,0x10
    1902:	0842                	sll	a6,a6,0x10
    1904:	eff88893          	add	a7,a7,-257
    1908:	10180813          	add	a6,a6,257
    190c:	08c2                	sll	a7,a7,0x10
    190e:	083e                	sll	a6,a6,0xf
    1910:	eff88893          	add	a7,a7,-257
    1914:	08080813          	add	a6,a6,128
    1918:	431d                	li	t1,7
    191a:	a029                	j	1924 <memchr+0x80>
    191c:	1661                	add	a2,a2,-8
    191e:	07a1                	add	a5,a5,8
    1920:	02c37663          	bgeu	t1,a2,194c <memchr+0xa8>
    1924:	6398                	ld	a4,0(a5)
    1926:	8f29                	xor	a4,a4,a0
    1928:	011706b3          	add	a3,a4,a7
    192c:	fff74713          	not	a4,a4
    1930:	8f75                	and	a4,a4,a3
    1932:	01077733          	and	a4,a4,a6
    1936:	d37d                	beqz	a4,191c <memchr+0x78>
        s = (const void *)w;
    1938:	853e                	mv	a0,a5
    193a:	a019                	j	1940 <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    193c:	0505                	add	a0,a0,1
    193e:	ca01                	beqz	a2,194e <memchr+0xaa>
    1940:	00054783          	lbu	a5,0(a0)
    1944:	167d                	add	a2,a2,-1
    1946:	feb79be3          	bne	a5,a1,193c <memchr+0x98>
    194a:	8082                	ret
    194c:	f675                	bnez	a2,1938 <memchr+0x94>
    return n ? (void *)s : 0;
    194e:	4501                	li	a0,0
}
    1950:	8082                	ret

0000000000001952 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1952:	1101                	add	sp,sp,-32
    1954:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1956:	862e                	mv	a2,a1
{
    1958:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    195a:	4581                	li	a1,0
{
    195c:	e426                	sd	s1,8(sp)
    195e:	ec06                	sd	ra,24(sp)
    1960:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1962:	f43ff0ef          	jal	18a4 <memchr>
    return p ? p - s : n;
    1966:	c519                	beqz	a0,1974 <strnlen+0x22>
}
    1968:	60e2                	ld	ra,24(sp)
    196a:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    196c:	8d05                	sub	a0,a0,s1
}
    196e:	64a2                	ld	s1,8(sp)
    1970:	6105                	add	sp,sp,32
    1972:	8082                	ret
    1974:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1976:	8522                	mv	a0,s0
}
    1978:	6442                	ld	s0,16(sp)
    197a:	64a2                	ld	s1,8(sp)
    197c:	6105                	add	sp,sp,32
    197e:	8082                	ret

0000000000001980 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1980:	00b547b3          	xor	a5,a0,a1
    1984:	8b9d                	and	a5,a5,7
    1986:	efb1                	bnez	a5,19e2 <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1988:	0075f793          	and	a5,a1,7
    198c:	ebb5                	bnez	a5,1a00 <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    198e:	feff0637          	lui	a2,0xfeff0
    1992:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedfb7>
    1996:	f01016b7          	lui	a3,0xf0101
    199a:	0642                	sll	a2,a2,0x10
    199c:	0692                	sll	a3,a3,0x4
    199e:	6198                	ld	a4,0(a1)
    19a0:	eff60613          	add	a2,a2,-257
    19a4:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff1b9>
    19a8:	0642                	sll	a2,a2,0x10
    19aa:	06c2                	sll	a3,a3,0x10
    19ac:	eff60613          	add	a2,a2,-257
    19b0:	10168693          	add	a3,a3,257
    19b4:	00c707b3          	add	a5,a4,a2
    19b8:	fff74813          	not	a6,a4
    19bc:	06be                	sll	a3,a3,0xf
    19be:	0107f7b3          	and	a5,a5,a6
    19c2:	08068693          	add	a3,a3,128
    19c6:	8ff5                	and	a5,a5,a3
    19c8:	ef89                	bnez	a5,19e2 <strcpy+0x62>
    19ca:	05a1                	add	a1,a1,8
    19cc:	e118                	sd	a4,0(a0)
    19ce:	6198                	ld	a4,0(a1)
    19d0:	0521                	add	a0,a0,8
    19d2:	00c707b3          	add	a5,a4,a2
    19d6:	fff74813          	not	a6,a4
    19da:	0107f7b3          	and	a5,a5,a6
    19de:	8ff5                	and	a5,a5,a3
    19e0:	d7ed                	beqz	a5,19ca <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19e2:	0005c783          	lbu	a5,0(a1)
    19e6:	00f50023          	sb	a5,0(a0)
    19ea:	c785                	beqz	a5,1a12 <strcpy+0x92>
    19ec:	0015c783          	lbu	a5,1(a1)
    19f0:	0505                	add	a0,a0,1
    19f2:	0585                	add	a1,a1,1
    19f4:	00f50023          	sb	a5,0(a0)
    19f8:	fbf5                	bnez	a5,19ec <strcpy+0x6c>
        ;
    return d;
}
    19fa:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19fc:	0505                	add	a0,a0,1
    19fe:	db41                	beqz	a4,198e <strcpy+0xe>
            if (!(*d = *s))
    1a00:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a04:	0585                	add	a1,a1,1
    1a06:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a0a:	00f50023          	sb	a5,0(a0)
    1a0e:	f7fd                	bnez	a5,19fc <strcpy+0x7c>
}
    1a10:	8082                	ret
    1a12:	8082                	ret

0000000000001a14 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a14:	00b547b3          	xor	a5,a0,a1
    1a18:	8b9d                	and	a5,a5,7
    1a1a:	efbd                	bnez	a5,1a98 <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a1c:	0075f793          	and	a5,a1,7
    1a20:	1c078563          	beqz	a5,1bea <strncpy+0x1d6>
    1a24:	ea11                	bnez	a2,1a38 <strncpy+0x24>
    1a26:	8082                	ret
    1a28:	0585                	add	a1,a1,1
    1a2a:	0075f793          	and	a5,a1,7
    1a2e:	167d                	add	a2,a2,-1
    1a30:	0505                	add	a0,a0,1
    1a32:	1a078c63          	beqz	a5,1bea <strncpy+0x1d6>
    1a36:	ca3d                	beqz	a2,1aac <strncpy+0x98>
    1a38:	0005c783          	lbu	a5,0(a1)
    1a3c:	00f50023          	sb	a5,0(a0)
    1a40:	f7e5                	bnez	a5,1a28 <strncpy+0x14>
            ;
        if (!n || !*s)
    1a42:	0005c783          	lbu	a5,0(a1)
    1a46:	c7a5                	beqz	a5,1aae <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a48:	479d                	li	a5,7
    1a4a:	04c7f863          	bgeu	a5,a2,1a9a <strncpy+0x86>
    1a4e:	f01016b7          	lui	a3,0xf0101
    1a52:	feff0837          	lui	a6,0xfeff0
    1a56:	0692                	sll	a3,a3,0x4
    1a58:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedfb7>
    1a5c:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff1b9>
    1a60:	0842                	sll	a6,a6,0x10
    1a62:	06c2                	sll	a3,a3,0x10
    1a64:	eff80813          	add	a6,a6,-257
    1a68:	10168693          	add	a3,a3,257
    1a6c:	0842                	sll	a6,a6,0x10
    1a6e:	06be                	sll	a3,a3,0xf
    1a70:	eff80813          	add	a6,a6,-257
    1a74:	08068693          	add	a3,a3,128
    1a78:	431d                	li	t1,7
    1a7a:	6198                	ld	a4,0(a1)
    1a7c:	010707b3          	add	a5,a4,a6
    1a80:	fff74893          	not	a7,a4
    1a84:	0117f7b3          	and	a5,a5,a7
    1a88:	8ff5                	and	a5,a5,a3
    1a8a:	eb81                	bnez	a5,1a9a <strncpy+0x86>
            *wd = *ws;
    1a8c:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a8e:	1661                	add	a2,a2,-8
    1a90:	05a1                	add	a1,a1,8
    1a92:	0521                	add	a0,a0,8
    1a94:	fec363e3          	bltu	t1,a2,1a7a <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1a98:	ca11                	beqz	a2,1aac <strncpy+0x98>
    1a9a:	0005c783          	lbu	a5,0(a1)
    1a9e:	0585                	add	a1,a1,1
    1aa0:	00f50023          	sb	a5,0(a0)
    1aa4:	c789                	beqz	a5,1aae <strncpy+0x9a>
    1aa6:	167d                	add	a2,a2,-1
    1aa8:	0505                	add	a0,a0,1
    1aaa:	fa65                	bnez	a2,1a9a <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1aac:	8082                	ret
    1aae:	40a00733          	neg	a4,a0
    1ab2:	00777793          	and	a5,a4,7
    1ab6:	00778693          	add	a3,a5,7
    1aba:	482d                	li	a6,11
    1abc:	fff60593          	add	a1,a2,-1
    1ac0:	1106ef63          	bltu	a3,a6,1bde <strncpy+0x1ca>
    1ac4:	12d5ee63          	bltu	a1,a3,1c00 <strncpy+0x1ec>
    1ac8:	12078563          	beqz	a5,1bf2 <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1acc:	00050023          	sb	zero,0(a0)
    1ad0:	00677693          	and	a3,a4,6
    1ad4:	12068263          	beqz	a3,1bf8 <strncpy+0x1e4>
    1ad8:	000500a3          	sb	zero,1(a0)
    1adc:	4689                	li	a3,2
    1ade:	12f6f463          	bgeu	a3,a5,1c06 <strncpy+0x1f2>
    1ae2:	00050123          	sb	zero,2(a0)
    1ae6:	8b11                	and	a4,a4,4
    1ae8:	cf6d                	beqz	a4,1be2 <strncpy+0x1ce>
    1aea:	000501a3          	sb	zero,3(a0)
    1aee:	4711                	li	a4,4
    1af0:	00450693          	add	a3,a0,4
    1af4:	02f77363          	bgeu	a4,a5,1b1a <strncpy+0x106>
    1af8:	00050223          	sb	zero,4(a0)
    1afc:	4715                	li	a4,5
    1afe:	00550693          	add	a3,a0,5
    1b02:	00e78c63          	beq	a5,a4,1b1a <strncpy+0x106>
    1b06:	000502a3          	sb	zero,5(a0)
    1b0a:	471d                	li	a4,7
    1b0c:	10e79163          	bne	a5,a4,1c0e <strncpy+0x1fa>
    1b10:	00750693          	add	a3,a0,7
    1b14:	00050323          	sb	zero,6(a0)
    1b18:	471d                	li	a4,7
    1b1a:	40f608b3          	sub	a7,a2,a5
    1b1e:	ff88f813          	and	a6,a7,-8
    1b22:	97aa                	add	a5,a5,a0
    1b24:	010785b3          	add	a1,a5,a6
    1b28:	0007b023          	sd	zero,0(a5)
    1b2c:	07a1                	add	a5,a5,8
    1b2e:	feb79de3          	bne	a5,a1,1b28 <strncpy+0x114>
    1b32:	00e807bb          	addw	a5,a6,a4
    1b36:	01068733          	add	a4,a3,a6
    1b3a:	0b088b63          	beq	a7,a6,1bf0 <strncpy+0x1dc>
    1b3e:	00070023          	sb	zero,0(a4)
    1b42:	0017869b          	addw	a3,a5,1
    1b46:	f6c6f3e3          	bgeu	a3,a2,1aac <strncpy+0x98>
    1b4a:	000700a3          	sb	zero,1(a4)
    1b4e:	0027869b          	addw	a3,a5,2
    1b52:	f4c6fde3          	bgeu	a3,a2,1aac <strncpy+0x98>
    1b56:	00070123          	sb	zero,2(a4)
    1b5a:	0037869b          	addw	a3,a5,3
    1b5e:	f4c6f7e3          	bgeu	a3,a2,1aac <strncpy+0x98>
    1b62:	000701a3          	sb	zero,3(a4)
    1b66:	0047869b          	addw	a3,a5,4
    1b6a:	f4c6f1e3          	bgeu	a3,a2,1aac <strncpy+0x98>
    1b6e:	00070223          	sb	zero,4(a4)
    1b72:	0057869b          	addw	a3,a5,5
    1b76:	f2c6fbe3          	bgeu	a3,a2,1aac <strncpy+0x98>
    1b7a:	000702a3          	sb	zero,5(a4)
    1b7e:	0067869b          	addw	a3,a5,6
    1b82:	f2c6f5e3          	bgeu	a3,a2,1aac <strncpy+0x98>
    1b86:	00070323          	sb	zero,6(a4)
    1b8a:	0077869b          	addw	a3,a5,7
    1b8e:	f0c6ffe3          	bgeu	a3,a2,1aac <strncpy+0x98>
    1b92:	000703a3          	sb	zero,7(a4)
    1b96:	0087869b          	addw	a3,a5,8
    1b9a:	f0c6f9e3          	bgeu	a3,a2,1aac <strncpy+0x98>
    1b9e:	00070423          	sb	zero,8(a4)
    1ba2:	0097869b          	addw	a3,a5,9
    1ba6:	f0c6f3e3          	bgeu	a3,a2,1aac <strncpy+0x98>
    1baa:	000704a3          	sb	zero,9(a4)
    1bae:	00a7869b          	addw	a3,a5,10
    1bb2:	eec6fde3          	bgeu	a3,a2,1aac <strncpy+0x98>
    1bb6:	00070523          	sb	zero,10(a4)
    1bba:	00b7869b          	addw	a3,a5,11
    1bbe:	eec6f7e3          	bgeu	a3,a2,1aac <strncpy+0x98>
    1bc2:	000705a3          	sb	zero,11(a4)
    1bc6:	00c7869b          	addw	a3,a5,12
    1bca:	eec6f1e3          	bgeu	a3,a2,1aac <strncpy+0x98>
    1bce:	00070623          	sb	zero,12(a4)
    1bd2:	27b5                	addw	a5,a5,13
    1bd4:	ecc7fce3          	bgeu	a5,a2,1aac <strncpy+0x98>
    1bd8:	000706a3          	sb	zero,13(a4)
}
    1bdc:	8082                	ret
    1bde:	46ad                	li	a3,11
    1be0:	b5d5                	j	1ac4 <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1be2:	00350693          	add	a3,a0,3
    1be6:	470d                	li	a4,3
    1be8:	bf0d                	j	1b1a <strncpy+0x106>
        if (!n || !*s)
    1bea:	e4061ce3          	bnez	a2,1a42 <strncpy+0x2e>
}
    1bee:	8082                	ret
    1bf0:	8082                	ret
    char *p = dest;
    1bf2:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bf4:	4701                	li	a4,0
    1bf6:	b715                	j	1b1a <strncpy+0x106>
    1bf8:	00150693          	add	a3,a0,1
    1bfc:	4705                	li	a4,1
    1bfe:	bf31                	j	1b1a <strncpy+0x106>
    char *p = dest;
    1c00:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c02:	4781                	li	a5,0
    1c04:	bf2d                	j	1b3e <strncpy+0x12a>
    1c06:	00250693          	add	a3,a0,2
    1c0a:	4709                	li	a4,2
    1c0c:	b739                	j	1b1a <strncpy+0x106>
    1c0e:	00650693          	add	a3,a0,6
    1c12:	4719                	li	a4,6
    1c14:	b719                	j	1b1a <strncpy+0x106>

0000000000001c16 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c16:	87aa                	mv	a5,a0
    1c18:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c1a:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c1e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c22:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c24:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c26:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c2a:	2501                	sext.w	a0,a0
    1c2c:	8082                	ret

0000000000001c2e <openat>:
    register long a7 __asm__("a7") = n;
    1c2e:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c32:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c36:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c3a:	2501                	sext.w	a0,a0
    1c3c:	8082                	ret

0000000000001c3e <fcntl>:
    register long a7 __asm__("a7") = n;
    1c3e:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c40:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1c44:	2501                	sext.w	a0,a0
    1c46:	8082                	ret

0000000000001c48 <close>:
    register long a7 __asm__("a7") = n;
    1c48:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c4c:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c50:	2501                	sext.w	a0,a0
    1c52:	8082                	ret

0000000000001c54 <read>:
    register long a7 __asm__("a7") = n;
    1c54:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c58:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c5c:	8082                	ret

0000000000001c5e <write>:
    register long a7 __asm__("a7") = n;
    1c5e:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c62:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c66:	8082                	ret

0000000000001c68 <getpid>:
    register long a7 __asm__("a7") = n;
    1c68:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c6c:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c70:	2501                	sext.w	a0,a0
    1c72:	8082                	ret

0000000000001c74 <getppid>:
    register long a7 __asm__("a7") = n;
    1c74:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c78:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c7c:	2501                	sext.w	a0,a0
    1c7e:	8082                	ret

0000000000001c80 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c80:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c84:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c88:	2501                	sext.w	a0,a0
    1c8a:	8082                	ret

0000000000001c8c <fork>:
    register long a7 __asm__("a7") = n;
    1c8c:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c90:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c92:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c94:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c98:	2501                	sext.w	a0,a0
    1c9a:	8082                	ret

0000000000001c9c <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c9c:	85b2                	mv	a1,a2
    1c9e:	863a                	mv	a2,a4
    if (stack)
    1ca0:	c191                	beqz	a1,1ca4 <clone+0x8>
	stack += stack_size;
    1ca2:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1ca4:	4781                	li	a5,0
    1ca6:	4701                	li	a4,0
    1ca8:	4681                	li	a3,0
    1caa:	2601                	sext.w	a2,a2
    1cac:	a2ed                	j	1e96 <__clone>

0000000000001cae <exit>:
    register long a7 __asm__("a7") = n;
    1cae:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cb2:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cb6:	8082                	ret

0000000000001cb8 <waitpid>:
    register long a7 __asm__("a7") = n;
    1cb8:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cbc:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cbe:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cc2:	2501                	sext.w	a0,a0
    1cc4:	8082                	ret

0000000000001cc6 <exec>:
    register long a7 __asm__("a7") = n;
    1cc6:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cca:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cce:	2501                	sext.w	a0,a0
    1cd0:	8082                	ret

0000000000001cd2 <execve>:
    register long a7 __asm__("a7") = n;
    1cd2:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cd6:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cda:	2501                	sext.w	a0,a0
    1cdc:	8082                	ret

0000000000001cde <times>:
    register long a7 __asm__("a7") = n;
    1cde:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1ce2:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1ce6:	2501                	sext.w	a0,a0
    1ce8:	8082                	ret

0000000000001cea <get_time>:

int64 get_time()
{
    1cea:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1cec:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1cf0:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1cf2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cf4:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1cf8:	2501                	sext.w	a0,a0
    1cfa:	ed09                	bnez	a0,1d14 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1cfc:	67a2                	ld	a5,8(sp)
    1cfe:	3e800713          	li	a4,1000
    1d02:	00015503          	lhu	a0,0(sp)
    1d06:	02e7d7b3          	divu	a5,a5,a4
    1d0a:	02e50533          	mul	a0,a0,a4
    1d0e:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d10:	0141                	add	sp,sp,16
    1d12:	8082                	ret
        return -1;
    1d14:	557d                	li	a0,-1
    1d16:	bfed                	j	1d10 <get_time+0x26>

0000000000001d18 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d18:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d1c:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d20:	2501                	sext.w	a0,a0
    1d22:	8082                	ret

0000000000001d24 <time>:
    register long a7 __asm__("a7") = n;
    1d24:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d28:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d2c:	2501                	sext.w	a0,a0
    1d2e:	8082                	ret

0000000000001d30 <sleep>:

int sleep(unsigned long long time)
{
    1d30:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d32:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d34:	850a                	mv	a0,sp
    1d36:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d38:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d3c:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d3e:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d42:	e501                	bnez	a0,1d4a <sleep+0x1a>
    return 0;
    1d44:	4501                	li	a0,0
}
    1d46:	0141                	add	sp,sp,16
    1d48:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d4a:	4502                	lw	a0,0(sp)
}
    1d4c:	0141                	add	sp,sp,16
    1d4e:	8082                	ret

0000000000001d50 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d50:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d54:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d58:	2501                	sext.w	a0,a0
    1d5a:	8082                	ret

0000000000001d5c <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d5c:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d60:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d64:	8082                	ret

0000000000001d66 <munmap>:
    register long a7 __asm__("a7") = n;
    1d66:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d6a:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d6e:	2501                	sext.w	a0,a0
    1d70:	8082                	ret

0000000000001d72 <wait>:

int wait(int *code)
{
    1d72:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d74:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d78:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d7a:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d7c:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d7e:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d82:	2501                	sext.w	a0,a0
    1d84:	8082                	ret

0000000000001d86 <spawn>:
    register long a7 __asm__("a7") = n;
    1d86:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d8a:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d8e:	2501                	sext.w	a0,a0
    1d90:	8082                	ret

0000000000001d92 <mailread>:
    register long a7 __asm__("a7") = n;
    1d92:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d96:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d9a:	2501                	sext.w	a0,a0
    1d9c:	8082                	ret

0000000000001d9e <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d9e:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da2:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1da6:	2501                	sext.w	a0,a0
    1da8:	8082                	ret

0000000000001daa <fstat>:
    register long a7 __asm__("a7") = n;
    1daa:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dae:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1db2:	2501                	sext.w	a0,a0
    1db4:	8082                	ret

0000000000001db6 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1db6:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1db8:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dbc:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dbe:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1dc2:	2501                	sext.w	a0,a0
    1dc4:	8082                	ret

0000000000001dc6 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1dc6:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dc8:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1dcc:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dce:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1dd2:	2501                	sext.w	a0,a0
    1dd4:	8082                	ret

0000000000001dd6 <link>:

int link(char *old_path, char *new_path)
{
    1dd6:	87aa                	mv	a5,a0
    1dd8:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1dda:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1dde:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1de2:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1de4:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1de8:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dea:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1dee:	2501                	sext.w	a0,a0
    1df0:	8082                	ret

0000000000001df2 <unlink>:

int unlink(char *path)
{
    1df2:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1df4:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1df8:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1dfc:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dfe:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e02:	2501                	sext.w	a0,a0
    1e04:	8082                	ret

0000000000001e06 <uname>:
    register long a7 __asm__("a7") = n;
    1e06:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e0a:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e0e:	2501                	sext.w	a0,a0
    1e10:	8082                	ret

0000000000001e12 <brk>:
    register long a7 __asm__("a7") = n;
    1e12:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e16:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e1a:	2501                	sext.w	a0,a0
    1e1c:	8082                	ret

0000000000001e1e <getcwd>:
    register long a7 __asm__("a7") = n;
    1e1e:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e20:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e24:	8082                	ret

0000000000001e26 <chdir>:
    register long a7 __asm__("a7") = n;
    1e26:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e2a:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e2e:	2501                	sext.w	a0,a0
    1e30:	8082                	ret

0000000000001e32 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e32:	862e                	mv	a2,a1
    1e34:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e36:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e38:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e3c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e40:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e42:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e44:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e48:	2501                	sext.w	a0,a0
    1e4a:	8082                	ret

0000000000001e4c <getdents>:
    register long a7 __asm__("a7") = n;
    1e4c:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e50:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e54:	2501                	sext.w	a0,a0
    1e56:	8082                	ret

0000000000001e58 <pipe>:
    register long a7 __asm__("a7") = n;
    1e58:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e5c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5e:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e62:	2501                	sext.w	a0,a0
    1e64:	8082                	ret

0000000000001e66 <dup>:
    register long a7 __asm__("a7") = n;
    1e66:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e68:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e6c:	2501                	sext.w	a0,a0
    1e6e:	8082                	ret

0000000000001e70 <dup2>:
    register long a7 __asm__("a7") = n;
    1e70:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e72:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e74:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e78:	2501                	sext.w	a0,a0
    1e7a:	8082                	ret

0000000000001e7c <mount>:
    register long a7 __asm__("a7") = n;
    1e7c:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e80:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e84:	2501                	sext.w	a0,a0
    1e86:	8082                	ret

0000000000001e88 <umount>:
    register long a7 __asm__("a7") = n;
    1e88:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e8c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e8e:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e92:	2501                	sext.w	a0,a0
    1e94:	8082                	ret

0000000000001e96 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e96:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1e98:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e9a:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e9c:	8532                	mv	a0,a2
	mv a2, a4
    1e9e:	863a                	mv	a2,a4
	mv a3, a5
    1ea0:	86be                	mv	a3,a5
	mv a4, a6
    1ea2:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ea4:	0dc00893          	li	a7,220
	ecall
    1ea8:	00000073          	ecall

	beqz a0, 1f
    1eac:	c111                	beqz	a0,1eb0 <__clone+0x1a>
	# Parent
	ret
    1eae:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1eb0:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1eb2:	6522                	ld	a0,8(sp)
	jalr a1
    1eb4:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1eb6:	05d00893          	li	a7,93
	ecall
    1eba:	00000073          	ecall
