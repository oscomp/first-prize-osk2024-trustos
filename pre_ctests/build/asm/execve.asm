
/root/oskernel2024-trustos/pre_ctests/build/riscv64/execve:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a08d                	j	1064 <__start_main>

0000000000001004 <test_execve>:
 * 测试成功则输出：
 * "  I am test_echo."
 * 测试失败则输出：
 * "  execve error."
 */
void test_execve(void){
    1004:	7179                	add	sp,sp,-48
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	e9a50513          	add	a0,a0,-358 # 1ea0 <__clone+0x2c>
void test_execve(void){
    100e:	f406                	sd	ra,40(sp)
    TEST_START(__func__);
    1010:	28c000ef          	jal	129c <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	ee450513          	add	a0,a0,-284 # 1ef8 <__func__.0>
    101c:	280000ef          	jal	129c <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	e9850513          	add	a0,a0,-360 # 1eb8 <__clone+0x44>
    1028:	274000ef          	jal	129c <puts>
    char *newargv[] = {"test_echo", NULL};
    char *newenviron[] = {NULL};
    execve("test_echo", newargv, newenviron);
    102c:	0030                	add	a2,sp,8
    102e:	080c                	add	a1,sp,16
    char *newargv[] = {"test_echo", NULL};
    1030:	00001517          	auipc	a0,0x1
    1034:	e9850513          	add	a0,a0,-360 # 1ec8 <__clone+0x54>
    1038:	e82a                	sd	a0,16(sp)
    103a:	ec02                	sd	zero,24(sp)
    char *newenviron[] = {NULL};
    103c:	e402                	sd	zero,8(sp)
    execve("test_echo", newargv, newenviron);
    103e:	473000ef          	jal	1cb0 <execve>
    printf("  execve error.\n");
    1042:	00001517          	auipc	a0,0x1
    1046:	e9650513          	add	a0,a0,-362 # 1ed8 <__clone+0x64>
    104a:	274000ef          	jal	12be <printf>
    //TEST_END(__func__);
}
    104e:	70a2                	ld	ra,40(sp)
    1050:	6145                	add	sp,sp,48
    1052:	8082                	ret

0000000000001054 <main>:

int main(void){
    1054:	1141                	add	sp,sp,-16
    1056:	e406                	sd	ra,8(sp)
    test_execve();
    1058:	fadff0ef          	jal	1004 <test_execve>
    return 0;
}
    105c:	60a2                	ld	ra,8(sp)
    105e:	4501                	li	a0,0
    1060:	0141                	add	sp,sp,16
    1062:	8082                	ret

0000000000001064 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1064:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1066:	4108                	lw	a0,0(a0)
{
    1068:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    106a:	05a1                	add	a1,a1,8
{
    106c:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    106e:	fe7ff0ef          	jal	1054 <main>
    1072:	41b000ef          	jal	1c8c <exit>
	return 0;
}
    1076:	60a2                	ld	ra,8(sp)
    1078:	4501                	li	a0,0
    107a:	0141                	add	sp,sp,16
    107c:	8082                	ret

000000000000107e <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    107e:	7179                	add	sp,sp,-48
    1080:	f406                	sd	ra,40(sp)
    1082:	0005081b          	sext.w	a6,a0
    1086:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1088:	00055563          	bgez	a0,1092 <printint.constprop.0+0x14>
        x = -xx;
    108c:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    1090:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1092:	02b8763b          	remuw	a2,a6,a1
    1096:	00001697          	auipc	a3,0x1
    109a:	e7268693          	add	a3,a3,-398 # 1f08 <digits>
    buf[16] = 0;
    109e:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10a2:	0005871b          	sext.w	a4,a1
    10a6:	1602                	sll	a2,a2,0x20
    10a8:	9201                	srl	a2,a2,0x20
    10aa:	9636                	add	a2,a2,a3
    10ac:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10b0:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    10b4:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    10b8:	10b86c63          	bltu	a6,a1,11d0 <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    10bc:	02e5763b          	remuw	a2,a0,a4
    10c0:	1602                	sll	a2,a2,0x20
    10c2:	9201                	srl	a2,a2,0x20
    10c4:	9636                	add	a2,a2,a3
    10c6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10ca:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    10ce:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    10d2:	10e56863          	bltu	a0,a4,11e2 <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    10d6:	02e5f63b          	remuw	a2,a1,a4
    10da:	1602                	sll	a2,a2,0x20
    10dc:	9201                	srl	a2,a2,0x20
    10de:	9636                	add	a2,a2,a3
    10e0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10e4:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    10e8:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    10ec:	10e5e463          	bltu	a1,a4,11f4 <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    10f0:	02e5763b          	remuw	a2,a0,a4
    10f4:	1602                	sll	a2,a2,0x20
    10f6:	9201                	srl	a2,a2,0x20
    10f8:	9636                	add	a2,a2,a3
    10fa:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10fe:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1102:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1106:	10e56063          	bltu	a0,a4,1206 <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    110a:	02e5f63b          	remuw	a2,a1,a4
    110e:	1602                	sll	a2,a2,0x20
    1110:	9201                	srl	a2,a2,0x20
    1112:	9636                	add	a2,a2,a3
    1114:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1118:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    111c:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1120:	0ee5ec63          	bltu	a1,a4,1218 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    1124:	02e5763b          	remuw	a2,a0,a4
    1128:	1602                	sll	a2,a2,0x20
    112a:	9201                	srl	a2,a2,0x20
    112c:	9636                	add	a2,a2,a3
    112e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1132:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1136:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    113a:	08e56263          	bltu	a0,a4,11be <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    113e:	02e5f63b          	remuw	a2,a1,a4
    1142:	1602                	sll	a2,a2,0x20
    1144:	9201                	srl	a2,a2,0x20
    1146:	9636                	add	a2,a2,a3
    1148:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    114c:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1150:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1154:	0ce5eb63          	bltu	a1,a4,122a <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    1158:	02e5763b          	remuw	a2,a0,a4
    115c:	1602                	sll	a2,a2,0x20
    115e:	9201                	srl	a2,a2,0x20
    1160:	9636                	add	a2,a2,a3
    1162:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1166:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    116a:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    116e:	0ce56763          	bltu	a0,a4,123c <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    1172:	02e5f63b          	remuw	a2,a1,a4
    1176:	1602                	sll	a2,a2,0x20
    1178:	9201                	srl	a2,a2,0x20
    117a:	9636                	add	a2,a2,a3
    117c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1180:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1184:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    1188:	0ce5e363          	bltu	a1,a4,124e <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    118c:	1782                	sll	a5,a5,0x20
    118e:	9381                	srl	a5,a5,0x20
    1190:	96be                	add	a3,a3,a5
    1192:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    1196:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    1198:	00f10723          	sb	a5,14(sp)
    if (sign)
    119c:	00088763          	beqz	a7,11aa <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11a0:	02d00793          	li	a5,45
    11a4:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11a8:	4595                	li	a1,5
    write(f, s, l);
    11aa:	003c                	add	a5,sp,8
    11ac:	4641                	li	a2,16
    11ae:	9e0d                	subw	a2,a2,a1
    11b0:	4505                	li	a0,1
    11b2:	95be                	add	a1,a1,a5
    11b4:	289000ef          	jal	1c3c <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11b8:	70a2                	ld	ra,40(sp)
    11ba:	6145                	add	sp,sp,48
    11bc:	8082                	ret
    i++;
    11be:	45a9                	li	a1,10
    if (sign)
    11c0:	fe0885e3          	beqz	a7,11aa <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11c4:	02d00793          	li	a5,45
    11c8:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    11cc:	45a5                	li	a1,9
    11ce:	bff1                	j	11aa <printint.constprop.0+0x12c>
    i++;
    11d0:	45bd                	li	a1,15
    if (sign)
    11d2:	fc088ce3          	beqz	a7,11aa <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11d6:	02d00793          	li	a5,45
    11da:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    11de:	45b9                	li	a1,14
    11e0:	b7e9                	j	11aa <printint.constprop.0+0x12c>
    i++;
    11e2:	45b9                	li	a1,14
    if (sign)
    11e4:	fc0883e3          	beqz	a7,11aa <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11e8:	02d00793          	li	a5,45
    11ec:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    11f0:	45b5                	li	a1,13
    11f2:	bf65                	j	11aa <printint.constprop.0+0x12c>
    i++;
    11f4:	45b5                	li	a1,13
    if (sign)
    11f6:	fa088ae3          	beqz	a7,11aa <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11fa:	02d00793          	li	a5,45
    11fe:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1202:	45b1                	li	a1,12
    1204:	b75d                	j	11aa <printint.constprop.0+0x12c>
    i++;
    1206:	45b1                	li	a1,12
    if (sign)
    1208:	fa0881e3          	beqz	a7,11aa <printint.constprop.0+0x12c>
        buf[i--] = '-';
    120c:	02d00793          	li	a5,45
    1210:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1214:	45ad                	li	a1,11
    1216:	bf51                	j	11aa <printint.constprop.0+0x12c>
    i++;
    1218:	45ad                	li	a1,11
    if (sign)
    121a:	f80888e3          	beqz	a7,11aa <printint.constprop.0+0x12c>
        buf[i--] = '-';
    121e:	02d00793          	li	a5,45
    1222:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1226:	45a9                	li	a1,10
    1228:	b749                	j	11aa <printint.constprop.0+0x12c>
    i++;
    122a:	45a5                	li	a1,9
    if (sign)
    122c:	f6088fe3          	beqz	a7,11aa <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1230:	02d00793          	li	a5,45
    1234:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1238:	45a1                	li	a1,8
    123a:	bf85                	j	11aa <printint.constprop.0+0x12c>
    i++;
    123c:	45a1                	li	a1,8
    if (sign)
    123e:	f60886e3          	beqz	a7,11aa <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1242:	02d00793          	li	a5,45
    1246:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    124a:	459d                	li	a1,7
    124c:	bfb9                	j	11aa <printint.constprop.0+0x12c>
    i++;
    124e:	459d                	li	a1,7
    if (sign)
    1250:	f4088de3          	beqz	a7,11aa <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1254:	02d00793          	li	a5,45
    1258:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    125c:	4599                	li	a1,6
    125e:	b7b1                	j	11aa <printint.constprop.0+0x12c>

0000000000001260 <getchar>:
{
    1260:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    1262:	00f10593          	add	a1,sp,15
    1266:	4605                	li	a2,1
    1268:	4501                	li	a0,0
{
    126a:	ec06                	sd	ra,24(sp)
    char byte = 0;
    126c:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1270:	1c3000ef          	jal	1c32 <read>
}
    1274:	60e2                	ld	ra,24(sp)
    1276:	00f14503          	lbu	a0,15(sp)
    127a:	6105                	add	sp,sp,32
    127c:	8082                	ret

000000000000127e <putchar>:
{
    127e:	1101                	add	sp,sp,-32
    1280:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1282:	00f10593          	add	a1,sp,15
    1286:	4605                	li	a2,1
    1288:	4505                	li	a0,1
{
    128a:	ec06                	sd	ra,24(sp)
    char byte = c;
    128c:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1290:	1ad000ef          	jal	1c3c <write>
}
    1294:	60e2                	ld	ra,24(sp)
    1296:	2501                	sext.w	a0,a0
    1298:	6105                	add	sp,sp,32
    129a:	8082                	ret

000000000000129c <puts>:
{
    129c:	1141                	add	sp,sp,-16
    129e:	e406                	sd	ra,8(sp)
    12a0:	e022                	sd	s0,0(sp)
    12a2:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12a4:	55a000ef          	jal	17fe <strlen>
    12a8:	862a                	mv	a2,a0
    12aa:	85a2                	mv	a1,s0
    12ac:	4505                	li	a0,1
    12ae:	18f000ef          	jal	1c3c <write>
}
    12b2:	60a2                	ld	ra,8(sp)
    12b4:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12b6:	957d                	sra	a0,a0,0x3f
    return r;
    12b8:	2501                	sext.w	a0,a0
}
    12ba:	0141                	add	sp,sp,16
    12bc:	8082                	ret

00000000000012be <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12be:	7131                	add	sp,sp,-192
    12c0:	e4d6                	sd	s5,72(sp)
    12c2:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12c4:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12c6:	013c                	add	a5,sp,136
{
    12c8:	f0ca                	sd	s2,96(sp)
    12ca:	ecce                	sd	s3,88(sp)
    12cc:	e8d2                	sd	s4,80(sp)
    12ce:	e0da                	sd	s6,64(sp)
    12d0:	fc5e                	sd	s7,56(sp)
    12d2:	fc86                	sd	ra,120(sp)
    12d4:	f8a2                	sd	s0,112(sp)
    12d6:	f4a6                	sd	s1,104(sp)
    12d8:	e52e                	sd	a1,136(sp)
    12da:	e932                	sd	a2,144(sp)
    12dc:	ed36                	sd	a3,152(sp)
    12de:	f13a                	sd	a4,160(sp)
    12e0:	f942                	sd	a6,176(sp)
    12e2:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    12e4:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    12e6:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    12ea:	07300a13          	li	s4,115
    12ee:	07800b93          	li	s7,120
    12f2:	06400b13          	li	s6,100
    buf[i++] = '0';
    12f6:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x5928>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12fa:	00001997          	auipc	s3,0x1
    12fe:	c0e98993          	add	s3,s3,-1010 # 1f08 <digits>
        if (!*s)
    1302:	00054783          	lbu	a5,0(a0)
    1306:	16078863          	beqz	a5,1476 <printf+0x1b8>
    130a:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    130c:	19278063          	beq	a5,s2,148c <printf+0x1ce>
    1310:	00164783          	lbu	a5,1(a2)
    1314:	0605                	add	a2,a2,1
    1316:	fbfd                	bnez	a5,130c <printf+0x4e>
    1318:	84b2                	mv	s1,a2
        l = z - a;
    131a:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    131e:	85aa                	mv	a1,a0
    1320:	8622                	mv	a2,s0
    1322:	4505                	li	a0,1
    1324:	119000ef          	jal	1c3c <write>
        if (l)
    1328:	18041763          	bnez	s0,14b6 <printf+0x1f8>
        if (s[1] == 0)
    132c:	0014c783          	lbu	a5,1(s1)
    1330:	14078363          	beqz	a5,1476 <printf+0x1b8>
        switch (s[1])
    1334:	19478f63          	beq	a5,s4,14d2 <printf+0x214>
    1338:	18fa6163          	bltu	s4,a5,14ba <printf+0x1fc>
    133c:	1b678e63          	beq	a5,s6,14f8 <printf+0x23a>
    1340:	07000713          	li	a4,112
    1344:	1ce79463          	bne	a5,a4,150c <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1348:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    134a:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    134e:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1350:	631c                	ld	a5,0(a4)
    1352:	0721                	add	a4,a4,8
    1354:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1356:	00479293          	sll	t0,a5,0x4
    135a:	00879f93          	sll	t6,a5,0x8
    135e:	00c79f13          	sll	t5,a5,0xc
    1362:	01079e93          	sll	t4,a5,0x10
    1366:	01479e13          	sll	t3,a5,0x14
    136a:	01879313          	sll	t1,a5,0x18
    136e:	01c79893          	sll	a7,a5,0x1c
    1372:	02479813          	sll	a6,a5,0x24
    1376:	02879513          	sll	a0,a5,0x28
    137a:	02c79593          	sll	a1,a5,0x2c
    137e:	03079693          	sll	a3,a5,0x30
    1382:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1386:	03c7d413          	srl	s0,a5,0x3c
    138a:	01c7d39b          	srlw	t2,a5,0x1c
    138e:	03c2d293          	srl	t0,t0,0x3c
    1392:	03cfdf93          	srl	t6,t6,0x3c
    1396:	03cf5f13          	srl	t5,t5,0x3c
    139a:	03cede93          	srl	t4,t4,0x3c
    139e:	03ce5e13          	srl	t3,t3,0x3c
    13a2:	03c35313          	srl	t1,t1,0x3c
    13a6:	03c8d893          	srl	a7,a7,0x3c
    13aa:	03c85813          	srl	a6,a6,0x3c
    13ae:	9171                	srl	a0,a0,0x3c
    13b0:	91f1                	srl	a1,a1,0x3c
    13b2:	92f1                	srl	a3,a3,0x3c
    13b4:	9371                	srl	a4,a4,0x3c
    13b6:	974e                	add	a4,a4,s3
    13b8:	944e                	add	s0,s0,s3
    13ba:	92ce                	add	t0,t0,s3
    13bc:	9fce                	add	t6,t6,s3
    13be:	9f4e                	add	t5,t5,s3
    13c0:	9ece                	add	t4,t4,s3
    13c2:	9e4e                	add	t3,t3,s3
    13c4:	934e                	add	t1,t1,s3
    13c6:	98ce                	add	a7,a7,s3
    13c8:	93ce                	add	t2,t2,s3
    13ca:	984e                	add	a6,a6,s3
    13cc:	954e                	add	a0,a0,s3
    13ce:	95ce                	add	a1,a1,s3
    13d0:	96ce                	add	a3,a3,s3
    13d2:	00074083          	lbu	ra,0(a4)
    13d6:	0002c283          	lbu	t0,0(t0)
    13da:	000fcf83          	lbu	t6,0(t6)
    13de:	000f4f03          	lbu	t5,0(t5)
    13e2:	000ece83          	lbu	t4,0(t4)
    13e6:	000e4e03          	lbu	t3,0(t3)
    13ea:	00034303          	lbu	t1,0(t1)
    13ee:	0008c883          	lbu	a7,0(a7)
    13f2:	0003c383          	lbu	t2,0(t2)
    13f6:	00084803          	lbu	a6,0(a6)
    13fa:	00054503          	lbu	a0,0(a0)
    13fe:	0005c583          	lbu	a1,0(a1)
    1402:	0006c683          	lbu	a3,0(a3)
    1406:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    140a:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    140e:	9371                	srl	a4,a4,0x3c
    1410:	8bbd                	and	a5,a5,15
    1412:	974e                	add	a4,a4,s3
    1414:	97ce                	add	a5,a5,s3
    1416:	005105a3          	sb	t0,11(sp)
    141a:	01f10623          	sb	t6,12(sp)
    141e:	01e106a3          	sb	t5,13(sp)
    1422:	01d10723          	sb	t4,14(sp)
    1426:	01c107a3          	sb	t3,15(sp)
    142a:	00610823          	sb	t1,16(sp)
    142e:	011108a3          	sb	a7,17(sp)
    1432:	00710923          	sb	t2,18(sp)
    1436:	010109a3          	sb	a6,19(sp)
    143a:	00a10a23          	sb	a0,20(sp)
    143e:	00b10aa3          	sb	a1,21(sp)
    1442:	00d10b23          	sb	a3,22(sp)
    1446:	00110ba3          	sb	ra,23(sp)
    144a:	00810523          	sb	s0,10(sp)
    144e:	00074703          	lbu	a4,0(a4)
    1452:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1456:	002c                	add	a1,sp,8
    1458:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    145a:	00e10c23          	sb	a4,24(sp)
    145e:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1462:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1466:	7d6000ef          	jal	1c3c <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    146a:	00248513          	add	a0,s1,2
        if (!*s)
    146e:	00054783          	lbu	a5,0(a0)
    1472:	e8079ce3          	bnez	a5,130a <printf+0x4c>
    }
    va_end(ap);
}
    1476:	70e6                	ld	ra,120(sp)
    1478:	7446                	ld	s0,112(sp)
    147a:	74a6                	ld	s1,104(sp)
    147c:	7906                	ld	s2,96(sp)
    147e:	69e6                	ld	s3,88(sp)
    1480:	6a46                	ld	s4,80(sp)
    1482:	6aa6                	ld	s5,72(sp)
    1484:	6b06                	ld	s6,64(sp)
    1486:	7be2                	ld	s7,56(sp)
    1488:	6129                	add	sp,sp,192
    148a:	8082                	ret
    148c:	84b2                	mv	s1,a2
    148e:	a039                	j	149c <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1490:	0024c783          	lbu	a5,2(s1)
    1494:	0605                	add	a2,a2,1
    1496:	0489                	add	s1,s1,2
    1498:	e92791e3          	bne	a5,s2,131a <printf+0x5c>
    149c:	0014c783          	lbu	a5,1(s1)
    14a0:	ff2788e3          	beq	a5,s2,1490 <printf+0x1d2>
        l = z - a;
    14a4:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14a8:	85aa                	mv	a1,a0
    14aa:	8622                	mv	a2,s0
    14ac:	4505                	li	a0,1
    14ae:	78e000ef          	jal	1c3c <write>
        if (l)
    14b2:	e6040de3          	beqz	s0,132c <printf+0x6e>
    14b6:	8526                	mv	a0,s1
    14b8:	b5a9                	j	1302 <printf+0x44>
        switch (s[1])
    14ba:	05779963          	bne	a5,s7,150c <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    14be:	6782                	ld	a5,0(sp)
    14c0:	45c1                	li	a1,16
    14c2:	4388                	lw	a0,0(a5)
    14c4:	07a1                	add	a5,a5,8
    14c6:	e03e                	sd	a5,0(sp)
    14c8:	bb7ff0ef          	jal	107e <printint.constprop.0>
        s += 2;
    14cc:	00248513          	add	a0,s1,2
    14d0:	bf79                	j	146e <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    14d2:	6782                	ld	a5,0(sp)
    14d4:	6380                	ld	s0,0(a5)
    14d6:	07a1                	add	a5,a5,8
    14d8:	e03e                	sd	a5,0(sp)
    14da:	cc21                	beqz	s0,1532 <printf+0x274>
            l = strnlen(a, 200);
    14dc:	0c800593          	li	a1,200
    14e0:	8522                	mv	a0,s0
    14e2:	44e000ef          	jal	1930 <strnlen>
    write(f, s, l);
    14e6:	0005061b          	sext.w	a2,a0
    14ea:	85a2                	mv	a1,s0
    14ec:	4505                	li	a0,1
    14ee:	74e000ef          	jal	1c3c <write>
        s += 2;
    14f2:	00248513          	add	a0,s1,2
    14f6:	bfa5                	j	146e <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    14f8:	6782                	ld	a5,0(sp)
    14fa:	45a9                	li	a1,10
    14fc:	4388                	lw	a0,0(a5)
    14fe:	07a1                	add	a5,a5,8
    1500:	e03e                	sd	a5,0(sp)
    1502:	b7dff0ef          	jal	107e <printint.constprop.0>
        s += 2;
    1506:	00248513          	add	a0,s1,2
    150a:	b795                	j	146e <printf+0x1b0>
    return write(stdout, &byte, 1);
    150c:	4605                	li	a2,1
    150e:	002c                	add	a1,sp,8
    1510:	4505                	li	a0,1
    char byte = c;
    1512:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1516:	726000ef          	jal	1c3c <write>
    char byte = c;
    151a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    151e:	4605                	li	a2,1
    1520:	002c                	add	a1,sp,8
    1522:	4505                	li	a0,1
    char byte = c;
    1524:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1528:	714000ef          	jal	1c3c <write>
        s += 2;
    152c:	00248513          	add	a0,s1,2
    1530:	bf3d                	j	146e <printf+0x1b0>
                a = "(null)";
    1532:	00001417          	auipc	s0,0x1
    1536:	9be40413          	add	s0,s0,-1602 # 1ef0 <__clone+0x7c>
    153a:	b74d                	j	14dc <printf+0x21e>

000000000000153c <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    153c:	02000793          	li	a5,32
    1540:	00f50663          	beq	a0,a5,154c <isspace+0x10>
    1544:	355d                	addw	a0,a0,-9
    1546:	00553513          	sltiu	a0,a0,5
    154a:	8082                	ret
    154c:	4505                	li	a0,1
}
    154e:	8082                	ret

0000000000001550 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1550:	fd05051b          	addw	a0,a0,-48
}
    1554:	00a53513          	sltiu	a0,a0,10
    1558:	8082                	ret

