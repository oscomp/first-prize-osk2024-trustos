
/home/windflower/Desktop/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/fork:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a05d                	j	10a8 <__start_main>

0000000000001004 <test_fork>:
 * 成功测试时子进程的输出：
 * "  child process."
 */
static int fd[2];

void test_fork(void){
    1004:	1101                	add	sp,sp,-32
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	ee250513          	add	a0,a0,-286 # 1ee8 <__clone+0x28>
void test_fork(void){
    100e:	ec06                	sd	ra,24(sp)
    TEST_START(__func__);
    1010:	2d0000ef          	jal	12e0 <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	f6c50513          	add	a0,a0,-148 # 1f80 <__func__.0>
    101c:	2c4000ef          	jal	12e0 <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	ee050513          	add	a0,a0,-288 # 1f00 <__clone+0x40>
    1028:	2b8000ef          	jal	12e0 <puts>
    int cpid, wstatus;
    cpid = fork();
    102c:	48b000ef          	jal	1cb6 <fork>
    assert(cpid != -1);
    1030:	57fd                	li	a5,-1
    1032:	04f50363          	beq	a0,a5,1078 <test_fork+0x74>

    if(cpid > 0){
    1036:	04a05763          	blez	a0,1084 <test_fork+0x80>
	wait(&wstatus);
    103a:	0068                	add	a0,sp,12
    103c:	561000ef          	jal	1d9c <wait>
	printf("  parent process. wstatus:%d\n", wstatus);
    1040:	45b2                	lw	a1,12(sp)
    1042:	00001517          	auipc	a0,0x1
    1046:	eee50513          	add	a0,a0,-274 # 1f30 <__clone+0x70>
    104a:	2b8000ef          	jal	1302 <printf>
    }else{
	printf("  child process.\n");
	exit(0);
    }
    TEST_END(__func__);
    104e:	00001517          	auipc	a0,0x1
    1052:	f1a50513          	add	a0,a0,-230 # 1f68 <__clone+0xa8>
    1056:	28a000ef          	jal	12e0 <puts>
    105a:	00001517          	auipc	a0,0x1
    105e:	f2650513          	add	a0,a0,-218 # 1f80 <__func__.0>
    1062:	27e000ef          	jal	12e0 <puts>
    1066:	00001517          	auipc	a0,0x1
    106a:	e9a50513          	add	a0,a0,-358 # 1f00 <__clone+0x40>
    106e:	272000ef          	jal	12e0 <puts>
}
    1072:	60e2                	ld	ra,24(sp)
    1074:	6105                	add	sp,sp,32
    1076:	8082                	ret
    assert(cpid != -1);
    1078:	00001517          	auipc	a0,0x1
    107c:	e9850513          	add	a0,a0,-360 # 1f10 <__clone+0x50>
    1080:	500000ef          	jal	1580 <panic>
	printf("  child process.\n");
    1084:	00001517          	auipc	a0,0x1
    1088:	ecc50513          	add	a0,a0,-308 # 1f50 <__clone+0x90>
    108c:	276000ef          	jal	1302 <printf>
	exit(0);
    1090:	4501                	li	a0,0
    1092:	447000ef          	jal	1cd8 <exit>
    1096:	bf65                	j	104e <test_fork+0x4a>

0000000000001098 <main>:

int main(void){
    1098:	1141                	add	sp,sp,-16
    109a:	e406                	sd	ra,8(sp)
    test_fork();
    109c:	f69ff0ef          	jal	1004 <test_fork>
    return 0;
}
    10a0:	60a2                	ld	ra,8(sp)
    10a2:	4501                	li	a0,0
    10a4:	0141                	add	sp,sp,16
    10a6:	8082                	ret

00000000000010a8 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10a8:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10aa:	4108                	lw	a0,0(a0)
{
    10ac:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10ae:	05a1                	add	a1,a1,8
{
    10b0:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10b2:	fe7ff0ef          	jal	1098 <main>
    10b6:	423000ef          	jal	1cd8 <exit>
	return 0;
}
    10ba:	60a2                	ld	ra,8(sp)
    10bc:	4501                	li	a0,0
    10be:	0141                	add	sp,sp,16
    10c0:	8082                	ret

00000000000010c2 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10c2:	7179                	add	sp,sp,-48
    10c4:	f406                	sd	ra,40(sp)
    10c6:	0005081b          	sext.w	a6,a0
    10ca:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10cc:	00055563          	bgez	a0,10d6 <printint.constprop.0+0x14>
        x = -xx;
    10d0:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    10d4:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10d6:	02b8763b          	remuw	a2,a6,a1
    10da:	00001697          	auipc	a3,0x1
    10de:	eb668693          	add	a3,a3,-330 # 1f90 <digits>
    buf[16] = 0;
    10e2:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10e6:	0005871b          	sext.w	a4,a1
    10ea:	1602                	sll	a2,a2,0x20
    10ec:	9201                	srl	a2,a2,0x20
    10ee:	9636                	add	a2,a2,a3
    10f0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10f4:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    10f8:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    10fc:	10b86c63          	bltu	a6,a1,1214 <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    1100:	02e5763b          	remuw	a2,a0,a4
    1104:	1602                	sll	a2,a2,0x20
    1106:	9201                	srl	a2,a2,0x20
    1108:	9636                	add	a2,a2,a3
    110a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    110e:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1112:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1116:	10e56863          	bltu	a0,a4,1226 <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    111a:	02e5f63b          	remuw	a2,a1,a4
    111e:	1602                	sll	a2,a2,0x20
    1120:	9201                	srl	a2,a2,0x20
    1122:	9636                	add	a2,a2,a3
    1124:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1128:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    112c:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1130:	10e5e463          	bltu	a1,a4,1238 <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    1134:	02e5763b          	remuw	a2,a0,a4
    1138:	1602                	sll	a2,a2,0x20
    113a:	9201                	srl	a2,a2,0x20
    113c:	9636                	add	a2,a2,a3
    113e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1142:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1146:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    114a:	10e56063          	bltu	a0,a4,124a <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    114e:	02e5f63b          	remuw	a2,a1,a4
    1152:	1602                	sll	a2,a2,0x20
    1154:	9201                	srl	a2,a2,0x20
    1156:	9636                	add	a2,a2,a3
    1158:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    115c:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1160:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1164:	0ee5ec63          	bltu	a1,a4,125c <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    1168:	02e5763b          	remuw	a2,a0,a4
    116c:	1602                	sll	a2,a2,0x20
    116e:	9201                	srl	a2,a2,0x20
    1170:	9636                	add	a2,a2,a3
    1172:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1176:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    117a:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    117e:	08e56263          	bltu	a0,a4,1202 <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    1182:	02e5f63b          	remuw	a2,a1,a4
    1186:	1602                	sll	a2,a2,0x20
    1188:	9201                	srl	a2,a2,0x20
    118a:	9636                	add	a2,a2,a3
    118c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1190:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1194:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1198:	0ce5eb63          	bltu	a1,a4,126e <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    119c:	02e5763b          	remuw	a2,a0,a4
    11a0:	1602                	sll	a2,a2,0x20
    11a2:	9201                	srl	a2,a2,0x20
    11a4:	9636                	add	a2,a2,a3
    11a6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11aa:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11ae:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11b2:	0ce56763          	bltu	a0,a4,1280 <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    11b6:	02e5f63b          	remuw	a2,a1,a4
    11ba:	1602                	sll	a2,a2,0x20
    11bc:	9201                	srl	a2,a2,0x20
    11be:	9636                	add	a2,a2,a3
    11c0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c4:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11c8:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11cc:	0ce5e363          	bltu	a1,a4,1292 <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    11d0:	1782                	sll	a5,a5,0x20
    11d2:	9381                	srl	a5,a5,0x20
    11d4:	96be                	add	a3,a3,a5
    11d6:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    11da:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    11dc:	00f10723          	sb	a5,14(sp)
    if (sign)
    11e0:	00088763          	beqz	a7,11ee <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11e4:	02d00793          	li	a5,45
    11e8:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11ec:	4595                	li	a1,5
    write(f, s, l);
    11ee:	003c                	add	a5,sp,8
    11f0:	4641                	li	a2,16
    11f2:	9e0d                	subw	a2,a2,a1
    11f4:	4505                	li	a0,1
    11f6:	95be                	add	a1,a1,a5
    11f8:	291000ef          	jal	1c88 <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11fc:	70a2                	ld	ra,40(sp)
    11fe:	6145                	add	sp,sp,48
    1200:	8082                	ret
    i++;
    1202:	45a9                	li	a1,10
    if (sign)
    1204:	fe0885e3          	beqz	a7,11ee <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1208:	02d00793          	li	a5,45
    120c:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1210:	45a5                	li	a1,9
    1212:	bff1                	j	11ee <printint.constprop.0+0x12c>
    i++;
    1214:	45bd                	li	a1,15
    if (sign)
    1216:	fc088ce3          	beqz	a7,11ee <printint.constprop.0+0x12c>
        buf[i--] = '-';
    121a:	02d00793          	li	a5,45
    121e:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1222:	45b9                	li	a1,14
    1224:	b7e9                	j	11ee <printint.constprop.0+0x12c>
    i++;
    1226:	45b9                	li	a1,14
    if (sign)
    1228:	fc0883e3          	beqz	a7,11ee <printint.constprop.0+0x12c>
        buf[i--] = '-';
    122c:	02d00793          	li	a5,45
    1230:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1234:	45b5                	li	a1,13
    1236:	bf65                	j	11ee <printint.constprop.0+0x12c>
    i++;
    1238:	45b5                	li	a1,13
    if (sign)
    123a:	fa088ae3          	beqz	a7,11ee <printint.constprop.0+0x12c>
        buf[i--] = '-';
    123e:	02d00793          	li	a5,45
    1242:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1246:	45b1                	li	a1,12
    1248:	b75d                	j	11ee <printint.constprop.0+0x12c>
    i++;
    124a:	45b1                	li	a1,12
    if (sign)
    124c:	fa0881e3          	beqz	a7,11ee <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1250:	02d00793          	li	a5,45
    1254:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1258:	45ad                	li	a1,11
    125a:	bf51                	j	11ee <printint.constprop.0+0x12c>
    i++;
    125c:	45ad                	li	a1,11
    if (sign)
    125e:	f80888e3          	beqz	a7,11ee <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1262:	02d00793          	li	a5,45
    1266:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    126a:	45a9                	li	a1,10
    126c:	b749                	j	11ee <printint.constprop.0+0x12c>
    i++;
    126e:	45a5                	li	a1,9
    if (sign)
    1270:	f6088fe3          	beqz	a7,11ee <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1274:	02d00793          	li	a5,45
    1278:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    127c:	45a1                	li	a1,8
    127e:	bf85                	j	11ee <printint.constprop.0+0x12c>
    i++;
    1280:	45a1                	li	a1,8
    if (sign)
    1282:	f60886e3          	beqz	a7,11ee <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1286:	02d00793          	li	a5,45
    128a:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    128e:	459d                	li	a1,7
    1290:	bfb9                	j	11ee <printint.constprop.0+0x12c>
    i++;
    1292:	459d                	li	a1,7
    if (sign)
    1294:	f4088de3          	beqz	a7,11ee <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1298:	02d00793          	li	a5,45
    129c:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12a0:	4599                	li	a1,6
    12a2:	b7b1                	j	11ee <printint.constprop.0+0x12c>

00000000000012a4 <getchar>:
{
    12a4:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12a6:	00f10593          	add	a1,sp,15
    12aa:	4605                	li	a2,1
    12ac:	4501                	li	a0,0
{
    12ae:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12b0:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12b4:	1cb000ef          	jal	1c7e <read>
}
    12b8:	60e2                	ld	ra,24(sp)
    12ba:	00f14503          	lbu	a0,15(sp)
    12be:	6105                	add	sp,sp,32
    12c0:	8082                	ret

00000000000012c2 <putchar>:
{
    12c2:	1101                	add	sp,sp,-32
    12c4:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12c6:	00f10593          	add	a1,sp,15
    12ca:	4605                	li	a2,1
    12cc:	4505                	li	a0,1
{
    12ce:	ec06                	sd	ra,24(sp)
    char byte = c;
    12d0:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12d4:	1b5000ef          	jal	1c88 <write>
}
    12d8:	60e2                	ld	ra,24(sp)
    12da:	2501                	sext.w	a0,a0
    12dc:	6105                	add	sp,sp,32
    12de:	8082                	ret

00000000000012e0 <puts>:
{
    12e0:	1141                	add	sp,sp,-16
    12e2:	e406                	sd	ra,8(sp)
    12e4:	e022                	sd	s0,0(sp)
    12e6:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12e8:	56c000ef          	jal	1854 <strlen>
    12ec:	862a                	mv	a2,a0
    12ee:	85a2                	mv	a1,s0
    12f0:	4505                	li	a0,1
    12f2:	197000ef          	jal	1c88 <write>
}
    12f6:	60a2                	ld	ra,8(sp)
    12f8:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12fa:	957d                	sra	a0,a0,0x3f
    return r;
    12fc:	2501                	sext.w	a0,a0
}
    12fe:	0141                	add	sp,sp,16
    1300:	8082                	ret

0000000000001302 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1302:	7131                	add	sp,sp,-192
    1304:	e4d6                	sd	s5,72(sp)
    1306:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    1308:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    130a:	013c                	add	a5,sp,136
{
    130c:	f0ca                	sd	s2,96(sp)
    130e:	ecce                	sd	s3,88(sp)
    1310:	e8d2                	sd	s4,80(sp)
    1312:	e0da                	sd	s6,64(sp)
    1314:	fc5e                	sd	s7,56(sp)
    1316:	fc86                	sd	ra,120(sp)
    1318:	f8a2                	sd	s0,112(sp)
    131a:	f4a6                	sd	s1,104(sp)
    131c:	e52e                	sd	a1,136(sp)
    131e:	e932                	sd	a2,144(sp)
    1320:	ed36                	sd	a3,152(sp)
    1322:	f13a                	sd	a4,160(sp)
    1324:	f942                	sd	a6,176(sp)
    1326:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1328:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    132a:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    132e:	07300a13          	li	s4,115
    1332:	07800b93          	li	s7,120
    1336:	06400b13          	li	s6,100
    buf[i++] = '0';
    133a:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x58a0>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    133e:	00001997          	auipc	s3,0x1
    1342:	c5298993          	add	s3,s3,-942 # 1f90 <digits>
        if (!*s)
    1346:	00054783          	lbu	a5,0(a0)
    134a:	16078863          	beqz	a5,14ba <printf+0x1b8>
    134e:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1350:	19278063          	beq	a5,s2,14d0 <printf+0x1ce>
    1354:	00164783          	lbu	a5,1(a2)
    1358:	0605                	add	a2,a2,1
    135a:	fbfd                	bnez	a5,1350 <printf+0x4e>
    135c:	84b2                	mv	s1,a2
        l = z - a;
    135e:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1362:	85aa                	mv	a1,a0
    1364:	8622                	mv	a2,s0
    1366:	4505                	li	a0,1
    1368:	121000ef          	jal	1c88 <write>
        if (l)
    136c:	18041763          	bnez	s0,14fa <printf+0x1f8>
        if (s[1] == 0)
    1370:	0014c783          	lbu	a5,1(s1)
    1374:	14078363          	beqz	a5,14ba <printf+0x1b8>
        switch (s[1])
    1378:	19478f63          	beq	a5,s4,1516 <printf+0x214>
    137c:	18fa6163          	bltu	s4,a5,14fe <printf+0x1fc>
    1380:	1b678e63          	beq	a5,s6,153c <printf+0x23a>
    1384:	07000713          	li	a4,112
    1388:	1ce79463          	bne	a5,a4,1550 <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    138c:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    138e:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1392:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1394:	631c                	ld	a5,0(a4)
    1396:	0721                	add	a4,a4,8
    1398:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    139a:	00479293          	sll	t0,a5,0x4
    139e:	00879f93          	sll	t6,a5,0x8
    13a2:	00c79f13          	sll	t5,a5,0xc
    13a6:	01079e93          	sll	t4,a5,0x10
    13aa:	01479e13          	sll	t3,a5,0x14
    13ae:	01879313          	sll	t1,a5,0x18
    13b2:	01c79893          	sll	a7,a5,0x1c
    13b6:	02479813          	sll	a6,a5,0x24
    13ba:	02879513          	sll	a0,a5,0x28
    13be:	02c79593          	sll	a1,a5,0x2c
    13c2:	03079693          	sll	a3,a5,0x30
    13c6:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13ca:	03c7d413          	srl	s0,a5,0x3c
    13ce:	01c7d39b          	srlw	t2,a5,0x1c
    13d2:	03c2d293          	srl	t0,t0,0x3c
    13d6:	03cfdf93          	srl	t6,t6,0x3c
    13da:	03cf5f13          	srl	t5,t5,0x3c
    13de:	03cede93          	srl	t4,t4,0x3c
    13e2:	03ce5e13          	srl	t3,t3,0x3c
    13e6:	03c35313          	srl	t1,t1,0x3c
    13ea:	03c8d893          	srl	a7,a7,0x3c
    13ee:	03c85813          	srl	a6,a6,0x3c
    13f2:	9171                	srl	a0,a0,0x3c
    13f4:	91f1                	srl	a1,a1,0x3c
    13f6:	92f1                	srl	a3,a3,0x3c
    13f8:	9371                	srl	a4,a4,0x3c
    13fa:	974e                	add	a4,a4,s3
    13fc:	944e                	add	s0,s0,s3
    13fe:	92ce                	add	t0,t0,s3
    1400:	9fce                	add	t6,t6,s3
    1402:	9f4e                	add	t5,t5,s3
    1404:	9ece                	add	t4,t4,s3
    1406:	9e4e                	add	t3,t3,s3
    1408:	934e                	add	t1,t1,s3
    140a:	98ce                	add	a7,a7,s3
    140c:	93ce                	add	t2,t2,s3
    140e:	984e                	add	a6,a6,s3
    1410:	954e                	add	a0,a0,s3
    1412:	95ce                	add	a1,a1,s3
    1414:	96ce                	add	a3,a3,s3
    1416:	00074083          	lbu	ra,0(a4)
    141a:	0002c283          	lbu	t0,0(t0)
    141e:	000fcf83          	lbu	t6,0(t6)
    1422:	000f4f03          	lbu	t5,0(t5)
    1426:	000ece83          	lbu	t4,0(t4)
    142a:	000e4e03          	lbu	t3,0(t3)
    142e:	00034303          	lbu	t1,0(t1)
    1432:	0008c883          	lbu	a7,0(a7)
    1436:	0003c383          	lbu	t2,0(t2)
    143a:	00084803          	lbu	a6,0(a6)
    143e:	00054503          	lbu	a0,0(a0)
    1442:	0005c583          	lbu	a1,0(a1)
    1446:	0006c683          	lbu	a3,0(a3)
    144a:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    144e:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1452:	9371                	srl	a4,a4,0x3c
    1454:	8bbd                	and	a5,a5,15
    1456:	974e                	add	a4,a4,s3
    1458:	97ce                	add	a5,a5,s3
    145a:	005105a3          	sb	t0,11(sp)
    145e:	01f10623          	sb	t6,12(sp)
    1462:	01e106a3          	sb	t5,13(sp)
    1466:	01d10723          	sb	t4,14(sp)
    146a:	01c107a3          	sb	t3,15(sp)
    146e:	00610823          	sb	t1,16(sp)
    1472:	011108a3          	sb	a7,17(sp)
    1476:	00710923          	sb	t2,18(sp)
    147a:	010109a3          	sb	a6,19(sp)
    147e:	00a10a23          	sb	a0,20(sp)
    1482:	00b10aa3          	sb	a1,21(sp)
    1486:	00d10b23          	sb	a3,22(sp)
    148a:	00110ba3          	sb	ra,23(sp)
    148e:	00810523          	sb	s0,10(sp)
    1492:	00074703          	lbu	a4,0(a4)
    1496:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    149a:	002c                	add	a1,sp,8
    149c:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    149e:	00e10c23          	sb	a4,24(sp)
    14a2:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14a6:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14aa:	7de000ef          	jal	1c88 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14ae:	00248513          	add	a0,s1,2
        if (!*s)
    14b2:	00054783          	lbu	a5,0(a0)
    14b6:	e8079ce3          	bnez	a5,134e <printf+0x4c>
    }
    va_end(ap);
}
    14ba:	70e6                	ld	ra,120(sp)
    14bc:	7446                	ld	s0,112(sp)
    14be:	74a6                	ld	s1,104(sp)
    14c0:	7906                	ld	s2,96(sp)
    14c2:	69e6                	ld	s3,88(sp)
    14c4:	6a46                	ld	s4,80(sp)
    14c6:	6aa6                	ld	s5,72(sp)
    14c8:	6b06                	ld	s6,64(sp)
    14ca:	7be2                	ld	s7,56(sp)
    14cc:	6129                	add	sp,sp,192
    14ce:	8082                	ret
    14d0:	84b2                	mv	s1,a2
    14d2:	a039                	j	14e0 <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14d4:	0024c783          	lbu	a5,2(s1)
    14d8:	0605                	add	a2,a2,1
    14da:	0489                	add	s1,s1,2
    14dc:	e92791e3          	bne	a5,s2,135e <printf+0x5c>
    14e0:	0014c783          	lbu	a5,1(s1)
    14e4:	ff2788e3          	beq	a5,s2,14d4 <printf+0x1d2>
        l = z - a;
    14e8:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14ec:	85aa                	mv	a1,a0
    14ee:	8622                	mv	a2,s0
    14f0:	4505                	li	a0,1
    14f2:	796000ef          	jal	1c88 <write>
        if (l)
    14f6:	e6040de3          	beqz	s0,1370 <printf+0x6e>
    14fa:	8526                	mv	a0,s1
    14fc:	b5a9                	j	1346 <printf+0x44>
        switch (s[1])
    14fe:	05779963          	bne	a5,s7,1550 <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    1502:	6782                	ld	a5,0(sp)
    1504:	45c1                	li	a1,16
    1506:	4388                	lw	a0,0(a5)
    1508:	07a1                	add	a5,a5,8
    150a:	e03e                	sd	a5,0(sp)
    150c:	bb7ff0ef          	jal	10c2 <printint.constprop.0>
        s += 2;
    1510:	00248513          	add	a0,s1,2
    1514:	bf79                	j	14b2 <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    1516:	6782                	ld	a5,0(sp)
    1518:	6380                	ld	s0,0(a5)
    151a:	07a1                	add	a5,a5,8
    151c:	e03e                	sd	a5,0(sp)
    151e:	cc21                	beqz	s0,1576 <printf+0x274>
            l = strnlen(a, 200);
    1520:	0c800593          	li	a1,200
    1524:	8522                	mv	a0,s0
    1526:	460000ef          	jal	1986 <strnlen>
    write(f, s, l);
    152a:	0005061b          	sext.w	a2,a0
    152e:	85a2                	mv	a1,s0
    1530:	4505                	li	a0,1
    1532:	756000ef          	jal	1c88 <write>
        s += 2;
    1536:	00248513          	add	a0,s1,2
    153a:	bfa5                	j	14b2 <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    153c:	6782                	ld	a5,0(sp)
    153e:	45a9                	li	a1,10
    1540:	4388                	lw	a0,0(a5)
    1542:	07a1                	add	a5,a5,8
    1544:	e03e                	sd	a5,0(sp)
    1546:	b7dff0ef          	jal	10c2 <printint.constprop.0>
        s += 2;
    154a:	00248513          	add	a0,s1,2
    154e:	b795                	j	14b2 <printf+0x1b0>
    return write(stdout, &byte, 1);
    1550:	4605                	li	a2,1
    1552:	002c                	add	a1,sp,8
    1554:	4505                	li	a0,1
    char byte = c;
    1556:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    155a:	72e000ef          	jal	1c88 <write>
    char byte = c;
    155e:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1562:	4605                	li	a2,1
    1564:	002c                	add	a1,sp,8
    1566:	4505                	li	a0,1
    char byte = c;
    1568:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    156c:	71c000ef          	jal	1c88 <write>
        s += 2;
    1570:	00248513          	add	a0,s1,2
    1574:	bf3d                	j	14b2 <printf+0x1b0>
                a = "(null)";
    1576:	00001417          	auipc	s0,0x1
    157a:	a0240413          	add	s0,s0,-1534 # 1f78 <__clone+0xb8>
    157e:	b74d                	j	1520 <printf+0x21e>

0000000000001580 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1580:	1141                	add	sp,sp,-16
    1582:	e406                	sd	ra,8(sp)
    puts(m);
    1584:	d5dff0ef          	jal	12e0 <puts>
    exit(-100);
}
    1588:	60a2                	ld	ra,8(sp)
    exit(-100);
    158a:	f9c00513          	li	a0,-100
}
    158e:	0141                	add	sp,sp,16
    exit(-100);
    1590:	a7a1                	j	1cd8 <exit>

