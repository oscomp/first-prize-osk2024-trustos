
/home/windflower/Desktop/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/test_echo:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a83d                	j	1040 <__start_main>

0000000000001004 <main>:

/*
 * for execve
 */

int main(int argc, char *argv[]){
    1004:	1141                	add	sp,sp,-16
    printf("  I am test_echo.\nexecve success.\n");
    1006:	00001517          	auipc	a0,0x1
    100a:	e6a50513          	add	a0,a0,-406 # 1e70 <__clone+0x2a>
int main(int argc, char *argv[]){
    100e:	e406                	sd	ra,8(sp)
    printf("  I am test_echo.\nexecve success.\n");
    1010:	28a000ef          	jal	129a <printf>
    TEST_END(__func__);
    1014:	00001517          	auipc	a0,0x1
    1018:	e8450513          	add	a0,a0,-380 # 1e98 <__clone+0x52>
    101c:	25c000ef          	jal	1278 <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	ea050513          	add	a0,a0,-352 # 1ec0 <__func__.0>
    1028:	250000ef          	jal	1278 <puts>
    102c:	00001517          	auipc	a0,0x1
    1030:	e7c50513          	add	a0,a0,-388 # 1ea8 <__clone+0x62>
    1034:	244000ef          	jal	1278 <puts>
    return 0;
}
    1038:	60a2                	ld	ra,8(sp)
    103a:	4501                	li	a0,0
    103c:	0141                	add	sp,sp,16
    103e:	8082                	ret

0000000000001040 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1040:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1042:	4108                	lw	a0,0(a0)
{
    1044:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    1046:	05a1                	add	a1,a1,8
{
    1048:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    104a:	fbbff0ef          	jal	1004 <main>
    104e:	411000ef          	jal	1c5e <exit>
	return 0;
}
    1052:	60a2                	ld	ra,8(sp)
    1054:	4501                	li	a0,0
    1056:	0141                	add	sp,sp,16
    1058:	8082                	ret

000000000000105a <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    105a:	7179                	add	sp,sp,-48
    105c:	f406                	sd	ra,40(sp)
    105e:	0005081b          	sext.w	a6,a0
    1062:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1064:	00055563          	bgez	a0,106e <printint.constprop.0+0x14>
        x = -xx;
    1068:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    106c:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    106e:	02b8763b          	remuw	a2,a6,a1
    1072:	00001697          	auipc	a3,0x1
    1076:	e5668693          	add	a3,a3,-426 # 1ec8 <digits>
    buf[16] = 0;
    107a:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    107e:	0005871b          	sext.w	a4,a1
    1082:	1602                	sll	a2,a2,0x20
    1084:	9201                	srl	a2,a2,0x20
    1086:	9636                	add	a2,a2,a3
    1088:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    108c:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    1090:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1094:	10b86c63          	bltu	a6,a1,11ac <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    1098:	02e5763b          	remuw	a2,a0,a4
    109c:	1602                	sll	a2,a2,0x20
    109e:	9201                	srl	a2,a2,0x20
    10a0:	9636                	add	a2,a2,a3
    10a2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10a6:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    10aa:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    10ae:	10e56863          	bltu	a0,a4,11be <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    10b2:	02e5f63b          	remuw	a2,a1,a4
    10b6:	1602                	sll	a2,a2,0x20
    10b8:	9201                	srl	a2,a2,0x20
    10ba:	9636                	add	a2,a2,a3
    10bc:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10c0:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    10c4:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    10c8:	10e5e463          	bltu	a1,a4,11d0 <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    10cc:	02e5763b          	remuw	a2,a0,a4
    10d0:	1602                	sll	a2,a2,0x20
    10d2:	9201                	srl	a2,a2,0x20
    10d4:	9636                	add	a2,a2,a3
    10d6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10da:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    10de:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    10e2:	10e56063          	bltu	a0,a4,11e2 <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    10e6:	02e5f63b          	remuw	a2,a1,a4
    10ea:	1602                	sll	a2,a2,0x20
    10ec:	9201                	srl	a2,a2,0x20
    10ee:	9636                	add	a2,a2,a3
    10f0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10f4:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    10f8:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    10fc:	0ee5ec63          	bltu	a1,a4,11f4 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    1100:	02e5763b          	remuw	a2,a0,a4
    1104:	1602                	sll	a2,a2,0x20
    1106:	9201                	srl	a2,a2,0x20
    1108:	9636                	add	a2,a2,a3
    110a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    110e:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1112:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1116:	08e56263          	bltu	a0,a4,119a <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    111a:	02e5f63b          	remuw	a2,a1,a4
    111e:	1602                	sll	a2,a2,0x20
    1120:	9201                	srl	a2,a2,0x20
    1122:	9636                	add	a2,a2,a3
    1124:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1128:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    112c:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1130:	0ce5eb63          	bltu	a1,a4,1206 <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    1134:	02e5763b          	remuw	a2,a0,a4
    1138:	1602                	sll	a2,a2,0x20
    113a:	9201                	srl	a2,a2,0x20
    113c:	9636                	add	a2,a2,a3
    113e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1142:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1146:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    114a:	0ce56763          	bltu	a0,a4,1218 <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    114e:	02e5f63b          	remuw	a2,a1,a4
    1152:	1602                	sll	a2,a2,0x20
    1154:	9201                	srl	a2,a2,0x20
    1156:	9636                	add	a2,a2,a3
    1158:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    115c:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1160:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    1164:	0ce5e363          	bltu	a1,a4,122a <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    1168:	1782                	sll	a5,a5,0x20
    116a:	9381                	srl	a5,a5,0x20
    116c:	96be                	add	a3,a3,a5
    116e:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    1172:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    1174:	00f10723          	sb	a5,14(sp)
    if (sign)
    1178:	00088763          	beqz	a7,1186 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    117c:	02d00793          	li	a5,45
    1180:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1184:	4595                	li	a1,5
    write(f, s, l);
    1186:	003c                	add	a5,sp,8
    1188:	4641                	li	a2,16
    118a:	9e0d                	subw	a2,a2,a1
    118c:	4505                	li	a0,1
    118e:	95be                	add	a1,a1,a5
    1190:	27f000ef          	jal	1c0e <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1194:	70a2                	ld	ra,40(sp)
    1196:	6145                	add	sp,sp,48
    1198:	8082                	ret
    i++;
    119a:	45a9                	li	a1,10
    if (sign)
    119c:	fe0885e3          	beqz	a7,1186 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11a0:	02d00793          	li	a5,45
    11a4:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    11a8:	45a5                	li	a1,9
    11aa:	bff1                	j	1186 <printint.constprop.0+0x12c>
    i++;
    11ac:	45bd                	li	a1,15
    if (sign)
    11ae:	fc088ce3          	beqz	a7,1186 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11b2:	02d00793          	li	a5,45
    11b6:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    11ba:	45b9                	li	a1,14
    11bc:	b7e9                	j	1186 <printint.constprop.0+0x12c>
    i++;
    11be:	45b9                	li	a1,14
    if (sign)
    11c0:	fc0883e3          	beqz	a7,1186 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11c4:	02d00793          	li	a5,45
    11c8:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    11cc:	45b5                	li	a1,13
    11ce:	bf65                	j	1186 <printint.constprop.0+0x12c>
    i++;
    11d0:	45b5                	li	a1,13
    if (sign)
    11d2:	fa088ae3          	beqz	a7,1186 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11d6:	02d00793          	li	a5,45
    11da:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    11de:	45b1                	li	a1,12
    11e0:	b75d                	j	1186 <printint.constprop.0+0x12c>
    i++;
    11e2:	45b1                	li	a1,12
    if (sign)
    11e4:	fa0881e3          	beqz	a7,1186 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11e8:	02d00793          	li	a5,45
    11ec:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    11f0:	45ad                	li	a1,11
    11f2:	bf51                	j	1186 <printint.constprop.0+0x12c>
    i++;
    11f4:	45ad                	li	a1,11
    if (sign)
    11f6:	f80888e3          	beqz	a7,1186 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11fa:	02d00793          	li	a5,45
    11fe:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1202:	45a9                	li	a1,10
    1204:	b749                	j	1186 <printint.constprop.0+0x12c>
    i++;
    1206:	45a5                	li	a1,9
    if (sign)
    1208:	f6088fe3          	beqz	a7,1186 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    120c:	02d00793          	li	a5,45
    1210:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1214:	45a1                	li	a1,8
    1216:	bf85                	j	1186 <printint.constprop.0+0x12c>
    i++;
    1218:	45a1                	li	a1,8
    if (sign)
    121a:	f60886e3          	beqz	a7,1186 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    121e:	02d00793          	li	a5,45
    1222:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1226:	459d                	li	a1,7
    1228:	bfb9                	j	1186 <printint.constprop.0+0x12c>
    i++;
    122a:	459d                	li	a1,7
    if (sign)
    122c:	f4088de3          	beqz	a7,1186 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1230:	02d00793          	li	a5,45
    1234:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1238:	4599                	li	a1,6
    123a:	b7b1                	j	1186 <printint.constprop.0+0x12c>

000000000000123c <getchar>:
{
    123c:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    123e:	00f10593          	add	a1,sp,15
    1242:	4605                	li	a2,1
    1244:	4501                	li	a0,0
{
    1246:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1248:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    124c:	1b9000ef          	jal	1c04 <read>
}
    1250:	60e2                	ld	ra,24(sp)
    1252:	00f14503          	lbu	a0,15(sp)
    1256:	6105                	add	sp,sp,32
    1258:	8082                	ret

000000000000125a <putchar>:
{
    125a:	1101                	add	sp,sp,-32
    125c:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    125e:	00f10593          	add	a1,sp,15
    1262:	4605                	li	a2,1
    1264:	4505                	li	a0,1
{
    1266:	ec06                	sd	ra,24(sp)
    char byte = c;
    1268:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    126c:	1a3000ef          	jal	1c0e <write>
}
    1270:	60e2                	ld	ra,24(sp)
    1272:	2501                	sext.w	a0,a0
    1274:	6105                	add	sp,sp,32
    1276:	8082                	ret

0000000000001278 <puts>:
{
    1278:	1141                	add	sp,sp,-16
    127a:	e406                	sd	ra,8(sp)
    127c:	e022                	sd	s0,0(sp)
    127e:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1280:	55a000ef          	jal	17da <strlen>
    1284:	862a                	mv	a2,a0
    1286:	85a2                	mv	a1,s0
    1288:	4505                	li	a0,1
    128a:	185000ef          	jal	1c0e <write>
}
    128e:	60a2                	ld	ra,8(sp)
    1290:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1292:	957d                	sra	a0,a0,0x3f
    return r;
    1294:	2501                	sext.w	a0,a0
}
    1296:	0141                	add	sp,sp,16
    1298:	8082                	ret

000000000000129a <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    129a:	7131                	add	sp,sp,-192
    129c:	e4d6                	sd	s5,72(sp)
    129e:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12a0:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12a2:	013c                	add	a5,sp,136
{
    12a4:	f0ca                	sd	s2,96(sp)
    12a6:	ecce                	sd	s3,88(sp)
    12a8:	e8d2                	sd	s4,80(sp)
    12aa:	e0da                	sd	s6,64(sp)
    12ac:	fc5e                	sd	s7,56(sp)
    12ae:	fc86                	sd	ra,120(sp)
    12b0:	f8a2                	sd	s0,112(sp)
    12b2:	f4a6                	sd	s1,104(sp)
    12b4:	e52e                	sd	a1,136(sp)
    12b6:	e932                	sd	a2,144(sp)
    12b8:	ed36                	sd	a3,152(sp)
    12ba:	f13a                	sd	a4,160(sp)
    12bc:	f942                	sd	a6,176(sp)
    12be:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    12c0:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    12c2:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    12c6:	07300a13          	li	s4,115
    12ca:	07800b93          	li	s7,120
    12ce:	06400b13          	li	s6,100
    buf[i++] = '0';
    12d2:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x5968>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12d6:	00001997          	auipc	s3,0x1
    12da:	bf298993          	add	s3,s3,-1038 # 1ec8 <digits>
        if (!*s)
    12de:	00054783          	lbu	a5,0(a0)
    12e2:	16078863          	beqz	a5,1452 <printf+0x1b8>
    12e6:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    12e8:	19278063          	beq	a5,s2,1468 <printf+0x1ce>
    12ec:	00164783          	lbu	a5,1(a2)
    12f0:	0605                	add	a2,a2,1
    12f2:	fbfd                	bnez	a5,12e8 <printf+0x4e>
    12f4:	84b2                	mv	s1,a2
        l = z - a;
    12f6:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    12fa:	85aa                	mv	a1,a0
    12fc:	8622                	mv	a2,s0
    12fe:	4505                	li	a0,1
    1300:	10f000ef          	jal	1c0e <write>
        if (l)
    1304:	18041763          	bnez	s0,1492 <printf+0x1f8>
        if (s[1] == 0)
    1308:	0014c783          	lbu	a5,1(s1)
    130c:	14078363          	beqz	a5,1452 <printf+0x1b8>
        switch (s[1])
    1310:	19478f63          	beq	a5,s4,14ae <printf+0x214>
    1314:	18fa6163          	bltu	s4,a5,1496 <printf+0x1fc>
    1318:	1b678e63          	beq	a5,s6,14d4 <printf+0x23a>
    131c:	07000713          	li	a4,112
    1320:	1ce79463          	bne	a5,a4,14e8 <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1324:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1326:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    132a:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    132c:	631c                	ld	a5,0(a4)
    132e:	0721                	add	a4,a4,8
    1330:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1332:	00479293          	sll	t0,a5,0x4
    1336:	00879f93          	sll	t6,a5,0x8
    133a:	00c79f13          	sll	t5,a5,0xc
    133e:	01079e93          	sll	t4,a5,0x10
    1342:	01479e13          	sll	t3,a5,0x14
    1346:	01879313          	sll	t1,a5,0x18
    134a:	01c79893          	sll	a7,a5,0x1c
    134e:	02479813          	sll	a6,a5,0x24
    1352:	02879513          	sll	a0,a5,0x28
    1356:	02c79593          	sll	a1,a5,0x2c
    135a:	03079693          	sll	a3,a5,0x30
    135e:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1362:	03c7d413          	srl	s0,a5,0x3c
    1366:	01c7d39b          	srlw	t2,a5,0x1c
    136a:	03c2d293          	srl	t0,t0,0x3c
    136e:	03cfdf93          	srl	t6,t6,0x3c
    1372:	03cf5f13          	srl	t5,t5,0x3c
    1376:	03cede93          	srl	t4,t4,0x3c
    137a:	03ce5e13          	srl	t3,t3,0x3c
    137e:	03c35313          	srl	t1,t1,0x3c
    1382:	03c8d893          	srl	a7,a7,0x3c
    1386:	03c85813          	srl	a6,a6,0x3c
    138a:	9171                	srl	a0,a0,0x3c
    138c:	91f1                	srl	a1,a1,0x3c
    138e:	92f1                	srl	a3,a3,0x3c
    1390:	9371                	srl	a4,a4,0x3c
    1392:	974e                	add	a4,a4,s3
    1394:	944e                	add	s0,s0,s3
    1396:	92ce                	add	t0,t0,s3
    1398:	9fce                	add	t6,t6,s3
    139a:	9f4e                	add	t5,t5,s3
    139c:	9ece                	add	t4,t4,s3
    139e:	9e4e                	add	t3,t3,s3
    13a0:	934e                	add	t1,t1,s3
    13a2:	98ce                	add	a7,a7,s3
    13a4:	93ce                	add	t2,t2,s3
    13a6:	984e                	add	a6,a6,s3
    13a8:	954e                	add	a0,a0,s3
    13aa:	95ce                	add	a1,a1,s3
    13ac:	96ce                	add	a3,a3,s3
    13ae:	00074083          	lbu	ra,0(a4)
    13b2:	0002c283          	lbu	t0,0(t0)
    13b6:	000fcf83          	lbu	t6,0(t6)
    13ba:	000f4f03          	lbu	t5,0(t5)
    13be:	000ece83          	lbu	t4,0(t4)
    13c2:	000e4e03          	lbu	t3,0(t3)
    13c6:	00034303          	lbu	t1,0(t1)
    13ca:	0008c883          	lbu	a7,0(a7)
    13ce:	0003c383          	lbu	t2,0(t2)
    13d2:	00084803          	lbu	a6,0(a6)
    13d6:	00054503          	lbu	a0,0(a0)
    13da:	0005c583          	lbu	a1,0(a1)
    13de:	0006c683          	lbu	a3,0(a3)
    13e2:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13e6:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13ea:	9371                	srl	a4,a4,0x3c
    13ec:	8bbd                	and	a5,a5,15
    13ee:	974e                	add	a4,a4,s3
    13f0:	97ce                	add	a5,a5,s3
    13f2:	005105a3          	sb	t0,11(sp)
    13f6:	01f10623          	sb	t6,12(sp)
    13fa:	01e106a3          	sb	t5,13(sp)
    13fe:	01d10723          	sb	t4,14(sp)
    1402:	01c107a3          	sb	t3,15(sp)
    1406:	00610823          	sb	t1,16(sp)
    140a:	011108a3          	sb	a7,17(sp)
    140e:	00710923          	sb	t2,18(sp)
    1412:	010109a3          	sb	a6,19(sp)
    1416:	00a10a23          	sb	a0,20(sp)
    141a:	00b10aa3          	sb	a1,21(sp)
    141e:	00d10b23          	sb	a3,22(sp)
    1422:	00110ba3          	sb	ra,23(sp)
    1426:	00810523          	sb	s0,10(sp)
    142a:	00074703          	lbu	a4,0(a4)
    142e:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1432:	002c                	add	a1,sp,8
    1434:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1436:	00e10c23          	sb	a4,24(sp)
    143a:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    143e:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1442:	7cc000ef          	jal	1c0e <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1446:	00248513          	add	a0,s1,2
        if (!*s)
    144a:	00054783          	lbu	a5,0(a0)
    144e:	e8079ce3          	bnez	a5,12e6 <printf+0x4c>
    }
    va_end(ap);
}
    1452:	70e6                	ld	ra,120(sp)
    1454:	7446                	ld	s0,112(sp)
    1456:	74a6                	ld	s1,104(sp)
    1458:	7906                	ld	s2,96(sp)
    145a:	69e6                	ld	s3,88(sp)
    145c:	6a46                	ld	s4,80(sp)
    145e:	6aa6                	ld	s5,72(sp)
    1460:	6b06                	ld	s6,64(sp)
    1462:	7be2                	ld	s7,56(sp)
    1464:	6129                	add	sp,sp,192
    1466:	8082                	ret
    1468:	84b2                	mv	s1,a2
    146a:	a039                	j	1478 <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    146c:	0024c783          	lbu	a5,2(s1)
    1470:	0605                	add	a2,a2,1
    1472:	0489                	add	s1,s1,2
    1474:	e92791e3          	bne	a5,s2,12f6 <printf+0x5c>
    1478:	0014c783          	lbu	a5,1(s1)
    147c:	ff2788e3          	beq	a5,s2,146c <printf+0x1d2>
        l = z - a;
    1480:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1484:	85aa                	mv	a1,a0
    1486:	8622                	mv	a2,s0
    1488:	4505                	li	a0,1
    148a:	784000ef          	jal	1c0e <write>
        if (l)
    148e:	e6040de3          	beqz	s0,1308 <printf+0x6e>
    1492:	8526                	mv	a0,s1
    1494:	b5a9                	j	12de <printf+0x44>
        switch (s[1])
    1496:	05779963          	bne	a5,s7,14e8 <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    149a:	6782                	ld	a5,0(sp)
    149c:	45c1                	li	a1,16
    149e:	4388                	lw	a0,0(a5)
    14a0:	07a1                	add	a5,a5,8
    14a2:	e03e                	sd	a5,0(sp)
    14a4:	bb7ff0ef          	jal	105a <printint.constprop.0>
        s += 2;
    14a8:	00248513          	add	a0,s1,2
    14ac:	bf79                	j	144a <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    14ae:	6782                	ld	a5,0(sp)
    14b0:	6380                	ld	s0,0(a5)
    14b2:	07a1                	add	a5,a5,8
    14b4:	e03e                	sd	a5,0(sp)
    14b6:	cc21                	beqz	s0,150e <printf+0x274>
            l = strnlen(a, 200);
    14b8:	0c800593          	li	a1,200
    14bc:	8522                	mv	a0,s0
    14be:	44e000ef          	jal	190c <strnlen>
    write(f, s, l);
    14c2:	0005061b          	sext.w	a2,a0
    14c6:	85a2                	mv	a1,s0
    14c8:	4505                	li	a0,1
    14ca:	744000ef          	jal	1c0e <write>
        s += 2;
    14ce:	00248513          	add	a0,s1,2
    14d2:	bfa5                	j	144a <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    14d4:	6782                	ld	a5,0(sp)
    14d6:	45a9                	li	a1,10
    14d8:	4388                	lw	a0,0(a5)
    14da:	07a1                	add	a5,a5,8
    14dc:	e03e                	sd	a5,0(sp)
    14de:	b7dff0ef          	jal	105a <printint.constprop.0>
        s += 2;
    14e2:	00248513          	add	a0,s1,2
    14e6:	b795                	j	144a <printf+0x1b0>
    return write(stdout, &byte, 1);
    14e8:	4605                	li	a2,1
    14ea:	002c                	add	a1,sp,8
    14ec:	4505                	li	a0,1
    char byte = c;
    14ee:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    14f2:	71c000ef          	jal	1c0e <write>
    char byte = c;
    14f6:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    14fa:	4605                	li	a2,1
    14fc:	002c                	add	a1,sp,8
    14fe:	4505                	li	a0,1
    char byte = c;
    1500:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1504:	70a000ef          	jal	1c0e <write>
        s += 2;
    1508:	00248513          	add	a0,s1,2
    150c:	bf3d                	j	144a <printf+0x1b0>
                a = "(null)";
    150e:	00001417          	auipc	s0,0x1
    1512:	9aa40413          	add	s0,s0,-1622 # 1eb8 <__clone+0x72>
    1516:	b74d                	j	14b8 <printf+0x21e>

0000000000001518 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1518:	02000793          	li	a5,32
    151c:	00f50663          	beq	a0,a5,1528 <isspace+0x10>
    1520:	355d                	addw	a0,a0,-9
    1522:	00553513          	sltiu	a0,a0,5
    1526:	8082                	ret
    1528:	4505                	li	a0,1
}
    152a:	8082                	ret

000000000000152c <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    152c:	fd05051b          	addw	a0,a0,-48
}
    1530:	00a53513          	sltiu	a0,a0,10
    1534:	8082                	ret

