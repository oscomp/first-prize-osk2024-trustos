
/home/brightnight/OScompetition/6.13晚final_main/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/openat：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a0e9                	j	10cc <__start_main>

0000000000001004 <test_openat>:
#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"

void test_openat(void) {
    1004:	1141                	addi	sp,sp,-16
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f1250513          	addi	a0,a0,-238 # 1f18 <__clone+0x2e>
void test_openat(void) {
    100e:	e406                	sd	ra,8(sp)
    1010:	e022                	sd	s0,0(sp)
    TEST_START(__func__);
    1012:	32c000ef          	jal	ra,133e <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	fd250513          	addi	a0,a0,-46 # 1fe8 <__func__.0>
    101e:	320000ef          	jal	ra,133e <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	f0e50513          	addi	a0,a0,-242 # 1f30 <__clone+0x46>
    102a:	314000ef          	jal	ra,133e <puts>
    //int fd_dir = open(".", O_RDONLY | O_CREATE);
    int fd_dir = open("./mnt", O_DIRECTORY);
    102e:	002005b7          	lui	a1,0x200
    1032:	00001517          	auipc	a0,0x1
    1036:	f0e50513          	addi	a0,a0,-242 # 1f40 <__clone+0x56>
    103a:	431000ef          	jal	ra,1c6a <open>
    103e:	842a                	mv	s0,a0
    printf("open dir fd: %d\n", fd_dir);
    1040:	85aa                	mv	a1,a0
    1042:	00001517          	auipc	a0,0x1
    1046:	f0650513          	addi	a0,a0,-250 # 1f48 <__clone+0x5e>
    104a:	316000ef          	jal	ra,1360 <printf>
    int fd = openat(fd_dir, "test_openat.txt", O_CREATE | O_RDWR);
    104e:	00001597          	auipc	a1,0x1
    1052:	f1258593          	addi	a1,a1,-238 # 1f60 <__clone+0x76>
    1056:	8522                	mv	a0,s0
    1058:	04200613          	li	a2,66
    105c:	427000ef          	jal	ra,1c82 <openat>
    1060:	842a                	mv	s0,a0
    printf("openat fd: %d\n", fd);
    1062:	85aa                	mv	a1,a0
    1064:	00001517          	auipc	a0,0x1
    1068:	f0c50513          	addi	a0,a0,-244 # 1f70 <__clone+0x86>
    106c:	2f4000ef          	jal	ra,1360 <printf>
    assert(fd > 0);
    1070:	02805f63          	blez	s0,10ae <test_openat+0xaa>
    printf("openat success.\n");
    1074:	00001517          	auipc	a0,0x1
    1078:	f2c50513          	addi	a0,a0,-212 # 1fa0 <__clone+0xb6>
    107c:	2e4000ef          	jal	ra,1360 <printf>
    write(fd, buf, strlen(buf));
    int size = read(fd, buf, 256);
    if (size > 0) printf("  openat success.\n");
    else printf("  openat error.\n");
    */
    close(fd);	
    1080:	8522                	mv	a0,s0
    1082:	41b000ef          	jal	ra,1c9c <close>
	
    TEST_END(__func__);
    1086:	00001517          	auipc	a0,0x1
    108a:	f3250513          	addi	a0,a0,-206 # 1fb8 <__clone+0xce>
    108e:	2b0000ef          	jal	ra,133e <puts>
    1092:	00001517          	auipc	a0,0x1
    1096:	f5650513          	addi	a0,a0,-170 # 1fe8 <__func__.0>
    109a:	2a4000ef          	jal	ra,133e <puts>
}
    109e:	6402                	ld	s0,0(sp)
    10a0:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    10a2:	00001517          	auipc	a0,0x1
    10a6:	e8e50513          	addi	a0,a0,-370 # 1f30 <__clone+0x46>
}
    10aa:	0141                	addi	sp,sp,16
    TEST_END(__func__);
    10ac:	ac49                	j	133e <puts>
    assert(fd > 0);
    10ae:	00001517          	auipc	a0,0x1
    10b2:	ed250513          	addi	a0,a0,-302 # 1f80 <__clone+0x96>
    10b6:	52e000ef          	jal	ra,15e4 <panic>
    10ba:	bf6d                	j	1074 <test_openat+0x70>

00000000000010bc <main>:

int main(void) {
    10bc:	1141                	addi	sp,sp,-16
    10be:	e406                	sd	ra,8(sp)
    test_openat();
    10c0:	f45ff0ef          	jal	ra,1004 <test_openat>
    return 0;
}
    10c4:	60a2                	ld	ra,8(sp)
    10c6:	4501                	li	a0,0
    10c8:	0141                	addi	sp,sp,16
    10ca:	8082                	ret