0000000000001592 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1592:	02000793          	li	a5,32
    1596:	00f50663          	beq	a0,a5,15a2 <isspace+0x10>
    159a:	355d                	addw	a0,a0,-9
    159c:	00553513          	sltiu	a0,a0,5
    15a0:	8082                	ret
    15a2:	4505                	li	a0,1
}
    15a4:	8082                	ret

00000000000015a6 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15a6:	fd05051b          	addw	a0,a0,-48
}
    15aa:	00a53513          	sltiu	a0,a0,10
    15ae:	8082                	ret

00000000000015b0 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15b0:	02000713          	li	a4,32
    15b4:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15b6:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ba:	ff76879b          	addw	a5,a3,-9
    15be:	06e68063          	beq	a3,a4,161e <atoi+0x6e>
    15c2:	0006859b          	sext.w	a1,a3
    15c6:	04f67c63          	bgeu	a2,a5,161e <atoi+0x6e>
        s++;
    switch (*s)
    15ca:	02b00793          	li	a5,43
    15ce:	06f68563          	beq	a3,a5,1638 <atoi+0x88>
    15d2:	02d00793          	li	a5,45
    15d6:	04f69663          	bne	a3,a5,1622 <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15da:	00154683          	lbu	a3,1(a0)
    15de:	47a5                	li	a5,9
        s++;
    15e0:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    15e4:	fd06869b          	addw	a3,a3,-48
    15e8:	8636                	mv	a2,a3
    while (isdigit(*s))
    15ea:	04d7e563          	bltu	a5,a3,1634 <atoi+0x84>
        neg = 1;
    15ee:	4885                	li	a7,1
    int n = 0, neg = 0;
    15f0:	4501                	li	a0,0
    while (isdigit(*s))
    15f2:	4825                	li	a6,9
    15f4:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    15f8:	0025179b          	sllw	a5,a0,0x2
    15fc:	9fa9                	addw	a5,a5,a0
    15fe:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    1602:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    1606:	85b2                	mv	a1,a2
    1608:	40c7853b          	subw	a0,a5,a2
    160c:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    160e:	8636                	mv	a2,a3
    while (isdigit(*s))
    1610:	fed872e3          	bgeu	a6,a3,15f4 <atoi+0x44>
    return neg ? n : -n;
    1614:	02089163          	bnez	a7,1636 <atoi+0x86>
    1618:	40f5853b          	subw	a0,a1,a5
    161c:	8082                	ret
        s++;
    161e:	0505                	add	a0,a0,1
    1620:	bf59                	j	15b6 <atoi+0x6>
    while (isdigit(*s))
    1622:	fd05859b          	addw	a1,a1,-48
    1626:	47a5                	li	a5,9
    1628:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    162a:	4881                	li	a7,0
    162c:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    1630:	fcb7f0e3          	bgeu	a5,a1,15f0 <atoi+0x40>
    return neg ? n : -n;
    1634:	4501                	li	a0,0
}
    1636:	8082                	ret
    while (isdigit(*s))
    1638:	00154683          	lbu	a3,1(a0)
    163c:	47a5                	li	a5,9
        s++;
    163e:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1642:	fd06869b          	addw	a3,a3,-48
    1646:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    1648:	4881                	li	a7,0
    while (isdigit(*s))
    164a:	fad7f3e3          	bgeu	a5,a3,15f0 <atoi+0x40>
    return neg ? n : -n;
    164e:	4501                	li	a0,0
    1650:	8082                	ret

