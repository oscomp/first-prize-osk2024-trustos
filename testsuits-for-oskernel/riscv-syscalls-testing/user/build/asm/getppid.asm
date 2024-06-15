
/home/brightnight/OScompetition/6.13晚final_main/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/getppid：     文件格式 elf64-littleriscv


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
    1004:	1141                	addi	sp,sp,-16
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	eba50513          	addi	a0,a0,-326 # 1ec0 <__clone+0x2e>
{
    100e:	e406                	sd	ra,8(sp)
    TEST_START(__func__);
    1010:	2e8000ef          	jal	ra,12f8 <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	f3c50513          	addi	a0,a0,-196 # 1f50 <__func__.0>
    101c:	2dc000ef          	jal	ra,12f8 <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	eb850513          	addi	a0,a0,-328 # 1ed8 <__clone+0x46>
    1028:	2d0000ef          	jal	ra,12f8 <puts>
    pid_t ppid = getppid();
    102c:	445000ef          	jal	ra,1c70 <getppid>
    if(ppid > 0) printf("  getppid success. ppid : %d\n", ppid);
    1030:	02a05c63          	blez	a0,1068 <test_getppid+0x64>
    1034:	85aa                	mv	a1,a0
    1036:	00001517          	auipc	a0,0x1
    103a:	eb250513          	addi	a0,a0,-334 # 1ee8 <__clone+0x56>
    103e:	2dc000ef          	jal	ra,131a <printf>
    else printf("  getppid error.\n");
    TEST_END(__func__);
    1042:	00001517          	auipc	a0,0x1
    1046:	ede50513          	addi	a0,a0,-290 # 1f20 <__clone+0x8e>
    104a:	2ae000ef          	jal	ra,12f8 <puts>
    104e:	00001517          	auipc	a0,0x1
    1052:	f0250513          	addi	a0,a0,-254 # 1f50 <__func__.0>
    1056:	2a2000ef          	jal	ra,12f8 <puts>
}
    105a:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    105c:	00001517          	auipc	a0,0x1
    1060:	e7c50513          	addi	a0,a0,-388 # 1ed8 <__clone+0x46>
}
    1064:	0141                	addi	sp,sp,16
    TEST_END(__func__);
    1066:	ac49                	j	12f8 <puts>
    else printf("  getppid error.\n");
    1068:	00001517          	auipc	a0,0x1
    106c:	ea050513          	addi	a0,a0,-352 # 1f08 <__clone+0x76>
    1070:	2aa000ef          	jal	ra,131a <printf>
    1074:	b7f9                	j	1042 <test_getppid+0x3e>

0000000000001076 <main>:

int main(void) {
    1076:	1141                	addi	sp,sp,-16
    1078:	e406                	sd	ra,8(sp)
	test_getppid();
    107a:	f8bff0ef          	jal	ra,1004 <test_getppid>
	return 0;
}
    107e:	60a2                	ld	ra,8(sp)
    1080:	4501                	li	a0,0
    1082:	0141                	addi	sp,sp,16
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
    108a:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    108c:	05a1                	addi	a1,a1,8
{
    108e:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1090:	fe7ff0ef          	jal	ra,1076 <main>
    1094:	417000ef          	jal	ra,1caa <exit>
	return 0;
}
    1098:	60a2                	ld	ra,8(sp)
    109a:	4501                	li	a0,0
    109c:	0141                	addi	sp,sp,16
    109e:	8082                	ret

00000000000010a0 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10a0:	7179                	addi	sp,sp,-48
    10a2:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10a4:	12054b63          	bltz	a0,11da <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10a8:	02b577bb          	remuw	a5,a0,a1
    10ac:	00001617          	auipc	a2,0x1
    10b0:	eb460613          	addi	a2,a2,-332 # 1f60 <digits>
    buf[16] = 0;
    10b4:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10b8:	0005871b          	sext.w	a4,a1
    10bc:	1782                	slli	a5,a5,0x20
    10be:	9381                	srli	a5,a5,0x20
    10c0:	97b2                	add	a5,a5,a2
    10c2:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10c6:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10ca:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10ce:	1cb56363          	bltu	a0,a1,1294 <printint.constprop.0+0x1f4>
        buf[i--] = digits[x % base];
    10d2:	45b9                	li	a1,14
    10d4:	02e877bb          	remuw	a5,a6,a4
    10d8:	1782                	slli	a5,a5,0x20
    10da:	9381                	srli	a5,a5,0x20
    10dc:	97b2                	add	a5,a5,a2
    10de:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10e2:	02e856bb          	divuw	a3,a6,a4
        buf[i--] = digits[x % base];
    10e6:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    10ea:	0ce86e63          	bltu	a6,a4,11c6 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    10ee:	02e6f5bb          	remuw	a1,a3,a4
    } while ((x /= base) != 0);
    10f2:	02e6d7bb          	divuw	a5,a3,a4
        buf[i--] = digits[x % base];
    10f6:	1582                	slli	a1,a1,0x20
    10f8:	9181                	srli	a1,a1,0x20
    10fa:	95b2                	add	a1,a1,a2
    10fc:	0005c583          	lbu	a1,0(a1)
    1100:	00b10aa3          	sb	a1,21(sp)
    } while ((x /= base) != 0);
    1104:	0007859b          	sext.w	a1,a5
    1108:	12e6ec63          	bltu	a3,a4,1240 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    110c:	02e7f6bb          	remuw	a3,a5,a4
    1110:	1682                	slli	a3,a3,0x20
    1112:	9281                	srli	a3,a3,0x20
    1114:	96b2                	add	a3,a3,a2
    1116:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    111a:	02e7d83b          	divuw	a6,a5,a4
        buf[i--] = digits[x % base];
    111e:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1122:	12e5e863          	bltu	a1,a4,1252 <printint.constprop.0+0x1b2>
        buf[i--] = digits[x % base];
    1126:	02e876bb          	remuw	a3,a6,a4
    112a:	1682                	slli	a3,a3,0x20
    112c:	9281                	srli	a3,a3,0x20
    112e:	96b2                	add	a3,a3,a2
    1130:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1134:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1138:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    113c:	12e86463          	bltu	a6,a4,1264 <printint.constprop.0+0x1c4>
        buf[i--] = digits[x % base];
    1140:	02e5f6bb          	remuw	a3,a1,a4
    1144:	1682                	slli	a3,a3,0x20
    1146:	9281                	srli	a3,a3,0x20
    1148:	96b2                	add	a3,a3,a2
    114a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    114e:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1152:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    1156:	0ce5ec63          	bltu	a1,a4,122e <printint.constprop.0+0x18e>
        buf[i--] = digits[x % base];
    115a:	02e876bb          	remuw	a3,a6,a4
    115e:	1682                	slli	a3,a3,0x20
    1160:	9281                	srli	a3,a3,0x20
    1162:	96b2                	add	a3,a3,a2
    1164:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1168:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    116c:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1170:	10e86963          	bltu	a6,a4,1282 <printint.constprop.0+0x1e2>
        buf[i--] = digits[x % base];
    1174:	02e5f6bb          	remuw	a3,a1,a4
    1178:	1682                	slli	a3,a3,0x20
    117a:	9281                	srli	a3,a3,0x20
    117c:	96b2                	add	a3,a3,a2
    117e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1182:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1186:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    118a:	10e5e763          	bltu	a1,a4,1298 <printint.constprop.0+0x1f8>
        buf[i--] = digits[x % base];
    118e:	02e876bb          	remuw	a3,a6,a4
    1192:	1682                	slli	a3,a3,0x20
    1194:	9281                	srli	a3,a3,0x20
    1196:	96b2                	add	a3,a3,a2
    1198:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    119c:	02e857bb          	divuw	a5,a6,a4
        buf[i--] = digits[x % base];
    11a0:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11a4:	10e86363          	bltu	a6,a4,12aa <printint.constprop.0+0x20a>
        buf[i--] = digits[x % base];
    11a8:	1782                	slli	a5,a5,0x20
    11aa:	9381                	srli	a5,a5,0x20
    11ac:	97b2                	add	a5,a5,a2
    11ae:	0007c783          	lbu	a5,0(a5)
    11b2:	4599                	li	a1,6
    11b4:	00f10723          	sb	a5,14(sp)

    if (sign)
    11b8:	00055763          	bgez	a0,11c6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    11bc:	02d00793          	li	a5,45
    11c0:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11c4:	4595                	li	a1,5
    write(f, s, l);
    11c6:	003c                	addi	a5,sp,8
    11c8:	4641                	li	a2,16
    11ca:	9e0d                	subw	a2,a2,a1
    11cc:	4505                	li	a0,1
    11ce:	95be                	add	a1,a1,a5
    11d0:	28b000ef          	jal	ra,1c5a <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11d4:	70a2                	ld	ra,40(sp)
    11d6:	6145                	addi	sp,sp,48
    11d8:	8082                	ret
        x = -xx;
    11da:	40a0083b          	negw	a6,a0
        buf[i--] = digits[x % base];
    11de:	02b877bb          	remuw	a5,a6,a1
    11e2:	00001617          	auipc	a2,0x1
    11e6:	d7e60613          	addi	a2,a2,-642 # 1f60 <digits>
    buf[16] = 0;
    11ea:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    11ee:	0005871b          	sext.w	a4,a1
    11f2:	1782                	slli	a5,a5,0x20
    11f4:	9381                	srli	a5,a5,0x20
    11f6:	97b2                	add	a5,a5,a2
    11f8:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    11fc:	02b858bb          	divuw	a7,a6,a1
        buf[i--] = digits[x % base];
    1200:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1204:	06b86963          	bltu	a6,a1,1276 <printint.constprop.0+0x1d6>
        buf[i--] = digits[x % base];
    1208:	02e8f7bb          	remuw	a5,a7,a4
    120c:	1782                	slli	a5,a5,0x20
    120e:	9381                	srli	a5,a5,0x20
    1210:	97b2                	add	a5,a5,a2
    1212:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1216:	02e8d6bb          	divuw	a3,a7,a4
        buf[i--] = digits[x % base];
    121a:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    121e:	ece8f8e3          	bgeu	a7,a4,10ee <printint.constprop.0+0x4e>
        buf[i--] = '-';
    1222:	02d00793          	li	a5,45
    1226:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    122a:	45b5                	li	a1,13
    122c:	bf69                	j	11c6 <printint.constprop.0+0x126>
    122e:	45a9                	li	a1,10
    if (sign)
    1230:	f8055be3          	bgez	a0,11c6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1234:	02d00793          	li	a5,45
    1238:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    123c:	45a5                	li	a1,9
    123e:	b761                	j	11c6 <printint.constprop.0+0x126>
    1240:	45b5                	li	a1,13
    if (sign)
    1242:	f80552e3          	bgez	a0,11c6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1246:	02d00793          	li	a5,45
    124a:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    124e:	45b1                	li	a1,12
    1250:	bf9d                	j	11c6 <printint.constprop.0+0x126>
    1252:	45b1                	li	a1,12
    if (sign)
    1254:	f60559e3          	bgez	a0,11c6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1258:	02d00793          	li	a5,45
    125c:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1260:	45ad                	li	a1,11
    1262:	b795                	j	11c6 <printint.constprop.0+0x126>
    1264:	45ad                	li	a1,11
    if (sign)
    1266:	f60550e3          	bgez	a0,11c6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    126a:	02d00793          	li	a5,45
    126e:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1272:	45a9                	li	a1,10
    1274:	bf89                	j	11c6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1276:	02d00793          	li	a5,45
    127a:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    127e:	45b9                	li	a1,14
    1280:	b799                	j	11c6 <printint.constprop.0+0x126>
    1282:	45a5                	li	a1,9
    if (sign)
    1284:	f40551e3          	bgez	a0,11c6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1288:	02d00793          	li	a5,45
    128c:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1290:	45a1                	li	a1,8
    1292:	bf15                	j	11c6 <printint.constprop.0+0x126>
    i = 15;
    1294:	45bd                	li	a1,15
    1296:	bf05                	j	11c6 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    1298:	45a1                	li	a1,8
    if (sign)
    129a:	f20556e3          	bgez	a0,11c6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    129e:	02d00793          	li	a5,45
    12a2:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12a6:	459d                	li	a1,7
    12a8:	bf39                	j	11c6 <printint.constprop.0+0x126>
    12aa:	459d                	li	a1,7
    if (sign)
    12ac:	f0055de3          	bgez	a0,11c6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12b0:	02d00793          	li	a5,45
    12b4:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12b8:	4599                	li	a1,6
    12ba:	b731                	j	11c6 <printint.constprop.0+0x126>

