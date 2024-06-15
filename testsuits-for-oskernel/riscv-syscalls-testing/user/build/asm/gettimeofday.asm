
/home/brightnight/OScompetition/6.13晚final_main/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/gettimeofday：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a8d9                	j	10d8 <__start_main>

0000000000001004 <test_gettimeofday>:
 * "start:[num], end:[num]"
 * "interval: [num]"	注：数字[num]的值应大于0
 * 测试失败时的输出：
 * "gettimeofday error."
 */
void test_gettimeofday() {
    1004:	7179                	addi	sp,sp,-48
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f0a50513          	addi	a0,a0,-246 # 1f10 <__clone+0x2c>
void test_gettimeofday() {
    100e:	f406                	sd	ra,40(sp)
    1010:	ec26                	sd	s1,24(sp)
    1012:	f022                	sd	s0,32(sp)
	TEST_START(__func__);
    1014:	336000ef          	jal	ra,134a <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	fa850513          	addi	a0,a0,-88 # 1fc0 <__func__.0>
    1020:	32a000ef          	jal	ra,134a <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	f0450513          	addi	a0,a0,-252 # 1f28 <__clone+0x44>
    102c:	31e000ef          	jal	ra,134a <puts>
	int test_ret1 = get_time();
    1030:	509000ef          	jal	ra,1d38 <get_time>
	volatile int i = 12500000;	// qemu时钟频率12500000
    1034:	00bec7b7          	lui	a5,0xbec
    1038:	c2078793          	addi	a5,a5,-992 # bebc20 <digits+0xbe9c48>
    103c:	c63e                	sw	a5,12(sp)
	while(i > 0) i--;
    103e:	47b2                	lw	a5,12(sp)
	int test_ret1 = get_time();
    1040:	0005049b          	sext.w	s1,a0
	while(i > 0) i--;
    1044:	00f05863          	blez	a5,1054 <test_gettimeofday+0x50>
    1048:	47b2                	lw	a5,12(sp)
    104a:	37fd                	addiw	a5,a5,-1
    104c:	c63e                	sw	a5,12(sp)
    104e:	47b2                	lw	a5,12(sp)
    1050:	fef04ce3          	bgtz	a5,1048 <test_gettimeofday+0x44>
	int test_ret2 = get_time();
    1054:	4e5000ef          	jal	ra,1d38 <get_time>
	if(test_ret1 > 0 && test_ret2 > 0){
    1058:	00905663          	blez	s1,1064 <test_gettimeofday+0x60>
	int test_ret2 = get_time();
    105c:	0005041b          	sext.w	s0,a0
	if(test_ret1 > 0 && test_ret2 > 0){
    1060:	02804d63          	bgtz	s0,109a <test_gettimeofday+0x96>
		printf("gettimeofday success.\n");
		printf("start:%d, end:%d\n", test_ret1, test_ret2);
                printf("interval: %d\n", test_ret2 - test_ret1);
	}else{
		printf("gettimeofday error.\n");
    1064:	00001517          	auipc	a0,0x1
    1068:	f1450513          	addi	a0,a0,-236 # 1f78 <__clone+0x94>
    106c:	300000ef          	jal	ra,136c <printf>
	}
	TEST_END(__func__);
    1070:	00001517          	auipc	a0,0x1
    1074:	f2050513          	addi	a0,a0,-224 # 1f90 <__clone+0xac>
    1078:	2d2000ef          	jal	ra,134a <puts>
    107c:	00001517          	auipc	a0,0x1
    1080:	f4450513          	addi	a0,a0,-188 # 1fc0 <__func__.0>
    1084:	2c6000ef          	jal	ra,134a <puts>
}
    1088:	7402                	ld	s0,32(sp)
    108a:	70a2                	ld	ra,40(sp)
    108c:	64e2                	ld	s1,24(sp)
	TEST_END(__func__);
    108e:	00001517          	auipc	a0,0x1
    1092:	e9a50513          	addi	a0,a0,-358 # 1f28 <__clone+0x44>
}
    1096:	6145                	addi	sp,sp,48
	TEST_END(__func__);
    1098:	ac4d                	j	134a <puts>
		printf("gettimeofday success.\n");
    109a:	00001517          	auipc	a0,0x1
    109e:	e9e50513          	addi	a0,a0,-354 # 1f38 <__clone+0x54>
    10a2:	2ca000ef          	jal	ra,136c <printf>
		printf("start:%d, end:%d\n", test_ret1, test_ret2);
    10a6:	85a6                	mv	a1,s1
    10a8:	8622                	mv	a2,s0
    10aa:	00001517          	auipc	a0,0x1
    10ae:	ea650513          	addi	a0,a0,-346 # 1f50 <__clone+0x6c>
    10b2:	2ba000ef          	jal	ra,136c <printf>
                printf("interval: %d\n", test_ret2 - test_ret1);
    10b6:	409405bb          	subw	a1,s0,s1
    10ba:	00001517          	auipc	a0,0x1
    10be:	eae50513          	addi	a0,a0,-338 # 1f68 <__clone+0x84>
    10c2:	2aa000ef          	jal	ra,136c <printf>
    10c6:	b76d                	j	1070 <test_gettimeofday+0x6c>

00000000000010c8 <main>:

int main(void) {
    10c8:	1141                	addi	sp,sp,-16
    10ca:	e406                	sd	ra,8(sp)
	test_gettimeofday();
    10cc:	f39ff0ef          	jal	ra,1004 <test_gettimeofday>
	return 0;
}
    10d0:	60a2                	ld	ra,8(sp)
    10d2:	4501                	li	a0,0
    10d4:	0141                	addi	sp,sp,16
    10d6:	8082                	ret

00000000000010d8 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10d8:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10da:	4108                	lw	a0,0(a0)
{
    10dc:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10de:	05a1                	addi	a1,a1,8
{
    10e0:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10e2:	fe7ff0ef          	jal	ra,10c8 <main>
    10e6:	417000ef          	jal	ra,1cfc <exit>
	return 0;
}
    10ea:	60a2                	ld	ra,8(sp)
    10ec:	4501                	li	a0,0
    10ee:	0141                	addi	sp,sp,16
    10f0:	8082                	ret

00000000000010f2 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10f2:	7179                	addi	sp,sp,-48
    10f4:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10f6:	12054b63          	bltz	a0,122c <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10fa:	02b577bb          	remuw	a5,a0,a1
    10fe:	00001617          	auipc	a2,0x1
    1102:	eda60613          	addi	a2,a2,-294 # 1fd8 <digits>
    buf[16] = 0;
    1106:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    110a:	0005871b          	sext.w	a4,a1
    110e:	1782                	slli	a5,a5,0x20
    1110:	9381                	srli	a5,a5,0x20
    1112:	97b2                	add	a5,a5,a2
    1114:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1118:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    111c:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1120:	1cb56363          	bltu	a0,a1,12e6 <printint.constprop.0+0x1f4>
        buf[i--] = digits[x % base];
    1124:	45b9                	li	a1,14
    1126:	02e877bb          	remuw	a5,a6,a4
    112a:	1782                	slli	a5,a5,0x20
    112c:	9381                	srli	a5,a5,0x20
    112e:	97b2                	add	a5,a5,a2
    1130:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1134:	02e856bb          	divuw	a3,a6,a4
        buf[i--] = digits[x % base];
    1138:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    113c:	0ce86e63          	bltu	a6,a4,1218 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    1140:	02e6f5bb          	remuw	a1,a3,a4
    } while ((x /= base) != 0);
    1144:	02e6d7bb          	divuw	a5,a3,a4
        buf[i--] = digits[x % base];
    1148:	1582                	slli	a1,a1,0x20
    114a:	9181                	srli	a1,a1,0x20
    114c:	95b2                	add	a1,a1,a2
    114e:	0005c583          	lbu	a1,0(a1)
    1152:	00b10aa3          	sb	a1,21(sp)
    } while ((x /= base) != 0);
    1156:	0007859b          	sext.w	a1,a5
    115a:	12e6ec63          	bltu	a3,a4,1292 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    115e:	02e7f6bb          	remuw	a3,a5,a4
    1162:	1682                	slli	a3,a3,0x20
    1164:	9281                	srli	a3,a3,0x20
    1166:	96b2                	add	a3,a3,a2
    1168:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    116c:	02e7d83b          	divuw	a6,a5,a4
        buf[i--] = digits[x % base];
    1170:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1174:	12e5e863          	bltu	a1,a4,12a4 <printint.constprop.0+0x1b2>
        buf[i--] = digits[x % base];
    1178:	02e876bb          	remuw	a3,a6,a4
    117c:	1682                	slli	a3,a3,0x20
    117e:	9281                	srli	a3,a3,0x20
    1180:	96b2                	add	a3,a3,a2
    1182:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1186:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    118a:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    118e:	12e86463          	bltu	a6,a4,12b6 <printint.constprop.0+0x1c4>
        buf[i--] = digits[x % base];
    1192:	02e5f6bb          	remuw	a3,a1,a4
    1196:	1682                	slli	a3,a3,0x20
    1198:	9281                	srli	a3,a3,0x20
    119a:	96b2                	add	a3,a3,a2
    119c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11a0:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11a4:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    11a8:	0ce5ec63          	bltu	a1,a4,1280 <printint.constprop.0+0x18e>
        buf[i--] = digits[x % base];
    11ac:	02e876bb          	remuw	a3,a6,a4
    11b0:	1682                	slli	a3,a3,0x20
    11b2:	9281                	srli	a3,a3,0x20
    11b4:	96b2                	add	a3,a3,a2
    11b6:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11ba:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11be:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11c2:	10e86963          	bltu	a6,a4,12d4 <printint.constprop.0+0x1e2>
        buf[i--] = digits[x % base];
    11c6:	02e5f6bb          	remuw	a3,a1,a4
    11ca:	1682                	slli	a3,a3,0x20
    11cc:	9281                	srli	a3,a3,0x20
    11ce:	96b2                	add	a3,a3,a2
    11d0:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11d4:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11d8:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11dc:	10e5e763          	bltu	a1,a4,12ea <printint.constprop.0+0x1f8>
        buf[i--] = digits[x % base];
    11e0:	02e876bb          	remuw	a3,a6,a4
    11e4:	1682                	slli	a3,a3,0x20
    11e6:	9281                	srli	a3,a3,0x20
    11e8:	96b2                	add	a3,a3,a2
    11ea:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11ee:	02e857bb          	divuw	a5,a6,a4
        buf[i--] = digits[x % base];
    11f2:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11f6:	10e86363          	bltu	a6,a4,12fc <printint.constprop.0+0x20a>
        buf[i--] = digits[x % base];
    11fa:	1782                	slli	a5,a5,0x20
    11fc:	9381                	srli	a5,a5,0x20
    11fe:	97b2                	add	a5,a5,a2
    1200:	0007c783          	lbu	a5,0(a5)
    1204:	4599                	li	a1,6
    1206:	00f10723          	sb	a5,14(sp)

    if (sign)
    120a:	00055763          	bgez	a0,1218 <printint.constprop.0+0x126>
        buf[i--] = '-';
    120e:	02d00793          	li	a5,45
    1212:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1216:	4595                	li	a1,5
    write(f, s, l);
    1218:	003c                	addi	a5,sp,8
    121a:	4641                	li	a2,16
    121c:	9e0d                	subw	a2,a2,a1
    121e:	4505                	li	a0,1
    1220:	95be                	add	a1,a1,a5
    1222:	28b000ef          	jal	ra,1cac <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1226:	70a2                	ld	ra,40(sp)
    1228:	6145                	addi	sp,sp,48
    122a:	8082                	ret
        x = -xx;
    122c:	40a0083b          	negw	a6,a0
        buf[i--] = digits[x % base];
    1230:	02b877bb          	remuw	a5,a6,a1
    1234:	00001617          	auipc	a2,0x1
    1238:	da460613          	addi	a2,a2,-604 # 1fd8 <digits>
    buf[16] = 0;
    123c:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1240:	0005871b          	sext.w	a4,a1
    1244:	1782                	slli	a5,a5,0x20
    1246:	9381                	srli	a5,a5,0x20
    1248:	97b2                	add	a5,a5,a2
    124a:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    124e:	02b858bb          	divuw	a7,a6,a1
        buf[i--] = digits[x % base];
    1252:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1256:	06b86963          	bltu	a6,a1,12c8 <printint.constprop.0+0x1d6>
        buf[i--] = digits[x % base];
    125a:	02e8f7bb          	remuw	a5,a7,a4
    125e:	1782                	slli	a5,a5,0x20
    1260:	9381                	srli	a5,a5,0x20
    1262:	97b2                	add	a5,a5,a2
    1264:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1268:	02e8d6bb          	divuw	a3,a7,a4
        buf[i--] = digits[x % base];
    126c:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    1270:	ece8f8e3          	bgeu	a7,a4,1140 <printint.constprop.0+0x4e>
        buf[i--] = '-';
    1274:	02d00793          	li	a5,45
    1278:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    127c:	45b5                	li	a1,13
    127e:	bf69                	j	1218 <printint.constprop.0+0x126>
    1280:	45a9                	li	a1,10
    if (sign)
    1282:	f8055be3          	bgez	a0,1218 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1286:	02d00793          	li	a5,45
    128a:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    128e:	45a5                	li	a1,9
    1290:	b761                	j	1218 <printint.constprop.0+0x126>
    1292:	45b5                	li	a1,13
    if (sign)
    1294:	f80552e3          	bgez	a0,1218 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1298:	02d00793          	li	a5,45
    129c:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    12a0:	45b1                	li	a1,12
    12a2:	bf9d                	j	1218 <printint.constprop.0+0x126>
    12a4:	45b1                	li	a1,12
    if (sign)
    12a6:	f60559e3          	bgez	a0,1218 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12aa:	02d00793          	li	a5,45
    12ae:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12b2:	45ad                	li	a1,11
    12b4:	b795                	j	1218 <printint.constprop.0+0x126>
    12b6:	45ad                	li	a1,11
    if (sign)
    12b8:	f60550e3          	bgez	a0,1218 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12bc:	02d00793          	li	a5,45
    12c0:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12c4:	45a9                	li	a1,10
    12c6:	bf89                	j	1218 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12c8:	02d00793          	li	a5,45
    12cc:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12d0:	45b9                	li	a1,14
    12d2:	b799                	j	1218 <printint.constprop.0+0x126>
    12d4:	45a5                	li	a1,9
    if (sign)
    12d6:	f40551e3          	bgez	a0,1218 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12da:	02d00793          	li	a5,45
    12de:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12e2:	45a1                	li	a1,8
    12e4:	bf15                	j	1218 <printint.constprop.0+0x126>
    i = 15;
    12e6:	45bd                	li	a1,15
    12e8:	bf05                	j	1218 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    12ea:	45a1                	li	a1,8
    if (sign)
    12ec:	f20556e3          	bgez	a0,1218 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12f0:	02d00793          	li	a5,45
    12f4:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12f8:	459d                	li	a1,7
    12fa:	bf39                	j	1218 <printint.constprop.0+0x126>
    12fc:	459d                	li	a1,7
    if (sign)
    12fe:	f0055de3          	bgez	a0,1218 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1302:	02d00793          	li	a5,45
    1306:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    130a:	4599                	li	a1,6
    130c:	b731                	j	1218 <printint.constprop.0+0x126>