0000000000001652 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1652:	16060f63          	beqz	a2,17d0 <memset+0x17e>
    1656:	40a006b3          	neg	a3,a0
    165a:	0076f793          	and	a5,a3,7
    165e:	00778813          	add	a6,a5,7
    1662:	48ad                	li	a7,11
    1664:	0ff5f713          	zext.b	a4,a1
    1668:	fff60593          	add	a1,a2,-1
    166c:	17186363          	bltu	a6,a7,17d2 <memset+0x180>
    1670:	1705eb63          	bltu	a1,a6,17e6 <memset+0x194>
    1674:	16078163          	beqz	a5,17d6 <memset+0x184>
    1678:	00e50023          	sb	a4,0(a0)
    167c:	0066f593          	and	a1,a3,6
    1680:	14058e63          	beqz	a1,17dc <memset+0x18a>
    1684:	00e500a3          	sb	a4,1(a0)
    1688:	4589                	li	a1,2
    168a:	00250813          	add	a6,a0,2
    168e:	04f5f663          	bgeu	a1,a5,16da <memset+0x88>
    1692:	00e50123          	sb	a4,2(a0)
    1696:	8a91                	and	a3,a3,4
    1698:	00350813          	add	a6,a0,3
    169c:	458d                	li	a1,3
    169e:	ce95                	beqz	a3,16da <memset+0x88>
    16a0:	00e501a3          	sb	a4,3(a0)
    16a4:	4691                	li	a3,4
    16a6:	00450813          	add	a6,a0,4
    16aa:	4591                	li	a1,4
    16ac:	02f6f763          	bgeu	a3,a5,16da <memset+0x88>
    16b0:	00e50223          	sb	a4,4(a0)
    16b4:	4695                	li	a3,5
    16b6:	00550813          	add	a6,a0,5
    16ba:	4595                	li	a1,5
    16bc:	00d78f63          	beq	a5,a3,16da <memset+0x88>
    16c0:	00e502a3          	sb	a4,5(a0)
    16c4:	469d                	li	a3,7
    16c6:	00650813          	add	a6,a0,6
    16ca:	4599                	li	a1,6
    16cc:	00d79763          	bne	a5,a3,16da <memset+0x88>
    16d0:	00750813          	add	a6,a0,7
    16d4:	00e50323          	sb	a4,6(a0)
    16d8:	459d                	li	a1,7
    16da:	00871693          	sll	a3,a4,0x8
    16de:	01071313          	sll	t1,a4,0x10
    16e2:	8ed9                	or	a3,a3,a4
    16e4:	01871893          	sll	a7,a4,0x18
    16e8:	0066e6b3          	or	a3,a3,t1
    16ec:	0116e6b3          	or	a3,a3,a7
    16f0:	02071313          	sll	t1,a4,0x20
    16f4:	02871893          	sll	a7,a4,0x28
    16f8:	0066e6b3          	or	a3,a3,t1
    16fc:	40f60e33          	sub	t3,a2,a5
    1700:	03071313          	sll	t1,a4,0x30
    1704:	0116e6b3          	or	a3,a3,a7
    1708:	0066e6b3          	or	a3,a3,t1
    170c:	03871893          	sll	a7,a4,0x38
    1710:	97aa                	add	a5,a5,a0
    1712:	ff8e7313          	and	t1,t3,-8
    1716:	0116e6b3          	or	a3,a3,a7
    171a:	00f308b3          	add	a7,t1,a5
    171e:	e394                	sd	a3,0(a5)
    1720:	07a1                	add	a5,a5,8
    1722:	ff179ee3          	bne	a5,a7,171e <memset+0xcc>
    1726:	006806b3          	add	a3,a6,t1
    172a:	00b307bb          	addw	a5,t1,a1
    172e:	0bc30b63          	beq	t1,t3,17e4 <memset+0x192>
    1732:	00e68023          	sb	a4,0(a3)
    1736:	0017859b          	addw	a1,a5,1
    173a:	08c5fb63          	bgeu	a1,a2,17d0 <memset+0x17e>
    173e:	00e680a3          	sb	a4,1(a3)
    1742:	0027859b          	addw	a1,a5,2
    1746:	08c5f563          	bgeu	a1,a2,17d0 <memset+0x17e>
    174a:	00e68123          	sb	a4,2(a3)
    174e:	0037859b          	addw	a1,a5,3
    1752:	06c5ff63          	bgeu	a1,a2,17d0 <memset+0x17e>
    1756:	00e681a3          	sb	a4,3(a3)
    175a:	0047859b          	addw	a1,a5,4
    175e:	06c5f963          	bgeu	a1,a2,17d0 <memset+0x17e>
    1762:	00e68223          	sb	a4,4(a3)
    1766:	0057859b          	addw	a1,a5,5
    176a:	06c5f363          	bgeu	a1,a2,17d0 <memset+0x17e>
    176e:	00e682a3          	sb	a4,5(a3)
    1772:	0067859b          	addw	a1,a5,6
    1776:	04c5fd63          	bgeu	a1,a2,17d0 <memset+0x17e>
    177a:	00e68323          	sb	a4,6(a3)
    177e:	0077859b          	addw	a1,a5,7
    1782:	04c5f763          	bgeu	a1,a2,17d0 <memset+0x17e>
    1786:	00e683a3          	sb	a4,7(a3)
    178a:	0087859b          	addw	a1,a5,8
    178e:	04c5f163          	bgeu	a1,a2,17d0 <memset+0x17e>
    1792:	00e68423          	sb	a4,8(a3)
    1796:	0097859b          	addw	a1,a5,9
    179a:	02c5fb63          	bgeu	a1,a2,17d0 <memset+0x17e>
    179e:	00e684a3          	sb	a4,9(a3)
    17a2:	00a7859b          	addw	a1,a5,10
    17a6:	02c5f563          	bgeu	a1,a2,17d0 <memset+0x17e>
    17aa:	00e68523          	sb	a4,10(a3)
    17ae:	00b7859b          	addw	a1,a5,11
    17b2:	00c5ff63          	bgeu	a1,a2,17d0 <memset+0x17e>
    17b6:	00e685a3          	sb	a4,11(a3)
    17ba:	00c7859b          	addw	a1,a5,12
    17be:	00c5f963          	bgeu	a1,a2,17d0 <memset+0x17e>
    17c2:	00e68623          	sb	a4,12(a3)
    17c6:	27b5                	addw	a5,a5,13
    17c8:	00c7f463          	bgeu	a5,a2,17d0 <memset+0x17e>
    17cc:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17d0:	8082                	ret
    17d2:	482d                	li	a6,11
    17d4:	bd71                	j	1670 <memset+0x1e>
    char *p = dest;
    17d6:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17d8:	4581                	li	a1,0
    17da:	b701                	j	16da <memset+0x88>
    17dc:	00150813          	add	a6,a0,1
    17e0:	4585                	li	a1,1
    17e2:	bde5                	j	16da <memset+0x88>
    17e4:	8082                	ret
    char *p = dest;
    17e6:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17e8:	4781                	li	a5,0
    17ea:	b7a1                	j	1732 <memset+0xe0>