0000000000001536 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1536:	02000713          	li	a4,32
    153a:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    153c:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1540:	ff76879b          	addw	a5,a3,-9
    1544:	06e68063          	beq	a3,a4,15a4 <atoi+0x6e>
    1548:	0006859b          	sext.w	a1,a3
    154c:	04f67c63          	bgeu	a2,a5,15a4 <atoi+0x6e>
        s++;
    switch (*s)
    1550:	02b00793          	li	a5,43
    1554:	06f68563          	beq	a3,a5,15be <atoi+0x88>
    1558:	02d00793          	li	a5,45
    155c:	04f69663          	bne	a3,a5,15a8 <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1560:	00154683          	lbu	a3,1(a0)
    1564:	47a5                	li	a5,9
        s++;
    1566:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    156a:	fd06869b          	addw	a3,a3,-48
    156e:	8636                	mv	a2,a3
    while (isdigit(*s))
    1570:	04d7e563          	bltu	a5,a3,15ba <atoi+0x84>
        neg = 1;
    1574:	4885                	li	a7,1
    int n = 0, neg = 0;
    1576:	4501                	li	a0,0
    while (isdigit(*s))
    1578:	4825                	li	a6,9
    157a:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    157e:	0025179b          	sllw	a5,a0,0x2
    1582:	9fa9                	addw	a5,a5,a0
    1584:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    1588:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    158c:	85b2                	mv	a1,a2
    158e:	40c7853b          	subw	a0,a5,a2
    1592:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    1594:	8636                	mv	a2,a3
    while (isdigit(*s))
    1596:	fed872e3          	bgeu	a6,a3,157a <atoi+0x44>
    return neg ? n : -n;
    159a:	02089163          	bnez	a7,15bc <atoi+0x86>
    159e:	40f5853b          	subw	a0,a1,a5
    15a2:	8082                	ret
        s++;
    15a4:	0505                	add	a0,a0,1
    15a6:	bf59                	j	153c <atoi+0x6>
    while (isdigit(*s))
    15a8:	fd05859b          	addw	a1,a1,-48
    15ac:	47a5                	li	a5,9
    15ae:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    15b0:	4881                	li	a7,0
    15b2:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    15b6:	fcb7f0e3          	bgeu	a5,a1,1576 <atoi+0x40>
    return neg ? n : -n;
    15ba:	4501                	li	a0,0
}
    15bc:	8082                	ret
    while (isdigit(*s))
    15be:	00154683          	lbu	a3,1(a0)
    15c2:	47a5                	li	a5,9
        s++;
    15c4:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    15c8:	fd06869b          	addw	a3,a3,-48
    15cc:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    15ce:	4881                	li	a7,0
    while (isdigit(*s))
    15d0:	fad7f3e3          	bgeu	a5,a3,1576 <atoi+0x40>
    return neg ? n : -n;
    15d4:	4501                	li	a0,0
    15d6:	8082                	ret

