
/home/windflower/Desktop/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/openat:     file format elf64-littleriscv


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
    1004:	1141                	add	sp,sp,-16
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f0a50513          	add	a0,a0,-246 # 1f10 <__clone+0x2c>
void test_openat(void) {
    100e:	e406                	sd	ra,8(sp)
    1010:	e022                	sd	s0,0(sp)
    TEST_START(__func__);
    1012:	2f2000ef          	jal	1304 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	fb250513          	add	a0,a0,-78 # 1fc8 <__func__.0>
    101e:	2e6000ef          	jal	1304 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	f0650513          	add	a0,a0,-250 # 1f28 <__clone+0x44>
    102a:	2da000ef          	jal	1304 <puts>
    //int fd_dir = open(".", O_RDONLY | O_CREATE);
    int fd_dir = open("./mnt", O_DIRECTORY);
    102e:	002005b7          	lui	a1,0x200
    1032:	00001517          	auipc	a0,0x1
    1036:	f0650513          	add	a0,a0,-250 # 1f38 <__clone+0x54>
    103a:	435000ef          	jal	1c6e <open>
    103e:	842a                	mv	s0,a0
    printf("open dir fd: %d\n", fd_dir);
    1040:	85aa                	mv	a1,a0
    1042:	00001517          	auipc	a0,0x1
    1046:	efe50513          	add	a0,a0,-258 # 1f40 <__clone+0x5c>
    104a:	2dc000ef          	jal	1326 <printf>
    int fd = openat(fd_dir, "test_openat.txt", O_CREATE | O_RDWR);
    104e:	00001597          	auipc	a1,0x1
    1052:	f0a58593          	add	a1,a1,-246 # 1f58 <__clone+0x74>
    1056:	8522                	mv	a0,s0
    1058:	04200613          	li	a2,66
    105c:	42b000ef          	jal	1c86 <openat>
    1060:	842a                	mv	s0,a0
    printf("openat fd: %d\n", fd);
    1062:	85aa                	mv	a1,a0
    1064:	00001517          	auipc	a0,0x1
    1068:	f0450513          	add	a0,a0,-252 # 1f68 <__clone+0x84>
    106c:	2ba000ef          	jal	1326 <printf>
    assert(fd > 0);
    1070:	02805f63          	blez	s0,10ae <test_openat+0xaa>
    printf("openat success.\n");
    1074:	00001517          	auipc	a0,0x1
    1078:	f2450513          	add	a0,a0,-220 # 1f98 <__clone+0xb4>
    107c:	2aa000ef          	jal	1326 <printf>
    write(fd, buf, strlen(buf));
    int size = read(fd, buf, 256);
    if (size > 0) printf("  openat success.\n");
    else printf("  openat error.\n");
    */
    close(fd);	
    1080:	8522                	mv	a0,s0
    1082:	415000ef          	jal	1c96 <close>
	
    TEST_END(__func__);
    1086:	00001517          	auipc	a0,0x1
    108a:	f2a50513          	add	a0,a0,-214 # 1fb0 <__clone+0xcc>
    108e:	276000ef          	jal	1304 <puts>
    1092:	00001517          	auipc	a0,0x1
    1096:	f3650513          	add	a0,a0,-202 # 1fc8 <__func__.0>
    109a:	26a000ef          	jal	1304 <puts>
}
    109e:	6402                	ld	s0,0(sp)
    10a0:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    10a2:	00001517          	auipc	a0,0x1
    10a6:	e8650513          	add	a0,a0,-378 # 1f28 <__clone+0x44>
}
    10aa:	0141                	add	sp,sp,16
    TEST_END(__func__);
    10ac:	aca1                	j	1304 <puts>
    assert(fd > 0);
    10ae:	00001517          	auipc	a0,0x1
    10b2:	eca50513          	add	a0,a0,-310 # 1f78 <__clone+0x94>
    10b6:	4ee000ef          	jal	15a4 <panic>
    10ba:	bf6d                	j	1074 <test_openat+0x70>

00000000000010bc <main>:

int main(void) {
    10bc:	1141                	add	sp,sp,-16
    10be:	e406                	sd	ra,8(sp)
    test_openat();
    10c0:	f45ff0ef          	jal	1004 <test_openat>
    return 0;
}
    10c4:	60a2                	ld	ra,8(sp)
    10c6:	4501                	li	a0,0
    10c8:	0141                	add	sp,sp,16
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
    10d0:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10d2:	05a1                	add	a1,a1,8
{
    10d4:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10d6:	fe7ff0ef          	jal	10bc <main>
    10da:	423000ef          	jal	1cfc <exit>
	return 0;
}
    10de:	60a2                	ld	ra,8(sp)
    10e0:	4501                	li	a0,0
    10e2:	0141                	add	sp,sp,16
    10e4:	8082                	ret

