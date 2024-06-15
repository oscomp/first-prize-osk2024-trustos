
/root/oskernel2024-trustos/pre_ctests/build/riscv64/wait:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a0f1                	j	10ce <__start_main>

0000000000001004 <test_wait>:
#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"

void test_wait(void){
    1004:	7179                	add	sp,sp,-48
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f1250513          	add	a0,a0,-238 # 1f18 <__clone+0x28>
void test_wait(void){
    100e:	f406                	sd	ra,40(sp)
    TEST_START(__func__);
    1010:	2f6000ef          	jal	1306 <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	fbc50513          	add	a0,a0,-68 # 1fd0 <__func__.0>
    101c:	2ea000ef          	jal	1306 <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	f1050513          	add	a0,a0,-240 # 1f30 <__clone+0x40>
    1028:	2de000ef          	jal	1306 <puts>
    int cpid, wstatus;
    cpid = fork();
    102c:	4bb000ef          	jal	1ce6 <fork>
    if(cpid == 0){
    1030:	ed1d                	bnez	a0,106e <test_wait+0x6a>
	printf("This is child process\n");
    1032:	00001517          	auipc	a0,0x1
    1036:	f0e50513          	add	a0,a0,-242 # 1f40 <__clone+0x50>
    103a:	2ee000ef          	jal	1328 <printf>
        exit(0);
    103e:	4501                	li	a0,0
    1040:	4c9000ef          	jal	1d08 <exit>
	if(ret == cpid)
	    printf("wait child success.\nwstatus: %d\n", wstatus);
	else
	    printf("wait child error.\n");
    }
    TEST_END(__func__);
    1044:	00001517          	auipc	a0,0x1
    1048:	f7450513          	add	a0,a0,-140 # 1fb8 <__clone+0xc8>
    104c:	2ba000ef          	jal	1306 <puts>
    1050:	00001517          	auipc	a0,0x1
    1054:	f8050513          	add	a0,a0,-128 # 1fd0 <__func__.0>
    1058:	2ae000ef          	jal	1306 <puts>
    105c:	00001517          	auipc	a0,0x1
    1060:	ed450513          	add	a0,a0,-300 # 1f30 <__clone+0x40>
    1064:	2a2000ef          	jal	1306 <puts>
}
    1068:	70a2                	ld	ra,40(sp)
    106a:	6145                	add	sp,sp,48
    106c:	8082                	ret
	pid_t ret = wait(&wstatus);
    106e:	f022                	sd	s0,32(sp)
    1070:	842a                	mv	s0,a0
    1072:	0068                	add	a0,sp,12
    1074:	ec26                	sd	s1,24(sp)
    1076:	557000ef          	jal	1dcc <wait>
	assert(ret != -1);
    107a:	57fd                	li	a5,-1
	pid_t ret = wait(&wstatus);
    107c:	84aa                	mv	s1,a0
	assert(ret != -1);
    107e:	02f50763          	beq	a0,a5,10ac <test_wait+0xa8>
	if(ret == cpid)
    1082:	00940b63          	beq	s0,s1,1098 <test_wait+0x94>
	    printf("wait child error.\n");
    1086:	00001517          	auipc	a0,0x1
    108a:	f1a50513          	add	a0,a0,-230 # 1fa0 <__clone+0xb0>
    108e:	29a000ef          	jal	1328 <printf>
    1092:	7402                	ld	s0,32(sp)
    1094:	64e2                	ld	s1,24(sp)
    1096:	b77d                	j	1044 <test_wait+0x40>
	    printf("wait child success.\nwstatus: %d\n", wstatus);
    1098:	45b2                	lw	a1,12(sp)
    109a:	00001517          	auipc	a0,0x1
    109e:	ede50513          	add	a0,a0,-290 # 1f78 <__clone+0x88>
    10a2:	286000ef          	jal	1328 <printf>
    10a6:	7402                	ld	s0,32(sp)
    10a8:	64e2                	ld	s1,24(sp)
    10aa:	bf69                	j	1044 <test_wait+0x40>
	assert(ret != -1);
    10ac:	00001517          	auipc	a0,0x1
    10b0:	eac50513          	add	a0,a0,-340 # 1f58 <__clone+0x68>
    10b4:	4f2000ef          	jal	15a6 <panic>
	if(ret == cpid)
    10b8:	fc9417e3          	bne	s0,s1,1086 <test_wait+0x82>
    10bc:	bff1                	j	1098 <test_wait+0x94>

00000000000010be <main>:

int main(void){
    10be:	1141                	add	sp,sp,-16
    10c0:	e406                	sd	ra,8(sp)
    test_wait();
    10c2:	f43ff0ef          	jal	1004 <test_wait>
    return 0;
}
    10c6:	60a2                	ld	ra,8(sp)
    10c8:	4501                	li	a0,0
    10ca:	0141                	add	sp,sp,16
    10cc:	8082                	ret

00000000000010ce <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10ce:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10d0:	4108                	lw	a0,0(a0)
{
    10d2:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10d4:	05a1                	add	a1,a1,8
{
    10d6:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10d8:	fe7ff0ef          	jal	10be <main>
    10dc:	42d000ef          	jal	1d08 <exit>
	return 0;
}
    10e0:	60a2                	ld	ra,8(sp)
    10e2:	4501                	li	a0,0
    10e4:	0141                	add	sp,sp,16
    10e6:	8082                	ret

00000000000010e8 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10e8:	7179                	add	sp,sp,-48
    10ea:	f406                	sd	ra,40(sp)
    10ec:	0005081b          	sext.w	a6,a0
    10f0:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10f2:	00055563          	bgez	a0,10fc <printint.constprop.0+0x14>
        x = -xx;
    10f6:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    10fa:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10fc:	02b8763b          	remuw	a2,a6,a1
    1100:	00001697          	auipc	a3,0x1
    1104:	ee068693          	add	a3,a3,-288 # 1fe0 <digits>
    buf[16] = 0;
    1108:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    110c:	0005871b          	sext.w	a4,a1
    1110:	1602                	sll	a2,a2,0x20
    1112:	9201                	srl	a2,a2,0x20
    1114:	9636                	add	a2,a2,a3
    1116:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    111a:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    111e:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1122:	10b86c63          	bltu	a6,a1,123a <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    1126:	02e5763b          	remuw	a2,a0,a4
    112a:	1602                	sll	a2,a2,0x20
    112c:	9201                	srl	a2,a2,0x20
    112e:	9636                	add	a2,a2,a3
    1130:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1134:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1138:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    113c:	10e56863          	bltu	a0,a4,124c <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    1140:	02e5f63b          	remuw	a2,a1,a4
    1144:	1602                	sll	a2,a2,0x20
    1146:	9201                	srl	a2,a2,0x20
    1148:	9636                	add	a2,a2,a3
    114a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    114e:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1152:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1156:	10e5e463          	bltu	a1,a4,125e <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    115a:	02e5763b          	remuw	a2,a0,a4
    115e:	1602                	sll	a2,a2,0x20
    1160:	9201                	srl	a2,a2,0x20
    1162:	9636                	add	a2,a2,a3
    1164:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1168:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    116c:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1170:	10e56063          	bltu	a0,a4,1270 <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    1174:	02e5f63b          	remuw	a2,a1,a4
    1178:	1602                	sll	a2,a2,0x20
    117a:	9201                	srl	a2,a2,0x20
    117c:	9636                	add	a2,a2,a3
    117e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1182:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1186:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    118a:	0ee5ec63          	bltu	a1,a4,1282 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    118e:	02e5763b          	remuw	a2,a0,a4
    1192:	1602                	sll	a2,a2,0x20
    1194:	9201                	srl	a2,a2,0x20
    1196:	9636                	add	a2,a2,a3
    1198:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    119c:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11a0:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11a4:	08e56263          	bltu	a0,a4,1228 <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    11a8:	02e5f63b          	remuw	a2,a1,a4
    11ac:	1602                	sll	a2,a2,0x20
    11ae:	9201                	srl	a2,a2,0x20
    11b0:	9636                	add	a2,a2,a3
    11b2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b6:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11ba:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11be:	0ce5eb63          	bltu	a1,a4,1294 <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    11c2:	02e5763b          	remuw	a2,a0,a4
    11c6:	1602                	sll	a2,a2,0x20
    11c8:	9201                	srl	a2,a2,0x20
    11ca:	9636                	add	a2,a2,a3
    11cc:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11d0:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11d4:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11d8:	0ce56763          	bltu	a0,a4,12a6 <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    11dc:	02e5f63b          	remuw	a2,a1,a4
    11e0:	1602                	sll	a2,a2,0x20
    11e2:	9201                	srl	a2,a2,0x20
    11e4:	9636                	add	a2,a2,a3
    11e6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ea:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11ee:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11f2:	0ce5e363          	bltu	a1,a4,12b8 <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    11f6:	1782                	sll	a5,a5,0x20
    11f8:	9381                	srl	a5,a5,0x20
    11fa:	96be                	add	a3,a3,a5
    11fc:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    1200:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    1202:	00f10723          	sb	a5,14(sp)
    if (sign)
    1206:	00088763          	beqz	a7,1214 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    120a:	02d00793          	li	a5,45
    120e:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1212:	4595                	li	a1,5
    write(f, s, l);
    1214:	003c                	add	a5,sp,8
    1216:	4641                	li	a2,16
    1218:	9e0d                	subw	a2,a2,a1
    121a:	4505                	li	a0,1
    121c:	95be                	add	a1,a1,a5
    121e:	29b000ef          	jal	1cb8 <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1222:	70a2                	ld	ra,40(sp)
    1224:	6145                	add	sp,sp,48
    1226:	8082                	ret
    i++;
    1228:	45a9                	li	a1,10
    if (sign)
    122a:	fe0885e3          	beqz	a7,1214 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    122e:	02d00793          	li	a5,45
    1232:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1236:	45a5                	li	a1,9
    1238:	bff1                	j	1214 <printint.constprop.0+0x12c>
    i++;
    123a:	45bd                	li	a1,15
    if (sign)
    123c:	fc088ce3          	beqz	a7,1214 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1240:	02d00793          	li	a5,45
    1244:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1248:	45b9                	li	a1,14
    124a:	b7e9                	j	1214 <printint.constprop.0+0x12c>
    i++;
    124c:	45b9                	li	a1,14
    if (sign)
    124e:	fc0883e3          	beqz	a7,1214 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1252:	02d00793          	li	a5,45
    1256:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    125a:	45b5                	li	a1,13
    125c:	bf65                	j	1214 <printint.constprop.0+0x12c>
    i++;
    125e:	45b5                	li	a1,13
    if (sign)
    1260:	fa088ae3          	beqz	a7,1214 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1264:	02d00793          	li	a5,45
    1268:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    126c:	45b1                	li	a1,12
    126e:	b75d                	j	1214 <printint.constprop.0+0x12c>
    i++;
    1270:	45b1                	li	a1,12
    if (sign)
    1272:	fa0881e3          	beqz	a7,1214 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1276:	02d00793          	li	a5,45
    127a:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    127e:	45ad                	li	a1,11
    1280:	bf51                	j	1214 <printint.constprop.0+0x12c>
    i++;
    1282:	45ad                	li	a1,11
    if (sign)
    1284:	f80888e3          	beqz	a7,1214 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1288:	02d00793          	li	a5,45
    128c:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1290:	45a9                	li	a1,10
    1292:	b749                	j	1214 <printint.constprop.0+0x12c>
    i++;
    1294:	45a5                	li	a1,9
    if (sign)
    1296:	f6088fe3          	beqz	a7,1214 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    129a:	02d00793          	li	a5,45
    129e:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12a2:	45a1                	li	a1,8
    12a4:	bf85                	j	1214 <printint.constprop.0+0x12c>
    i++;
    12a6:	45a1                	li	a1,8
    if (sign)
    12a8:	f60886e3          	beqz	a7,1214 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12ac:	02d00793          	li	a5,45
    12b0:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12b4:	459d                	li	a1,7
    12b6:	bfb9                	j	1214 <printint.constprop.0+0x12c>
    i++;
    12b8:	459d                	li	a1,7
    if (sign)
    12ba:	f4088de3          	beqz	a7,1214 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12be:	02d00793          	li	a5,45
    12c2:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12c6:	4599                	li	a1,6
    12c8:	b7b1                	j	1214 <printint.constprop.0+0x12c>

00000000000012ca <getchar>:
{
    12ca:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12cc:	00f10593          	add	a1,sp,15
    12d0:	4605                	li	a2,1
    12d2:	4501                	li	a0,0
{
    12d4:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12d6:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12da:	1d5000ef          	jal	1cae <read>
}
    12de:	60e2                	ld	ra,24(sp)
    12e0:	00f14503          	lbu	a0,15(sp)
    12e4:	6105                	add	sp,sp,32
    12e6:	8082                	ret

00000000000012e8 <putchar>:
{
    12e8:	1101                	add	sp,sp,-32
    12ea:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12ec:	00f10593          	add	a1,sp,15
    12f0:	4605                	li	a2,1
    12f2:	4505                	li	a0,1
{
    12f4:	ec06                	sd	ra,24(sp)
    char byte = c;
    12f6:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12fa:	1bf000ef          	jal	1cb8 <write>
}
    12fe:	60e2                	ld	ra,24(sp)
    1300:	2501                	sext.w	a0,a0
    1302:	6105                	add	sp,sp,32
    1304:	8082                	ret

0000000000001306 <puts>:
{
    1306:	1141                	add	sp,sp,-16
    1308:	e406                	sd	ra,8(sp)
    130a:	e022                	sd	s0,0(sp)
    130c:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    130e:	56c000ef          	jal	187a <strlen>
    1312:	862a                	mv	a2,a0
    1314:	85a2                	mv	a1,s0
    1316:	4505                	li	a0,1
    1318:	1a1000ef          	jal	1cb8 <write>
}
    131c:	60a2                	ld	ra,8(sp)
    131e:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1320:	957d                	sra	a0,a0,0x3f
    return r;
    1322:	2501                	sext.w	a0,a0
}
    1324:	0141                	add	sp,sp,16
    1326:	8082                	ret

0000000000001328 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1328:	7131                	add	sp,sp,-192
    132a:	e4d6                	sd	s5,72(sp)
    132c:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    132e:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1330:	013c                	add	a5,sp,136
{
    1332:	f0ca                	sd	s2,96(sp)
    1334:	ecce                	sd	s3,88(sp)
    1336:	e8d2                	sd	s4,80(sp)
    1338:	e0da                	sd	s6,64(sp)
    133a:	fc5e                	sd	s7,56(sp)
    133c:	fc86                	sd	ra,120(sp)
    133e:	f8a2                	sd	s0,112(sp)
    1340:	f4a6                	sd	s1,104(sp)
    1342:	e52e                	sd	a1,136(sp)
    1344:	e932                	sd	a2,144(sp)
    1346:	ed36                	sd	a3,152(sp)
    1348:	f13a                	sd	a4,160(sp)
    134a:	f942                	sd	a6,176(sp)
    134c:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    134e:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1350:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1354:	07300a13          	li	s4,115
    1358:	07800b93          	li	s7,120
    135c:	06400b13          	li	s6,100
    buf[i++] = '0';
    1360:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x5850>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1364:	00001997          	auipc	s3,0x1
    1368:	c7c98993          	add	s3,s3,-900 # 1fe0 <digits>
        if (!*s)
    136c:	00054783          	lbu	a5,0(a0)
    1370:	16078863          	beqz	a5,14e0 <printf+0x1b8>
    1374:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1376:	19278063          	beq	a5,s2,14f6 <printf+0x1ce>
    137a:	00164783          	lbu	a5,1(a2)
    137e:	0605                	add	a2,a2,1
    1380:	fbfd                	bnez	a5,1376 <printf+0x4e>
    1382:	84b2                	mv	s1,a2
        l = z - a;
    1384:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1388:	85aa                	mv	a1,a0
    138a:	8622                	mv	a2,s0
    138c:	4505                	li	a0,1
    138e:	12b000ef          	jal	1cb8 <write>
        if (l)
    1392:	18041763          	bnez	s0,1520 <printf+0x1f8>
        if (s[1] == 0)
    1396:	0014c783          	lbu	a5,1(s1)
    139a:	14078363          	beqz	a5,14e0 <printf+0x1b8>
        switch (s[1])
    139e:	19478f63          	beq	a5,s4,153c <printf+0x214>
    13a2:	18fa6163          	bltu	s4,a5,1524 <printf+0x1fc>
    13a6:	1b678e63          	beq	a5,s6,1562 <printf+0x23a>
    13aa:	07000713          	li	a4,112
    13ae:	1ce79463          	bne	a5,a4,1576 <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13b2:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13b4:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13b8:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13ba:	631c                	ld	a5,0(a4)
    13bc:	0721                	add	a4,a4,8
    13be:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13c0:	00479293          	sll	t0,a5,0x4
    13c4:	00879f93          	sll	t6,a5,0x8
    13c8:	00c79f13          	sll	t5,a5,0xc
    13cc:	01079e93          	sll	t4,a5,0x10
    13d0:	01479e13          	sll	t3,a5,0x14
    13d4:	01879313          	sll	t1,a5,0x18
    13d8:	01c79893          	sll	a7,a5,0x1c
    13dc:	02479813          	sll	a6,a5,0x24
    13e0:	02879513          	sll	a0,a5,0x28
    13e4:	02c79593          	sll	a1,a5,0x2c
    13e8:	03079693          	sll	a3,a5,0x30
    13ec:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13f0:	03c7d413          	srl	s0,a5,0x3c
    13f4:	01c7d39b          	srlw	t2,a5,0x1c
    13f8:	03c2d293          	srl	t0,t0,0x3c
    13fc:	03cfdf93          	srl	t6,t6,0x3c
    1400:	03cf5f13          	srl	t5,t5,0x3c
    1404:	03cede93          	srl	t4,t4,0x3c
    1408:	03ce5e13          	srl	t3,t3,0x3c
    140c:	03c35313          	srl	t1,t1,0x3c
    1410:	03c8d893          	srl	a7,a7,0x3c
    1414:	03c85813          	srl	a6,a6,0x3c
    1418:	9171                	srl	a0,a0,0x3c
    141a:	91f1                	srl	a1,a1,0x3c
    141c:	92f1                	srl	a3,a3,0x3c
    141e:	9371                	srl	a4,a4,0x3c
    1420:	974e                	add	a4,a4,s3
    1422:	944e                	add	s0,s0,s3
    1424:	92ce                	add	t0,t0,s3
    1426:	9fce                	add	t6,t6,s3
    1428:	9f4e                	add	t5,t5,s3
    142a:	9ece                	add	t4,t4,s3
    142c:	9e4e                	add	t3,t3,s3
    142e:	934e                	add	t1,t1,s3
    1430:	98ce                	add	a7,a7,s3
    1432:	93ce                	add	t2,t2,s3
    1434:	984e                	add	a6,a6,s3
    1436:	954e                	add	a0,a0,s3
    1438:	95ce                	add	a1,a1,s3
    143a:	96ce                	add	a3,a3,s3
    143c:	00074083          	lbu	ra,0(a4)
    1440:	0002c283          	lbu	t0,0(t0)
    1444:	000fcf83          	lbu	t6,0(t6)
    1448:	000f4f03          	lbu	t5,0(t5)
    144c:	000ece83          	lbu	t4,0(t4)
    1450:	000e4e03          	lbu	t3,0(t3)
    1454:	00034303          	lbu	t1,0(t1)
    1458:	0008c883          	lbu	a7,0(a7)
    145c:	0003c383          	lbu	t2,0(t2)
    1460:	00084803          	lbu	a6,0(a6)
    1464:	00054503          	lbu	a0,0(a0)
    1468:	0005c583          	lbu	a1,0(a1)
    146c:	0006c683          	lbu	a3,0(a3)
    1470:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1474:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1478:	9371                	srl	a4,a4,0x3c
    147a:	8bbd                	and	a5,a5,15
    147c:	974e                	add	a4,a4,s3
    147e:	97ce                	add	a5,a5,s3
    1480:	005105a3          	sb	t0,11(sp)
    1484:	01f10623          	sb	t6,12(sp)
    1488:	01e106a3          	sb	t5,13(sp)
    148c:	01d10723          	sb	t4,14(sp)
    1490:	01c107a3          	sb	t3,15(sp)
    1494:	00610823          	sb	t1,16(sp)
    1498:	011108a3          	sb	a7,17(sp)
    149c:	00710923          	sb	t2,18(sp)
    14a0:	010109a3          	sb	a6,19(sp)
    14a4:	00a10a23          	sb	a0,20(sp)
    14a8:	00b10aa3          	sb	a1,21(sp)
    14ac:	00d10b23          	sb	a3,22(sp)
    14b0:	00110ba3          	sb	ra,23(sp)
    14b4:	00810523          	sb	s0,10(sp)
    14b8:	00074703          	lbu	a4,0(a4)
    14bc:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14c0:	002c                	add	a1,sp,8
    14c2:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14c4:	00e10c23          	sb	a4,24(sp)
    14c8:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14cc:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14d0:	7e8000ef          	jal	1cb8 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14d4:	00248513          	add	a0,s1,2
        if (!*s)
    14d8:	00054783          	lbu	a5,0(a0)
    14dc:	e8079ce3          	bnez	a5,1374 <printf+0x4c>
    }
    va_end(ap);
}
    14e0:	70e6                	ld	ra,120(sp)
    14e2:	7446                	ld	s0,112(sp)
    14e4:	74a6                	ld	s1,104(sp)
    14e6:	7906                	ld	s2,96(sp)
    14e8:	69e6                	ld	s3,88(sp)
    14ea:	6a46                	ld	s4,80(sp)
    14ec:	6aa6                	ld	s5,72(sp)
    14ee:	6b06                	ld	s6,64(sp)
    14f0:	7be2                	ld	s7,56(sp)
    14f2:	6129                	add	sp,sp,192
    14f4:	8082                	ret
    14f6:	84b2                	mv	s1,a2
    14f8:	a039                	j	1506 <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14fa:	0024c783          	lbu	a5,2(s1)
    14fe:	0605                	add	a2,a2,1
    1500:	0489                	add	s1,s1,2
    1502:	e92791e3          	bne	a5,s2,1384 <printf+0x5c>
    1506:	0014c783          	lbu	a5,1(s1)
    150a:	ff2788e3          	beq	a5,s2,14fa <printf+0x1d2>
        l = z - a;
    150e:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1512:	85aa                	mv	a1,a0
    1514:	8622                	mv	a2,s0
    1516:	4505                	li	a0,1
    1518:	7a0000ef          	jal	1cb8 <write>
        if (l)
    151c:	e6040de3          	beqz	s0,1396 <printf+0x6e>
    1520:	8526                	mv	a0,s1
    1522:	b5a9                	j	136c <printf+0x44>
        switch (s[1])
    1524:	05779963          	bne	a5,s7,1576 <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    1528:	6782                	ld	a5,0(sp)
    152a:	45c1                	li	a1,16
    152c:	4388                	lw	a0,0(a5)
    152e:	07a1                	add	a5,a5,8
    1530:	e03e                	sd	a5,0(sp)
    1532:	bb7ff0ef          	jal	10e8 <printint.constprop.0>
        s += 2;
    1536:	00248513          	add	a0,s1,2
    153a:	bf79                	j	14d8 <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    153c:	6782                	ld	a5,0(sp)
    153e:	6380                	ld	s0,0(a5)
    1540:	07a1                	add	a5,a5,8
    1542:	e03e                	sd	a5,0(sp)
    1544:	cc21                	beqz	s0,159c <printf+0x274>
            l = strnlen(a, 200);
    1546:	0c800593          	li	a1,200
    154a:	8522                	mv	a0,s0
    154c:	460000ef          	jal	19ac <strnlen>
    write(f, s, l);
    1550:	0005061b          	sext.w	a2,a0
    1554:	85a2                	mv	a1,s0
    1556:	4505                	li	a0,1
    1558:	760000ef          	jal	1cb8 <write>
        s += 2;
    155c:	00248513          	add	a0,s1,2
    1560:	bfa5                	j	14d8 <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    1562:	6782                	ld	a5,0(sp)
    1564:	45a9                	li	a1,10
    1566:	4388                	lw	a0,0(a5)
    1568:	07a1                	add	a5,a5,8
    156a:	e03e                	sd	a5,0(sp)
    156c:	b7dff0ef          	jal	10e8 <printint.constprop.0>
        s += 2;
    1570:	00248513          	add	a0,s1,2
    1574:	b795                	j	14d8 <printf+0x1b0>
    return write(stdout, &byte, 1);
    1576:	4605                	li	a2,1
    1578:	002c                	add	a1,sp,8
    157a:	4505                	li	a0,1
    char byte = c;
    157c:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1580:	738000ef          	jal	1cb8 <write>
    char byte = c;
    1584:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1588:	4605                	li	a2,1
    158a:	002c                	add	a1,sp,8
    158c:	4505                	li	a0,1
    char byte = c;
    158e:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1592:	726000ef          	jal	1cb8 <write>
        s += 2;
    1596:	00248513          	add	a0,s1,2
    159a:	bf3d                	j	14d8 <printf+0x1b0>
                a = "(null)";
    159c:	00001417          	auipc	s0,0x1
    15a0:	a2c40413          	add	s0,s0,-1492 # 1fc8 <__clone+0xd8>
    15a4:	b74d                	j	1546 <printf+0x21e>

00000000000015a6 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15a6:	1141                	add	sp,sp,-16
    15a8:	e406                	sd	ra,8(sp)
    puts(m);
    15aa:	d5dff0ef          	jal	1306 <puts>
    exit(-100);
}
    15ae:	60a2                	ld	ra,8(sp)
    exit(-100);
    15b0:	f9c00513          	li	a0,-100
}
    15b4:	0141                	add	sp,sp,16
    exit(-100);
    15b6:	af89                	j	1d08 <exit>

