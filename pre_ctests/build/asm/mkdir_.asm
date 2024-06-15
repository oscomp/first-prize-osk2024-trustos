
/root/oskernel2024-trustos/pre_ctests/build/riscv64/mkdir_:     file format elf64-littleriscv


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
    1004:	1141                	add	sp,sp,-16
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f1a50513          	add	a0,a0,-230 # 1f20 <__clone+0x2e>
void test_mkdir(void){
    100e:	e406                	sd	ra,8(sp)
    1010:	e022                	sd	s0,0(sp)
    TEST_START(__func__);
    1012:	2f6000ef          	jal	1308 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	fb250513          	add	a0,a0,-78 # 1fc8 <__func__.0>
    101e:	2ea000ef          	jal	1308 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	f1650513          	add	a0,a0,-234 # 1f38 <__clone+0x46>
    102a:	2de000ef          	jal	1308 <puts>
    int rt, fd;

    rt = mkdir("test_mkdir", 0666);
    102e:	1b600593          	li	a1,438
    1032:	00001517          	auipc	a0,0x1
    1036:	f1650513          	add	a0,a0,-234 # 1f48 <__clone+0x56>
    103a:	655000ef          	jal	1e8e <mkdir>
    printf("mkdir ret: %d\n", rt);
    103e:	85aa                	mv	a1,a0
    rt = mkdir("test_mkdir", 0666);
    1040:	842a                	mv	s0,a0
    printf("mkdir ret: %d\n", rt);
    1042:	00001517          	auipc	a0,0x1
    1046:	f1650513          	add	a0,a0,-234 # 1f58 <__clone+0x66>
    104a:	2e0000ef          	jal	132a <printf>
    assert(rt != -1);
    104e:	57fd                	li	a5,-1
    1050:	06f40163          	beq	s0,a5,10b2 <test_mkdir+0xae>
    fd = open("test_mkdir", O_RDONLY | O_DIRECTORY);
    1054:	002005b7          	lui	a1,0x200
    1058:	00001517          	auipc	a0,0x1
    105c:	ef050513          	add	a0,a0,-272 # 1f48 <__clone+0x56>
    1060:	413000ef          	jal	1c72 <open>
    1064:	842a                	mv	s0,a0
    if(fd > 0){
    1066:	02a05f63          	blez	a0,10a4 <test_mkdir+0xa0>
        printf("  mkdir success.\n");
    106a:	00001517          	auipc	a0,0x1
    106e:	f1e50513          	add	a0,a0,-226 # 1f88 <__clone+0x96>
    1072:	2b8000ef          	jal	132a <printf>
        close(fd);
    1076:	8522                	mv	a0,s0
    1078:	42d000ef          	jal	1ca4 <close>
    }
    else printf("  mkdir error.\n");
    TEST_END(__func__);
    107c:	00001517          	auipc	a0,0x1
    1080:	f3450513          	add	a0,a0,-204 # 1fb0 <__clone+0xbe>
    1084:	284000ef          	jal	1308 <puts>
    1088:	00001517          	auipc	a0,0x1
    108c:	f4050513          	add	a0,a0,-192 # 1fc8 <__func__.0>
    1090:	278000ef          	jal	1308 <puts>
}
    1094:	6402                	ld	s0,0(sp)
    1096:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    1098:	00001517          	auipc	a0,0x1
    109c:	ea050513          	add	a0,a0,-352 # 1f38 <__clone+0x46>
}
    10a0:	0141                	add	sp,sp,16
    TEST_END(__func__);
    10a2:	a49d                	j	1308 <puts>
    else printf("  mkdir error.\n");
    10a4:	00001517          	auipc	a0,0x1
    10a8:	efc50513          	add	a0,a0,-260 # 1fa0 <__clone+0xae>
    10ac:	27e000ef          	jal	132a <printf>
    10b0:	b7f1                	j	107c <test_mkdir+0x78>
    assert(rt != -1);
    10b2:	00001517          	auipc	a0,0x1
    10b6:	eb650513          	add	a0,a0,-330 # 1f68 <__clone+0x76>
    10ba:	4ee000ef          	jal	15a8 <panic>
    10be:	bf59                	j	1054 <test_mkdir+0x50>

00000000000010c0 <main>:

int main(void){
    10c0:	1141                	add	sp,sp,-16
    10c2:	e406                	sd	ra,8(sp)
    test_mkdir();
    10c4:	f41ff0ef          	jal	1004 <test_mkdir>
    return 0;
}
    10c8:	60a2                	ld	ra,8(sp)
    10ca:	4501                	li	a0,0
    10cc:	0141                	add	sp,sp,16
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
    10d4:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10d6:	05a1                	add	a1,a1,8 # 200008 <digits+0x1fe030>
{
    10d8:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10da:	fe7ff0ef          	jal	10c0 <main>
    10de:	42d000ef          	jal	1d0a <exit>
	return 0;
}
    10e2:	60a2                	ld	ra,8(sp)
    10e4:	4501                	li	a0,0
    10e6:	0141                	add	sp,sp,16
    10e8:	8082                	ret