00000000000010e6 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10e6:	7179                	add	sp,sp,-48
    10e8:	f406                	sd	ra,40(sp)
    10ea:	0005081b          	sext.w	a6,a0
    10ee:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10f0:	00055563          	bgez	a0,10fa <printint.constprop.0+0x14>
        x = -xx;
    10f4:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    10f8:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10fa:	02b8763b          	remuw	a2,a6,a1
    10fe:	00001697          	auipc	a3,0x1
    1102:	eda68693          	add	a3,a3,-294 # 1fd8 <digits>
    buf[16] = 0;
    1106:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    110a:	0005871b          	sext.w	a4,a1
    110e:	1602                	sll	a2,a2,0x20
    1110:	9201                	srl	a2,a2,0x20
    1112:	9636                	add	a2,a2,a3
    1114:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1118:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    111c:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1120:	10b86c63          	bltu	a6,a1,1238 <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    1124:	02e5763b          	remuw	a2,a0,a4
    1128:	1602                	sll	a2,a2,0x20
    112a:	9201                	srl	a2,a2,0x20
    112c:	9636                	add	a2,a2,a3
    112e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1132:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1136:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    113a:	10e56863          	bltu	a0,a4,124a <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    113e:	02e5f63b          	remuw	a2,a1,a4
    1142:	1602                	sll	a2,a2,0x20
    1144:	9201                	srl	a2,a2,0x20
    1146:	9636                	add	a2,a2,a3
    1148:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    114c:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1150:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1154:	10e5e463          	bltu	a1,a4,125c <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    1158:	02e5763b          	remuw	a2,a0,a4
    115c:	1602                	sll	a2,a2,0x20
    115e:	9201                	srl	a2,a2,0x20
    1160:	9636                	add	a2,a2,a3
    1162:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1166:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    116a:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    116e:	10e56063          	bltu	a0,a4,126e <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    1172:	02e5f63b          	remuw	a2,a1,a4
    1176:	1602                	sll	a2,a2,0x20
    1178:	9201                	srl	a2,a2,0x20
    117a:	9636                	add	a2,a2,a3
    117c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1180:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1184:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1188:	0ee5ec63          	bltu	a1,a4,1280 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    118c:	02e5763b          	remuw	a2,a0,a4
    1190:	1602                	sll	a2,a2,0x20
    1192:	9201                	srl	a2,a2,0x20
    1194:	9636                	add	a2,a2,a3
    1196:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    119a:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    119e:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11a2:	08e56263          	bltu	a0,a4,1226 <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    11a6:	02e5f63b          	remuw	a2,a1,a4
    11aa:	1602                	sll	a2,a2,0x20
    11ac:	9201                	srl	a2,a2,0x20
    11ae:	9636                	add	a2,a2,a3
    11b0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b4:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11b8:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11bc:	0ce5eb63          	bltu	a1,a4,1292 <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    11c0:	02e5763b          	remuw	a2,a0,a4
    11c4:	1602                	sll	a2,a2,0x20
    11c6:	9201                	srl	a2,a2,0x20
    11c8:	9636                	add	a2,a2,a3
    11ca:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ce:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11d2:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11d6:	0ce56763          	bltu	a0,a4,12a4 <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    11da:	02e5f63b          	remuw	a2,a1,a4
    11de:	1602                	sll	a2,a2,0x20
    11e0:	9201                	srl	a2,a2,0x20
    11e2:	9636                	add	a2,a2,a3
    11e4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11e8:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11ec:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11f0:	0ce5e363          	bltu	a1,a4,12b6 <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    11f4:	1782                	sll	a5,a5,0x20
    11f6:	9381                	srl	a5,a5,0x20
    11f8:	96be                	add	a3,a3,a5
    11fa:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    11fe:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    1200:	00f10723          	sb	a5,14(sp)
    if (sign)
    1204:	00088763          	beqz	a7,1212 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1208:	02d00793          	li	a5,45
    120c:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1210:	4595                	li	a1,5
    write(f, s, l);
    1212:	003c                	add	a5,sp,8
    1214:	4641                	li	a2,16
    1216:	9e0d                	subw	a2,a2,a1
    1218:	4505                	li	a0,1
    121a:	95be                	add	a1,a1,a5
    121c:	291000ef          	jal	1cac <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1220:	70a2                	ld	ra,40(sp)
    1222:	6145                	add	sp,sp,48
    1224:	8082                	ret
    i++;
    1226:	45a9                	li	a1,10
    if (sign)
    1228:	fe0885e3          	beqz	a7,1212 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    122c:	02d00793          	li	a5,45
    1230:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1234:	45a5                	li	a1,9
    1236:	bff1                	j	1212 <printint.constprop.0+0x12c>
    i++;
    1238:	45bd                	li	a1,15
    if (sign)
    123a:	fc088ce3          	beqz	a7,1212 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    123e:	02d00793          	li	a5,45
    1242:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1246:	45b9                	li	a1,14
    1248:	b7e9                	j	1212 <printint.constprop.0+0x12c>
    i++;
    124a:	45b9                	li	a1,14
    if (sign)
    124c:	fc0883e3          	beqz	a7,1212 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1250:	02d00793          	li	a5,45
    1254:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1258:	45b5                	li	a1,13
    125a:	bf65                	j	1212 <printint.constprop.0+0x12c>
    i++;
    125c:	45b5                	li	a1,13
    if (sign)
    125e:	fa088ae3          	beqz	a7,1212 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1262:	02d00793          	li	a5,45
    1266:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    126a:	45b1                	li	a1,12
    126c:	b75d                	j	1212 <printint.constprop.0+0x12c>
    i++;
    126e:	45b1                	li	a1,12
    if (sign)
    1270:	fa0881e3          	beqz	a7,1212 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1274:	02d00793          	li	a5,45
    1278:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    127c:	45ad                	li	a1,11
    127e:	bf51                	j	1212 <printint.constprop.0+0x12c>
    i++;
    1280:	45ad                	li	a1,11
    if (sign)
    1282:	f80888e3          	beqz	a7,1212 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1286:	02d00793          	li	a5,45
    128a:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    128e:	45a9                	li	a1,10
    1290:	b749                	j	1212 <printint.constprop.0+0x12c>
    i++;
    1292:	45a5                	li	a1,9
    if (sign)
    1294:	f6088fe3          	beqz	a7,1212 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1298:	02d00793          	li	a5,45
    129c:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12a0:	45a1                	li	a1,8
    12a2:	bf85                	j	1212 <printint.constprop.0+0x12c>
    i++;
    12a4:	45a1                	li	a1,8
    if (sign)
    12a6:	f60886e3          	beqz	a7,1212 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12aa:	02d00793          	li	a5,45
    12ae:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12b2:	459d                	li	a1,7
    12b4:	bfb9                	j	1212 <printint.constprop.0+0x12c>
    i++;
    12b6:	459d                	li	a1,7
    if (sign)
    12b8:	f4088de3          	beqz	a7,1212 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12bc:	02d00793          	li	a5,45
    12c0:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12c4:	4599                	li	a1,6
    12c6:	b7b1                	j	1212 <printint.constprop.0+0x12c>

