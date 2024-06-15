
/home/brightnight/OScompetition/6.13晚final_main/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/dup：     文件格式 elf64-littleriscv


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
    1004:	1101                	addi	sp,sp,-32
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	ed250513          	addi	a0,a0,-302 # 1ed8 <__clone+0x2e>
void test_dup(){
    100e:	ec06                	sd	ra,24(sp)
	TEST_START(__func__);
    1010:	2ee000ef          	jal	ra,12fe <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	f5450513          	addi	a0,a0,-172 # 1f68 <__func__.0>
    101c:	2e2000ef          	jal	ra,12fe <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	ed050513          	addi	a0,a0,-304 # 1ef0 <__clone+0x46>
    1028:	2d6000ef          	jal	ra,12fe <puts>
	int fd = dup(STDOUT);
    102c:	4505                	li	a0,1
    102e:	64d000ef          	jal	ra,1e7a <dup>
    1032:	85aa                	mv	a1,a0
	assert(fd >=0);
    1034:	02054b63          	bltz	a0,106a <test_dup+0x66>
	printf("  new fd is %d.\n", fd);
    1038:	00001517          	auipc	a0,0x1
    103c:	ee850513          	addi	a0,a0,-280 # 1f20 <__clone+0x76>
    1040:	2e0000ef          	jal	ra,1320 <printf>
	TEST_END(__func__);
    1044:	00001517          	auipc	a0,0x1
    1048:	ef450513          	addi	a0,a0,-268 # 1f38 <__clone+0x8e>
    104c:	2b2000ef          	jal	ra,12fe <puts>
    1050:	00001517          	auipc	a0,0x1
    1054:	f1850513          	addi	a0,a0,-232 # 1f68 <__func__.0>
    1058:	2a6000ef          	jal	ra,12fe <puts>
}
    105c:	60e2                	ld	ra,24(sp)
	TEST_END(__func__);
    105e:	00001517          	auipc	a0,0x1
    1062:	e9250513          	addi	a0,a0,-366 # 1ef0 <__clone+0x46>
}
    1066:	6105                	addi	sp,sp,32
	TEST_END(__func__);
    1068:	ac59                	j	12fe <puts>
    106a:	e42a                	sd	a0,8(sp)
	assert(fd >=0);
    106c:	00001517          	auipc	a0,0x1
    1070:	e9450513          	addi	a0,a0,-364 # 1f00 <__clone+0x56>
    1074:	530000ef          	jal	ra,15a4 <panic>
    1078:	65a2                	ld	a1,8(sp)
    107a:	bf7d                	j	1038 <test_dup+0x34>

000000000000107c <main>:

int main(void) {
    107c:	1141                	addi	sp,sp,-16
    107e:	e406                	sd	ra,8(sp)
	test_dup();
    1080:	f85ff0ef          	jal	ra,1004 <test_dup>
	return 0;
}
    1084:	60a2                	ld	ra,8(sp)
    1086:	4501                	li	a0,0
    1088:	0141                	addi	sp,sp,16
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
    1090:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    1092:	05a1                	addi	a1,a1,8
{
    1094:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1096:	fe7ff0ef          	jal	ra,107c <main>
    109a:	429000ef          	jal	ra,1cc2 <exit>
	return 0;
}
    109e:	60a2                	ld	ra,8(sp)
    10a0:	4501                	li	a0,0
    10a2:	0141                	addi	sp,sp,16
    10a4:	8082                	ret

00000000000010a6 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10a6:	7179                	addi	sp,sp,-48
    10a8:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10aa:	12054b63          	bltz	a0,11e0 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10ae:	02b577bb          	remuw	a5,a0,a1
    10b2:	00001617          	auipc	a2,0x1
    10b6:	ec660613          	addi	a2,a2,-314 # 1f78 <digits>
    buf[16] = 0;
    10ba:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10be:	0005871b          	sext.w	a4,a1
    10c2:	1782                	slli	a5,a5,0x20
    10c4:	9381                	srli	a5,a5,0x20
    10c6:	97b2                	add	a5,a5,a2
    10c8:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10cc:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10d0:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10d4:	1cb56363          	bltu	a0,a1,129a <printint.constprop.0+0x1f4>
        buf[i--] = digits[x % base];
    10d8:	45b9                	li	a1,14
    10da:	02e877bb          	remuw	a5,a6,a4
    10de:	1782                	slli	a5,a5,0x20
    10e0:	9381                	srli	a5,a5,0x20
    10e2:	97b2                	add	a5,a5,a2
    10e4:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10e8:	02e856bb          	divuw	a3,a6,a4
        buf[i--] = digits[x % base];
    10ec:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    10f0:	0ce86e63          	bltu	a6,a4,11cc <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    10f4:	02e6f5bb          	remuw	a1,a3,a4
    } while ((x /= base) != 0);
    10f8:	02e6d7bb          	divuw	a5,a3,a4
        buf[i--] = digits[x % base];
    10fc:	1582                	slli	a1,a1,0x20
    10fe:	9181                	srli	a1,a1,0x20
    1100:	95b2                	add	a1,a1,a2
    1102:	0005c583          	lbu	a1,0(a1)
    1106:	00b10aa3          	sb	a1,21(sp)
    } while ((x /= base) != 0);
    110a:	0007859b          	sext.w	a1,a5
    110e:	12e6ec63          	bltu	a3,a4,1246 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    1112:	02e7f6bb          	remuw	a3,a5,a4
    1116:	1682                	slli	a3,a3,0x20
    1118:	9281                	srli	a3,a3,0x20
    111a:	96b2                	add	a3,a3,a2
    111c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1120:	02e7d83b          	divuw	a6,a5,a4
        buf[i--] = digits[x % base];
    1124:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1128:	12e5e863          	bltu	a1,a4,1258 <printint.constprop.0+0x1b2>
        buf[i--] = digits[x % base];
    112c:	02e876bb          	remuw	a3,a6,a4
    1130:	1682                	slli	a3,a3,0x20
    1132:	9281                	srli	a3,a3,0x20
    1134:	96b2                	add	a3,a3,a2
    1136:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    113a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    113e:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1142:	12e86463          	bltu	a6,a4,126a <printint.constprop.0+0x1c4>
        buf[i--] = digits[x % base];
    1146:	02e5f6bb          	remuw	a3,a1,a4
    114a:	1682                	slli	a3,a3,0x20
    114c:	9281                	srli	a3,a3,0x20
    114e:	96b2                	add	a3,a3,a2
    1150:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1154:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1158:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    115c:	0ce5ec63          	bltu	a1,a4,1234 <printint.constprop.0+0x18e>
        buf[i--] = digits[x % base];
    1160:	02e876bb          	remuw	a3,a6,a4
    1164:	1682                	slli	a3,a3,0x20
    1166:	9281                	srli	a3,a3,0x20
    1168:	96b2                	add	a3,a3,a2
    116a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    116e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1172:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1176:	10e86963          	bltu	a6,a4,1288 <printint.constprop.0+0x1e2>
        buf[i--] = digits[x % base];
    117a:	02e5f6bb          	remuw	a3,a1,a4
    117e:	1682                	slli	a3,a3,0x20
    1180:	9281                	srli	a3,a3,0x20
    1182:	96b2                	add	a3,a3,a2
    1184:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1188:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    118c:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    1190:	10e5e763          	bltu	a1,a4,129e <printint.constprop.0+0x1f8>
        buf[i--] = digits[x % base];
    1194:	02e876bb          	remuw	a3,a6,a4
    1198:	1682                	slli	a3,a3,0x20
    119a:	9281                	srli	a3,a3,0x20
    119c:	96b2                	add	a3,a3,a2
    119e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11a2:	02e857bb          	divuw	a5,a6,a4
        buf[i--] = digits[x % base];
    11a6:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11aa:	10e86363          	bltu	a6,a4,12b0 <printint.constprop.0+0x20a>
        buf[i--] = digits[x % base];
    11ae:	1782                	slli	a5,a5,0x20
    11b0:	9381                	srli	a5,a5,0x20
    11b2:	97b2                	add	a5,a5,a2
    11b4:	0007c783          	lbu	a5,0(a5)
    11b8:	4599                	li	a1,6
    11ba:	00f10723          	sb	a5,14(sp)

    if (sign)
    11be:	00055763          	bgez	a0,11cc <printint.constprop.0+0x126>
        buf[i--] = '-';
    11c2:	02d00793          	li	a5,45
    11c6:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11ca:	4595                	li	a1,5
    write(f, s, l);
    11cc:	003c                	addi	a5,sp,8
    11ce:	4641                	li	a2,16
    11d0:	9e0d                	subw	a2,a2,a1
    11d2:	4505                	li	a0,1
    11d4:	95be                	add	a1,a1,a5
    11d6:	29d000ef          	jal	ra,1c72 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11da:	70a2                	ld	ra,40(sp)
    11dc:	6145                	addi	sp,sp,48
    11de:	8082                	ret
        x = -xx;
    11e0:	40a0083b          	negw	a6,a0
        buf[i--] = digits[x % base];
    11e4:	02b877bb          	remuw	a5,a6,a1
    11e8:	00001617          	auipc	a2,0x1
    11ec:	d9060613          	addi	a2,a2,-624 # 1f78 <digits>
    buf[16] = 0;
    11f0:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    11f4:	0005871b          	sext.w	a4,a1
    11f8:	1782                	slli	a5,a5,0x20
    11fa:	9381                	srli	a5,a5,0x20
    11fc:	97b2                	add	a5,a5,a2
    11fe:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1202:	02b858bb          	divuw	a7,a6,a1
        buf[i--] = digits[x % base];
    1206:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    120a:	06b86963          	bltu	a6,a1,127c <printint.constprop.0+0x1d6>
        buf[i--] = digits[x % base];
    120e:	02e8f7bb          	remuw	a5,a7,a4
    1212:	1782                	slli	a5,a5,0x20
    1214:	9381                	srli	a5,a5,0x20
    1216:	97b2                	add	a5,a5,a2
    1218:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    121c:	02e8d6bb          	divuw	a3,a7,a4
        buf[i--] = digits[x % base];
    1220:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    1224:	ece8f8e3          	bgeu	a7,a4,10f4 <printint.constprop.0+0x4e>
        buf[i--] = '-';
    1228:	02d00793          	li	a5,45
    122c:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1230:	45b5                	li	a1,13
    1232:	bf69                	j	11cc <printint.constprop.0+0x126>
    1234:	45a9                	li	a1,10
    if (sign)
    1236:	f8055be3          	bgez	a0,11cc <printint.constprop.0+0x126>
        buf[i--] = '-';
    123a:	02d00793          	li	a5,45
    123e:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1242:	45a5                	li	a1,9
    1244:	b761                	j	11cc <printint.constprop.0+0x126>
    1246:	45b5                	li	a1,13
    if (sign)
    1248:	f80552e3          	bgez	a0,11cc <printint.constprop.0+0x126>
        buf[i--] = '-';
    124c:	02d00793          	li	a5,45
    1250:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1254:	45b1                	li	a1,12
    1256:	bf9d                	j	11cc <printint.constprop.0+0x126>
    1258:	45b1                	li	a1,12
    if (sign)
    125a:	f60559e3          	bgez	a0,11cc <printint.constprop.0+0x126>
        buf[i--] = '-';
    125e:	02d00793          	li	a5,45
    1262:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1266:	45ad                	li	a1,11
    1268:	b795                	j	11cc <printint.constprop.0+0x126>
    126a:	45ad                	li	a1,11
    if (sign)
    126c:	f60550e3          	bgez	a0,11cc <printint.constprop.0+0x126>
        buf[i--] = '-';
    1270:	02d00793          	li	a5,45
    1274:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1278:	45a9                	li	a1,10
    127a:	bf89                	j	11cc <printint.constprop.0+0x126>
        buf[i--] = '-';
    127c:	02d00793          	li	a5,45
    1280:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1284:	45b9                	li	a1,14
    1286:	b799                	j	11cc <printint.constprop.0+0x126>
    1288:	45a5                	li	a1,9
    if (sign)
    128a:	f40551e3          	bgez	a0,11cc <printint.constprop.0+0x126>
        buf[i--] = '-';
    128e:	02d00793          	li	a5,45
    1292:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1296:	45a1                	li	a1,8
    1298:	bf15                	j	11cc <printint.constprop.0+0x126>
    i = 15;
    129a:	45bd                	li	a1,15
    129c:	bf05                	j	11cc <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    129e:	45a1                	li	a1,8
    if (sign)
    12a0:	f20556e3          	bgez	a0,11cc <printint.constprop.0+0x126>
        buf[i--] = '-';
    12a4:	02d00793          	li	a5,45
    12a8:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12ac:	459d                	li	a1,7
    12ae:	bf39                	j	11cc <printint.constprop.0+0x126>
    12b0:	459d                	li	a1,7
    if (sign)
    12b2:	f0055de3          	bgez	a0,11cc <printint.constprop.0+0x126>
        buf[i--] = '-';
    12b6:	02d00793          	li	a5,45
    12ba:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12be:	4599                	li	a1,6
    12c0:	b731                	j	11cc <printint.constprop.0+0x126>