00000000000015b8 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15b8:	02000793          	li	a5,32
    15bc:	00f50663          	beq	a0,a5,15c8 <isspace+0x10>
    15c0:	355d                	addw	a0,a0,-9
    15c2:	00553513          	sltiu	a0,a0,5
    15c6:	8082                	ret
    15c8:	4505                	li	a0,1
}
    15ca:	8082                	ret

00000000000015cc <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15cc:	fd05051b          	addw	a0,a0,-48
}
    15d0:	00a53513          	sltiu	a0,a0,10
    15d4:	8082                	ret

00000000000015d6 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d6:	02000713          	li	a4,32
    15da:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15dc:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15e0:	ff76879b          	addw	a5,a3,-9
    15e4:	06e68063          	beq	a3,a4,1644 <atoi+0x6e>
    15e8:	0006859b          	sext.w	a1,a3
    15ec:	04f67c63          	bgeu	a2,a5,1644 <atoi+0x6e>
        s++;
    switch (*s)
    15f0:	02b00793          	li	a5,43
    15f4:	06f68563          	beq	a3,a5,165e <atoi+0x88>
    15f8:	02d00793          	li	a5,45
    15fc:	04f69663          	bne	a3,a5,1648 <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1600:	00154683          	lbu	a3,1(a0)
    1604:	47a5                	li	a5,9
        s++;
    1606:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    160a:	fd06869b          	addw	a3,a3,-48
    160e:	8636                	mv	a2,a3
    while (isdigit(*s))
    1610:	04d7e563          	bltu	a5,a3,165a <atoi+0x84>
        neg = 1;
    1614:	4885                	li	a7,1
    int n = 0, neg = 0;
    1616:	4501                	li	a0,0
    while (isdigit(*s))
    1618:	4825                	li	a6,9
    161a:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    161e:	0025179b          	sllw	a5,a0,0x2
    1622:	9fa9                	addw	a5,a5,a0
    1624:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    1628:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    162c:	85b2                	mv	a1,a2
    162e:	40c7853b          	subw	a0,a5,a2
    1632:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    1634:	8636                	mv	a2,a3
    while (isdigit(*s))
    1636:	fed872e3          	bgeu	a6,a3,161a <atoi+0x44>
    return neg ? n : -n;
    163a:	02089163          	bnez	a7,165c <atoi+0x86>
    163e:	40f5853b          	subw	a0,a1,a5
    1642:	8082                	ret
        s++;
    1644:	0505                	add	a0,a0,1
    1646:	bf59                	j	15dc <atoi+0x6>
    while (isdigit(*s))
    1648:	fd05859b          	addw	a1,a1,-48
    164c:	47a5                	li	a5,9
    164e:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1650:	4881                	li	a7,0
    1652:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    1656:	fcb7f0e3          	bgeu	a5,a1,1616 <atoi+0x40>
    return neg ? n : -n;
    165a:	4501                	li	a0,0
}
    165c:	8082                	ret
    while (isdigit(*s))
    165e:	00154683          	lbu	a3,1(a0)
    1662:	47a5                	li	a5,9
        s++;
    1664:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1668:	fd06869b          	addw	a3,a3,-48
    166c:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    166e:	4881                	li	a7,0
    while (isdigit(*s))
    1670:	fad7f3e3          	bgeu	a5,a3,1616 <atoi+0x40>
    return neg ? n : -n;
    1674:	4501                	li	a0,0
    1676:	8082                	ret