00000000000015d8 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    15d8:	16060f63          	beqz	a2,1756 <memset+0x17e>
    15dc:	40a006b3          	neg	a3,a0
    15e0:	0076f793          	and	a5,a3,7
    15e4:	00778813          	add	a6,a5,7
    15e8:	48ad                	li	a7,11
    15ea:	0ff5f713          	zext.b	a4,a1
    15ee:	fff60593          	add	a1,a2,-1
    15f2:	17186363          	bltu	a6,a7,1758 <memset+0x180>
    15f6:	1705eb63          	bltu	a1,a6,176c <memset+0x194>
    15fa:	16078163          	beqz	a5,175c <memset+0x184>
    15fe:	00e50023          	sb	a4,0(a0)
    1602:	0066f593          	and	a1,a3,6
    1606:	14058e63          	beqz	a1,1762 <memset+0x18a>
    160a:	00e500a3          	sb	a4,1(a0)
    160e:	4589                	li	a1,2
    1610:	00250813          	add	a6,a0,2
    1614:	04f5f663          	bgeu	a1,a5,1660 <memset+0x88>
    1618:	00e50123          	sb	a4,2(a0)
    161c:	8a91                	and	a3,a3,4
    161e:	00350813          	add	a6,a0,3
    1622:	458d                	li	a1,3
    1624:	ce95                	beqz	a3,1660 <memset+0x88>
    1626:	00e501a3          	sb	a4,3(a0)
    162a:	4691                	li	a3,4
    162c:	00450813          	add	a6,a0,4
    1630:	4591                	li	a1,4
    1632:	02f6f763          	bgeu	a3,a5,1660 <memset+0x88>
    1636:	00e50223          	sb	a4,4(a0)
    163a:	4695                	li	a3,5
    163c:	00550813          	add	a6,a0,5
    1640:	4595                	li	a1,5
    1642:	00d78f63          	beq	a5,a3,1660 <memset+0x88>
    1646:	00e502a3          	sb	a4,5(a0)
    164a:	469d                	li	a3,7
    164c:	00650813          	add	a6,a0,6
    1650:	4599                	li	a1,6
    1652:	00d79763          	bne	a5,a3,1660 <memset+0x88>
    1656:	00750813          	add	a6,a0,7
    165a:	00e50323          	sb	a4,6(a0)
    165e:	459d                	li	a1,7
    1660:	00871693          	sll	a3,a4,0x8
    1664:	01071313          	sll	t1,a4,0x10
    1668:	8ed9                	or	a3,a3,a4
    166a:	01871893          	sll	a7,a4,0x18
    166e:	0066e6b3          	or	a3,a3,t1
    1672:	0116e6b3          	or	a3,a3,a7
    1676:	02071313          	sll	t1,a4,0x20
    167a:	02871893          	sll	a7,a4,0x28
    167e:	0066e6b3          	or	a3,a3,t1
    1682:	40f60e33          	sub	t3,a2,a5
    1686:	03071313          	sll	t1,a4,0x30
    168a:	0116e6b3          	or	a3,a3,a7
    168e:	0066e6b3          	or	a3,a3,t1
    1692:	03871893          	sll	a7,a4,0x38
    1696:	97aa                	add	a5,a5,a0
    1698:	ff8e7313          	and	t1,t3,-8
    169c:	0116e6b3          	or	a3,a3,a7
    16a0:	00f308b3          	add	a7,t1,a5
    16a4:	e394                	sd	a3,0(a5)
    16a6:	07a1                	add	a5,a5,8
    16a8:	ff179ee3          	bne	a5,a7,16a4 <memset+0xcc>
    16ac:	006806b3          	add	a3,a6,t1
    16b0:	00b307bb          	addw	a5,t1,a1
    16b4:	0bc30b63          	beq	t1,t3,176a <memset+0x192>
    16b8:	00e68023          	sb	a4,0(a3)
    16bc:	0017859b          	addw	a1,a5,1
    16c0:	08c5fb63          	bgeu	a1,a2,1756 <memset+0x17e>
    16c4:	00e680a3          	sb	a4,1(a3)
    16c8:	0027859b          	addw	a1,a5,2
    16cc:	08c5f563          	bgeu	a1,a2,1756 <memset+0x17e>
    16d0:	00e68123          	sb	a4,2(a3)
    16d4:	0037859b          	addw	a1,a5,3
    16d8:	06c5ff63          	bgeu	a1,a2,1756 <memset+0x17e>
    16dc:	00e681a3          	sb	a4,3(a3)
    16e0:	0047859b          	addw	a1,a5,4
    16e4:	06c5f963          	bgeu	a1,a2,1756 <memset+0x17e>
    16e8:	00e68223          	sb	a4,4(a3)
    16ec:	0057859b          	addw	a1,a5,5
    16f0:	06c5f363          	bgeu	a1,a2,1756 <memset+0x17e>
    16f4:	00e682a3          	sb	a4,5(a3)
    16f8:	0067859b          	addw	a1,a5,6
    16fc:	04c5fd63          	bgeu	a1,a2,1756 <memset+0x17e>
    1700:	00e68323          	sb	a4,6(a3)
    1704:	0077859b          	addw	a1,a5,7
    1708:	04c5f763          	bgeu	a1,a2,1756 <memset+0x17e>
    170c:	00e683a3          	sb	a4,7(a3)
    1710:	0087859b          	addw	a1,a5,8
    1714:	04c5f163          	bgeu	a1,a2,1756 <memset+0x17e>
    1718:	00e68423          	sb	a4,8(a3)
    171c:	0097859b          	addw	a1,a5,9
    1720:	02c5fb63          	bgeu	a1,a2,1756 <memset+0x17e>
    1724:	00e684a3          	sb	a4,9(a3)
    1728:	00a7859b          	addw	a1,a5,10
    172c:	02c5f563          	bgeu	a1,a2,1756 <memset+0x17e>
    1730:	00e68523          	sb	a4,10(a3)
    1734:	00b7859b          	addw	a1,a5,11
    1738:	00c5ff63          	bgeu	a1,a2,1756 <memset+0x17e>
    173c:	00e685a3          	sb	a4,11(a3)
    1740:	00c7859b          	addw	a1,a5,12
    1744:	00c5f963          	bgeu	a1,a2,1756 <memset+0x17e>
    1748:	00e68623          	sb	a4,12(a3)
    174c:	27b5                	addw	a5,a5,13
    174e:	00c7f463          	bgeu	a5,a2,1756 <memset+0x17e>
    1752:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    1756:	8082                	ret
    1758:	482d                	li	a6,11
    175a:	bd71                	j	15f6 <memset+0x1e>
    char *p = dest;
    175c:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    175e:	4581                	li	a1,0
    1760:	b701                	j	1660 <memset+0x88>
    1762:	00150813          	add	a6,a0,1
    1766:	4585                	li	a1,1
    1768:	bde5                	j	1660 <memset+0x88>
    176a:	8082                	ret
    char *p = dest;
    176c:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    176e:	4781                	li	a5,0
    1770:	b7a1                	j	16b8 <memset+0xe0>