000000000000130e <getchar>:
{
    130e:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1310:	00f10593          	addi	a1,sp,15
    1314:	4605                	li	a2,1
    1316:	4501                	li	a0,0
{
    1318:	ec06                	sd	ra,24(sp)
    char byte = 0;
    131a:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    131e:	185000ef          	jal	ra,1ca2 <read>
}
    1322:	60e2                	ld	ra,24(sp)
    1324:	00f14503          	lbu	a0,15(sp)
    1328:	6105                	addi	sp,sp,32
    132a:	8082                	ret

000000000000132c <putchar>:
{
    132c:	1101                	addi	sp,sp,-32
    132e:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1330:	00f10593          	addi	a1,sp,15
    1334:	4605                	li	a2,1
    1336:	4505                	li	a0,1
{
    1338:	ec06                	sd	ra,24(sp)
    char byte = c;
    133a:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    133e:	16f000ef          	jal	ra,1cac <write>
}
    1342:	60e2                	ld	ra,24(sp)
    1344:	2501                	sext.w	a0,a0
    1346:	6105                	addi	sp,sp,32
    1348:	8082                	ret

000000000000134a <puts>:
{
    134a:	1141                	addi	sp,sp,-16
    134c:	e406                	sd	ra,8(sp)
    134e:	e022                	sd	s0,0(sp)
    1350:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1352:	56c000ef          	jal	ra,18be <strlen>
    1356:	862a                	mv	a2,a0
    1358:	85a2                	mv	a1,s0
    135a:	4505                	li	a0,1
    135c:	151000ef          	jal	ra,1cac <write>
}
    1360:	60a2                	ld	ra,8(sp)
    1362:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1364:	957d                	srai	a0,a0,0x3f
    return r;
    1366:	2501                	sext.w	a0,a0
}
    1368:	0141                	addi	sp,sp,16
    136a:	8082                	ret

000000000000136c <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    136c:	7171                	addi	sp,sp,-176
    136e:	fc56                	sd	s5,56(sp)
    1370:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1372:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1374:	18bc                	addi	a5,sp,120
{
    1376:	e8ca                	sd	s2,80(sp)
    1378:	e4ce                	sd	s3,72(sp)
    137a:	e0d2                	sd	s4,64(sp)
    137c:	f85a                	sd	s6,48(sp)
    137e:	f486                	sd	ra,104(sp)
    1380:	f0a2                	sd	s0,96(sp)
    1382:	eca6                	sd	s1,88(sp)
    1384:	fcae                	sd	a1,120(sp)
    1386:	e132                	sd	a2,128(sp)
    1388:	e536                	sd	a3,136(sp)
    138a:	e93a                	sd	a4,144(sp)
    138c:	f142                	sd	a6,160(sp)
    138e:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1390:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1392:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1396:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    139a:	00001b17          	auipc	s6,0x1
    139e:	c06b0b13          	addi	s6,s6,-1018 # 1fa0 <__clone+0xbc>
    buf[i++] = '0';
    13a2:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13a6:	00001997          	auipc	s3,0x1
    13aa:	c3298993          	addi	s3,s3,-974 # 1fd8 <digits>
        if (!*s)
    13ae:	00054783          	lbu	a5,0(a0)
    13b2:	16078a63          	beqz	a5,1526 <printf+0x1ba>
    13b6:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13b8:	19278163          	beq	a5,s2,153a <printf+0x1ce>
    13bc:	00164783          	lbu	a5,1(a2)
    13c0:	0605                	addi	a2,a2,1
    13c2:	fbfd                	bnez	a5,13b8 <printf+0x4c>
    13c4:	84b2                	mv	s1,a2
        l = z - a;
    13c6:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13ca:	85aa                	mv	a1,a0
    13cc:	8622                	mv	a2,s0
    13ce:	4505                	li	a0,1
    13d0:	0dd000ef          	jal	ra,1cac <write>
        if (l)
    13d4:	18041c63          	bnez	s0,156c <printf+0x200>
        if (s[1] == 0)
    13d8:	0014c783          	lbu	a5,1(s1)
    13dc:	14078563          	beqz	a5,1526 <printf+0x1ba>
        switch (s[1])
    13e0:	1d478063          	beq	a5,s4,15a0 <printf+0x234>
    13e4:	18fa6663          	bltu	s4,a5,1570 <printf+0x204>
    13e8:	06400713          	li	a4,100
    13ec:	1ae78063          	beq	a5,a4,158c <printf+0x220>
    13f0:	07000713          	li	a4,112
    13f4:	1ce79963          	bne	a5,a4,15c6 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    13f8:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13fa:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13fe:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1400:	631c                	ld	a5,0(a4)
    1402:	0721                	addi	a4,a4,8
    1404:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1406:	00479293          	slli	t0,a5,0x4
    140a:	00879f93          	slli	t6,a5,0x8
    140e:	00c79f13          	slli	t5,a5,0xc
    1412:	01079e93          	slli	t4,a5,0x10
    1416:	01479e13          	slli	t3,a5,0x14
    141a:	01879313          	slli	t1,a5,0x18
    141e:	01c79893          	slli	a7,a5,0x1c
    1422:	02479813          	slli	a6,a5,0x24
    1426:	02879513          	slli	a0,a5,0x28
    142a:	02c79593          	slli	a1,a5,0x2c
    142e:	03079693          	slli	a3,a5,0x30
    1432:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1436:	03c7d413          	srli	s0,a5,0x3c
    143a:	01c7d39b          	srliw	t2,a5,0x1c
    143e:	03c2d293          	srli	t0,t0,0x3c
    1442:	03cfdf93          	srli	t6,t6,0x3c
    1446:	03cf5f13          	srli	t5,t5,0x3c
    144a:	03cede93          	srli	t4,t4,0x3c
    144e:	03ce5e13          	srli	t3,t3,0x3c
    1452:	03c35313          	srli	t1,t1,0x3c
    1456:	03c8d893          	srli	a7,a7,0x3c
    145a:	03c85813          	srli	a6,a6,0x3c
    145e:	9171                	srli	a0,a0,0x3c
    1460:	91f1                	srli	a1,a1,0x3c
    1462:	92f1                	srli	a3,a3,0x3c
    1464:	9371                	srli	a4,a4,0x3c
    1466:	96ce                	add	a3,a3,s3
    1468:	974e                	add	a4,a4,s3
    146a:	944e                	add	s0,s0,s3
    146c:	92ce                	add	t0,t0,s3
    146e:	9fce                	add	t6,t6,s3
    1470:	9f4e                	add	t5,t5,s3
    1472:	9ece                	add	t4,t4,s3
    1474:	9e4e                	add	t3,t3,s3
    1476:	934e                	add	t1,t1,s3
    1478:	98ce                	add	a7,a7,s3
    147a:	93ce                	add	t2,t2,s3
    147c:	984e                	add	a6,a6,s3
    147e:	954e                	add	a0,a0,s3
    1480:	95ce                	add	a1,a1,s3
    1482:	0006c083          	lbu	ra,0(a3)
    1486:	0002c283          	lbu	t0,0(t0)
    148a:	00074683          	lbu	a3,0(a4)
    148e:	000fcf83          	lbu	t6,0(t6)
    1492:	000f4f03          	lbu	t5,0(t5)
    1496:	000ece83          	lbu	t4,0(t4)
    149a:	000e4e03          	lbu	t3,0(t3)
    149e:	00034303          	lbu	t1,0(t1)
    14a2:	0008c883          	lbu	a7,0(a7)
    14a6:	0003c383          	lbu	t2,0(t2)
    14aa:	00084803          	lbu	a6,0(a6)
    14ae:	00054503          	lbu	a0,0(a0)
    14b2:	0005c583          	lbu	a1,0(a1)
    14b6:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14ba:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14be:	9371                	srli	a4,a4,0x3c
    14c0:	8bbd                	andi	a5,a5,15
    14c2:	974e                	add	a4,a4,s3
    14c4:	97ce                	add	a5,a5,s3
    14c6:	005105a3          	sb	t0,11(sp)
    14ca:	01f10623          	sb	t6,12(sp)
    14ce:	01e106a3          	sb	t5,13(sp)
    14d2:	01d10723          	sb	t4,14(sp)
    14d6:	01c107a3          	sb	t3,15(sp)
    14da:	00610823          	sb	t1,16(sp)
    14de:	011108a3          	sb	a7,17(sp)
    14e2:	00710923          	sb	t2,18(sp)
    14e6:	010109a3          	sb	a6,19(sp)
    14ea:	00a10a23          	sb	a0,20(sp)
    14ee:	00b10aa3          	sb	a1,21(sp)
    14f2:	00110b23          	sb	ra,22(sp)
    14f6:	00d10ba3          	sb	a3,23(sp)
    14fa:	00810523          	sb	s0,10(sp)
    14fe:	00074703          	lbu	a4,0(a4)
    1502:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1506:	002c                	addi	a1,sp,8
    1508:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    150a:	00e10c23          	sb	a4,24(sp)
    150e:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1512:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1516:	796000ef          	jal	ra,1cac <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    151a:	00248513          	addi	a0,s1,2
        if (!*s)
    151e:	00054783          	lbu	a5,0(a0)
    1522:	e8079ae3          	bnez	a5,13b6 <printf+0x4a>
    }
    va_end(ap);
}
    1526:	70a6                	ld	ra,104(sp)
    1528:	7406                	ld	s0,96(sp)
    152a:	64e6                	ld	s1,88(sp)
    152c:	6946                	ld	s2,80(sp)
    152e:	69a6                	ld	s3,72(sp)
    1530:	6a06                	ld	s4,64(sp)
    1532:	7ae2                	ld	s5,56(sp)
    1534:	7b42                	ld	s6,48(sp)
    1536:	614d                	addi	sp,sp,176
    1538:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    153a:	00064783          	lbu	a5,0(a2)
    153e:	84b2                	mv	s1,a2
    1540:	01278963          	beq	a5,s2,1552 <printf+0x1e6>
    1544:	b549                	j	13c6 <printf+0x5a>
    1546:	0024c783          	lbu	a5,2(s1)
    154a:	0605                	addi	a2,a2,1
    154c:	0489                	addi	s1,s1,2
    154e:	e7279ce3          	bne	a5,s2,13c6 <printf+0x5a>
    1552:	0014c783          	lbu	a5,1(s1)
    1556:	ff2788e3          	beq	a5,s2,1546 <printf+0x1da>
        l = z - a;
    155a:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    155e:	85aa                	mv	a1,a0
    1560:	8622                	mv	a2,s0
    1562:	4505                	li	a0,1
    1564:	748000ef          	jal	ra,1cac <write>
        if (l)
    1568:	e60408e3          	beqz	s0,13d8 <printf+0x6c>
    156c:	8526                	mv	a0,s1
    156e:	b581                	j	13ae <printf+0x42>
        switch (s[1])
    1570:	07800713          	li	a4,120
    1574:	04e79963          	bne	a5,a4,15c6 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    1578:	6782                	ld	a5,0(sp)
    157a:	45c1                	li	a1,16
    157c:	4388                	lw	a0,0(a5)
    157e:	07a1                	addi	a5,a5,8
    1580:	e03e                	sd	a5,0(sp)
    1582:	b71ff0ef          	jal	ra,10f2 <printint.constprop.0>
        s += 2;
    1586:	00248513          	addi	a0,s1,2
    158a:	bf51                	j	151e <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    158c:	6782                	ld	a5,0(sp)
    158e:	45a9                	li	a1,10
    1590:	4388                	lw	a0,0(a5)
    1592:	07a1                	addi	a5,a5,8
    1594:	e03e                	sd	a5,0(sp)
    1596:	b5dff0ef          	jal	ra,10f2 <printint.constprop.0>
        s += 2;
    159a:	00248513          	addi	a0,s1,2
    159e:	b741                	j	151e <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    15a0:	6782                	ld	a5,0(sp)
    15a2:	6380                	ld	s0,0(a5)
    15a4:	07a1                	addi	a5,a5,8
    15a6:	e03e                	sd	a5,0(sp)
    15a8:	c031                	beqz	s0,15ec <printf+0x280>
            l = strnlen(a, 200);
    15aa:	0c800593          	li	a1,200
    15ae:	8522                	mv	a0,s0
    15b0:	3fa000ef          	jal	ra,19aa <strnlen>
    write(f, s, l);
    15b4:	0005061b          	sext.w	a2,a0
    15b8:	85a2                	mv	a1,s0
    15ba:	4505                	li	a0,1
    15bc:	6f0000ef          	jal	ra,1cac <write>
        s += 2;
    15c0:	00248513          	addi	a0,s1,2
    15c4:	bfa9                	j	151e <printf+0x1b2>
    return write(stdout, &byte, 1);
    15c6:	4605                	li	a2,1
    15c8:	002c                	addi	a1,sp,8
    15ca:	4505                	li	a0,1
    char byte = c;
    15cc:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15d0:	6dc000ef          	jal	ra,1cac <write>
    char byte = c;
    15d4:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15d8:	4605                	li	a2,1
    15da:	002c                	addi	a1,sp,8
    15dc:	4505                	li	a0,1
    char byte = c;
    15de:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15e2:	6ca000ef          	jal	ra,1cac <write>
        s += 2;
    15e6:	00248513          	addi	a0,s1,2
    15ea:	bf15                	j	151e <printf+0x1b2>
                a = "(null)";
    15ec:	845a                	mv	s0,s6
    15ee:	bf75                	j	15aa <printf+0x23e>

