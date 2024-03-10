
/home/windflower/Desktop/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/brk:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a855                	j	10b6 <__start_main>

0000000000001004 <test_brk>:
 * "After alloc,heap pos: [num+64]"
 * "Alloc again,heap pos: [num+128]"
 * 
 * Linux 中brk(0)只返回0，此处与Linux表现不同，应特殊说明。
 */
void test_brk(){
    1004:	1101                	add	sp,sp,-32
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	ee250513          	add	a0,a0,-286 # 1ee8 <__clone+0x2c>
void test_brk(){
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
    1012:	e426                	sd	s1,8(sp)
    TEST_START(__func__);
    1014:	2da000ef          	jal	12ee <puts>
    1018:	00001497          	auipc	s1,0x1
    101c:	f7048493          	add	s1,s1,-144 # 1f88 <__func__.0>
    1020:	8526                	mv	a0,s1
    1022:	2cc000ef          	jal	12ee <puts>
    1026:	00001517          	auipc	a0,0x1
    102a:	eda50513          	add	a0,a0,-294 # 1f00 <__clone+0x44>
    102e:	2c0000ef          	jal	12ee <puts>
    intptr_t cur_pos, alloc_pos, alloc_pos_1;

    cur_pos = brk(0);
    1032:	4501                	li	a0,0
    1034:	605000ef          	jal	1e38 <brk>
    printf("Before alloc,heap pos: %d\n", cur_pos);
    1038:	85aa                	mv	a1,a0
    cur_pos = brk(0);
    103a:	842a                	mv	s0,a0
    printf("Before alloc,heap pos: %d\n", cur_pos);
    103c:	00001517          	auipc	a0,0x1
    1040:	ed450513          	add	a0,a0,-300 # 1f10 <__clone+0x54>
    1044:	2cc000ef          	jal	1310 <printf>
    brk(cur_pos + 64);
    1048:	04040513          	add	a0,s0,64
    104c:	5ed000ef          	jal	1e38 <brk>
    alloc_pos = brk(0);
    1050:	4501                	li	a0,0
    1052:	5e7000ef          	jal	1e38 <brk>
    printf("After alloc,heap pos: %d\n",alloc_pos);
    1056:	85aa                	mv	a1,a0
    alloc_pos = brk(0);
    1058:	842a                	mv	s0,a0
    printf("After alloc,heap pos: %d\n",alloc_pos);
    105a:	00001517          	auipc	a0,0x1
    105e:	ed650513          	add	a0,a0,-298 # 1f30 <__clone+0x74>
    1062:	2ae000ef          	jal	1310 <printf>
    brk(alloc_pos + 64);
    1066:	04040513          	add	a0,s0,64
    106a:	5cf000ef          	jal	1e38 <brk>
    alloc_pos_1 = brk(0);
    106e:	4501                	li	a0,0
    1070:	5c9000ef          	jal	1e38 <brk>
    1074:	85aa                	mv	a1,a0
    printf("Alloc again,heap pos: %d\n",alloc_pos_1);
    1076:	00001517          	auipc	a0,0x1
    107a:	eda50513          	add	a0,a0,-294 # 1f50 <__clone+0x94>
    107e:	292000ef          	jal	1310 <printf>
    TEST_END(__func__);
    1082:	00001517          	auipc	a0,0x1
    1086:	eee50513          	add	a0,a0,-274 # 1f70 <__clone+0xb4>
    108a:	264000ef          	jal	12ee <puts>
    108e:	8526                	mv	a0,s1
    1090:	25e000ef          	jal	12ee <puts>
}
    1094:	6442                	ld	s0,16(sp)
    1096:	60e2                	ld	ra,24(sp)
    1098:	64a2                	ld	s1,8(sp)
    TEST_END(__func__);
    109a:	00001517          	auipc	a0,0x1
    109e:	e6650513          	add	a0,a0,-410 # 1f00 <__clone+0x44>
}
    10a2:	6105                	add	sp,sp,32
    TEST_END(__func__);
    10a4:	a4a9                	j	12ee <puts>

00000000000010a6 <main>:

int main(void) {
    10a6:	1141                	add	sp,sp,-16
    10a8:	e406                	sd	ra,8(sp)
    test_brk();
    10aa:	f5bff0ef          	jal	1004 <test_brk>
    return 0;
}
    10ae:	60a2                	ld	ra,8(sp)
    10b0:	4501                	li	a0,0
    10b2:	0141                	add	sp,sp,16
    10b4:	8082                	ret