0000000000001772 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1772:	00054783          	lbu	a5,0(a0)
    1776:	0005c703          	lbu	a4,0(a1)
    177a:	00e79863          	bne	a5,a4,178a <strcmp+0x18>
    177e:	0505                	add	a0,a0,1
    1780:	0585                	add	a1,a1,1
    1782:	fbe5                	bnez	a5,1772 <strcmp>
    1784:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1786:	9d19                	subw	a0,a0,a4
    1788:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    178a:	0007851b          	sext.w	a0,a5
    178e:	bfe5                	j	1786 <strcmp+0x14>

0000000000001790 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1790:	ca15                	beqz	a2,17c4 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1792:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1796:	167d                	add	a2,a2,-1
    1798:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    179c:	eb99                	bnez	a5,17b2 <strncmp+0x22>
    179e:	a815                	j	17d2 <strncmp+0x42>
    17a0:	00a68e63          	beq	a3,a0,17bc <strncmp+0x2c>
    17a4:	0505                	add	a0,a0,1
    17a6:	00f71b63          	bne	a4,a5,17bc <strncmp+0x2c>
    17aa:	00054783          	lbu	a5,0(a0)
    17ae:	cf89                	beqz	a5,17c8 <strncmp+0x38>
    17b0:	85b2                	mv	a1,a2
    17b2:	0005c703          	lbu	a4,0(a1)
    17b6:	00158613          	add	a2,a1,1
    17ba:	f37d                	bnez	a4,17a0 <strncmp+0x10>
        ;
    return *l - *r;
    17bc:	0007851b          	sext.w	a0,a5
    17c0:	9d19                	subw	a0,a0,a4
    17c2:	8082                	ret
        return 0;
    17c4:	4501                	li	a0,0
}
    17c6:	8082                	ret
    return *l - *r;
    17c8:	0015c703          	lbu	a4,1(a1)
    17cc:	4501                	li	a0,0
    17ce:	9d19                	subw	a0,a0,a4
    17d0:	8082                	ret
    17d2:	0005c703          	lbu	a4,0(a1)
    17d6:	4501                	li	a0,0
    17d8:	b7e5                	j	17c0 <strncmp+0x30>