00000000000012c2 <getchar>:
{
    12c2:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12c4:	00f10593          	addi	a1,sp,15
    12c8:	4605                	li	a2,1
    12ca:	4501                	li	a0,0
{
    12cc:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12ce:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12d2:	197000ef          	jal	ra,1c68 <read>
}
    12d6:	60e2                	ld	ra,24(sp)
    12d8:	00f14503          	lbu	a0,15(sp)
    12dc:	6105                	addi	sp,sp,32
    12de:	8082                	ret

00000000000012e0 <putchar>:
{
    12e0:	1101                	addi	sp,sp,-32
    12e2:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12e4:	00f10593          	addi	a1,sp,15
    12e8:	4605                	li	a2,1
    12ea:	4505                	li	a0,1
{
    12ec:	ec06                	sd	ra,24(sp)
    char byte = c;
    12ee:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12f2:	181000ef          	jal	ra,1c72 <write>
}
    12f6:	60e2                	ld	ra,24(sp)
    12f8:	2501                	sext.w	a0,a0
    12fa:	6105                	addi	sp,sp,32
    12fc:	8082                	ret

00000000000012fe <puts>:
{
    12fe:	1141                	addi	sp,sp,-16
    1300:	e406                	sd	ra,8(sp)
    1302:	e022                	sd	s0,0(sp)
    1304:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1306:	57e000ef          	jal	ra,1884 <strlen>
    130a:	862a                	mv	a2,a0
    130c:	85a2                	mv	a1,s0
    130e:	4505                	li	a0,1
    1310:	163000ef          	jal	ra,1c72 <write>
}
    1314:	60a2                	ld	ra,8(sp)
    1316:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1318:	957d                	srai	a0,a0,0x3f
    return r;
    131a:	2501                	sext.w	a0,a0
}
    131c:	0141                	addi	sp,sp,16
    131e:	8082                	ret

0000000000001320 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1320:	7171                	addi	sp,sp,-176
    1322:	fc56                	sd	s5,56(sp)
    1324:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1326:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1328:	18bc                	addi	a5,sp,120
{
    132a:	e8ca                	sd	s2,80(sp)
    132c:	e4ce                	sd	s3,72(sp)
    132e:	e0d2                	sd	s4,64(sp)
    1330:	f85a                	sd	s6,48(sp)
    1332:	f486                	sd	ra,104(sp)
    1334:	f0a2                	sd	s0,96(sp)
    1336:	eca6                	sd	s1,88(sp)
    1338:	fcae                	sd	a1,120(sp)
    133a:	e132                	sd	a2,128(sp)
    133c:	e536                	sd	a3,136(sp)
    133e:	e93a                	sd	a4,144(sp)
    1340:	f142                	sd	a6,160(sp)
    1342:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1344:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1346:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    134a:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    134e:	00001b17          	auipc	s6,0x1
    1352:	bfab0b13          	addi	s6,s6,-1030 # 1f48 <__clone+0x9e>
    buf[i++] = '0';
    1356:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    135a:	00001997          	auipc	s3,0x1
    135e:	c1e98993          	addi	s3,s3,-994 # 1f78 <digits>
        if (!*s)
    1362:	00054783          	lbu	a5,0(a0)
    1366:	16078a63          	beqz	a5,14da <printf+0x1ba>
    136a:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    136c:	19278163          	beq	a5,s2,14ee <printf+0x1ce>
    1370:	00164783          	lbu	a5,1(a2)
    1374:	0605                	addi	a2,a2,1
    1376:	fbfd                	bnez	a5,136c <printf+0x4c>
    1378:	84b2                	mv	s1,a2
        l = z - a;
    137a:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    137e:	85aa                	mv	a1,a0
    1380:	8622                	mv	a2,s0
    1382:	4505                	li	a0,1
    1384:	0ef000ef          	jal	ra,1c72 <write>
        if (l)
    1388:	18041c63          	bnez	s0,1520 <printf+0x200>
        if (s[1] == 0)
    138c:	0014c783          	lbu	a5,1(s1)
    1390:	14078563          	beqz	a5,14da <printf+0x1ba>
        switch (s[1])
    1394:	1d478063          	beq	a5,s4,1554 <printf+0x234>
    1398:	18fa6663          	bltu	s4,a5,1524 <printf+0x204>
    139c:	06400713          	li	a4,100
    13a0:	1ae78063          	beq	a5,a4,1540 <printf+0x220>
    13a4:	07000713          	li	a4,112
    13a8:	1ce79963          	bne	a5,a4,157a <printf+0x25a>
            printptr(va_arg(ap, uint64));
    13ac:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13ae:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13b2:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13b4:	631c                	ld	a5,0(a4)
    13b6:	0721                	addi	a4,a4,8
    13b8:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13ba:	00479293          	slli	t0,a5,0x4
    13be:	00879f93          	slli	t6,a5,0x8
    13c2:	00c79f13          	slli	t5,a5,0xc
    13c6:	01079e93          	slli	t4,a5,0x10
    13ca:	01479e13          	slli	t3,a5,0x14
    13ce:	01879313          	slli	t1,a5,0x18
    13d2:	01c79893          	slli	a7,a5,0x1c
    13d6:	02479813          	slli	a6,a5,0x24
    13da:	02879513          	slli	a0,a5,0x28
    13de:	02c79593          	slli	a1,a5,0x2c
    13e2:	03079693          	slli	a3,a5,0x30
    13e6:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13ea:	03c7d413          	srli	s0,a5,0x3c
    13ee:	01c7d39b          	srliw	t2,a5,0x1c
    13f2:	03c2d293          	srli	t0,t0,0x3c
    13f6:	03cfdf93          	srli	t6,t6,0x3c
    13fa:	03cf5f13          	srli	t5,t5,0x3c
    13fe:	03cede93          	srli	t4,t4,0x3c
    1402:	03ce5e13          	srli	t3,t3,0x3c
    1406:	03c35313          	srli	t1,t1,0x3c
    140a:	03c8d893          	srli	a7,a7,0x3c
    140e:	03c85813          	srli	a6,a6,0x3c
    1412:	9171                	srli	a0,a0,0x3c
    1414:	91f1                	srli	a1,a1,0x3c
    1416:	92f1                	srli	a3,a3,0x3c
    1418:	9371                	srli	a4,a4,0x3c
    141a:	96ce                	add	a3,a3,s3
    141c:	974e                	add	a4,a4,s3
    141e:	944e                	add	s0,s0,s3
    1420:	92ce                	add	t0,t0,s3
    1422:	9fce                	add	t6,t6,s3
    1424:	9f4e                	add	t5,t5,s3
    1426:	9ece                	add	t4,t4,s3
    1428:	9e4e                	add	t3,t3,s3
    142a:	934e                	add	t1,t1,s3
    142c:	98ce                	add	a7,a7,s3
    142e:	93ce                	add	t2,t2,s3
    1430:	984e                	add	a6,a6,s3
    1432:	954e                	add	a0,a0,s3
    1434:	95ce                	add	a1,a1,s3
    1436:	0006c083          	lbu	ra,0(a3)
    143a:	0002c283          	lbu	t0,0(t0)
    143e:	00074683          	lbu	a3,0(a4)
    1442:	000fcf83          	lbu	t6,0(t6)
    1446:	000f4f03          	lbu	t5,0(t5)
    144a:	000ece83          	lbu	t4,0(t4)
    144e:	000e4e03          	lbu	t3,0(t3)
    1452:	00034303          	lbu	t1,0(t1)
    1456:	0008c883          	lbu	a7,0(a7)
    145a:	0003c383          	lbu	t2,0(t2)
    145e:	00084803          	lbu	a6,0(a6)
    1462:	00054503          	lbu	a0,0(a0)
    1466:	0005c583          	lbu	a1,0(a1)
    146a:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    146e:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1472:	9371                	srli	a4,a4,0x3c
    1474:	8bbd                	andi	a5,a5,15
    1476:	974e                	add	a4,a4,s3
    1478:	97ce                	add	a5,a5,s3
    147a:	005105a3          	sb	t0,11(sp)
    147e:	01f10623          	sb	t6,12(sp)
    1482:	01e106a3          	sb	t5,13(sp)
    1486:	01d10723          	sb	t4,14(sp)
    148a:	01c107a3          	sb	t3,15(sp)
    148e:	00610823          	sb	t1,16(sp)
    1492:	011108a3          	sb	a7,17(sp)
    1496:	00710923          	sb	t2,18(sp)
    149a:	010109a3          	sb	a6,19(sp)
    149e:	00a10a23          	sb	a0,20(sp)
    14a2:	00b10aa3          	sb	a1,21(sp)
    14a6:	00110b23          	sb	ra,22(sp)
    14aa:	00d10ba3          	sb	a3,23(sp)
    14ae:	00810523          	sb	s0,10(sp)
    14b2:	00074703          	lbu	a4,0(a4)
    14b6:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14ba:	002c                	addi	a1,sp,8
    14bc:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14be:	00e10c23          	sb	a4,24(sp)
    14c2:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14c6:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14ca:	7a8000ef          	jal	ra,1c72 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14ce:	00248513          	addi	a0,s1,2
        if (!*s)
    14d2:	00054783          	lbu	a5,0(a0)
    14d6:	e8079ae3          	bnez	a5,136a <printf+0x4a>
    }
    va_end(ap);
}
    14da:	70a6                	ld	ra,104(sp)
    14dc:	7406                	ld	s0,96(sp)
    14de:	64e6                	ld	s1,88(sp)
    14e0:	6946                	ld	s2,80(sp)
    14e2:	69a6                	ld	s3,72(sp)
    14e4:	6a06                	ld	s4,64(sp)
    14e6:	7ae2                	ld	s5,56(sp)
    14e8:	7b42                	ld	s6,48(sp)
    14ea:	614d                	addi	sp,sp,176
    14ec:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14ee:	00064783          	lbu	a5,0(a2)
    14f2:	84b2                	mv	s1,a2
    14f4:	01278963          	beq	a5,s2,1506 <printf+0x1e6>
    14f8:	b549                	j	137a <printf+0x5a>
    14fa:	0024c783          	lbu	a5,2(s1)
    14fe:	0605                	addi	a2,a2,1
    1500:	0489                	addi	s1,s1,2
    1502:	e7279ce3          	bne	a5,s2,137a <printf+0x5a>
    1506:	0014c783          	lbu	a5,1(s1)
    150a:	ff2788e3          	beq	a5,s2,14fa <printf+0x1da>
        l = z - a;
    150e:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1512:	85aa                	mv	a1,a0
    1514:	8622                	mv	a2,s0
    1516:	4505                	li	a0,1
    1518:	75a000ef          	jal	ra,1c72 <write>
        if (l)
    151c:	e60408e3          	beqz	s0,138c <printf+0x6c>
    1520:	8526                	mv	a0,s1
    1522:	b581                	j	1362 <printf+0x42>
        switch (s[1])
    1524:	07800713          	li	a4,120
    1528:	04e79963          	bne	a5,a4,157a <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    152c:	6782                	ld	a5,0(sp)
    152e:	45c1                	li	a1,16
    1530:	4388                	lw	a0,0(a5)
    1532:	07a1                	addi	a5,a5,8
    1534:	e03e                	sd	a5,0(sp)
    1536:	b71ff0ef          	jal	ra,10a6 <printint.constprop.0>
        s += 2;
    153a:	00248513          	addi	a0,s1,2
    153e:	bf51                	j	14d2 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    1540:	6782                	ld	a5,0(sp)
    1542:	45a9                	li	a1,10
    1544:	4388                	lw	a0,0(a5)
    1546:	07a1                	addi	a5,a5,8
    1548:	e03e                	sd	a5,0(sp)
    154a:	b5dff0ef          	jal	ra,10a6 <printint.constprop.0>
        s += 2;
    154e:	00248513          	addi	a0,s1,2
    1552:	b741                	j	14d2 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1554:	6782                	ld	a5,0(sp)
    1556:	6380                	ld	s0,0(a5)
    1558:	07a1                	addi	a5,a5,8
    155a:	e03e                	sd	a5,0(sp)
    155c:	c031                	beqz	s0,15a0 <printf+0x280>
            l = strnlen(a, 200);
    155e:	0c800593          	li	a1,200
    1562:	8522                	mv	a0,s0
    1564:	40c000ef          	jal	ra,1970 <strnlen>
    write(f, s, l);
    1568:	0005061b          	sext.w	a2,a0
    156c:	85a2                	mv	a1,s0
    156e:	4505                	li	a0,1
    1570:	702000ef          	jal	ra,1c72 <write>
        s += 2;
    1574:	00248513          	addi	a0,s1,2
    1578:	bfa9                	j	14d2 <printf+0x1b2>
    return write(stdout, &byte, 1);
    157a:	4605                	li	a2,1
    157c:	002c                	addi	a1,sp,8
    157e:	4505                	li	a0,1
    char byte = c;
    1580:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1584:	6ee000ef          	jal	ra,1c72 <write>
    char byte = c;
    1588:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    158c:	4605                	li	a2,1
    158e:	002c                	addi	a1,sp,8
    1590:	4505                	li	a0,1
    char byte = c;
    1592:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1596:	6dc000ef          	jal	ra,1c72 <write>
        s += 2;
    159a:	00248513          	addi	a0,s1,2
    159e:	bf15                	j	14d2 <printf+0x1b2>
                a = "(null)";
    15a0:	845a                	mv	s0,s6
    15a2:	bf75                	j	155e <printf+0x23e>

