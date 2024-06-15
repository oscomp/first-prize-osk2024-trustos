
/home/brightnight/OScompetition/6.13晚final_main/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/sleep：     文件格式 elf64-littleriscv


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
    1004:	1101                	addi	sp,sp,-32
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f1a50513          	addi	a0,a0,-230 # 1f20 <__clone+0x2e>
void test_sleep() {
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
    1012:	e426                	sd	s1,8(sp)
	TEST_START(__func__);
    1014:	332000ef          	jal	ra,1346 <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	fa050513          	addi	a0,a0,-96 # 1fb8 <__func__.0>
    1020:	326000ef          	jal	ra,1346 <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	f1450513          	addi	a0,a0,-236 # 1f38 <__clone+0x46>
    102c:	31a000ef          	jal	ra,1346 <puts>

	int time1 = get_time();
    1030:	517000ef          	jal	ra,1d46 <get_time>
    1034:	0005041b          	sext.w	s0,a0
	assert(time1 >= 0);
    1038:	06044f63          	bltz	s0,10b6 <test_sleep+0xb2>
	int ret = sleep(1);
    103c:	4505                	li	a0,1
    103e:	54f000ef          	jal	ra,1d8c <sleep>
	assert(ret == 0);
    1042:	e13d                	bnez	a0,10a8 <test_sleep+0xa4>
	int time2 = get_time();
    1044:	503000ef          	jal	ra,1d46 <get_time>
    1048:	0005049b          	sext.w	s1,a0
	assert(time2 >= 0);
    104c:	0204cf63          	bltz	s1,108a <test_sleep+0x86>

	if(time2 - time1 >= 1){	
    1050:	04945563          	bge	s0,s1,109a <test_sleep+0x96>
		printf("sleep success.\n");
    1054:	00001517          	auipc	a0,0x1
    1058:	f1450513          	addi	a0,a0,-236 # 1f68 <__clone+0x76>
    105c:	30c000ef          	jal	ra,1368 <printf>
	}else{
		printf("sleep error.\n");
	}
	TEST_END(__func__);
    1060:	00001517          	auipc	a0,0x1
    1064:	f2850513          	addi	a0,a0,-216 # 1f88 <__clone+0x96>
    1068:	2de000ef          	jal	ra,1346 <puts>
    106c:	00001517          	auipc	a0,0x1
    1070:	f4c50513          	addi	a0,a0,-180 # 1fb8 <__func__.0>
    1074:	2d2000ef          	jal	ra,1346 <puts>
}
    1078:	6442                	ld	s0,16(sp)
    107a:	60e2                	ld	ra,24(sp)
    107c:	64a2                	ld	s1,8(sp)
	TEST_END(__func__);
    107e:	00001517          	auipc	a0,0x1
    1082:	eba50513          	addi	a0,a0,-326 # 1f38 <__clone+0x46>
}
    1086:	6105                	addi	sp,sp,32
	TEST_END(__func__);
    1088:	ac7d                	j	1346 <puts>
	assert(time2 >= 0);
    108a:	00001517          	auipc	a0,0x1
    108e:	ebe50513          	addi	a0,a0,-322 # 1f48 <__clone+0x56>
    1092:	55a000ef          	jal	ra,15ec <panic>
	if(time2 - time1 >= 1){	
    1096:	fa944fe3          	blt	s0,s1,1054 <test_sleep+0x50>
		printf("sleep error.\n");
    109a:	00001517          	auipc	a0,0x1
    109e:	ede50513          	addi	a0,a0,-290 # 1f78 <__clone+0x86>
    10a2:	2c6000ef          	jal	ra,1368 <printf>
    10a6:	bf6d                	j	1060 <test_sleep+0x5c>
	assert(ret == 0);
    10a8:	00001517          	auipc	a0,0x1
    10ac:	ea050513          	addi	a0,a0,-352 # 1f48 <__clone+0x56>
    10b0:	53c000ef          	jal	ra,15ec <panic>
    10b4:	bf41                	j	1044 <test_sleep+0x40>
	assert(time1 >= 0);
    10b6:	00001517          	auipc	a0,0x1
    10ba:	e9250513          	addi	a0,a0,-366 # 1f48 <__clone+0x56>
    10be:	52e000ef          	jal	ra,15ec <panic>
    10c2:	bfad                	j	103c <test_sleep+0x38>

00000000000010c4 <main>:

int main(void) {
    10c4:	1141                	addi	sp,sp,-16
    10c6:	e406                	sd	ra,8(sp)
	test_sleep();
    10c8:	f3dff0ef          	jal	ra,1004 <test_sleep>
	return 0;
}
    10cc:	60a2                	ld	ra,8(sp)
    10ce:	4501                	li	a0,0
    10d0:	0141                	addi	sp,sp,16
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
    10d8:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10da:	05a1                	addi	a1,a1,8
{
    10dc:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10de:	fe7ff0ef          	jal	ra,10c4 <main>
    10e2:	429000ef          	jal	ra,1d0a <exit>
	return 0;
}
    10e6:	60a2                	ld	ra,8(sp)
    10e8:	4501                	li	a0,0
    10ea:	0141                	addi	sp,sp,16
    10ec:	8082                	ret

00000000000010ee <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10ee:	7179                	addi	sp,sp,-48
    10f0:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10f2:	12054b63          	bltz	a0,1228 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10f6:	02b577bb          	remuw	a5,a0,a1
    10fa:	00001617          	auipc	a2,0x1
    10fe:	ece60613          	addi	a2,a2,-306 # 1fc8 <digits>
    buf[16] = 0;
    1102:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1106:	0005871b          	sext.w	a4,a1
    110a:	1782                	slli	a5,a5,0x20
    110c:	9381                	srli	a5,a5,0x20
    110e:	97b2                	add	a5,a5,a2
    1110:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1114:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1118:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    111c:	1cb56363          	bltu	a0,a1,12e2 <printint.constprop.0+0x1f4>
        buf[i--] = digits[x % base];
    1120:	45b9                	li	a1,14
    1122:	02e877bb          	remuw	a5,a6,a4
    1126:	1782                	slli	a5,a5,0x20
    1128:	9381                	srli	a5,a5,0x20
    112a:	97b2                	add	a5,a5,a2
    112c:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1130:	02e856bb          	divuw	a3,a6,a4
        buf[i--] = digits[x % base];
    1134:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    1138:	0ce86e63          	bltu	a6,a4,1214 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    113c:	02e6f5bb          	remuw	a1,a3,a4
    } while ((x /= base) != 0);
    1140:	02e6d7bb          	divuw	a5,a3,a4
        buf[i--] = digits[x % base];
    1144:	1582                	slli	a1,a1,0x20
    1146:	9181                	srli	a1,a1,0x20
    1148:	95b2                	add	a1,a1,a2
    114a:	0005c583          	lbu	a1,0(a1)
    114e:	00b10aa3          	sb	a1,21(sp)
    } while ((x /= base) != 0);
    1152:	0007859b          	sext.w	a1,a5
    1156:	12e6ec63          	bltu	a3,a4,128e <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    115a:	02e7f6bb          	remuw	a3,a5,a4
    115e:	1682                	slli	a3,a3,0x20
    1160:	9281                	srli	a3,a3,0x20
    1162:	96b2                	add	a3,a3,a2
    1164:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1168:	02e7d83b          	divuw	a6,a5,a4
        buf[i--] = digits[x % base];
    116c:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1170:	12e5e863          	bltu	a1,a4,12a0 <printint.constprop.0+0x1b2>
        buf[i--] = digits[x % base];
    1174:	02e876bb          	remuw	a3,a6,a4
    1178:	1682                	slli	a3,a3,0x20
    117a:	9281                	srli	a3,a3,0x20
    117c:	96b2                	add	a3,a3,a2
    117e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1182:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1186:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    118a:	12e86463          	bltu	a6,a4,12b2 <printint.constprop.0+0x1c4>
        buf[i--] = digits[x % base];
    118e:	02e5f6bb          	remuw	a3,a1,a4
    1192:	1682                	slli	a3,a3,0x20
    1194:	9281                	srli	a3,a3,0x20
    1196:	96b2                	add	a3,a3,a2
    1198:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    119c:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11a0:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    11a4:	0ce5ec63          	bltu	a1,a4,127c <printint.constprop.0+0x18e>
        buf[i--] = digits[x % base];
    11a8:	02e876bb          	remuw	a3,a6,a4
    11ac:	1682                	slli	a3,a3,0x20
    11ae:	9281                	srli	a3,a3,0x20
    11b0:	96b2                	add	a3,a3,a2
    11b2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11b6:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11ba:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11be:	10e86963          	bltu	a6,a4,12d0 <printint.constprop.0+0x1e2>
        buf[i--] = digits[x % base];
    11c2:	02e5f6bb          	remuw	a3,a1,a4
    11c6:	1682                	slli	a3,a3,0x20
    11c8:	9281                	srli	a3,a3,0x20
    11ca:	96b2                	add	a3,a3,a2
    11cc:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11d0:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11d4:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11d8:	10e5e763          	bltu	a1,a4,12e6 <printint.constprop.0+0x1f8>
        buf[i--] = digits[x % base];
    11dc:	02e876bb          	remuw	a3,a6,a4
    11e0:	1682                	slli	a3,a3,0x20
    11e2:	9281                	srli	a3,a3,0x20
    11e4:	96b2                	add	a3,a3,a2
    11e6:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11ea:	02e857bb          	divuw	a5,a6,a4
        buf[i--] = digits[x % base];
    11ee:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11f2:	10e86363          	bltu	a6,a4,12f8 <printint.constprop.0+0x20a>
        buf[i--] = digits[x % base];
    11f6:	1782                	slli	a5,a5,0x20
    11f8:	9381                	srli	a5,a5,0x20
    11fa:	97b2                	add	a5,a5,a2
    11fc:	0007c783          	lbu	a5,0(a5)
    1200:	4599                	li	a1,6
    1202:	00f10723          	sb	a5,14(sp)

    if (sign)
    1206:	00055763          	bgez	a0,1214 <printint.constprop.0+0x126>
        buf[i--] = '-';
    120a:	02d00793          	li	a5,45
    120e:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1212:	4595                	li	a1,5
    write(f, s, l);
    1214:	003c                	addi	a5,sp,8
    1216:	4641                	li	a2,16
    1218:	9e0d                	subw	a2,a2,a1
    121a:	4505                	li	a0,1
    121c:	95be                	add	a1,a1,a5
    121e:	29d000ef          	jal	ra,1cba <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1222:	70a2                	ld	ra,40(sp)
    1224:	6145                	addi	sp,sp,48
    1226:	8082                	ret
        x = -xx;
    1228:	40a0083b          	negw	a6,a0
        buf[i--] = digits[x % base];
    122c:	02b877bb          	remuw	a5,a6,a1
    1230:	00001617          	auipc	a2,0x1
    1234:	d9860613          	addi	a2,a2,-616 # 1fc8 <digits>
    buf[16] = 0;
    1238:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    123c:	0005871b          	sext.w	a4,a1
    1240:	1782                	slli	a5,a5,0x20
    1242:	9381                	srli	a5,a5,0x20
    1244:	97b2                	add	a5,a5,a2
    1246:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    124a:	02b858bb          	divuw	a7,a6,a1
        buf[i--] = digits[x % base];
    124e:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1252:	06b86963          	bltu	a6,a1,12c4 <printint.constprop.0+0x1d6>
        buf[i--] = digits[x % base];
    1256:	02e8f7bb          	remuw	a5,a7,a4
    125a:	1782                	slli	a5,a5,0x20
    125c:	9381                	srli	a5,a5,0x20
    125e:	97b2                	add	a5,a5,a2
    1260:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1264:	02e8d6bb          	divuw	a3,a7,a4
        buf[i--] = digits[x % base];
    1268:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    126c:	ece8f8e3          	bgeu	a7,a4,113c <printint.constprop.0+0x4e>
        buf[i--] = '-';
    1270:	02d00793          	li	a5,45
    1274:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1278:	45b5                	li	a1,13
    127a:	bf69                	j	1214 <printint.constprop.0+0x126>
    127c:	45a9                	li	a1,10
    if (sign)
    127e:	f8055be3          	bgez	a0,1214 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1282:	02d00793          	li	a5,45
    1286:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    128a:	45a5                	li	a1,9
    128c:	b761                	j	1214 <printint.constprop.0+0x126>
    128e:	45b5                	li	a1,13
    if (sign)
    1290:	f80552e3          	bgez	a0,1214 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1294:	02d00793          	li	a5,45
    1298:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    129c:	45b1                	li	a1,12
    129e:	bf9d                	j	1214 <printint.constprop.0+0x126>
    12a0:	45b1                	li	a1,12
    if (sign)
    12a2:	f60559e3          	bgez	a0,1214 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12a6:	02d00793          	li	a5,45
    12aa:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12ae:	45ad                	li	a1,11
    12b0:	b795                	j	1214 <printint.constprop.0+0x126>
    12b2:	45ad                	li	a1,11
    if (sign)
    12b4:	f60550e3          	bgez	a0,1214 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12b8:	02d00793          	li	a5,45
    12bc:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12c0:	45a9                	li	a1,10
    12c2:	bf89                	j	1214 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12c4:	02d00793          	li	a5,45
    12c8:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12cc:	45b9                	li	a1,14
    12ce:	b799                	j	1214 <printint.constprop.0+0x126>
    12d0:	45a5                	li	a1,9
    if (sign)
    12d2:	f40551e3          	bgez	a0,1214 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12d6:	02d00793          	li	a5,45
    12da:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12de:	45a1                	li	a1,8
    12e0:	bf15                	j	1214 <printint.constprop.0+0x126>
    i = 15;
    12e2:	45bd                	li	a1,15
    12e4:	bf05                	j	1214 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    12e6:	45a1                	li	a1,8
    if (sign)
    12e8:	f20556e3          	bgez	a0,1214 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12ec:	02d00793          	li	a5,45
    12f0:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12f4:	459d                	li	a1,7
    12f6:	bf39                	j	1214 <printint.constprop.0+0x126>
    12f8:	459d                	li	a1,7
    if (sign)
    12fa:	f0055de3          	bgez	a0,1214 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12fe:	02d00793          	li	a5,45
    1302:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1306:	4599                	li	a1,6
    1308:	b731                	j	1214 <printint.constprop.0+0x126>