00000000000010ea <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10ea:	7179                	add	sp,sp,-48
    10ec:	f406                	sd	ra,40(sp)
    10ee:	0005081b          	sext.w	a6,a0
    10f2:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10f4:	00055563          	bgez	a0,10fe <printint.constprop.0+0x14>
        x = -xx;
    10f8:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    10fc:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10fe:	02b8763b          	remuw	a2,a6,a1
    1102:	00001697          	auipc	a3,0x1
    1106:	ed668693          	add	a3,a3,-298 # 1fd8 <digits>
    buf[16] = 0;
    110a:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    110e:	0005871b          	sext.w	a4,a1
    1112:	1602                	sll	a2,a2,0x20
    1114:	9201                	srl	a2,a2,0x20
    1116:	9636                	add	a2,a2,a3
    1118:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    111c:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    1120:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1124:	10b86c63          	bltu	a6,a1,123c <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    1128:	02e5763b          	remuw	a2,a0,a4
    112c:	1602                	sll	a2,a2,0x20
    112e:	9201                	srl	a2,a2,0x20
    1130:	9636                	add	a2,a2,a3
    1132:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1136:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    113a:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    113e:	10e56863          	bltu	a0,a4,124e <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    1142:	02e5f63b          	remuw	a2,a1,a4
    1146:	1602                	sll	a2,a2,0x20
    1148:	9201                	srl	a2,a2,0x20
    114a:	9636                	add	a2,a2,a3
    114c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1150:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1154:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1158:	10e5e463          	bltu	a1,a4,1260 <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    115c:	02e5763b          	remuw	a2,a0,a4
    1160:	1602                	sll	a2,a2,0x20
    1162:	9201                	srl	a2,a2,0x20
    1164:	9636                	add	a2,a2,a3
    1166:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    116a:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    116e:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1172:	10e56063          	bltu	a0,a4,1272 <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    1176:	02e5f63b          	remuw	a2,a1,a4
    117a:	1602                	sll	a2,a2,0x20
    117c:	9201                	srl	a2,a2,0x20
    117e:	9636                	add	a2,a2,a3
    1180:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1184:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1188:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    118c:	0ee5ec63          	bltu	a1,a4,1284 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    1190:	02e5763b          	remuw	a2,a0,a4
    1194:	1602                	sll	a2,a2,0x20
    1196:	9201                	srl	a2,a2,0x20
    1198:	9636                	add	a2,a2,a3
    119a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    119e:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11a2:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11a6:	08e56263          	bltu	a0,a4,122a <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    11aa:	02e5f63b          	remuw	a2,a1,a4
    11ae:	1602                	sll	a2,a2,0x20
    11b0:	9201                	srl	a2,a2,0x20
    11b2:	9636                	add	a2,a2,a3
    11b4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b8:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11bc:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11c0:	0ce5eb63          	bltu	a1,a4,1296 <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    11c4:	02e5763b          	remuw	a2,a0,a4
    11c8:	1602                	sll	a2,a2,0x20
    11ca:	9201                	srl	a2,a2,0x20
    11cc:	9636                	add	a2,a2,a3
    11ce:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11d2:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11d6:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11da:	0ce56763          	bltu	a0,a4,12a8 <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    11de:	02e5f63b          	remuw	a2,a1,a4
    11e2:	1602                	sll	a2,a2,0x20
    11e4:	9201                	srl	a2,a2,0x20
    11e6:	9636                	add	a2,a2,a3
    11e8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ec:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11f0:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11f4:	0ce5e363          	bltu	a1,a4,12ba <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    11f8:	1782                	sll	a5,a5,0x20
    11fa:	9381                	srl	a5,a5,0x20
    11fc:	96be                	add	a3,a3,a5
    11fe:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    1202:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    1204:	00f10723          	sb	a5,14(sp)
    if (sign)
    1208:	00088763          	beqz	a7,1216 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    120c:	02d00793          	li	a5,45
    1210:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1214:	4595                	li	a1,5
    write(f, s, l);
    1216:	003c                	add	a5,sp,8
    1218:	4641                	li	a2,16
    121a:	9e0d                	subw	a2,a2,a1
    121c:	4505                	li	a0,1
    121e:	95be                	add	a1,a1,a5
    1220:	29b000ef          	jal	1cba <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1224:	70a2                	ld	ra,40(sp)
    1226:	6145                	add	sp,sp,48
    1228:	8082                	ret
    i++;
    122a:	45a9                	li	a1,10
    if (sign)
    122c:	fe0885e3          	beqz	a7,1216 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1230:	02d00793          	li	a5,45
    1234:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1238:	45a5                	li	a1,9
    123a:	bff1                	j	1216 <printint.constprop.0+0x12c>
    i++;
    123c:	45bd                	li	a1,15
    if (sign)
    123e:	fc088ce3          	beqz	a7,1216 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1242:	02d00793          	li	a5,45
    1246:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    124a:	45b9                	li	a1,14
    124c:	b7e9                	j	1216 <printint.constprop.0+0x12c>
    i++;
    124e:	45b9                	li	a1,14
    if (sign)
    1250:	fc0883e3          	beqz	a7,1216 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1254:	02d00793          	li	a5,45
    1258:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    125c:	45b5                	li	a1,13
    125e:	bf65                	j	1216 <printint.constprop.0+0x12c>
    i++;
    1260:	45b5                	li	a1,13
    if (sign)
    1262:	fa088ae3          	beqz	a7,1216 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1266:	02d00793          	li	a5,45
    126a:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    126e:	45b1                	li	a1,12
    1270:	b75d                	j	1216 <printint.constprop.0+0x12c>
    i++;
    1272:	45b1                	li	a1,12
    if (sign)
    1274:	fa0881e3          	beqz	a7,1216 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1278:	02d00793          	li	a5,45
    127c:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1280:	45ad                	li	a1,11
    1282:	bf51                	j	1216 <printint.constprop.0+0x12c>
    i++;
    1284:	45ad                	li	a1,11
    if (sign)
    1286:	f80888e3          	beqz	a7,1216 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    128a:	02d00793          	li	a5,45
    128e:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1292:	45a9                	li	a1,10
    1294:	b749                	j	1216 <printint.constprop.0+0x12c>
    i++;
    1296:	45a5                	li	a1,9
    if (sign)
    1298:	f6088fe3          	beqz	a7,1216 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    129c:	02d00793          	li	a5,45
    12a0:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12a4:	45a1                	li	a1,8
    12a6:	bf85                	j	1216 <printint.constprop.0+0x12c>
    i++;
    12a8:	45a1                	li	a1,8
    if (sign)
    12aa:	f60886e3          	beqz	a7,1216 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12ae:	02d00793          	li	a5,45
    12b2:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12b6:	459d                	li	a1,7
    12b8:	bfb9                	j	1216 <printint.constprop.0+0x12c>
    i++;
    12ba:	459d                	li	a1,7
    if (sign)
    12bc:	f4088de3          	beqz	a7,1216 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12c0:	02d00793          	li	a5,45
    12c4:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12c8:	4599                	li	a1,6
    12ca:	b7b1                	j	1216 <printint.constprop.0+0x12c>