00000000000017da <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    17da:	00757793          	and	a5,a0,7
    17de:	cf89                	beqz	a5,17f8 <strlen+0x1e>
    17e0:	87aa                	mv	a5,a0
    17e2:	a029                	j	17ec <strlen+0x12>
    17e4:	0785                	add	a5,a5,1
    17e6:	0077f713          	and	a4,a5,7
    17ea:	cb01                	beqz	a4,17fa <strlen+0x20>
        if (!*s)
    17ec:	0007c703          	lbu	a4,0(a5)
    17f0:	fb75                	bnez	a4,17e4 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    17f2:	40a78533          	sub	a0,a5,a0
}
    17f6:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    17f8:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    17fa:	feff05b7          	lui	a1,0xfeff0
    17fe:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefee037>
    1802:	f0101637          	lui	a2,0xf0101
    1806:	05c2                	sll	a1,a1,0x10
    1808:	0612                	sll	a2,a2,0x4
    180a:	6394                	ld	a3,0(a5)
    180c:	eff58593          	add	a1,a1,-257
    1810:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff239>
    1814:	05c2                	sll	a1,a1,0x10
    1816:	0642                	sll	a2,a2,0x10
    1818:	eff58593          	add	a1,a1,-257
    181c:	10160613          	add	a2,a2,257
    1820:	00b68733          	add	a4,a3,a1
    1824:	063e                	sll	a2,a2,0xf
    1826:	fff6c693          	not	a3,a3
    182a:	8f75                	and	a4,a4,a3
    182c:	08060613          	add	a2,a2,128
    1830:	8f71                	and	a4,a4,a2
    1832:	eb11                	bnez	a4,1846 <strlen+0x6c>
    1834:	6794                	ld	a3,8(a5)
    1836:	07a1                	add	a5,a5,8
    1838:	00b68733          	add	a4,a3,a1
    183c:	fff6c693          	not	a3,a3
    1840:	8f75                	and	a4,a4,a3
    1842:	8f71                	and	a4,a4,a2
    1844:	db65                	beqz	a4,1834 <strlen+0x5a>
    for (; *s; s++)
    1846:	0007c703          	lbu	a4,0(a5)
    184a:	d745                	beqz	a4,17f2 <strlen+0x18>
    184c:	0017c703          	lbu	a4,1(a5)
    1850:	0785                	add	a5,a5,1
    1852:	d345                	beqz	a4,17f2 <strlen+0x18>
    1854:	0017c703          	lbu	a4,1(a5)
    1858:	0785                	add	a5,a5,1
    185a:	fb6d                	bnez	a4,184c <strlen+0x72>
    185c:	bf59                	j	17f2 <strlen+0x18>

000000000000185e <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    185e:	00757713          	and	a4,a0,7
{
    1862:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1864:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1868:	cb19                	beqz	a4,187e <memchr+0x20>
    186a:	ce59                	beqz	a2,1908 <memchr+0xaa>
    186c:	0007c703          	lbu	a4,0(a5)
    1870:	00b70963          	beq	a4,a1,1882 <memchr+0x24>
    1874:	0785                	add	a5,a5,1
    1876:	0077f713          	and	a4,a5,7
    187a:	167d                	add	a2,a2,-1
    187c:	f77d                	bnez	a4,186a <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    187e:	4501                	li	a0,0
    if (n && *s != c)
    1880:	c649                	beqz	a2,190a <memchr+0xac>
    1882:	0007c703          	lbu	a4,0(a5)
    1886:	06b70663          	beq	a4,a1,18f2 <memchr+0x94>
        size_t k = ONES * c;
    188a:	01010737          	lui	a4,0x1010
    188e:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e239>
    1892:	0742                	sll	a4,a4,0x10
    1894:	10170713          	add	a4,a4,257
    1898:	0742                	sll	a4,a4,0x10
    189a:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    189e:	469d                	li	a3,7
        size_t k = ONES * c;
    18a0:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18a4:	04c6f763          	bgeu	a3,a2,18f2 <memchr+0x94>
    18a8:	f0101837          	lui	a6,0xf0101
    18ac:	feff08b7          	lui	a7,0xfeff0
    18b0:	0812                	sll	a6,a6,0x4
    18b2:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefee037>
    18b6:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff239>
    18ba:	08c2                	sll	a7,a7,0x10
    18bc:	0842                	sll	a6,a6,0x10
    18be:	eff88893          	add	a7,a7,-257
    18c2:	10180813          	add	a6,a6,257
    18c6:	08c2                	sll	a7,a7,0x10
    18c8:	083e                	sll	a6,a6,0xf
    18ca:	eff88893          	add	a7,a7,-257
    18ce:	08080813          	add	a6,a6,128
    18d2:	431d                	li	t1,7
    18d4:	a029                	j	18de <memchr+0x80>
    18d6:	1661                	add	a2,a2,-8
    18d8:	07a1                	add	a5,a5,8
    18da:	02c37663          	bgeu	t1,a2,1906 <memchr+0xa8>
    18de:	6398                	ld	a4,0(a5)
    18e0:	8f29                	xor	a4,a4,a0
    18e2:	011706b3          	add	a3,a4,a7
    18e6:	fff74713          	not	a4,a4
    18ea:	8f75                	and	a4,a4,a3
    18ec:	01077733          	and	a4,a4,a6
    18f0:	d37d                	beqz	a4,18d6 <memchr+0x78>
        s = (const void *)w;
    18f2:	853e                	mv	a0,a5
    18f4:	a019                	j	18fa <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    18f6:	0505                	add	a0,a0,1
    18f8:	ca01                	beqz	a2,1908 <memchr+0xaa>
    18fa:	00054783          	lbu	a5,0(a0)
    18fe:	167d                	add	a2,a2,-1
    1900:	feb79be3          	bne	a5,a1,18f6 <memchr+0x98>
    1904:	8082                	ret
    1906:	f675                	bnez	a2,18f2 <memchr+0x94>
    return n ? (void *)s : 0;
    1908:	4501                	li	a0,0
}
    190a:	8082                	ret