00000000000015f0 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15f0:	02000793          	li	a5,32
    15f4:	00f50663          	beq	a0,a5,1600 <isspace+0x10>
    15f8:	355d                	addiw	a0,a0,-9
    15fa:	00553513          	sltiu	a0,a0,5
    15fe:	8082                	ret
    1600:	4505                	li	a0,1
}
    1602:	8082                	ret

0000000000001604 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1604:	fd05051b          	addiw	a0,a0,-48
}
    1608:	00a53513          	sltiu	a0,a0,10
    160c:	8082                	ret

000000000000160e <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    160e:	02000613          	li	a2,32
    1612:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1614:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1618:	ff77869b          	addiw	a3,a5,-9
    161c:	04c78c63          	beq	a5,a2,1674 <atoi+0x66>
    1620:	0007871b          	sext.w	a4,a5
    1624:	04d5f863          	bgeu	a1,a3,1674 <atoi+0x66>
        s++;
    switch (*s)
    1628:	02b00693          	li	a3,43
    162c:	04d78963          	beq	a5,a3,167e <atoi+0x70>
    1630:	02d00693          	li	a3,45
    1634:	06d78263          	beq	a5,a3,1698 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1638:	fd07061b          	addiw	a2,a4,-48
    163c:	47a5                	li	a5,9
    163e:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1640:	4e01                	li	t3,0
    while (isdigit(*s))
    1642:	04c7e963          	bltu	a5,a2,1694 <atoi+0x86>
    int n = 0, neg = 0;
    1646:	4501                	li	a0,0
    while (isdigit(*s))
    1648:	4825                	li	a6,9
    164a:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    164e:	0025179b          	slliw	a5,a0,0x2
    1652:	9fa9                	addw	a5,a5,a0
    1654:	fd07031b          	addiw	t1,a4,-48
    1658:	0017989b          	slliw	a7,a5,0x1
    while (isdigit(*s))
    165c:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1660:	0685                	addi	a3,a3,1
    1662:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1666:	0006071b          	sext.w	a4,a2
    166a:	feb870e3          	bgeu	a6,a1,164a <atoi+0x3c>
    return neg ? n : -n;
    166e:	000e0563          	beqz	t3,1678 <atoi+0x6a>
}
    1672:	8082                	ret
        s++;
    1674:	0505                	addi	a0,a0,1
    1676:	bf79                	j	1614 <atoi+0x6>
    return neg ? n : -n;
    1678:	4113053b          	subw	a0,t1,a7
    167c:	8082                	ret
    while (isdigit(*s))
    167e:	00154703          	lbu	a4,1(a0)
    1682:	47a5                	li	a5,9
        s++;
    1684:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1688:	fd07061b          	addiw	a2,a4,-48
    int n = 0, neg = 0;
    168c:	4e01                	li	t3,0
    while (isdigit(*s))
    168e:	2701                	sext.w	a4,a4
    1690:	fac7fbe3          	bgeu	a5,a2,1646 <atoi+0x38>
    1694:	4501                	li	a0,0
}
    1696:	8082                	ret
    while (isdigit(*s))
    1698:	00154703          	lbu	a4,1(a0)
    169c:	47a5                	li	a5,9
        s++;
    169e:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    16a2:	fd07061b          	addiw	a2,a4,-48
    16a6:	2701                	sext.w	a4,a4
    16a8:	fec7e6e3          	bltu	a5,a2,1694 <atoi+0x86>
        neg = 1;
    16ac:	4e05                	li	t3,1
    16ae:	bf61                	j	1646 <atoi+0x38>