00000000000012bc <getchar>:
{
    12bc:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12be:	00f10593          	addi	a1,sp,15
    12c2:	4605                	li	a2,1
    12c4:	4501                	li	a0,0
{
    12c6:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12c8:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12cc:	185000ef          	jal	ra,1c50 <read>
}
    12d0:	60e2                	ld	ra,24(sp)
    12d2:	00f14503          	lbu	a0,15(sp)
    12d6:	6105                	addi	sp,sp,32
    12d8:	8082                	ret

00000000000012da <putchar>:
{
    12da:	1101                	addi	sp,sp,-32
    12dc:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12de:	00f10593          	addi	a1,sp,15
    12e2:	4605                	li	a2,1
    12e4:	4505                	li	a0,1
{
    12e6:	ec06                	sd	ra,24(sp)
    char byte = c;
    12e8:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12ec:	16f000ef          	jal	ra,1c5a <write>
}
    12f0:	60e2                	ld	ra,24(sp)
    12f2:	2501                	sext.w	a0,a0
    12f4:	6105                	addi	sp,sp,32
    12f6:	8082                	ret

00000000000012f8 <puts>:
{
    12f8:	1141                	addi	sp,sp,-16
    12fa:	e406                	sd	ra,8(sp)
    12fc:	e022                	sd	s0,0(sp)
    12fe:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1300:	56c000ef          	jal	ra,186c <strlen>
    1304:	862a                	mv	a2,a0
    1306:	85a2                	mv	a1,s0
    1308:	4505                	li	a0,1
    130a:	151000ef          	jal	ra,1c5a <write>
}
    130e:	60a2                	ld	ra,8(sp)
    1310:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1312:	957d                	srai	a0,a0,0x3f
    return r;
    1314:	2501                	sext.w	a0,a0
}
    1316:	0141                	addi	sp,sp,16
    1318:	8082                	ret

000000000000131a <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    131a:	7171                	addi	sp,sp,-176
    131c:	fc56                	sd	s5,56(sp)
    131e:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1320:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1322:	18bc                	addi	a5,sp,120
{
    1324:	e8ca                	sd	s2,80(sp)
    1326:	e4ce                	sd	s3,72(sp)
    1328:	e0d2                	sd	s4,64(sp)
    132a:	f85a                	sd	s6,48(sp)
    132c:	f486                	sd	ra,104(sp)
    132e:	f0a2                	sd	s0,96(sp)
    1330:	eca6                	sd	s1,88(sp)
    1332:	fcae                	sd	a1,120(sp)
    1334:	e132                	sd	a2,128(sp)
    1336:	e536                	sd	a3,136(sp)
    1338:	e93a                	sd	a4,144(sp)
    133a:	f142                	sd	a6,160(sp)
    133c:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    133e:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1340:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1344:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1348:	00001b17          	auipc	s6,0x1
    134c:	be8b0b13          	addi	s6,s6,-1048 # 1f30 <__clone+0x9e>
    buf[i++] = '0';
    1350:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1354:	00001997          	auipc	s3,0x1
    1358:	c0c98993          	addi	s3,s3,-1012 # 1f60 <digits>
        if (!*s)
    135c:	00054783          	lbu	a5,0(a0)
    1360:	16078a63          	beqz	a5,14d4 <printf+0x1ba>
    1364:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1366:	19278163          	beq	a5,s2,14e8 <printf+0x1ce>
    136a:	00164783          	lbu	a5,1(a2)
    136e:	0605                	addi	a2,a2,1
    1370:	fbfd                	bnez	a5,1366 <printf+0x4c>
    1372:	84b2                	mv	s1,a2
        l = z - a;
    1374:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1378:	85aa                	mv	a1,a0
    137a:	8622                	mv	a2,s0
    137c:	4505                	li	a0,1
    137e:	0dd000ef          	jal	ra,1c5a <write>
        if (l)
    1382:	18041c63          	bnez	s0,151a <printf+0x200>
        if (s[1] == 0)
    1386:	0014c783          	lbu	a5,1(s1)
    138a:	14078563          	beqz	a5,14d4 <printf+0x1ba>
        switch (s[1])
    138e:	1d478063          	beq	a5,s4,154e <printf+0x234>
    1392:	18fa6663          	bltu	s4,a5,151e <printf+0x204>
    1396:	06400713          	li	a4,100
    139a:	1ae78063          	beq	a5,a4,153a <printf+0x220>
    139e:	07000713          	li	a4,112
    13a2:	1ce79963          	bne	a5,a4,1574 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    13a6:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13a8:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13ac:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13ae:	631c                	ld	a5,0(a4)
    13b0:	0721                	addi	a4,a4,8
    13b2:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13b4:	00479293          	slli	t0,a5,0x4
    13b8:	00879f93          	slli	t6,a5,0x8
    13bc:	00c79f13          	slli	t5,a5,0xc
    13c0:	01079e93          	slli	t4,a5,0x10
    13c4:	01479e13          	slli	t3,a5,0x14
    13c8:	01879313          	slli	t1,a5,0x18
    13cc:	01c79893          	slli	a7,a5,0x1c
    13d0:	02479813          	slli	a6,a5,0x24
    13d4:	02879513          	slli	a0,a5,0x28
    13d8:	02c79593          	slli	a1,a5,0x2c
    13dc:	03079693          	slli	a3,a5,0x30
    13e0:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13e4:	03c7d413          	srli	s0,a5,0x3c
    13e8:	01c7d39b          	srliw	t2,a5,0x1c
    13ec:	03c2d293          	srli	t0,t0,0x3c
    13f0:	03cfdf93          	srli	t6,t6,0x3c
    13f4:	03cf5f13          	srli	t5,t5,0x3c
    13f8:	03cede93          	srli	t4,t4,0x3c
    13fc:	03ce5e13          	srli	t3,t3,0x3c
    1400:	03c35313          	srli	t1,t1,0x3c
    1404:	03c8d893          	srli	a7,a7,0x3c
    1408:	03c85813          	srli	a6,a6,0x3c
    140c:	9171                	srli	a0,a0,0x3c
    140e:	91f1                	srli	a1,a1,0x3c
    1410:	92f1                	srli	a3,a3,0x3c
    1412:	9371                	srli	a4,a4,0x3c
    1414:	96ce                	add	a3,a3,s3
    1416:	974e                	add	a4,a4,s3
    1418:	944e                	add	s0,s0,s3
    141a:	92ce                	add	t0,t0,s3
    141c:	9fce                	add	t6,t6,s3
    141e:	9f4e                	add	t5,t5,s3
    1420:	9ece                	add	t4,t4,s3
    1422:	9e4e                	add	t3,t3,s3
    1424:	934e                	add	t1,t1,s3
    1426:	98ce                	add	a7,a7,s3
    1428:	93ce                	add	t2,t2,s3
    142a:	984e                	add	a6,a6,s3
    142c:	954e                	add	a0,a0,s3
    142e:	95ce                	add	a1,a1,s3
    1430:	0006c083          	lbu	ra,0(a3)
    1434:	0002c283          	lbu	t0,0(t0)
    1438:	00074683          	lbu	a3,0(a4)
    143c:	000fcf83          	lbu	t6,0(t6)
    1440:	000f4f03          	lbu	t5,0(t5)
    1444:	000ece83          	lbu	t4,0(t4)
    1448:	000e4e03          	lbu	t3,0(t3)
    144c:	00034303          	lbu	t1,0(t1)
    1450:	0008c883          	lbu	a7,0(a7)
    1454:	0003c383          	lbu	t2,0(t2)
    1458:	00084803          	lbu	a6,0(a6)
    145c:	00054503          	lbu	a0,0(a0)
    1460:	0005c583          	lbu	a1,0(a1)
    1464:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1468:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    146c:	9371                	srli	a4,a4,0x3c
    146e:	8bbd                	andi	a5,a5,15
    1470:	974e                	add	a4,a4,s3
    1472:	97ce                	add	a5,a5,s3
    1474:	005105a3          	sb	t0,11(sp)
    1478:	01f10623          	sb	t6,12(sp)
    147c:	01e106a3          	sb	t5,13(sp)
    1480:	01d10723          	sb	t4,14(sp)
    1484:	01c107a3          	sb	t3,15(sp)
    1488:	00610823          	sb	t1,16(sp)
    148c:	011108a3          	sb	a7,17(sp)
    1490:	00710923          	sb	t2,18(sp)
    1494:	010109a3          	sb	a6,19(sp)
    1498:	00a10a23          	sb	a0,20(sp)
    149c:	00b10aa3          	sb	a1,21(sp)
    14a0:	00110b23          	sb	ra,22(sp)
    14a4:	00d10ba3          	sb	a3,23(sp)
    14a8:	00810523          	sb	s0,10(sp)
    14ac:	00074703          	lbu	a4,0(a4)
    14b0:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14b4:	002c                	addi	a1,sp,8
    14b6:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14b8:	00e10c23          	sb	a4,24(sp)
    14bc:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14c0:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14c4:	796000ef          	jal	ra,1c5a <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14c8:	00248513          	addi	a0,s1,2
        if (!*s)
    14cc:	00054783          	lbu	a5,0(a0)
    14d0:	e8079ae3          	bnez	a5,1364 <printf+0x4a>
    }
    va_end(ap);
}
    14d4:	70a6                	ld	ra,104(sp)
    14d6:	7406                	ld	s0,96(sp)
    14d8:	64e6                	ld	s1,88(sp)
    14da:	6946                	ld	s2,80(sp)
    14dc:	69a6                	ld	s3,72(sp)
    14de:	6a06                	ld	s4,64(sp)
    14e0:	7ae2                	ld	s5,56(sp)
    14e2:	7b42                	ld	s6,48(sp)
    14e4:	614d                	addi	sp,sp,176
    14e6:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14e8:	00064783          	lbu	a5,0(a2)
    14ec:	84b2                	mv	s1,a2
    14ee:	01278963          	beq	a5,s2,1500 <printf+0x1e6>
    14f2:	b549                	j	1374 <printf+0x5a>
    14f4:	0024c783          	lbu	a5,2(s1)
    14f8:	0605                	addi	a2,a2,1
    14fa:	0489                	addi	s1,s1,2
    14fc:	e7279ce3          	bne	a5,s2,1374 <printf+0x5a>
    1500:	0014c783          	lbu	a5,1(s1)
    1504:	ff2788e3          	beq	a5,s2,14f4 <printf+0x1da>
        l = z - a;
    1508:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    150c:	85aa                	mv	a1,a0
    150e:	8622                	mv	a2,s0
    1510:	4505                	li	a0,1
    1512:	748000ef          	jal	ra,1c5a <write>
        if (l)
    1516:	e60408e3          	beqz	s0,1386 <printf+0x6c>
    151a:	8526                	mv	a0,s1
    151c:	b581                	j	135c <printf+0x42>
        switch (s[1])
    151e:	07800713          	li	a4,120
    1522:	04e79963          	bne	a5,a4,1574 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    1526:	6782                	ld	a5,0(sp)
    1528:	45c1                	li	a1,16
    152a:	4388                	lw	a0,0(a5)
    152c:	07a1                	addi	a5,a5,8
    152e:	e03e                	sd	a5,0(sp)
    1530:	b71ff0ef          	jal	ra,10a0 <printint.constprop.0>
        s += 2;
    1534:	00248513          	addi	a0,s1,2
    1538:	bf51                	j	14cc <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    153a:	6782                	ld	a5,0(sp)
    153c:	45a9                	li	a1,10
    153e:	4388                	lw	a0,0(a5)
    1540:	07a1                	addi	a5,a5,8
    1542:	e03e                	sd	a5,0(sp)
    1544:	b5dff0ef          	jal	ra,10a0 <printint.constprop.0>
        s += 2;
    1548:	00248513          	addi	a0,s1,2
    154c:	b741                	j	14cc <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    154e:	6782                	ld	a5,0(sp)
    1550:	6380                	ld	s0,0(a5)
    1552:	07a1                	addi	a5,a5,8
    1554:	e03e                	sd	a5,0(sp)
    1556:	c031                	beqz	s0,159a <printf+0x280>
            l = strnlen(a, 200);
    1558:	0c800593          	li	a1,200
    155c:	8522                	mv	a0,s0
    155e:	3fa000ef          	jal	ra,1958 <strnlen>
    write(f, s, l);
    1562:	0005061b          	sext.w	a2,a0
    1566:	85a2                	mv	a1,s0
    1568:	4505                	li	a0,1
    156a:	6f0000ef          	jal	ra,1c5a <write>
        s += 2;
    156e:	00248513          	addi	a0,s1,2
    1572:	bfa9                	j	14cc <printf+0x1b2>
    return write(stdout, &byte, 1);
    1574:	4605                	li	a2,1
    1576:	002c                	addi	a1,sp,8
    1578:	4505                	li	a0,1
    char byte = c;
    157a:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    157e:	6dc000ef          	jal	ra,1c5a <write>
    char byte = c;
    1582:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1586:	4605                	li	a2,1
    1588:	002c                	addi	a1,sp,8
    158a:	4505                	li	a0,1
    char byte = c;
    158c:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1590:	6ca000ef          	jal	ra,1c5a <write>
        s += 2;
    1594:	00248513          	addi	a0,s1,2
    1598:	bf15                	j	14cc <printf+0x1b2>
                a = "(null)";
    159a:	845a                	mv	s0,s6
    159c:	bf75                	j	1558 <printf+0x23e>

