
/root/oskernel2024-trustos/pre_ctests/build/riscv64/exit:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a075                	j	10ae <__start_main>

0000000000001004 <test_exit>:
 * 测试成功则输出：
 * "exit OK."
 * 测试失败则输出：
 * "exit ERR."
 */
void test_exit(void){
    1004:	1101                	add	sp,sp,-32
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	ef250513          	add	a0,a0,-270 # 1ef8 <__clone+0x28>
void test_exit(void){
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
    TEST_START(__func__);
    1012:	2d4000ef          	jal	12e6 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	f6250513          	add	a0,a0,-158 # 1f78 <__func__.0>
    101e:	2c8000ef          	jal	12e6 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	eee50513          	add	a0,a0,-274 # 1f10 <__clone+0x40>
    102a:	2bc000ef          	jal	12e6 <puts>
    int cpid, waitret, wstatus;
    cpid = fork();
    102e:	499000ef          	jal	1cc6 <fork>
    assert(cpid != -1);
    1032:	57fd                	li	a5,-1
    cpid = fork();
    1034:	842a                	mv	s0,a0
    assert(cpid != -1);
    1036:	02f50b63          	beq	a0,a5,106c <test_exit+0x68>
    if(cpid == 0){
    103a:	ed1d                	bnez	a0,1078 <test_exit+0x74>
        exit(0);
    103c:	4ad000ef          	jal	1ce8 <exit>
    }else{
        waitret = wait(&wstatus);
        if(waitret == cpid) printf("exit OK.\n");
        else printf("exit ERR.\n");
    }
    TEST_END(__func__);
    1040:	00001517          	auipc	a0,0x1
    1044:	f2050513          	add	a0,a0,-224 # 1f60 <__clone+0x90>
    1048:	29e000ef          	jal	12e6 <puts>
    104c:	00001517          	auipc	a0,0x1
    1050:	f2c50513          	add	a0,a0,-212 # 1f78 <__func__.0>
    1054:	292000ef          	jal	12e6 <puts>
    1058:	00001517          	auipc	a0,0x1
    105c:	eb850513          	add	a0,a0,-328 # 1f10 <__clone+0x40>
    1060:	286000ef          	jal	12e6 <puts>
}
    1064:	60e2                	ld	ra,24(sp)
    1066:	6442                	ld	s0,16(sp)
    1068:	6105                	add	sp,sp,32
    106a:	8082                	ret
    assert(cpid != -1);
    106c:	00001517          	auipc	a0,0x1
    1070:	eb450513          	add	a0,a0,-332 # 1f20 <__clone+0x50>
    1074:	512000ef          	jal	1586 <panic>
        waitret = wait(&wstatus);
    1078:	0068                	add	a0,sp,12
    107a:	533000ef          	jal	1dac <wait>
        if(waitret == cpid) printf("exit OK.\n");
    107e:	00a40963          	beq	s0,a0,1090 <test_exit+0x8c>
        else printf("exit ERR.\n");
    1082:	00001517          	auipc	a0,0x1
    1086:	ece50513          	add	a0,a0,-306 # 1f50 <__clone+0x80>
    108a:	27e000ef          	jal	1308 <printf>
    108e:	bf4d                	j	1040 <test_exit+0x3c>
        if(waitret == cpid) printf("exit OK.\n");
    1090:	00001517          	auipc	a0,0x1
    1094:	eb050513          	add	a0,a0,-336 # 1f40 <__clone+0x70>
    1098:	270000ef          	jal	1308 <printf>
    109c:	b755                	j	1040 <test_exit+0x3c>

000000000000109e <main>:

int main(void){
    109e:	1141                	add	sp,sp,-16
    10a0:	e406                	sd	ra,8(sp)
    test_exit();
    10a2:	f63ff0ef          	jal	1004 <test_exit>
    return 0;
}
    10a6:	60a2                	ld	ra,8(sp)
    10a8:	4501                	li	a0,0
    10aa:	0141                	add	sp,sp,16
    10ac:	8082                	ret

00000000000010ae <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10ae:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10b0:	4108                	lw	a0,0(a0)
{
    10b2:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10b4:	05a1                	add	a1,a1,8
{
    10b6:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10b8:	fe7ff0ef          	jal	109e <main>
    10bc:	42d000ef          	jal	1ce8 <exit>
	return 0;
}
    10c0:	60a2                	ld	ra,8(sp)
    10c2:	4501                	li	a0,0
    10c4:	0141                	add	sp,sp,16
    10c6:	8082                	ret

00000000000010c8 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10c8:	7179                	add	sp,sp,-48
    10ca:	f406                	sd	ra,40(sp)
    10cc:	0005081b          	sext.w	a6,a0
    10d0:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10d2:	00055563          	bgez	a0,10dc <printint.constprop.0+0x14>
        x = -xx;
    10d6:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    10da:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10dc:	02b8763b          	remuw	a2,a6,a1
    10e0:	00001697          	auipc	a3,0x1
    10e4:	ea868693          	add	a3,a3,-344 # 1f88 <digits>
    buf[16] = 0;
    10e8:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10ec:	0005871b          	sext.w	a4,a1
    10f0:	1602                	sll	a2,a2,0x20
    10f2:	9201                	srl	a2,a2,0x20
    10f4:	9636                	add	a2,a2,a3
    10f6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10fa:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    10fe:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1102:	10b86c63          	bltu	a6,a1,121a <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    1106:	02e5763b          	remuw	a2,a0,a4
    110a:	1602                	sll	a2,a2,0x20
    110c:	9201                	srl	a2,a2,0x20
    110e:	9636                	add	a2,a2,a3
    1110:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1114:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1118:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    111c:	10e56863          	bltu	a0,a4,122c <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    1120:	02e5f63b          	remuw	a2,a1,a4
    1124:	1602                	sll	a2,a2,0x20
    1126:	9201                	srl	a2,a2,0x20
    1128:	9636                	add	a2,a2,a3
    112a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    112e:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1132:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1136:	10e5e463          	bltu	a1,a4,123e <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    113a:	02e5763b          	remuw	a2,a0,a4
    113e:	1602                	sll	a2,a2,0x20
    1140:	9201                	srl	a2,a2,0x20
    1142:	9636                	add	a2,a2,a3
    1144:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1148:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    114c:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1150:	10e56063          	bltu	a0,a4,1250 <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    1154:	02e5f63b          	remuw	a2,a1,a4
    1158:	1602                	sll	a2,a2,0x20
    115a:	9201                	srl	a2,a2,0x20
    115c:	9636                	add	a2,a2,a3
    115e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1162:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1166:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    116a:	0ee5ec63          	bltu	a1,a4,1262 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    116e:	02e5763b          	remuw	a2,a0,a4
    1172:	1602                	sll	a2,a2,0x20
    1174:	9201                	srl	a2,a2,0x20
    1176:	9636                	add	a2,a2,a3
    1178:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    117c:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1180:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1184:	08e56263          	bltu	a0,a4,1208 <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    1188:	02e5f63b          	remuw	a2,a1,a4
    118c:	1602                	sll	a2,a2,0x20
    118e:	9201                	srl	a2,a2,0x20
    1190:	9636                	add	a2,a2,a3
    1192:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1196:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    119a:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    119e:	0ce5eb63          	bltu	a1,a4,1274 <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    11a2:	02e5763b          	remuw	a2,a0,a4
    11a6:	1602                	sll	a2,a2,0x20
    11a8:	9201                	srl	a2,a2,0x20
    11aa:	9636                	add	a2,a2,a3
    11ac:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b0:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11b4:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11b8:	0ce56763          	bltu	a0,a4,1286 <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    11bc:	02e5f63b          	remuw	a2,a1,a4
    11c0:	1602                	sll	a2,a2,0x20
    11c2:	9201                	srl	a2,a2,0x20
    11c4:	9636                	add	a2,a2,a3
    11c6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ca:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11ce:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11d2:	0ce5e363          	bltu	a1,a4,1298 <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    11d6:	1782                	sll	a5,a5,0x20
    11d8:	9381                	srl	a5,a5,0x20
    11da:	96be                	add	a3,a3,a5
    11dc:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    11e0:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    11e2:	00f10723          	sb	a5,14(sp)
    if (sign)
    11e6:	00088763          	beqz	a7,11f4 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11ea:	02d00793          	li	a5,45
    11ee:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11f2:	4595                	li	a1,5
    write(f, s, l);
    11f4:	003c                	add	a5,sp,8
    11f6:	4641                	li	a2,16
    11f8:	9e0d                	subw	a2,a2,a1
    11fa:	4505                	li	a0,1
    11fc:	95be                	add	a1,a1,a5
    11fe:	29b000ef          	jal	1c98 <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1202:	70a2                	ld	ra,40(sp)
    1204:	6145                	add	sp,sp,48
    1206:	8082                	ret
    i++;
    1208:	45a9                	li	a1,10
    if (sign)
    120a:	fe0885e3          	beqz	a7,11f4 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    120e:	02d00793          	li	a5,45
    1212:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1216:	45a5                	li	a1,9
    1218:	bff1                	j	11f4 <printint.constprop.0+0x12c>
    i++;
    121a:	45bd                	li	a1,15
    if (sign)
    121c:	fc088ce3          	beqz	a7,11f4 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1220:	02d00793          	li	a5,45
    1224:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1228:	45b9                	li	a1,14
    122a:	b7e9                	j	11f4 <printint.constprop.0+0x12c>
    i++;
    122c:	45b9                	li	a1,14
    if (sign)
    122e:	fc0883e3          	beqz	a7,11f4 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1232:	02d00793          	li	a5,45
    1236:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    123a:	45b5                	li	a1,13
    123c:	bf65                	j	11f4 <printint.constprop.0+0x12c>
    i++;
    123e:	45b5                	li	a1,13
    if (sign)
    1240:	fa088ae3          	beqz	a7,11f4 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1244:	02d00793          	li	a5,45
    1248:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    124c:	45b1                	li	a1,12
    124e:	b75d                	j	11f4 <printint.constprop.0+0x12c>
    i++;
    1250:	45b1                	li	a1,12
    if (sign)
    1252:	fa0881e3          	beqz	a7,11f4 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1256:	02d00793          	li	a5,45
    125a:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    125e:	45ad                	li	a1,11
    1260:	bf51                	j	11f4 <printint.constprop.0+0x12c>
    i++;
    1262:	45ad                	li	a1,11
    if (sign)
    1264:	f80888e3          	beqz	a7,11f4 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1268:	02d00793          	li	a5,45
    126c:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1270:	45a9                	li	a1,10
    1272:	b749                	j	11f4 <printint.constprop.0+0x12c>
    i++;
    1274:	45a5                	li	a1,9
    if (sign)
    1276:	f6088fe3          	beqz	a7,11f4 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    127a:	02d00793          	li	a5,45
    127e:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1282:	45a1                	li	a1,8
    1284:	bf85                	j	11f4 <printint.constprop.0+0x12c>
    i++;
    1286:	45a1                	li	a1,8
    if (sign)
    1288:	f60886e3          	beqz	a7,11f4 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    128c:	02d00793          	li	a5,45
    1290:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1294:	459d                	li	a1,7
    1296:	bfb9                	j	11f4 <printint.constprop.0+0x12c>
    i++;
    1298:	459d                	li	a1,7
    if (sign)
    129a:	f4088de3          	beqz	a7,11f4 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    129e:	02d00793          	li	a5,45
    12a2:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12a6:	4599                	li	a1,6
    12a8:	b7b1                	j	11f4 <printint.constprop.0+0x12c>

00000000000012aa <getchar>:
{
    12aa:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12ac:	00f10593          	add	a1,sp,15
    12b0:	4605                	li	a2,1
    12b2:	4501                	li	a0,0
{
    12b4:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12b6:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12ba:	1d5000ef          	jal	1c8e <read>
}
    12be:	60e2                	ld	ra,24(sp)
    12c0:	00f14503          	lbu	a0,15(sp)
    12c4:	6105                	add	sp,sp,32
    12c6:	8082                	ret

00000000000012c8 <putchar>:
{
    12c8:	1101                	add	sp,sp,-32
    12ca:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12cc:	00f10593          	add	a1,sp,15
    12d0:	4605                	li	a2,1
    12d2:	4505                	li	a0,1
{
    12d4:	ec06                	sd	ra,24(sp)
    char byte = c;
    12d6:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12da:	1bf000ef          	jal	1c98 <write>
}
    12de:	60e2                	ld	ra,24(sp)
    12e0:	2501                	sext.w	a0,a0
    12e2:	6105                	add	sp,sp,32
    12e4:	8082                	ret

00000000000012e6 <puts>:
{
    12e6:	1141                	add	sp,sp,-16
    12e8:	e406                	sd	ra,8(sp)
    12ea:	e022                	sd	s0,0(sp)
    12ec:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12ee:	56c000ef          	jal	185a <strlen>
    12f2:	862a                	mv	a2,a0
    12f4:	85a2                	mv	a1,s0
    12f6:	4505                	li	a0,1
    12f8:	1a1000ef          	jal	1c98 <write>
}
    12fc:	60a2                	ld	ra,8(sp)
    12fe:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1300:	957d                	sra	a0,a0,0x3f
    return r;
    1302:	2501                	sext.w	a0,a0
}
    1304:	0141                	add	sp,sp,16
    1306:	8082                	ret

0000000000001308 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1308:	7131                	add	sp,sp,-192
    130a:	e4d6                	sd	s5,72(sp)
    130c:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    130e:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1310:	013c                	add	a5,sp,136
{
    1312:	f0ca                	sd	s2,96(sp)
    1314:	ecce                	sd	s3,88(sp)
    1316:	e8d2                	sd	s4,80(sp)
    1318:	e0da                	sd	s6,64(sp)
    131a:	fc5e                	sd	s7,56(sp)
    131c:	fc86                	sd	ra,120(sp)
    131e:	f8a2                	sd	s0,112(sp)
    1320:	f4a6                	sd	s1,104(sp)
    1322:	e52e                	sd	a1,136(sp)
    1324:	e932                	sd	a2,144(sp)
    1326:	ed36                	sd	a3,152(sp)
    1328:	f13a                	sd	a4,160(sp)
    132a:	f942                	sd	a6,176(sp)
    132c:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    132e:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1330:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1334:	07300a13          	li	s4,115
    1338:	07800b93          	li	s7,120
    133c:	06400b13          	li	s6,100
    buf[i++] = '0';
    1340:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x58a8>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1344:	00001997          	auipc	s3,0x1
    1348:	c4498993          	add	s3,s3,-956 # 1f88 <digits>
        if (!*s)
    134c:	00054783          	lbu	a5,0(a0)
    1350:	16078863          	beqz	a5,14c0 <printf+0x1b8>
    1354:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1356:	19278063          	beq	a5,s2,14d6 <printf+0x1ce>
    135a:	00164783          	lbu	a5,1(a2)
    135e:	0605                	add	a2,a2,1
    1360:	fbfd                	bnez	a5,1356 <printf+0x4e>
    1362:	84b2                	mv	s1,a2
        l = z - a;
    1364:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1368:	85aa                	mv	a1,a0
    136a:	8622                	mv	a2,s0
    136c:	4505                	li	a0,1
    136e:	12b000ef          	jal	1c98 <write>
        if (l)
    1372:	18041763          	bnez	s0,1500 <printf+0x1f8>
        if (s[1] == 0)
    1376:	0014c783          	lbu	a5,1(s1)
    137a:	14078363          	beqz	a5,14c0 <printf+0x1b8>
        switch (s[1])
    137e:	19478f63          	beq	a5,s4,151c <printf+0x214>
    1382:	18fa6163          	bltu	s4,a5,1504 <printf+0x1fc>
    1386:	1b678e63          	beq	a5,s6,1542 <printf+0x23a>
    138a:	07000713          	li	a4,112
    138e:	1ce79463          	bne	a5,a4,1556 <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1392:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1394:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1398:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    139a:	631c                	ld	a5,0(a4)
    139c:	0721                	add	a4,a4,8
    139e:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13a0:	00479293          	sll	t0,a5,0x4
    13a4:	00879f93          	sll	t6,a5,0x8
    13a8:	00c79f13          	sll	t5,a5,0xc
    13ac:	01079e93          	sll	t4,a5,0x10
    13b0:	01479e13          	sll	t3,a5,0x14
    13b4:	01879313          	sll	t1,a5,0x18
    13b8:	01c79893          	sll	a7,a5,0x1c
    13bc:	02479813          	sll	a6,a5,0x24
    13c0:	02879513          	sll	a0,a5,0x28
    13c4:	02c79593          	sll	a1,a5,0x2c
    13c8:	03079693          	sll	a3,a5,0x30
    13cc:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13d0:	03c7d413          	srl	s0,a5,0x3c
    13d4:	01c7d39b          	srlw	t2,a5,0x1c
    13d8:	03c2d293          	srl	t0,t0,0x3c
    13dc:	03cfdf93          	srl	t6,t6,0x3c
    13e0:	03cf5f13          	srl	t5,t5,0x3c
    13e4:	03cede93          	srl	t4,t4,0x3c
    13e8:	03ce5e13          	srl	t3,t3,0x3c
    13ec:	03c35313          	srl	t1,t1,0x3c
    13f0:	03c8d893          	srl	a7,a7,0x3c
    13f4:	03c85813          	srl	a6,a6,0x3c
    13f8:	9171                	srl	a0,a0,0x3c
    13fa:	91f1                	srl	a1,a1,0x3c
    13fc:	92f1                	srl	a3,a3,0x3c
    13fe:	9371                	srl	a4,a4,0x3c
    1400:	974e                	add	a4,a4,s3
    1402:	944e                	add	s0,s0,s3
    1404:	92ce                	add	t0,t0,s3
    1406:	9fce                	add	t6,t6,s3
    1408:	9f4e                	add	t5,t5,s3
    140a:	9ece                	add	t4,t4,s3
    140c:	9e4e                	add	t3,t3,s3
    140e:	934e                	add	t1,t1,s3
    1410:	98ce                	add	a7,a7,s3
    1412:	93ce                	add	t2,t2,s3
    1414:	984e                	add	a6,a6,s3
    1416:	954e                	add	a0,a0,s3
    1418:	95ce                	add	a1,a1,s3
    141a:	96ce                	add	a3,a3,s3
    141c:	00074083          	lbu	ra,0(a4)
    1420:	0002c283          	lbu	t0,0(t0)
    1424:	000fcf83          	lbu	t6,0(t6)
    1428:	000f4f03          	lbu	t5,0(t5)
    142c:	000ece83          	lbu	t4,0(t4)
    1430:	000e4e03          	lbu	t3,0(t3)
    1434:	00034303          	lbu	t1,0(t1)
    1438:	0008c883          	lbu	a7,0(a7)
    143c:	0003c383          	lbu	t2,0(t2)
    1440:	00084803          	lbu	a6,0(a6)
    1444:	00054503          	lbu	a0,0(a0)
    1448:	0005c583          	lbu	a1,0(a1)
    144c:	0006c683          	lbu	a3,0(a3)
    1450:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1454:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1458:	9371                	srl	a4,a4,0x3c
    145a:	8bbd                	and	a5,a5,15
    145c:	974e                	add	a4,a4,s3
    145e:	97ce                	add	a5,a5,s3
    1460:	005105a3          	sb	t0,11(sp)
    1464:	01f10623          	sb	t6,12(sp)
    1468:	01e106a3          	sb	t5,13(sp)
    146c:	01d10723          	sb	t4,14(sp)
    1470:	01c107a3          	sb	t3,15(sp)
    1474:	00610823          	sb	t1,16(sp)
    1478:	011108a3          	sb	a7,17(sp)
    147c:	00710923          	sb	t2,18(sp)
    1480:	010109a3          	sb	a6,19(sp)
    1484:	00a10a23          	sb	a0,20(sp)
    1488:	00b10aa3          	sb	a1,21(sp)
    148c:	00d10b23          	sb	a3,22(sp)
    1490:	00110ba3          	sb	ra,23(sp)
    1494:	00810523          	sb	s0,10(sp)
    1498:	00074703          	lbu	a4,0(a4)
    149c:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14a0:	002c                	add	a1,sp,8
    14a2:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14a4:	00e10c23          	sb	a4,24(sp)
    14a8:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14ac:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14b0:	7e8000ef          	jal	1c98 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14b4:	00248513          	add	a0,s1,2
        if (!*s)
    14b8:	00054783          	lbu	a5,0(a0)
    14bc:	e8079ce3          	bnez	a5,1354 <printf+0x4c>
    }
    va_end(ap);
}
    14c0:	70e6                	ld	ra,120(sp)
    14c2:	7446                	ld	s0,112(sp)
    14c4:	74a6                	ld	s1,104(sp)
    14c6:	7906                	ld	s2,96(sp)
    14c8:	69e6                	ld	s3,88(sp)
    14ca:	6a46                	ld	s4,80(sp)
    14cc:	6aa6                	ld	s5,72(sp)
    14ce:	6b06                	ld	s6,64(sp)
    14d0:	7be2                	ld	s7,56(sp)
    14d2:	6129                	add	sp,sp,192
    14d4:	8082                	ret
    14d6:	84b2                	mv	s1,a2
    14d8:	a039                	j	14e6 <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14da:	0024c783          	lbu	a5,2(s1)
    14de:	0605                	add	a2,a2,1
    14e0:	0489                	add	s1,s1,2
    14e2:	e92791e3          	bne	a5,s2,1364 <printf+0x5c>
    14e6:	0014c783          	lbu	a5,1(s1)
    14ea:	ff2788e3          	beq	a5,s2,14da <printf+0x1d2>
        l = z - a;
    14ee:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14f2:	85aa                	mv	a1,a0
    14f4:	8622                	mv	a2,s0
    14f6:	4505                	li	a0,1
    14f8:	7a0000ef          	jal	1c98 <write>
        if (l)
    14fc:	e6040de3          	beqz	s0,1376 <printf+0x6e>
    1500:	8526                	mv	a0,s1
    1502:	b5a9                	j	134c <printf+0x44>
        switch (s[1])
    1504:	05779963          	bne	a5,s7,1556 <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    1508:	6782                	ld	a5,0(sp)
    150a:	45c1                	li	a1,16
    150c:	4388                	lw	a0,0(a5)
    150e:	07a1                	add	a5,a5,8
    1510:	e03e                	sd	a5,0(sp)
    1512:	bb7ff0ef          	jal	10c8 <printint.constprop.0>
        s += 2;
    1516:	00248513          	add	a0,s1,2
    151a:	bf79                	j	14b8 <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    151c:	6782                	ld	a5,0(sp)
    151e:	6380                	ld	s0,0(a5)
    1520:	07a1                	add	a5,a5,8
    1522:	e03e                	sd	a5,0(sp)
    1524:	cc21                	beqz	s0,157c <printf+0x274>
            l = strnlen(a, 200);
    1526:	0c800593          	li	a1,200
    152a:	8522                	mv	a0,s0
    152c:	460000ef          	jal	198c <strnlen>
    write(f, s, l);
    1530:	0005061b          	sext.w	a2,a0
    1534:	85a2                	mv	a1,s0
    1536:	4505                	li	a0,1
    1538:	760000ef          	jal	1c98 <write>
        s += 2;
    153c:	00248513          	add	a0,s1,2
    1540:	bfa5                	j	14b8 <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    1542:	6782                	ld	a5,0(sp)
    1544:	45a9                	li	a1,10
    1546:	4388                	lw	a0,0(a5)
    1548:	07a1                	add	a5,a5,8
    154a:	e03e                	sd	a5,0(sp)
    154c:	b7dff0ef          	jal	10c8 <printint.constprop.0>
        s += 2;
    1550:	00248513          	add	a0,s1,2
    1554:	b795                	j	14b8 <printf+0x1b0>
    return write(stdout, &byte, 1);
    1556:	4605                	li	a2,1
    1558:	002c                	add	a1,sp,8
    155a:	4505                	li	a0,1
    char byte = c;
    155c:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1560:	738000ef          	jal	1c98 <write>
    char byte = c;
    1564:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1568:	4605                	li	a2,1
    156a:	002c                	add	a1,sp,8
    156c:	4505                	li	a0,1
    char byte = c;
    156e:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1572:	726000ef          	jal	1c98 <write>
        s += 2;
    1576:	00248513          	add	a0,s1,2
    157a:	bf3d                	j	14b8 <printf+0x1b0>
                a = "(null)";
    157c:	00001417          	auipc	s0,0x1
    1580:	9f440413          	add	s0,s0,-1548 # 1f70 <__clone+0xa0>
    1584:	b74d                	j	1526 <printf+0x21e>

0000000000001586 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1586:	1141                	add	sp,sp,-16
    1588:	e406                	sd	ra,8(sp)
    puts(m);
    158a:	d5dff0ef          	jal	12e6 <puts>
    exit(-100);
}
    158e:	60a2                	ld	ra,8(sp)
    exit(-100);
    1590:	f9c00513          	li	a0,-100
}
    1594:	0141                	add	sp,sp,16
    exit(-100);
    1596:	af89                	j	1ce8 <exit>