00000000000015a4 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15a4:	1141                	addi	sp,sp,-16
    15a6:	e406                	sd	ra,8(sp)
    puts(m);
    15a8:	d57ff0ef          	jal	ra,12fe <puts>
    exit(-100);
}
    15ac:	60a2                	ld	ra,8(sp)
    exit(-100);
    15ae:	f9c00513          	li	a0,-100
}
    15b2:	0141                	addi	sp,sp,16
    exit(-100);
    15b4:	a739                	j	1cc2 <exit>

00000000000015b6 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15b6:	02000793          	li	a5,32
    15ba:	00f50663          	beq	a0,a5,15c6 <isspace+0x10>
    15be:	355d                	addiw	a0,a0,-9
    15c0:	00553513          	sltiu	a0,a0,5
    15c4:	8082                	ret
    15c6:	4505                	li	a0,1
}
    15c8:	8082                	ret

00000000000015ca <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15ca:	fd05051b          	addiw	a0,a0,-48
}
    15ce:	00a53513          	sltiu	a0,a0,10
    15d2:	8082                	ret

00000000000015d4 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d4:	02000613          	li	a2,32
    15d8:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15da:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15de:	ff77869b          	addiw	a3,a5,-9
    15e2:	04c78c63          	beq	a5,a2,163a <atoi+0x66>
    15e6:	0007871b          	sext.w	a4,a5
    15ea:	04d5f863          	bgeu	a1,a3,163a <atoi+0x66>
        s++;
    switch (*s)
    15ee:	02b00693          	li	a3,43
    15f2:	04d78963          	beq	a5,a3,1644 <atoi+0x70>
    15f6:	02d00693          	li	a3,45
    15fa:	06d78263          	beq	a5,a3,165e <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15fe:	fd07061b          	addiw	a2,a4,-48
    1602:	47a5                	li	a5,9
    1604:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1606:	4e01                	li	t3,0
    while (isdigit(*s))
    1608:	04c7e963          	bltu	a5,a2,165a <atoi+0x86>
    int n = 0, neg = 0;
    160c:	4501                	li	a0,0
    while (isdigit(*s))
    160e:	4825                	li	a6,9
    1610:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    1614:	0025179b          	slliw	a5,a0,0x2
    1618:	9fa9                	addw	a5,a5,a0
    161a:	fd07031b          	addiw	t1,a4,-48
    161e:	0017989b          	slliw	a7,a5,0x1
    while (isdigit(*s))
    1622:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1626:	0685                	addi	a3,a3,1
    1628:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    162c:	0006071b          	sext.w	a4,a2
    1630:	feb870e3          	bgeu	a6,a1,1610 <atoi+0x3c>
    return neg ? n : -n;
    1634:	000e0563          	beqz	t3,163e <atoi+0x6a>
}
    1638:	8082                	ret
        s++;
    163a:	0505                	addi	a0,a0,1
    163c:	bf79                	j	15da <atoi+0x6>
    return neg ? n : -n;
    163e:	4113053b          	subw	a0,t1,a7
    1642:	8082                	ret
    while (isdigit(*s))
    1644:	00154703          	lbu	a4,1(a0)
    1648:	47a5                	li	a5,9
        s++;
    164a:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    164e:	fd07061b          	addiw	a2,a4,-48
    int n = 0, neg = 0;
    1652:	4e01                	li	t3,0
    while (isdigit(*s))
    1654:	2701                	sext.w	a4,a4
    1656:	fac7fbe3          	bgeu	a5,a2,160c <atoi+0x38>
    165a:	4501                	li	a0,0
}
    165c:	8082                	ret
    while (isdigit(*s))
    165e:	00154703          	lbu	a4,1(a0)
    1662:	47a5                	li	a5,9
        s++;
    1664:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1668:	fd07061b          	addiw	a2,a4,-48
    166c:	2701                	sext.w	a4,a4
    166e:	fec7e6e3          	bltu	a5,a2,165a <atoi+0x86>
        neg = 1;
    1672:	4e05                	li	t3,1
    1674:	bf61                	j	160c <atoi+0x38>

