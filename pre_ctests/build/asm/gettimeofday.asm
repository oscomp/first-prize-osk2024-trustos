
/root/oskernel2024-trustos/pre_ctests/build/riscv64/gettimeofday:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a8e1                	j	10da <__start_main>

0000000000001004 <test_gettimeofday>:
 * "start:[num], end:[num]"
 * "interval: [num]"	注：数字[num]的值应大于0
 * 测试失败时的输出：
 * "gettimeofday error."
 */
void test_gettimeofday() {
    1004:	7179                	add	sp,sp,-48
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f1250513          	add	a0,a0,-238 # 1f18 <__clone+0x2e>
void test_gettimeofday() {
    100e:	f406                	sd	ra,40(sp)
    1010:	ec26                	sd	s1,24(sp)
	TEST_START(__func__);
    1012:	300000ef          	jal	1312 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	f9a50513          	add	a0,a0,-102 # 1fb0 <__func__.0>
    101e:	2f4000ef          	jal	1312 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	f0e50513          	add	a0,a0,-242 # 1f30 <__clone+0x46>
    102a:	2e8000ef          	jal	1312 <puts>
	int test_ret1 = get_time();
    102e:	511000ef          	jal	1d3e <get_time>
	volatile int i = 12500000;	// qemu时钟频率12500000
    1032:	00bec7b7          	lui	a5,0xbec
    1036:	c2078793          	add	a5,a5,-992 # bebc20 <digits+0xbe9c58>
    103a:	c63e                	sw	a5,12(sp)
	while(i > 0) i--;
    103c:	47b2                	lw	a5,12(sp)
	int test_ret1 = get_time();
    103e:	0005049b          	sext.w	s1,a0
	while(i > 0) i--;
    1042:	00f05863          	blez	a5,1052 <test_gettimeofday+0x4e>
    1046:	47b2                	lw	a5,12(sp)
    1048:	37fd                	addw	a5,a5,-1
    104a:	c63e                	sw	a5,12(sp)
    104c:	47b2                	lw	a5,12(sp)
    104e:	fef04ce3          	bgtz	a5,1046 <test_gettimeofday+0x42>
	int test_ret2 = get_time();
    1052:	4ed000ef          	jal	1d3e <get_time>
	if(test_ret1 > 0 && test_ret2 > 0){
    1056:	00905863          	blez	s1,1066 <test_gettimeofday+0x62>
    105a:	f022                	sd	s0,32(sp)
	int test_ret2 = get_time();
    105c:	0005041b          	sext.w	s0,a0
	if(test_ret1 > 0 && test_ret2 > 0){
    1060:	02804d63          	bgtz	s0,109a <test_gettimeofday+0x96>
    1064:	7402                	ld	s0,32(sp)
		printf("gettimeofday success.\n");
		printf("start:%d, end:%d\n", test_ret1, test_ret2);
                printf("interval: %d\n", test_ret2 - test_ret1);
	}else{
		printf("gettimeofday error.\n");
    1066:	00001517          	auipc	a0,0x1
    106a:	f1a50513          	add	a0,a0,-230 # 1f80 <__clone+0x96>
    106e:	2c6000ef          	jal	1334 <printf>
	}
	TEST_END(__func__);
    1072:	00001517          	auipc	a0,0x1
    1076:	f2650513          	add	a0,a0,-218 # 1f98 <__clone+0xae>
    107a:	298000ef          	jal	1312 <puts>
    107e:	00001517          	auipc	a0,0x1
    1082:	f3250513          	add	a0,a0,-206 # 1fb0 <__func__.0>
    1086:	28c000ef          	jal	1312 <puts>
}
    108a:	70a2                	ld	ra,40(sp)
    108c:	64e2                	ld	s1,24(sp)
	TEST_END(__func__);
    108e:	00001517          	auipc	a0,0x1
    1092:	ea250513          	add	a0,a0,-350 # 1f30 <__clone+0x46>
}
    1096:	6145                	add	sp,sp,48
	TEST_END(__func__);
    1098:	acad                	j	1312 <puts>
		printf("gettimeofday success.\n");
    109a:	00001517          	auipc	a0,0x1
    109e:	ea650513          	add	a0,a0,-346 # 1f40 <__clone+0x56>
    10a2:	292000ef          	jal	1334 <printf>
		printf("start:%d, end:%d\n", test_ret1, test_ret2);
    10a6:	8622                	mv	a2,s0
    10a8:	85a6                	mv	a1,s1
    10aa:	00001517          	auipc	a0,0x1
    10ae:	eae50513          	add	a0,a0,-338 # 1f58 <__clone+0x6e>
    10b2:	282000ef          	jal	1334 <printf>
                printf("interval: %d\n", test_ret2 - test_ret1);
    10b6:	409405bb          	subw	a1,s0,s1
    10ba:	00001517          	auipc	a0,0x1
    10be:	eb650513          	add	a0,a0,-330 # 1f70 <__clone+0x86>
    10c2:	272000ef          	jal	1334 <printf>
    10c6:	7402                	ld	s0,32(sp)
    10c8:	b76d                	j	1072 <test_gettimeofday+0x6e>

00000000000010ca <main>:

int main(void) {
    10ca:	1141                	add	sp,sp,-16
    10cc:	e406                	sd	ra,8(sp)
	test_gettimeofday();
    10ce:	f37ff0ef          	jal	1004 <test_gettimeofday>
	return 0;
}
    10d2:	60a2                	ld	ra,8(sp)
    10d4:	4501                	li	a0,0
    10d6:	0141                	add	sp,sp,16
    10d8:	8082                	ret

00000000000010da <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10da:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10dc:	4108                	lw	a0,0(a0)
{
    10de:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10e0:	05a1                	add	a1,a1,8
{
    10e2:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10e4:	fe7ff0ef          	jal	10ca <main>
    10e8:	41b000ef          	jal	1d02 <exit>
	return 0;
}
    10ec:	60a2                	ld	ra,8(sp)
    10ee:	4501                	li	a0,0
    10f0:	0141                	add	sp,sp,16
    10f2:	8082                	ret

00000000000010f4 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10f4:	7179                	add	sp,sp,-48
    10f6:	f406                	sd	ra,40(sp)
    10f8:	0005081b          	sext.w	a6,a0
    10fc:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10fe:	00055563          	bgez	a0,1108 <printint.constprop.0+0x14>
        x = -xx;
    1102:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    1106:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1108:	02b8763b          	remuw	a2,a6,a1
    110c:	00001697          	auipc	a3,0x1
    1110:	ebc68693          	add	a3,a3,-324 # 1fc8 <digits>
    buf[16] = 0;
    1114:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1118:	0005871b          	sext.w	a4,a1
    111c:	1602                	sll	a2,a2,0x20
    111e:	9201                	srl	a2,a2,0x20
    1120:	9636                	add	a2,a2,a3
    1122:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1126:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    112a:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    112e:	10b86c63          	bltu	a6,a1,1246 <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    1132:	02e5763b          	remuw	a2,a0,a4
    1136:	1602                	sll	a2,a2,0x20
    1138:	9201                	srl	a2,a2,0x20
    113a:	9636                	add	a2,a2,a3
    113c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1140:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1144:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1148:	10e56863          	bltu	a0,a4,1258 <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    114c:	02e5f63b          	remuw	a2,a1,a4
    1150:	1602                	sll	a2,a2,0x20
    1152:	9201                	srl	a2,a2,0x20
    1154:	9636                	add	a2,a2,a3
    1156:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    115a:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    115e:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1162:	10e5e463          	bltu	a1,a4,126a <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    1166:	02e5763b          	remuw	a2,a0,a4
    116a:	1602                	sll	a2,a2,0x20
    116c:	9201                	srl	a2,a2,0x20
    116e:	9636                	add	a2,a2,a3
    1170:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1174:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1178:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    117c:	10e56063          	bltu	a0,a4,127c <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    1180:	02e5f63b          	remuw	a2,a1,a4
    1184:	1602                	sll	a2,a2,0x20
    1186:	9201                	srl	a2,a2,0x20
    1188:	9636                	add	a2,a2,a3
    118a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    118e:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1192:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1196:	0ee5ec63          	bltu	a1,a4,128e <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    119a:	02e5763b          	remuw	a2,a0,a4
    119e:	1602                	sll	a2,a2,0x20
    11a0:	9201                	srl	a2,a2,0x20
    11a2:	9636                	add	a2,a2,a3
    11a4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a8:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11ac:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11b0:	08e56263          	bltu	a0,a4,1234 <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    11b4:	02e5f63b          	remuw	a2,a1,a4
    11b8:	1602                	sll	a2,a2,0x20
    11ba:	9201                	srl	a2,a2,0x20
    11bc:	9636                	add	a2,a2,a3
    11be:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c2:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11c6:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11ca:	0ce5eb63          	bltu	a1,a4,12a0 <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    11ce:	02e5763b          	remuw	a2,a0,a4
    11d2:	1602                	sll	a2,a2,0x20
    11d4:	9201                	srl	a2,a2,0x20
    11d6:	9636                	add	a2,a2,a3
    11d8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11dc:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11e0:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11e4:	0ce56763          	bltu	a0,a4,12b2 <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    11e8:	02e5f63b          	remuw	a2,a1,a4
    11ec:	1602                	sll	a2,a2,0x20
    11ee:	9201                	srl	a2,a2,0x20
    11f0:	9636                	add	a2,a2,a3
    11f2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11f6:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11fa:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11fe:	0ce5e363          	bltu	a1,a4,12c4 <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    1202:	1782                	sll	a5,a5,0x20
    1204:	9381                	srl	a5,a5,0x20
    1206:	96be                	add	a3,a3,a5
    1208:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    120c:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    120e:	00f10723          	sb	a5,14(sp)
    if (sign)
    1212:	00088763          	beqz	a7,1220 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1216:	02d00793          	li	a5,45
    121a:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    121e:	4595                	li	a1,5
    write(f, s, l);
    1220:	003c                	add	a5,sp,8
    1222:	4641                	li	a2,16
    1224:	9e0d                	subw	a2,a2,a1
    1226:	4505                	li	a0,1
    1228:	95be                	add	a1,a1,a5
    122a:	289000ef          	jal	1cb2 <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    122e:	70a2                	ld	ra,40(sp)
    1230:	6145                	add	sp,sp,48
    1232:	8082                	ret
    i++;
    1234:	45a9                	li	a1,10
    if (sign)
    1236:	fe0885e3          	beqz	a7,1220 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    123a:	02d00793          	li	a5,45
    123e:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1242:	45a5                	li	a1,9
    1244:	bff1                	j	1220 <printint.constprop.0+0x12c>
    i++;
    1246:	45bd                	li	a1,15
    if (sign)
    1248:	fc088ce3          	beqz	a7,1220 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    124c:	02d00793          	li	a5,45
    1250:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1254:	45b9                	li	a1,14
    1256:	b7e9                	j	1220 <printint.constprop.0+0x12c>
    i++;
    1258:	45b9                	li	a1,14
    if (sign)
    125a:	fc0883e3          	beqz	a7,1220 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    125e:	02d00793          	li	a5,45
    1262:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1266:	45b5                	li	a1,13
    1268:	bf65                	j	1220 <printint.constprop.0+0x12c>
    i++;
    126a:	45b5                	li	a1,13
    if (sign)
    126c:	fa088ae3          	beqz	a7,1220 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1270:	02d00793          	li	a5,45
    1274:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1278:	45b1                	li	a1,12
    127a:	b75d                	j	1220 <printint.constprop.0+0x12c>
    i++;
    127c:	45b1                	li	a1,12
    if (sign)
    127e:	fa0881e3          	beqz	a7,1220 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1282:	02d00793          	li	a5,45
    1286:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    128a:	45ad                	li	a1,11
    128c:	bf51                	j	1220 <printint.constprop.0+0x12c>
    i++;
    128e:	45ad                	li	a1,11
    if (sign)
    1290:	f80888e3          	beqz	a7,1220 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1294:	02d00793          	li	a5,45
    1298:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    129c:	45a9                	li	a1,10
    129e:	b749                	j	1220 <printint.constprop.0+0x12c>
    i++;
    12a0:	45a5                	li	a1,9
    if (sign)
    12a2:	f6088fe3          	beqz	a7,1220 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12a6:	02d00793          	li	a5,45
    12aa:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12ae:	45a1                	li	a1,8
    12b0:	bf85                	j	1220 <printint.constprop.0+0x12c>
    i++;
    12b2:	45a1                	li	a1,8
    if (sign)
    12b4:	f60886e3          	beqz	a7,1220 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12b8:	02d00793          	li	a5,45
    12bc:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12c0:	459d                	li	a1,7
    12c2:	bfb9                	j	1220 <printint.constprop.0+0x12c>
    i++;
    12c4:	459d                	li	a1,7
    if (sign)
    12c6:	f4088de3          	beqz	a7,1220 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12ca:	02d00793          	li	a5,45
    12ce:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12d2:	4599                	li	a1,6
    12d4:	b7b1                	j	1220 <printint.constprop.0+0x12c>

00000000000012d6 <getchar>:
{
    12d6:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12d8:	00f10593          	add	a1,sp,15
    12dc:	4605                	li	a2,1
    12de:	4501                	li	a0,0
{
    12e0:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12e2:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12e6:	1c3000ef          	jal	1ca8 <read>
}
    12ea:	60e2                	ld	ra,24(sp)
    12ec:	00f14503          	lbu	a0,15(sp)
    12f0:	6105                	add	sp,sp,32
    12f2:	8082                	ret

00000000000012f4 <putchar>:
{
    12f4:	1101                	add	sp,sp,-32
    12f6:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12f8:	00f10593          	add	a1,sp,15
    12fc:	4605                	li	a2,1
    12fe:	4505                	li	a0,1
{
    1300:	ec06                	sd	ra,24(sp)
    char byte = c;
    1302:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1306:	1ad000ef          	jal	1cb2 <write>
}
    130a:	60e2                	ld	ra,24(sp)
    130c:	2501                	sext.w	a0,a0
    130e:	6105                	add	sp,sp,32
    1310:	8082                	ret

0000000000001312 <puts>:
{
    1312:	1141                	add	sp,sp,-16
    1314:	e406                	sd	ra,8(sp)
    1316:	e022                	sd	s0,0(sp)
    1318:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    131a:	55a000ef          	jal	1874 <strlen>
    131e:	862a                	mv	a2,a0
    1320:	85a2                	mv	a1,s0
    1322:	4505                	li	a0,1
    1324:	18f000ef          	jal	1cb2 <write>
}
    1328:	60a2                	ld	ra,8(sp)
    132a:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    132c:	957d                	sra	a0,a0,0x3f
    return r;
    132e:	2501                	sext.w	a0,a0
}
    1330:	0141                	add	sp,sp,16
    1332:	8082                	ret

0000000000001334 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1334:	7131                	add	sp,sp,-192
    1336:	e4d6                	sd	s5,72(sp)
    1338:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    133a:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    133c:	013c                	add	a5,sp,136
{
    133e:	f0ca                	sd	s2,96(sp)
    1340:	ecce                	sd	s3,88(sp)
    1342:	e8d2                	sd	s4,80(sp)
    1344:	e0da                	sd	s6,64(sp)
    1346:	fc5e                	sd	s7,56(sp)
    1348:	fc86                	sd	ra,120(sp)
    134a:	f8a2                	sd	s0,112(sp)
    134c:	f4a6                	sd	s1,104(sp)
    134e:	e52e                	sd	a1,136(sp)
    1350:	e932                	sd	a2,144(sp)
    1352:	ed36                	sd	a3,152(sp)
    1354:	f13a                	sd	a4,160(sp)
    1356:	f942                	sd	a6,176(sp)
    1358:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    135a:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    135c:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1360:	07300a13          	li	s4,115
    1364:	07800b93          	li	s7,120
    1368:	06400b13          	li	s6,100
    buf[i++] = '0';
    136c:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x5868>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1370:	00001997          	auipc	s3,0x1
    1374:	c5898993          	add	s3,s3,-936 # 1fc8 <digits>
        if (!*s)
    1378:	00054783          	lbu	a5,0(a0)
    137c:	16078863          	beqz	a5,14ec <printf+0x1b8>
    1380:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1382:	19278063          	beq	a5,s2,1502 <printf+0x1ce>
    1386:	00164783          	lbu	a5,1(a2)
    138a:	0605                	add	a2,a2,1
    138c:	fbfd                	bnez	a5,1382 <printf+0x4e>
    138e:	84b2                	mv	s1,a2
        l = z - a;
    1390:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1394:	85aa                	mv	a1,a0
    1396:	8622                	mv	a2,s0
    1398:	4505                	li	a0,1
    139a:	119000ef          	jal	1cb2 <write>
        if (l)
    139e:	18041763          	bnez	s0,152c <printf+0x1f8>
        if (s[1] == 0)
    13a2:	0014c783          	lbu	a5,1(s1)
    13a6:	14078363          	beqz	a5,14ec <printf+0x1b8>
        switch (s[1])
    13aa:	19478f63          	beq	a5,s4,1548 <printf+0x214>
    13ae:	18fa6163          	bltu	s4,a5,1530 <printf+0x1fc>
    13b2:	1b678e63          	beq	a5,s6,156e <printf+0x23a>
    13b6:	07000713          	li	a4,112
    13ba:	1ce79463          	bne	a5,a4,1582 <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13be:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13c0:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13c4:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13c6:	631c                	ld	a5,0(a4)
    13c8:	0721                	add	a4,a4,8
    13ca:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13cc:	00479293          	sll	t0,a5,0x4
    13d0:	00879f93          	sll	t6,a5,0x8
    13d4:	00c79f13          	sll	t5,a5,0xc
    13d8:	01079e93          	sll	t4,a5,0x10
    13dc:	01479e13          	sll	t3,a5,0x14
    13e0:	01879313          	sll	t1,a5,0x18
    13e4:	01c79893          	sll	a7,a5,0x1c
    13e8:	02479813          	sll	a6,a5,0x24
    13ec:	02879513          	sll	a0,a5,0x28
    13f0:	02c79593          	sll	a1,a5,0x2c
    13f4:	03079693          	sll	a3,a5,0x30
    13f8:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13fc:	03c7d413          	srl	s0,a5,0x3c
    1400:	01c7d39b          	srlw	t2,a5,0x1c
    1404:	03c2d293          	srl	t0,t0,0x3c
    1408:	03cfdf93          	srl	t6,t6,0x3c
    140c:	03cf5f13          	srl	t5,t5,0x3c
    1410:	03cede93          	srl	t4,t4,0x3c
    1414:	03ce5e13          	srl	t3,t3,0x3c
    1418:	03c35313          	srl	t1,t1,0x3c
    141c:	03c8d893          	srl	a7,a7,0x3c
    1420:	03c85813          	srl	a6,a6,0x3c
    1424:	9171                	srl	a0,a0,0x3c
    1426:	91f1                	srl	a1,a1,0x3c
    1428:	92f1                	srl	a3,a3,0x3c
    142a:	9371                	srl	a4,a4,0x3c
    142c:	974e                	add	a4,a4,s3
    142e:	944e                	add	s0,s0,s3
    1430:	92ce                	add	t0,t0,s3
    1432:	9fce                	add	t6,t6,s3
    1434:	9f4e                	add	t5,t5,s3
    1436:	9ece                	add	t4,t4,s3
    1438:	9e4e                	add	t3,t3,s3
    143a:	934e                	add	t1,t1,s3
    143c:	98ce                	add	a7,a7,s3
    143e:	93ce                	add	t2,t2,s3
    1440:	984e                	add	a6,a6,s3
    1442:	954e                	add	a0,a0,s3
    1444:	95ce                	add	a1,a1,s3
    1446:	96ce                	add	a3,a3,s3
    1448:	00074083          	lbu	ra,0(a4)
    144c:	0002c283          	lbu	t0,0(t0)
    1450:	000fcf83          	lbu	t6,0(t6)
    1454:	000f4f03          	lbu	t5,0(t5)
    1458:	000ece83          	lbu	t4,0(t4)
    145c:	000e4e03          	lbu	t3,0(t3)
    1460:	00034303          	lbu	t1,0(t1)
    1464:	0008c883          	lbu	a7,0(a7)
    1468:	0003c383          	lbu	t2,0(t2)
    146c:	00084803          	lbu	a6,0(a6)
    1470:	00054503          	lbu	a0,0(a0)
    1474:	0005c583          	lbu	a1,0(a1)
    1478:	0006c683          	lbu	a3,0(a3)
    147c:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1480:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1484:	9371                	srl	a4,a4,0x3c
    1486:	8bbd                	and	a5,a5,15
    1488:	974e                	add	a4,a4,s3
    148a:	97ce                	add	a5,a5,s3
    148c:	005105a3          	sb	t0,11(sp)
    1490:	01f10623          	sb	t6,12(sp)
    1494:	01e106a3          	sb	t5,13(sp)
    1498:	01d10723          	sb	t4,14(sp)
    149c:	01c107a3          	sb	t3,15(sp)
    14a0:	00610823          	sb	t1,16(sp)
    14a4:	011108a3          	sb	a7,17(sp)
    14a8:	00710923          	sb	t2,18(sp)
    14ac:	010109a3          	sb	a6,19(sp)
    14b0:	00a10a23          	sb	a0,20(sp)
    14b4:	00b10aa3          	sb	a1,21(sp)
    14b8:	00d10b23          	sb	a3,22(sp)
    14bc:	00110ba3          	sb	ra,23(sp)
    14c0:	00810523          	sb	s0,10(sp)
    14c4:	00074703          	lbu	a4,0(a4)
    14c8:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14cc:	002c                	add	a1,sp,8
    14ce:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14d0:	00e10c23          	sb	a4,24(sp)
    14d4:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14d8:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14dc:	7d6000ef          	jal	1cb2 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14e0:	00248513          	add	a0,s1,2
        if (!*s)
    14e4:	00054783          	lbu	a5,0(a0)
    14e8:	e8079ce3          	bnez	a5,1380 <printf+0x4c>
    }
    va_end(ap);
}
    14ec:	70e6                	ld	ra,120(sp)
    14ee:	7446                	ld	s0,112(sp)
    14f0:	74a6                	ld	s1,104(sp)
    14f2:	7906                	ld	s2,96(sp)
    14f4:	69e6                	ld	s3,88(sp)
    14f6:	6a46                	ld	s4,80(sp)
    14f8:	6aa6                	ld	s5,72(sp)
    14fa:	6b06                	ld	s6,64(sp)
    14fc:	7be2                	ld	s7,56(sp)
    14fe:	6129                	add	sp,sp,192
    1500:	8082                	ret
    1502:	84b2                	mv	s1,a2
    1504:	a039                	j	1512 <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1506:	0024c783          	lbu	a5,2(s1)
    150a:	0605                	add	a2,a2,1
    150c:	0489                	add	s1,s1,2
    150e:	e92791e3          	bne	a5,s2,1390 <printf+0x5c>
    1512:	0014c783          	lbu	a5,1(s1)
    1516:	ff2788e3          	beq	a5,s2,1506 <printf+0x1d2>
        l = z - a;
    151a:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    151e:	85aa                	mv	a1,a0
    1520:	8622                	mv	a2,s0
    1522:	4505                	li	a0,1
    1524:	78e000ef          	jal	1cb2 <write>
        if (l)
    1528:	e6040de3          	beqz	s0,13a2 <printf+0x6e>
    152c:	8526                	mv	a0,s1
    152e:	b5a9                	j	1378 <printf+0x44>
        switch (s[1])
    1530:	05779963          	bne	a5,s7,1582 <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    1534:	6782                	ld	a5,0(sp)
    1536:	45c1                	li	a1,16
    1538:	4388                	lw	a0,0(a5)
    153a:	07a1                	add	a5,a5,8
    153c:	e03e                	sd	a5,0(sp)
    153e:	bb7ff0ef          	jal	10f4 <printint.constprop.0>
        s += 2;
    1542:	00248513          	add	a0,s1,2
    1546:	bf79                	j	14e4 <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    1548:	6782                	ld	a5,0(sp)
    154a:	6380                	ld	s0,0(a5)
    154c:	07a1                	add	a5,a5,8
    154e:	e03e                	sd	a5,0(sp)
    1550:	cc21                	beqz	s0,15a8 <printf+0x274>
            l = strnlen(a, 200);
    1552:	0c800593          	li	a1,200
    1556:	8522                	mv	a0,s0
    1558:	44e000ef          	jal	19a6 <strnlen>
    write(f, s, l);
    155c:	0005061b          	sext.w	a2,a0
    1560:	85a2                	mv	a1,s0
    1562:	4505                	li	a0,1
    1564:	74e000ef          	jal	1cb2 <write>
        s += 2;
    1568:	00248513          	add	a0,s1,2
    156c:	bfa5                	j	14e4 <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    156e:	6782                	ld	a5,0(sp)
    1570:	45a9                	li	a1,10
    1572:	4388                	lw	a0,0(a5)
    1574:	07a1                	add	a5,a5,8
    1576:	e03e                	sd	a5,0(sp)
    1578:	b7dff0ef          	jal	10f4 <printint.constprop.0>
        s += 2;
    157c:	00248513          	add	a0,s1,2
    1580:	b795                	j	14e4 <printf+0x1b0>
    return write(stdout, &byte, 1);
    1582:	4605                	li	a2,1
    1584:	002c                	add	a1,sp,8
    1586:	4505                	li	a0,1
    char byte = c;
    1588:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    158c:	726000ef          	jal	1cb2 <write>
    char byte = c;
    1590:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1594:	4605                	li	a2,1
    1596:	002c                	add	a1,sp,8
    1598:	4505                	li	a0,1
    char byte = c;
    159a:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    159e:	714000ef          	jal	1cb2 <write>
        s += 2;
    15a2:	00248513          	add	a0,s1,2
    15a6:	bf3d                	j	14e4 <printf+0x1b0>
                a = "(null)";
    15a8:	00001417          	auipc	s0,0x1
    15ac:	a0040413          	add	s0,s0,-1536 # 1fa8 <__clone+0xbe>
    15b0:	b74d                	j	1552 <printf+0x21e>

00000000000015b2 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15b2:	02000793          	li	a5,32
    15b6:	00f50663          	beq	a0,a5,15c2 <isspace+0x10>
    15ba:	355d                	addw	a0,a0,-9
    15bc:	00553513          	sltiu	a0,a0,5
    15c0:	8082                	ret
    15c2:	4505                	li	a0,1
}
    15c4:	8082                	ret

00000000000015c6 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15c6:	fd05051b          	addw	a0,a0,-48
}
    15ca:	00a53513          	sltiu	a0,a0,10
    15ce:	8082                	ret