00000000000012c8 <getchar>:
{
    12c8:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12ca:	00f10593          	add	a1,sp,15
    12ce:	4605                	li	a2,1
    12d0:	4501                	li	a0,0
{
    12d2:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12d4:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12d8:	1cb000ef          	jal	1ca2 <read>
}
    12dc:	60e2                	ld	ra,24(sp)
    12de:	00f14503          	lbu	a0,15(sp)
    12e2:	6105                	add	sp,sp,32
    12e4:	8082                	ret

00000000000012e6 <putchar>:
{
    12e6:	1101                	add	sp,sp,-32
    12e8:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12ea:	00f10593          	add	a1,sp,15
    12ee:	4605                	li	a2,1
    12f0:	4505                	li	a0,1
{
    12f2:	ec06                	sd	ra,24(sp)
    char byte = c;
    12f4:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12f8:	1b5000ef          	jal	1cac <write>
}
    12fc:	60e2                	ld	ra,24(sp)
    12fe:	2501                	sext.w	a0,a0
    1300:	6105                	add	sp,sp,32
    1302:	8082                	ret

0000000000001304 <puts>:
{
    1304:	1141                	add	sp,sp,-16
    1306:	e406                	sd	ra,8(sp)
    1308:	e022                	sd	s0,0(sp)
    130a:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    130c:	56c000ef          	jal	1878 <strlen>
    1310:	862a                	mv	a2,a0
    1312:	85a2                	mv	a1,s0
    1314:	4505                	li	a0,1
    1316:	197000ef          	jal	1cac <write>
}
    131a:	60a2                	ld	ra,8(sp)
    131c:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    131e:	957d                	sra	a0,a0,0x3f
    return r;
    1320:	2501                	sext.w	a0,a0
}
    1322:	0141                	add	sp,sp,16
    1324:	8082                	ret

0000000000001326 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1326:	7131                	add	sp,sp,-192
    1328:	e4d6                	sd	s5,72(sp)
    132a:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    132c:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    132e:	013c                	add	a5,sp,136
{
    1330:	f0ca                	sd	s2,96(sp)
    1332:	ecce                	sd	s3,88(sp)
    1334:	e8d2                	sd	s4,80(sp)
    1336:	e0da                	sd	s6,64(sp)
    1338:	fc5e                	sd	s7,56(sp)
    133a:	fc86                	sd	ra,120(sp)
    133c:	f8a2                	sd	s0,112(sp)
    133e:	f4a6                	sd	s1,104(sp)
    1340:	e52e                	sd	a1,136(sp)
    1342:	e932                	sd	a2,144(sp)
    1344:	ed36                	sd	a3,152(sp)
    1346:	f13a                	sd	a4,160(sp)
    1348:	f942                	sd	a6,176(sp)
    134a:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    134c:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    134e:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1352:	07300a13          	li	s4,115
    1356:	07800b93          	li	s7,120
    135a:	06400b13          	li	s6,100
    buf[i++] = '0';
    135e:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x5858>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1362:	00001997          	auipc	s3,0x1
    1366:	c7698993          	add	s3,s3,-906 # 1fd8 <digits>
        if (!*s)
    136a:	00054783          	lbu	a5,0(a0)
    136e:	16078863          	beqz	a5,14de <printf+0x1b8>
    1372:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1374:	19278063          	beq	a5,s2,14f4 <printf+0x1ce>
    1378:	00164783          	lbu	a5,1(a2)
    137c:	0605                	add	a2,a2,1
    137e:	fbfd                	bnez	a5,1374 <printf+0x4e>
    1380:	84b2                	mv	s1,a2
        l = z - a;
    1382:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1386:	85aa                	mv	a1,a0
    1388:	8622                	mv	a2,s0
    138a:	4505                	li	a0,1
    138c:	121000ef          	jal	1cac <write>
        if (l)
    1390:	18041763          	bnez	s0,151e <printf+0x1f8>
        if (s[1] == 0)
    1394:	0014c783          	lbu	a5,1(s1)
    1398:	14078363          	beqz	a5,14de <printf+0x1b8>
        switch (s[1])
    139c:	19478f63          	beq	a5,s4,153a <printf+0x214>
    13a0:	18fa6163          	bltu	s4,a5,1522 <printf+0x1fc>
    13a4:	1b678e63          	beq	a5,s6,1560 <printf+0x23a>
    13a8:	07000713          	li	a4,112
    13ac:	1ce79463          	bne	a5,a4,1574 <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13b0:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13b2:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13b6:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13b8:	631c                	ld	a5,0(a4)
    13ba:	0721                	add	a4,a4,8
    13bc:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13be:	00479293          	sll	t0,a5,0x4
    13c2:	00879f93          	sll	t6,a5,0x8
    13c6:	00c79f13          	sll	t5,a5,0xc
    13ca:	01079e93          	sll	t4,a5,0x10
    13ce:	01479e13          	sll	t3,a5,0x14
    13d2:	01879313          	sll	t1,a5,0x18
    13d6:	01c79893          	sll	a7,a5,0x1c
    13da:	02479813          	sll	a6,a5,0x24
    13de:	02879513          	sll	a0,a5,0x28
    13e2:	02c79593          	sll	a1,a5,0x2c
    13e6:	03079693          	sll	a3,a5,0x30
    13ea:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13ee:	03c7d413          	srl	s0,a5,0x3c
    13f2:	01c7d39b          	srlw	t2,a5,0x1c
    13f6:	03c2d293          	srl	t0,t0,0x3c
    13fa:	03cfdf93          	srl	t6,t6,0x3c
    13fe:	03cf5f13          	srl	t5,t5,0x3c
    1402:	03cede93          	srl	t4,t4,0x3c
    1406:	03ce5e13          	srl	t3,t3,0x3c
    140a:	03c35313          	srl	t1,t1,0x3c
    140e:	03c8d893          	srl	a7,a7,0x3c
    1412:	03c85813          	srl	a6,a6,0x3c
    1416:	9171                	srl	a0,a0,0x3c
    1418:	91f1                	srl	a1,a1,0x3c
    141a:	92f1                	srl	a3,a3,0x3c
    141c:	9371                	srl	a4,a4,0x3c
    141e:	974e                	add	a4,a4,s3
    1420:	944e                	add	s0,s0,s3
    1422:	92ce                	add	t0,t0,s3
    1424:	9fce                	add	t6,t6,s3
    1426:	9f4e                	add	t5,t5,s3
    1428:	9ece                	add	t4,t4,s3
    142a:	9e4e                	add	t3,t3,s3
    142c:	934e                	add	t1,t1,s3
    142e:	98ce                	add	a7,a7,s3
    1430:	93ce                	add	t2,t2,s3
    1432:	984e                	add	a6,a6,s3
    1434:	954e                	add	a0,a0,s3
    1436:	95ce                	add	a1,a1,s3
    1438:	96ce                	add	a3,a3,s3
    143a:	00074083          	lbu	ra,0(a4)
    143e:	0002c283          	lbu	t0,0(t0)
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
    146a:	0006c683          	lbu	a3,0(a3)
    146e:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1472:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1476:	9371                	srl	a4,a4,0x3c
    1478:	8bbd                	and	a5,a5,15
    147a:	974e                	add	a4,a4,s3
    147c:	97ce                	add	a5,a5,s3
    147e:	005105a3          	sb	t0,11(sp)
    1482:	01f10623          	sb	t6,12(sp)
    1486:	01e106a3          	sb	t5,13(sp)
    148a:	01d10723          	sb	t4,14(sp)
    148e:	01c107a3          	sb	t3,15(sp)
    1492:	00610823          	sb	t1,16(sp)
    1496:	011108a3          	sb	a7,17(sp)
    149a:	00710923          	sb	t2,18(sp)
    149e:	010109a3          	sb	a6,19(sp)
    14a2:	00a10a23          	sb	a0,20(sp)
    14a6:	00b10aa3          	sb	a1,21(sp)
    14aa:	00d10b23          	sb	a3,22(sp)
    14ae:	00110ba3          	sb	ra,23(sp)
    14b2:	00810523          	sb	s0,10(sp)
    14b6:	00074703          	lbu	a4,0(a4)
    14ba:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14be:	002c                	add	a1,sp,8
    14c0:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14c2:	00e10c23          	sb	a4,24(sp)
    14c6:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14ca:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14ce:	7de000ef          	jal	1cac <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14d2:	00248513          	add	a0,s1,2
        if (!*s)
    14d6:	00054783          	lbu	a5,0(a0)
    14da:	e8079ce3          	bnez	a5,1372 <printf+0x4c>
    }
    va_end(ap);
}
    14de:	70e6                	ld	ra,120(sp)
    14e0:	7446                	ld	s0,112(sp)
    14e2:	74a6                	ld	s1,104(sp)
    14e4:	7906                	ld	s2,96(sp)
    14e6:	69e6                	ld	s3,88(sp)
    14e8:	6a46                	ld	s4,80(sp)
    14ea:	6aa6                	ld	s5,72(sp)
    14ec:	6b06                	ld	s6,64(sp)
    14ee:	7be2                	ld	s7,56(sp)
    14f0:	6129                	add	sp,sp,192
    14f2:	8082                	ret
    14f4:	84b2                	mv	s1,a2
    14f6:	a039                	j	1504 <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14f8:	0024c783          	lbu	a5,2(s1)
    14fc:	0605                	add	a2,a2,1
    14fe:	0489                	add	s1,s1,2
    1500:	e92791e3          	bne	a5,s2,1382 <printf+0x5c>
    1504:	0014c783          	lbu	a5,1(s1)
    1508:	ff2788e3          	beq	a5,s2,14f8 <printf+0x1d2>
        l = z - a;
    150c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1510:	85aa                	mv	a1,a0
    1512:	8622                	mv	a2,s0
    1514:	4505                	li	a0,1
    1516:	796000ef          	jal	1cac <write>
        if (l)
    151a:	e6040de3          	beqz	s0,1394 <printf+0x6e>
    151e:	8526                	mv	a0,s1
    1520:	b5a9                	j	136a <printf+0x44>
        switch (s[1])
    1522:	05779963          	bne	a5,s7,1574 <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    1526:	6782                	ld	a5,0(sp)
    1528:	45c1                	li	a1,16
    152a:	4388                	lw	a0,0(a5)
    152c:	07a1                	add	a5,a5,8
    152e:	e03e                	sd	a5,0(sp)
    1530:	bb7ff0ef          	jal	10e6 <printint.constprop.0>
        s += 2;
    1534:	00248513          	add	a0,s1,2
    1538:	bf79                	j	14d6 <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    153a:	6782                	ld	a5,0(sp)
    153c:	6380                	ld	s0,0(a5)
    153e:	07a1                	add	a5,a5,8
    1540:	e03e                	sd	a5,0(sp)
    1542:	cc21                	beqz	s0,159a <printf+0x274>
            l = strnlen(a, 200);
    1544:	0c800593          	li	a1,200
    1548:	8522                	mv	a0,s0
    154a:	460000ef          	jal	19aa <strnlen>
    write(f, s, l);
    154e:	0005061b          	sext.w	a2,a0
    1552:	85a2                	mv	a1,s0
    1554:	4505                	li	a0,1
    1556:	756000ef          	jal	1cac <write>
        s += 2;
    155a:	00248513          	add	a0,s1,2
    155e:	bfa5                	j	14d6 <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    1560:	6782                	ld	a5,0(sp)
    1562:	45a9                	li	a1,10
    1564:	4388                	lw	a0,0(a5)
    1566:	07a1                	add	a5,a5,8
    1568:	e03e                	sd	a5,0(sp)
    156a:	b7dff0ef          	jal	10e6 <printint.constprop.0>
        s += 2;
    156e:	00248513          	add	a0,s1,2
    1572:	b795                	j	14d6 <printf+0x1b0>
    return write(stdout, &byte, 1);
    1574:	4605                	li	a2,1
    1576:	002c                	add	a1,sp,8
    1578:	4505                	li	a0,1
    char byte = c;
    157a:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    157e:	72e000ef          	jal	1cac <write>
    char byte = c;
    1582:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1586:	4605                	li	a2,1
    1588:	002c                	add	a1,sp,8
    158a:	4505                	li	a0,1
    char byte = c;
    158c:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1590:	71c000ef          	jal	1cac <write>
        s += 2;
    1594:	00248513          	add	a0,s1,2
    1598:	bf3d                	j	14d6 <printf+0x1b0>
                a = "(null)";
    159a:	00001417          	auipc	s0,0x1
    159e:	a2640413          	add	s0,s0,-1498 # 1fc0 <__clone+0xdc>
    15a2:	b74d                	j	1544 <printf+0x21e>