0000000000001676 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1676:	16060d63          	beqz	a2,17f0 <memset+0x17a>
    167a:	40a007b3          	neg	a5,a0
    167e:	8b9d                	andi	a5,a5,7
    1680:	00778693          	addi	a3,a5,7
    1684:	482d                	li	a6,11
    1686:	0ff5f713          	zext.b	a4,a1
    168a:	fff60593          	addi	a1,a2,-1
    168e:	1706e263          	bltu	a3,a6,17f2 <memset+0x17c>
    1692:	16d5ea63          	bltu	a1,a3,1806 <memset+0x190>
    1696:	16078563          	beqz	a5,1800 <memset+0x18a>
    169a:	00e50023          	sb	a4,0(a0)
    169e:	4685                	li	a3,1
    16a0:	00150593          	addi	a1,a0,1
    16a4:	14d78c63          	beq	a5,a3,17fc <memset+0x186>
    16a8:	00e500a3          	sb	a4,1(a0)
    16ac:	4689                	li	a3,2
    16ae:	00250593          	addi	a1,a0,2
    16b2:	14d78d63          	beq	a5,a3,180c <memset+0x196>
    16b6:	00e50123          	sb	a4,2(a0)
    16ba:	468d                	li	a3,3
    16bc:	00350593          	addi	a1,a0,3
    16c0:	12d78b63          	beq	a5,a3,17f6 <memset+0x180>
    16c4:	00e501a3          	sb	a4,3(a0)
    16c8:	4691                	li	a3,4
    16ca:	00450593          	addi	a1,a0,4
    16ce:	14d78163          	beq	a5,a3,1810 <memset+0x19a>
    16d2:	00e50223          	sb	a4,4(a0)
    16d6:	4695                	li	a3,5
    16d8:	00550593          	addi	a1,a0,5
    16dc:	12d78c63          	beq	a5,a3,1814 <memset+0x19e>
    16e0:	00e502a3          	sb	a4,5(a0)
    16e4:	469d                	li	a3,7
    16e6:	00650593          	addi	a1,a0,6
    16ea:	12d79763          	bne	a5,a3,1818 <memset+0x1a2>
    16ee:	00750593          	addi	a1,a0,7
    16f2:	00e50323          	sb	a4,6(a0)
    16f6:	481d                	li	a6,7
    16f8:	00871693          	slli	a3,a4,0x8
    16fc:	01071893          	slli	a7,a4,0x10
    1700:	8ed9                	or	a3,a3,a4
    1702:	01871313          	slli	t1,a4,0x18
    1706:	0116e6b3          	or	a3,a3,a7
    170a:	0066e6b3          	or	a3,a3,t1
    170e:	02071893          	slli	a7,a4,0x20
    1712:	02871e13          	slli	t3,a4,0x28
    1716:	0116e6b3          	or	a3,a3,a7
    171a:	40f60333          	sub	t1,a2,a5
    171e:	03071893          	slli	a7,a4,0x30
    1722:	01c6e6b3          	or	a3,a3,t3
    1726:	0116e6b3          	or	a3,a3,a7
    172a:	03871e13          	slli	t3,a4,0x38
    172e:	97aa                	add	a5,a5,a0
    1730:	ff837893          	andi	a7,t1,-8
    1734:	01c6e6b3          	or	a3,a3,t3
    1738:	98be                	add	a7,a7,a5
    173a:	e394                	sd	a3,0(a5)
    173c:	07a1                	addi	a5,a5,8
    173e:	ff179ee3          	bne	a5,a7,173a <memset+0xc4>
    1742:	ff837893          	andi	a7,t1,-8
    1746:	011587b3          	add	a5,a1,a7
    174a:	010886bb          	addw	a3,a7,a6
    174e:	0b130663          	beq	t1,a7,17fa <memset+0x184>
    1752:	00e78023          	sb	a4,0(a5)
    1756:	0016859b          	addiw	a1,a3,1
    175a:	08c5fb63          	bgeu	a1,a2,17f0 <memset+0x17a>
    175e:	00e780a3          	sb	a4,1(a5)
    1762:	0026859b          	addiw	a1,a3,2
    1766:	08c5f563          	bgeu	a1,a2,17f0 <memset+0x17a>
    176a:	00e78123          	sb	a4,2(a5)
    176e:	0036859b          	addiw	a1,a3,3
    1772:	06c5ff63          	bgeu	a1,a2,17f0 <memset+0x17a>
    1776:	00e781a3          	sb	a4,3(a5)
    177a:	0046859b          	addiw	a1,a3,4
    177e:	06c5f963          	bgeu	a1,a2,17f0 <memset+0x17a>
    1782:	00e78223          	sb	a4,4(a5)
    1786:	0056859b          	addiw	a1,a3,5
    178a:	06c5f363          	bgeu	a1,a2,17f0 <memset+0x17a>
    178e:	00e782a3          	sb	a4,5(a5)
    1792:	0066859b          	addiw	a1,a3,6
    1796:	04c5fd63          	bgeu	a1,a2,17f0 <memset+0x17a>
    179a:	00e78323          	sb	a4,6(a5)
    179e:	0076859b          	addiw	a1,a3,7
    17a2:	04c5f763          	bgeu	a1,a2,17f0 <memset+0x17a>
    17a6:	00e783a3          	sb	a4,7(a5)
    17aa:	0086859b          	addiw	a1,a3,8
    17ae:	04c5f163          	bgeu	a1,a2,17f0 <memset+0x17a>
    17b2:	00e78423          	sb	a4,8(a5)
    17b6:	0096859b          	addiw	a1,a3,9
    17ba:	02c5fb63          	bgeu	a1,a2,17f0 <memset+0x17a>
    17be:	00e784a3          	sb	a4,9(a5)
    17c2:	00a6859b          	addiw	a1,a3,10
    17c6:	02c5f563          	bgeu	a1,a2,17f0 <memset+0x17a>
    17ca:	00e78523          	sb	a4,10(a5)
    17ce:	00b6859b          	addiw	a1,a3,11
    17d2:	00c5ff63          	bgeu	a1,a2,17f0 <memset+0x17a>
    17d6:	00e785a3          	sb	a4,11(a5)
    17da:	00c6859b          	addiw	a1,a3,12
    17de:	00c5f963          	bgeu	a1,a2,17f0 <memset+0x17a>
    17e2:	00e78623          	sb	a4,12(a5)
    17e6:	26b5                	addiw	a3,a3,13
    17e8:	00c6f463          	bgeu	a3,a2,17f0 <memset+0x17a>
    17ec:	00e786a3          	sb	a4,13(a5)
        ;
    return dest;
}
    17f0:	8082                	ret
    17f2:	46ad                	li	a3,11
    17f4:	bd79                	j	1692 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17f6:	480d                	li	a6,3
    17f8:	b701                	j	16f8 <memset+0x82>
    17fa:	8082                	ret
    17fc:	4805                	li	a6,1
    17fe:	bded                	j	16f8 <memset+0x82>
    1800:	85aa                	mv	a1,a0
    1802:	4801                	li	a6,0
    1804:	bdd5                	j	16f8 <memset+0x82>
    1806:	87aa                	mv	a5,a0
    1808:	4681                	li	a3,0
    180a:	b7a1                	j	1752 <memset+0xdc>
    180c:	4809                	li	a6,2
    180e:	b5ed                	j	16f8 <memset+0x82>
    1810:	4811                	li	a6,4
    1812:	b5dd                	j	16f8 <memset+0x82>
    1814:	4815                	li	a6,5
    1816:	b5cd                	j	16f8 <memset+0x82>
    1818:	4819                	li	a6,6
    181a:	bdf9                	j	16f8 <memset+0x82>