0000000000001598 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1598:	02000793          	li	a5,32
    159c:	00f50663          	beq	a0,a5,15a8 <isspace+0x10>
    15a0:	355d                	addw	a0,a0,-9
    15a2:	00553513          	sltiu	a0,a0,5
    15a6:	8082                	ret
    15a8:	4505                	li	a0,1
}
    15aa:	8082                	ret

00000000000015ac <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15ac:	fd05051b          	addw	a0,a0,-48
}
    15b0:	00a53513          	sltiu	a0,a0,10
    15b4:	8082                	ret

00000000000015b6 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15b6:	02000713          	li	a4,32
    15ba:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15bc:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15c0:	ff76879b          	addw	a5,a3,-9
    15c4:	06e68063          	beq	a3,a4,1624 <atoi+0x6e>
    15c8:	0006859b          	sext.w	a1,a3
    15cc:	04f67c63          	bgeu	a2,a5,1624 <atoi+0x6e>
        s++;
    switch (*s)
    15d0:	02b00793          	li	a5,43
    15d4:	06f68563          	beq	a3,a5,163e <atoi+0x88>
    15d8:	02d00793          	li	a5,45
    15dc:	04f69663          	bne	a3,a5,1628 <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15e0:	00154683          	lbu	a3,1(a0)
    15e4:	47a5                	li	a5,9
        s++;
    15e6:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    15ea:	fd06869b          	addw	a3,a3,-48
    15ee:	8636                	mv	a2,a3
    while (isdigit(*s))
    15f0:	04d7e563          	bltu	a5,a3,163a <atoi+0x84>
        neg = 1;
    15f4:	4885                	li	a7,1
    int n = 0, neg = 0;
    15f6:	4501                	li	a0,0
    while (isdigit(*s))
    15f8:	4825                	li	a6,9
    15fa:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    15fe:	0025179b          	sllw	a5,a0,0x2
    1602:	9fa9                	addw	a5,a5,a0
    1604:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    1608:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    160c:	85b2                	mv	a1,a2
    160e:	40c7853b          	subw	a0,a5,a2
    1612:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    1614:	8636                	mv	a2,a3
    while (isdigit(*s))
    1616:	fed872e3          	bgeu	a6,a3,15fa <atoi+0x44>
    return neg ? n : -n;
    161a:	02089163          	bnez	a7,163c <atoi+0x86>
    161e:	40f5853b          	subw	a0,a1,a5
    1622:	8082                	ret
        s++;
    1624:	0505                	add	a0,a0,1
    1626:	bf59                	j	15bc <atoi+0x6>
    while (isdigit(*s))
    1628:	fd05859b          	addw	a1,a1,-48
    162c:	47a5                	li	a5,9
    162e:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1630:	4881                	li	a7,0
    1632:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    1636:	fcb7f0e3          	bgeu	a5,a1,15f6 <atoi+0x40>
    return neg ? n : -n;
    163a:	4501                	li	a0,0
}
    163c:	8082                	ret
    while (isdigit(*s))
    163e:	00154683          	lbu	a3,1(a0)
    1642:	47a5                	li	a5,9
        s++;
    1644:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1648:	fd06869b          	addw	a3,a3,-48
    164c:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    164e:	4881                	li	a7,0
    while (isdigit(*s))
    1650:	fad7f3e3          	bgeu	a5,a3,15f6 <atoi+0x40>
    return neg ? n : -n;
    1654:	4501                	li	a0,0
    1656:	8082                	ret