00000000000010cc <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10cc:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10ce:	4108                	lw	a0,0(a0)
{
    10d0:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10d2:	05a1                	addi	a1,a1,8
{
    10d4:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10d6:	fe7ff0ef          	jal	ra,10bc <main>
    10da:	429000ef          	jal	ra,1d02 <exit>
	return 0;
}
    10de:	60a2                	ld	ra,8(sp)
    10e0:	4501                	li	a0,0
    10e2:	0141                	addi	sp,sp,16
    10e4:	8082                	ret

00000000000010e6 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10e6:	7179                	addi	sp,sp,-48
    10e8:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10ea:	12054b63          	bltz	a0,1220 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10ee:	02b577bb          	remuw	a5,a0,a1
    10f2:	00001617          	auipc	a2,0x1
    10f6:	f0660613          	addi	a2,a2,-250 # 1ff8 <digits>
    buf[16] = 0;
    10fa:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10fe:	0005871b          	sext.w	a4,a1
    1102:	1782                	slli	a5,a5,0x20
    1104:	9381                	srli	a5,a5,0x20
    1106:	97b2                	add	a5,a5,a2
    1108:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    110c:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1110:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1114:	1cb56363          	bltu	a0,a1,12da <printint.constprop.0+0x1f4>
        buf[i--] = digits[x % base];
    1118:	45b9                	li	a1,14
    111a:	02e877bb          	remuw	a5,a6,a4
    111e:	1782                	slli	a5,a5,0x20
    1120:	9381                	srli	a5,a5,0x20
    1122:	97b2                	add	a5,a5,a2
    1124:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1128:	02e856bb          	divuw	a3,a6,a4
        buf[i--] = digits[x % base];
    112c:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    1130:	0ce86e63          	bltu	a6,a4,120c <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    1134:	02e6f5bb          	remuw	a1,a3,a4
    } while ((x /= base) != 0);
    1138:	02e6d7bb          	divuw	a5,a3,a4
        buf[i--] = digits[x % base];
    113c:	1582                	slli	a1,a1,0x20
    113e:	9181                	srli	a1,a1,0x20
    1140:	95b2                	add	a1,a1,a2
    1142:	0005c583          	lbu	a1,0(a1)
    1146:	00b10aa3          	sb	a1,21(sp)
    } while ((x /= base) != 0);
    114a:	0007859b          	sext.w	a1,a5
    114e:	12e6ec63          	bltu	a3,a4,1286 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    1152:	02e7f6bb          	remuw	a3,a5,a4
    1156:	1682                	slli	a3,a3,0x20
    1158:	9281                	srli	a3,a3,0x20
    115a:	96b2                	add	a3,a3,a2
    115c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1160:	02e7d83b          	divuw	a6,a5,a4
        buf[i--] = digits[x % base];
    1164:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1168:	12e5e863          	bltu	a1,a4,1298 <printint.constprop.0+0x1b2>
        buf[i--] = digits[x % base];
    116c:	02e876bb          	remuw	a3,a6,a4
    1170:	1682                	slli	a3,a3,0x20
    1172:	9281                	srli	a3,a3,0x20
    1174:	96b2                	add	a3,a3,a2
    1176:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    117a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    117e:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1182:	12e86463          	bltu	a6,a4,12aa <printint.constprop.0+0x1c4>
        buf[i--] = digits[x % base];
    1186:	02e5f6bb          	remuw	a3,a1,a4
    118a:	1682                	slli	a3,a3,0x20
    118c:	9281                	srli	a3,a3,0x20
    118e:	96b2                	add	a3,a3,a2
    1190:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1194:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1198:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    119c:	0ce5ec63          	bltu	a1,a4,1274 <printint.constprop.0+0x18e>
        buf[i--] = digits[x % base];
    11a0:	02e876bb          	remuw	a3,a6,a4
    11a4:	1682                	slli	a3,a3,0x20
    11a6:	9281                	srli	a3,a3,0x20
    11a8:	96b2                	add	a3,a3,a2
    11aa:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11ae:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11b2:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11b6:	10e86963          	bltu	a6,a4,12c8 <printint.constprop.0+0x1e2>
        buf[i--] = digits[x % base];
    11ba:	02e5f6bb          	remuw	a3,a1,a4
    11be:	1682                	slli	a3,a3,0x20
    11c0:	9281                	srli	a3,a3,0x20
    11c2:	96b2                	add	a3,a3,a2
    11c4:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11c8:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11cc:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11d0:	10e5e763          	bltu	a1,a4,12de <printint.constprop.0+0x1f8>
        buf[i--] = digits[x % base];
    11d4:	02e876bb          	remuw	a3,a6,a4
    11d8:	1682                	slli	a3,a3,0x20
    11da:	9281                	srli	a3,a3,0x20
    11dc:	96b2                	add	a3,a3,a2
    11de:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11e2:	02e857bb          	divuw	a5,a6,a4
        buf[i--] = digits[x % base];
    11e6:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11ea:	10e86363          	bltu	a6,a4,12f0 <printint.constprop.0+0x20a>
        buf[i--] = digits[x % base];
    11ee:	1782                	slli	a5,a5,0x20
    11f0:	9381                	srli	a5,a5,0x20
    11f2:	97b2                	add	a5,a5,a2
    11f4:	0007c783          	lbu	a5,0(a5)
    11f8:	4599                	li	a1,6
    11fa:	00f10723          	sb	a5,14(sp)

    if (sign)
    11fe:	00055763          	bgez	a0,120c <printint.constprop.0+0x126>
        buf[i--] = '-';
    1202:	02d00793          	li	a5,45
    1206:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    120a:	4595                	li	a1,5
    write(f, s, l);
    120c:	003c                	addi	a5,sp,8
    120e:	4641                	li	a2,16
    1210:	9e0d                	subw	a2,a2,a1
    1212:	4505                	li	a0,1
    1214:	95be                	add	a1,a1,a5
    1216:	29d000ef          	jal	ra,1cb2 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    121a:	70a2                	ld	ra,40(sp)
    121c:	6145                	addi	sp,sp,48
    121e:	8082                	ret
        x = -xx;
    1220:	40a0083b          	negw	a6,a0
        buf[i--] = digits[x % base];
    1224:	02b877bb          	remuw	a5,a6,a1
    1228:	00001617          	auipc	a2,0x1
    122c:	dd060613          	addi	a2,a2,-560 # 1ff8 <digits>
    buf[16] = 0;
    1230:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1234:	0005871b          	sext.w	a4,a1
    1238:	1782                	slli	a5,a5,0x20
    123a:	9381                	srli	a5,a5,0x20
    123c:	97b2                	add	a5,a5,a2
    123e:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1242:	02b858bb          	divuw	a7,a6,a1
        buf[i--] = digits[x % base];
    1246:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    124a:	06b86963          	bltu	a6,a1,12bc <printint.constprop.0+0x1d6>
        buf[i--] = digits[x % base];
    124e:	02e8f7bb          	remuw	a5,a7,a4
    1252:	1782                	slli	a5,a5,0x20
    1254:	9381                	srli	a5,a5,0x20
    1256:	97b2                	add	a5,a5,a2
    1258:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    125c:	02e8d6bb          	divuw	a3,a7,a4
        buf[i--] = digits[x % base];
    1260:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    1264:	ece8f8e3          	bgeu	a7,a4,1134 <printint.constprop.0+0x4e>
        buf[i--] = '-';
    1268:	02d00793          	li	a5,45
    126c:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1270:	45b5                	li	a1,13
    1272:	bf69                	j	120c <printint.constprop.0+0x126>
    1274:	45a9                	li	a1,10
    if (sign)
    1276:	f8055be3          	bgez	a0,120c <printint.constprop.0+0x126>
        buf[i--] = '-';
    127a:	02d00793          	li	a5,45
    127e:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1282:	45a5                	li	a1,9
    1284:	b761                	j	120c <printint.constprop.0+0x126>
    1286:	45b5                	li	a1,13
    if (sign)
    1288:	f80552e3          	bgez	a0,120c <printint.constprop.0+0x126>
        buf[i--] = '-';
    128c:	02d00793          	li	a5,45
    1290:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1294:	45b1                	li	a1,12
    1296:	bf9d                	j	120c <printint.constprop.0+0x126>
    1298:	45b1                	li	a1,12
    if (sign)
    129a:	f60559e3          	bgez	a0,120c <printint.constprop.0+0x126>
        buf[i--] = '-';
    129e:	02d00793          	li	a5,45
    12a2:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12a6:	45ad                	li	a1,11
    12a8:	b795                	j	120c <printint.constprop.0+0x126>
    12aa:	45ad                	li	a1,11
    if (sign)
    12ac:	f60550e3          	bgez	a0,120c <printint.constprop.0+0x126>
        buf[i--] = '-';
    12b0:	02d00793          	li	a5,45
    12b4:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12b8:	45a9                	li	a1,10
    12ba:	bf89                	j	120c <printint.constprop.0+0x126>
        buf[i--] = '-';
    12bc:	02d00793          	li	a5,45
    12c0:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12c4:	45b9                	li	a1,14
    12c6:	b799                	j	120c <printint.constprop.0+0x126>
    12c8:	45a5                	li	a1,9
    if (sign)
    12ca:	f40551e3          	bgez	a0,120c <printint.constprop.0+0x126>
        buf[i--] = '-';
    12ce:	02d00793          	li	a5,45
    12d2:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12d6:	45a1                	li	a1,8
    12d8:	bf15                	j	120c <printint.constprop.0+0x126>
    i = 15;
    12da:	45bd                	li	a1,15
    12dc:	bf05                	j	120c <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    12de:	45a1                	li	a1,8
    if (sign)
    12e0:	f20556e3          	bgez	a0,120c <printint.constprop.0+0x126>
        buf[i--] = '-';
    12e4:	02d00793          	li	a5,45
    12e8:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12ec:	459d                	li	a1,7
    12ee:	bf39                	j	120c <printint.constprop.0+0x126>
    12f0:	459d                	li	a1,7
    if (sign)
    12f2:	f0055de3          	bgez	a0,120c <printint.constprop.0+0x126>
        buf[i--] = '-';
    12f6:	02d00793          	li	a5,45
    12fa:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12fe:	4599                	li	a1,6
    1300:	b731                	j	120c <printint.constprop.0+0x126>