00000000000017ec <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17ec:	00054783          	lbu	a5,0(a0)
    17f0:	0005c703          	lbu	a4,0(a1)
    17f4:	00e79863          	bne	a5,a4,1804 <strcmp+0x18>
    17f8:	0505                	add	a0,a0,1
    17fa:	0585                	add	a1,a1,1
    17fc:	fbe5                	bnez	a5,17ec <strcmp>
    17fe:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1800:	9d19                	subw	a0,a0,a4
    1802:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1804:	0007851b          	sext.w	a0,a5
    1808:	bfe5                	j	1800 <strcmp+0x14>

000000000000180a <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    180a:	ca15                	beqz	a2,183e <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    180c:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1810:	167d                	add	a2,a2,-1
    1812:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1816:	eb99                	bnez	a5,182c <strncmp+0x22>
    1818:	a815                	j	184c <strncmp+0x42>
    181a:	00a68e63          	beq	a3,a0,1836 <strncmp+0x2c>
    181e:	0505                	add	a0,a0,1
    1820:	00f71b63          	bne	a4,a5,1836 <strncmp+0x2c>
    1824:	00054783          	lbu	a5,0(a0)
    1828:	cf89                	beqz	a5,1842 <strncmp+0x38>
    182a:	85b2                	mv	a1,a2
    182c:	0005c703          	lbu	a4,0(a1)
    1830:	00158613          	add	a2,a1,1
    1834:	f37d                	bnez	a4,181a <strncmp+0x10>
        ;
    return *l - *r;
    1836:	0007851b          	sext.w	a0,a5
    183a:	9d19                	subw	a0,a0,a4
    183c:	8082                	ret
        return 0;
    183e:	4501                	li	a0,0
}
    1840:	8082                	ret
    return *l - *r;
    1842:	0015c703          	lbu	a4,1(a1)
    1846:	4501                	li	a0,0
    1848:	9d19                	subw	a0,a0,a4
    184a:	8082                	ret
    184c:	0005c703          	lbu	a4,0(a1)
    1850:	4501                	li	a0,0
    1852:	b7e5                	j	183a <strncmp+0x30>

