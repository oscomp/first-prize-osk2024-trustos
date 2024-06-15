
/home/brightnight/OScompetition/6.13晚final_main/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/mkdir_：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a0f9                	j	10d0 <__start_main>

0000000000001004 <test_mkdir>:
#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"

void test_mkdir(void){
    1004:	1141                	addi	sp,sp,-16
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f1250513          	addi	a0,a0,-238 # 1f18 <__clone+0x2a>
void test_mkdir(void){
    100e:	e406                	sd	ra,8(sp)
    1010:	e022                	sd	s0,0(sp)
    TEST_START(__func__);
    1012:	330000ef          	jal	ra,1342 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	fc250513          	addi	a0,a0,-62 # 1fd8 <__func__.0>
    101e:	324000ef          	jal	ra,1342 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	f0e50513          	addi	a0,a0,-242 # 1f30 <__clone+0x42>
    102a:	318000ef          	jal	ra,1342 <puts>
    int rt, fd;

    rt = mkdir("test_mkdir", 0666);
    102e:	1b600593          	li	a1,438
    1032:	00001517          	auipc	a0,0x1
    1036:	f0e50513          	addi	a0,a0,-242 # 1f40 <__clone+0x52>
    103a:	651000ef          	jal	ra,1e8a <mkdir>
    printf("mkdir ret: %d\n", rt);
    103e:	85aa                	mv	a1,a0
    rt = mkdir("test_mkdir", 0666);
    1040:	842a                	mv	s0,a0
    printf("mkdir ret: %d\n", rt);
    1042:	00001517          	auipc	a0,0x1
    1046:	f0e50513          	addi	a0,a0,-242 # 1f50 <__clone+0x62>
    104a:	31a000ef          	jal	ra,1364 <printf>
    assert(rt != -1);
    104e:	57fd                	li	a5,-1
    1050:	06f40163          	beq	s0,a5,10b2 <test_mkdir+0xae>
    fd = open("test_mkdir", O_RDONLY | O_DIRECTORY);
    1054:	002005b7          	lui	a1,0x200
    1058:	00001517          	auipc	a0,0x1
    105c:	ee850513          	addi	a0,a0,-280 # 1f40 <__clone+0x52>
    1060:	40f000ef          	jal	ra,1c6e <open>
    1064:	842a                	mv	s0,a0
    if(fd > 0){
    1066:	02a05f63          	blez	a0,10a4 <test_mkdir+0xa0>
        printf("  mkdir success.\n");
    106a:	00001517          	auipc	a0,0x1
    106e:	f1650513          	addi	a0,a0,-234 # 1f80 <__clone+0x92>
    1072:	2f2000ef          	jal	ra,1364 <printf>
        close(fd);
    1076:	8522                	mv	a0,s0
    1078:	429000ef          	jal	ra,1ca0 <close>
    }
    else printf("  mkdir error.\n");
    TEST_END(__func__);
    107c:	00001517          	auipc	a0,0x1
    1080:	f2c50513          	addi	a0,a0,-212 # 1fa8 <__clone+0xba>
    1084:	2be000ef          	jal	ra,1342 <puts>
    1088:	00001517          	auipc	a0,0x1
    108c:	f5050513          	addi	a0,a0,-176 # 1fd8 <__func__.0>
    1090:	2b2000ef          	jal	ra,1342 <puts>
}
    1094:	6402                	ld	s0,0(sp)
    1096:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    1098:	00001517          	auipc	a0,0x1
    109c:	e9850513          	addi	a0,a0,-360 # 1f30 <__clone+0x42>
}
    10a0:	0141                	addi	sp,sp,16
    TEST_END(__func__);
    10a2:	a445                	j	1342 <puts>
    else printf("  mkdir error.\n");
    10a4:	00001517          	auipc	a0,0x1
    10a8:	ef450513          	addi	a0,a0,-268 # 1f98 <__clone+0xaa>
    10ac:	2b8000ef          	jal	ra,1364 <printf>
    10b0:	b7f1                	j	107c <test_mkdir+0x78>
    assert(rt != -1);
    10b2:	00001517          	auipc	a0,0x1
    10b6:	eae50513          	addi	a0,a0,-338 # 1f60 <__clone+0x72>
    10ba:	52e000ef          	jal	ra,15e8 <panic>
    10be:	bf59                	j	1054 <test_mkdir+0x50>

00000000000010c0 <main>:

int main(void){
    10c0:	1141                	addi	sp,sp,-16
    10c2:	e406                	sd	ra,8(sp)
    test_mkdir();
    10c4:	f41ff0ef          	jal	ra,1004 <test_mkdir>
    return 0;
}
    10c8:	60a2                	ld	ra,8(sp)
    10ca:	4501                	li	a0,0
    10cc:	0141                	addi	sp,sp,16
    10ce:	8082                	ret