00000000000012cc <getchar>:
{
    12cc:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12ce:	00f10593          	add	a1,sp,15
    12d2:	4605                	li	a2,1
    12d4:	4501                	li	a0,0
{
    12d6:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12d8:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12dc:	1d5000ef          	jal	1cb0 <read>
}
    12e0:	60e2                	ld	ra,24(sp)
    12e2:	00f14503          	lbu	a0,15(sp)
    12e6:	6105                	add	sp,sp,32
    12e8:	8082                	ret

00000000000012ea <putchar>:
{
    12ea:	1101                	add	sp,sp,-32
    12ec:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12ee:	00f10593          	add	a1,sp,15
    12f2:	4605                	li	a2,1
    12f4:	4505                	li	a0,1
{
    12f6:	ec06                	sd	ra,24(sp)
    char byte = c;
    12f8:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12fc:	1bf000ef          	jal	1cba <write>
}
    1300:	60e2                	ld	ra,24(sp)
    1302:	2501                	sext.w	a0,a0
    1304:	6105                	add	sp,sp,32
    1306:	8082                	ret

0000000000001308 <puts>:
{
    1308:	1141                	add	sp,sp,-16
    130a:	e406                	sd	ra,8(sp)
    130c:	e022                	sd	s0,0(sp)
    130e:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1310:	56c000ef          	jal	187c <strlen>
    1314:	862a                	mv	a2,a0
    1316:	85a2                	mv	a1,s0
    1318:	4505                	li	a0,1
    131a:	1a1000ef          	jal	1cba <write>
}
    131e:	60a2                	ld	ra,8(sp)
    1320:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1322:	957d                	sra	a0,a0,0x3f
    return r;
    1324:	2501                	sext.w	a0,a0
}
    1326:	0141                	add	sp,sp,16
    1328:	8082                	ret

000000000000132a <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    132a:	7131                	add	sp,sp,-192
    132c:	e4d6                	sd	s5,72(sp)
    132e:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    1330:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1332:	013c                	add	a5,sp,136
{
    1334:	f0ca                	sd	s2,96(sp)
    1336:	ecce                	sd	s3,88(sp)
    1338:	e8d2                	sd	s4,80(sp)
    133a:	e0da                	sd	s6,64(sp)
    133c:	fc5e                	sd	s7,56(sp)
    133e:	fc86                	sd	ra,120(sp)
    1340:	f8a2                	sd	s0,112(sp)
    1342:	f4a6                	sd	s1,104(sp)
    1344:	e52e                	sd	a1,136(sp)
    1346:	e932                	sd	a2,144(sp)
    1348:	ed36                	sd	a3,152(sp)
    134a:	f13a                	sd	a4,160(sp)
    134c:	f942                	sd	a6,176(sp)
    134e:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1350:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1352:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1356:	07300a13          	li	s4,115
    135a:	07800b93          	li	s7,120
    135e:	06400b13          	li	s6,100
    buf[i++] = '0';
    1362:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x5858>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1366:	00001997          	auipc	s3,0x1
    136a:	c7298993          	add	s3,s3,-910 # 1fd8 <digits>
        if (!*s)
    136e:	00054783          	lbu	a5,0(a0)
    1372:	16078863          	beqz	a5,14e2 <printf+0x1b8>
    1376:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1378:	19278063          	beq	a5,s2,14f8 <printf+0x1ce>
    137c:	00164783          	lbu	a5,1(a2)
    1380:	0605                	add	a2,a2,1
    1382:	fbfd                	bnez	a5,1378 <printf+0x4e>
    1384:	84b2                	mv	s1,a2
        l = z - a;
    1386:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    138a:	85aa                	mv	a1,a0
    138c:	8622                	mv	a2,s0
    138e:	4505                	li	a0,1
    1390:	12b000ef          	jal	1cba <write>
        if (l)
    1394:	18041763          	bnez	s0,1522 <printf+0x1f8>
        if (s[1] == 0)
    1398:	0014c783          	lbu	a5,1(s1)
    139c:	14078363          	beqz	a5,14e2 <printf+0x1b8>
        switch (s[1])
    13a0:	19478f63          	beq	a5,s4,153e <printf+0x214>
    13a4:	18fa6163          	bltu	s4,a5,1526 <printf+0x1fc>
    13a8:	1b678e63          	beq	a5,s6,1564 <printf+0x23a>
    13ac:	07000713          	li	a4,112
    13b0:	1ce79463          	bne	a5,a4,1578 <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13b4:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13b6:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13ba:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13bc:	631c                	ld	a5,0(a4)
    13be:	0721                	add	a4,a4,8
    13c0:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13c2:	00479293          	sll	t0,a5,0x4
    13c6:	00879f93          	sll	t6,a5,0x8
    13ca:	00c79f13          	sll	t5,a5,0xc
    13ce:	01079e93          	sll	t4,a5,0x10
    13d2:	01479e13          	sll	t3,a5,0x14
    13d6:	01879313          	sll	t1,a5,0x18
    13da:	01c79893          	sll	a7,a5,0x1c
    13de:	02479813          	sll	a6,a5,0x24
    13e2:	02879513          	sll	a0,a5,0x28
    13e6:	02c79593          	sll	a1,a5,0x2c
    13ea:	03079693          	sll	a3,a5,0x30
    13ee:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13f2:	03c7d413          	srl	s0,a5,0x3c
    13f6:	01c7d39b          	srlw	t2,a5,0x1c
    13fa:	03c2d293          	srl	t0,t0,0x3c
    13fe:	03cfdf93          	srl	t6,t6,0x3c
    1402:	03cf5f13          	srl	t5,t5,0x3c
    1406:	03cede93          	srl	t4,t4,0x3c
    140a:	03ce5e13          	srl	t3,t3,0x3c
    140e:	03c35313          	srl	t1,t1,0x3c
    1412:	03c8d893          	srl	a7,a7,0x3c
    1416:	03c85813          	srl	a6,a6,0x3c
    141a:	9171                	srl	a0,a0,0x3c
    141c:	91f1                	srl	a1,a1,0x3c
    141e:	92f1                	srl	a3,a3,0x3c
    1420:	9371                	srl	a4,a4,0x3c
    1422:	974e                	add	a4,a4,s3
    1424:	944e                	add	s0,s0,s3
    1426:	92ce                	add	t0,t0,s3
    1428:	9fce                	add	t6,t6,s3
    142a:	9f4e                	add	t5,t5,s3
    142c:	9ece                	add	t4,t4,s3
    142e:	9e4e                	add	t3,t3,s3
    1430:	934e                	add	t1,t1,s3
    1432:	98ce                	add	a7,a7,s3
    1434:	93ce                	add	t2,t2,s3
    1436:	984e                	add	a6,a6,s3
    1438:	954e                	add	a0,a0,s3
    143a:	95ce                	add	a1,a1,s3
    143c:	96ce                	add	a3,a3,s3
    143e:	00074083          	lbu	ra,0(a4)
    1442:	0002c283          	lbu	t0,0(t0)
    1446:	000fcf83          	lbu	t6,0(t6)
    144a:	000f4f03          	lbu	t5,0(t5)
    144e:	000ece83          	lbu	t4,0(t4)
    1452:	000e4e03          	lbu	t3,0(t3)
    1456:	00034303          	lbu	t1,0(t1)
    145a:	0008c883          	lbu	a7,0(a7)
    145e:	0003c383          	lbu	t2,0(t2)
    1462:	00084803          	lbu	a6,0(a6)
    1466:	00054503          	lbu	a0,0(a0)
    146a:	0005c583          	lbu	a1,0(a1)
    146e:	0006c683          	lbu	a3,0(a3)
    1472:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1476:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    147a:	9371                	srl	a4,a4,0x3c
    147c:	8bbd                	and	a5,a5,15
    147e:	974e                	add	a4,a4,s3
    1480:	97ce                	add	a5,a5,s3
    1482:	005105a3          	sb	t0,11(sp)
    1486:	01f10623          	sb	t6,12(sp)
    148a:	01e106a3          	sb	t5,13(sp)
    148e:	01d10723          	sb	t4,14(sp)
    1492:	01c107a3          	sb	t3,15(sp)
    1496:	00610823          	sb	t1,16(sp)
    149a:	011108a3          	sb	a7,17(sp)
    149e:	00710923          	sb	t2,18(sp)
    14a2:	010109a3          	sb	a6,19(sp)
    14a6:	00a10a23          	sb	a0,20(sp)
    14aa:	00b10aa3          	sb	a1,21(sp)
    14ae:	00d10b23          	sb	a3,22(sp)
    14b2:	00110ba3          	sb	ra,23(sp)
    14b6:	00810523          	sb	s0,10(sp)
    14ba:	00074703          	lbu	a4,0(a4)
    14be:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14c2:	002c                	add	a1,sp,8
    14c4:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14c6:	00e10c23          	sb	a4,24(sp)
    14ca:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14ce:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14d2:	7e8000ef          	jal	1cba <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14d6:	00248513          	add	a0,s1,2
        if (!*s)
    14da:	00054783          	lbu	a5,0(a0)
    14de:	e8079ce3          	bnez	a5,1376 <printf+0x4c>
    }
    va_end(ap);
}
    14e2:	70e6                	ld	ra,120(sp)
    14e4:	7446                	ld	s0,112(sp)
    14e6:	74a6                	ld	s1,104(sp)
    14e8:	7906                	ld	s2,96(sp)
    14ea:	69e6                	ld	s3,88(sp)
    14ec:	6a46                	ld	s4,80(sp)
    14ee:	6aa6                	ld	s5,72(sp)
    14f0:	6b06                	ld	s6,64(sp)
    14f2:	7be2                	ld	s7,56(sp)
    14f4:	6129                	add	sp,sp,192
    14f6:	8082                	ret
    14f8:	84b2                	mv	s1,a2
    14fa:	a039                	j	1508 <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14fc:	0024c783          	lbu	a5,2(s1)
    1500:	0605                	add	a2,a2,1
    1502:	0489                	add	s1,s1,2
    1504:	e92791e3          	bne	a5,s2,1386 <printf+0x5c>
    1508:	0014c783          	lbu	a5,1(s1)
    150c:	ff2788e3          	beq	a5,s2,14fc <printf+0x1d2>
        l = z - a;
    1510:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1514:	85aa                	mv	a1,a0
    1516:	8622                	mv	a2,s0
    1518:	4505                	li	a0,1
    151a:	7a0000ef          	jal	1cba <write>
        if (l)
    151e:	e6040de3          	beqz	s0,1398 <printf+0x6e>
    1522:	8526                	mv	a0,s1
    1524:	b5a9                	j	136e <printf+0x44>
        switch (s[1])
    1526:	05779963          	bne	a5,s7,1578 <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    152a:	6782                	ld	a5,0(sp)
    152c:	45c1                	li	a1,16
    152e:	4388                	lw	a0,0(a5)
    1530:	07a1                	add	a5,a5,8
    1532:	e03e                	sd	a5,0(sp)
    1534:	bb7ff0ef          	jal	10ea <printint.constprop.0>
        s += 2;
    1538:	00248513          	add	a0,s1,2
    153c:	bf79                	j	14da <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    153e:	6782                	ld	a5,0(sp)
    1540:	6380                	ld	s0,0(a5)
    1542:	07a1                	add	a5,a5,8
    1544:	e03e                	sd	a5,0(sp)
    1546:	cc21                	beqz	s0,159e <printf+0x274>
            l = strnlen(a, 200);
    1548:	0c800593          	li	a1,200
    154c:	8522                	mv	a0,s0
    154e:	460000ef          	jal	19ae <strnlen>
    write(f, s, l);
    1552:	0005061b          	sext.w	a2,a0
    1556:	85a2                	mv	a1,s0
    1558:	4505                	li	a0,1
    155a:	760000ef          	jal	1cba <write>
        s += 2;
    155e:	00248513          	add	a0,s1,2
    1562:	bfa5                	j	14da <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    1564:	6782                	ld	a5,0(sp)
    1566:	45a9                	li	a1,10
    1568:	4388                	lw	a0,0(a5)
    156a:	07a1                	add	a5,a5,8
    156c:	e03e                	sd	a5,0(sp)
    156e:	b7dff0ef          	jal	10ea <printint.constprop.0>
        s += 2;
    1572:	00248513          	add	a0,s1,2
    1576:	b795                	j	14da <printf+0x1b0>
    return write(stdout, &byte, 1);
    1578:	4605                	li	a2,1
    157a:	002c                	add	a1,sp,8
    157c:	4505                	li	a0,1
    char byte = c;
    157e:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1582:	738000ef          	jal	1cba <write>
    char byte = c;
    1586:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    158a:	4605                	li	a2,1
    158c:	002c                	add	a1,sp,8
    158e:	4505                	li	a0,1
    char byte = c;
    1590:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1594:	726000ef          	jal	1cba <write>
        s += 2;
    1598:	00248513          	add	a0,s1,2
    159c:	bf3d                	j	14da <printf+0x1b0>
                a = "(null)";
    159e:	00001417          	auipc	s0,0x1
    15a2:	a2240413          	add	s0,s0,-1502 # 1fc0 <__clone+0xce>
    15a6:	b74d                	j	1548 <printf+0x21e>

