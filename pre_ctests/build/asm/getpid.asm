
/root/oskernel2024-trustos/pre_ctests/build/riscv64/getpid:     file format elf64-littleriscv


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
    1004:	1101                	add	sp,sp,-32
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	ed250513          	add	a0,a0,-302 # 1ed8 <__clone+0x2c>
{
    100e:	ec06                	sd	ra,24(sp)
    TEST_START(__func__);
    1010:	2b2000ef          	jal	12c2 <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	f4450513          	add	a0,a0,-188 # 1f58 <__func__.0>
    101c:	2a6000ef          	jal	12c2 <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	ed050513          	add	a0,a0,-304 # 1ef0 <__clone+0x44>
    1028:	29a000ef          	jal	12c2 <puts>
    int pid = getpid();
    102c:	453000ef          	jal	1c7e <getpid>
    1030:	85aa                	mv	a1,a0
    assert(pid >= 0);
    1032:	02054b63          	bltz	a0,1068 <test_getpid+0x64>
    printf("getpid success.\npid = %d\n", pid);
    1036:	00001517          	auipc	a0,0x1
    103a:	eea50513          	add	a0,a0,-278 # 1f20 <__clone+0x74>
    103e:	2a6000ef          	jal	12e4 <printf>
    TEST_END(__func__);
    1042:	00001517          	auipc	a0,0x1
    1046:	efe50513          	add	a0,a0,-258 # 1f40 <__clone+0x94>
    104a:	278000ef          	jal	12c2 <puts>
    104e:	00001517          	auipc	a0,0x1
    1052:	f0a50513          	add	a0,a0,-246 # 1f58 <__func__.0>
    1056:	26c000ef          	jal	12c2 <puts>
}
    105a:	60e2                	ld	ra,24(sp)
    TEST_END(__func__);
    105c:	00001517          	auipc	a0,0x1
    1060:	e9450513          	add	a0,a0,-364 # 1ef0 <__clone+0x44>
}
    1064:	6105                	add	sp,sp,32
    TEST_END(__func__);
    1066:	acb1                	j	12c2 <puts>
    1068:	e42a                	sd	a0,8(sp)
    assert(pid >= 0);
    106a:	00001517          	auipc	a0,0x1
    106e:	e9650513          	add	a0,a0,-362 # 1f00 <__clone+0x54>
    1072:	4f0000ef          	jal	1562 <panic>
    1076:	65a2                	ld	a1,8(sp)
    1078:	bf7d                	j	1036 <test_getpid+0x32>

000000000000107a <main>:

int main(void) {
    107a:	1141                	add	sp,sp,-16
    107c:	e406                	sd	ra,8(sp)
	test_getpid();
    107e:	f87ff0ef          	jal	1004 <test_getpid>
	return 0;
}
    1082:	60a2                	ld	ra,8(sp)
    1084:	4501                	li	a0,0
    1086:	0141                	add	sp,sp,16
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
    108e:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    1090:	05a1                	add	a1,a1,8
{
    1092:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1094:	fe7ff0ef          	jal	107a <main>
    1098:	42d000ef          	jal	1cc4 <exit>
	return 0;
}
    109c:	60a2                	ld	ra,8(sp)
    109e:	4501                	li	a0,0
    10a0:	0141                	add	sp,sp,16
    10a2:	8082                	ret

00000000000010a4 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10a4:	7179                	add	sp,sp,-48
    10a6:	f406                	sd	ra,40(sp)
    10a8:	0005081b          	sext.w	a6,a0
    10ac:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10ae:	00055563          	bgez	a0,10b8 <printint.constprop.0+0x14>
        x = -xx;
    10b2:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    10b6:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10b8:	02b8763b          	remuw	a2,a6,a1
    10bc:	00001697          	auipc	a3,0x1
    10c0:	eac68693          	add	a3,a3,-340 # 1f68 <digits>
    buf[16] = 0;
    10c4:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10c8:	0005871b          	sext.w	a4,a1
    10cc:	1602                	sll	a2,a2,0x20
    10ce:	9201                	srl	a2,a2,0x20
    10d0:	9636                	add	a2,a2,a3
    10d2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10d6:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    10da:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    10de:	10b86c63          	bltu	a6,a1,11f6 <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    10e2:	02e5763b          	remuw	a2,a0,a4
    10e6:	1602                	sll	a2,a2,0x20
    10e8:	9201                	srl	a2,a2,0x20
    10ea:	9636                	add	a2,a2,a3
    10ec:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10f0:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    10f4:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    10f8:	10e56863          	bltu	a0,a4,1208 <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    10fc:	02e5f63b          	remuw	a2,a1,a4
    1100:	1602                	sll	a2,a2,0x20
    1102:	9201                	srl	a2,a2,0x20
    1104:	9636                	add	a2,a2,a3
    1106:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    110a:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    110e:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1112:	10e5e463          	bltu	a1,a4,121a <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    1116:	02e5763b          	remuw	a2,a0,a4
    111a:	1602                	sll	a2,a2,0x20
    111c:	9201                	srl	a2,a2,0x20
    111e:	9636                	add	a2,a2,a3
    1120:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1124:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1128:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    112c:	10e56063          	bltu	a0,a4,122c <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    1130:	02e5f63b          	remuw	a2,a1,a4
    1134:	1602                	sll	a2,a2,0x20
    1136:	9201                	srl	a2,a2,0x20
    1138:	9636                	add	a2,a2,a3
    113a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    113e:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1142:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1146:	0ee5ec63          	bltu	a1,a4,123e <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    114a:	02e5763b          	remuw	a2,a0,a4
    114e:	1602                	sll	a2,a2,0x20
    1150:	9201                	srl	a2,a2,0x20
    1152:	9636                	add	a2,a2,a3
    1154:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1158:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    115c:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1160:	08e56263          	bltu	a0,a4,11e4 <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    1164:	02e5f63b          	remuw	a2,a1,a4
    1168:	1602                	sll	a2,a2,0x20
    116a:	9201                	srl	a2,a2,0x20
    116c:	9636                	add	a2,a2,a3
    116e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1172:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1176:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    117a:	0ce5eb63          	bltu	a1,a4,1250 <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    117e:	02e5763b          	remuw	a2,a0,a4
    1182:	1602                	sll	a2,a2,0x20
    1184:	9201                	srl	a2,a2,0x20
    1186:	9636                	add	a2,a2,a3
    1188:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    118c:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1190:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1194:	0ce56763          	bltu	a0,a4,1262 <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    1198:	02e5f63b          	remuw	a2,a1,a4
    119c:	1602                	sll	a2,a2,0x20
    119e:	9201                	srl	a2,a2,0x20
    11a0:	9636                	add	a2,a2,a3
    11a2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a6:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11aa:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11ae:	0ce5e363          	bltu	a1,a4,1274 <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    11b2:	1782                	sll	a5,a5,0x20
    11b4:	9381                	srl	a5,a5,0x20
    11b6:	96be                	add	a3,a3,a5
    11b8:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    11bc:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    11be:	00f10723          	sb	a5,14(sp)
    if (sign)
    11c2:	00088763          	beqz	a7,11d0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11c6:	02d00793          	li	a5,45
    11ca:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11ce:	4595                	li	a1,5
    write(f, s, l);
    11d0:	003c                	add	a5,sp,8
    11d2:	4641                	li	a2,16
    11d4:	9e0d                	subw	a2,a2,a1
    11d6:	4505                	li	a0,1
    11d8:	95be                	add	a1,a1,a5
    11da:	29b000ef          	jal	1c74 <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11de:	70a2                	ld	ra,40(sp)
    11e0:	6145                	add	sp,sp,48
    11e2:	8082                	ret
    i++;
    11e4:	45a9                	li	a1,10
    if (sign)
    11e6:	fe0885e3          	beqz	a7,11d0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11ea:	02d00793          	li	a5,45
    11ee:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    11f2:	45a5                	li	a1,9
    11f4:	bff1                	j	11d0 <printint.constprop.0+0x12c>
    i++;
    11f6:	45bd                	li	a1,15
    if (sign)
    11f8:	fc088ce3          	beqz	a7,11d0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11fc:	02d00793          	li	a5,45
    1200:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1204:	45b9                	li	a1,14
    1206:	b7e9                	j	11d0 <printint.constprop.0+0x12c>
    i++;
    1208:	45b9                	li	a1,14
    if (sign)
    120a:	fc0883e3          	beqz	a7,11d0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    120e:	02d00793          	li	a5,45
    1212:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1216:	45b5                	li	a1,13
    1218:	bf65                	j	11d0 <printint.constprop.0+0x12c>
    i++;
    121a:	45b5                	li	a1,13
    if (sign)
    121c:	fa088ae3          	beqz	a7,11d0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1220:	02d00793          	li	a5,45
    1224:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1228:	45b1                	li	a1,12
    122a:	b75d                	j	11d0 <printint.constprop.0+0x12c>
    i++;
    122c:	45b1                	li	a1,12
    if (sign)
    122e:	fa0881e3          	beqz	a7,11d0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1232:	02d00793          	li	a5,45
    1236:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    123a:	45ad                	li	a1,11
    123c:	bf51                	j	11d0 <printint.constprop.0+0x12c>
    i++;
    123e:	45ad                	li	a1,11
    if (sign)
    1240:	f80888e3          	beqz	a7,11d0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1244:	02d00793          	li	a5,45
    1248:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    124c:	45a9                	li	a1,10
    124e:	b749                	j	11d0 <printint.constprop.0+0x12c>
    i++;
    1250:	45a5                	li	a1,9
    if (sign)
    1252:	f6088fe3          	beqz	a7,11d0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1256:	02d00793          	li	a5,45
    125a:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    125e:	45a1                	li	a1,8
    1260:	bf85                	j	11d0 <printint.constprop.0+0x12c>
    i++;
    1262:	45a1                	li	a1,8
    if (sign)
    1264:	f60886e3          	beqz	a7,11d0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1268:	02d00793          	li	a5,45
    126c:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1270:	459d                	li	a1,7
    1272:	bfb9                	j	11d0 <printint.constprop.0+0x12c>
    i++;
    1274:	459d                	li	a1,7
    if (sign)
    1276:	f4088de3          	beqz	a7,11d0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    127a:	02d00793          	li	a5,45
    127e:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1282:	4599                	li	a1,6
    1284:	b7b1                	j	11d0 <printint.constprop.0+0x12c>

