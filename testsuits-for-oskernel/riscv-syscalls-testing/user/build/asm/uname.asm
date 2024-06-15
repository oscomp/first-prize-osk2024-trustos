
/home/brightnight/OScompetition/6.13晚final_main/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/uname：     文件格式 elf64-littleriscv


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
    1004:	1141                	addi	sp,sp,-16
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f0250513          	addi	a0,a0,-254 # 1f08 <__clone+0x2e>
void test_uname() {
    100e:	e406                	sd	ra,8(sp)
	TEST_START(__func__);
    1010:	31e000ef          	jal	ra,132e <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	11450513          	addi	a0,a0,276 # 2128 <__func__.0>
    101c:	312000ef          	jal	ra,132e <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	f0050513          	addi	a0,a0,-256 # 1f20 <__clone+0x46>
    1028:	306000ef          	jal	ra,132e <puts>
	int test_ret = uname(&un);
    102c:	00001517          	auipc	a0,0x1
    1030:	f7450513          	addi	a0,a0,-140 # 1fa0 <un>
    1034:	617000ef          	jal	ra,1e4a <uname>
	assert(test_ret >= 0);
    1038:	06054363          	bltz	a0,109e <test_uname+0x9a>

	printf("Uname: %s %s %s %s %s %s\n", 
    103c:	00001817          	auipc	a6,0x1
    1040:	0a980813          	addi	a6,a6,169 # 20e5 <un+0x145>
    1044:	00001797          	auipc	a5,0x1
    1048:	06078793          	addi	a5,a5,96 # 20a4 <un+0x104>
    104c:	00001717          	auipc	a4,0x1
    1050:	01770713          	addi	a4,a4,23 # 2063 <un+0xc3>
    1054:	00001697          	auipc	a3,0x1
    1058:	fce68693          	addi	a3,a3,-50 # 2022 <un+0x82>
    105c:	00001617          	auipc	a2,0x1
    1060:	f8560613          	addi	a2,a2,-123 # 1fe1 <un+0x41>
    1064:	00001597          	auipc	a1,0x1
    1068:	f3c58593          	addi	a1,a1,-196 # 1fa0 <un>
    106c:	00001517          	auipc	a0,0x1
    1070:	ee450513          	addi	a0,a0,-284 # 1f50 <__clone+0x76>
    1074:	2dc000ef          	jal	ra,1350 <printf>
		un.sysname, un.nodename, un.release, un.version, un.machine, un.domainname);

	TEST_END(__func__);
    1078:	00001517          	auipc	a0,0x1
    107c:	ef850513          	addi	a0,a0,-264 # 1f70 <__clone+0x96>
    1080:	2ae000ef          	jal	ra,132e <puts>
    1084:	00001517          	auipc	a0,0x1
    1088:	0a450513          	addi	a0,a0,164 # 2128 <__func__.0>
    108c:	2a2000ef          	jal	ra,132e <puts>
}
    1090:	60a2                	ld	ra,8(sp)
	TEST_END(__func__);
    1092:	00001517          	auipc	a0,0x1
    1096:	e8e50513          	addi	a0,a0,-370 # 1f20 <__clone+0x46>
}
    109a:	0141                	addi	sp,sp,16
	TEST_END(__func__);
    109c:	ac49                	j	132e <puts>
	assert(test_ret >= 0);
    109e:	00001517          	auipc	a0,0x1
    10a2:	e9250513          	addi	a0,a0,-366 # 1f30 <__clone+0x56>
    10a6:	52e000ef          	jal	ra,15d4 <panic>
    10aa:	bf49                	j	103c <test_uname+0x38>

00000000000010ac <main>:

int main(void) {
    10ac:	1141                	addi	sp,sp,-16
    10ae:	e406                	sd	ra,8(sp)
	test_uname();
    10b0:	f55ff0ef          	jal	ra,1004 <test_uname>
	return 0;
}
    10b4:	60a2                	ld	ra,8(sp)
    10b6:	4501                	li	a0,0
    10b8:	0141                	addi	sp,sp,16
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
    10c0:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10c2:	05a1                	addi	a1,a1,8
{
    10c4:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10c6:	fe7ff0ef          	jal	ra,10ac <main>
    10ca:	429000ef          	jal	ra,1cf2 <exit>
	return 0;
}
    10ce:	60a2                	ld	ra,8(sp)
    10d0:	4501                	li	a0,0
    10d2:	0141                	addi	sp,sp,16
    10d4:	8082                	ret