000000000000159e <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    159e:	02000793          	li	a5,32
    15a2:	00f50663          	beq	a0,a5,15ae <isspace+0x10>
    15a6:	355d                	addiw	a0,a0,-9
    15a8:	00553513          	sltiu	a0,a0,5
    15ac:	8082                	ret
    15ae:	4505                	li	a0,1
}
    15b0:	8082                	ret

00000000000015b2 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15b2:	fd05051b          	addiw	a0,a0,-48
}
    15b6:	00a53513          	sltiu	a0,a0,10
    15ba:	8082                	ret

00000000000015bc <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15bc:	02000613          	li	a2,32
    15c0:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15c2:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15c6:	ff77869b          	addiw	a3,a5,-9
    15ca:	04c78c63          	beq	a5,a2,1622 <atoi+0x66>
    15ce:	0007871b          	sext.w	a4,a5
    15d2:	04d5f863          	bgeu	a1,a3,1622 <atoi+0x66>
        s++;
    switch (*s)
    15d6:	02b00693          	li	a3,43
    15da:	04d78963          	beq	a5,a3,162c <atoi+0x70>
    15de:	02d00693          	li	a3,45
    15e2:	06d78263          	beq	a5,a3,1646 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15e6:	fd07061b          	addiw	a2,a4,-48
    15ea:	47a5                	li	a5,9
    15ec:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15ee:	4e01                	li	t3,0
    while (isdigit(*s))
    15f0:	04c7e963          	bltu	a5,a2,1642 <atoi+0x86>
    int n = 0, neg = 0;
    15f4:	4501                	li	a0,0
    while (isdigit(*s))
    15f6:	4825                	li	a6,9
    15f8:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    15fc:	0025179b          	slliw	a5,a0,0x2
    1600:	9fa9                	addw	a5,a5,a0
    1602:	fd07031b          	addiw	t1,a4,-48
    1606:	0017989b          	slliw	a7,a5,0x1
    while (isdigit(*s))
    160a:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    160e:	0685                	addi	a3,a3,1
    1610:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1614:	0006071b          	sext.w	a4,a2
    1618:	feb870e3          	bgeu	a6,a1,15f8 <atoi+0x3c>
    return neg ? n : -n;
    161c:	000e0563          	beqz	t3,1626 <atoi+0x6a>
}
    1620:	8082                	ret
        s++;
    1622:	0505                	addi	a0,a0,1
    1624:	bf79                	j	15c2 <atoi+0x6>
    return neg ? n : -n;
    1626:	4113053b          	subw	a0,t1,a7
    162a:	8082                	ret
    while (isdigit(*s))
    162c:	00154703          	lbu	a4,1(a0)
    1630:	47a5                	li	a5,9
        s++;
    1632:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1636:	fd07061b          	addiw	a2,a4,-48
    int n = 0, neg = 0;
    163a:	4e01                	li	t3,0
    while (isdigit(*s))
    163c:	2701                	sext.w	a4,a4
    163e:	fac7fbe3          	bgeu	a5,a2,15f4 <atoi+0x38>
    1642:	4501                	li	a0,0
}
    1644:	8082                	ret
    while (isdigit(*s))
    1646:	00154703          	lbu	a4,1(a0)
    164a:	47a5                	li	a5,9
        s++;
    164c:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1650:	fd07061b          	addiw	a2,a4,-48
    1654:	2701                	sext.w	a4,a4
    1656:	fec7e6e3          	bltu	a5,a2,1642 <atoi+0x86>
        neg = 1;
    165a:	4e05                	li	t3,1
    165c:	bf61                	j	15f4 <atoi+0x38>