000000000000181c <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    181c:	00054783          	lbu	a5,0(a0)
    1820:	0005c703          	lbu	a4,0(a1)
    1824:	00e79863          	bne	a5,a4,1834 <strcmp+0x18>
    1828:	0505                	addi	a0,a0,1
    182a:	0585                	addi	a1,a1,1
    182c:	fbe5                	bnez	a5,181c <strcmp>
    182e:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1830:	9d19                	subw	a0,a0,a4
    1832:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1834:	0007851b          	sext.w	a0,a5
    1838:	bfe5                	j	1830 <strcmp+0x14>

000000000000183a <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    183a:	ca15                	beqz	a2,186e <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    183c:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1840:	167d                	addi	a2,a2,-1
    1842:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1846:	eb99                	bnez	a5,185c <strncmp+0x22>
    1848:	a815                	j	187c <strncmp+0x42>
    184a:	00a68e63          	beq	a3,a0,1866 <strncmp+0x2c>
    184e:	0505                	addi	a0,a0,1
    1850:	00f71b63          	bne	a4,a5,1866 <strncmp+0x2c>
    1854:	00054783          	lbu	a5,0(a0)
    1858:	cf89                	beqz	a5,1872 <strncmp+0x38>
    185a:	85b2                	mv	a1,a2
    185c:	0005c703          	lbu	a4,0(a1)
    1860:	00158613          	addi	a2,a1,1
    1864:	f37d                	bnez	a4,184a <strncmp+0x10>
        ;
    return *l - *r;
    1866:	0007851b          	sext.w	a0,a5
    186a:	9d19                	subw	a0,a0,a4
    186c:	8082                	ret
        return 0;
    186e:	4501                	li	a0,0
}
    1870:	8082                	ret
    return *l - *r;
    1872:	0015c703          	lbu	a4,1(a1)
    1876:	4501                	li	a0,0
    1878:	9d19                	subw	a0,a0,a4
    187a:	8082                	ret
    187c:	0005c703          	lbu	a4,0(a1)
    1880:	4501                	li	a0,0
    1882:	b7e5                	j	186a <strncmp+0x30>

0000000000001884 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1884:	00757793          	andi	a5,a0,7
    1888:	cf89                	beqz	a5,18a2 <strlen+0x1e>
    188a:	87aa                	mv	a5,a0
    188c:	a029                	j	1896 <strlen+0x12>
    188e:	0785                	addi	a5,a5,1
    1890:	0077f713          	andi	a4,a5,7
    1894:	cb01                	beqz	a4,18a4 <strlen+0x20>
        if (!*s)
    1896:	0007c703          	lbu	a4,0(a5)
    189a:	fb75                	bnez	a4,188e <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    189c:	40a78533          	sub	a0,a5,a0
}
    18a0:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18a2:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18a4:	6394                	ld	a3,0(a5)
    18a6:	00000597          	auipc	a1,0x0
    18aa:	6aa5b583          	ld	a1,1706(a1) # 1f50 <__clone+0xa6>
    18ae:	00000617          	auipc	a2,0x0
    18b2:	6aa63603          	ld	a2,1706(a2) # 1f58 <__clone+0xae>
    18b6:	a019                	j	18bc <strlen+0x38>
    18b8:	6794                	ld	a3,8(a5)
    18ba:	07a1                	addi	a5,a5,8
    18bc:	00b68733          	add	a4,a3,a1
    18c0:	fff6c693          	not	a3,a3
    18c4:	8f75                	and	a4,a4,a3
    18c6:	8f71                	and	a4,a4,a2
    18c8:	db65                	beqz	a4,18b8 <strlen+0x34>
    for (; *s; s++)
    18ca:	0007c703          	lbu	a4,0(a5)
    18ce:	d779                	beqz	a4,189c <strlen+0x18>
    18d0:	0017c703          	lbu	a4,1(a5)
    18d4:	0785                	addi	a5,a5,1
    18d6:	d379                	beqz	a4,189c <strlen+0x18>
    18d8:	0017c703          	lbu	a4,1(a5)
    18dc:	0785                	addi	a5,a5,1
    18de:	fb6d                	bnez	a4,18d0 <strlen+0x4c>
    18e0:	bf75                	j	189c <strlen+0x18>