00000000000010d6 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10d6:	7179                	addi	sp,sp,-48
    10d8:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10da:	12054b63          	bltz	a0,1210 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10de:	02b577bb          	remuw	a5,a0,a1
    10e2:	00001617          	auipc	a2,0x1
    10e6:	05660613          	addi	a2,a2,86 # 2138 <digits>
    buf[16] = 0;
    10ea:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10ee:	0005871b          	sext.w	a4,a1
    10f2:	1782                	slli	a5,a5,0x20
    10f4:	9381                	srli	a5,a5,0x20
    10f6:	97b2                	add	a5,a5,a2
    10f8:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10fc:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1100:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1104:	1cb56363          	bltu	a0,a1,12ca <printint.constprop.0+0x1f4>
        buf[i--] = digits[x % base];
    1108:	45b9                	li	a1,14
    110a:	02e877bb          	remuw	a5,a6,a4
    110e:	1782                	slli	a5,a5,0x20
    1110:	9381                	srli	a5,a5,0x20
    1112:	97b2                	add	a5,a5,a2
    1114:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1118:	02e856bb          	divuw	a3,a6,a4
        buf[i--] = digits[x % base];
    111c:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    1120:	0ce86e63          	bltu	a6,a4,11fc <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    1124:	02e6f5bb          	remuw	a1,a3,a4
    } while ((x /= base) != 0);
    1128:	02e6d7bb          	divuw	a5,a3,a4
        buf[i--] = digits[x % base];
    112c:	1582                	slli	a1,a1,0x20
    112e:	9181                	srli	a1,a1,0x20
    1130:	95b2                	add	a1,a1,a2
    1132:	0005c583          	lbu	a1,0(a1)
    1136:	00b10aa3          	sb	a1,21(sp)
    } while ((x /= base) != 0);
    113a:	0007859b          	sext.w	a1,a5
    113e:	12e6ec63          	bltu	a3,a4,1276 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    1142:	02e7f6bb          	remuw	a3,a5,a4
    1146:	1682                	slli	a3,a3,0x20
    1148:	9281                	srli	a3,a3,0x20
    114a:	96b2                	add	a3,a3,a2
    114c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1150:	02e7d83b          	divuw	a6,a5,a4
        buf[i--] = digits[x % base];
    1154:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1158:	12e5e863          	bltu	a1,a4,1288 <printint.constprop.0+0x1b2>
        buf[i--] = digits[x % base];
    115c:	02e876bb          	remuw	a3,a6,a4
    1160:	1682                	slli	a3,a3,0x20
    1162:	9281                	srli	a3,a3,0x20
    1164:	96b2                	add	a3,a3,a2
    1166:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    116a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    116e:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1172:	12e86463          	bltu	a6,a4,129a <printint.constprop.0+0x1c4>
        buf[i--] = digits[x % base];
    1176:	02e5f6bb          	remuw	a3,a1,a4
    117a:	1682                	slli	a3,a3,0x20
    117c:	9281                	srli	a3,a3,0x20
    117e:	96b2                	add	a3,a3,a2
    1180:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1184:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1188:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    118c:	0ce5ec63          	bltu	a1,a4,1264 <printint.constprop.0+0x18e>
        buf[i--] = digits[x % base];
    1190:	02e876bb          	remuw	a3,a6,a4
    1194:	1682                	slli	a3,a3,0x20
    1196:	9281                	srli	a3,a3,0x20
    1198:	96b2                	add	a3,a3,a2
    119a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    119e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11a2:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11a6:	10e86963          	bltu	a6,a4,12b8 <printint.constprop.0+0x1e2>
        buf[i--] = digits[x % base];
    11aa:	02e5f6bb          	remuw	a3,a1,a4
    11ae:	1682                	slli	a3,a3,0x20
    11b0:	9281                	srli	a3,a3,0x20
    11b2:	96b2                	add	a3,a3,a2
    11b4:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11b8:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11bc:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11c0:	10e5e763          	bltu	a1,a4,12ce <printint.constprop.0+0x1f8>
        buf[i--] = digits[x % base];
    11c4:	02e876bb          	remuw	a3,a6,a4
    11c8:	1682                	slli	a3,a3,0x20
    11ca:	9281                	srli	a3,a3,0x20
    11cc:	96b2                	add	a3,a3,a2
    11ce:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11d2:	02e857bb          	divuw	a5,a6,a4
        buf[i--] = digits[x % base];
    11d6:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11da:	10e86363          	bltu	a6,a4,12e0 <printint.constprop.0+0x20a>
        buf[i--] = digits[x % base];
    11de:	1782                	slli	a5,a5,0x20
    11e0:	9381                	srli	a5,a5,0x20
    11e2:	97b2                	add	a5,a5,a2
    11e4:	0007c783          	lbu	a5,0(a5)
    11e8:	4599                	li	a1,6
    11ea:	00f10723          	sb	a5,14(sp)

    if (sign)
    11ee:	00055763          	bgez	a0,11fc <printint.constprop.0+0x126>
        buf[i--] = '-';
    11f2:	02d00793          	li	a5,45
    11f6:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11fa:	4595                	li	a1,5
    write(f, s, l);
    11fc:	003c                	addi	a5,sp,8
    11fe:	4641                	li	a2,16
    1200:	9e0d                	subw	a2,a2,a1
    1202:	4505                	li	a0,1
    1204:	95be                	add	a1,a1,a5
    1206:	29d000ef          	jal	ra,1ca2 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    120a:	70a2                	ld	ra,40(sp)
    120c:	6145                	addi	sp,sp,48
    120e:	8082                	ret
        x = -xx;
    1210:	40a0083b          	negw	a6,a0
        buf[i--] = digits[x % base];
    1214:	02b877bb          	remuw	a5,a6,a1
    1218:	00001617          	auipc	a2,0x1
    121c:	f2060613          	addi	a2,a2,-224 # 2138 <digits>
    buf[16] = 0;
    1220:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1224:	0005871b          	sext.w	a4,a1
    1228:	1782                	slli	a5,a5,0x20
    122a:	9381                	srli	a5,a5,0x20
    122c:	97b2                	add	a5,a5,a2
    122e:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1232:	02b858bb          	divuw	a7,a6,a1
        buf[i--] = digits[x % base];
    1236:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    123a:	06b86963          	bltu	a6,a1,12ac <printint.constprop.0+0x1d6>
        buf[i--] = digits[x % base];
    123e:	02e8f7bb          	remuw	a5,a7,a4
    1242:	1782                	slli	a5,a5,0x20
    1244:	9381                	srli	a5,a5,0x20
    1246:	97b2                	add	a5,a5,a2
    1248:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    124c:	02e8d6bb          	divuw	a3,a7,a4
        buf[i--] = digits[x % base];
    1250:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    1254:	ece8f8e3          	bgeu	a7,a4,1124 <printint.constprop.0+0x4e>
        buf[i--] = '-';
    1258:	02d00793          	li	a5,45
    125c:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1260:	45b5                	li	a1,13
    1262:	bf69                	j	11fc <printint.constprop.0+0x126>
    1264:	45a9                	li	a1,10
    if (sign)
    1266:	f8055be3          	bgez	a0,11fc <printint.constprop.0+0x126>
        buf[i--] = '-';
    126a:	02d00793          	li	a5,45
    126e:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1272:	45a5                	li	a1,9
    1274:	b761                	j	11fc <printint.constprop.0+0x126>
    1276:	45b5                	li	a1,13
    if (sign)
    1278:	f80552e3          	bgez	a0,11fc <printint.constprop.0+0x126>
        buf[i--] = '-';
    127c:	02d00793          	li	a5,45
    1280:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1284:	45b1                	li	a1,12
    1286:	bf9d                	j	11fc <printint.constprop.0+0x126>
    1288:	45b1                	li	a1,12
    if (sign)
    128a:	f60559e3          	bgez	a0,11fc <printint.constprop.0+0x126>
        buf[i--] = '-';
    128e:	02d00793          	li	a5,45
    1292:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1296:	45ad                	li	a1,11
    1298:	b795                	j	11fc <printint.constprop.0+0x126>
    129a:	45ad                	li	a1,11
    if (sign)
    129c:	f60550e3          	bgez	a0,11fc <printint.constprop.0+0x126>
        buf[i--] = '-';
    12a0:	02d00793          	li	a5,45
    12a4:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12a8:	45a9                	li	a1,10
    12aa:	bf89                	j	11fc <printint.constprop.0+0x126>
        buf[i--] = '-';
    12ac:	02d00793          	li	a5,45
    12b0:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12b4:	45b9                	li	a1,14
    12b6:	b799                	j	11fc <printint.constprop.0+0x126>
    12b8:	45a5                	li	a1,9
    if (sign)
    12ba:	f40551e3          	bgez	a0,11fc <printint.constprop.0+0x126>
        buf[i--] = '-';
    12be:	02d00793          	li	a5,45
    12c2:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12c6:	45a1                	li	a1,8
    12c8:	bf15                	j	11fc <printint.constprop.0+0x126>
    i = 15;
    12ca:	45bd                	li	a1,15
    12cc:	bf05                	j	11fc <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    12ce:	45a1                	li	a1,8
    if (sign)
    12d0:	f20556e3          	bgez	a0,11fc <printint.constprop.0+0x126>
        buf[i--] = '-';
    12d4:	02d00793          	li	a5,45
    12d8:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12dc:	459d                	li	a1,7
    12de:	bf39                	j	11fc <printint.constprop.0+0x126>
    12e0:	459d                	li	a1,7
    if (sign)
    12e2:	f0055de3          	bgez	a0,11fc <printint.constprop.0+0x126>
        buf[i--] = '-';
    12e6:	02d00793          	li	a5,45
    12ea:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12ee:	4599                	li	a1,6
    12f0:	b731                	j	11fc <printint.constprop.0+0x126>