0000000000001854 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1854:	00757793          	and	a5,a0,7
    1858:	cf89                	beqz	a5,1872 <strlen+0x1e>
    185a:	87aa                	mv	a5,a0
    185c:	a029                	j	1866 <strlen+0x12>
    185e:	0785                	add	a5,a5,1
    1860:	0077f713          	and	a4,a5,7
    1864:	cb01                	beqz	a4,1874 <strlen+0x20>
        if (!*s)
    1866:	0007c703          	lbu	a4,0(a5)
    186a:	fb75                	bnez	a4,185e <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    186c:	40a78533          	sub	a0,a5,a0
}
    1870:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1872:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1874:	feff05b7          	lui	a1,0xfeff0
    1878:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedf6f>
    187c:	f0101637          	lui	a2,0xf0101
    1880:	05c2                	sll	a1,a1,0x10
    1882:	0612                	sll	a2,a2,0x4
    1884:	6394                	ld	a3,0(a5)
    1886:	eff58593          	add	a1,a1,-257
    188a:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff171>
    188e:	05c2                	sll	a1,a1,0x10
    1890:	0642                	sll	a2,a2,0x10
    1892:	eff58593          	add	a1,a1,-257
    1896:	10160613          	add	a2,a2,257
    189a:	00b68733          	add	a4,a3,a1
    189e:	063e                	sll	a2,a2,0xf
    18a0:	fff6c693          	not	a3,a3
    18a4:	8f75                	and	a4,a4,a3
    18a6:	08060613          	add	a2,a2,128
    18aa:	8f71                	and	a4,a4,a2
    18ac:	eb11                	bnez	a4,18c0 <strlen+0x6c>
    18ae:	6794                	ld	a3,8(a5)
    18b0:	07a1                	add	a5,a5,8
    18b2:	00b68733          	add	a4,a3,a1
    18b6:	fff6c693          	not	a3,a3
    18ba:	8f75                	and	a4,a4,a3
    18bc:	8f71                	and	a4,a4,a2
    18be:	db65                	beqz	a4,18ae <strlen+0x5a>
    for (; *s; s++)
    18c0:	0007c703          	lbu	a4,0(a5)
    18c4:	d745                	beqz	a4,186c <strlen+0x18>
    18c6:	0017c703          	lbu	a4,1(a5)
    18ca:	0785                	add	a5,a5,1
    18cc:	d345                	beqz	a4,186c <strlen+0x18>
    18ce:	0017c703          	lbu	a4,1(a5)
    18d2:	0785                	add	a5,a5,1
    18d4:	fb6d                	bnez	a4,18c6 <strlen+0x72>
    18d6:	bf59                	j	186c <strlen+0x18>