00000000000010b6 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10b6:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10b8:	4108                	lw	a0,0(a0)
{
    10ba:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10bc:	05a1                	add	a1,a1,8
{
    10be:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10c0:	fe7ff0ef          	jal	10a6 <main>
    10c4:	411000ef          	jal	1cd4 <exit>
	return 0;
}
    10c8:	60a2                	ld	ra,8(sp)
    10ca:	4501                	li	a0,0
    10cc:	0141                	add	sp,sp,16
    10ce:	8082                	ret

00000000000010d0 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10d0:	7179                	add	sp,sp,-48
    10d2:	f406                	sd	ra,40(sp)
    10d4:	0005081b          	sext.w	a6,a0
    10d8:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10da:	00055563          	bgez	a0,10e4 <printint.constprop.0+0x14>
        x = -xx;
    10de:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    10e2:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10e4:	02b8763b          	remuw	a2,a6,a1
    10e8:	00001697          	auipc	a3,0x1
    10ec:	eb068693          	add	a3,a3,-336 # 1f98 <digits>
    buf[16] = 0;
    10f0:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10f4:	0005871b          	sext.w	a4,a1
    10f8:	1602                	sll	a2,a2,0x20
    10fa:	9201                	srl	a2,a2,0x20
    10fc:	9636                	add	a2,a2,a3
    10fe:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1102:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    1106:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    110a:	10b86c63          	bltu	a6,a1,1222 <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    110e:	02e5763b          	remuw	a2,a0,a4
    1112:	1602                	sll	a2,a2,0x20
    1114:	9201                	srl	a2,a2,0x20
    1116:	9636                	add	a2,a2,a3
    1118:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    111c:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1120:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1124:	10e56863          	bltu	a0,a4,1234 <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    1128:	02e5f63b          	remuw	a2,a1,a4
    112c:	1602                	sll	a2,a2,0x20
    112e:	9201                	srl	a2,a2,0x20
    1130:	9636                	add	a2,a2,a3
    1132:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1136:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    113a:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    113e:	10e5e463          	bltu	a1,a4,1246 <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    1142:	02e5763b          	remuw	a2,a0,a4
    1146:	1602                	sll	a2,a2,0x20
    1148:	9201                	srl	a2,a2,0x20
    114a:	9636                	add	a2,a2,a3
    114c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1150:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1154:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1158:	10e56063          	bltu	a0,a4,1258 <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    115c:	02e5f63b          	remuw	a2,a1,a4
    1160:	1602                	sll	a2,a2,0x20
    1162:	9201                	srl	a2,a2,0x20
    1164:	9636                	add	a2,a2,a3
    1166:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    116a:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    116e:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1172:	0ee5ec63          	bltu	a1,a4,126a <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    1176:	02e5763b          	remuw	a2,a0,a4
    117a:	1602                	sll	a2,a2,0x20
    117c:	9201                	srl	a2,a2,0x20
    117e:	9636                	add	a2,a2,a3
    1180:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1184:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1188:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    118c:	08e56263          	bltu	a0,a4,1210 <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    1190:	02e5f63b          	remuw	a2,a1,a4
    1194:	1602                	sll	a2,a2,0x20
    1196:	9201                	srl	a2,a2,0x20
    1198:	9636                	add	a2,a2,a3
    119a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    119e:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11a2:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11a6:	0ce5eb63          	bltu	a1,a4,127c <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    11aa:	02e5763b          	remuw	a2,a0,a4
    11ae:	1602                	sll	a2,a2,0x20
    11b0:	9201                	srl	a2,a2,0x20
    11b2:	9636                	add	a2,a2,a3
    11b4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b8:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11bc:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11c0:	0ce56763          	bltu	a0,a4,128e <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    11c4:	02e5f63b          	remuw	a2,a1,a4
    11c8:	1602                	sll	a2,a2,0x20
    11ca:	9201                	srl	a2,a2,0x20
    11cc:	9636                	add	a2,a2,a3
    11ce:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11d2:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11d6:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11da:	0ce5e363          	bltu	a1,a4,12a0 <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    11de:	1782                	sll	a5,a5,0x20
    11e0:	9381                	srl	a5,a5,0x20
    11e2:	96be                	add	a3,a3,a5
    11e4:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    11e8:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    11ea:	00f10723          	sb	a5,14(sp)
    if (sign)
    11ee:	00088763          	beqz	a7,11fc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11f2:	02d00793          	li	a5,45
    11f6:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11fa:	4595                	li	a1,5
    write(f, s, l);
    11fc:	003c                	add	a5,sp,8
    11fe:	4641                	li	a2,16
    1200:	9e0d                	subw	a2,a2,a1
    1202:	4505                	li	a0,1
    1204:	95be                	add	a1,a1,a5
    1206:	27f000ef          	jal	1c84 <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    120a:	70a2                	ld	ra,40(sp)
    120c:	6145                	add	sp,sp,48
    120e:	8082                	ret
    i++;
    1210:	45a9                	li	a1,10
    if (sign)
    1212:	fe0885e3          	beqz	a7,11fc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1216:	02d00793          	li	a5,45
    121a:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    121e:	45a5                	li	a1,9
    1220:	bff1                	j	11fc <printint.constprop.0+0x12c>
    i++;
    1222:	45bd                	li	a1,15
    if (sign)
    1224:	fc088ce3          	beqz	a7,11fc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1228:	02d00793          	li	a5,45
    122c:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1230:	45b9                	li	a1,14
    1232:	b7e9                	j	11fc <printint.constprop.0+0x12c>
    i++;
    1234:	45b9                	li	a1,14
    if (sign)
    1236:	fc0883e3          	beqz	a7,11fc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    123a:	02d00793          	li	a5,45
    123e:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1242:	45b5                	li	a1,13
    1244:	bf65                	j	11fc <printint.constprop.0+0x12c>
    i++;
    1246:	45b5                	li	a1,13
    if (sign)
    1248:	fa088ae3          	beqz	a7,11fc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    124c:	02d00793          	li	a5,45
    1250:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1254:	45b1                	li	a1,12
    1256:	b75d                	j	11fc <printint.constprop.0+0x12c>
    i++;
    1258:	45b1                	li	a1,12
    if (sign)
    125a:	fa0881e3          	beqz	a7,11fc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    125e:	02d00793          	li	a5,45
    1262:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1266:	45ad                	li	a1,11
    1268:	bf51                	j	11fc <printint.constprop.0+0x12c>
    i++;
    126a:	45ad                	li	a1,11
    if (sign)
    126c:	f80888e3          	beqz	a7,11fc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1270:	02d00793          	li	a5,45
    1274:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1278:	45a9                	li	a1,10
    127a:	b749                	j	11fc <printint.constprop.0+0x12c>
    i++;
    127c:	45a5                	li	a1,9
    if (sign)
    127e:	f6088fe3          	beqz	a7,11fc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1282:	02d00793          	li	a5,45
    1286:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    128a:	45a1                	li	a1,8
    128c:	bf85                	j	11fc <printint.constprop.0+0x12c>
    i++;
    128e:	45a1                	li	a1,8
    if (sign)
    1290:	f60886e3          	beqz	a7,11fc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1294:	02d00793          	li	a5,45
    1298:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    129c:	459d                	li	a1,7
    129e:	bfb9                	j	11fc <printint.constprop.0+0x12c>
    i++;
    12a0:	459d                	li	a1,7
    if (sign)
    12a2:	f4088de3          	beqz	a7,11fc <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12a6:	02d00793          	li	a5,45
    12aa:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12ae:	4599                	li	a1,6
    12b0:	b7b1                	j	11fc <printint.constprop.0+0x12c>

00000000000012b2 <getchar>:
{
    12b2:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12b4:	00f10593          	add	a1,sp,15
    12b8:	4605                	li	a2,1
    12ba:	4501                	li	a0,0
{
    12bc:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12be:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12c2:	1b9000ef          	jal	1c7a <read>
}
    12c6:	60e2                	ld	ra,24(sp)
    12c8:	00f14503          	lbu	a0,15(sp)
    12cc:	6105                	add	sp,sp,32
    12ce:	8082                	ret

00000000000012d0 <putchar>:
{
    12d0:	1101                	add	sp,sp,-32
    12d2:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12d4:	00f10593          	add	a1,sp,15
    12d8:	4605                	li	a2,1
    12da:	4505                	li	a0,1
{
    12dc:	ec06                	sd	ra,24(sp)
    char byte = c;
    12de:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12e2:	1a3000ef          	jal	1c84 <write>
}
    12e6:	60e2                	ld	ra,24(sp)
    12e8:	2501                	sext.w	a0,a0
    12ea:	6105                	add	sp,sp,32
    12ec:	8082                	ret

00000000000012ee <puts>:
{
    12ee:	1141                	add	sp,sp,-16
    12f0:	e406                	sd	ra,8(sp)
    12f2:	e022                	sd	s0,0(sp)
    12f4:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12f6:	55a000ef          	jal	1850 <strlen>
    12fa:	862a                	mv	a2,a0
    12fc:	85a2                	mv	a1,s0
    12fe:	4505                	li	a0,1
    1300:	185000ef          	jal	1c84 <write>
}
    1304:	60a2                	ld	ra,8(sp)
    1306:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1308:	957d                	sra	a0,a0,0x3f
    return r;
    130a:	2501                	sext.w	a0,a0
}
    130c:	0141                	add	sp,sp,16
    130e:	8082                	ret

0000000000001310 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1310:	7131                	add	sp,sp,-192
    1312:	e4d6                	sd	s5,72(sp)
    1314:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    1316:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1318:	013c                	add	a5,sp,136
{
    131a:	f0ca                	sd	s2,96(sp)
    131c:	ecce                	sd	s3,88(sp)
    131e:	e8d2                	sd	s4,80(sp)
    1320:	e0da                	sd	s6,64(sp)
    1322:	fc5e                	sd	s7,56(sp)
    1324:	fc86                	sd	ra,120(sp)
    1326:	f8a2                	sd	s0,112(sp)
    1328:	f4a6                	sd	s1,104(sp)
    132a:	e52e                	sd	a1,136(sp)
    132c:	e932                	sd	a2,144(sp)
    132e:	ed36                	sd	a3,152(sp)
    1330:	f13a                	sd	a4,160(sp)
    1332:	f942                	sd	a6,176(sp)
    1334:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1336:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1338:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    133c:	07300a13          	li	s4,115
    1340:	07800b93          	li	s7,120
    1344:	06400b13          	li	s6,100
    buf[i++] = '0';
    1348:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x5898>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    134c:	00001997          	auipc	s3,0x1
    1350:	c4c98993          	add	s3,s3,-948 # 1f98 <digits>
        if (!*s)
    1354:	00054783          	lbu	a5,0(a0)
    1358:	16078863          	beqz	a5,14c8 <printf+0x1b8>
    135c:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    135e:	19278063          	beq	a5,s2,14de <printf+0x1ce>
    1362:	00164783          	lbu	a5,1(a2)
    1366:	0605                	add	a2,a2,1
    1368:	fbfd                	bnez	a5,135e <printf+0x4e>
    136a:	84b2                	mv	s1,a2
        l = z - a;
    136c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1370:	85aa                	mv	a1,a0
    1372:	8622                	mv	a2,s0
    1374:	4505                	li	a0,1
    1376:	10f000ef          	jal	1c84 <write>
        if (l)
    137a:	18041763          	bnez	s0,1508 <printf+0x1f8>
        if (s[1] == 0)
    137e:	0014c783          	lbu	a5,1(s1)
    1382:	14078363          	beqz	a5,14c8 <printf+0x1b8>
        switch (s[1])
    1386:	19478f63          	beq	a5,s4,1524 <printf+0x214>
    138a:	18fa6163          	bltu	s4,a5,150c <printf+0x1fc>
    138e:	1b678e63          	beq	a5,s6,154a <printf+0x23a>
    1392:	07000713          	li	a4,112
    1396:	1ce79463          	bne	a5,a4,155e <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    139a:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    139c:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13a0:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13a2:	631c                	ld	a5,0(a4)
    13a4:	0721                	add	a4,a4,8
    13a6:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13a8:	00479293          	sll	t0,a5,0x4
    13ac:	00879f93          	sll	t6,a5,0x8
    13b0:	00c79f13          	sll	t5,a5,0xc
    13b4:	01079e93          	sll	t4,a5,0x10
    13b8:	01479e13          	sll	t3,a5,0x14
    13bc:	01879313          	sll	t1,a5,0x18
    13c0:	01c79893          	sll	a7,a5,0x1c
    13c4:	02479813          	sll	a6,a5,0x24
    13c8:	02879513          	sll	a0,a5,0x28
    13cc:	02c79593          	sll	a1,a5,0x2c
    13d0:	03079693          	sll	a3,a5,0x30
    13d4:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13d8:	03c7d413          	srl	s0,a5,0x3c
    13dc:	01c7d39b          	srlw	t2,a5,0x1c
    13e0:	03c2d293          	srl	t0,t0,0x3c
    13e4:	03cfdf93          	srl	t6,t6,0x3c
    13e8:	03cf5f13          	srl	t5,t5,0x3c
    13ec:	03cede93          	srl	t4,t4,0x3c
    13f0:	03ce5e13          	srl	t3,t3,0x3c
    13f4:	03c35313          	srl	t1,t1,0x3c
    13f8:	03c8d893          	srl	a7,a7,0x3c
    13fc:	03c85813          	srl	a6,a6,0x3c
    1400:	9171                	srl	a0,a0,0x3c
    1402:	91f1                	srl	a1,a1,0x3c
    1404:	92f1                	srl	a3,a3,0x3c
    1406:	9371                	srl	a4,a4,0x3c
    1408:	974e                	add	a4,a4,s3
    140a:	944e                	add	s0,s0,s3
    140c:	92ce                	add	t0,t0,s3
    140e:	9fce                	add	t6,t6,s3
    1410:	9f4e                	add	t5,t5,s3
    1412:	9ece                	add	t4,t4,s3
    1414:	9e4e                	add	t3,t3,s3
    1416:	934e                	add	t1,t1,s3
    1418:	98ce                	add	a7,a7,s3
    141a:	93ce                	add	t2,t2,s3
    141c:	984e                	add	a6,a6,s3
    141e:	954e                	add	a0,a0,s3
    1420:	95ce                	add	a1,a1,s3
    1422:	96ce                	add	a3,a3,s3
    1424:	00074083          	lbu	ra,0(a4)
    1428:	0002c283          	lbu	t0,0(t0)
    142c:	000fcf83          	lbu	t6,0(t6)
    1430:	000f4f03          	lbu	t5,0(t5)
    1434:	000ece83          	lbu	t4,0(t4)
    1438:	000e4e03          	lbu	t3,0(t3)
    143c:	00034303          	lbu	t1,0(t1)
    1440:	0008c883          	lbu	a7,0(a7)
    1444:	0003c383          	lbu	t2,0(t2)
    1448:	00084803          	lbu	a6,0(a6)
    144c:	00054503          	lbu	a0,0(a0)
    1450:	0005c583          	lbu	a1,0(a1)
    1454:	0006c683          	lbu	a3,0(a3)
    1458:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    145c:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1460:	9371                	srl	a4,a4,0x3c
    1462:	8bbd                	and	a5,a5,15
    1464:	974e                	add	a4,a4,s3
    1466:	97ce                	add	a5,a5,s3
    1468:	005105a3          	sb	t0,11(sp)
    146c:	01f10623          	sb	t6,12(sp)
    1470:	01e106a3          	sb	t5,13(sp)
    1474:	01d10723          	sb	t4,14(sp)
    1478:	01c107a3          	sb	t3,15(sp)
    147c:	00610823          	sb	t1,16(sp)
    1480:	011108a3          	sb	a7,17(sp)
    1484:	00710923          	sb	t2,18(sp)
    1488:	010109a3          	sb	a6,19(sp)
    148c:	00a10a23          	sb	a0,20(sp)
    1490:	00b10aa3          	sb	a1,21(sp)
    1494:	00d10b23          	sb	a3,22(sp)
    1498:	00110ba3          	sb	ra,23(sp)
    149c:	00810523          	sb	s0,10(sp)
    14a0:	00074703          	lbu	a4,0(a4)
    14a4:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14a8:	002c                	add	a1,sp,8
    14aa:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14ac:	00e10c23          	sb	a4,24(sp)
    14b0:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14b4:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14b8:	7cc000ef          	jal	1c84 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14bc:	00248513          	add	a0,s1,2
        if (!*s)
    14c0:	00054783          	lbu	a5,0(a0)
    14c4:	e8079ce3          	bnez	a5,135c <printf+0x4c>
    }
    va_end(ap);
}
    14c8:	70e6                	ld	ra,120(sp)
    14ca:	7446                	ld	s0,112(sp)
    14cc:	74a6                	ld	s1,104(sp)
    14ce:	7906                	ld	s2,96(sp)
    14d0:	69e6                	ld	s3,88(sp)
    14d2:	6a46                	ld	s4,80(sp)
    14d4:	6aa6                	ld	s5,72(sp)
    14d6:	6b06                	ld	s6,64(sp)
    14d8:	7be2                	ld	s7,56(sp)
    14da:	6129                	add	sp,sp,192
    14dc:	8082                	ret
    14de:	84b2                	mv	s1,a2
    14e0:	a039                	j	14ee <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14e2:	0024c783          	lbu	a5,2(s1)
    14e6:	0605                	add	a2,a2,1
    14e8:	0489                	add	s1,s1,2
    14ea:	e92791e3          	bne	a5,s2,136c <printf+0x5c>
    14ee:	0014c783          	lbu	a5,1(s1)
    14f2:	ff2788e3          	beq	a5,s2,14e2 <printf+0x1d2>
        l = z - a;
    14f6:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14fa:	85aa                	mv	a1,a0
    14fc:	8622                	mv	a2,s0
    14fe:	4505                	li	a0,1
    1500:	784000ef          	jal	1c84 <write>
        if (l)
    1504:	e6040de3          	beqz	s0,137e <printf+0x6e>
    1508:	8526                	mv	a0,s1
    150a:	b5a9                	j	1354 <printf+0x44>
        switch (s[1])
    150c:	05779963          	bne	a5,s7,155e <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    1510:	6782                	ld	a5,0(sp)
    1512:	45c1                	li	a1,16
    1514:	4388                	lw	a0,0(a5)
    1516:	07a1                	add	a5,a5,8
    1518:	e03e                	sd	a5,0(sp)
    151a:	bb7ff0ef          	jal	10d0 <printint.constprop.0>
        s += 2;
    151e:	00248513          	add	a0,s1,2
    1522:	bf79                	j	14c0 <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    1524:	6782                	ld	a5,0(sp)
    1526:	6380                	ld	s0,0(a5)
    1528:	07a1                	add	a5,a5,8
    152a:	e03e                	sd	a5,0(sp)
    152c:	cc21                	beqz	s0,1584 <printf+0x274>
            l = strnlen(a, 200);
    152e:	0c800593          	li	a1,200
    1532:	8522                	mv	a0,s0
    1534:	44e000ef          	jal	1982 <strnlen>
    write(f, s, l);
    1538:	0005061b          	sext.w	a2,a0
    153c:	85a2                	mv	a1,s0
    153e:	4505                	li	a0,1
    1540:	744000ef          	jal	1c84 <write>
        s += 2;
    1544:	00248513          	add	a0,s1,2
    1548:	bfa5                	j	14c0 <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    154a:	6782                	ld	a5,0(sp)
    154c:	45a9                	li	a1,10
    154e:	4388                	lw	a0,0(a5)
    1550:	07a1                	add	a5,a5,8
    1552:	e03e                	sd	a5,0(sp)
    1554:	b7dff0ef          	jal	10d0 <printint.constprop.0>
        s += 2;
    1558:	00248513          	add	a0,s1,2
    155c:	b795                	j	14c0 <printf+0x1b0>
    return write(stdout, &byte, 1);
    155e:	4605                	li	a2,1
    1560:	002c                	add	a1,sp,8
    1562:	4505                	li	a0,1
    char byte = c;
    1564:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1568:	71c000ef          	jal	1c84 <write>
    char byte = c;
    156c:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1570:	4605                	li	a2,1
    1572:	002c                	add	a1,sp,8
    1574:	4505                	li	a0,1
    char byte = c;
    1576:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    157a:	70a000ef          	jal	1c84 <write>
        s += 2;
    157e:	00248513          	add	a0,s1,2
    1582:	bf3d                	j	14c0 <printf+0x1b0>
                a = "(null)";
    1584:	00001417          	auipc	s0,0x1
    1588:	9fc40413          	add	s0,s0,-1540 # 1f80 <__clone+0xc4>
    158c:	b74d                	j	152e <printf+0x21e>

000000000000158e <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    158e:	02000793          	li	a5,32
    1592:	00f50663          	beq	a0,a5,159e <isspace+0x10>
    1596:	355d                	addw	a0,a0,-9
    1598:	00553513          	sltiu	a0,a0,5
    159c:	8082                	ret
    159e:	4505                	li	a0,1
}
    15a0:	8082                	ret