00000000000010d0 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10d0:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10d2:	4108                	lw	a0,0(a0)
{
    10d4:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10d6:	05a1                	addi	a1,a1,8
{
    10d8:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10da:	fe7ff0ef          	jal	ra,10c0 <main>
    10de:	429000ef          	jal	ra,1d06 <exit>
	return 0;
}
    10e2:	60a2                	ld	ra,8(sp)
    10e4:	4501                	li	a0,0
    10e6:	0141                	addi	sp,sp,16
    10e8:	8082                	ret

00000000000010ea <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10ea:	7179                	addi	sp,sp,-48
    10ec:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10ee:	12054b63          	bltz	a0,1224 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10f2:	02b577bb          	remuw	a5,a0,a1
    10f6:	00001617          	auipc	a2,0x1
    10fa:	ef260613          	addi	a2,a2,-270 # 1fe8 <digits>
    buf[16] = 0;
    10fe:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1102:	0005871b          	sext.w	a4,a1
    1106:	1782                	slli	a5,a5,0x20
    1108:	9381                	srli	a5,a5,0x20
    110a:	97b2                	add	a5,a5,a2
    110c:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1110:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1114:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1118:	1cb56363          	bltu	a0,a1,12de <printint.constprop.0+0x1f4>
        buf[i--] = digits[x % base];
    111c:	45b9                	li	a1,14
    111e:	02e877bb          	remuw	a5,a6,a4
    1122:	1782                	slli	a5,a5,0x20
    1124:	9381                	srli	a5,a5,0x20
    1126:	97b2                	add	a5,a5,a2
    1128:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    112c:	02e856bb          	divuw	a3,a6,a4
        buf[i--] = digits[x % base];
    1130:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    1134:	0ce86e63          	bltu	a6,a4,1210 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    1138:	02e6f5bb          	remuw	a1,a3,a4
    } while ((x /= base) != 0);
    113c:	02e6d7bb          	divuw	a5,a3,a4
        buf[i--] = digits[x % base];
    1140:	1582                	slli	a1,a1,0x20
    1142:	9181                	srli	a1,a1,0x20
    1144:	95b2                	add	a1,a1,a2
    1146:	0005c583          	lbu	a1,0(a1) # 200000 <digits+0x1fe018>
    114a:	00b10aa3          	sb	a1,21(sp)
    } while ((x /= base) != 0);
    114e:	0007859b          	sext.w	a1,a5
    1152:	12e6ec63          	bltu	a3,a4,128a <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    1156:	02e7f6bb          	remuw	a3,a5,a4
    115a:	1682                	slli	a3,a3,0x20
    115c:	9281                	srli	a3,a3,0x20
    115e:	96b2                	add	a3,a3,a2
    1160:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1164:	02e7d83b          	divuw	a6,a5,a4
        buf[i--] = digits[x % base];
    1168:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    116c:	12e5e863          	bltu	a1,a4,129c <printint.constprop.0+0x1b2>
        buf[i--] = digits[x % base];
    1170:	02e876bb          	remuw	a3,a6,a4
    1174:	1682                	slli	a3,a3,0x20
    1176:	9281                	srli	a3,a3,0x20
    1178:	96b2                	add	a3,a3,a2
    117a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    117e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1182:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1186:	12e86463          	bltu	a6,a4,12ae <printint.constprop.0+0x1c4>
        buf[i--] = digits[x % base];
    118a:	02e5f6bb          	remuw	a3,a1,a4
    118e:	1682                	slli	a3,a3,0x20
    1190:	9281                	srli	a3,a3,0x20
    1192:	96b2                	add	a3,a3,a2
    1194:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1198:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    119c:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    11a0:	0ce5ec63          	bltu	a1,a4,1278 <printint.constprop.0+0x18e>
        buf[i--] = digits[x % base];
    11a4:	02e876bb          	remuw	a3,a6,a4
    11a8:	1682                	slli	a3,a3,0x20
    11aa:	9281                	srli	a3,a3,0x20
    11ac:	96b2                	add	a3,a3,a2
    11ae:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11b2:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11b6:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11ba:	10e86963          	bltu	a6,a4,12cc <printint.constprop.0+0x1e2>
        buf[i--] = digits[x % base];
    11be:	02e5f6bb          	remuw	a3,a1,a4
    11c2:	1682                	slli	a3,a3,0x20
    11c4:	9281                	srli	a3,a3,0x20
    11c6:	96b2                	add	a3,a3,a2
    11c8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11cc:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11d0:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11d4:	10e5e763          	bltu	a1,a4,12e2 <printint.constprop.0+0x1f8>
        buf[i--] = digits[x % base];
    11d8:	02e876bb          	remuw	a3,a6,a4
    11dc:	1682                	slli	a3,a3,0x20
    11de:	9281                	srli	a3,a3,0x20
    11e0:	96b2                	add	a3,a3,a2
    11e2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11e6:	02e857bb          	divuw	a5,a6,a4
        buf[i--] = digits[x % base];
    11ea:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11ee:	10e86363          	bltu	a6,a4,12f4 <printint.constprop.0+0x20a>
        buf[i--] = digits[x % base];
    11f2:	1782                	slli	a5,a5,0x20
    11f4:	9381                	srli	a5,a5,0x20
    11f6:	97b2                	add	a5,a5,a2
    11f8:	0007c783          	lbu	a5,0(a5)
    11fc:	4599                	li	a1,6
    11fe:	00f10723          	sb	a5,14(sp)

    if (sign)
    1202:	00055763          	bgez	a0,1210 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1206:	02d00793          	li	a5,45
    120a:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    120e:	4595                	li	a1,5
    write(f, s, l);
    1210:	003c                	addi	a5,sp,8
    1212:	4641                	li	a2,16
    1214:	9e0d                	subw	a2,a2,a1
    1216:	4505                	li	a0,1
    1218:	95be                	add	a1,a1,a5
    121a:	29d000ef          	jal	ra,1cb6 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    121e:	70a2                	ld	ra,40(sp)
    1220:	6145                	addi	sp,sp,48
    1222:	8082                	ret
        x = -xx;
    1224:	40a0083b          	negw	a6,a0
        buf[i--] = digits[x % base];
    1228:	02b877bb          	remuw	a5,a6,a1
    122c:	00001617          	auipc	a2,0x1
    1230:	dbc60613          	addi	a2,a2,-580 # 1fe8 <digits>
    buf[16] = 0;
    1234:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1238:	0005871b          	sext.w	a4,a1
    123c:	1782                	slli	a5,a5,0x20
    123e:	9381                	srli	a5,a5,0x20
    1240:	97b2                	add	a5,a5,a2
    1242:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1246:	02b858bb          	divuw	a7,a6,a1
        buf[i--] = digits[x % base];
    124a:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    124e:	06b86963          	bltu	a6,a1,12c0 <printint.constprop.0+0x1d6>
        buf[i--] = digits[x % base];
    1252:	02e8f7bb          	remuw	a5,a7,a4
    1256:	1782                	slli	a5,a5,0x20
    1258:	9381                	srli	a5,a5,0x20
    125a:	97b2                	add	a5,a5,a2
    125c:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1260:	02e8d6bb          	divuw	a3,a7,a4
        buf[i--] = digits[x % base];
    1264:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    1268:	ece8f8e3          	bgeu	a7,a4,1138 <printint.constprop.0+0x4e>
        buf[i--] = '-';
    126c:	02d00793          	li	a5,45
    1270:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1274:	45b5                	li	a1,13
    1276:	bf69                	j	1210 <printint.constprop.0+0x126>
    1278:	45a9                	li	a1,10
    if (sign)
    127a:	f8055be3          	bgez	a0,1210 <printint.constprop.0+0x126>
        buf[i--] = '-';
    127e:	02d00793          	li	a5,45
    1282:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1286:	45a5                	li	a1,9
    1288:	b761                	j	1210 <printint.constprop.0+0x126>
    128a:	45b5                	li	a1,13
    if (sign)
    128c:	f80552e3          	bgez	a0,1210 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1290:	02d00793          	li	a5,45
    1294:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1298:	45b1                	li	a1,12
    129a:	bf9d                	j	1210 <printint.constprop.0+0x126>
    129c:	45b1                	li	a1,12
    if (sign)
    129e:	f60559e3          	bgez	a0,1210 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12a2:	02d00793          	li	a5,45
    12a6:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12aa:	45ad                	li	a1,11
    12ac:	b795                	j	1210 <printint.constprop.0+0x126>
    12ae:	45ad                	li	a1,11
    if (sign)
    12b0:	f60550e3          	bgez	a0,1210 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12b4:	02d00793          	li	a5,45
    12b8:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12bc:	45a9                	li	a1,10
    12be:	bf89                	j	1210 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12c0:	02d00793          	li	a5,45
    12c4:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12c8:	45b9                	li	a1,14
    12ca:	b799                	j	1210 <printint.constprop.0+0x126>
    12cc:	45a5                	li	a1,9
    if (sign)
    12ce:	f40551e3          	bgez	a0,1210 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12d2:	02d00793          	li	a5,45
    12d6:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12da:	45a1                	li	a1,8
    12dc:	bf15                	j	1210 <printint.constprop.0+0x126>
    i = 15;
    12de:	45bd                	li	a1,15
    12e0:	bf05                	j	1210 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    12e2:	45a1                	li	a1,8
    if (sign)
    12e4:	f20556e3          	bgez	a0,1210 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12e8:	02d00793          	li	a5,45
    12ec:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12f0:	459d                	li	a1,7
    12f2:	bf39                	j	1210 <printint.constprop.0+0x126>
    12f4:	459d                	li	a1,7
    if (sign)
    12f6:	f0055de3          	bgez	a0,1210 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12fa:	02d00793          	li	a5,45
    12fe:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1302:	4599                	li	a1,6
    1304:	b731                	j	1210 <printint.constprop.0+0x126>