00000000000018d8 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18d8:	00757713          	and	a4,a0,7
{
    18dc:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18de:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18e2:	cb19                	beqz	a4,18f8 <memchr+0x20>
    18e4:	ce59                	beqz	a2,1982 <memchr+0xaa>
    18e6:	0007c703          	lbu	a4,0(a5)
    18ea:	00b70963          	beq	a4,a1,18fc <memchr+0x24>
    18ee:	0785                	add	a5,a5,1
    18f0:	0077f713          	and	a4,a5,7
    18f4:	167d                	add	a2,a2,-1
    18f6:	f77d                	bnez	a4,18e4 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18f8:	4501                	li	a0,0
    if (n && *s != c)
    18fa:	c649                	beqz	a2,1984 <memchr+0xac>
    18fc:	0007c703          	lbu	a4,0(a5)
    1900:	06b70663          	beq	a4,a1,196c <memchr+0x94>
        size_t k = ONES * c;
    1904:	01010737          	lui	a4,0x1010
    1908:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e171>
    190c:	0742                	sll	a4,a4,0x10
    190e:	10170713          	add	a4,a4,257
    1912:	0742                	sll	a4,a4,0x10
    1914:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1918:	469d                	li	a3,7
        size_t k = ONES * c;
    191a:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    191e:	04c6f763          	bgeu	a3,a2,196c <memchr+0x94>
    1922:	f0101837          	lui	a6,0xf0101
    1926:	feff08b7          	lui	a7,0xfeff0
    192a:	0812                	sll	a6,a6,0x4
    192c:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedf6f>
    1930:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff171>
    1934:	08c2                	sll	a7,a7,0x10
    1936:	0842                	sll	a6,a6,0x10
    1938:	eff88893          	add	a7,a7,-257
    193c:	10180813          	add	a6,a6,257
    1940:	08c2                	sll	a7,a7,0x10
    1942:	083e                	sll	a6,a6,0xf
    1944:	eff88893          	add	a7,a7,-257
    1948:	08080813          	add	a6,a6,128
    194c:	431d                	li	t1,7
    194e:	a029                	j	1958 <memchr+0x80>
    1950:	1661                	add	a2,a2,-8
    1952:	07a1                	add	a5,a5,8
    1954:	02c37663          	bgeu	t1,a2,1980 <memchr+0xa8>
    1958:	6398                	ld	a4,0(a5)
    195a:	8f29                	xor	a4,a4,a0
    195c:	011706b3          	add	a3,a4,a7
    1960:	fff74713          	not	a4,a4
    1964:	8f75                	and	a4,a4,a3
    1966:	01077733          	and	a4,a4,a6
    196a:	d37d                	beqz	a4,1950 <memchr+0x78>
        s = (const void *)w;
    196c:	853e                	mv	a0,a5
    196e:	a019                	j	1974 <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    1970:	0505                	add	a0,a0,1
    1972:	ca01                	beqz	a2,1982 <memchr+0xaa>
    1974:	00054783          	lbu	a5,0(a0)
    1978:	167d                	add	a2,a2,-1
    197a:	feb79be3          	bne	a5,a1,1970 <memchr+0x98>
    197e:	8082                	ret
    1980:	f675                	bnez	a2,196c <memchr+0x94>
    return n ? (void *)s : 0;
    1982:	4501                	li	a0,0
}
    1984:	8082                	ret

0000000000001986 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1986:	1101                	add	sp,sp,-32
    1988:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    198a:	862e                	mv	a2,a1
{
    198c:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    198e:	4581                	li	a1,0
{
    1990:	e426                	sd	s1,8(sp)
    1992:	ec06                	sd	ra,24(sp)
    1994:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1996:	f43ff0ef          	jal	18d8 <memchr>
    return p ? p - s : n;
    199a:	c519                	beqz	a0,19a8 <strnlen+0x22>
}
    199c:	60e2                	ld	ra,24(sp)
    199e:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19a0:	8d05                	sub	a0,a0,s1
}
    19a2:	64a2                	ld	s1,8(sp)
    19a4:	6105                	add	sp,sp,32
    19a6:	8082                	ret
    19a8:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19aa:	8522                	mv	a0,s0
}
    19ac:	6442                	ld	s0,16(sp)
    19ae:	64a2                	ld	s1,8(sp)
    19b0:	6105                	add	sp,sp,32
    19b2:	8082                	ret

00000000000019b4 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19b4:	00b547b3          	xor	a5,a0,a1
    19b8:	8b9d                	and	a5,a5,7
    19ba:	efb1                	bnez	a5,1a16 <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19bc:	0075f793          	and	a5,a1,7
    19c0:	ebb5                	bnez	a5,1a34 <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19c2:	feff0637          	lui	a2,0xfeff0
    19c6:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedf6f>
    19ca:	f01016b7          	lui	a3,0xf0101
    19ce:	0642                	sll	a2,a2,0x10
    19d0:	0692                	sll	a3,a3,0x4
    19d2:	6198                	ld	a4,0(a1)
    19d4:	eff60613          	add	a2,a2,-257
    19d8:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff171>
    19dc:	0642                	sll	a2,a2,0x10
    19de:	06c2                	sll	a3,a3,0x10
    19e0:	eff60613          	add	a2,a2,-257
    19e4:	10168693          	add	a3,a3,257
    19e8:	00c707b3          	add	a5,a4,a2
    19ec:	fff74813          	not	a6,a4
    19f0:	06be                	sll	a3,a3,0xf
    19f2:	0107f7b3          	and	a5,a5,a6
    19f6:	08068693          	add	a3,a3,128
    19fa:	8ff5                	and	a5,a5,a3
    19fc:	ef89                	bnez	a5,1a16 <strcpy+0x62>
    19fe:	05a1                	add	a1,a1,8
    1a00:	e118                	sd	a4,0(a0)
    1a02:	6198                	ld	a4,0(a1)
    1a04:	0521                	add	a0,a0,8
    1a06:	00c707b3          	add	a5,a4,a2
    1a0a:	fff74813          	not	a6,a4
    1a0e:	0107f7b3          	and	a5,a5,a6
    1a12:	8ff5                	and	a5,a5,a3
    1a14:	d7ed                	beqz	a5,19fe <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a16:	0005c783          	lbu	a5,0(a1)
    1a1a:	00f50023          	sb	a5,0(a0)
    1a1e:	c785                	beqz	a5,1a46 <strcpy+0x92>
    1a20:	0015c783          	lbu	a5,1(a1)
    1a24:	0505                	add	a0,a0,1
    1a26:	0585                	add	a1,a1,1
    1a28:	00f50023          	sb	a5,0(a0)
    1a2c:	fbf5                	bnez	a5,1a20 <strcpy+0x6c>
        ;
    return d;
}
    1a2e:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a30:	0505                	add	a0,a0,1
    1a32:	db41                	beqz	a4,19c2 <strcpy+0xe>
            if (!(*d = *s))
    1a34:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a38:	0585                	add	a1,a1,1
    1a3a:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a3e:	00f50023          	sb	a5,0(a0)
    1a42:	f7fd                	bnez	a5,1a30 <strcpy+0x7c>
}
    1a44:	8082                	ret
    1a46:	8082                	ret

