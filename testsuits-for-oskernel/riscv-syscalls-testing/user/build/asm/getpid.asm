
/home/brightnight/OScompetition/6.13晚final_main/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/getpid：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a061                	j	108a <__start_main>

0000000000001004 <test_getpid>:
/*
理想结果：得到进程 pid，注意要关注 pid 是否符合内核逻辑，不要单纯以 Test OK! 作为判断。
*/

int test_getpid()
{
    1004:	1101                	addi	sp,sp,-32
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	eca50513          	addi	a0,a0,-310 # 1ed0 <__clone+0x28>
{
    100e:	ec06                	sd	ra,24(sp)
    TEST_START(__func__);
    1010:	2ec000ef          	jal	ra,12fc <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	f5450513          	addi	a0,a0,-172 # 1f68 <__func__.0>
    101c:	2e0000ef          	jal	ra,12fc <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	ec850513          	addi	a0,a0,-312 # 1ee8 <__clone+0x40>
    1028:	2d4000ef          	jal	ra,12fc <puts>
    int pid = getpid();
    102c:	44f000ef          	jal	ra,1c7a <getpid>
    1030:	85aa                	mv	a1,a0
    assert(pid >= 0);
    1032:	02054b63          	bltz	a0,1068 <test_getpid+0x64>
    printf("getpid success.\npid = %d\n", pid);
    1036:	00001517          	auipc	a0,0x1
    103a:	ee250513          	addi	a0,a0,-286 # 1f18 <__clone+0x70>
    103e:	2e0000ef          	jal	ra,131e <printf>
    TEST_END(__func__);
    1042:	00001517          	auipc	a0,0x1
    1046:	ef650513          	addi	a0,a0,-266 # 1f38 <__clone+0x90>
    104a:	2b2000ef          	jal	ra,12fc <puts>
    104e:	00001517          	auipc	a0,0x1
    1052:	f1a50513          	addi	a0,a0,-230 # 1f68 <__func__.0>
    1056:	2a6000ef          	jal	ra,12fc <puts>
}
    105a:	60e2                	ld	ra,24(sp)
    TEST_END(__func__);
    105c:	00001517          	auipc	a0,0x1
    1060:	e8c50513          	addi	a0,a0,-372 # 1ee8 <__clone+0x40>
}
    1064:	6105                	addi	sp,sp,32
    TEST_END(__func__);
    1066:	ac59                	j	12fc <puts>
    1068:	e42a                	sd	a0,8(sp)
    assert(pid >= 0);
    106a:	00001517          	auipc	a0,0x1
    106e:	e8e50513          	addi	a0,a0,-370 # 1ef8 <__clone+0x50>
    1072:	530000ef          	jal	ra,15a2 <panic>
    1076:	65a2                	ld	a1,8(sp)
    1078:	bf7d                	j	1036 <test_getpid+0x32>

000000000000107a <main>:

int main(void) {
    107a:	1141                	addi	sp,sp,-16
    107c:	e406                	sd	ra,8(sp)
	test_getpid();
    107e:	f87ff0ef          	jal	ra,1004 <test_getpid>
	return 0;
}
    1082:	60a2                	ld	ra,8(sp)
    1084:	4501                	li	a0,0
    1086:	0141                	addi	sp,sp,16
    1088:	8082                	ret

000000000000108a <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    108a:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    108c:	4108                	lw	a0,0(a0)
{
    108e:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    1090:	05a1                	addi	a1,a1,8
{
    1092:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1094:	fe7ff0ef          	jal	ra,107a <main>
    1098:	429000ef          	jal	ra,1cc0 <exit>
	return 0;
}
    109c:	60a2                	ld	ra,8(sp)
    109e:	4501                	li	a0,0
    10a0:	0141                	addi	sp,sp,16
    10a2:	8082                	ret

00000000000010a4 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10a4:	7179                	addi	sp,sp,-48
    10a6:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10a8:	12054b63          	bltz	a0,11de <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10ac:	02b577bb          	remuw	a5,a0,a1
    10b0:	00001617          	auipc	a2,0x1
    10b4:	ec860613          	addi	a2,a2,-312 # 1f78 <digits>
    buf[16] = 0;
    10b8:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10bc:	0005871b          	sext.w	a4,a1
    10c0:	1782                	slli	a5,a5,0x20
    10c2:	9381                	srli	a5,a5,0x20
    10c4:	97b2                	add	a5,a5,a2
    10c6:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10ca:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10ce:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10d2:	1cb56363          	bltu	a0,a1,1298 <printint.constprop.0+0x1f4>
        buf[i--] = digits[x % base];
    10d6:	45b9                	li	a1,14
    10d8:	02e877bb          	remuw	a5,a6,a4
    10dc:	1782                	slli	a5,a5,0x20
    10de:	9381                	srli	a5,a5,0x20
    10e0:	97b2                	add	a5,a5,a2
    10e2:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10e6:	02e856bb          	divuw	a3,a6,a4
        buf[i--] = digits[x % base];
    10ea:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    10ee:	0ce86e63          	bltu	a6,a4,11ca <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    10f2:	02e6f5bb          	remuw	a1,a3,a4
    } while ((x /= base) != 0);
    10f6:	02e6d7bb          	divuw	a5,a3,a4
        buf[i--] = digits[x % base];
    10fa:	1582                	slli	a1,a1,0x20
    10fc:	9181                	srli	a1,a1,0x20
    10fe:	95b2                	add	a1,a1,a2
    1100:	0005c583          	lbu	a1,0(a1)
    1104:	00b10aa3          	sb	a1,21(sp)
    } while ((x /= base) != 0);
    1108:	0007859b          	sext.w	a1,a5
    110c:	12e6ec63          	bltu	a3,a4,1244 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    1110:	02e7f6bb          	remuw	a3,a5,a4
    1114:	1682                	slli	a3,a3,0x20
    1116:	9281                	srli	a3,a3,0x20
    1118:	96b2                	add	a3,a3,a2
    111a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    111e:	02e7d83b          	divuw	a6,a5,a4
        buf[i--] = digits[x % base];
    1122:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1126:	12e5e863          	bltu	a1,a4,1256 <printint.constprop.0+0x1b2>
        buf[i--] = digits[x % base];
    112a:	02e876bb          	remuw	a3,a6,a4
    112e:	1682                	slli	a3,a3,0x20
    1130:	9281                	srli	a3,a3,0x20
    1132:	96b2                	add	a3,a3,a2
    1134:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1138:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    113c:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1140:	12e86463          	bltu	a6,a4,1268 <printint.constprop.0+0x1c4>
        buf[i--] = digits[x % base];
    1144:	02e5f6bb          	remuw	a3,a1,a4
    1148:	1682                	slli	a3,a3,0x20
    114a:	9281                	srli	a3,a3,0x20
    114c:	96b2                	add	a3,a3,a2
    114e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1152:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1156:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    115a:	0ce5ec63          	bltu	a1,a4,1232 <printint.constprop.0+0x18e>
        buf[i--] = digits[x % base];
    115e:	02e876bb          	remuw	a3,a6,a4
    1162:	1682                	slli	a3,a3,0x20
    1164:	9281                	srli	a3,a3,0x20
    1166:	96b2                	add	a3,a3,a2
    1168:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    116c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1170:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1174:	10e86963          	bltu	a6,a4,1286 <printint.constprop.0+0x1e2>
        buf[i--] = digits[x % base];
    1178:	02e5f6bb          	remuw	a3,a1,a4
    117c:	1682                	slli	a3,a3,0x20
    117e:	9281                	srli	a3,a3,0x20
    1180:	96b2                	add	a3,a3,a2
    1182:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1186:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    118a:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    118e:	10e5e763          	bltu	a1,a4,129c <printint.constprop.0+0x1f8>
        buf[i--] = digits[x % base];
    1192:	02e876bb          	remuw	a3,a6,a4
    1196:	1682                	slli	a3,a3,0x20
    1198:	9281                	srli	a3,a3,0x20
    119a:	96b2                	add	a3,a3,a2
    119c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11a0:	02e857bb          	divuw	a5,a6,a4
        buf[i--] = digits[x % base];
    11a4:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11a8:	10e86363          	bltu	a6,a4,12ae <printint.constprop.0+0x20a>
        buf[i--] = digits[x % base];
    11ac:	1782                	slli	a5,a5,0x20
    11ae:	9381                	srli	a5,a5,0x20
    11b0:	97b2                	add	a5,a5,a2
    11b2:	0007c783          	lbu	a5,0(a5)
    11b6:	4599                	li	a1,6
    11b8:	00f10723          	sb	a5,14(sp)

    if (sign)
    11bc:	00055763          	bgez	a0,11ca <printint.constprop.0+0x126>
        buf[i--] = '-';
    11c0:	02d00793          	li	a5,45
    11c4:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11c8:	4595                	li	a1,5
    write(f, s, l);
    11ca:	003c                	addi	a5,sp,8
    11cc:	4641                	li	a2,16
    11ce:	9e0d                	subw	a2,a2,a1
    11d0:	4505                	li	a0,1
    11d2:	95be                	add	a1,a1,a5
    11d4:	29d000ef          	jal	ra,1c70 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11d8:	70a2                	ld	ra,40(sp)
    11da:	6145                	addi	sp,sp,48
    11dc:	8082                	ret
        x = -xx;
    11de:	40a0083b          	negw	a6,a0
        buf[i--] = digits[x % base];
    11e2:	02b877bb          	remuw	a5,a6,a1
    11e6:	00001617          	auipc	a2,0x1
    11ea:	d9260613          	addi	a2,a2,-622 # 1f78 <digits>
    buf[16] = 0;
    11ee:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    11f2:	0005871b          	sext.w	a4,a1
    11f6:	1782                	slli	a5,a5,0x20
    11f8:	9381                	srli	a5,a5,0x20
    11fa:	97b2                	add	a5,a5,a2
    11fc:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1200:	02b858bb          	divuw	a7,a6,a1
        buf[i--] = digits[x % base];
    1204:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1208:	06b86963          	bltu	a6,a1,127a <printint.constprop.0+0x1d6>
        buf[i--] = digits[x % base];
    120c:	02e8f7bb          	remuw	a5,a7,a4
    1210:	1782                	slli	a5,a5,0x20
    1212:	9381                	srli	a5,a5,0x20
    1214:	97b2                	add	a5,a5,a2
    1216:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    121a:	02e8d6bb          	divuw	a3,a7,a4
        buf[i--] = digits[x % base];
    121e:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    1222:	ece8f8e3          	bgeu	a7,a4,10f2 <printint.constprop.0+0x4e>
        buf[i--] = '-';
    1226:	02d00793          	li	a5,45
    122a:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    122e:	45b5                	li	a1,13
    1230:	bf69                	j	11ca <printint.constprop.0+0x126>
    1232:	45a9                	li	a1,10
    if (sign)
    1234:	f8055be3          	bgez	a0,11ca <printint.constprop.0+0x126>
        buf[i--] = '-';
    1238:	02d00793          	li	a5,45
    123c:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1240:	45a5                	li	a1,9
    1242:	b761                	j	11ca <printint.constprop.0+0x126>
    1244:	45b5                	li	a1,13
    if (sign)
    1246:	f80552e3          	bgez	a0,11ca <printint.constprop.0+0x126>
        buf[i--] = '-';
    124a:	02d00793          	li	a5,45
    124e:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1252:	45b1                	li	a1,12
    1254:	bf9d                	j	11ca <printint.constprop.0+0x126>
    1256:	45b1                	li	a1,12
    if (sign)
    1258:	f60559e3          	bgez	a0,11ca <printint.constprop.0+0x126>
        buf[i--] = '-';
    125c:	02d00793          	li	a5,45
    1260:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1264:	45ad                	li	a1,11
    1266:	b795                	j	11ca <printint.constprop.0+0x126>
    1268:	45ad                	li	a1,11
    if (sign)
    126a:	f60550e3          	bgez	a0,11ca <printint.constprop.0+0x126>
        buf[i--] = '-';
    126e:	02d00793          	li	a5,45
    1272:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1276:	45a9                	li	a1,10
    1278:	bf89                	j	11ca <printint.constprop.0+0x126>
        buf[i--] = '-';
    127a:	02d00793          	li	a5,45
    127e:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1282:	45b9                	li	a1,14
    1284:	b799                	j	11ca <printint.constprop.0+0x126>
    1286:	45a5                	li	a1,9
    if (sign)
    1288:	f40551e3          	bgez	a0,11ca <printint.constprop.0+0x126>
        buf[i--] = '-';
    128c:	02d00793          	li	a5,45
    1290:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1294:	45a1                	li	a1,8
    1296:	bf15                	j	11ca <printint.constprop.0+0x126>
    i = 15;
    1298:	45bd                	li	a1,15
    129a:	bf05                	j	11ca <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    129c:	45a1                	li	a1,8
    if (sign)
    129e:	f20556e3          	bgez	a0,11ca <printint.constprop.0+0x126>
        buf[i--] = '-';
    12a2:	02d00793          	li	a5,45
    12a6:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12aa:	459d                	li	a1,7
    12ac:	bf39                	j	11ca <printint.constprop.0+0x126>
    12ae:	459d                	li	a1,7
    if (sign)
    12b0:	f0055de3          	bgez	a0,11ca <printint.constprop.0+0x126>
        buf[i--] = '-';
    12b4:	02d00793          	li	a5,45
    12b8:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12bc:	4599                	li	a1,6
    12be:	b731                	j	11ca <printint.constprop.0+0x126>