000000000000155a <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    155a:	02000713          	li	a4,32
    155e:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1560:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1564:	ff76879b          	addw	a5,a3,-9
    1568:	06e68063          	beq	a3,a4,15c8 <atoi+0x6e>
    156c:	0006859b          	sext.w	a1,a3
    1570:	04f67c63          	bgeu	a2,a5,15c8 <atoi+0x6e>
        s++;
    switch (*s)
    1574:	02b00793          	li	a5,43
    1578:	06f68563          	beq	a3,a5,15e2 <atoi+0x88>
    157c:	02d00793          	li	a5,45
    1580:	04f69663          	bne	a3,a5,15cc <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1584:	00154683          	lbu	a3,1(a0)
    1588:	47a5                	li	a5,9
        s++;
    158a:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    158e:	fd06869b          	addw	a3,a3,-48
    1592:	8636                	mv	a2,a3
    while (isdigit(*s))
    1594:	04d7e563          	bltu	a5,a3,15de <atoi+0x84>
        neg = 1;
    1598:	4885                	li	a7,1
    int n = 0, neg = 0;
    159a:	4501                	li	a0,0
    while (isdigit(*s))
    159c:	4825                	li	a6,9
    159e:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    15a2:	0025179b          	sllw	a5,a0,0x2
    15a6:	9fa9                	addw	a5,a5,a0
    15a8:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    15ac:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    15b0:	85b2                	mv	a1,a2
    15b2:	40c7853b          	subw	a0,a5,a2
    15b6:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    15b8:	8636                	mv	a2,a3
    while (isdigit(*s))
    15ba:	fed872e3          	bgeu	a6,a3,159e <atoi+0x44>
    return neg ? n : -n;
    15be:	02089163          	bnez	a7,15e0 <atoi+0x86>
    15c2:	40f5853b          	subw	a0,a1,a5
    15c6:	8082                	ret
        s++;
    15c8:	0505                	add	a0,a0,1
    15ca:	bf59                	j	1560 <atoi+0x6>
    while (isdigit(*s))
    15cc:	fd05859b          	addw	a1,a1,-48
    15d0:	47a5                	li	a5,9
    15d2:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    15d4:	4881                	li	a7,0
    15d6:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    15da:	fcb7f0e3          	bgeu	a5,a1,159a <atoi+0x40>
    return neg ? n : -n;
    15de:	4501                	li	a0,0
}
    15e0:	8082                	ret
    while (isdigit(*s))
    15e2:	00154683          	lbu	a3,1(a0)
    15e6:	47a5                	li	a5,9
        s++;
    15e8:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    15ec:	fd06869b          	addw	a3,a3,-48
    15f0:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    15f2:	4881                	li	a7,0
    while (isdigit(*s))
    15f4:	fad7f3e3          	bgeu	a5,a3,159a <atoi+0x40>
    return neg ? n : -n;
    15f8:	4501                	li	a0,0
    15fa:	8082                	ret