0000000000001a48 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a48:	00b547b3          	xor	a5,a0,a1
    1a4c:	8b9d                	and	a5,a5,7
    1a4e:	efbd                	bnez	a5,1acc <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a50:	0075f793          	and	a5,a1,7
    1a54:	1c078563          	beqz	a5,1c1e <strncpy+0x1d6>
    1a58:	ea11                	bnez	a2,1a6c <strncpy+0x24>
    1a5a:	8082                	ret
    1a5c:	0585                	add	a1,a1,1
    1a5e:	0075f793          	and	a5,a1,7
    1a62:	167d                	add	a2,a2,-1
    1a64:	0505                	add	a0,a0,1
    1a66:	1a078c63          	beqz	a5,1c1e <strncpy+0x1d6>
    1a6a:	ca3d                	beqz	a2,1ae0 <strncpy+0x98>
    1a6c:	0005c783          	lbu	a5,0(a1)
    1a70:	00f50023          	sb	a5,0(a0)
    1a74:	f7e5                	bnez	a5,1a5c <strncpy+0x14>
            ;
        if (!n || !*s)
    1a76:	0005c783          	lbu	a5,0(a1)
    1a7a:	c7a5                	beqz	a5,1ae2 <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a7c:	479d                	li	a5,7
    1a7e:	04c7f863          	bgeu	a5,a2,1ace <strncpy+0x86>
    1a82:	f01016b7          	lui	a3,0xf0101
    1a86:	feff0837          	lui	a6,0xfeff0
    1a8a:	0692                	sll	a3,a3,0x4
    1a8c:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedf6f>
    1a90:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff171>
    1a94:	0842                	sll	a6,a6,0x10
    1a96:	06c2                	sll	a3,a3,0x10
    1a98:	eff80813          	add	a6,a6,-257
    1a9c:	10168693          	add	a3,a3,257
    1aa0:	0842                	sll	a6,a6,0x10
    1aa2:	06be                	sll	a3,a3,0xf
    1aa4:	eff80813          	add	a6,a6,-257
    1aa8:	08068693          	add	a3,a3,128
    1aac:	431d                	li	t1,7
    1aae:	6198                	ld	a4,0(a1)
    1ab0:	010707b3          	add	a5,a4,a6
    1ab4:	fff74893          	not	a7,a4
    1ab8:	0117f7b3          	and	a5,a5,a7
    1abc:	8ff5                	and	a5,a5,a3
    1abe:	eb81                	bnez	a5,1ace <strncpy+0x86>
            *wd = *ws;
    1ac0:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ac2:	1661                	add	a2,a2,-8
    1ac4:	05a1                	add	a1,a1,8
    1ac6:	0521                	add	a0,a0,8
    1ac8:	fec363e3          	bltu	t1,a2,1aae <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1acc:	ca11                	beqz	a2,1ae0 <strncpy+0x98>
    1ace:	0005c783          	lbu	a5,0(a1)
    1ad2:	0585                	add	a1,a1,1
    1ad4:	00f50023          	sb	a5,0(a0)
    1ad8:	c789                	beqz	a5,1ae2 <strncpy+0x9a>
    1ada:	167d                	add	a2,a2,-1
    1adc:	0505                	add	a0,a0,1
    1ade:	fa65                	bnez	a2,1ace <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1ae0:	8082                	ret
    1ae2:	40a00733          	neg	a4,a0
    1ae6:	00777793          	and	a5,a4,7
    1aea:	00778693          	add	a3,a5,7
    1aee:	482d                	li	a6,11
    1af0:	fff60593          	add	a1,a2,-1
    1af4:	1106ef63          	bltu	a3,a6,1c12 <strncpy+0x1ca>
    1af8:	12d5ee63          	bltu	a1,a3,1c34 <strncpy+0x1ec>
    1afc:	12078563          	beqz	a5,1c26 <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b00:	00050023          	sb	zero,0(a0)
    1b04:	00677693          	and	a3,a4,6
    1b08:	12068263          	beqz	a3,1c2c <strncpy+0x1e4>
    1b0c:	000500a3          	sb	zero,1(a0)
    1b10:	4689                	li	a3,2
    1b12:	12f6f463          	bgeu	a3,a5,1c3a <strncpy+0x1f2>
    1b16:	00050123          	sb	zero,2(a0)
    1b1a:	8b11                	and	a4,a4,4
    1b1c:	cf6d                	beqz	a4,1c16 <strncpy+0x1ce>
    1b1e:	000501a3          	sb	zero,3(a0)
    1b22:	4711                	li	a4,4
    1b24:	00450693          	add	a3,a0,4
    1b28:	02f77363          	bgeu	a4,a5,1b4e <strncpy+0x106>
    1b2c:	00050223          	sb	zero,4(a0)
    1b30:	4715                	li	a4,5
    1b32:	00550693          	add	a3,a0,5
    1b36:	00e78c63          	beq	a5,a4,1b4e <strncpy+0x106>
    1b3a:	000502a3          	sb	zero,5(a0)
    1b3e:	471d                	li	a4,7
    1b40:	10e79163          	bne	a5,a4,1c42 <strncpy+0x1fa>
    1b44:	00750693          	add	a3,a0,7
    1b48:	00050323          	sb	zero,6(a0)
    1b4c:	471d                	li	a4,7
    1b4e:	40f608b3          	sub	a7,a2,a5
    1b52:	ff88f813          	and	a6,a7,-8
    1b56:	97aa                	add	a5,a5,a0
    1b58:	010785b3          	add	a1,a5,a6
    1b5c:	0007b023          	sd	zero,0(a5)
    1b60:	07a1                	add	a5,a5,8
    1b62:	feb79de3          	bne	a5,a1,1b5c <strncpy+0x114>
    1b66:	00e807bb          	addw	a5,a6,a4
    1b6a:	01068733          	add	a4,a3,a6
    1b6e:	0b088b63          	beq	a7,a6,1c24 <strncpy+0x1dc>
    1b72:	00070023          	sb	zero,0(a4)
    1b76:	0017869b          	addw	a3,a5,1
    1b7a:	f6c6f3e3          	bgeu	a3,a2,1ae0 <strncpy+0x98>
    1b7e:	000700a3          	sb	zero,1(a4)
    1b82:	0027869b          	addw	a3,a5,2
    1b86:	f4c6fde3          	bgeu	a3,a2,1ae0 <strncpy+0x98>
    1b8a:	00070123          	sb	zero,2(a4)
    1b8e:	0037869b          	addw	a3,a5,3
    1b92:	f4c6f7e3          	bgeu	a3,a2,1ae0 <strncpy+0x98>
    1b96:	000701a3          	sb	zero,3(a4)
    1b9a:	0047869b          	addw	a3,a5,4
    1b9e:	f4c6f1e3          	bgeu	a3,a2,1ae0 <strncpy+0x98>
    1ba2:	00070223          	sb	zero,4(a4)
    1ba6:	0057869b          	addw	a3,a5,5
    1baa:	f2c6fbe3          	bgeu	a3,a2,1ae0 <strncpy+0x98>
    1bae:	000702a3          	sb	zero,5(a4)
    1bb2:	0067869b          	addw	a3,a5,6
    1bb6:	f2c6f5e3          	bgeu	a3,a2,1ae0 <strncpy+0x98>
    1bba:	00070323          	sb	zero,6(a4)
    1bbe:	0077869b          	addw	a3,a5,7
    1bc2:	f0c6ffe3          	bgeu	a3,a2,1ae0 <strncpy+0x98>
    1bc6:	000703a3          	sb	zero,7(a4)
    1bca:	0087869b          	addw	a3,a5,8
    1bce:	f0c6f9e3          	bgeu	a3,a2,1ae0 <strncpy+0x98>
    1bd2:	00070423          	sb	zero,8(a4)
    1bd6:	0097869b          	addw	a3,a5,9
    1bda:	f0c6f3e3          	bgeu	a3,a2,1ae0 <strncpy+0x98>
    1bde:	000704a3          	sb	zero,9(a4)
    1be2:	00a7869b          	addw	a3,a5,10
    1be6:	eec6fde3          	bgeu	a3,a2,1ae0 <strncpy+0x98>
    1bea:	00070523          	sb	zero,10(a4)
    1bee:	00b7869b          	addw	a3,a5,11
    1bf2:	eec6f7e3          	bgeu	a3,a2,1ae0 <strncpy+0x98>
    1bf6:	000705a3          	sb	zero,11(a4)
    1bfa:	00c7869b          	addw	a3,a5,12
    1bfe:	eec6f1e3          	bgeu	a3,a2,1ae0 <strncpy+0x98>
    1c02:	00070623          	sb	zero,12(a4)
    1c06:	27b5                	addw	a5,a5,13
    1c08:	ecc7fce3          	bgeu	a5,a2,1ae0 <strncpy+0x98>
    1c0c:	000706a3          	sb	zero,13(a4)
}
    1c10:	8082                	ret
    1c12:	46ad                	li	a3,11
    1c14:	b5d5                	j	1af8 <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c16:	00350693          	add	a3,a0,3
    1c1a:	470d                	li	a4,3
    1c1c:	bf0d                	j	1b4e <strncpy+0x106>
        if (!n || !*s)
    1c1e:	e4061ce3          	bnez	a2,1a76 <strncpy+0x2e>
}
    1c22:	8082                	ret
    1c24:	8082                	ret
    char *p = dest;
    1c26:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c28:	4701                	li	a4,0
    1c2a:	b715                	j	1b4e <strncpy+0x106>
    1c2c:	00150693          	add	a3,a0,1
    1c30:	4705                	li	a4,1
    1c32:	bf31                	j	1b4e <strncpy+0x106>
    char *p = dest;
    1c34:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c36:	4781                	li	a5,0
    1c38:	bf2d                	j	1b72 <strncpy+0x12a>
    1c3a:	00250693          	add	a3,a0,2
    1c3e:	4709                	li	a4,2
    1c40:	b739                	j	1b4e <strncpy+0x106>
    1c42:	00650693          	add	a3,a0,6
    1c46:	4719                	li	a4,6
    1c48:	b719                	j	1b4e <strncpy+0x106>

0000000000001c4a <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c4a:	87aa                	mv	a5,a0
    1c4c:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c4e:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c52:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c56:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c58:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c5a:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c5e:	2501                	sext.w	a0,a0
    1c60:	8082                	ret

0000000000001c62 <openat>:
    register long a7 __asm__("a7") = n;
    1c62:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c66:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c6a:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c6e:	2501                	sext.w	a0,a0
    1c70:	8082                	ret

0000000000001c72 <close>:
    register long a7 __asm__("a7") = n;
    1c72:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c76:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c7a:	2501                	sext.w	a0,a0
    1c7c:	8082                	ret

0000000000001c7e <read>:
    register long a7 __asm__("a7") = n;
    1c7e:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c82:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c86:	8082                	ret

0000000000001c88 <write>:
    register long a7 __asm__("a7") = n;
    1c88:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c8c:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c90:	8082                	ret

0000000000001c92 <getpid>:
    register long a7 __asm__("a7") = n;
    1c92:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c96:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c9a:	2501                	sext.w	a0,a0
    1c9c:	8082                	ret

0000000000001c9e <getppid>:
    register long a7 __asm__("a7") = n;
    1c9e:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1ca2:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1ca6:	2501                	sext.w	a0,a0
    1ca8:	8082                	ret