000000000000165e <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    165e:	16060d63          	beqz	a2,17d8 <memset+0x17a>
    1662:	40a007b3          	neg	a5,a0
    1666:	8b9d                	andi	a5,a5,7
    1668:	00778693          	addi	a3,a5,7
    166c:	482d                	li	a6,11
    166e:	0ff5f713          	zext.b	a4,a1
    1672:	fff60593          	addi	a1,a2,-1
    1676:	1706e263          	bltu	a3,a6,17da <memset+0x17c>
    167a:	16d5ea63          	bltu	a1,a3,17ee <memset+0x190>
    167e:	16078563          	beqz	a5,17e8 <memset+0x18a>
    1682:	00e50023          	sb	a4,0(a0)
    1686:	4685                	li	a3,1
    1688:	00150593          	addi	a1,a0,1
    168c:	14d78c63          	beq	a5,a3,17e4 <memset+0x186>
    1690:	00e500a3          	sb	a4,1(a0)
    1694:	4689                	li	a3,2
    1696:	00250593          	addi	a1,a0,2
    169a:	14d78d63          	beq	a5,a3,17f4 <memset+0x196>
    169e:	00e50123          	sb	a4,2(a0)
    16a2:	468d                	li	a3,3
    16a4:	00350593          	addi	a1,a0,3
    16a8:	12d78b63          	beq	a5,a3,17de <memset+0x180>
    16ac:	00e501a3          	sb	a4,3(a0)
    16b0:	4691                	li	a3,4
    16b2:	00450593          	addi	a1,a0,4
    16b6:	14d78163          	beq	a5,a3,17f8 <memset+0x19a>
    16ba:	00e50223          	sb	a4,4(a0)
    16be:	4695                	li	a3,5
    16c0:	00550593          	addi	a1,a0,5
    16c4:	12d78c63          	beq	a5,a3,17fc <memset+0x19e>
    16c8:	00e502a3          	sb	a4,5(a0)
    16cc:	469d                	li	a3,7
    16ce:	00650593          	addi	a1,a0,6
    16d2:	12d79763          	bne	a5,a3,1800 <memset+0x1a2>
    16d6:	00750593          	addi	a1,a0,7
    16da:	00e50323          	sb	a4,6(a0)
    16de:	481d                	li	a6,7
    16e0:	00871693          	slli	a3,a4,0x8
    16e4:	01071893          	slli	a7,a4,0x10
    16e8:	8ed9                	or	a3,a3,a4
    16ea:	01871313          	slli	t1,a4,0x18
    16ee:	0116e6b3          	or	a3,a3,a7
    16f2:	0066e6b3          	or	a3,a3,t1
    16f6:	02071893          	slli	a7,a4,0x20
    16fa:	02871e13          	slli	t3,a4,0x28
    16fe:	0116e6b3          	or	a3,a3,a7
    1702:	40f60333          	sub	t1,a2,a5
    1706:	03071893          	slli	a7,a4,0x30
    170a:	01c6e6b3          	or	a3,a3,t3
    170e:	0116e6b3          	or	a3,a3,a7
    1712:	03871e13          	slli	t3,a4,0x38
    1716:	97aa                	add	a5,a5,a0
    1718:	ff837893          	andi	a7,t1,-8
    171c:	01c6e6b3          	or	a3,a3,t3
    1720:	98be                	add	a7,a7,a5
    1722:	e394                	sd	a3,0(a5)
    1724:	07a1                	addi	a5,a5,8
    1726:	ff179ee3          	bne	a5,a7,1722 <memset+0xc4>
    172a:	ff837893          	andi	a7,t1,-8
    172e:	011587b3          	add	a5,a1,a7
    1732:	010886bb          	addw	a3,a7,a6
    1736:	0b130663          	beq	t1,a7,17e2 <memset+0x184>
    173a:	00e78023          	sb	a4,0(a5)
    173e:	0016859b          	addiw	a1,a3,1
    1742:	08c5fb63          	bgeu	a1,a2,17d8 <memset+0x17a>
    1746:	00e780a3          	sb	a4,1(a5)
    174a:	0026859b          	addiw	a1,a3,2
    174e:	08c5f563          	bgeu	a1,a2,17d8 <memset+0x17a>
    1752:	00e78123          	sb	a4,2(a5)
    1756:	0036859b          	addiw	a1,a3,3
    175a:	06c5ff63          	bgeu	a1,a2,17d8 <memset+0x17a>
    175e:	00e781a3          	sb	a4,3(a5)
    1762:	0046859b          	addiw	a1,a3,4
    1766:	06c5f963          	bgeu	a1,a2,17d8 <memset+0x17a>
    176a:	00e78223          	sb	a4,4(a5)
    176e:	0056859b          	addiw	a1,a3,5
    1772:	06c5f363          	bgeu	a1,a2,17d8 <memset+0x17a>
    1776:	00e782a3          	sb	a4,5(a5)
    177a:	0066859b          	addiw	a1,a3,6
    177e:	04c5fd63          	bgeu	a1,a2,17d8 <memset+0x17a>
    1782:	00e78323          	sb	a4,6(a5)
    1786:	0076859b          	addiw	a1,a3,7
    178a:	04c5f763          	bgeu	a1,a2,17d8 <memset+0x17a>
    178e:	00e783a3          	sb	a4,7(a5)
    1792:	0086859b          	addiw	a1,a3,8
    1796:	04c5f163          	bgeu	a1,a2,17d8 <memset+0x17a>
    179a:	00e78423          	sb	a4,8(a5)
    179e:	0096859b          	addiw	a1,a3,9
    17a2:	02c5fb63          	bgeu	a1,a2,17d8 <memset+0x17a>
    17a6:	00e784a3          	sb	a4,9(a5)
    17aa:	00a6859b          	addiw	a1,a3,10
    17ae:	02c5f563          	bgeu	a1,a2,17d8 <memset+0x17a>
    17b2:	00e78523          	sb	a4,10(a5)
    17b6:	00b6859b          	addiw	a1,a3,11
    17ba:	00c5ff63          	bgeu	a1,a2,17d8 <memset+0x17a>
    17be:	00e785a3          	sb	a4,11(a5)
    17c2:	00c6859b          	addiw	a1,a3,12
    17c6:	00c5f963          	bgeu	a1,a2,17d8 <memset+0x17a>
    17ca:	00e78623          	sb	a4,12(a5)
    17ce:	26b5                	addiw	a3,a3,13
    17d0:	00c6f463          	bgeu	a3,a2,17d8 <memset+0x17a>
    17d4:	00e786a3          	sb	a4,13(a5)
        ;
    return dest;
}
    17d8:	8082                	ret
    17da:	46ad                	li	a3,11
    17dc:	bd79                	j	167a <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17de:	480d                	li	a6,3
    17e0:	b701                	j	16e0 <memset+0x82>
    17e2:	8082                	ret
    17e4:	4805                	li	a6,1
    17e6:	bded                	j	16e0 <memset+0x82>
    17e8:	85aa                	mv	a1,a0
    17ea:	4801                	li	a6,0
    17ec:	bdd5                	j	16e0 <memset+0x82>
    17ee:	87aa                	mv	a5,a0
    17f0:	4681                	li	a3,0
    17f2:	b7a1                	j	173a <memset+0xdc>
    17f4:	4809                	li	a6,2
    17f6:	b5ed                	j	16e0 <memset+0x82>
    17f8:	4811                	li	a6,4
    17fa:	b5dd                	j	16e0 <memset+0x82>
    17fc:	4815                	li	a6,5
    17fe:	b5cd                	j	16e0 <memset+0x82>
    1800:	4819                	li	a6,6
    1802:	bdf9                	j	16e0 <memset+0x82>