0000000000001302 <getchar>:
{
    1302:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1304:	00f10593          	addi	a1,sp,15
    1308:	4605                	li	a2,1
    130a:	4501                	li	a0,0
{
    130c:	ec06                	sd	ra,24(sp)
    char byte = 0;
    130e:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1312:	197000ef          	jal	ra,1ca8 <read>
}
    1316:	60e2                	ld	ra,24(sp)
    1318:	00f14503          	lbu	a0,15(sp)
    131c:	6105                	addi	sp,sp,32
    131e:	8082                	ret

0000000000001320 <putchar>:
{
    1320:	1101                	addi	sp,sp,-32
    1322:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1324:	00f10593          	addi	a1,sp,15
    1328:	4605                	li	a2,1
    132a:	4505                	li	a0,1
{
    132c:	ec06                	sd	ra,24(sp)
    char byte = c;
    132e:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1332:	181000ef          	jal	ra,1cb2 <write>
}
    1336:	60e2                	ld	ra,24(sp)
    1338:	2501                	sext.w	a0,a0
    133a:	6105                	addi	sp,sp,32
    133c:	8082                	ret

000000000000133e <puts>:
{
    133e:	1141                	addi	sp,sp,-16
    1340:	e406                	sd	ra,8(sp)
    1342:	e022                	sd	s0,0(sp)
    1344:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1346:	57e000ef          	jal	ra,18c4 <strlen>
    134a:	862a                	mv	a2,a0
    134c:	85a2                	mv	a1,s0
    134e:	4505                	li	a0,1
    1350:	163000ef          	jal	ra,1cb2 <write>
}
    1354:	60a2                	ld	ra,8(sp)
    1356:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1358:	957d                	srai	a0,a0,0x3f
    return r;
    135a:	2501                	sext.w	a0,a0
}
    135c:	0141                	addi	sp,sp,16
    135e:	8082                	ret

0000000000001360 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1360:	7171                	addi	sp,sp,-176
    1362:	fc56                	sd	s5,56(sp)
    1364:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1366:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1368:	18bc                	addi	a5,sp,120
{
    136a:	e8ca                	sd	s2,80(sp)
    136c:	e4ce                	sd	s3,72(sp)
    136e:	e0d2                	sd	s4,64(sp)
    1370:	f85a                	sd	s6,48(sp)
    1372:	f486                	sd	ra,104(sp)
    1374:	f0a2                	sd	s0,96(sp)
    1376:	eca6                	sd	s1,88(sp)
    1378:	fcae                	sd	a1,120(sp)
    137a:	e132                	sd	a2,128(sp)
    137c:	e536                	sd	a3,136(sp)
    137e:	e93a                	sd	a4,144(sp)
    1380:	f142                	sd	a6,160(sp)
    1382:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1384:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1386:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    138a:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    138e:	00001b17          	auipc	s6,0x1
    1392:	c3ab0b13          	addi	s6,s6,-966 # 1fc8 <__clone+0xde>
    buf[i++] = '0';
    1396:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    139a:	00001997          	auipc	s3,0x1
    139e:	c5e98993          	addi	s3,s3,-930 # 1ff8 <digits>
        if (!*s)
    13a2:	00054783          	lbu	a5,0(a0)
    13a6:	16078a63          	beqz	a5,151a <printf+0x1ba>
    13aa:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13ac:	19278163          	beq	a5,s2,152e <printf+0x1ce>
    13b0:	00164783          	lbu	a5,1(a2)
    13b4:	0605                	addi	a2,a2,1
    13b6:	fbfd                	bnez	a5,13ac <printf+0x4c>
    13b8:	84b2                	mv	s1,a2
        l = z - a;
    13ba:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13be:	85aa                	mv	a1,a0
    13c0:	8622                	mv	a2,s0
    13c2:	4505                	li	a0,1
    13c4:	0ef000ef          	jal	ra,1cb2 <write>
        if (l)
    13c8:	18041c63          	bnez	s0,1560 <printf+0x200>
        if (s[1] == 0)
    13cc:	0014c783          	lbu	a5,1(s1)
    13d0:	14078563          	beqz	a5,151a <printf+0x1ba>
        switch (s[1])
    13d4:	1d478063          	beq	a5,s4,1594 <printf+0x234>
    13d8:	18fa6663          	bltu	s4,a5,1564 <printf+0x204>
    13dc:	06400713          	li	a4,100
    13e0:	1ae78063          	beq	a5,a4,1580 <printf+0x220>
    13e4:	07000713          	li	a4,112
    13e8:	1ce79963          	bne	a5,a4,15ba <printf+0x25a>
            printptr(va_arg(ap, uint64));
    13ec:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13ee:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13f2:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13f4:	631c                	ld	a5,0(a4)
    13f6:	0721                	addi	a4,a4,8
    13f8:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13fa:	00479293          	slli	t0,a5,0x4
    13fe:	00879f93          	slli	t6,a5,0x8
    1402:	00c79f13          	slli	t5,a5,0xc
    1406:	01079e93          	slli	t4,a5,0x10
    140a:	01479e13          	slli	t3,a5,0x14
    140e:	01879313          	slli	t1,a5,0x18
    1412:	01c79893          	slli	a7,a5,0x1c
    1416:	02479813          	slli	a6,a5,0x24
    141a:	02879513          	slli	a0,a5,0x28
    141e:	02c79593          	slli	a1,a5,0x2c
    1422:	03079693          	slli	a3,a5,0x30
    1426:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    142a:	03c7d413          	srli	s0,a5,0x3c
    142e:	01c7d39b          	srliw	t2,a5,0x1c
    1432:	03c2d293          	srli	t0,t0,0x3c
    1436:	03cfdf93          	srli	t6,t6,0x3c
    143a:	03cf5f13          	srli	t5,t5,0x3c
    143e:	03cede93          	srli	t4,t4,0x3c
    1442:	03ce5e13          	srli	t3,t3,0x3c
    1446:	03c35313          	srli	t1,t1,0x3c
    144a:	03c8d893          	srli	a7,a7,0x3c
    144e:	03c85813          	srli	a6,a6,0x3c
    1452:	9171                	srli	a0,a0,0x3c
    1454:	91f1                	srli	a1,a1,0x3c
    1456:	92f1                	srli	a3,a3,0x3c
    1458:	9371                	srli	a4,a4,0x3c
    145a:	96ce                	add	a3,a3,s3
    145c:	974e                	add	a4,a4,s3
    145e:	944e                	add	s0,s0,s3
    1460:	92ce                	add	t0,t0,s3
    1462:	9fce                	add	t6,t6,s3
    1464:	9f4e                	add	t5,t5,s3
    1466:	9ece                	add	t4,t4,s3
    1468:	9e4e                	add	t3,t3,s3
    146a:	934e                	add	t1,t1,s3
    146c:	98ce                	add	a7,a7,s3
    146e:	93ce                	add	t2,t2,s3
    1470:	984e                	add	a6,a6,s3
    1472:	954e                	add	a0,a0,s3
    1474:	95ce                	add	a1,a1,s3
    1476:	0006c083          	lbu	ra,0(a3)
    147a:	0002c283          	lbu	t0,0(t0)
    147e:	00074683          	lbu	a3,0(a4)
    1482:	000fcf83          	lbu	t6,0(t6)
    1486:	000f4f03          	lbu	t5,0(t5)
    148a:	000ece83          	lbu	t4,0(t4)
    148e:	000e4e03          	lbu	t3,0(t3)
    1492:	00034303          	lbu	t1,0(t1)
    1496:	0008c883          	lbu	a7,0(a7)
    149a:	0003c383          	lbu	t2,0(t2)
    149e:	00084803          	lbu	a6,0(a6)
    14a2:	00054503          	lbu	a0,0(a0)
    14a6:	0005c583          	lbu	a1,0(a1)
    14aa:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14ae:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14b2:	9371                	srli	a4,a4,0x3c
    14b4:	8bbd                	andi	a5,a5,15
    14b6:	974e                	add	a4,a4,s3
    14b8:	97ce                	add	a5,a5,s3
    14ba:	005105a3          	sb	t0,11(sp)
    14be:	01f10623          	sb	t6,12(sp)
    14c2:	01e106a3          	sb	t5,13(sp)
    14c6:	01d10723          	sb	t4,14(sp)
    14ca:	01c107a3          	sb	t3,15(sp)
    14ce:	00610823          	sb	t1,16(sp)
    14d2:	011108a3          	sb	a7,17(sp)
    14d6:	00710923          	sb	t2,18(sp)
    14da:	010109a3          	sb	a6,19(sp)
    14de:	00a10a23          	sb	a0,20(sp)
    14e2:	00b10aa3          	sb	a1,21(sp)
    14e6:	00110b23          	sb	ra,22(sp)
    14ea:	00d10ba3          	sb	a3,23(sp)
    14ee:	00810523          	sb	s0,10(sp)
    14f2:	00074703          	lbu	a4,0(a4)
    14f6:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14fa:	002c                	addi	a1,sp,8
    14fc:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14fe:	00e10c23          	sb	a4,24(sp)
    1502:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1506:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    150a:	7a8000ef          	jal	ra,1cb2 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    150e:	00248513          	addi	a0,s1,2
        if (!*s)
    1512:	00054783          	lbu	a5,0(a0)
    1516:	e8079ae3          	bnez	a5,13aa <printf+0x4a>
    }
    va_end(ap);
}
    151a:	70a6                	ld	ra,104(sp)
    151c:	7406                	ld	s0,96(sp)
    151e:	64e6                	ld	s1,88(sp)
    1520:	6946                	ld	s2,80(sp)
    1522:	69a6                	ld	s3,72(sp)
    1524:	6a06                	ld	s4,64(sp)
    1526:	7ae2                	ld	s5,56(sp)
    1528:	7b42                	ld	s6,48(sp)
    152a:	614d                	addi	sp,sp,176
    152c:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    152e:	00064783          	lbu	a5,0(a2)
    1532:	84b2                	mv	s1,a2
    1534:	01278963          	beq	a5,s2,1546 <printf+0x1e6>
    1538:	b549                	j	13ba <printf+0x5a>
    153a:	0024c783          	lbu	a5,2(s1)
    153e:	0605                	addi	a2,a2,1
    1540:	0489                	addi	s1,s1,2
    1542:	e7279ce3          	bne	a5,s2,13ba <printf+0x5a>
    1546:	0014c783          	lbu	a5,1(s1)
    154a:	ff2788e3          	beq	a5,s2,153a <printf+0x1da>
        l = z - a;
    154e:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1552:	85aa                	mv	a1,a0
    1554:	8622                	mv	a2,s0
    1556:	4505                	li	a0,1
    1558:	75a000ef          	jal	ra,1cb2 <write>
        if (l)
    155c:	e60408e3          	beqz	s0,13cc <printf+0x6c>
    1560:	8526                	mv	a0,s1
    1562:	b581                	j	13a2 <printf+0x42>
        switch (s[1])
    1564:	07800713          	li	a4,120
    1568:	04e79963          	bne	a5,a4,15ba <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    156c:	6782                	ld	a5,0(sp)
    156e:	45c1                	li	a1,16
    1570:	4388                	lw	a0,0(a5)
    1572:	07a1                	addi	a5,a5,8
    1574:	e03e                	sd	a5,0(sp)
    1576:	b71ff0ef          	jal	ra,10e6 <printint.constprop.0>
        s += 2;
    157a:	00248513          	addi	a0,s1,2
    157e:	bf51                	j	1512 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    1580:	6782                	ld	a5,0(sp)
    1582:	45a9                	li	a1,10
    1584:	4388                	lw	a0,0(a5)
    1586:	07a1                	addi	a5,a5,8
    1588:	e03e                	sd	a5,0(sp)
    158a:	b5dff0ef          	jal	ra,10e6 <printint.constprop.0>
        s += 2;
    158e:	00248513          	addi	a0,s1,2
    1592:	b741                	j	1512 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1594:	6782                	ld	a5,0(sp)
    1596:	6380                	ld	s0,0(a5)
    1598:	07a1                	addi	a5,a5,8
    159a:	e03e                	sd	a5,0(sp)
    159c:	c031                	beqz	s0,15e0 <printf+0x280>
            l = strnlen(a, 200);
    159e:	0c800593          	li	a1,200
    15a2:	8522                	mv	a0,s0
    15a4:	40c000ef          	jal	ra,19b0 <strnlen>
    write(f, s, l);
    15a8:	0005061b          	sext.w	a2,a0
    15ac:	85a2                	mv	a1,s0
    15ae:	4505                	li	a0,1
    15b0:	702000ef          	jal	ra,1cb2 <write>
        s += 2;
    15b4:	00248513          	addi	a0,s1,2
    15b8:	bfa9                	j	1512 <printf+0x1b2>
    return write(stdout, &byte, 1);
    15ba:	4605                	li	a2,1
    15bc:	002c                	addi	a1,sp,8
    15be:	4505                	li	a0,1
    char byte = c;
    15c0:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15c4:	6ee000ef          	jal	ra,1cb2 <write>
    char byte = c;
    15c8:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15cc:	4605                	li	a2,1
    15ce:	002c                	addi	a1,sp,8
    15d0:	4505                	li	a0,1
    char byte = c;
    15d2:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15d6:	6dc000ef          	jal	ra,1cb2 <write>
        s += 2;
    15da:	00248513          	addi	a0,s1,2
    15de:	bf15                	j	1512 <printf+0x1b2>
                a = "(null)";
    15e0:	845a                	mv	s0,s6
    15e2:	bf75                	j	159e <printf+0x23e>