000000000000130a <getchar>:
{
    130a:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    130c:	00f10593          	addi	a1,sp,15
    1310:	4605                	li	a2,1
    1312:	4501                	li	a0,0
{
    1314:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1316:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    131a:	197000ef          	jal	ra,1cb0 <read>
}
    131e:	60e2                	ld	ra,24(sp)
    1320:	00f14503          	lbu	a0,15(sp)
    1324:	6105                	addi	sp,sp,32
    1326:	8082                	ret

0000000000001328 <putchar>:
{
    1328:	1101                	addi	sp,sp,-32
    132a:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    132c:	00f10593          	addi	a1,sp,15
    1330:	4605                	li	a2,1
    1332:	4505                	li	a0,1
{
    1334:	ec06                	sd	ra,24(sp)
    char byte = c;
    1336:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    133a:	181000ef          	jal	ra,1cba <write>
}
    133e:	60e2                	ld	ra,24(sp)
    1340:	2501                	sext.w	a0,a0
    1342:	6105                	addi	sp,sp,32
    1344:	8082                	ret

0000000000001346 <puts>:
{
    1346:	1141                	addi	sp,sp,-16
    1348:	e406                	sd	ra,8(sp)
    134a:	e022                	sd	s0,0(sp)
    134c:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    134e:	57e000ef          	jal	ra,18cc <strlen>
    1352:	862a                	mv	a2,a0
    1354:	85a2                	mv	a1,s0
    1356:	4505                	li	a0,1
    1358:	163000ef          	jal	ra,1cba <write>
}
    135c:	60a2                	ld	ra,8(sp)
    135e:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1360:	957d                	srai	a0,a0,0x3f
    return r;
    1362:	2501                	sext.w	a0,a0
}
    1364:	0141                	addi	sp,sp,16
    1366:	8082                	ret

0000000000001368 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1368:	7171                	addi	sp,sp,-176
    136a:	fc56                	sd	s5,56(sp)
    136c:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    136e:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1370:	18bc                	addi	a5,sp,120
{
    1372:	e8ca                	sd	s2,80(sp)
    1374:	e4ce                	sd	s3,72(sp)
    1376:	e0d2                	sd	s4,64(sp)
    1378:	f85a                	sd	s6,48(sp)
    137a:	f486                	sd	ra,104(sp)
    137c:	f0a2                	sd	s0,96(sp)
    137e:	eca6                	sd	s1,88(sp)
    1380:	fcae                	sd	a1,120(sp)
    1382:	e132                	sd	a2,128(sp)
    1384:	e536                	sd	a3,136(sp)
    1386:	e93a                	sd	a4,144(sp)
    1388:	f142                	sd	a6,160(sp)
    138a:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    138c:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    138e:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1392:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1396:	00001b17          	auipc	s6,0x1
    139a:	c02b0b13          	addi	s6,s6,-1022 # 1f98 <__clone+0xa6>
    buf[i++] = '0';
    139e:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13a2:	00001997          	auipc	s3,0x1
    13a6:	c2698993          	addi	s3,s3,-986 # 1fc8 <digits>
        if (!*s)
    13aa:	00054783          	lbu	a5,0(a0)
    13ae:	16078a63          	beqz	a5,1522 <printf+0x1ba>
    13b2:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13b4:	19278163          	beq	a5,s2,1536 <printf+0x1ce>
    13b8:	00164783          	lbu	a5,1(a2)
    13bc:	0605                	addi	a2,a2,1
    13be:	fbfd                	bnez	a5,13b4 <printf+0x4c>
    13c0:	84b2                	mv	s1,a2
        l = z - a;
    13c2:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13c6:	85aa                	mv	a1,a0
    13c8:	8622                	mv	a2,s0
    13ca:	4505                	li	a0,1
    13cc:	0ef000ef          	jal	ra,1cba <write>
        if (l)
    13d0:	18041c63          	bnez	s0,1568 <printf+0x200>
        if (s[1] == 0)
    13d4:	0014c783          	lbu	a5,1(s1)
    13d8:	14078563          	beqz	a5,1522 <printf+0x1ba>
        switch (s[1])
    13dc:	1d478063          	beq	a5,s4,159c <printf+0x234>
    13e0:	18fa6663          	bltu	s4,a5,156c <printf+0x204>
    13e4:	06400713          	li	a4,100
    13e8:	1ae78063          	beq	a5,a4,1588 <printf+0x220>
    13ec:	07000713          	li	a4,112
    13f0:	1ce79963          	bne	a5,a4,15c2 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    13f4:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13f6:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13fa:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13fc:	631c                	ld	a5,0(a4)
    13fe:	0721                	addi	a4,a4,8
    1400:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1402:	00479293          	slli	t0,a5,0x4
    1406:	00879f93          	slli	t6,a5,0x8
    140a:	00c79f13          	slli	t5,a5,0xc
    140e:	01079e93          	slli	t4,a5,0x10
    1412:	01479e13          	slli	t3,a5,0x14
    1416:	01879313          	slli	t1,a5,0x18
    141a:	01c79893          	slli	a7,a5,0x1c
    141e:	02479813          	slli	a6,a5,0x24
    1422:	02879513          	slli	a0,a5,0x28
    1426:	02c79593          	slli	a1,a5,0x2c
    142a:	03079693          	slli	a3,a5,0x30
    142e:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1432:	03c7d413          	srli	s0,a5,0x3c
    1436:	01c7d39b          	srliw	t2,a5,0x1c
    143a:	03c2d293          	srli	t0,t0,0x3c
    143e:	03cfdf93          	srli	t6,t6,0x3c
    1442:	03cf5f13          	srli	t5,t5,0x3c
    1446:	03cede93          	srli	t4,t4,0x3c
    144a:	03ce5e13          	srli	t3,t3,0x3c
    144e:	03c35313          	srli	t1,t1,0x3c
    1452:	03c8d893          	srli	a7,a7,0x3c
    1456:	03c85813          	srli	a6,a6,0x3c
    145a:	9171                	srli	a0,a0,0x3c
    145c:	91f1                	srli	a1,a1,0x3c
    145e:	92f1                	srli	a3,a3,0x3c
    1460:	9371                	srli	a4,a4,0x3c
    1462:	96ce                	add	a3,a3,s3
    1464:	974e                	add	a4,a4,s3
    1466:	944e                	add	s0,s0,s3
    1468:	92ce                	add	t0,t0,s3
    146a:	9fce                	add	t6,t6,s3
    146c:	9f4e                	add	t5,t5,s3
    146e:	9ece                	add	t4,t4,s3
    1470:	9e4e                	add	t3,t3,s3
    1472:	934e                	add	t1,t1,s3
    1474:	98ce                	add	a7,a7,s3
    1476:	93ce                	add	t2,t2,s3
    1478:	984e                	add	a6,a6,s3
    147a:	954e                	add	a0,a0,s3
    147c:	95ce                	add	a1,a1,s3
    147e:	0006c083          	lbu	ra,0(a3)
    1482:	0002c283          	lbu	t0,0(t0)
    1486:	00074683          	lbu	a3,0(a4)
    148a:	000fcf83          	lbu	t6,0(t6)
    148e:	000f4f03          	lbu	t5,0(t5)
    1492:	000ece83          	lbu	t4,0(t4)
    1496:	000e4e03          	lbu	t3,0(t3)
    149a:	00034303          	lbu	t1,0(t1)
    149e:	0008c883          	lbu	a7,0(a7)
    14a2:	0003c383          	lbu	t2,0(t2)
    14a6:	00084803          	lbu	a6,0(a6)
    14aa:	00054503          	lbu	a0,0(a0)
    14ae:	0005c583          	lbu	a1,0(a1)
    14b2:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14b6:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14ba:	9371                	srli	a4,a4,0x3c
    14bc:	8bbd                	andi	a5,a5,15
    14be:	974e                	add	a4,a4,s3
    14c0:	97ce                	add	a5,a5,s3
    14c2:	005105a3          	sb	t0,11(sp)
    14c6:	01f10623          	sb	t6,12(sp)
    14ca:	01e106a3          	sb	t5,13(sp)
    14ce:	01d10723          	sb	t4,14(sp)
    14d2:	01c107a3          	sb	t3,15(sp)
    14d6:	00610823          	sb	t1,16(sp)
    14da:	011108a3          	sb	a7,17(sp)
    14de:	00710923          	sb	t2,18(sp)
    14e2:	010109a3          	sb	a6,19(sp)
    14e6:	00a10a23          	sb	a0,20(sp)
    14ea:	00b10aa3          	sb	a1,21(sp)
    14ee:	00110b23          	sb	ra,22(sp)
    14f2:	00d10ba3          	sb	a3,23(sp)
    14f6:	00810523          	sb	s0,10(sp)
    14fa:	00074703          	lbu	a4,0(a4)
    14fe:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1502:	002c                	addi	a1,sp,8
    1504:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1506:	00e10c23          	sb	a4,24(sp)
    150a:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    150e:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1512:	7a8000ef          	jal	ra,1cba <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1516:	00248513          	addi	a0,s1,2
        if (!*s)
    151a:	00054783          	lbu	a5,0(a0)
    151e:	e8079ae3          	bnez	a5,13b2 <printf+0x4a>
    }
    va_end(ap);
}
    1522:	70a6                	ld	ra,104(sp)
    1524:	7406                	ld	s0,96(sp)
    1526:	64e6                	ld	s1,88(sp)
    1528:	6946                	ld	s2,80(sp)
    152a:	69a6                	ld	s3,72(sp)
    152c:	6a06                	ld	s4,64(sp)
    152e:	7ae2                	ld	s5,56(sp)
    1530:	7b42                	ld	s6,48(sp)
    1532:	614d                	addi	sp,sp,176
    1534:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1536:	00064783          	lbu	a5,0(a2)
    153a:	84b2                	mv	s1,a2
    153c:	01278963          	beq	a5,s2,154e <printf+0x1e6>
    1540:	b549                	j	13c2 <printf+0x5a>
    1542:	0024c783          	lbu	a5,2(s1)
    1546:	0605                	addi	a2,a2,1
    1548:	0489                	addi	s1,s1,2
    154a:	e7279ce3          	bne	a5,s2,13c2 <printf+0x5a>
    154e:	0014c783          	lbu	a5,1(s1)
    1552:	ff2788e3          	beq	a5,s2,1542 <printf+0x1da>
        l = z - a;
    1556:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    155a:	85aa                	mv	a1,a0
    155c:	8622                	mv	a2,s0
    155e:	4505                	li	a0,1
    1560:	75a000ef          	jal	ra,1cba <write>
        if (l)
    1564:	e60408e3          	beqz	s0,13d4 <printf+0x6c>
    1568:	8526                	mv	a0,s1
    156a:	b581                	j	13aa <printf+0x42>
        switch (s[1])
    156c:	07800713          	li	a4,120
    1570:	04e79963          	bne	a5,a4,15c2 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    1574:	6782                	ld	a5,0(sp)
    1576:	45c1                	li	a1,16
    1578:	4388                	lw	a0,0(a5)
    157a:	07a1                	addi	a5,a5,8
    157c:	e03e                	sd	a5,0(sp)
    157e:	b71ff0ef          	jal	ra,10ee <printint.constprop.0>
        s += 2;
    1582:	00248513          	addi	a0,s1,2
    1586:	bf51                	j	151a <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    1588:	6782                	ld	a5,0(sp)
    158a:	45a9                	li	a1,10
    158c:	4388                	lw	a0,0(a5)
    158e:	07a1                	addi	a5,a5,8
    1590:	e03e                	sd	a5,0(sp)
    1592:	b5dff0ef          	jal	ra,10ee <printint.constprop.0>
        s += 2;
    1596:	00248513          	addi	a0,s1,2
    159a:	b741                	j	151a <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    159c:	6782                	ld	a5,0(sp)
    159e:	6380                	ld	s0,0(a5)
    15a0:	07a1                	addi	a5,a5,8
    15a2:	e03e                	sd	a5,0(sp)
    15a4:	c031                	beqz	s0,15e8 <printf+0x280>
            l = strnlen(a, 200);
    15a6:	0c800593          	li	a1,200
    15aa:	8522                	mv	a0,s0
    15ac:	40c000ef          	jal	ra,19b8 <strnlen>
    write(f, s, l);
    15b0:	0005061b          	sext.w	a2,a0
    15b4:	85a2                	mv	a1,s0
    15b6:	4505                	li	a0,1
    15b8:	702000ef          	jal	ra,1cba <write>
        s += 2;
    15bc:	00248513          	addi	a0,s1,2
    15c0:	bfa9                	j	151a <printf+0x1b2>
    return write(stdout, &byte, 1);
    15c2:	4605                	li	a2,1
    15c4:	002c                	addi	a1,sp,8
    15c6:	4505                	li	a0,1
    char byte = c;
    15c8:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15cc:	6ee000ef          	jal	ra,1cba <write>
    char byte = c;
    15d0:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15d4:	4605                	li	a2,1
    15d6:	002c                	addi	a1,sp,8
    15d8:	4505                	li	a0,1
    char byte = c;
    15da:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15de:	6dc000ef          	jal	ra,1cba <write>
        s += 2;
    15e2:	00248513          	addi	a0,s1,2
    15e6:	bf15                	j	151a <printf+0x1b2>
                a = "(null)";
    15e8:	845a                	mv	s0,s6
    15ea:	bf75                	j	15a6 <printf+0x23e>