0000000000001658 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1658:	16060f63          	beqz	a2,17d6 <memset+0x17e>
    165c:	40a006b3          	neg	a3,a0
    1660:	0076f793          	and	a5,a3,7
    1664:	00778813          	add	a6,a5,7
    1668:	48ad                	li	a7,11
    166a:	0ff5f713          	zext.b	a4,a1
    166e:	fff60593          	add	a1,a2,-1
    1672:	17186363          	bltu	a6,a7,17d8 <memset+0x180>
    1676:	1705eb63          	bltu	a1,a6,17ec <memset+0x194>
    167a:	16078163          	beqz	a5,17dc <memset+0x184>
    167e:	00e50023          	sb	a4,0(a0)
    1682:	0066f593          	and	a1,a3,6
    1686:	14058e63          	beqz	a1,17e2 <memset+0x18a>
    168a:	00e500a3          	sb	a4,1(a0)
    168e:	4589                	li	a1,2
    1690:	00250813          	add	a6,a0,2
    1694:	04f5f663          	bgeu	a1,a5,16e0 <memset+0x88>
    1698:	00e50123          	sb	a4,2(a0)
    169c:	8a91                	and	a3,a3,4
    169e:	00350813          	add	a6,a0,3
    16a2:	458d                	li	a1,3
    16a4:	ce95                	beqz	a3,16e0 <memset+0x88>
    16a6:	00e501a3          	sb	a4,3(a0)
    16aa:	4691                	li	a3,4
    16ac:	00450813          	add	a6,a0,4
    16b0:	4591                	li	a1,4
    16b2:	02f6f763          	bgeu	a3,a5,16e0 <memset+0x88>
    16b6:	00e50223          	sb	a4,4(a0)
    16ba:	4695                	li	a3,5
    16bc:	00550813          	add	a6,a0,5
    16c0:	4595                	li	a1,5
    16c2:	00d78f63          	beq	a5,a3,16e0 <memset+0x88>
    16c6:	00e502a3          	sb	a4,5(a0)
    16ca:	469d                	li	a3,7
    16cc:	00650813          	add	a6,a0,6
    16d0:	4599                	li	a1,6
    16d2:	00d79763          	bne	a5,a3,16e0 <memset+0x88>
    16d6:	00750813          	add	a6,a0,7
    16da:	00e50323          	sb	a4,6(a0)
    16de:	459d                	li	a1,7
    16e0:	00871693          	sll	a3,a4,0x8
    16e4:	01071313          	sll	t1,a4,0x10
    16e8:	8ed9                	or	a3,a3,a4
    16ea:	01871893          	sll	a7,a4,0x18
    16ee:	0066e6b3          	or	a3,a3,t1
    16f2:	0116e6b3          	or	a3,a3,a7
    16f6:	02071313          	sll	t1,a4,0x20
    16fa:	02871893          	sll	a7,a4,0x28
    16fe:	0066e6b3          	or	a3,a3,t1
    1702:	40f60e33          	sub	t3,a2,a5
    1706:	03071313          	sll	t1,a4,0x30
    170a:	0116e6b3          	or	a3,a3,a7
    170e:	0066e6b3          	or	a3,a3,t1
    1712:	03871893          	sll	a7,a4,0x38
    1716:	97aa                	add	a5,a5,a0
    1718:	ff8e7313          	and	t1,t3,-8
    171c:	0116e6b3          	or	a3,a3,a7
    1720:	00f308b3          	add	a7,t1,a5
    1724:	e394                	sd	a3,0(a5)
    1726:	07a1                	add	a5,a5,8
    1728:	ff179ee3          	bne	a5,a7,1724 <memset+0xcc>
    172c:	006806b3          	add	a3,a6,t1
    1730:	00b307bb          	addw	a5,t1,a1
    1734:	0bc30b63          	beq	t1,t3,17ea <memset+0x192>
    1738:	00e68023          	sb	a4,0(a3)
    173c:	0017859b          	addw	a1,a5,1
    1740:	08c5fb63          	bgeu	a1,a2,17d6 <memset+0x17e>
    1744:	00e680a3          	sb	a4,1(a3)
    1748:	0027859b          	addw	a1,a5,2
    174c:	08c5f563          	bgeu	a1,a2,17d6 <memset+0x17e>
    1750:	00e68123          	sb	a4,2(a3)
    1754:	0037859b          	addw	a1,a5,3
    1758:	06c5ff63          	bgeu	a1,a2,17d6 <memset+0x17e>
    175c:	00e681a3          	sb	a4,3(a3)
    1760:	0047859b          	addw	a1,a5,4
    1764:	06c5f963          	bgeu	a1,a2,17d6 <memset+0x17e>
    1768:	00e68223          	sb	a4,4(a3)
    176c:	0057859b          	addw	a1,a5,5
    1770:	06c5f363          	bgeu	a1,a2,17d6 <memset+0x17e>
    1774:	00e682a3          	sb	a4,5(a3)
    1778:	0067859b          	addw	a1,a5,6
    177c:	04c5fd63          	bgeu	a1,a2,17d6 <memset+0x17e>
    1780:	00e68323          	sb	a4,6(a3)
    1784:	0077859b          	addw	a1,a5,7
    1788:	04c5f763          	bgeu	a1,a2,17d6 <memset+0x17e>
    178c:	00e683a3          	sb	a4,7(a3)
    1790:	0087859b          	addw	a1,a5,8
    1794:	04c5f163          	bgeu	a1,a2,17d6 <memset+0x17e>
    1798:	00e68423          	sb	a4,8(a3)
    179c:	0097859b          	addw	a1,a5,9
    17a0:	02c5fb63          	bgeu	a1,a2,17d6 <memset+0x17e>
    17a4:	00e684a3          	sb	a4,9(a3)
    17a8:	00a7859b          	addw	a1,a5,10
    17ac:	02c5f563          	bgeu	a1,a2,17d6 <memset+0x17e>
    17b0:	00e68523          	sb	a4,10(a3)
    17b4:	00b7859b          	addw	a1,a5,11
    17b8:	00c5ff63          	bgeu	a1,a2,17d6 <memset+0x17e>
    17bc:	00e685a3          	sb	a4,11(a3)
    17c0:	00c7859b          	addw	a1,a5,12
    17c4:	00c5f963          	bgeu	a1,a2,17d6 <memset+0x17e>
    17c8:	00e68623          	sb	a4,12(a3)
    17cc:	27b5                	addw	a5,a5,13
    17ce:	00c7f463          	bgeu	a5,a2,17d6 <memset+0x17e>
    17d2:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17d6:	8082                	ret
    17d8:	482d                	li	a6,11
    17da:	bd71                	j	1676 <memset+0x1e>
    char *p = dest;
    17dc:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17de:	4581                	li	a1,0
    17e0:	b701                	j	16e0 <memset+0x88>
    17e2:	00150813          	add	a6,a0,1
    17e6:	4585                	li	a1,1
    17e8:	bde5                	j	16e0 <memset+0x88>
    17ea:	8082                	ret
    char *p = dest;
    17ec:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17ee:	4781                	li	a5,0
    17f0:	b7a1                	j	1738 <memset+0xe0>