0000000000001804 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1804:	00054783          	lbu	a5,0(a0)
    1808:	0005c703          	lbu	a4,0(a1)
    180c:	00e79863          	bne	a5,a4,181c <strcmp+0x18>
    1810:	0505                	addi	a0,a0,1
    1812:	0585                	addi	a1,a1,1
    1814:	fbe5                	bnez	a5,1804 <strcmp>
    1816:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1818:	9d19                	subw	a0,a0,a4
    181a:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    181c:	0007851b          	sext.w	a0,a5
    1820:	bfe5                	j	1818 <strcmp+0x14>

0000000000001822 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1822:	ca15                	beqz	a2,1856 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1824:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1828:	167d                	addi	a2,a2,-1
    182a:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    182e:	eb99                	bnez	a5,1844 <strncmp+0x22>
    1830:	a815                	j	1864 <strncmp+0x42>
    1832:	00a68e63          	beq	a3,a0,184e <strncmp+0x2c>
    1836:	0505                	addi	a0,a0,1
    1838:	00f71b63          	bne	a4,a5,184e <strncmp+0x2c>
    183c:	00054783          	lbu	a5,0(a0)
    1840:	cf89                	beqz	a5,185a <strncmp+0x38>
    1842:	85b2                	mv	a1,a2
    1844:	0005c703          	lbu	a4,0(a1)
    1848:	00158613          	addi	a2,a1,1
    184c:	f37d                	bnez	a4,1832 <strncmp+0x10>
        ;
    return *l - *r;
    184e:	0007851b          	sext.w	a0,a5
    1852:	9d19                	subw	a0,a0,a4
    1854:	8082                	ret
        return 0;
    1856:	4501                	li	a0,0
}
    1858:	8082                	ret
    return *l - *r;
    185a:	0015c703          	lbu	a4,1(a1)
    185e:	4501                	li	a0,0
    1860:	9d19                	subw	a0,a0,a4
    1862:	8082                	ret
    1864:	0005c703          	lbu	a4,0(a1)
    1868:	4501                	li	a0,0
    186a:	b7e5                	j	1852 <strncmp+0x30>

000000000000186c <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    186c:	00757793          	andi	a5,a0,7
    1870:	cf89                	beqz	a5,188a <strlen+0x1e>
    1872:	87aa                	mv	a5,a0
    1874:	a029                	j	187e <strlen+0x12>
    1876:	0785                	addi	a5,a5,1
    1878:	0077f713          	andi	a4,a5,7
    187c:	cb01                	beqz	a4,188c <strlen+0x20>
        if (!*s)
    187e:	0007c703          	lbu	a4,0(a5)
    1882:	fb75                	bnez	a4,1876 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1884:	40a78533          	sub	a0,a5,a0
}
    1888:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    188a:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    188c:	6394                	ld	a3,0(a5)
    188e:	00000597          	auipc	a1,0x0
    1892:	6aa5b583          	ld	a1,1706(a1) # 1f38 <__clone+0xa6>
    1896:	00000617          	auipc	a2,0x0
    189a:	6aa63603          	ld	a2,1706(a2) # 1f40 <__clone+0xae>
    189e:	a019                	j	18a4 <strlen+0x38>
    18a0:	6794                	ld	a3,8(a5)
    18a2:	07a1                	addi	a5,a5,8
    18a4:	00b68733          	add	a4,a3,a1
    18a8:	fff6c693          	not	a3,a3
    18ac:	8f75                	and	a4,a4,a3
    18ae:	8f71                	and	a4,a4,a2
    18b0:	db65                	beqz	a4,18a0 <strlen+0x34>
    for (; *s; s++)
    18b2:	0007c703          	lbu	a4,0(a5)
    18b6:	d779                	beqz	a4,1884 <strlen+0x18>
    18b8:	0017c703          	lbu	a4,1(a5)
    18bc:	0785                	addi	a5,a5,1
    18be:	d379                	beqz	a4,1884 <strlen+0x18>
    18c0:	0017c703          	lbu	a4,1(a5)
    18c4:	0785                	addi	a5,a5,1
    18c6:	fb6d                	bnez	a4,18b8 <strlen+0x4c>
    18c8:	bf75                	j	1884 <strlen+0x18>