00000000000018e2 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18e2:	00757713          	andi	a4,a0,7
{
    18e6:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18e8:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18ec:	cb19                	beqz	a4,1902 <memchr+0x20>
    18ee:	ce25                	beqz	a2,1966 <memchr+0x84>
    18f0:	0007c703          	lbu	a4,0(a5)
    18f4:	04b70e63          	beq	a4,a1,1950 <memchr+0x6e>
    18f8:	0785                	addi	a5,a5,1
    18fa:	0077f713          	andi	a4,a5,7
    18fe:	167d                	addi	a2,a2,-1
    1900:	f77d                	bnez	a4,18ee <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1902:	4501                	li	a0,0
    if (n && *s != c)
    1904:	c235                	beqz	a2,1968 <memchr+0x86>
    1906:	0007c703          	lbu	a4,0(a5)
    190a:	04b70363          	beq	a4,a1,1950 <memchr+0x6e>
        size_t k = ONES * c;
    190e:	00000517          	auipc	a0,0x0
    1912:	65253503          	ld	a0,1618(a0) # 1f60 <__clone+0xb6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1916:	471d                	li	a4,7
        size_t k = ONES * c;
    1918:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    191c:	02c77a63          	bgeu	a4,a2,1950 <memchr+0x6e>
    1920:	00000897          	auipc	a7,0x0
    1924:	6308b883          	ld	a7,1584(a7) # 1f50 <__clone+0xa6>
    1928:	00000817          	auipc	a6,0x0
    192c:	63083803          	ld	a6,1584(a6) # 1f58 <__clone+0xae>
    1930:	431d                	li	t1,7
    1932:	a029                	j	193c <memchr+0x5a>
    1934:	1661                	addi	a2,a2,-8
    1936:	07a1                	addi	a5,a5,8
    1938:	02c37963          	bgeu	t1,a2,196a <memchr+0x88>
    193c:	6398                	ld	a4,0(a5)
    193e:	8f29                	xor	a4,a4,a0
    1940:	011706b3          	add	a3,a4,a7
    1944:	fff74713          	not	a4,a4
    1948:	8f75                	and	a4,a4,a3
    194a:	01077733          	and	a4,a4,a6
    194e:	d37d                	beqz	a4,1934 <memchr+0x52>
{
    1950:	853e                	mv	a0,a5
    1952:	97b2                	add	a5,a5,a2
    1954:	a021                	j	195c <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1956:	0505                	addi	a0,a0,1
    1958:	00f50763          	beq	a0,a5,1966 <memchr+0x84>
    195c:	00054703          	lbu	a4,0(a0)
    1960:	feb71be3          	bne	a4,a1,1956 <memchr+0x74>
    1964:	8082                	ret
    return n ? (void *)s : 0;
    1966:	4501                	li	a0,0
}
    1968:	8082                	ret
    return n ? (void *)s : 0;
    196a:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    196c:	f275                	bnez	a2,1950 <memchr+0x6e>
}
    196e:	8082                	ret

0000000000001970 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1970:	1101                	addi	sp,sp,-32
    1972:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1974:	862e                	mv	a2,a1
{
    1976:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1978:	4581                	li	a1,0
{
    197a:	e426                	sd	s1,8(sp)
    197c:	ec06                	sd	ra,24(sp)
    197e:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1980:	f63ff0ef          	jal	ra,18e2 <memchr>
    return p ? p - s : n;
    1984:	c519                	beqz	a0,1992 <strnlen+0x22>
}
    1986:	60e2                	ld	ra,24(sp)
    1988:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    198a:	8d05                	sub	a0,a0,s1
}
    198c:	64a2                	ld	s1,8(sp)
    198e:	6105                	addi	sp,sp,32
    1990:	8082                	ret
    1992:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1994:	8522                	mv	a0,s0
}
    1996:	6442                	ld	s0,16(sp)
    1998:	64a2                	ld	s1,8(sp)
    199a:	6105                	addi	sp,sp,32
    199c:	8082                	ret

000000000000199e <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    199e:	00a5c7b3          	xor	a5,a1,a0
    19a2:	8b9d                	andi	a5,a5,7
    19a4:	eb95                	bnez	a5,19d8 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19a6:	0075f793          	andi	a5,a1,7
    19aa:	e7b1                	bnez	a5,19f6 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19ac:	6198                	ld	a4,0(a1)
    19ae:	00000617          	auipc	a2,0x0
    19b2:	5a263603          	ld	a2,1442(a2) # 1f50 <__clone+0xa6>
    19b6:	00000817          	auipc	a6,0x0
    19ba:	5a283803          	ld	a6,1442(a6) # 1f58 <__clone+0xae>
    19be:	a029                	j	19c8 <strcpy+0x2a>
    19c0:	05a1                	addi	a1,a1,8
    19c2:	e118                	sd	a4,0(a0)
    19c4:	6198                	ld	a4,0(a1)
    19c6:	0521                	addi	a0,a0,8
    19c8:	00c707b3          	add	a5,a4,a2
    19cc:	fff74693          	not	a3,a4
    19d0:	8ff5                	and	a5,a5,a3
    19d2:	0107f7b3          	and	a5,a5,a6
    19d6:	d7ed                	beqz	a5,19c0 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19d8:	0005c783          	lbu	a5,0(a1)
    19dc:	00f50023          	sb	a5,0(a0)
    19e0:	c785                	beqz	a5,1a08 <strcpy+0x6a>
    19e2:	0015c783          	lbu	a5,1(a1)
    19e6:	0505                	addi	a0,a0,1
    19e8:	0585                	addi	a1,a1,1
    19ea:	00f50023          	sb	a5,0(a0)
    19ee:	fbf5                	bnez	a5,19e2 <strcpy+0x44>
        ;
    return d;
}
    19f0:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19f2:	0505                	addi	a0,a0,1
    19f4:	df45                	beqz	a4,19ac <strcpy+0xe>
            if (!(*d = *s))
    19f6:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19fa:	0585                	addi	a1,a1,1
    19fc:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1a00:	00f50023          	sb	a5,0(a0)
    1a04:	f7fd                	bnez	a5,19f2 <strcpy+0x54>
}
    1a06:	8082                	ret
    1a08:	8082                	ret