00000000000012f2 <getchar>:
{
    12f2:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12f4:	00f10593          	addi	a1,sp,15
    12f8:	4605                	li	a2,1
    12fa:	4501                	li	a0,0
{
    12fc:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12fe:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1302:	197000ef          	jal	ra,1c98 <read>
}
    1306:	60e2                	ld	ra,24(sp)
    1308:	00f14503          	lbu	a0,15(sp)
    130c:	6105                	addi	sp,sp,32
    130e:	8082                	ret

0000000000001310 <putchar>:
{
    1310:	1101                	addi	sp,sp,-32
    1312:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1314:	00f10593          	addi	a1,sp,15
    1318:	4605                	li	a2,1
    131a:	4505                	li	a0,1
{
    131c:	ec06                	sd	ra,24(sp)
    char byte = c;
    131e:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1322:	181000ef          	jal	ra,1ca2 <write>
}
    1326:	60e2                	ld	ra,24(sp)
    1328:	2501                	sext.w	a0,a0
    132a:	6105                	addi	sp,sp,32
    132c:	8082                	ret

000000000000132e <puts>:
{
    132e:	1141                	addi	sp,sp,-16
    1330:	e406                	sd	ra,8(sp)
    1332:	e022                	sd	s0,0(sp)
    1334:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1336:	57e000ef          	jal	ra,18b4 <strlen>
    133a:	862a                	mv	a2,a0
    133c:	85a2                	mv	a1,s0
    133e:	4505                	li	a0,1
    1340:	163000ef          	jal	ra,1ca2 <write>
}
    1344:	60a2                	ld	ra,8(sp)
    1346:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1348:	957d                	srai	a0,a0,0x3f
    return r;
    134a:	2501                	sext.w	a0,a0
}
    134c:	0141                	addi	sp,sp,16
    134e:	8082                	ret

0000000000001350 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1350:	7171                	addi	sp,sp,-176
    1352:	fc56                	sd	s5,56(sp)
    1354:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1356:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1358:	18bc                	addi	a5,sp,120
{
    135a:	e8ca                	sd	s2,80(sp)
    135c:	e4ce                	sd	s3,72(sp)
    135e:	e0d2                	sd	s4,64(sp)
    1360:	f85a                	sd	s6,48(sp)
    1362:	f486                	sd	ra,104(sp)
    1364:	f0a2                	sd	s0,96(sp)
    1366:	eca6                	sd	s1,88(sp)
    1368:	fcae                	sd	a1,120(sp)
    136a:	e132                	sd	a2,128(sp)
    136c:	e536                	sd	a3,136(sp)
    136e:	e93a                	sd	a4,144(sp)
    1370:	f142                	sd	a6,160(sp)
    1372:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1374:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1376:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    137a:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    137e:	00001b17          	auipc	s6,0x1
    1382:	c02b0b13          	addi	s6,s6,-1022 # 1f80 <__clone+0xa6>
    buf[i++] = '0';
    1386:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    138a:	00001997          	auipc	s3,0x1
    138e:	dae98993          	addi	s3,s3,-594 # 2138 <digits>
        if (!*s)
    1392:	00054783          	lbu	a5,0(a0)
    1396:	16078a63          	beqz	a5,150a <printf+0x1ba>
    139a:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    139c:	19278163          	beq	a5,s2,151e <printf+0x1ce>
    13a0:	00164783          	lbu	a5,1(a2)
    13a4:	0605                	addi	a2,a2,1
    13a6:	fbfd                	bnez	a5,139c <printf+0x4c>
    13a8:	84b2                	mv	s1,a2
        l = z - a;
    13aa:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13ae:	85aa                	mv	a1,a0
    13b0:	8622                	mv	a2,s0
    13b2:	4505                	li	a0,1
    13b4:	0ef000ef          	jal	ra,1ca2 <write>
        if (l)
    13b8:	18041c63          	bnez	s0,1550 <printf+0x200>
        if (s[1] == 0)
    13bc:	0014c783          	lbu	a5,1(s1)
    13c0:	14078563          	beqz	a5,150a <printf+0x1ba>
        switch (s[1])
    13c4:	1d478063          	beq	a5,s4,1584 <printf+0x234>
    13c8:	18fa6663          	bltu	s4,a5,1554 <printf+0x204>
    13cc:	06400713          	li	a4,100
    13d0:	1ae78063          	beq	a5,a4,1570 <printf+0x220>
    13d4:	07000713          	li	a4,112
    13d8:	1ce79963          	bne	a5,a4,15aa <printf+0x25a>
            printptr(va_arg(ap, uint64));
    13dc:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13de:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13e2:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13e4:	631c                	ld	a5,0(a4)
    13e6:	0721                	addi	a4,a4,8
    13e8:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13ea:	00479293          	slli	t0,a5,0x4
    13ee:	00879f93          	slli	t6,a5,0x8
    13f2:	00c79f13          	slli	t5,a5,0xc
    13f6:	01079e93          	slli	t4,a5,0x10
    13fa:	01479e13          	slli	t3,a5,0x14
    13fe:	01879313          	slli	t1,a5,0x18
    1402:	01c79893          	slli	a7,a5,0x1c
    1406:	02479813          	slli	a6,a5,0x24
    140a:	02879513          	slli	a0,a5,0x28
    140e:	02c79593          	slli	a1,a5,0x2c
    1412:	03079693          	slli	a3,a5,0x30
    1416:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    141a:	03c7d413          	srli	s0,a5,0x3c
    141e:	01c7d39b          	srliw	t2,a5,0x1c
    1422:	03c2d293          	srli	t0,t0,0x3c
    1426:	03cfdf93          	srli	t6,t6,0x3c
    142a:	03cf5f13          	srli	t5,t5,0x3c
    142e:	03cede93          	srli	t4,t4,0x3c
    1432:	03ce5e13          	srli	t3,t3,0x3c
    1436:	03c35313          	srli	t1,t1,0x3c
    143a:	03c8d893          	srli	a7,a7,0x3c
    143e:	03c85813          	srli	a6,a6,0x3c
    1442:	9171                	srli	a0,a0,0x3c
    1444:	91f1                	srli	a1,a1,0x3c
    1446:	92f1                	srli	a3,a3,0x3c
    1448:	9371                	srli	a4,a4,0x3c
    144a:	96ce                	add	a3,a3,s3
    144c:	974e                	add	a4,a4,s3
    144e:	944e                	add	s0,s0,s3
    1450:	92ce                	add	t0,t0,s3
    1452:	9fce                	add	t6,t6,s3
    1454:	9f4e                	add	t5,t5,s3
    1456:	9ece                	add	t4,t4,s3
    1458:	9e4e                	add	t3,t3,s3
    145a:	934e                	add	t1,t1,s3
    145c:	98ce                	add	a7,a7,s3
    145e:	93ce                	add	t2,t2,s3
    1460:	984e                	add	a6,a6,s3
    1462:	954e                	add	a0,a0,s3
    1464:	95ce                	add	a1,a1,s3
    1466:	0006c083          	lbu	ra,0(a3)
    146a:	0002c283          	lbu	t0,0(t0)
    146e:	00074683          	lbu	a3,0(a4)
    1472:	000fcf83          	lbu	t6,0(t6)
    1476:	000f4f03          	lbu	t5,0(t5)
    147a:	000ece83          	lbu	t4,0(t4)
    147e:	000e4e03          	lbu	t3,0(t3)
    1482:	00034303          	lbu	t1,0(t1)
    1486:	0008c883          	lbu	a7,0(a7)
    148a:	0003c383          	lbu	t2,0(t2)
    148e:	00084803          	lbu	a6,0(a6)
    1492:	00054503          	lbu	a0,0(a0)
    1496:	0005c583          	lbu	a1,0(a1)
    149a:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    149e:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14a2:	9371                	srli	a4,a4,0x3c
    14a4:	8bbd                	andi	a5,a5,15
    14a6:	974e                	add	a4,a4,s3
    14a8:	97ce                	add	a5,a5,s3
    14aa:	005105a3          	sb	t0,11(sp)
    14ae:	01f10623          	sb	t6,12(sp)
    14b2:	01e106a3          	sb	t5,13(sp)
    14b6:	01d10723          	sb	t4,14(sp)
    14ba:	01c107a3          	sb	t3,15(sp)
    14be:	00610823          	sb	t1,16(sp)
    14c2:	011108a3          	sb	a7,17(sp)
    14c6:	00710923          	sb	t2,18(sp)
    14ca:	010109a3          	sb	a6,19(sp)
    14ce:	00a10a23          	sb	a0,20(sp)
    14d2:	00b10aa3          	sb	a1,21(sp)
    14d6:	00110b23          	sb	ra,22(sp)
    14da:	00d10ba3          	sb	a3,23(sp)
    14de:	00810523          	sb	s0,10(sp)
    14e2:	00074703          	lbu	a4,0(a4)
    14e6:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14ea:	002c                	addi	a1,sp,8
    14ec:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14ee:	00e10c23          	sb	a4,24(sp)
    14f2:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14f6:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14fa:	7a8000ef          	jal	ra,1ca2 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14fe:	00248513          	addi	a0,s1,2
        if (!*s)
    1502:	00054783          	lbu	a5,0(a0)
    1506:	e8079ae3          	bnez	a5,139a <printf+0x4a>
    }
    va_end(ap);
}
    150a:	70a6                	ld	ra,104(sp)
    150c:	7406                	ld	s0,96(sp)
    150e:	64e6                	ld	s1,88(sp)
    1510:	6946                	ld	s2,80(sp)
    1512:	69a6                	ld	s3,72(sp)
    1514:	6a06                	ld	s4,64(sp)
    1516:	7ae2                	ld	s5,56(sp)
    1518:	7b42                	ld	s6,48(sp)
    151a:	614d                	addi	sp,sp,176
    151c:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    151e:	00064783          	lbu	a5,0(a2)
    1522:	84b2                	mv	s1,a2
    1524:	01278963          	beq	a5,s2,1536 <printf+0x1e6>
    1528:	b549                	j	13aa <printf+0x5a>
    152a:	0024c783          	lbu	a5,2(s1)
    152e:	0605                	addi	a2,a2,1
    1530:	0489                	addi	s1,s1,2
    1532:	e7279ce3          	bne	a5,s2,13aa <printf+0x5a>
    1536:	0014c783          	lbu	a5,1(s1)
    153a:	ff2788e3          	beq	a5,s2,152a <printf+0x1da>
        l = z - a;
    153e:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1542:	85aa                	mv	a1,a0
    1544:	8622                	mv	a2,s0
    1546:	4505                	li	a0,1
    1548:	75a000ef          	jal	ra,1ca2 <write>
        if (l)
    154c:	e60408e3          	beqz	s0,13bc <printf+0x6c>
    1550:	8526                	mv	a0,s1
    1552:	b581                	j	1392 <printf+0x42>
        switch (s[1])
    1554:	07800713          	li	a4,120
    1558:	04e79963          	bne	a5,a4,15aa <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    155c:	6782                	ld	a5,0(sp)
    155e:	45c1                	li	a1,16
    1560:	4388                	lw	a0,0(a5)
    1562:	07a1                	addi	a5,a5,8
    1564:	e03e                	sd	a5,0(sp)
    1566:	b71ff0ef          	jal	ra,10d6 <printint.constprop.0>
        s += 2;
    156a:	00248513          	addi	a0,s1,2
    156e:	bf51                	j	1502 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    1570:	6782                	ld	a5,0(sp)
    1572:	45a9                	li	a1,10
    1574:	4388                	lw	a0,0(a5)
    1576:	07a1                	addi	a5,a5,8
    1578:	e03e                	sd	a5,0(sp)
    157a:	b5dff0ef          	jal	ra,10d6 <printint.constprop.0>
        s += 2;
    157e:	00248513          	addi	a0,s1,2
    1582:	b741                	j	1502 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1584:	6782                	ld	a5,0(sp)
    1586:	6380                	ld	s0,0(a5)
    1588:	07a1                	addi	a5,a5,8
    158a:	e03e                	sd	a5,0(sp)
    158c:	c031                	beqz	s0,15d0 <printf+0x280>
            l = strnlen(a, 200);
    158e:	0c800593          	li	a1,200
    1592:	8522                	mv	a0,s0
    1594:	40c000ef          	jal	ra,19a0 <strnlen>
    write(f, s, l);
    1598:	0005061b          	sext.w	a2,a0
    159c:	85a2                	mv	a1,s0
    159e:	4505                	li	a0,1
    15a0:	702000ef          	jal	ra,1ca2 <write>
        s += 2;
    15a4:	00248513          	addi	a0,s1,2
    15a8:	bfa9                	j	1502 <printf+0x1b2>
    return write(stdout, &byte, 1);
    15aa:	4605                	li	a2,1
    15ac:	002c                	addi	a1,sp,8
    15ae:	4505                	li	a0,1
    char byte = c;
    15b0:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15b4:	6ee000ef          	jal	ra,1ca2 <write>
    char byte = c;
    15b8:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15bc:	4605                	li	a2,1
    15be:	002c                	addi	a1,sp,8
    15c0:	4505                	li	a0,1
    char byte = c;
    15c2:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15c6:	6dc000ef          	jal	ra,1ca2 <write>
        s += 2;
    15ca:	00248513          	addi	a0,s1,2
    15ce:	bf15                	j	1502 <printf+0x1b2>
                a = "(null)";
    15d0:	845a                	mv	s0,s6
    15d2:	bf75                	j	158e <printf+0x23e>