0000000000001286 <getchar>:
{
    1286:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    1288:	00f10593          	add	a1,sp,15
    128c:	4605                	li	a2,1
    128e:	4501                	li	a0,0
{
    1290:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1292:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1296:	1d5000ef          	jal	1c6a <read>
}
    129a:	60e2                	ld	ra,24(sp)
    129c:	00f14503          	lbu	a0,15(sp)
    12a0:	6105                	add	sp,sp,32
    12a2:	8082                	ret

00000000000012a4 <putchar>:
{
    12a4:	1101                	add	sp,sp,-32
    12a6:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12a8:	00f10593          	add	a1,sp,15
    12ac:	4605                	li	a2,1
    12ae:	4505                	li	a0,1
{
    12b0:	ec06                	sd	ra,24(sp)
    char byte = c;
    12b2:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12b6:	1bf000ef          	jal	1c74 <write>
}
    12ba:	60e2                	ld	ra,24(sp)
    12bc:	2501                	sext.w	a0,a0
    12be:	6105                	add	sp,sp,32
    12c0:	8082                	ret

00000000000012c2 <puts>:
{
    12c2:	1141                	add	sp,sp,-16
    12c4:	e406                	sd	ra,8(sp)
    12c6:	e022                	sd	s0,0(sp)
    12c8:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12ca:	56c000ef          	jal	1836 <strlen>
    12ce:	862a                	mv	a2,a0
    12d0:	85a2                	mv	a1,s0
    12d2:	4505                	li	a0,1
    12d4:	1a1000ef          	jal	1c74 <write>
}
    12d8:	60a2                	ld	ra,8(sp)
    12da:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12dc:	957d                	sra	a0,a0,0x3f
    return r;
    12de:	2501                	sext.w	a0,a0
}
    12e0:	0141                	add	sp,sp,16
    12e2:	8082                	ret

00000000000012e4 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12e4:	7131                	add	sp,sp,-192
    12e6:	e4d6                	sd	s5,72(sp)
    12e8:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12ea:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12ec:	013c                	add	a5,sp,136
{
    12ee:	f0ca                	sd	s2,96(sp)
    12f0:	ecce                	sd	s3,88(sp)
    12f2:	e8d2                	sd	s4,80(sp)
    12f4:	e0da                	sd	s6,64(sp)
    12f6:	fc5e                	sd	s7,56(sp)
    12f8:	fc86                	sd	ra,120(sp)
    12fa:	f8a2                	sd	s0,112(sp)
    12fc:	f4a6                	sd	s1,104(sp)
    12fe:	e52e                	sd	a1,136(sp)
    1300:	e932                	sd	a2,144(sp)
    1302:	ed36                	sd	a3,152(sp)
    1304:	f13a                	sd	a4,160(sp)
    1306:	f942                	sd	a6,176(sp)
    1308:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    130a:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    130c:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1310:	07300a13          	li	s4,115
    1314:	07800b93          	li	s7,120
    1318:	06400b13          	li	s6,100
    buf[i++] = '0';
    131c:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x58c8>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1320:	00001997          	auipc	s3,0x1
    1324:	c4898993          	add	s3,s3,-952 # 1f68 <digits>
        if (!*s)
    1328:	00054783          	lbu	a5,0(a0)
    132c:	16078863          	beqz	a5,149c <printf+0x1b8>
    1330:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1332:	19278063          	beq	a5,s2,14b2 <printf+0x1ce>
    1336:	00164783          	lbu	a5,1(a2)
    133a:	0605                	add	a2,a2,1
    133c:	fbfd                	bnez	a5,1332 <printf+0x4e>
    133e:	84b2                	mv	s1,a2
        l = z - a;
    1340:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1344:	85aa                	mv	a1,a0
    1346:	8622                	mv	a2,s0
    1348:	4505                	li	a0,1
    134a:	12b000ef          	jal	1c74 <write>
        if (l)
    134e:	18041763          	bnez	s0,14dc <printf+0x1f8>
        if (s[1] == 0)
    1352:	0014c783          	lbu	a5,1(s1)
    1356:	14078363          	beqz	a5,149c <printf+0x1b8>
        switch (s[1])
    135a:	19478f63          	beq	a5,s4,14f8 <printf+0x214>
    135e:	18fa6163          	bltu	s4,a5,14e0 <printf+0x1fc>
    1362:	1b678e63          	beq	a5,s6,151e <printf+0x23a>
    1366:	07000713          	li	a4,112
    136a:	1ce79463          	bne	a5,a4,1532 <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    136e:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1370:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1374:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1376:	631c                	ld	a5,0(a4)
    1378:	0721                	add	a4,a4,8
    137a:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    137c:	00479293          	sll	t0,a5,0x4
    1380:	00879f93          	sll	t6,a5,0x8
    1384:	00c79f13          	sll	t5,a5,0xc
    1388:	01079e93          	sll	t4,a5,0x10
    138c:	01479e13          	sll	t3,a5,0x14
    1390:	01879313          	sll	t1,a5,0x18
    1394:	01c79893          	sll	a7,a5,0x1c
    1398:	02479813          	sll	a6,a5,0x24
    139c:	02879513          	sll	a0,a5,0x28
    13a0:	02c79593          	sll	a1,a5,0x2c
    13a4:	03079693          	sll	a3,a5,0x30
    13a8:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13ac:	03c7d413          	srl	s0,a5,0x3c
    13b0:	01c7d39b          	srlw	t2,a5,0x1c
    13b4:	03c2d293          	srl	t0,t0,0x3c
    13b8:	03cfdf93          	srl	t6,t6,0x3c
    13bc:	03cf5f13          	srl	t5,t5,0x3c
    13c0:	03cede93          	srl	t4,t4,0x3c
    13c4:	03ce5e13          	srl	t3,t3,0x3c
    13c8:	03c35313          	srl	t1,t1,0x3c
    13cc:	03c8d893          	srl	a7,a7,0x3c
    13d0:	03c85813          	srl	a6,a6,0x3c
    13d4:	9171                	srl	a0,a0,0x3c
    13d6:	91f1                	srl	a1,a1,0x3c
    13d8:	92f1                	srl	a3,a3,0x3c
    13da:	9371                	srl	a4,a4,0x3c
    13dc:	974e                	add	a4,a4,s3
    13de:	944e                	add	s0,s0,s3
    13e0:	92ce                	add	t0,t0,s3
    13e2:	9fce                	add	t6,t6,s3
    13e4:	9f4e                	add	t5,t5,s3
    13e6:	9ece                	add	t4,t4,s3
    13e8:	9e4e                	add	t3,t3,s3
    13ea:	934e                	add	t1,t1,s3
    13ec:	98ce                	add	a7,a7,s3
    13ee:	93ce                	add	t2,t2,s3
    13f0:	984e                	add	a6,a6,s3
    13f2:	954e                	add	a0,a0,s3
    13f4:	95ce                	add	a1,a1,s3
    13f6:	96ce                	add	a3,a3,s3
    13f8:	00074083          	lbu	ra,0(a4)
    13fc:	0002c283          	lbu	t0,0(t0)
    1400:	000fcf83          	lbu	t6,0(t6)
    1404:	000f4f03          	lbu	t5,0(t5)
    1408:	000ece83          	lbu	t4,0(t4)
    140c:	000e4e03          	lbu	t3,0(t3)
    1410:	00034303          	lbu	t1,0(t1)
    1414:	0008c883          	lbu	a7,0(a7)
    1418:	0003c383          	lbu	t2,0(t2)
    141c:	00084803          	lbu	a6,0(a6)
    1420:	00054503          	lbu	a0,0(a0)
    1424:	0005c583          	lbu	a1,0(a1)
    1428:	0006c683          	lbu	a3,0(a3)
    142c:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1430:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1434:	9371                	srl	a4,a4,0x3c
    1436:	8bbd                	and	a5,a5,15
    1438:	974e                	add	a4,a4,s3
    143a:	97ce                	add	a5,a5,s3
    143c:	005105a3          	sb	t0,11(sp)
    1440:	01f10623          	sb	t6,12(sp)
    1444:	01e106a3          	sb	t5,13(sp)
    1448:	01d10723          	sb	t4,14(sp)
    144c:	01c107a3          	sb	t3,15(sp)
    1450:	00610823          	sb	t1,16(sp)
    1454:	011108a3          	sb	a7,17(sp)
    1458:	00710923          	sb	t2,18(sp)
    145c:	010109a3          	sb	a6,19(sp)
    1460:	00a10a23          	sb	a0,20(sp)
    1464:	00b10aa3          	sb	a1,21(sp)
    1468:	00d10b23          	sb	a3,22(sp)
    146c:	00110ba3          	sb	ra,23(sp)
    1470:	00810523          	sb	s0,10(sp)
    1474:	00074703          	lbu	a4,0(a4)
    1478:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    147c:	002c                	add	a1,sp,8
    147e:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1480:	00e10c23          	sb	a4,24(sp)
    1484:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1488:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    148c:	7e8000ef          	jal	1c74 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1490:	00248513          	add	a0,s1,2
        if (!*s)
    1494:	00054783          	lbu	a5,0(a0)
    1498:	e8079ce3          	bnez	a5,1330 <printf+0x4c>
    }
    va_end(ap);
}
    149c:	70e6                	ld	ra,120(sp)
    149e:	7446                	ld	s0,112(sp)
    14a0:	74a6                	ld	s1,104(sp)
    14a2:	7906                	ld	s2,96(sp)
    14a4:	69e6                	ld	s3,88(sp)
    14a6:	6a46                	ld	s4,80(sp)
    14a8:	6aa6                	ld	s5,72(sp)
    14aa:	6b06                	ld	s6,64(sp)
    14ac:	7be2                	ld	s7,56(sp)
    14ae:	6129                	add	sp,sp,192
    14b0:	8082                	ret
    14b2:	84b2                	mv	s1,a2
    14b4:	a039                	j	14c2 <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14b6:	0024c783          	lbu	a5,2(s1)
    14ba:	0605                	add	a2,a2,1
    14bc:	0489                	add	s1,s1,2
    14be:	e92791e3          	bne	a5,s2,1340 <printf+0x5c>
    14c2:	0014c783          	lbu	a5,1(s1)
    14c6:	ff2788e3          	beq	a5,s2,14b6 <printf+0x1d2>
        l = z - a;
    14ca:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14ce:	85aa                	mv	a1,a0
    14d0:	8622                	mv	a2,s0
    14d2:	4505                	li	a0,1
    14d4:	7a0000ef          	jal	1c74 <write>
        if (l)
    14d8:	e6040de3          	beqz	s0,1352 <printf+0x6e>
    14dc:	8526                	mv	a0,s1
    14de:	b5a9                	j	1328 <printf+0x44>
        switch (s[1])
    14e0:	05779963          	bne	a5,s7,1532 <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    14e4:	6782                	ld	a5,0(sp)
    14e6:	45c1                	li	a1,16
    14e8:	4388                	lw	a0,0(a5)
    14ea:	07a1                	add	a5,a5,8
    14ec:	e03e                	sd	a5,0(sp)
    14ee:	bb7ff0ef          	jal	10a4 <printint.constprop.0>
        s += 2;
    14f2:	00248513          	add	a0,s1,2
    14f6:	bf79                	j	1494 <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    14f8:	6782                	ld	a5,0(sp)
    14fa:	6380                	ld	s0,0(a5)
    14fc:	07a1                	add	a5,a5,8
    14fe:	e03e                	sd	a5,0(sp)
    1500:	cc21                	beqz	s0,1558 <printf+0x274>
            l = strnlen(a, 200);
    1502:	0c800593          	li	a1,200
    1506:	8522                	mv	a0,s0
    1508:	460000ef          	jal	1968 <strnlen>
    write(f, s, l);
    150c:	0005061b          	sext.w	a2,a0
    1510:	85a2                	mv	a1,s0
    1512:	4505                	li	a0,1
    1514:	760000ef          	jal	1c74 <write>
        s += 2;
    1518:	00248513          	add	a0,s1,2
    151c:	bfa5                	j	1494 <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    151e:	6782                	ld	a5,0(sp)
    1520:	45a9                	li	a1,10
    1522:	4388                	lw	a0,0(a5)
    1524:	07a1                	add	a5,a5,8
    1526:	e03e                	sd	a5,0(sp)
    1528:	b7dff0ef          	jal	10a4 <printint.constprop.0>
        s += 2;
    152c:	00248513          	add	a0,s1,2
    1530:	b795                	j	1494 <printf+0x1b0>
    return write(stdout, &byte, 1);
    1532:	4605                	li	a2,1
    1534:	002c                	add	a1,sp,8
    1536:	4505                	li	a0,1
    char byte = c;
    1538:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    153c:	738000ef          	jal	1c74 <write>
    char byte = c;
    1540:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1544:	4605                	li	a2,1
    1546:	002c                	add	a1,sp,8
    1548:	4505                	li	a0,1
    char byte = c;
    154a:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    154e:	726000ef          	jal	1c74 <write>
        s += 2;
    1552:	00248513          	add	a0,s1,2
    1556:	bf3d                	j	1494 <printf+0x1b0>
                a = "(null)";
    1558:	00001417          	auipc	s0,0x1
    155c:	9f840413          	add	s0,s0,-1544 # 1f50 <__clone+0xa4>
    1560:	b74d                	j	1502 <printf+0x21e>