00000000000015d0 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d0:	02000713          	li	a4,32
    15d4:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15d6:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15da:	ff76879b          	addw	a5,a3,-9
    15de:	06e68063          	beq	a3,a4,163e <atoi+0x6e>
    15e2:	0006859b          	sext.w	a1,a3
    15e6:	04f67c63          	bgeu	a2,a5,163e <atoi+0x6e>
        s++;
    switch (*s)
    15ea:	02b00793          	li	a5,43
    15ee:	06f68563          	beq	a3,a5,1658 <atoi+0x88>
    15f2:	02d00793          	li	a5,45
    15f6:	04f69663          	bne	a3,a5,1642 <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15fa:	00154683          	lbu	a3,1(a0)
    15fe:	47a5                	li	a5,9
        s++;
    1600:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1604:	fd06869b          	addw	a3,a3,-48
    1608:	8636                	mv	a2,a3
    while (isdigit(*s))
    160a:	04d7e563          	bltu	a5,a3,1654 <atoi+0x84>
        neg = 1;
    160e:	4885                	li	a7,1
    int n = 0, neg = 0;
    1610:	4501                	li	a0,0
    while (isdigit(*s))
    1612:	4825                	li	a6,9
    1614:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1618:	0025179b          	sllw	a5,a0,0x2
    161c:	9fa9                	addw	a5,a5,a0
    161e:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    1622:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    1626:	85b2                	mv	a1,a2
    1628:	40c7853b          	subw	a0,a5,a2
    162c:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    162e:	8636                	mv	a2,a3
    while (isdigit(*s))
    1630:	fed872e3          	bgeu	a6,a3,1614 <atoi+0x44>
    return neg ? n : -n;
    1634:	02089163          	bnez	a7,1656 <atoi+0x86>
    1638:	40f5853b          	subw	a0,a1,a5
    163c:	8082                	ret
        s++;
    163e:	0505                	add	a0,a0,1
    1640:	bf59                	j	15d6 <atoi+0x6>
    while (isdigit(*s))
    1642:	fd05859b          	addw	a1,a1,-48
    1646:	47a5                	li	a5,9
    1648:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    164a:	4881                	li	a7,0
    164c:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    1650:	fcb7f0e3          	bgeu	a5,a1,1610 <atoi+0x40>
    return neg ? n : -n;
    1654:	4501                	li	a0,0
}
    1656:	8082                	ret
    while (isdigit(*s))
    1658:	00154683          	lbu	a3,1(a0)
    165c:	47a5                	li	a5,9
        s++;
    165e:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1662:	fd06869b          	addw	a3,a3,-48
    1666:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    1668:	4881                	li	a7,0
    while (isdigit(*s))
    166a:	fad7f3e3          	bgeu	a5,a3,1610 <atoi+0x40>
    return neg ? n : -n;
    166e:	4501                	li	a0,0
    1670:	8082                	ret