00000000000015d4 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15d4:	1141                	addi	sp,sp,-16
    15d6:	e406                	sd	ra,8(sp)
    puts(m);
    15d8:	d57ff0ef          	jal	ra,132e <puts>
    exit(-100);
}
    15dc:	60a2                	ld	ra,8(sp)
    exit(-100);
    15de:	f9c00513          	li	a0,-100
}
    15e2:	0141                	addi	sp,sp,16
    exit(-100);
    15e4:	a739                	j	1cf2 <exit>

00000000000015e6 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15e6:	02000793          	li	a5,32
    15ea:	00f50663          	beq	a0,a5,15f6 <isspace+0x10>
    15ee:	355d                	addiw	a0,a0,-9
    15f0:	00553513          	sltiu	a0,a0,5
    15f4:	8082                	ret
    15f6:	4505                	li	a0,1
}
    15f8:	8082                	ret

00000000000015fa <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15fa:	fd05051b          	addiw	a0,a0,-48
}
    15fe:	00a53513          	sltiu	a0,a0,10
    1602:	8082                	ret

0000000000001604 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1604:	02000613          	li	a2,32
    1608:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    160a:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    160e:	ff77869b          	addiw	a3,a5,-9
    1612:	04c78c63          	beq	a5,a2,166a <atoi+0x66>
    1616:	0007871b          	sext.w	a4,a5
    161a:	04d5f863          	bgeu	a1,a3,166a <atoi+0x66>
        s++;
    switch (*s)
    161e:	02b00693          	li	a3,43
    1622:	04d78963          	beq	a5,a3,1674 <atoi+0x70>
    1626:	02d00693          	li	a3,45
    162a:	06d78263          	beq	a5,a3,168e <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    162e:	fd07061b          	addiw	a2,a4,-48
    1632:	47a5                	li	a5,9
    1634:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1636:	4e01                	li	t3,0
    while (isdigit(*s))
    1638:	04c7e963          	bltu	a5,a2,168a <atoi+0x86>
    int n = 0, neg = 0;
    163c:	4501                	li	a0,0
    while (isdigit(*s))
    163e:	4825                	li	a6,9
    1640:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    1644:	0025179b          	slliw	a5,a0,0x2
    1648:	9fa9                	addw	a5,a5,a0
    164a:	fd07031b          	addiw	t1,a4,-48
    164e:	0017989b          	slliw	a7,a5,0x1
    while (isdigit(*s))
    1652:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1656:	0685                	addi	a3,a3,1
    1658:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    165c:	0006071b          	sext.w	a4,a2
    1660:	feb870e3          	bgeu	a6,a1,1640 <atoi+0x3c>
    return neg ? n : -n;
    1664:	000e0563          	beqz	t3,166e <atoi+0x6a>
}
    1668:	8082                	ret
        s++;
    166a:	0505                	addi	a0,a0,1
    166c:	bf79                	j	160a <atoi+0x6>
    return neg ? n : -n;
    166e:	4113053b          	subw	a0,t1,a7
    1672:	8082                	ret
    while (isdigit(*s))
    1674:	00154703          	lbu	a4,1(a0)
    1678:	47a5                	li	a5,9
        s++;
    167a:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    167e:	fd07061b          	addiw	a2,a4,-48
    int n = 0, neg = 0;
    1682:	4e01                	li	t3,0
    while (isdigit(*s))
    1684:	2701                	sext.w	a4,a4
    1686:	fac7fbe3          	bgeu	a5,a2,163c <atoi+0x38>
    168a:	4501                	li	a0,0
}
    168c:	8082                	ret
    while (isdigit(*s))
    168e:	00154703          	lbu	a4,1(a0)
    1692:	47a5                	li	a5,9
        s++;
    1694:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1698:	fd07061b          	addiw	a2,a4,-48
    169c:	2701                	sext.w	a4,a4
    169e:	fec7e6e3          	bltu	a5,a2,168a <atoi+0x86>
        neg = 1;
    16a2:	4e05                	li	t3,1
    16a4:	bf61                	j	163c <atoi+0x38>