00000000000017f2 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17f2:	00054783          	lbu	a5,0(a0)
    17f6:	0005c703          	lbu	a4,0(a1)
    17fa:	00e79863          	bne	a5,a4,180a <strcmp+0x18>
    17fe:	0505                	add	a0,a0,1
    1800:	0585                	add	a1,a1,1
    1802:	fbe5                	bnez	a5,17f2 <strcmp>
    1804:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1806:	9d19                	subw	a0,a0,a4
    1808:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    180a:	0007851b          	sext.w	a0,a5
    180e:	bfe5                	j	1806 <strcmp+0x14>

0000000000001810 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1810:	ca15                	beqz	a2,1844 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1812:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1816:	167d                	add	a2,a2,-1
    1818:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    181c:	eb99                	bnez	a5,1832 <strncmp+0x22>
    181e:	a815                	j	1852 <strncmp+0x42>
    1820:	00a68e63          	beq	a3,a0,183c <strncmp+0x2c>
    1824:	0505                	add	a0,a0,1
    1826:	00f71b63          	bne	a4,a5,183c <strncmp+0x2c>
    182a:	00054783          	lbu	a5,0(a0)
    182e:	cf89                	beqz	a5,1848 <strncmp+0x38>
    1830:	85b2                	mv	a1,a2
    1832:	0005c703          	lbu	a4,0(a1)
    1836:	00158613          	add	a2,a1,1
    183a:	f37d                	bnez	a4,1820 <strncmp+0x10>
        ;
    return *l - *r;
    183c:	0007851b          	sext.w	a0,a5
    1840:	9d19                	subw	a0,a0,a4
    1842:	8082                	ret
        return 0;
    1844:	4501                	li	a0,0
}
    1846:	8082                	ret
    return *l - *r;
    1848:	0015c703          	lbu	a4,1(a1)
    184c:	4501                	li	a0,0
    184e:	9d19                	subw	a0,a0,a4
    1850:	8082                	ret
    1852:	0005c703          	lbu	a4,0(a1)
    1856:	4501                	li	a0,0
    1858:	b7e5                	j	1840 <strncmp+0x30>