0000000000001672 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1672:	16060f63          	beqz	a2,17f0 <memset+0x17e>
    1676:	40a006b3          	neg	a3,a0
    167a:	0076f793          	and	a5,a3,7
    167e:	00778813          	add	a6,a5,7
    1682:	48ad                	li	a7,11
    1684:	0ff5f713          	zext.b	a4,a1
    1688:	fff60593          	add	a1,a2,-1
    168c:	17186363          	bltu	a6,a7,17f2 <memset+0x180>
    1690:	1705eb63          	bltu	a1,a6,1806 <memset+0x194>
    1694:	16078163          	beqz	a5,17f6 <memset+0x184>
    1698:	00e50023          	sb	a4,0(a0)
    169c:	0066f593          	and	a1,a3,6
    16a0:	14058e63          	beqz	a1,17fc <memset+0x18a>
    16a4:	00e500a3          	sb	a4,1(a0)
    16a8:	4589                	li	a1,2
    16aa:	00250813          	add	a6,a0,2
    16ae:	04f5f663          	bgeu	a1,a5,16fa <memset+0x88>
    16b2:	00e50123          	sb	a4,2(a0)
    16b6:	8a91                	and	a3,a3,4
    16b8:	00350813          	add	a6,a0,3
    16bc:	458d                	li	a1,3
    16be:	ce95                	beqz	a3,16fa <memset+0x88>
    16c0:	00e501a3          	sb	a4,3(a0)
    16c4:	4691                	li	a3,4
    16c6:	00450813          	add	a6,a0,4
    16ca:	4591                	li	a1,4
    16cc:	02f6f763          	bgeu	a3,a5,16fa <memset+0x88>
    16d0:	00e50223          	sb	a4,4(a0)
    16d4:	4695                	li	a3,5
    16d6:	00550813          	add	a6,a0,5
    16da:	4595                	li	a1,5
    16dc:	00d78f63          	beq	a5,a3,16fa <memset+0x88>
    16e0:	00e502a3          	sb	a4,5(a0)
    16e4:	469d                	li	a3,7
    16e6:	00650813          	add	a6,a0,6
    16ea:	4599                	li	a1,6
    16ec:	00d79763          	bne	a5,a3,16fa <memset+0x88>
    16f0:	00750813          	add	a6,a0,7
    16f4:	00e50323          	sb	a4,6(a0)
    16f8:	459d                	li	a1,7
    16fa:	00871693          	sll	a3,a4,0x8
    16fe:	01071313          	sll	t1,a4,0x10
    1702:	8ed9                	or	a3,a3,a4
    1704:	01871893          	sll	a7,a4,0x18
    1708:	0066e6b3          	or	a3,a3,t1
    170c:	0116e6b3          	or	a3,a3,a7
    1710:	02071313          	sll	t1,a4,0x20
    1714:	02871893          	sll	a7,a4,0x28
    1718:	0066e6b3          	or	a3,a3,t1
    171c:	40f60e33          	sub	t3,a2,a5
    1720:	03071313          	sll	t1,a4,0x30
    1724:	0116e6b3          	or	a3,a3,a7
    1728:	0066e6b3          	or	a3,a3,t1
    172c:	03871893          	sll	a7,a4,0x38
    1730:	97aa                	add	a5,a5,a0
    1732:	ff8e7313          	and	t1,t3,-8
    1736:	0116e6b3          	or	a3,a3,a7
    173a:	00f308b3          	add	a7,t1,a5
    173e:	e394                	sd	a3,0(a5)
    1740:	07a1                	add	a5,a5,8
    1742:	ff179ee3          	bne	a5,a7,173e <memset+0xcc>
    1746:	006806b3          	add	a3,a6,t1
    174a:	00b307bb          	addw	a5,t1,a1
    174e:	0bc30b63          	beq	t1,t3,1804 <memset+0x192>
    1752:	00e68023          	sb	a4,0(a3)
    1756:	0017859b          	addw	a1,a5,1
    175a:	08c5fb63          	bgeu	a1,a2,17f0 <memset+0x17e>
    175e:	00e680a3          	sb	a4,1(a3)
    1762:	0027859b          	addw	a1,a5,2
    1766:	08c5f563          	bgeu	a1,a2,17f0 <memset+0x17e>
    176a:	00e68123          	sb	a4,2(a3)
    176e:	0037859b          	addw	a1,a5,3
    1772:	06c5ff63          	bgeu	a1,a2,17f0 <memset+0x17e>
    1776:	00e681a3          	sb	a4,3(a3)
    177a:	0047859b          	addw	a1,a5,4
    177e:	06c5f963          	bgeu	a1,a2,17f0 <memset+0x17e>
    1782:	00e68223          	sb	a4,4(a3)
    1786:	0057859b          	addw	a1,a5,5
    178a:	06c5f363          	bgeu	a1,a2,17f0 <memset+0x17e>
    178e:	00e682a3          	sb	a4,5(a3)
    1792:	0067859b          	addw	a1,a5,6
    1796:	04c5fd63          	bgeu	a1,a2,17f0 <memset+0x17e>
    179a:	00e68323          	sb	a4,6(a3)
    179e:	0077859b          	addw	a1,a5,7
    17a2:	04c5f763          	bgeu	a1,a2,17f0 <memset+0x17e>
    17a6:	00e683a3          	sb	a4,7(a3)
    17aa:	0087859b          	addw	a1,a5,8
    17ae:	04c5f163          	bgeu	a1,a2,17f0 <memset+0x17e>
    17b2:	00e68423          	sb	a4,8(a3)
    17b6:	0097859b          	addw	a1,a5,9
    17ba:	02c5fb63          	bgeu	a1,a2,17f0 <memset+0x17e>
    17be:	00e684a3          	sb	a4,9(a3)
    17c2:	00a7859b          	addw	a1,a5,10
    17c6:	02c5f563          	bgeu	a1,a2,17f0 <memset+0x17e>
    17ca:	00e68523          	sb	a4,10(a3)
    17ce:	00b7859b          	addw	a1,a5,11
    17d2:	00c5ff63          	bgeu	a1,a2,17f0 <memset+0x17e>
    17d6:	00e685a3          	sb	a4,11(a3)
    17da:	00c7859b          	addw	a1,a5,12
    17de:	00c5f963          	bgeu	a1,a2,17f0 <memset+0x17e>
    17e2:	00e68623          	sb	a4,12(a3)
    17e6:	27b5                	addw	a5,a5,13
    17e8:	00c7f463          	bgeu	a5,a2,17f0 <memset+0x17e>
    17ec:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17f0:	8082                	ret
    17f2:	482d                	li	a6,11
    17f4:	bd71                	j	1690 <memset+0x1e>
    char *p = dest;
    17f6:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17f8:	4581                	li	a1,0
    17fa:	b701                	j	16fa <memset+0x88>
    17fc:	00150813          	add	a6,a0,1
    1800:	4585                	li	a1,1
    1802:	bde5                	j	16fa <memset+0x88>
    1804:	8082                	ret
    char *p = dest;
    1806:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1808:	4781                	li	a5,0
    180a:	b7a1                	j	1752 <memset+0xe0>