0000000000001562 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1562:	1141                	add	sp,sp,-16
    1564:	e406                	sd	ra,8(sp)
    puts(m);
    1566:	d5dff0ef          	jal	12c2 <puts>
    exit(-100);
}
    156a:	60a2                	ld	ra,8(sp)
    exit(-100);
    156c:	f9c00513          	li	a0,-100
}
    1570:	0141                	add	sp,sp,16
    exit(-100);
    1572:	af89                	j	1cc4 <exit>

0000000000001574 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1574:	02000793          	li	a5,32
    1578:	00f50663          	beq	a0,a5,1584 <isspace+0x10>
    157c:	355d                	addw	a0,a0,-9
    157e:	00553513          	sltiu	a0,a0,5
    1582:	8082                	ret
    1584:	4505                	li	a0,1
}
    1586:	8082                	ret

0000000000001588 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1588:	fd05051b          	addw	a0,a0,-48
}
    158c:	00a53513          	sltiu	a0,a0,10
    1590:	8082                	ret

0000000000001592 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1592:	02000713          	li	a4,32
    1596:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1598:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    159c:	ff76879b          	addw	a5,a3,-9
    15a0:	06e68063          	beq	a3,a4,1600 <atoi+0x6e>
    15a4:	0006859b          	sext.w	a1,a3
    15a8:	04f67c63          	bgeu	a2,a5,1600 <atoi+0x6e>
        s++;
    switch (*s)
    15ac:	02b00793          	li	a5,43
    15b0:	06f68563          	beq	a3,a5,161a <atoi+0x88>
    15b4:	02d00793          	li	a5,45
    15b8:	04f69663          	bne	a3,a5,1604 <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15bc:	00154683          	lbu	a3,1(a0)
    15c0:	47a5                	li	a5,9
        s++;
    15c2:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    15c6:	fd06869b          	addw	a3,a3,-48
    15ca:	8636                	mv	a2,a3
    while (isdigit(*s))
    15cc:	04d7e563          	bltu	a5,a3,1616 <atoi+0x84>
        neg = 1;
    15d0:	4885                	li	a7,1
    int n = 0, neg = 0;
    15d2:	4501                	li	a0,0
    while (isdigit(*s))
    15d4:	4825                	li	a6,9
    15d6:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    15da:	0025179b          	sllw	a5,a0,0x2
    15de:	9fa9                	addw	a5,a5,a0
    15e0:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    15e4:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    15e8:	85b2                	mv	a1,a2
    15ea:	40c7853b          	subw	a0,a5,a2
    15ee:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    15f0:	8636                	mv	a2,a3
    while (isdigit(*s))
    15f2:	fed872e3          	bgeu	a6,a3,15d6 <atoi+0x44>
    return neg ? n : -n;
    15f6:	02089163          	bnez	a7,1618 <atoi+0x86>
    15fa:	40f5853b          	subw	a0,a1,a5
    15fe:	8082                	ret
        s++;
    1600:	0505                	add	a0,a0,1
    1602:	bf59                	j	1598 <atoi+0x6>
    while (isdigit(*s))
    1604:	fd05859b          	addw	a1,a1,-48
    1608:	47a5                	li	a5,9
    160a:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    160c:	4881                	li	a7,0
    160e:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    1612:	fcb7f0e3          	bgeu	a5,a1,15d2 <atoi+0x40>
    return neg ? n : -n;
    1616:	4501                	li	a0,0
}
    1618:	8082                	ret
    while (isdigit(*s))
    161a:	00154683          	lbu	a3,1(a0)
    161e:	47a5                	li	a5,9
        s++;
    1620:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1624:	fd06869b          	addw	a3,a3,-48
    1628:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    162a:	4881                	li	a7,0
    while (isdigit(*s))
    162c:	fad7f3e3          	bgeu	a5,a3,15d2 <atoi+0x40>
    return neg ? n : -n;
    1630:	4501                	li	a0,0
    1632:	8082                	ret