0000000000001306 <getchar>:
{
    1306:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1308:	00f10593          	addi	a1,sp,15
    130c:	4605                	li	a2,1
    130e:	4501                	li	a0,0
{
    1310:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1312:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1316:	197000ef          	jal	ra,1cac <read>
}
    131a:	60e2                	ld	ra,24(sp)
    131c:	00f14503          	lbu	a0,15(sp)
    1320:	6105                	addi	sp,sp,32
    1322:	8082                	ret

0000000000001324 <putchar>:
{
    1324:	1101                	addi	sp,sp,-32
    1326:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1328:	00f10593          	addi	a1,sp,15
    132c:	4605                	li	a2,1
    132e:	4505                	li	a0,1
{
    1330:	ec06                	sd	ra,24(sp)
    char byte = c;
    1332:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1336:	181000ef          	jal	ra,1cb6 <write>
}
    133a:	60e2                	ld	ra,24(sp)
    133c:	2501                	sext.w	a0,a0
    133e:	6105                	addi	sp,sp,32
    1340:	8082                	ret

0000000000001342 <puts>:
{
    1342:	1141                	addi	sp,sp,-16
    1344:	e406                	sd	ra,8(sp)
    1346:	e022                	sd	s0,0(sp)
    1348:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    134a:	57e000ef          	jal	ra,18c8 <strlen>
    134e:	862a                	mv	a2,a0
    1350:	85a2                	mv	a1,s0
    1352:	4505                	li	a0,1
    1354:	163000ef          	jal	ra,1cb6 <write>
}
    1358:	60a2                	ld	ra,8(sp)
    135a:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    135c:	957d                	srai	a0,a0,0x3f
    return r;
    135e:	2501                	sext.w	a0,a0
}
    1360:	0141                	addi	sp,sp,16
    1362:	8082                	ret

0000000000001364 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1364:	7171                	addi	sp,sp,-176
    1366:	fc56                	sd	s5,56(sp)
    1368:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    136a:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    136c:	18bc                	addi	a5,sp,120
{
    136e:	e8ca                	sd	s2,80(sp)
    1370:	e4ce                	sd	s3,72(sp)
    1372:	e0d2                	sd	s4,64(sp)
    1374:	f85a                	sd	s6,48(sp)
    1376:	f486                	sd	ra,104(sp)
    1378:	f0a2                	sd	s0,96(sp)
    137a:	eca6                	sd	s1,88(sp)
    137c:	fcae                	sd	a1,120(sp)
    137e:	e132                	sd	a2,128(sp)
    1380:	e536                	sd	a3,136(sp)
    1382:	e93a                	sd	a4,144(sp)
    1384:	f142                	sd	a6,160(sp)
    1386:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1388:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    138a:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    138e:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1392:	00001b17          	auipc	s6,0x1
    1396:	c26b0b13          	addi	s6,s6,-986 # 1fb8 <__clone+0xca>
    buf[i++] = '0';
    139a:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    139e:	00001997          	auipc	s3,0x1
    13a2:	c4a98993          	addi	s3,s3,-950 # 1fe8 <digits>
        if (!*s)
    13a6:	00054783          	lbu	a5,0(a0)
    13aa:	16078a63          	beqz	a5,151e <printf+0x1ba>
    13ae:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13b0:	19278163          	beq	a5,s2,1532 <printf+0x1ce>
    13b4:	00164783          	lbu	a5,1(a2)
    13b8:	0605                	addi	a2,a2,1
    13ba:	fbfd                	bnez	a5,13b0 <printf+0x4c>
    13bc:	84b2                	mv	s1,a2
        l = z - a;
    13be:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13c2:	85aa                	mv	a1,a0
    13c4:	8622                	mv	a2,s0
    13c6:	4505                	li	a0,1
    13c8:	0ef000ef          	jal	ra,1cb6 <write>
        if (l)
    13cc:	18041c63          	bnez	s0,1564 <printf+0x200>
        if (s[1] == 0)
    13d0:	0014c783          	lbu	a5,1(s1)
    13d4:	14078563          	beqz	a5,151e <printf+0x1ba>
        switch (s[1])
    13d8:	1d478063          	beq	a5,s4,1598 <printf+0x234>
    13dc:	18fa6663          	bltu	s4,a5,1568 <printf+0x204>
    13e0:	06400713          	li	a4,100
    13e4:	1ae78063          	beq	a5,a4,1584 <printf+0x220>
    13e8:	07000713          	li	a4,112
    13ec:	1ce79963          	bne	a5,a4,15be <printf+0x25a>
            printptr(va_arg(ap, uint64));
    13f0:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13f2:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13f6:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13f8:	631c                	ld	a5,0(a4)
    13fa:	0721                	addi	a4,a4,8
    13fc:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13fe:	00479293          	slli	t0,a5,0x4
    1402:	00879f93          	slli	t6,a5,0x8
    1406:	00c79f13          	slli	t5,a5,0xc
    140a:	01079e93          	slli	t4,a5,0x10
    140e:	01479e13          	slli	t3,a5,0x14
    1412:	01879313          	slli	t1,a5,0x18
    1416:	01c79893          	slli	a7,a5,0x1c
    141a:	02479813          	slli	a6,a5,0x24
    141e:	02879513          	slli	a0,a5,0x28
    1422:	02c79593          	slli	a1,a5,0x2c
    1426:	03079693          	slli	a3,a5,0x30
    142a:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    142e:	03c7d413          	srli	s0,a5,0x3c
    1432:	01c7d39b          	srliw	t2,a5,0x1c
    1436:	03c2d293          	srli	t0,t0,0x3c
    143a:	03cfdf93          	srli	t6,t6,0x3c
    143e:	03cf5f13          	srli	t5,t5,0x3c
    1442:	03cede93          	srli	t4,t4,0x3c
    1446:	03ce5e13          	srli	t3,t3,0x3c
    144a:	03c35313          	srli	t1,t1,0x3c
    144e:	03c8d893          	srli	a7,a7,0x3c
    1452:	03c85813          	srli	a6,a6,0x3c
    1456:	9171                	srli	a0,a0,0x3c
    1458:	91f1                	srli	a1,a1,0x3c
    145a:	92f1                	srli	a3,a3,0x3c
    145c:	9371                	srli	a4,a4,0x3c
    145e:	96ce                	add	a3,a3,s3
    1460:	974e                	add	a4,a4,s3
    1462:	944e                	add	s0,s0,s3
    1464:	92ce                	add	t0,t0,s3
    1466:	9fce                	add	t6,t6,s3
    1468:	9f4e                	add	t5,t5,s3
    146a:	9ece                	add	t4,t4,s3
    146c:	9e4e                	add	t3,t3,s3
    146e:	934e                	add	t1,t1,s3
    1470:	98ce                	add	a7,a7,s3
    1472:	93ce                	add	t2,t2,s3
    1474:	984e                	add	a6,a6,s3
    1476:	954e                	add	a0,a0,s3
    1478:	95ce                	add	a1,a1,s3
    147a:	0006c083          	lbu	ra,0(a3)
    147e:	0002c283          	lbu	t0,0(t0)
    1482:	00074683          	lbu	a3,0(a4)
    1486:	000fcf83          	lbu	t6,0(t6)
    148a:	000f4f03          	lbu	t5,0(t5)
    148e:	000ece83          	lbu	t4,0(t4)
    1492:	000e4e03          	lbu	t3,0(t3)
    1496:	00034303          	lbu	t1,0(t1)
    149a:	0008c883          	lbu	a7,0(a7)
    149e:	0003c383          	lbu	t2,0(t2)
    14a2:	00084803          	lbu	a6,0(a6)
    14a6:	00054503          	lbu	a0,0(a0)
    14aa:	0005c583          	lbu	a1,0(a1)
    14ae:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14b2:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14b6:	9371                	srli	a4,a4,0x3c
    14b8:	8bbd                	andi	a5,a5,15
    14ba:	974e                	add	a4,a4,s3
    14bc:	97ce                	add	a5,a5,s3
    14be:	005105a3          	sb	t0,11(sp)
    14c2:	01f10623          	sb	t6,12(sp)
    14c6:	01e106a3          	sb	t5,13(sp)
    14ca:	01d10723          	sb	t4,14(sp)
    14ce:	01c107a3          	sb	t3,15(sp)
    14d2:	00610823          	sb	t1,16(sp)
    14d6:	011108a3          	sb	a7,17(sp)
    14da:	00710923          	sb	t2,18(sp)
    14de:	010109a3          	sb	a6,19(sp)
    14e2:	00a10a23          	sb	a0,20(sp)
    14e6:	00b10aa3          	sb	a1,21(sp)
    14ea:	00110b23          	sb	ra,22(sp)
    14ee:	00d10ba3          	sb	a3,23(sp)
    14f2:	00810523          	sb	s0,10(sp)
    14f6:	00074703          	lbu	a4,0(a4)
    14fa:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14fe:	002c                	addi	a1,sp,8
    1500:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1502:	00e10c23          	sb	a4,24(sp)
    1506:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    150a:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    150e:	7a8000ef          	jal	ra,1cb6 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1512:	00248513          	addi	a0,s1,2
        if (!*s)
    1516:	00054783          	lbu	a5,0(a0)
    151a:	e8079ae3          	bnez	a5,13ae <printf+0x4a>
    }
    va_end(ap);
}
    151e:	70a6                	ld	ra,104(sp)
    1520:	7406                	ld	s0,96(sp)
    1522:	64e6                	ld	s1,88(sp)
    1524:	6946                	ld	s2,80(sp)
    1526:	69a6                	ld	s3,72(sp)
    1528:	6a06                	ld	s4,64(sp)
    152a:	7ae2                	ld	s5,56(sp)
    152c:	7b42                	ld	s6,48(sp)
    152e:	614d                	addi	sp,sp,176
    1530:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1532:	00064783          	lbu	a5,0(a2)
    1536:	84b2                	mv	s1,a2
    1538:	01278963          	beq	a5,s2,154a <printf+0x1e6>
    153c:	b549                	j	13be <printf+0x5a>
    153e:	0024c783          	lbu	a5,2(s1)
    1542:	0605                	addi	a2,a2,1
    1544:	0489                	addi	s1,s1,2
    1546:	e7279ce3          	bne	a5,s2,13be <printf+0x5a>
    154a:	0014c783          	lbu	a5,1(s1)
    154e:	ff2788e3          	beq	a5,s2,153e <printf+0x1da>
        l = z - a;
    1552:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1556:	85aa                	mv	a1,a0
    1558:	8622                	mv	a2,s0
    155a:	4505                	li	a0,1
    155c:	75a000ef          	jal	ra,1cb6 <write>
        if (l)
    1560:	e60408e3          	beqz	s0,13d0 <printf+0x6c>
    1564:	8526                	mv	a0,s1
    1566:	b581                	j	13a6 <printf+0x42>
        switch (s[1])
    1568:	07800713          	li	a4,120
    156c:	04e79963          	bne	a5,a4,15be <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    1570:	6782                	ld	a5,0(sp)
    1572:	45c1                	li	a1,16
    1574:	4388                	lw	a0,0(a5)
    1576:	07a1                	addi	a5,a5,8
    1578:	e03e                	sd	a5,0(sp)
    157a:	b71ff0ef          	jal	ra,10ea <printint.constprop.0>
        s += 2;
    157e:	00248513          	addi	a0,s1,2
    1582:	bf51                	j	1516 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    1584:	6782                	ld	a5,0(sp)
    1586:	45a9                	li	a1,10
    1588:	4388                	lw	a0,0(a5)
    158a:	07a1                	addi	a5,a5,8
    158c:	e03e                	sd	a5,0(sp)
    158e:	b5dff0ef          	jal	ra,10ea <printint.constprop.0>
        s += 2;
    1592:	00248513          	addi	a0,s1,2
    1596:	b741                	j	1516 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1598:	6782                	ld	a5,0(sp)
    159a:	6380                	ld	s0,0(a5)
    159c:	07a1                	addi	a5,a5,8
    159e:	e03e                	sd	a5,0(sp)
    15a0:	c031                	beqz	s0,15e4 <printf+0x280>
            l = strnlen(a, 200);
    15a2:	0c800593          	li	a1,200
    15a6:	8522                	mv	a0,s0
    15a8:	40c000ef          	jal	ra,19b4 <strnlen>
    write(f, s, l);
    15ac:	0005061b          	sext.w	a2,a0
    15b0:	85a2                	mv	a1,s0
    15b2:	4505                	li	a0,1
    15b4:	702000ef          	jal	ra,1cb6 <write>
        s += 2;
    15b8:	00248513          	addi	a0,s1,2
    15bc:	bfa9                	j	1516 <printf+0x1b2>
    return write(stdout, &byte, 1);
    15be:	4605                	li	a2,1
    15c0:	002c                	addi	a1,sp,8
    15c2:	4505                	li	a0,1
    char byte = c;
    15c4:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15c8:	6ee000ef          	jal	ra,1cb6 <write>
    char byte = c;
    15cc:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15d0:	4605                	li	a2,1
    15d2:	002c                	addi	a1,sp,8
    15d4:	4505                	li	a0,1
    char byte = c;
    15d6:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15da:	6dc000ef          	jal	ra,1cb6 <write>
        s += 2;
    15de:	00248513          	addi	a0,s1,2
    15e2:	bf15                	j	1516 <printf+0x1b2>
                a = "(null)";
    15e4:	845a                	mv	s0,s6
    15e6:	bf75                	j	15a2 <printf+0x23e>