000000000000180c <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    180c:	00054783          	lbu	a5,0(a0)
    1810:	0005c703          	lbu	a4,0(a1)
    1814:	00e79863          	bne	a5,a4,1824 <strcmp+0x18>
    1818:	0505                	add	a0,a0,1
    181a:	0585                	add	a1,a1,1
    181c:	fbe5                	bnez	a5,180c <strcmp>
    181e:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1820:	9d19                	subw	a0,a0,a4
    1822:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1824:	0007851b          	sext.w	a0,a5
    1828:	bfe5                	j	1820 <strcmp+0x14>

000000000000182a <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    182a:	ca15                	beqz	a2,185e <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    182c:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1830:	167d                	add	a2,a2,-1
    1832:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1836:	eb99                	bnez	a5,184c <strncmp+0x22>
    1838:	a815                	j	186c <strncmp+0x42>
    183a:	00a68e63          	beq	a3,a0,1856 <strncmp+0x2c>
    183e:	0505                	add	a0,a0,1
    1840:	00f71b63          	bne	a4,a5,1856 <strncmp+0x2c>
    1844:	00054783          	lbu	a5,0(a0)
    1848:	cf89                	beqz	a5,1862 <strncmp+0x38>
    184a:	85b2                	mv	a1,a2
    184c:	0005c703          	lbu	a4,0(a1)
    1850:	00158613          	add	a2,a1,1
    1854:	f37d                	bnez	a4,183a <strncmp+0x10>
        ;
    return *l - *r;
    1856:	0007851b          	sext.w	a0,a5
    185a:	9d19                	subw	a0,a0,a4
    185c:	8082                	ret
        return 0;
    185e:	4501                	li	a0,0
}
    1860:	8082                	ret
    return *l - *r;
    1862:	0015c703          	lbu	a4,1(a1)
    1866:	4501                	li	a0,0
    1868:	9d19                	subw	a0,a0,a4
    186a:	8082                	ret
    186c:	0005c703          	lbu	a4,0(a1)
    1870:	4501                	li	a0,0
    1872:	b7e5                	j	185a <strncmp+0x30>