0000000000001634 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1634:	16060f63          	beqz	a2,17b2 <memset+0x17e>
    1638:	40a006b3          	neg	a3,a0
    163c:	0076f793          	and	a5,a3,7
    1640:	00778813          	add	a6,a5,7
    1644:	48ad                	li	a7,11
    1646:	0ff5f713          	zext.b	a4,a1
    164a:	fff60593          	add	a1,a2,-1
    164e:	17186363          	bltu	a6,a7,17b4 <memset+0x180>
    1652:	1705eb63          	bltu	a1,a6,17c8 <memset+0x194>
    1656:	16078163          	beqz	a5,17b8 <memset+0x184>
    165a:	00e50023          	sb	a4,0(a0)
    165e:	0066f593          	and	a1,a3,6
    1662:	14058e63          	beqz	a1,17be <memset+0x18a>
    1666:	00e500a3          	sb	a4,1(a0)
    166a:	4589                	li	a1,2
    166c:	00250813          	add	a6,a0,2
    1670:	04f5f663          	bgeu	a1,a5,16bc <memset+0x88>
    1674:	00e50123          	sb	a4,2(a0)
    1678:	8a91                	and	a3,a3,4
    167a:	00350813          	add	a6,a0,3
    167e:	458d                	li	a1,3
    1680:	ce95                	beqz	a3,16bc <memset+0x88>
    1682:	00e501a3          	sb	a4,3(a0)
    1686:	4691                	li	a3,4
    1688:	00450813          	add	a6,a0,4
    168c:	4591                	li	a1,4
    168e:	02f6f763          	bgeu	a3,a5,16bc <memset+0x88>
    1692:	00e50223          	sb	a4,4(a0)
    1696:	4695                	li	a3,5
    1698:	00550813          	add	a6,a0,5
    169c:	4595                	li	a1,5
    169e:	00d78f63          	beq	a5,a3,16bc <memset+0x88>
    16a2:	00e502a3          	sb	a4,5(a0)
    16a6:	469d                	li	a3,7
    16a8:	00650813          	add	a6,a0,6
    16ac:	4599                	li	a1,6
    16ae:	00d79763          	bne	a5,a3,16bc <memset+0x88>
    16b2:	00750813          	add	a6,a0,7
    16b6:	00e50323          	sb	a4,6(a0)
    16ba:	459d                	li	a1,7
    16bc:	00871693          	sll	a3,a4,0x8
    16c0:	01071313          	sll	t1,a4,0x10
    16c4:	8ed9                	or	a3,a3,a4
    16c6:	01871893          	sll	a7,a4,0x18
    16ca:	0066e6b3          	or	a3,a3,t1
    16ce:	0116e6b3          	or	a3,a3,a7
    16d2:	02071313          	sll	t1,a4,0x20
    16d6:	02871893          	sll	a7,a4,0x28
    16da:	0066e6b3          	or	a3,a3,t1
    16de:	40f60e33          	sub	t3,a2,a5
    16e2:	03071313          	sll	t1,a4,0x30
    16e6:	0116e6b3          	or	a3,a3,a7
    16ea:	0066e6b3          	or	a3,a3,t1
    16ee:	03871893          	sll	a7,a4,0x38
    16f2:	97aa                	add	a5,a5,a0
    16f4:	ff8e7313          	and	t1,t3,-8
    16f8:	0116e6b3          	or	a3,a3,a7
    16fc:	00f308b3          	add	a7,t1,a5
    1700:	e394                	sd	a3,0(a5)
    1702:	07a1                	add	a5,a5,8
    1704:	ff179ee3          	bne	a5,a7,1700 <memset+0xcc>
    1708:	006806b3          	add	a3,a6,t1
    170c:	00b307bb          	addw	a5,t1,a1
    1710:	0bc30b63          	beq	t1,t3,17c6 <memset+0x192>
    1714:	00e68023          	sb	a4,0(a3)
    1718:	0017859b          	addw	a1,a5,1
    171c:	08c5fb63          	bgeu	a1,a2,17b2 <memset+0x17e>
    1720:	00e680a3          	sb	a4,1(a3)
    1724:	0027859b          	addw	a1,a5,2
    1728:	08c5f563          	bgeu	a1,a2,17b2 <memset+0x17e>
    172c:	00e68123          	sb	a4,2(a3)
    1730:	0037859b          	addw	a1,a5,3
    1734:	06c5ff63          	bgeu	a1,a2,17b2 <memset+0x17e>
    1738:	00e681a3          	sb	a4,3(a3)
    173c:	0047859b          	addw	a1,a5,4
    1740:	06c5f963          	bgeu	a1,a2,17b2 <memset+0x17e>
    1744:	00e68223          	sb	a4,4(a3)
    1748:	0057859b          	addw	a1,a5,5
    174c:	06c5f363          	bgeu	a1,a2,17b2 <memset+0x17e>
    1750:	00e682a3          	sb	a4,5(a3)
    1754:	0067859b          	addw	a1,a5,6
    1758:	04c5fd63          	bgeu	a1,a2,17b2 <memset+0x17e>
    175c:	00e68323          	sb	a4,6(a3)
    1760:	0077859b          	addw	a1,a5,7
    1764:	04c5f763          	bgeu	a1,a2,17b2 <memset+0x17e>
    1768:	00e683a3          	sb	a4,7(a3)
    176c:	0087859b          	addw	a1,a5,8
    1770:	04c5f163          	bgeu	a1,a2,17b2 <memset+0x17e>
    1774:	00e68423          	sb	a4,8(a3)
    1778:	0097859b          	addw	a1,a5,9
    177c:	02c5fb63          	bgeu	a1,a2,17b2 <memset+0x17e>
    1780:	00e684a3          	sb	a4,9(a3)
    1784:	00a7859b          	addw	a1,a5,10
    1788:	02c5f563          	bgeu	a1,a2,17b2 <memset+0x17e>
    178c:	00e68523          	sb	a4,10(a3)
    1790:	00b7859b          	addw	a1,a5,11
    1794:	00c5ff63          	bgeu	a1,a2,17b2 <memset+0x17e>
    1798:	00e685a3          	sb	a4,11(a3)
    179c:	00c7859b          	addw	a1,a5,12
    17a0:	00c5f963          	bgeu	a1,a2,17b2 <memset+0x17e>
    17a4:	00e68623          	sb	a4,12(a3)
    17a8:	27b5                	addw	a5,a5,13
    17aa:	00c7f463          	bgeu	a5,a2,17b2 <memset+0x17e>
    17ae:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17b2:	8082                	ret
    17b4:	482d                	li	a6,11
    17b6:	bd71                	j	1652 <memset+0x1e>
    char *p = dest;
    17b8:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17ba:	4581                	li	a1,0
    17bc:	b701                	j	16bc <memset+0x88>
    17be:	00150813          	add	a6,a0,1
    17c2:	4585                	li	a1,1
    17c4:	bde5                	j	16bc <memset+0x88>
    17c6:	8082                	ret
    char *p = dest;
    17c8:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17ca:	4781                	li	a5,0
    17cc:	b7a1                	j	1714 <memset+0xe0>