00000000000015e8 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15e8:	1141                	addi	sp,sp,-16
    15ea:	e406                	sd	ra,8(sp)
    puts(m);
    15ec:	d57ff0ef          	jal	ra,1342 <puts>
    exit(-100);
}
    15f0:	60a2                	ld	ra,8(sp)
    exit(-100);
    15f2:	f9c00513          	li	a0,-100
}
    15f6:	0141                	addi	sp,sp,16
    exit(-100);
    15f8:	a739                	j	1d06 <exit>

00000000000015fa <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15fa:	02000793          	li	a5,32
    15fe:	00f50663          	beq	a0,a5,160a <isspace+0x10>
    1602:	355d                	addiw	a0,a0,-9
    1604:	00553513          	sltiu	a0,a0,5
    1608:	8082                	ret
    160a:	4505                	li	a0,1
}
    160c:	8082                	ret

000000000000160e <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    160e:	fd05051b          	addiw	a0,a0,-48
}
    1612:	00a53513          	sltiu	a0,a0,10
    1616:	8082                	ret

0000000000001618 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1618:	02000613          	li	a2,32
    161c:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    161e:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1622:	ff77869b          	addiw	a3,a5,-9
    1626:	04c78c63          	beq	a5,a2,167e <atoi+0x66>
    162a:	0007871b          	sext.w	a4,a5
    162e:	04d5f863          	bgeu	a1,a3,167e <atoi+0x66>
        s++;
    switch (*s)
    1632:	02b00693          	li	a3,43
    1636:	04d78963          	beq	a5,a3,1688 <atoi+0x70>
    163a:	02d00693          	li	a3,45
    163e:	06d78263          	beq	a5,a3,16a2 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1642:	fd07061b          	addiw	a2,a4,-48
    1646:	47a5                	li	a5,9
    1648:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    164a:	4e01                	li	t3,0
    while (isdigit(*s))
    164c:	04c7e963          	bltu	a5,a2,169e <atoi+0x86>
    int n = 0, neg = 0;
    1650:	4501                	li	a0,0
    while (isdigit(*s))
    1652:	4825                	li	a6,9
    1654:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    1658:	0025179b          	slliw	a5,a0,0x2
    165c:	9fa9                	addw	a5,a5,a0
    165e:	fd07031b          	addiw	t1,a4,-48
    1662:	0017989b          	slliw	a7,a5,0x1
    while (isdigit(*s))
    1666:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    166a:	0685                	addi	a3,a3,1
    166c:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1670:	0006071b          	sext.w	a4,a2
    1674:	feb870e3          	bgeu	a6,a1,1654 <atoi+0x3c>
    return neg ? n : -n;
    1678:	000e0563          	beqz	t3,1682 <atoi+0x6a>
}
    167c:	8082                	ret
        s++;
    167e:	0505                	addi	a0,a0,1
    1680:	bf79                	j	161e <atoi+0x6>
    return neg ? n : -n;
    1682:	4113053b          	subw	a0,t1,a7
    1686:	8082                	ret
    while (isdigit(*s))
    1688:	00154703          	lbu	a4,1(a0)
    168c:	47a5                	li	a5,9
        s++;
    168e:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1692:	fd07061b          	addiw	a2,a4,-48
    int n = 0, neg = 0;
    1696:	4e01                	li	t3,0
    while (isdigit(*s))
    1698:	2701                	sext.w	a4,a4
    169a:	fac7fbe3          	bgeu	a5,a2,1650 <atoi+0x38>
    169e:	4501                	li	a0,0
}
    16a0:	8082                	ret
    while (isdigit(*s))
    16a2:	00154703          	lbu	a4,1(a0)
    16a6:	47a5                	li	a5,9
        s++;
    16a8:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    16ac:	fd07061b          	addiw	a2,a4,-48
    16b0:	2701                	sext.w	a4,a4
    16b2:	fec7e6e3          	bltu	a5,a2,169e <atoi+0x86>
        neg = 1;
    16b6:	4e05                	li	t3,1
    16b8:	bf61                	j	1650 <atoi+0x38>