00000000000015fc <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    15fc:	16060f63          	beqz	a2,177a <memset+0x17e>
    1600:	40a006b3          	neg	a3,a0
    1604:	0076f793          	and	a5,a3,7
    1608:	00778813          	add	a6,a5,7
    160c:	48ad                	li	a7,11
    160e:	0ff5f713          	zext.b	a4,a1
    1612:	fff60593          	add	a1,a2,-1
    1616:	17186363          	bltu	a6,a7,177c <memset+0x180>
    161a:	1705eb63          	bltu	a1,a6,1790 <memset+0x194>
    161e:	16078163          	beqz	a5,1780 <memset+0x184>
    1622:	00e50023          	sb	a4,0(a0)
    1626:	0066f593          	and	a1,a3,6
    162a:	14058e63          	beqz	a1,1786 <memset+0x18a>
    162e:	00e500a3          	sb	a4,1(a0)
    1632:	4589                	li	a1,2
    1634:	00250813          	add	a6,a0,2
    1638:	04f5f663          	bgeu	a1,a5,1684 <memset+0x88>
    163c:	00e50123          	sb	a4,2(a0)
    1640:	8a91                	and	a3,a3,4
    1642:	00350813          	add	a6,a0,3
    1646:	458d                	li	a1,3
    1648:	ce95                	beqz	a3,1684 <memset+0x88>
    164a:	00e501a3          	sb	a4,3(a0)
    164e:	4691                	li	a3,4
    1650:	00450813          	add	a6,a0,4
    1654:	4591                	li	a1,4
    1656:	02f6f763          	bgeu	a3,a5,1684 <memset+0x88>
    165a:	00e50223          	sb	a4,4(a0)
    165e:	4695                	li	a3,5
    1660:	00550813          	add	a6,a0,5
    1664:	4595                	li	a1,5
    1666:	00d78f63          	beq	a5,a3,1684 <memset+0x88>
    166a:	00e502a3          	sb	a4,5(a0)
    166e:	469d                	li	a3,7
    1670:	00650813          	add	a6,a0,6
    1674:	4599                	li	a1,6
    1676:	00d79763          	bne	a5,a3,1684 <memset+0x88>
    167a:	00750813          	add	a6,a0,7
    167e:	00e50323          	sb	a4,6(a0)
    1682:	459d                	li	a1,7
    1684:	00871693          	sll	a3,a4,0x8
    1688:	01071313          	sll	t1,a4,0x10
    168c:	8ed9                	or	a3,a3,a4
    168e:	01871893          	sll	a7,a4,0x18
    1692:	0066e6b3          	or	a3,a3,t1
    1696:	0116e6b3          	or	a3,a3,a7
    169a:	02071313          	sll	t1,a4,0x20
    169e:	02871893          	sll	a7,a4,0x28
    16a2:	0066e6b3          	or	a3,a3,t1
    16a6:	40f60e33          	sub	t3,a2,a5
    16aa:	03071313          	sll	t1,a4,0x30
    16ae:	0116e6b3          	or	a3,a3,a7
    16b2:	0066e6b3          	or	a3,a3,t1
    16b6:	03871893          	sll	a7,a4,0x38
    16ba:	97aa                	add	a5,a5,a0
    16bc:	ff8e7313          	and	t1,t3,-8
    16c0:	0116e6b3          	or	a3,a3,a7
    16c4:	00f308b3          	add	a7,t1,a5
    16c8:	e394                	sd	a3,0(a5)
    16ca:	07a1                	add	a5,a5,8
    16cc:	ff179ee3          	bne	a5,a7,16c8 <memset+0xcc>
    16d0:	006806b3          	add	a3,a6,t1
    16d4:	00b307bb          	addw	a5,t1,a1
    16d8:	0bc30b63          	beq	t1,t3,178e <memset+0x192>
    16dc:	00e68023          	sb	a4,0(a3)
    16e0:	0017859b          	addw	a1,a5,1
    16e4:	08c5fb63          	bgeu	a1,a2,177a <memset+0x17e>
    16e8:	00e680a3          	sb	a4,1(a3)
    16ec:	0027859b          	addw	a1,a5,2
    16f0:	08c5f563          	bgeu	a1,a2,177a <memset+0x17e>
    16f4:	00e68123          	sb	a4,2(a3)
    16f8:	0037859b          	addw	a1,a5,3
    16fc:	06c5ff63          	bgeu	a1,a2,177a <memset+0x17e>
    1700:	00e681a3          	sb	a4,3(a3)
    1704:	0047859b          	addw	a1,a5,4
    1708:	06c5f963          	bgeu	a1,a2,177a <memset+0x17e>
    170c:	00e68223          	sb	a4,4(a3)
    1710:	0057859b          	addw	a1,a5,5
    1714:	06c5f363          	bgeu	a1,a2,177a <memset+0x17e>
    1718:	00e682a3          	sb	a4,5(a3)
    171c:	0067859b          	addw	a1,a5,6
    1720:	04c5fd63          	bgeu	a1,a2,177a <memset+0x17e>
    1724:	00e68323          	sb	a4,6(a3)
    1728:	0077859b          	addw	a1,a5,7
    172c:	04c5f763          	bgeu	a1,a2,177a <memset+0x17e>
    1730:	00e683a3          	sb	a4,7(a3)
    1734:	0087859b          	addw	a1,a5,8
    1738:	04c5f163          	bgeu	a1,a2,177a <memset+0x17e>
    173c:	00e68423          	sb	a4,8(a3)
    1740:	0097859b          	addw	a1,a5,9
    1744:	02c5fb63          	bgeu	a1,a2,177a <memset+0x17e>
    1748:	00e684a3          	sb	a4,9(a3)
    174c:	00a7859b          	addw	a1,a5,10
    1750:	02c5f563          	bgeu	a1,a2,177a <memset+0x17e>
    1754:	00e68523          	sb	a4,10(a3)
    1758:	00b7859b          	addw	a1,a5,11
    175c:	00c5ff63          	bgeu	a1,a2,177a <memset+0x17e>
    1760:	00e685a3          	sb	a4,11(a3)
    1764:	00c7859b          	addw	a1,a5,12
    1768:	00c5f963          	bgeu	a1,a2,177a <memset+0x17e>
    176c:	00e68623          	sb	a4,12(a3)
    1770:	27b5                	addw	a5,a5,13
    1772:	00c7f463          	bgeu	a5,a2,177a <memset+0x17e>
    1776:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    177a:	8082                	ret
    177c:	482d                	li	a6,11
    177e:	bd71                	j	161a <memset+0x1e>
    char *p = dest;
    1780:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1782:	4581                	li	a1,0
    1784:	b701                	j	1684 <memset+0x88>
    1786:	00150813          	add	a6,a0,1
    178a:	4585                	li	a1,1
    178c:	bde5                	j	1684 <memset+0x88>
    178e:	8082                	ret
    char *p = dest;
    1790:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1792:	4781                	li	a5,0
    1794:	b7a1                	j	16dc <memset+0xe0>