0000000000001678 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1678:	16060f63          	beqz	a2,17f6 <memset+0x17e>
    167c:	40a006b3          	neg	a3,a0
    1680:	0076f793          	and	a5,a3,7
    1684:	00778813          	add	a6,a5,7
    1688:	48ad                	li	a7,11
    168a:	0ff5f713          	zext.b	a4,a1
    168e:	fff60593          	add	a1,a2,-1
    1692:	17186363          	bltu	a6,a7,17f8 <memset+0x180>
    1696:	1705eb63          	bltu	a1,a6,180c <memset+0x194>
    169a:	16078163          	beqz	a5,17fc <memset+0x184>
    169e:	00e50023          	sb	a4,0(a0)
    16a2:	0066f593          	and	a1,a3,6
    16a6:	14058e63          	beqz	a1,1802 <memset+0x18a>
    16aa:	00e500a3          	sb	a4,1(a0)
    16ae:	4589                	li	a1,2
    16b0:	00250813          	add	a6,a0,2
    16b4:	04f5f663          	bgeu	a1,a5,1700 <memset+0x88>
    16b8:	00e50123          	sb	a4,2(a0)
    16bc:	8a91                	and	a3,a3,4
    16be:	00350813          	add	a6,a0,3
    16c2:	458d                	li	a1,3
    16c4:	ce95                	beqz	a3,1700 <memset+0x88>
    16c6:	00e501a3          	sb	a4,3(a0)
    16ca:	4691                	li	a3,4
    16cc:	00450813          	add	a6,a0,4
    16d0:	4591                	li	a1,4
    16d2:	02f6f763          	bgeu	a3,a5,1700 <memset+0x88>
    16d6:	00e50223          	sb	a4,4(a0)
    16da:	4695                	li	a3,5
    16dc:	00550813          	add	a6,a0,5
    16e0:	4595                	li	a1,5
    16e2:	00d78f63          	beq	a5,a3,1700 <memset+0x88>
    16e6:	00e502a3          	sb	a4,5(a0)
    16ea:	469d                	li	a3,7
    16ec:	00650813          	add	a6,a0,6
    16f0:	4599                	li	a1,6
    16f2:	00d79763          	bne	a5,a3,1700 <memset+0x88>
    16f6:	00750813          	add	a6,a0,7
    16fa:	00e50323          	sb	a4,6(a0)
    16fe:	459d                	li	a1,7
    1700:	00871693          	sll	a3,a4,0x8
    1704:	01071313          	sll	t1,a4,0x10
    1708:	8ed9                	or	a3,a3,a4
    170a:	01871893          	sll	a7,a4,0x18
    170e:	0066e6b3          	or	a3,a3,t1
    1712:	0116e6b3          	or	a3,a3,a7
    1716:	02071313          	sll	t1,a4,0x20
    171a:	02871893          	sll	a7,a4,0x28
    171e:	0066e6b3          	or	a3,a3,t1
    1722:	40f60e33          	sub	t3,a2,a5
    1726:	03071313          	sll	t1,a4,0x30
    172a:	0116e6b3          	or	a3,a3,a7
    172e:	0066e6b3          	or	a3,a3,t1
    1732:	03871893          	sll	a7,a4,0x38
    1736:	97aa                	add	a5,a5,a0
    1738:	ff8e7313          	and	t1,t3,-8
    173c:	0116e6b3          	or	a3,a3,a7
    1740:	00f308b3          	add	a7,t1,a5
    1744:	e394                	sd	a3,0(a5)
    1746:	07a1                	add	a5,a5,8
    1748:	ff179ee3          	bne	a5,a7,1744 <memset+0xcc>
    174c:	006806b3          	add	a3,a6,t1
    1750:	00b307bb          	addw	a5,t1,a1
    1754:	0bc30b63          	beq	t1,t3,180a <memset+0x192>
    1758:	00e68023          	sb	a4,0(a3)
    175c:	0017859b          	addw	a1,a5,1
    1760:	08c5fb63          	bgeu	a1,a2,17f6 <memset+0x17e>
    1764:	00e680a3          	sb	a4,1(a3)
    1768:	0027859b          	addw	a1,a5,2
    176c:	08c5f563          	bgeu	a1,a2,17f6 <memset+0x17e>
    1770:	00e68123          	sb	a4,2(a3)
    1774:	0037859b          	addw	a1,a5,3
    1778:	06c5ff63          	bgeu	a1,a2,17f6 <memset+0x17e>
    177c:	00e681a3          	sb	a4,3(a3)
    1780:	0047859b          	addw	a1,a5,4
    1784:	06c5f963          	bgeu	a1,a2,17f6 <memset+0x17e>
    1788:	00e68223          	sb	a4,4(a3)
    178c:	0057859b          	addw	a1,a5,5
    1790:	06c5f363          	bgeu	a1,a2,17f6 <memset+0x17e>
    1794:	00e682a3          	sb	a4,5(a3)
    1798:	0067859b          	addw	a1,a5,6
    179c:	04c5fd63          	bgeu	a1,a2,17f6 <memset+0x17e>
    17a0:	00e68323          	sb	a4,6(a3)
    17a4:	0077859b          	addw	a1,a5,7
    17a8:	04c5f763          	bgeu	a1,a2,17f6 <memset+0x17e>
    17ac:	00e683a3          	sb	a4,7(a3)
    17b0:	0087859b          	addw	a1,a5,8
    17b4:	04c5f163          	bgeu	a1,a2,17f6 <memset+0x17e>
    17b8:	00e68423          	sb	a4,8(a3)
    17bc:	0097859b          	addw	a1,a5,9
    17c0:	02c5fb63          	bgeu	a1,a2,17f6 <memset+0x17e>
    17c4:	00e684a3          	sb	a4,9(a3)
    17c8:	00a7859b          	addw	a1,a5,10
    17cc:	02c5f563          	bgeu	a1,a2,17f6 <memset+0x17e>
    17d0:	00e68523          	sb	a4,10(a3)
    17d4:	00b7859b          	addw	a1,a5,11
    17d8:	00c5ff63          	bgeu	a1,a2,17f6 <memset+0x17e>
    17dc:	00e685a3          	sb	a4,11(a3)
    17e0:	00c7859b          	addw	a1,a5,12
    17e4:	00c5f963          	bgeu	a1,a2,17f6 <memset+0x17e>
    17e8:	00e68623          	sb	a4,12(a3)
    17ec:	27b5                	addw	a5,a5,13
    17ee:	00c7f463          	bgeu	a5,a2,17f6 <memset+0x17e>
    17f2:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17f6:	8082                	ret
    17f8:	482d                	li	a6,11
    17fa:	bd71                	j	1696 <memset+0x1e>
    char *p = dest;
    17fc:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17fe:	4581                	li	a1,0
    1800:	b701                	j	1700 <memset+0x88>
    1802:	00150813          	add	a6,a0,1
    1806:	4585                	li	a1,1
    1808:	bde5                	j	1700 <memset+0x88>
    180a:	8082                	ret
    char *p = dest;
    180c:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    180e:	4781                	li	a5,0
    1810:	b7a1                	j	1758 <memset+0xe0>