00000000000015a2 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15a2:	fd05051b          	addw	a0,a0,-48
}
    15a6:	00a53513          	sltiu	a0,a0,10
    15aa:	8082                	ret

00000000000015ac <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ac:	02000713          	li	a4,32
    15b0:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15b2:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15b6:	ff76879b          	addw	a5,a3,-9
    15ba:	06e68063          	beq	a3,a4,161a <atoi+0x6e>
    15be:	0006859b          	sext.w	a1,a3
    15c2:	04f67c63          	bgeu	a2,a5,161a <atoi+0x6e>
        s++;
    switch (*s)
    15c6:	02b00793          	li	a5,43
    15ca:	06f68563          	beq	a3,a5,1634 <atoi+0x88>
    15ce:	02d00793          	li	a5,45
    15d2:	04f69663          	bne	a3,a5,161e <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15d6:	00154683          	lbu	a3,1(a0)
    15da:	47a5                	li	a5,9
        s++;
    15dc:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    15e0:	fd06869b          	addw	a3,a3,-48
    15e4:	8636                	mv	a2,a3
    while (isdigit(*s))
    15e6:	04d7e563          	bltu	a5,a3,1630 <atoi+0x84>
        neg = 1;
    15ea:	4885                	li	a7,1
    int n = 0, neg = 0;
    15ec:	4501                	li	a0,0
    while (isdigit(*s))
    15ee:	4825                	li	a6,9
    15f0:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    15f4:	0025179b          	sllw	a5,a0,0x2
    15f8:	9fa9                	addw	a5,a5,a0
    15fa:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    15fe:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    1602:	85b2                	mv	a1,a2
    1604:	40c7853b          	subw	a0,a5,a2
    1608:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    160a:	8636                	mv	a2,a3
    while (isdigit(*s))
    160c:	fed872e3          	bgeu	a6,a3,15f0 <atoi+0x44>
    return neg ? n : -n;
    1610:	02089163          	bnez	a7,1632 <atoi+0x86>
    1614:	40f5853b          	subw	a0,a1,a5
    1618:	8082                	ret
        s++;
    161a:	0505                	add	a0,a0,1
    161c:	bf59                	j	15b2 <atoi+0x6>
    while (isdigit(*s))
    161e:	fd05859b          	addw	a1,a1,-48
    1622:	47a5                	li	a5,9
    1624:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1626:	4881                	li	a7,0
    1628:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    162c:	fcb7f0e3          	bgeu	a5,a1,15ec <atoi+0x40>
    return neg ? n : -n;
    1630:	4501                	li	a0,0
}
    1632:	8082                	ret
    while (isdigit(*s))
    1634:	00154683          	lbu	a3,1(a0)
    1638:	47a5                	li	a5,9
        s++;
    163a:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    163e:	fd06869b          	addw	a3,a3,-48
    1642:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    1644:	4881                	li	a7,0
    while (isdigit(*s))
    1646:	fad7f3e3          	bgeu	a5,a3,15ec <atoi+0x40>
    return neg ? n : -n;
    164a:	4501                	li	a0,0
    164c:	8082                	ret