00000000000017ce <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17ce:	00054783          	lbu	a5,0(a0)
    17d2:	0005c703          	lbu	a4,0(a1)
    17d6:	00e79863          	bne	a5,a4,17e6 <strcmp+0x18>
    17da:	0505                	add	a0,a0,1
    17dc:	0585                	add	a1,a1,1
    17de:	fbe5                	bnez	a5,17ce <strcmp>
    17e0:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    17e2:	9d19                	subw	a0,a0,a4
    17e4:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    17e6:	0007851b          	sext.w	a0,a5
    17ea:	bfe5                	j	17e2 <strcmp+0x14>

00000000000017ec <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    17ec:	ca15                	beqz	a2,1820 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17ee:	00054783          	lbu	a5,0(a0)
    if (!n--)
    17f2:	167d                	add	a2,a2,-1
    17f4:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17f8:	eb99                	bnez	a5,180e <strncmp+0x22>
    17fa:	a815                	j	182e <strncmp+0x42>
    17fc:	00a68e63          	beq	a3,a0,1818 <strncmp+0x2c>
    1800:	0505                	add	a0,a0,1
    1802:	00f71b63          	bne	a4,a5,1818 <strncmp+0x2c>
    1806:	00054783          	lbu	a5,0(a0)
    180a:	cf89                	beqz	a5,1824 <strncmp+0x38>
    180c:	85b2                	mv	a1,a2
    180e:	0005c703          	lbu	a4,0(a1)
    1812:	00158613          	add	a2,a1,1
    1816:	f37d                	bnez	a4,17fc <strncmp+0x10>
        ;
    return *l - *r;
    1818:	0007851b          	sext.w	a0,a5
    181c:	9d19                	subw	a0,a0,a4
    181e:	8082                	ret
        return 0;
    1820:	4501                	li	a0,0
}
    1822:	8082                	ret
    return *l - *r;
    1824:	0015c703          	lbu	a4,1(a1)
    1828:	4501                	li	a0,0
    182a:	9d19                	subw	a0,a0,a4
    182c:	8082                	ret
    182e:	0005c703          	lbu	a4,0(a1)
    1832:	4501                	li	a0,0
    1834:	b7e5                	j	181c <strncmp+0x30>

0000000000001836 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1836:	00757793          	and	a5,a0,7
    183a:	cf89                	beqz	a5,1854 <strlen+0x1e>
    183c:	87aa                	mv	a5,a0
    183e:	a029                	j	1848 <strlen+0x12>
    1840:	0785                	add	a5,a5,1
    1842:	0077f713          	and	a4,a5,7
    1846:	cb01                	beqz	a4,1856 <strlen+0x20>
        if (!*s)
    1848:	0007c703          	lbu	a4,0(a5)
    184c:	fb75                	bnez	a4,1840 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    184e:	40a78533          	sub	a0,a5,a0
}
    1852:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1854:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1856:	feff05b7          	lui	a1,0xfeff0
    185a:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedf97>
    185e:	f0101637          	lui	a2,0xf0101
    1862:	05c2                	sll	a1,a1,0x10
    1864:	0612                	sll	a2,a2,0x4
    1866:	6394                	ld	a3,0(a5)
    1868:	eff58593          	add	a1,a1,-257
    186c:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff199>
    1870:	05c2                	sll	a1,a1,0x10
    1872:	0642                	sll	a2,a2,0x10
    1874:	eff58593          	add	a1,a1,-257
    1878:	10160613          	add	a2,a2,257
    187c:	00b68733          	add	a4,a3,a1
    1880:	063e                	sll	a2,a2,0xf
    1882:	fff6c693          	not	a3,a3
    1886:	8f75                	and	a4,a4,a3
    1888:	08060613          	add	a2,a2,128
    188c:	8f71                	and	a4,a4,a2
    188e:	eb11                	bnez	a4,18a2 <strlen+0x6c>
    1890:	6794                	ld	a3,8(a5)
    1892:	07a1                	add	a5,a5,8
    1894:	00b68733          	add	a4,a3,a1
    1898:	fff6c693          	not	a3,a3
    189c:	8f75                	and	a4,a4,a3
    189e:	8f71                	and	a4,a4,a2
    18a0:	db65                	beqz	a4,1890 <strlen+0x5a>
    for (; *s; s++)
    18a2:	0007c703          	lbu	a4,0(a5)
    18a6:	d745                	beqz	a4,184e <strlen+0x18>
    18a8:	0017c703          	lbu	a4,1(a5)
    18ac:	0785                	add	a5,a5,1
    18ae:	d345                	beqz	a4,184e <strlen+0x18>
    18b0:	0017c703          	lbu	a4,1(a5)
    18b4:	0785                	add	a5,a5,1
    18b6:	fb6d                	bnez	a4,18a8 <strlen+0x72>
    18b8:	bf59                	j	184e <strlen+0x18>

00000000000018ba <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18ba:	00757713          	and	a4,a0,7
{
    18be:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18c0:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18c4:	cb19                	beqz	a4,18da <memchr+0x20>
    18c6:	ce59                	beqz	a2,1964 <memchr+0xaa>
    18c8:	0007c703          	lbu	a4,0(a5)
    18cc:	00b70963          	beq	a4,a1,18de <memchr+0x24>
    18d0:	0785                	add	a5,a5,1
    18d2:	0077f713          	and	a4,a5,7
    18d6:	167d                	add	a2,a2,-1
    18d8:	f77d                	bnez	a4,18c6 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18da:	4501                	li	a0,0
    if (n && *s != c)
    18dc:	c649                	beqz	a2,1966 <memchr+0xac>
    18de:	0007c703          	lbu	a4,0(a5)
    18e2:	06b70663          	beq	a4,a1,194e <memchr+0x94>
        size_t k = ONES * c;
    18e6:	01010737          	lui	a4,0x1010
    18ea:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e199>
    18ee:	0742                	sll	a4,a4,0x10
    18f0:	10170713          	add	a4,a4,257
    18f4:	0742                	sll	a4,a4,0x10
    18f6:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18fa:	469d                	li	a3,7
        size_t k = ONES * c;
    18fc:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1900:	04c6f763          	bgeu	a3,a2,194e <memchr+0x94>
    1904:	f0101837          	lui	a6,0xf0101
    1908:	feff08b7          	lui	a7,0xfeff0
    190c:	0812                	sll	a6,a6,0x4
    190e:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedf97>
    1912:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff199>
    1916:	08c2                	sll	a7,a7,0x10
    1918:	0842                	sll	a6,a6,0x10
    191a:	eff88893          	add	a7,a7,-257
    191e:	10180813          	add	a6,a6,257
    1922:	08c2                	sll	a7,a7,0x10
    1924:	083e                	sll	a6,a6,0xf
    1926:	eff88893          	add	a7,a7,-257
    192a:	08080813          	add	a6,a6,128
    192e:	431d                	li	t1,7
    1930:	a029                	j	193a <memchr+0x80>
    1932:	1661                	add	a2,a2,-8
    1934:	07a1                	add	a5,a5,8
    1936:	02c37663          	bgeu	t1,a2,1962 <memchr+0xa8>
    193a:	6398                	ld	a4,0(a5)
    193c:	8f29                	xor	a4,a4,a0
    193e:	011706b3          	add	a3,a4,a7
    1942:	fff74713          	not	a4,a4
    1946:	8f75                	and	a4,a4,a3
    1948:	01077733          	and	a4,a4,a6
    194c:	d37d                	beqz	a4,1932 <memchr+0x78>
        s = (const void *)w;
    194e:	853e                	mv	a0,a5
    1950:	a019                	j	1956 <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    1952:	0505                	add	a0,a0,1
    1954:	ca01                	beqz	a2,1964 <memchr+0xaa>
    1956:	00054783          	lbu	a5,0(a0)
    195a:	167d                	add	a2,a2,-1
    195c:	feb79be3          	bne	a5,a1,1952 <memchr+0x98>
    1960:	8082                	ret
    1962:	f675                	bnez	a2,194e <memchr+0x94>
    return n ? (void *)s : 0;
    1964:	4501                	li	a0,0
}
    1966:	8082                	ret