00000000000015a4 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15a4:	1141                	add	sp,sp,-16
    15a6:	e406                	sd	ra,8(sp)
    puts(m);
    15a8:	d5dff0ef          	jal	1304 <puts>
    exit(-100);
}
    15ac:	60a2                	ld	ra,8(sp)
    exit(-100);
    15ae:	f9c00513          	li	a0,-100
}
    15b2:	0141                	add	sp,sp,16
    exit(-100);
    15b4:	a7a1                	j	1cfc <exit>

00000000000015b6 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15b6:	02000793          	li	a5,32
    15ba:	00f50663          	beq	a0,a5,15c6 <isspace+0x10>
    15be:	355d                	addw	a0,a0,-9
    15c0:	00553513          	sltiu	a0,a0,5
    15c4:	8082                	ret
    15c6:	4505                	li	a0,1
}
    15c8:	8082                	ret

00000000000015ca <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15ca:	fd05051b          	addw	a0,a0,-48
}
    15ce:	00a53513          	sltiu	a0,a0,10
    15d2:	8082                	ret

00000000000015d4 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d4:	02000713          	li	a4,32
    15d8:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15da:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15de:	ff76879b          	addw	a5,a3,-9
    15e2:	06e68063          	beq	a3,a4,1642 <atoi+0x6e>
    15e6:	0006859b          	sext.w	a1,a3
    15ea:	04f67c63          	bgeu	a2,a5,1642 <atoi+0x6e>
        s++;
    switch (*s)
    15ee:	02b00793          	li	a5,43
    15f2:	06f68563          	beq	a3,a5,165c <atoi+0x88>
    15f6:	02d00793          	li	a5,45
    15fa:	04f69663          	bne	a3,a5,1646 <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15fe:	00154683          	lbu	a3,1(a0)
    1602:	47a5                	li	a5,9
        s++;
    1604:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1608:	fd06869b          	addw	a3,a3,-48
    160c:	8636                	mv	a2,a3
    while (isdigit(*s))
    160e:	04d7e563          	bltu	a5,a3,1658 <atoi+0x84>
        neg = 1;
    1612:	4885                	li	a7,1
    int n = 0, neg = 0;
    1614:	4501                	li	a0,0
    while (isdigit(*s))
    1616:	4825                	li	a6,9
    1618:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    161c:	0025179b          	sllw	a5,a0,0x2
    1620:	9fa9                	addw	a5,a5,a0
    1622:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    1626:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    162a:	85b2                	mv	a1,a2
    162c:	40c7853b          	subw	a0,a5,a2
    1630:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    1632:	8636                	mv	a2,a3
    while (isdigit(*s))
    1634:	fed872e3          	bgeu	a6,a3,1618 <atoi+0x44>
    return neg ? n : -n;
    1638:	02089163          	bnez	a7,165a <atoi+0x86>
    163c:	40f5853b          	subw	a0,a1,a5
    1640:	8082                	ret
        s++;
    1642:	0505                	add	a0,a0,1
    1644:	bf59                	j	15da <atoi+0x6>
    while (isdigit(*s))
    1646:	fd05859b          	addw	a1,a1,-48
    164a:	47a5                	li	a5,9
    164c:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    164e:	4881                	li	a7,0
    1650:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    1654:	fcb7f0e3          	bgeu	a5,a1,1614 <atoi+0x40>
    return neg ? n : -n;
    1658:	4501                	li	a0,0
}
    165a:	8082                	ret
    while (isdigit(*s))
    165c:	00154683          	lbu	a3,1(a0)
    1660:	47a5                	li	a5,9
        s++;
    1662:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1666:	fd06869b          	addw	a3,a3,-48
    166a:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    166c:	4881                	li	a7,0
    while (isdigit(*s))
    166e:	fad7f3e3          	bgeu	a5,a3,1614 <atoi+0x40>
    return neg ? n : -n;
    1672:	4501                	li	a0,0
    1674:	8082                	ret