0000000000001874 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1874:	00757793          	and	a5,a0,7
    1878:	cf89                	beqz	a5,1892 <strlen+0x1e>
    187a:	87aa                	mv	a5,a0
    187c:	a029                	j	1886 <strlen+0x12>
    187e:	0785                	add	a5,a5,1
    1880:	0077f713          	and	a4,a5,7
    1884:	cb01                	beqz	a4,1894 <strlen+0x20>
        if (!*s)
    1886:	0007c703          	lbu	a4,0(a5)
    188a:	fb75                	bnez	a4,187e <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    188c:	40a78533          	sub	a0,a5,a0
}
    1890:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1892:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1894:	feff05b7          	lui	a1,0xfeff0
    1898:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedf37>
    189c:	f0101637          	lui	a2,0xf0101
    18a0:	05c2                	sll	a1,a1,0x10
    18a2:	0612                	sll	a2,a2,0x4
    18a4:	6394                	ld	a3,0(a5)
    18a6:	eff58593          	add	a1,a1,-257
    18aa:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff139>
    18ae:	05c2                	sll	a1,a1,0x10
    18b0:	0642                	sll	a2,a2,0x10
    18b2:	eff58593          	add	a1,a1,-257
    18b6:	10160613          	add	a2,a2,257
    18ba:	00b68733          	add	a4,a3,a1
    18be:	063e                	sll	a2,a2,0xf
    18c0:	fff6c693          	not	a3,a3
    18c4:	8f75                	and	a4,a4,a3
    18c6:	08060613          	add	a2,a2,128
    18ca:	8f71                	and	a4,a4,a2
    18cc:	eb11                	bnez	a4,18e0 <strlen+0x6c>
    18ce:	6794                	ld	a3,8(a5)
    18d0:	07a1                	add	a5,a5,8
    18d2:	00b68733          	add	a4,a3,a1
    18d6:	fff6c693          	not	a3,a3
    18da:	8f75                	and	a4,a4,a3
    18dc:	8f71                	and	a4,a4,a2
    18de:	db65                	beqz	a4,18ce <strlen+0x5a>
    for (; *s; s++)
    18e0:	0007c703          	lbu	a4,0(a5)
    18e4:	d745                	beqz	a4,188c <strlen+0x18>
    18e6:	0017c703          	lbu	a4,1(a5)
    18ea:	0785                	add	a5,a5,1
    18ec:	d345                	beqz	a4,188c <strlen+0x18>
    18ee:	0017c703          	lbu	a4,1(a5)
    18f2:	0785                	add	a5,a5,1
    18f4:	fb6d                	bnez	a4,18e6 <strlen+0x72>
    18f6:	bf59                	j	188c <strlen+0x18>