0000000000001968 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1968:	1101                	add	sp,sp,-32
    196a:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    196c:	862e                	mv	a2,a1
{
    196e:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1970:	4581                	li	a1,0
{
    1972:	e426                	sd	s1,8(sp)
    1974:	ec06                	sd	ra,24(sp)
    1976:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1978:	f43ff0ef          	jal	18ba <memchr>
    return p ? p - s : n;
    197c:	c519                	beqz	a0,198a <strnlen+0x22>
}
    197e:	60e2                	ld	ra,24(sp)
    1980:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1982:	8d05                	sub	a0,a0,s1
}
    1984:	64a2                	ld	s1,8(sp)
    1986:	6105                	add	sp,sp,32
    1988:	8082                	ret
    198a:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    198c:	8522                	mv	a0,s0
}
    198e:	6442                	ld	s0,16(sp)
    1990:	64a2                	ld	s1,8(sp)
    1992:	6105                	add	sp,sp,32
    1994:	8082                	ret

0000000000001996 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1996:	00b547b3          	xor	a5,a0,a1
    199a:	8b9d                	and	a5,a5,7
    199c:	efb1                	bnez	a5,19f8 <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    199e:	0075f793          	and	a5,a1,7
    19a2:	ebb5                	bnez	a5,1a16 <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19a4:	feff0637          	lui	a2,0xfeff0
    19a8:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedf97>
    19ac:	f01016b7          	lui	a3,0xf0101
    19b0:	0642                	sll	a2,a2,0x10
    19b2:	0692                	sll	a3,a3,0x4
    19b4:	6198                	ld	a4,0(a1)
    19b6:	eff60613          	add	a2,a2,-257
    19ba:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff199>
    19be:	0642                	sll	a2,a2,0x10
    19c0:	06c2                	sll	a3,a3,0x10
    19c2:	eff60613          	add	a2,a2,-257
    19c6:	10168693          	add	a3,a3,257
    19ca:	00c707b3          	add	a5,a4,a2
    19ce:	fff74813          	not	a6,a4
    19d2:	06be                	sll	a3,a3,0xf
    19d4:	0107f7b3          	and	a5,a5,a6
    19d8:	08068693          	add	a3,a3,128
    19dc:	8ff5                	and	a5,a5,a3
    19de:	ef89                	bnez	a5,19f8 <strcpy+0x62>
    19e0:	05a1                	add	a1,a1,8
    19e2:	e118                	sd	a4,0(a0)
    19e4:	6198                	ld	a4,0(a1)
    19e6:	0521                	add	a0,a0,8
    19e8:	00c707b3          	add	a5,a4,a2
    19ec:	fff74813          	not	a6,a4
    19f0:	0107f7b3          	and	a5,a5,a6
    19f4:	8ff5                	and	a5,a5,a3
    19f6:	d7ed                	beqz	a5,19e0 <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19f8:	0005c783          	lbu	a5,0(a1)
    19fc:	00f50023          	sb	a5,0(a0)
    1a00:	c785                	beqz	a5,1a28 <strcpy+0x92>
    1a02:	0015c783          	lbu	a5,1(a1)
    1a06:	0505                	add	a0,a0,1
    1a08:	0585                	add	a1,a1,1
    1a0a:	00f50023          	sb	a5,0(a0)
    1a0e:	fbf5                	bnez	a5,1a02 <strcpy+0x6c>
        ;
    return d;
}
    1a10:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a12:	0505                	add	a0,a0,1
    1a14:	db41                	beqz	a4,19a4 <strcpy+0xe>
            if (!(*d = *s))
    1a16:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a1a:	0585                	add	a1,a1,1
    1a1c:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a20:	00f50023          	sb	a5,0(a0)
    1a24:	f7fd                	bnez	a5,1a12 <strcpy+0x7c>
}
    1a26:	8082                	ret
    1a28:	8082                	ret