00000000000016ba <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16ba:	16060d63          	beqz	a2,1834 <memset+0x17a>
    16be:	40a007b3          	neg	a5,a0
    16c2:	8b9d                	andi	a5,a5,7
    16c4:	00778693          	addi	a3,a5,7
    16c8:	482d                	li	a6,11
    16ca:	0ff5f713          	zext.b	a4,a1
    16ce:	fff60593          	addi	a1,a2,-1
    16d2:	1706e263          	bltu	a3,a6,1836 <memset+0x17c>
    16d6:	16d5ea63          	bltu	a1,a3,184a <memset+0x190>
    16da:	16078563          	beqz	a5,1844 <memset+0x18a>
    16de:	00e50023          	sb	a4,0(a0)
    16e2:	4685                	li	a3,1
    16e4:	00150593          	addi	a1,a0,1
    16e8:	14d78c63          	beq	a5,a3,1840 <memset+0x186>
    16ec:	00e500a3          	sb	a4,1(a0)
    16f0:	4689                	li	a3,2
    16f2:	00250593          	addi	a1,a0,2
    16f6:	14d78d63          	beq	a5,a3,1850 <memset+0x196>
    16fa:	00e50123          	sb	a4,2(a0)
    16fe:	468d                	li	a3,3
    1700:	00350593          	addi	a1,a0,3
    1704:	12d78b63          	beq	a5,a3,183a <memset+0x180>
    1708:	00e501a3          	sb	a4,3(a0)
    170c:	4691                	li	a3,4
    170e:	00450593          	addi	a1,a0,4
    1712:	14d78163          	beq	a5,a3,1854 <memset+0x19a>
    1716:	00e50223          	sb	a4,4(a0)
    171a:	4695                	li	a3,5
    171c:	00550593          	addi	a1,a0,5
    1720:	12d78c63          	beq	a5,a3,1858 <memset+0x19e>
    1724:	00e502a3          	sb	a4,5(a0)
    1728:	469d                	li	a3,7
    172a:	00650593          	addi	a1,a0,6
    172e:	12d79763          	bne	a5,a3,185c <memset+0x1a2>
    1732:	00750593          	addi	a1,a0,7
    1736:	00e50323          	sb	a4,6(a0)
    173a:	481d                	li	a6,7
    173c:	00871693          	slli	a3,a4,0x8
    1740:	01071893          	slli	a7,a4,0x10
    1744:	8ed9                	or	a3,a3,a4
    1746:	01871313          	slli	t1,a4,0x18
    174a:	0116e6b3          	or	a3,a3,a7
    174e:	0066e6b3          	or	a3,a3,t1
    1752:	02071893          	slli	a7,a4,0x20
    1756:	02871e13          	slli	t3,a4,0x28
    175a:	0116e6b3          	or	a3,a3,a7
    175e:	40f60333          	sub	t1,a2,a5
    1762:	03071893          	slli	a7,a4,0x30
    1766:	01c6e6b3          	or	a3,a3,t3
    176a:	0116e6b3          	or	a3,a3,a7
    176e:	03871e13          	slli	t3,a4,0x38
    1772:	97aa                	add	a5,a5,a0
    1774:	ff837893          	andi	a7,t1,-8
    1778:	01c6e6b3          	or	a3,a3,t3
    177c:	98be                	add	a7,a7,a5
    177e:	e394                	sd	a3,0(a5)
    1780:	07a1                	addi	a5,a5,8
    1782:	ff179ee3          	bne	a5,a7,177e <memset+0xc4>
    1786:	ff837893          	andi	a7,t1,-8
    178a:	011587b3          	add	a5,a1,a7
    178e:	010886bb          	addw	a3,a7,a6
    1792:	0b130663          	beq	t1,a7,183e <memset+0x184>
    1796:	00e78023          	sb	a4,0(a5)
    179a:	0016859b          	addiw	a1,a3,1
    179e:	08c5fb63          	bgeu	a1,a2,1834 <memset+0x17a>
    17a2:	00e780a3          	sb	a4,1(a5)
    17a6:	0026859b          	addiw	a1,a3,2
    17aa:	08c5f563          	bgeu	a1,a2,1834 <memset+0x17a>
    17ae:	00e78123          	sb	a4,2(a5)
    17b2:	0036859b          	addiw	a1,a3,3
    17b6:	06c5ff63          	bgeu	a1,a2,1834 <memset+0x17a>
    17ba:	00e781a3          	sb	a4,3(a5)
    17be:	0046859b          	addiw	a1,a3,4
    17c2:	06c5f963          	bgeu	a1,a2,1834 <memset+0x17a>
    17c6:	00e78223          	sb	a4,4(a5)
    17ca:	0056859b          	addiw	a1,a3,5
    17ce:	06c5f363          	bgeu	a1,a2,1834 <memset+0x17a>
    17d2:	00e782a3          	sb	a4,5(a5)
    17d6:	0066859b          	addiw	a1,a3,6
    17da:	04c5fd63          	bgeu	a1,a2,1834 <memset+0x17a>
    17de:	00e78323          	sb	a4,6(a5)
    17e2:	0076859b          	addiw	a1,a3,7
    17e6:	04c5f763          	bgeu	a1,a2,1834 <memset+0x17a>
    17ea:	00e783a3          	sb	a4,7(a5)
    17ee:	0086859b          	addiw	a1,a3,8
    17f2:	04c5f163          	bgeu	a1,a2,1834 <memset+0x17a>
    17f6:	00e78423          	sb	a4,8(a5)
    17fa:	0096859b          	addiw	a1,a3,9
    17fe:	02c5fb63          	bgeu	a1,a2,1834 <memset+0x17a>
    1802:	00e784a3          	sb	a4,9(a5)
    1806:	00a6859b          	addiw	a1,a3,10
    180a:	02c5f563          	bgeu	a1,a2,1834 <memset+0x17a>
    180e:	00e78523          	sb	a4,10(a5)
    1812:	00b6859b          	addiw	a1,a3,11
    1816:	00c5ff63          	bgeu	a1,a2,1834 <memset+0x17a>
    181a:	00e785a3          	sb	a4,11(a5)
    181e:	00c6859b          	addiw	a1,a3,12
    1822:	00c5f963          	bgeu	a1,a2,1834 <memset+0x17a>
    1826:	00e78623          	sb	a4,12(a5)
    182a:	26b5                	addiw	a3,a3,13
    182c:	00c6f463          	bgeu	a3,a2,1834 <memset+0x17a>
    1830:	00e786a3          	sb	a4,13(a5)
        ;
    return dest;
}
    1834:	8082                	ret
    1836:	46ad                	li	a3,11
    1838:	bd79                	j	16d6 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    183a:	480d                	li	a6,3
    183c:	b701                	j	173c <memset+0x82>
    183e:	8082                	ret
    1840:	4805                	li	a6,1
    1842:	bded                	j	173c <memset+0x82>
    1844:	85aa                	mv	a1,a0
    1846:	4801                	li	a6,0
    1848:	bdd5                	j	173c <memset+0x82>
    184a:	87aa                	mv	a5,a0
    184c:	4681                	li	a3,0
    184e:	b7a1                	j	1796 <memset+0xdc>
    1850:	4809                	li	a6,2
    1852:	b5ed                	j	173c <memset+0x82>
    1854:	4811                	li	a6,4
    1856:	b5dd                	j	173c <memset+0x82>
    1858:	4815                	li	a6,5
    185a:	b5cd                	j	173c <memset+0x82>
    185c:	4819                	li	a6,6
    185e:	bdf9                	j	173c <memset+0x82>

0000000000001860 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1860:	00054783          	lbu	a5,0(a0)
    1864:	0005c703          	lbu	a4,0(a1)
    1868:	00e79863          	bne	a5,a4,1878 <strcmp+0x18>
    186c:	0505                	addi	a0,a0,1
    186e:	0585                	addi	a1,a1,1
    1870:	fbe5                	bnez	a5,1860 <strcmp>
    1872:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1874:	9d19                	subw	a0,a0,a4
    1876:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1878:	0007851b          	sext.w	a0,a5
    187c:	bfe5                	j	1874 <strcmp+0x14>

000000000000187e <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    187e:	ca15                	beqz	a2,18b2 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1880:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1884:	167d                	addi	a2,a2,-1
    1886:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    188a:	eb99                	bnez	a5,18a0 <strncmp+0x22>
    188c:	a815                	j	18c0 <strncmp+0x42>
    188e:	00a68e63          	beq	a3,a0,18aa <strncmp+0x2c>
    1892:	0505                	addi	a0,a0,1
    1894:	00f71b63          	bne	a4,a5,18aa <strncmp+0x2c>
    1898:	00054783          	lbu	a5,0(a0)
    189c:	cf89                	beqz	a5,18b6 <strncmp+0x38>
    189e:	85b2                	mv	a1,a2
    18a0:	0005c703          	lbu	a4,0(a1)
    18a4:	00158613          	addi	a2,a1,1
    18a8:	f37d                	bnez	a4,188e <strncmp+0x10>
        ;
    return *l - *r;
    18aa:	0007851b          	sext.w	a0,a5
    18ae:	9d19                	subw	a0,a0,a4
    18b0:	8082                	ret
        return 0;
    18b2:	4501                	li	a0,0
}
    18b4:	8082                	ret
    return *l - *r;
    18b6:	0015c703          	lbu	a4,1(a1)
    18ba:	4501                	li	a0,0
    18bc:	9d19                	subw	a0,a0,a4
    18be:	8082                	ret
    18c0:	0005c703          	lbu	a4,0(a1)
    18c4:	4501                	li	a0,0
    18c6:	b7e5                	j	18ae <strncmp+0x30>

00000000000018c8 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18c8:	00757793          	andi	a5,a0,7
    18cc:	cf89                	beqz	a5,18e6 <strlen+0x1e>
    18ce:	87aa                	mv	a5,a0
    18d0:	a029                	j	18da <strlen+0x12>
    18d2:	0785                	addi	a5,a5,1
    18d4:	0077f713          	andi	a4,a5,7
    18d8:	cb01                	beqz	a4,18e8 <strlen+0x20>
        if (!*s)
    18da:	0007c703          	lbu	a4,0(a5)
    18de:	fb75                	bnez	a4,18d2 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18e0:	40a78533          	sub	a0,a5,a0
}
    18e4:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18e6:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18e8:	6394                	ld	a3,0(a5)
    18ea:	00000597          	auipc	a1,0x0
    18ee:	6d65b583          	ld	a1,1750(a1) # 1fc0 <__clone+0xd2>
    18f2:	00000617          	auipc	a2,0x0
    18f6:	6d663603          	ld	a2,1750(a2) # 1fc8 <__clone+0xda>
    18fa:	a019                	j	1900 <strlen+0x38>
    18fc:	6794                	ld	a3,8(a5)
    18fe:	07a1                	addi	a5,a5,8
    1900:	00b68733          	add	a4,a3,a1
    1904:	fff6c693          	not	a3,a3
    1908:	8f75                	and	a4,a4,a3
    190a:	8f71                	and	a4,a4,a2
    190c:	db65                	beqz	a4,18fc <strlen+0x34>
    for (; *s; s++)
    190e:	0007c703          	lbu	a4,0(a5)
    1912:	d779                	beqz	a4,18e0 <strlen+0x18>
    1914:	0017c703          	lbu	a4,1(a5)
    1918:	0785                	addi	a5,a5,1
    191a:	d379                	beqz	a4,18e0 <strlen+0x18>
    191c:	0017c703          	lbu	a4,1(a5)
    1920:	0785                	addi	a5,a5,1
    1922:	fb6d                	bnez	a4,1914 <strlen+0x4c>
    1924:	bf75                	j	18e0 <strlen+0x18>

