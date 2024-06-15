
/root/oskernel2024-trustos/pre_ctests/build/riscv64/sleep:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a8c9                	j	10d4 <__start_main>

0000000000001004 <test_sleep>:
 * 测试通过时的输出：
 * "sleep success."
 * 测试失败时的输出：
 * "sleep error."
 */
void test_sleep() {
    1004:	1101                	add	sp,sp,-32
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f1a50513          	add	a0,a0,-230 # 1f20 <__clone+0x2a>
void test_sleep() {
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
    1012:	e426                	sd	s1,8(sp)
	TEST_START(__func__);
    1014:	2f8000ef          	jal	130c <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	f8850513          	add	a0,a0,-120 # 1fa0 <__func__.0>
    1020:	2ec000ef          	jal	130c <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	f1450513          	add	a0,a0,-236 # 1f38 <__clone+0x42>
    102c:	2e0000ef          	jal	130c <puts>

	int time1 = get_time();
    1030:	51b000ef          	jal	1d4a <get_time>
    1034:	0005041b          	sext.w	s0,a0
	assert(time1 >= 0);
    1038:	06044f63          	bltz	s0,10b6 <test_sleep+0xb2>
	int ret = sleep(1);
    103c:	4505                	li	a0,1
    103e:	553000ef          	jal	1d90 <sleep>
	assert(ret == 0);
    1042:	e13d                	bnez	a0,10a8 <test_sleep+0xa4>
	int time2 = get_time();
    1044:	507000ef          	jal	1d4a <get_time>
    1048:	0005049b          	sext.w	s1,a0
	assert(time2 >= 0);
    104c:	0204cf63          	bltz	s1,108a <test_sleep+0x86>

	if(time2 - time1 >= 1){	
    1050:	04945563          	bge	s0,s1,109a <test_sleep+0x96>
		printf("sleep success.\n");
    1054:	00001517          	auipc	a0,0x1
    1058:	f1450513          	add	a0,a0,-236 # 1f68 <__clone+0x72>
    105c:	2d2000ef          	jal	132e <printf>
	}else{
		printf("sleep error.\n");
	}
	TEST_END(__func__);
    1060:	00001517          	auipc	a0,0x1
    1064:	f2850513          	add	a0,a0,-216 # 1f88 <__clone+0x92>
    1068:	2a4000ef          	jal	130c <puts>
    106c:	00001517          	auipc	a0,0x1
    1070:	f3450513          	add	a0,a0,-204 # 1fa0 <__func__.0>
    1074:	298000ef          	jal	130c <puts>
}
    1078:	6442                	ld	s0,16(sp)
    107a:	60e2                	ld	ra,24(sp)
    107c:	64a2                	ld	s1,8(sp)
	TEST_END(__func__);
    107e:	00001517          	auipc	a0,0x1
    1082:	eba50513          	add	a0,a0,-326 # 1f38 <__clone+0x42>
}
    1086:	6105                	add	sp,sp,32
	TEST_END(__func__);
    1088:	a451                	j	130c <puts>
	assert(time2 >= 0);
    108a:	00001517          	auipc	a0,0x1
    108e:	ebe50513          	add	a0,a0,-322 # 1f48 <__clone+0x52>
    1092:	51a000ef          	jal	15ac <panic>
	if(time2 - time1 >= 1){	
    1096:	fa944fe3          	blt	s0,s1,1054 <test_sleep+0x50>
		printf("sleep error.\n");
    109a:	00001517          	auipc	a0,0x1
    109e:	ede50513          	add	a0,a0,-290 # 1f78 <__clone+0x82>
    10a2:	28c000ef          	jal	132e <printf>
    10a6:	bf6d                	j	1060 <test_sleep+0x5c>
	assert(ret == 0);
    10a8:	00001517          	auipc	a0,0x1
    10ac:	ea050513          	add	a0,a0,-352 # 1f48 <__clone+0x52>
    10b0:	4fc000ef          	jal	15ac <panic>
    10b4:	bf41                	j	1044 <test_sleep+0x40>
	assert(time1 >= 0);
    10b6:	00001517          	auipc	a0,0x1
    10ba:	e9250513          	add	a0,a0,-366 # 1f48 <__clone+0x52>
    10be:	4ee000ef          	jal	15ac <panic>
    10c2:	bfad                	j	103c <test_sleep+0x38>

00000000000010c4 <main>:

int main(void) {
    10c4:	1141                	add	sp,sp,-16
    10c6:	e406                	sd	ra,8(sp)
	test_sleep();
    10c8:	f3dff0ef          	jal	1004 <test_sleep>
	return 0;
}
    10cc:	60a2                	ld	ra,8(sp)
    10ce:	4501                	li	a0,0
    10d0:	0141                	add	sp,sp,16
    10d2:	8082                	ret

00000000000010d4 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10d4:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10d6:	4108                	lw	a0,0(a0)
{
    10d8:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10da:	05a1                	add	a1,a1,8
{
    10dc:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10de:	fe7ff0ef          	jal	10c4 <main>
    10e2:	42d000ef          	jal	1d0e <exit>
	return 0;
}
    10e6:	60a2                	ld	ra,8(sp)
    10e8:	4501                	li	a0,0
    10ea:	0141                	add	sp,sp,16
    10ec:	8082                	ret

00000000000010ee <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10ee:	7179                	add	sp,sp,-48
    10f0:	f406                	sd	ra,40(sp)
    10f2:	0005081b          	sext.w	a6,a0
    10f6:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10f8:	00055563          	bgez	a0,1102 <printint.constprop.0+0x14>
        x = -xx;
    10fc:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    1100:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1102:	02b8763b          	remuw	a2,a6,a1
    1106:	00001697          	auipc	a3,0x1
    110a:	eaa68693          	add	a3,a3,-342 # 1fb0 <digits>
    buf[16] = 0;
    110e:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1112:	0005871b          	sext.w	a4,a1
    1116:	1602                	sll	a2,a2,0x20
    1118:	9201                	srl	a2,a2,0x20
    111a:	9636                	add	a2,a2,a3
    111c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1120:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    1124:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1128:	10b86c63          	bltu	a6,a1,1240 <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    112c:	02e5763b          	remuw	a2,a0,a4
    1130:	1602                	sll	a2,a2,0x20
    1132:	9201                	srl	a2,a2,0x20
    1134:	9636                	add	a2,a2,a3
    1136:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    113a:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    113e:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1142:	10e56863          	bltu	a0,a4,1252 <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    1146:	02e5f63b          	remuw	a2,a1,a4
    114a:	1602                	sll	a2,a2,0x20
    114c:	9201                	srl	a2,a2,0x20
    114e:	9636                	add	a2,a2,a3
    1150:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1154:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1158:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    115c:	10e5e463          	bltu	a1,a4,1264 <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    1160:	02e5763b          	remuw	a2,a0,a4
    1164:	1602                	sll	a2,a2,0x20
    1166:	9201                	srl	a2,a2,0x20
    1168:	9636                	add	a2,a2,a3
    116a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    116e:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1172:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1176:	10e56063          	bltu	a0,a4,1276 <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    117a:	02e5f63b          	remuw	a2,a1,a4
    117e:	1602                	sll	a2,a2,0x20
    1180:	9201                	srl	a2,a2,0x20
    1182:	9636                	add	a2,a2,a3
    1184:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1188:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    118c:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1190:	0ee5ec63          	bltu	a1,a4,1288 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    1194:	02e5763b          	remuw	a2,a0,a4
    1198:	1602                	sll	a2,a2,0x20
    119a:	9201                	srl	a2,a2,0x20
    119c:	9636                	add	a2,a2,a3
    119e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a2:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11a6:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11aa:	08e56263          	bltu	a0,a4,122e <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    11ae:	02e5f63b          	remuw	a2,a1,a4
    11b2:	1602                	sll	a2,a2,0x20
    11b4:	9201                	srl	a2,a2,0x20
    11b6:	9636                	add	a2,a2,a3
    11b8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11bc:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11c0:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11c4:	0ce5eb63          	bltu	a1,a4,129a <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    11c8:	02e5763b          	remuw	a2,a0,a4
    11cc:	1602                	sll	a2,a2,0x20
    11ce:	9201                	srl	a2,a2,0x20
    11d0:	9636                	add	a2,a2,a3
    11d2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11d6:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11da:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11de:	0ce56763          	bltu	a0,a4,12ac <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    11e2:	02e5f63b          	remuw	a2,a1,a4
    11e6:	1602                	sll	a2,a2,0x20
    11e8:	9201                	srl	a2,a2,0x20
    11ea:	9636                	add	a2,a2,a3
    11ec:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11f0:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11f4:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11f8:	0ce5e363          	bltu	a1,a4,12be <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    11fc:	1782                	sll	a5,a5,0x20
    11fe:	9381                	srl	a5,a5,0x20
    1200:	96be                	add	a3,a3,a5
    1202:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    1206:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    1208:	00f10723          	sb	a5,14(sp)
    if (sign)
    120c:	00088763          	beqz	a7,121a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1210:	02d00793          	li	a5,45
    1214:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1218:	4595                	li	a1,5
    write(f, s, l);
    121a:	003c                	add	a5,sp,8
    121c:	4641                	li	a2,16
    121e:	9e0d                	subw	a2,a2,a1
    1220:	4505                	li	a0,1
    1222:	95be                	add	a1,a1,a5
    1224:	29b000ef          	jal	1cbe <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1228:	70a2                	ld	ra,40(sp)
    122a:	6145                	add	sp,sp,48
    122c:	8082                	ret
    i++;
    122e:	45a9                	li	a1,10
    if (sign)
    1230:	fe0885e3          	beqz	a7,121a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1234:	02d00793          	li	a5,45
    1238:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    123c:	45a5                	li	a1,9
    123e:	bff1                	j	121a <printint.constprop.0+0x12c>
    i++;
    1240:	45bd                	li	a1,15
    if (sign)
    1242:	fc088ce3          	beqz	a7,121a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1246:	02d00793          	li	a5,45
    124a:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    124e:	45b9                	li	a1,14
    1250:	b7e9                	j	121a <printint.constprop.0+0x12c>
    i++;
    1252:	45b9                	li	a1,14
    if (sign)
    1254:	fc0883e3          	beqz	a7,121a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1258:	02d00793          	li	a5,45
    125c:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1260:	45b5                	li	a1,13
    1262:	bf65                	j	121a <printint.constprop.0+0x12c>
    i++;
    1264:	45b5                	li	a1,13
    if (sign)
    1266:	fa088ae3          	beqz	a7,121a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    126a:	02d00793          	li	a5,45
    126e:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1272:	45b1                	li	a1,12
    1274:	b75d                	j	121a <printint.constprop.0+0x12c>
    i++;
    1276:	45b1                	li	a1,12
    if (sign)
    1278:	fa0881e3          	beqz	a7,121a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    127c:	02d00793          	li	a5,45
    1280:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1284:	45ad                	li	a1,11
    1286:	bf51                	j	121a <printint.constprop.0+0x12c>
    i++;
    1288:	45ad                	li	a1,11
    if (sign)
    128a:	f80888e3          	beqz	a7,121a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    128e:	02d00793          	li	a5,45
    1292:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1296:	45a9                	li	a1,10
    1298:	b749                	j	121a <printint.constprop.0+0x12c>
    i++;
    129a:	45a5                	li	a1,9
    if (sign)
    129c:	f6088fe3          	beqz	a7,121a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12a0:	02d00793          	li	a5,45
    12a4:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12a8:	45a1                	li	a1,8
    12aa:	bf85                	j	121a <printint.constprop.0+0x12c>
    i++;
    12ac:	45a1                	li	a1,8
    if (sign)
    12ae:	f60886e3          	beqz	a7,121a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12b2:	02d00793          	li	a5,45
    12b6:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12ba:	459d                	li	a1,7
    12bc:	bfb9                	j	121a <printint.constprop.0+0x12c>
    i++;
    12be:	459d                	li	a1,7
    if (sign)
    12c0:	f4088de3          	beqz	a7,121a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12c4:	02d00793          	li	a5,45
    12c8:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12cc:	4599                	li	a1,6
    12ce:	b7b1                	j	121a <printint.constprop.0+0x12c>

00000000000012d0 <getchar>:
{
    12d0:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12d2:	00f10593          	add	a1,sp,15
    12d6:	4605                	li	a2,1
    12d8:	4501                	li	a0,0
{
    12da:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12dc:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12e0:	1d5000ef          	jal	1cb4 <read>
}
    12e4:	60e2                	ld	ra,24(sp)
    12e6:	00f14503          	lbu	a0,15(sp)
    12ea:	6105                	add	sp,sp,32
    12ec:	8082                	ret

00000000000012ee <putchar>:
{
    12ee:	1101                	add	sp,sp,-32
    12f0:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12f2:	00f10593          	add	a1,sp,15
    12f6:	4605                	li	a2,1
    12f8:	4505                	li	a0,1
{
    12fa:	ec06                	sd	ra,24(sp)
    char byte = c;
    12fc:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1300:	1bf000ef          	jal	1cbe <write>
}
    1304:	60e2                	ld	ra,24(sp)
    1306:	2501                	sext.w	a0,a0
    1308:	6105                	add	sp,sp,32
    130a:	8082                	ret

000000000000130c <puts>:
{
    130c:	1141                	add	sp,sp,-16
    130e:	e406                	sd	ra,8(sp)
    1310:	e022                	sd	s0,0(sp)
    1312:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1314:	56c000ef          	jal	1880 <strlen>
    1318:	862a                	mv	a2,a0
    131a:	85a2                	mv	a1,s0
    131c:	4505                	li	a0,1
    131e:	1a1000ef          	jal	1cbe <write>
}
    1322:	60a2                	ld	ra,8(sp)
    1324:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1326:	957d                	sra	a0,a0,0x3f
    return r;
    1328:	2501                	sext.w	a0,a0
}
    132a:	0141                	add	sp,sp,16
    132c:	8082                	ret

000000000000132e <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    132e:	7131                	add	sp,sp,-192
    1330:	e4d6                	sd	s5,72(sp)
    1332:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    1334:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1336:	013c                	add	a5,sp,136
{
    1338:	f0ca                	sd	s2,96(sp)
    133a:	ecce                	sd	s3,88(sp)
    133c:	e8d2                	sd	s4,80(sp)
    133e:	e0da                	sd	s6,64(sp)
    1340:	fc5e                	sd	s7,56(sp)
    1342:	fc86                	sd	ra,120(sp)
    1344:	f8a2                	sd	s0,112(sp)
    1346:	f4a6                	sd	s1,104(sp)
    1348:	e52e                	sd	a1,136(sp)
    134a:	e932                	sd	a2,144(sp)
    134c:	ed36                	sd	a3,152(sp)
    134e:	f13a                	sd	a4,160(sp)
    1350:	f942                	sd	a6,176(sp)
    1352:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1354:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1356:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    135a:	07300a13          	li	s4,115
    135e:	07800b93          	li	s7,120
    1362:	06400b13          	li	s6,100
    buf[i++] = '0';
    1366:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x5880>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    136a:	00001997          	auipc	s3,0x1
    136e:	c4698993          	add	s3,s3,-954 # 1fb0 <digits>
        if (!*s)
    1372:	00054783          	lbu	a5,0(a0)
    1376:	16078863          	beqz	a5,14e6 <printf+0x1b8>
    137a:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    137c:	19278063          	beq	a5,s2,14fc <printf+0x1ce>
    1380:	00164783          	lbu	a5,1(a2)
    1384:	0605                	add	a2,a2,1
    1386:	fbfd                	bnez	a5,137c <printf+0x4e>
    1388:	84b2                	mv	s1,a2
        l = z - a;
    138a:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    138e:	85aa                	mv	a1,a0
    1390:	8622                	mv	a2,s0
    1392:	4505                	li	a0,1
    1394:	12b000ef          	jal	1cbe <write>
        if (l)
    1398:	18041763          	bnez	s0,1526 <printf+0x1f8>
        if (s[1] == 0)
    139c:	0014c783          	lbu	a5,1(s1)
    13a0:	14078363          	beqz	a5,14e6 <printf+0x1b8>
        switch (s[1])
    13a4:	19478f63          	beq	a5,s4,1542 <printf+0x214>
    13a8:	18fa6163          	bltu	s4,a5,152a <printf+0x1fc>
    13ac:	1b678e63          	beq	a5,s6,1568 <printf+0x23a>
    13b0:	07000713          	li	a4,112
    13b4:	1ce79463          	bne	a5,a4,157c <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13b8:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13ba:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13be:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13c0:	631c                	ld	a5,0(a4)
    13c2:	0721                	add	a4,a4,8
    13c4:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13c6:	00479293          	sll	t0,a5,0x4
    13ca:	00879f93          	sll	t6,a5,0x8
    13ce:	00c79f13          	sll	t5,a5,0xc
    13d2:	01079e93          	sll	t4,a5,0x10
    13d6:	01479e13          	sll	t3,a5,0x14
    13da:	01879313          	sll	t1,a5,0x18
    13de:	01c79893          	sll	a7,a5,0x1c
    13e2:	02479813          	sll	a6,a5,0x24
    13e6:	02879513          	sll	a0,a5,0x28
    13ea:	02c79593          	sll	a1,a5,0x2c
    13ee:	03079693          	sll	a3,a5,0x30
    13f2:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13f6:	03c7d413          	srl	s0,a5,0x3c
    13fa:	01c7d39b          	srlw	t2,a5,0x1c
    13fe:	03c2d293          	srl	t0,t0,0x3c
    1402:	03cfdf93          	srl	t6,t6,0x3c
    1406:	03cf5f13          	srl	t5,t5,0x3c
    140a:	03cede93          	srl	t4,t4,0x3c
    140e:	03ce5e13          	srl	t3,t3,0x3c
    1412:	03c35313          	srl	t1,t1,0x3c
    1416:	03c8d893          	srl	a7,a7,0x3c
    141a:	03c85813          	srl	a6,a6,0x3c
    141e:	9171                	srl	a0,a0,0x3c
    1420:	91f1                	srl	a1,a1,0x3c
    1422:	92f1                	srl	a3,a3,0x3c
    1424:	9371                	srl	a4,a4,0x3c
    1426:	974e                	add	a4,a4,s3
    1428:	944e                	add	s0,s0,s3
    142a:	92ce                	add	t0,t0,s3
    142c:	9fce                	add	t6,t6,s3
    142e:	9f4e                	add	t5,t5,s3
    1430:	9ece                	add	t4,t4,s3
    1432:	9e4e                	add	t3,t3,s3
    1434:	934e                	add	t1,t1,s3
    1436:	98ce                	add	a7,a7,s3
    1438:	93ce                	add	t2,t2,s3
    143a:	984e                	add	a6,a6,s3
    143c:	954e                	add	a0,a0,s3
    143e:	95ce                	add	a1,a1,s3
    1440:	96ce                	add	a3,a3,s3
    1442:	00074083          	lbu	ra,0(a4)
    1446:	0002c283          	lbu	t0,0(t0)
    144a:	000fcf83          	lbu	t6,0(t6)
    144e:	000f4f03          	lbu	t5,0(t5)
    1452:	000ece83          	lbu	t4,0(t4)
    1456:	000e4e03          	lbu	t3,0(t3)
    145a:	00034303          	lbu	t1,0(t1)
    145e:	0008c883          	lbu	a7,0(a7)
    1462:	0003c383          	lbu	t2,0(t2)
    1466:	00084803          	lbu	a6,0(a6)
    146a:	00054503          	lbu	a0,0(a0)
    146e:	0005c583          	lbu	a1,0(a1)
    1472:	0006c683          	lbu	a3,0(a3)
    1476:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    147a:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    147e:	9371                	srl	a4,a4,0x3c
    1480:	8bbd                	and	a5,a5,15
    1482:	974e                	add	a4,a4,s3
    1484:	97ce                	add	a5,a5,s3
    1486:	005105a3          	sb	t0,11(sp)
    148a:	01f10623          	sb	t6,12(sp)
    148e:	01e106a3          	sb	t5,13(sp)
    1492:	01d10723          	sb	t4,14(sp)
    1496:	01c107a3          	sb	t3,15(sp)
    149a:	00610823          	sb	t1,16(sp)
    149e:	011108a3          	sb	a7,17(sp)
    14a2:	00710923          	sb	t2,18(sp)
    14a6:	010109a3          	sb	a6,19(sp)
    14aa:	00a10a23          	sb	a0,20(sp)
    14ae:	00b10aa3          	sb	a1,21(sp)
    14b2:	00d10b23          	sb	a3,22(sp)
    14b6:	00110ba3          	sb	ra,23(sp)
    14ba:	00810523          	sb	s0,10(sp)
    14be:	00074703          	lbu	a4,0(a4)
    14c2:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14c6:	002c                	add	a1,sp,8
    14c8:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14ca:	00e10c23          	sb	a4,24(sp)
    14ce:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14d2:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14d6:	7e8000ef          	jal	1cbe <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14da:	00248513          	add	a0,s1,2
        if (!*s)
    14de:	00054783          	lbu	a5,0(a0)
    14e2:	e8079ce3          	bnez	a5,137a <printf+0x4c>
    }
    va_end(ap);
}
    14e6:	70e6                	ld	ra,120(sp)
    14e8:	7446                	ld	s0,112(sp)
    14ea:	74a6                	ld	s1,104(sp)
    14ec:	7906                	ld	s2,96(sp)
    14ee:	69e6                	ld	s3,88(sp)
    14f0:	6a46                	ld	s4,80(sp)
    14f2:	6aa6                	ld	s5,72(sp)
    14f4:	6b06                	ld	s6,64(sp)
    14f6:	7be2                	ld	s7,56(sp)
    14f8:	6129                	add	sp,sp,192
    14fa:	8082                	ret
    14fc:	84b2                	mv	s1,a2
    14fe:	a039                	j	150c <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1500:	0024c783          	lbu	a5,2(s1)
    1504:	0605                	add	a2,a2,1
    1506:	0489                	add	s1,s1,2
    1508:	e92791e3          	bne	a5,s2,138a <printf+0x5c>
    150c:	0014c783          	lbu	a5,1(s1)
    1510:	ff2788e3          	beq	a5,s2,1500 <printf+0x1d2>
        l = z - a;
    1514:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1518:	85aa                	mv	a1,a0
    151a:	8622                	mv	a2,s0
    151c:	4505                	li	a0,1
    151e:	7a0000ef          	jal	1cbe <write>
        if (l)
    1522:	e6040de3          	beqz	s0,139c <printf+0x6e>
    1526:	8526                	mv	a0,s1
    1528:	b5a9                	j	1372 <printf+0x44>
        switch (s[1])
    152a:	05779963          	bne	a5,s7,157c <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    152e:	6782                	ld	a5,0(sp)
    1530:	45c1                	li	a1,16
    1532:	4388                	lw	a0,0(a5)
    1534:	07a1                	add	a5,a5,8
    1536:	e03e                	sd	a5,0(sp)
    1538:	bb7ff0ef          	jal	10ee <printint.constprop.0>
        s += 2;
    153c:	00248513          	add	a0,s1,2
    1540:	bf79                	j	14de <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    1542:	6782                	ld	a5,0(sp)
    1544:	6380                	ld	s0,0(a5)
    1546:	07a1                	add	a5,a5,8
    1548:	e03e                	sd	a5,0(sp)
    154a:	cc21                	beqz	s0,15a2 <printf+0x274>
            l = strnlen(a, 200);
    154c:	0c800593          	li	a1,200
    1550:	8522                	mv	a0,s0
    1552:	460000ef          	jal	19b2 <strnlen>
    write(f, s, l);
    1556:	0005061b          	sext.w	a2,a0
    155a:	85a2                	mv	a1,s0
    155c:	4505                	li	a0,1
    155e:	760000ef          	jal	1cbe <write>
        s += 2;
    1562:	00248513          	add	a0,s1,2
    1566:	bfa5                	j	14de <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    1568:	6782                	ld	a5,0(sp)
    156a:	45a9                	li	a1,10
    156c:	4388                	lw	a0,0(a5)
    156e:	07a1                	add	a5,a5,8
    1570:	e03e                	sd	a5,0(sp)
    1572:	b7dff0ef          	jal	10ee <printint.constprop.0>
        s += 2;
    1576:	00248513          	add	a0,s1,2
    157a:	b795                	j	14de <printf+0x1b0>
    return write(stdout, &byte, 1);
    157c:	4605                	li	a2,1
    157e:	002c                	add	a1,sp,8
    1580:	4505                	li	a0,1
    char byte = c;
    1582:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1586:	738000ef          	jal	1cbe <write>
    char byte = c;
    158a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    158e:	4605                	li	a2,1
    1590:	002c                	add	a1,sp,8
    1592:	4505                	li	a0,1
    char byte = c;
    1594:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1598:	726000ef          	jal	1cbe <write>
        s += 2;
    159c:	00248513          	add	a0,s1,2
    15a0:	bf3d                	j	14de <printf+0x1b0>
                a = "(null)";
    15a2:	00001417          	auipc	s0,0x1
    15a6:	9f640413          	add	s0,s0,-1546 # 1f98 <__clone+0xa2>
    15aa:	b74d                	j	154c <printf+0x21e>

00000000000015ac <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15ac:	1141                	add	sp,sp,-16
    15ae:	e406                	sd	ra,8(sp)
    puts(m);
    15b0:	d5dff0ef          	jal	130c <puts>
    exit(-100);
}
    15b4:	60a2                	ld	ra,8(sp)
    exit(-100);
    15b6:	f9c00513          	li	a0,-100
}
    15ba:	0141                	add	sp,sp,16
    exit(-100);
    15bc:	af89                	j	1d0e <exit>