00000000000018f8 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18f8:	00757713          	and	a4,a0,7
{
    18fc:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18fe:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1902:	cb19                	beqz	a4,1918 <memchr+0x20>
    1904:	ce59                	beqz	a2,19a2 <memchr+0xaa>
    1906:	0007c703          	lbu	a4,0(a5)
    190a:	00b70963          	beq	a4,a1,191c <memchr+0x24>
    190e:	0785                	add	a5,a5,1
    1910:	0077f713          	and	a4,a5,7
    1914:	167d                	add	a2,a2,-1
    1916:	f77d                	bnez	a4,1904 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1918:	4501                	li	a0,0
    if (n && *s != c)
    191a:	c649                	beqz	a2,19a4 <memchr+0xac>
    191c:	0007c703          	lbu	a4,0(a5)
    1920:	06b70663          	beq	a4,a1,198c <memchr+0x94>
        size_t k = ONES * c;
    1924:	01010737          	lui	a4,0x1010
    1928:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e139>
    192c:	0742                	sll	a4,a4,0x10
    192e:	10170713          	add	a4,a4,257
    1932:	0742                	sll	a4,a4,0x10
    1934:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1938:	469d                	li	a3,7
        size_t k = ONES * c;
    193a:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    193e:	04c6f763          	bgeu	a3,a2,198c <memchr+0x94>
    1942:	f0101837          	lui	a6,0xf0101
    1946:	feff08b7          	lui	a7,0xfeff0
    194a:	0812                	sll	a6,a6,0x4
    194c:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedf37>
    1950:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff139>
    1954:	08c2                	sll	a7,a7,0x10
    1956:	0842                	sll	a6,a6,0x10
    1958:	eff88893          	add	a7,a7,-257
    195c:	10180813          	add	a6,a6,257
    1960:	08c2                	sll	a7,a7,0x10
    1962:	083e                	sll	a6,a6,0xf
    1964:	eff88893          	add	a7,a7,-257
    1968:	08080813          	add	a6,a6,128
    196c:	431d                	li	t1,7
    196e:	a029                	j	1978 <memchr+0x80>
    1970:	1661                	add	a2,a2,-8
    1972:	07a1                	add	a5,a5,8
    1974:	02c37663          	bgeu	t1,a2,19a0 <memchr+0xa8>
    1978:	6398                	ld	a4,0(a5)
    197a:	8f29                	xor	a4,a4,a0
    197c:	011706b3          	add	a3,a4,a7
    1980:	fff74713          	not	a4,a4
    1984:	8f75                	and	a4,a4,a3
    1986:	01077733          	and	a4,a4,a6
    198a:	d37d                	beqz	a4,1970 <memchr+0x78>
        s = (const void *)w;
    198c:	853e                	mv	a0,a5
    198e:	a019                	j	1994 <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    1990:	0505                	add	a0,a0,1
    1992:	ca01                	beqz	a2,19a2 <memchr+0xaa>
    1994:	00054783          	lbu	a5,0(a0)
    1998:	167d                	add	a2,a2,-1
    199a:	feb79be3          	bne	a5,a1,1990 <memchr+0x98>
    199e:	8082                	ret
    19a0:	f675                	bnez	a2,198c <memchr+0x94>
    return n ? (void *)s : 0;
    19a2:	4501                	li	a0,0
}
    19a4:	8082                	ret

00000000000019a6 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19a6:	1101                	add	sp,sp,-32
    19a8:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19aa:	862e                	mv	a2,a1
{
    19ac:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19ae:	4581                	li	a1,0
{
    19b0:	e426                	sd	s1,8(sp)
    19b2:	ec06                	sd	ra,24(sp)
    19b4:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19b6:	f43ff0ef          	jal	18f8 <memchr>
    return p ? p - s : n;
    19ba:	c519                	beqz	a0,19c8 <strnlen+0x22>
}
    19bc:	60e2                	ld	ra,24(sp)
    19be:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19c0:	8d05                	sub	a0,a0,s1
}
    19c2:	64a2                	ld	s1,8(sp)
    19c4:	6105                	add	sp,sp,32
    19c6:	8082                	ret
    19c8:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19ca:	8522                	mv	a0,s0
}
    19cc:	6442                	ld	s0,16(sp)
    19ce:	64a2                	ld	s1,8(sp)
    19d0:	6105                	add	sp,sp,32
    19d2:	8082                	ret

00000000000019d4 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19d4:	00b547b3          	xor	a5,a0,a1
    19d8:	8b9d                	and	a5,a5,7
    19da:	efb1                	bnez	a5,1a36 <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19dc:	0075f793          	and	a5,a1,7
    19e0:	ebb5                	bnez	a5,1a54 <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19e2:	feff0637          	lui	a2,0xfeff0
    19e6:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedf37>
    19ea:	f01016b7          	lui	a3,0xf0101
    19ee:	0642                	sll	a2,a2,0x10
    19f0:	0692                	sll	a3,a3,0x4
    19f2:	6198                	ld	a4,0(a1)
    19f4:	eff60613          	add	a2,a2,-257
    19f8:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff139>
    19fc:	0642                	sll	a2,a2,0x10
    19fe:	06c2                	sll	a3,a3,0x10
    1a00:	eff60613          	add	a2,a2,-257
    1a04:	10168693          	add	a3,a3,257
    1a08:	00c707b3          	add	a5,a4,a2
    1a0c:	fff74813          	not	a6,a4
    1a10:	06be                	sll	a3,a3,0xf
    1a12:	0107f7b3          	and	a5,a5,a6
    1a16:	08068693          	add	a3,a3,128
    1a1a:	8ff5                	and	a5,a5,a3
    1a1c:	ef89                	bnez	a5,1a36 <strcpy+0x62>
    1a1e:	05a1                	add	a1,a1,8
    1a20:	e118                	sd	a4,0(a0)
    1a22:	6198                	ld	a4,0(a1)
    1a24:	0521                	add	a0,a0,8
    1a26:	00c707b3          	add	a5,a4,a2
    1a2a:	fff74813          	not	a6,a4
    1a2e:	0107f7b3          	and	a5,a5,a6
    1a32:	8ff5                	and	a5,a5,a3
    1a34:	d7ed                	beqz	a5,1a1e <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a36:	0005c783          	lbu	a5,0(a1)
    1a3a:	00f50023          	sb	a5,0(a0)
    1a3e:	c785                	beqz	a5,1a66 <strcpy+0x92>
    1a40:	0015c783          	lbu	a5,1(a1)
    1a44:	0505                	add	a0,a0,1
    1a46:	0585                	add	a1,a1,1
    1a48:	00f50023          	sb	a5,0(a0)
    1a4c:	fbf5                	bnez	a5,1a40 <strcpy+0x6c>
        ;
    return d;
}
    1a4e:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a50:	0505                	add	a0,a0,1
    1a52:	db41                	beqz	a4,19e2 <strcpy+0xe>
            if (!(*d = *s))
    1a54:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a58:	0585                	add	a1,a1,1
    1a5a:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a5e:	00f50023          	sb	a5,0(a0)
    1a62:	f7fd                	bnez	a5,1a50 <strcpy+0x7c>
}
    1a64:	8082                	ret
    1a66:	8082                	ret