00000000000015a8 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15a8:	1141                	add	sp,sp,-16
    15aa:	e406                	sd	ra,8(sp)
    puts(m);
    15ac:	d5dff0ef          	jal	1308 <puts>
    exit(-100);
}
    15b0:	60a2                	ld	ra,8(sp)
    exit(-100);
    15b2:	f9c00513          	li	a0,-100
}
    15b6:	0141                	add	sp,sp,16
    exit(-100);
    15b8:	af89                	j	1d0a <exit>

00000000000015ba <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ba:	02000793          	li	a5,32
    15be:	00f50663          	beq	a0,a5,15ca <isspace+0x10>
    15c2:	355d                	addw	a0,a0,-9
    15c4:	00553513          	sltiu	a0,a0,5
    15c8:	8082                	ret
    15ca:	4505                	li	a0,1
}
    15cc:	8082                	ret

00000000000015ce <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15ce:	fd05051b          	addw	a0,a0,-48
}
    15d2:	00a53513          	sltiu	a0,a0,10
    15d6:	8082                	ret

00000000000015d8 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d8:	02000713          	li	a4,32
    15dc:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15de:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15e2:	ff76879b          	addw	a5,a3,-9
    15e6:	06e68063          	beq	a3,a4,1646 <atoi+0x6e>
    15ea:	0006859b          	sext.w	a1,a3
    15ee:	04f67c63          	bgeu	a2,a5,1646 <atoi+0x6e>
        s++;
    switch (*s)
    15f2:	02b00793          	li	a5,43
    15f6:	06f68563          	beq	a3,a5,1660 <atoi+0x88>
    15fa:	02d00793          	li	a5,45
    15fe:	04f69663          	bne	a3,a5,164a <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1602:	00154683          	lbu	a3,1(a0)
    1606:	47a5                	li	a5,9
        s++;
    1608:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    160c:	fd06869b          	addw	a3,a3,-48
    1610:	8636                	mv	a2,a3
    while (isdigit(*s))
    1612:	04d7e563          	bltu	a5,a3,165c <atoi+0x84>
        neg = 1;
    1616:	4885                	li	a7,1
    int n = 0, neg = 0;
    1618:	4501                	li	a0,0
    while (isdigit(*s))
    161a:	4825                	li	a6,9
    161c:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1620:	0025179b          	sllw	a5,a0,0x2
    1624:	9fa9                	addw	a5,a5,a0
    1626:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    162a:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    162e:	85b2                	mv	a1,a2
    1630:	40c7853b          	subw	a0,a5,a2
    1634:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    1636:	8636                	mv	a2,a3
    while (isdigit(*s))
    1638:	fed872e3          	bgeu	a6,a3,161c <atoi+0x44>
    return neg ? n : -n;
    163c:	02089163          	bnez	a7,165e <atoi+0x86>
    1640:	40f5853b          	subw	a0,a1,a5
    1644:	8082                	ret
        s++;
    1646:	0505                	add	a0,a0,1
    1648:	bf59                	j	15de <atoi+0x6>
    while (isdigit(*s))
    164a:	fd05859b          	addw	a1,a1,-48
    164e:	47a5                	li	a5,9
    1650:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1652:	4881                	li	a7,0
    1654:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    1658:	fcb7f0e3          	bgeu	a5,a1,1618 <atoi+0x40>
    return neg ? n : -n;
    165c:	4501                	li	a0,0
}
    165e:	8082                	ret
    while (isdigit(*s))
    1660:	00154683          	lbu	a3,1(a0)
    1664:	47a5                	li	a5,9
        s++;
    1666:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    166a:	fd06869b          	addw	a3,a3,-48
    166e:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    1670:	4881                	li	a7,0
    while (isdigit(*s))
    1672:	fad7f3e3          	bgeu	a5,a3,1618 <atoi+0x40>
    return neg ? n : -n;
    1676:	4501                	li	a0,0
    1678:	8082                	ret