00000000000016b0 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16b0:	16060d63          	beqz	a2,182a <memset+0x17a>
    16b4:	40a007b3          	neg	a5,a0
    16b8:	8b9d                	andi	a5,a5,7
    16ba:	00778693          	addi	a3,a5,7
    16be:	482d                	li	a6,11
    16c0:	0ff5f713          	zext.b	a4,a1
    16c4:	fff60593          	addi	a1,a2,-1
    16c8:	1706e263          	bltu	a3,a6,182c <memset+0x17c>
    16cc:	16d5ea63          	bltu	a1,a3,1840 <memset+0x190>
    16d0:	16078563          	beqz	a5,183a <memset+0x18a>
    16d4:	00e50023          	sb	a4,0(a0)
    16d8:	4685                	li	a3,1
    16da:	00150593          	addi	a1,a0,1
    16de:	14d78c63          	beq	a5,a3,1836 <memset+0x186>
    16e2:	00e500a3          	sb	a4,1(a0)
    16e6:	4689                	li	a3,2
    16e8:	00250593          	addi	a1,a0,2
    16ec:	14d78d63          	beq	a5,a3,1846 <memset+0x196>
    16f0:	00e50123          	sb	a4,2(a0)
    16f4:	468d                	li	a3,3
    16f6:	00350593          	addi	a1,a0,3
    16fa:	12d78b63          	beq	a5,a3,1830 <memset+0x180>
    16fe:	00e501a3          	sb	a4,3(a0)
    1702:	4691                	li	a3,4
    1704:	00450593          	addi	a1,a0,4
    1708:	14d78163          	beq	a5,a3,184a <memset+0x19a>
    170c:	00e50223          	sb	a4,4(a0)
    1710:	4695                	li	a3,5
    1712:	00550593          	addi	a1,a0,5
    1716:	12d78c63          	beq	a5,a3,184e <memset+0x19e>
    171a:	00e502a3          	sb	a4,5(a0)
    171e:	469d                	li	a3,7
    1720:	00650593          	addi	a1,a0,6
    1724:	12d79763          	bne	a5,a3,1852 <memset+0x1a2>
    1728:	00750593          	addi	a1,a0,7
    172c:	00e50323          	sb	a4,6(a0)
    1730:	481d                	li	a6,7
    1732:	00871693          	slli	a3,a4,0x8
    1736:	01071893          	slli	a7,a4,0x10
    173a:	8ed9                	or	a3,a3,a4
    173c:	01871313          	slli	t1,a4,0x18
    1740:	0116e6b3          	or	a3,a3,a7
    1744:	0066e6b3          	or	a3,a3,t1
    1748:	02071893          	slli	a7,a4,0x20
    174c:	02871e13          	slli	t3,a4,0x28
    1750:	0116e6b3          	or	a3,a3,a7
    1754:	40f60333          	sub	t1,a2,a5
    1758:	03071893          	slli	a7,a4,0x30
    175c:	01c6e6b3          	or	a3,a3,t3
    1760:	0116e6b3          	or	a3,a3,a7
    1764:	03871e13          	slli	t3,a4,0x38
    1768:	97aa                	add	a5,a5,a0
    176a:	ff837893          	andi	a7,t1,-8
    176e:	01c6e6b3          	or	a3,a3,t3
    1772:	98be                	add	a7,a7,a5
    1774:	e394                	sd	a3,0(a5)
    1776:	07a1                	addi	a5,a5,8
    1778:	ff179ee3          	bne	a5,a7,1774 <memset+0xc4>
    177c:	ff837893          	andi	a7,t1,-8
    1780:	011587b3          	add	a5,a1,a7
    1784:	010886bb          	addw	a3,a7,a6
    1788:	0b130663          	beq	t1,a7,1834 <memset+0x184>
    178c:	00e78023          	sb	a4,0(a5)
    1790:	0016859b          	addiw	a1,a3,1
    1794:	08c5fb63          	bgeu	a1,a2,182a <memset+0x17a>
    1798:	00e780a3          	sb	a4,1(a5)
    179c:	0026859b          	addiw	a1,a3,2
    17a0:	08c5f563          	bgeu	a1,a2,182a <memset+0x17a>
    17a4:	00e78123          	sb	a4,2(a5)
    17a8:	0036859b          	addiw	a1,a3,3
    17ac:	06c5ff63          	bgeu	a1,a2,182a <memset+0x17a>
    17b0:	00e781a3          	sb	a4,3(a5)
    17b4:	0046859b          	addiw	a1,a3,4
    17b8:	06c5f963          	bgeu	a1,a2,182a <memset+0x17a>
    17bc:	00e78223          	sb	a4,4(a5)
    17c0:	0056859b          	addiw	a1,a3,5
    17c4:	06c5f363          	bgeu	a1,a2,182a <memset+0x17a>
    17c8:	00e782a3          	sb	a4,5(a5)
    17cc:	0066859b          	addiw	a1,a3,6
    17d0:	04c5fd63          	bgeu	a1,a2,182a <memset+0x17a>
    17d4:	00e78323          	sb	a4,6(a5)
    17d8:	0076859b          	addiw	a1,a3,7
    17dc:	04c5f763          	bgeu	a1,a2,182a <memset+0x17a>
    17e0:	00e783a3          	sb	a4,7(a5)
    17e4:	0086859b          	addiw	a1,a3,8
    17e8:	04c5f163          	bgeu	a1,a2,182a <memset+0x17a>
    17ec:	00e78423          	sb	a4,8(a5)
    17f0:	0096859b          	addiw	a1,a3,9
    17f4:	02c5fb63          	bgeu	a1,a2,182a <memset+0x17a>
    17f8:	00e784a3          	sb	a4,9(a5)
    17fc:	00a6859b          	addiw	a1,a3,10
    1800:	02c5f563          	bgeu	a1,a2,182a <memset+0x17a>
    1804:	00e78523          	sb	a4,10(a5)
    1808:	00b6859b          	addiw	a1,a3,11
    180c:	00c5ff63          	bgeu	a1,a2,182a <memset+0x17a>
    1810:	00e785a3          	sb	a4,11(a5)
    1814:	00c6859b          	addiw	a1,a3,12
    1818:	00c5f963          	bgeu	a1,a2,182a <memset+0x17a>
    181c:	00e78623          	sb	a4,12(a5)
    1820:	26b5                	addiw	a3,a3,13
    1822:	00c6f463          	bgeu	a3,a2,182a <memset+0x17a>
    1826:	00e786a3          	sb	a4,13(a5)
        ;
    return dest;
}
    182a:	8082                	ret
    182c:	46ad                	li	a3,11
    182e:	bd79                	j	16cc <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1830:	480d                	li	a6,3
    1832:	b701                	j	1732 <memset+0x82>
    1834:	8082                	ret
    1836:	4805                	li	a6,1
    1838:	bded                	j	1732 <memset+0x82>
    183a:	85aa                	mv	a1,a0
    183c:	4801                	li	a6,0
    183e:	bdd5                	j	1732 <memset+0x82>
    1840:	87aa                	mv	a5,a0
    1842:	4681                	li	a3,0
    1844:	b7a1                	j	178c <memset+0xdc>
    1846:	4809                	li	a6,2
    1848:	b5ed                	j	1732 <memset+0x82>
    184a:	4811                	li	a6,4
    184c:	b5dd                	j	1732 <memset+0x82>
    184e:	4815                	li	a6,5
    1850:	b5cd                	j	1732 <memset+0x82>
    1852:	4819                	li	a6,6
    1854:	bdf9                	j	1732 <memset+0x82>