0000000000001a2a <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a2a:	00b547b3          	xor	a5,a0,a1
    1a2e:	8b9d                	and	a5,a5,7
    1a30:	efbd                	bnez	a5,1aae <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a32:	0075f793          	and	a5,a1,7
    1a36:	1c078563          	beqz	a5,1c00 <strncpy+0x1d6>
    1a3a:	ea11                	bnez	a2,1a4e <strncpy+0x24>
    1a3c:	8082                	ret
    1a3e:	0585                	add	a1,a1,1
    1a40:	0075f793          	and	a5,a1,7
    1a44:	167d                	add	a2,a2,-1
    1a46:	0505                	add	a0,a0,1
    1a48:	1a078c63          	beqz	a5,1c00 <strncpy+0x1d6>
    1a4c:	ca3d                	beqz	a2,1ac2 <strncpy+0x98>
    1a4e:	0005c783          	lbu	a5,0(a1)
    1a52:	00f50023          	sb	a5,0(a0)
    1a56:	f7e5                	bnez	a5,1a3e <strncpy+0x14>
            ;
        if (!n || !*s)
    1a58:	0005c783          	lbu	a5,0(a1)
    1a5c:	c7a5                	beqz	a5,1ac4 <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a5e:	479d                	li	a5,7
    1a60:	04c7f863          	bgeu	a5,a2,1ab0 <strncpy+0x86>
    1a64:	f01016b7          	lui	a3,0xf0101
    1a68:	feff0837          	lui	a6,0xfeff0
    1a6c:	0692                	sll	a3,a3,0x4
    1a6e:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedf97>
    1a72:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff199>
    1a76:	0842                	sll	a6,a6,0x10
    1a78:	06c2                	sll	a3,a3,0x10
    1a7a:	eff80813          	add	a6,a6,-257
    1a7e:	10168693          	add	a3,a3,257
    1a82:	0842                	sll	a6,a6,0x10
    1a84:	06be                	sll	a3,a3,0xf
    1a86:	eff80813          	add	a6,a6,-257
    1a8a:	08068693          	add	a3,a3,128
    1a8e:	431d                	li	t1,7
    1a90:	6198                	ld	a4,0(a1)
    1a92:	010707b3          	add	a5,a4,a6
    1a96:	fff74893          	not	a7,a4
    1a9a:	0117f7b3          	and	a5,a5,a7
    1a9e:	8ff5                	and	a5,a5,a3
    1aa0:	eb81                	bnez	a5,1ab0 <strncpy+0x86>
            *wd = *ws;
    1aa2:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1aa4:	1661                	add	a2,a2,-8
    1aa6:	05a1                	add	a1,a1,8
    1aa8:	0521                	add	a0,a0,8
    1aaa:	fec363e3          	bltu	t1,a2,1a90 <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1aae:	ca11                	beqz	a2,1ac2 <strncpy+0x98>
    1ab0:	0005c783          	lbu	a5,0(a1)
    1ab4:	0585                	add	a1,a1,1
    1ab6:	00f50023          	sb	a5,0(a0)
    1aba:	c789                	beqz	a5,1ac4 <strncpy+0x9a>
    1abc:	167d                	add	a2,a2,-1
    1abe:	0505                	add	a0,a0,1
    1ac0:	fa65                	bnez	a2,1ab0 <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1ac2:	8082                	ret
    1ac4:	40a00733          	neg	a4,a0
    1ac8:	00777793          	and	a5,a4,7
    1acc:	00778693          	add	a3,a5,7
    1ad0:	482d                	li	a6,11
    1ad2:	fff60593          	add	a1,a2,-1
    1ad6:	1106ef63          	bltu	a3,a6,1bf4 <strncpy+0x1ca>
    1ada:	12d5ee63          	bltu	a1,a3,1c16 <strncpy+0x1ec>
    1ade:	12078563          	beqz	a5,1c08 <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ae2:	00050023          	sb	zero,0(a0)
    1ae6:	00677693          	and	a3,a4,6
    1aea:	12068263          	beqz	a3,1c0e <strncpy+0x1e4>
    1aee:	000500a3          	sb	zero,1(a0)
    1af2:	4689                	li	a3,2
    1af4:	12f6f463          	bgeu	a3,a5,1c1c <strncpy+0x1f2>
    1af8:	00050123          	sb	zero,2(a0)
    1afc:	8b11                	and	a4,a4,4
    1afe:	cf6d                	beqz	a4,1bf8 <strncpy+0x1ce>
    1b00:	000501a3          	sb	zero,3(a0)
    1b04:	4711                	li	a4,4
    1b06:	00450693          	add	a3,a0,4
    1b0a:	02f77363          	bgeu	a4,a5,1b30 <strncpy+0x106>
    1b0e:	00050223          	sb	zero,4(a0)
    1b12:	4715                	li	a4,5
    1b14:	00550693          	add	a3,a0,5
    1b18:	00e78c63          	beq	a5,a4,1b30 <strncpy+0x106>
    1b1c:	000502a3          	sb	zero,5(a0)
    1b20:	471d                	li	a4,7
    1b22:	10e79163          	bne	a5,a4,1c24 <strncpy+0x1fa>
    1b26:	00750693          	add	a3,a0,7
    1b2a:	00050323          	sb	zero,6(a0)
    1b2e:	471d                	li	a4,7
    1b30:	40f608b3          	sub	a7,a2,a5
    1b34:	ff88f813          	and	a6,a7,-8
    1b38:	97aa                	add	a5,a5,a0
    1b3a:	010785b3          	add	a1,a5,a6
    1b3e:	0007b023          	sd	zero,0(a5)
    1b42:	07a1                	add	a5,a5,8
    1b44:	feb79de3          	bne	a5,a1,1b3e <strncpy+0x114>
    1b48:	00e807bb          	addw	a5,a6,a4
    1b4c:	01068733          	add	a4,a3,a6
    1b50:	0b088b63          	beq	a7,a6,1c06 <strncpy+0x1dc>
    1b54:	00070023          	sb	zero,0(a4)
    1b58:	0017869b          	addw	a3,a5,1
    1b5c:	f6c6f3e3          	bgeu	a3,a2,1ac2 <strncpy+0x98>
    1b60:	000700a3          	sb	zero,1(a4)
    1b64:	0027869b          	addw	a3,a5,2
    1b68:	f4c6fde3          	bgeu	a3,a2,1ac2 <strncpy+0x98>
    1b6c:	00070123          	sb	zero,2(a4)
    1b70:	0037869b          	addw	a3,a5,3
    1b74:	f4c6f7e3          	bgeu	a3,a2,1ac2 <strncpy+0x98>
    1b78:	000701a3          	sb	zero,3(a4)
    1b7c:	0047869b          	addw	a3,a5,4
    1b80:	f4c6f1e3          	bgeu	a3,a2,1ac2 <strncpy+0x98>
    1b84:	00070223          	sb	zero,4(a4)
    1b88:	0057869b          	addw	a3,a5,5
    1b8c:	f2c6fbe3          	bgeu	a3,a2,1ac2 <strncpy+0x98>
    1b90:	000702a3          	sb	zero,5(a4)
    1b94:	0067869b          	addw	a3,a5,6
    1b98:	f2c6f5e3          	bgeu	a3,a2,1ac2 <strncpy+0x98>
    1b9c:	00070323          	sb	zero,6(a4)
    1ba0:	0077869b          	addw	a3,a5,7
    1ba4:	f0c6ffe3          	bgeu	a3,a2,1ac2 <strncpy+0x98>
    1ba8:	000703a3          	sb	zero,7(a4)
    1bac:	0087869b          	addw	a3,a5,8
    1bb0:	f0c6f9e3          	bgeu	a3,a2,1ac2 <strncpy+0x98>
    1bb4:	00070423          	sb	zero,8(a4)
    1bb8:	0097869b          	addw	a3,a5,9
    1bbc:	f0c6f3e3          	bgeu	a3,a2,1ac2 <strncpy+0x98>
    1bc0:	000704a3          	sb	zero,9(a4)
    1bc4:	00a7869b          	addw	a3,a5,10
    1bc8:	eec6fde3          	bgeu	a3,a2,1ac2 <strncpy+0x98>
    1bcc:	00070523          	sb	zero,10(a4)
    1bd0:	00b7869b          	addw	a3,a5,11
    1bd4:	eec6f7e3          	bgeu	a3,a2,1ac2 <strncpy+0x98>
    1bd8:	000705a3          	sb	zero,11(a4)
    1bdc:	00c7869b          	addw	a3,a5,12
    1be0:	eec6f1e3          	bgeu	a3,a2,1ac2 <strncpy+0x98>
    1be4:	00070623          	sb	zero,12(a4)
    1be8:	27b5                	addw	a5,a5,13
    1bea:	ecc7fce3          	bgeu	a5,a2,1ac2 <strncpy+0x98>
    1bee:	000706a3          	sb	zero,13(a4)
}
    1bf2:	8082                	ret
    1bf4:	46ad                	li	a3,11
    1bf6:	b5d5                	j	1ada <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bf8:	00350693          	add	a3,a0,3
    1bfc:	470d                	li	a4,3
    1bfe:	bf0d                	j	1b30 <strncpy+0x106>
        if (!n || !*s)
    1c00:	e4061ce3          	bnez	a2,1a58 <strncpy+0x2e>
}
    1c04:	8082                	ret
    1c06:	8082                	ret
    char *p = dest;
    1c08:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c0a:	4701                	li	a4,0
    1c0c:	b715                	j	1b30 <strncpy+0x106>
    1c0e:	00150693          	add	a3,a0,1
    1c12:	4705                	li	a4,1
    1c14:	bf31                	j	1b30 <strncpy+0x106>
    char *p = dest;
    1c16:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c18:	4781                	li	a5,0
    1c1a:	bf2d                	j	1b54 <strncpy+0x12a>
    1c1c:	00250693          	add	a3,a0,2
    1c20:	4709                	li	a4,2
    1c22:	b739                	j	1b30 <strncpy+0x106>
    1c24:	00650693          	add	a3,a0,6
    1c28:	4719                	li	a4,6
    1c2a:	b719                	j	1b30 <strncpy+0x106>

0000000000001c2c <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c2c:	87aa                	mv	a5,a0
    1c2e:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c30:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c34:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c38:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c3a:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c3c:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c40:	2501                	sext.w	a0,a0
    1c42:	8082                	ret

0000000000001c44 <openat>:
    register long a7 __asm__("a7") = n;
    1c44:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c48:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c4c:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c50:	2501                	sext.w	a0,a0
    1c52:	8082                	ret

0000000000001c54 <fcntl>:
    register long a7 __asm__("a7") = n;
    1c54:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c56:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1c5a:	2501                	sext.w	a0,a0
    1c5c:	8082                	ret

0000000000001c5e <close>:
    register long a7 __asm__("a7") = n;
    1c5e:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c62:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c66:	2501                	sext.w	a0,a0
    1c68:	8082                	ret

0000000000001c6a <read>:
    register long a7 __asm__("a7") = n;
    1c6a:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c6e:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c72:	8082                	ret

0000000000001c74 <write>:
    register long a7 __asm__("a7") = n;
    1c74:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c78:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c7c:	8082                	ret

0000000000001c7e <getpid>:
    register long a7 __asm__("a7") = n;
    1c7e:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c82:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c86:	2501                	sext.w	a0,a0
    1c88:	8082                	ret

0000000000001c8a <getppid>:
    register long a7 __asm__("a7") = n;
    1c8a:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c8e:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c92:	2501                	sext.w	a0,a0
    1c94:	8082                	ret