000000000000185a <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    185a:	00757793          	and	a5,a0,7
    185e:	cf89                	beqz	a5,1878 <strlen+0x1e>
    1860:	87aa                	mv	a5,a0
    1862:	a029                	j	186c <strlen+0x12>
    1864:	0785                	add	a5,a5,1
    1866:	0077f713          	and	a4,a5,7
    186a:	cb01                	beqz	a4,187a <strlen+0x20>
        if (!*s)
    186c:	0007c703          	lbu	a4,0(a5)
    1870:	fb75                	bnez	a4,1864 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1872:	40a78533          	sub	a0,a5,a0
}
    1876:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1878:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    187a:	feff05b7          	lui	a1,0xfeff0
    187e:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedf77>
    1882:	f0101637          	lui	a2,0xf0101
    1886:	05c2                	sll	a1,a1,0x10
    1888:	0612                	sll	a2,a2,0x4
    188a:	6394                	ld	a3,0(a5)
    188c:	eff58593          	add	a1,a1,-257
    1890:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff179>
    1894:	05c2                	sll	a1,a1,0x10
    1896:	0642                	sll	a2,a2,0x10
    1898:	eff58593          	add	a1,a1,-257
    189c:	10160613          	add	a2,a2,257
    18a0:	00b68733          	add	a4,a3,a1
    18a4:	063e                	sll	a2,a2,0xf
    18a6:	fff6c693          	not	a3,a3
    18aa:	8f75                	and	a4,a4,a3
    18ac:	08060613          	add	a2,a2,128
    18b0:	8f71                	and	a4,a4,a2
    18b2:	eb11                	bnez	a4,18c6 <strlen+0x6c>
    18b4:	6794                	ld	a3,8(a5)
    18b6:	07a1                	add	a5,a5,8
    18b8:	00b68733          	add	a4,a3,a1
    18bc:	fff6c693          	not	a3,a3
    18c0:	8f75                	and	a4,a4,a3
    18c2:	8f71                	and	a4,a4,a2
    18c4:	db65                	beqz	a4,18b4 <strlen+0x5a>
    for (; *s; s++)
    18c6:	0007c703          	lbu	a4,0(a5)
    18ca:	d745                	beqz	a4,1872 <strlen+0x18>
    18cc:	0017c703          	lbu	a4,1(a5)
    18d0:	0785                	add	a5,a5,1
    18d2:	d345                	beqz	a4,1872 <strlen+0x18>
    18d4:	0017c703          	lbu	a4,1(a5)
    18d8:	0785                	add	a5,a5,1
    18da:	fb6d                	bnez	a4,18cc <strlen+0x72>
    18dc:	bf59                	j	1872 <strlen+0x18>