000000000000167a <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    167a:	16060f63          	beqz	a2,17f8 <memset+0x17e>
    167e:	40a006b3          	neg	a3,a0
    1682:	0076f793          	and	a5,a3,7
    1686:	00778813          	add	a6,a5,7
    168a:	48ad                	li	a7,11
    168c:	0ff5f713          	zext.b	a4,a1
    1690:	fff60593          	add	a1,a2,-1
    1694:	17186363          	bltu	a6,a7,17fa <memset+0x180>
    1698:	1705eb63          	bltu	a1,a6,180e <memset+0x194>
    169c:	16078163          	beqz	a5,17fe <memset+0x184>
    16a0:	00e50023          	sb	a4,0(a0)
    16a4:	0066f593          	and	a1,a3,6
    16a8:	14058e63          	beqz	a1,1804 <memset+0x18a>
    16ac:	00e500a3          	sb	a4,1(a0)
    16b0:	4589                	li	a1,2
    16b2:	00250813          	add	a6,a0,2
    16b6:	04f5f663          	bgeu	a1,a5,1702 <memset+0x88>
    16ba:	00e50123          	sb	a4,2(a0)
    16be:	8a91                	and	a3,a3,4
    16c0:	00350813          	add	a6,a0,3
    16c4:	458d                	li	a1,3
    16c6:	ce95                	beqz	a3,1702 <memset+0x88>
    16c8:	00e501a3          	sb	a4,3(a0)
    16cc:	4691                	li	a3,4
    16ce:	00450813          	add	a6,a0,4
    16d2:	4591                	li	a1,4
    16d4:	02f6f763          	bgeu	a3,a5,1702 <memset+0x88>
    16d8:	00e50223          	sb	a4,4(a0)
    16dc:	4695                	li	a3,5
    16de:	00550813          	add	a6,a0,5
    16e2:	4595                	li	a1,5
    16e4:	00d78f63          	beq	a5,a3,1702 <memset+0x88>
    16e8:	00e502a3          	sb	a4,5(a0)
    16ec:	469d                	li	a3,7
    16ee:	00650813          	add	a6,a0,6
    16f2:	4599                	li	a1,6
    16f4:	00d79763          	bne	a5,a3,1702 <memset+0x88>
    16f8:	00750813          	add	a6,a0,7
    16fc:	00e50323          	sb	a4,6(a0)
    1700:	459d                	li	a1,7
    1702:	00871693          	sll	a3,a4,0x8
    1706:	01071313          	sll	t1,a4,0x10
    170a:	8ed9                	or	a3,a3,a4
    170c:	01871893          	sll	a7,a4,0x18
    1710:	0066e6b3          	or	a3,a3,t1
    1714:	0116e6b3          	or	a3,a3,a7
    1718:	02071313          	sll	t1,a4,0x20
    171c:	02871893          	sll	a7,a4,0x28
    1720:	0066e6b3          	or	a3,a3,t1
    1724:	40f60e33          	sub	t3,a2,a5
    1728:	03071313          	sll	t1,a4,0x30
    172c:	0116e6b3          	or	a3,a3,a7
    1730:	0066e6b3          	or	a3,a3,t1
    1734:	03871893          	sll	a7,a4,0x38
    1738:	97aa                	add	a5,a5,a0
    173a:	ff8e7313          	and	t1,t3,-8
    173e:	0116e6b3          	or	a3,a3,a7
    1742:	00f308b3          	add	a7,t1,a5
    1746:	e394                	sd	a3,0(a5)
    1748:	07a1                	add	a5,a5,8
    174a:	ff179ee3          	bne	a5,a7,1746 <memset+0xcc>
    174e:	006806b3          	add	a3,a6,t1
    1752:	00b307bb          	addw	a5,t1,a1
    1756:	0bc30b63          	beq	t1,t3,180c <memset+0x192>
    175a:	00e68023          	sb	a4,0(a3)
    175e:	0017859b          	addw	a1,a5,1
    1762:	08c5fb63          	bgeu	a1,a2,17f8 <memset+0x17e>
    1766:	00e680a3          	sb	a4,1(a3)
    176a:	0027859b          	addw	a1,a5,2
    176e:	08c5f563          	bgeu	a1,a2,17f8 <memset+0x17e>
    1772:	00e68123          	sb	a4,2(a3)
    1776:	0037859b          	addw	a1,a5,3
    177a:	06c5ff63          	bgeu	a1,a2,17f8 <memset+0x17e>
    177e:	00e681a3          	sb	a4,3(a3)
    1782:	0047859b          	addw	a1,a5,4
    1786:	06c5f963          	bgeu	a1,a2,17f8 <memset+0x17e>
    178a:	00e68223          	sb	a4,4(a3)
    178e:	0057859b          	addw	a1,a5,5
    1792:	06c5f363          	bgeu	a1,a2,17f8 <memset+0x17e>
    1796:	00e682a3          	sb	a4,5(a3)
    179a:	0067859b          	addw	a1,a5,6
    179e:	04c5fd63          	bgeu	a1,a2,17f8 <memset+0x17e>
    17a2:	00e68323          	sb	a4,6(a3)
    17a6:	0077859b          	addw	a1,a5,7
    17aa:	04c5f763          	bgeu	a1,a2,17f8 <memset+0x17e>
    17ae:	00e683a3          	sb	a4,7(a3)
    17b2:	0087859b          	addw	a1,a5,8
    17b6:	04c5f163          	bgeu	a1,a2,17f8 <memset+0x17e>
    17ba:	00e68423          	sb	a4,8(a3)
    17be:	0097859b          	addw	a1,a5,9
    17c2:	02c5fb63          	bgeu	a1,a2,17f8 <memset+0x17e>
    17c6:	00e684a3          	sb	a4,9(a3)
    17ca:	00a7859b          	addw	a1,a5,10
    17ce:	02c5f563          	bgeu	a1,a2,17f8 <memset+0x17e>
    17d2:	00e68523          	sb	a4,10(a3)
    17d6:	00b7859b          	addw	a1,a5,11
    17da:	00c5ff63          	bgeu	a1,a2,17f8 <memset+0x17e>
    17de:	00e685a3          	sb	a4,11(a3)
    17e2:	00c7859b          	addw	a1,a5,12
    17e6:	00c5f963          	bgeu	a1,a2,17f8 <memset+0x17e>
    17ea:	00e68623          	sb	a4,12(a3)
    17ee:	27b5                	addw	a5,a5,13
    17f0:	00c7f463          	bgeu	a5,a2,17f8 <memset+0x17e>
    17f4:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17f8:	8082                	ret
    17fa:	482d                	li	a6,11
    17fc:	bd71                	j	1698 <memset+0x1e>
    char *p = dest;
    17fe:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1800:	4581                	li	a1,0
    1802:	b701                	j	1702 <memset+0x88>
    1804:	00150813          	add	a6,a0,1
    1808:	4585                	li	a1,1
    180a:	bde5                	j	1702 <memset+0x88>
    180c:	8082                	ret
    char *p = dest;
    180e:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1810:	4781                	li	a5,0
    1812:	b7a1                	j	175a <memset+0xe0>

0000000000001814 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1814:	00054783          	lbu	a5,0(a0)
    1818:	0005c703          	lbu	a4,0(a1)
    181c:	00e79863          	bne	a5,a4,182c <strcmp+0x18>
    1820:	0505                	add	a0,a0,1
    1822:	0585                	add	a1,a1,1
    1824:	fbe5                	bnez	a5,1814 <strcmp>
    1826:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1828:	9d19                	subw	a0,a0,a4
    182a:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    182c:	0007851b          	sext.w	a0,a5
    1830:	bfe5                	j	1828 <strcmp+0x14>