00000000000015ec <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15ec:	1141                	addi	sp,sp,-16
    15ee:	e406                	sd	ra,8(sp)
    puts(m);
    15f0:	d57ff0ef          	jal	ra,1346 <puts>
    exit(-100);
}
    15f4:	60a2                	ld	ra,8(sp)
    exit(-100);
    15f6:	f9c00513          	li	a0,-100
}
    15fa:	0141                	addi	sp,sp,16
    exit(-100);
    15fc:	a739                	j	1d0a <exit>

00000000000015fe <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15fe:	02000793          	li	a5,32
    1602:	00f50663          	beq	a0,a5,160e <isspace+0x10>
    1606:	355d                	addiw	a0,a0,-9
    1608:	00553513          	sltiu	a0,a0,5
    160c:	8082                	ret
    160e:	4505                	li	a0,1
}
    1610:	8082                	ret

0000000000001612 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1612:	fd05051b          	addiw	a0,a0,-48
}
    1616:	00a53513          	sltiu	a0,a0,10
    161a:	8082                	ret

000000000000161c <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    161c:	02000613          	li	a2,32
    1620:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1622:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1626:	ff77869b          	addiw	a3,a5,-9
    162a:	04c78c63          	beq	a5,a2,1682 <atoi+0x66>
    162e:	0007871b          	sext.w	a4,a5
    1632:	04d5f863          	bgeu	a1,a3,1682 <atoi+0x66>
        s++;
    switch (*s)
    1636:	02b00693          	li	a3,43
    163a:	04d78963          	beq	a5,a3,168c <atoi+0x70>
    163e:	02d00693          	li	a3,45
    1642:	06d78263          	beq	a5,a3,16a6 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1646:	fd07061b          	addiw	a2,a4,-48
    164a:	47a5                	li	a5,9
    164c:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    164e:	4e01                	li	t3,0
    while (isdigit(*s))
    1650:	04c7e963          	bltu	a5,a2,16a2 <atoi+0x86>
    int n = 0, neg = 0;
    1654:	4501                	li	a0,0
    while (isdigit(*s))
    1656:	4825                	li	a6,9
    1658:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    165c:	0025179b          	slliw	a5,a0,0x2
    1660:	9fa9                	addw	a5,a5,a0
    1662:	fd07031b          	addiw	t1,a4,-48
    1666:	0017989b          	slliw	a7,a5,0x1
    while (isdigit(*s))
    166a:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    166e:	0685                	addi	a3,a3,1
    1670:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1674:	0006071b          	sext.w	a4,a2
    1678:	feb870e3          	bgeu	a6,a1,1658 <atoi+0x3c>
    return neg ? n : -n;
    167c:	000e0563          	beqz	t3,1686 <atoi+0x6a>
}
    1680:	8082                	ret
        s++;
    1682:	0505                	addi	a0,a0,1
    1684:	bf79                	j	1622 <atoi+0x6>
    return neg ? n : -n;
    1686:	4113053b          	subw	a0,t1,a7
    168a:	8082                	ret
    while (isdigit(*s))
    168c:	00154703          	lbu	a4,1(a0)
    1690:	47a5                	li	a5,9
        s++;
    1692:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1696:	fd07061b          	addiw	a2,a4,-48
    int n = 0, neg = 0;
    169a:	4e01                	li	t3,0
    while (isdigit(*s))
    169c:	2701                	sext.w	a4,a4
    169e:	fac7fbe3          	bgeu	a5,a2,1654 <atoi+0x38>
    16a2:	4501                	li	a0,0
}
    16a4:	8082                	ret
    while (isdigit(*s))
    16a6:	00154703          	lbu	a4,1(a0)
    16aa:	47a5                	li	a5,9
        s++;
    16ac:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    16b0:	fd07061b          	addiw	a2,a4,-48
    16b4:	2701                	sext.w	a4,a4
    16b6:	fec7e6e3          	bltu	a5,a2,16a2 <atoi+0x86>
        neg = 1;
    16ba:	4e05                	li	t3,1
    16bc:	bf61                	j	1654 <atoi+0x38>