00000000000016a6 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16a6:	16060d63          	beqz	a2,1820 <memset+0x17a>
    16aa:	40a007b3          	neg	a5,a0
    16ae:	8b9d                	andi	a5,a5,7
    16b0:	00778693          	addi	a3,a5,7
    16b4:	482d                	li	a6,11
    16b6:	0ff5f713          	zext.b	a4,a1
    16ba:	fff60593          	addi	a1,a2,-1
    16be:	1706e263          	bltu	a3,a6,1822 <memset+0x17c>
    16c2:	16d5ea63          	bltu	a1,a3,1836 <memset+0x190>
    16c6:	16078563          	beqz	a5,1830 <memset+0x18a>
    16ca:	00e50023          	sb	a4,0(a0)
    16ce:	4685                	li	a3,1
    16d0:	00150593          	addi	a1,a0,1
    16d4:	14d78c63          	beq	a5,a3,182c <memset+0x186>
    16d8:	00e500a3          	sb	a4,1(a0)
    16dc:	4689                	li	a3,2
    16de:	00250593          	addi	a1,a0,2
    16e2:	14d78d63          	beq	a5,a3,183c <memset+0x196>
    16e6:	00e50123          	sb	a4,2(a0)
    16ea:	468d                	li	a3,3
    16ec:	00350593          	addi	a1,a0,3
    16f0:	12d78b63          	beq	a5,a3,1826 <memset+0x180>
    16f4:	00e501a3          	sb	a4,3(a0)
    16f8:	4691                	li	a3,4
    16fa:	00450593          	addi	a1,a0,4
    16fe:	14d78163          	beq	a5,a3,1840 <memset+0x19a>
    1702:	00e50223          	sb	a4,4(a0)
    1706:	4695                	li	a3,5
    1708:	00550593          	addi	a1,a0,5
    170c:	12d78c63          	beq	a5,a3,1844 <memset+0x19e>
    1710:	00e502a3          	sb	a4,5(a0)
    1714:	469d                	li	a3,7
    1716:	00650593          	addi	a1,a0,6
    171a:	12d79763          	bne	a5,a3,1848 <memset+0x1a2>
    171e:	00750593          	addi	a1,a0,7
    1722:	00e50323          	sb	a4,6(a0)
    1726:	481d                	li	a6,7
    1728:	00871693          	slli	a3,a4,0x8
    172c:	01071893          	slli	a7,a4,0x10
    1730:	8ed9                	or	a3,a3,a4
    1732:	01871313          	slli	t1,a4,0x18
    1736:	0116e6b3          	or	a3,a3,a7
    173a:	0066e6b3          	or	a3,a3,t1
    173e:	02071893          	slli	a7,a4,0x20
    1742:	02871e13          	slli	t3,a4,0x28
    1746:	0116e6b3          	or	a3,a3,a7
    174a:	40f60333          	sub	t1,a2,a5
    174e:	03071893          	slli	a7,a4,0x30
    1752:	01c6e6b3          	or	a3,a3,t3
    1756:	0116e6b3          	or	a3,a3,a7
    175a:	03871e13          	slli	t3,a4,0x38
    175e:	97aa                	add	a5,a5,a0
    1760:	ff837893          	andi	a7,t1,-8
    1764:	01c6e6b3          	or	a3,a3,t3
    1768:	98be                	add	a7,a7,a5
    176a:	e394                	sd	a3,0(a5)
    176c:	07a1                	addi	a5,a5,8
    176e:	ff179ee3          	bne	a5,a7,176a <memset+0xc4>
    1772:	ff837893          	andi	a7,t1,-8
    1776:	011587b3          	add	a5,a1,a7
    177a:	010886bb          	addw	a3,a7,a6
    177e:	0b130663          	beq	t1,a7,182a <memset+0x184>
    1782:	00e78023          	sb	a4,0(a5)
    1786:	0016859b          	addiw	a1,a3,1
    178a:	08c5fb63          	bgeu	a1,a2,1820 <memset+0x17a>
    178e:	00e780a3          	sb	a4,1(a5)
    1792:	0026859b          	addiw	a1,a3,2
    1796:	08c5f563          	bgeu	a1,a2,1820 <memset+0x17a>
    179a:	00e78123          	sb	a4,2(a5)
    179e:	0036859b          	addiw	a1,a3,3
    17a2:	06c5ff63          	bgeu	a1,a2,1820 <memset+0x17a>
    17a6:	00e781a3          	sb	a4,3(a5)
    17aa:	0046859b          	addiw	a1,a3,4
    17ae:	06c5f963          	bgeu	a1,a2,1820 <memset+0x17a>
    17b2:	00e78223          	sb	a4,4(a5)
    17b6:	0056859b          	addiw	a1,a3,5
    17ba:	06c5f363          	bgeu	a1,a2,1820 <memset+0x17a>
    17be:	00e782a3          	sb	a4,5(a5)
    17c2:	0066859b          	addiw	a1,a3,6
    17c6:	04c5fd63          	bgeu	a1,a2,1820 <memset+0x17a>
    17ca:	00e78323          	sb	a4,6(a5)
    17ce:	0076859b          	addiw	a1,a3,7
    17d2:	04c5f763          	bgeu	a1,a2,1820 <memset+0x17a>
    17d6:	00e783a3          	sb	a4,7(a5)
    17da:	0086859b          	addiw	a1,a3,8
    17de:	04c5f163          	bgeu	a1,a2,1820 <memset+0x17a>
    17e2:	00e78423          	sb	a4,8(a5)
    17e6:	0096859b          	addiw	a1,a3,9
    17ea:	02c5fb63          	bgeu	a1,a2,1820 <memset+0x17a>
    17ee:	00e784a3          	sb	a4,9(a5)
    17f2:	00a6859b          	addiw	a1,a3,10
    17f6:	02c5f563          	bgeu	a1,a2,1820 <memset+0x17a>
    17fa:	00e78523          	sb	a4,10(a5)
    17fe:	00b6859b          	addiw	a1,a3,11
    1802:	00c5ff63          	bgeu	a1,a2,1820 <memset+0x17a>
    1806:	00e785a3          	sb	a4,11(a5)
    180a:	00c6859b          	addiw	a1,a3,12
    180e:	00c5f963          	bgeu	a1,a2,1820 <memset+0x17a>
    1812:	00e78623          	sb	a4,12(a5)
    1816:	26b5                	addiw	a3,a3,13
    1818:	00c6f463          	bgeu	a3,a2,1820 <memset+0x17a>
    181c:	00e786a3          	sb	a4,13(a5)
        ;
    return dest;
}
    1820:	8082                	ret
    1822:	46ad                	li	a3,11
    1824:	bd79                	j	16c2 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1826:	480d                	li	a6,3
    1828:	b701                	j	1728 <memset+0x82>
    182a:	8082                	ret
    182c:	4805                	li	a6,1
    182e:	bded                	j	1728 <memset+0x82>
    1830:	85aa                	mv	a1,a0
    1832:	4801                	li	a6,0
    1834:	bdd5                	j	1728 <memset+0x82>
    1836:	87aa                	mv	a5,a0
    1838:	4681                	li	a3,0
    183a:	b7a1                	j	1782 <memset+0xdc>
    183c:	4809                	li	a6,2
    183e:	b5ed                	j	1728 <memset+0x82>
    1840:	4811                	li	a6,4
    1842:	b5dd                	j	1728 <memset+0x82>
    1844:	4815                	li	a6,5
    1846:	b5cd                	j	1728 <memset+0x82>
    1848:	4819                	li	a6,6
    184a:	bdf9                	j	1728 <memset+0x82>

000000000000184c <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    184c:	00054783          	lbu	a5,0(a0)
    1850:	0005c703          	lbu	a4,0(a1)
    1854:	00e79863          	bne	a5,a4,1864 <strcmp+0x18>
    1858:	0505                	addi	a0,a0,1
    185a:	0585                	addi	a1,a1,1
    185c:	fbe5                	bnez	a5,184c <strcmp>
    185e:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1860:	9d19                	subw	a0,a0,a4
    1862:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1864:	0007851b          	sext.w	a0,a5
    1868:	bfe5                	j	1860 <strcmp+0x14>

000000000000186a <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    186a:	ca15                	beqz	a2,189e <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    186c:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1870:	167d                	addi	a2,a2,-1
    1872:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1876:	eb99                	bnez	a5,188c <strncmp+0x22>
    1878:	a815                	j	18ac <strncmp+0x42>
    187a:	00a68e63          	beq	a3,a0,1896 <strncmp+0x2c>
    187e:	0505                	addi	a0,a0,1
    1880:	00f71b63          	bne	a4,a5,1896 <strncmp+0x2c>
    1884:	00054783          	lbu	a5,0(a0)
    1888:	cf89                	beqz	a5,18a2 <strncmp+0x38>
    188a:	85b2                	mv	a1,a2
    188c:	0005c703          	lbu	a4,0(a1)
    1890:	00158613          	addi	a2,a1,1
    1894:	f37d                	bnez	a4,187a <strncmp+0x10>
        ;
    return *l - *r;
    1896:	0007851b          	sext.w	a0,a5
    189a:	9d19                	subw	a0,a0,a4
    189c:	8082                	ret
        return 0;
    189e:	4501                	li	a0,0
}
    18a0:	8082                	ret
    return *l - *r;
    18a2:	0015c703          	lbu	a4,1(a1)
    18a6:	4501                	li	a0,0
    18a8:	9d19                	subw	a0,a0,a4
    18aa:	8082                	ret
    18ac:	0005c703          	lbu	a4,0(a1)
    18b0:	4501                	li	a0,0
    18b2:	b7e5                	j	189a <strncmp+0x30>

00000000000018b4 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18b4:	00757793          	andi	a5,a0,7
    18b8:	cf89                	beqz	a5,18d2 <strlen+0x1e>
    18ba:	87aa                	mv	a5,a0
    18bc:	a029                	j	18c6 <strlen+0x12>
    18be:	0785                	addi	a5,a5,1
    18c0:	0077f713          	andi	a4,a5,7
    18c4:	cb01                	beqz	a4,18d4 <strlen+0x20>
        if (!*s)
    18c6:	0007c703          	lbu	a4,0(a5)
    18ca:	fb75                	bnez	a4,18be <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18cc:	40a78533          	sub	a0,a5,a0
}
    18d0:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18d2:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18d4:	6394                	ld	a3,0(a5)
    18d6:	00000597          	auipc	a1,0x0
    18da:	6b25b583          	ld	a1,1714(a1) # 1f88 <__clone+0xae>
    18de:	00000617          	auipc	a2,0x0
    18e2:	6b263603          	ld	a2,1714(a2) # 1f90 <__clone+0xb6>
    18e6:	a019                	j	18ec <strlen+0x38>
    18e8:	6794                	ld	a3,8(a5)
    18ea:	07a1                	addi	a5,a5,8
    18ec:	00b68733          	add	a4,a3,a1
    18f0:	fff6c693          	not	a3,a3
    18f4:	8f75                	and	a4,a4,a3
    18f6:	8f71                	and	a4,a4,a2
    18f8:	db65                	beqz	a4,18e8 <strlen+0x34>
    for (; *s; s++)
    18fa:	0007c703          	lbu	a4,0(a5)
    18fe:	d779                	beqz	a4,18cc <strlen+0x18>
    1900:	0017c703          	lbu	a4,1(a5)
    1904:	0785                	addi	a5,a5,1
    1906:	d379                	beqz	a4,18cc <strlen+0x18>
    1908:	0017c703          	lbu	a4,1(a5)
    190c:	0785                	addi	a5,a5,1
    190e:	fb6d                	bnez	a4,1900 <strlen+0x4c>
    1910:	bf75                	j	18cc <strlen+0x18>