0000000000001926 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1926:	00757713          	andi	a4,a0,7
{
    192a:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    192c:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1930:	cb19                	beqz	a4,1946 <memchr+0x20>
    1932:	ce25                	beqz	a2,19aa <memchr+0x84>
    1934:	0007c703          	lbu	a4,0(a5)
    1938:	04b70e63          	beq	a4,a1,1994 <memchr+0x6e>
    193c:	0785                	addi	a5,a5,1
    193e:	0077f713          	andi	a4,a5,7
    1942:	167d                	addi	a2,a2,-1
    1944:	f77d                	bnez	a4,1932 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1946:	4501                	li	a0,0
    if (n && *s != c)
    1948:	c235                	beqz	a2,19ac <memchr+0x86>
    194a:	0007c703          	lbu	a4,0(a5)
    194e:	04b70363          	beq	a4,a1,1994 <memchr+0x6e>
        size_t k = ONES * c;
    1952:	00000517          	auipc	a0,0x0
    1956:	67e53503          	ld	a0,1662(a0) # 1fd0 <__clone+0xe2>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    195a:	471d                	li	a4,7
        size_t k = ONES * c;
    195c:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1960:	02c77a63          	bgeu	a4,a2,1994 <memchr+0x6e>
    1964:	00000897          	auipc	a7,0x0
    1968:	65c8b883          	ld	a7,1628(a7) # 1fc0 <__clone+0xd2>
    196c:	00000817          	auipc	a6,0x0
    1970:	65c83803          	ld	a6,1628(a6) # 1fc8 <__clone+0xda>
    1974:	431d                	li	t1,7
    1976:	a029                	j	1980 <memchr+0x5a>
    1978:	1661                	addi	a2,a2,-8
    197a:	07a1                	addi	a5,a5,8
    197c:	02c37963          	bgeu	t1,a2,19ae <memchr+0x88>
    1980:	6398                	ld	a4,0(a5)
    1982:	8f29                	xor	a4,a4,a0
    1984:	011706b3          	add	a3,a4,a7
    1988:	fff74713          	not	a4,a4
    198c:	8f75                	and	a4,a4,a3
    198e:	01077733          	and	a4,a4,a6
    1992:	d37d                	beqz	a4,1978 <memchr+0x52>
{
    1994:	853e                	mv	a0,a5
    1996:	97b2                	add	a5,a5,a2
    1998:	a021                	j	19a0 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    199a:	0505                	addi	a0,a0,1
    199c:	00f50763          	beq	a0,a5,19aa <memchr+0x84>
    19a0:	00054703          	lbu	a4,0(a0)
    19a4:	feb71be3          	bne	a4,a1,199a <memchr+0x74>
    19a8:	8082                	ret
    return n ? (void *)s : 0;
    19aa:	4501                	li	a0,0
}
    19ac:	8082                	ret
    return n ? (void *)s : 0;
    19ae:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    19b0:	f275                	bnez	a2,1994 <memchr+0x6e>
}
    19b2:	8082                	ret

00000000000019b4 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19b4:	1101                	addi	sp,sp,-32
    19b6:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19b8:	862e                	mv	a2,a1
{
    19ba:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19bc:	4581                	li	a1,0
{
    19be:	e426                	sd	s1,8(sp)
    19c0:	ec06                	sd	ra,24(sp)
    19c2:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19c4:	f63ff0ef          	jal	ra,1926 <memchr>
    return p ? p - s : n;
    19c8:	c519                	beqz	a0,19d6 <strnlen+0x22>
}
    19ca:	60e2                	ld	ra,24(sp)
    19cc:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19ce:	8d05                	sub	a0,a0,s1
}
    19d0:	64a2                	ld	s1,8(sp)
    19d2:	6105                	addi	sp,sp,32
    19d4:	8082                	ret
    19d6:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19d8:	8522                	mv	a0,s0
}
    19da:	6442                	ld	s0,16(sp)
    19dc:	64a2                	ld	s1,8(sp)
    19de:	6105                	addi	sp,sp,32
    19e0:	8082                	ret

00000000000019e2 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19e2:	00a5c7b3          	xor	a5,a1,a0
    19e6:	8b9d                	andi	a5,a5,7
    19e8:	eb95                	bnez	a5,1a1c <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19ea:	0075f793          	andi	a5,a1,7
    19ee:	e7b1                	bnez	a5,1a3a <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19f0:	6198                	ld	a4,0(a1)
    19f2:	00000617          	auipc	a2,0x0
    19f6:	5ce63603          	ld	a2,1486(a2) # 1fc0 <__clone+0xd2>
    19fa:	00000817          	auipc	a6,0x0
    19fe:	5ce83803          	ld	a6,1486(a6) # 1fc8 <__clone+0xda>
    1a02:	a029                	j	1a0c <strcpy+0x2a>
    1a04:	05a1                	addi	a1,a1,8
    1a06:	e118                	sd	a4,0(a0)
    1a08:	6198                	ld	a4,0(a1)
    1a0a:	0521                	addi	a0,a0,8
    1a0c:	00c707b3          	add	a5,a4,a2
    1a10:	fff74693          	not	a3,a4
    1a14:	8ff5                	and	a5,a5,a3
    1a16:	0107f7b3          	and	a5,a5,a6
    1a1a:	d7ed                	beqz	a5,1a04 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a1c:	0005c783          	lbu	a5,0(a1)
    1a20:	00f50023          	sb	a5,0(a0)
    1a24:	c785                	beqz	a5,1a4c <strcpy+0x6a>
    1a26:	0015c783          	lbu	a5,1(a1)
    1a2a:	0505                	addi	a0,a0,1
    1a2c:	0585                	addi	a1,a1,1
    1a2e:	00f50023          	sb	a5,0(a0)
    1a32:	fbf5                	bnez	a5,1a26 <strcpy+0x44>
        ;
    return d;
}
    1a34:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a36:	0505                	addi	a0,a0,1
    1a38:	df45                	beqz	a4,19f0 <strcpy+0xe>
            if (!(*d = *s))
    1a3a:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a3e:	0585                	addi	a1,a1,1
    1a40:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1a44:	00f50023          	sb	a5,0(a0)
    1a48:	f7fd                	bnez	a5,1a36 <strcpy+0x54>
}
    1a4a:	8082                	ret
    1a4c:	8082                	ret