000000000000164e <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    164e:	16060f63          	beqz	a2,17cc <memset+0x17e>
    1652:	40a006b3          	neg	a3,a0
    1656:	0076f793          	and	a5,a3,7
    165a:	00778813          	add	a6,a5,7
    165e:	48ad                	li	a7,11
    1660:	0ff5f713          	zext.b	a4,a1
    1664:	fff60593          	add	a1,a2,-1
    1668:	17186363          	bltu	a6,a7,17ce <memset+0x180>
    166c:	1705eb63          	bltu	a1,a6,17e2 <memset+0x194>
    1670:	16078163          	beqz	a5,17d2 <memset+0x184>
    1674:	00e50023          	sb	a4,0(a0)
    1678:	0066f593          	and	a1,a3,6
    167c:	14058e63          	beqz	a1,17d8 <memset+0x18a>
    1680:	00e500a3          	sb	a4,1(a0)
    1684:	4589                	li	a1,2
    1686:	00250813          	add	a6,a0,2
    168a:	04f5f663          	bgeu	a1,a5,16d6 <memset+0x88>
    168e:	00e50123          	sb	a4,2(a0)
    1692:	8a91                	and	a3,a3,4
    1694:	00350813          	add	a6,a0,3
    1698:	458d                	li	a1,3
    169a:	ce95                	beqz	a3,16d6 <memset+0x88>
    169c:	00e501a3          	sb	a4,3(a0)
    16a0:	4691                	li	a3,4
    16a2:	00450813          	add	a6,a0,4
    16a6:	4591                	li	a1,4
    16a8:	02f6f763          	bgeu	a3,a5,16d6 <memset+0x88>
    16ac:	00e50223          	sb	a4,4(a0)
    16b0:	4695                	li	a3,5
    16b2:	00550813          	add	a6,a0,5
    16b6:	4595                	li	a1,5
    16b8:	00d78f63          	beq	a5,a3,16d6 <memset+0x88>
    16bc:	00e502a3          	sb	a4,5(a0)
    16c0:	469d                	li	a3,7
    16c2:	00650813          	add	a6,a0,6
    16c6:	4599                	li	a1,6
    16c8:	00d79763          	bne	a5,a3,16d6 <memset+0x88>
    16cc:	00750813          	add	a6,a0,7
    16d0:	00e50323          	sb	a4,6(a0)
    16d4:	459d                	li	a1,7
    16d6:	00871693          	sll	a3,a4,0x8
    16da:	01071313          	sll	t1,a4,0x10
    16de:	8ed9                	or	a3,a3,a4
    16e0:	01871893          	sll	a7,a4,0x18
    16e4:	0066e6b3          	or	a3,a3,t1
    16e8:	0116e6b3          	or	a3,a3,a7
    16ec:	02071313          	sll	t1,a4,0x20
    16f0:	02871893          	sll	a7,a4,0x28
    16f4:	0066e6b3          	or	a3,a3,t1
    16f8:	40f60e33          	sub	t3,a2,a5
    16fc:	03071313          	sll	t1,a4,0x30
    1700:	0116e6b3          	or	a3,a3,a7
    1704:	0066e6b3          	or	a3,a3,t1
    1708:	03871893          	sll	a7,a4,0x38
    170c:	97aa                	add	a5,a5,a0
    170e:	ff8e7313          	and	t1,t3,-8
    1712:	0116e6b3          	or	a3,a3,a7
    1716:	00f308b3          	add	a7,t1,a5
    171a:	e394                	sd	a3,0(a5)
    171c:	07a1                	add	a5,a5,8
    171e:	ff179ee3          	bne	a5,a7,171a <memset+0xcc>
    1722:	006806b3          	add	a3,a6,t1
    1726:	00b307bb          	addw	a5,t1,a1
    172a:	0bc30b63          	beq	t1,t3,17e0 <memset+0x192>
    172e:	00e68023          	sb	a4,0(a3)
    1732:	0017859b          	addw	a1,a5,1
    1736:	08c5fb63          	bgeu	a1,a2,17cc <memset+0x17e>
    173a:	00e680a3          	sb	a4,1(a3)
    173e:	0027859b          	addw	a1,a5,2
    1742:	08c5f563          	bgeu	a1,a2,17cc <memset+0x17e>
    1746:	00e68123          	sb	a4,2(a3)
    174a:	0037859b          	addw	a1,a5,3
    174e:	06c5ff63          	bgeu	a1,a2,17cc <memset+0x17e>
    1752:	00e681a3          	sb	a4,3(a3)
    1756:	0047859b          	addw	a1,a5,4
    175a:	06c5f963          	bgeu	a1,a2,17cc <memset+0x17e>
    175e:	00e68223          	sb	a4,4(a3)
    1762:	0057859b          	addw	a1,a5,5
    1766:	06c5f363          	bgeu	a1,a2,17cc <memset+0x17e>
    176a:	00e682a3          	sb	a4,5(a3)
    176e:	0067859b          	addw	a1,a5,6
    1772:	04c5fd63          	bgeu	a1,a2,17cc <memset+0x17e>
    1776:	00e68323          	sb	a4,6(a3)
    177a:	0077859b          	addw	a1,a5,7
    177e:	04c5f763          	bgeu	a1,a2,17cc <memset+0x17e>
    1782:	00e683a3          	sb	a4,7(a3)
    1786:	0087859b          	addw	a1,a5,8
    178a:	04c5f163          	bgeu	a1,a2,17cc <memset+0x17e>
    178e:	00e68423          	sb	a4,8(a3)
    1792:	0097859b          	addw	a1,a5,9
    1796:	02c5fb63          	bgeu	a1,a2,17cc <memset+0x17e>
    179a:	00e684a3          	sb	a4,9(a3)
    179e:	00a7859b          	addw	a1,a5,10
    17a2:	02c5f563          	bgeu	a1,a2,17cc <memset+0x17e>
    17a6:	00e68523          	sb	a4,10(a3)
    17aa:	00b7859b          	addw	a1,a5,11
    17ae:	00c5ff63          	bgeu	a1,a2,17cc <memset+0x17e>
    17b2:	00e685a3          	sb	a4,11(a3)
    17b6:	00c7859b          	addw	a1,a5,12
    17ba:	00c5f963          	bgeu	a1,a2,17cc <memset+0x17e>
    17be:	00e68623          	sb	a4,12(a3)
    17c2:	27b5                	addw	a5,a5,13
    17c4:	00c7f463          	bgeu	a5,a2,17cc <memset+0x17e>
    17c8:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17cc:	8082                	ret
    17ce:	482d                	li	a6,11
    17d0:	bd71                	j	166c <memset+0x1e>
    char *p = dest;
    17d2:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17d4:	4581                	li	a1,0
    17d6:	b701                	j	16d6 <memset+0x88>
    17d8:	00150813          	add	a6,a0,1
    17dc:	4585                	li	a1,1
    17de:	bde5                	j	16d6 <memset+0x88>
    17e0:	8082                	ret
    char *p = dest;
    17e2:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17e4:	4781                	li	a5,0
    17e6:	b7a1                	j	172e <memset+0xe0>