0000000000001812 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1812:	00054783          	lbu	a5,0(a0)
    1816:	0005c703          	lbu	a4,0(a1)
    181a:	00e79863          	bne	a5,a4,182a <strcmp+0x18>
    181e:	0505                	add	a0,a0,1
    1820:	0585                	add	a1,a1,1
    1822:	fbe5                	bnez	a5,1812 <strcmp>
    1824:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1826:	9d19                	subw	a0,a0,a4
    1828:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    182a:	0007851b          	sext.w	a0,a5
    182e:	bfe5                	j	1826 <strcmp+0x14>

0000000000001830 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1830:	ca15                	beqz	a2,1864 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1832:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1836:	167d                	add	a2,a2,-1
    1838:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    183c:	eb99                	bnez	a5,1852 <strncmp+0x22>
    183e:	a815                	j	1872 <strncmp+0x42>
    1840:	00a68e63          	beq	a3,a0,185c <strncmp+0x2c>
    1844:	0505                	add	a0,a0,1
    1846:	00f71b63          	bne	a4,a5,185c <strncmp+0x2c>
    184a:	00054783          	lbu	a5,0(a0)
    184e:	cf89                	beqz	a5,1868 <strncmp+0x38>
    1850:	85b2                	mv	a1,a2
    1852:	0005c703          	lbu	a4,0(a1)
    1856:	00158613          	add	a2,a1,1
    185a:	f37d                	bnez	a4,1840 <strncmp+0x10>
        ;
    return *l - *r;
    185c:	0007851b          	sext.w	a0,a5
    1860:	9d19                	subw	a0,a0,a4
    1862:	8082                	ret
        return 0;
    1864:	4501                	li	a0,0
}
    1866:	8082                	ret
    return *l - *r;
    1868:	0015c703          	lbu	a4,1(a1)
    186c:	4501                	li	a0,0
    186e:	9d19                	subw	a0,a0,a4
    1870:	8082                	ret
    1872:	0005c703          	lbu	a4,0(a1)
    1876:	4501                	li	a0,0
    1878:	b7e5                	j	1860 <strncmp+0x30>