0000000000001a4e <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a4e:	00a5c7b3          	xor	a5,a1,a0
    1a52:	8b9d                	andi	a5,a5,7
    1a54:	1a079863          	bnez	a5,1c04 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a58:	0075f793          	andi	a5,a1,7
    1a5c:	16078463          	beqz	a5,1bc4 <strncpy+0x176>
    1a60:	ea01                	bnez	a2,1a70 <strncpy+0x22>
    1a62:	a421                	j	1c6a <strncpy+0x21c>
    1a64:	167d                	addi	a2,a2,-1
    1a66:	0505                	addi	a0,a0,1
    1a68:	14070e63          	beqz	a4,1bc4 <strncpy+0x176>
    1a6c:	1a060863          	beqz	a2,1c1c <strncpy+0x1ce>
    1a70:	0005c783          	lbu	a5,0(a1)
    1a74:	0585                	addi	a1,a1,1
    1a76:	0075f713          	andi	a4,a1,7
    1a7a:	00f50023          	sb	a5,0(a0)
    1a7e:	f3fd                	bnez	a5,1a64 <strncpy+0x16>
    1a80:	4805                	li	a6,1
    1a82:	1a061863          	bnez	a2,1c32 <strncpy+0x1e4>
    1a86:	40a007b3          	neg	a5,a0
    1a8a:	8b9d                	andi	a5,a5,7
    1a8c:	4681                	li	a3,0
    1a8e:	18061a63          	bnez	a2,1c22 <strncpy+0x1d4>
    1a92:	00778713          	addi	a4,a5,7
    1a96:	45ad                	li	a1,11
    1a98:	18b76363          	bltu	a4,a1,1c1e <strncpy+0x1d0>
    1a9c:	1ae6eb63          	bltu	a3,a4,1c52 <strncpy+0x204>
    1aa0:	1a078363          	beqz	a5,1c46 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1aa4:	00050023          	sb	zero,0(a0)
    1aa8:	4685                	li	a3,1
    1aaa:	00150713          	addi	a4,a0,1
    1aae:	18d78f63          	beq	a5,a3,1c4c <strncpy+0x1fe>
    1ab2:	000500a3          	sb	zero,1(a0)
    1ab6:	4689                	li	a3,2
    1ab8:	00250713          	addi	a4,a0,2
    1abc:	18d78e63          	beq	a5,a3,1c58 <strncpy+0x20a>
    1ac0:	00050123          	sb	zero,2(a0)
    1ac4:	468d                	li	a3,3
    1ac6:	00350713          	addi	a4,a0,3
    1aca:	16d78c63          	beq	a5,a3,1c42 <strncpy+0x1f4>
    1ace:	000501a3          	sb	zero,3(a0)
    1ad2:	4691                	li	a3,4
    1ad4:	00450713          	addi	a4,a0,4
    1ad8:	18d78263          	beq	a5,a3,1c5c <strncpy+0x20e>
    1adc:	00050223          	sb	zero,4(a0)
    1ae0:	4695                	li	a3,5
    1ae2:	00550713          	addi	a4,a0,5
    1ae6:	16d78d63          	beq	a5,a3,1c60 <strncpy+0x212>
    1aea:	000502a3          	sb	zero,5(a0)
    1aee:	469d                	li	a3,7
    1af0:	00650713          	addi	a4,a0,6
    1af4:	16d79863          	bne	a5,a3,1c64 <strncpy+0x216>
    1af8:	00750713          	addi	a4,a0,7
    1afc:	00050323          	sb	zero,6(a0)
    1b00:	40f80833          	sub	a6,a6,a5
    1b04:	ff887593          	andi	a1,a6,-8
    1b08:	97aa                	add	a5,a5,a0
    1b0a:	95be                	add	a1,a1,a5
    1b0c:	0007b023          	sd	zero,0(a5)
    1b10:	07a1                	addi	a5,a5,8
    1b12:	feb79de3          	bne	a5,a1,1b0c <strncpy+0xbe>
    1b16:	ff887593          	andi	a1,a6,-8
    1b1a:	9ead                	addw	a3,a3,a1
    1b1c:	00b707b3          	add	a5,a4,a1
    1b20:	12b80863          	beq	a6,a1,1c50 <strncpy+0x202>
    1b24:	00078023          	sb	zero,0(a5)
    1b28:	0016871b          	addiw	a4,a3,1
    1b2c:	0ec77863          	bgeu	a4,a2,1c1c <strncpy+0x1ce>
    1b30:	000780a3          	sb	zero,1(a5)
    1b34:	0026871b          	addiw	a4,a3,2
    1b38:	0ec77263          	bgeu	a4,a2,1c1c <strncpy+0x1ce>
    1b3c:	00078123          	sb	zero,2(a5)
    1b40:	0036871b          	addiw	a4,a3,3
    1b44:	0cc77c63          	bgeu	a4,a2,1c1c <strncpy+0x1ce>
    1b48:	000781a3          	sb	zero,3(a5)
    1b4c:	0046871b          	addiw	a4,a3,4
    1b50:	0cc77663          	bgeu	a4,a2,1c1c <strncpy+0x1ce>
    1b54:	00078223          	sb	zero,4(a5)
    1b58:	0056871b          	addiw	a4,a3,5
    1b5c:	0cc77063          	bgeu	a4,a2,1c1c <strncpy+0x1ce>
    1b60:	000782a3          	sb	zero,5(a5)
    1b64:	0066871b          	addiw	a4,a3,6
    1b68:	0ac77a63          	bgeu	a4,a2,1c1c <strncpy+0x1ce>
    1b6c:	00078323          	sb	zero,6(a5)
    1b70:	0076871b          	addiw	a4,a3,7
    1b74:	0ac77463          	bgeu	a4,a2,1c1c <strncpy+0x1ce>
    1b78:	000783a3          	sb	zero,7(a5)
    1b7c:	0086871b          	addiw	a4,a3,8
    1b80:	08c77e63          	bgeu	a4,a2,1c1c <strncpy+0x1ce>
    1b84:	00078423          	sb	zero,8(a5)
    1b88:	0096871b          	addiw	a4,a3,9
    1b8c:	08c77863          	bgeu	a4,a2,1c1c <strncpy+0x1ce>
    1b90:	000784a3          	sb	zero,9(a5)
    1b94:	00a6871b          	addiw	a4,a3,10
    1b98:	08c77263          	bgeu	a4,a2,1c1c <strncpy+0x1ce>
    1b9c:	00078523          	sb	zero,10(a5)
    1ba0:	00b6871b          	addiw	a4,a3,11
    1ba4:	06c77c63          	bgeu	a4,a2,1c1c <strncpy+0x1ce>
    1ba8:	000785a3          	sb	zero,11(a5)
    1bac:	00c6871b          	addiw	a4,a3,12
    1bb0:	06c77663          	bgeu	a4,a2,1c1c <strncpy+0x1ce>
    1bb4:	00078623          	sb	zero,12(a5)
    1bb8:	26b5                	addiw	a3,a3,13
    1bba:	06c6f163          	bgeu	a3,a2,1c1c <strncpy+0x1ce>
    1bbe:	000786a3          	sb	zero,13(a5)
    1bc2:	8082                	ret
            ;
        if (!n || !*s)
    1bc4:	c645                	beqz	a2,1c6c <strncpy+0x21e>
    1bc6:	0005c783          	lbu	a5,0(a1)
    1bca:	ea078be3          	beqz	a5,1a80 <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bce:	479d                	li	a5,7
    1bd0:	02c7ff63          	bgeu	a5,a2,1c0e <strncpy+0x1c0>
    1bd4:	00000897          	auipc	a7,0x0
    1bd8:	3ec8b883          	ld	a7,1004(a7) # 1fc0 <__clone+0xd2>
    1bdc:	00000817          	auipc	a6,0x0
    1be0:	3ec83803          	ld	a6,1004(a6) # 1fc8 <__clone+0xda>
    1be4:	431d                	li	t1,7
    1be6:	6198                	ld	a4,0(a1)
    1be8:	011707b3          	add	a5,a4,a7
    1bec:	fff74693          	not	a3,a4
    1bf0:	8ff5                	and	a5,a5,a3
    1bf2:	0107f7b3          	and	a5,a5,a6
    1bf6:	ef81                	bnez	a5,1c0e <strncpy+0x1c0>
            *wd = *ws;
    1bf8:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bfa:	1661                	addi	a2,a2,-8
    1bfc:	05a1                	addi	a1,a1,8
    1bfe:	0521                	addi	a0,a0,8
    1c00:	fec363e3          	bltu	t1,a2,1be6 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1c04:	e609                	bnez	a2,1c0e <strncpy+0x1c0>
    1c06:	a08d                	j	1c68 <strncpy+0x21a>
    1c08:	167d                	addi	a2,a2,-1
    1c0a:	0505                	addi	a0,a0,1
    1c0c:	ca01                	beqz	a2,1c1c <strncpy+0x1ce>
    1c0e:	0005c783          	lbu	a5,0(a1)
    1c12:	0585                	addi	a1,a1,1
    1c14:	00f50023          	sb	a5,0(a0)
    1c18:	fbe5                	bnez	a5,1c08 <strncpy+0x1ba>
        ;
tail:
    1c1a:	b59d                	j	1a80 <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1c1c:	8082                	ret
    1c1e:	472d                	li	a4,11
    1c20:	bdb5                	j	1a9c <strncpy+0x4e>
    1c22:	00778713          	addi	a4,a5,7
    1c26:	45ad                	li	a1,11
    1c28:	fff60693          	addi	a3,a2,-1
    1c2c:	e6b778e3          	bgeu	a4,a1,1a9c <strncpy+0x4e>
    1c30:	b7fd                	j	1c1e <strncpy+0x1d0>
    1c32:	40a007b3          	neg	a5,a0
    1c36:	8832                	mv	a6,a2
    1c38:	8b9d                	andi	a5,a5,7
    1c3a:	4681                	li	a3,0
    1c3c:	e4060be3          	beqz	a2,1a92 <strncpy+0x44>
    1c40:	b7cd                	j	1c22 <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c42:	468d                	li	a3,3
    1c44:	bd75                	j	1b00 <strncpy+0xb2>
    1c46:	872a                	mv	a4,a0
    1c48:	4681                	li	a3,0
    1c4a:	bd5d                	j	1b00 <strncpy+0xb2>
    1c4c:	4685                	li	a3,1
    1c4e:	bd4d                	j	1b00 <strncpy+0xb2>
    1c50:	8082                	ret
    1c52:	87aa                	mv	a5,a0
    1c54:	4681                	li	a3,0
    1c56:	b5f9                	j	1b24 <strncpy+0xd6>
    1c58:	4689                	li	a3,2
    1c5a:	b55d                	j	1b00 <strncpy+0xb2>
    1c5c:	4691                	li	a3,4
    1c5e:	b54d                	j	1b00 <strncpy+0xb2>
    1c60:	4695                	li	a3,5
    1c62:	bd79                	j	1b00 <strncpy+0xb2>
    1c64:	4699                	li	a3,6
    1c66:	bd69                	j	1b00 <strncpy+0xb2>
    1c68:	8082                	ret
    1c6a:	8082                	ret
    1c6c:	8082                	ret

0000000000001c6e <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c6e:	87aa                	mv	a5,a0
    1c70:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c72:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c76:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c7a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c7c:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c7e:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c82:	2501                	sext.w	a0,a0
    1c84:	8082                	ret

0000000000001c86 <openat>:
    register long a7 __asm__("a7") = n;
    1c86:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c8a:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c8e:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c92:	2501                	sext.w	a0,a0
    1c94:	8082                	ret

0000000000001c96 <fcntl>:
    register long a7 __asm__("a7") = n;
    1c96:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c98:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1c9c:	2501                	sext.w	a0,a0
    1c9e:	8082                	ret

0000000000001ca0 <close>:
    register long a7 __asm__("a7") = n;
    1ca0:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1ca4:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1ca8:	2501                	sext.w	a0,a0
    1caa:	8082                	ret