0000000000001676 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1676:	16060f63          	beqz	a2,17f4 <memset+0x17e>
    167a:	40a006b3          	neg	a3,a0
    167e:	0076f793          	and	a5,a3,7
    1682:	00778813          	add	a6,a5,7
    1686:	48ad                	li	a7,11
    1688:	0ff5f713          	zext.b	a4,a1
    168c:	fff60593          	add	a1,a2,-1
    1690:	17186363          	bltu	a6,a7,17f6 <memset+0x180>
    1694:	1705eb63          	bltu	a1,a6,180a <memset+0x194>
    1698:	16078163          	beqz	a5,17fa <memset+0x184>
    169c:	00e50023          	sb	a4,0(a0)
    16a0:	0066f593          	and	a1,a3,6
    16a4:	14058e63          	beqz	a1,1800 <memset+0x18a>
    16a8:	00e500a3          	sb	a4,1(a0)
    16ac:	4589                	li	a1,2
    16ae:	00250813          	add	a6,a0,2
    16b2:	04f5f663          	bgeu	a1,a5,16fe <memset+0x88>
    16b6:	00e50123          	sb	a4,2(a0)
    16ba:	8a91                	and	a3,a3,4
    16bc:	00350813          	add	a6,a0,3
    16c0:	458d                	li	a1,3
    16c2:	ce95                	beqz	a3,16fe <memset+0x88>
    16c4:	00e501a3          	sb	a4,3(a0)
    16c8:	4691                	li	a3,4
    16ca:	00450813          	add	a6,a0,4
    16ce:	4591                	li	a1,4
    16d0:	02f6f763          	bgeu	a3,a5,16fe <memset+0x88>
    16d4:	00e50223          	sb	a4,4(a0)
    16d8:	4695                	li	a3,5
    16da:	00550813          	add	a6,a0,5
    16de:	4595                	li	a1,5
    16e0:	00d78f63          	beq	a5,a3,16fe <memset+0x88>
    16e4:	00e502a3          	sb	a4,5(a0)
    16e8:	469d                	li	a3,7
    16ea:	00650813          	add	a6,a0,6
    16ee:	4599                	li	a1,6
    16f0:	00d79763          	bne	a5,a3,16fe <memset+0x88>
    16f4:	00750813          	add	a6,a0,7
    16f8:	00e50323          	sb	a4,6(a0)
    16fc:	459d                	li	a1,7
    16fe:	00871693          	sll	a3,a4,0x8
    1702:	01071313          	sll	t1,a4,0x10
    1706:	8ed9                	or	a3,a3,a4
    1708:	01871893          	sll	a7,a4,0x18
    170c:	0066e6b3          	or	a3,a3,t1
    1710:	0116e6b3          	or	a3,a3,a7
    1714:	02071313          	sll	t1,a4,0x20
    1718:	02871893          	sll	a7,a4,0x28
    171c:	0066e6b3          	or	a3,a3,t1
    1720:	40f60e33          	sub	t3,a2,a5
    1724:	03071313          	sll	t1,a4,0x30
    1728:	0116e6b3          	or	a3,a3,a7
    172c:	0066e6b3          	or	a3,a3,t1
    1730:	03871893          	sll	a7,a4,0x38
    1734:	97aa                	add	a5,a5,a0
    1736:	ff8e7313          	and	t1,t3,-8
    173a:	0116e6b3          	or	a3,a3,a7
    173e:	00f308b3          	add	a7,t1,a5
    1742:	e394                	sd	a3,0(a5)
    1744:	07a1                	add	a5,a5,8
    1746:	ff179ee3          	bne	a5,a7,1742 <memset+0xcc>
    174a:	006806b3          	add	a3,a6,t1
    174e:	00b307bb          	addw	a5,t1,a1
    1752:	0bc30b63          	beq	t1,t3,1808 <memset+0x192>
    1756:	00e68023          	sb	a4,0(a3)
    175a:	0017859b          	addw	a1,a5,1
    175e:	08c5fb63          	bgeu	a1,a2,17f4 <memset+0x17e>
    1762:	00e680a3          	sb	a4,1(a3)
    1766:	0027859b          	addw	a1,a5,2
    176a:	08c5f563          	bgeu	a1,a2,17f4 <memset+0x17e>
    176e:	00e68123          	sb	a4,2(a3)
    1772:	0037859b          	addw	a1,a5,3
    1776:	06c5ff63          	bgeu	a1,a2,17f4 <memset+0x17e>
    177a:	00e681a3          	sb	a4,3(a3)
    177e:	0047859b          	addw	a1,a5,4
    1782:	06c5f963          	bgeu	a1,a2,17f4 <memset+0x17e>
    1786:	00e68223          	sb	a4,4(a3)
    178a:	0057859b          	addw	a1,a5,5
    178e:	06c5f363          	bgeu	a1,a2,17f4 <memset+0x17e>
    1792:	00e682a3          	sb	a4,5(a3)
    1796:	0067859b          	addw	a1,a5,6
    179a:	04c5fd63          	bgeu	a1,a2,17f4 <memset+0x17e>
    179e:	00e68323          	sb	a4,6(a3)
    17a2:	0077859b          	addw	a1,a5,7
    17a6:	04c5f763          	bgeu	a1,a2,17f4 <memset+0x17e>
    17aa:	00e683a3          	sb	a4,7(a3)
    17ae:	0087859b          	addw	a1,a5,8
    17b2:	04c5f163          	bgeu	a1,a2,17f4 <memset+0x17e>
    17b6:	00e68423          	sb	a4,8(a3)
    17ba:	0097859b          	addw	a1,a5,9
    17be:	02c5fb63          	bgeu	a1,a2,17f4 <memset+0x17e>
    17c2:	00e684a3          	sb	a4,9(a3)
    17c6:	00a7859b          	addw	a1,a5,10
    17ca:	02c5f563          	bgeu	a1,a2,17f4 <memset+0x17e>
    17ce:	00e68523          	sb	a4,10(a3)
    17d2:	00b7859b          	addw	a1,a5,11
    17d6:	00c5ff63          	bgeu	a1,a2,17f4 <memset+0x17e>
    17da:	00e685a3          	sb	a4,11(a3)
    17de:	00c7859b          	addw	a1,a5,12
    17e2:	00c5f963          	bgeu	a1,a2,17f4 <memset+0x17e>
    17e6:	00e68623          	sb	a4,12(a3)
    17ea:	27b5                	addw	a5,a5,13
    17ec:	00c7f463          	bgeu	a5,a2,17f4 <memset+0x17e>
    17f0:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17f4:	8082                	ret
    17f6:	482d                	li	a6,11
    17f8:	bd71                	j	1694 <memset+0x1e>
    char *p = dest;
    17fa:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17fc:	4581                	li	a1,0
    17fe:	b701                	j	16fe <memset+0x88>
    1800:	00150813          	add	a6,a0,1
    1804:	4585                	li	a1,1
    1806:	bde5                	j	16fe <memset+0x88>
    1808:	8082                	ret
    char *p = dest;
    180a:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    180c:	4781                	li	a5,0
    180e:	b7a1                	j	1756 <memset+0xe0>

0000000000001810 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1810:	00054783          	lbu	a5,0(a0)
    1814:	0005c703          	lbu	a4,0(a1)
    1818:	00e79863          	bne	a5,a4,1828 <strcmp+0x18>
    181c:	0505                	add	a0,a0,1
    181e:	0585                	add	a1,a1,1
    1820:	fbe5                	bnez	a5,1810 <strcmp>
    1822:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1824:	9d19                	subw	a0,a0,a4
    1826:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1828:	0007851b          	sext.w	a0,a5
    182c:	bfe5                	j	1824 <strcmp+0x14>