00000000000012c0 <getchar>:
{
    12c0:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12c2:	00f10593          	addi	a1,sp,15
    12c6:	4605                	li	a2,1
    12c8:	4501                	li	a0,0
{
    12ca:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12cc:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12d0:	197000ef          	jal	ra,1c66 <read>
}
    12d4:	60e2                	ld	ra,24(sp)
    12d6:	00f14503          	lbu	a0,15(sp)
    12da:	6105                	addi	sp,sp,32
    12dc:	8082                	ret

00000000000012de <putchar>:
{
    12de:	1101                	addi	sp,sp,-32
    12e0:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12e2:	00f10593          	addi	a1,sp,15
    12e6:	4605                	li	a2,1
    12e8:	4505                	li	a0,1
{
    12ea:	ec06                	sd	ra,24(sp)
    char byte = c;
    12ec:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12f0:	181000ef          	jal	ra,1c70 <write>
}
    12f4:	60e2                	ld	ra,24(sp)
    12f6:	2501                	sext.w	a0,a0
    12f8:	6105                	addi	sp,sp,32
    12fa:	8082                	ret

00000000000012fc <puts>:
{
    12fc:	1141                	addi	sp,sp,-16
    12fe:	e406                	sd	ra,8(sp)
    1300:	e022                	sd	s0,0(sp)
    1302:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1304:	57e000ef          	jal	ra,1882 <strlen>
    1308:	862a                	mv	a2,a0
    130a:	85a2                	mv	a1,s0
    130c:	4505                	li	a0,1
    130e:	163000ef          	jal	ra,1c70 <write>
}
    1312:	60a2                	ld	ra,8(sp)
    1314:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1316:	957d                	srai	a0,a0,0x3f
    return r;
    1318:	2501                	sext.w	a0,a0
}
    131a:	0141                	addi	sp,sp,16
    131c:	8082                	ret

000000000000131e <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    131e:	7171                	addi	sp,sp,-176
    1320:	fc56                	sd	s5,56(sp)
    1322:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1324:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1326:	18bc                	addi	a5,sp,120
{
    1328:	e8ca                	sd	s2,80(sp)
    132a:	e4ce                	sd	s3,72(sp)
    132c:	e0d2                	sd	s4,64(sp)
    132e:	f85a                	sd	s6,48(sp)
    1330:	f486                	sd	ra,104(sp)
    1332:	f0a2                	sd	s0,96(sp)
    1334:	eca6                	sd	s1,88(sp)
    1336:	fcae                	sd	a1,120(sp)
    1338:	e132                	sd	a2,128(sp)
    133a:	e536                	sd	a3,136(sp)
    133c:	e93a                	sd	a4,144(sp)
    133e:	f142                	sd	a6,160(sp)
    1340:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1342:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1344:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1348:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    134c:	00001b17          	auipc	s6,0x1
    1350:	bfcb0b13          	addi	s6,s6,-1028 # 1f48 <__clone+0xa0>
    buf[i++] = '0';
    1354:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1358:	00001997          	auipc	s3,0x1
    135c:	c2098993          	addi	s3,s3,-992 # 1f78 <digits>
        if (!*s)
    1360:	00054783          	lbu	a5,0(a0)
    1364:	16078a63          	beqz	a5,14d8 <printf+0x1ba>
    1368:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    136a:	19278163          	beq	a5,s2,14ec <printf+0x1ce>
    136e:	00164783          	lbu	a5,1(a2)
    1372:	0605                	addi	a2,a2,1
    1374:	fbfd                	bnez	a5,136a <printf+0x4c>
    1376:	84b2                	mv	s1,a2
        l = z - a;
    1378:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    137c:	85aa                	mv	a1,a0
    137e:	8622                	mv	a2,s0
    1380:	4505                	li	a0,1
    1382:	0ef000ef          	jal	ra,1c70 <write>
        if (l)
    1386:	18041c63          	bnez	s0,151e <printf+0x200>
        if (s[1] == 0)
    138a:	0014c783          	lbu	a5,1(s1)
    138e:	14078563          	beqz	a5,14d8 <printf+0x1ba>
        switch (s[1])
    1392:	1d478063          	beq	a5,s4,1552 <printf+0x234>
    1396:	18fa6663          	bltu	s4,a5,1522 <printf+0x204>
    139a:	06400713          	li	a4,100
    139e:	1ae78063          	beq	a5,a4,153e <printf+0x220>
    13a2:	07000713          	li	a4,112
    13a6:	1ce79963          	bne	a5,a4,1578 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    13aa:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13ac:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13b0:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13b2:	631c                	ld	a5,0(a4)
    13b4:	0721                	addi	a4,a4,8
    13b6:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13b8:	00479293          	slli	t0,a5,0x4
    13bc:	00879f93          	slli	t6,a5,0x8
    13c0:	00c79f13          	slli	t5,a5,0xc
    13c4:	01079e93          	slli	t4,a5,0x10
    13c8:	01479e13          	slli	t3,a5,0x14
    13cc:	01879313          	slli	t1,a5,0x18
    13d0:	01c79893          	slli	a7,a5,0x1c
    13d4:	02479813          	slli	a6,a5,0x24
    13d8:	02879513          	slli	a0,a5,0x28
    13dc:	02c79593          	slli	a1,a5,0x2c
    13e0:	03079693          	slli	a3,a5,0x30
    13e4:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13e8:	03c7d413          	srli	s0,a5,0x3c
    13ec:	01c7d39b          	srliw	t2,a5,0x1c
    13f0:	03c2d293          	srli	t0,t0,0x3c
    13f4:	03cfdf93          	srli	t6,t6,0x3c
    13f8:	03cf5f13          	srli	t5,t5,0x3c
    13fc:	03cede93          	srli	t4,t4,0x3c
    1400:	03ce5e13          	srli	t3,t3,0x3c
    1404:	03c35313          	srli	t1,t1,0x3c
    1408:	03c8d893          	srli	a7,a7,0x3c
    140c:	03c85813          	srli	a6,a6,0x3c
    1410:	9171                	srli	a0,a0,0x3c
    1412:	91f1                	srli	a1,a1,0x3c
    1414:	92f1                	srli	a3,a3,0x3c
    1416:	9371                	srli	a4,a4,0x3c
    1418:	96ce                	add	a3,a3,s3
    141a:	974e                	add	a4,a4,s3
    141c:	944e                	add	s0,s0,s3
    141e:	92ce                	add	t0,t0,s3
    1420:	9fce                	add	t6,t6,s3
    1422:	9f4e                	add	t5,t5,s3
    1424:	9ece                	add	t4,t4,s3
    1426:	9e4e                	add	t3,t3,s3
    1428:	934e                	add	t1,t1,s3
    142a:	98ce                	add	a7,a7,s3
    142c:	93ce                	add	t2,t2,s3
    142e:	984e                	add	a6,a6,s3
    1430:	954e                	add	a0,a0,s3
    1432:	95ce                	add	a1,a1,s3
    1434:	0006c083          	lbu	ra,0(a3)
    1438:	0002c283          	lbu	t0,0(t0)
    143c:	00074683          	lbu	a3,0(a4)
    1440:	000fcf83          	lbu	t6,0(t6)
    1444:	000f4f03          	lbu	t5,0(t5)
    1448:	000ece83          	lbu	t4,0(t4)
    144c:	000e4e03          	lbu	t3,0(t3)
    1450:	00034303          	lbu	t1,0(t1)
    1454:	0008c883          	lbu	a7,0(a7)
    1458:	0003c383          	lbu	t2,0(t2)
    145c:	00084803          	lbu	a6,0(a6)
    1460:	00054503          	lbu	a0,0(a0)
    1464:	0005c583          	lbu	a1,0(a1)
    1468:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    146c:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1470:	9371                	srli	a4,a4,0x3c
    1472:	8bbd                	andi	a5,a5,15
    1474:	974e                	add	a4,a4,s3
    1476:	97ce                	add	a5,a5,s3
    1478:	005105a3          	sb	t0,11(sp)
    147c:	01f10623          	sb	t6,12(sp)
    1480:	01e106a3          	sb	t5,13(sp)
    1484:	01d10723          	sb	t4,14(sp)
    1488:	01c107a3          	sb	t3,15(sp)
    148c:	00610823          	sb	t1,16(sp)
    1490:	011108a3          	sb	a7,17(sp)
    1494:	00710923          	sb	t2,18(sp)
    1498:	010109a3          	sb	a6,19(sp)
    149c:	00a10a23          	sb	a0,20(sp)
    14a0:	00b10aa3          	sb	a1,21(sp)
    14a4:	00110b23          	sb	ra,22(sp)
    14a8:	00d10ba3          	sb	a3,23(sp)
    14ac:	00810523          	sb	s0,10(sp)
    14b0:	00074703          	lbu	a4,0(a4)
    14b4:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14b8:	002c                	addi	a1,sp,8
    14ba:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14bc:	00e10c23          	sb	a4,24(sp)
    14c0:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14c4:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14c8:	7a8000ef          	jal	ra,1c70 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14cc:	00248513          	addi	a0,s1,2
        if (!*s)
    14d0:	00054783          	lbu	a5,0(a0)
    14d4:	e8079ae3          	bnez	a5,1368 <printf+0x4a>
    }
    va_end(ap);
}
    14d8:	70a6                	ld	ra,104(sp)
    14da:	7406                	ld	s0,96(sp)
    14dc:	64e6                	ld	s1,88(sp)
    14de:	6946                	ld	s2,80(sp)
    14e0:	69a6                	ld	s3,72(sp)
    14e2:	6a06                	ld	s4,64(sp)
    14e4:	7ae2                	ld	s5,56(sp)
    14e6:	7b42                	ld	s6,48(sp)
    14e8:	614d                	addi	sp,sp,176
    14ea:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14ec:	00064783          	lbu	a5,0(a2)
    14f0:	84b2                	mv	s1,a2
    14f2:	01278963          	beq	a5,s2,1504 <printf+0x1e6>
    14f6:	b549                	j	1378 <printf+0x5a>
    14f8:	0024c783          	lbu	a5,2(s1)
    14fc:	0605                	addi	a2,a2,1
    14fe:	0489                	addi	s1,s1,2
    1500:	e7279ce3          	bne	a5,s2,1378 <printf+0x5a>
    1504:	0014c783          	lbu	a5,1(s1)
    1508:	ff2788e3          	beq	a5,s2,14f8 <printf+0x1da>
        l = z - a;
    150c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1510:	85aa                	mv	a1,a0
    1512:	8622                	mv	a2,s0
    1514:	4505                	li	a0,1
    1516:	75a000ef          	jal	ra,1c70 <write>
        if (l)
    151a:	e60408e3          	beqz	s0,138a <printf+0x6c>
    151e:	8526                	mv	a0,s1
    1520:	b581                	j	1360 <printf+0x42>
        switch (s[1])
    1522:	07800713          	li	a4,120
    1526:	04e79963          	bne	a5,a4,1578 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    152a:	6782                	ld	a5,0(sp)
    152c:	45c1                	li	a1,16
    152e:	4388                	lw	a0,0(a5)
    1530:	07a1                	addi	a5,a5,8
    1532:	e03e                	sd	a5,0(sp)
    1534:	b71ff0ef          	jal	ra,10a4 <printint.constprop.0>
        s += 2;
    1538:	00248513          	addi	a0,s1,2
    153c:	bf51                	j	14d0 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    153e:	6782                	ld	a5,0(sp)
    1540:	45a9                	li	a1,10
    1542:	4388                	lw	a0,0(a5)
    1544:	07a1                	addi	a5,a5,8
    1546:	e03e                	sd	a5,0(sp)
    1548:	b5dff0ef          	jal	ra,10a4 <printint.constprop.0>
        s += 2;
    154c:	00248513          	addi	a0,s1,2
    1550:	b741                	j	14d0 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1552:	6782                	ld	a5,0(sp)
    1554:	6380                	ld	s0,0(a5)
    1556:	07a1                	addi	a5,a5,8
    1558:	e03e                	sd	a5,0(sp)
    155a:	c031                	beqz	s0,159e <printf+0x280>
            l = strnlen(a, 200);
    155c:	0c800593          	li	a1,200
    1560:	8522                	mv	a0,s0
    1562:	40c000ef          	jal	ra,196e <strnlen>
    write(f, s, l);
    1566:	0005061b          	sext.w	a2,a0
    156a:	85a2                	mv	a1,s0
    156c:	4505                	li	a0,1
    156e:	702000ef          	jal	ra,1c70 <write>
        s += 2;
    1572:	00248513          	addi	a0,s1,2
    1576:	bfa9                	j	14d0 <printf+0x1b2>
    return write(stdout, &byte, 1);
    1578:	4605                	li	a2,1
    157a:	002c                	addi	a1,sp,8
    157c:	4505                	li	a0,1
    char byte = c;
    157e:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1582:	6ee000ef          	jal	ra,1c70 <write>
    char byte = c;
    1586:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    158a:	4605                	li	a2,1
    158c:	002c                	addi	a1,sp,8
    158e:	4505                	li	a0,1
    char byte = c;
    1590:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1594:	6dc000ef          	jal	ra,1c70 <write>
        s += 2;
    1598:	00248513          	addi	a0,s1,2
    159c:	bf15                	j	14d0 <printf+0x1b2>
                a = "(null)";
    159e:	845a                	mv	s0,s6
    15a0:	bf75                	j	155c <printf+0x23e>