0000000000001a0a <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a0a:	00a5c7b3          	xor	a5,a1,a0
    1a0e:	8b9d                	andi	a5,a5,7
    1a10:	1a079863          	bnez	a5,1bc0 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a14:	0075f793          	andi	a5,a1,7
    1a18:	16078463          	beqz	a5,1b80 <strncpy+0x176>
    1a1c:	ea01                	bnez	a2,1a2c <strncpy+0x22>
    1a1e:	a421                	j	1c26 <strncpy+0x21c>
    1a20:	167d                	addi	a2,a2,-1
    1a22:	0505                	addi	a0,a0,1
    1a24:	14070e63          	beqz	a4,1b80 <strncpy+0x176>
    1a28:	1a060863          	beqz	a2,1bd8 <strncpy+0x1ce>
    1a2c:	0005c783          	lbu	a5,0(a1)
    1a30:	0585                	addi	a1,a1,1
    1a32:	0075f713          	andi	a4,a1,7
    1a36:	00f50023          	sb	a5,0(a0)
    1a3a:	f3fd                	bnez	a5,1a20 <strncpy+0x16>
    1a3c:	4805                	li	a6,1
    1a3e:	1a061863          	bnez	a2,1bee <strncpy+0x1e4>
    1a42:	40a007b3          	neg	a5,a0
    1a46:	8b9d                	andi	a5,a5,7
    1a48:	4681                	li	a3,0
    1a4a:	18061a63          	bnez	a2,1bde <strncpy+0x1d4>
    1a4e:	00778713          	addi	a4,a5,7
    1a52:	45ad                	li	a1,11
    1a54:	18b76363          	bltu	a4,a1,1bda <strncpy+0x1d0>
    1a58:	1ae6eb63          	bltu	a3,a4,1c0e <strncpy+0x204>
    1a5c:	1a078363          	beqz	a5,1c02 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a60:	00050023          	sb	zero,0(a0)
    1a64:	4685                	li	a3,1
    1a66:	00150713          	addi	a4,a0,1
    1a6a:	18d78f63          	beq	a5,a3,1c08 <strncpy+0x1fe>
    1a6e:	000500a3          	sb	zero,1(a0)
    1a72:	4689                	li	a3,2
    1a74:	00250713          	addi	a4,a0,2
    1a78:	18d78e63          	beq	a5,a3,1c14 <strncpy+0x20a>
    1a7c:	00050123          	sb	zero,2(a0)
    1a80:	468d                	li	a3,3
    1a82:	00350713          	addi	a4,a0,3
    1a86:	16d78c63          	beq	a5,a3,1bfe <strncpy+0x1f4>
    1a8a:	000501a3          	sb	zero,3(a0)
    1a8e:	4691                	li	a3,4
    1a90:	00450713          	addi	a4,a0,4
    1a94:	18d78263          	beq	a5,a3,1c18 <strncpy+0x20e>
    1a98:	00050223          	sb	zero,4(a0)
    1a9c:	4695                	li	a3,5
    1a9e:	00550713          	addi	a4,a0,5
    1aa2:	16d78d63          	beq	a5,a3,1c1c <strncpy+0x212>
    1aa6:	000502a3          	sb	zero,5(a0)
    1aaa:	469d                	li	a3,7
    1aac:	00650713          	addi	a4,a0,6
    1ab0:	16d79863          	bne	a5,a3,1c20 <strncpy+0x216>
    1ab4:	00750713          	addi	a4,a0,7
    1ab8:	00050323          	sb	zero,6(a0)
    1abc:	40f80833          	sub	a6,a6,a5
    1ac0:	ff887593          	andi	a1,a6,-8
    1ac4:	97aa                	add	a5,a5,a0
    1ac6:	95be                	add	a1,a1,a5
    1ac8:	0007b023          	sd	zero,0(a5)
    1acc:	07a1                	addi	a5,a5,8
    1ace:	feb79de3          	bne	a5,a1,1ac8 <strncpy+0xbe>
    1ad2:	ff887593          	andi	a1,a6,-8
    1ad6:	9ead                	addw	a3,a3,a1
    1ad8:	00b707b3          	add	a5,a4,a1
    1adc:	12b80863          	beq	a6,a1,1c0c <strncpy+0x202>
    1ae0:	00078023          	sb	zero,0(a5)
    1ae4:	0016871b          	addiw	a4,a3,1
    1ae8:	0ec77863          	bgeu	a4,a2,1bd8 <strncpy+0x1ce>
    1aec:	000780a3          	sb	zero,1(a5)
    1af0:	0026871b          	addiw	a4,a3,2
    1af4:	0ec77263          	bgeu	a4,a2,1bd8 <strncpy+0x1ce>
    1af8:	00078123          	sb	zero,2(a5)
    1afc:	0036871b          	addiw	a4,a3,3
    1b00:	0cc77c63          	bgeu	a4,a2,1bd8 <strncpy+0x1ce>
    1b04:	000781a3          	sb	zero,3(a5)
    1b08:	0046871b          	addiw	a4,a3,4
    1b0c:	0cc77663          	bgeu	a4,a2,1bd8 <strncpy+0x1ce>
    1b10:	00078223          	sb	zero,4(a5)
    1b14:	0056871b          	addiw	a4,a3,5
    1b18:	0cc77063          	bgeu	a4,a2,1bd8 <strncpy+0x1ce>
    1b1c:	000782a3          	sb	zero,5(a5)
    1b20:	0066871b          	addiw	a4,a3,6
    1b24:	0ac77a63          	bgeu	a4,a2,1bd8 <strncpy+0x1ce>
    1b28:	00078323          	sb	zero,6(a5)
    1b2c:	0076871b          	addiw	a4,a3,7
    1b30:	0ac77463          	bgeu	a4,a2,1bd8 <strncpy+0x1ce>
    1b34:	000783a3          	sb	zero,7(a5)
    1b38:	0086871b          	addiw	a4,a3,8
    1b3c:	08c77e63          	bgeu	a4,a2,1bd8 <strncpy+0x1ce>
    1b40:	00078423          	sb	zero,8(a5)
    1b44:	0096871b          	addiw	a4,a3,9
    1b48:	08c77863          	bgeu	a4,a2,1bd8 <strncpy+0x1ce>
    1b4c:	000784a3          	sb	zero,9(a5)
    1b50:	00a6871b          	addiw	a4,a3,10
    1b54:	08c77263          	bgeu	a4,a2,1bd8 <strncpy+0x1ce>
    1b58:	00078523          	sb	zero,10(a5)
    1b5c:	00b6871b          	addiw	a4,a3,11
    1b60:	06c77c63          	bgeu	a4,a2,1bd8 <strncpy+0x1ce>
    1b64:	000785a3          	sb	zero,11(a5)
    1b68:	00c6871b          	addiw	a4,a3,12
    1b6c:	06c77663          	bgeu	a4,a2,1bd8 <strncpy+0x1ce>
    1b70:	00078623          	sb	zero,12(a5)
    1b74:	26b5                	addiw	a3,a3,13
    1b76:	06c6f163          	bgeu	a3,a2,1bd8 <strncpy+0x1ce>
    1b7a:	000786a3          	sb	zero,13(a5)
    1b7e:	8082                	ret
            ;
        if (!n || !*s)
    1b80:	c645                	beqz	a2,1c28 <strncpy+0x21e>
    1b82:	0005c783          	lbu	a5,0(a1)
    1b86:	ea078be3          	beqz	a5,1a3c <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b8a:	479d                	li	a5,7
    1b8c:	02c7ff63          	bgeu	a5,a2,1bca <strncpy+0x1c0>
    1b90:	00000897          	auipc	a7,0x0
    1b94:	3c08b883          	ld	a7,960(a7) # 1f50 <__clone+0xa6>
    1b98:	00000817          	auipc	a6,0x0
    1b9c:	3c083803          	ld	a6,960(a6) # 1f58 <__clone+0xae>
    1ba0:	431d                	li	t1,7
    1ba2:	6198                	ld	a4,0(a1)
    1ba4:	011707b3          	add	a5,a4,a7
    1ba8:	fff74693          	not	a3,a4
    1bac:	8ff5                	and	a5,a5,a3
    1bae:	0107f7b3          	and	a5,a5,a6
    1bb2:	ef81                	bnez	a5,1bca <strncpy+0x1c0>
            *wd = *ws;
    1bb4:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bb6:	1661                	addi	a2,a2,-8
    1bb8:	05a1                	addi	a1,a1,8
    1bba:	0521                	addi	a0,a0,8
    1bbc:	fec363e3          	bltu	t1,a2,1ba2 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1bc0:	e609                	bnez	a2,1bca <strncpy+0x1c0>
    1bc2:	a08d                	j	1c24 <strncpy+0x21a>
    1bc4:	167d                	addi	a2,a2,-1
    1bc6:	0505                	addi	a0,a0,1
    1bc8:	ca01                	beqz	a2,1bd8 <strncpy+0x1ce>
    1bca:	0005c783          	lbu	a5,0(a1)
    1bce:	0585                	addi	a1,a1,1
    1bd0:	00f50023          	sb	a5,0(a0)
    1bd4:	fbe5                	bnez	a5,1bc4 <strncpy+0x1ba>
        ;
tail:
    1bd6:	b59d                	j	1a3c <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1bd8:	8082                	ret
    1bda:	472d                	li	a4,11
    1bdc:	bdb5                	j	1a58 <strncpy+0x4e>
    1bde:	00778713          	addi	a4,a5,7
    1be2:	45ad                	li	a1,11
    1be4:	fff60693          	addi	a3,a2,-1
    1be8:	e6b778e3          	bgeu	a4,a1,1a58 <strncpy+0x4e>
    1bec:	b7fd                	j	1bda <strncpy+0x1d0>
    1bee:	40a007b3          	neg	a5,a0
    1bf2:	8832                	mv	a6,a2
    1bf4:	8b9d                	andi	a5,a5,7
    1bf6:	4681                	li	a3,0
    1bf8:	e4060be3          	beqz	a2,1a4e <strncpy+0x44>
    1bfc:	b7cd                	j	1bde <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bfe:	468d                	li	a3,3
    1c00:	bd75                	j	1abc <strncpy+0xb2>
    1c02:	872a                	mv	a4,a0
    1c04:	4681                	li	a3,0
    1c06:	bd5d                	j	1abc <strncpy+0xb2>
    1c08:	4685                	li	a3,1
    1c0a:	bd4d                	j	1abc <strncpy+0xb2>
    1c0c:	8082                	ret
    1c0e:	87aa                	mv	a5,a0
    1c10:	4681                	li	a3,0
    1c12:	b5f9                	j	1ae0 <strncpy+0xd6>
    1c14:	4689                	li	a3,2
    1c16:	b55d                	j	1abc <strncpy+0xb2>
    1c18:	4691                	li	a3,4
    1c1a:	b54d                	j	1abc <strncpy+0xb2>
    1c1c:	4695                	li	a3,5
    1c1e:	bd79                	j	1abc <strncpy+0xb2>
    1c20:	4699                	li	a3,6
    1c22:	bd69                	j	1abc <strncpy+0xb2>
    1c24:	8082                	ret
    1c26:	8082                	ret
    1c28:	8082                	ret

0000000000001c2a <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c2a:	87aa                	mv	a5,a0
    1c2c:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c2e:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c32:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c36:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c38:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c3a:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c3e:	2501                	sext.w	a0,a0
    1c40:	8082                	ret

0000000000001c42 <openat>:
    register long a7 __asm__("a7") = n;
    1c42:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c46:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c4a:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c4e:	2501                	sext.w	a0,a0
    1c50:	8082                	ret

0000000000001c52 <fcntl>:
    register long a7 __asm__("a7") = n;
    1c52:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c54:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1c58:	2501                	sext.w	a0,a0
    1c5a:	8082                	ret

0000000000001c5c <close>:
    register long a7 __asm__("a7") = n;
    1c5c:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c60:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c64:	2501                	sext.w	a0,a0
    1c66:	8082                	ret

0000000000001c68 <read>:
    register long a7 __asm__("a7") = n;
    1c68:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c6c:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c70:	8082                	ret