000000000000182e <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    182e:	ca15                	beqz	a2,1862 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1830:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1834:	167d                	add	a2,a2,-1
    1836:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    183a:	eb99                	bnez	a5,1850 <strncmp+0x22>
    183c:	a815                	j	1870 <strncmp+0x42>
    183e:	00a68e63          	beq	a3,a0,185a <strncmp+0x2c>
    1842:	0505                	add	a0,a0,1
    1844:	00f71b63          	bne	a4,a5,185a <strncmp+0x2c>
    1848:	00054783          	lbu	a5,0(a0)
    184c:	cf89                	beqz	a5,1866 <strncmp+0x38>
    184e:	85b2                	mv	a1,a2
    1850:	0005c703          	lbu	a4,0(a1)
    1854:	00158613          	add	a2,a1,1
    1858:	f37d                	bnez	a4,183e <strncmp+0x10>
        ;
    return *l - *r;
    185a:	0007851b          	sext.w	a0,a5
    185e:	9d19                	subw	a0,a0,a4
    1860:	8082                	ret
        return 0;
    1862:	4501                	li	a0,0
}
    1864:	8082                	ret
    return *l - *r;
    1866:	0015c703          	lbu	a4,1(a1)
    186a:	4501                	li	a0,0
    186c:	9d19                	subw	a0,a0,a4
    186e:	8082                	ret
    1870:	0005c703          	lbu	a4,0(a1)
    1874:	4501                	li	a0,0
    1876:	b7e5                	j	185e <strncmp+0x30>

0000000000001878 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1878:	00757793          	and	a5,a0,7
    187c:	cf89                	beqz	a5,1896 <strlen+0x1e>
    187e:	87aa                	mv	a5,a0
    1880:	a029                	j	188a <strlen+0x12>
    1882:	0785                	add	a5,a5,1
    1884:	0077f713          	and	a4,a5,7
    1888:	cb01                	beqz	a4,1898 <strlen+0x20>
        if (!*s)
    188a:	0007c703          	lbu	a4,0(a5)
    188e:	fb75                	bnez	a4,1882 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1890:	40a78533          	sub	a0,a5,a0
}
    1894:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1896:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1898:	feff05b7          	lui	a1,0xfeff0
    189c:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedf27>
    18a0:	f0101637          	lui	a2,0xf0101
    18a4:	05c2                	sll	a1,a1,0x10
    18a6:	0612                	sll	a2,a2,0x4
    18a8:	6394                	ld	a3,0(a5)
    18aa:	eff58593          	add	a1,a1,-257
    18ae:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff129>
    18b2:	05c2                	sll	a1,a1,0x10
    18b4:	0642                	sll	a2,a2,0x10
    18b6:	eff58593          	add	a1,a1,-257
    18ba:	10160613          	add	a2,a2,257
    18be:	00b68733          	add	a4,a3,a1
    18c2:	063e                	sll	a2,a2,0xf
    18c4:	fff6c693          	not	a3,a3
    18c8:	8f75                	and	a4,a4,a3
    18ca:	08060613          	add	a2,a2,128
    18ce:	8f71                	and	a4,a4,a2
    18d0:	eb11                	bnez	a4,18e4 <strlen+0x6c>
    18d2:	6794                	ld	a3,8(a5)
    18d4:	07a1                	add	a5,a5,8
    18d6:	00b68733          	add	a4,a3,a1
    18da:	fff6c693          	not	a3,a3
    18de:	8f75                	and	a4,a4,a3
    18e0:	8f71                	and	a4,a4,a2
    18e2:	db65                	beqz	a4,18d2 <strlen+0x5a>
    for (; *s; s++)
    18e4:	0007c703          	lbu	a4,0(a5)
    18e8:	d745                	beqz	a4,1890 <strlen+0x18>
    18ea:	0017c703          	lbu	a4,1(a5)
    18ee:	0785                	add	a5,a5,1
    18f0:	d345                	beqz	a4,1890 <strlen+0x18>
    18f2:	0017c703          	lbu	a4,1(a5)
    18f6:	0785                	add	a5,a5,1
    18f8:	fb6d                	bnez	a4,18ea <strlen+0x72>
    18fa:	bf59                	j	1890 <strlen+0x18>

00000000000018fc <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18fc:	00757713          	and	a4,a0,7
{
    1900:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1902:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1906:	cb19                	beqz	a4,191c <memchr+0x20>
    1908:	ce59                	beqz	a2,19a6 <memchr+0xaa>
    190a:	0007c703          	lbu	a4,0(a5)
    190e:	00b70963          	beq	a4,a1,1920 <memchr+0x24>
    1912:	0785                	add	a5,a5,1
    1914:	0077f713          	and	a4,a5,7
    1918:	167d                	add	a2,a2,-1
    191a:	f77d                	bnez	a4,1908 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    191c:	4501                	li	a0,0
    if (n && *s != c)
    191e:	c649                	beqz	a2,19a8 <memchr+0xac>
    1920:	0007c703          	lbu	a4,0(a5)
    1924:	06b70663          	beq	a4,a1,1990 <memchr+0x94>
        size_t k = ONES * c;
    1928:	01010737          	lui	a4,0x1010
    192c:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e129>
    1930:	0742                	sll	a4,a4,0x10
    1932:	10170713          	add	a4,a4,257
    1936:	0742                	sll	a4,a4,0x10
    1938:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    193c:	469d                	li	a3,7
        size_t k = ONES * c;
    193e:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1942:	04c6f763          	bgeu	a3,a2,1990 <memchr+0x94>
    1946:	f0101837          	lui	a6,0xf0101
    194a:	feff08b7          	lui	a7,0xfeff0
    194e:	0812                	sll	a6,a6,0x4
    1950:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedf27>
    1954:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff129>
    1958:	08c2                	sll	a7,a7,0x10
    195a:	0842                	sll	a6,a6,0x10
    195c:	eff88893          	add	a7,a7,-257
    1960:	10180813          	add	a6,a6,257
    1964:	08c2                	sll	a7,a7,0x10
    1966:	083e                	sll	a6,a6,0xf
    1968:	eff88893          	add	a7,a7,-257
    196c:	08080813          	add	a6,a6,128
    1970:	431d                	li	t1,7
    1972:	a029                	j	197c <memchr+0x80>
    1974:	1661                	add	a2,a2,-8
    1976:	07a1                	add	a5,a5,8
    1978:	02c37663          	bgeu	t1,a2,19a4 <memchr+0xa8>
    197c:	6398                	ld	a4,0(a5)
    197e:	8f29                	xor	a4,a4,a0
    1980:	011706b3          	add	a3,a4,a7
    1984:	fff74713          	not	a4,a4
    1988:	8f75                	and	a4,a4,a3
    198a:	01077733          	and	a4,a4,a6
    198e:	d37d                	beqz	a4,1974 <memchr+0x78>
        s = (const void *)w;
    1990:	853e                	mv	a0,a5
    1992:	a019                	j	1998 <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    1994:	0505                	add	a0,a0,1
    1996:	ca01                	beqz	a2,19a6 <memchr+0xaa>
    1998:	00054783          	lbu	a5,0(a0)
    199c:	167d                	add	a2,a2,-1
    199e:	feb79be3          	bne	a5,a1,1994 <memchr+0x98>
    19a2:	8082                	ret
    19a4:	f675                	bnez	a2,1990 <memchr+0x94>
    return n ? (void *)s : 0;
    19a6:	4501                	li	a0,0
}
    19a8:	8082                	ret