00000000000018de <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18de:	00757713          	and	a4,a0,7
{
    18e2:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18e4:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18e8:	cb19                	beqz	a4,18fe <memchr+0x20>
    18ea:	ce59                	beqz	a2,1988 <memchr+0xaa>
    18ec:	0007c703          	lbu	a4,0(a5)
    18f0:	00b70963          	beq	a4,a1,1902 <memchr+0x24>
    18f4:	0785                	add	a5,a5,1
    18f6:	0077f713          	and	a4,a5,7
    18fa:	167d                	add	a2,a2,-1
    18fc:	f77d                	bnez	a4,18ea <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18fe:	4501                	li	a0,0
    if (n && *s != c)
    1900:	c649                	beqz	a2,198a <memchr+0xac>
    1902:	0007c703          	lbu	a4,0(a5)
    1906:	06b70663          	beq	a4,a1,1972 <memchr+0x94>
        size_t k = ONES * c;
    190a:	01010737          	lui	a4,0x1010
    190e:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e179>
    1912:	0742                	sll	a4,a4,0x10
    1914:	10170713          	add	a4,a4,257
    1918:	0742                	sll	a4,a4,0x10
    191a:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    191e:	469d                	li	a3,7
        size_t k = ONES * c;
    1920:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1924:	04c6f763          	bgeu	a3,a2,1972 <memchr+0x94>
    1928:	f0101837          	lui	a6,0xf0101
    192c:	feff08b7          	lui	a7,0xfeff0
    1930:	0812                	sll	a6,a6,0x4
    1932:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedf77>
    1936:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff179>
    193a:	08c2                	sll	a7,a7,0x10
    193c:	0842                	sll	a6,a6,0x10
    193e:	eff88893          	add	a7,a7,-257
    1942:	10180813          	add	a6,a6,257
    1946:	08c2                	sll	a7,a7,0x10
    1948:	083e                	sll	a6,a6,0xf
    194a:	eff88893          	add	a7,a7,-257
    194e:	08080813          	add	a6,a6,128
    1952:	431d                	li	t1,7
    1954:	a029                	j	195e <memchr+0x80>
    1956:	1661                	add	a2,a2,-8
    1958:	07a1                	add	a5,a5,8
    195a:	02c37663          	bgeu	t1,a2,1986 <memchr+0xa8>
    195e:	6398                	ld	a4,0(a5)
    1960:	8f29                	xor	a4,a4,a0
    1962:	011706b3          	add	a3,a4,a7
    1966:	fff74713          	not	a4,a4
    196a:	8f75                	and	a4,a4,a3
    196c:	01077733          	and	a4,a4,a6
    1970:	d37d                	beqz	a4,1956 <memchr+0x78>
        s = (const void *)w;
    1972:	853e                	mv	a0,a5
    1974:	a019                	j	197a <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    1976:	0505                	add	a0,a0,1
    1978:	ca01                	beqz	a2,1988 <memchr+0xaa>
    197a:	00054783          	lbu	a5,0(a0)
    197e:	167d                	add	a2,a2,-1
    1980:	feb79be3          	bne	a5,a1,1976 <memchr+0x98>
    1984:	8082                	ret
    1986:	f675                	bnez	a2,1972 <memchr+0x94>
    return n ? (void *)s : 0;
    1988:	4501                	li	a0,0
}
    198a:	8082                	ret

000000000000198c <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    198c:	1101                	add	sp,sp,-32
    198e:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1990:	862e                	mv	a2,a1
{
    1992:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1994:	4581                	li	a1,0
{
    1996:	e426                	sd	s1,8(sp)
    1998:	ec06                	sd	ra,24(sp)
    199a:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    199c:	f43ff0ef          	jal	18de <memchr>
    return p ? p - s : n;
    19a0:	c519                	beqz	a0,19ae <strnlen+0x22>
}
    19a2:	60e2                	ld	ra,24(sp)
    19a4:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19a6:	8d05                	sub	a0,a0,s1
}
    19a8:	64a2                	ld	s1,8(sp)
    19aa:	6105                	add	sp,sp,32
    19ac:	8082                	ret
    19ae:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19b0:	8522                	mv	a0,s0
}
    19b2:	6442                	ld	s0,16(sp)
    19b4:	64a2                	ld	s1,8(sp)
    19b6:	6105                	add	sp,sp,32
    19b8:	8082                	ret