000000000000187a <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    187a:	00757793          	and	a5,a0,7
    187e:	cf89                	beqz	a5,1898 <strlen+0x1e>
    1880:	87aa                	mv	a5,a0
    1882:	a029                	j	188c <strlen+0x12>
    1884:	0785                	add	a5,a5,1
    1886:	0077f713          	and	a4,a5,7
    188a:	cb01                	beqz	a4,189a <strlen+0x20>
        if (!*s)
    188c:	0007c703          	lbu	a4,0(a5)
    1890:	fb75                	bnez	a4,1884 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1892:	40a78533          	sub	a0,a5,a0
}
    1896:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1898:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    189a:	feff05b7          	lui	a1,0xfeff0
    189e:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedf1f>
    18a2:	f0101637          	lui	a2,0xf0101
    18a6:	05c2                	sll	a1,a1,0x10
    18a8:	0612                	sll	a2,a2,0x4
    18aa:	6394                	ld	a3,0(a5)
    18ac:	eff58593          	add	a1,a1,-257
    18b0:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff121>
    18b4:	05c2                	sll	a1,a1,0x10
    18b6:	0642                	sll	a2,a2,0x10
    18b8:	eff58593          	add	a1,a1,-257
    18bc:	10160613          	add	a2,a2,257
    18c0:	00b68733          	add	a4,a3,a1
    18c4:	063e                	sll	a2,a2,0xf
    18c6:	fff6c693          	not	a3,a3
    18ca:	8f75                	and	a4,a4,a3
    18cc:	08060613          	add	a2,a2,128
    18d0:	8f71                	and	a4,a4,a2
    18d2:	eb11                	bnez	a4,18e6 <strlen+0x6c>
    18d4:	6794                	ld	a3,8(a5)
    18d6:	07a1                	add	a5,a5,8
    18d8:	00b68733          	add	a4,a3,a1
    18dc:	fff6c693          	not	a3,a3
    18e0:	8f75                	and	a4,a4,a3
    18e2:	8f71                	and	a4,a4,a2
    18e4:	db65                	beqz	a4,18d4 <strlen+0x5a>
    for (; *s; s++)
    18e6:	0007c703          	lbu	a4,0(a5)
    18ea:	d745                	beqz	a4,1892 <strlen+0x18>
    18ec:	0017c703          	lbu	a4,1(a5)
    18f0:	0785                	add	a5,a5,1
    18f2:	d345                	beqz	a4,1892 <strlen+0x18>
    18f4:	0017c703          	lbu	a4,1(a5)
    18f8:	0785                	add	a5,a5,1
    18fa:	fb6d                	bnez	a4,18ec <strlen+0x72>
    18fc:	bf59                	j	1892 <strlen+0x18>