00000000000018ca <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18ca:	00757713          	andi	a4,a0,7
{
    18ce:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18d0:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18d4:	cb19                	beqz	a4,18ea <memchr+0x20>
    18d6:	ce25                	beqz	a2,194e <memchr+0x84>
    18d8:	0007c703          	lbu	a4,0(a5)
    18dc:	04b70e63          	beq	a4,a1,1938 <memchr+0x6e>
    18e0:	0785                	addi	a5,a5,1
    18e2:	0077f713          	andi	a4,a5,7
    18e6:	167d                	addi	a2,a2,-1
    18e8:	f77d                	bnez	a4,18d6 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18ea:	4501                	li	a0,0
    if (n && *s != c)
    18ec:	c235                	beqz	a2,1950 <memchr+0x86>
    18ee:	0007c703          	lbu	a4,0(a5)
    18f2:	04b70363          	beq	a4,a1,1938 <memchr+0x6e>
        size_t k = ONES * c;
    18f6:	00000517          	auipc	a0,0x0
    18fa:	65253503          	ld	a0,1618(a0) # 1f48 <__clone+0xb6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18fe:	471d                	li	a4,7
        size_t k = ONES * c;
    1900:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1904:	02c77a63          	bgeu	a4,a2,1938 <memchr+0x6e>
    1908:	00000897          	auipc	a7,0x0
    190c:	6308b883          	ld	a7,1584(a7) # 1f38 <__clone+0xa6>
    1910:	00000817          	auipc	a6,0x0
    1914:	63083803          	ld	a6,1584(a6) # 1f40 <__clone+0xae>
    1918:	431d                	li	t1,7
    191a:	a029                	j	1924 <memchr+0x5a>
    191c:	1661                	addi	a2,a2,-8
    191e:	07a1                	addi	a5,a5,8
    1920:	02c37963          	bgeu	t1,a2,1952 <memchr+0x88>
    1924:	6398                	ld	a4,0(a5)
    1926:	8f29                	xor	a4,a4,a0
    1928:	011706b3          	add	a3,a4,a7
    192c:	fff74713          	not	a4,a4
    1930:	8f75                	and	a4,a4,a3
    1932:	01077733          	and	a4,a4,a6
    1936:	d37d                	beqz	a4,191c <memchr+0x52>
{
    1938:	853e                	mv	a0,a5
    193a:	97b2                	add	a5,a5,a2
    193c:	a021                	j	1944 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    193e:	0505                	addi	a0,a0,1
    1940:	00f50763          	beq	a0,a5,194e <memchr+0x84>
    1944:	00054703          	lbu	a4,0(a0)
    1948:	feb71be3          	bne	a4,a1,193e <memchr+0x74>
    194c:	8082                	ret
    return n ? (void *)s : 0;
    194e:	4501                	li	a0,0
}
    1950:	8082                	ret
    return n ? (void *)s : 0;
    1952:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1954:	f275                	bnez	a2,1938 <memchr+0x6e>
}
    1956:	8082                	ret

0000000000001958 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1958:	1101                	addi	sp,sp,-32
    195a:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    195c:	862e                	mv	a2,a1
{
    195e:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1960:	4581                	li	a1,0
{
    1962:	e426                	sd	s1,8(sp)
    1964:	ec06                	sd	ra,24(sp)
    1966:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1968:	f63ff0ef          	jal	ra,18ca <memchr>
    return p ? p - s : n;
    196c:	c519                	beqz	a0,197a <strnlen+0x22>
}
    196e:	60e2                	ld	ra,24(sp)
    1970:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1972:	8d05                	sub	a0,a0,s1
}
    1974:	64a2                	ld	s1,8(sp)
    1976:	6105                	addi	sp,sp,32
    1978:	8082                	ret
    197a:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    197c:	8522                	mv	a0,s0
}
    197e:	6442                	ld	s0,16(sp)
    1980:	64a2                	ld	s1,8(sp)
    1982:	6105                	addi	sp,sp,32
    1984:	8082                	ret

0000000000001986 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1986:	00a5c7b3          	xor	a5,a1,a0
    198a:	8b9d                	andi	a5,a5,7
    198c:	eb95                	bnez	a5,19c0 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    198e:	0075f793          	andi	a5,a1,7
    1992:	e7b1                	bnez	a5,19de <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1994:	6198                	ld	a4,0(a1)
    1996:	00000617          	auipc	a2,0x0
    199a:	5a263603          	ld	a2,1442(a2) # 1f38 <__clone+0xa6>
    199e:	00000817          	auipc	a6,0x0
    19a2:	5a283803          	ld	a6,1442(a6) # 1f40 <__clone+0xae>
    19a6:	a029                	j	19b0 <strcpy+0x2a>
    19a8:	05a1                	addi	a1,a1,8
    19aa:	e118                	sd	a4,0(a0)
    19ac:	6198                	ld	a4,0(a1)
    19ae:	0521                	addi	a0,a0,8
    19b0:	00c707b3          	add	a5,a4,a2
    19b4:	fff74693          	not	a3,a4
    19b8:	8ff5                	and	a5,a5,a3
    19ba:	0107f7b3          	and	a5,a5,a6
    19be:	d7ed                	beqz	a5,19a8 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19c0:	0005c783          	lbu	a5,0(a1)
    19c4:	00f50023          	sb	a5,0(a0)
    19c8:	c785                	beqz	a5,19f0 <strcpy+0x6a>
    19ca:	0015c783          	lbu	a5,1(a1)
    19ce:	0505                	addi	a0,a0,1
    19d0:	0585                	addi	a1,a1,1
    19d2:	00f50023          	sb	a5,0(a0)
    19d6:	fbf5                	bnez	a5,19ca <strcpy+0x44>
        ;
    return d;
}
    19d8:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19da:	0505                	addi	a0,a0,1
    19dc:	df45                	beqz	a4,1994 <strcpy+0xe>
            if (!(*d = *s))
    19de:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19e2:	0585                	addi	a1,a1,1
    19e4:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    19e8:	00f50023          	sb	a5,0(a0)
    19ec:	f7fd                	bnez	a5,19da <strcpy+0x54>
}
    19ee:	8082                	ret
    19f0:	8082                	ret