0000000000001c72 <write>:
    register long a7 __asm__("a7") = n;
    1c72:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c76:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c7a:	8082                	ret

0000000000001c7c <getpid>:
    register long a7 __asm__("a7") = n;
    1c7c:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c80:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c84:	2501                	sext.w	a0,a0
    1c86:	8082                	ret

0000000000001c88 <getppid>:
    register long a7 __asm__("a7") = n;
    1c88:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c8c:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c90:	2501                	sext.w	a0,a0
    1c92:	8082                	ret

0000000000001c94 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c94:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c98:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c9c:	2501                	sext.w	a0,a0
    1c9e:	8082                	ret

0000000000001ca0 <fork>:
    register long a7 __asm__("a7") = n;
    1ca0:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1ca4:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1ca6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ca8:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cac:	2501                	sext.w	a0,a0
    1cae:	8082                	ret

0000000000001cb0 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cb0:	85b2                	mv	a1,a2
    1cb2:	863a                	mv	a2,a4
    if (stack)
    1cb4:	c191                	beqz	a1,1cb8 <clone+0x8>
	stack += stack_size;
    1cb6:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cb8:	4781                	li	a5,0
    1cba:	4701                	li	a4,0
    1cbc:	4681                	li	a3,0
    1cbe:	2601                	sext.w	a2,a2
    1cc0:	a2ed                	j	1eaa <__clone>

0000000000001cc2 <exit>:
    register long a7 __asm__("a7") = n;
    1cc2:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cc6:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cca:	8082                	ret

0000000000001ccc <waitpid>:
    register long a7 __asm__("a7") = n;
    1ccc:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cd0:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cd2:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cd6:	2501                	sext.w	a0,a0
    1cd8:	8082                	ret

0000000000001cda <exec>:
    register long a7 __asm__("a7") = n;
    1cda:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cde:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1ce2:	2501                	sext.w	a0,a0
    1ce4:	8082                	ret

0000000000001ce6 <execve>:
    register long a7 __asm__("a7") = n;
    1ce6:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cea:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cee:	2501                	sext.w	a0,a0
    1cf0:	8082                	ret

0000000000001cf2 <times>:
    register long a7 __asm__("a7") = n;
    1cf2:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cf6:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1cfa:	2501                	sext.w	a0,a0
    1cfc:	8082                	ret

0000000000001cfe <get_time>:

int64 get_time()
{
    1cfe:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d00:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d04:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d06:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d08:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d0c:	2501                	sext.w	a0,a0
    1d0e:	ed09                	bnez	a0,1d28 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d10:	67a2                	ld	a5,8(sp)
    1d12:	3e800713          	li	a4,1000
    1d16:	00015503          	lhu	a0,0(sp)
    1d1a:	02e7d7b3          	divu	a5,a5,a4
    1d1e:	02e50533          	mul	a0,a0,a4
    1d22:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d24:	0141                	addi	sp,sp,16
    1d26:	8082                	ret
        return -1;
    1d28:	557d                	li	a0,-1
    1d2a:	bfed                	j	1d24 <get_time+0x26>

0000000000001d2c <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d2c:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d30:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d34:	2501                	sext.w	a0,a0
    1d36:	8082                	ret

0000000000001d38 <time>:
    register long a7 __asm__("a7") = n;
    1d38:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d3c:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d40:	2501                	sext.w	a0,a0
    1d42:	8082                	ret

0000000000001d44 <sleep>:

int sleep(unsigned long long time)
{
    1d44:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d46:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d48:	850a                	mv	a0,sp
    1d4a:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d4c:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d50:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d52:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d56:	e501                	bnez	a0,1d5e <sleep+0x1a>
    return 0;
    1d58:	4501                	li	a0,0
}
    1d5a:	0141                	addi	sp,sp,16
    1d5c:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d5e:	4502                	lw	a0,0(sp)
}
    1d60:	0141                	addi	sp,sp,16
    1d62:	8082                	ret

0000000000001d64 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d64:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d68:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d6c:	2501                	sext.w	a0,a0
    1d6e:	8082                	ret

0000000000001d70 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d70:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d74:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d78:	8082                	ret

0000000000001d7a <munmap>:
    register long a7 __asm__("a7") = n;
    1d7a:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d7e:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d82:	2501                	sext.w	a0,a0
    1d84:	8082                	ret

0000000000001d86 <wait>:

int wait(int *code)
{
    1d86:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d88:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d8c:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d8e:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d90:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d92:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d96:	2501                	sext.w	a0,a0
    1d98:	8082                	ret

0000000000001d9a <spawn>:
    register long a7 __asm__("a7") = n;
    1d9a:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d9e:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1da2:	2501                	sext.w	a0,a0
    1da4:	8082                	ret

0000000000001da6 <mailread>:
    register long a7 __asm__("a7") = n;
    1da6:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1daa:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dae:	2501                	sext.w	a0,a0
    1db0:	8082                	ret

0000000000001db2 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1db2:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1db6:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dba:	2501                	sext.w	a0,a0
    1dbc:	8082                	ret

0000000000001dbe <fstat>:
    register long a7 __asm__("a7") = n;
    1dbe:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc2:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dc6:	2501                	sext.w	a0,a0
    1dc8:	8082                	ret

0000000000001dca <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dca:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dcc:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dd0:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dd2:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1dd6:	2501                	sext.w	a0,a0
    1dd8:	8082                	ret

0000000000001dda <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1dda:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ddc:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1de0:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de2:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1de6:	2501                	sext.w	a0,a0
    1de8:	8082                	ret

0000000000001dea <link>:

int link(char *old_path, char *new_path)
{
    1dea:	87aa                	mv	a5,a0
    1dec:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1dee:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1df2:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1df6:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1df8:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1dfc:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dfe:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e02:	2501                	sext.w	a0,a0
    1e04:	8082                	ret

0000000000001e06 <unlink>:

int unlink(char *path)
{
    1e06:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e08:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e0c:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e10:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e12:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e16:	2501                	sext.w	a0,a0
    1e18:	8082                	ret

0000000000001e1a <uname>:
    register long a7 __asm__("a7") = n;
    1e1a:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e1e:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e22:	2501                	sext.w	a0,a0
    1e24:	8082                	ret

0000000000001e26 <brk>:
    register long a7 __asm__("a7") = n;
    1e26:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e2a:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e2e:	2501                	sext.w	a0,a0
    1e30:	8082                	ret

0000000000001e32 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e32:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e34:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e38:	8082                	ret

0000000000001e3a <chdir>:
    register long a7 __asm__("a7") = n;
    1e3a:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e3e:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e42:	2501                	sext.w	a0,a0
    1e44:	8082                	ret

0000000000001e46 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e46:	862e                	mv	a2,a1
    1e48:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e4a:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e4c:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e50:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e54:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e56:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e58:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e5c:	2501                	sext.w	a0,a0
    1e5e:	8082                	ret

0000000000001e60 <getdents>:
    register long a7 __asm__("a7") = n;
    1e60:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e64:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e68:	2501                	sext.w	a0,a0
    1e6a:	8082                	ret

0000000000001e6c <pipe>:
    register long a7 __asm__("a7") = n;
    1e6c:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e70:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e72:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e76:	2501                	sext.w	a0,a0
    1e78:	8082                	ret

0000000000001e7a <dup>:
    register long a7 __asm__("a7") = n;
    1e7a:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e7c:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e80:	2501                	sext.w	a0,a0
    1e82:	8082                	ret

0000000000001e84 <dup2>:
    register long a7 __asm__("a7") = n;
    1e84:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e86:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e88:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e8c:	2501                	sext.w	a0,a0
    1e8e:	8082                	ret

0000000000001e90 <mount>:
    register long a7 __asm__("a7") = n;
    1e90:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e94:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e98:	2501                	sext.w	a0,a0
    1e9a:	8082                	ret

0000000000001e9c <umount>:
    register long a7 __asm__("a7") = n;
    1e9c:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ea0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea2:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ea6:	2501                	sext.w	a0,a0
    1ea8:	8082                	ret

0000000000001eaa <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1eaa:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1eac:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1eae:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1eb0:	8532                	mv	a0,a2
	mv a2, a4
    1eb2:	863a                	mv	a2,a4
	mv a3, a5
    1eb4:	86be                	mv	a3,a5
	mv a4, a6
    1eb6:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1eb8:	0dc00893          	li	a7,220
	ecall
    1ebc:	00000073          	ecall

	beqz a0, 1f
    1ec0:	c111                	beqz	a0,1ec4 <__clone+0x1a>
	# Parent
	ret
    1ec2:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ec4:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ec6:	6522                	ld	a0,8(sp)
	jalr a1
    1ec8:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1eca:	05d00893          	li	a7,93
	ecall
    1ece:	00000073          	ecall