00000000000015be <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15be:	02000793          	li	a5,32
    15c2:	00f50663          	beq	a0,a5,15ce <isspace+0x10>
    15c6:	355d                	addw	a0,a0,-9
    15c8:	00553513          	sltiu	a0,a0,5
    15cc:	8082                	ret
    15ce:	4505                	li	a0,1
}
    15d0:	8082                	ret

00000000000015d2 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15d2:	fd05051b          	addw	a0,a0,-48
}
    15d6:	00a53513          	sltiu	a0,a0,10
    15da:	8082                	ret

00000000000015dc <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15dc:	02000713          	li	a4,32
    15e0:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15e2:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15e6:	ff76879b          	addw	a5,a3,-9
    15ea:	06e68063          	beq	a3,a4,164a <atoi+0x6e>
    15ee:	0006859b          	sext.w	a1,a3
    15f2:	04f67c63          	bgeu	a2,a5,164a <atoi+0x6e>
        s++;
    switch (*s)
    15f6:	02b00793          	li	a5,43
    15fa:	06f68563          	beq	a3,a5,1664 <atoi+0x88>
    15fe:	02d00793          	li	a5,45
    1602:	04f69663          	bne	a3,a5,164e <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1606:	00154683          	lbu	a3,1(a0)
    160a:	47a5                	li	a5,9
        s++;
    160c:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1610:	fd06869b          	addw	a3,a3,-48
    1614:	8636                	mv	a2,a3
    while (isdigit(*s))
    1616:	04d7e563          	bltu	a5,a3,1660 <atoi+0x84>
        neg = 1;
    161a:	4885                	li	a7,1
    int n = 0, neg = 0;
    161c:	4501                	li	a0,0
    while (isdigit(*s))
    161e:	4825                	li	a6,9
    1620:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1624:	0025179b          	sllw	a5,a0,0x2
    1628:	9fa9                	addw	a5,a5,a0
    162a:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    162e:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    1632:	85b2                	mv	a1,a2
    1634:	40c7853b          	subw	a0,a5,a2
    1638:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    163a:	8636                	mv	a2,a3
    while (isdigit(*s))
    163c:	fed872e3          	bgeu	a6,a3,1620 <atoi+0x44>
    return neg ? n : -n;
    1640:	02089163          	bnez	a7,1662 <atoi+0x86>
    1644:	40f5853b          	subw	a0,a1,a5
    1648:	8082                	ret
        s++;
    164a:	0505                	add	a0,a0,1
    164c:	bf59                	j	15e2 <atoi+0x6>
    while (isdigit(*s))
    164e:	fd05859b          	addw	a1,a1,-48
    1652:	47a5                	li	a5,9
    1654:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1656:	4881                	li	a7,0
    1658:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    165c:	fcb7f0e3          	bgeu	a5,a1,161c <atoi+0x40>
    return neg ? n : -n;
    1660:	4501                	li	a0,0
}
    1662:	8082                	ret
    while (isdigit(*s))
    1664:	00154683          	lbu	a3,1(a0)
    1668:	47a5                	li	a5,9
        s++;
    166a:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    166e:	fd06869b          	addw	a3,a3,-48
    1672:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    1674:	4881                	li	a7,0
    while (isdigit(*s))
    1676:	fad7f3e3          	bgeu	a5,a3,161c <atoi+0x40>
    return neg ? n : -n;
    167a:	4501                	li	a0,0
    167c:	8082                	ret