00000000000019aa <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19aa:	1101                	add	sp,sp,-32
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
    19ba:	f43ff0ef          	jal	18fc <memchr>
    return p ? p - s : n;
    19be:	c519                	beqz	a0,19cc <strnlen+0x22>
}
    19c0:	60e2                	ld	ra,24(sp)
    19c2:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19c4:	8d05                	sub	a0,a0,s1
}
    19c6:	64a2                	ld	s1,8(sp)
    19c8:	6105                	add	sp,sp,32
    19ca:	8082                	ret
    19cc:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19ce:	8522                	mv	a0,s0
}
    19d0:	6442                	ld	s0,16(sp)
    19d2:	64a2                	ld	s1,8(sp)
    19d4:	6105                	add	sp,sp,32
    19d6:	8082                	ret

00000000000019d8 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19d8:	00b547b3          	xor	a5,a0,a1
    19dc:	8b9d                	and	a5,a5,7
    19de:	efb1                	bnez	a5,1a3a <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19e0:	0075f793          	and	a5,a1,7
    19e4:	ebb5                	bnez	a5,1a58 <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19e6:	feff0637          	lui	a2,0xfeff0
    19ea:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedf27>
    19ee:	f01016b7          	lui	a3,0xf0101
    19f2:	0642                	sll	a2,a2,0x10
    19f4:	0692                	sll	a3,a3,0x4
    19f6:	6198                	ld	a4,0(a1)
    19f8:	eff60613          	add	a2,a2,-257
    19fc:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff129>
    1a00:	0642                	sll	a2,a2,0x10
    1a02:	06c2                	sll	a3,a3,0x10
    1a04:	eff60613          	add	a2,a2,-257
    1a08:	10168693          	add	a3,a3,257
    1a0c:	00c707b3          	add	a5,a4,a2
    1a10:	fff74813          	not	a6,a4
    1a14:	06be                	sll	a3,a3,0xf
    1a16:	0107f7b3          	and	a5,a5,a6
    1a1a:	08068693          	add	a3,a3,128
    1a1e:	8ff5                	and	a5,a5,a3
    1a20:	ef89                	bnez	a5,1a3a <strcpy+0x62>
    1a22:	05a1                	add	a1,a1,8
    1a24:	e118                	sd	a4,0(a0)
    1a26:	6198                	ld	a4,0(a1)
    1a28:	0521                	add	a0,a0,8
    1a2a:	00c707b3          	add	a5,a4,a2
    1a2e:	fff74813          	not	a6,a4
    1a32:	0107f7b3          	and	a5,a5,a6
    1a36:	8ff5                	and	a5,a5,a3
    1a38:	d7ed                	beqz	a5,1a22 <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a3a:	0005c783          	lbu	a5,0(a1)
    1a3e:	00f50023          	sb	a5,0(a0)
    1a42:	c785                	beqz	a5,1a6a <strcpy+0x92>
    1a44:	0015c783          	lbu	a5,1(a1)
    1a48:	0505                	add	a0,a0,1
    1a4a:	0585                	add	a1,a1,1
    1a4c:	00f50023          	sb	a5,0(a0)
    1a50:	fbf5                	bnez	a5,1a44 <strcpy+0x6c>
        ;
    return d;
}
    1a52:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a54:	0505                	add	a0,a0,1
    1a56:	db41                	beqz	a4,19e6 <strcpy+0xe>
            if (!(*d = *s))
    1a58:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a5c:	0585                	add	a1,a1,1
    1a5e:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a62:	00f50023          	sb	a5,0(a0)
    1a66:	f7fd                	bnez	a5,1a54 <strcpy+0x7c>
}
    1a68:	8082                	ret
    1a6a:	8082                	ret