00000000000017e8 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17e8:	00054783          	lbu	a5,0(a0)
    17ec:	0005c703          	lbu	a4,0(a1)
    17f0:	00e79863          	bne	a5,a4,1800 <strcmp+0x18>
    17f4:	0505                	add	a0,a0,1
    17f6:	0585                	add	a1,a1,1
    17f8:	fbe5                	bnez	a5,17e8 <strcmp>
    17fa:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    17fc:	9d19                	subw	a0,a0,a4
    17fe:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1800:	0007851b          	sext.w	a0,a5
    1804:	bfe5                	j	17fc <strcmp+0x14>

0000000000001806 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1806:	ca15                	beqz	a2,183a <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1808:	00054783          	lbu	a5,0(a0)
    if (!n--)
    180c:	167d                	add	a2,a2,-1
    180e:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1812:	eb99                	bnez	a5,1828 <strncmp+0x22>
    1814:	a815                	j	1848 <strncmp+0x42>
    1816:	00a68e63          	beq	a3,a0,1832 <strncmp+0x2c>
    181a:	0505                	add	a0,a0,1
    181c:	00f71b63          	bne	a4,a5,1832 <strncmp+0x2c>
    1820:	00054783          	lbu	a5,0(a0)
    1824:	cf89                	beqz	a5,183e <strncmp+0x38>
    1826:	85b2                	mv	a1,a2
    1828:	0005c703          	lbu	a4,0(a1)
    182c:	00158613          	add	a2,a1,1
    1830:	f37d                	bnez	a4,1816 <strncmp+0x10>
        ;
    return *l - *r;
    1832:	0007851b          	sext.w	a0,a5
    1836:	9d19                	subw	a0,a0,a4
    1838:	8082                	ret
        return 0;
    183a:	4501                	li	a0,0
}
    183c:	8082                	ret
    return *l - *r;
    183e:	0015c703          	lbu	a4,1(a1)
    1842:	4501                	li	a0,0
    1844:	9d19                	subw	a0,a0,a4
    1846:	8082                	ret
    1848:	0005c703          	lbu	a4,0(a1)
    184c:	4501                	li	a0,0
    184e:	b7e5                	j	1836 <strncmp+0x30>

0000000000001850 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1850:	00757793          	and	a5,a0,7
    1854:	cf89                	beqz	a5,186e <strlen+0x1e>
    1856:	87aa                	mv	a5,a0
    1858:	a029                	j	1862 <strlen+0x12>
    185a:	0785                	add	a5,a5,1
    185c:	0077f713          	and	a4,a5,7
    1860:	cb01                	beqz	a4,1870 <strlen+0x20>
        if (!*s)
    1862:	0007c703          	lbu	a4,0(a5)
    1866:	fb75                	bnez	a4,185a <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1868:	40a78533          	sub	a0,a5,a0
}
    186c:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    186e:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1870:	feff05b7          	lui	a1,0xfeff0
    1874:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedf67>
    1878:	f0101637          	lui	a2,0xf0101
    187c:	05c2                	sll	a1,a1,0x10
    187e:	0612                	sll	a2,a2,0x4
    1880:	6394                	ld	a3,0(a5)
    1882:	eff58593          	add	a1,a1,-257
    1886:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff169>
    188a:	05c2                	sll	a1,a1,0x10
    188c:	0642                	sll	a2,a2,0x10
    188e:	eff58593          	add	a1,a1,-257
    1892:	10160613          	add	a2,a2,257
    1896:	00b68733          	add	a4,a3,a1
    189a:	063e                	sll	a2,a2,0xf
    189c:	fff6c693          	not	a3,a3
    18a0:	8f75                	and	a4,a4,a3
    18a2:	08060613          	add	a2,a2,128
    18a6:	8f71                	and	a4,a4,a2
    18a8:	eb11                	bnez	a4,18bc <strlen+0x6c>
    18aa:	6794                	ld	a3,8(a5)
    18ac:	07a1                	add	a5,a5,8
    18ae:	00b68733          	add	a4,a3,a1
    18b2:	fff6c693          	not	a3,a3
    18b6:	8f75                	and	a4,a4,a3
    18b8:	8f71                	and	a4,a4,a2
    18ba:	db65                	beqz	a4,18aa <strlen+0x5a>
    for (; *s; s++)
    18bc:	0007c703          	lbu	a4,0(a5)
    18c0:	d745                	beqz	a4,1868 <strlen+0x18>
    18c2:	0017c703          	lbu	a4,1(a5)
    18c6:	0785                	add	a5,a5,1
    18c8:	d345                	beqz	a4,1868 <strlen+0x18>
    18ca:	0017c703          	lbu	a4,1(a5)
    18ce:	0785                	add	a5,a5,1
    18d0:	fb6d                	bnez	a4,18c2 <strlen+0x72>
    18d2:	bf59                	j	1868 <strlen+0x18>