000000000000167e <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    167e:	16060f63          	beqz	a2,17fc <memset+0x17e>
    1682:	40a006b3          	neg	a3,a0
    1686:	0076f793          	and	a5,a3,7
    168a:	00778813          	add	a6,a5,7
    168e:	48ad                	li	a7,11
    1690:	0ff5f713          	zext.b	a4,a1
    1694:	fff60593          	add	a1,a2,-1
    1698:	17186363          	bltu	a6,a7,17fe <memset+0x180>
    169c:	1705eb63          	bltu	a1,a6,1812 <memset+0x194>
    16a0:	16078163          	beqz	a5,1802 <memset+0x184>
    16a4:	00e50023          	sb	a4,0(a0)
    16a8:	0066f593          	and	a1,a3,6
    16ac:	14058e63          	beqz	a1,1808 <memset+0x18a>
    16b0:	00e500a3          	sb	a4,1(a0)
    16b4:	4589                	li	a1,2
    16b6:	00250813          	add	a6,a0,2
    16ba:	04f5f663          	bgeu	a1,a5,1706 <memset+0x88>
    16be:	00e50123          	sb	a4,2(a0)
    16c2:	8a91                	and	a3,a3,4
    16c4:	00350813          	add	a6,a0,3
    16c8:	458d                	li	a1,3
    16ca:	ce95                	beqz	a3,1706 <memset+0x88>
    16cc:	00e501a3          	sb	a4,3(a0)
    16d0:	4691                	li	a3,4
    16d2:	00450813          	add	a6,a0,4
    16d6:	4591                	li	a1,4
    16d8:	02f6f763          	bgeu	a3,a5,1706 <memset+0x88>
    16dc:	00e50223          	sb	a4,4(a0)
    16e0:	4695                	li	a3,5
    16e2:	00550813          	add	a6,a0,5
    16e6:	4595                	li	a1,5
    16e8:	00d78f63          	beq	a5,a3,1706 <memset+0x88>
    16ec:	00e502a3          	sb	a4,5(a0)
    16f0:	469d                	li	a3,7
    16f2:	00650813          	add	a6,a0,6
    16f6:	4599                	li	a1,6
    16f8:	00d79763          	bne	a5,a3,1706 <memset+0x88>
    16fc:	00750813          	add	a6,a0,7
    1700:	00e50323          	sb	a4,6(a0)
    1704:	459d                	li	a1,7
    1706:	00871693          	sll	a3,a4,0x8
    170a:	01071313          	sll	t1,a4,0x10
    170e:	8ed9                	or	a3,a3,a4
    1710:	01871893          	sll	a7,a4,0x18
    1714:	0066e6b3          	or	a3,a3,t1
    1718:	0116e6b3          	or	a3,a3,a7
    171c:	02071313          	sll	t1,a4,0x20
    1720:	02871893          	sll	a7,a4,0x28
    1724:	0066e6b3          	or	a3,a3,t1
    1728:	40f60e33          	sub	t3,a2,a5
    172c:	03071313          	sll	t1,a4,0x30
    1730:	0116e6b3          	or	a3,a3,a7
    1734:	0066e6b3          	or	a3,a3,t1
    1738:	03871893          	sll	a7,a4,0x38
    173c:	97aa                	add	a5,a5,a0
    173e:	ff8e7313          	and	t1,t3,-8
    1742:	0116e6b3          	or	a3,a3,a7
    1746:	00f308b3          	add	a7,t1,a5
    174a:	e394                	sd	a3,0(a5)
    174c:	07a1                	add	a5,a5,8
    174e:	ff179ee3          	bne	a5,a7,174a <memset+0xcc>
    1752:	006806b3          	add	a3,a6,t1
    1756:	00b307bb          	addw	a5,t1,a1
    175a:	0bc30b63          	beq	t1,t3,1810 <memset+0x192>
    175e:	00e68023          	sb	a4,0(a3)
    1762:	0017859b          	addw	a1,a5,1
    1766:	08c5fb63          	bgeu	a1,a2,17fc <memset+0x17e>
    176a:	00e680a3          	sb	a4,1(a3)
    176e:	0027859b          	addw	a1,a5,2
    1772:	08c5f563          	bgeu	a1,a2,17fc <memset+0x17e>
    1776:	00e68123          	sb	a4,2(a3)
    177a:	0037859b          	addw	a1,a5,3
    177e:	06c5ff63          	bgeu	a1,a2,17fc <memset+0x17e>
    1782:	00e681a3          	sb	a4,3(a3)
    1786:	0047859b          	addw	a1,a5,4
    178a:	06c5f963          	bgeu	a1,a2,17fc <memset+0x17e>
    178e:	00e68223          	sb	a4,4(a3)
    1792:	0057859b          	addw	a1,a5,5
    1796:	06c5f363          	bgeu	a1,a2,17fc <memset+0x17e>
    179a:	00e682a3          	sb	a4,5(a3)
    179e:	0067859b          	addw	a1,a5,6
    17a2:	04c5fd63          	bgeu	a1,a2,17fc <memset+0x17e>
    17a6:	00e68323          	sb	a4,6(a3)
    17aa:	0077859b          	addw	a1,a5,7
    17ae:	04c5f763          	bgeu	a1,a2,17fc <memset+0x17e>
    17b2:	00e683a3          	sb	a4,7(a3)
    17b6:	0087859b          	addw	a1,a5,8
    17ba:	04c5f163          	bgeu	a1,a2,17fc <memset+0x17e>
    17be:	00e68423          	sb	a4,8(a3)
    17c2:	0097859b          	addw	a1,a5,9
    17c6:	02c5fb63          	bgeu	a1,a2,17fc <memset+0x17e>
    17ca:	00e684a3          	sb	a4,9(a3)
    17ce:	00a7859b          	addw	a1,a5,10
    17d2:	02c5f563          	bgeu	a1,a2,17fc <memset+0x17e>
    17d6:	00e68523          	sb	a4,10(a3)
    17da:	00b7859b          	addw	a1,a5,11
    17de:	00c5ff63          	bgeu	a1,a2,17fc <memset+0x17e>
    17e2:	00e685a3          	sb	a4,11(a3)
    17e6:	00c7859b          	addw	a1,a5,12
    17ea:	00c5f963          	bgeu	a1,a2,17fc <memset+0x17e>
    17ee:	00e68623          	sb	a4,12(a3)
    17f2:	27b5                	addw	a5,a5,13
    17f4:	00c7f463          	bgeu	a5,a2,17fc <memset+0x17e>
    17f8:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17fc:	8082                	ret
    17fe:	482d                	li	a6,11
    1800:	bd71                	j	169c <memset+0x1e>
    char *p = dest;
    1802:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1804:	4581                	li	a1,0
    1806:	b701                	j	1706 <memset+0x88>
    1808:	00150813          	add	a6,a0,1
    180c:	4585                	li	a1,1
    180e:	bde5                	j	1706 <memset+0x88>
    1810:	8082                	ret
    char *p = dest;
    1812:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1814:	4781                	li	a5,0
    1816:	b7a1                	j	175e <memset+0xe0>