00000000000019ba <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19ba:	00b547b3          	xor	a5,a0,a1
    19be:	8b9d                	and	a5,a5,7
    19c0:	efb1                	bnez	a5,1a1c <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19c2:	0075f793          	and	a5,a1,7
    19c6:	ebb5                	bnez	a5,1a3a <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19c8:	feff0637          	lui	a2,0xfeff0
    19cc:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedf77>
    19d0:	f01016b7          	lui	a3,0xf0101
    19d4:	0642                	sll	a2,a2,0x10
    19d6:	0692                	sll	a3,a3,0x4
    19d8:	6198                	ld	a4,0(a1)
    19da:	eff60613          	add	a2,a2,-257
    19de:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff179>
    19e2:	0642                	sll	a2,a2,0x10
    19e4:	06c2                	sll	a3,a3,0x10
    19e6:	eff60613          	add	a2,a2,-257
    19ea:	10168693          	add	a3,a3,257
    19ee:	00c707b3          	add	a5,a4,a2
    19f2:	fff74813          	not	a6,a4
    19f6:	06be                	sll	a3,a3,0xf
    19f8:	0107f7b3          	and	a5,a5,a6
    19fc:	08068693          	add	a3,a3,128
    1a00:	8ff5                	and	a5,a5,a3
    1a02:	ef89                	bnez	a5,1a1c <strcpy+0x62>
    1a04:	05a1                	add	a1,a1,8
    1a06:	e118                	sd	a4,0(a0)
    1a08:	6198                	ld	a4,0(a1)
    1a0a:	0521                	add	a0,a0,8
    1a0c:	00c707b3          	add	a5,a4,a2
    1a10:	fff74813          	not	a6,a4
    1a14:	0107f7b3          	and	a5,a5,a6
    1a18:	8ff5                	and	a5,a5,a3
    1a1a:	d7ed                	beqz	a5,1a04 <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a1c:	0005c783          	lbu	a5,0(a1)
    1a20:	00f50023          	sb	a5,0(a0)
    1a24:	c785                	beqz	a5,1a4c <strcpy+0x92>
    1a26:	0015c783          	lbu	a5,1(a1)
    1a2a:	0505                	add	a0,a0,1
    1a2c:	0585                	add	a1,a1,1
    1a2e:	00f50023          	sb	a5,0(a0)
    1a32:	fbf5                	bnez	a5,1a26 <strcpy+0x6c>
        ;
    return d;
}
    1a34:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a36:	0505                	add	a0,a0,1
    1a38:	db41                	beqz	a4,19c8 <strcpy+0xe>
            if (!(*d = *s))
    1a3a:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a3e:	0585                	add	a1,a1,1
    1a40:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a44:	00f50023          	sb	a5,0(a0)
    1a48:	f7fd                	bnez	a5,1a36 <strcpy+0x7c>
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
    1a4e:	00b547b3          	xor	a5,a0,a1
    1a52:	8b9d                	and	a5,a5,7
    1a54:	efbd                	bnez	a5,1ad2 <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a56:	0075f793          	and	a5,a1,7
    1a5a:	1c078563          	beqz	a5,1c24 <strncpy+0x1d6>
    1a5e:	ea11                	bnez	a2,1a72 <strncpy+0x24>
    1a60:	8082                	ret
    1a62:	0585                	add	a1,a1,1
    1a64:	0075f793          	and	a5,a1,7
    1a68:	167d                	add	a2,a2,-1
    1a6a:	0505                	add	a0,a0,1
    1a6c:	1a078c63          	beqz	a5,1c24 <strncpy+0x1d6>
    1a70:	ca3d                	beqz	a2,1ae6 <strncpy+0x98>
    1a72:	0005c783          	lbu	a5,0(a1)
    1a76:	00f50023          	sb	a5,0(a0)
    1a7a:	f7e5                	bnez	a5,1a62 <strncpy+0x14>
            ;
        if (!n || !*s)
    1a7c:	0005c783          	lbu	a5,0(a1)
    1a80:	c7a5                	beqz	a5,1ae8 <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a82:	479d                	li	a5,7
    1a84:	04c7f863          	bgeu	a5,a2,1ad4 <strncpy+0x86>
    1a88:	f01016b7          	lui	a3,0xf0101
    1a8c:	feff0837          	lui	a6,0xfeff0
    1a90:	0692                	sll	a3,a3,0x4
    1a92:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedf77>
    1a96:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff179>
    1a9a:	0842                	sll	a6,a6,0x10
    1a9c:	06c2                	sll	a3,a3,0x10
    1a9e:	eff80813          	add	a6,a6,-257
    1aa2:	10168693          	add	a3,a3,257
    1aa6:	0842                	sll	a6,a6,0x10
    1aa8:	06be                	sll	a3,a3,0xf
    1aaa:	eff80813          	add	a6,a6,-257
    1aae:	08068693          	add	a3,a3,128
    1ab2:	431d                	li	t1,7
    1ab4:	6198                	ld	a4,0(a1)
    1ab6:	010707b3          	add	a5,a4,a6
    1aba:	fff74893          	not	a7,a4
    1abe:	0117f7b3          	and	a5,a5,a7
    1ac2:	8ff5                	and	a5,a5,a3
    1ac4:	eb81                	bnez	a5,1ad4 <strncpy+0x86>
            *wd = *ws;
    1ac6:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ac8:	1661                	add	a2,a2,-8
    1aca:	05a1                	add	a1,a1,8
    1acc:	0521                	add	a0,a0,8
    1ace:	fec363e3          	bltu	t1,a2,1ab4 <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1ad2:	ca11                	beqz	a2,1ae6 <strncpy+0x98>
    1ad4:	0005c783          	lbu	a5,0(a1)
    1ad8:	0585                	add	a1,a1,1
    1ada:	00f50023          	sb	a5,0(a0)
    1ade:	c789                	beqz	a5,1ae8 <strncpy+0x9a>
    1ae0:	167d                	add	a2,a2,-1
    1ae2:	0505                	add	a0,a0,1
    1ae4:	fa65                	bnez	a2,1ad4 <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1ae6:	8082                	ret
    1ae8:	40a00733          	neg	a4,a0
    1aec:	00777793          	and	a5,a4,7
    1af0:	00778693          	add	a3,a5,7
    1af4:	482d                	li	a6,11
    1af6:	fff60593          	add	a1,a2,-1
    1afa:	1106ef63          	bltu	a3,a6,1c18 <strncpy+0x1ca>
    1afe:	12d5ee63          	bltu	a1,a3,1c3a <strncpy+0x1ec>
    1b02:	12078563          	beqz	a5,1c2c <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b06:	00050023          	sb	zero,0(a0)
    1b0a:	00677693          	and	a3,a4,6
    1b0e:	12068263          	beqz	a3,1c32 <strncpy+0x1e4>
    1b12:	000500a3          	sb	zero,1(a0)
    1b16:	4689                	li	a3,2
    1b18:	12f6f463          	bgeu	a3,a5,1c40 <strncpy+0x1f2>
    1b1c:	00050123          	sb	zero,2(a0)
    1b20:	8b11                	and	a4,a4,4
    1b22:	cf6d                	beqz	a4,1c1c <strncpy+0x1ce>
    1b24:	000501a3          	sb	zero,3(a0)
    1b28:	4711                	li	a4,4
    1b2a:	00450693          	add	a3,a0,4
    1b2e:	02f77363          	bgeu	a4,a5,1b54 <strncpy+0x106>
    1b32:	00050223          	sb	zero,4(a0)
    1b36:	4715                	li	a4,5
    1b38:	00550693          	add	a3,a0,5
    1b3c:	00e78c63          	beq	a5,a4,1b54 <strncpy+0x106>
    1b40:	000502a3          	sb	zero,5(a0)
    1b44:	471d                	li	a4,7
    1b46:	10e79163          	bne	a5,a4,1c48 <strncpy+0x1fa>
    1b4a:	00750693          	add	a3,a0,7
    1b4e:	00050323          	sb	zero,6(a0)
    1b52:	471d                	li	a4,7
    1b54:	40f608b3          	sub	a7,a2,a5
    1b58:	ff88f813          	and	a6,a7,-8
    1b5c:	97aa                	add	a5,a5,a0
    1b5e:	010785b3          	add	a1,a5,a6
    1b62:	0007b023          	sd	zero,0(a5)
    1b66:	07a1                	add	a5,a5,8
    1b68:	feb79de3          	bne	a5,a1,1b62 <strncpy+0x114>
    1b6c:	00e807bb          	addw	a5,a6,a4
    1b70:	01068733          	add	a4,a3,a6
    1b74:	0b088b63          	beq	a7,a6,1c2a <strncpy+0x1dc>
    1b78:	00070023          	sb	zero,0(a4)
    1b7c:	0017869b          	addw	a3,a5,1
    1b80:	f6c6f3e3          	bgeu	a3,a2,1ae6 <strncpy+0x98>
    1b84:	000700a3          	sb	zero,1(a4)
    1b88:	0027869b          	addw	a3,a5,2
    1b8c:	f4c6fde3          	bgeu	a3,a2,1ae6 <strncpy+0x98>
    1b90:	00070123          	sb	zero,2(a4)
    1b94:	0037869b          	addw	a3,a5,3
    1b98:	f4c6f7e3          	bgeu	a3,a2,1ae6 <strncpy+0x98>
    1b9c:	000701a3          	sb	zero,3(a4)
    1ba0:	0047869b          	addw	a3,a5,4
    1ba4:	f4c6f1e3          	bgeu	a3,a2,1ae6 <strncpy+0x98>
    1ba8:	00070223          	sb	zero,4(a4)
    1bac:	0057869b          	addw	a3,a5,5
    1bb0:	f2c6fbe3          	bgeu	a3,a2,1ae6 <strncpy+0x98>
    1bb4:	000702a3          	sb	zero,5(a4)
    1bb8:	0067869b          	addw	a3,a5,6
    1bbc:	f2c6f5e3          	bgeu	a3,a2,1ae6 <strncpy+0x98>
    1bc0:	00070323          	sb	zero,6(a4)
    1bc4:	0077869b          	addw	a3,a5,7
    1bc8:	f0c6ffe3          	bgeu	a3,a2,1ae6 <strncpy+0x98>
    1bcc:	000703a3          	sb	zero,7(a4)
    1bd0:	0087869b          	addw	a3,a5,8
    1bd4:	f0c6f9e3          	bgeu	a3,a2,1ae6 <strncpy+0x98>
    1bd8:	00070423          	sb	zero,8(a4)
    1bdc:	0097869b          	addw	a3,a5,9
    1be0:	f0c6f3e3          	bgeu	a3,a2,1ae6 <strncpy+0x98>
    1be4:	000704a3          	sb	zero,9(a4)
    1be8:	00a7869b          	addw	a3,a5,10
    1bec:	eec6fde3          	bgeu	a3,a2,1ae6 <strncpy+0x98>
    1bf0:	00070523          	sb	zero,10(a4)
    1bf4:	00b7869b          	addw	a3,a5,11
    1bf8:	eec6f7e3          	bgeu	a3,a2,1ae6 <strncpy+0x98>
    1bfc:	000705a3          	sb	zero,11(a4)
    1c00:	00c7869b          	addw	a3,a5,12
    1c04:	eec6f1e3          	bgeu	a3,a2,1ae6 <strncpy+0x98>
    1c08:	00070623          	sb	zero,12(a4)
    1c0c:	27b5                	addw	a5,a5,13
    1c0e:	ecc7fce3          	bgeu	a5,a2,1ae6 <strncpy+0x98>
    1c12:	000706a3          	sb	zero,13(a4)
}
    1c16:	8082                	ret
    1c18:	46ad                	li	a3,11
    1c1a:	b5d5                	j	1afe <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c1c:	00350693          	add	a3,a0,3
    1c20:	470d                	li	a4,3
    1c22:	bf0d                	j	1b54 <strncpy+0x106>
        if (!n || !*s)
    1c24:	e4061ce3          	bnez	a2,1a7c <strncpy+0x2e>
}
    1c28:	8082                	ret
    1c2a:	8082                	ret
    char *p = dest;
    1c2c:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c2e:	4701                	li	a4,0
    1c30:	b715                	j	1b54 <strncpy+0x106>
    1c32:	00150693          	add	a3,a0,1
    1c36:	4705                	li	a4,1
    1c38:	bf31                	j	1b54 <strncpy+0x106>
    char *p = dest;
    1c3a:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c3c:	4781                	li	a5,0
    1c3e:	bf2d                	j	1b78 <strncpy+0x12a>
    1c40:	00250693          	add	a3,a0,2
    1c44:	4709                	li	a4,2
    1c46:	b739                	j	1b54 <strncpy+0x106>
    1c48:	00650693          	add	a3,a0,6
    1c4c:	4719                	li	a4,6
    1c4e:	b719                	j	1b54 <strncpy+0x106>

0000000000001c50 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c50:	87aa                	mv	a5,a0
    1c52:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c54:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c58:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c5c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c5e:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c60:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c64:	2501                	sext.w	a0,a0
    1c66:	8082                	ret

0000000000001c68 <openat>:
    register long a7 __asm__("a7") = n;
    1c68:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c6c:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c70:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c74:	2501                	sext.w	a0,a0
    1c76:	8082                	ret

0000000000001c78 <fcntl>:
    register long a7 __asm__("a7") = n;
    1c78:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c7a:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1c7e:	2501                	sext.w	a0,a0
    1c80:	8082                	ret

0000000000001c82 <close>:
    register long a7 __asm__("a7") = n;
    1c82:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c86:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c8a:	2501                	sext.w	a0,a0
    1c8c:	8082                	ret

0000000000001c8e <read>:
    register long a7 __asm__("a7") = n;
    1c8e:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c92:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c96:	8082                	ret

0000000000001c98 <write>:
    register long a7 __asm__("a7") = n;
    1c98:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c9c:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1ca0:	8082                	ret

0000000000001ca2 <getpid>:
    register long a7 __asm__("a7") = n;
    1ca2:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1ca6:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1caa:	2501                	sext.w	a0,a0
    1cac:	8082                	ret