00000000000015a2 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15a2:	1141                	addi	sp,sp,-16
    15a4:	e406                	sd	ra,8(sp)
    puts(m);
    15a6:	d57ff0ef          	jal	ra,12fc <puts>
    exit(-100);
}
    15aa:	60a2                	ld	ra,8(sp)
    exit(-100);
    15ac:	f9c00513          	li	a0,-100
}
    15b0:	0141                	addi	sp,sp,16
    exit(-100);
    15b2:	a739                	j	1cc0 <exit>

00000000000015b4 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15b4:	02000793          	li	a5,32
    15b8:	00f50663          	beq	a0,a5,15c4 <isspace+0x10>
    15bc:	355d                	addiw	a0,a0,-9
    15be:	00553513          	sltiu	a0,a0,5
    15c2:	8082                	ret
    15c4:	4505                	li	a0,1
}
    15c6:	8082                	ret

00000000000015c8 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15c8:	fd05051b          	addiw	a0,a0,-48
}
    15cc:	00a53513          	sltiu	a0,a0,10
    15d0:	8082                	ret

00000000000015d2 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d2:	02000613          	li	a2,32
    15d6:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15d8:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15dc:	ff77869b          	addiw	a3,a5,-9
    15e0:	04c78c63          	beq	a5,a2,1638 <atoi+0x66>
    15e4:	0007871b          	sext.w	a4,a5
    15e8:	04d5f863          	bgeu	a1,a3,1638 <atoi+0x66>
        s++;
    switch (*s)
    15ec:	02b00693          	li	a3,43
    15f0:	04d78963          	beq	a5,a3,1642 <atoi+0x70>
    15f4:	02d00693          	li	a3,45
    15f8:	06d78263          	beq	a5,a3,165c <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15fc:	fd07061b          	addiw	a2,a4,-48
    1600:	47a5                	li	a5,9
    1602:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1604:	4e01                	li	t3,0
    while (isdigit(*s))
    1606:	04c7e963          	bltu	a5,a2,1658 <atoi+0x86>
    int n = 0, neg = 0;
    160a:	4501                	li	a0,0
    while (isdigit(*s))
    160c:	4825                	li	a6,9
    160e:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    1612:	0025179b          	slliw	a5,a0,0x2
    1616:	9fa9                	addw	a5,a5,a0
    1618:	fd07031b          	addiw	t1,a4,-48
    161c:	0017989b          	slliw	a7,a5,0x1
    while (isdigit(*s))
    1620:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1624:	0685                	addi	a3,a3,1
    1626:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    162a:	0006071b          	sext.w	a4,a2
    162e:	feb870e3          	bgeu	a6,a1,160e <atoi+0x3c>
    return neg ? n : -n;
    1632:	000e0563          	beqz	t3,163c <atoi+0x6a>
}
    1636:	8082                	ret
        s++;
    1638:	0505                	addi	a0,a0,1
    163a:	bf79                	j	15d8 <atoi+0x6>
    return neg ? n : -n;
    163c:	4113053b          	subw	a0,t1,a7
    1640:	8082                	ret
    while (isdigit(*s))
    1642:	00154703          	lbu	a4,1(a0)
    1646:	47a5                	li	a5,9
        s++;
    1648:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    164c:	fd07061b          	addiw	a2,a4,-48
    int n = 0, neg = 0;
    1650:	4e01                	li	t3,0
    while (isdigit(*s))
    1652:	2701                	sext.w	a4,a4
    1654:	fac7fbe3          	bgeu	a5,a2,160a <atoi+0x38>
    1658:	4501                	li	a0,0
}
    165a:	8082                	ret
    while (isdigit(*s))
    165c:	00154703          	lbu	a4,1(a0)
    1660:	47a5                	li	a5,9
        s++;
    1662:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1666:	fd07061b          	addiw	a2,a4,-48
    166a:	2701                	sext.w	a4,a4
    166c:	fec7e6e3          	bltu	a5,a2,1658 <atoi+0x86>
        neg = 1;
    1670:	4e05                	li	t3,1
    1672:	bf61                	j	160a <atoi+0x38>