0000000000001818 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1818:	00054783          	lbu	a5,0(a0)
    181c:	0005c703          	lbu	a4,0(a1)
    1820:	00e79863          	bne	a5,a4,1830 <strcmp+0x18>
    1824:	0505                	add	a0,a0,1
    1826:	0585                	add	a1,a1,1
    1828:	fbe5                	bnez	a5,1818 <strcmp>
    182a:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    182c:	9d19                	subw	a0,a0,a4
    182e:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1830:	0007851b          	sext.w	a0,a5
    1834:	bfe5                	j	182c <strcmp+0x14>

0000000000001836 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1836:	ca15                	beqz	a2,186a <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1838:	00054783          	lbu	a5,0(a0)
    if (!n--)
    183c:	167d                	add	a2,a2,-1
    183e:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1842:	eb99                	bnez	a5,1858 <strncmp+0x22>
    1844:	a815                	j	1878 <strncmp+0x42>
    1846:	00a68e63          	beq	a3,a0,1862 <strncmp+0x2c>
    184a:	0505                	add	a0,a0,1
    184c:	00f71b63          	bne	a4,a5,1862 <strncmp+0x2c>
    1850:	00054783          	lbu	a5,0(a0)
    1854:	cf89                	beqz	a5,186e <strncmp+0x38>
    1856:	85b2                	mv	a1,a2
    1858:	0005c703          	lbu	a4,0(a1)
    185c:	00158613          	add	a2,a1,1
    1860:	f37d                	bnez	a4,1846 <strncmp+0x10>
        ;
    return *l - *r;
    1862:	0007851b          	sext.w	a0,a5
    1866:	9d19                	subw	a0,a0,a4
    1868:	8082                	ret
        return 0;
    186a:	4501                	li	a0,0
}
    186c:	8082                	ret
    return *l - *r;
    186e:	0015c703          	lbu	a4,1(a1)
    1872:	4501                	li	a0,0
    1874:	9d19                	subw	a0,a0,a4
    1876:	8082                	ret
    1878:	0005c703          	lbu	a4,0(a1)
    187c:	4501                	li	a0,0
    187e:	b7e5                	j	1866 <strncmp+0x30>