0000000000001796 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1796:	00054783          	lbu	a5,0(a0)
    179a:	0005c703          	lbu	a4,0(a1)
    179e:	00e79863          	bne	a5,a4,17ae <strcmp+0x18>
    17a2:	0505                	add	a0,a0,1
    17a4:	0585                	add	a1,a1,1
    17a6:	fbe5                	bnez	a5,1796 <strcmp>
    17a8:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    17aa:	9d19                	subw	a0,a0,a4
    17ac:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    17ae:	0007851b          	sext.w	a0,a5
    17b2:	bfe5                	j	17aa <strcmp+0x14>

00000000000017b4 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    17b4:	ca15                	beqz	a2,17e8 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17b6:	00054783          	lbu	a5,0(a0)
    if (!n--)
    17ba:	167d                	add	a2,a2,-1
    17bc:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17c0:	eb99                	bnez	a5,17d6 <strncmp+0x22>
    17c2:	a815                	j	17f6 <strncmp+0x42>
    17c4:	00a68e63          	beq	a3,a0,17e0 <strncmp+0x2c>
    17c8:	0505                	add	a0,a0,1
    17ca:	00f71b63          	bne	a4,a5,17e0 <strncmp+0x2c>
    17ce:	00054783          	lbu	a5,0(a0)
    17d2:	cf89                	beqz	a5,17ec <strncmp+0x38>
    17d4:	85b2                	mv	a1,a2
    17d6:	0005c703          	lbu	a4,0(a1)
    17da:	00158613          	add	a2,a1,1
    17de:	f37d                	bnez	a4,17c4 <strncmp+0x10>
        ;
    return *l - *r;
    17e0:	0007851b          	sext.w	a0,a5
    17e4:	9d19                	subw	a0,a0,a4
    17e6:	8082                	ret
        return 0;
    17e8:	4501                	li	a0,0
}
    17ea:	8082                	ret
    return *l - *r;
    17ec:	0015c703          	lbu	a4,1(a1)
    17f0:	4501                	li	a0,0
    17f2:	9d19                	subw	a0,a0,a4
    17f4:	8082                	ret
    17f6:	0005c703          	lbu	a4,0(a1)
    17fa:	4501                	li	a0,0
    17fc:	b7e5                	j	17e4 <strncmp+0x30>