0000000000001a68 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a68:	00b547b3          	xor	a5,a0,a1
    1a6c:	8b9d                	and	a5,a5,7
    1a6e:	efbd                	bnez	a5,1aec <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a70:	0075f793          	and	a5,a1,7
    1a74:	1c078563          	beqz	a5,1c3e <strncpy+0x1d6>
    1a78:	ea11                	bnez	a2,1a8c <strncpy+0x24>
    1a7a:	8082                	ret
    1a7c:	0585                	add	a1,a1,1
    1a7e:	0075f793          	and	a5,a1,7
    1a82:	167d                	add	a2,a2,-1
    1a84:	0505                	add	a0,a0,1
    1a86:	1a078c63          	beqz	a5,1c3e <strncpy+0x1d6>
    1a8a:	ca3d                	beqz	a2,1b00 <strncpy+0x98>
    1a8c:	0005c783          	lbu	a5,0(a1)
    1a90:	00f50023          	sb	a5,0(a0)
    1a94:	f7e5                	bnez	a5,1a7c <strncpy+0x14>
            ;
        if (!n || !*s)
    1a96:	0005c783          	lbu	a5,0(a1)
    1a9a:	c7a5                	beqz	a5,1b02 <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a9c:	479d                	li	a5,7
    1a9e:	04c7f863          	bgeu	a5,a2,1aee <strncpy+0x86>
    1aa2:	f01016b7          	lui	a3,0xf0101
    1aa6:	feff0837          	lui	a6,0xfeff0
    1aaa:	0692                	sll	a3,a3,0x4
    1aac:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedf37>
    1ab0:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff139>
    1ab4:	0842                	sll	a6,a6,0x10
    1ab6:	06c2                	sll	a3,a3,0x10
    1ab8:	eff80813          	add	a6,a6,-257
    1abc:	10168693          	add	a3,a3,257
    1ac0:	0842                	sll	a6,a6,0x10
    1ac2:	06be                	sll	a3,a3,0xf
    1ac4:	eff80813          	add	a6,a6,-257
    1ac8:	08068693          	add	a3,a3,128
    1acc:	431d                	li	t1,7
    1ace:	6198                	ld	a4,0(a1)
    1ad0:	010707b3          	add	a5,a4,a6
    1ad4:	fff74893          	not	a7,a4
    1ad8:	0117f7b3          	and	a5,a5,a7
    1adc:	8ff5                	and	a5,a5,a3
    1ade:	eb81                	bnez	a5,1aee <strncpy+0x86>
            *wd = *ws;
    1ae0:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ae2:	1661                	add	a2,a2,-8
    1ae4:	05a1                	add	a1,a1,8
    1ae6:	0521                	add	a0,a0,8
    1ae8:	fec363e3          	bltu	t1,a2,1ace <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1aec:	ca11                	beqz	a2,1b00 <strncpy+0x98>
    1aee:	0005c783          	lbu	a5,0(a1)
    1af2:	0585                	add	a1,a1,1
    1af4:	00f50023          	sb	a5,0(a0)
    1af8:	c789                	beqz	a5,1b02 <strncpy+0x9a>
    1afa:	167d                	add	a2,a2,-1
    1afc:	0505                	add	a0,a0,1
    1afe:	fa65                	bnez	a2,1aee <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b00:	8082                	ret
    1b02:	40a00733          	neg	a4,a0
    1b06:	00777793          	and	a5,a4,7
    1b0a:	00778693          	add	a3,a5,7
    1b0e:	482d                	li	a6,11
    1b10:	fff60593          	add	a1,a2,-1
    1b14:	1106ef63          	bltu	a3,a6,1c32 <strncpy+0x1ca>
    1b18:	12d5ee63          	bltu	a1,a3,1c54 <strncpy+0x1ec>
    1b1c:	12078563          	beqz	a5,1c46 <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b20:	00050023          	sb	zero,0(a0)
    1b24:	00677693          	and	a3,a4,6
    1b28:	12068263          	beqz	a3,1c4c <strncpy+0x1e4>
    1b2c:	000500a3          	sb	zero,1(a0)
    1b30:	4689                	li	a3,2
    1b32:	12f6f463          	bgeu	a3,a5,1c5a <strncpy+0x1f2>
    1b36:	00050123          	sb	zero,2(a0)
    1b3a:	8b11                	and	a4,a4,4
    1b3c:	cf6d                	beqz	a4,1c36 <strncpy+0x1ce>
    1b3e:	000501a3          	sb	zero,3(a0)
    1b42:	4711                	li	a4,4
    1b44:	00450693          	add	a3,a0,4
    1b48:	02f77363          	bgeu	a4,a5,1b6e <strncpy+0x106>
    1b4c:	00050223          	sb	zero,4(a0)
    1b50:	4715                	li	a4,5
    1b52:	00550693          	add	a3,a0,5
    1b56:	00e78c63          	beq	a5,a4,1b6e <strncpy+0x106>
    1b5a:	000502a3          	sb	zero,5(a0)
    1b5e:	471d                	li	a4,7
    1b60:	10e79163          	bne	a5,a4,1c62 <strncpy+0x1fa>
    1b64:	00750693          	add	a3,a0,7
    1b68:	00050323          	sb	zero,6(a0)
    1b6c:	471d                	li	a4,7
    1b6e:	40f608b3          	sub	a7,a2,a5
    1b72:	ff88f813          	and	a6,a7,-8
    1b76:	97aa                	add	a5,a5,a0
    1b78:	010785b3          	add	a1,a5,a6
    1b7c:	0007b023          	sd	zero,0(a5)
    1b80:	07a1                	add	a5,a5,8
    1b82:	feb79de3          	bne	a5,a1,1b7c <strncpy+0x114>
    1b86:	00e807bb          	addw	a5,a6,a4
    1b8a:	01068733          	add	a4,a3,a6
    1b8e:	0b088b63          	beq	a7,a6,1c44 <strncpy+0x1dc>
    1b92:	00070023          	sb	zero,0(a4)
    1b96:	0017869b          	addw	a3,a5,1
    1b9a:	f6c6f3e3          	bgeu	a3,a2,1b00 <strncpy+0x98>
    1b9e:	000700a3          	sb	zero,1(a4)
    1ba2:	0027869b          	addw	a3,a5,2
    1ba6:	f4c6fde3          	bgeu	a3,a2,1b00 <strncpy+0x98>
    1baa:	00070123          	sb	zero,2(a4)
    1bae:	0037869b          	addw	a3,a5,3
    1bb2:	f4c6f7e3          	bgeu	a3,a2,1b00 <strncpy+0x98>
    1bb6:	000701a3          	sb	zero,3(a4)
    1bba:	0047869b          	addw	a3,a5,4
    1bbe:	f4c6f1e3          	bgeu	a3,a2,1b00 <strncpy+0x98>
    1bc2:	00070223          	sb	zero,4(a4)
    1bc6:	0057869b          	addw	a3,a5,5
    1bca:	f2c6fbe3          	bgeu	a3,a2,1b00 <strncpy+0x98>
    1bce:	000702a3          	sb	zero,5(a4)
    1bd2:	0067869b          	addw	a3,a5,6
    1bd6:	f2c6f5e3          	bgeu	a3,a2,1b00 <strncpy+0x98>
    1bda:	00070323          	sb	zero,6(a4)
    1bde:	0077869b          	addw	a3,a5,7
    1be2:	f0c6ffe3          	bgeu	a3,a2,1b00 <strncpy+0x98>
    1be6:	000703a3          	sb	zero,7(a4)
    1bea:	0087869b          	addw	a3,a5,8
    1bee:	f0c6f9e3          	bgeu	a3,a2,1b00 <strncpy+0x98>
    1bf2:	00070423          	sb	zero,8(a4)
    1bf6:	0097869b          	addw	a3,a5,9
    1bfa:	f0c6f3e3          	bgeu	a3,a2,1b00 <strncpy+0x98>
    1bfe:	000704a3          	sb	zero,9(a4)
    1c02:	00a7869b          	addw	a3,a5,10
    1c06:	eec6fde3          	bgeu	a3,a2,1b00 <strncpy+0x98>
    1c0a:	00070523          	sb	zero,10(a4)
    1c0e:	00b7869b          	addw	a3,a5,11
    1c12:	eec6f7e3          	bgeu	a3,a2,1b00 <strncpy+0x98>
    1c16:	000705a3          	sb	zero,11(a4)
    1c1a:	00c7869b          	addw	a3,a5,12
    1c1e:	eec6f1e3          	bgeu	a3,a2,1b00 <strncpy+0x98>
    1c22:	00070623          	sb	zero,12(a4)
    1c26:	27b5                	addw	a5,a5,13
    1c28:	ecc7fce3          	bgeu	a5,a2,1b00 <strncpy+0x98>
    1c2c:	000706a3          	sb	zero,13(a4)
}
    1c30:	8082                	ret
    1c32:	46ad                	li	a3,11
    1c34:	b5d5                	j	1b18 <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c36:	00350693          	add	a3,a0,3
    1c3a:	470d                	li	a4,3
    1c3c:	bf0d                	j	1b6e <strncpy+0x106>
        if (!n || !*s)
    1c3e:	e4061ce3          	bnez	a2,1a96 <strncpy+0x2e>
}
    1c42:	8082                	ret
    1c44:	8082                	ret
    char *p = dest;
    1c46:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c48:	4701                	li	a4,0
    1c4a:	b715                	j	1b6e <strncpy+0x106>
    1c4c:	00150693          	add	a3,a0,1
    1c50:	4705                	li	a4,1
    1c52:	bf31                	j	1b6e <strncpy+0x106>
    char *p = dest;
    1c54:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c56:	4781                	li	a5,0
    1c58:	bf2d                	j	1b92 <strncpy+0x12a>
    1c5a:	00250693          	add	a3,a0,2
    1c5e:	4709                	li	a4,2
    1c60:	b739                	j	1b6e <strncpy+0x106>
    1c62:	00650693          	add	a3,a0,6
    1c66:	4719                	li	a4,6
    1c68:	b719                	j	1b6e <strncpy+0x106>

0000000000001c6a <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c6a:	87aa                	mv	a5,a0
    1c6c:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c6e:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c72:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c76:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c78:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c7a:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c7e:	2501                	sext.w	a0,a0
    1c80:	8082                	ret

0000000000001c82 <openat>:
    register long a7 __asm__("a7") = n;
    1c82:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c86:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c8a:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c8e:	2501                	sext.w	a0,a0
    1c90:	8082                	ret

0000000000001c92 <fcntl>:
    register long a7 __asm__("a7") = n;
    1c92:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c94:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1c98:	2501                	sext.w	a0,a0
    1c9a:	8082                	ret

0000000000001c9c <close>:
    register long a7 __asm__("a7") = n;
    1c9c:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1ca0:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1ca4:	2501                	sext.w	a0,a0
    1ca6:	8082                	ret

0000000000001ca8 <read>:
    register long a7 __asm__("a7") = n;
    1ca8:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cac:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1cb0:	8082                	ret

0000000000001cb2 <write>:
    register long a7 __asm__("a7") = n;
    1cb2:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cb6:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1cba:	8082                	ret