0000000000001880 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1880:	00757793          	and	a5,a0,7
    1884:	cf89                	beqz	a5,189e <strlen+0x1e>
    1886:	87aa                	mv	a5,a0
    1888:	a029                	j	1892 <strlen+0x12>
    188a:	0785                	add	a5,a5,1
    188c:	0077f713          	and	a4,a5,7
    1890:	cb01                	beqz	a4,18a0 <strlen+0x20>
        if (!*s)
    1892:	0007c703          	lbu	a4,0(a5)
    1896:	fb75                	bnez	a4,188a <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1898:	40a78533          	sub	a0,a5,a0
}
    189c:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    189e:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18a0:	feff05b7          	lui	a1,0xfeff0
    18a4:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedf4f>
    18a8:	f0101637          	lui	a2,0xf0101
    18ac:	05c2                	sll	a1,a1,0x10
    18ae:	0612                	sll	a2,a2,0x4
    18b0:	6394                	ld	a3,0(a5)
    18b2:	eff58593          	add	a1,a1,-257
    18b6:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff151>
    18ba:	05c2                	sll	a1,a1,0x10
    18bc:	0642                	sll	a2,a2,0x10
    18be:	eff58593          	add	a1,a1,-257
    18c2:	10160613          	add	a2,a2,257
    18c6:	00b68733          	add	a4,a3,a1
    18ca:	063e                	sll	a2,a2,0xf
    18cc:	fff6c693          	not	a3,a3
    18d0:	8f75                	and	a4,a4,a3
    18d2:	08060613          	add	a2,a2,128
    18d6:	8f71                	and	a4,a4,a2
    18d8:	eb11                	bnez	a4,18ec <strlen+0x6c>
    18da:	6794                	ld	a3,8(a5)
    18dc:	07a1                	add	a5,a5,8
    18de:	00b68733          	add	a4,a3,a1
    18e2:	fff6c693          	not	a3,a3
    18e6:	8f75                	and	a4,a4,a3
    18e8:	8f71                	and	a4,a4,a2
    18ea:	db65                	beqz	a4,18da <strlen+0x5a>
    for (; *s; s++)
    18ec:	0007c703          	lbu	a4,0(a5)
    18f0:	d745                	beqz	a4,1898 <strlen+0x18>
    18f2:	0017c703          	lbu	a4,1(a5)
    18f6:	0785                	add	a5,a5,1
    18f8:	d345                	beqz	a4,1898 <strlen+0x18>
    18fa:	0017c703          	lbu	a4,1(a5)
    18fe:	0785                	add	a5,a5,1
    1900:	fb6d                	bnez	a4,18f2 <strlen+0x72>
    1902:	bf59                	j	1898 <strlen+0x18>