00000000000018d4 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18d4:	00757713          	and	a4,a0,7
{
    18d8:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18da:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18de:	cb19                	beqz	a4,18f4 <memchr+0x20>
    18e0:	ce59                	beqz	a2,197e <memchr+0xaa>
    18e2:	0007c703          	lbu	a4,0(a5)
    18e6:	00b70963          	beq	a4,a1,18f8 <memchr+0x24>
    18ea:	0785                	add	a5,a5,1
    18ec:	0077f713          	and	a4,a5,7
    18f0:	167d                	add	a2,a2,-1
    18f2:	f77d                	bnez	a4,18e0 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18f4:	4501                	li	a0,0
    if (n && *s != c)
    18f6:	c649                	beqz	a2,1980 <memchr+0xac>
    18f8:	0007c703          	lbu	a4,0(a5)
    18fc:	06b70663          	beq	a4,a1,1968 <memchr+0x94>
        size_t k = ONES * c;
    1900:	01010737          	lui	a4,0x1010
    1904:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e169>
    1908:	0742                	sll	a4,a4,0x10
    190a:	10170713          	add	a4,a4,257
    190e:	0742                	sll	a4,a4,0x10
    1910:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1914:	469d                	li	a3,7
        size_t k = ONES * c;
    1916:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    191a:	04c6f763          	bgeu	a3,a2,1968 <memchr+0x94>
    191e:	f0101837          	lui	a6,0xf0101
    1922:	feff08b7          	lui	a7,0xfeff0
    1926:	0812                	sll	a6,a6,0x4
    1928:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedf67>
    192c:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff169>
    1930:	08c2                	sll	a7,a7,0x10
    1932:	0842                	sll	a6,a6,0x10
    1934:	eff88893          	add	a7,a7,-257
    1938:	10180813          	add	a6,a6,257
    193c:	08c2                	sll	a7,a7,0x10
    193e:	083e                	sll	a6,a6,0xf
    1940:	eff88893          	add	a7,a7,-257
    1944:	08080813          	add	a6,a6,128
    1948:	431d                	li	t1,7
    194a:	a029                	j	1954 <memchr+0x80>
    194c:	1661                	add	a2,a2,-8
    194e:	07a1                	add	a5,a5,8
    1950:	02c37663          	bgeu	t1,a2,197c <memchr+0xa8>
    1954:	6398                	ld	a4,0(a5)
    1956:	8f29                	xor	a4,a4,a0
    1958:	011706b3          	add	a3,a4,a7
    195c:	fff74713          	not	a4,a4
    1960:	8f75                	and	a4,a4,a3
    1962:	01077733          	and	a4,a4,a6
    1966:	d37d                	beqz	a4,194c <memchr+0x78>
        s = (const void *)w;
    1968:	853e                	mv	a0,a5
    196a:	a019                	j	1970 <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    196c:	0505                	add	a0,a0,1
    196e:	ca01                	beqz	a2,197e <memchr+0xaa>
    1970:	00054783          	lbu	a5,0(a0)
    1974:	167d                	add	a2,a2,-1
    1976:	feb79be3          	bne	a5,a1,196c <memchr+0x98>
    197a:	8082                	ret
    197c:	f675                	bnez	a2,1968 <memchr+0x94>
    return n ? (void *)s : 0;
    197e:	4501                	li	a0,0
}
    1980:	8082                	ret

0000000000001982 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1982:	1101                	add	sp,sp,-32
    1984:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1986:	862e                	mv	a2,a1
{
    1988:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    198a:	4581                	li	a1,0
{
    198c:	e426                	sd	s1,8(sp)
    198e:	ec06                	sd	ra,24(sp)
    1990:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1992:	f43ff0ef          	jal	18d4 <memchr>
    return p ? p - s : n;
    1996:	c519                	beqz	a0,19a4 <strnlen+0x22>
}
    1998:	60e2                	ld	ra,24(sp)
    199a:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    199c:	8d05                	sub	a0,a0,s1
}
    199e:	64a2                	ld	s1,8(sp)
    19a0:	6105                	add	sp,sp,32
    19a2:	8082                	ret
    19a4:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19a6:	8522                	mv	a0,s0
}
    19a8:	6442                	ld	s0,16(sp)
    19aa:	64a2                	ld	s1,8(sp)
    19ac:	6105                	add	sp,sp,32
    19ae:	8082                	ret

00000000000019b0 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19b0:	00b547b3          	xor	a5,a0,a1
    19b4:	8b9d                	and	a5,a5,7
    19b6:	efb1                	bnez	a5,1a12 <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19b8:	0075f793          	and	a5,a1,7
    19bc:	ebb5                	bnez	a5,1a30 <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19be:	feff0637          	lui	a2,0xfeff0
    19c2:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedf67>
    19c6:	f01016b7          	lui	a3,0xf0101
    19ca:	0642                	sll	a2,a2,0x10
    19cc:	0692                	sll	a3,a3,0x4
    19ce:	6198                	ld	a4,0(a1)
    19d0:	eff60613          	add	a2,a2,-257
    19d4:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff169>
    19d8:	0642                	sll	a2,a2,0x10
    19da:	06c2                	sll	a3,a3,0x10
    19dc:	eff60613          	add	a2,a2,-257
    19e0:	10168693          	add	a3,a3,257
    19e4:	00c707b3          	add	a5,a4,a2
    19e8:	fff74813          	not	a6,a4
    19ec:	06be                	sll	a3,a3,0xf
    19ee:	0107f7b3          	and	a5,a5,a6
    19f2:	08068693          	add	a3,a3,128
    19f6:	8ff5                	and	a5,a5,a3
    19f8:	ef89                	bnez	a5,1a12 <strcpy+0x62>
    19fa:	05a1                	add	a1,a1,8
    19fc:	e118                	sd	a4,0(a0)
    19fe:	6198                	ld	a4,0(a1)
    1a00:	0521                	add	a0,a0,8
    1a02:	00c707b3          	add	a5,a4,a2
    1a06:	fff74813          	not	a6,a4
    1a0a:	0107f7b3          	and	a5,a5,a6
    1a0e:	8ff5                	and	a5,a5,a3
    1a10:	d7ed                	beqz	a5,19fa <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a12:	0005c783          	lbu	a5,0(a1)
    1a16:	00f50023          	sb	a5,0(a0)
    1a1a:	c785                	beqz	a5,1a42 <strcpy+0x92>
    1a1c:	0015c783          	lbu	a5,1(a1)
    1a20:	0505                	add	a0,a0,1
    1a22:	0585                	add	a1,a1,1
    1a24:	00f50023          	sb	a5,0(a0)
    1a28:	fbf5                	bnez	a5,1a1c <strcpy+0x6c>
        ;
    return d;
}
    1a2a:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a2c:	0505                	add	a0,a0,1
    1a2e:	db41                	beqz	a4,19be <strcpy+0xe>
            if (!(*d = *s))
    1a30:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a34:	0585                	add	a1,a1,1
    1a36:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a3a:	00f50023          	sb	a5,0(a0)
    1a3e:	f7fd                	bnez	a5,1a2c <strcpy+0x7c>
}
    1a40:	8082                	ret
    1a42:	8082                	ret