000000000000190c <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    190c:	1101                	add	sp,sp,-32
    190e:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1910:	862e                	mv	a2,a1
{
    1912:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1914:	4581                	li	a1,0
{
    1916:	e426                	sd	s1,8(sp)
    1918:	ec06                	sd	ra,24(sp)
    191a:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    191c:	f43ff0ef          	jal	185e <memchr>
    return p ? p - s : n;
    1920:	c519                	beqz	a0,192e <strnlen+0x22>
}
    1922:	60e2                	ld	ra,24(sp)
    1924:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1926:	8d05                	sub	a0,a0,s1
}
    1928:	64a2                	ld	s1,8(sp)
    192a:	6105                	add	sp,sp,32
    192c:	8082                	ret
    192e:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1930:	8522                	mv	a0,s0
}
    1932:	6442                	ld	s0,16(sp)
    1934:	64a2                	ld	s1,8(sp)
    1936:	6105                	add	sp,sp,32
    1938:	8082                	ret

000000000000193a <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    193a:	00b547b3          	xor	a5,a0,a1
    193e:	8b9d                	and	a5,a5,7
    1940:	efb1                	bnez	a5,199c <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1942:	0075f793          	and	a5,a1,7
    1946:	ebb5                	bnez	a5,19ba <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1948:	feff0637          	lui	a2,0xfeff0
    194c:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefee037>
    1950:	f01016b7          	lui	a3,0xf0101
    1954:	0642                	sll	a2,a2,0x10
    1956:	0692                	sll	a3,a3,0x4
    1958:	6198                	ld	a4,0(a1)
    195a:	eff60613          	add	a2,a2,-257
    195e:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff239>
    1962:	0642                	sll	a2,a2,0x10
    1964:	06c2                	sll	a3,a3,0x10
    1966:	eff60613          	add	a2,a2,-257
    196a:	10168693          	add	a3,a3,257
    196e:	00c707b3          	add	a5,a4,a2
    1972:	fff74813          	not	a6,a4
    1976:	06be                	sll	a3,a3,0xf
    1978:	0107f7b3          	and	a5,a5,a6
    197c:	08068693          	add	a3,a3,128
    1980:	8ff5                	and	a5,a5,a3
    1982:	ef89                	bnez	a5,199c <strcpy+0x62>
    1984:	05a1                	add	a1,a1,8
    1986:	e118                	sd	a4,0(a0)
    1988:	6198                	ld	a4,0(a1)
    198a:	0521                	add	a0,a0,8
    198c:	00c707b3          	add	a5,a4,a2
    1990:	fff74813          	not	a6,a4
    1994:	0107f7b3          	and	a5,a5,a6
    1998:	8ff5                	and	a5,a5,a3
    199a:	d7ed                	beqz	a5,1984 <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    199c:	0005c783          	lbu	a5,0(a1)
    19a0:	00f50023          	sb	a5,0(a0)
    19a4:	c785                	beqz	a5,19cc <strcpy+0x92>
    19a6:	0015c783          	lbu	a5,1(a1)
    19aa:	0505                	add	a0,a0,1
    19ac:	0585                	add	a1,a1,1
    19ae:	00f50023          	sb	a5,0(a0)
    19b2:	fbf5                	bnez	a5,19a6 <strcpy+0x6c>
        ;
    return d;
}
    19b4:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19b6:	0505                	add	a0,a0,1
    19b8:	db41                	beqz	a4,1948 <strcpy+0xe>
            if (!(*d = *s))
    19ba:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19be:	0585                	add	a1,a1,1
    19c0:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    19c4:	00f50023          	sb	a5,0(a0)
    19c8:	f7fd                	bnez	a5,19b6 <strcpy+0x7c>
}
    19ca:	8082                	ret
    19cc:	8082                	ret

