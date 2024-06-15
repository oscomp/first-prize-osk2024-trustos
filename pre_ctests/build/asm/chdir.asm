
/root/oskernel2024-trustos/pre_ctests/build/riscv64/chdir:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a0c9                	j	10c4 <__start_main>

0000000000001004 <test_chdir>:
#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"

static char buffer[30];
void test_chdir(void){
    1004:	1141                	add	sp,sp,-16
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f0a50513          	add	a0,a0,-246 # 1f10 <__clone+0x2a>
void test_chdir(void){
    100e:	e406                	sd	ra,8(sp)
    1010:	e022                	sd	s0,0(sp)
    TEST_START(__func__);
    1012:	2ea000ef          	jal	12fc <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	fba50513          	add	a0,a0,-70 # 1fd0 <__func__.0>
    101e:	2de000ef          	jal	12fc <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	f0650513          	add	a0,a0,-250 # 1f28 <__clone+0x42>
    102a:	2d2000ef          	jal	12fc <puts>
    mkdir("test_chdir", 0666);
    102e:	1b600593          	li	a1,438
    1032:	00001517          	auipc	a0,0x1
    1036:	f0650513          	add	a0,a0,-250 # 1f38 <__clone+0x52>
    103a:	649000ef          	jal	1e82 <mkdir>
    int ret = chdir("test_chdir");
    103e:	00001517          	auipc	a0,0x1
    1042:	efa50513          	add	a0,a0,-262 # 1f38 <__clone+0x52>
    1046:	631000ef          	jal	1e76 <chdir>
    104a:	842a                	mv	s0,a0
    printf("chdir ret: %d\n", ret);
    104c:	85aa                	mv	a1,a0
    104e:	00001517          	auipc	a0,0x1
    1052:	efa50513          	add	a0,a0,-262 # 1f48 <__clone+0x62>
    1056:	2c8000ef          	jal	131e <printf>
    assert(ret == 0);
    105a:	e431                	bnez	s0,10a6 <test_chdir+0xa2>
    getcwd(buffer, 30);
    105c:	45f9                	li	a1,30
    105e:	00001517          	auipc	a0,0x1
    1062:	f5250513          	add	a0,a0,-174 # 1fb0 <buffer>
    1066:	609000ef          	jal	1e6e <getcwd>
    printf("  current working dir : %s\n", buffer);
    106a:	00001597          	auipc	a1,0x1
    106e:	f4658593          	add	a1,a1,-186 # 1fb0 <buffer>
    1072:	00001517          	auipc	a0,0x1
    1076:	f0650513          	add	a0,a0,-250 # 1f78 <__clone+0x92>
    107a:	2a4000ef          	jal	131e <printf>
    TEST_END(__func__);
    107e:	00001517          	auipc	a0,0x1
    1082:	f1a50513          	add	a0,a0,-230 # 1f98 <__clone+0xb2>
    1086:	276000ef          	jal	12fc <puts>
    108a:	00001517          	auipc	a0,0x1
    108e:	f4650513          	add	a0,a0,-186 # 1fd0 <__func__.0>
    1092:	26a000ef          	jal	12fc <puts>
}
    1096:	6402                	ld	s0,0(sp)
    1098:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    109a:	00001517          	auipc	a0,0x1
    109e:	e8e50513          	add	a0,a0,-370 # 1f28 <__clone+0x42>
}
    10a2:	0141                	add	sp,sp,16
    TEST_END(__func__);
    10a4:	aca1                	j	12fc <puts>
    assert(ret == 0);
    10a6:	00001517          	auipc	a0,0x1
    10aa:	eb250513          	add	a0,a0,-334 # 1f58 <__clone+0x72>
    10ae:	4ee000ef          	jal	159c <panic>
    10b2:	b76d                	j	105c <test_chdir+0x58>

00000000000010b4 <main>:

int main(void){
    10b4:	1141                	add	sp,sp,-16
    10b6:	e406                	sd	ra,8(sp)
    test_chdir();
    10b8:	f4dff0ef          	jal	1004 <test_chdir>
    return 0;
}
    10bc:	60a2                	ld	ra,8(sp)
    10be:	4501                	li	a0,0
    10c0:	0141                	add	sp,sp,16
    10c2:	8082                	ret