00000000000016be <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16be:	16060d63          	beqz	a2,1838 <memset+0x17a>
    16c2:	40a007b3          	neg	a5,a0
    16c6:	8b9d                	andi	a5,a5,7
    16c8:	00778693          	addi	a3,a5,7
    16cc:	482d                	li	a6,11
    16ce:	0ff5f713          	zext.b	a4,a1
    16d2:	fff60593          	addi	a1,a2,-1
    16d6:	1706e263          	bltu	a3,a6,183a <memset+0x17c>
    16da:	16d5ea63          	bltu	a1,a3,184e <memset+0x190>
    16de:	16078563          	beqz	a5,1848 <memset+0x18a>
    16e2:	00e50023          	sb	a4,0(a0)
    16e6:	4685                	li	a3,1
    16e8:	00150593          	addi	a1,a0,1
    16ec:	14d78c63          	beq	a5,a3,1844 <memset+0x186>
    16f0:	00e500a3          	sb	a4,1(a0)
    16f4:	4689                	li	a3,2
    16f6:	00250593          	addi	a1,a0,2
    16fa:	14d78d63          	beq	a5,a3,1854 <memset+0x196>
    16fe:	00e50123          	sb	a4,2(a0)
    1702:	468d                	li	a3,3
    1704:	00350593          	addi	a1,a0,3
    1708:	12d78b63          	beq	a5,a3,183e <memset+0x180>
    170c:	00e501a3          	sb	a4,3(a0)
    1710:	4691                	li	a3,4
    1712:	00450593          	addi	a1,a0,4
    1716:	14d78163          	beq	a5,a3,1858 <memset+0x19a>
    171a:	00e50223          	sb	a4,4(a0)
    171e:	4695                	li	a3,5
    1720:	00550593          	addi	a1,a0,5
    1724:	12d78c63          	beq	a5,a3,185c <memset+0x19e>
    1728:	00e502a3          	sb	a4,5(a0)
    172c:	469d                	li	a3,7
    172e:	00650593          	addi	a1,a0,6
    1732:	12d79763          	bne	a5,a3,1860 <memset+0x1a2>
    1736:	00750593          	addi	a1,a0,7
    173a:	00e50323          	sb	a4,6(a0)
    173e:	481d                	li	a6,7
    1740:	00871693          	slli	a3,a4,0x8
    1744:	01071893          	slli	a7,a4,0x10
    1748:	8ed9                	or	a3,a3,a4
    174a:	01871313          	slli	t1,a4,0x18
    174e:	0116e6b3          	or	a3,a3,a7
    1752:	0066e6b3          	or	a3,a3,t1
    1756:	02071893          	slli	a7,a4,0x20
    175a:	02871e13          	slli	t3,a4,0x28
    175e:	0116e6b3          	or	a3,a3,a7
    1762:	40f60333          	sub	t1,a2,a5
    1766:	03071893          	slli	a7,a4,0x30
    176a:	01c6e6b3          	or	a3,a3,t3
    176e:	0116e6b3          	or	a3,a3,a7
    1772:	03871e13          	slli	t3,a4,0x38
    1776:	97aa                	add	a5,a5,a0
    1778:	ff837893          	andi	a7,t1,-8
    177c:	01c6e6b3          	or	a3,a3,t3
    1780:	98be                	add	a7,a7,a5
    1782:	e394                	sd	a3,0(a5)
    1784:	07a1                	addi	a5,a5,8
    1786:	ff179ee3          	bne	a5,a7,1782 <memset+0xc4>
    178a:	ff837893          	andi	a7,t1,-8
    178e:	011587b3          	add	a5,a1,a7
    1792:	010886bb          	addw	a3,a7,a6
    1796:	0b130663          	beq	t1,a7,1842 <memset+0x184>
    179a:	00e78023          	sb	a4,0(a5)
    179e:	0016859b          	addiw	a1,a3,1
    17a2:	08c5fb63          	bgeu	a1,a2,1838 <memset+0x17a>
    17a6:	00e780a3          	sb	a4,1(a5)
    17aa:	0026859b          	addiw	a1,a3,2
    17ae:	08c5f563          	bgeu	a1,a2,1838 <memset+0x17a>
    17b2:	00e78123          	sb	a4,2(a5)
    17b6:	0036859b          	addiw	a1,a3,3
    17ba:	06c5ff63          	bgeu	a1,a2,1838 <memset+0x17a>
    17be:	00e781a3          	sb	a4,3(a5)
    17c2:	0046859b          	addiw	a1,a3,4
    17c6:	06c5f963          	bgeu	a1,a2,1838 <memset+0x17a>
    17ca:	00e78223          	sb	a4,4(a5)
    17ce:	0056859b          	addiw	a1,a3,5
    17d2:	06c5f363          	bgeu	a1,a2,1838 <memset+0x17a>
    17d6:	00e782a3          	sb	a4,5(a5)
    17da:	0066859b          	addiw	a1,a3,6
    17de:	04c5fd63          	bgeu	a1,a2,1838 <memset+0x17a>
    17e2:	00e78323          	sb	a4,6(a5)
    17e6:	0076859b          	addiw	a1,a3,7
    17ea:	04c5f763          	bgeu	a1,a2,1838 <memset+0x17a>
    17ee:	00e783a3          	sb	a4,7(a5)
    17f2:	0086859b          	addiw	a1,a3,8
    17f6:	04c5f163          	bgeu	a1,a2,1838 <memset+0x17a>
    17fa:	00e78423          	sb	a4,8(a5)
    17fe:	0096859b          	addiw	a1,a3,9
    1802:	02c5fb63          	bgeu	a1,a2,1838 <memset+0x17a>
    1806:	00e784a3          	sb	a4,9(a5)
    180a:	00a6859b          	addiw	a1,a3,10
    180e:	02c5f563          	bgeu	a1,a2,1838 <memset+0x17a>
    1812:	00e78523          	sb	a4,10(a5)
    1816:	00b6859b          	addiw	a1,a3,11
    181a:	00c5ff63          	bgeu	a1,a2,1838 <memset+0x17a>
    181e:	00e785a3          	sb	a4,11(a5)
    1822:	00c6859b          	addiw	a1,a3,12
    1826:	00c5f963          	bgeu	a1,a2,1838 <memset+0x17a>
    182a:	00e78623          	sb	a4,12(a5)
    182e:	26b5                	addiw	a3,a3,13
    1830:	00c6f463          	bgeu	a3,a2,1838 <memset+0x17a>
    1834:	00e786a3          	sb	a4,13(a5)
        ;
    return dest;
}
    1838:	8082                	ret
    183a:	46ad                	li	a3,11
    183c:	bd79                	j	16da <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    183e:	480d                	li	a6,3
    1840:	b701                	j	1740 <memset+0x82>
    1842:	8082                	ret
    1844:	4805                	li	a6,1
    1846:	bded                	j	1740 <memset+0x82>
    1848:	85aa                	mv	a1,a0
    184a:	4801                	li	a6,0
    184c:	bdd5                	j	1740 <memset+0x82>
    184e:	87aa                	mv	a5,a0
    1850:	4681                	li	a3,0
    1852:	b7a1                	j	179a <memset+0xdc>
    1854:	4809                	li	a6,2
    1856:	b5ed                	j	1740 <memset+0x82>
    1858:	4811                	li	a6,4
    185a:	b5dd                	j	1740 <memset+0x82>
    185c:	4815                	li	a6,5
    185e:	b5cd                	j	1740 <memset+0x82>
    1860:	4819                	li	a6,6
    1862:	bdf9                	j	1740 <memset+0x82>