00000000000015e4 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15e4:	1141                	addi	sp,sp,-16
    15e6:	e406                	sd	ra,8(sp)
    puts(m);
    15e8:	d57ff0ef          	jal	ra,133e <puts>
    exit(-100);
}
    15ec:	60a2                	ld	ra,8(sp)
    exit(-100);
    15ee:	f9c00513          	li	a0,-100
}
    15f2:	0141                	addi	sp,sp,16
    exit(-100);
    15f4:	a739                	j	1d02 <exit>

00000000000015f6 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15f6:	02000793          	li	a5,32
    15fa:	00f50663          	beq	a0,a5,1606 <isspace+0x10>
    15fe:	355d                	addiw	a0,a0,-9
    1600:	00553513          	sltiu	a0,a0,5
    1604:	8082                	ret
    1606:	4505                	li	a0,1
}
    1608:	8082                	ret

000000000000160a <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    160a:	fd05051b          	addiw	a0,a0,-48
}
    160e:	00a53513          	sltiu	a0,a0,10
    1612:	8082                	ret

0000000000001614 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1614:	02000613          	li	a2,32
    1618:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    161a:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    161e:	ff77869b          	addiw	a3,a5,-9
    1622:	04c78c63          	beq	a5,a2,167a <atoi+0x66>
    1626:	0007871b          	sext.w	a4,a5
    162a:	04d5f863          	bgeu	a1,a3,167a <atoi+0x66>
        s++;
    switch (*s)
    162e:	02b00693          	li	a3,43
    1632:	04d78963          	beq	a5,a3,1684 <atoi+0x70>
    1636:	02d00693          	li	a3,45
    163a:	06d78263          	beq	a5,a3,169e <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    163e:	fd07061b          	addiw	a2,a4,-48
    1642:	47a5                	li	a5,9
    1644:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1646:	4e01                	li	t3,0
    while (isdigit(*s))
    1648:	04c7e963          	bltu	a5,a2,169a <atoi+0x86>
    int n = 0, neg = 0;
    164c:	4501                	li	a0,0
    while (isdigit(*s))
    164e:	4825                	li	a6,9
    1650:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    1654:	0025179b          	slliw	a5,a0,0x2
    1658:	9fa9                	addw	a5,a5,a0
    165a:	fd07031b          	addiw	t1,a4,-48
    165e:	0017989b          	slliw	a7,a5,0x1
    while (isdigit(*s))
    1662:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1666:	0685                	addi	a3,a3,1
    1668:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    166c:	0006071b          	sext.w	a4,a2
    1670:	feb870e3          	bgeu	a6,a1,1650 <atoi+0x3c>
    return neg ? n : -n;
    1674:	000e0563          	beqz	t3,167e <atoi+0x6a>
}
    1678:	8082                	ret
        s++;
    167a:	0505                	addi	a0,a0,1
    167c:	bf79                	j	161a <atoi+0x6>
    return neg ? n : -n;
    167e:	4113053b          	subw	a0,t1,a7
    1682:	8082                	ret
    while (isdigit(*s))
    1684:	00154703          	lbu	a4,1(a0)
    1688:	47a5                	li	a5,9
        s++;
    168a:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    168e:	fd07061b          	addiw	a2,a4,-48
    int n = 0, neg = 0;
    1692:	4e01                	li	t3,0
    while (isdigit(*s))
    1694:	2701                	sext.w	a4,a4
    1696:	fac7fbe3          	bgeu	a5,a2,164c <atoi+0x38>
    169a:	4501                	li	a0,0
}
    169c:	8082                	ret
    while (isdigit(*s))
    169e:	00154703          	lbu	a4,1(a0)
    16a2:	47a5                	li	a5,9
        s++;
    16a4:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    16a8:	fd07061b          	addiw	a2,a4,-48
    16ac:	2701                	sext.w	a4,a4
    16ae:	fec7e6e3          	bltu	a5,a2,169a <atoi+0x86>
        neg = 1;
    16b2:	4e05                	li	t3,1
    16b4:	bf61                	j	164c <atoi+0x38>