0000000000001912 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1912:	00757713          	andi	a4,a0,7
{
    1916:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1918:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    191c:	cb19                	beqz	a4,1932 <memchr+0x20>
    191e:	ce25                	beqz	a2,1996 <memchr+0x84>
    1920:	0007c703          	lbu	a4,0(a5)
    1924:	04b70e63          	beq	a4,a1,1980 <memchr+0x6e>
    1928:	0785                	addi	a5,a5,1
    192a:	0077f713          	andi	a4,a5,7
    192e:	167d                	addi	a2,a2,-1
    1930:	f77d                	bnez	a4,191e <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1932:	4501                	li	a0,0
    if (n && *s != c)
    1934:	c235                	beqz	a2,1998 <memchr+0x86>
    1936:	0007c703          	lbu	a4,0(a5)
    193a:	04b70363          	beq	a4,a1,1980 <memchr+0x6e>
        size_t k = ONES * c;
    193e:	00000517          	auipc	a0,0x0
    1942:	65a53503          	ld	a0,1626(a0) # 1f98 <__clone+0xbe>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1946:	471d                	li	a4,7
        size_t k = ONES * c;
    1948:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    194c:	02c77a63          	bgeu	a4,a2,1980 <memchr+0x6e>
    1950:	00000897          	auipc	a7,0x0
    1954:	6388b883          	ld	a7,1592(a7) # 1f88 <__clone+0xae>
    1958:	00000817          	auipc	a6,0x0
    195c:	63883803          	ld	a6,1592(a6) # 1f90 <__clone+0xb6>
    1960:	431d                	li	t1,7
    1962:	a029                	j	196c <memchr+0x5a>
    1964:	1661                	addi	a2,a2,-8
    1966:	07a1                	addi	a5,a5,8
    1968:	02c37963          	bgeu	t1,a2,199a <memchr+0x88>
    196c:	6398                	ld	a4,0(a5)
    196e:	8f29                	xor	a4,a4,a0
    1970:	011706b3          	add	a3,a4,a7
    1974:	fff74713          	not	a4,a4
    1978:	8f75                	and	a4,a4,a3
    197a:	01077733          	and	a4,a4,a6
    197e:	d37d                	beqz	a4,1964 <memchr+0x52>
{
    1980:	853e                	mv	a0,a5
    1982:	97b2                	add	a5,a5,a2
    1984:	a021                	j	198c <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1986:	0505                	addi	a0,a0,1
    1988:	00f50763          	beq	a0,a5,1996 <memchr+0x84>
    198c:	00054703          	lbu	a4,0(a0)
    1990:	feb71be3          	bne	a4,a1,1986 <memchr+0x74>
    1994:	8082                	ret
    return n ? (void *)s : 0;
    1996:	4501                	li	a0,0
}
    1998:	8082                	ret
    return n ? (void *)s : 0;
    199a:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    199c:	f275                	bnez	a2,1980 <memchr+0x6e>
}
    199e:	8082                	ret

00000000000019a0 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19a0:	1101                	addi	sp,sp,-32
    19a2:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19a4:	862e                	mv	a2,a1
{
    19a6:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19a8:	4581                	li	a1,0
{
    19aa:	e426                	sd	s1,8(sp)
    19ac:	ec06                	sd	ra,24(sp)
    19ae:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19b0:	f63ff0ef          	jal	ra,1912 <memchr>
    return p ? p - s : n;
    19b4:	c519                	beqz	a0,19c2 <strnlen+0x22>
}
    19b6:	60e2                	ld	ra,24(sp)
    19b8:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19ba:	8d05                	sub	a0,a0,s1
}
    19bc:	64a2                	ld	s1,8(sp)
    19be:	6105                	addi	sp,sp,32
    19c0:	8082                	ret
    19c2:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19c4:	8522                	mv	a0,s0
}
    19c6:	6442                	ld	s0,16(sp)
    19c8:	64a2                	ld	s1,8(sp)
    19ca:	6105                	addi	sp,sp,32
    19cc:	8082                	ret

00000000000019ce <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19ce:	00a5c7b3          	xor	a5,a1,a0
    19d2:	8b9d                	andi	a5,a5,7
    19d4:	eb95                	bnez	a5,1a08 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19d6:	0075f793          	andi	a5,a1,7
    19da:	e7b1                	bnez	a5,1a26 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19dc:	6198                	ld	a4,0(a1)
    19de:	00000617          	auipc	a2,0x0
    19e2:	5aa63603          	ld	a2,1450(a2) # 1f88 <__clone+0xae>
    19e6:	00000817          	auipc	a6,0x0
    19ea:	5aa83803          	ld	a6,1450(a6) # 1f90 <__clone+0xb6>
    19ee:	a029                	j	19f8 <strcpy+0x2a>
    19f0:	05a1                	addi	a1,a1,8
    19f2:	e118                	sd	a4,0(a0)
    19f4:	6198                	ld	a4,0(a1)
    19f6:	0521                	addi	a0,a0,8
    19f8:	00c707b3          	add	a5,a4,a2
    19fc:	fff74693          	not	a3,a4
    1a00:	8ff5                	and	a5,a5,a3
    1a02:	0107f7b3          	and	a5,a5,a6
    1a06:	d7ed                	beqz	a5,19f0 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a08:	0005c783          	lbu	a5,0(a1)
    1a0c:	00f50023          	sb	a5,0(a0)
    1a10:	c785                	beqz	a5,1a38 <strcpy+0x6a>
    1a12:	0015c783          	lbu	a5,1(a1)
    1a16:	0505                	addi	a0,a0,1
    1a18:	0585                	addi	a1,a1,1
    1a1a:	00f50023          	sb	a5,0(a0)
    1a1e:	fbf5                	bnez	a5,1a12 <strcpy+0x44>
        ;
    return d;
}
    1a20:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a22:	0505                	addi	a0,a0,1
    1a24:	df45                	beqz	a4,19dc <strcpy+0xe>
            if (!(*d = *s))
    1a26:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a2a:	0585                	addi	a1,a1,1
    1a2c:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1a30:	00f50023          	sb	a5,0(a0)
    1a34:	f7fd                	bnez	a5,1a22 <strcpy+0x54>
}
    1a36:	8082                	ret
    1a38:	8082                	ret