0000000000001cbc <getpid>:
    register long a7 __asm__("a7") = n;
    1cbc:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1cc0:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1cc4:	2501                	sext.w	a0,a0
    1cc6:	8082                	ret

0000000000001cc8 <getppid>:
    register long a7 __asm__("a7") = n;
    1cc8:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1ccc:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cd0:	2501                	sext.w	a0,a0
    1cd2:	8082                	ret

0000000000001cd4 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cd4:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cd8:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cdc:	2501                	sext.w	a0,a0
    1cde:	8082                	ret

0000000000001ce0 <fork>:
    register long a7 __asm__("a7") = n;
    1ce0:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1ce4:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1ce6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ce8:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cec:	2501                	sext.w	a0,a0
    1cee:	8082                	ret

0000000000001cf0 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cf0:	85b2                	mv	a1,a2
    1cf2:	863a                	mv	a2,a4
    if (stack)
    1cf4:	c191                	beqz	a1,1cf8 <clone+0x8>
	stack += stack_size;
    1cf6:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cf8:	4781                	li	a5,0
    1cfa:	4701                	li	a4,0
    1cfc:	4681                	li	a3,0
    1cfe:	2601                	sext.w	a2,a2
    1d00:	a2ed                	j	1eea <__clone>

0000000000001d02 <exit>:
    register long a7 __asm__("a7") = n;
    1d02:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d06:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d0a:	8082                	ret

0000000000001d0c <waitpid>:
    register long a7 __asm__("a7") = n;
    1d0c:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d10:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d12:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d16:	2501                	sext.w	a0,a0
    1d18:	8082                	ret

0000000000001d1a <exec>:
    register long a7 __asm__("a7") = n;
    1d1a:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d1e:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d22:	2501                	sext.w	a0,a0
    1d24:	8082                	ret

0000000000001d26 <execve>:
    register long a7 __asm__("a7") = n;
    1d26:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d2a:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d2e:	2501                	sext.w	a0,a0
    1d30:	8082                	ret

0000000000001d32 <times>:
    register long a7 __asm__("a7") = n;
    1d32:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d36:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d3a:	2501                	sext.w	a0,a0
    1d3c:	8082                	ret

0000000000001d3e <get_time>:

int64 get_time()
{
    1d3e:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d40:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d44:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d46:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d48:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d4c:	2501                	sext.w	a0,a0
    1d4e:	ed09                	bnez	a0,1d68 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d50:	67a2                	ld	a5,8(sp)
    1d52:	3e800713          	li	a4,1000
    1d56:	00015503          	lhu	a0,0(sp)
    1d5a:	02e7d7b3          	divu	a5,a5,a4
    1d5e:	02e50533          	mul	a0,a0,a4
    1d62:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d64:	0141                	add	sp,sp,16
    1d66:	8082                	ret
        return -1;
    1d68:	557d                	li	a0,-1
    1d6a:	bfed                	j	1d64 <get_time+0x26>

0000000000001d6c <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d6c:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d70:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d74:	2501                	sext.w	a0,a0
    1d76:	8082                	ret

0000000000001d78 <time>:
    register long a7 __asm__("a7") = n;
    1d78:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d7c:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d80:	2501                	sext.w	a0,a0
    1d82:	8082                	ret

0000000000001d84 <sleep>:

int sleep(unsigned long long time)
{
    1d84:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d86:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d88:	850a                	mv	a0,sp
    1d8a:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d8c:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d90:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d92:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d96:	e501                	bnez	a0,1d9e <sleep+0x1a>
    return 0;
    1d98:	4501                	li	a0,0
}
    1d9a:	0141                	add	sp,sp,16
    1d9c:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d9e:	4502                	lw	a0,0(sp)
}
    1da0:	0141                	add	sp,sp,16
    1da2:	8082                	ret

0000000000001da4 <set_priority>:
    register long a7 __asm__("a7") = n;
    1da4:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1da8:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1dac:	2501                	sext.w	a0,a0
    1dae:	8082                	ret

0000000000001db0 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1db0:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1db4:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1db8:	8082                	ret

0000000000001dba <munmap>:
    register long a7 __asm__("a7") = n;
    1dba:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dbe:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1dc2:	2501                	sext.w	a0,a0
    1dc4:	8082                	ret

0000000000001dc6 <wait>:

int wait(int *code)
{
    1dc6:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dc8:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1dcc:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1dce:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1dd0:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dd2:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1dd6:	2501                	sext.w	a0,a0
    1dd8:	8082                	ret

0000000000001dda <spawn>:
    register long a7 __asm__("a7") = n;
    1dda:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1dde:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1de2:	2501                	sext.w	a0,a0
    1de4:	8082                	ret

0000000000001de6 <mailread>:
    register long a7 __asm__("a7") = n;
    1de6:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dea:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dee:	2501                	sext.w	a0,a0
    1df0:	8082                	ret

0000000000001df2 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1df2:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df6:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dfa:	2501                	sext.w	a0,a0
    1dfc:	8082                	ret

0000000000001dfe <fstat>:
    register long a7 __asm__("a7") = n;
    1dfe:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e02:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e06:	2501                	sext.w	a0,a0
    1e08:	8082                	ret

0000000000001e0a <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e0a:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e0c:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e10:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e12:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e16:	2501                	sext.w	a0,a0
    1e18:	8082                	ret

0000000000001e1a <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e1a:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e1c:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e20:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e22:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e26:	2501                	sext.w	a0,a0
    1e28:	8082                	ret

0000000000001e2a <link>:

int link(char *old_path, char *new_path)
{
    1e2a:	87aa                	mv	a5,a0
    1e2c:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e2e:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e32:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e36:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e38:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e3c:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e3e:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e42:	2501                	sext.w	a0,a0
    1e44:	8082                	ret

0000000000001e46 <unlink>:

int unlink(char *path)
{
    1e46:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e48:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e4c:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e50:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e52:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e56:	2501                	sext.w	a0,a0
    1e58:	8082                	ret

0000000000001e5a <uname>:
    register long a7 __asm__("a7") = n;
    1e5a:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e5e:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e62:	2501                	sext.w	a0,a0
    1e64:	8082                	ret

0000000000001e66 <brk>:
    register long a7 __asm__("a7") = n;
    1e66:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e6a:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e6e:	2501                	sext.w	a0,a0
    1e70:	8082                	ret

0000000000001e72 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e72:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e74:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e78:	8082                	ret

0000000000001e7a <chdir>:
    register long a7 __asm__("a7") = n;
    1e7a:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e7e:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e82:	2501                	sext.w	a0,a0
    1e84:	8082                	ret

0000000000001e86 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e86:	862e                	mv	a2,a1
    1e88:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e8a:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e8c:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e90:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e94:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e96:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e98:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e9c:	2501                	sext.w	a0,a0
    1e9e:	8082                	ret

0000000000001ea0 <getdents>:
    register long a7 __asm__("a7") = n;
    1ea0:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ea4:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1ea8:	2501                	sext.w	a0,a0
    1eaa:	8082                	ret

0000000000001eac <pipe>:
    register long a7 __asm__("a7") = n;
    1eac:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1eb0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb2:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1eb6:	2501                	sext.w	a0,a0
    1eb8:	8082                	ret

0000000000001eba <dup>:
    register long a7 __asm__("a7") = n;
    1eba:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1ebc:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1ec0:	2501                	sext.w	a0,a0
    1ec2:	8082                	ret

0000000000001ec4 <dup2>:
    register long a7 __asm__("a7") = n;
    1ec4:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1ec6:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ec8:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ecc:	2501                	sext.w	a0,a0
    1ece:	8082                	ret

0000000000001ed0 <mount>:
    register long a7 __asm__("a7") = n;
    1ed0:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ed4:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ed8:	2501                	sext.w	a0,a0
    1eda:	8082                	ret

0000000000001edc <umount>:
    register long a7 __asm__("a7") = n;
    1edc:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ee0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ee2:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ee6:	2501                	sext.w	a0,a0
    1ee8:	8082                	ret

0000000000001eea <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1eea:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1eec:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1eee:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ef0:	8532                	mv	a0,a2
	mv a2, a4
    1ef2:	863a                	mv	a2,a4
	mv a3, a5
    1ef4:	86be                	mv	a3,a5
	mv a4, a6
    1ef6:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ef8:	0dc00893          	li	a7,220
	ecall
    1efc:	00000073          	ecall

	beqz a0, 1f
    1f00:	c111                	beqz	a0,1f04 <__clone+0x1a>
	# Parent
	ret
    1f02:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f04:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f06:	6522                	ld	a0,8(sp)
	jalr a1
    1f08:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f0a:	05d00893          	li	a7,93
	ecall
    1f0e:	00000073          	ecall