00000000000010c4 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10c4:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10c6:	4108                	lw	a0,0(a0)
{
    10c8:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10ca:	05a1                	add	a1,a1,8
{
    10cc:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10ce:	fe7ff0ef          	jal	10b4 <main>
    10d2:	42d000ef          	jal	1cfe <exit>
	return 0;
}
    10d6:	60a2                	ld	ra,8(sp)
    10d8:	4501                	li	a0,0
    10da:	0141                	add	sp,sp,16
    10dc:	8082                	ret

00000000000010de <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10de:	7179                	add	sp,sp,-48
    10e0:	f406                	sd	ra,40(sp)
    10e2:	0005081b          	sext.w	a6,a0
    10e6:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10e8:	00055563          	bgez	a0,10f2 <printint.constprop.0+0x14>
        x = -xx;
    10ec:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    10f0:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10f2:	02b8763b          	remuw	a2,a6,a1
    10f6:	00001697          	auipc	a3,0x1
    10fa:	eea68693          	add	a3,a3,-278 # 1fe0 <digits>
    buf[16] = 0;
    10fe:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1102:	0005871b          	sext.w	a4,a1
    1106:	1602                	sll	a2,a2,0x20
    1108:	9201                	srl	a2,a2,0x20
    110a:	9636                	add	a2,a2,a3
    110c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1110:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    1114:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1118:	10b86c63          	bltu	a6,a1,1230 <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    111c:	02e5763b          	remuw	a2,a0,a4
    1120:	1602                	sll	a2,a2,0x20
    1122:	9201                	srl	a2,a2,0x20
    1124:	9636                	add	a2,a2,a3
    1126:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    112a:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    112e:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1132:	10e56863          	bltu	a0,a4,1242 <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    1136:	02e5f63b          	remuw	a2,a1,a4
    113a:	1602                	sll	a2,a2,0x20
    113c:	9201                	srl	a2,a2,0x20
    113e:	9636                	add	a2,a2,a3
    1140:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1144:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1148:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    114c:	10e5e463          	bltu	a1,a4,1254 <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    1150:	02e5763b          	remuw	a2,a0,a4
    1154:	1602                	sll	a2,a2,0x20
    1156:	9201                	srl	a2,a2,0x20
    1158:	9636                	add	a2,a2,a3
    115a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    115e:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1162:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1166:	10e56063          	bltu	a0,a4,1266 <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    116a:	02e5f63b          	remuw	a2,a1,a4
    116e:	1602                	sll	a2,a2,0x20
    1170:	9201                	srl	a2,a2,0x20
    1172:	9636                	add	a2,a2,a3
    1174:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1178:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    117c:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1180:	0ee5ec63          	bltu	a1,a4,1278 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    1184:	02e5763b          	remuw	a2,a0,a4
    1188:	1602                	sll	a2,a2,0x20
    118a:	9201                	srl	a2,a2,0x20
    118c:	9636                	add	a2,a2,a3
    118e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1192:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1196:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    119a:	08e56263          	bltu	a0,a4,121e <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    119e:	02e5f63b          	remuw	a2,a1,a4
    11a2:	1602                	sll	a2,a2,0x20
    11a4:	9201                	srl	a2,a2,0x20
    11a6:	9636                	add	a2,a2,a3
    11a8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ac:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11b0:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11b4:	0ce5eb63          	bltu	a1,a4,128a <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    11b8:	02e5763b          	remuw	a2,a0,a4
    11bc:	1602                	sll	a2,a2,0x20
    11be:	9201                	srl	a2,a2,0x20
    11c0:	9636                	add	a2,a2,a3
    11c2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c6:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11ca:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11ce:	0ce56763          	bltu	a0,a4,129c <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    11d2:	02e5f63b          	remuw	a2,a1,a4
    11d6:	1602                	sll	a2,a2,0x20
    11d8:	9201                	srl	a2,a2,0x20
    11da:	9636                	add	a2,a2,a3
    11dc:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11e0:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11e4:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11e8:	0ce5e363          	bltu	a1,a4,12ae <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    11ec:	1782                	sll	a5,a5,0x20
    11ee:	9381                	srl	a5,a5,0x20
    11f0:	96be                	add	a3,a3,a5
    11f2:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    11f6:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    11f8:	00f10723          	sb	a5,14(sp)
    if (sign)
    11fc:	00088763          	beqz	a7,120a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1200:	02d00793          	li	a5,45
    1204:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1208:	4595                	li	a1,5
    write(f, s, l);
    120a:	003c                	add	a5,sp,8
    120c:	4641                	li	a2,16
    120e:	9e0d                	subw	a2,a2,a1
    1210:	4505                	li	a0,1
    1212:	95be                	add	a1,a1,a5
    1214:	29b000ef          	jal	1cae <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1218:	70a2                	ld	ra,40(sp)
    121a:	6145                	add	sp,sp,48
    121c:	8082                	ret
    i++;
    121e:	45a9                	li	a1,10
    if (sign)
    1220:	fe0885e3          	beqz	a7,120a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1224:	02d00793          	li	a5,45
    1228:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    122c:	45a5                	li	a1,9
    122e:	bff1                	j	120a <printint.constprop.0+0x12c>
    i++;
    1230:	45bd                	li	a1,15
    if (sign)
    1232:	fc088ce3          	beqz	a7,120a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1236:	02d00793          	li	a5,45
    123a:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    123e:	45b9                	li	a1,14
    1240:	b7e9                	j	120a <printint.constprop.0+0x12c>
    i++;
    1242:	45b9                	li	a1,14
    if (sign)
    1244:	fc0883e3          	beqz	a7,120a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1248:	02d00793          	li	a5,45
    124c:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1250:	45b5                	li	a1,13
    1252:	bf65                	j	120a <printint.constprop.0+0x12c>
    i++;
    1254:	45b5                	li	a1,13
    if (sign)
    1256:	fa088ae3          	beqz	a7,120a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    125a:	02d00793          	li	a5,45
    125e:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1262:	45b1                	li	a1,12
    1264:	b75d                	j	120a <printint.constprop.0+0x12c>
    i++;
    1266:	45b1                	li	a1,12
    if (sign)
    1268:	fa0881e3          	beqz	a7,120a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    126c:	02d00793          	li	a5,45
    1270:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1274:	45ad                	li	a1,11
    1276:	bf51                	j	120a <printint.constprop.0+0x12c>
    i++;
    1278:	45ad                	li	a1,11
    if (sign)
    127a:	f80888e3          	beqz	a7,120a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    127e:	02d00793          	li	a5,45
    1282:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1286:	45a9                	li	a1,10
    1288:	b749                	j	120a <printint.constprop.0+0x12c>
    i++;
    128a:	45a5                	li	a1,9
    if (sign)
    128c:	f6088fe3          	beqz	a7,120a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1290:	02d00793          	li	a5,45
    1294:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1298:	45a1                	li	a1,8
    129a:	bf85                	j	120a <printint.constprop.0+0x12c>
    i++;
    129c:	45a1                	li	a1,8
    if (sign)
    129e:	f60886e3          	beqz	a7,120a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12a2:	02d00793          	li	a5,45
    12a6:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12aa:	459d                	li	a1,7
    12ac:	bfb9                	j	120a <printint.constprop.0+0x12c>
    i++;
    12ae:	459d                	li	a1,7
    if (sign)
    12b0:	f4088de3          	beqz	a7,120a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12b4:	02d00793          	li	a5,45
    12b8:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12bc:	4599                	li	a1,6
    12be:	b7b1                	j	120a <printint.constprop.0+0x12c>

00000000000012c0 <getchar>:
{
    12c0:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12c2:	00f10593          	add	a1,sp,15
    12c6:	4605                	li	a2,1
    12c8:	4501                	li	a0,0
{
    12ca:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12cc:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12d0:	1d5000ef          	jal	1ca4 <read>
}
    12d4:	60e2                	ld	ra,24(sp)
    12d6:	00f14503          	lbu	a0,15(sp)
    12da:	6105                	add	sp,sp,32
    12dc:	8082                	ret

00000000000012de <putchar>:
{
    12de:	1101                	add	sp,sp,-32
    12e0:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12e2:	00f10593          	add	a1,sp,15
    12e6:	4605                	li	a2,1
    12e8:	4505                	li	a0,1
{
    12ea:	ec06                	sd	ra,24(sp)
    char byte = c;
    12ec:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12f0:	1bf000ef          	jal	1cae <write>
}
    12f4:	60e2                	ld	ra,24(sp)
    12f6:	2501                	sext.w	a0,a0
    12f8:	6105                	add	sp,sp,32
    12fa:	8082                	ret

00000000000012fc <puts>:
{
    12fc:	1141                	add	sp,sp,-16
    12fe:	e406                	sd	ra,8(sp)
    1300:	e022                	sd	s0,0(sp)
    1302:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1304:	56c000ef          	jal	1870 <strlen>
    1308:	862a                	mv	a2,a0
    130a:	85a2                	mv	a1,s0
    130c:	4505                	li	a0,1
    130e:	1a1000ef          	jal	1cae <write>
}
    1312:	60a2                	ld	ra,8(sp)
    1314:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1316:	957d                	sra	a0,a0,0x3f
    return r;
    1318:	2501                	sext.w	a0,a0
}
    131a:	0141                	add	sp,sp,16
    131c:	8082                	ret

000000000000131e <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    131e:	7131                	add	sp,sp,-192
    1320:	e4d6                	sd	s5,72(sp)
    1322:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    1324:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1326:	013c                	add	a5,sp,136
{
    1328:	f0ca                	sd	s2,96(sp)
    132a:	ecce                	sd	s3,88(sp)
    132c:	e8d2                	sd	s4,80(sp)
    132e:	e0da                	sd	s6,64(sp)
    1330:	fc5e                	sd	s7,56(sp)
    1332:	fc86                	sd	ra,120(sp)
    1334:	f8a2                	sd	s0,112(sp)
    1336:	f4a6                	sd	s1,104(sp)
    1338:	e52e                	sd	a1,136(sp)
    133a:	e932                	sd	a2,144(sp)
    133c:	ed36                	sd	a3,152(sp)
    133e:	f13a                	sd	a4,160(sp)
    1340:	f942                	sd	a6,176(sp)
    1342:	fd46                	sd	a7,184(sp)
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
    134e:	07800b93          	li	s7,120
    1352:	06400b13          	li	s6,100
    buf[i++] = '0';
    1356:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x5850>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    135a:	00001997          	auipc	s3,0x1
    135e:	c8698993          	add	s3,s3,-890 # 1fe0 <digits>
        if (!*s)
    1362:	00054783          	lbu	a5,0(a0)
    1366:	16078863          	beqz	a5,14d6 <printf+0x1b8>
    136a:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    136c:	19278063          	beq	a5,s2,14ec <printf+0x1ce>
    1370:	00164783          	lbu	a5,1(a2)
    1374:	0605                	add	a2,a2,1
    1376:	fbfd                	bnez	a5,136c <printf+0x4e>
    1378:	84b2                	mv	s1,a2
        l = z - a;
    137a:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    137e:	85aa                	mv	a1,a0
    1380:	8622                	mv	a2,s0
    1382:	4505                	li	a0,1
    1384:	12b000ef          	jal	1cae <write>
        if (l)
    1388:	18041763          	bnez	s0,1516 <printf+0x1f8>
        if (s[1] == 0)
    138c:	0014c783          	lbu	a5,1(s1)
    1390:	14078363          	beqz	a5,14d6 <printf+0x1b8>
        switch (s[1])
    1394:	19478f63          	beq	a5,s4,1532 <printf+0x214>
    1398:	18fa6163          	bltu	s4,a5,151a <printf+0x1fc>
    139c:	1b678e63          	beq	a5,s6,1558 <printf+0x23a>
    13a0:	07000713          	li	a4,112
    13a4:	1ce79463          	bne	a5,a4,156c <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13a8:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13aa:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13ae:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13b0:	631c                	ld	a5,0(a4)
    13b2:	0721                	add	a4,a4,8
    13b4:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13b6:	00479293          	sll	t0,a5,0x4
    13ba:	00879f93          	sll	t6,a5,0x8
    13be:	00c79f13          	sll	t5,a5,0xc
    13c2:	01079e93          	sll	t4,a5,0x10
    13c6:	01479e13          	sll	t3,a5,0x14
    13ca:	01879313          	sll	t1,a5,0x18
    13ce:	01c79893          	sll	a7,a5,0x1c
    13d2:	02479813          	sll	a6,a5,0x24
    13d6:	02879513          	sll	a0,a5,0x28
    13da:	02c79593          	sll	a1,a5,0x2c
    13de:	03079693          	sll	a3,a5,0x30
    13e2:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13e6:	03c7d413          	srl	s0,a5,0x3c
    13ea:	01c7d39b          	srlw	t2,a5,0x1c
    13ee:	03c2d293          	srl	t0,t0,0x3c
    13f2:	03cfdf93          	srl	t6,t6,0x3c
    13f6:	03cf5f13          	srl	t5,t5,0x3c
    13fa:	03cede93          	srl	t4,t4,0x3c
    13fe:	03ce5e13          	srl	t3,t3,0x3c
    1402:	03c35313          	srl	t1,t1,0x3c
    1406:	03c8d893          	srl	a7,a7,0x3c
    140a:	03c85813          	srl	a6,a6,0x3c
    140e:	9171                	srl	a0,a0,0x3c
    1410:	91f1                	srl	a1,a1,0x3c
    1412:	92f1                	srl	a3,a3,0x3c
    1414:	9371                	srl	a4,a4,0x3c
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
    1430:	96ce                	add	a3,a3,s3
    1432:	00074083          	lbu	ra,0(a4)
    1436:	0002c283          	lbu	t0,0(t0)
    143a:	000fcf83          	lbu	t6,0(t6)
    143e:	000f4f03          	lbu	t5,0(t5)
    1442:	000ece83          	lbu	t4,0(t4)
    1446:	000e4e03          	lbu	t3,0(t3)
    144a:	00034303          	lbu	t1,0(t1)
    144e:	0008c883          	lbu	a7,0(a7)
    1452:	0003c383          	lbu	t2,0(t2)
    1456:	00084803          	lbu	a6,0(a6)
    145a:	00054503          	lbu	a0,0(a0)
    145e:	0005c583          	lbu	a1,0(a1)
    1462:	0006c683          	lbu	a3,0(a3)
    1466:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    146a:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    146e:	9371                	srl	a4,a4,0x3c
    1470:	8bbd                	and	a5,a5,15
    1472:	974e                	add	a4,a4,s3
    1474:	97ce                	add	a5,a5,s3
    1476:	005105a3          	sb	t0,11(sp)
    147a:	01f10623          	sb	t6,12(sp)
    147e:	01e106a3          	sb	t5,13(sp)
    1482:	01d10723          	sb	t4,14(sp)
    1486:	01c107a3          	sb	t3,15(sp)
    148a:	00610823          	sb	t1,16(sp)
    148e:	011108a3          	sb	a7,17(sp)
    1492:	00710923          	sb	t2,18(sp)
    1496:	010109a3          	sb	a6,19(sp)
    149a:	00a10a23          	sb	a0,20(sp)
    149e:	00b10aa3          	sb	a1,21(sp)
    14a2:	00d10b23          	sb	a3,22(sp)
    14a6:	00110ba3          	sb	ra,23(sp)
    14aa:	00810523          	sb	s0,10(sp)
    14ae:	00074703          	lbu	a4,0(a4)
    14b2:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14b6:	002c                	add	a1,sp,8
    14b8:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14ba:	00e10c23          	sb	a4,24(sp)
    14be:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14c2:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14c6:	7e8000ef          	jal	1cae <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14ca:	00248513          	add	a0,s1,2
        if (!*s)
    14ce:	00054783          	lbu	a5,0(a0)
    14d2:	e8079ce3          	bnez	a5,136a <printf+0x4c>
    }
    va_end(ap);
}
    14d6:	70e6                	ld	ra,120(sp)
    14d8:	7446                	ld	s0,112(sp)
    14da:	74a6                	ld	s1,104(sp)
    14dc:	7906                	ld	s2,96(sp)
    14de:	69e6                	ld	s3,88(sp)
    14e0:	6a46                	ld	s4,80(sp)
    14e2:	6aa6                	ld	s5,72(sp)
    14e4:	6b06                	ld	s6,64(sp)
    14e6:	7be2                	ld	s7,56(sp)
    14e8:	6129                	add	sp,sp,192
    14ea:	8082                	ret
    14ec:	84b2                	mv	s1,a2
    14ee:	a039                	j	14fc <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14f0:	0024c783          	lbu	a5,2(s1)
    14f4:	0605                	add	a2,a2,1
    14f6:	0489                	add	s1,s1,2
    14f8:	e92791e3          	bne	a5,s2,137a <printf+0x5c>
    14fc:	0014c783          	lbu	a5,1(s1)
    1500:	ff2788e3          	beq	a5,s2,14f0 <printf+0x1d2>
        l = z - a;
    1504:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1508:	85aa                	mv	a1,a0
    150a:	8622                	mv	a2,s0
    150c:	4505                	li	a0,1
    150e:	7a0000ef          	jal	1cae <write>
        if (l)
    1512:	e6040de3          	beqz	s0,138c <printf+0x6e>
    1516:	8526                	mv	a0,s1
    1518:	b5a9                	j	1362 <printf+0x44>
        switch (s[1])
    151a:	05779963          	bne	a5,s7,156c <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    151e:	6782                	ld	a5,0(sp)
    1520:	45c1                	li	a1,16
    1522:	4388                	lw	a0,0(a5)
    1524:	07a1                	add	a5,a5,8
    1526:	e03e                	sd	a5,0(sp)
    1528:	bb7ff0ef          	jal	10de <printint.constprop.0>
        s += 2;
    152c:	00248513          	add	a0,s1,2
    1530:	bf79                	j	14ce <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    1532:	6782                	ld	a5,0(sp)
    1534:	6380                	ld	s0,0(a5)
    1536:	07a1                	add	a5,a5,8
    1538:	e03e                	sd	a5,0(sp)
    153a:	cc21                	beqz	s0,1592 <printf+0x274>
            l = strnlen(a, 200);
    153c:	0c800593          	li	a1,200
    1540:	8522                	mv	a0,s0
    1542:	460000ef          	jal	19a2 <strnlen>
    write(f, s, l);
    1546:	0005061b          	sext.w	a2,a0
    154a:	85a2                	mv	a1,s0
    154c:	4505                	li	a0,1
    154e:	760000ef          	jal	1cae <write>
        s += 2;
    1552:	00248513          	add	a0,s1,2
    1556:	bfa5                	j	14ce <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    1558:	6782                	ld	a5,0(sp)
    155a:	45a9                	li	a1,10
    155c:	4388                	lw	a0,0(a5)
    155e:	07a1                	add	a5,a5,8
    1560:	e03e                	sd	a5,0(sp)
    1562:	b7dff0ef          	jal	10de <printint.constprop.0>
        s += 2;
    1566:	00248513          	add	a0,s1,2
    156a:	b795                	j	14ce <printf+0x1b0>
    return write(stdout, &byte, 1);
    156c:	4605                	li	a2,1
    156e:	002c                	add	a1,sp,8
    1570:	4505                	li	a0,1
    char byte = c;
    1572:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1576:	738000ef          	jal	1cae <write>
    char byte = c;
    157a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    157e:	4605                	li	a2,1
    1580:	002c                	add	a1,sp,8
    1582:	4505                	li	a0,1
    char byte = c;
    1584:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1588:	726000ef          	jal	1cae <write>
        s += 2;
    158c:	00248513          	add	a0,s1,2
    1590:	bf3d                	j	14ce <printf+0x1b0>
                a = "(null)";
    1592:	00001417          	auipc	s0,0x1
    1596:	a1640413          	add	s0,s0,-1514 # 1fa8 <__clone+0xc2>
    159a:	b74d                	j	153c <printf+0x21e>

000000000000159c <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    159c:	1141                	add	sp,sp,-16
    159e:	e406                	sd	ra,8(sp)
    puts(m);
    15a0:	d5dff0ef          	jal	12fc <puts>
    exit(-100);
}
    15a4:	60a2                	ld	ra,8(sp)
    exit(-100);
    15a6:	f9c00513          	li	a0,-100
}
    15aa:	0141                	add	sp,sp,16
    exit(-100);
    15ac:	af89                	j	1cfe <exit>