0000000000001674 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1674:	16060d63          	beqz	a2,17ee <memset+0x17a>
    1678:	40a007b3          	neg	a5,a0
    167c:	8b9d                	andi	a5,a5,7
    167e:	00778693          	addi	a3,a5,7
    1682:	482d                	li	a6,11
    1684:	0ff5f713          	zext.b	a4,a1
    1688:	fff60593          	addi	a1,a2,-1
    168c:	1706e263          	bltu	a3,a6,17f0 <memset+0x17c>
    1690:	16d5ea63          	bltu	a1,a3,1804 <memset+0x190>
    1694:	16078563          	beqz	a5,17fe <memset+0x18a>
    1698:	00e50023          	sb	a4,0(a0)
    169c:	4685                	li	a3,1
    169e:	00150593          	addi	a1,a0,1
    16a2:	14d78c63          	beq	a5,a3,17fa <memset+0x186>
    16a6:	00e500a3          	sb	a4,1(a0)
    16aa:	4689                	li	a3,2
    16ac:	00250593          	addi	a1,a0,2
    16b0:	14d78d63          	beq	a5,a3,180a <memset+0x196>
    16b4:	00e50123          	sb	a4,2(a0)
    16b8:	468d                	li	a3,3
    16ba:	00350593          	addi	a1,a0,3
    16be:	12d78b63          	beq	a5,a3,17f4 <memset+0x180>
    16c2:	00e501a3          	sb	a4,3(a0)
    16c6:	4691                	li	a3,4
    16c8:	00450593          	addi	a1,a0,4
    16cc:	14d78163          	beq	a5,a3,180e <memset+0x19a>
    16d0:	00e50223          	sb	a4,4(a0)
    16d4:	4695                	li	a3,5
    16d6:	00550593          	addi	a1,a0,5
    16da:	12d78c63          	beq	a5,a3,1812 <memset+0x19e>
    16de:	00e502a3          	sb	a4,5(a0)
    16e2:	469d                	li	a3,7
    16e4:	00650593          	addi	a1,a0,6
    16e8:	12d79763          	bne	a5,a3,1816 <memset+0x1a2>
    16ec:	00750593          	addi	a1,a0,7
    16f0:	00e50323          	sb	a4,6(a0)
    16f4:	481d                	li	a6,7
    16f6:	00871693          	slli	a3,a4,0x8
    16fa:	01071893          	slli	a7,a4,0x10
    16fe:	8ed9                	or	a3,a3,a4
    1700:	01871313          	slli	t1,a4,0x18
    1704:	0116e6b3          	or	a3,a3,a7
    1708:	0066e6b3          	or	a3,a3,t1
    170c:	02071893          	slli	a7,a4,0x20
    1710:	02871e13          	slli	t3,a4,0x28
    1714:	0116e6b3          	or	a3,a3,a7
    1718:	40f60333          	sub	t1,a2,a5
    171c:	03071893          	slli	a7,a4,0x30
    1720:	01c6e6b3          	or	a3,a3,t3
    1724:	0116e6b3          	or	a3,a3,a7
    1728:	03871e13          	slli	t3,a4,0x38
    172c:	97aa                	add	a5,a5,a0
    172e:	ff837893          	andi	a7,t1,-8
    1732:	01c6e6b3          	or	a3,a3,t3
    1736:	98be                	add	a7,a7,a5
    1738:	e394                	sd	a3,0(a5)
    173a:	07a1                	addi	a5,a5,8
    173c:	ff179ee3          	bne	a5,a7,1738 <memset+0xc4>
    1740:	ff837893          	andi	a7,t1,-8
    1744:	011587b3          	add	a5,a1,a7
    1748:	010886bb          	addw	a3,a7,a6
    174c:	0b130663          	beq	t1,a7,17f8 <memset+0x184>
    1750:	00e78023          	sb	a4,0(a5)
    1754:	0016859b          	addiw	a1,a3,1
    1758:	08c5fb63          	bgeu	a1,a2,17ee <memset+0x17a>
    175c:	00e780a3          	sb	a4,1(a5)
    1760:	0026859b          	addiw	a1,a3,2
    1764:	08c5f563          	bgeu	a1,a2,17ee <memset+0x17a>
    1768:	00e78123          	sb	a4,2(a5)
    176c:	0036859b          	addiw	a1,a3,3
    1770:	06c5ff63          	bgeu	a1,a2,17ee <memset+0x17a>
    1774:	00e781a3          	sb	a4,3(a5)
    1778:	0046859b          	addiw	a1,a3,4
    177c:	06c5f963          	bgeu	a1,a2,17ee <memset+0x17a>
    1780:	00e78223          	sb	a4,4(a5)
    1784:	0056859b          	addiw	a1,a3,5
    1788:	06c5f363          	bgeu	a1,a2,17ee <memset+0x17a>
    178c:	00e782a3          	sb	a4,5(a5)
    1790:	0066859b          	addiw	a1,a3,6
    1794:	04c5fd63          	bgeu	a1,a2,17ee <memset+0x17a>
    1798:	00e78323          	sb	a4,6(a5)
    179c:	0076859b          	addiw	a1,a3,7
    17a0:	04c5f763          	bgeu	a1,a2,17ee <memset+0x17a>
    17a4:	00e783a3          	sb	a4,7(a5)
    17a8:	0086859b          	addiw	a1,a3,8
    17ac:	04c5f163          	bgeu	a1,a2,17ee <memset+0x17a>
    17b0:	00e78423          	sb	a4,8(a5)
    17b4:	0096859b          	addiw	a1,a3,9
    17b8:	02c5fb63          	bgeu	a1,a2,17ee <memset+0x17a>
    17bc:	00e784a3          	sb	a4,9(a5)
    17c0:	00a6859b          	addiw	a1,a3,10
    17c4:	02c5f563          	bgeu	a1,a2,17ee <memset+0x17a>
    17c8:	00e78523          	sb	a4,10(a5)
    17cc:	00b6859b          	addiw	a1,a3,11
    17d0:	00c5ff63          	bgeu	a1,a2,17ee <memset+0x17a>
    17d4:	00e785a3          	sb	a4,11(a5)
    17d8:	00c6859b          	addiw	a1,a3,12
    17dc:	00c5f963          	bgeu	a1,a2,17ee <memset+0x17a>
    17e0:	00e78623          	sb	a4,12(a5)
    17e4:	26b5                	addiw	a3,a3,13
    17e6:	00c6f463          	bgeu	a3,a2,17ee <memset+0x17a>
    17ea:	00e786a3          	sb	a4,13(a5)
        ;
    return dest;
}
    17ee:	8082                	ret
    17f0:	46ad                	li	a3,11
    17f2:	bd79                	j	1690 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17f4:	480d                	li	a6,3
    17f6:	b701                	j	16f6 <memset+0x82>
    17f8:	8082                	ret
    17fa:	4805                	li	a6,1
    17fc:	bded                	j	16f6 <memset+0x82>
    17fe:	85aa                	mv	a1,a0
    1800:	4801                	li	a6,0
    1802:	bdd5                	j	16f6 <memset+0x82>
    1804:	87aa                	mv	a5,a0
    1806:	4681                	li	a3,0
    1808:	b7a1                	j	1750 <memset+0xdc>
    180a:	4809                	li	a6,2
    180c:	b5ed                	j	16f6 <memset+0x82>
    180e:	4811                	li	a6,4
    1810:	b5dd                	j	16f6 <memset+0x82>
    1812:	4815                	li	a6,5
    1814:	b5cd                	j	16f6 <memset+0x82>
    1816:	4819                	li	a6,6
    1818:	bdf9                	j	16f6 <memset+0x82>