00000000000016b6 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16b6:	16060d63          	beqz	a2,1830 <memset+0x17a>
    16ba:	40a007b3          	neg	a5,a0
    16be:	8b9d                	andi	a5,a5,7
    16c0:	00778693          	addi	a3,a5,7
    16c4:	482d                	li	a6,11
    16c6:	0ff5f713          	zext.b	a4,a1
    16ca:	fff60593          	addi	a1,a2,-1
    16ce:	1706e263          	bltu	a3,a6,1832 <memset+0x17c>
    16d2:	16d5ea63          	bltu	a1,a3,1846 <memset+0x190>
    16d6:	16078563          	beqz	a5,1840 <memset+0x18a>
    16da:	00e50023          	sb	a4,0(a0)
    16de:	4685                	li	a3,1
    16e0:	00150593          	addi	a1,a0,1
    16e4:	14d78c63          	beq	a5,a3,183c <memset+0x186>
    16e8:	00e500a3          	sb	a4,1(a0)
    16ec:	4689                	li	a3,2
    16ee:	00250593          	addi	a1,a0,2
    16f2:	14d78d63          	beq	a5,a3,184c <memset+0x196>
    16f6:	00e50123          	sb	a4,2(a0)
    16fa:	468d                	li	a3,3
    16fc:	00350593          	addi	a1,a0,3
    1700:	12d78b63          	beq	a5,a3,1836 <memset+0x180>
    1704:	00e501a3          	sb	a4,3(a0)
    1708:	4691                	li	a3,4
    170a:	00450593          	addi	a1,a0,4
    170e:	14d78163          	beq	a5,a3,1850 <memset+0x19a>
    1712:	00e50223          	sb	a4,4(a0)
    1716:	4695                	li	a3,5
    1718:	00550593          	addi	a1,a0,5
    171c:	12d78c63          	beq	a5,a3,1854 <memset+0x19e>
    1720:	00e502a3          	sb	a4,5(a0)
    1724:	469d                	li	a3,7
    1726:	00650593          	addi	a1,a0,6
    172a:	12d79763          	bne	a5,a3,1858 <memset+0x1a2>
    172e:	00750593          	addi	a1,a0,7
    1732:	00e50323          	sb	a4,6(a0)
    1736:	481d                	li	a6,7
    1738:	00871693          	slli	a3,a4,0x8
    173c:	01071893          	slli	a7,a4,0x10
    1740:	8ed9                	or	a3,a3,a4
    1742:	01871313          	slli	t1,a4,0x18
    1746:	0116e6b3          	or	a3,a3,a7
    174a:	0066e6b3          	or	a3,a3,t1
    174e:	02071893          	slli	a7,a4,0x20
    1752:	02871e13          	slli	t3,a4,0x28
    1756:	0116e6b3          	or	a3,a3,a7
    175a:	40f60333          	sub	t1,a2,a5
    175e:	03071893          	slli	a7,a4,0x30
    1762:	01c6e6b3          	or	a3,a3,t3
    1766:	0116e6b3          	or	a3,a3,a7
    176a:	03871e13          	slli	t3,a4,0x38
    176e:	97aa                	add	a5,a5,a0
    1770:	ff837893          	andi	a7,t1,-8
    1774:	01c6e6b3          	or	a3,a3,t3
    1778:	98be                	add	a7,a7,a5
    177a:	e394                	sd	a3,0(a5)
    177c:	07a1                	addi	a5,a5,8
    177e:	ff179ee3          	bne	a5,a7,177a <memset+0xc4>
    1782:	ff837893          	andi	a7,t1,-8
    1786:	011587b3          	add	a5,a1,a7
    178a:	010886bb          	addw	a3,a7,a6
    178e:	0b130663          	beq	t1,a7,183a <memset+0x184>
    1792:	00e78023          	sb	a4,0(a5)
    1796:	0016859b          	addiw	a1,a3,1
    179a:	08c5fb63          	bgeu	a1,a2,1830 <memset+0x17a>
    179e:	00e780a3          	sb	a4,1(a5)
    17a2:	0026859b          	addiw	a1,a3,2
    17a6:	08c5f563          	bgeu	a1,a2,1830 <memset+0x17a>
    17aa:	00e78123          	sb	a4,2(a5)
    17ae:	0036859b          	addiw	a1,a3,3
    17b2:	06c5ff63          	bgeu	a1,a2,1830 <memset+0x17a>
    17b6:	00e781a3          	sb	a4,3(a5)
    17ba:	0046859b          	addiw	a1,a3,4
    17be:	06c5f963          	bgeu	a1,a2,1830 <memset+0x17a>
    17c2:	00e78223          	sb	a4,4(a5)
    17c6:	0056859b          	addiw	a1,a3,5
    17ca:	06c5f363          	bgeu	a1,a2,1830 <memset+0x17a>
    17ce:	00e782a3          	sb	a4,5(a5)
    17d2:	0066859b          	addiw	a1,a3,6
    17d6:	04c5fd63          	bgeu	a1,a2,1830 <memset+0x17a>
    17da:	00e78323          	sb	a4,6(a5)
    17de:	0076859b          	addiw	a1,a3,7
    17e2:	04c5f763          	bgeu	a1,a2,1830 <memset+0x17a>
    17e6:	00e783a3          	sb	a4,7(a5)
    17ea:	0086859b          	addiw	a1,a3,8
    17ee:	04c5f163          	bgeu	a1,a2,1830 <memset+0x17a>
    17f2:	00e78423          	sb	a4,8(a5)
    17f6:	0096859b          	addiw	a1,a3,9
    17fa:	02c5fb63          	bgeu	a1,a2,1830 <memset+0x17a>
    17fe:	00e784a3          	sb	a4,9(a5)
    1802:	00a6859b          	addiw	a1,a3,10
    1806:	02c5f563          	bgeu	a1,a2,1830 <memset+0x17a>
    180a:	00e78523          	sb	a4,10(a5)
    180e:	00b6859b          	addiw	a1,a3,11
    1812:	00c5ff63          	bgeu	a1,a2,1830 <memset+0x17a>
    1816:	00e785a3          	sb	a4,11(a5)
    181a:	00c6859b          	addiw	a1,a3,12
    181e:	00c5f963          	bgeu	a1,a2,1830 <memset+0x17a>
    1822:	00e78623          	sb	a4,12(a5)
    1826:	26b5                	addiw	a3,a3,13
    1828:	00c6f463          	bgeu	a3,a2,1830 <memset+0x17a>
    182c:	00e786a3          	sb	a4,13(a5)
        ;
    return dest;
}
    1830:	8082                	ret
    1832:	46ad                	li	a3,11
    1834:	bd79                	j	16d2 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1836:	480d                	li	a6,3
    1838:	b701                	j	1738 <memset+0x82>
    183a:	8082                	ret
    183c:	4805                	li	a6,1
    183e:	bded                	j	1738 <memset+0x82>
    1840:	85aa                	mv	a1,a0
    1842:	4801                	li	a6,0
    1844:	bdd5                	j	1738 <memset+0x82>
    1846:	87aa                	mv	a5,a0
    1848:	4681                	li	a3,0
    184a:	b7a1                	j	1792 <memset+0xdc>
    184c:	4809                	li	a6,2
    184e:	b5ed                	j	1738 <memset+0x82>
    1850:	4811                	li	a6,4
    1852:	b5dd                	j	1738 <memset+0x82>
    1854:	4815                	li	a6,5
    1856:	b5cd                	j	1738 <memset+0x82>
    1858:	4819                	li	a6,6
    185a:	bdf9                	j	1738 <memset+0x82>