0000000000001904 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1904:	00757713          	and	a4,a0,7
{
    1908:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    190a:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    190e:	cb19                	beqz	a4,1924 <memchr+0x20>
    1910:	ce59                	beqz	a2,19ae <memchr+0xaa>
    1912:	0007c703          	lbu	a4,0(a5)
    1916:	00b70963          	beq	a4,a1,1928 <memchr+0x24>
    191a:	0785                	add	a5,a5,1
    191c:	0077f713          	and	a4,a5,7
    1920:	167d                	add	a2,a2,-1
    1922:	f77d                	bnez	a4,1910 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1924:	4501                	li	a0,0
    if (n && *s != c)
    1926:	c649                	beqz	a2,19b0 <memchr+0xac>
    1928:	0007c703          	lbu	a4,0(a5)
    192c:	06b70663          	beq	a4,a1,1998 <memchr+0x94>
        size_t k = ONES * c;
    1930:	01010737          	lui	a4,0x1010
    1934:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e151>
    1938:	0742                	sll	a4,a4,0x10
    193a:	10170713          	add	a4,a4,257
    193e:	0742                	sll	a4,a4,0x10
    1940:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1944:	469d                	li	a3,7
        size_t k = ONES * c;
    1946:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    194a:	04c6f763          	bgeu	a3,a2,1998 <memchr+0x94>
    194e:	f0101837          	lui	a6,0xf0101
    1952:	feff08b7          	lui	a7,0xfeff0
    1956:	0812                	sll	a6,a6,0x4
    1958:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedf4f>
    195c:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff151>
    1960:	08c2                	sll	a7,a7,0x10
    1962:	0842                	sll	a6,a6,0x10
    1964:	eff88893          	add	a7,a7,-257
    1968:	10180813          	add	a6,a6,257
    196c:	08c2                	sll	a7,a7,0x10
    196e:	083e                	sll	a6,a6,0xf
    1970:	eff88893          	add	a7,a7,-257
    1974:	08080813          	add	a6,a6,128
    1978:	431d                	li	t1,7
    197a:	a029                	j	1984 <memchr+0x80>
    197c:	1661                	add	a2,a2,-8
    197e:	07a1                	add	a5,a5,8
    1980:	02c37663          	bgeu	t1,a2,19ac <memchr+0xa8>
    1984:	6398                	ld	a4,0(a5)
    1986:	8f29                	xor	a4,a4,a0
    1988:	011706b3          	add	a3,a4,a7
    198c:	fff74713          	not	a4,a4
    1990:	8f75                	and	a4,a4,a3
    1992:	01077733          	and	a4,a4,a6
    1996:	d37d                	beqz	a4,197c <memchr+0x78>
        s = (const void *)w;
    1998:	853e                	mv	a0,a5
    199a:	a019                	j	19a0 <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    199c:	0505                	add	a0,a0,1
    199e:	ca01                	beqz	a2,19ae <memchr+0xaa>
    19a0:	00054783          	lbu	a5,0(a0)
    19a4:	167d                	add	a2,a2,-1
    19a6:	feb79be3          	bne	a5,a1,199c <memchr+0x98>
    19aa:	8082                	ret
    19ac:	f675                	bnez	a2,1998 <memchr+0x94>
    return n ? (void *)s : 0;
    19ae:	4501                	li	a0,0
}
    19b0:	8082                	ret

00000000000019b2 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19b2:	1101                	add	sp,sp,-32
    19b4:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19b6:	862e                	mv	a2,a1
{
    19b8:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19ba:	4581                	li	a1,0
{
    19bc:	e426                	sd	s1,8(sp)
    19be:	ec06                	sd	ra,24(sp)
    19c0:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19c2:	f43ff0ef          	jal	1904 <memchr>
    return p ? p - s : n;
    19c6:	c519                	beqz	a0,19d4 <strnlen+0x22>
}
    19c8:	60e2                	ld	ra,24(sp)
    19ca:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19cc:	8d05                	sub	a0,a0,s1
}
    19ce:	64a2                	ld	s1,8(sp)
    19d0:	6105                	add	sp,sp,32
    19d2:	8082                	ret
    19d4:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19d6:	8522                	mv	a0,s0
}
    19d8:	6442                	ld	s0,16(sp)
    19da:	64a2                	ld	s1,8(sp)
    19dc:	6105                	add	sp,sp,32
    19de:	8082                	ret

00000000000019e0 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19e0:	00b547b3          	xor	a5,a0,a1
    19e4:	8b9d                	and	a5,a5,7
    19e6:	efb1                	bnez	a5,1a42 <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19e8:	0075f793          	and	a5,a1,7
    19ec:	ebb5                	bnez	a5,1a60 <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19ee:	feff0637          	lui	a2,0xfeff0
    19f2:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedf4f>
    19f6:	f01016b7          	lui	a3,0xf0101
    19fa:	0642                	sll	a2,a2,0x10
    19fc:	0692                	sll	a3,a3,0x4
    19fe:	6198                	ld	a4,0(a1)
    1a00:	eff60613          	add	a2,a2,-257
    1a04:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff151>
    1a08:	0642                	sll	a2,a2,0x10
    1a0a:	06c2                	sll	a3,a3,0x10
    1a0c:	eff60613          	add	a2,a2,-257
    1a10:	10168693          	add	a3,a3,257
    1a14:	00c707b3          	add	a5,a4,a2
    1a18:	fff74813          	not	a6,a4
    1a1c:	06be                	sll	a3,a3,0xf
    1a1e:	0107f7b3          	and	a5,a5,a6
    1a22:	08068693          	add	a3,a3,128
    1a26:	8ff5                	and	a5,a5,a3
    1a28:	ef89                	bnez	a5,1a42 <strcpy+0x62>
    1a2a:	05a1                	add	a1,a1,8
    1a2c:	e118                	sd	a4,0(a0)
    1a2e:	6198                	ld	a4,0(a1)
    1a30:	0521                	add	a0,a0,8
    1a32:	00c707b3          	add	a5,a4,a2
    1a36:	fff74813          	not	a6,a4
    1a3a:	0107f7b3          	and	a5,a5,a6
    1a3e:	8ff5                	and	a5,a5,a3
    1a40:	d7ed                	beqz	a5,1a2a <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a42:	0005c783          	lbu	a5,0(a1)
    1a46:	00f50023          	sb	a5,0(a0)
    1a4a:	c785                	beqz	a5,1a72 <strcpy+0x92>
    1a4c:	0015c783          	lbu	a5,1(a1)
    1a50:	0505                	add	a0,a0,1
    1a52:	0585                	add	a1,a1,1
    1a54:	00f50023          	sb	a5,0(a0)
    1a58:	fbf5                	bnez	a5,1a4c <strcpy+0x6c>
        ;
    return d;
}
    1a5a:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a5c:	0505                	add	a0,a0,1
    1a5e:	db41                	beqz	a4,19ee <strcpy+0xe>
            if (!(*d = *s))
    1a60:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a64:	0585                	add	a1,a1,1
    1a66:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a6a:	00f50023          	sb	a5,0(a0)
    1a6e:	f7fd                	bnez	a5,1a5c <strcpy+0x7c>
}
    1a70:	8082                	ret
    1a72:	8082                	ret