0000000000001856 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1856:	00054783          	lbu	a5,0(a0)
    185a:	0005c703          	lbu	a4,0(a1)
    185e:	00e79863          	bne	a5,a4,186e <strcmp+0x18>
    1862:	0505                	addi	a0,a0,1
    1864:	0585                	addi	a1,a1,1
    1866:	fbe5                	bnez	a5,1856 <strcmp>
    1868:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    186a:	9d19                	subw	a0,a0,a4
    186c:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    186e:	0007851b          	sext.w	a0,a5
    1872:	bfe5                	j	186a <strcmp+0x14>

0000000000001874 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1874:	ca15                	beqz	a2,18a8 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1876:	00054783          	lbu	a5,0(a0)
    if (!n--)
    187a:	167d                	addi	a2,a2,-1
    187c:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1880:	eb99                	bnez	a5,1896 <strncmp+0x22>
    1882:	a815                	j	18b6 <strncmp+0x42>
    1884:	00a68e63          	beq	a3,a0,18a0 <strncmp+0x2c>
    1888:	0505                	addi	a0,a0,1
    188a:	00f71b63          	bne	a4,a5,18a0 <strncmp+0x2c>
    188e:	00054783          	lbu	a5,0(a0)
    1892:	cf89                	beqz	a5,18ac <strncmp+0x38>
    1894:	85b2                	mv	a1,a2
    1896:	0005c703          	lbu	a4,0(a1)
    189a:	00158613          	addi	a2,a1,1
    189e:	f37d                	bnez	a4,1884 <strncmp+0x10>
        ;
    return *l - *r;
    18a0:	0007851b          	sext.w	a0,a5
    18a4:	9d19                	subw	a0,a0,a4
    18a6:	8082                	ret
        return 0;
    18a8:	4501                	li	a0,0
}
    18aa:	8082                	ret
    return *l - *r;
    18ac:	0015c703          	lbu	a4,1(a1)
    18b0:	4501                	li	a0,0
    18b2:	9d19                	subw	a0,a0,a4
    18b4:	8082                	ret
    18b6:	0005c703          	lbu	a4,0(a1)
    18ba:	4501                	li	a0,0
    18bc:	b7e5                	j	18a4 <strncmp+0x30>

00000000000018be <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18be:	00757793          	andi	a5,a0,7
    18c2:	cf89                	beqz	a5,18dc <strlen+0x1e>
    18c4:	87aa                	mv	a5,a0
    18c6:	a029                	j	18d0 <strlen+0x12>
    18c8:	0785                	addi	a5,a5,1
    18ca:	0077f713          	andi	a4,a5,7
    18ce:	cb01                	beqz	a4,18de <strlen+0x20>
        if (!*s)
    18d0:	0007c703          	lbu	a4,0(a5)
    18d4:	fb75                	bnez	a4,18c8 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18d6:	40a78533          	sub	a0,a5,a0
}
    18da:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18dc:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18de:	6394                	ld	a3,0(a5)
    18e0:	00000597          	auipc	a1,0x0
    18e4:	6c85b583          	ld	a1,1736(a1) # 1fa8 <__clone+0xc4>
    18e8:	00000617          	auipc	a2,0x0
    18ec:	6c863603          	ld	a2,1736(a2) # 1fb0 <__clone+0xcc>
    18f0:	a019                	j	18f6 <strlen+0x38>
    18f2:	6794                	ld	a3,8(a5)
    18f4:	07a1                	addi	a5,a5,8
    18f6:	00b68733          	add	a4,a3,a1
    18fa:	fff6c693          	not	a3,a3
    18fe:	8f75                	and	a4,a4,a3
    1900:	8f71                	and	a4,a4,a2
    1902:	db65                	beqz	a4,18f2 <strlen+0x34>
    for (; *s; s++)
    1904:	0007c703          	lbu	a4,0(a5)
    1908:	d779                	beqz	a4,18d6 <strlen+0x18>
    190a:	0017c703          	lbu	a4,1(a5)
    190e:	0785                	addi	a5,a5,1
    1910:	d379                	beqz	a4,18d6 <strlen+0x18>
    1912:	0017c703          	lbu	a4,1(a5)
    1916:	0785                	addi	a5,a5,1
    1918:	fb6d                	bnez	a4,190a <strlen+0x4c>
    191a:	bf75                	j	18d6 <strlen+0x18>