00000000000019f2 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19f2:	00a5c7b3          	xor	a5,a1,a0
    19f6:	8b9d                	andi	a5,a5,7
    19f8:	1a079863          	bnez	a5,1ba8 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19fc:	0075f793          	andi	a5,a1,7
    1a00:	16078463          	beqz	a5,1b68 <strncpy+0x176>
    1a04:	ea01                	bnez	a2,1a14 <strncpy+0x22>
    1a06:	a421                	j	1c0e <strncpy+0x21c>
    1a08:	167d                	addi	a2,a2,-1
    1a0a:	0505                	addi	a0,a0,1
    1a0c:	14070e63          	beqz	a4,1b68 <strncpy+0x176>
    1a10:	1a060863          	beqz	a2,1bc0 <strncpy+0x1ce>
    1a14:	0005c783          	lbu	a5,0(a1)
    1a18:	0585                	addi	a1,a1,1
    1a1a:	0075f713          	andi	a4,a1,7
    1a1e:	00f50023          	sb	a5,0(a0)
    1a22:	f3fd                	bnez	a5,1a08 <strncpy+0x16>
    1a24:	4805                	li	a6,1
    1a26:	1a061863          	bnez	a2,1bd6 <strncpy+0x1e4>
    1a2a:	40a007b3          	neg	a5,a0
    1a2e:	8b9d                	andi	a5,a5,7
    1a30:	4681                	li	a3,0
    1a32:	18061a63          	bnez	a2,1bc6 <strncpy+0x1d4>
    1a36:	00778713          	addi	a4,a5,7
    1a3a:	45ad                	li	a1,11
    1a3c:	18b76363          	bltu	a4,a1,1bc2 <strncpy+0x1d0>
    1a40:	1ae6eb63          	bltu	a3,a4,1bf6 <strncpy+0x204>
    1a44:	1a078363          	beqz	a5,1bea <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a48:	00050023          	sb	zero,0(a0)
    1a4c:	4685                	li	a3,1
    1a4e:	00150713          	addi	a4,a0,1
    1a52:	18d78f63          	beq	a5,a3,1bf0 <strncpy+0x1fe>
    1a56:	000500a3          	sb	zero,1(a0)
    1a5a:	4689                	li	a3,2
    1a5c:	00250713          	addi	a4,a0,2
    1a60:	18d78e63          	beq	a5,a3,1bfc <strncpy+0x20a>
    1a64:	00050123          	sb	zero,2(a0)
    1a68:	468d                	li	a3,3
    1a6a:	00350713          	addi	a4,a0,3
    1a6e:	16d78c63          	beq	a5,a3,1be6 <strncpy+0x1f4>
    1a72:	000501a3          	sb	zero,3(a0)
    1a76:	4691                	li	a3,4
    1a78:	00450713          	addi	a4,a0,4
    1a7c:	18d78263          	beq	a5,a3,1c00 <strncpy+0x20e>
    1a80:	00050223          	sb	zero,4(a0)
    1a84:	4695                	li	a3,5
    1a86:	00550713          	addi	a4,a0,5
    1a8a:	16d78d63          	beq	a5,a3,1c04 <strncpy+0x212>
    1a8e:	000502a3          	sb	zero,5(a0)
    1a92:	469d                	li	a3,7
    1a94:	00650713          	addi	a4,a0,6
    1a98:	16d79863          	bne	a5,a3,1c08 <strncpy+0x216>
    1a9c:	00750713          	addi	a4,a0,7
    1aa0:	00050323          	sb	zero,6(a0)
    1aa4:	40f80833          	sub	a6,a6,a5
    1aa8:	ff887593          	andi	a1,a6,-8
    1aac:	97aa                	add	a5,a5,a0
    1aae:	95be                	add	a1,a1,a5
    1ab0:	0007b023          	sd	zero,0(a5)
    1ab4:	07a1                	addi	a5,a5,8
    1ab6:	feb79de3          	bne	a5,a1,1ab0 <strncpy+0xbe>
    1aba:	ff887593          	andi	a1,a6,-8
    1abe:	9ead                	addw	a3,a3,a1
    1ac0:	00b707b3          	add	a5,a4,a1
    1ac4:	12b80863          	beq	a6,a1,1bf4 <strncpy+0x202>
    1ac8:	00078023          	sb	zero,0(a5)
    1acc:	0016871b          	addiw	a4,a3,1
    1ad0:	0ec77863          	bgeu	a4,a2,1bc0 <strncpy+0x1ce>
    1ad4:	000780a3          	sb	zero,1(a5)
    1ad8:	0026871b          	addiw	a4,a3,2
    1adc:	0ec77263          	bgeu	a4,a2,1bc0 <strncpy+0x1ce>
    1ae0:	00078123          	sb	zero,2(a5)
    1ae4:	0036871b          	addiw	a4,a3,3
    1ae8:	0cc77c63          	bgeu	a4,a2,1bc0 <strncpy+0x1ce>
    1aec:	000781a3          	sb	zero,3(a5)
    1af0:	0046871b          	addiw	a4,a3,4
    1af4:	0cc77663          	bgeu	a4,a2,1bc0 <strncpy+0x1ce>
    1af8:	00078223          	sb	zero,4(a5)
    1afc:	0056871b          	addiw	a4,a3,5
    1b00:	0cc77063          	bgeu	a4,a2,1bc0 <strncpy+0x1ce>
    1b04:	000782a3          	sb	zero,5(a5)
    1b08:	0066871b          	addiw	a4,a3,6
    1b0c:	0ac77a63          	bgeu	a4,a2,1bc0 <strncpy+0x1ce>
    1b10:	00078323          	sb	zero,6(a5)
    1b14:	0076871b          	addiw	a4,a3,7
    1b18:	0ac77463          	bgeu	a4,a2,1bc0 <strncpy+0x1ce>
    1b1c:	000783a3          	sb	zero,7(a5)
    1b20:	0086871b          	addiw	a4,a3,8
    1b24:	08c77e63          	bgeu	a4,a2,1bc0 <strncpy+0x1ce>
    1b28:	00078423          	sb	zero,8(a5)
    1b2c:	0096871b          	addiw	a4,a3,9
    1b30:	08c77863          	bgeu	a4,a2,1bc0 <strncpy+0x1ce>
    1b34:	000784a3          	sb	zero,9(a5)
    1b38:	00a6871b          	addiw	a4,a3,10
    1b3c:	08c77263          	bgeu	a4,a2,1bc0 <strncpy+0x1ce>
    1b40:	00078523          	sb	zero,10(a5)
    1b44:	00b6871b          	addiw	a4,a3,11
    1b48:	06c77c63          	bgeu	a4,a2,1bc0 <strncpy+0x1ce>
    1b4c:	000785a3          	sb	zero,11(a5)
    1b50:	00c6871b          	addiw	a4,a3,12
    1b54:	06c77663          	bgeu	a4,a2,1bc0 <strncpy+0x1ce>
    1b58:	00078623          	sb	zero,12(a5)
    1b5c:	26b5                	addiw	a3,a3,13
    1b5e:	06c6f163          	bgeu	a3,a2,1bc0 <strncpy+0x1ce>
    1b62:	000786a3          	sb	zero,13(a5)
    1b66:	8082                	ret
            ;
        if (!n || !*s)
    1b68:	c645                	beqz	a2,1c10 <strncpy+0x21e>
    1b6a:	0005c783          	lbu	a5,0(a1)
    1b6e:	ea078be3          	beqz	a5,1a24 <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b72:	479d                	li	a5,7
    1b74:	02c7ff63          	bgeu	a5,a2,1bb2 <strncpy+0x1c0>
    1b78:	00000897          	auipc	a7,0x0
    1b7c:	3c08b883          	ld	a7,960(a7) # 1f38 <__clone+0xa6>
    1b80:	00000817          	auipc	a6,0x0
    1b84:	3c083803          	ld	a6,960(a6) # 1f40 <__clone+0xae>
    1b88:	431d                	li	t1,7
    1b8a:	6198                	ld	a4,0(a1)
    1b8c:	011707b3          	add	a5,a4,a7
    1b90:	fff74693          	not	a3,a4
    1b94:	8ff5                	and	a5,a5,a3
    1b96:	0107f7b3          	and	a5,a5,a6
    1b9a:	ef81                	bnez	a5,1bb2 <strncpy+0x1c0>
            *wd = *ws;
    1b9c:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b9e:	1661                	addi	a2,a2,-8
    1ba0:	05a1                	addi	a1,a1,8
    1ba2:	0521                	addi	a0,a0,8
    1ba4:	fec363e3          	bltu	t1,a2,1b8a <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1ba8:	e609                	bnez	a2,1bb2 <strncpy+0x1c0>
    1baa:	a08d                	j	1c0c <strncpy+0x21a>
    1bac:	167d                	addi	a2,a2,-1
    1bae:	0505                	addi	a0,a0,1
    1bb0:	ca01                	beqz	a2,1bc0 <strncpy+0x1ce>
    1bb2:	0005c783          	lbu	a5,0(a1)
    1bb6:	0585                	addi	a1,a1,1
    1bb8:	00f50023          	sb	a5,0(a0)
    1bbc:	fbe5                	bnez	a5,1bac <strncpy+0x1ba>
        ;
tail:
    1bbe:	b59d                	j	1a24 <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1bc0:	8082                	ret
    1bc2:	472d                	li	a4,11
    1bc4:	bdb5                	j	1a40 <strncpy+0x4e>
    1bc6:	00778713          	addi	a4,a5,7
    1bca:	45ad                	li	a1,11
    1bcc:	fff60693          	addi	a3,a2,-1
    1bd0:	e6b778e3          	bgeu	a4,a1,1a40 <strncpy+0x4e>
    1bd4:	b7fd                	j	1bc2 <strncpy+0x1d0>
    1bd6:	40a007b3          	neg	a5,a0
    1bda:	8832                	mv	a6,a2
    1bdc:	8b9d                	andi	a5,a5,7
    1bde:	4681                	li	a3,0
    1be0:	e4060be3          	beqz	a2,1a36 <strncpy+0x44>
    1be4:	b7cd                	j	1bc6 <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1be6:	468d                	li	a3,3
    1be8:	bd75                	j	1aa4 <strncpy+0xb2>
    1bea:	872a                	mv	a4,a0
    1bec:	4681                	li	a3,0
    1bee:	bd5d                	j	1aa4 <strncpy+0xb2>
    1bf0:	4685                	li	a3,1
    1bf2:	bd4d                	j	1aa4 <strncpy+0xb2>
    1bf4:	8082                	ret
    1bf6:	87aa                	mv	a5,a0
    1bf8:	4681                	li	a3,0
    1bfa:	b5f9                	j	1ac8 <strncpy+0xd6>
    1bfc:	4689                	li	a3,2
    1bfe:	b55d                	j	1aa4 <strncpy+0xb2>
    1c00:	4691                	li	a3,4
    1c02:	b54d                	j	1aa4 <strncpy+0xb2>
    1c04:	4695                	li	a3,5
    1c06:	bd79                	j	1aa4 <strncpy+0xb2>
    1c08:	4699                	li	a3,6
    1c0a:	bd69                	j	1aa4 <strncpy+0xb2>
    1c0c:	8082                	ret
    1c0e:	8082                	ret
    1c10:	8082                	ret

0000000000001c12 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c12:	87aa                	mv	a5,a0
    1c14:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c16:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c1a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c1e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c20:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c22:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c26:	2501                	sext.w	a0,a0
    1c28:	8082                	ret

0000000000001c2a <openat>:
    register long a7 __asm__("a7") = n;
    1c2a:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c2e:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c32:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c36:	2501                	sext.w	a0,a0
    1c38:	8082                	ret

0000000000001c3a <fcntl>:
    register long a7 __asm__("a7") = n;
    1c3a:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c3c:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1c40:	2501                	sext.w	a0,a0
    1c42:	8082                	ret

0000000000001c44 <close>:
    register long a7 __asm__("a7") = n;
    1c44:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c48:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c4c:	2501                	sext.w	a0,a0
    1c4e:	8082                	ret

0000000000001c50 <read>:
    register long a7 __asm__("a7") = n;
    1c50:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c54:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c58:	8082                	ret

0000000000001c5a <write>:
    register long a7 __asm__("a7") = n;
    1c5a:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c5e:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c62:	8082                	ret