0000000000001a74 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a74:	00b547b3          	xor	a5,a0,a1
    1a78:	8b9d                	and	a5,a5,7
    1a7a:	efbd                	bnez	a5,1af8 <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a7c:	0075f793          	and	a5,a1,7
    1a80:	1c078563          	beqz	a5,1c4a <strncpy+0x1d6>
    1a84:	ea11                	bnez	a2,1a98 <strncpy+0x24>
    1a86:	8082                	ret
    1a88:	0585                	add	a1,a1,1
    1a8a:	0075f793          	and	a5,a1,7
    1a8e:	167d                	add	a2,a2,-1
    1a90:	0505                	add	a0,a0,1
    1a92:	1a078c63          	beqz	a5,1c4a <strncpy+0x1d6>
    1a96:	ca3d                	beqz	a2,1b0c <strncpy+0x98>
    1a98:	0005c783          	lbu	a5,0(a1)
    1a9c:	00f50023          	sb	a5,0(a0)
    1aa0:	f7e5                	bnez	a5,1a88 <strncpy+0x14>
            ;
        if (!n || !*s)
    1aa2:	0005c783          	lbu	a5,0(a1)
    1aa6:	c7a5                	beqz	a5,1b0e <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1aa8:	479d                	li	a5,7
    1aaa:	04c7f863          	bgeu	a5,a2,1afa <strncpy+0x86>
    1aae:	f01016b7          	lui	a3,0xf0101
    1ab2:	feff0837          	lui	a6,0xfeff0
    1ab6:	0692                	sll	a3,a3,0x4
    1ab8:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedf4f>
    1abc:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff151>
    1ac0:	0842                	sll	a6,a6,0x10
    1ac2:	06c2                	sll	a3,a3,0x10
    1ac4:	eff80813          	add	a6,a6,-257
    1ac8:	10168693          	add	a3,a3,257
    1acc:	0842                	sll	a6,a6,0x10
    1ace:	06be                	sll	a3,a3,0xf
    1ad0:	eff80813          	add	a6,a6,-257
    1ad4:	08068693          	add	a3,a3,128
    1ad8:	431d                	li	t1,7
    1ada:	6198                	ld	a4,0(a1)
    1adc:	010707b3          	add	a5,a4,a6
    1ae0:	fff74893          	not	a7,a4
    1ae4:	0117f7b3          	and	a5,a5,a7
    1ae8:	8ff5                	and	a5,a5,a3
    1aea:	eb81                	bnez	a5,1afa <strncpy+0x86>
            *wd = *ws;
    1aec:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1aee:	1661                	add	a2,a2,-8
    1af0:	05a1                	add	a1,a1,8
    1af2:	0521                	add	a0,a0,8
    1af4:	fec363e3          	bltu	t1,a2,1ada <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1af8:	ca11                	beqz	a2,1b0c <strncpy+0x98>
    1afa:	0005c783          	lbu	a5,0(a1)
    1afe:	0585                	add	a1,a1,1
    1b00:	00f50023          	sb	a5,0(a0)
    1b04:	c789                	beqz	a5,1b0e <strncpy+0x9a>
    1b06:	167d                	add	a2,a2,-1
    1b08:	0505                	add	a0,a0,1
    1b0a:	fa65                	bnez	a2,1afa <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b0c:	8082                	ret
    1b0e:	40a00733          	neg	a4,a0
    1b12:	00777793          	and	a5,a4,7
    1b16:	00778693          	add	a3,a5,7
    1b1a:	482d                	li	a6,11
    1b1c:	fff60593          	add	a1,a2,-1
    1b20:	1106ef63          	bltu	a3,a6,1c3e <strncpy+0x1ca>
    1b24:	12d5ee63          	bltu	a1,a3,1c60 <strncpy+0x1ec>
    1b28:	12078563          	beqz	a5,1c52 <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b2c:	00050023          	sb	zero,0(a0)
    1b30:	00677693          	and	a3,a4,6
    1b34:	12068263          	beqz	a3,1c58 <strncpy+0x1e4>
    1b38:	000500a3          	sb	zero,1(a0)
    1b3c:	4689                	li	a3,2
    1b3e:	12f6f463          	bgeu	a3,a5,1c66 <strncpy+0x1f2>
    1b42:	00050123          	sb	zero,2(a0)
    1b46:	8b11                	and	a4,a4,4
    1b48:	cf6d                	beqz	a4,1c42 <strncpy+0x1ce>
    1b4a:	000501a3          	sb	zero,3(a0)
    1b4e:	4711                	li	a4,4
    1b50:	00450693          	add	a3,a0,4
    1b54:	02f77363          	bgeu	a4,a5,1b7a <strncpy+0x106>
    1b58:	00050223          	sb	zero,4(a0)
    1b5c:	4715                	li	a4,5
    1b5e:	00550693          	add	a3,a0,5
    1b62:	00e78c63          	beq	a5,a4,1b7a <strncpy+0x106>
    1b66:	000502a3          	sb	zero,5(a0)
    1b6a:	471d                	li	a4,7
    1b6c:	10e79163          	bne	a5,a4,1c6e <strncpy+0x1fa>
    1b70:	00750693          	add	a3,a0,7
    1b74:	00050323          	sb	zero,6(a0)
    1b78:	471d                	li	a4,7
    1b7a:	40f608b3          	sub	a7,a2,a5
    1b7e:	ff88f813          	and	a6,a7,-8
    1b82:	97aa                	add	a5,a5,a0
    1b84:	010785b3          	add	a1,a5,a6
    1b88:	0007b023          	sd	zero,0(a5)
    1b8c:	07a1                	add	a5,a5,8
    1b8e:	feb79de3          	bne	a5,a1,1b88 <strncpy+0x114>
    1b92:	00e807bb          	addw	a5,a6,a4
    1b96:	01068733          	add	a4,a3,a6
    1b9a:	0b088b63          	beq	a7,a6,1c50 <strncpy+0x1dc>
    1b9e:	00070023          	sb	zero,0(a4)
    1ba2:	0017869b          	addw	a3,a5,1
    1ba6:	f6c6f3e3          	bgeu	a3,a2,1b0c <strncpy+0x98>
    1baa:	000700a3          	sb	zero,1(a4)
    1bae:	0027869b          	addw	a3,a5,2
    1bb2:	f4c6fde3          	bgeu	a3,a2,1b0c <strncpy+0x98>
    1bb6:	00070123          	sb	zero,2(a4)
    1bba:	0037869b          	addw	a3,a5,3
    1bbe:	f4c6f7e3          	bgeu	a3,a2,1b0c <strncpy+0x98>
    1bc2:	000701a3          	sb	zero,3(a4)
    1bc6:	0047869b          	addw	a3,a5,4
    1bca:	f4c6f1e3          	bgeu	a3,a2,1b0c <strncpy+0x98>
    1bce:	00070223          	sb	zero,4(a4)
    1bd2:	0057869b          	addw	a3,a5,5
    1bd6:	f2c6fbe3          	bgeu	a3,a2,1b0c <strncpy+0x98>
    1bda:	000702a3          	sb	zero,5(a4)
    1bde:	0067869b          	addw	a3,a5,6
    1be2:	f2c6f5e3          	bgeu	a3,a2,1b0c <strncpy+0x98>
    1be6:	00070323          	sb	zero,6(a4)
    1bea:	0077869b          	addw	a3,a5,7
    1bee:	f0c6ffe3          	bgeu	a3,a2,1b0c <strncpy+0x98>
    1bf2:	000703a3          	sb	zero,7(a4)
    1bf6:	0087869b          	addw	a3,a5,8
    1bfa:	f0c6f9e3          	bgeu	a3,a2,1b0c <strncpy+0x98>
    1bfe:	00070423          	sb	zero,8(a4)
    1c02:	0097869b          	addw	a3,a5,9
    1c06:	f0c6f3e3          	bgeu	a3,a2,1b0c <strncpy+0x98>
    1c0a:	000704a3          	sb	zero,9(a4)
    1c0e:	00a7869b          	addw	a3,a5,10
    1c12:	eec6fde3          	bgeu	a3,a2,1b0c <strncpy+0x98>
    1c16:	00070523          	sb	zero,10(a4)
    1c1a:	00b7869b          	addw	a3,a5,11
    1c1e:	eec6f7e3          	bgeu	a3,a2,1b0c <strncpy+0x98>
    1c22:	000705a3          	sb	zero,11(a4)
    1c26:	00c7869b          	addw	a3,a5,12
    1c2a:	eec6f1e3          	bgeu	a3,a2,1b0c <strncpy+0x98>
    1c2e:	00070623          	sb	zero,12(a4)
    1c32:	27b5                	addw	a5,a5,13
    1c34:	ecc7fce3          	bgeu	a5,a2,1b0c <strncpy+0x98>
    1c38:	000706a3          	sb	zero,13(a4)
}
    1c3c:	8082                	ret
    1c3e:	46ad                	li	a3,11
    1c40:	b5d5                	j	1b24 <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c42:	00350693          	add	a3,a0,3
    1c46:	470d                	li	a4,3
    1c48:	bf0d                	j	1b7a <strncpy+0x106>
        if (!n || !*s)
    1c4a:	e4061ce3          	bnez	a2,1aa2 <strncpy+0x2e>
}
    1c4e:	8082                	ret
    1c50:	8082                	ret
    char *p = dest;
    1c52:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c54:	4701                	li	a4,0
    1c56:	b715                	j	1b7a <strncpy+0x106>
    1c58:	00150693          	add	a3,a0,1
    1c5c:	4705                	li	a4,1
    1c5e:	bf31                	j	1b7a <strncpy+0x106>
    char *p = dest;
    1c60:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c62:	4781                	li	a5,0
    1c64:	bf2d                	j	1b9e <strncpy+0x12a>
    1c66:	00250693          	add	a3,a0,2
    1c6a:	4709                	li	a4,2
    1c6c:	b739                	j	1b7a <strncpy+0x106>
    1c6e:	00650693          	add	a3,a0,6
    1c72:	4719                	li	a4,6
    1c74:	b719                	j	1b7a <strncpy+0x106>

0000000000001c76 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c76:	87aa                	mv	a5,a0
    1c78:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c7a:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c7e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c82:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c84:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c86:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c8a:	2501                	sext.w	a0,a0
    1c8c:	8082                	ret

0000000000001c8e <openat>:
    register long a7 __asm__("a7") = n;
    1c8e:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c92:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c96:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c9a:	2501                	sext.w	a0,a0
    1c9c:	8082                	ret

0000000000001c9e <fcntl>:
    register long a7 __asm__("a7") = n;
    1c9e:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ca0:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1ca4:	2501                	sext.w	a0,a0
    1ca6:	8082                	ret

0000000000001ca8 <close>:
    register long a7 __asm__("a7") = n;
    1ca8:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1cac:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1cb0:	2501                	sext.w	a0,a0
    1cb2:	8082                	ret

0000000000001cb4 <read>:
    register long a7 __asm__("a7") = n;
    1cb4:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cb8:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1cbc:	8082                	ret

0000000000001cbe <write>:
    register long a7 __asm__("a7") = n;
    1cbe:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cc2:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1cc6:	8082                	ret

0000000000001cc8 <getpid>:
    register long a7 __asm__("a7") = n;
    1cc8:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1ccc:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1cd0:	2501                	sext.w	a0,a0
    1cd2:	8082                	ret