0000000000001864 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1864:	00054783          	lbu	a5,0(a0)
    1868:	0005c703          	lbu	a4,0(a1)
    186c:	00e79863          	bne	a5,a4,187c <strcmp+0x18>
    1870:	0505                	addi	a0,a0,1
    1872:	0585                	addi	a1,a1,1
    1874:	fbe5                	bnez	a5,1864 <strcmp>
    1876:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1878:	9d19                	subw	a0,a0,a4
    187a:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    187c:	0007851b          	sext.w	a0,a5
    1880:	bfe5                	j	1878 <strcmp+0x14>

0000000000001882 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1882:	ca15                	beqz	a2,18b6 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1884:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1888:	167d                	addi	a2,a2,-1
    188a:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    188e:	eb99                	bnez	a5,18a4 <strncmp+0x22>
    1890:	a815                	j	18c4 <strncmp+0x42>
    1892:	00a68e63          	beq	a3,a0,18ae <strncmp+0x2c>
    1896:	0505                	addi	a0,a0,1
    1898:	00f71b63          	bne	a4,a5,18ae <strncmp+0x2c>
    189c:	00054783          	lbu	a5,0(a0)
    18a0:	cf89                	beqz	a5,18ba <strncmp+0x38>
    18a2:	85b2                	mv	a1,a2
    18a4:	0005c703          	lbu	a4,0(a1)
    18a8:	00158613          	addi	a2,a1,1
    18ac:	f37d                	bnez	a4,1892 <strncmp+0x10>
        ;
    return *l - *r;
    18ae:	0007851b          	sext.w	a0,a5
    18b2:	9d19                	subw	a0,a0,a4
    18b4:	8082                	ret
        return 0;
    18b6:	4501                	li	a0,0
}
    18b8:	8082                	ret
    return *l - *r;
    18ba:	0015c703          	lbu	a4,1(a1)
    18be:	4501                	li	a0,0
    18c0:	9d19                	subw	a0,a0,a4
    18c2:	8082                	ret
    18c4:	0005c703          	lbu	a4,0(a1)
    18c8:	4501                	li	a0,0
    18ca:	b7e5                	j	18b2 <strncmp+0x30>

00000000000018cc <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18cc:	00757793          	andi	a5,a0,7
    18d0:	cf89                	beqz	a5,18ea <strlen+0x1e>
    18d2:	87aa                	mv	a5,a0
    18d4:	a029                	j	18de <strlen+0x12>
    18d6:	0785                	addi	a5,a5,1
    18d8:	0077f713          	andi	a4,a5,7
    18dc:	cb01                	beqz	a4,18ec <strlen+0x20>
        if (!*s)
    18de:	0007c703          	lbu	a4,0(a5)
    18e2:	fb75                	bnez	a4,18d6 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18e4:	40a78533          	sub	a0,a5,a0
}
    18e8:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18ea:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18ec:	6394                	ld	a3,0(a5)
    18ee:	00000597          	auipc	a1,0x0
    18f2:	6b25b583          	ld	a1,1714(a1) # 1fa0 <__clone+0xae>
    18f6:	00000617          	auipc	a2,0x0
    18fa:	6b263603          	ld	a2,1714(a2) # 1fa8 <__clone+0xb6>
    18fe:	a019                	j	1904 <strlen+0x38>
    1900:	6794                	ld	a3,8(a5)
    1902:	07a1                	addi	a5,a5,8
    1904:	00b68733          	add	a4,a3,a1
    1908:	fff6c693          	not	a3,a3
    190c:	8f75                	and	a4,a4,a3
    190e:	8f71                	and	a4,a4,a2
    1910:	db65                	beqz	a4,1900 <strlen+0x34>
    for (; *s; s++)
    1912:	0007c703          	lbu	a4,0(a5)
    1916:	d779                	beqz	a4,18e4 <strlen+0x18>
    1918:	0017c703          	lbu	a4,1(a5)
    191c:	0785                	addi	a5,a5,1
    191e:	d379                	beqz	a4,18e4 <strlen+0x18>
    1920:	0017c703          	lbu	a4,1(a5)
    1924:	0785                	addi	a5,a5,1
    1926:	fb6d                	bnez	a4,1918 <strlen+0x4c>
    1928:	bf75                	j	18e4 <strlen+0x18>