000000000000181a <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    181a:	00054783          	lbu	a5,0(a0)
    181e:	0005c703          	lbu	a4,0(a1)
    1822:	00e79863          	bne	a5,a4,1832 <strcmp+0x18>
    1826:	0505                	addi	a0,a0,1
    1828:	0585                	addi	a1,a1,1
    182a:	fbe5                	bnez	a5,181a <strcmp>
    182c:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    182e:	9d19                	subw	a0,a0,a4
    1830:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1832:	0007851b          	sext.w	a0,a5
    1836:	bfe5                	j	182e <strcmp+0x14>

0000000000001838 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1838:	ca15                	beqz	a2,186c <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    183a:	00054783          	lbu	a5,0(a0)
    if (!n--)
    183e:	167d                	addi	a2,a2,-1
    1840:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1844:	eb99                	bnez	a5,185a <strncmp+0x22>
    1846:	a815                	j	187a <strncmp+0x42>
    1848:	00a68e63          	beq	a3,a0,1864 <strncmp+0x2c>
    184c:	0505                	addi	a0,a0,1
    184e:	00f71b63          	bne	a4,a5,1864 <strncmp+0x2c>
    1852:	00054783          	lbu	a5,0(a0)
    1856:	cf89                	beqz	a5,1870 <strncmp+0x38>
    1858:	85b2                	mv	a1,a2
    185a:	0005c703          	lbu	a4,0(a1)
    185e:	00158613          	addi	a2,a1,1
    1862:	f37d                	bnez	a4,1848 <strncmp+0x10>
        ;
    return *l - *r;
    1864:	0007851b          	sext.w	a0,a5
    1868:	9d19                	subw	a0,a0,a4
    186a:	8082                	ret
        return 0;
    186c:	4501                	li	a0,0
}
    186e:	8082                	ret
    return *l - *r;
    1870:	0015c703          	lbu	a4,1(a1)
    1874:	4501                	li	a0,0
    1876:	9d19                	subw	a0,a0,a4
    1878:	8082                	ret
    187a:	0005c703          	lbu	a4,0(a1)
    187e:	4501                	li	a0,0
    1880:	b7e5                	j	1868 <strncmp+0x30>

0000000000001882 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1882:	00757793          	andi	a5,a0,7
    1886:	cf89                	beqz	a5,18a0 <strlen+0x1e>
    1888:	87aa                	mv	a5,a0
    188a:	a029                	j	1894 <strlen+0x12>
    188c:	0785                	addi	a5,a5,1
    188e:	0077f713          	andi	a4,a5,7
    1892:	cb01                	beqz	a4,18a2 <strlen+0x20>
        if (!*s)
    1894:	0007c703          	lbu	a4,0(a5)
    1898:	fb75                	bnez	a4,188c <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    189a:	40a78533          	sub	a0,a5,a0
}
    189e:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18a0:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18a2:	6394                	ld	a3,0(a5)
    18a4:	00000597          	auipc	a1,0x0
    18a8:	6ac5b583          	ld	a1,1708(a1) # 1f50 <__clone+0xa8>
    18ac:	00000617          	auipc	a2,0x0
    18b0:	6ac63603          	ld	a2,1708(a2) # 1f58 <__clone+0xb0>
    18b4:	a019                	j	18ba <strlen+0x38>
    18b6:	6794                	ld	a3,8(a5)
    18b8:	07a1                	addi	a5,a5,8
    18ba:	00b68733          	add	a4,a3,a1
    18be:	fff6c693          	not	a3,a3
    18c2:	8f75                	and	a4,a4,a3
    18c4:	8f71                	and	a4,a4,a2
    18c6:	db65                	beqz	a4,18b6 <strlen+0x34>
    for (; *s; s++)
    18c8:	0007c703          	lbu	a4,0(a5)
    18cc:	d779                	beqz	a4,189a <strlen+0x18>
    18ce:	0017c703          	lbu	a4,1(a5)
    18d2:	0785                	addi	a5,a5,1
    18d4:	d379                	beqz	a4,189a <strlen+0x18>
    18d6:	0017c703          	lbu	a4,1(a5)
    18da:	0785                	addi	a5,a5,1
    18dc:	fb6d                	bnez	a4,18ce <strlen+0x4c>
    18de:	bf75                	j	189a <strlen+0x18>