00000000000017fe <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    17fe:	00757793          	and	a5,a0,7
    1802:	cf89                	beqz	a5,181c <strlen+0x1e>
    1804:	87aa                	mv	a5,a0
    1806:	a029                	j	1810 <strlen+0x12>
    1808:	0785                	add	a5,a5,1
    180a:	0077f713          	and	a4,a5,7
    180e:	cb01                	beqz	a4,181e <strlen+0x20>
        if (!*s)
    1810:	0007c703          	lbu	a4,0(a5)
    1814:	fb75                	bnez	a4,1808 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1816:	40a78533          	sub	a0,a5,a0
}
    181a:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    181c:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    181e:	feff05b7          	lui	a1,0xfeff0
    1822:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedff7>
    1826:	f0101637          	lui	a2,0xf0101
    182a:	05c2                	sll	a1,a1,0x10
    182c:	0612                	sll	a2,a2,0x4
    182e:	6394                	ld	a3,0(a5)
    1830:	eff58593          	add	a1,a1,-257
    1834:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff1f9>
    1838:	05c2                	sll	a1,a1,0x10
    183a:	0642                	sll	a2,a2,0x10
    183c:	eff58593          	add	a1,a1,-257
    1840:	10160613          	add	a2,a2,257
    1844:	00b68733          	add	a4,a3,a1
    1848:	063e                	sll	a2,a2,0xf
    184a:	fff6c693          	not	a3,a3
    184e:	8f75                	and	a4,a4,a3
    1850:	08060613          	add	a2,a2,128
    1854:	8f71                	and	a4,a4,a2
    1856:	eb11                	bnez	a4,186a <strlen+0x6c>
    1858:	6794                	ld	a3,8(a5)
    185a:	07a1                	add	a5,a5,8
    185c:	00b68733          	add	a4,a3,a1
    1860:	fff6c693          	not	a3,a3
    1864:	8f75                	and	a4,a4,a3
    1866:	8f71                	and	a4,a4,a2
    1868:	db65                	beqz	a4,1858 <strlen+0x5a>
    for (; *s; s++)
    186a:	0007c703          	lbu	a4,0(a5)
    186e:	d745                	beqz	a4,1816 <strlen+0x18>
    1870:	0017c703          	lbu	a4,1(a5)
    1874:	0785                	add	a5,a5,1
    1876:	d345                	beqz	a4,1816 <strlen+0x18>
    1878:	0017c703          	lbu	a4,1(a5)
    187c:	0785                	add	a5,a5,1
    187e:	fb6d                	bnez	a4,1870 <strlen+0x72>
    1880:	bf59                	j	1816 <strlen+0x18>

0000000000001882 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1882:	00757713          	and	a4,a0,7
{
    1886:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1888:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    188c:	cb19                	beqz	a4,18a2 <memchr+0x20>
    188e:	ce59                	beqz	a2,192c <memchr+0xaa>
    1890:	0007c703          	lbu	a4,0(a5)
    1894:	00b70963          	beq	a4,a1,18a6 <memchr+0x24>
    1898:	0785                	add	a5,a5,1
    189a:	0077f713          	and	a4,a5,7
    189e:	167d                	add	a2,a2,-1
    18a0:	f77d                	bnez	a4,188e <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18a2:	4501                	li	a0,0
    if (n && *s != c)
    18a4:	c649                	beqz	a2,192e <memchr+0xac>
    18a6:	0007c703          	lbu	a4,0(a5)
    18aa:	06b70663          	beq	a4,a1,1916 <memchr+0x94>
        size_t k = ONES * c;
    18ae:	01010737          	lui	a4,0x1010
    18b2:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e1f9>
    18b6:	0742                	sll	a4,a4,0x10
    18b8:	10170713          	add	a4,a4,257
    18bc:	0742                	sll	a4,a4,0x10
    18be:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18c2:	469d                	li	a3,7
        size_t k = ONES * c;
    18c4:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18c8:	04c6f763          	bgeu	a3,a2,1916 <memchr+0x94>
    18cc:	f0101837          	lui	a6,0xf0101
    18d0:	feff08b7          	lui	a7,0xfeff0
    18d4:	0812                	sll	a6,a6,0x4
    18d6:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedff7>
    18da:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff1f9>
    18de:	08c2                	sll	a7,a7,0x10
    18e0:	0842                	sll	a6,a6,0x10
    18e2:	eff88893          	add	a7,a7,-257
    18e6:	10180813          	add	a6,a6,257
    18ea:	08c2                	sll	a7,a7,0x10
    18ec:	083e                	sll	a6,a6,0xf
    18ee:	eff88893          	add	a7,a7,-257
    18f2:	08080813          	add	a6,a6,128
    18f6:	431d                	li	t1,7
    18f8:	a029                	j	1902 <memchr+0x80>
    18fa:	1661                	add	a2,a2,-8
    18fc:	07a1                	add	a5,a5,8
    18fe:	02c37663          	bgeu	t1,a2,192a <memchr+0xa8>
    1902:	6398                	ld	a4,0(a5)
    1904:	8f29                	xor	a4,a4,a0
    1906:	011706b3          	add	a3,a4,a7
    190a:	fff74713          	not	a4,a4
    190e:	8f75                	and	a4,a4,a3
    1910:	01077733          	and	a4,a4,a6
    1914:	d37d                	beqz	a4,18fa <memchr+0x78>
        s = (const void *)w;
    1916:	853e                	mv	a0,a5
    1918:	a019                	j	191e <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    191a:	0505                	add	a0,a0,1
    191c:	ca01                	beqz	a2,192c <memchr+0xaa>
    191e:	00054783          	lbu	a5,0(a0)
    1922:	167d                	add	a2,a2,-1
    1924:	feb79be3          	bne	a5,a1,191a <memchr+0x98>
    1928:	8082                	ret
    192a:	f675                	bnez	a2,1916 <memchr+0x94>
    return n ? (void *)s : 0;
    192c:	4501                	li	a0,0
}
    192e:	8082                	ret