0000000000001cd4 <getppid>:
    register long a7 __asm__("a7") = n;
    1cd4:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1cd8:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cdc:	2501                	sext.w	a0,a0
    1cde:	8082                	ret

0000000000001ce0 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1ce0:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1ce4:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1ce8:	2501                	sext.w	a0,a0
    1cea:	8082                	ret

0000000000001cec <fork>:
    register long a7 __asm__("a7") = n;
    1cec:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cf0:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cf2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cf4:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cf8:	2501                	sext.w	a0,a0
    1cfa:	8082                	ret

0000000000001cfc <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cfc:	85b2                	mv	a1,a2
    1cfe:	863a                	mv	a2,a4
    if (stack)
    1d00:	c191                	beqz	a1,1d04 <clone+0x8>
	stack += stack_size;
    1d02:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d04:	4781                	li	a5,0
    1d06:	4701                	li	a4,0
    1d08:	4681                	li	a3,0
    1d0a:	2601                	sext.w	a2,a2
    1d0c:	a2ed                	j	1ef6 <__clone>

0000000000001d0e <exit>:
    register long a7 __asm__("a7") = n;
    1d0e:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d12:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d16:	8082                	ret

0000000000001d18 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d18:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d1c:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d1e:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d22:	2501                	sext.w	a0,a0
    1d24:	8082                	ret

0000000000001d26 <exec>:
    register long a7 __asm__("a7") = n;
    1d26:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d2a:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d2e:	2501                	sext.w	a0,a0
    1d30:	8082                	ret

0000000000001d32 <execve>:
    register long a7 __asm__("a7") = n;
    1d32:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d36:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d3a:	2501                	sext.w	a0,a0
    1d3c:	8082                	ret

0000000000001d3e <times>:
    register long a7 __asm__("a7") = n;
    1d3e:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d42:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d46:	2501                	sext.w	a0,a0
    1d48:	8082                	ret

0000000000001d4a <get_time>:

int64 get_time()
{
    1d4a:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d4c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d50:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d52:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d54:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d58:	2501                	sext.w	a0,a0
    1d5a:	ed09                	bnez	a0,1d74 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d5c:	67a2                	ld	a5,8(sp)
    1d5e:	3e800713          	li	a4,1000
    1d62:	00015503          	lhu	a0,0(sp)
    1d66:	02e7d7b3          	divu	a5,a5,a4
    1d6a:	02e50533          	mul	a0,a0,a4
    1d6e:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d70:	0141                	add	sp,sp,16
    1d72:	8082                	ret
        return -1;
    1d74:	557d                	li	a0,-1
    1d76:	bfed                	j	1d70 <get_time+0x26>

0000000000001d78 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d78:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d7c:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d80:	2501                	sext.w	a0,a0
    1d82:	8082                	ret

0000000000001d84 <time>:
    register long a7 __asm__("a7") = n;
    1d84:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d88:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d8c:	2501                	sext.w	a0,a0
    1d8e:	8082                	ret

0000000000001d90 <sleep>:

int sleep(unsigned long long time)
{
    1d90:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d92:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d94:	850a                	mv	a0,sp
    1d96:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d98:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d9c:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d9e:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1da2:	e501                	bnez	a0,1daa <sleep+0x1a>
    return 0;
    1da4:	4501                	li	a0,0
}
    1da6:	0141                	add	sp,sp,16
    1da8:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1daa:	4502                	lw	a0,0(sp)
}
    1dac:	0141                	add	sp,sp,16
    1dae:	8082                	ret

0000000000001db0 <set_priority>:
    register long a7 __asm__("a7") = n;
    1db0:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1db4:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1db8:	2501                	sext.w	a0,a0
    1dba:	8082                	ret

0000000000001dbc <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1dbc:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1dc0:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1dc4:	8082                	ret

0000000000001dc6 <munmap>:
    register long a7 __asm__("a7") = n;
    1dc6:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dca:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1dce:	2501                	sext.w	a0,a0
    1dd0:	8082                	ret

0000000000001dd2 <wait>:

int wait(int *code)
{
    1dd2:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dd4:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1dd8:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1dda:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1ddc:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dde:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1de2:	2501                	sext.w	a0,a0
    1de4:	8082                	ret

0000000000001de6 <spawn>:
    register long a7 __asm__("a7") = n;
    1de6:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1dea:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dee:	2501                	sext.w	a0,a0
    1df0:	8082                	ret

0000000000001df2 <mailread>:
    register long a7 __asm__("a7") = n;
    1df2:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1df6:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dfa:	2501                	sext.w	a0,a0
    1dfc:	8082                	ret

0000000000001dfe <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dfe:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e02:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e06:	2501                	sext.w	a0,a0
    1e08:	8082                	ret

0000000000001e0a <fstat>:
    register long a7 __asm__("a7") = n;
    1e0a:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e0e:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e12:	2501                	sext.w	a0,a0
    1e14:	8082                	ret

0000000000001e16 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e16:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e18:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e1c:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e1e:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e22:	2501                	sext.w	a0,a0
    1e24:	8082                	ret

0000000000001e26 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e26:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e28:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e2c:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e2e:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e32:	2501                	sext.w	a0,a0
    1e34:	8082                	ret

0000000000001e36 <link>:

int link(char *old_path, char *new_path)
{
    1e36:	87aa                	mv	a5,a0
    1e38:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e3a:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e3e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e42:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e44:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e48:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e4a:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e4e:	2501                	sext.w	a0,a0
    1e50:	8082                	ret

0000000000001e52 <unlink>:

int unlink(char *path)
{
    1e52:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e54:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e58:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e5c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e5e:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e62:	2501                	sext.w	a0,a0
    1e64:	8082                	ret

0000000000001e66 <uname>:
    register long a7 __asm__("a7") = n;
    1e66:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e6a:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e6e:	2501                	sext.w	a0,a0
    1e70:	8082                	ret

0000000000001e72 <brk>:
    register long a7 __asm__("a7") = n;
    1e72:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e76:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e7a:	2501                	sext.w	a0,a0
    1e7c:	8082                	ret

0000000000001e7e <getcwd>:
    register long a7 __asm__("a7") = n;
    1e7e:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e80:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e84:	8082                	ret

0000000000001e86 <chdir>:
    register long a7 __asm__("a7") = n;
    1e86:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e8a:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e8e:	2501                	sext.w	a0,a0
    1e90:	8082                	ret

0000000000001e92 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e92:	862e                	mv	a2,a1
    1e94:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e96:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e98:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e9c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ea0:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1ea2:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ea4:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1ea8:	2501                	sext.w	a0,a0
    1eaa:	8082                	ret

0000000000001eac <getdents>:
    register long a7 __asm__("a7") = n;
    1eac:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eb0:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1eb4:	2501                	sext.w	a0,a0
    1eb6:	8082                	ret

0000000000001eb8 <pipe>:
    register long a7 __asm__("a7") = n;
    1eb8:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1ebc:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ebe:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1ec2:	2501                	sext.w	a0,a0
    1ec4:	8082                	ret

0000000000001ec6 <dup>:
    register long a7 __asm__("a7") = n;
    1ec6:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1ec8:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1ecc:	2501                	sext.w	a0,a0
    1ece:	8082                	ret

0000000000001ed0 <dup2>:
    register long a7 __asm__("a7") = n;
    1ed0:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1ed2:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ed4:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ed8:	2501                	sext.w	a0,a0
    1eda:	8082                	ret

0000000000001edc <mount>:
    register long a7 __asm__("a7") = n;
    1edc:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ee0:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ee4:	2501                	sext.w	a0,a0
    1ee6:	8082                	ret

0000000000001ee8 <umount>:
    register long a7 __asm__("a7") = n;
    1ee8:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1eec:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eee:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ef2:	2501                	sext.w	a0,a0
    1ef4:	8082                	ret

0000000000001ef6 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ef6:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1ef8:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1efa:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1efc:	8532                	mv	a0,a2
	mv a2, a4
    1efe:	863a                	mv	a2,a4
	mv a3, a5
    1f00:	86be                	mv	a3,a5
	mv a4, a6
    1f02:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f04:	0dc00893          	li	a7,220
	ecall
    1f08:	00000073          	ecall

	beqz a0, 1f
    1f0c:	c111                	beqz	a0,1f10 <__clone+0x1a>
	# Parent
	ret
    1f0e:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f10:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f12:	6522                	ld	a0,8(sp)
	jalr a1
    1f14:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f16:	05d00893          	li	a7,93
	ecall
    1f1a:	00000073          	ecall