00000000000018e0 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18e0:	00757713          	andi	a4,a0,7
{
    18e4:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18e6:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18ea:	cb19                	beqz	a4,1900 <memchr+0x20>
    18ec:	ce25                	beqz	a2,1964 <memchr+0x84>
    18ee:	0007c703          	lbu	a4,0(a5)
    18f2:	04b70e63          	beq	a4,a1,194e <memchr+0x6e>
    18f6:	0785                	addi	a5,a5,1
    18f8:	0077f713          	andi	a4,a5,7
    18fc:	167d                	addi	a2,a2,-1
    18fe:	f77d                	bnez	a4,18ec <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1900:	4501                	li	a0,0
    if (n && *s != c)
    1902:	c235                	beqz	a2,1966 <memchr+0x86>
    1904:	0007c703          	lbu	a4,0(a5)
    1908:	04b70363          	beq	a4,a1,194e <memchr+0x6e>
        size_t k = ONES * c;
    190c:	00000517          	auipc	a0,0x0
    1910:	65453503          	ld	a0,1620(a0) # 1f60 <__clone+0xb8>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1914:	471d                	li	a4,7
        size_t k = ONES * c;
    1916:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    191a:	02c77a63          	bgeu	a4,a2,194e <memchr+0x6e>
    191e:	00000897          	auipc	a7,0x0
    1922:	6328b883          	ld	a7,1586(a7) # 1f50 <__clone+0xa8>
    1926:	00000817          	auipc	a6,0x0
    192a:	63283803          	ld	a6,1586(a6) # 1f58 <__clone+0xb0>
    192e:	431d                	li	t1,7
    1930:	a029                	j	193a <memchr+0x5a>
    1932:	1661                	addi	a2,a2,-8
    1934:	07a1                	addi	a5,a5,8
    1936:	02c37963          	bgeu	t1,a2,1968 <memchr+0x88>
    193a:	6398                	ld	a4,0(a5)
    193c:	8f29                	xor	a4,a4,a0
    193e:	011706b3          	add	a3,a4,a7
    1942:	fff74713          	not	a4,a4
    1946:	8f75                	and	a4,a4,a3
    1948:	01077733          	and	a4,a4,a6
    194c:	d37d                	beqz	a4,1932 <memchr+0x52>
{
    194e:	853e                	mv	a0,a5
    1950:	97b2                	add	a5,a5,a2
    1952:	a021                	j	195a <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1954:	0505                	addi	a0,a0,1
    1956:	00f50763          	beq	a0,a5,1964 <memchr+0x84>
    195a:	00054703          	lbu	a4,0(a0)
    195e:	feb71be3          	bne	a4,a1,1954 <memchr+0x74>
    1962:	8082                	ret
    return n ? (void *)s : 0;
    1964:	4501                	li	a0,0
}
    1966:	8082                	ret
    return n ? (void *)s : 0;
    1968:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    196a:	f275                	bnez	a2,194e <memchr+0x6e>
}
    196c:	8082                	ret

000000000000196e <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    196e:	1101                	addi	sp,sp,-32
    1970:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1972:	862e                	mv	a2,a1
{
    1974:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1976:	4581                	li	a1,0
{
    1978:	e426                	sd	s1,8(sp)
    197a:	ec06                	sd	ra,24(sp)
    197c:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    197e:	f63ff0ef          	jal	ra,18e0 <memchr>
    return p ? p - s : n;
    1982:	c519                	beqz	a0,1990 <strnlen+0x22>
}
    1984:	60e2                	ld	ra,24(sp)
    1986:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1988:	8d05                	sub	a0,a0,s1
}
    198a:	64a2                	ld	s1,8(sp)
    198c:	6105                	addi	sp,sp,32
    198e:	8082                	ret
    1990:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1992:	8522                	mv	a0,s0
}
    1994:	6442                	ld	s0,16(sp)
    1996:	64a2                	ld	s1,8(sp)
    1998:	6105                	addi	sp,sp,32
    199a:	8082                	ret

000000000000199c <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    199c:	00a5c7b3          	xor	a5,a1,a0
    19a0:	8b9d                	andi	a5,a5,7
    19a2:	eb95                	bnez	a5,19d6 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19a4:	0075f793          	andi	a5,a1,7
    19a8:	e7b1                	bnez	a5,19f4 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19aa:	6198                	ld	a4,0(a1)
    19ac:	00000617          	auipc	a2,0x0
    19b0:	5a463603          	ld	a2,1444(a2) # 1f50 <__clone+0xa8>
    19b4:	00000817          	auipc	a6,0x0
    19b8:	5a483803          	ld	a6,1444(a6) # 1f58 <__clone+0xb0>
    19bc:	a029                	j	19c6 <strcpy+0x2a>
    19be:	05a1                	addi	a1,a1,8
    19c0:	e118                	sd	a4,0(a0)
    19c2:	6198                	ld	a4,0(a1)
    19c4:	0521                	addi	a0,a0,8
    19c6:	00c707b3          	add	a5,a4,a2
    19ca:	fff74693          	not	a3,a4
    19ce:	8ff5                	and	a5,a5,a3
    19d0:	0107f7b3          	and	a5,a5,a6
    19d4:	d7ed                	beqz	a5,19be <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19d6:	0005c783          	lbu	a5,0(a1)
    19da:	00f50023          	sb	a5,0(a0)
    19de:	c785                	beqz	a5,1a06 <strcpy+0x6a>
    19e0:	0015c783          	lbu	a5,1(a1)
    19e4:	0505                	addi	a0,a0,1
    19e6:	0585                	addi	a1,a1,1
    19e8:	00f50023          	sb	a5,0(a0)
    19ec:	fbf5                	bnez	a5,19e0 <strcpy+0x44>
        ;
    return d;
}
    19ee:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19f0:	0505                	addi	a0,a0,1
    19f2:	df45                	beqz	a4,19aa <strcpy+0xe>
            if (!(*d = *s))
    19f4:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19f8:	0585                	addi	a1,a1,1
    19fa:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    19fe:	00f50023          	sb	a5,0(a0)
    1a02:	f7fd                	bnez	a5,19f0 <strcpy+0x54>
}
    1a04:	8082                	ret
    1a06:	8082                	ret