0000000000001930 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1930:	1101                	add	sp,sp,-32
    1932:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1934:	862e                	mv	a2,a1
{
    1936:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1938:	4581                	li	a1,0
{
    193a:	e426                	sd	s1,8(sp)
    193c:	ec06                	sd	ra,24(sp)
    193e:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1940:	f43ff0ef          	jal	1882 <memchr>
    return p ? p - s : n;
    1944:	c519                	beqz	a0,1952 <strnlen+0x22>
}
    1946:	60e2                	ld	ra,24(sp)
    1948:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    194a:	8d05                	sub	a0,a0,s1
}
    194c:	64a2                	ld	s1,8(sp)
    194e:	6105                	add	sp,sp,32
    1950:	8082                	ret
    1952:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1954:	8522                	mv	a0,s0
}
    1956:	6442                	ld	s0,16(sp)
    1958:	64a2                	ld	s1,8(sp)
    195a:	6105                	add	sp,sp,32
    195c:	8082                	ret

000000000000195e <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    195e:	00b547b3          	xor	a5,a0,a1
    1962:	8b9d                	and	a5,a5,7
    1964:	efb1                	bnez	a5,19c0 <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1966:	0075f793          	and	a5,a1,7
    196a:	ebb5                	bnez	a5,19de <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    196c:	feff0637          	lui	a2,0xfeff0
    1970:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedff7>
    1974:	f01016b7          	lui	a3,0xf0101
    1978:	0642                	sll	a2,a2,0x10
    197a:	0692                	sll	a3,a3,0x4
    197c:	6198                	ld	a4,0(a1)
    197e:	eff60613          	add	a2,a2,-257
    1982:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff1f9>
    1986:	0642                	sll	a2,a2,0x10
    1988:	06c2                	sll	a3,a3,0x10
    198a:	eff60613          	add	a2,a2,-257
    198e:	10168693          	add	a3,a3,257
    1992:	00c707b3          	add	a5,a4,a2
    1996:	fff74813          	not	a6,a4
    199a:	06be                	sll	a3,a3,0xf
    199c:	0107f7b3          	and	a5,a5,a6
    19a0:	08068693          	add	a3,a3,128
    19a4:	8ff5                	and	a5,a5,a3
    19a6:	ef89                	bnez	a5,19c0 <strcpy+0x62>
    19a8:	05a1                	add	a1,a1,8
    19aa:	e118                	sd	a4,0(a0)
    19ac:	6198                	ld	a4,0(a1)
    19ae:	0521                	add	a0,a0,8
    19b0:	00c707b3          	add	a5,a4,a2
    19b4:	fff74813          	not	a6,a4
    19b8:	0107f7b3          	and	a5,a5,a6
    19bc:	8ff5                	and	a5,a5,a3
    19be:	d7ed                	beqz	a5,19a8 <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19c0:	0005c783          	lbu	a5,0(a1)
    19c4:	00f50023          	sb	a5,0(a0)
    19c8:	c785                	beqz	a5,19f0 <strcpy+0x92>
    19ca:	0015c783          	lbu	a5,1(a1)
    19ce:	0505                	add	a0,a0,1
    19d0:	0585                	add	a1,a1,1
    19d2:	00f50023          	sb	a5,0(a0)
    19d6:	fbf5                	bnez	a5,19ca <strcpy+0x6c>
        ;
    return d;
}
    19d8:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19da:	0505                	add	a0,a0,1
    19dc:	db41                	beqz	a4,196c <strcpy+0xe>
            if (!(*d = *s))
    19de:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19e2:	0585                	add	a1,a1,1
    19e4:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    19e8:	00f50023          	sb	a5,0(a0)
    19ec:	f7fd                	bnez	a5,19da <strcpy+0x7c>
}
    19ee:	8082                	ret
    19f0:	8082                	ret