0000000000001832 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1832:	ca15                	beqz	a2,1866 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1834:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1838:	167d                	add	a2,a2,-1
    183a:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    183e:	eb99                	bnez	a5,1854 <strncmp+0x22>
    1840:	a815                	j	1874 <strncmp+0x42>
    1842:	00a68e63          	beq	a3,a0,185e <strncmp+0x2c>
    1846:	0505                	add	a0,a0,1
    1848:	00f71b63          	bne	a4,a5,185e <strncmp+0x2c>
    184c:	00054783          	lbu	a5,0(a0)
    1850:	cf89                	beqz	a5,186a <strncmp+0x38>
    1852:	85b2                	mv	a1,a2
    1854:	0005c703          	lbu	a4,0(a1)
    1858:	00158613          	add	a2,a1,1
    185c:	f37d                	bnez	a4,1842 <strncmp+0x10>
        ;
    return *l - *r;
    185e:	0007851b          	sext.w	a0,a5
    1862:	9d19                	subw	a0,a0,a4
    1864:	8082                	ret
        return 0;
    1866:	4501                	li	a0,0
}
    1868:	8082                	ret
    return *l - *r;
    186a:	0015c703          	lbu	a4,1(a1)
    186e:	4501                	li	a0,0
    1870:	9d19                	subw	a0,a0,a4
    1872:	8082                	ret
    1874:	0005c703          	lbu	a4,0(a1)
    1878:	4501                	li	a0,0
    187a:	b7e5                	j	1862 <strncmp+0x30>

000000000000187c <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    187c:	00757793          	and	a5,a0,7
    1880:	cf89                	beqz	a5,189a <strlen+0x1e>
    1882:	87aa                	mv	a5,a0
    1884:	a029                	j	188e <strlen+0x12>
    1886:	0785                	add	a5,a5,1
    1888:	0077f713          	and	a4,a5,7
    188c:	cb01                	beqz	a4,189c <strlen+0x20>
        if (!*s)
    188e:	0007c703          	lbu	a4,0(a5)
    1892:	fb75                	bnez	a4,1886 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1894:	40a78533          	sub	a0,a5,a0
}
    1898:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    189a:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    189c:	feff05b7          	lui	a1,0xfeff0
    18a0:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedf27>
    18a4:	f0101637          	lui	a2,0xf0101
    18a8:	05c2                	sll	a1,a1,0x10
    18aa:	0612                	sll	a2,a2,0x4
    18ac:	6394                	ld	a3,0(a5)
    18ae:	eff58593          	add	a1,a1,-257
    18b2:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff129>
    18b6:	05c2                	sll	a1,a1,0x10
    18b8:	0642                	sll	a2,a2,0x10
    18ba:	eff58593          	add	a1,a1,-257
    18be:	10160613          	add	a2,a2,257
    18c2:	00b68733          	add	a4,a3,a1
    18c6:	063e                	sll	a2,a2,0xf
    18c8:	fff6c693          	not	a3,a3
    18cc:	8f75                	and	a4,a4,a3
    18ce:	08060613          	add	a2,a2,128
    18d2:	8f71                	and	a4,a4,a2
    18d4:	eb11                	bnez	a4,18e8 <strlen+0x6c>
    18d6:	6794                	ld	a3,8(a5)
    18d8:	07a1                	add	a5,a5,8
    18da:	00b68733          	add	a4,a3,a1
    18de:	fff6c693          	not	a3,a3
    18e2:	8f75                	and	a4,a4,a3
    18e4:	8f71                	and	a4,a4,a2
    18e6:	db65                	beqz	a4,18d6 <strlen+0x5a>
    for (; *s; s++)
    18e8:	0007c703          	lbu	a4,0(a5)
    18ec:	d745                	beqz	a4,1894 <strlen+0x18>
    18ee:	0017c703          	lbu	a4,1(a5)
    18f2:	0785                	add	a5,a5,1
    18f4:	d345                	beqz	a4,1894 <strlen+0x18>
    18f6:	0017c703          	lbu	a4,1(a5)
    18fa:	0785                	add	a5,a5,1
    18fc:	fb6d                	bnez	a4,18ee <strlen+0x72>
    18fe:	bf59                	j	1894 <strlen+0x18>

0000000000001900 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1900:	00757713          	and	a4,a0,7
{
    1904:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1906:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    190a:	cb19                	beqz	a4,1920 <memchr+0x20>
    190c:	ce59                	beqz	a2,19aa <memchr+0xaa>
    190e:	0007c703          	lbu	a4,0(a5)
    1912:	00b70963          	beq	a4,a1,1924 <memchr+0x24>
    1916:	0785                	add	a5,a5,1
    1918:	0077f713          	and	a4,a5,7
    191c:	167d                	add	a2,a2,-1
    191e:	f77d                	bnez	a4,190c <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1920:	4501                	li	a0,0
    if (n && *s != c)
    1922:	c649                	beqz	a2,19ac <memchr+0xac>
    1924:	0007c703          	lbu	a4,0(a5)
    1928:	06b70663          	beq	a4,a1,1994 <memchr+0x94>
        size_t k = ONES * c;
    192c:	01010737          	lui	a4,0x1010
    1930:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e129>
    1934:	0742                	sll	a4,a4,0x10
    1936:	10170713          	add	a4,a4,257
    193a:	0742                	sll	a4,a4,0x10
    193c:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1940:	469d                	li	a3,7
        size_t k = ONES * c;
    1942:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1946:	04c6f763          	bgeu	a3,a2,1994 <memchr+0x94>
    194a:	f0101837          	lui	a6,0xf0101
    194e:	feff08b7          	lui	a7,0xfeff0
    1952:	0812                	sll	a6,a6,0x4
    1954:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedf27>
    1958:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff129>
    195c:	08c2                	sll	a7,a7,0x10
    195e:	0842                	sll	a6,a6,0x10
    1960:	eff88893          	add	a7,a7,-257
    1964:	10180813          	add	a6,a6,257
    1968:	08c2                	sll	a7,a7,0x10
    196a:	083e                	sll	a6,a6,0xf
    196c:	eff88893          	add	a7,a7,-257
    1970:	08080813          	add	a6,a6,128
    1974:	431d                	li	t1,7
    1976:	a029                	j	1980 <memchr+0x80>
    1978:	1661                	add	a2,a2,-8
    197a:	07a1                	add	a5,a5,8
    197c:	02c37663          	bgeu	t1,a2,19a8 <memchr+0xa8>
    1980:	6398                	ld	a4,0(a5)
    1982:	8f29                	xor	a4,a4,a0
    1984:	011706b3          	add	a3,a4,a7
    1988:	fff74713          	not	a4,a4
    198c:	8f75                	and	a4,a4,a3
    198e:	01077733          	and	a4,a4,a6
    1992:	d37d                	beqz	a4,1978 <memchr+0x78>
        s = (const void *)w;
    1994:	853e                	mv	a0,a5
    1996:	a019                	j	199c <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    1998:	0505                	add	a0,a0,1
    199a:	ca01                	beqz	a2,19aa <memchr+0xaa>
    199c:	00054783          	lbu	a5,0(a0)
    19a0:	167d                	add	a2,a2,-1
    19a2:	feb79be3          	bne	a5,a1,1998 <memchr+0x98>
    19a6:	8082                	ret
    19a8:	f675                	bnez	a2,1994 <memchr+0x94>
    return n ? (void *)s : 0;
    19aa:	4501                	li	a0,0
}
    19ac:	8082                	ret