00000000000015ae <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ae:	02000793          	li	a5,32
    15b2:	00f50663          	beq	a0,a5,15be <isspace+0x10>
    15b6:	355d                	addw	a0,a0,-9
    15b8:	00553513          	sltiu	a0,a0,5
    15bc:	8082                	ret
    15be:	4505                	li	a0,1
}
    15c0:	8082                	ret

00000000000015c2 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15c2:	fd05051b          	addw	a0,a0,-48
}
    15c6:	00a53513          	sltiu	a0,a0,10
    15ca:	8082                	ret

00000000000015cc <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15cc:	02000713          	li	a4,32
    15d0:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15d2:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d6:	ff76879b          	addw	a5,a3,-9
    15da:	06e68063          	beq	a3,a4,163a <atoi+0x6e>
    15de:	0006859b          	sext.w	a1,a3
    15e2:	04f67c63          	bgeu	a2,a5,163a <atoi+0x6e>
        s++;
    switch (*s)
    15e6:	02b00793          	li	a5,43
    15ea:	06f68563          	beq	a3,a5,1654 <atoi+0x88>
    15ee:	02d00793          	li	a5,45
    15f2:	04f69663          	bne	a3,a5,163e <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15f6:	00154683          	lbu	a3,1(a0)
    15fa:	47a5                	li	a5,9
        s++;
    15fc:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1600:	fd06869b          	addw	a3,a3,-48
    1604:	8636                	mv	a2,a3
    while (isdigit(*s))
    1606:	04d7e563          	bltu	a5,a3,1650 <atoi+0x84>
        neg = 1;
    160a:	4885                	li	a7,1
    int n = 0, neg = 0;
    160c:	4501                	li	a0,0
    while (isdigit(*s))
    160e:	4825                	li	a6,9
    1610:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1614:	0025179b          	sllw	a5,a0,0x2
    1618:	9fa9                	addw	a5,a5,a0
    161a:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    161e:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    1622:	85b2                	mv	a1,a2
    1624:	40c7853b          	subw	a0,a5,a2
    1628:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    162a:	8636                	mv	a2,a3
    while (isdigit(*s))
    162c:	fed872e3          	bgeu	a6,a3,1610 <atoi+0x44>
    return neg ? n : -n;
    1630:	02089163          	bnez	a7,1652 <atoi+0x86>
    1634:	40f5853b          	subw	a0,a1,a5
    1638:	8082                	ret
        s++;
    163a:	0505                	add	a0,a0,1
    163c:	bf59                	j	15d2 <atoi+0x6>
    while (isdigit(*s))
    163e:	fd05859b          	addw	a1,a1,-48
    1642:	47a5                	li	a5,9
    1644:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1646:	4881                	li	a7,0
    1648:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    164c:	fcb7f0e3          	bgeu	a5,a1,160c <atoi+0x40>
    return neg ? n : -n;
    1650:	4501                	li	a0,0
}
    1652:	8082                	ret
    while (isdigit(*s))
    1654:	00154683          	lbu	a3,1(a0)
    1658:	47a5                	li	a5,9
        s++;
    165a:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    165e:	fd06869b          	addw	a3,a3,-48
    1662:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    1664:	4881                	li	a7,0
    while (isdigit(*s))
    1666:	fad7f3e3          	bgeu	a5,a3,160c <atoi+0x40>
    return neg ? n : -n;
    166a:	4501                	li	a0,0
    166c:	8082                	ret