000000000000191c <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    191c:	00757713          	andi	a4,a0,7
{
    1920:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1922:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1926:	cb19                	beqz	a4,193c <memchr+0x20>
    1928:	ce25                	beqz	a2,19a0 <memchr+0x84>
    192a:	0007c703          	lbu	a4,0(a5)
    192e:	04b70e63          	beq	a4,a1,198a <memchr+0x6e>
    1932:	0785                	addi	a5,a5,1
    1934:	0077f713          	andi	a4,a5,7
    1938:	167d                	addi	a2,a2,-1
    193a:	f77d                	bnez	a4,1928 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    193c:	4501                	li	a0,0
    if (n && *s != c)
    193e:	c235                	beqz	a2,19a2 <memchr+0x86>
    1940:	0007c703          	lbu	a4,0(a5)
    1944:	04b70363          	beq	a4,a1,198a <memchr+0x6e>
        size_t k = ONES * c;
    1948:	00000517          	auipc	a0,0x0
    194c:	67053503          	ld	a0,1648(a0) # 1fb8 <__clone+0xd4>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1950:	471d                	li	a4,7
        size_t k = ONES * c;
    1952:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1956:	02c77a63          	bgeu	a4,a2,198a <memchr+0x6e>
    195a:	00000897          	auipc	a7,0x0
    195e:	64e8b883          	ld	a7,1614(a7) # 1fa8 <__clone+0xc4>
    1962:	00000817          	auipc	a6,0x0
    1966:	64e83803          	ld	a6,1614(a6) # 1fb0 <__clone+0xcc>
    196a:	431d                	li	t1,7
    196c:	a029                	j	1976 <memchr+0x5a>
    196e:	1661                	addi	a2,a2,-8
    1970:	07a1                	addi	a5,a5,8
    1972:	02c37963          	bgeu	t1,a2,19a4 <memchr+0x88>
    1976:	6398                	ld	a4,0(a5)
    1978:	8f29                	xor	a4,a4,a0
    197a:	011706b3          	add	a3,a4,a7
    197e:	fff74713          	not	a4,a4
    1982:	8f75                	and	a4,a4,a3
    1984:	01077733          	and	a4,a4,a6
    1988:	d37d                	beqz	a4,196e <memchr+0x52>
{
    198a:	853e                	mv	a0,a5
    198c:	97b2                	add	a5,a5,a2
    198e:	a021                	j	1996 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1990:	0505                	addi	a0,a0,1
    1992:	00f50763          	beq	a0,a5,19a0 <memchr+0x84>
    1996:	00054703          	lbu	a4,0(a0)
    199a:	feb71be3          	bne	a4,a1,1990 <memchr+0x74>
    199e:	8082                	ret
    return n ? (void *)s : 0;
    19a0:	4501                	li	a0,0
}
    19a2:	8082                	ret
    return n ? (void *)s : 0;
    19a4:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    19a6:	f275                	bnez	a2,198a <memchr+0x6e>
}
    19a8:	8082                	ret

00000000000019aa <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19aa:	1101                	addi	sp,sp,-32
    19ac:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19ae:	862e                	mv	a2,a1
{
    19b0:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19b2:	4581                	li	a1,0
{
    19b4:	e426                	sd	s1,8(sp)
    19b6:	ec06                	sd	ra,24(sp)
    19b8:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19ba:	f63ff0ef          	jal	ra,191c <memchr>
    return p ? p - s : n;
    19be:	c519                	beqz	a0,19cc <strnlen+0x22>
}
    19c0:	60e2                	ld	ra,24(sp)
    19c2:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19c4:	8d05                	sub	a0,a0,s1
}
    19c6:	64a2                	ld	s1,8(sp)
    19c8:	6105                	addi	sp,sp,32
    19ca:	8082                	ret
    19cc:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19ce:	8522                	mv	a0,s0
}
    19d0:	6442                	ld	s0,16(sp)
    19d2:	64a2                	ld	s1,8(sp)
    19d4:	6105                	addi	sp,sp,32
    19d6:	8082                	ret

00000000000019d8 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19d8:	00a5c7b3          	xor	a5,a1,a0
    19dc:	8b9d                	andi	a5,a5,7
    19de:	eb95                	bnez	a5,1a12 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19e0:	0075f793          	andi	a5,a1,7
    19e4:	e7b1                	bnez	a5,1a30 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19e6:	6198                	ld	a4,0(a1)
    19e8:	00000617          	auipc	a2,0x0
    19ec:	5c063603          	ld	a2,1472(a2) # 1fa8 <__clone+0xc4>
    19f0:	00000817          	auipc	a6,0x0
    19f4:	5c083803          	ld	a6,1472(a6) # 1fb0 <__clone+0xcc>
    19f8:	a029                	j	1a02 <strcpy+0x2a>
    19fa:	05a1                	addi	a1,a1,8
    19fc:	e118                	sd	a4,0(a0)
    19fe:	6198                	ld	a4,0(a1)
    1a00:	0521                	addi	a0,a0,8
    1a02:	00c707b3          	add	a5,a4,a2
    1a06:	fff74693          	not	a3,a4
    1a0a:	8ff5                	and	a5,a5,a3
    1a0c:	0107f7b3          	and	a5,a5,a6
    1a10:	d7ed                	beqz	a5,19fa <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a12:	0005c783          	lbu	a5,0(a1)
    1a16:	00f50023          	sb	a5,0(a0)
    1a1a:	c785                	beqz	a5,1a42 <strcpy+0x6a>
    1a1c:	0015c783          	lbu	a5,1(a1)
    1a20:	0505                	addi	a0,a0,1
    1a22:	0585                	addi	a1,a1,1
    1a24:	00f50023          	sb	a5,0(a0)
    1a28:	fbf5                	bnez	a5,1a1c <strcpy+0x44>
        ;
    return d;
}
    1a2a:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a2c:	0505                	addi	a0,a0,1
    1a2e:	df45                	beqz	a4,19e6 <strcpy+0xe>
            if (!(*d = *s))
    1a30:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a34:	0585                	addi	a1,a1,1
    1a36:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1a3a:	00f50023          	sb	a5,0(a0)
    1a3e:	f7fd                	bnez	a5,1a2c <strcpy+0x54>
}
    1a40:	8082                	ret
    1a42:	8082                	ret