0000000000001cae <getppid>:
    register long a7 __asm__("a7") = n;
    1cae:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1cb2:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cb6:	2501                	sext.w	a0,a0
    1cb8:	8082                	ret

0000000000001cba <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cba:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cbe:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cc2:	2501                	sext.w	a0,a0
    1cc4:	8082                	ret

0000000000001cc6 <fork>:
    register long a7 __asm__("a7") = n;
    1cc6:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cca:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1ccc:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cce:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cd2:	2501                	sext.w	a0,a0
    1cd4:	8082                	ret

0000000000001cd6 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cd6:	85b2                	mv	a1,a2
    1cd8:	863a                	mv	a2,a4
    if (stack)
    1cda:	c191                	beqz	a1,1cde <clone+0x8>
	stack += stack_size;
    1cdc:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cde:	4781                	li	a5,0
    1ce0:	4701                	li	a4,0
    1ce2:	4681                	li	a3,0
    1ce4:	2601                	sext.w	a2,a2
    1ce6:	a2ed                	j	1ed0 <__clone>

0000000000001ce8 <exit>:
    register long a7 __asm__("a7") = n;
    1ce8:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cec:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cf0:	8082                	ret

0000000000001cf2 <waitpid>:
    register long a7 __asm__("a7") = n;
    1cf2:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cf6:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cf8:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cfc:	2501                	sext.w	a0,a0
    1cfe:	8082                	ret

0000000000001d00 <exec>:
    register long a7 __asm__("a7") = n;
    1d00:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d04:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d08:	2501                	sext.w	a0,a0
    1d0a:	8082                	ret

0000000000001d0c <execve>:
    register long a7 __asm__("a7") = n;
    1d0c:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d10:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d14:	2501                	sext.w	a0,a0
    1d16:	8082                	ret

0000000000001d18 <times>:
    register long a7 __asm__("a7") = n;
    1d18:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d1c:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d20:	2501                	sext.w	a0,a0
    1d22:	8082                	ret

0000000000001d24 <get_time>:

int64 get_time()
{
    1d24:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d26:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d2a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d2c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d2e:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d32:	2501                	sext.w	a0,a0
    1d34:	ed09                	bnez	a0,1d4e <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d36:	67a2                	ld	a5,8(sp)
    1d38:	3e800713          	li	a4,1000
    1d3c:	00015503          	lhu	a0,0(sp)
    1d40:	02e7d7b3          	divu	a5,a5,a4
    1d44:	02e50533          	mul	a0,a0,a4
    1d48:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d4a:	0141                	add	sp,sp,16
    1d4c:	8082                	ret
        return -1;
    1d4e:	557d                	li	a0,-1
    1d50:	bfed                	j	1d4a <get_time+0x26>

0000000000001d52 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d52:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d56:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d5a:	2501                	sext.w	a0,a0
    1d5c:	8082                	ret

0000000000001d5e <time>:
    register long a7 __asm__("a7") = n;
    1d5e:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d62:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d66:	2501                	sext.w	a0,a0
    1d68:	8082                	ret

0000000000001d6a <sleep>:

int sleep(unsigned long long time)
{
    1d6a:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d6c:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d6e:	850a                	mv	a0,sp
    1d70:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d72:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d76:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d78:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d7c:	e501                	bnez	a0,1d84 <sleep+0x1a>
    return 0;
    1d7e:	4501                	li	a0,0
}
    1d80:	0141                	add	sp,sp,16
    1d82:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d84:	4502                	lw	a0,0(sp)
}
    1d86:	0141                	add	sp,sp,16
    1d88:	8082                	ret

0000000000001d8a <set_priority>:
    register long a7 __asm__("a7") = n;
    1d8a:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d8e:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d92:	2501                	sext.w	a0,a0
    1d94:	8082                	ret

0000000000001d96 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d96:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d9a:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d9e:	8082                	ret

0000000000001da0 <munmap>:
    register long a7 __asm__("a7") = n;
    1da0:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1da4:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1da8:	2501                	sext.w	a0,a0
    1daa:	8082                	ret

0000000000001dac <wait>:

int wait(int *code)
{
    1dac:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dae:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1db2:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1db4:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1db6:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1db8:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1dbc:	2501                	sext.w	a0,a0
    1dbe:	8082                	ret

0000000000001dc0 <spawn>:
    register long a7 __asm__("a7") = n;
    1dc0:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1dc4:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dc8:	2501                	sext.w	a0,a0
    1dca:	8082                	ret

0000000000001dcc <mailread>:
    register long a7 __asm__("a7") = n;
    1dcc:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dd0:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dd4:	2501                	sext.w	a0,a0
    1dd6:	8082                	ret

0000000000001dd8 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dd8:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ddc:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1de0:	2501                	sext.w	a0,a0
    1de2:	8082                	ret

0000000000001de4 <fstat>:
    register long a7 __asm__("a7") = n;
    1de4:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1de8:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dec:	2501                	sext.w	a0,a0
    1dee:	8082                	ret

0000000000001df0 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1df0:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1df2:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1df6:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1df8:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1dfc:	2501                	sext.w	a0,a0
    1dfe:	8082                	ret

0000000000001e00 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e00:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e02:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e06:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e08:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e0c:	2501                	sext.w	a0,a0
    1e0e:	8082                	ret

0000000000001e10 <link>:

int link(char *old_path, char *new_path)
{
    1e10:	87aa                	mv	a5,a0
    1e12:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e14:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e18:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e1c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e1e:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e22:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e24:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <unlink>:

int unlink(char *path)
{
    1e2c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e2e:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e32:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e36:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e38:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e3c:	2501                	sext.w	a0,a0
    1e3e:	8082                	ret

0000000000001e40 <uname>:
    register long a7 __asm__("a7") = n;
    1e40:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e44:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e48:	2501                	sext.w	a0,a0
    1e4a:	8082                	ret

0000000000001e4c <brk>:
    register long a7 __asm__("a7") = n;
    1e4c:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e50:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e54:	2501                	sext.w	a0,a0
    1e56:	8082                	ret

0000000000001e58 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e58:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5a:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e5e:	8082                	ret

0000000000001e60 <chdir>:
    register long a7 __asm__("a7") = n;
    1e60:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e64:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e68:	2501                	sext.w	a0,a0
    1e6a:	8082                	ret

0000000000001e6c <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e6c:	862e                	mv	a2,a1
    1e6e:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e70:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e72:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e76:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e7a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e7c:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e7e:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e82:	2501                	sext.w	a0,a0
    1e84:	8082                	ret

0000000000001e86 <getdents>:
    register long a7 __asm__("a7") = n;
    1e86:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e8a:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e8e:	2501                	sext.w	a0,a0
    1e90:	8082                	ret

0000000000001e92 <pipe>:
    register long a7 __asm__("a7") = n;
    1e92:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e96:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e98:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e9c:	2501                	sext.w	a0,a0
    1e9e:	8082                	ret

0000000000001ea0 <dup>:
    register long a7 __asm__("a7") = n;
    1ea0:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1ea2:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1ea6:	2501                	sext.w	a0,a0
    1ea8:	8082                	ret

0000000000001eaa <dup2>:
    register long a7 __asm__("a7") = n;
    1eaa:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1eac:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eae:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1eb2:	2501                	sext.w	a0,a0
    1eb4:	8082                	ret

0000000000001eb6 <mount>:
    register long a7 __asm__("a7") = n;
    1eb6:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1eba:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ebe:	2501                	sext.w	a0,a0
    1ec0:	8082                	ret

0000000000001ec2 <umount>:
    register long a7 __asm__("a7") = n;
    1ec2:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ec6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec8:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ecc:	2501                	sext.w	a0,a0
    1ece:	8082                	ret

0000000000001ed0 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ed0:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1ed2:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ed4:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ed6:	8532                	mv	a0,a2
	mv a2, a4
    1ed8:	863a                	mv	a2,a4
	mv a3, a5
    1eda:	86be                	mv	a3,a5
	mv a4, a6
    1edc:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ede:	0dc00893          	li	a7,220
	ecall
    1ee2:	00000073          	ecall

	beqz a0, 1f
    1ee6:	c111                	beqz	a0,1eea <__clone+0x1a>
	# Parent
	ret
    1ee8:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1eea:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1eec:	6522                	ld	a0,8(sp)
	jalr a1
    1eee:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ef0:	05d00893          	li	a7,93
	ecall
    1ef4:	00000073          	ecall