000000000000166e <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    166e:	16060f63          	beqz	a2,17ec <memset+0x17e>
    1672:	40a006b3          	neg	a3,a0
    1676:	0076f793          	and	a5,a3,7
    167a:	00778813          	add	a6,a5,7
    167e:	48ad                	li	a7,11
    1680:	0ff5f713          	zext.b	a4,a1
    1684:	fff60593          	add	a1,a2,-1
    1688:	17186363          	bltu	a6,a7,17ee <memset+0x180>
    168c:	1705eb63          	bltu	a1,a6,1802 <memset+0x194>
    1690:	16078163          	beqz	a5,17f2 <memset+0x184>
    1694:	00e50023          	sb	a4,0(a0)
    1698:	0066f593          	and	a1,a3,6
    169c:	14058e63          	beqz	a1,17f8 <memset+0x18a>
    16a0:	00e500a3          	sb	a4,1(a0)
    16a4:	4589                	li	a1,2
    16a6:	00250813          	add	a6,a0,2
    16aa:	04f5f663          	bgeu	a1,a5,16f6 <memset+0x88>
    16ae:	00e50123          	sb	a4,2(a0)
    16b2:	8a91                	and	a3,a3,4
    16b4:	00350813          	add	a6,a0,3
    16b8:	458d                	li	a1,3
    16ba:	ce95                	beqz	a3,16f6 <memset+0x88>
    16bc:	00e501a3          	sb	a4,3(a0)
    16c0:	4691                	li	a3,4
    16c2:	00450813          	add	a6,a0,4
    16c6:	4591                	li	a1,4
    16c8:	02f6f763          	bgeu	a3,a5,16f6 <memset+0x88>
    16cc:	00e50223          	sb	a4,4(a0)
    16d0:	4695                	li	a3,5
    16d2:	00550813          	add	a6,a0,5
    16d6:	4595                	li	a1,5
    16d8:	00d78f63          	beq	a5,a3,16f6 <memset+0x88>
    16dc:	00e502a3          	sb	a4,5(a0)
    16e0:	469d                	li	a3,7
    16e2:	00650813          	add	a6,a0,6
    16e6:	4599                	li	a1,6
    16e8:	00d79763          	bne	a5,a3,16f6 <memset+0x88>
    16ec:	00750813          	add	a6,a0,7
    16f0:	00e50323          	sb	a4,6(a0)
    16f4:	459d                	li	a1,7
    16f6:	00871693          	sll	a3,a4,0x8
    16fa:	01071313          	sll	t1,a4,0x10
    16fe:	8ed9                	or	a3,a3,a4
    1700:	01871893          	sll	a7,a4,0x18
    1704:	0066e6b3          	or	a3,a3,t1
    1708:	0116e6b3          	or	a3,a3,a7
    170c:	02071313          	sll	t1,a4,0x20
    1710:	02871893          	sll	a7,a4,0x28
    1714:	0066e6b3          	or	a3,a3,t1
    1718:	40f60e33          	sub	t3,a2,a5
    171c:	03071313          	sll	t1,a4,0x30
    1720:	0116e6b3          	or	a3,a3,a7
    1724:	0066e6b3          	or	a3,a3,t1
    1728:	03871893          	sll	a7,a4,0x38
    172c:	97aa                	add	a5,a5,a0
    172e:	ff8e7313          	and	t1,t3,-8
    1732:	0116e6b3          	or	a3,a3,a7
    1736:	00f308b3          	add	a7,t1,a5
    173a:	e394                	sd	a3,0(a5)
    173c:	07a1                	add	a5,a5,8
    173e:	ff179ee3          	bne	a5,a7,173a <memset+0xcc>
    1742:	006806b3          	add	a3,a6,t1
    1746:	00b307bb          	addw	a5,t1,a1
    174a:	0bc30b63          	beq	t1,t3,1800 <memset+0x192>
    174e:	00e68023          	sb	a4,0(a3)
    1752:	0017859b          	addw	a1,a5,1
    1756:	08c5fb63          	bgeu	a1,a2,17ec <memset+0x17e>
    175a:	00e680a3          	sb	a4,1(a3)
    175e:	0027859b          	addw	a1,a5,2
    1762:	08c5f563          	bgeu	a1,a2,17ec <memset+0x17e>
    1766:	00e68123          	sb	a4,2(a3)
    176a:	0037859b          	addw	a1,a5,3
    176e:	06c5ff63          	bgeu	a1,a2,17ec <memset+0x17e>
    1772:	00e681a3          	sb	a4,3(a3)
    1776:	0047859b          	addw	a1,a5,4
    177a:	06c5f963          	bgeu	a1,a2,17ec <memset+0x17e>
    177e:	00e68223          	sb	a4,4(a3)
    1782:	0057859b          	addw	a1,a5,5
    1786:	06c5f363          	bgeu	a1,a2,17ec <memset+0x17e>
    178a:	00e682a3          	sb	a4,5(a3)
    178e:	0067859b          	addw	a1,a5,6
    1792:	04c5fd63          	bgeu	a1,a2,17ec <memset+0x17e>
    1796:	00e68323          	sb	a4,6(a3)
    179a:	0077859b          	addw	a1,a5,7
    179e:	04c5f763          	bgeu	a1,a2,17ec <memset+0x17e>
    17a2:	00e683a3          	sb	a4,7(a3)
    17a6:	0087859b          	addw	a1,a5,8
    17aa:	04c5f163          	bgeu	a1,a2,17ec <memset+0x17e>
    17ae:	00e68423          	sb	a4,8(a3)
    17b2:	0097859b          	addw	a1,a5,9
    17b6:	02c5fb63          	bgeu	a1,a2,17ec <memset+0x17e>
    17ba:	00e684a3          	sb	a4,9(a3)
    17be:	00a7859b          	addw	a1,a5,10
    17c2:	02c5f563          	bgeu	a1,a2,17ec <memset+0x17e>
    17c6:	00e68523          	sb	a4,10(a3)
    17ca:	00b7859b          	addw	a1,a5,11
    17ce:	00c5ff63          	bgeu	a1,a2,17ec <memset+0x17e>
    17d2:	00e685a3          	sb	a4,11(a3)
    17d6:	00c7859b          	addw	a1,a5,12
    17da:	00c5f963          	bgeu	a1,a2,17ec <memset+0x17e>
    17de:	00e68623          	sb	a4,12(a3)
    17e2:	27b5                	addw	a5,a5,13
    17e4:	00c7f463          	bgeu	a5,a2,17ec <memset+0x17e>
    17e8:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17ec:	8082                	ret
    17ee:	482d                	li	a6,11
    17f0:	bd71                	j	168c <memset+0x1e>
    char *p = dest;
    17f2:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17f4:	4581                	li	a1,0
    17f6:	b701                	j	16f6 <memset+0x88>
    17f8:	00150813          	add	a6,a0,1
    17fc:	4585                	li	a1,1
    17fe:	bde5                	j	16f6 <memset+0x88>
    1800:	8082                	ret
    char *p = dest;
    1802:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1804:	4781                	li	a5,0
    1806:	b7a1                	j	174e <memset+0xe0>