0000000000001c96 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c96:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c9a:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c9e:	2501                	sext.w	a0,a0
    1ca0:	8082                	ret

0000000000001ca2 <fork>:
    register long a7 __asm__("a7") = n;
    1ca2:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1ca6:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1ca8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1caa:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cae:	2501                	sext.w	a0,a0
    1cb0:	8082                	ret

0000000000001cb2 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cb2:	85b2                	mv	a1,a2
    1cb4:	863a                	mv	a2,a4
    if (stack)
    1cb6:	c191                	beqz	a1,1cba <clone+0x8>
	stack += stack_size;
    1cb8:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cba:	4781                	li	a5,0
    1cbc:	4701                	li	a4,0
    1cbe:	4681                	li	a3,0
    1cc0:	2601                	sext.w	a2,a2
    1cc2:	a2ed                	j	1eac <__clone>

0000000000001cc4 <exit>:
    register long a7 __asm__("a7") = n;
    1cc4:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cc8:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1ccc:	8082                	ret

0000000000001cce <waitpid>:
    register long a7 __asm__("a7") = n;
    1cce:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cd2:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cd4:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cd8:	2501                	sext.w	a0,a0
    1cda:	8082                	ret

0000000000001cdc <exec>:
    register long a7 __asm__("a7") = n;
    1cdc:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1ce0:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1ce4:	2501                	sext.w	a0,a0
    1ce6:	8082                	ret

0000000000001ce8 <execve>:
    register long a7 __asm__("a7") = n;
    1ce8:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cec:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cf0:	2501                	sext.w	a0,a0
    1cf2:	8082                	ret

0000000000001cf4 <times>:
    register long a7 __asm__("a7") = n;
    1cf4:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cf8:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1cfc:	2501                	sext.w	a0,a0
    1cfe:	8082                	ret

0000000000001d00 <get_time>:

int64 get_time()
{
    1d00:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d02:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d06:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d08:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d0a:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d0e:	2501                	sext.w	a0,a0
    1d10:	ed09                	bnez	a0,1d2a <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d12:	67a2                	ld	a5,8(sp)
    1d14:	3e800713          	li	a4,1000
    1d18:	00015503          	lhu	a0,0(sp)
    1d1c:	02e7d7b3          	divu	a5,a5,a4
    1d20:	02e50533          	mul	a0,a0,a4
    1d24:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d26:	0141                	add	sp,sp,16
    1d28:	8082                	ret
        return -1;
    1d2a:	557d                	li	a0,-1
    1d2c:	bfed                	j	1d26 <get_time+0x26>

0000000000001d2e <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d2e:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d32:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d36:	2501                	sext.w	a0,a0
    1d38:	8082                	ret

0000000000001d3a <time>:
    register long a7 __asm__("a7") = n;
    1d3a:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d3e:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d42:	2501                	sext.w	a0,a0
    1d44:	8082                	ret

0000000000001d46 <sleep>:

int sleep(unsigned long long time)
{
    1d46:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d48:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d4a:	850a                	mv	a0,sp
    1d4c:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d4e:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d52:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d54:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d58:	e501                	bnez	a0,1d60 <sleep+0x1a>
    return 0;
    1d5a:	4501                	li	a0,0
}
    1d5c:	0141                	add	sp,sp,16
    1d5e:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d60:	4502                	lw	a0,0(sp)
}
    1d62:	0141                	add	sp,sp,16
    1d64:	8082                	ret

0000000000001d66 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d66:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d6a:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d6e:	2501                	sext.w	a0,a0
    1d70:	8082                	ret

0000000000001d72 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d72:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d76:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d7a:	8082                	ret

0000000000001d7c <munmap>:
    register long a7 __asm__("a7") = n;
    1d7c:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d80:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d84:	2501                	sext.w	a0,a0
    1d86:	8082                	ret

0000000000001d88 <wait>:

int wait(int *code)
{
    1d88:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d8a:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d8e:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d90:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d92:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d94:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d98:	2501                	sext.w	a0,a0
    1d9a:	8082                	ret

0000000000001d9c <spawn>:
    register long a7 __asm__("a7") = n;
    1d9c:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1da0:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1da4:	2501                	sext.w	a0,a0
    1da6:	8082                	ret

0000000000001da8 <mailread>:
    register long a7 __asm__("a7") = n;
    1da8:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dac:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1db0:	2501                	sext.w	a0,a0
    1db2:	8082                	ret

0000000000001db4 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1db4:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1db8:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dbc:	2501                	sext.w	a0,a0
    1dbe:	8082                	ret

0000000000001dc0 <fstat>:
    register long a7 __asm__("a7") = n;
    1dc0:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc4:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dc8:	2501                	sext.w	a0,a0
    1dca:	8082                	ret

0000000000001dcc <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dcc:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dce:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dd2:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dd4:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1dd8:	2501                	sext.w	a0,a0
    1dda:	8082                	ret

0000000000001ddc <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1ddc:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dde:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1de2:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de4:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1de8:	2501                	sext.w	a0,a0
    1dea:	8082                	ret

0000000000001dec <link>:

int link(char *old_path, char *new_path)
{
    1dec:	87aa                	mv	a5,a0
    1dee:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1df0:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1df4:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1df8:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1dfa:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1dfe:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e00:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e04:	2501                	sext.w	a0,a0
    1e06:	8082                	ret

0000000000001e08 <unlink>:

int unlink(char *path)
{
    1e08:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e0a:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e0e:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e12:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e14:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e18:	2501                	sext.w	a0,a0
    1e1a:	8082                	ret

0000000000001e1c <uname>:
    register long a7 __asm__("a7") = n;
    1e1c:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e20:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e24:	2501                	sext.w	a0,a0
    1e26:	8082                	ret

0000000000001e28 <brk>:
    register long a7 __asm__("a7") = n;
    1e28:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e2c:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e30:	2501                	sext.w	a0,a0
    1e32:	8082                	ret

0000000000001e34 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e34:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e36:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e3a:	8082                	ret

0000000000001e3c <chdir>:
    register long a7 __asm__("a7") = n;
    1e3c:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e40:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e44:	2501                	sext.w	a0,a0
    1e46:	8082                	ret

0000000000001e48 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e48:	862e                	mv	a2,a1
    1e4a:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e4c:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e4e:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e52:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e56:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e58:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e5a:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e5e:	2501                	sext.w	a0,a0
    1e60:	8082                	ret

0000000000001e62 <getdents>:
    register long a7 __asm__("a7") = n;
    1e62:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e66:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e6a:	2501                	sext.w	a0,a0
    1e6c:	8082                	ret

0000000000001e6e <pipe>:
    register long a7 __asm__("a7") = n;
    1e6e:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e72:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e74:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e78:	2501                	sext.w	a0,a0
    1e7a:	8082                	ret

0000000000001e7c <dup>:
    register long a7 __asm__("a7") = n;
    1e7c:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e7e:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e82:	2501                	sext.w	a0,a0
    1e84:	8082                	ret

0000000000001e86 <dup2>:
    register long a7 __asm__("a7") = n;
    1e86:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e88:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e8a:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e8e:	2501                	sext.w	a0,a0
    1e90:	8082                	ret

0000000000001e92 <mount>:
    register long a7 __asm__("a7") = n;
    1e92:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e96:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e9a:	2501                	sext.w	a0,a0
    1e9c:	8082                	ret

0000000000001e9e <umount>:
    register long a7 __asm__("a7") = n;
    1e9e:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ea2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea4:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ea8:	2501                	sext.w	a0,a0
    1eaa:	8082                	ret

0000000000001eac <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1eac:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1eae:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1eb0:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1eb2:	8532                	mv	a0,a2
	mv a2, a4
    1eb4:	863a                	mv	a2,a4
	mv a3, a5
    1eb6:	86be                	mv	a3,a5
	mv a4, a6
    1eb8:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1eba:	0dc00893          	li	a7,220
	ecall
    1ebe:	00000073          	ecall

	beqz a0, 1f
    1ec2:	c111                	beqz	a0,1ec6 <__clone+0x1a>
	# Parent
	ret
    1ec4:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ec6:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ec8:	6522                	ld	a0,8(sp)
	jalr a1
    1eca:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ecc:	05d00893          	li	a7,93
	ecall
    1ed0:	00000073          	ecall