0000000000001a44 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a44:	00b547b3          	xor	a5,a0,a1
    1a48:	8b9d                	and	a5,a5,7
    1a4a:	efbd                	bnez	a5,1ac8 <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a4c:	0075f793          	and	a5,a1,7
    1a50:	1c078563          	beqz	a5,1c1a <strncpy+0x1d6>
    1a54:	ea11                	bnez	a2,1a68 <strncpy+0x24>
    1a56:	8082                	ret
    1a58:	0585                	add	a1,a1,1
    1a5a:	0075f793          	and	a5,a1,7
    1a5e:	167d                	add	a2,a2,-1
    1a60:	0505                	add	a0,a0,1
    1a62:	1a078c63          	beqz	a5,1c1a <strncpy+0x1d6>
    1a66:	ca3d                	beqz	a2,1adc <strncpy+0x98>
    1a68:	0005c783          	lbu	a5,0(a1)
    1a6c:	00f50023          	sb	a5,0(a0)
    1a70:	f7e5                	bnez	a5,1a58 <strncpy+0x14>
            ;
        if (!n || !*s)
    1a72:	0005c783          	lbu	a5,0(a1)
    1a76:	c7a5                	beqz	a5,1ade <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a78:	479d                	li	a5,7
    1a7a:	04c7f863          	bgeu	a5,a2,1aca <strncpy+0x86>
    1a7e:	f01016b7          	lui	a3,0xf0101
    1a82:	feff0837          	lui	a6,0xfeff0
    1a86:	0692                	sll	a3,a3,0x4
    1a88:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedf67>
    1a8c:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff169>
    1a90:	0842                	sll	a6,a6,0x10
    1a92:	06c2                	sll	a3,a3,0x10
    1a94:	eff80813          	add	a6,a6,-257
    1a98:	10168693          	add	a3,a3,257
    1a9c:	0842                	sll	a6,a6,0x10
    1a9e:	06be                	sll	a3,a3,0xf
    1aa0:	eff80813          	add	a6,a6,-257
    1aa4:	08068693          	add	a3,a3,128
    1aa8:	431d                	li	t1,7
    1aaa:	6198                	ld	a4,0(a1)
    1aac:	010707b3          	add	a5,a4,a6
    1ab0:	fff74893          	not	a7,a4
    1ab4:	0117f7b3          	and	a5,a5,a7
    1ab8:	8ff5                	and	a5,a5,a3
    1aba:	eb81                	bnez	a5,1aca <strncpy+0x86>
            *wd = *ws;
    1abc:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1abe:	1661                	add	a2,a2,-8
    1ac0:	05a1                	add	a1,a1,8
    1ac2:	0521                	add	a0,a0,8
    1ac4:	fec363e3          	bltu	t1,a2,1aaa <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1ac8:	ca11                	beqz	a2,1adc <strncpy+0x98>
    1aca:	0005c783          	lbu	a5,0(a1)
    1ace:	0585                	add	a1,a1,1
    1ad0:	00f50023          	sb	a5,0(a0)
    1ad4:	c789                	beqz	a5,1ade <strncpy+0x9a>
    1ad6:	167d                	add	a2,a2,-1
    1ad8:	0505                	add	a0,a0,1
    1ada:	fa65                	bnez	a2,1aca <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1adc:	8082                	ret
    1ade:	40a00733          	neg	a4,a0
    1ae2:	00777793          	and	a5,a4,7
    1ae6:	00778693          	add	a3,a5,7
    1aea:	482d                	li	a6,11
    1aec:	fff60593          	add	a1,a2,-1
    1af0:	1106ef63          	bltu	a3,a6,1c0e <strncpy+0x1ca>
    1af4:	12d5ee63          	bltu	a1,a3,1c30 <strncpy+0x1ec>
    1af8:	12078563          	beqz	a5,1c22 <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1afc:	00050023          	sb	zero,0(a0)
    1b00:	00677693          	and	a3,a4,6
    1b04:	12068263          	beqz	a3,1c28 <strncpy+0x1e4>
    1b08:	000500a3          	sb	zero,1(a0)
    1b0c:	4689                	li	a3,2
    1b0e:	12f6f463          	bgeu	a3,a5,1c36 <strncpy+0x1f2>
    1b12:	00050123          	sb	zero,2(a0)
    1b16:	8b11                	and	a4,a4,4
    1b18:	cf6d                	beqz	a4,1c12 <strncpy+0x1ce>
    1b1a:	000501a3          	sb	zero,3(a0)
    1b1e:	4711                	li	a4,4
    1b20:	00450693          	add	a3,a0,4
    1b24:	02f77363          	bgeu	a4,a5,1b4a <strncpy+0x106>
    1b28:	00050223          	sb	zero,4(a0)
    1b2c:	4715                	li	a4,5
    1b2e:	00550693          	add	a3,a0,5
    1b32:	00e78c63          	beq	a5,a4,1b4a <strncpy+0x106>
    1b36:	000502a3          	sb	zero,5(a0)
    1b3a:	471d                	li	a4,7
    1b3c:	10e79163          	bne	a5,a4,1c3e <strncpy+0x1fa>
    1b40:	00750693          	add	a3,a0,7
    1b44:	00050323          	sb	zero,6(a0)
    1b48:	471d                	li	a4,7
    1b4a:	40f608b3          	sub	a7,a2,a5
    1b4e:	ff88f813          	and	a6,a7,-8
    1b52:	97aa                	add	a5,a5,a0
    1b54:	010785b3          	add	a1,a5,a6
    1b58:	0007b023          	sd	zero,0(a5)
    1b5c:	07a1                	add	a5,a5,8
    1b5e:	feb79de3          	bne	a5,a1,1b58 <strncpy+0x114>
    1b62:	00e807bb          	addw	a5,a6,a4
    1b66:	01068733          	add	a4,a3,a6
    1b6a:	0b088b63          	beq	a7,a6,1c20 <strncpy+0x1dc>
    1b6e:	00070023          	sb	zero,0(a4)
    1b72:	0017869b          	addw	a3,a5,1
    1b76:	f6c6f3e3          	bgeu	a3,a2,1adc <strncpy+0x98>
    1b7a:	000700a3          	sb	zero,1(a4)
    1b7e:	0027869b          	addw	a3,a5,2
    1b82:	f4c6fde3          	bgeu	a3,a2,1adc <strncpy+0x98>
    1b86:	00070123          	sb	zero,2(a4)
    1b8a:	0037869b          	addw	a3,a5,3
    1b8e:	f4c6f7e3          	bgeu	a3,a2,1adc <strncpy+0x98>
    1b92:	000701a3          	sb	zero,3(a4)
    1b96:	0047869b          	addw	a3,a5,4
    1b9a:	f4c6f1e3          	bgeu	a3,a2,1adc <strncpy+0x98>
    1b9e:	00070223          	sb	zero,4(a4)
    1ba2:	0057869b          	addw	a3,a5,5
    1ba6:	f2c6fbe3          	bgeu	a3,a2,1adc <strncpy+0x98>
    1baa:	000702a3          	sb	zero,5(a4)
    1bae:	0067869b          	addw	a3,a5,6
    1bb2:	f2c6f5e3          	bgeu	a3,a2,1adc <strncpy+0x98>
    1bb6:	00070323          	sb	zero,6(a4)
    1bba:	0077869b          	addw	a3,a5,7
    1bbe:	f0c6ffe3          	bgeu	a3,a2,1adc <strncpy+0x98>
    1bc2:	000703a3          	sb	zero,7(a4)
    1bc6:	0087869b          	addw	a3,a5,8
    1bca:	f0c6f9e3          	bgeu	a3,a2,1adc <strncpy+0x98>
    1bce:	00070423          	sb	zero,8(a4)
    1bd2:	0097869b          	addw	a3,a5,9
    1bd6:	f0c6f3e3          	bgeu	a3,a2,1adc <strncpy+0x98>
    1bda:	000704a3          	sb	zero,9(a4)
    1bde:	00a7869b          	addw	a3,a5,10
    1be2:	eec6fde3          	bgeu	a3,a2,1adc <strncpy+0x98>
    1be6:	00070523          	sb	zero,10(a4)
    1bea:	00b7869b          	addw	a3,a5,11
    1bee:	eec6f7e3          	bgeu	a3,a2,1adc <strncpy+0x98>
    1bf2:	000705a3          	sb	zero,11(a4)
    1bf6:	00c7869b          	addw	a3,a5,12
    1bfa:	eec6f1e3          	bgeu	a3,a2,1adc <strncpy+0x98>
    1bfe:	00070623          	sb	zero,12(a4)
    1c02:	27b5                	addw	a5,a5,13
    1c04:	ecc7fce3          	bgeu	a5,a2,1adc <strncpy+0x98>
    1c08:	000706a3          	sb	zero,13(a4)
}
    1c0c:	8082                	ret
    1c0e:	46ad                	li	a3,11
    1c10:	b5d5                	j	1af4 <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c12:	00350693          	add	a3,a0,3
    1c16:	470d                	li	a4,3
    1c18:	bf0d                	j	1b4a <strncpy+0x106>
        if (!n || !*s)
    1c1a:	e4061ce3          	bnez	a2,1a72 <strncpy+0x2e>
}
    1c1e:	8082                	ret
    1c20:	8082                	ret
    char *p = dest;
    1c22:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c24:	4701                	li	a4,0
    1c26:	b715                	j	1b4a <strncpy+0x106>
    1c28:	00150693          	add	a3,a0,1
    1c2c:	4705                	li	a4,1
    1c2e:	bf31                	j	1b4a <strncpy+0x106>
    char *p = dest;
    1c30:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c32:	4781                	li	a5,0
    1c34:	bf2d                	j	1b6e <strncpy+0x12a>
    1c36:	00250693          	add	a3,a0,2
    1c3a:	4709                	li	a4,2
    1c3c:	b739                	j	1b4a <strncpy+0x106>
    1c3e:	00650693          	add	a3,a0,6
    1c42:	4719                	li	a4,6
    1c44:	b719                	j	1b4a <strncpy+0x106>

0000000000001c46 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c46:	87aa                	mv	a5,a0
    1c48:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c4a:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c4e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c52:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c54:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c56:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c5a:	2501                	sext.w	a0,a0
    1c5c:	8082                	ret

0000000000001c5e <openat>:
    register long a7 __asm__("a7") = n;
    1c5e:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c62:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c66:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c6a:	2501                	sext.w	a0,a0
    1c6c:	8082                	ret

0000000000001c6e <close>:
    register long a7 __asm__("a7") = n;
    1c6e:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c72:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c76:	2501                	sext.w	a0,a0
    1c78:	8082                	ret

0000000000001c7a <read>:
    register long a7 __asm__("a7") = n;
    1c7a:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c7e:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c82:	8082                	ret

0000000000001c84 <write>:
    register long a7 __asm__("a7") = n;
    1c84:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c88:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c8c:	8082                	ret