0000000000001a3a <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a3a:	00a5c7b3          	xor	a5,a1,a0
    1a3e:	8b9d                	andi	a5,a5,7
    1a40:	1a079863          	bnez	a5,1bf0 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a44:	0075f793          	andi	a5,a1,7
    1a48:	16078463          	beqz	a5,1bb0 <strncpy+0x176>
    1a4c:	ea01                	bnez	a2,1a5c <strncpy+0x22>
    1a4e:	a421                	j	1c56 <strncpy+0x21c>
    1a50:	167d                	addi	a2,a2,-1
    1a52:	0505                	addi	a0,a0,1
    1a54:	14070e63          	beqz	a4,1bb0 <strncpy+0x176>
    1a58:	1a060863          	beqz	a2,1c08 <strncpy+0x1ce>
    1a5c:	0005c783          	lbu	a5,0(a1)
    1a60:	0585                	addi	a1,a1,1
    1a62:	0075f713          	andi	a4,a1,7
    1a66:	00f50023          	sb	a5,0(a0)
    1a6a:	f3fd                	bnez	a5,1a50 <strncpy+0x16>
    1a6c:	4805                	li	a6,1
    1a6e:	1a061863          	bnez	a2,1c1e <strncpy+0x1e4>
    1a72:	40a007b3          	neg	a5,a0
    1a76:	8b9d                	andi	a5,a5,7
    1a78:	4681                	li	a3,0
    1a7a:	18061a63          	bnez	a2,1c0e <strncpy+0x1d4>
    1a7e:	00778713          	addi	a4,a5,7
    1a82:	45ad                	li	a1,11
    1a84:	18b76363          	bltu	a4,a1,1c0a <strncpy+0x1d0>
    1a88:	1ae6eb63          	bltu	a3,a4,1c3e <strncpy+0x204>
    1a8c:	1a078363          	beqz	a5,1c32 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a90:	00050023          	sb	zero,0(a0)
    1a94:	4685                	li	a3,1
    1a96:	00150713          	addi	a4,a0,1
    1a9a:	18d78f63          	beq	a5,a3,1c38 <strncpy+0x1fe>
    1a9e:	000500a3          	sb	zero,1(a0)
    1aa2:	4689                	li	a3,2
    1aa4:	00250713          	addi	a4,a0,2
    1aa8:	18d78e63          	beq	a5,a3,1c44 <strncpy+0x20a>
    1aac:	00050123          	sb	zero,2(a0)
    1ab0:	468d                	li	a3,3
    1ab2:	00350713          	addi	a4,a0,3
    1ab6:	16d78c63          	beq	a5,a3,1c2e <strncpy+0x1f4>
    1aba:	000501a3          	sb	zero,3(a0)
    1abe:	4691                	li	a3,4
    1ac0:	00450713          	addi	a4,a0,4
    1ac4:	18d78263          	beq	a5,a3,1c48 <strncpy+0x20e>
    1ac8:	00050223          	sb	zero,4(a0)
    1acc:	4695                	li	a3,5
    1ace:	00550713          	addi	a4,a0,5
    1ad2:	16d78d63          	beq	a5,a3,1c4c <strncpy+0x212>
    1ad6:	000502a3          	sb	zero,5(a0)
    1ada:	469d                	li	a3,7
    1adc:	00650713          	addi	a4,a0,6
    1ae0:	16d79863          	bne	a5,a3,1c50 <strncpy+0x216>
    1ae4:	00750713          	addi	a4,a0,7
    1ae8:	00050323          	sb	zero,6(a0)
    1aec:	40f80833          	sub	a6,a6,a5
    1af0:	ff887593          	andi	a1,a6,-8
    1af4:	97aa                	add	a5,a5,a0
    1af6:	95be                	add	a1,a1,a5
    1af8:	0007b023          	sd	zero,0(a5)
    1afc:	07a1                	addi	a5,a5,8
    1afe:	feb79de3          	bne	a5,a1,1af8 <strncpy+0xbe>
    1b02:	ff887593          	andi	a1,a6,-8
    1b06:	9ead                	addw	a3,a3,a1
    1b08:	00b707b3          	add	a5,a4,a1
    1b0c:	12b80863          	beq	a6,a1,1c3c <strncpy+0x202>
    1b10:	00078023          	sb	zero,0(a5)
    1b14:	0016871b          	addiw	a4,a3,1
    1b18:	0ec77863          	bgeu	a4,a2,1c08 <strncpy+0x1ce>
    1b1c:	000780a3          	sb	zero,1(a5)
    1b20:	0026871b          	addiw	a4,a3,2
    1b24:	0ec77263          	bgeu	a4,a2,1c08 <strncpy+0x1ce>
    1b28:	00078123          	sb	zero,2(a5)
    1b2c:	0036871b          	addiw	a4,a3,3
    1b30:	0cc77c63          	bgeu	a4,a2,1c08 <strncpy+0x1ce>
    1b34:	000781a3          	sb	zero,3(a5)
    1b38:	0046871b          	addiw	a4,a3,4
    1b3c:	0cc77663          	bgeu	a4,a2,1c08 <strncpy+0x1ce>
    1b40:	00078223          	sb	zero,4(a5)
    1b44:	0056871b          	addiw	a4,a3,5
    1b48:	0cc77063          	bgeu	a4,a2,1c08 <strncpy+0x1ce>
    1b4c:	000782a3          	sb	zero,5(a5)
    1b50:	0066871b          	addiw	a4,a3,6
    1b54:	0ac77a63          	bgeu	a4,a2,1c08 <strncpy+0x1ce>
    1b58:	00078323          	sb	zero,6(a5)
    1b5c:	0076871b          	addiw	a4,a3,7
    1b60:	0ac77463          	bgeu	a4,a2,1c08 <strncpy+0x1ce>
    1b64:	000783a3          	sb	zero,7(a5)
    1b68:	0086871b          	addiw	a4,a3,8
    1b6c:	08c77e63          	bgeu	a4,a2,1c08 <strncpy+0x1ce>
    1b70:	00078423          	sb	zero,8(a5)
    1b74:	0096871b          	addiw	a4,a3,9
    1b78:	08c77863          	bgeu	a4,a2,1c08 <strncpy+0x1ce>
    1b7c:	000784a3          	sb	zero,9(a5)
    1b80:	00a6871b          	addiw	a4,a3,10
    1b84:	08c77263          	bgeu	a4,a2,1c08 <strncpy+0x1ce>
    1b88:	00078523          	sb	zero,10(a5)
    1b8c:	00b6871b          	addiw	a4,a3,11
    1b90:	06c77c63          	bgeu	a4,a2,1c08 <strncpy+0x1ce>
    1b94:	000785a3          	sb	zero,11(a5)
    1b98:	00c6871b          	addiw	a4,a3,12
    1b9c:	06c77663          	bgeu	a4,a2,1c08 <strncpy+0x1ce>
    1ba0:	00078623          	sb	zero,12(a5)
    1ba4:	26b5                	addiw	a3,a3,13
    1ba6:	06c6f163          	bgeu	a3,a2,1c08 <strncpy+0x1ce>
    1baa:	000786a3          	sb	zero,13(a5)
    1bae:	8082                	ret
            ;
        if (!n || !*s)
    1bb0:	c645                	beqz	a2,1c58 <strncpy+0x21e>
    1bb2:	0005c783          	lbu	a5,0(a1)
    1bb6:	ea078be3          	beqz	a5,1a6c <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bba:	479d                	li	a5,7
    1bbc:	02c7ff63          	bgeu	a5,a2,1bfa <strncpy+0x1c0>
    1bc0:	00000897          	auipc	a7,0x0
    1bc4:	3c88b883          	ld	a7,968(a7) # 1f88 <__clone+0xae>
    1bc8:	00000817          	auipc	a6,0x0
    1bcc:	3c883803          	ld	a6,968(a6) # 1f90 <__clone+0xb6>
    1bd0:	431d                	li	t1,7
    1bd2:	6198                	ld	a4,0(a1)
    1bd4:	011707b3          	add	a5,a4,a7
    1bd8:	fff74693          	not	a3,a4
    1bdc:	8ff5                	and	a5,a5,a3
    1bde:	0107f7b3          	and	a5,a5,a6
    1be2:	ef81                	bnez	a5,1bfa <strncpy+0x1c0>
            *wd = *ws;
    1be4:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1be6:	1661                	addi	a2,a2,-8
    1be8:	05a1                	addi	a1,a1,8
    1bea:	0521                	addi	a0,a0,8
    1bec:	fec363e3          	bltu	t1,a2,1bd2 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1bf0:	e609                	bnez	a2,1bfa <strncpy+0x1c0>
    1bf2:	a08d                	j	1c54 <strncpy+0x21a>
    1bf4:	167d                	addi	a2,a2,-1
    1bf6:	0505                	addi	a0,a0,1
    1bf8:	ca01                	beqz	a2,1c08 <strncpy+0x1ce>
    1bfa:	0005c783          	lbu	a5,0(a1)
    1bfe:	0585                	addi	a1,a1,1
    1c00:	00f50023          	sb	a5,0(a0)
    1c04:	fbe5                	bnez	a5,1bf4 <strncpy+0x1ba>
        ;
tail:
    1c06:	b59d                	j	1a6c <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1c08:	8082                	ret
    1c0a:	472d                	li	a4,11
    1c0c:	bdb5                	j	1a88 <strncpy+0x4e>
    1c0e:	00778713          	addi	a4,a5,7
    1c12:	45ad                	li	a1,11
    1c14:	fff60693          	addi	a3,a2,-1
    1c18:	e6b778e3          	bgeu	a4,a1,1a88 <strncpy+0x4e>
    1c1c:	b7fd                	j	1c0a <strncpy+0x1d0>
    1c1e:	40a007b3          	neg	a5,a0
    1c22:	8832                	mv	a6,a2
    1c24:	8b9d                	andi	a5,a5,7
    1c26:	4681                	li	a3,0
    1c28:	e4060be3          	beqz	a2,1a7e <strncpy+0x44>
    1c2c:	b7cd                	j	1c0e <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c2e:	468d                	li	a3,3
    1c30:	bd75                	j	1aec <strncpy+0xb2>
    1c32:	872a                	mv	a4,a0
    1c34:	4681                	li	a3,0
    1c36:	bd5d                	j	1aec <strncpy+0xb2>
    1c38:	4685                	li	a3,1
    1c3a:	bd4d                	j	1aec <strncpy+0xb2>
    1c3c:	8082                	ret
    1c3e:	87aa                	mv	a5,a0
    1c40:	4681                	li	a3,0
    1c42:	b5f9                	j	1b10 <strncpy+0xd6>
    1c44:	4689                	li	a3,2
    1c46:	b55d                	j	1aec <strncpy+0xb2>
    1c48:	4691                	li	a3,4
    1c4a:	b54d                	j	1aec <strncpy+0xb2>
    1c4c:	4695                	li	a3,5
    1c4e:	bd79                	j	1aec <strncpy+0xb2>
    1c50:	4699                	li	a3,6
    1c52:	bd69                	j	1aec <strncpy+0xb2>
    1c54:	8082                	ret
    1c56:	8082                	ret
    1c58:	8082                	ret

0000000000001c5a <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c5a:	87aa                	mv	a5,a0
    1c5c:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c5e:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c62:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c66:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c68:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c6a:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c6e:	2501                	sext.w	a0,a0
    1c70:	8082                	ret

0000000000001c72 <openat>:
    register long a7 __asm__("a7") = n;
    1c72:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c76:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c7a:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c7e:	2501                	sext.w	a0,a0
    1c80:	8082                	ret

0000000000001c82 <fcntl>:
    register long a7 __asm__("a7") = n;
    1c82:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c84:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1c88:	2501                	sext.w	a0,a0
    1c8a:	8082                	ret

0000000000001c8c <close>:
    register long a7 __asm__("a7") = n;
    1c8c:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c90:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c94:	2501                	sext.w	a0,a0
    1c96:	8082                	ret

0000000000001c98 <read>:
    register long a7 __asm__("a7") = n;
    1c98:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c9c:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1ca0:	8082                	ret