0000000000001caa <sched_yield>:
    register long a7 __asm__("a7") = n;
    1caa:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cae:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cb2:	2501                	sext.w	a0,a0
    1cb4:	8082                	ret

0000000000001cb6 <fork>:
    register long a7 __asm__("a7") = n;
    1cb6:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cba:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cbc:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cbe:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cc2:	2501                	sext.w	a0,a0
    1cc4:	8082                	ret

0000000000001cc6 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cc6:	85b2                	mv	a1,a2
    1cc8:	863a                	mv	a2,a4
    if (stack)
    1cca:	c191                	beqz	a1,1cce <clone+0x8>
	stack += stack_size;
    1ccc:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cce:	4781                	li	a5,0
    1cd0:	4701                	li	a4,0
    1cd2:	4681                	li	a3,0
    1cd4:	2601                	sext.w	a2,a2
    1cd6:	a2ed                	j	1ec0 <__clone>

0000000000001cd8 <exit>:
    register long a7 __asm__("a7") = n;
    1cd8:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cdc:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1ce0:	8082                	ret

0000000000001ce2 <waitpid>:
    register long a7 __asm__("a7") = n;
    1ce2:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1ce6:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ce8:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cec:	2501                	sext.w	a0,a0
    1cee:	8082                	ret

0000000000001cf0 <exec>:
    register long a7 __asm__("a7") = n;
    1cf0:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cf4:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cf8:	2501                	sext.w	a0,a0
    1cfa:	8082                	ret

0000000000001cfc <execve>:
    register long a7 __asm__("a7") = n;
    1cfc:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d00:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d04:	2501                	sext.w	a0,a0
    1d06:	8082                	ret

0000000000001d08 <times>:
    register long a7 __asm__("a7") = n;
    1d08:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d0c:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d10:	2501                	sext.w	a0,a0
    1d12:	8082                	ret

0000000000001d14 <get_time>:

int64 get_time()
{
    1d14:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d16:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d1a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d1c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d1e:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d22:	2501                	sext.w	a0,a0
    1d24:	ed09                	bnez	a0,1d3e <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d26:	67a2                	ld	a5,8(sp)
    1d28:	3e800713          	li	a4,1000
    1d2c:	00015503          	lhu	a0,0(sp)
    1d30:	02e7d7b3          	divu	a5,a5,a4
    1d34:	02e50533          	mul	a0,a0,a4
    1d38:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d3a:	0141                	add	sp,sp,16
    1d3c:	8082                	ret
        return -1;
    1d3e:	557d                	li	a0,-1
    1d40:	bfed                	j	1d3a <get_time+0x26>

0000000000001d42 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d42:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d46:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d4a:	2501                	sext.w	a0,a0
    1d4c:	8082                	ret

0000000000001d4e <time>:
    register long a7 __asm__("a7") = n;
    1d4e:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d52:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d56:	2501                	sext.w	a0,a0
    1d58:	8082                	ret

0000000000001d5a <sleep>:

int sleep(unsigned long long time)
{
    1d5a:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d5c:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d5e:	850a                	mv	a0,sp
    1d60:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d62:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d66:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d68:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d6c:	e501                	bnez	a0,1d74 <sleep+0x1a>
    return 0;
    1d6e:	4501                	li	a0,0
}
    1d70:	0141                	add	sp,sp,16
    1d72:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d74:	4502                	lw	a0,0(sp)
}
    1d76:	0141                	add	sp,sp,16
    1d78:	8082                	ret

0000000000001d7a <set_priority>:
    register long a7 __asm__("a7") = n;
    1d7a:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d7e:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d82:	2501                	sext.w	a0,a0
    1d84:	8082                	ret

0000000000001d86 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d86:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d8a:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d8e:	8082                	ret

0000000000001d90 <munmap>:
    register long a7 __asm__("a7") = n;
    1d90:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d94:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d98:	2501                	sext.w	a0,a0
    1d9a:	8082                	ret

0000000000001d9c <wait>:

int wait(int *code)
{
    1d9c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d9e:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1da2:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1da4:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1da6:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1da8:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1dac:	2501                	sext.w	a0,a0
    1dae:	8082                	ret

0000000000001db0 <spawn>:
    register long a7 __asm__("a7") = n;
    1db0:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1db4:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1db8:	2501                	sext.w	a0,a0
    1dba:	8082                	ret

0000000000001dbc <mailread>:
    register long a7 __asm__("a7") = n;
    1dbc:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc0:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dc4:	2501                	sext.w	a0,a0
    1dc6:	8082                	ret

0000000000001dc8 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dc8:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dcc:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dd0:	2501                	sext.w	a0,a0
    1dd2:	8082                	ret

0000000000001dd4 <fstat>:
    register long a7 __asm__("a7") = n;
    1dd4:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dd8:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1ddc:	2501                	sext.w	a0,a0
    1dde:	8082                	ret

0000000000001de0 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1de0:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1de2:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1de6:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1de8:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1dec:	2501                	sext.w	a0,a0
    1dee:	8082                	ret

0000000000001df0 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1df0:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1df2:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1df6:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df8:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1dfc:	2501                	sext.w	a0,a0
    1dfe:	8082                	ret

0000000000001e00 <link>:

int link(char *old_path, char *new_path)
{
    1e00:	87aa                	mv	a5,a0
    1e02:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e04:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e08:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e0c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e0e:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e12:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e14:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e18:	2501                	sext.w	a0,a0
    1e1a:	8082                	ret

0000000000001e1c <unlink>:

int unlink(char *path)
{
    1e1c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e1e:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e22:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e26:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e28:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e2c:	2501                	sext.w	a0,a0
    1e2e:	8082                	ret

0000000000001e30 <uname>:
    register long a7 __asm__("a7") = n;
    1e30:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e34:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e38:	2501                	sext.w	a0,a0
    1e3a:	8082                	ret

0000000000001e3c <brk>:
    register long a7 __asm__("a7") = n;
    1e3c:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e40:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e44:	2501                	sext.w	a0,a0
    1e46:	8082                	ret

0000000000001e48 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e48:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e4a:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e4e:	8082                	ret

0000000000001e50 <chdir>:
    register long a7 __asm__("a7") = n;
    1e50:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e54:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e58:	2501                	sext.w	a0,a0
    1e5a:	8082                	ret

0000000000001e5c <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e5c:	862e                	mv	a2,a1
    1e5e:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e60:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e62:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e66:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e6a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e6c:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e6e:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e72:	2501                	sext.w	a0,a0
    1e74:	8082                	ret

0000000000001e76 <getdents>:
    register long a7 __asm__("a7") = n;
    1e76:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e7a:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e7e:	2501                	sext.w	a0,a0
    1e80:	8082                	ret

0000000000001e82 <pipe>:
    register long a7 __asm__("a7") = n;
    1e82:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e86:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e88:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e8c:	2501                	sext.w	a0,a0
    1e8e:	8082                	ret

0000000000001e90 <dup>:
    register long a7 __asm__("a7") = n;
    1e90:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e92:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e96:	2501                	sext.w	a0,a0
    1e98:	8082                	ret

0000000000001e9a <dup2>:
    register long a7 __asm__("a7") = n;
    1e9a:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e9c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e9e:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ea2:	2501                	sext.w	a0,a0
    1ea4:	8082                	ret

0000000000001ea6 <mount>:
    register long a7 __asm__("a7") = n;
    1ea6:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1eaa:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1eae:	2501                	sext.w	a0,a0
    1eb0:	8082                	ret

0000000000001eb2 <umount>:
    register long a7 __asm__("a7") = n;
    1eb2:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1eb6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb8:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ebc:	2501                	sext.w	a0,a0
    1ebe:	8082                	ret

0000000000001ec0 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ec0:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1ec2:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ec4:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ec6:	8532                	mv	a0,a2
	mv a2, a4
    1ec8:	863a                	mv	a2,a4
	mv a3, a5
    1eca:	86be                	mv	a3,a5
	mv a4, a6
    1ecc:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ece:	0dc00893          	li	a7,220
	ecall
    1ed2:	00000073          	ecall

	beqz a0, 1f
    1ed6:	c111                	beqz	a0,1eda <__clone+0x1a>
	# Parent
	ret
    1ed8:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1eda:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1edc:	6522                	ld	a0,8(sp)
	jalr a1
    1ede:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ee0:	05d00893          	li	a7,93
	ecall
    1ee4:	00000073          	ecall