00000000000018fe <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18fe:	00757713          	and	a4,a0,7
{
    1902:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1904:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1908:	cb19                	beqz	a4,191e <memchr+0x20>
    190a:	ce59                	beqz	a2,19a8 <memchr+0xaa>
    190c:	0007c703          	lbu	a4,0(a5)
    1910:	00b70963          	beq	a4,a1,1922 <memchr+0x24>
    1914:	0785                	add	a5,a5,1
    1916:	0077f713          	and	a4,a5,7
    191a:	167d                	add	a2,a2,-1
    191c:	f77d                	bnez	a4,190a <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    191e:	4501                	li	a0,0
    if (n && *s != c)
    1920:	c649                	beqz	a2,19aa <memchr+0xac>
    1922:	0007c703          	lbu	a4,0(a5)
    1926:	06b70663          	beq	a4,a1,1992 <memchr+0x94>
        size_t k = ONES * c;
    192a:	01010737          	lui	a4,0x1010
    192e:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e121>
    1932:	0742                	sll	a4,a4,0x10
    1934:	10170713          	add	a4,a4,257
    1938:	0742                	sll	a4,a4,0x10
    193a:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    193e:	469d                	li	a3,7
        size_t k = ONES * c;
    1940:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1944:	04c6f763          	bgeu	a3,a2,1992 <memchr+0x94>
    1948:	f0101837          	lui	a6,0xf0101
    194c:	feff08b7          	lui	a7,0xfeff0
    1950:	0812                	sll	a6,a6,0x4
    1952:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedf1f>
    1956:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff121>
    195a:	08c2                	sll	a7,a7,0x10
    195c:	0842                	sll	a6,a6,0x10
    195e:	eff88893          	add	a7,a7,-257
    1962:	10180813          	add	a6,a6,257
    1966:	08c2                	sll	a7,a7,0x10
    1968:	083e                	sll	a6,a6,0xf
    196a:	eff88893          	add	a7,a7,-257
    196e:	08080813          	add	a6,a6,128
    1972:	431d                	li	t1,7
    1974:	a029                	j	197e <memchr+0x80>
    1976:	1661                	add	a2,a2,-8
    1978:	07a1                	add	a5,a5,8
    197a:	02c37663          	bgeu	t1,a2,19a6 <memchr+0xa8>
    197e:	6398                	ld	a4,0(a5)
    1980:	8f29                	xor	a4,a4,a0
    1982:	011706b3          	add	a3,a4,a7
    1986:	fff74713          	not	a4,a4
    198a:	8f75                	and	a4,a4,a3
    198c:	01077733          	and	a4,a4,a6
    1990:	d37d                	beqz	a4,1976 <memchr+0x78>
        s = (const void *)w;
    1992:	853e                	mv	a0,a5
    1994:	a019                	j	199a <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    1996:	0505                	add	a0,a0,1
    1998:	ca01                	beqz	a2,19a8 <memchr+0xaa>
    199a:	00054783          	lbu	a5,0(a0)
    199e:	167d                	add	a2,a2,-1
    19a0:	feb79be3          	bne	a5,a1,1996 <memchr+0x98>
    19a4:	8082                	ret
    19a6:	f675                	bnez	a2,1992 <memchr+0x94>
    return n ? (void *)s : 0;
    19a8:	4501                	li	a0,0
}
    19aa:	8082                	ret

00000000000019ac <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19ac:	1101                	add	sp,sp,-32
    19ae:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19b0:	862e                	mv	a2,a1
{
    19b2:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19b4:	4581                	li	a1,0
{
    19b6:	e426                	sd	s1,8(sp)
    19b8:	ec06                	sd	ra,24(sp)
    19ba:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19bc:	f43ff0ef          	jal	18fe <memchr>
    return p ? p - s : n;
    19c0:	c519                	beqz	a0,19ce <strnlen+0x22>
}
    19c2:	60e2                	ld	ra,24(sp)
    19c4:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19c6:	8d05                	sub	a0,a0,s1
}
    19c8:	64a2                	ld	s1,8(sp)
    19ca:	6105                	add	sp,sp,32
    19cc:	8082                	ret
    19ce:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19d0:	8522                	mv	a0,s0
}
    19d2:	6442                	ld	s0,16(sp)
    19d4:	64a2                	ld	s1,8(sp)
    19d6:	6105                	add	sp,sp,32
    19d8:	8082                	ret

00000000000019da <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19da:	00b547b3          	xor	a5,a0,a1
    19de:	8b9d                	and	a5,a5,7
    19e0:	efb1                	bnez	a5,1a3c <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19e2:	0075f793          	and	a5,a1,7
    19e6:	ebb5                	bnez	a5,1a5a <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19e8:	feff0637          	lui	a2,0xfeff0
    19ec:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedf1f>
    19f0:	f01016b7          	lui	a3,0xf0101
    19f4:	0642                	sll	a2,a2,0x10
    19f6:	0692                	sll	a3,a3,0x4
    19f8:	6198                	ld	a4,0(a1)
    19fa:	eff60613          	add	a2,a2,-257
    19fe:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff121>
    1a02:	0642                	sll	a2,a2,0x10
    1a04:	06c2                	sll	a3,a3,0x10
    1a06:	eff60613          	add	a2,a2,-257
    1a0a:	10168693          	add	a3,a3,257
    1a0e:	00c707b3          	add	a5,a4,a2
    1a12:	fff74813          	not	a6,a4
    1a16:	06be                	sll	a3,a3,0xf
    1a18:	0107f7b3          	and	a5,a5,a6
    1a1c:	08068693          	add	a3,a3,128
    1a20:	8ff5                	and	a5,a5,a3
    1a22:	ef89                	bnez	a5,1a3c <strcpy+0x62>
    1a24:	05a1                	add	a1,a1,8
    1a26:	e118                	sd	a4,0(a0)
    1a28:	6198                	ld	a4,0(a1)
    1a2a:	0521                	add	a0,a0,8
    1a2c:	00c707b3          	add	a5,a4,a2
    1a30:	fff74813          	not	a6,a4
    1a34:	0107f7b3          	and	a5,a5,a6
    1a38:	8ff5                	and	a5,a5,a3
    1a3a:	d7ed                	beqz	a5,1a24 <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a3c:	0005c783          	lbu	a5,0(a1)
    1a40:	00f50023          	sb	a5,0(a0)
    1a44:	c785                	beqz	a5,1a6c <strcpy+0x92>
    1a46:	0015c783          	lbu	a5,1(a1)
    1a4a:	0505                	add	a0,a0,1
    1a4c:	0585                	add	a1,a1,1
    1a4e:	00f50023          	sb	a5,0(a0)
    1a52:	fbf5                	bnez	a5,1a46 <strcpy+0x6c>
        ;
    return d;
}
    1a54:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a56:	0505                	add	a0,a0,1
    1a58:	db41                	beqz	a4,19e8 <strcpy+0xe>
            if (!(*d = *s))
    1a5a:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a5e:	0585                	add	a1,a1,1
    1a60:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a64:	00f50023          	sb	a5,0(a0)
    1a68:	f7fd                	bnez	a5,1a56 <strcpy+0x7c>
}
    1a6a:	8082                	ret
    1a6c:	8082                	ret