0000000000001c8e <getpid>:
    register long a7 __asm__("a7") = n;
    1c8e:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c92:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c96:	2501                	sext.w	a0,a0
    1c98:	8082                	ret

0000000000001c9a <getppid>:
    register long a7 __asm__("a7") = n;
    1c9a:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c9e:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1ca2:	2501                	sext.w	a0,a0
    1ca4:	8082                	ret

0000000000001ca6 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1ca6:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1caa:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cae:	2501                	sext.w	a0,a0
    1cb0:	8082                	ret

0000000000001cb2 <fork>:
    register long a7 __asm__("a7") = n;
    1cb2:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cb6:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cb8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cba:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cbe:	2501                	sext.w	a0,a0
    1cc0:	8082                	ret

0000000000001cc2 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cc2:	85b2                	mv	a1,a2
    1cc4:	863a                	mv	a2,a4
    if (stack)
    1cc6:	c191                	beqz	a1,1cca <clone+0x8>
	stack += stack_size;
    1cc8:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cca:	4781                	li	a5,0
    1ccc:	4701                	li	a4,0
    1cce:	4681                	li	a3,0
    1cd0:	2601                	sext.w	a2,a2
    1cd2:	a2ed                	j	1ebc <__clone>

0000000000001cd4 <exit>:
    register long a7 __asm__("a7") = n;
    1cd4:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cd8:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cdc:	8082                	ret

0000000000001cde <waitpid>:
    register long a7 __asm__("a7") = n;
    1cde:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1ce2:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ce4:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1ce8:	2501                	sext.w	a0,a0
    1cea:	8082                	ret

0000000000001cec <exec>:
    register long a7 __asm__("a7") = n;
    1cec:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cf0:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cf4:	2501                	sext.w	a0,a0
    1cf6:	8082                	ret

0000000000001cf8 <execve>:
    register long a7 __asm__("a7") = n;
    1cf8:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cfc:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d00:	2501                	sext.w	a0,a0
    1d02:	8082                	ret

0000000000001d04 <times>:
    register long a7 __asm__("a7") = n;
    1d04:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d08:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d0c:	2501                	sext.w	a0,a0
    1d0e:	8082                	ret

0000000000001d10 <get_time>:

int64 get_time()
{
    1d10:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d12:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d16:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d18:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d1a:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d1e:	2501                	sext.w	a0,a0
    1d20:	ed09                	bnez	a0,1d3a <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d22:	67a2                	ld	a5,8(sp)
    1d24:	3e800713          	li	a4,1000
    1d28:	00015503          	lhu	a0,0(sp)
    1d2c:	02e7d7b3          	divu	a5,a5,a4
    1d30:	02e50533          	mul	a0,a0,a4
    1d34:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d36:	0141                	add	sp,sp,16
    1d38:	8082                	ret
        return -1;
    1d3a:	557d                	li	a0,-1
    1d3c:	bfed                	j	1d36 <get_time+0x26>

0000000000001d3e <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d3e:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d42:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d46:	2501                	sext.w	a0,a0
    1d48:	8082                	ret

0000000000001d4a <time>:
    register long a7 __asm__("a7") = n;
    1d4a:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d4e:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d52:	2501                	sext.w	a0,a0
    1d54:	8082                	ret

0000000000001d56 <sleep>:

int sleep(unsigned long long time)
{
    1d56:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d58:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d5a:	850a                	mv	a0,sp
    1d5c:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d5e:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d62:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d64:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d68:	e501                	bnez	a0,1d70 <sleep+0x1a>
    return 0;
    1d6a:	4501                	li	a0,0
}
    1d6c:	0141                	add	sp,sp,16
    1d6e:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d70:	4502                	lw	a0,0(sp)
}
    1d72:	0141                	add	sp,sp,16
    1d74:	8082                	ret

0000000000001d76 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d76:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d7a:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d7e:	2501                	sext.w	a0,a0
    1d80:	8082                	ret

0000000000001d82 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d82:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d86:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d8a:	8082                	ret

0000000000001d8c <munmap>:
    register long a7 __asm__("a7") = n;
    1d8c:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d90:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d94:	2501                	sext.w	a0,a0
    1d96:	8082                	ret

0000000000001d98 <wait>:

int wait(int *code)
{
    1d98:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d9a:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d9e:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1da0:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1da2:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1da4:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1da8:	2501                	sext.w	a0,a0
    1daa:	8082                	ret

0000000000001dac <spawn>:
    register long a7 __asm__("a7") = n;
    1dac:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1db0:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1db4:	2501                	sext.w	a0,a0
    1db6:	8082                	ret

0000000000001db8 <mailread>:
    register long a7 __asm__("a7") = n;
    1db8:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dbc:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dc0:	2501                	sext.w	a0,a0
    1dc2:	8082                	ret

0000000000001dc4 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dc4:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dc8:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dcc:	2501                	sext.w	a0,a0
    1dce:	8082                	ret

0000000000001dd0 <fstat>:
    register long a7 __asm__("a7") = n;
    1dd0:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dd4:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dd8:	2501                	sext.w	a0,a0
    1dda:	8082                	ret

0000000000001ddc <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1ddc:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dde:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1de2:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1de4:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1de8:	2501                	sext.w	a0,a0
    1dea:	8082                	ret

0000000000001dec <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1dec:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dee:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1df2:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df4:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1df8:	2501                	sext.w	a0,a0
    1dfa:	8082                	ret

0000000000001dfc <link>:

int link(char *old_path, char *new_path)
{
    1dfc:	87aa                	mv	a5,a0
    1dfe:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e00:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e04:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e08:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e0a:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e0e:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e10:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e14:	2501                	sext.w	a0,a0
    1e16:	8082                	ret

0000000000001e18 <unlink>:

int unlink(char *path)
{
    1e18:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e1a:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e1e:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e22:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e24:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <uname>:
    register long a7 __asm__("a7") = n;
    1e2c:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e30:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <brk>:
    register long a7 __asm__("a7") = n;
    1e38:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e3c:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e40:	2501                	sext.w	a0,a0
    1e42:	8082                	ret

0000000000001e44 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e44:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e46:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e4a:	8082                	ret

0000000000001e4c <chdir>:
    register long a7 __asm__("a7") = n;
    1e4c:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e50:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e54:	2501                	sext.w	a0,a0
    1e56:	8082                	ret

0000000000001e58 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e58:	862e                	mv	a2,a1
    1e5a:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e5c:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e5e:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e62:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e66:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e68:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e6a:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e6e:	2501                	sext.w	a0,a0
    1e70:	8082                	ret

0000000000001e72 <getdents>:
    register long a7 __asm__("a7") = n;
    1e72:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e76:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e7a:	2501                	sext.w	a0,a0
    1e7c:	8082                	ret

0000000000001e7e <pipe>:
    register long a7 __asm__("a7") = n;
    1e7e:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e82:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e84:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e88:	2501                	sext.w	a0,a0
    1e8a:	8082                	ret

0000000000001e8c <dup>:
    register long a7 __asm__("a7") = n;
    1e8c:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e8e:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e92:	2501                	sext.w	a0,a0
    1e94:	8082                	ret

0000000000001e96 <dup2>:
    register long a7 __asm__("a7") = n;
    1e96:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e98:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e9a:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e9e:	2501                	sext.w	a0,a0
    1ea0:	8082                	ret

0000000000001ea2 <mount>:
    register long a7 __asm__("a7") = n;
    1ea2:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ea6:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1eaa:	2501                	sext.w	a0,a0
    1eac:	8082                	ret

0000000000001eae <umount>:
    register long a7 __asm__("a7") = n;
    1eae:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1eb2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb4:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1eb8:	2501                	sext.w	a0,a0
    1eba:	8082                	ret

0000000000001ebc <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ebc:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1ebe:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ec0:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ec2:	8532                	mv	a0,a2
	mv a2, a4
    1ec4:	863a                	mv	a2,a4
	mv a3, a5
    1ec6:	86be                	mv	a3,a5
	mv a4, a6
    1ec8:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1eca:	0dc00893          	li	a7,220
	ecall
    1ece:	00000073          	ecall

	beqz a0, 1f
    1ed2:	c111                	beqz	a0,1ed6 <__clone+0x1a>
	# Parent
	ret
    1ed4:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ed6:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ed8:	6522                	ld	a0,8(sp)
	jalr a1
    1eda:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1edc:	05d00893          	li	a7,93
	ecall
    1ee0:	00000073          	ecall