0000000000001a08 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a08:	00a5c7b3          	xor	a5,a1,a0
    1a0c:	8b9d                	andi	a5,a5,7
    1a0e:	1a079863          	bnez	a5,1bbe <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a12:	0075f793          	andi	a5,a1,7
    1a16:	16078463          	beqz	a5,1b7e <strncpy+0x176>
    1a1a:	ea01                	bnez	a2,1a2a <strncpy+0x22>
    1a1c:	a421                	j	1c24 <strncpy+0x21c>
    1a1e:	167d                	addi	a2,a2,-1
    1a20:	0505                	addi	a0,a0,1
    1a22:	14070e63          	beqz	a4,1b7e <strncpy+0x176>
    1a26:	1a060863          	beqz	a2,1bd6 <strncpy+0x1ce>
    1a2a:	0005c783          	lbu	a5,0(a1)
    1a2e:	0585                	addi	a1,a1,1
    1a30:	0075f713          	andi	a4,a1,7
    1a34:	00f50023          	sb	a5,0(a0)
    1a38:	f3fd                	bnez	a5,1a1e <strncpy+0x16>
    1a3a:	4805                	li	a6,1
    1a3c:	1a061863          	bnez	a2,1bec <strncpy+0x1e4>
    1a40:	40a007b3          	neg	a5,a0
    1a44:	8b9d                	andi	a5,a5,7
    1a46:	4681                	li	a3,0
    1a48:	18061a63          	bnez	a2,1bdc <strncpy+0x1d4>
    1a4c:	00778713          	addi	a4,a5,7
    1a50:	45ad                	li	a1,11
    1a52:	18b76363          	bltu	a4,a1,1bd8 <strncpy+0x1d0>
    1a56:	1ae6eb63          	bltu	a3,a4,1c0c <strncpy+0x204>
    1a5a:	1a078363          	beqz	a5,1c00 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a5e:	00050023          	sb	zero,0(a0)
    1a62:	4685                	li	a3,1
    1a64:	00150713          	addi	a4,a0,1
    1a68:	18d78f63          	beq	a5,a3,1c06 <strncpy+0x1fe>
    1a6c:	000500a3          	sb	zero,1(a0)
    1a70:	4689                	li	a3,2
    1a72:	00250713          	addi	a4,a0,2
    1a76:	18d78e63          	beq	a5,a3,1c12 <strncpy+0x20a>
    1a7a:	00050123          	sb	zero,2(a0)
    1a7e:	468d                	li	a3,3
    1a80:	00350713          	addi	a4,a0,3
    1a84:	16d78c63          	beq	a5,a3,1bfc <strncpy+0x1f4>
    1a88:	000501a3          	sb	zero,3(a0)
    1a8c:	4691                	li	a3,4
    1a8e:	00450713          	addi	a4,a0,4
    1a92:	18d78263          	beq	a5,a3,1c16 <strncpy+0x20e>
    1a96:	00050223          	sb	zero,4(a0)
    1a9a:	4695                	li	a3,5
    1a9c:	00550713          	addi	a4,a0,5
    1aa0:	16d78d63          	beq	a5,a3,1c1a <strncpy+0x212>
    1aa4:	000502a3          	sb	zero,5(a0)
    1aa8:	469d                	li	a3,7
    1aaa:	00650713          	addi	a4,a0,6
    1aae:	16d79863          	bne	a5,a3,1c1e <strncpy+0x216>
    1ab2:	00750713          	addi	a4,a0,7
    1ab6:	00050323          	sb	zero,6(a0)
    1aba:	40f80833          	sub	a6,a6,a5
    1abe:	ff887593          	andi	a1,a6,-8
    1ac2:	97aa                	add	a5,a5,a0
    1ac4:	95be                	add	a1,a1,a5
    1ac6:	0007b023          	sd	zero,0(a5)
    1aca:	07a1                	addi	a5,a5,8
    1acc:	feb79de3          	bne	a5,a1,1ac6 <strncpy+0xbe>
    1ad0:	ff887593          	andi	a1,a6,-8
    1ad4:	9ead                	addw	a3,a3,a1
    1ad6:	00b707b3          	add	a5,a4,a1
    1ada:	12b80863          	beq	a6,a1,1c0a <strncpy+0x202>
    1ade:	00078023          	sb	zero,0(a5)
    1ae2:	0016871b          	addiw	a4,a3,1
    1ae6:	0ec77863          	bgeu	a4,a2,1bd6 <strncpy+0x1ce>
    1aea:	000780a3          	sb	zero,1(a5)
    1aee:	0026871b          	addiw	a4,a3,2
    1af2:	0ec77263          	bgeu	a4,a2,1bd6 <strncpy+0x1ce>
    1af6:	00078123          	sb	zero,2(a5)
    1afa:	0036871b          	addiw	a4,a3,3
    1afe:	0cc77c63          	bgeu	a4,a2,1bd6 <strncpy+0x1ce>
    1b02:	000781a3          	sb	zero,3(a5)
    1b06:	0046871b          	addiw	a4,a3,4
    1b0a:	0cc77663          	bgeu	a4,a2,1bd6 <strncpy+0x1ce>
    1b0e:	00078223          	sb	zero,4(a5)
    1b12:	0056871b          	addiw	a4,a3,5
    1b16:	0cc77063          	bgeu	a4,a2,1bd6 <strncpy+0x1ce>
    1b1a:	000782a3          	sb	zero,5(a5)
    1b1e:	0066871b          	addiw	a4,a3,6
    1b22:	0ac77a63          	bgeu	a4,a2,1bd6 <strncpy+0x1ce>
    1b26:	00078323          	sb	zero,6(a5)
    1b2a:	0076871b          	addiw	a4,a3,7
    1b2e:	0ac77463          	bgeu	a4,a2,1bd6 <strncpy+0x1ce>
    1b32:	000783a3          	sb	zero,7(a5)
    1b36:	0086871b          	addiw	a4,a3,8
    1b3a:	08c77e63          	bgeu	a4,a2,1bd6 <strncpy+0x1ce>
    1b3e:	00078423          	sb	zero,8(a5)
    1b42:	0096871b          	addiw	a4,a3,9
    1b46:	08c77863          	bgeu	a4,a2,1bd6 <strncpy+0x1ce>
    1b4a:	000784a3          	sb	zero,9(a5)
    1b4e:	00a6871b          	addiw	a4,a3,10
    1b52:	08c77263          	bgeu	a4,a2,1bd6 <strncpy+0x1ce>
    1b56:	00078523          	sb	zero,10(a5)
    1b5a:	00b6871b          	addiw	a4,a3,11
    1b5e:	06c77c63          	bgeu	a4,a2,1bd6 <strncpy+0x1ce>
    1b62:	000785a3          	sb	zero,11(a5)
    1b66:	00c6871b          	addiw	a4,a3,12
    1b6a:	06c77663          	bgeu	a4,a2,1bd6 <strncpy+0x1ce>
    1b6e:	00078623          	sb	zero,12(a5)
    1b72:	26b5                	addiw	a3,a3,13
    1b74:	06c6f163          	bgeu	a3,a2,1bd6 <strncpy+0x1ce>
    1b78:	000786a3          	sb	zero,13(a5)
    1b7c:	8082                	ret
            ;
        if (!n || !*s)
    1b7e:	c645                	beqz	a2,1c26 <strncpy+0x21e>
    1b80:	0005c783          	lbu	a5,0(a1)
    1b84:	ea078be3          	beqz	a5,1a3a <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b88:	479d                	li	a5,7
    1b8a:	02c7ff63          	bgeu	a5,a2,1bc8 <strncpy+0x1c0>
    1b8e:	00000897          	auipc	a7,0x0
    1b92:	3c28b883          	ld	a7,962(a7) # 1f50 <__clone+0xa8>
    1b96:	00000817          	auipc	a6,0x0
    1b9a:	3c283803          	ld	a6,962(a6) # 1f58 <__clone+0xb0>
    1b9e:	431d                	li	t1,7
    1ba0:	6198                	ld	a4,0(a1)
    1ba2:	011707b3          	add	a5,a4,a7
    1ba6:	fff74693          	not	a3,a4
    1baa:	8ff5                	and	a5,a5,a3
    1bac:	0107f7b3          	and	a5,a5,a6
    1bb0:	ef81                	bnez	a5,1bc8 <strncpy+0x1c0>
            *wd = *ws;
    1bb2:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bb4:	1661                	addi	a2,a2,-8
    1bb6:	05a1                	addi	a1,a1,8
    1bb8:	0521                	addi	a0,a0,8
    1bba:	fec363e3          	bltu	t1,a2,1ba0 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1bbe:	e609                	bnez	a2,1bc8 <strncpy+0x1c0>
    1bc0:	a08d                	j	1c22 <strncpy+0x21a>
    1bc2:	167d                	addi	a2,a2,-1
    1bc4:	0505                	addi	a0,a0,1
    1bc6:	ca01                	beqz	a2,1bd6 <strncpy+0x1ce>
    1bc8:	0005c783          	lbu	a5,0(a1)
    1bcc:	0585                	addi	a1,a1,1
    1bce:	00f50023          	sb	a5,0(a0)
    1bd2:	fbe5                	bnez	a5,1bc2 <strncpy+0x1ba>
        ;
tail:
    1bd4:	b59d                	j	1a3a <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1bd6:	8082                	ret
    1bd8:	472d                	li	a4,11
    1bda:	bdb5                	j	1a56 <strncpy+0x4e>
    1bdc:	00778713          	addi	a4,a5,7
    1be0:	45ad                	li	a1,11
    1be2:	fff60693          	addi	a3,a2,-1
    1be6:	e6b778e3          	bgeu	a4,a1,1a56 <strncpy+0x4e>
    1bea:	b7fd                	j	1bd8 <strncpy+0x1d0>
    1bec:	40a007b3          	neg	a5,a0
    1bf0:	8832                	mv	a6,a2
    1bf2:	8b9d                	andi	a5,a5,7
    1bf4:	4681                	li	a3,0
    1bf6:	e4060be3          	beqz	a2,1a4c <strncpy+0x44>
    1bfa:	b7cd                	j	1bdc <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bfc:	468d                	li	a3,3
    1bfe:	bd75                	j	1aba <strncpy+0xb2>
    1c00:	872a                	mv	a4,a0
    1c02:	4681                	li	a3,0
    1c04:	bd5d                	j	1aba <strncpy+0xb2>
    1c06:	4685                	li	a3,1
    1c08:	bd4d                	j	1aba <strncpy+0xb2>
    1c0a:	8082                	ret
    1c0c:	87aa                	mv	a5,a0
    1c0e:	4681                	li	a3,0
    1c10:	b5f9                	j	1ade <strncpy+0xd6>
    1c12:	4689                	li	a3,2
    1c14:	b55d                	j	1aba <strncpy+0xb2>
    1c16:	4691                	li	a3,4
    1c18:	b54d                	j	1aba <strncpy+0xb2>
    1c1a:	4695                	li	a3,5
    1c1c:	bd79                	j	1aba <strncpy+0xb2>
    1c1e:	4699                	li	a3,6
    1c20:	bd69                	j	1aba <strncpy+0xb2>
    1c22:	8082                	ret
    1c24:	8082                	ret
    1c26:	8082                	ret

0000000000001c28 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c28:	87aa                	mv	a5,a0
    1c2a:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c2c:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c30:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c34:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c36:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c38:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c3c:	2501                	sext.w	a0,a0
    1c3e:	8082                	ret

0000000000001c40 <openat>:
    register long a7 __asm__("a7") = n;
    1c40:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c44:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c48:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c4c:	2501                	sext.w	a0,a0
    1c4e:	8082                	ret

0000000000001c50 <fcntl>:
    register long a7 __asm__("a7") = n;
    1c50:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c52:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1c56:	2501                	sext.w	a0,a0
    1c58:	8082                	ret

0000000000001c5a <close>:
    register long a7 __asm__("a7") = n;
    1c5a:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c5e:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c62:	2501                	sext.w	a0,a0
    1c64:	8082                	ret

0000000000001c66 <read>:
    register long a7 __asm__("a7") = n;
    1c66:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c6a:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c6e:	8082                	ret