0000000000001a6e <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a6e:	00b547b3          	xor	a5,a0,a1
    1a72:	8b9d                	and	a5,a5,7
    1a74:	efbd                	bnez	a5,1af2 <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a76:	0075f793          	and	a5,a1,7
    1a7a:	1c078563          	beqz	a5,1c44 <strncpy+0x1d6>
    1a7e:	ea11                	bnez	a2,1a92 <strncpy+0x24>
    1a80:	8082                	ret
    1a82:	0585                	add	a1,a1,1
    1a84:	0075f793          	and	a5,a1,7
    1a88:	167d                	add	a2,a2,-1
    1a8a:	0505                	add	a0,a0,1
    1a8c:	1a078c63          	beqz	a5,1c44 <strncpy+0x1d6>
    1a90:	ca3d                	beqz	a2,1b06 <strncpy+0x98>
    1a92:	0005c783          	lbu	a5,0(a1)
    1a96:	00f50023          	sb	a5,0(a0)
    1a9a:	f7e5                	bnez	a5,1a82 <strncpy+0x14>
            ;
        if (!n || !*s)
    1a9c:	0005c783          	lbu	a5,0(a1)
    1aa0:	c7a5                	beqz	a5,1b08 <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1aa2:	479d                	li	a5,7
    1aa4:	04c7f863          	bgeu	a5,a2,1af4 <strncpy+0x86>
    1aa8:	f01016b7          	lui	a3,0xf0101
    1aac:	feff0837          	lui	a6,0xfeff0
    1ab0:	0692                	sll	a3,a3,0x4
    1ab2:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedf1f>
    1ab6:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff121>
    1aba:	0842                	sll	a6,a6,0x10
    1abc:	06c2                	sll	a3,a3,0x10
    1abe:	eff80813          	add	a6,a6,-257
    1ac2:	10168693          	add	a3,a3,257
    1ac6:	0842                	sll	a6,a6,0x10
    1ac8:	06be                	sll	a3,a3,0xf
    1aca:	eff80813          	add	a6,a6,-257
    1ace:	08068693          	add	a3,a3,128
    1ad2:	431d                	li	t1,7
    1ad4:	6198                	ld	a4,0(a1)
    1ad6:	010707b3          	add	a5,a4,a6
    1ada:	fff74893          	not	a7,a4
    1ade:	0117f7b3          	and	a5,a5,a7
    1ae2:	8ff5                	and	a5,a5,a3
    1ae4:	eb81                	bnez	a5,1af4 <strncpy+0x86>
            *wd = *ws;
    1ae6:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ae8:	1661                	add	a2,a2,-8
    1aea:	05a1                	add	a1,a1,8
    1aec:	0521                	add	a0,a0,8
    1aee:	fec363e3          	bltu	t1,a2,1ad4 <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1af2:	ca11                	beqz	a2,1b06 <strncpy+0x98>
    1af4:	0005c783          	lbu	a5,0(a1)
    1af8:	0585                	add	a1,a1,1
    1afa:	00f50023          	sb	a5,0(a0)
    1afe:	c789                	beqz	a5,1b08 <strncpy+0x9a>
    1b00:	167d                	add	a2,a2,-1
    1b02:	0505                	add	a0,a0,1
    1b04:	fa65                	bnez	a2,1af4 <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b06:	8082                	ret
    1b08:	40a00733          	neg	a4,a0
    1b0c:	00777793          	and	a5,a4,7
    1b10:	00778693          	add	a3,a5,7
    1b14:	482d                	li	a6,11
    1b16:	fff60593          	add	a1,a2,-1
    1b1a:	1106ef63          	bltu	a3,a6,1c38 <strncpy+0x1ca>
    1b1e:	12d5ee63          	bltu	a1,a3,1c5a <strncpy+0x1ec>
    1b22:	12078563          	beqz	a5,1c4c <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b26:	00050023          	sb	zero,0(a0)
    1b2a:	00677693          	and	a3,a4,6
    1b2e:	12068263          	beqz	a3,1c52 <strncpy+0x1e4>
    1b32:	000500a3          	sb	zero,1(a0)
    1b36:	4689                	li	a3,2
    1b38:	12f6f463          	bgeu	a3,a5,1c60 <strncpy+0x1f2>
    1b3c:	00050123          	sb	zero,2(a0)
    1b40:	8b11                	and	a4,a4,4
    1b42:	cf6d                	beqz	a4,1c3c <strncpy+0x1ce>
    1b44:	000501a3          	sb	zero,3(a0)
    1b48:	4711                	li	a4,4
    1b4a:	00450693          	add	a3,a0,4
    1b4e:	02f77363          	bgeu	a4,a5,1b74 <strncpy+0x106>
    1b52:	00050223          	sb	zero,4(a0)
    1b56:	4715                	li	a4,5
    1b58:	00550693          	add	a3,a0,5
    1b5c:	00e78c63          	beq	a5,a4,1b74 <strncpy+0x106>
    1b60:	000502a3          	sb	zero,5(a0)
    1b64:	471d                	li	a4,7
    1b66:	10e79163          	bne	a5,a4,1c68 <strncpy+0x1fa>
    1b6a:	00750693          	add	a3,a0,7
    1b6e:	00050323          	sb	zero,6(a0)
    1b72:	471d                	li	a4,7
    1b74:	40f608b3          	sub	a7,a2,a5
    1b78:	ff88f813          	and	a6,a7,-8
    1b7c:	97aa                	add	a5,a5,a0
    1b7e:	010785b3          	add	a1,a5,a6
    1b82:	0007b023          	sd	zero,0(a5)
    1b86:	07a1                	add	a5,a5,8
    1b88:	feb79de3          	bne	a5,a1,1b82 <strncpy+0x114>
    1b8c:	00e807bb          	addw	a5,a6,a4
    1b90:	01068733          	add	a4,a3,a6
    1b94:	0b088b63          	beq	a7,a6,1c4a <strncpy+0x1dc>
    1b98:	00070023          	sb	zero,0(a4)
    1b9c:	0017869b          	addw	a3,a5,1
    1ba0:	f6c6f3e3          	bgeu	a3,a2,1b06 <strncpy+0x98>
    1ba4:	000700a3          	sb	zero,1(a4)
    1ba8:	0027869b          	addw	a3,a5,2
    1bac:	f4c6fde3          	bgeu	a3,a2,1b06 <strncpy+0x98>
    1bb0:	00070123          	sb	zero,2(a4)
    1bb4:	0037869b          	addw	a3,a5,3
    1bb8:	f4c6f7e3          	bgeu	a3,a2,1b06 <strncpy+0x98>
    1bbc:	000701a3          	sb	zero,3(a4)
    1bc0:	0047869b          	addw	a3,a5,4
    1bc4:	f4c6f1e3          	bgeu	a3,a2,1b06 <strncpy+0x98>
    1bc8:	00070223          	sb	zero,4(a4)
    1bcc:	0057869b          	addw	a3,a5,5
    1bd0:	f2c6fbe3          	bgeu	a3,a2,1b06 <strncpy+0x98>
    1bd4:	000702a3          	sb	zero,5(a4)
    1bd8:	0067869b          	addw	a3,a5,6
    1bdc:	f2c6f5e3          	bgeu	a3,a2,1b06 <strncpy+0x98>
    1be0:	00070323          	sb	zero,6(a4)
    1be4:	0077869b          	addw	a3,a5,7
    1be8:	f0c6ffe3          	bgeu	a3,a2,1b06 <strncpy+0x98>
    1bec:	000703a3          	sb	zero,7(a4)
    1bf0:	0087869b          	addw	a3,a5,8
    1bf4:	f0c6f9e3          	bgeu	a3,a2,1b06 <strncpy+0x98>
    1bf8:	00070423          	sb	zero,8(a4)
    1bfc:	0097869b          	addw	a3,a5,9
    1c00:	f0c6f3e3          	bgeu	a3,a2,1b06 <strncpy+0x98>
    1c04:	000704a3          	sb	zero,9(a4)
    1c08:	00a7869b          	addw	a3,a5,10
    1c0c:	eec6fde3          	bgeu	a3,a2,1b06 <strncpy+0x98>
    1c10:	00070523          	sb	zero,10(a4)
    1c14:	00b7869b          	addw	a3,a5,11
    1c18:	eec6f7e3          	bgeu	a3,a2,1b06 <strncpy+0x98>
    1c1c:	000705a3          	sb	zero,11(a4)
    1c20:	00c7869b          	addw	a3,a5,12
    1c24:	eec6f1e3          	bgeu	a3,a2,1b06 <strncpy+0x98>
    1c28:	00070623          	sb	zero,12(a4)
    1c2c:	27b5                	addw	a5,a5,13
    1c2e:	ecc7fce3          	bgeu	a5,a2,1b06 <strncpy+0x98>
    1c32:	000706a3          	sb	zero,13(a4)
}
    1c36:	8082                	ret
    1c38:	46ad                	li	a3,11
    1c3a:	b5d5                	j	1b1e <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c3c:	00350693          	add	a3,a0,3
    1c40:	470d                	li	a4,3
    1c42:	bf0d                	j	1b74 <strncpy+0x106>
        if (!n || !*s)
    1c44:	e4061ce3          	bnez	a2,1a9c <strncpy+0x2e>
}
    1c48:	8082                	ret
    1c4a:	8082                	ret
    char *p = dest;
    1c4c:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c4e:	4701                	li	a4,0
    1c50:	b715                	j	1b74 <strncpy+0x106>
    1c52:	00150693          	add	a3,a0,1
    1c56:	4705                	li	a4,1
    1c58:	bf31                	j	1b74 <strncpy+0x106>
    char *p = dest;
    1c5a:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c5c:	4781                	li	a5,0
    1c5e:	bf2d                	j	1b98 <strncpy+0x12a>
    1c60:	00250693          	add	a3,a0,2
    1c64:	4709                	li	a4,2
    1c66:	b739                	j	1b74 <strncpy+0x106>
    1c68:	00650693          	add	a3,a0,6
    1c6c:	4719                	li	a4,6
    1c6e:	b719                	j	1b74 <strncpy+0x106>

0000000000001c70 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c70:	87aa                	mv	a5,a0
    1c72:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c74:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c78:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c7c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c7e:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c80:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c84:	2501                	sext.w	a0,a0
    1c86:	8082                	ret

0000000000001c88 <openat>:
    register long a7 __asm__("a7") = n;
    1c88:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c8c:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c90:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c94:	2501                	sext.w	a0,a0
    1c96:	8082                	ret

0000000000001c98 <fcntl>:
    register long a7 __asm__("a7") = n;
    1c98:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c9a:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1c9e:	2501                	sext.w	a0,a0
    1ca0:	8082                	ret

0000000000001ca2 <close>:
    register long a7 __asm__("a7") = n;
    1ca2:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1ca6:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1caa:	2501                	sext.w	a0,a0
    1cac:	8082                	ret

0000000000001cae <read>:
    register long a7 __asm__("a7") = n;
    1cae:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cb2:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1cb6:	8082                	ret

0000000000001cb8 <write>:
    register long a7 __asm__("a7") = n;
    1cb8:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cbc:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1cc0:	8082                	ret