0000000000001ca2 <write>:
    register long a7 __asm__("a7") = n;
    1ca2:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ca6:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1caa:	8082                	ret

0000000000001cac <getpid>:
    register long a7 __asm__("a7") = n;
    1cac:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1cb0:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1cb4:	2501                	sext.w	a0,a0
    1cb6:	8082                	ret

0000000000001cb8 <getppid>:
    register long a7 __asm__("a7") = n;
    1cb8:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1cbc:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cc0:	2501                	sext.w	a0,a0
    1cc2:	8082                	ret

0000000000001cc4 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cc4:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cc8:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1ccc:	2501                	sext.w	a0,a0
    1cce:	8082                	ret

0000000000001cd0 <fork>:
    register long a7 __asm__("a7") = n;
    1cd0:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cd4:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cd6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cd8:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cdc:	2501                	sext.w	a0,a0
    1cde:	8082                	ret

0000000000001ce0 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1ce0:	85b2                	mv	a1,a2
    1ce2:	863a                	mv	a2,a4
    if (stack)
    1ce4:	c191                	beqz	a1,1ce8 <clone+0x8>
	stack += stack_size;
    1ce6:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1ce8:	4781                	li	a5,0
    1cea:	4701                	li	a4,0
    1cec:	4681                	li	a3,0
    1cee:	2601                	sext.w	a2,a2
    1cf0:	a2ed                	j	1eda <__clone>

0000000000001cf2 <exit>:
    register long a7 __asm__("a7") = n;
    1cf2:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cf6:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cfa:	8082                	ret

0000000000001cfc <waitpid>:
    register long a7 __asm__("a7") = n;
    1cfc:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d00:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d02:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d06:	2501                	sext.w	a0,a0
    1d08:	8082                	ret

0000000000001d0a <exec>:
    register long a7 __asm__("a7") = n;
    1d0a:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d0e:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d12:	2501                	sext.w	a0,a0
    1d14:	8082                	ret

0000000000001d16 <execve>:
    register long a7 __asm__("a7") = n;
    1d16:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d1a:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d1e:	2501                	sext.w	a0,a0
    1d20:	8082                	ret

0000000000001d22 <times>:
    register long a7 __asm__("a7") = n;
    1d22:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d26:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d2a:	2501                	sext.w	a0,a0
    1d2c:	8082                	ret

0000000000001d2e <get_time>:

int64 get_time()
{
    1d2e:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d30:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d34:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d36:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d38:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d3c:	2501                	sext.w	a0,a0
    1d3e:	ed09                	bnez	a0,1d58 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d40:	67a2                	ld	a5,8(sp)
    1d42:	3e800713          	li	a4,1000
    1d46:	00015503          	lhu	a0,0(sp)
    1d4a:	02e7d7b3          	divu	a5,a5,a4
    1d4e:	02e50533          	mul	a0,a0,a4
    1d52:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d54:	0141                	addi	sp,sp,16
    1d56:	8082                	ret
        return -1;
    1d58:	557d                	li	a0,-1
    1d5a:	bfed                	j	1d54 <get_time+0x26>

0000000000001d5c <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d5c:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d60:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d64:	2501                	sext.w	a0,a0
    1d66:	8082                	ret

0000000000001d68 <time>:
    register long a7 __asm__("a7") = n;
    1d68:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d6c:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d70:	2501                	sext.w	a0,a0
    1d72:	8082                	ret

0000000000001d74 <sleep>:

int sleep(unsigned long long time)
{
    1d74:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d76:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d78:	850a                	mv	a0,sp
    1d7a:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d7c:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d80:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d82:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d86:	e501                	bnez	a0,1d8e <sleep+0x1a>
    return 0;
    1d88:	4501                	li	a0,0
}
    1d8a:	0141                	addi	sp,sp,16
    1d8c:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d8e:	4502                	lw	a0,0(sp)
}
    1d90:	0141                	addi	sp,sp,16
    1d92:	8082                	ret

0000000000001d94 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d94:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d98:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d9c:	2501                	sext.w	a0,a0
    1d9e:	8082                	ret

0000000000001da0 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1da0:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1da4:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1da8:	8082                	ret

0000000000001daa <munmap>:
    register long a7 __asm__("a7") = n;
    1daa:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dae:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1db2:	2501                	sext.w	a0,a0
    1db4:	8082                	ret

0000000000001db6 <wait>:

int wait(int *code)
{
    1db6:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1db8:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1dbc:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1dbe:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1dc0:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dc2:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1dc6:	2501                	sext.w	a0,a0
    1dc8:	8082                	ret

0000000000001dca <spawn>:
    register long a7 __asm__("a7") = n;
    1dca:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1dce:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dd2:	2501                	sext.w	a0,a0
    1dd4:	8082                	ret

0000000000001dd6 <mailread>:
    register long a7 __asm__("a7") = n;
    1dd6:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dda:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dde:	2501                	sext.w	a0,a0
    1de0:	8082                	ret

0000000000001de2 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1de2:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de6:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dea:	2501                	sext.w	a0,a0
    1dec:	8082                	ret

0000000000001dee <fstat>:
    register long a7 __asm__("a7") = n;
    1dee:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1df2:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1df6:	2501                	sext.w	a0,a0
    1df8:	8082                	ret

0000000000001dfa <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dfa:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dfc:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e00:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e02:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e06:	2501                	sext.w	a0,a0
    1e08:	8082                	ret

0000000000001e0a <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e0a:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e0c:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e10:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e12:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e16:	2501                	sext.w	a0,a0
    1e18:	8082                	ret

0000000000001e1a <link>:

int link(char *old_path, char *new_path)
{
    1e1a:	87aa                	mv	a5,a0
    1e1c:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e1e:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e22:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e26:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e28:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e2c:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e2e:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e32:	2501                	sext.w	a0,a0
    1e34:	8082                	ret

0000000000001e36 <unlink>:

int unlink(char *path)
{
    1e36:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e38:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e3c:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e40:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e42:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e46:	2501                	sext.w	a0,a0
    1e48:	8082                	ret

0000000000001e4a <uname>:
    register long a7 __asm__("a7") = n;
    1e4a:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e4e:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e52:	2501                	sext.w	a0,a0
    1e54:	8082                	ret

0000000000001e56 <brk>:
    register long a7 __asm__("a7") = n;
    1e56:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e5a:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e5e:	2501                	sext.w	a0,a0
    1e60:	8082                	ret

0000000000001e62 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e62:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e64:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e68:	8082                	ret

0000000000001e6a <chdir>:
    register long a7 __asm__("a7") = n;
    1e6a:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e6e:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e72:	2501                	sext.w	a0,a0
    1e74:	8082                	ret

0000000000001e76 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e76:	862e                	mv	a2,a1
    1e78:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e7a:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e7c:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e80:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e84:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e86:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e88:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e8c:	2501                	sext.w	a0,a0
    1e8e:	8082                	ret

0000000000001e90 <getdents>:
    register long a7 __asm__("a7") = n;
    1e90:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e94:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e98:	2501                	sext.w	a0,a0
    1e9a:	8082                	ret

0000000000001e9c <pipe>:
    register long a7 __asm__("a7") = n;
    1e9c:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1ea0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea2:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1ea6:	2501                	sext.w	a0,a0
    1ea8:	8082                	ret

0000000000001eaa <dup>:
    register long a7 __asm__("a7") = n;
    1eaa:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1eac:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1eb0:	2501                	sext.w	a0,a0
    1eb2:	8082                	ret

0000000000001eb4 <dup2>:
    register long a7 __asm__("a7") = n;
    1eb4:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1eb6:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eb8:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ebc:	2501                	sext.w	a0,a0
    1ebe:	8082                	ret

0000000000001ec0 <mount>:
    register long a7 __asm__("a7") = n;
    1ec0:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ec4:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ec8:	2501                	sext.w	a0,a0
    1eca:	8082                	ret

0000000000001ecc <umount>:
    register long a7 __asm__("a7") = n;
    1ecc:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ed0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed2:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ed6:	2501                	sext.w	a0,a0
    1ed8:	8082                	ret

0000000000001eda <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1eda:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1edc:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ede:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ee0:	8532                	mv	a0,a2
	mv a2, a4
    1ee2:	863a                	mv	a2,a4
	mv a3, a5
    1ee4:	86be                	mv	a3,a5
	mv a4, a6
    1ee6:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ee8:	0dc00893          	li	a7,220
	ecall
    1eec:	00000073          	ecall

	beqz a0, 1f
    1ef0:	c111                	beqz	a0,1ef4 <__clone+0x1a>
	# Parent
	ret
    1ef2:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ef4:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ef6:	6522                	ld	a0,8(sp)
	jalr a1
    1ef8:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1efa:	05d00893          	li	a7,93
	ecall
    1efe:	00000073          	ecall