00000000000019ce <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19ce:	00b547b3          	xor	a5,a0,a1
    19d2:	8b9d                	and	a5,a5,7
    19d4:	efbd                	bnez	a5,1a52 <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19d6:	0075f793          	and	a5,a1,7
    19da:	1c078563          	beqz	a5,1ba4 <strncpy+0x1d6>
    19de:	ea11                	bnez	a2,19f2 <strncpy+0x24>
    19e0:	8082                	ret
    19e2:	0585                	add	a1,a1,1
    19e4:	0075f793          	and	a5,a1,7
    19e8:	167d                	add	a2,a2,-1
    19ea:	0505                	add	a0,a0,1
    19ec:	1a078c63          	beqz	a5,1ba4 <strncpy+0x1d6>
    19f0:	ca3d                	beqz	a2,1a66 <strncpy+0x98>
    19f2:	0005c783          	lbu	a5,0(a1)
    19f6:	00f50023          	sb	a5,0(a0)
    19fa:	f7e5                	bnez	a5,19e2 <strncpy+0x14>
            ;
        if (!n || !*s)
    19fc:	0005c783          	lbu	a5,0(a1)
    1a00:	c7a5                	beqz	a5,1a68 <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a02:	479d                	li	a5,7
    1a04:	04c7f863          	bgeu	a5,a2,1a54 <strncpy+0x86>
    1a08:	f01016b7          	lui	a3,0xf0101
    1a0c:	feff0837          	lui	a6,0xfeff0
    1a10:	0692                	sll	a3,a3,0x4
    1a12:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefee037>
    1a16:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff239>
    1a1a:	0842                	sll	a6,a6,0x10
    1a1c:	06c2                	sll	a3,a3,0x10
    1a1e:	eff80813          	add	a6,a6,-257
    1a22:	10168693          	add	a3,a3,257
    1a26:	0842                	sll	a6,a6,0x10
    1a28:	06be                	sll	a3,a3,0xf
    1a2a:	eff80813          	add	a6,a6,-257
    1a2e:	08068693          	add	a3,a3,128
    1a32:	431d                	li	t1,7
    1a34:	6198                	ld	a4,0(a1)
    1a36:	010707b3          	add	a5,a4,a6
    1a3a:	fff74893          	not	a7,a4
    1a3e:	0117f7b3          	and	a5,a5,a7
    1a42:	8ff5                	and	a5,a5,a3
    1a44:	eb81                	bnez	a5,1a54 <strncpy+0x86>
            *wd = *ws;
    1a46:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a48:	1661                	add	a2,a2,-8
    1a4a:	05a1                	add	a1,a1,8
    1a4c:	0521                	add	a0,a0,8
    1a4e:	fec363e3          	bltu	t1,a2,1a34 <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1a52:	ca11                	beqz	a2,1a66 <strncpy+0x98>
    1a54:	0005c783          	lbu	a5,0(a1)
    1a58:	0585                	add	a1,a1,1
    1a5a:	00f50023          	sb	a5,0(a0)
    1a5e:	c789                	beqz	a5,1a68 <strncpy+0x9a>
    1a60:	167d                	add	a2,a2,-1
    1a62:	0505                	add	a0,a0,1
    1a64:	fa65                	bnez	a2,1a54 <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1a66:	8082                	ret
    1a68:	40a00733          	neg	a4,a0
    1a6c:	00777793          	and	a5,a4,7
    1a70:	00778693          	add	a3,a5,7
    1a74:	482d                	li	a6,11
    1a76:	fff60593          	add	a1,a2,-1
    1a7a:	1106ef63          	bltu	a3,a6,1b98 <strncpy+0x1ca>
    1a7e:	12d5ee63          	bltu	a1,a3,1bba <strncpy+0x1ec>
    1a82:	12078563          	beqz	a5,1bac <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a86:	00050023          	sb	zero,0(a0)
    1a8a:	00677693          	and	a3,a4,6
    1a8e:	12068263          	beqz	a3,1bb2 <strncpy+0x1e4>
    1a92:	000500a3          	sb	zero,1(a0)
    1a96:	4689                	li	a3,2
    1a98:	12f6f463          	bgeu	a3,a5,1bc0 <strncpy+0x1f2>
    1a9c:	00050123          	sb	zero,2(a0)
    1aa0:	8b11                	and	a4,a4,4
    1aa2:	cf6d                	beqz	a4,1b9c <strncpy+0x1ce>
    1aa4:	000501a3          	sb	zero,3(a0)
    1aa8:	4711                	li	a4,4
    1aaa:	00450693          	add	a3,a0,4
    1aae:	02f77363          	bgeu	a4,a5,1ad4 <strncpy+0x106>
    1ab2:	00050223          	sb	zero,4(a0)
    1ab6:	4715                	li	a4,5
    1ab8:	00550693          	add	a3,a0,5
    1abc:	00e78c63          	beq	a5,a4,1ad4 <strncpy+0x106>
    1ac0:	000502a3          	sb	zero,5(a0)
    1ac4:	471d                	li	a4,7
    1ac6:	10e79163          	bne	a5,a4,1bc8 <strncpy+0x1fa>
    1aca:	00750693          	add	a3,a0,7
    1ace:	00050323          	sb	zero,6(a0)
    1ad2:	471d                	li	a4,7
    1ad4:	40f608b3          	sub	a7,a2,a5
    1ad8:	ff88f813          	and	a6,a7,-8
    1adc:	97aa                	add	a5,a5,a0
    1ade:	010785b3          	add	a1,a5,a6
    1ae2:	0007b023          	sd	zero,0(a5)
    1ae6:	07a1                	add	a5,a5,8
    1ae8:	feb79de3          	bne	a5,a1,1ae2 <strncpy+0x114>
    1aec:	00e807bb          	addw	a5,a6,a4
    1af0:	01068733          	add	a4,a3,a6
    1af4:	0b088b63          	beq	a7,a6,1baa <strncpy+0x1dc>
    1af8:	00070023          	sb	zero,0(a4)
    1afc:	0017869b          	addw	a3,a5,1
    1b00:	f6c6f3e3          	bgeu	a3,a2,1a66 <strncpy+0x98>
    1b04:	000700a3          	sb	zero,1(a4)
    1b08:	0027869b          	addw	a3,a5,2
    1b0c:	f4c6fde3          	bgeu	a3,a2,1a66 <strncpy+0x98>
    1b10:	00070123          	sb	zero,2(a4)
    1b14:	0037869b          	addw	a3,a5,3
    1b18:	f4c6f7e3          	bgeu	a3,a2,1a66 <strncpy+0x98>
    1b1c:	000701a3          	sb	zero,3(a4)
    1b20:	0047869b          	addw	a3,a5,4
    1b24:	f4c6f1e3          	bgeu	a3,a2,1a66 <strncpy+0x98>
    1b28:	00070223          	sb	zero,4(a4)
    1b2c:	0057869b          	addw	a3,a5,5
    1b30:	f2c6fbe3          	bgeu	a3,a2,1a66 <strncpy+0x98>
    1b34:	000702a3          	sb	zero,5(a4)
    1b38:	0067869b          	addw	a3,a5,6
    1b3c:	f2c6f5e3          	bgeu	a3,a2,1a66 <strncpy+0x98>
    1b40:	00070323          	sb	zero,6(a4)
    1b44:	0077869b          	addw	a3,a5,7
    1b48:	f0c6ffe3          	bgeu	a3,a2,1a66 <strncpy+0x98>
    1b4c:	000703a3          	sb	zero,7(a4)
    1b50:	0087869b          	addw	a3,a5,8
    1b54:	f0c6f9e3          	bgeu	a3,a2,1a66 <strncpy+0x98>
    1b58:	00070423          	sb	zero,8(a4)
    1b5c:	0097869b          	addw	a3,a5,9
    1b60:	f0c6f3e3          	bgeu	a3,a2,1a66 <strncpy+0x98>
    1b64:	000704a3          	sb	zero,9(a4)
    1b68:	00a7869b          	addw	a3,a5,10
    1b6c:	eec6fde3          	bgeu	a3,a2,1a66 <strncpy+0x98>
    1b70:	00070523          	sb	zero,10(a4)
    1b74:	00b7869b          	addw	a3,a5,11
    1b78:	eec6f7e3          	bgeu	a3,a2,1a66 <strncpy+0x98>
    1b7c:	000705a3          	sb	zero,11(a4)
    1b80:	00c7869b          	addw	a3,a5,12
    1b84:	eec6f1e3          	bgeu	a3,a2,1a66 <strncpy+0x98>
    1b88:	00070623          	sb	zero,12(a4)
    1b8c:	27b5                	addw	a5,a5,13
    1b8e:	ecc7fce3          	bgeu	a5,a2,1a66 <strncpy+0x98>
    1b92:	000706a3          	sb	zero,13(a4)
}
    1b96:	8082                	ret
    1b98:	46ad                	li	a3,11
    1b9a:	b5d5                	j	1a7e <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b9c:	00350693          	add	a3,a0,3
    1ba0:	470d                	li	a4,3
    1ba2:	bf0d                	j	1ad4 <strncpy+0x106>
        if (!n || !*s)
    1ba4:	e4061ce3          	bnez	a2,19fc <strncpy+0x2e>
}
    1ba8:	8082                	ret
    1baa:	8082                	ret
    char *p = dest;
    1bac:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bae:	4701                	li	a4,0
    1bb0:	b715                	j	1ad4 <strncpy+0x106>
    1bb2:	00150693          	add	a3,a0,1
    1bb6:	4705                	li	a4,1
    1bb8:	bf31                	j	1ad4 <strncpy+0x106>
    char *p = dest;
    1bba:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bbc:	4781                	li	a5,0
    1bbe:	bf2d                	j	1af8 <strncpy+0x12a>
    1bc0:	00250693          	add	a3,a0,2
    1bc4:	4709                	li	a4,2
    1bc6:	b739                	j	1ad4 <strncpy+0x106>
    1bc8:	00650693          	add	a3,a0,6
    1bcc:	4719                	li	a4,6
    1bce:	b719                	j	1ad4 <strncpy+0x106>

0000000000001bd0 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1bd0:	87aa                	mv	a5,a0
    1bd2:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1bd4:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1bd8:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1bdc:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1bde:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1be0:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1be4:	2501                	sext.w	a0,a0
    1be6:	8082                	ret

0000000000001be8 <openat>:
    register long a7 __asm__("a7") = n;
    1be8:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1bec:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1bf0:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1bf4:	2501                	sext.w	a0,a0
    1bf6:	8082                	ret

0000000000001bf8 <close>:
    register long a7 __asm__("a7") = n;
    1bf8:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1bfc:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c00:	2501                	sext.w	a0,a0
    1c02:	8082                	ret

0000000000001c04 <read>:
    register long a7 __asm__("a7") = n;
    1c04:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c08:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c0c:	8082                	ret

0000000000001c0e <write>:
    register long a7 __asm__("a7") = n;
    1c0e:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c12:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c16:	8082                	ret

0000000000001c18 <getpid>:
    register long a7 __asm__("a7") = n;
    1c18:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c1c:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c20:	2501                	sext.w	a0,a0
    1c22:	8082                	ret

0000000000001c24 <getppid>:
    register long a7 __asm__("a7") = n;
    1c24:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c28:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c2c:	2501                	sext.w	a0,a0
    1c2e:	8082                	ret

0000000000001c30 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c30:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c34:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c38:	2501                	sext.w	a0,a0
    1c3a:	8082                	ret