00000000000019ae <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19ae:	1101                	add	sp,sp,-32
    19b0:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19b2:	862e                	mv	a2,a1
{
    19b4:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19b6:	4581                	li	a1,0
{
    19b8:	e426                	sd	s1,8(sp)
    19ba:	ec06                	sd	ra,24(sp)
    19bc:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19be:	f43ff0ef          	jal	1900 <memchr>
    return p ? p - s : n;
    19c2:	c519                	beqz	a0,19d0 <strnlen+0x22>
}
    19c4:	60e2                	ld	ra,24(sp)
    19c6:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19c8:	8d05                	sub	a0,a0,s1
}
    19ca:	64a2                	ld	s1,8(sp)
    19cc:	6105                	add	sp,sp,32
    19ce:	8082                	ret
    19d0:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19d2:	8522                	mv	a0,s0
}
    19d4:	6442                	ld	s0,16(sp)
    19d6:	64a2                	ld	s1,8(sp)
    19d8:	6105                	add	sp,sp,32
    19da:	8082                	ret

00000000000019dc <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19dc:	00b547b3          	xor	a5,a0,a1
    19e0:	8b9d                	and	a5,a5,7
    19e2:	efb1                	bnez	a5,1a3e <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19e4:	0075f793          	and	a5,a1,7
    19e8:	ebb5                	bnez	a5,1a5c <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19ea:	feff0637          	lui	a2,0xfeff0
    19ee:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedf27>
    19f2:	f01016b7          	lui	a3,0xf0101
    19f6:	0642                	sll	a2,a2,0x10
    19f8:	0692                	sll	a3,a3,0x4
    19fa:	6198                	ld	a4,0(a1)
    19fc:	eff60613          	add	a2,a2,-257
    1a00:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff129>
    1a04:	0642                	sll	a2,a2,0x10
    1a06:	06c2                	sll	a3,a3,0x10
    1a08:	eff60613          	add	a2,a2,-257
    1a0c:	10168693          	add	a3,a3,257
    1a10:	00c707b3          	add	a5,a4,a2
    1a14:	fff74813          	not	a6,a4
    1a18:	06be                	sll	a3,a3,0xf
    1a1a:	0107f7b3          	and	a5,a5,a6
    1a1e:	08068693          	add	a3,a3,128
    1a22:	8ff5                	and	a5,a5,a3
    1a24:	ef89                	bnez	a5,1a3e <strcpy+0x62>
    1a26:	05a1                	add	a1,a1,8
    1a28:	e118                	sd	a4,0(a0)
    1a2a:	6198                	ld	a4,0(a1)
    1a2c:	0521                	add	a0,a0,8
    1a2e:	00c707b3          	add	a5,a4,a2
    1a32:	fff74813          	not	a6,a4
    1a36:	0107f7b3          	and	a5,a5,a6
    1a3a:	8ff5                	and	a5,a5,a3
    1a3c:	d7ed                	beqz	a5,1a26 <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a3e:	0005c783          	lbu	a5,0(a1)
    1a42:	00f50023          	sb	a5,0(a0)
    1a46:	c785                	beqz	a5,1a6e <strcpy+0x92>
    1a48:	0015c783          	lbu	a5,1(a1)
    1a4c:	0505                	add	a0,a0,1
    1a4e:	0585                	add	a1,a1,1
    1a50:	00f50023          	sb	a5,0(a0)
    1a54:	fbf5                	bnez	a5,1a48 <strcpy+0x6c>
        ;
    return d;
}
    1a56:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a58:	0505                	add	a0,a0,1
    1a5a:	db41                	beqz	a4,19ea <strcpy+0xe>
            if (!(*d = *s))
    1a5c:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a60:	0585                	add	a1,a1,1
    1a62:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a66:	00f50023          	sb	a5,0(a0)
    1a6a:	f7fd                	bnez	a5,1a58 <strcpy+0x7c>
}
    1a6c:	8082                	ret
    1a6e:	8082                	ret