0000000000001a6c <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a6c:	00b547b3          	xor	a5,a0,a1
    1a70:	8b9d                	and	a5,a5,7
    1a72:	efbd                	bnez	a5,1af0 <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a74:	0075f793          	and	a5,a1,7
    1a78:	1c078563          	beqz	a5,1c42 <strncpy+0x1d6>
    1a7c:	ea11                	bnez	a2,1a90 <strncpy+0x24>
    1a7e:	8082                	ret
    1a80:	0585                	add	a1,a1,1
    1a82:	0075f793          	and	a5,a1,7
    1a86:	167d                	add	a2,a2,-1
    1a88:	0505                	add	a0,a0,1
    1a8a:	1a078c63          	beqz	a5,1c42 <strncpy+0x1d6>
    1a8e:	ca3d                	beqz	a2,1b04 <strncpy+0x98>
    1a90:	0005c783          	lbu	a5,0(a1)
    1a94:	00f50023          	sb	a5,0(a0)
    1a98:	f7e5                	bnez	a5,1a80 <strncpy+0x14>
            ;
        if (!n || !*s)
    1a9a:	0005c783          	lbu	a5,0(a1)
    1a9e:	c7a5                	beqz	a5,1b06 <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1aa0:	479d                	li	a5,7
    1aa2:	04c7f863          	bgeu	a5,a2,1af2 <strncpy+0x86>
    1aa6:	f01016b7          	lui	a3,0xf0101
    1aaa:	feff0837          	lui	a6,0xfeff0
    1aae:	0692                	sll	a3,a3,0x4
    1ab0:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedf27>
    1ab4:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff129>
    1ab8:	0842                	sll	a6,a6,0x10
    1aba:	06c2                	sll	a3,a3,0x10
    1abc:	eff80813          	add	a6,a6,-257
    1ac0:	10168693          	add	a3,a3,257
    1ac4:	0842                	sll	a6,a6,0x10
    1ac6:	06be                	sll	a3,a3,0xf
    1ac8:	eff80813          	add	a6,a6,-257
    1acc:	08068693          	add	a3,a3,128
    1ad0:	431d                	li	t1,7
    1ad2:	6198                	ld	a4,0(a1)
    1ad4:	010707b3          	add	a5,a4,a6
    1ad8:	fff74893          	not	a7,a4
    1adc:	0117f7b3          	and	a5,a5,a7
    1ae0:	8ff5                	and	a5,a5,a3
    1ae2:	eb81                	bnez	a5,1af2 <strncpy+0x86>
            *wd = *ws;
    1ae4:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ae6:	1661                	add	a2,a2,-8
    1ae8:	05a1                	add	a1,a1,8
    1aea:	0521                	add	a0,a0,8
    1aec:	fec363e3          	bltu	t1,a2,1ad2 <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1af0:	ca11                	beqz	a2,1b04 <strncpy+0x98>
    1af2:	0005c783          	lbu	a5,0(a1)
    1af6:	0585                	add	a1,a1,1
    1af8:	00f50023          	sb	a5,0(a0)
    1afc:	c789                	beqz	a5,1b06 <strncpy+0x9a>
    1afe:	167d                	add	a2,a2,-1
    1b00:	0505                	add	a0,a0,1
    1b02:	fa65                	bnez	a2,1af2 <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b04:	8082                	ret
    1b06:	40a00733          	neg	a4,a0
    1b0a:	00777793          	and	a5,a4,7
    1b0e:	00778693          	add	a3,a5,7
    1b12:	482d                	li	a6,11
    1b14:	fff60593          	add	a1,a2,-1
    1b18:	1106ef63          	bltu	a3,a6,1c36 <strncpy+0x1ca>
    1b1c:	12d5ee63          	bltu	a1,a3,1c58 <strncpy+0x1ec>
    1b20:	12078563          	beqz	a5,1c4a <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b24:	00050023          	sb	zero,0(a0)
    1b28:	00677693          	and	a3,a4,6
    1b2c:	12068263          	beqz	a3,1c50 <strncpy+0x1e4>
    1b30:	000500a3          	sb	zero,1(a0)
    1b34:	4689                	li	a3,2
    1b36:	12f6f463          	bgeu	a3,a5,1c5e <strncpy+0x1f2>
    1b3a:	00050123          	sb	zero,2(a0)
    1b3e:	8b11                	and	a4,a4,4
    1b40:	cf6d                	beqz	a4,1c3a <strncpy+0x1ce>
    1b42:	000501a3          	sb	zero,3(a0)
    1b46:	4711                	li	a4,4
    1b48:	00450693          	add	a3,a0,4
    1b4c:	02f77363          	bgeu	a4,a5,1b72 <strncpy+0x106>
    1b50:	00050223          	sb	zero,4(a0)
    1b54:	4715                	li	a4,5
    1b56:	00550693          	add	a3,a0,5
    1b5a:	00e78c63          	beq	a5,a4,1b72 <strncpy+0x106>
    1b5e:	000502a3          	sb	zero,5(a0)
    1b62:	471d                	li	a4,7
    1b64:	10e79163          	bne	a5,a4,1c66 <strncpy+0x1fa>
    1b68:	00750693          	add	a3,a0,7
    1b6c:	00050323          	sb	zero,6(a0)
    1b70:	471d                	li	a4,7
    1b72:	40f608b3          	sub	a7,a2,a5
    1b76:	ff88f813          	and	a6,a7,-8
    1b7a:	97aa                	add	a5,a5,a0
    1b7c:	010785b3          	add	a1,a5,a6
    1b80:	0007b023          	sd	zero,0(a5)
    1b84:	07a1                	add	a5,a5,8
    1b86:	feb79de3          	bne	a5,a1,1b80 <strncpy+0x114>
    1b8a:	00e807bb          	addw	a5,a6,a4
    1b8e:	01068733          	add	a4,a3,a6
    1b92:	0b088b63          	beq	a7,a6,1c48 <strncpy+0x1dc>
    1b96:	00070023          	sb	zero,0(a4)
    1b9a:	0017869b          	addw	a3,a5,1
    1b9e:	f6c6f3e3          	bgeu	a3,a2,1b04 <strncpy+0x98>
    1ba2:	000700a3          	sb	zero,1(a4)
    1ba6:	0027869b          	addw	a3,a5,2
    1baa:	f4c6fde3          	bgeu	a3,a2,1b04 <strncpy+0x98>
    1bae:	00070123          	sb	zero,2(a4)
    1bb2:	0037869b          	addw	a3,a5,3
    1bb6:	f4c6f7e3          	bgeu	a3,a2,1b04 <strncpy+0x98>
    1bba:	000701a3          	sb	zero,3(a4)
    1bbe:	0047869b          	addw	a3,a5,4
    1bc2:	f4c6f1e3          	bgeu	a3,a2,1b04 <strncpy+0x98>
    1bc6:	00070223          	sb	zero,4(a4)
    1bca:	0057869b          	addw	a3,a5,5
    1bce:	f2c6fbe3          	bgeu	a3,a2,1b04 <strncpy+0x98>
    1bd2:	000702a3          	sb	zero,5(a4)
    1bd6:	0067869b          	addw	a3,a5,6
    1bda:	f2c6f5e3          	bgeu	a3,a2,1b04 <strncpy+0x98>
    1bde:	00070323          	sb	zero,6(a4)
    1be2:	0077869b          	addw	a3,a5,7
    1be6:	f0c6ffe3          	bgeu	a3,a2,1b04 <strncpy+0x98>
    1bea:	000703a3          	sb	zero,7(a4)
    1bee:	0087869b          	addw	a3,a5,8
    1bf2:	f0c6f9e3          	bgeu	a3,a2,1b04 <strncpy+0x98>
    1bf6:	00070423          	sb	zero,8(a4)
    1bfa:	0097869b          	addw	a3,a5,9
    1bfe:	f0c6f3e3          	bgeu	a3,a2,1b04 <strncpy+0x98>
    1c02:	000704a3          	sb	zero,9(a4)
    1c06:	00a7869b          	addw	a3,a5,10
    1c0a:	eec6fde3          	bgeu	a3,a2,1b04 <strncpy+0x98>
    1c0e:	00070523          	sb	zero,10(a4)
    1c12:	00b7869b          	addw	a3,a5,11
    1c16:	eec6f7e3          	bgeu	a3,a2,1b04 <strncpy+0x98>
    1c1a:	000705a3          	sb	zero,11(a4)
    1c1e:	00c7869b          	addw	a3,a5,12
    1c22:	eec6f1e3          	bgeu	a3,a2,1b04 <strncpy+0x98>
    1c26:	00070623          	sb	zero,12(a4)
    1c2a:	27b5                	addw	a5,a5,13
    1c2c:	ecc7fce3          	bgeu	a5,a2,1b04 <strncpy+0x98>
    1c30:	000706a3          	sb	zero,13(a4)
}
    1c34:	8082                	ret
    1c36:	46ad                	li	a3,11
    1c38:	b5d5                	j	1b1c <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c3a:	00350693          	add	a3,a0,3
    1c3e:	470d                	li	a4,3
    1c40:	bf0d                	j	1b72 <strncpy+0x106>
        if (!n || !*s)
    1c42:	e4061ce3          	bnez	a2,1a9a <strncpy+0x2e>
}
    1c46:	8082                	ret
    1c48:	8082                	ret
    char *p = dest;
    1c4a:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c4c:	4701                	li	a4,0
    1c4e:	b715                	j	1b72 <strncpy+0x106>
    1c50:	00150693          	add	a3,a0,1
    1c54:	4705                	li	a4,1
    1c56:	bf31                	j	1b72 <strncpy+0x106>
    char *p = dest;
    1c58:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c5a:	4781                	li	a5,0
    1c5c:	bf2d                	j	1b96 <strncpy+0x12a>
    1c5e:	00250693          	add	a3,a0,2
    1c62:	4709                	li	a4,2
    1c64:	b739                	j	1b72 <strncpy+0x106>
    1c66:	00650693          	add	a3,a0,6
    1c6a:	4719                	li	a4,6
    1c6c:	b719                	j	1b72 <strncpy+0x106>

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
    1d38:	1141                	add	sp,sp,-16
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
    1d5e:	0141                	add	sp,sp,16
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
    1d7e:	1141                	add	sp,sp,-16
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
    1d94:	0141                	add	sp,sp,16
    1d96:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d98:	4502                	lw	a0,0(sp)
}
    1d9a:	0141                	add	sp,sp,16
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
    1e04:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e06:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e0a:	9301                	srl	a4,a4,0x20
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
    1e14:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e16:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e1a:	9201                	srl	a2,a2,0x20
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
    1e84:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e86:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e8a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e8e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e90:	9201                	srl	a2,a2,0x20
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
    1ee4:	15c1                	add	a1,a1,-16
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