0000000000001808 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1808:	00054783          	lbu	a5,0(a0)
    180c:	0005c703          	lbu	a4,0(a1)
    1810:	00e79863          	bne	a5,a4,1820 <strcmp+0x18>
    1814:	0505                	add	a0,a0,1
    1816:	0585                	add	a1,a1,1
    1818:	fbe5                	bnez	a5,1808 <strcmp>
    181a:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    181c:	9d19                	subw	a0,a0,a4
    181e:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1820:	0007851b          	sext.w	a0,a5
    1824:	bfe5                	j	181c <strcmp+0x14>

0000000000001826 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1826:	ca15                	beqz	a2,185a <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1828:	00054783          	lbu	a5,0(a0)
    if (!n--)
    182c:	167d                	add	a2,a2,-1
    182e:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1832:	eb99                	bnez	a5,1848 <strncmp+0x22>
    1834:	a815                	j	1868 <strncmp+0x42>
    1836:	00a68e63          	beq	a3,a0,1852 <strncmp+0x2c>
    183a:	0505                	add	a0,a0,1
    183c:	00f71b63          	bne	a4,a5,1852 <strncmp+0x2c>
    1840:	00054783          	lbu	a5,0(a0)
    1844:	cf89                	beqz	a5,185e <strncmp+0x38>
    1846:	85b2                	mv	a1,a2
    1848:	0005c703          	lbu	a4,0(a1)
    184c:	00158613          	add	a2,a1,1
    1850:	f37d                	bnez	a4,1836 <strncmp+0x10>
        ;
    return *l - *r;
    1852:	0007851b          	sext.w	a0,a5
    1856:	9d19                	subw	a0,a0,a4
    1858:	8082                	ret
        return 0;
    185a:	4501                	li	a0,0
}
    185c:	8082                	ret
    return *l - *r;
    185e:	0015c703          	lbu	a4,1(a1)
    1862:	4501                	li	a0,0
    1864:	9d19                	subw	a0,a0,a4
    1866:	8082                	ret
    1868:	0005c703          	lbu	a4,0(a1)
    186c:	4501                	li	a0,0
    186e:	b7e5                	j	1856 <strncmp+0x30>

0000000000001870 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1870:	00757793          	and	a5,a0,7
    1874:	cf89                	beqz	a5,188e <strlen+0x1e>
    1876:	87aa                	mv	a5,a0
    1878:	a029                	j	1882 <strlen+0x12>
    187a:	0785                	add	a5,a5,1
    187c:	0077f713          	and	a4,a5,7
    1880:	cb01                	beqz	a4,1890 <strlen+0x20>
        if (!*s)
    1882:	0007c703          	lbu	a4,0(a5)
    1886:	fb75                	bnez	a4,187a <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1888:	40a78533          	sub	a0,a5,a0
}
    188c:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    188e:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1890:	feff05b7          	lui	a1,0xfeff0
    1894:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedf1f>
    1898:	f0101637          	lui	a2,0xf0101
    189c:	05c2                	sll	a1,a1,0x10
    189e:	0612                	sll	a2,a2,0x4
    18a0:	6394                	ld	a3,0(a5)
    18a2:	eff58593          	add	a1,a1,-257
    18a6:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff121>
    18aa:	05c2                	sll	a1,a1,0x10
    18ac:	0642                	sll	a2,a2,0x10
    18ae:	eff58593          	add	a1,a1,-257
    18b2:	10160613          	add	a2,a2,257
    18b6:	00b68733          	add	a4,a3,a1
    18ba:	063e                	sll	a2,a2,0xf
    18bc:	fff6c693          	not	a3,a3
    18c0:	8f75                	and	a4,a4,a3
    18c2:	08060613          	add	a2,a2,128
    18c6:	8f71                	and	a4,a4,a2
    18c8:	eb11                	bnez	a4,18dc <strlen+0x6c>
    18ca:	6794                	ld	a3,8(a5)
    18cc:	07a1                	add	a5,a5,8
    18ce:	00b68733          	add	a4,a3,a1
    18d2:	fff6c693          	not	a3,a3
    18d6:	8f75                	and	a4,a4,a3
    18d8:	8f71                	and	a4,a4,a2
    18da:	db65                	beqz	a4,18ca <strlen+0x5a>
    for (; *s; s++)
    18dc:	0007c703          	lbu	a4,0(a5)
    18e0:	d745                	beqz	a4,1888 <strlen+0x18>
    18e2:	0017c703          	lbu	a4,1(a5)
    18e6:	0785                	add	a5,a5,1
    18e8:	d345                	beqz	a4,1888 <strlen+0x18>
    18ea:	0017c703          	lbu	a4,1(a5)
    18ee:	0785                	add	a5,a5,1
    18f0:	fb6d                	bnez	a4,18e2 <strlen+0x72>
    18f2:	bf59                	j	1888 <strlen+0x18>

00000000000018f4 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18f4:	00757713          	and	a4,a0,7
{
    18f8:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18fa:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18fe:	cb19                	beqz	a4,1914 <memchr+0x20>
    1900:	ce59                	beqz	a2,199e <memchr+0xaa>
    1902:	0007c703          	lbu	a4,0(a5)
    1906:	00b70963          	beq	a4,a1,1918 <memchr+0x24>
    190a:	0785                	add	a5,a5,1
    190c:	0077f713          	and	a4,a5,7
    1910:	167d                	add	a2,a2,-1
    1912:	f77d                	bnez	a4,1900 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1914:	4501                	li	a0,0
    if (n && *s != c)
    1916:	c649                	beqz	a2,19a0 <memchr+0xac>
    1918:	0007c703          	lbu	a4,0(a5)
    191c:	06b70663          	beq	a4,a1,1988 <memchr+0x94>
        size_t k = ONES * c;
    1920:	01010737          	lui	a4,0x1010
    1924:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e121>
    1928:	0742                	sll	a4,a4,0x10
    192a:	10170713          	add	a4,a4,257
    192e:	0742                	sll	a4,a4,0x10
    1930:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1934:	469d                	li	a3,7
        size_t k = ONES * c;
    1936:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    193a:	04c6f763          	bgeu	a3,a2,1988 <memchr+0x94>
    193e:	f0101837          	lui	a6,0xf0101
    1942:	feff08b7          	lui	a7,0xfeff0
    1946:	0812                	sll	a6,a6,0x4
    1948:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedf1f>
    194c:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff121>
    1950:	08c2                	sll	a7,a7,0x10
    1952:	0842                	sll	a6,a6,0x10
    1954:	eff88893          	add	a7,a7,-257
    1958:	10180813          	add	a6,a6,257
    195c:	08c2                	sll	a7,a7,0x10
    195e:	083e                	sll	a6,a6,0xf
    1960:	eff88893          	add	a7,a7,-257
    1964:	08080813          	add	a6,a6,128
    1968:	431d                	li	t1,7
    196a:	a029                	j	1974 <memchr+0x80>
    196c:	1661                	add	a2,a2,-8
    196e:	07a1                	add	a5,a5,8
    1970:	02c37663          	bgeu	t1,a2,199c <memchr+0xa8>
    1974:	6398                	ld	a4,0(a5)
    1976:	8f29                	xor	a4,a4,a0
    1978:	011706b3          	add	a3,a4,a7
    197c:	fff74713          	not	a4,a4
    1980:	8f75                	and	a4,a4,a3
    1982:	01077733          	and	a4,a4,a6
    1986:	d37d                	beqz	a4,196c <memchr+0x78>
        s = (const void *)w;
    1988:	853e                	mv	a0,a5
    198a:	a019                	j	1990 <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    198c:	0505                	add	a0,a0,1
    198e:	ca01                	beqz	a2,199e <memchr+0xaa>
    1990:	00054783          	lbu	a5,0(a0)
    1994:	167d                	add	a2,a2,-1
    1996:	feb79be3          	bne	a5,a1,198c <memchr+0x98>
    199a:	8082                	ret
    199c:	f675                	bnez	a2,1988 <memchr+0x94>
    return n ? (void *)s : 0;
    199e:	4501                	li	a0,0
}
    19a0:	8082                	ret