0000000000001c3c <fork>:
    register long a7 __asm__("a7") = n;
    1c3c:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c40:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c42:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c44:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c48:	2501                	sext.w	a0,a0
    1c4a:	8082                	ret

0000000000001c4c <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c4c:	85b2                	mv	a1,a2
    1c4e:	863a                	mv	a2,a4
    if (stack)
    1c50:	c191                	beqz	a1,1c54 <clone+0x8>
	stack += stack_size;
    1c52:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c54:	4781                	li	a5,0
    1c56:	4701                	li	a4,0
    1c58:	4681                	li	a3,0
    1c5a:	2601                	sext.w	a2,a2
    1c5c:	a2ed                	j	1e46 <__clone>

0000000000001c5e <exit>:
    register long a7 __asm__("a7") = n;
    1c5e:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c62:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1c66:	8082                	ret

0000000000001c68 <waitpid>:
    register long a7 __asm__("a7") = n;
    1c68:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1c6c:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c6e:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1c72:	2501                	sext.w	a0,a0
    1c74:	8082                	ret

0000000000001c76 <exec>:
    register long a7 __asm__("a7") = n;
    1c76:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1c7a:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1c7e:	2501                	sext.w	a0,a0
    1c80:	8082                	ret

0000000000001c82 <execve>:
    register long a7 __asm__("a7") = n;
    1c82:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c86:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1c8a:	2501                	sext.w	a0,a0
    1c8c:	8082                	ret

0000000000001c8e <times>:
    register long a7 __asm__("a7") = n;
    1c8e:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1c92:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1c96:	2501                	sext.w	a0,a0
    1c98:	8082                	ret

0000000000001c9a <get_time>:

int64 get_time()
{
    1c9a:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1c9c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1ca0:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1ca2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ca4:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1ca8:	2501                	sext.w	a0,a0
    1caa:	ed09                	bnez	a0,1cc4 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1cac:	67a2                	ld	a5,8(sp)
    1cae:	3e800713          	li	a4,1000
    1cb2:	00015503          	lhu	a0,0(sp)
    1cb6:	02e7d7b3          	divu	a5,a5,a4
    1cba:	02e50533          	mul	a0,a0,a4
    1cbe:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1cc0:	0141                	add	sp,sp,16
    1cc2:	8082                	ret
        return -1;
    1cc4:	557d                	li	a0,-1
    1cc6:	bfed                	j	1cc0 <get_time+0x26>

0000000000001cc8 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1cc8:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ccc:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1cd0:	2501                	sext.w	a0,a0
    1cd2:	8082                	ret

0000000000001cd4 <time>:
    register long a7 __asm__("a7") = n;
    1cd4:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1cd8:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1cdc:	2501                	sext.w	a0,a0
    1cde:	8082                	ret

0000000000001ce0 <sleep>:

int sleep(unsigned long long time)
{
    1ce0:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1ce2:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1ce4:	850a                	mv	a0,sp
    1ce6:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1ce8:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1cec:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cee:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1cf2:	e501                	bnez	a0,1cfa <sleep+0x1a>
    return 0;
    1cf4:	4501                	li	a0,0
}
    1cf6:	0141                	add	sp,sp,16
    1cf8:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1cfa:	4502                	lw	a0,0(sp)
}
    1cfc:	0141                	add	sp,sp,16
    1cfe:	8082                	ret

0000000000001d00 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d00:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d04:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d08:	2501                	sext.w	a0,a0
    1d0a:	8082                	ret

0000000000001d0c <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d0c:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d10:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d14:	8082                	ret

0000000000001d16 <munmap>:
    register long a7 __asm__("a7") = n;
    1d16:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d1a:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d1e:	2501                	sext.w	a0,a0
    1d20:	8082                	ret

0000000000001d22 <wait>:

int wait(int *code)
{
    1d22:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d24:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d28:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d2a:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d2c:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d2e:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d32:	2501                	sext.w	a0,a0
    1d34:	8082                	ret

0000000000001d36 <spawn>:
    register long a7 __asm__("a7") = n;
    1d36:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d3a:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d3e:	2501                	sext.w	a0,a0
    1d40:	8082                	ret

0000000000001d42 <mailread>:
    register long a7 __asm__("a7") = n;
    1d42:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d46:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d4a:	2501                	sext.w	a0,a0
    1d4c:	8082                	ret

0000000000001d4e <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d4e:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d52:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d56:	2501                	sext.w	a0,a0
    1d58:	8082                	ret

0000000000001d5a <fstat>:
    register long a7 __asm__("a7") = n;
    1d5a:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d5e:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1d62:	2501                	sext.w	a0,a0
    1d64:	8082                	ret

0000000000001d66 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1d66:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1d68:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1d6c:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d6e:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1d72:	2501                	sext.w	a0,a0
    1d74:	8082                	ret

0000000000001d76 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1d76:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1d78:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1d7c:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d7e:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1d82:	2501                	sext.w	a0,a0
    1d84:	8082                	ret

0000000000001d86 <link>:

int link(char *old_path, char *new_path)
{
    1d86:	87aa                	mv	a5,a0
    1d88:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1d8a:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1d8e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d92:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1d94:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1d98:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d9a:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1d9e:	2501                	sext.w	a0,a0
    1da0:	8082                	ret

0000000000001da2 <unlink>:

int unlink(char *path)
{
    1da2:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1da4:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1da8:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1dac:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dae:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1db2:	2501                	sext.w	a0,a0
    1db4:	8082                	ret

0000000000001db6 <uname>:
    register long a7 __asm__("a7") = n;
    1db6:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1dba:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	8082                	ret

0000000000001dc2 <brk>:
    register long a7 __asm__("a7") = n;
    1dc2:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1dc6:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1dca:	2501                	sext.w	a0,a0
    1dcc:	8082                	ret

0000000000001dce <getcwd>:
    register long a7 __asm__("a7") = n;
    1dce:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dd0:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1dd4:	8082                	ret

0000000000001dd6 <chdir>:
    register long a7 __asm__("a7") = n;
    1dd6:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1dda:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1dde:	2501                	sext.w	a0,a0
    1de0:	8082                	ret

0000000000001de2 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1de2:	862e                	mv	a2,a1
    1de4:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1de6:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1de8:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1dec:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1df0:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1df2:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df4:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1df8:	2501                	sext.w	a0,a0
    1dfa:	8082                	ret

0000000000001dfc <getdents>:
    register long a7 __asm__("a7") = n;
    1dfc:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e00:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e04:	2501                	sext.w	a0,a0
    1e06:	8082                	ret

0000000000001e08 <pipe>:
    register long a7 __asm__("a7") = n;
    1e08:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e0c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e0e:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e12:	2501                	sext.w	a0,a0
    1e14:	8082                	ret

0000000000001e16 <dup>:
    register long a7 __asm__("a7") = n;
    1e16:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e18:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e1c:	2501                	sext.w	a0,a0
    1e1e:	8082                	ret

0000000000001e20 <dup2>:
    register long a7 __asm__("a7") = n;
    1e20:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e22:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e24:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <mount>:
    register long a7 __asm__("a7") = n;
    1e2c:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e30:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <umount>:
    register long a7 __asm__("a7") = n;
    1e38:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e3c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e3e:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e42:	2501                	sext.w	a0,a0
    1e44:	8082                	ret

0000000000001e46 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e46:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1e48:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e4a:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e4c:	8532                	mv	a0,a2
	mv a2, a4
    1e4e:	863a                	mv	a2,a4
	mv a3, a5
    1e50:	86be                	mv	a3,a5
	mv a4, a6
    1e52:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e54:	0dc00893          	li	a7,220
	ecall
    1e58:	00000073          	ecall

	beqz a0, 1f
    1e5c:	c111                	beqz	a0,1e60 <__clone+0x1a>
	# Parent
	ret
    1e5e:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1e60:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1e62:	6522                	ld	a0,8(sp)
	jalr a1
    1e64:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1e66:	05d00893          	li	a7,93
	ecall
    1e6a:	00000073          	ecall