000000000000185c <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    185c:	00054783          	lbu	a5,0(a0)
    1860:	0005c703          	lbu	a4,0(a1)
    1864:	00e79863          	bne	a5,a4,1874 <strcmp+0x18>
    1868:	0505                	addi	a0,a0,1
    186a:	0585                	addi	a1,a1,1
    186c:	fbe5                	bnez	a5,185c <strcmp>
    186e:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1870:	9d19                	subw	a0,a0,a4
    1872:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1874:	0007851b          	sext.w	a0,a5
    1878:	bfe5                	j	1870 <strcmp+0x14>

000000000000187a <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    187a:	ca15                	beqz	a2,18ae <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    187c:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1880:	167d                	addi	a2,a2,-1
    1882:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1886:	eb99                	bnez	a5,189c <strncmp+0x22>
    1888:	a815                	j	18bc <strncmp+0x42>
    188a:	00a68e63          	beq	a3,a0,18a6 <strncmp+0x2c>
    188e:	0505                	addi	a0,a0,1
    1890:	00f71b63          	bne	a4,a5,18a6 <strncmp+0x2c>
    1894:	00054783          	lbu	a5,0(a0)
    1898:	cf89                	beqz	a5,18b2 <strncmp+0x38>
    189a:	85b2                	mv	a1,a2
    189c:	0005c703          	lbu	a4,0(a1)
    18a0:	00158613          	addi	a2,a1,1
    18a4:	f37d                	bnez	a4,188a <strncmp+0x10>
        ;
    return *l - *r;
    18a6:	0007851b          	sext.w	a0,a5
    18aa:	9d19                	subw	a0,a0,a4
    18ac:	8082                	ret
        return 0;
    18ae:	4501                	li	a0,0
}
    18b0:	8082                	ret
    return *l - *r;
    18b2:	0015c703          	lbu	a4,1(a1)
    18b6:	4501                	li	a0,0
    18b8:	9d19                	subw	a0,a0,a4
    18ba:	8082                	ret
    18bc:	0005c703          	lbu	a4,0(a1)
    18c0:	4501                	li	a0,0
    18c2:	b7e5                	j	18aa <strncmp+0x30>

00000000000018c4 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18c4:	00757793          	andi	a5,a0,7
    18c8:	cf89                	beqz	a5,18e2 <strlen+0x1e>
    18ca:	87aa                	mv	a5,a0
    18cc:	a029                	j	18d6 <strlen+0x12>
    18ce:	0785                	addi	a5,a5,1
    18d0:	0077f713          	andi	a4,a5,7
    18d4:	cb01                	beqz	a4,18e4 <strlen+0x20>
        if (!*s)
    18d6:	0007c703          	lbu	a4,0(a5)
    18da:	fb75                	bnez	a4,18ce <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18dc:	40a78533          	sub	a0,a5,a0
}
    18e0:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18e2:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18e4:	6394                	ld	a3,0(a5)
    18e6:	00000597          	auipc	a1,0x0
    18ea:	6ea5b583          	ld	a1,1770(a1) # 1fd0 <__clone+0xe6>
    18ee:	00000617          	auipc	a2,0x0
    18f2:	6ea63603          	ld	a2,1770(a2) # 1fd8 <__clone+0xee>
    18f6:	a019                	j	18fc <strlen+0x38>
    18f8:	6794                	ld	a3,8(a5)
    18fa:	07a1                	addi	a5,a5,8
    18fc:	00b68733          	add	a4,a3,a1
    1900:	fff6c693          	not	a3,a3
    1904:	8f75                	and	a4,a4,a3
    1906:	8f71                	and	a4,a4,a2
    1908:	db65                	beqz	a4,18f8 <strlen+0x34>
    for (; *s; s++)
    190a:	0007c703          	lbu	a4,0(a5)
    190e:	d779                	beqz	a4,18dc <strlen+0x18>
    1910:	0017c703          	lbu	a4,1(a5)
    1914:	0785                	addi	a5,a5,1
    1916:	d379                	beqz	a4,18dc <strlen+0x18>
    1918:	0017c703          	lbu	a4,1(a5)
    191c:	0785                	addi	a5,a5,1
    191e:	fb6d                	bnez	a4,1910 <strlen+0x4c>
    1920:	bf75                	j	18dc <strlen+0x18>

0000000000001922 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1922:	00757713          	andi	a4,a0,7
{
    1926:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1928:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    192c:	cb19                	beqz	a4,1942 <memchr+0x20>
    192e:	ce25                	beqz	a2,19a6 <memchr+0x84>
    1930:	0007c703          	lbu	a4,0(a5)
    1934:	04b70e63          	beq	a4,a1,1990 <memchr+0x6e>
    1938:	0785                	addi	a5,a5,1
    193a:	0077f713          	andi	a4,a5,7
    193e:	167d                	addi	a2,a2,-1
    1940:	f77d                	bnez	a4,192e <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1942:	4501                	li	a0,0
    if (n && *s != c)
    1944:	c235                	beqz	a2,19a8 <memchr+0x86>
    1946:	0007c703          	lbu	a4,0(a5)
    194a:	04b70363          	beq	a4,a1,1990 <memchr+0x6e>
        size_t k = ONES * c;
    194e:	00000517          	auipc	a0,0x0
    1952:	69253503          	ld	a0,1682(a0) # 1fe0 <__clone+0xf6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1956:	471d                	li	a4,7
        size_t k = ONES * c;
    1958:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    195c:	02c77a63          	bgeu	a4,a2,1990 <memchr+0x6e>
    1960:	00000897          	auipc	a7,0x0
    1964:	6708b883          	ld	a7,1648(a7) # 1fd0 <__clone+0xe6>
    1968:	00000817          	auipc	a6,0x0
    196c:	67083803          	ld	a6,1648(a6) # 1fd8 <__clone+0xee>
    1970:	431d                	li	t1,7
    1972:	a029                	j	197c <memchr+0x5a>
    1974:	1661                	addi	a2,a2,-8
    1976:	07a1                	addi	a5,a5,8
    1978:	02c37963          	bgeu	t1,a2,19aa <memchr+0x88>
    197c:	6398                	ld	a4,0(a5)
    197e:	8f29                	xor	a4,a4,a0
    1980:	011706b3          	add	a3,a4,a7
    1984:	fff74713          	not	a4,a4
    1988:	8f75                	and	a4,a4,a3
    198a:	01077733          	and	a4,a4,a6
    198e:	d37d                	beqz	a4,1974 <memchr+0x52>
{
    1990:	853e                	mv	a0,a5
    1992:	97b2                	add	a5,a5,a2
    1994:	a021                	j	199c <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1996:	0505                	addi	a0,a0,1
    1998:	00f50763          	beq	a0,a5,19a6 <memchr+0x84>
    199c:	00054703          	lbu	a4,0(a0)
    19a0:	feb71be3          	bne	a4,a1,1996 <memchr+0x74>
    19a4:	8082                	ret
    return n ? (void *)s : 0;
    19a6:	4501                	li	a0,0
}
    19a8:	8082                	ret
    return n ? (void *)s : 0;
    19aa:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    19ac:	f275                	bnez	a2,1990 <memchr+0x6e>
}
    19ae:	8082                	ret