00000000000019f2 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19f2:	00b547b3          	xor	a5,a0,a1
    19f6:	8b9d                	and	a5,a5,7
    19f8:	efbd                	bnez	a5,1a76 <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19fa:	0075f793          	and	a5,a1,7
    19fe:	1c078563          	beqz	a5,1bc8 <strncpy+0x1d6>
    1a02:	ea11                	bnez	a2,1a16 <strncpy+0x24>
    1a04:	8082                	ret
    1a06:	0585                	add	a1,a1,1
    1a08:	0075f793          	and	a5,a1,7
    1a0c:	167d                	add	a2,a2,-1
    1a0e:	0505                	add	a0,a0,1
    1a10:	1a078c63          	beqz	a5,1bc8 <strncpy+0x1d6>
    1a14:	ca3d                	beqz	a2,1a8a <strncpy+0x98>
    1a16:	0005c783          	lbu	a5,0(a1)
    1a1a:	00f50023          	sb	a5,0(a0)
    1a1e:	f7e5                	bnez	a5,1a06 <strncpy+0x14>
            ;
        if (!n || !*s)
    1a20:	0005c783          	lbu	a5,0(a1)
    1a24:	c7a5                	beqz	a5,1a8c <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a26:	479d                	li	a5,7
    1a28:	04c7f863          	bgeu	a5,a2,1a78 <strncpy+0x86>
    1a2c:	f01016b7          	lui	a3,0xf0101
    1a30:	feff0837          	lui	a6,0xfeff0
    1a34:	0692                	sll	a3,a3,0x4
    1a36:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedff7>
    1a3a:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff1f9>
    1a3e:	0842                	sll	a6,a6,0x10
    1a40:	06c2                	sll	a3,a3,0x10
    1a42:	eff80813          	add	a6,a6,-257
    1a46:	10168693          	add	a3,a3,257
    1a4a:	0842                	sll	a6,a6,0x10
    1a4c:	06be                	sll	a3,a3,0xf
    1a4e:	eff80813          	add	a6,a6,-257
    1a52:	08068693          	add	a3,a3,128
    1a56:	431d                	li	t1,7
    1a58:	6198                	ld	a4,0(a1)
    1a5a:	010707b3          	add	a5,a4,a6
    1a5e:	fff74893          	not	a7,a4
    1a62:	0117f7b3          	and	a5,a5,a7
    1a66:	8ff5                	and	a5,a5,a3
    1a68:	eb81                	bnez	a5,1a78 <strncpy+0x86>
            *wd = *ws;
    1a6a:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a6c:	1661                	add	a2,a2,-8
    1a6e:	05a1                	add	a1,a1,8
    1a70:	0521                	add	a0,a0,8
    1a72:	fec363e3          	bltu	t1,a2,1a58 <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1a76:	ca11                	beqz	a2,1a8a <strncpy+0x98>
    1a78:	0005c783          	lbu	a5,0(a1)
    1a7c:	0585                	add	a1,a1,1
    1a7e:	00f50023          	sb	a5,0(a0)
    1a82:	c789                	beqz	a5,1a8c <strncpy+0x9a>
    1a84:	167d                	add	a2,a2,-1
    1a86:	0505                	add	a0,a0,1
    1a88:	fa65                	bnez	a2,1a78 <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1a8a:	8082                	ret
    1a8c:	40a00733          	neg	a4,a0
    1a90:	00777793          	and	a5,a4,7
    1a94:	00778693          	add	a3,a5,7
    1a98:	482d                	li	a6,11
    1a9a:	fff60593          	add	a1,a2,-1
    1a9e:	1106ef63          	bltu	a3,a6,1bbc <strncpy+0x1ca>
    1aa2:	12d5ee63          	bltu	a1,a3,1bde <strncpy+0x1ec>
    1aa6:	12078563          	beqz	a5,1bd0 <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1aaa:	00050023          	sb	zero,0(a0)
    1aae:	00677693          	and	a3,a4,6
    1ab2:	12068263          	beqz	a3,1bd6 <strncpy+0x1e4>
    1ab6:	000500a3          	sb	zero,1(a0)
    1aba:	4689                	li	a3,2
    1abc:	12f6f463          	bgeu	a3,a5,1be4 <strncpy+0x1f2>
    1ac0:	00050123          	sb	zero,2(a0)
    1ac4:	8b11                	and	a4,a4,4
    1ac6:	cf6d                	beqz	a4,1bc0 <strncpy+0x1ce>
    1ac8:	000501a3          	sb	zero,3(a0)
    1acc:	4711                	li	a4,4
    1ace:	00450693          	add	a3,a0,4
    1ad2:	02f77363          	bgeu	a4,a5,1af8 <strncpy+0x106>
    1ad6:	00050223          	sb	zero,4(a0)
    1ada:	4715                	li	a4,5
    1adc:	00550693          	add	a3,a0,5
    1ae0:	00e78c63          	beq	a5,a4,1af8 <strncpy+0x106>
    1ae4:	000502a3          	sb	zero,5(a0)
    1ae8:	471d                	li	a4,7
    1aea:	10e79163          	bne	a5,a4,1bec <strncpy+0x1fa>
    1aee:	00750693          	add	a3,a0,7
    1af2:	00050323          	sb	zero,6(a0)
    1af6:	471d                	li	a4,7
    1af8:	40f608b3          	sub	a7,a2,a5
    1afc:	ff88f813          	and	a6,a7,-8
    1b00:	97aa                	add	a5,a5,a0
    1b02:	010785b3          	add	a1,a5,a6
    1b06:	0007b023          	sd	zero,0(a5)
    1b0a:	07a1                	add	a5,a5,8
    1b0c:	feb79de3          	bne	a5,a1,1b06 <strncpy+0x114>
    1b10:	00e807bb          	addw	a5,a6,a4
    1b14:	01068733          	add	a4,a3,a6
    1b18:	0b088b63          	beq	a7,a6,1bce <strncpy+0x1dc>
    1b1c:	00070023          	sb	zero,0(a4)
    1b20:	0017869b          	addw	a3,a5,1
    1b24:	f6c6f3e3          	bgeu	a3,a2,1a8a <strncpy+0x98>
    1b28:	000700a3          	sb	zero,1(a4)
    1b2c:	0027869b          	addw	a3,a5,2
    1b30:	f4c6fde3          	bgeu	a3,a2,1a8a <strncpy+0x98>
    1b34:	00070123          	sb	zero,2(a4)
    1b38:	0037869b          	addw	a3,a5,3
    1b3c:	f4c6f7e3          	bgeu	a3,a2,1a8a <strncpy+0x98>
    1b40:	000701a3          	sb	zero,3(a4)
    1b44:	0047869b          	addw	a3,a5,4
    1b48:	f4c6f1e3          	bgeu	a3,a2,1a8a <strncpy+0x98>
    1b4c:	00070223          	sb	zero,4(a4)
    1b50:	0057869b          	addw	a3,a5,5
    1b54:	f2c6fbe3          	bgeu	a3,a2,1a8a <strncpy+0x98>
    1b58:	000702a3          	sb	zero,5(a4)
    1b5c:	0067869b          	addw	a3,a5,6
    1b60:	f2c6f5e3          	bgeu	a3,a2,1a8a <strncpy+0x98>
    1b64:	00070323          	sb	zero,6(a4)
    1b68:	0077869b          	addw	a3,a5,7
    1b6c:	f0c6ffe3          	bgeu	a3,a2,1a8a <strncpy+0x98>
    1b70:	000703a3          	sb	zero,7(a4)
    1b74:	0087869b          	addw	a3,a5,8
    1b78:	f0c6f9e3          	bgeu	a3,a2,1a8a <strncpy+0x98>
    1b7c:	00070423          	sb	zero,8(a4)
    1b80:	0097869b          	addw	a3,a5,9
    1b84:	f0c6f3e3          	bgeu	a3,a2,1a8a <strncpy+0x98>
    1b88:	000704a3          	sb	zero,9(a4)
    1b8c:	00a7869b          	addw	a3,a5,10
    1b90:	eec6fde3          	bgeu	a3,a2,1a8a <strncpy+0x98>
    1b94:	00070523          	sb	zero,10(a4)
    1b98:	00b7869b          	addw	a3,a5,11
    1b9c:	eec6f7e3          	bgeu	a3,a2,1a8a <strncpy+0x98>
    1ba0:	000705a3          	sb	zero,11(a4)
    1ba4:	00c7869b          	addw	a3,a5,12
    1ba8:	eec6f1e3          	bgeu	a3,a2,1a8a <strncpy+0x98>
    1bac:	00070623          	sb	zero,12(a4)
    1bb0:	27b5                	addw	a5,a5,13
    1bb2:	ecc7fce3          	bgeu	a5,a2,1a8a <strncpy+0x98>
    1bb6:	000706a3          	sb	zero,13(a4)
}
    1bba:	8082                	ret
    1bbc:	46ad                	li	a3,11
    1bbe:	b5d5                	j	1aa2 <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bc0:	00350693          	add	a3,a0,3
    1bc4:	470d                	li	a4,3
    1bc6:	bf0d                	j	1af8 <strncpy+0x106>
        if (!n || !*s)
    1bc8:	e4061ce3          	bnez	a2,1a20 <strncpy+0x2e>
}
    1bcc:	8082                	ret
    1bce:	8082                	ret
    char *p = dest;
    1bd0:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bd2:	4701                	li	a4,0
    1bd4:	b715                	j	1af8 <strncpy+0x106>
    1bd6:	00150693          	add	a3,a0,1
    1bda:	4705                	li	a4,1
    1bdc:	bf31                	j	1af8 <strncpy+0x106>
    char *p = dest;
    1bde:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1be0:	4781                	li	a5,0
    1be2:	bf2d                	j	1b1c <strncpy+0x12a>
    1be4:	00250693          	add	a3,a0,2
    1be8:	4709                	li	a4,2
    1bea:	b739                	j	1af8 <strncpy+0x106>
    1bec:	00650693          	add	a3,a0,6
    1bf0:	4719                	li	a4,6
    1bf2:	b719                	j	1af8 <strncpy+0x106>

0000000000001bf4 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1bf4:	87aa                	mv	a5,a0
    1bf6:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1bf8:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1bfc:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c00:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c02:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c04:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c08:	2501                	sext.w	a0,a0
    1c0a:	8082                	ret

0000000000001c0c <openat>:
    register long a7 __asm__("a7") = n;
    1c0c:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c10:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c14:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c18:	2501                	sext.w	a0,a0
    1c1a:	8082                	ret

0000000000001c1c <fcntl>:
    register long a7 __asm__("a7") = n;
    1c1c:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c1e:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1c22:	2501                	sext.w	a0,a0
    1c24:	8082                	ret

0000000000001c26 <close>:
    register long a7 __asm__("a7") = n;
    1c26:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c2a:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c2e:	2501                	sext.w	a0,a0
    1c30:	8082                	ret

0000000000001c32 <read>:
    register long a7 __asm__("a7") = n;
    1c32:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c36:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c3a:	8082                	ret

0000000000001c3c <write>:
    register long a7 __asm__("a7") = n;
    1c3c:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c40:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c44:	8082                	ret

0000000000001c46 <getpid>:
    register long a7 __asm__("a7") = n;
    1c46:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c4a:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c4e:	2501                	sext.w	a0,a0
    1c50:	8082                	ret

0000000000001c52 <getppid>:
    register long a7 __asm__("a7") = n;
    1c52:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c56:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c5a:	2501                	sext.w	a0,a0
    1c5c:	8082                	ret

0000000000001c5e <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c5e:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c62:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c66:	2501                	sext.w	a0,a0
    1c68:	8082                	ret