0000000000001a44 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a44:	00a5c7b3          	xor	a5,a1,a0
    1a48:	8b9d                	andi	a5,a5,7
    1a4a:	1a079863          	bnez	a5,1bfa <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a4e:	0075f793          	andi	a5,a1,7
    1a52:	16078463          	beqz	a5,1bba <strncpy+0x176>
    1a56:	ea01                	bnez	a2,1a66 <strncpy+0x22>
    1a58:	a421                	j	1c60 <strncpy+0x21c>
    1a5a:	167d                	addi	a2,a2,-1
    1a5c:	0505                	addi	a0,a0,1
    1a5e:	14070e63          	beqz	a4,1bba <strncpy+0x176>
    1a62:	1a060863          	beqz	a2,1c12 <strncpy+0x1ce>
    1a66:	0005c783          	lbu	a5,0(a1)
    1a6a:	0585                	addi	a1,a1,1
    1a6c:	0075f713          	andi	a4,a1,7
    1a70:	00f50023          	sb	a5,0(a0)
    1a74:	f3fd                	bnez	a5,1a5a <strncpy+0x16>
    1a76:	4805                	li	a6,1
    1a78:	1a061863          	bnez	a2,1c28 <strncpy+0x1e4>
    1a7c:	40a007b3          	neg	a5,a0
    1a80:	8b9d                	andi	a5,a5,7
    1a82:	4681                	li	a3,0
    1a84:	18061a63          	bnez	a2,1c18 <strncpy+0x1d4>
    1a88:	00778713          	addi	a4,a5,7
    1a8c:	45ad                	li	a1,11
    1a8e:	18b76363          	bltu	a4,a1,1c14 <strncpy+0x1d0>
    1a92:	1ae6eb63          	bltu	a3,a4,1c48 <strncpy+0x204>
    1a96:	1a078363          	beqz	a5,1c3c <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a9a:	00050023          	sb	zero,0(a0)
    1a9e:	4685                	li	a3,1
    1aa0:	00150713          	addi	a4,a0,1
    1aa4:	18d78f63          	beq	a5,a3,1c42 <strncpy+0x1fe>
    1aa8:	000500a3          	sb	zero,1(a0)
    1aac:	4689                	li	a3,2
    1aae:	00250713          	addi	a4,a0,2
    1ab2:	18d78e63          	beq	a5,a3,1c4e <strncpy+0x20a>
    1ab6:	00050123          	sb	zero,2(a0)
    1aba:	468d                	li	a3,3
    1abc:	00350713          	addi	a4,a0,3
    1ac0:	16d78c63          	beq	a5,a3,1c38 <strncpy+0x1f4>
    1ac4:	000501a3          	sb	zero,3(a0)
    1ac8:	4691                	li	a3,4
    1aca:	00450713          	addi	a4,a0,4
    1ace:	18d78263          	beq	a5,a3,1c52 <strncpy+0x20e>
    1ad2:	00050223          	sb	zero,4(a0)
    1ad6:	4695                	li	a3,5
    1ad8:	00550713          	addi	a4,a0,5
    1adc:	16d78d63          	beq	a5,a3,1c56 <strncpy+0x212>
    1ae0:	000502a3          	sb	zero,5(a0)
    1ae4:	469d                	li	a3,7
    1ae6:	00650713          	addi	a4,a0,6
    1aea:	16d79863          	bne	a5,a3,1c5a <strncpy+0x216>
    1aee:	00750713          	addi	a4,a0,7
    1af2:	00050323          	sb	zero,6(a0)
    1af6:	40f80833          	sub	a6,a6,a5
    1afa:	ff887593          	andi	a1,a6,-8
    1afe:	97aa                	add	a5,a5,a0
    1b00:	95be                	add	a1,a1,a5
    1b02:	0007b023          	sd	zero,0(a5)
    1b06:	07a1                	addi	a5,a5,8
    1b08:	feb79de3          	bne	a5,a1,1b02 <strncpy+0xbe>
    1b0c:	ff887593          	andi	a1,a6,-8
    1b10:	9ead                	addw	a3,a3,a1
    1b12:	00b707b3          	add	a5,a4,a1
    1b16:	12b80863          	beq	a6,a1,1c46 <strncpy+0x202>
    1b1a:	00078023          	sb	zero,0(a5)
    1b1e:	0016871b          	addiw	a4,a3,1
    1b22:	0ec77863          	bgeu	a4,a2,1c12 <strncpy+0x1ce>
    1b26:	000780a3          	sb	zero,1(a5)
    1b2a:	0026871b          	addiw	a4,a3,2
    1b2e:	0ec77263          	bgeu	a4,a2,1c12 <strncpy+0x1ce>
    1b32:	00078123          	sb	zero,2(a5)
    1b36:	0036871b          	addiw	a4,a3,3
    1b3a:	0cc77c63          	bgeu	a4,a2,1c12 <strncpy+0x1ce>
    1b3e:	000781a3          	sb	zero,3(a5)
    1b42:	0046871b          	addiw	a4,a3,4
    1b46:	0cc77663          	bgeu	a4,a2,1c12 <strncpy+0x1ce>
    1b4a:	00078223          	sb	zero,4(a5)
    1b4e:	0056871b          	addiw	a4,a3,5
    1b52:	0cc77063          	bgeu	a4,a2,1c12 <strncpy+0x1ce>
    1b56:	000782a3          	sb	zero,5(a5)
    1b5a:	0066871b          	addiw	a4,a3,6
    1b5e:	0ac77a63          	bgeu	a4,a2,1c12 <strncpy+0x1ce>
    1b62:	00078323          	sb	zero,6(a5)
    1b66:	0076871b          	addiw	a4,a3,7
    1b6a:	0ac77463          	bgeu	a4,a2,1c12 <strncpy+0x1ce>
    1b6e:	000783a3          	sb	zero,7(a5)
    1b72:	0086871b          	addiw	a4,a3,8
    1b76:	08c77e63          	bgeu	a4,a2,1c12 <strncpy+0x1ce>
    1b7a:	00078423          	sb	zero,8(a5)
    1b7e:	0096871b          	addiw	a4,a3,9
    1b82:	08c77863          	bgeu	a4,a2,1c12 <strncpy+0x1ce>
    1b86:	000784a3          	sb	zero,9(a5)
    1b8a:	00a6871b          	addiw	a4,a3,10
    1b8e:	08c77263          	bgeu	a4,a2,1c12 <strncpy+0x1ce>
    1b92:	00078523          	sb	zero,10(a5)
    1b96:	00b6871b          	addiw	a4,a3,11
    1b9a:	06c77c63          	bgeu	a4,a2,1c12 <strncpy+0x1ce>
    1b9e:	000785a3          	sb	zero,11(a5)
    1ba2:	00c6871b          	addiw	a4,a3,12
    1ba6:	06c77663          	bgeu	a4,a2,1c12 <strncpy+0x1ce>
    1baa:	00078623          	sb	zero,12(a5)
    1bae:	26b5                	addiw	a3,a3,13
    1bb0:	06c6f163          	bgeu	a3,a2,1c12 <strncpy+0x1ce>
    1bb4:	000786a3          	sb	zero,13(a5)
    1bb8:	8082                	ret
            ;
        if (!n || !*s)
    1bba:	c645                	beqz	a2,1c62 <strncpy+0x21e>
    1bbc:	0005c783          	lbu	a5,0(a1)
    1bc0:	ea078be3          	beqz	a5,1a76 <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bc4:	479d                	li	a5,7
    1bc6:	02c7ff63          	bgeu	a5,a2,1c04 <strncpy+0x1c0>
    1bca:	00000897          	auipc	a7,0x0
    1bce:	3de8b883          	ld	a7,990(a7) # 1fa8 <__clone+0xc4>
    1bd2:	00000817          	auipc	a6,0x0
    1bd6:	3de83803          	ld	a6,990(a6) # 1fb0 <__clone+0xcc>
    1bda:	431d                	li	t1,7
    1bdc:	6198                	ld	a4,0(a1)
    1bde:	011707b3          	add	a5,a4,a7
    1be2:	fff74693          	not	a3,a4
    1be6:	8ff5                	and	a5,a5,a3
    1be8:	0107f7b3          	and	a5,a5,a6
    1bec:	ef81                	bnez	a5,1c04 <strncpy+0x1c0>
            *wd = *ws;
    1bee:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bf0:	1661                	addi	a2,a2,-8
    1bf2:	05a1                	addi	a1,a1,8
    1bf4:	0521                	addi	a0,a0,8
    1bf6:	fec363e3          	bltu	t1,a2,1bdc <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1bfa:	e609                	bnez	a2,1c04 <strncpy+0x1c0>
    1bfc:	a08d                	j	1c5e <strncpy+0x21a>
    1bfe:	167d                	addi	a2,a2,-1
    1c00:	0505                	addi	a0,a0,1
    1c02:	ca01                	beqz	a2,1c12 <strncpy+0x1ce>
    1c04:	0005c783          	lbu	a5,0(a1)
    1c08:	0585                	addi	a1,a1,1
    1c0a:	00f50023          	sb	a5,0(a0)
    1c0e:	fbe5                	bnez	a5,1bfe <strncpy+0x1ba>
        ;
tail:
    1c10:	b59d                	j	1a76 <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1c12:	8082                	ret
    1c14:	472d                	li	a4,11
    1c16:	bdb5                	j	1a92 <strncpy+0x4e>
    1c18:	00778713          	addi	a4,a5,7
    1c1c:	45ad                	li	a1,11
    1c1e:	fff60693          	addi	a3,a2,-1
    1c22:	e6b778e3          	bgeu	a4,a1,1a92 <strncpy+0x4e>
    1c26:	b7fd                	j	1c14 <strncpy+0x1d0>
    1c28:	40a007b3          	neg	a5,a0
    1c2c:	8832                	mv	a6,a2
    1c2e:	8b9d                	andi	a5,a5,7
    1c30:	4681                	li	a3,0
    1c32:	e4060be3          	beqz	a2,1a88 <strncpy+0x44>
    1c36:	b7cd                	j	1c18 <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c38:	468d                	li	a3,3
    1c3a:	bd75                	j	1af6 <strncpy+0xb2>
    1c3c:	872a                	mv	a4,a0
    1c3e:	4681                	li	a3,0
    1c40:	bd5d                	j	1af6 <strncpy+0xb2>
    1c42:	4685                	li	a3,1
    1c44:	bd4d                	j	1af6 <strncpy+0xb2>
    1c46:	8082                	ret
    1c48:	87aa                	mv	a5,a0
    1c4a:	4681                	li	a3,0
    1c4c:	b5f9                	j	1b1a <strncpy+0xd6>
    1c4e:	4689                	li	a3,2
    1c50:	b55d                	j	1af6 <strncpy+0xb2>
    1c52:	4691                	li	a3,4
    1c54:	b54d                	j	1af6 <strncpy+0xb2>
    1c56:	4695                	li	a3,5
    1c58:	bd79                	j	1af6 <strncpy+0xb2>
    1c5a:	4699                	li	a3,6
    1c5c:	bd69                	j	1af6 <strncpy+0xb2>
    1c5e:	8082                	ret
    1c60:	8082                	ret
    1c62:	8082                	ret

0000000000001c64 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c64:	87aa                	mv	a5,a0
    1c66:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c68:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c6c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c70:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c72:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c74:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c78:	2501                	sext.w	a0,a0
    1c7a:	8082                	ret

0000000000001c7c <openat>:
    register long a7 __asm__("a7") = n;
    1c7c:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c80:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c84:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c88:	2501                	sext.w	a0,a0
    1c8a:	8082                	ret

0000000000001c8c <fcntl>:
    register long a7 __asm__("a7") = n;
    1c8c:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c8e:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1c92:	2501                	sext.w	a0,a0
    1c94:	8082                	ret

0000000000001c96 <close>:
    register long a7 __asm__("a7") = n;
    1c96:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c9a:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c9e:	2501                	sext.w	a0,a0
    1ca0:	8082                	ret