00000000000019b0 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19b0:	1101                	addi	sp,sp,-32
    19b2:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19b4:	862e                	mv	a2,a1
{
    19b6:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19b8:	4581                	li	a1,0
{
    19ba:	e426                	sd	s1,8(sp)
    19bc:	ec06                	sd	ra,24(sp)
    19be:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19c0:	f63ff0ef          	jal	ra,1922 <memchr>
    return p ? p - s : n;
    19c4:	c519                	beqz	a0,19d2 <strnlen+0x22>
}
    19c6:	60e2                	ld	ra,24(sp)
    19c8:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19ca:	8d05                	sub	a0,a0,s1
}
    19cc:	64a2                	ld	s1,8(sp)
    19ce:	6105                	addi	sp,sp,32
    19d0:	8082                	ret
    19d2:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19d4:	8522                	mv	a0,s0
}
    19d6:	6442                	ld	s0,16(sp)
    19d8:	64a2                	ld	s1,8(sp)
    19da:	6105                	addi	sp,sp,32
    19dc:	8082                	ret

00000000000019de <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19de:	00a5c7b3          	xor	a5,a1,a0
    19e2:	8b9d                	andi	a5,a5,7
    19e4:	eb95                	bnez	a5,1a18 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19e6:	0075f793          	andi	a5,a1,7
    19ea:	e7b1                	bnez	a5,1a36 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19ec:	6198                	ld	a4,0(a1)
    19ee:	00000617          	auipc	a2,0x0
    19f2:	5e263603          	ld	a2,1506(a2) # 1fd0 <__clone+0xe6>
    19f6:	00000817          	auipc	a6,0x0
    19fa:	5e283803          	ld	a6,1506(a6) # 1fd8 <__clone+0xee>
    19fe:	a029                	j	1a08 <strcpy+0x2a>
    1a00:	05a1                	addi	a1,a1,8
    1a02:	e118                	sd	a4,0(a0)
    1a04:	6198                	ld	a4,0(a1)
    1a06:	0521                	addi	a0,a0,8
    1a08:	00c707b3          	add	a5,a4,a2
    1a0c:	fff74693          	not	a3,a4
    1a10:	8ff5                	and	a5,a5,a3
    1a12:	0107f7b3          	and	a5,a5,a6
    1a16:	d7ed                	beqz	a5,1a00 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a18:	0005c783          	lbu	a5,0(a1)
    1a1c:	00f50023          	sb	a5,0(a0)
    1a20:	c785                	beqz	a5,1a48 <strcpy+0x6a>
    1a22:	0015c783          	lbu	a5,1(a1)
    1a26:	0505                	addi	a0,a0,1
    1a28:	0585                	addi	a1,a1,1
    1a2a:	00f50023          	sb	a5,0(a0)
    1a2e:	fbf5                	bnez	a5,1a22 <strcpy+0x44>
        ;
    return d;
}
    1a30:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a32:	0505                	addi	a0,a0,1
    1a34:	df45                	beqz	a4,19ec <strcpy+0xe>
            if (!(*d = *s))
    1a36:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a3a:	0585                	addi	a1,a1,1
    1a3c:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1a40:	00f50023          	sb	a5,0(a0)
    1a44:	f7fd                	bnez	a5,1a32 <strcpy+0x54>
}
    1a46:	8082                	ret
    1a48:	8082                	ret