000000000000192a <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    192a:	00757713          	andi	a4,a0,7
{
    192e:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1930:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1934:	cb19                	beqz	a4,194a <memchr+0x20>
    1936:	ce25                	beqz	a2,19ae <memchr+0x84>
    1938:	0007c703          	lbu	a4,0(a5)
    193c:	04b70e63          	beq	a4,a1,1998 <memchr+0x6e>
    1940:	0785                	addi	a5,a5,1
    1942:	0077f713          	andi	a4,a5,7
    1946:	167d                	addi	a2,a2,-1
    1948:	f77d                	bnez	a4,1936 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    194a:	4501                	li	a0,0
    if (n && *s != c)
    194c:	c235                	beqz	a2,19b0 <memchr+0x86>
    194e:	0007c703          	lbu	a4,0(a5)
    1952:	04b70363          	beq	a4,a1,1998 <memchr+0x6e>
        size_t k = ONES * c;
    1956:	00000517          	auipc	a0,0x0
    195a:	65a53503          	ld	a0,1626(a0) # 1fb0 <__clone+0xbe>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    195e:	471d                	li	a4,7
        size_t k = ONES * c;
    1960:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1964:	02c77a63          	bgeu	a4,a2,1998 <memchr+0x6e>
    1968:	00000897          	auipc	a7,0x0
    196c:	6388b883          	ld	a7,1592(a7) # 1fa0 <__clone+0xae>
    1970:	00000817          	auipc	a6,0x0
    1974:	63883803          	ld	a6,1592(a6) # 1fa8 <__clone+0xb6>
    1978:	431d                	li	t1,7
    197a:	a029                	j	1984 <memchr+0x5a>
    197c:	1661                	addi	a2,a2,-8
    197e:	07a1                	addi	a5,a5,8
    1980:	02c37963          	bgeu	t1,a2,19b2 <memchr+0x88>
    1984:	6398                	ld	a4,0(a5)
    1986:	8f29                	xor	a4,a4,a0
    1988:	011706b3          	add	a3,a4,a7
    198c:	fff74713          	not	a4,a4
    1990:	8f75                	and	a4,a4,a3
    1992:	01077733          	and	a4,a4,a6
    1996:	d37d                	beqz	a4,197c <memchr+0x52>
{
    1998:	853e                	mv	a0,a5
    199a:	97b2                	add	a5,a5,a2
    199c:	a021                	j	19a4 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    199e:	0505                	addi	a0,a0,1
    19a0:	00f50763          	beq	a0,a5,19ae <memchr+0x84>
    19a4:	00054703          	lbu	a4,0(a0)
    19a8:	feb71be3          	bne	a4,a1,199e <memchr+0x74>
    19ac:	8082                	ret
    return n ? (void *)s : 0;
    19ae:	4501                	li	a0,0
}
    19b0:	8082                	ret
    return n ? (void *)s : 0;
    19b2:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    19b4:	f275                	bnez	a2,1998 <memchr+0x6e>
}
    19b6:	8082                	ret

00000000000019b8 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19b8:	1101                	addi	sp,sp,-32
    19ba:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19bc:	862e                	mv	a2,a1
{
    19be:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19c0:	4581                	li	a1,0
{
    19c2:	e426                	sd	s1,8(sp)
    19c4:	ec06                	sd	ra,24(sp)
    19c6:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19c8:	f63ff0ef          	jal	ra,192a <memchr>
    return p ? p - s : n;
    19cc:	c519                	beqz	a0,19da <strnlen+0x22>
}
    19ce:	60e2                	ld	ra,24(sp)
    19d0:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19d2:	8d05                	sub	a0,a0,s1
}
    19d4:	64a2                	ld	s1,8(sp)
    19d6:	6105                	addi	sp,sp,32
    19d8:	8082                	ret
    19da:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19dc:	8522                	mv	a0,s0
}
    19de:	6442                	ld	s0,16(sp)
    19e0:	64a2                	ld	s1,8(sp)
    19e2:	6105                	addi	sp,sp,32
    19e4:	8082                	ret

00000000000019e6 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19e6:	00a5c7b3          	xor	a5,a1,a0
    19ea:	8b9d                	andi	a5,a5,7
    19ec:	eb95                	bnez	a5,1a20 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19ee:	0075f793          	andi	a5,a1,7
    19f2:	e7b1                	bnez	a5,1a3e <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19f4:	6198                	ld	a4,0(a1)
    19f6:	00000617          	auipc	a2,0x0
    19fa:	5aa63603          	ld	a2,1450(a2) # 1fa0 <__clone+0xae>
    19fe:	00000817          	auipc	a6,0x0
    1a02:	5aa83803          	ld	a6,1450(a6) # 1fa8 <__clone+0xb6>
    1a06:	a029                	j	1a10 <strcpy+0x2a>
    1a08:	05a1                	addi	a1,a1,8
    1a0a:	e118                	sd	a4,0(a0)
    1a0c:	6198                	ld	a4,0(a1)
    1a0e:	0521                	addi	a0,a0,8
    1a10:	00c707b3          	add	a5,a4,a2
    1a14:	fff74693          	not	a3,a4
    1a18:	8ff5                	and	a5,a5,a3
    1a1a:	0107f7b3          	and	a5,a5,a6
    1a1e:	d7ed                	beqz	a5,1a08 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a20:	0005c783          	lbu	a5,0(a1)
    1a24:	00f50023          	sb	a5,0(a0)
    1a28:	c785                	beqz	a5,1a50 <strcpy+0x6a>
    1a2a:	0015c783          	lbu	a5,1(a1)
    1a2e:	0505                	addi	a0,a0,1
    1a30:	0585                	addi	a1,a1,1
    1a32:	00f50023          	sb	a5,0(a0)
    1a36:	fbf5                	bnez	a5,1a2a <strcpy+0x44>
        ;
    return d;
}
    1a38:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a3a:	0505                	addi	a0,a0,1
    1a3c:	df45                	beqz	a4,19f4 <strcpy+0xe>
            if (!(*d = *s))
    1a3e:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a42:	0585                	addi	a1,a1,1
    1a44:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1a48:	00f50023          	sb	a5,0(a0)
    1a4c:	f7fd                	bnez	a5,1a3a <strcpy+0x54>
}
    1a4e:	8082                	ret
    1a50:	8082                	ret