0000000000001c6a <fork>:
    register long a7 __asm__("a7") = n;
    1c6a:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c6e:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c70:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c72:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c76:	2501                	sext.w	a0,a0
    1c78:	8082                	ret

0000000000001c7a <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c7a:	85b2                	mv	a1,a2
    1c7c:	863a                	mv	a2,a4
    if (stack)
    1c7e:	c191                	beqz	a1,1c82 <clone+0x8>
	stack += stack_size;
    1c80:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c82:	4781                	li	a5,0
    1c84:	4701                	li	a4,0
    1c86:	4681                	li	a3,0
    1c88:	2601                	sext.w	a2,a2
    1c8a:	a2ed                	j	1e74 <__clone>

0000000000001c8c <exit>:
    register long a7 __asm__("a7") = n;
    1c8c:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c90:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1c94:	8082                	ret

0000000000001c96 <waitpid>:
    register long a7 __asm__("a7") = n;
    1c96:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1c9a:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c9c:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1ca0:	2501                	sext.w	a0,a0
    1ca2:	8082                	ret

0000000000001ca4 <exec>:
    register long a7 __asm__("a7") = n;
    1ca4:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1ca8:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cac:	2501                	sext.w	a0,a0
    1cae:	8082                	ret

0000000000001cb0 <execve>:
    register long a7 __asm__("a7") = n;
    1cb0:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cb4:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cb8:	2501                	sext.w	a0,a0
    1cba:	8082                	ret

0000000000001cbc <times>:
    register long a7 __asm__("a7") = n;
    1cbc:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cc0:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1cc4:	2501                	sext.w	a0,a0
    1cc6:	8082                	ret

0000000000001cc8 <get_time>:

int64 get_time()
{
    1cc8:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1cca:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1cce:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1cd0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cd2:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1cd6:	2501                	sext.w	a0,a0
    1cd8:	ed09                	bnez	a0,1cf2 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1cda:	67a2                	ld	a5,8(sp)
    1cdc:	3e800713          	li	a4,1000
    1ce0:	00015503          	lhu	a0,0(sp)
    1ce4:	02e7d7b3          	divu	a5,a5,a4
    1ce8:	02e50533          	mul	a0,a0,a4
    1cec:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1cee:	0141                	add	sp,sp,16
    1cf0:	8082                	ret
        return -1;
    1cf2:	557d                	li	a0,-1
    1cf4:	bfed                	j	1cee <get_time+0x26>

0000000000001cf6 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1cf6:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cfa:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1cfe:	2501                	sext.w	a0,a0
    1d00:	8082                	ret

0000000000001d02 <time>:
    register long a7 __asm__("a7") = n;
    1d02:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d06:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d0a:	2501                	sext.w	a0,a0
    1d0c:	8082                	ret

0000000000001d0e <sleep>:

int sleep(unsigned long long time)
{
    1d0e:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d10:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d12:	850a                	mv	a0,sp
    1d14:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d16:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d1a:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d1c:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d20:	e501                	bnez	a0,1d28 <sleep+0x1a>
    return 0;
    1d22:	4501                	li	a0,0
}
    1d24:	0141                	add	sp,sp,16
    1d26:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d28:	4502                	lw	a0,0(sp)
}
    1d2a:	0141                	add	sp,sp,16
    1d2c:	8082                	ret

0000000000001d2e <set_priority>:
    register long a7 __asm__("a7") = n;
    1d2e:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d32:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d36:	2501                	sext.w	a0,a0
    1d38:	8082                	ret

0000000000001d3a <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d3a:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d3e:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d42:	8082                	ret

0000000000001d44 <munmap>:
    register long a7 __asm__("a7") = n;
    1d44:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d48:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d4c:	2501                	sext.w	a0,a0
    1d4e:	8082                	ret

0000000000001d50 <wait>:

int wait(int *code)
{
    1d50:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d52:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d56:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d58:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d5a:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d5c:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d60:	2501                	sext.w	a0,a0
    1d62:	8082                	ret

0000000000001d64 <spawn>:
    register long a7 __asm__("a7") = n;
    1d64:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d68:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d6c:	2501                	sext.w	a0,a0
    1d6e:	8082                	ret

0000000000001d70 <mailread>:
    register long a7 __asm__("a7") = n;
    1d70:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d74:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d78:	2501                	sext.w	a0,a0
    1d7a:	8082                	ret

0000000000001d7c <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d7c:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d80:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d84:	2501                	sext.w	a0,a0
    1d86:	8082                	ret

0000000000001d88 <fstat>:
    register long a7 __asm__("a7") = n;
    1d88:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d8c:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1d90:	2501                	sext.w	a0,a0
    1d92:	8082                	ret

0000000000001d94 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1d94:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1d96:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1d9a:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d9c:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1da0:	2501                	sext.w	a0,a0
    1da2:	8082                	ret

0000000000001da4 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1da4:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1da6:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1daa:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dac:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1db0:	2501                	sext.w	a0,a0
    1db2:	8082                	ret

0000000000001db4 <link>:

int link(char *old_path, char *new_path)
{
    1db4:	87aa                	mv	a5,a0
    1db6:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1db8:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1dbc:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1dc0:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1dc2:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1dc6:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dc8:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1dcc:	2501                	sext.w	a0,a0
    1dce:	8082                	ret

0000000000001dd0 <unlink>:

int unlink(char *path)
{
    1dd0:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dd2:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1dd6:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1dda:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ddc:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1de0:	2501                	sext.w	a0,a0
    1de2:	8082                	ret

0000000000001de4 <uname>:
    register long a7 __asm__("a7") = n;
    1de4:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1de8:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1dec:	2501                	sext.w	a0,a0
    1dee:	8082                	ret

0000000000001df0 <brk>:
    register long a7 __asm__("a7") = n;
    1df0:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1df4:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1df8:	2501                	sext.w	a0,a0
    1dfa:	8082                	ret

0000000000001dfc <getcwd>:
    register long a7 __asm__("a7") = n;
    1dfc:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dfe:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e02:	8082                	ret

0000000000001e04 <chdir>:
    register long a7 __asm__("a7") = n;
    1e04:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e08:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e0c:	2501                	sext.w	a0,a0
    1e0e:	8082                	ret

0000000000001e10 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e10:	862e                	mv	a2,a1
    1e12:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e14:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e16:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e1a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e1e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e20:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e22:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e26:	2501                	sext.w	a0,a0
    1e28:	8082                	ret

0000000000001e2a <getdents>:
    register long a7 __asm__("a7") = n;
    1e2a:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e2e:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e32:	2501                	sext.w	a0,a0
    1e34:	8082                	ret

0000000000001e36 <pipe>:
    register long a7 __asm__("a7") = n;
    1e36:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e3a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e3c:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e40:	2501                	sext.w	a0,a0
    1e42:	8082                	ret

0000000000001e44 <dup>:
    register long a7 __asm__("a7") = n;
    1e44:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e46:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e4a:	2501                	sext.w	a0,a0
    1e4c:	8082                	ret

0000000000001e4e <dup2>:
    register long a7 __asm__("a7") = n;
    1e4e:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e50:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e52:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e56:	2501                	sext.w	a0,a0
    1e58:	8082                	ret

0000000000001e5a <mount>:
    register long a7 __asm__("a7") = n;
    1e5a:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e5e:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e62:	2501                	sext.w	a0,a0
    1e64:	8082                	ret

0000000000001e66 <umount>:
    register long a7 __asm__("a7") = n;
    1e66:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e6a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e6c:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e70:	2501                	sext.w	a0,a0
    1e72:	8082                	ret

0000000000001e74 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e74:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1e76:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e78:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e7a:	8532                	mv	a0,a2
	mv a2, a4
    1e7c:	863a                	mv	a2,a4
	mv a3, a5
    1e7e:	86be                	mv	a3,a5
	mv a4, a6
    1e80:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e82:	0dc00893          	li	a7,220
	ecall
    1e86:	00000073          	ecall

	beqz a0, 1f
    1e8a:	c111                	beqz	a0,1e8e <__clone+0x1a>
	# Parent
	ret
    1e8c:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1e8e:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1e90:	6522                	ld	a0,8(sp)
	jalr a1
    1e92:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1e94:	05d00893          	li	a7,93
	ecall
    1e98:	00000073          	ecall