0000000000001a4a <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a4a:	00a5c7b3          	xor	a5,a1,a0
    1a4e:	8b9d                	andi	a5,a5,7
    1a50:	1a079863          	bnez	a5,1c00 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a54:	0075f793          	andi	a5,a1,7
    1a58:	16078463          	beqz	a5,1bc0 <strncpy+0x176>
    1a5c:	ea01                	bnez	a2,1a6c <strncpy+0x22>
    1a5e:	a421                	j	1c66 <strncpy+0x21c>
    1a60:	167d                	addi	a2,a2,-1
    1a62:	0505                	addi	a0,a0,1
    1a64:	14070e63          	beqz	a4,1bc0 <strncpy+0x176>
    1a68:	1a060863          	beqz	a2,1c18 <strncpy+0x1ce>
    1a6c:	0005c783          	lbu	a5,0(a1)
    1a70:	0585                	addi	a1,a1,1
    1a72:	0075f713          	andi	a4,a1,7
    1a76:	00f50023          	sb	a5,0(a0)
    1a7a:	f3fd                	bnez	a5,1a60 <strncpy+0x16>
    1a7c:	4805                	li	a6,1
    1a7e:	1a061863          	bnez	a2,1c2e <strncpy+0x1e4>
    1a82:	40a007b3          	neg	a5,a0
    1a86:	8b9d                	andi	a5,a5,7
    1a88:	4681                	li	a3,0
    1a8a:	18061a63          	bnez	a2,1c1e <strncpy+0x1d4>
    1a8e:	00778713          	addi	a4,a5,7
    1a92:	45ad                	li	a1,11
    1a94:	18b76363          	bltu	a4,a1,1c1a <strncpy+0x1d0>
    1a98:	1ae6eb63          	bltu	a3,a4,1c4e <strncpy+0x204>
    1a9c:	1a078363          	beqz	a5,1c42 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1aa0:	00050023          	sb	zero,0(a0)
    1aa4:	4685                	li	a3,1
    1aa6:	00150713          	addi	a4,a0,1
    1aaa:	18d78f63          	beq	a5,a3,1c48 <strncpy+0x1fe>
    1aae:	000500a3          	sb	zero,1(a0)
    1ab2:	4689                	li	a3,2
    1ab4:	00250713          	addi	a4,a0,2
    1ab8:	18d78e63          	beq	a5,a3,1c54 <strncpy+0x20a>
    1abc:	00050123          	sb	zero,2(a0)
    1ac0:	468d                	li	a3,3
    1ac2:	00350713          	addi	a4,a0,3
    1ac6:	16d78c63          	beq	a5,a3,1c3e <strncpy+0x1f4>
    1aca:	000501a3          	sb	zero,3(a0)
    1ace:	4691                	li	a3,4
    1ad0:	00450713          	addi	a4,a0,4
    1ad4:	18d78263          	beq	a5,a3,1c58 <strncpy+0x20e>
    1ad8:	00050223          	sb	zero,4(a0)
    1adc:	4695                	li	a3,5
    1ade:	00550713          	addi	a4,a0,5
    1ae2:	16d78d63          	beq	a5,a3,1c5c <strncpy+0x212>
    1ae6:	000502a3          	sb	zero,5(a0)
    1aea:	469d                	li	a3,7
    1aec:	00650713          	addi	a4,a0,6
    1af0:	16d79863          	bne	a5,a3,1c60 <strncpy+0x216>
    1af4:	00750713          	addi	a4,a0,7
    1af8:	00050323          	sb	zero,6(a0)
    1afc:	40f80833          	sub	a6,a6,a5
    1b00:	ff887593          	andi	a1,a6,-8
    1b04:	97aa                	add	a5,a5,a0
    1b06:	95be                	add	a1,a1,a5
    1b08:	0007b023          	sd	zero,0(a5)
    1b0c:	07a1                	addi	a5,a5,8
    1b0e:	feb79de3          	bne	a5,a1,1b08 <strncpy+0xbe>
    1b12:	ff887593          	andi	a1,a6,-8
    1b16:	9ead                	addw	a3,a3,a1
    1b18:	00b707b3          	add	a5,a4,a1
    1b1c:	12b80863          	beq	a6,a1,1c4c <strncpy+0x202>
    1b20:	00078023          	sb	zero,0(a5)
    1b24:	0016871b          	addiw	a4,a3,1
    1b28:	0ec77863          	bgeu	a4,a2,1c18 <strncpy+0x1ce>
    1b2c:	000780a3          	sb	zero,1(a5)
    1b30:	0026871b          	addiw	a4,a3,2
    1b34:	0ec77263          	bgeu	a4,a2,1c18 <strncpy+0x1ce>
    1b38:	00078123          	sb	zero,2(a5)
    1b3c:	0036871b          	addiw	a4,a3,3
    1b40:	0cc77c63          	bgeu	a4,a2,1c18 <strncpy+0x1ce>
    1b44:	000781a3          	sb	zero,3(a5)
    1b48:	0046871b          	addiw	a4,a3,4
    1b4c:	0cc77663          	bgeu	a4,a2,1c18 <strncpy+0x1ce>
    1b50:	00078223          	sb	zero,4(a5)
    1b54:	0056871b          	addiw	a4,a3,5
    1b58:	0cc77063          	bgeu	a4,a2,1c18 <strncpy+0x1ce>
    1b5c:	000782a3          	sb	zero,5(a5)
    1b60:	0066871b          	addiw	a4,a3,6
    1b64:	0ac77a63          	bgeu	a4,a2,1c18 <strncpy+0x1ce>
    1b68:	00078323          	sb	zero,6(a5)
    1b6c:	0076871b          	addiw	a4,a3,7
    1b70:	0ac77463          	bgeu	a4,a2,1c18 <strncpy+0x1ce>
    1b74:	000783a3          	sb	zero,7(a5)
    1b78:	0086871b          	addiw	a4,a3,8
    1b7c:	08c77e63          	bgeu	a4,a2,1c18 <strncpy+0x1ce>
    1b80:	00078423          	sb	zero,8(a5)
    1b84:	0096871b          	addiw	a4,a3,9
    1b88:	08c77863          	bgeu	a4,a2,1c18 <strncpy+0x1ce>
    1b8c:	000784a3          	sb	zero,9(a5)
    1b90:	00a6871b          	addiw	a4,a3,10
    1b94:	08c77263          	bgeu	a4,a2,1c18 <strncpy+0x1ce>
    1b98:	00078523          	sb	zero,10(a5)
    1b9c:	00b6871b          	addiw	a4,a3,11
    1ba0:	06c77c63          	bgeu	a4,a2,1c18 <strncpy+0x1ce>
    1ba4:	000785a3          	sb	zero,11(a5)
    1ba8:	00c6871b          	addiw	a4,a3,12
    1bac:	06c77663          	bgeu	a4,a2,1c18 <strncpy+0x1ce>
    1bb0:	00078623          	sb	zero,12(a5)
    1bb4:	26b5                	addiw	a3,a3,13
    1bb6:	06c6f163          	bgeu	a3,a2,1c18 <strncpy+0x1ce>
    1bba:	000786a3          	sb	zero,13(a5)
    1bbe:	8082                	ret
            ;
        if (!n || !*s)
    1bc0:	c645                	beqz	a2,1c68 <strncpy+0x21e>
    1bc2:	0005c783          	lbu	a5,0(a1)
    1bc6:	ea078be3          	beqz	a5,1a7c <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bca:	479d                	li	a5,7
    1bcc:	02c7ff63          	bgeu	a5,a2,1c0a <strncpy+0x1c0>
    1bd0:	00000897          	auipc	a7,0x0
    1bd4:	4008b883          	ld	a7,1024(a7) # 1fd0 <__clone+0xe6>
    1bd8:	00000817          	auipc	a6,0x0
    1bdc:	40083803          	ld	a6,1024(a6) # 1fd8 <__clone+0xee>
    1be0:	431d                	li	t1,7
    1be2:	6198                	ld	a4,0(a1)
    1be4:	011707b3          	add	a5,a4,a7
    1be8:	fff74693          	not	a3,a4
    1bec:	8ff5                	and	a5,a5,a3
    1bee:	0107f7b3          	and	a5,a5,a6
    1bf2:	ef81                	bnez	a5,1c0a <strncpy+0x1c0>
            *wd = *ws;
    1bf4:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bf6:	1661                	addi	a2,a2,-8
    1bf8:	05a1                	addi	a1,a1,8
    1bfa:	0521                	addi	a0,a0,8
    1bfc:	fec363e3          	bltu	t1,a2,1be2 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1c00:	e609                	bnez	a2,1c0a <strncpy+0x1c0>
    1c02:	a08d                	j	1c64 <strncpy+0x21a>
    1c04:	167d                	addi	a2,a2,-1
    1c06:	0505                	addi	a0,a0,1
    1c08:	ca01                	beqz	a2,1c18 <strncpy+0x1ce>
    1c0a:	0005c783          	lbu	a5,0(a1)
    1c0e:	0585                	addi	a1,a1,1
    1c10:	00f50023          	sb	a5,0(a0)
    1c14:	fbe5                	bnez	a5,1c04 <strncpy+0x1ba>
        ;
tail:
    1c16:	b59d                	j	1a7c <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1c18:	8082                	ret
    1c1a:	472d                	li	a4,11
    1c1c:	bdb5                	j	1a98 <strncpy+0x4e>
    1c1e:	00778713          	addi	a4,a5,7
    1c22:	45ad                	li	a1,11
    1c24:	fff60693          	addi	a3,a2,-1
    1c28:	e6b778e3          	bgeu	a4,a1,1a98 <strncpy+0x4e>
    1c2c:	b7fd                	j	1c1a <strncpy+0x1d0>
    1c2e:	40a007b3          	neg	a5,a0
    1c32:	8832                	mv	a6,a2
    1c34:	8b9d                	andi	a5,a5,7
    1c36:	4681                	li	a3,0
    1c38:	e4060be3          	beqz	a2,1a8e <strncpy+0x44>
    1c3c:	b7cd                	j	1c1e <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c3e:	468d                	li	a3,3
    1c40:	bd75                	j	1afc <strncpy+0xb2>
    1c42:	872a                	mv	a4,a0
    1c44:	4681                	li	a3,0
    1c46:	bd5d                	j	1afc <strncpy+0xb2>
    1c48:	4685                	li	a3,1
    1c4a:	bd4d                	j	1afc <strncpy+0xb2>
    1c4c:	8082                	ret
    1c4e:	87aa                	mv	a5,a0
    1c50:	4681                	li	a3,0
    1c52:	b5f9                	j	1b20 <strncpy+0xd6>
    1c54:	4689                	li	a3,2
    1c56:	b55d                	j	1afc <strncpy+0xb2>
    1c58:	4691                	li	a3,4
    1c5a:	b54d                	j	1afc <strncpy+0xb2>
    1c5c:	4695                	li	a3,5
    1c5e:	bd79                	j	1afc <strncpy+0xb2>
    1c60:	4699                	li	a3,6
    1c62:	bd69                	j	1afc <strncpy+0xb2>
    1c64:	8082                	ret
    1c66:	8082                	ret
    1c68:	8082                	ret

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
    1d3e:	1141                	addi	sp,sp,-16
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
    1d64:	0141                	addi	sp,sp,16
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
    1d84:	1141                	addi	sp,sp,-16
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
    1d9a:	0141                	addi	sp,sp,16
    1d9c:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d9e:	4502                	lw	a0,0(sp)
}
    1da0:	0141                	addi	sp,sp,16
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
    1e0a:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e0c:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e10:	9301                	srli	a4,a4,0x20
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
    1e1a:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e1c:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e20:	9201                	srli	a2,a2,0x20
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
    1e8a:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e8c:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e90:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e94:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e96:	9201                	srli	a2,a2,0x20
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
    1eea:	15c1                	addi	a1,a1,-16
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