0000000000001a52 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a52:	00a5c7b3          	xor	a5,a1,a0
    1a56:	8b9d                	andi	a5,a5,7
    1a58:	1a079863          	bnez	a5,1c08 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a5c:	0075f793          	andi	a5,a1,7
    1a60:	16078463          	beqz	a5,1bc8 <strncpy+0x176>
    1a64:	ea01                	bnez	a2,1a74 <strncpy+0x22>
    1a66:	a421                	j	1c6e <strncpy+0x21c>
    1a68:	167d                	addi	a2,a2,-1
    1a6a:	0505                	addi	a0,a0,1
    1a6c:	14070e63          	beqz	a4,1bc8 <strncpy+0x176>
    1a70:	1a060863          	beqz	a2,1c20 <strncpy+0x1ce>
    1a74:	0005c783          	lbu	a5,0(a1)
    1a78:	0585                	addi	a1,a1,1
    1a7a:	0075f713          	andi	a4,a1,7
    1a7e:	00f50023          	sb	a5,0(a0)
    1a82:	f3fd                	bnez	a5,1a68 <strncpy+0x16>
    1a84:	4805                	li	a6,1
    1a86:	1a061863          	bnez	a2,1c36 <strncpy+0x1e4>
    1a8a:	40a007b3          	neg	a5,a0
    1a8e:	8b9d                	andi	a5,a5,7
    1a90:	4681                	li	a3,0
    1a92:	18061a63          	bnez	a2,1c26 <strncpy+0x1d4>
    1a96:	00778713          	addi	a4,a5,7
    1a9a:	45ad                	li	a1,11
    1a9c:	18b76363          	bltu	a4,a1,1c22 <strncpy+0x1d0>
    1aa0:	1ae6eb63          	bltu	a3,a4,1c56 <strncpy+0x204>
    1aa4:	1a078363          	beqz	a5,1c4a <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1aa8:	00050023          	sb	zero,0(a0)
    1aac:	4685                	li	a3,1
    1aae:	00150713          	addi	a4,a0,1
    1ab2:	18d78f63          	beq	a5,a3,1c50 <strncpy+0x1fe>
    1ab6:	000500a3          	sb	zero,1(a0)
    1aba:	4689                	li	a3,2
    1abc:	00250713          	addi	a4,a0,2
    1ac0:	18d78e63          	beq	a5,a3,1c5c <strncpy+0x20a>
    1ac4:	00050123          	sb	zero,2(a0)
    1ac8:	468d                	li	a3,3
    1aca:	00350713          	addi	a4,a0,3
    1ace:	16d78c63          	beq	a5,a3,1c46 <strncpy+0x1f4>
    1ad2:	000501a3          	sb	zero,3(a0)
    1ad6:	4691                	li	a3,4
    1ad8:	00450713          	addi	a4,a0,4
    1adc:	18d78263          	beq	a5,a3,1c60 <strncpy+0x20e>
    1ae0:	00050223          	sb	zero,4(a0)
    1ae4:	4695                	li	a3,5
    1ae6:	00550713          	addi	a4,a0,5
    1aea:	16d78d63          	beq	a5,a3,1c64 <strncpy+0x212>
    1aee:	000502a3          	sb	zero,5(a0)
    1af2:	469d                	li	a3,7
    1af4:	00650713          	addi	a4,a0,6
    1af8:	16d79863          	bne	a5,a3,1c68 <strncpy+0x216>
    1afc:	00750713          	addi	a4,a0,7
    1b00:	00050323          	sb	zero,6(a0)
    1b04:	40f80833          	sub	a6,a6,a5
    1b08:	ff887593          	andi	a1,a6,-8
    1b0c:	97aa                	add	a5,a5,a0
    1b0e:	95be                	add	a1,a1,a5
    1b10:	0007b023          	sd	zero,0(a5)
    1b14:	07a1                	addi	a5,a5,8
    1b16:	feb79de3          	bne	a5,a1,1b10 <strncpy+0xbe>
    1b1a:	ff887593          	andi	a1,a6,-8
    1b1e:	9ead                	addw	a3,a3,a1
    1b20:	00b707b3          	add	a5,a4,a1
    1b24:	12b80863          	beq	a6,a1,1c54 <strncpy+0x202>
    1b28:	00078023          	sb	zero,0(a5)
    1b2c:	0016871b          	addiw	a4,a3,1
    1b30:	0ec77863          	bgeu	a4,a2,1c20 <strncpy+0x1ce>
    1b34:	000780a3          	sb	zero,1(a5)
    1b38:	0026871b          	addiw	a4,a3,2
    1b3c:	0ec77263          	bgeu	a4,a2,1c20 <strncpy+0x1ce>
    1b40:	00078123          	sb	zero,2(a5)
    1b44:	0036871b          	addiw	a4,a3,3
    1b48:	0cc77c63          	bgeu	a4,a2,1c20 <strncpy+0x1ce>
    1b4c:	000781a3          	sb	zero,3(a5)
    1b50:	0046871b          	addiw	a4,a3,4
    1b54:	0cc77663          	bgeu	a4,a2,1c20 <strncpy+0x1ce>
    1b58:	00078223          	sb	zero,4(a5)
    1b5c:	0056871b          	addiw	a4,a3,5
    1b60:	0cc77063          	bgeu	a4,a2,1c20 <strncpy+0x1ce>
    1b64:	000782a3          	sb	zero,5(a5)
    1b68:	0066871b          	addiw	a4,a3,6
    1b6c:	0ac77a63          	bgeu	a4,a2,1c20 <strncpy+0x1ce>
    1b70:	00078323          	sb	zero,6(a5)
    1b74:	0076871b          	addiw	a4,a3,7
    1b78:	0ac77463          	bgeu	a4,a2,1c20 <strncpy+0x1ce>
    1b7c:	000783a3          	sb	zero,7(a5)
    1b80:	0086871b          	addiw	a4,a3,8
    1b84:	08c77e63          	bgeu	a4,a2,1c20 <strncpy+0x1ce>
    1b88:	00078423          	sb	zero,8(a5)
    1b8c:	0096871b          	addiw	a4,a3,9
    1b90:	08c77863          	bgeu	a4,a2,1c20 <strncpy+0x1ce>
    1b94:	000784a3          	sb	zero,9(a5)
    1b98:	00a6871b          	addiw	a4,a3,10
    1b9c:	08c77263          	bgeu	a4,a2,1c20 <strncpy+0x1ce>
    1ba0:	00078523          	sb	zero,10(a5)
    1ba4:	00b6871b          	addiw	a4,a3,11
    1ba8:	06c77c63          	bgeu	a4,a2,1c20 <strncpy+0x1ce>
    1bac:	000785a3          	sb	zero,11(a5)
    1bb0:	00c6871b          	addiw	a4,a3,12
    1bb4:	06c77663          	bgeu	a4,a2,1c20 <strncpy+0x1ce>
    1bb8:	00078623          	sb	zero,12(a5)
    1bbc:	26b5                	addiw	a3,a3,13
    1bbe:	06c6f163          	bgeu	a3,a2,1c20 <strncpy+0x1ce>
    1bc2:	000786a3          	sb	zero,13(a5)
    1bc6:	8082                	ret
            ;
        if (!n || !*s)
    1bc8:	c645                	beqz	a2,1c70 <strncpy+0x21e>
    1bca:	0005c783          	lbu	a5,0(a1)
    1bce:	ea078be3          	beqz	a5,1a84 <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bd2:	479d                	li	a5,7
    1bd4:	02c7ff63          	bgeu	a5,a2,1c12 <strncpy+0x1c0>
    1bd8:	00000897          	auipc	a7,0x0
    1bdc:	3c88b883          	ld	a7,968(a7) # 1fa0 <__clone+0xae>
    1be0:	00000817          	auipc	a6,0x0
    1be4:	3c883803          	ld	a6,968(a6) # 1fa8 <__clone+0xb6>
    1be8:	431d                	li	t1,7
    1bea:	6198                	ld	a4,0(a1)
    1bec:	011707b3          	add	a5,a4,a7
    1bf0:	fff74693          	not	a3,a4
    1bf4:	8ff5                	and	a5,a5,a3
    1bf6:	0107f7b3          	and	a5,a5,a6
    1bfa:	ef81                	bnez	a5,1c12 <strncpy+0x1c0>
            *wd = *ws;
    1bfc:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bfe:	1661                	addi	a2,a2,-8
    1c00:	05a1                	addi	a1,a1,8
    1c02:	0521                	addi	a0,a0,8
    1c04:	fec363e3          	bltu	t1,a2,1bea <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1c08:	e609                	bnez	a2,1c12 <strncpy+0x1c0>
    1c0a:	a08d                	j	1c6c <strncpy+0x21a>
    1c0c:	167d                	addi	a2,a2,-1
    1c0e:	0505                	addi	a0,a0,1
    1c10:	ca01                	beqz	a2,1c20 <strncpy+0x1ce>
    1c12:	0005c783          	lbu	a5,0(a1)
    1c16:	0585                	addi	a1,a1,1
    1c18:	00f50023          	sb	a5,0(a0)
    1c1c:	fbe5                	bnez	a5,1c0c <strncpy+0x1ba>
        ;
tail:
    1c1e:	b59d                	j	1a84 <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1c20:	8082                	ret
    1c22:	472d                	li	a4,11
    1c24:	bdb5                	j	1aa0 <strncpy+0x4e>
    1c26:	00778713          	addi	a4,a5,7
    1c2a:	45ad                	li	a1,11
    1c2c:	fff60693          	addi	a3,a2,-1
    1c30:	e6b778e3          	bgeu	a4,a1,1aa0 <strncpy+0x4e>
    1c34:	b7fd                	j	1c22 <strncpy+0x1d0>
    1c36:	40a007b3          	neg	a5,a0
    1c3a:	8832                	mv	a6,a2
    1c3c:	8b9d                	andi	a5,a5,7
    1c3e:	4681                	li	a3,0
    1c40:	e4060be3          	beqz	a2,1a96 <strncpy+0x44>
    1c44:	b7cd                	j	1c26 <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c46:	468d                	li	a3,3
    1c48:	bd75                	j	1b04 <strncpy+0xb2>
    1c4a:	872a                	mv	a4,a0
    1c4c:	4681                	li	a3,0
    1c4e:	bd5d                	j	1b04 <strncpy+0xb2>
    1c50:	4685                	li	a3,1
    1c52:	bd4d                	j	1b04 <strncpy+0xb2>
    1c54:	8082                	ret
    1c56:	87aa                	mv	a5,a0
    1c58:	4681                	li	a3,0
    1c5a:	b5f9                	j	1b28 <strncpy+0xd6>
    1c5c:	4689                	li	a3,2
    1c5e:	b55d                	j	1b04 <strncpy+0xb2>
    1c60:	4691                	li	a3,4
    1c62:	b54d                	j	1b04 <strncpy+0xb2>
    1c64:	4695                	li	a3,5
    1c66:	bd79                	j	1b04 <strncpy+0xb2>
    1c68:	4699                	li	a3,6
    1c6a:	bd69                	j	1b04 <strncpy+0xb2>
    1c6c:	8082                	ret
    1c6e:	8082                	ret
    1c70:	8082                	ret

0000000000001c72 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c72:	87aa                	mv	a5,a0
    1c74:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c76:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c7a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c7e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c80:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c82:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c86:	2501                	sext.w	a0,a0
    1c88:	8082                	ret

0000000000001c8a <openat>:
    register long a7 __asm__("a7") = n;
    1c8a:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c8e:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c92:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c96:	2501                	sext.w	a0,a0
    1c98:	8082                	ret

0000000000001c9a <fcntl>:
    register long a7 __asm__("a7") = n;
    1c9a:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c9c:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1ca0:	2501                	sext.w	a0,a0
    1ca2:	8082                	ret

0000000000001ca4 <close>:
    register long a7 __asm__("a7") = n;
    1ca4:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1ca8:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1cac:	2501                	sext.w	a0,a0
    1cae:	8082                	ret

0000000000001cb0 <read>:
    register long a7 __asm__("a7") = n;
    1cb0:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cb4:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1cb8:	8082                	ret