0000000000001c70 <write>:
    register long a7 __asm__("a7") = n;
    1c70:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c74:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c78:	8082                	ret

0000000000001c7a <getpid>:
    register long a7 __asm__("a7") = n;
    1c7a:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c7e:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c82:	2501                	sext.w	a0,a0
    1c84:	8082                	ret

0000000000001c86 <getppid>:
    register long a7 __asm__("a7") = n;
    1c86:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c8a:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c8e:	2501                	sext.w	a0,a0
    1c90:	8082                	ret

0000000000001c92 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c92:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c96:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c9a:	2501                	sext.w	a0,a0
    1c9c:	8082                	ret

0000000000001c9e <fork>:
    register long a7 __asm__("a7") = n;
    1c9e:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1ca2:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1ca4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ca6:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1caa:	2501                	sext.w	a0,a0
    1cac:	8082                	ret

0000000000001cae <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cae:	85b2                	mv	a1,a2
    1cb0:	863a                	mv	a2,a4
    if (stack)
    1cb2:	c191                	beqz	a1,1cb6 <clone+0x8>
	stack += stack_size;
    1cb4:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cb6:	4781                	li	a5,0
    1cb8:	4701                	li	a4,0
    1cba:	4681                	li	a3,0
    1cbc:	2601                	sext.w	a2,a2
    1cbe:	a2ed                	j	1ea8 <__clone>

0000000000001cc0 <exit>:
    register long a7 __asm__("a7") = n;
    1cc0:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cc4:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cc8:	8082                	ret

0000000000001cca <waitpid>:
    register long a7 __asm__("a7") = n;
    1cca:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cce:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cd0:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cd4:	2501                	sext.w	a0,a0
    1cd6:	8082                	ret

0000000000001cd8 <exec>:
    register long a7 __asm__("a7") = n;
    1cd8:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cdc:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1ce0:	2501                	sext.w	a0,a0
    1ce2:	8082                	ret

0000000000001ce4 <execve>:
    register long a7 __asm__("a7") = n;
    1ce4:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ce8:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cec:	2501                	sext.w	a0,a0
    1cee:	8082                	ret

0000000000001cf0 <times>:
    register long a7 __asm__("a7") = n;
    1cf0:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cf4:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1cf8:	2501                	sext.w	a0,a0
    1cfa:	8082                	ret

0000000000001cfc <get_time>:

int64 get_time()
{
    1cfc:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1cfe:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d02:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d04:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d06:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d0a:	2501                	sext.w	a0,a0
    1d0c:	ed09                	bnez	a0,1d26 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d0e:	67a2                	ld	a5,8(sp)
    1d10:	3e800713          	li	a4,1000
    1d14:	00015503          	lhu	a0,0(sp)
    1d18:	02e7d7b3          	divu	a5,a5,a4
    1d1c:	02e50533          	mul	a0,a0,a4
    1d20:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d22:	0141                	addi	sp,sp,16
    1d24:	8082                	ret
        return -1;
    1d26:	557d                	li	a0,-1
    1d28:	bfed                	j	1d22 <get_time+0x26>

0000000000001d2a <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d2a:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d2e:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d32:	2501                	sext.w	a0,a0
    1d34:	8082                	ret

0000000000001d36 <time>:
    register long a7 __asm__("a7") = n;
    1d36:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d3a:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d3e:	2501                	sext.w	a0,a0
    1d40:	8082                	ret

0000000000001d42 <sleep>:

int sleep(unsigned long long time)
{
    1d42:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d44:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d46:	850a                	mv	a0,sp
    1d48:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d4a:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d4e:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d50:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d54:	e501                	bnez	a0,1d5c <sleep+0x1a>
    return 0;
    1d56:	4501                	li	a0,0
}
    1d58:	0141                	addi	sp,sp,16
    1d5a:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d5c:	4502                	lw	a0,0(sp)
}
    1d5e:	0141                	addi	sp,sp,16
    1d60:	8082                	ret

0000000000001d62 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d62:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d66:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d6a:	2501                	sext.w	a0,a0
    1d6c:	8082                	ret

0000000000001d6e <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d6e:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d72:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d76:	8082                	ret

0000000000001d78 <munmap>:
    register long a7 __asm__("a7") = n;
    1d78:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d7c:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d80:	2501                	sext.w	a0,a0
    1d82:	8082                	ret

0000000000001d84 <wait>:

int wait(int *code)
{
    1d84:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d86:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d8a:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d8c:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d8e:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d90:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d94:	2501                	sext.w	a0,a0
    1d96:	8082                	ret

0000000000001d98 <spawn>:
    register long a7 __asm__("a7") = n;
    1d98:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d9c:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1da0:	2501                	sext.w	a0,a0
    1da2:	8082                	ret

0000000000001da4 <mailread>:
    register long a7 __asm__("a7") = n;
    1da4:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1da8:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dac:	2501                	sext.w	a0,a0
    1dae:	8082                	ret

0000000000001db0 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1db0:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1db4:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1db8:	2501                	sext.w	a0,a0
    1dba:	8082                	ret

0000000000001dbc <fstat>:
    register long a7 __asm__("a7") = n;
    1dbc:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc0:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dc4:	2501                	sext.w	a0,a0
    1dc6:	8082                	ret

0000000000001dc8 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dc8:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dca:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dce:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dd0:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1dd4:	2501                	sext.w	a0,a0
    1dd6:	8082                	ret

0000000000001dd8 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1dd8:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dda:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1dde:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de0:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1de4:	2501                	sext.w	a0,a0
    1de6:	8082                	ret

0000000000001de8 <link>:

int link(char *old_path, char *new_path)
{
    1de8:	87aa                	mv	a5,a0
    1dea:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1dec:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1df0:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1df4:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1df6:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1dfa:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dfc:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e00:	2501                	sext.w	a0,a0
    1e02:	8082                	ret

0000000000001e04 <unlink>:

int unlink(char *path)
{
    1e04:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e06:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e0a:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e0e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e10:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e14:	2501                	sext.w	a0,a0
    1e16:	8082                	ret

0000000000001e18 <uname>:
    register long a7 __asm__("a7") = n;
    1e18:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e1c:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e20:	2501                	sext.w	a0,a0
    1e22:	8082                	ret

0000000000001e24 <brk>:
    register long a7 __asm__("a7") = n;
    1e24:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e28:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e2c:	2501                	sext.w	a0,a0
    1e2e:	8082                	ret

0000000000001e30 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e30:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e32:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e36:	8082                	ret

0000000000001e38 <chdir>:
    register long a7 __asm__("a7") = n;
    1e38:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e3c:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e40:	2501                	sext.w	a0,a0
    1e42:	8082                	ret

0000000000001e44 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e44:	862e                	mv	a2,a1
    1e46:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e48:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e4a:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e4e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e52:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e54:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e56:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e5a:	2501                	sext.w	a0,a0
    1e5c:	8082                	ret

0000000000001e5e <getdents>:
    register long a7 __asm__("a7") = n;
    1e5e:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e62:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e66:	2501                	sext.w	a0,a0
    1e68:	8082                	ret

0000000000001e6a <pipe>:
    register long a7 __asm__("a7") = n;
    1e6a:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e6e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e70:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e74:	2501                	sext.w	a0,a0
    1e76:	8082                	ret

0000000000001e78 <dup>:
    register long a7 __asm__("a7") = n;
    1e78:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e7a:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e7e:	2501                	sext.w	a0,a0
    1e80:	8082                	ret

0000000000001e82 <dup2>:
    register long a7 __asm__("a7") = n;
    1e82:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e84:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e86:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e8a:	2501                	sext.w	a0,a0
    1e8c:	8082                	ret

0000000000001e8e <mount>:
    register long a7 __asm__("a7") = n;
    1e8e:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e92:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e96:	2501                	sext.w	a0,a0
    1e98:	8082                	ret

0000000000001e9a <umount>:
    register long a7 __asm__("a7") = n;
    1e9a:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e9e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea0:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ea4:	2501                	sext.w	a0,a0
    1ea6:	8082                	ret

0000000000001ea8 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ea8:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1eaa:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1eac:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1eae:	8532                	mv	a0,a2
	mv a2, a4
    1eb0:	863a                	mv	a2,a4
	mv a3, a5
    1eb2:	86be                	mv	a3,a5
	mv a4, a6
    1eb4:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1eb6:	0dc00893          	li	a7,220
	ecall
    1eba:	00000073          	ecall

	beqz a0, 1f
    1ebe:	c111                	beqz	a0,1ec2 <__clone+0x1a>
	# Parent
	ret
    1ec0:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ec2:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ec4:	6522                	ld	a0,8(sp)
	jalr a1
    1ec6:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ec8:	05d00893          	li	a7,93
	ecall
    1ecc:	00000073          	ecall