00000000000019a2 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19a2:	1101                	add	sp,sp,-32
    19a4:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19a6:	862e                	mv	a2,a1
{
    19a8:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19aa:	4581                	li	a1,0
{
    19ac:	e426                	sd	s1,8(sp)
    19ae:	ec06                	sd	ra,24(sp)
    19b0:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19b2:	f43ff0ef          	jal	18f4 <memchr>
    return p ? p - s : n;
    19b6:	c519                	beqz	a0,19c4 <strnlen+0x22>
}
    19b8:	60e2                	ld	ra,24(sp)
    19ba:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19bc:	8d05                	sub	a0,a0,s1
}
    19be:	64a2                	ld	s1,8(sp)
    19c0:	6105                	add	sp,sp,32
    19c2:	8082                	ret
    19c4:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19c6:	8522                	mv	a0,s0
}
    19c8:	6442                	ld	s0,16(sp)
    19ca:	64a2                	ld	s1,8(sp)
    19cc:	6105                	add	sp,sp,32
    19ce:	8082                	ret

00000000000019d0 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19d0:	00b547b3          	xor	a5,a0,a1
    19d4:	8b9d                	and	a5,a5,7
    19d6:	efb1                	bnez	a5,1a32 <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19d8:	0075f793          	and	a5,a1,7
    19dc:	ebb5                	bnez	a5,1a50 <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19de:	feff0637          	lui	a2,0xfeff0
    19e2:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedf1f>
    19e6:	f01016b7          	lui	a3,0xf0101
    19ea:	0642                	sll	a2,a2,0x10
    19ec:	0692                	sll	a3,a3,0x4
    19ee:	6198                	ld	a4,0(a1)
    19f0:	eff60613          	add	a2,a2,-257
    19f4:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff121>
    19f8:	0642                	sll	a2,a2,0x10
    19fa:	06c2                	sll	a3,a3,0x10
    19fc:	eff60613          	add	a2,a2,-257
    1a00:	10168693          	add	a3,a3,257
    1a04:	00c707b3          	add	a5,a4,a2
    1a08:	fff74813          	not	a6,a4
    1a0c:	06be                	sll	a3,a3,0xf
    1a0e:	0107f7b3          	and	a5,a5,a6
    1a12:	08068693          	add	a3,a3,128
    1a16:	8ff5                	and	a5,a5,a3
    1a18:	ef89                	bnez	a5,1a32 <strcpy+0x62>
    1a1a:	05a1                	add	a1,a1,8
    1a1c:	e118                	sd	a4,0(a0)
    1a1e:	6198                	ld	a4,0(a1)
    1a20:	0521                	add	a0,a0,8
    1a22:	00c707b3          	add	a5,a4,a2
    1a26:	fff74813          	not	a6,a4
    1a2a:	0107f7b3          	and	a5,a5,a6
    1a2e:	8ff5                	and	a5,a5,a3
    1a30:	d7ed                	beqz	a5,1a1a <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a32:	0005c783          	lbu	a5,0(a1)
    1a36:	00f50023          	sb	a5,0(a0)
    1a3a:	c785                	beqz	a5,1a62 <strcpy+0x92>
    1a3c:	0015c783          	lbu	a5,1(a1)
    1a40:	0505                	add	a0,a0,1
    1a42:	0585                	add	a1,a1,1
    1a44:	00f50023          	sb	a5,0(a0)
    1a48:	fbf5                	bnez	a5,1a3c <strcpy+0x6c>
        ;
    return d;
}
    1a4a:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a4c:	0505                	add	a0,a0,1
    1a4e:	db41                	beqz	a4,19de <strcpy+0xe>
            if (!(*d = *s))
    1a50:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a54:	0585                	add	a1,a1,1
    1a56:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a5a:	00f50023          	sb	a5,0(a0)
    1a5e:	f7fd                	bnez	a5,1a4c <strcpy+0x7c>
}
    1a60:	8082                	ret
    1a62:	8082                	ret