0000000000001ca2 <read>:
    register long a7 __asm__("a7") = n;
    1ca2:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ca6:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1caa:	8082                	ret

0000000000001cac <write>:
    register long a7 __asm__("a7") = n;
    1cac:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cb0:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1cb4:	8082                	ret

0000000000001cb6 <getpid>:
    register long a7 __asm__("a7") = n;
    1cb6:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1cba:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1cbe:	2501                	sext.w	a0,a0
    1cc0:	8082                	ret

0000000000001cc2 <getppid>:
    register long a7 __asm__("a7") = n;
    1cc2:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1cc6:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cca:	2501                	sext.w	a0,a0
    1ccc:	8082                	ret

0000000000001cce <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cce:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cd2:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cd6:	2501                	sext.w	a0,a0
    1cd8:	8082                	ret

0000000000001cda <fork>:
    register long a7 __asm__("a7") = n;
    1cda:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cde:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1ce0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ce2:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1ce6:	2501                	sext.w	a0,a0
    1ce8:	8082                	ret

0000000000001cea <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cea:	85b2                	mv	a1,a2
    1cec:	863a                	mv	a2,a4
    if (stack)
    1cee:	c191                	beqz	a1,1cf2 <clone+0x8>
	stack += stack_size;
    1cf0:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cf2:	4781                	li	a5,0
    1cf4:	4701                	li	a4,0
    1cf6:	4681                	li	a3,0
    1cf8:	2601                	sext.w	a2,a2
    1cfa:	a2ed                	j	1ee4 <__clone>

0000000000001cfc <exit>:
    register long a7 __asm__("a7") = n;
    1cfc:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d00:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d04:	8082                	ret

0000000000001d06 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d06:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d0a:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d0c:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d10:	2501                	sext.w	a0,a0
    1d12:	8082                	ret

0000000000001d14 <exec>:
    register long a7 __asm__("a7") = n;
    1d14:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d18:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d1c:	2501                	sext.w	a0,a0
    1d1e:	8082                	ret

0000000000001d20 <execve>:
    register long a7 __asm__("a7") = n;
    1d20:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d24:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d28:	2501                	sext.w	a0,a0
    1d2a:	8082                	ret

0000000000001d2c <times>:
    register long a7 __asm__("a7") = n;
    1d2c:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d30:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d34:	2501                	sext.w	a0,a0
    1d36:	8082                	ret

0000000000001d38 <get_time>:

int64 get_time()
{
    1d38:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d3a:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d3e:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d40:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d42:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d46:	2501                	sext.w	a0,a0
    1d48:	ed09                	bnez	a0,1d62 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d4a:	67a2                	ld	a5,8(sp)
    1d4c:	3e800713          	li	a4,1000
    1d50:	00015503          	lhu	a0,0(sp)
    1d54:	02e7d7b3          	divu	a5,a5,a4
    1d58:	02e50533          	mul	a0,a0,a4
    1d5c:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d5e:	0141                	addi	sp,sp,16
    1d60:	8082                	ret
        return -1;
    1d62:	557d                	li	a0,-1
    1d64:	bfed                	j	1d5e <get_time+0x26>

0000000000001d66 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d66:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d6a:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d6e:	2501                	sext.w	a0,a0
    1d70:	8082                	ret

0000000000001d72 <time>:
    register long a7 __asm__("a7") = n;
    1d72:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d76:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d7a:	2501                	sext.w	a0,a0
    1d7c:	8082                	ret

0000000000001d7e <sleep>:

int sleep(unsigned long long time)
{
    1d7e:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d80:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d82:	850a                	mv	a0,sp
    1d84:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d86:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d8a:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d8c:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d90:	e501                	bnez	a0,1d98 <sleep+0x1a>
    return 0;
    1d92:	4501                	li	a0,0
}
    1d94:	0141                	addi	sp,sp,16
    1d96:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d98:	4502                	lw	a0,0(sp)
}
    1d9a:	0141                	addi	sp,sp,16
    1d9c:	8082                	ret

0000000000001d9e <set_priority>:
    register long a7 __asm__("a7") = n;
    1d9e:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1da2:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1da6:	2501                	sext.w	a0,a0
    1da8:	8082                	ret

0000000000001daa <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1daa:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1dae:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1db2:	8082                	ret

0000000000001db4 <munmap>:
    register long a7 __asm__("a7") = n;
    1db4:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db8:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1dbc:	2501                	sext.w	a0,a0
    1dbe:	8082                	ret

0000000000001dc0 <wait>:

int wait(int *code)
{
    1dc0:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dc2:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1dc6:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1dc8:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1dca:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dcc:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1dd0:	2501                	sext.w	a0,a0
    1dd2:	8082                	ret

0000000000001dd4 <spawn>:
    register long a7 __asm__("a7") = n;
    1dd4:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1dd8:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1ddc:	2501                	sext.w	a0,a0
    1dde:	8082                	ret

0000000000001de0 <mailread>:
    register long a7 __asm__("a7") = n;
    1de0:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1de4:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1de8:	2501                	sext.w	a0,a0
    1dea:	8082                	ret

0000000000001dec <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dec:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df0:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1df4:	2501                	sext.w	a0,a0
    1df6:	8082                	ret

0000000000001df8 <fstat>:
    register long a7 __asm__("a7") = n;
    1df8:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dfc:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e00:	2501                	sext.w	a0,a0
    1e02:	8082                	ret

0000000000001e04 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e04:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e06:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e0a:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e0c:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e10:	2501                	sext.w	a0,a0
    1e12:	8082                	ret

0000000000001e14 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e14:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e16:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e1a:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e1c:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e20:	2501                	sext.w	a0,a0
    1e22:	8082                	ret

0000000000001e24 <link>:

int link(char *old_path, char *new_path)
{
    1e24:	87aa                	mv	a5,a0
    1e26:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e28:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e2c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e30:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e32:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e36:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e38:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e3c:	2501                	sext.w	a0,a0
    1e3e:	8082                	ret

0000000000001e40 <unlink>:

int unlink(char *path)
{
    1e40:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e42:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e46:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e4a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e4c:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e50:	2501                	sext.w	a0,a0
    1e52:	8082                	ret

0000000000001e54 <uname>:
    register long a7 __asm__("a7") = n;
    1e54:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e58:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e5c:	2501                	sext.w	a0,a0
    1e5e:	8082                	ret

0000000000001e60 <brk>:
    register long a7 __asm__("a7") = n;
    1e60:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e64:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e68:	2501                	sext.w	a0,a0
    1e6a:	8082                	ret

0000000000001e6c <getcwd>:
    register long a7 __asm__("a7") = n;
    1e6c:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e6e:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e72:	8082                	ret

0000000000001e74 <chdir>:
    register long a7 __asm__("a7") = n;
    1e74:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e78:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e7c:	2501                	sext.w	a0,a0
    1e7e:	8082                	ret

0000000000001e80 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e80:	862e                	mv	a2,a1
    1e82:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e84:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e86:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e8a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e8e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e90:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e92:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e96:	2501                	sext.w	a0,a0
    1e98:	8082                	ret

0000000000001e9a <getdents>:
    register long a7 __asm__("a7") = n;
    1e9a:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e9e:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1ea2:	2501                	sext.w	a0,a0
    1ea4:	8082                	ret

0000000000001ea6 <pipe>:
    register long a7 __asm__("a7") = n;
    1ea6:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1eaa:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eac:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1eb0:	2501                	sext.w	a0,a0
    1eb2:	8082                	ret

0000000000001eb4 <dup>:
    register long a7 __asm__("a7") = n;
    1eb4:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1eb6:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1eba:	2501                	sext.w	a0,a0
    1ebc:	8082                	ret

0000000000001ebe <dup2>:
    register long a7 __asm__("a7") = n;
    1ebe:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1ec0:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ec2:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ec6:	2501                	sext.w	a0,a0
    1ec8:	8082                	ret

0000000000001eca <mount>:
    register long a7 __asm__("a7") = n;
    1eca:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ece:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ed2:	2501                	sext.w	a0,a0
    1ed4:	8082                	ret

0000000000001ed6 <umount>:
    register long a7 __asm__("a7") = n;
    1ed6:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1eda:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1edc:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ee0:	2501                	sext.w	a0,a0
    1ee2:	8082                	ret

0000000000001ee4 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ee4:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1ee6:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ee8:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1eea:	8532                	mv	a0,a2
	mv a2, a4
    1eec:	863a                	mv	a2,a4
	mv a3, a5
    1eee:	86be                	mv	a3,a5
	mv a4, a6
    1ef0:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ef2:	0dc00893          	li	a7,220
	ecall
    1ef6:	00000073          	ecall

	beqz a0, 1f
    1efa:	c111                	beqz	a0,1efe <__clone+0x1a>
	# Parent
	ret
    1efc:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1efe:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f00:	6522                	ld	a0,8(sp)
	jalr a1
    1f02:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f04:	05d00893          	li	a7,93
	ecall
    1f08:	00000073          	ecall