0000000000001cc2 <getpid>:
    register long a7 __asm__("a7") = n;
    1cc2:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1cc6:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1cca:	2501                	sext.w	a0,a0
    1ccc:	8082                	ret

0000000000001cce <getppid>:
    register long a7 __asm__("a7") = n;
    1cce:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1cd2:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cd6:	2501                	sext.w	a0,a0
    1cd8:	8082                	ret

0000000000001cda <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cda:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cde:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1ce2:	2501                	sext.w	a0,a0
    1ce4:	8082                	ret

0000000000001ce6 <fork>:
    register long a7 __asm__("a7") = n;
    1ce6:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cea:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cec:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cee:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cf2:	2501                	sext.w	a0,a0
    1cf4:	8082                	ret

0000000000001cf6 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cf6:	85b2                	mv	a1,a2
    1cf8:	863a                	mv	a2,a4
    if (stack)
    1cfa:	c191                	beqz	a1,1cfe <clone+0x8>
	stack += stack_size;
    1cfc:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cfe:	4781                	li	a5,0
    1d00:	4701                	li	a4,0
    1d02:	4681                	li	a3,0
    1d04:	2601                	sext.w	a2,a2
    1d06:	a2ed                	j	1ef0 <__clone>

0000000000001d08 <exit>:
    register long a7 __asm__("a7") = n;
    1d08:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d0c:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d10:	8082                	ret

0000000000001d12 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d12:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d16:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d18:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d1c:	2501                	sext.w	a0,a0
    1d1e:	8082                	ret

0000000000001d20 <exec>:
    register long a7 __asm__("a7") = n;
    1d20:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d24:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d28:	2501                	sext.w	a0,a0
    1d2a:	8082                	ret

0000000000001d2c <execve>:
    register long a7 __asm__("a7") = n;
    1d2c:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d30:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d34:	2501                	sext.w	a0,a0
    1d36:	8082                	ret

0000000000001d38 <times>:
    register long a7 __asm__("a7") = n;
    1d38:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d3c:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d40:	2501                	sext.w	a0,a0
    1d42:	8082                	ret

0000000000001d44 <get_time>:

int64 get_time()
{
    1d44:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d46:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d4a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d4c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d4e:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d52:	2501                	sext.w	a0,a0
    1d54:	ed09                	bnez	a0,1d6e <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d56:	67a2                	ld	a5,8(sp)
    1d58:	3e800713          	li	a4,1000
    1d5c:	00015503          	lhu	a0,0(sp)
    1d60:	02e7d7b3          	divu	a5,a5,a4
    1d64:	02e50533          	mul	a0,a0,a4
    1d68:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d6a:	0141                	add	sp,sp,16
    1d6c:	8082                	ret
        return -1;
    1d6e:	557d                	li	a0,-1
    1d70:	bfed                	j	1d6a <get_time+0x26>

0000000000001d72 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d72:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d76:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d7a:	2501                	sext.w	a0,a0
    1d7c:	8082                	ret

0000000000001d7e <time>:
    register long a7 __asm__("a7") = n;
    1d7e:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d82:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d86:	2501                	sext.w	a0,a0
    1d88:	8082                	ret

0000000000001d8a <sleep>:

int sleep(unsigned long long time)
{
    1d8a:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d8c:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d8e:	850a                	mv	a0,sp
    1d90:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d92:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d96:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d98:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d9c:	e501                	bnez	a0,1da4 <sleep+0x1a>
    return 0;
    1d9e:	4501                	li	a0,0
}
    1da0:	0141                	add	sp,sp,16
    1da2:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1da4:	4502                	lw	a0,0(sp)
}
    1da6:	0141                	add	sp,sp,16
    1da8:	8082                	ret

0000000000001daa <set_priority>:
    register long a7 __asm__("a7") = n;
    1daa:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1dae:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1db2:	2501                	sext.w	a0,a0
    1db4:	8082                	ret

0000000000001db6 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1db6:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1dba:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1dbe:	8082                	ret

0000000000001dc0 <munmap>:
    register long a7 __asm__("a7") = n;
    1dc0:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc4:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1dc8:	2501                	sext.w	a0,a0
    1dca:	8082                	ret

0000000000001dcc <wait>:

int wait(int *code)
{
    1dcc:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dce:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1dd2:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1dd4:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1dd6:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dd8:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1ddc:	2501                	sext.w	a0,a0
    1dde:	8082                	ret

0000000000001de0 <spawn>:
    register long a7 __asm__("a7") = n;
    1de0:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1de4:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1de8:	2501                	sext.w	a0,a0
    1dea:	8082                	ret

0000000000001dec <mailread>:
    register long a7 __asm__("a7") = n;
    1dec:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1df0:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1df4:	2501                	sext.w	a0,a0
    1df6:	8082                	ret

0000000000001df8 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1df8:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dfc:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e00:	2501                	sext.w	a0,a0
    1e02:	8082                	ret

0000000000001e04 <fstat>:
    register long a7 __asm__("a7") = n;
    1e04:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e08:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e0c:	2501                	sext.w	a0,a0
    1e0e:	8082                	ret

0000000000001e10 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e10:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e12:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e16:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e18:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e1c:	2501                	sext.w	a0,a0
    1e1e:	8082                	ret

0000000000001e20 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e20:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e22:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e26:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e28:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e2c:	2501                	sext.w	a0,a0
    1e2e:	8082                	ret

0000000000001e30 <link>:

int link(char *old_path, char *new_path)
{
    1e30:	87aa                	mv	a5,a0
    1e32:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e34:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e38:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e3c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e3e:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e42:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e44:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e48:	2501                	sext.w	a0,a0
    1e4a:	8082                	ret

0000000000001e4c <unlink>:

int unlink(char *path)
{
    1e4c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e4e:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e52:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e56:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e58:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e5c:	2501                	sext.w	a0,a0
    1e5e:	8082                	ret

0000000000001e60 <uname>:
    register long a7 __asm__("a7") = n;
    1e60:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e64:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e68:	2501                	sext.w	a0,a0
    1e6a:	8082                	ret

0000000000001e6c <brk>:
    register long a7 __asm__("a7") = n;
    1e6c:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e70:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e74:	2501                	sext.w	a0,a0
    1e76:	8082                	ret

0000000000001e78 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e78:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e7a:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e7e:	8082                	ret

0000000000001e80 <chdir>:
    register long a7 __asm__("a7") = n;
    1e80:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e84:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e88:	2501                	sext.w	a0,a0
    1e8a:	8082                	ret

0000000000001e8c <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e8c:	862e                	mv	a2,a1
    1e8e:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e90:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e92:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e96:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e9a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e9c:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e9e:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1ea2:	2501                	sext.w	a0,a0
    1ea4:	8082                	ret

0000000000001ea6 <getdents>:
    register long a7 __asm__("a7") = n;
    1ea6:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eaa:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1eae:	2501                	sext.w	a0,a0
    1eb0:	8082                	ret

0000000000001eb2 <pipe>:
    register long a7 __asm__("a7") = n;
    1eb2:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1eb6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb8:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1ebc:	2501                	sext.w	a0,a0
    1ebe:	8082                	ret

0000000000001ec0 <dup>:
    register long a7 __asm__("a7") = n;
    1ec0:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1ec2:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1ec6:	2501                	sext.w	a0,a0
    1ec8:	8082                	ret

0000000000001eca <dup2>:
    register long a7 __asm__("a7") = n;
    1eca:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1ecc:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ece:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ed2:	2501                	sext.w	a0,a0
    1ed4:	8082                	ret

0000000000001ed6 <mount>:
    register long a7 __asm__("a7") = n;
    1ed6:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1eda:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ede:	2501                	sext.w	a0,a0
    1ee0:	8082                	ret

0000000000001ee2 <umount>:
    register long a7 __asm__("a7") = n;
    1ee2:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ee6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ee8:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1eec:	2501                	sext.w	a0,a0
    1eee:	8082                	ret

0000000000001ef0 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ef0:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1ef2:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ef4:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ef6:	8532                	mv	a0,a2
	mv a2, a4
    1ef8:	863a                	mv	a2,a4
	mv a3, a5
    1efa:	86be                	mv	a3,a5
	mv a4, a6
    1efc:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1efe:	0dc00893          	li	a7,220
	ecall
    1f02:	00000073          	ecall

	beqz a0, 1f
    1f06:	c111                	beqz	a0,1f0a <__clone+0x1a>
	# Parent
	ret
    1f08:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f0a:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f0c:	6522                	ld	a0,8(sp)
	jalr a1
    1f0e:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f10:	05d00893          	li	a7,93
	ecall
    1f14:	00000073          	ecall