0000000000001a64 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a64:	00b547b3          	xor	a5,a0,a1
    1a68:	8b9d                	and	a5,a5,7
    1a6a:	efbd                	bnez	a5,1ae8 <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a6c:	0075f793          	and	a5,a1,7
    1a70:	1c078563          	beqz	a5,1c3a <strncpy+0x1d6>
    1a74:	ea11                	bnez	a2,1a88 <strncpy+0x24>
    1a76:	8082                	ret
    1a78:	0585                	add	a1,a1,1
    1a7a:	0075f793          	and	a5,a1,7
    1a7e:	167d                	add	a2,a2,-1
    1a80:	0505                	add	a0,a0,1
    1a82:	1a078c63          	beqz	a5,1c3a <strncpy+0x1d6>
    1a86:	ca3d                	beqz	a2,1afc <strncpy+0x98>
    1a88:	0005c783          	lbu	a5,0(a1)
    1a8c:	00f50023          	sb	a5,0(a0)
    1a90:	f7e5                	bnez	a5,1a78 <strncpy+0x14>
            ;
        if (!n || !*s)
    1a92:	0005c783          	lbu	a5,0(a1)
    1a96:	c7a5                	beqz	a5,1afe <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a98:	479d                	li	a5,7
    1a9a:	04c7f863          	bgeu	a5,a2,1aea <strncpy+0x86>
    1a9e:	f01016b7          	lui	a3,0xf0101
    1aa2:	feff0837          	lui	a6,0xfeff0
    1aa6:	0692                	sll	a3,a3,0x4
    1aa8:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedf1f>
    1aac:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff121>
    1ab0:	0842                	sll	a6,a6,0x10
    1ab2:	06c2                	sll	a3,a3,0x10
    1ab4:	eff80813          	add	a6,a6,-257
    1ab8:	10168693          	add	a3,a3,257
    1abc:	0842                	sll	a6,a6,0x10
    1abe:	06be                	sll	a3,a3,0xf
    1ac0:	eff80813          	add	a6,a6,-257
    1ac4:	08068693          	add	a3,a3,128
    1ac8:	431d                	li	t1,7
    1aca:	6198                	ld	a4,0(a1)
    1acc:	010707b3          	add	a5,a4,a6
    1ad0:	fff74893          	not	a7,a4
    1ad4:	0117f7b3          	and	a5,a5,a7
    1ad8:	8ff5                	and	a5,a5,a3
    1ada:	eb81                	bnez	a5,1aea <strncpy+0x86>
            *wd = *ws;
    1adc:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ade:	1661                	add	a2,a2,-8
    1ae0:	05a1                	add	a1,a1,8
    1ae2:	0521                	add	a0,a0,8
    1ae4:	fec363e3          	bltu	t1,a2,1aca <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1ae8:	ca11                	beqz	a2,1afc <strncpy+0x98>
    1aea:	0005c783          	lbu	a5,0(a1)
    1aee:	0585                	add	a1,a1,1
    1af0:	00f50023          	sb	a5,0(a0)
    1af4:	c789                	beqz	a5,1afe <strncpy+0x9a>
    1af6:	167d                	add	a2,a2,-1
    1af8:	0505                	add	a0,a0,1
    1afa:	fa65                	bnez	a2,1aea <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1afc:	8082                	ret
    1afe:	40a00733          	neg	a4,a0
    1b02:	00777793          	and	a5,a4,7
    1b06:	00778693          	add	a3,a5,7
    1b0a:	482d                	li	a6,11
    1b0c:	fff60593          	add	a1,a2,-1
    1b10:	1106ef63          	bltu	a3,a6,1c2e <strncpy+0x1ca>
    1b14:	12d5ee63          	bltu	a1,a3,1c50 <strncpy+0x1ec>
    1b18:	12078563          	beqz	a5,1c42 <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b1c:	00050023          	sb	zero,0(a0)
    1b20:	00677693          	and	a3,a4,6
    1b24:	12068263          	beqz	a3,1c48 <strncpy+0x1e4>
    1b28:	000500a3          	sb	zero,1(a0)
    1b2c:	4689                	li	a3,2
    1b2e:	12f6f463          	bgeu	a3,a5,1c56 <strncpy+0x1f2>
    1b32:	00050123          	sb	zero,2(a0)
    1b36:	8b11                	and	a4,a4,4
    1b38:	cf6d                	beqz	a4,1c32 <strncpy+0x1ce>
    1b3a:	000501a3          	sb	zero,3(a0)
    1b3e:	4711                	li	a4,4
    1b40:	00450693          	add	a3,a0,4
    1b44:	02f77363          	bgeu	a4,a5,1b6a <strncpy+0x106>
    1b48:	00050223          	sb	zero,4(a0)
    1b4c:	4715                	li	a4,5
    1b4e:	00550693          	add	a3,a0,5
    1b52:	00e78c63          	beq	a5,a4,1b6a <strncpy+0x106>
    1b56:	000502a3          	sb	zero,5(a0)
    1b5a:	471d                	li	a4,7
    1b5c:	10e79163          	bne	a5,a4,1c5e <strncpy+0x1fa>
    1b60:	00750693          	add	a3,a0,7
    1b64:	00050323          	sb	zero,6(a0)
    1b68:	471d                	li	a4,7
    1b6a:	40f608b3          	sub	a7,a2,a5
    1b6e:	ff88f813          	and	a6,a7,-8
    1b72:	97aa                	add	a5,a5,a0
    1b74:	010785b3          	add	a1,a5,a6
    1b78:	0007b023          	sd	zero,0(a5)
    1b7c:	07a1                	add	a5,a5,8
    1b7e:	feb79de3          	bne	a5,a1,1b78 <strncpy+0x114>
    1b82:	00e807bb          	addw	a5,a6,a4
    1b86:	01068733          	add	a4,a3,a6
    1b8a:	0b088b63          	beq	a7,a6,1c40 <strncpy+0x1dc>
    1b8e:	00070023          	sb	zero,0(a4)
    1b92:	0017869b          	addw	a3,a5,1
    1b96:	f6c6f3e3          	bgeu	a3,a2,1afc <strncpy+0x98>
    1b9a:	000700a3          	sb	zero,1(a4)
    1b9e:	0027869b          	addw	a3,a5,2
    1ba2:	f4c6fde3          	bgeu	a3,a2,1afc <strncpy+0x98>
    1ba6:	00070123          	sb	zero,2(a4)
    1baa:	0037869b          	addw	a3,a5,3
    1bae:	f4c6f7e3          	bgeu	a3,a2,1afc <strncpy+0x98>
    1bb2:	000701a3          	sb	zero,3(a4)
    1bb6:	0047869b          	addw	a3,a5,4
    1bba:	f4c6f1e3          	bgeu	a3,a2,1afc <strncpy+0x98>
    1bbe:	00070223          	sb	zero,4(a4)
    1bc2:	0057869b          	addw	a3,a5,5
    1bc6:	f2c6fbe3          	bgeu	a3,a2,1afc <strncpy+0x98>
    1bca:	000702a3          	sb	zero,5(a4)
    1bce:	0067869b          	addw	a3,a5,6
    1bd2:	f2c6f5e3          	bgeu	a3,a2,1afc <strncpy+0x98>
    1bd6:	00070323          	sb	zero,6(a4)
    1bda:	0077869b          	addw	a3,a5,7
    1bde:	f0c6ffe3          	bgeu	a3,a2,1afc <strncpy+0x98>
    1be2:	000703a3          	sb	zero,7(a4)
    1be6:	0087869b          	addw	a3,a5,8
    1bea:	f0c6f9e3          	bgeu	a3,a2,1afc <strncpy+0x98>
    1bee:	00070423          	sb	zero,8(a4)
    1bf2:	0097869b          	addw	a3,a5,9
    1bf6:	f0c6f3e3          	bgeu	a3,a2,1afc <strncpy+0x98>
    1bfa:	000704a3          	sb	zero,9(a4)
    1bfe:	00a7869b          	addw	a3,a5,10
    1c02:	eec6fde3          	bgeu	a3,a2,1afc <strncpy+0x98>
    1c06:	00070523          	sb	zero,10(a4)
    1c0a:	00b7869b          	addw	a3,a5,11
    1c0e:	eec6f7e3          	bgeu	a3,a2,1afc <strncpy+0x98>
    1c12:	000705a3          	sb	zero,11(a4)
    1c16:	00c7869b          	addw	a3,a5,12
    1c1a:	eec6f1e3          	bgeu	a3,a2,1afc <strncpy+0x98>
    1c1e:	00070623          	sb	zero,12(a4)
    1c22:	27b5                	addw	a5,a5,13
    1c24:	ecc7fce3          	bgeu	a5,a2,1afc <strncpy+0x98>
    1c28:	000706a3          	sb	zero,13(a4)
}
    1c2c:	8082                	ret
    1c2e:	46ad                	li	a3,11
    1c30:	b5d5                	j	1b14 <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c32:	00350693          	add	a3,a0,3
    1c36:	470d                	li	a4,3
    1c38:	bf0d                	j	1b6a <strncpy+0x106>
        if (!n || !*s)
    1c3a:	e4061ce3          	bnez	a2,1a92 <strncpy+0x2e>
}
    1c3e:	8082                	ret
    1c40:	8082                	ret
    char *p = dest;
    1c42:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c44:	4701                	li	a4,0
    1c46:	b715                	j	1b6a <strncpy+0x106>
    1c48:	00150693          	add	a3,a0,1
    1c4c:	4705                	li	a4,1
    1c4e:	bf31                	j	1b6a <strncpy+0x106>
    char *p = dest;
    1c50:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c52:	4781                	li	a5,0
    1c54:	bf2d                	j	1b8e <strncpy+0x12a>
    1c56:	00250693          	add	a3,a0,2
    1c5a:	4709                	li	a4,2
    1c5c:	b739                	j	1b6a <strncpy+0x106>
    1c5e:	00650693          	add	a3,a0,6
    1c62:	4719                	li	a4,6
    1c64:	b719                	j	1b6a <strncpy+0x106>

0000000000001c66 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c66:	87aa                	mv	a5,a0
    1c68:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c6a:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c6e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c72:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c74:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c76:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c7a:	2501                	sext.w	a0,a0
    1c7c:	8082                	ret

0000000000001c7e <openat>:
    register long a7 __asm__("a7") = n;
    1c7e:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c82:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c86:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c8a:	2501                	sext.w	a0,a0
    1c8c:	8082                	ret

0000000000001c8e <fcntl>:
    register long a7 __asm__("a7") = n;
    1c8e:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c90:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1c94:	2501                	sext.w	a0,a0
    1c96:	8082                	ret

0000000000001c98 <close>:
    register long a7 __asm__("a7") = n;
    1c98:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c9c:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1ca0:	2501                	sext.w	a0,a0
    1ca2:	8082                	ret

0000000000001ca4 <read>:
    register long a7 __asm__("a7") = n;
    1ca4:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ca8:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1cac:	8082                	ret

0000000000001cae <write>:
    register long a7 __asm__("a7") = n;
    1cae:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cb2:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1cb6:	8082                	ret

0000000000001cb8 <getpid>:
    register long a7 __asm__("a7") = n;
    1cb8:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1cbc:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1cc0:	2501                	sext.w	a0,a0
    1cc2:	8082                	ret