0000000000001c64 <getpid>:
    register long a7 __asm__("a7") = n;
    1c64:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c68:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c6c:	2501                	sext.w	a0,a0
    1c6e:	8082                	ret

0000000000001c70 <getppid>:
    register long a7 __asm__("a7") = n;
    1c70:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c74:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c78:	2501                	sext.w	a0,a0
    1c7a:	8082                	ret

0000000000001c7c <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c7c:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c80:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c84:	2501                	sext.w	a0,a0
    1c86:	8082                	ret

0000000000001c88 <fork>:
    register long a7 __asm__("a7") = n;
    1c88:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c8c:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c8e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c90:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c94:	2501                	sext.w	a0,a0
    1c96:	8082                	ret

0000000000001c98 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c98:	85b2                	mv	a1,a2
    1c9a:	863a                	mv	a2,a4
    if (stack)
    1c9c:	c191                	beqz	a1,1ca0 <clone+0x8>
	stack += stack_size;
    1c9e:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1ca0:	4781                	li	a5,0
    1ca2:	4701                	li	a4,0
    1ca4:	4681                	li	a3,0
    1ca6:	2601                	sext.w	a2,a2
    1ca8:	a2ed                	j	1e92 <__clone>

0000000000001caa <exit>:
    register long a7 __asm__("a7") = n;
    1caa:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cae:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cb2:	8082                	ret

0000000000001cb4 <waitpid>:
    register long a7 __asm__("a7") = n;
    1cb4:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cb8:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cba:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cbe:	2501                	sext.w	a0,a0
    1cc0:	8082                	ret

0000000000001cc2 <exec>:
    register long a7 __asm__("a7") = n;
    1cc2:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cc6:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cca:	2501                	sext.w	a0,a0
    1ccc:	8082                	ret

0000000000001cce <execve>:
    register long a7 __asm__("a7") = n;
    1cce:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cd2:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cd6:	2501                	sext.w	a0,a0
    1cd8:	8082                	ret

0000000000001cda <times>:
    register long a7 __asm__("a7") = n;
    1cda:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cde:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1ce2:	2501                	sext.w	a0,a0
    1ce4:	8082                	ret

0000000000001ce6 <get_time>:

int64 get_time()
{
    1ce6:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1ce8:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1cec:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1cee:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cf0:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1cf4:	2501                	sext.w	a0,a0
    1cf6:	ed09                	bnez	a0,1d10 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1cf8:	67a2                	ld	a5,8(sp)
    1cfa:	3e800713          	li	a4,1000
    1cfe:	00015503          	lhu	a0,0(sp)
    1d02:	02e7d7b3          	divu	a5,a5,a4
    1d06:	02e50533          	mul	a0,a0,a4
    1d0a:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d0c:	0141                	addi	sp,sp,16
    1d0e:	8082                	ret
        return -1;
    1d10:	557d                	li	a0,-1
    1d12:	bfed                	j	1d0c <get_time+0x26>

0000000000001d14 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d14:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d18:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d1c:	2501                	sext.w	a0,a0
    1d1e:	8082                	ret

0000000000001d20 <time>:
    register long a7 __asm__("a7") = n;
    1d20:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d24:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d28:	2501                	sext.w	a0,a0
    1d2a:	8082                	ret

0000000000001d2c <sleep>:

int sleep(unsigned long long time)
{
    1d2c:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d2e:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d30:	850a                	mv	a0,sp
    1d32:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d34:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d38:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d3a:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d3e:	e501                	bnez	a0,1d46 <sleep+0x1a>
    return 0;
    1d40:	4501                	li	a0,0
}
    1d42:	0141                	addi	sp,sp,16
    1d44:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d46:	4502                	lw	a0,0(sp)
}
    1d48:	0141                	addi	sp,sp,16
    1d4a:	8082                	ret

0000000000001d4c <set_priority>:
    register long a7 __asm__("a7") = n;
    1d4c:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d50:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d54:	2501                	sext.w	a0,a0
    1d56:	8082                	ret

0000000000001d58 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d58:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d5c:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d60:	8082                	ret

0000000000001d62 <munmap>:
    register long a7 __asm__("a7") = n;
    1d62:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d66:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d6a:	2501                	sext.w	a0,a0
    1d6c:	8082                	ret

0000000000001d6e <wait>:

int wait(int *code)
{
    1d6e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d70:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d74:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d76:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d78:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d7a:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d7e:	2501                	sext.w	a0,a0
    1d80:	8082                	ret

0000000000001d82 <spawn>:
    register long a7 __asm__("a7") = n;
    1d82:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d86:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d8a:	2501                	sext.w	a0,a0
    1d8c:	8082                	ret

0000000000001d8e <mailread>:
    register long a7 __asm__("a7") = n;
    1d8e:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d92:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d96:	2501                	sext.w	a0,a0
    1d98:	8082                	ret

0000000000001d9a <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d9a:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d9e:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1da2:	2501                	sext.w	a0,a0
    1da4:	8082                	ret

0000000000001da6 <fstat>:
    register long a7 __asm__("a7") = n;
    1da6:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1daa:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dae:	2501                	sext.w	a0,a0
    1db0:	8082                	ret

0000000000001db2 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1db2:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1db4:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1db8:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dba:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	8082                	ret

0000000000001dc2 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1dc2:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dc4:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1dc8:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dca:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1dce:	2501                	sext.w	a0,a0
    1dd0:	8082                	ret

0000000000001dd2 <link>:

int link(char *old_path, char *new_path)
{
    1dd2:	87aa                	mv	a5,a0
    1dd4:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1dd6:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1dda:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1dde:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1de0:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1de4:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1de6:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1dea:	2501                	sext.w	a0,a0
    1dec:	8082                	ret

0000000000001dee <unlink>:

int unlink(char *path)
{
    1dee:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1df0:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1df4:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1df8:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dfa:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1dfe:	2501                	sext.w	a0,a0
    1e00:	8082                	ret

0000000000001e02 <uname>:
    register long a7 __asm__("a7") = n;
    1e02:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e06:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e0a:	2501                	sext.w	a0,a0
    1e0c:	8082                	ret

0000000000001e0e <brk>:
    register long a7 __asm__("a7") = n;
    1e0e:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e12:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e16:	2501                	sext.w	a0,a0
    1e18:	8082                	ret

0000000000001e1a <getcwd>:
    register long a7 __asm__("a7") = n;
    1e1a:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e1c:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e20:	8082                	ret

0000000000001e22 <chdir>:
    register long a7 __asm__("a7") = n;
    1e22:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e26:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e2a:	2501                	sext.w	a0,a0
    1e2c:	8082                	ret

0000000000001e2e <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e2e:	862e                	mv	a2,a1
    1e30:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e32:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e34:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e38:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e3c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e3e:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e40:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e44:	2501                	sext.w	a0,a0
    1e46:	8082                	ret

0000000000001e48 <getdents>:
    register long a7 __asm__("a7") = n;
    1e48:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e4c:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e50:	2501                	sext.w	a0,a0
    1e52:	8082                	ret

0000000000001e54 <pipe>:
    register long a7 __asm__("a7") = n;
    1e54:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e58:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5a:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e5e:	2501                	sext.w	a0,a0
    1e60:	8082                	ret

0000000000001e62 <dup>:
    register long a7 __asm__("a7") = n;
    1e62:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e64:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e68:	2501                	sext.w	a0,a0
    1e6a:	8082                	ret

0000000000001e6c <dup2>:
    register long a7 __asm__("a7") = n;
    1e6c:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e6e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e70:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e74:	2501                	sext.w	a0,a0
    1e76:	8082                	ret

0000000000001e78 <mount>:
    register long a7 __asm__("a7") = n;
    1e78:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e7c:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e80:	2501                	sext.w	a0,a0
    1e82:	8082                	ret

0000000000001e84 <umount>:
    register long a7 __asm__("a7") = n;
    1e84:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e88:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e8a:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e8e:	2501                	sext.w	a0,a0
    1e90:	8082                	ret

0000000000001e92 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e92:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1e94:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e96:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e98:	8532                	mv	a0,a2
	mv a2, a4
    1e9a:	863a                	mv	a2,a4
	mv a3, a5
    1e9c:	86be                	mv	a3,a5
	mv a4, a6
    1e9e:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ea0:	0dc00893          	li	a7,220
	ecall
    1ea4:	00000073          	ecall

	beqz a0, 1f
    1ea8:	c111                	beqz	a0,1eac <__clone+0x1a>
	# Parent
	ret
    1eaa:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1eac:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1eae:	6522                	ld	a0,8(sp)
	jalr a1
    1eb0:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1eb2:	05d00893          	li	a7,93
	ecall
    1eb6:	00000073          	ecall