0000000000001a70 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a70:	00b547b3          	xor	a5,a0,a1
    1a74:	8b9d                	and	a5,a5,7
    1a76:	efbd                	bnez	a5,1af4 <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a78:	0075f793          	and	a5,a1,7
    1a7c:	1c078563          	beqz	a5,1c46 <strncpy+0x1d6>
    1a80:	ea11                	bnez	a2,1a94 <strncpy+0x24>
    1a82:	8082                	ret
    1a84:	0585                	add	a1,a1,1
    1a86:	0075f793          	and	a5,a1,7
    1a8a:	167d                	add	a2,a2,-1
    1a8c:	0505                	add	a0,a0,1
    1a8e:	1a078c63          	beqz	a5,1c46 <strncpy+0x1d6>
    1a92:	ca3d                	beqz	a2,1b08 <strncpy+0x98>
    1a94:	0005c783          	lbu	a5,0(a1)
    1a98:	00f50023          	sb	a5,0(a0)
    1a9c:	f7e5                	bnez	a5,1a84 <strncpy+0x14>
            ;
        if (!n || !*s)
    1a9e:	0005c783          	lbu	a5,0(a1)
    1aa2:	c7a5                	beqz	a5,1b0a <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1aa4:	479d                	li	a5,7
    1aa6:	04c7f863          	bgeu	a5,a2,1af6 <strncpy+0x86>
    1aaa:	f01016b7          	lui	a3,0xf0101
    1aae:	feff0837          	lui	a6,0xfeff0
    1ab2:	0692                	sll	a3,a3,0x4
    1ab4:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedf27>
    1ab8:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff129>
    1abc:	0842                	sll	a6,a6,0x10
    1abe:	06c2                	sll	a3,a3,0x10
    1ac0:	eff80813          	add	a6,a6,-257
    1ac4:	10168693          	add	a3,a3,257
    1ac8:	0842                	sll	a6,a6,0x10
    1aca:	06be                	sll	a3,a3,0xf
    1acc:	eff80813          	add	a6,a6,-257
    1ad0:	08068693          	add	a3,a3,128
    1ad4:	431d                	li	t1,7
    1ad6:	6198                	ld	a4,0(a1)
    1ad8:	010707b3          	add	a5,a4,a6
    1adc:	fff74893          	not	a7,a4
    1ae0:	0117f7b3          	and	a5,a5,a7
    1ae4:	8ff5                	and	a5,a5,a3
    1ae6:	eb81                	bnez	a5,1af6 <strncpy+0x86>
            *wd = *ws;
    1ae8:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1aea:	1661                	add	a2,a2,-8
    1aec:	05a1                	add	a1,a1,8
    1aee:	0521                	add	a0,a0,8
    1af0:	fec363e3          	bltu	t1,a2,1ad6 <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1af4:	ca11                	beqz	a2,1b08 <strncpy+0x98>
    1af6:	0005c783          	lbu	a5,0(a1)
    1afa:	0585                	add	a1,a1,1
    1afc:	00f50023          	sb	a5,0(a0)
    1b00:	c789                	beqz	a5,1b0a <strncpy+0x9a>
    1b02:	167d                	add	a2,a2,-1
    1b04:	0505                	add	a0,a0,1
    1b06:	fa65                	bnez	a2,1af6 <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b08:	8082                	ret
    1b0a:	40a00733          	neg	a4,a0
    1b0e:	00777793          	and	a5,a4,7
    1b12:	00778693          	add	a3,a5,7
    1b16:	482d                	li	a6,11
    1b18:	fff60593          	add	a1,a2,-1
    1b1c:	1106ef63          	bltu	a3,a6,1c3a <strncpy+0x1ca>
    1b20:	12d5ee63          	bltu	a1,a3,1c5c <strncpy+0x1ec>
    1b24:	12078563          	beqz	a5,1c4e <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b28:	00050023          	sb	zero,0(a0)
    1b2c:	00677693          	and	a3,a4,6
    1b30:	12068263          	beqz	a3,1c54 <strncpy+0x1e4>
    1b34:	000500a3          	sb	zero,1(a0)
    1b38:	4689                	li	a3,2
    1b3a:	12f6f463          	bgeu	a3,a5,1c62 <strncpy+0x1f2>
    1b3e:	00050123          	sb	zero,2(a0)
    1b42:	8b11                	and	a4,a4,4
    1b44:	cf6d                	beqz	a4,1c3e <strncpy+0x1ce>
    1b46:	000501a3          	sb	zero,3(a0)
    1b4a:	4711                	li	a4,4
    1b4c:	00450693          	add	a3,a0,4
    1b50:	02f77363          	bgeu	a4,a5,1b76 <strncpy+0x106>
    1b54:	00050223          	sb	zero,4(a0)
    1b58:	4715                	li	a4,5
    1b5a:	00550693          	add	a3,a0,5
    1b5e:	00e78c63          	beq	a5,a4,1b76 <strncpy+0x106>
    1b62:	000502a3          	sb	zero,5(a0)
    1b66:	471d                	li	a4,7
    1b68:	10e79163          	bne	a5,a4,1c6a <strncpy+0x1fa>
    1b6c:	00750693          	add	a3,a0,7
    1b70:	00050323          	sb	zero,6(a0)
    1b74:	471d                	li	a4,7
    1b76:	40f608b3          	sub	a7,a2,a5
    1b7a:	ff88f813          	and	a6,a7,-8
    1b7e:	97aa                	add	a5,a5,a0
    1b80:	010785b3          	add	a1,a5,a6
    1b84:	0007b023          	sd	zero,0(a5)
    1b88:	07a1                	add	a5,a5,8
    1b8a:	feb79de3          	bne	a5,a1,1b84 <strncpy+0x114>
    1b8e:	00e807bb          	addw	a5,a6,a4
    1b92:	01068733          	add	a4,a3,a6
    1b96:	0b088b63          	beq	a7,a6,1c4c <strncpy+0x1dc>
    1b9a:	00070023          	sb	zero,0(a4)
    1b9e:	0017869b          	addw	a3,a5,1
    1ba2:	f6c6f3e3          	bgeu	a3,a2,1b08 <strncpy+0x98>
    1ba6:	000700a3          	sb	zero,1(a4)
    1baa:	0027869b          	addw	a3,a5,2
    1bae:	f4c6fde3          	bgeu	a3,a2,1b08 <strncpy+0x98>
    1bb2:	00070123          	sb	zero,2(a4)
    1bb6:	0037869b          	addw	a3,a5,3
    1bba:	f4c6f7e3          	bgeu	a3,a2,1b08 <strncpy+0x98>
    1bbe:	000701a3          	sb	zero,3(a4)
    1bc2:	0047869b          	addw	a3,a5,4
    1bc6:	f4c6f1e3          	bgeu	a3,a2,1b08 <strncpy+0x98>
    1bca:	00070223          	sb	zero,4(a4)
    1bce:	0057869b          	addw	a3,a5,5
    1bd2:	f2c6fbe3          	bgeu	a3,a2,1b08 <strncpy+0x98>
    1bd6:	000702a3          	sb	zero,5(a4)
    1bda:	0067869b          	addw	a3,a5,6
    1bde:	f2c6f5e3          	bgeu	a3,a2,1b08 <strncpy+0x98>
    1be2:	00070323          	sb	zero,6(a4)
    1be6:	0077869b          	addw	a3,a5,7
    1bea:	f0c6ffe3          	bgeu	a3,a2,1b08 <strncpy+0x98>
    1bee:	000703a3          	sb	zero,7(a4)
    1bf2:	0087869b          	addw	a3,a5,8
    1bf6:	f0c6f9e3          	bgeu	a3,a2,1b08 <strncpy+0x98>
    1bfa:	00070423          	sb	zero,8(a4)
    1bfe:	0097869b          	addw	a3,a5,9
    1c02:	f0c6f3e3          	bgeu	a3,a2,1b08 <strncpy+0x98>
    1c06:	000704a3          	sb	zero,9(a4)
    1c0a:	00a7869b          	addw	a3,a5,10
    1c0e:	eec6fde3          	bgeu	a3,a2,1b08 <strncpy+0x98>
    1c12:	00070523          	sb	zero,10(a4)
    1c16:	00b7869b          	addw	a3,a5,11
    1c1a:	eec6f7e3          	bgeu	a3,a2,1b08 <strncpy+0x98>
    1c1e:	000705a3          	sb	zero,11(a4)
    1c22:	00c7869b          	addw	a3,a5,12
    1c26:	eec6f1e3          	bgeu	a3,a2,1b08 <strncpy+0x98>
    1c2a:	00070623          	sb	zero,12(a4)
    1c2e:	27b5                	addw	a5,a5,13
    1c30:	ecc7fce3          	bgeu	a5,a2,1b08 <strncpy+0x98>
    1c34:	000706a3          	sb	zero,13(a4)
}
    1c38:	8082                	ret
    1c3a:	46ad                	li	a3,11
    1c3c:	b5d5                	j	1b20 <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c3e:	00350693          	add	a3,a0,3
    1c42:	470d                	li	a4,3
    1c44:	bf0d                	j	1b76 <strncpy+0x106>
        if (!n || !*s)
    1c46:	e4061ce3          	bnez	a2,1a9e <strncpy+0x2e>
}
    1c4a:	8082                	ret
    1c4c:	8082                	ret
    char *p = dest;
    1c4e:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c50:	4701                	li	a4,0
    1c52:	b715                	j	1b76 <strncpy+0x106>
    1c54:	00150693          	add	a3,a0,1
    1c58:	4705                	li	a4,1
    1c5a:	bf31                	j	1b76 <strncpy+0x106>
    char *p = dest;
    1c5c:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c5e:	4781                	li	a5,0
    1c60:	bf2d                	j	1b9a <strncpy+0x12a>
    1c62:	00250693          	add	a3,a0,2
    1c66:	4709                	li	a4,2
    1c68:	b739                	j	1b76 <strncpy+0x106>
    1c6a:	00650693          	add	a3,a0,6
    1c6e:	4719                	li	a4,6
    1c70:	b719                	j	1b76 <strncpy+0x106>

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
    1d46:	1141                	add	sp,sp,-16
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
    1d6c:	0141                	add	sp,sp,16
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
    1d8c:	1141                	add	sp,sp,-16
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
    1da2:	0141                	add	sp,sp,16
    1da4:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1da6:	4502                	lw	a0,0(sp)
}
    1da8:	0141                	add	sp,sp,16
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
    1e12:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e14:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e18:	9301                	srl	a4,a4,0x20
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
    1e22:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e24:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e28:	9201                	srl	a2,a2,0x20
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
    1e92:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e94:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e98:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e9c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e9e:	9201                	srl	a2,a2,0x20
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
    1ef2:	15c1                	add	a1,a1,-16
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