0000000000001cba <write>:
    register long a7 __asm__("a7") = n;
    1cba:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cbe:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1cc2:	8082                	ret

0000000000001cc4 <getpid>:
    register long a7 __asm__("a7") = n;
    1cc4:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1cc8:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1ccc:	2501                	sext.w	a0,a0
    1cce:	8082                	ret

0000000000001cd0 <getppid>:
    register long a7 __asm__("a7") = n;
    1cd0:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1cd4:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cd8:	2501                	sext.w	a0,a0
    1cda:	8082                	ret

0000000000001cdc <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cdc:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1ce0:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1ce4:	2501                	sext.w	a0,a0
    1ce6:	8082                	ret

0000000000001ce8 <fork>:
    register long a7 __asm__("a7") = n;
    1ce8:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cec:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cee:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cf0:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cf4:	2501                	sext.w	a0,a0
    1cf6:	8082                	ret

0000000000001cf8 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cf8:	85b2                	mv	a1,a2
    1cfa:	863a                	mv	a2,a4
    if (stack)
    1cfc:	c191                	beqz	a1,1d00 <clone+0x8>
	stack += stack_size;
    1cfe:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d00:	4781                	li	a5,0
    1d02:	4701                	li	a4,0
    1d04:	4681                	li	a3,0
    1d06:	2601                	sext.w	a2,a2
    1d08:	a2ed                	j	1ef2 <__clone>

0000000000001d0a <exit>:
    register long a7 __asm__("a7") = n;
    1d0a:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d0e:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d12:	8082                	ret

0000000000001d14 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d14:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d18:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d1a:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d1e:	2501                	sext.w	a0,a0
    1d20:	8082                	ret

0000000000001d22 <exec>:
    register long a7 __asm__("a7") = n;
    1d22:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d26:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d2a:	2501                	sext.w	a0,a0
    1d2c:	8082                	ret

0000000000001d2e <execve>:
    register long a7 __asm__("a7") = n;
    1d2e:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d32:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d36:	2501                	sext.w	a0,a0
    1d38:	8082                	ret

0000000000001d3a <times>:
    register long a7 __asm__("a7") = n;
    1d3a:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d3e:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d42:	2501                	sext.w	a0,a0
    1d44:	8082                	ret

0000000000001d46 <get_time>:

int64 get_time()
{
    1d46:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d48:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d4c:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d4e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d50:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d54:	2501                	sext.w	a0,a0
    1d56:	ed09                	bnez	a0,1d70 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d58:	67a2                	ld	a5,8(sp)
    1d5a:	3e800713          	li	a4,1000
    1d5e:	00015503          	lhu	a0,0(sp)
    1d62:	02e7d7b3          	divu	a5,a5,a4
    1d66:	02e50533          	mul	a0,a0,a4
    1d6a:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d6c:	0141                	addi	sp,sp,16
    1d6e:	8082                	ret
        return -1;
    1d70:	557d                	li	a0,-1
    1d72:	bfed                	j	1d6c <get_time+0x26>

0000000000001d74 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d74:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d78:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d7c:	2501                	sext.w	a0,a0
    1d7e:	8082                	ret

0000000000001d80 <time>:
    register long a7 __asm__("a7") = n;
    1d80:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d84:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d88:	2501                	sext.w	a0,a0
    1d8a:	8082                	ret

0000000000001d8c <sleep>:

int sleep(unsigned long long time)
{
    1d8c:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d8e:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d90:	850a                	mv	a0,sp
    1d92:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d94:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d98:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d9a:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d9e:	e501                	bnez	a0,1da6 <sleep+0x1a>
    return 0;
    1da0:	4501                	li	a0,0
}
    1da2:	0141                	addi	sp,sp,16
    1da4:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1da6:	4502                	lw	a0,0(sp)
}
    1da8:	0141                	addi	sp,sp,16
    1daa:	8082                	ret

0000000000001dac <set_priority>:
    register long a7 __asm__("a7") = n;
    1dac:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1db0:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1db4:	2501                	sext.w	a0,a0
    1db6:	8082                	ret

0000000000001db8 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1db8:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1dbc:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1dc0:	8082                	ret

0000000000001dc2 <munmap>:
    register long a7 __asm__("a7") = n;
    1dc2:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc6:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1dca:	2501                	sext.w	a0,a0
    1dcc:	8082                	ret

0000000000001dce <wait>:

int wait(int *code)
{
    1dce:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dd0:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1dd4:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1dd6:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1dd8:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dda:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1dde:	2501                	sext.w	a0,a0
    1de0:	8082                	ret

0000000000001de2 <spawn>:
    register long a7 __asm__("a7") = n;
    1de2:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1de6:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dea:	2501                	sext.w	a0,a0
    1dec:	8082                	ret

0000000000001dee <mailread>:
    register long a7 __asm__("a7") = n;
    1dee:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1df2:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1df6:	2501                	sext.w	a0,a0
    1df8:	8082                	ret

0000000000001dfa <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dfa:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dfe:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e02:	2501                	sext.w	a0,a0
    1e04:	8082                	ret

0000000000001e06 <fstat>:
    register long a7 __asm__("a7") = n;
    1e06:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e0a:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e0e:	2501                	sext.w	a0,a0
    1e10:	8082                	ret

0000000000001e12 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e12:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e14:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e18:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e1a:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e1e:	2501                	sext.w	a0,a0
    1e20:	8082                	ret

0000000000001e22 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e22:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e24:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e28:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e2a:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e2e:	2501                	sext.w	a0,a0
    1e30:	8082                	ret

0000000000001e32 <link>:

int link(char *old_path, char *new_path)
{
    1e32:	87aa                	mv	a5,a0
    1e34:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e36:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e3a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e3e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e40:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e44:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e46:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e4a:	2501                	sext.w	a0,a0
    1e4c:	8082                	ret

0000000000001e4e <unlink>:

int unlink(char *path)
{
    1e4e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e50:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e54:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e58:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e5a:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e5e:	2501                	sext.w	a0,a0
    1e60:	8082                	ret

0000000000001e62 <uname>:
    register long a7 __asm__("a7") = n;
    1e62:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e66:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e6a:	2501                	sext.w	a0,a0
    1e6c:	8082                	ret

0000000000001e6e <brk>:
    register long a7 __asm__("a7") = n;
    1e6e:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e72:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e76:	2501                	sext.w	a0,a0
    1e78:	8082                	ret

0000000000001e7a <getcwd>:
    register long a7 __asm__("a7") = n;
    1e7a:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e7c:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e80:	8082                	ret

0000000000001e82 <chdir>:
    register long a7 __asm__("a7") = n;
    1e82:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e86:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e8a:	2501                	sext.w	a0,a0
    1e8c:	8082                	ret

0000000000001e8e <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e8e:	862e                	mv	a2,a1
    1e90:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e92:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e94:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e98:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e9c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e9e:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ea0:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1ea4:	2501                	sext.w	a0,a0
    1ea6:	8082                	ret

0000000000001ea8 <getdents>:
    register long a7 __asm__("a7") = n;
    1ea8:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eac:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1eb0:	2501                	sext.w	a0,a0
    1eb2:	8082                	ret

0000000000001eb4 <pipe>:
    register long a7 __asm__("a7") = n;
    1eb4:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1eb8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eba:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1ebe:	2501                	sext.w	a0,a0
    1ec0:	8082                	ret

0000000000001ec2 <dup>:
    register long a7 __asm__("a7") = n;
    1ec2:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1ec4:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1ec8:	2501                	sext.w	a0,a0
    1eca:	8082                	ret

0000000000001ecc <dup2>:
    register long a7 __asm__("a7") = n;
    1ecc:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1ece:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ed0:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ed4:	2501                	sext.w	a0,a0
    1ed6:	8082                	ret

0000000000001ed8 <mount>:
    register long a7 __asm__("a7") = n;
    1ed8:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1edc:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ee0:	2501                	sext.w	a0,a0
    1ee2:	8082                	ret

0000000000001ee4 <umount>:
    register long a7 __asm__("a7") = n;
    1ee4:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ee8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eea:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1eee:	2501                	sext.w	a0,a0
    1ef0:	8082                	ret

0000000000001ef2 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ef2:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1ef4:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ef6:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ef8:	8532                	mv	a0,a2
	mv a2, a4
    1efa:	863a                	mv	a2,a4
	mv a3, a5
    1efc:	86be                	mv	a3,a5
	mv a4, a6
    1efe:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f00:	0dc00893          	li	a7,220
	ecall
    1f04:	00000073          	ecall

	beqz a0, 1f
    1f08:	c111                	beqz	a0,1f0c <__clone+0x1a>
	# Parent
	ret
    1f0a:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f0c:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f0e:	6522                	ld	a0,8(sp)
	jalr a1
    1f10:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f12:	05d00893          	li	a7,93
	ecall
    1f16:	00000073          	ecall