0000000000001cc4 <getppid>:
    register long a7 __asm__("a7") = n;
    1cc4:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1cc8:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1ccc:	2501                	sext.w	a0,a0
    1cce:	8082                	ret

0000000000001cd0 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cd0:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cd4:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cd8:	2501                	sext.w	a0,a0
    1cda:	8082                	ret

0000000000001cdc <fork>:
    register long a7 __asm__("a7") = n;
    1cdc:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1ce0:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1ce2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ce4:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1ce8:	2501                	sext.w	a0,a0
    1cea:	8082                	ret

0000000000001cec <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cec:	85b2                	mv	a1,a2
    1cee:	863a                	mv	a2,a4
    if (stack)
    1cf0:	c191                	beqz	a1,1cf4 <clone+0x8>
	stack += stack_size;
    1cf2:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cf4:	4781                	li	a5,0
    1cf6:	4701                	li	a4,0
    1cf8:	4681                	li	a3,0
    1cfa:	2601                	sext.w	a2,a2
    1cfc:	a2ed                	j	1ee6 <__clone>

0000000000001cfe <exit>:
    register long a7 __asm__("a7") = n;
    1cfe:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d02:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d06:	8082                	ret

0000000000001d08 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d08:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d0c:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d0e:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d12:	2501                	sext.w	a0,a0
    1d14:	8082                	ret

0000000000001d16 <exec>:
    register long a7 __asm__("a7") = n;
    1d16:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d1a:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d1e:	2501                	sext.w	a0,a0
    1d20:	8082                	ret

0000000000001d22 <execve>:
    register long a7 __asm__("a7") = n;
    1d22:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d26:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d2a:	2501                	sext.w	a0,a0
    1d2c:	8082                	ret

0000000000001d2e <times>:
    register long a7 __asm__("a7") = n;
    1d2e:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d32:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d36:	2501                	sext.w	a0,a0
    1d38:	8082                	ret

0000000000001d3a <get_time>:

int64 get_time()
{
    1d3a:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d3c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d40:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d42:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d44:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d48:	2501                	sext.w	a0,a0
    1d4a:	ed09                	bnez	a0,1d64 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d4c:	67a2                	ld	a5,8(sp)
    1d4e:	3e800713          	li	a4,1000
    1d52:	00015503          	lhu	a0,0(sp)
    1d56:	02e7d7b3          	divu	a5,a5,a4
    1d5a:	02e50533          	mul	a0,a0,a4
    1d5e:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d60:	0141                	add	sp,sp,16
    1d62:	8082                	ret
        return -1;
    1d64:	557d                	li	a0,-1
    1d66:	bfed                	j	1d60 <get_time+0x26>

0000000000001d68 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d68:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d6c:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d70:	2501                	sext.w	a0,a0
    1d72:	8082                	ret

0000000000001d74 <time>:
    register long a7 __asm__("a7") = n;
    1d74:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d78:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d7c:	2501                	sext.w	a0,a0
    1d7e:	8082                	ret

0000000000001d80 <sleep>:

int sleep(unsigned long long time)
{
    1d80:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d82:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d84:	850a                	mv	a0,sp
    1d86:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d88:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d8c:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d8e:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d92:	e501                	bnez	a0,1d9a <sleep+0x1a>
    return 0;
    1d94:	4501                	li	a0,0
}
    1d96:	0141                	add	sp,sp,16
    1d98:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d9a:	4502                	lw	a0,0(sp)
}
    1d9c:	0141                	add	sp,sp,16
    1d9e:	8082                	ret

0000000000001da0 <set_priority>:
    register long a7 __asm__("a7") = n;
    1da0:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1da4:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1da8:	2501                	sext.w	a0,a0
    1daa:	8082                	ret

0000000000001dac <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1dac:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1db0:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1db4:	8082                	ret

0000000000001db6 <munmap>:
    register long a7 __asm__("a7") = n;
    1db6:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dba:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	8082                	ret

0000000000001dc2 <wait>:

int wait(int *code)
{
    1dc2:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dc4:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1dc8:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1dca:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1dcc:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dce:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1dd2:	2501                	sext.w	a0,a0
    1dd4:	8082                	ret

0000000000001dd6 <spawn>:
    register long a7 __asm__("a7") = n;
    1dd6:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1dda:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dde:	2501                	sext.w	a0,a0
    1de0:	8082                	ret

0000000000001de2 <mailread>:
    register long a7 __asm__("a7") = n;
    1de2:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1de6:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dea:	2501                	sext.w	a0,a0
    1dec:	8082                	ret

0000000000001dee <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dee:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df2:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1df6:	2501                	sext.w	a0,a0
    1df8:	8082                	ret

0000000000001dfa <fstat>:
    register long a7 __asm__("a7") = n;
    1dfa:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dfe:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e02:	2501                	sext.w	a0,a0
    1e04:	8082                	ret

0000000000001e06 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e06:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e08:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e0c:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e0e:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e12:	2501                	sext.w	a0,a0
    1e14:	8082                	ret

0000000000001e16 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e16:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e18:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e1c:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e1e:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e22:	2501                	sext.w	a0,a0
    1e24:	8082                	ret

0000000000001e26 <link>:

int link(char *old_path, char *new_path)
{
    1e26:	87aa                	mv	a5,a0
    1e28:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e2a:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e2e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e32:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e34:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e38:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e3a:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e3e:	2501                	sext.w	a0,a0
    1e40:	8082                	ret

0000000000001e42 <unlink>:

int unlink(char *path)
{
    1e42:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e44:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e48:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e4c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e4e:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e52:	2501                	sext.w	a0,a0
    1e54:	8082                	ret

0000000000001e56 <uname>:
    register long a7 __asm__("a7") = n;
    1e56:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e5a:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e5e:	2501                	sext.w	a0,a0
    1e60:	8082                	ret

0000000000001e62 <brk>:
    register long a7 __asm__("a7") = n;
    1e62:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e66:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e6a:	2501                	sext.w	a0,a0
    1e6c:	8082                	ret

0000000000001e6e <getcwd>:
    register long a7 __asm__("a7") = n;
    1e6e:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e70:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e74:	8082                	ret

0000000000001e76 <chdir>:
    register long a7 __asm__("a7") = n;
    1e76:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e7a:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e7e:	2501                	sext.w	a0,a0
    1e80:	8082                	ret

0000000000001e82 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e82:	862e                	mv	a2,a1
    1e84:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e86:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e88:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e8c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e90:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e92:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e94:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e98:	2501                	sext.w	a0,a0
    1e9a:	8082                	ret

0000000000001e9c <getdents>:
    register long a7 __asm__("a7") = n;
    1e9c:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ea0:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1ea4:	2501                	sext.w	a0,a0
    1ea6:	8082                	ret

0000000000001ea8 <pipe>:
    register long a7 __asm__("a7") = n;
    1ea8:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1eac:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eae:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1eb2:	2501                	sext.w	a0,a0
    1eb4:	8082                	ret

0000000000001eb6 <dup>:
    register long a7 __asm__("a7") = n;
    1eb6:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1eb8:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1ebc:	2501                	sext.w	a0,a0
    1ebe:	8082                	ret

0000000000001ec0 <dup2>:
    register long a7 __asm__("a7") = n;
    1ec0:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1ec2:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ec4:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ec8:	2501                	sext.w	a0,a0
    1eca:	8082                	ret

0000000000001ecc <mount>:
    register long a7 __asm__("a7") = n;
    1ecc:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ed0:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ed4:	2501                	sext.w	a0,a0
    1ed6:	8082                	ret

0000000000001ed8 <umount>:
    register long a7 __asm__("a7") = n;
    1ed8:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1edc:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ede:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ee2:	2501                	sext.w	a0,a0
    1ee4:	8082                	ret

0000000000001ee6 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ee6:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1ee8:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1eea:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1eec:	8532                	mv	a0,a2
	mv a2, a4
    1eee:	863a                	mv	a2,a4
	mv a3, a5
    1ef0:	86be                	mv	a3,a5
	mv a4, a6
    1ef2:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ef4:	0dc00893          	li	a7,220
	ecall
    1ef8:	00000073          	ecall

	beqz a0, 1f
    1efc:	c111                	beqz	a0,1f00 <__clone+0x1a>
	# Parent
	ret
    1efe:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f00:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f02:	6522                	ld	a0,8(sp)
	jalr a1
    1f04:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f06:	05d00893          	li	a7,93
	ecall
    1f0a:	00000073          	ecall