0000000000001cac <read>:
    register long a7 __asm__("a7") = n;
    1cac:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cb0:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1cb4:	8082                	ret

0000000000001cb6 <write>:
    register long a7 __asm__("a7") = n;
    1cb6:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cba:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1cbe:	8082                	ret

0000000000001cc0 <getpid>:
    register long a7 __asm__("a7") = n;
    1cc0:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1cc4:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1cc8:	2501                	sext.w	a0,a0
    1cca:	8082                	ret

0000000000001ccc <getppid>:
    register long a7 __asm__("a7") = n;
    1ccc:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1cd0:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cd4:	2501                	sext.w	a0,a0
    1cd6:	8082                	ret

0000000000001cd8 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cd8:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cdc:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1ce0:	2501                	sext.w	a0,a0
    1ce2:	8082                	ret

0000000000001ce4 <fork>:
    register long a7 __asm__("a7") = n;
    1ce4:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1ce8:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cea:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cec:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cf0:	2501                	sext.w	a0,a0
    1cf2:	8082                	ret

0000000000001cf4 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cf4:	85b2                	mv	a1,a2
    1cf6:	863a                	mv	a2,a4
    if (stack)
    1cf8:	c191                	beqz	a1,1cfc <clone+0x8>
	stack += stack_size;
    1cfa:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cfc:	4781                	li	a5,0
    1cfe:	4701                	li	a4,0
    1d00:	4681                	li	a3,0
    1d02:	2601                	sext.w	a2,a2
    1d04:	a2ed                	j	1eee <__clone>

0000000000001d06 <exit>:
    register long a7 __asm__("a7") = n;
    1d06:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d0a:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d0e:	8082                	ret

0000000000001d10 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d10:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d14:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d16:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d1a:	2501                	sext.w	a0,a0
    1d1c:	8082                	ret

0000000000001d1e <exec>:
    register long a7 __asm__("a7") = n;
    1d1e:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d22:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d26:	2501                	sext.w	a0,a0
    1d28:	8082                	ret

0000000000001d2a <execve>:
    register long a7 __asm__("a7") = n;
    1d2a:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d2e:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d32:	2501                	sext.w	a0,a0
    1d34:	8082                	ret

0000000000001d36 <times>:
    register long a7 __asm__("a7") = n;
    1d36:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d3a:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d3e:	2501                	sext.w	a0,a0
    1d40:	8082                	ret

0000000000001d42 <get_time>:

int64 get_time()
{
    1d42:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d44:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d48:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d4a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d4c:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d50:	2501                	sext.w	a0,a0
    1d52:	ed09                	bnez	a0,1d6c <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d54:	67a2                	ld	a5,8(sp)
    1d56:	3e800713          	li	a4,1000
    1d5a:	00015503          	lhu	a0,0(sp)
    1d5e:	02e7d7b3          	divu	a5,a5,a4
    1d62:	02e50533          	mul	a0,a0,a4
    1d66:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d68:	0141                	addi	sp,sp,16
    1d6a:	8082                	ret
        return -1;
    1d6c:	557d                	li	a0,-1
    1d6e:	bfed                	j	1d68 <get_time+0x26>

0000000000001d70 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d70:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d74:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d78:	2501                	sext.w	a0,a0
    1d7a:	8082                	ret

0000000000001d7c <time>:
    register long a7 __asm__("a7") = n;
    1d7c:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d80:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d84:	2501                	sext.w	a0,a0
    1d86:	8082                	ret

0000000000001d88 <sleep>:

int sleep(unsigned long long time)
{
    1d88:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d8a:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d8c:	850a                	mv	a0,sp
    1d8e:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d90:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d94:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d96:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d9a:	e501                	bnez	a0,1da2 <sleep+0x1a>
    return 0;
    1d9c:	4501                	li	a0,0
}
    1d9e:	0141                	addi	sp,sp,16
    1da0:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1da2:	4502                	lw	a0,0(sp)
}
    1da4:	0141                	addi	sp,sp,16
    1da6:	8082                	ret

0000000000001da8 <set_priority>:
    register long a7 __asm__("a7") = n;
    1da8:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1dac:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1db0:	2501                	sext.w	a0,a0
    1db2:	8082                	ret

0000000000001db4 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1db4:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1db8:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1dbc:	8082                	ret

0000000000001dbe <munmap>:
    register long a7 __asm__("a7") = n;
    1dbe:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc2:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1dc6:	2501                	sext.w	a0,a0
    1dc8:	8082                	ret

0000000000001dca <wait>:

int wait(int *code)
{
    1dca:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dcc:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1dd0:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1dd2:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1dd4:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dd6:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1dda:	2501                	sext.w	a0,a0
    1ddc:	8082                	ret

0000000000001dde <spawn>:
    register long a7 __asm__("a7") = n;
    1dde:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1de2:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1de6:	2501                	sext.w	a0,a0
    1de8:	8082                	ret

0000000000001dea <mailread>:
    register long a7 __asm__("a7") = n;
    1dea:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dee:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1df2:	2501                	sext.w	a0,a0
    1df4:	8082                	ret

0000000000001df6 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1df6:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dfa:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dfe:	2501                	sext.w	a0,a0
    1e00:	8082                	ret

0000000000001e02 <fstat>:
    register long a7 __asm__("a7") = n;
    1e02:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e06:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e0a:	2501                	sext.w	a0,a0
    1e0c:	8082                	ret

0000000000001e0e <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e0e:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e10:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e14:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e16:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e1a:	2501                	sext.w	a0,a0
    1e1c:	8082                	ret

0000000000001e1e <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e1e:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e20:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e24:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e26:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e2a:	2501                	sext.w	a0,a0
    1e2c:	8082                	ret

0000000000001e2e <link>:

int link(char *old_path, char *new_path)
{
    1e2e:	87aa                	mv	a5,a0
    1e30:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e32:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e36:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e3a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e3c:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e40:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e42:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e46:	2501                	sext.w	a0,a0
    1e48:	8082                	ret

0000000000001e4a <unlink>:

int unlink(char *path)
{
    1e4a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e4c:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e50:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e54:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e56:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e5a:	2501                	sext.w	a0,a0
    1e5c:	8082                	ret

0000000000001e5e <uname>:
    register long a7 __asm__("a7") = n;
    1e5e:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e62:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e66:	2501                	sext.w	a0,a0
    1e68:	8082                	ret

0000000000001e6a <brk>:
    register long a7 __asm__("a7") = n;
    1e6a:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e6e:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e72:	2501                	sext.w	a0,a0
    1e74:	8082                	ret

0000000000001e76 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e76:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e78:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e7c:	8082                	ret

0000000000001e7e <chdir>:
    register long a7 __asm__("a7") = n;
    1e7e:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e82:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e86:	2501                	sext.w	a0,a0
    1e88:	8082                	ret

0000000000001e8a <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e8a:	862e                	mv	a2,a1
    1e8c:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e8e:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e90:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e94:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e98:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e9a:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e9c:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1ea0:	2501                	sext.w	a0,a0
    1ea2:	8082                	ret

0000000000001ea4 <getdents>:
    register long a7 __asm__("a7") = n;
    1ea4:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ea8:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1eac:	2501                	sext.w	a0,a0
    1eae:	8082                	ret

0000000000001eb0 <pipe>:
    register long a7 __asm__("a7") = n;
    1eb0:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1eb4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb6:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1eba:	2501                	sext.w	a0,a0
    1ebc:	8082                	ret

0000000000001ebe <dup>:
    register long a7 __asm__("a7") = n;
    1ebe:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1ec0:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1ec4:	2501                	sext.w	a0,a0
    1ec6:	8082                	ret

0000000000001ec8 <dup2>:
    register long a7 __asm__("a7") = n;
    1ec8:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1eca:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ecc:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ed0:	2501                	sext.w	a0,a0
    1ed2:	8082                	ret

0000000000001ed4 <mount>:
    register long a7 __asm__("a7") = n;
    1ed4:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ed8:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1edc:	2501                	sext.w	a0,a0
    1ede:	8082                	ret

0000000000001ee0 <umount>:
    register long a7 __asm__("a7") = n;
    1ee0:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ee4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ee6:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1eea:	2501                	sext.w	a0,a0
    1eec:	8082                	ret

0000000000001eee <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1eee:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1ef0:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ef2:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ef4:	8532                	mv	a0,a2
	mv a2, a4
    1ef6:	863a                	mv	a2,a4
	mv a3, a5
    1ef8:	86be                	mv	a3,a5
	mv a4, a6
    1efa:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1efc:	0dc00893          	li	a7,220
	ecall
    1f00:	00000073          	ecall

	beqz a0, 1f
    1f04:	c111                	beqz	a0,1f08 <__clone+0x1a>
	# Parent
	ret
    1f06:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f08:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f0a:	6522                	ld	a0,8(sp)
	jalr a1
    1f0c:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f0e:	05d00893          	li	a7,93
	ecall
    1f12:	00000073          	ecall
