
/root/oskernel2024-trustos/pre_ctests/build/riscv64/unlink:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a8f9                	j	10e0 <__start_main>

0000000000001004 <test_unlink>:
 * 测试失败，应有如下输出：
 * "  unlink error!"
 */

int test_unlink()
{
    1004:	1141                	add	sp,sp,-16
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f2a50513          	add	a0,a0,-214 # 1f30 <__clone+0x2e>
{
    100e:	e406                	sd	ra,8(sp)
    1010:	e022                	sd	s0,0(sp)
    TEST_START(__func__);
    1012:	306000ef          	jal	1318 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	fba50513          	add	a0,a0,-70 # 1fd0 <__func__.0>
    101e:	2fa000ef          	jal	1318 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	f2650513          	add	a0,a0,-218 # 1f48 <__clone+0x46>
    102a:	2ee000ef          	jal	1318 <puts>

    char *fname = "./test_unlink";
    int fd, ret;

    fd = open(fname, O_CREATE | O_WRONLY);
    102e:	04100593          	li	a1,65
    1032:	00001517          	auipc	a0,0x1
    1036:	f2650513          	add	a0,a0,-218 # 1f58 <__clone+0x56>
    103a:	449000ef          	jal	1c82 <open>
    103e:	842a                	mv	s0,a0
    assert(fd > 0);
    1040:	08a05163          	blez	a0,10c2 <test_unlink+0xbe>
    close(fd);
    1044:	8522                	mv	a0,s0
    1046:	46f000ef          	jal	1cb4 <close>

    // unlink test
    ret = unlink(fname);
    104a:	00001517          	auipc	a0,0x1
    104e:	f0e50513          	add	a0,a0,-242 # 1f58 <__clone+0x56>
    1052:	60d000ef          	jal	1e5e <unlink>
    assert(ret == 0);
    1056:	ed39                	bnez	a0,10b4 <test_unlink+0xb0>
    fd = open(fname, O_RDONLY);
    1058:	4581                	li	a1,0
    105a:	00001517          	auipc	a0,0x1
    105e:	efe50513          	add	a0,a0,-258 # 1f58 <__clone+0x56>
    1062:	421000ef          	jal	1c82 <open>
    1066:	842a                	mv	s0,a0
    if(fd < 0){
    1068:	02054f63          	bltz	a0,10a6 <test_unlink+0xa2>
        printf("  unlink success!\n");
    }else{
	printf("  unlink error!\n");
    106c:	00001517          	auipc	a0,0x1
    1070:	f3450513          	add	a0,a0,-204 # 1fa0 <__clone+0x9e>
    1074:	2c6000ef          	jal	133a <printf>
        close(fd);
    1078:	8522                	mv	a0,s0
    107a:	43b000ef          	jal	1cb4 <close>
    }
    // It's Ok if you don't delete the inode and data blocks.

    TEST_END(__func__);
    107e:	00001517          	auipc	a0,0x1
    1082:	f3a50513          	add	a0,a0,-198 # 1fb8 <__clone+0xb6>
    1086:	292000ef          	jal	1318 <puts>
    108a:	00001517          	auipc	a0,0x1
    108e:	f4650513          	add	a0,a0,-186 # 1fd0 <__func__.0>
    1092:	286000ef          	jal	1318 <puts>
}
    1096:	6402                	ld	s0,0(sp)
    1098:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    109a:	00001517          	auipc	a0,0x1
    109e:	eae50513          	add	a0,a0,-338 # 1f48 <__clone+0x46>
}
    10a2:	0141                	add	sp,sp,16
    TEST_END(__func__);
    10a4:	ac95                	j	1318 <puts>
        printf("  unlink success!\n");
    10a6:	00001517          	auipc	a0,0x1
    10aa:	ee250513          	add	a0,a0,-286 # 1f88 <__clone+0x86>
    10ae:	28c000ef          	jal	133a <printf>
    10b2:	b7f1                	j	107e <test_unlink+0x7a>
    assert(ret == 0);
    10b4:	00001517          	auipc	a0,0x1
    10b8:	eb450513          	add	a0,a0,-332 # 1f68 <__clone+0x66>
    10bc:	4fc000ef          	jal	15b8 <panic>
    10c0:	bf61                	j	1058 <test_unlink+0x54>
    assert(fd > 0);
    10c2:	00001517          	auipc	a0,0x1
    10c6:	ea650513          	add	a0,a0,-346 # 1f68 <__clone+0x66>
    10ca:	4ee000ef          	jal	15b8 <panic>
    10ce:	bf9d                	j	1044 <test_unlink+0x40>

00000000000010d0 <main>:

int main(void) {
    10d0:	1141                	add	sp,sp,-16
    10d2:	e406                	sd	ra,8(sp)
	test_unlink();
    10d4:	f31ff0ef          	jal	1004 <test_unlink>
	return 0;
}
    10d8:	60a2                	ld	ra,8(sp)
    10da:	4501                	li	a0,0
    10dc:	0141                	add	sp,sp,16
    10de:	8082                	ret

00000000000010e0 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10e0:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10e2:	4108                	lw	a0,0(a0)
{
    10e4:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10e6:	05a1                	add	a1,a1,8
{
    10e8:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10ea:	fe7ff0ef          	jal	10d0 <main>
    10ee:	42d000ef          	jal	1d1a <exit>
	return 0;
}
    10f2:	60a2                	ld	ra,8(sp)
    10f4:	4501                	li	a0,0
    10f6:	0141                	add	sp,sp,16
    10f8:	8082                	ret

00000000000010fa <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10fa:	7179                	add	sp,sp,-48
    10fc:	f406                	sd	ra,40(sp)
    10fe:	0005081b          	sext.w	a6,a0
    1102:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1104:	00055563          	bgez	a0,110e <printint.constprop.0+0x14>
        x = -xx;
    1108:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    110c:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    110e:	02b8763b          	remuw	a2,a6,a1
    1112:	00001697          	auipc	a3,0x1
    1116:	ece68693          	add	a3,a3,-306 # 1fe0 <digits>
    buf[16] = 0;
    111a:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    111e:	0005871b          	sext.w	a4,a1
    1122:	1602                	sll	a2,a2,0x20
    1124:	9201                	srl	a2,a2,0x20
    1126:	9636                	add	a2,a2,a3
    1128:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    112c:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    1130:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1134:	10b86c63          	bltu	a6,a1,124c <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    1138:	02e5763b          	remuw	a2,a0,a4
    113c:	1602                	sll	a2,a2,0x20
    113e:	9201                	srl	a2,a2,0x20
    1140:	9636                	add	a2,a2,a3
    1142:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1146:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    114a:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    114e:	10e56863          	bltu	a0,a4,125e <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    1152:	02e5f63b          	remuw	a2,a1,a4
    1156:	1602                	sll	a2,a2,0x20
    1158:	9201                	srl	a2,a2,0x20
    115a:	9636                	add	a2,a2,a3
    115c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1160:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1164:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1168:	10e5e463          	bltu	a1,a4,1270 <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    116c:	02e5763b          	remuw	a2,a0,a4
    1170:	1602                	sll	a2,a2,0x20
    1172:	9201                	srl	a2,a2,0x20
    1174:	9636                	add	a2,a2,a3
    1176:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    117a:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    117e:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1182:	10e56063          	bltu	a0,a4,1282 <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    1186:	02e5f63b          	remuw	a2,a1,a4
    118a:	1602                	sll	a2,a2,0x20
    118c:	9201                	srl	a2,a2,0x20
    118e:	9636                	add	a2,a2,a3
    1190:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1194:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1198:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    119c:	0ee5ec63          	bltu	a1,a4,1294 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11a0:	02e5763b          	remuw	a2,a0,a4
    11a4:	1602                	sll	a2,a2,0x20
    11a6:	9201                	srl	a2,a2,0x20
    11a8:	9636                	add	a2,a2,a3
    11aa:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ae:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11b2:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11b6:	08e56263          	bltu	a0,a4,123a <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    11ba:	02e5f63b          	remuw	a2,a1,a4
    11be:	1602                	sll	a2,a2,0x20
    11c0:	9201                	srl	a2,a2,0x20
    11c2:	9636                	add	a2,a2,a3
    11c4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c8:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11cc:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11d0:	0ce5eb63          	bltu	a1,a4,12a6 <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    11d4:	02e5763b          	remuw	a2,a0,a4
    11d8:	1602                	sll	a2,a2,0x20
    11da:	9201                	srl	a2,a2,0x20
    11dc:	9636                	add	a2,a2,a3
    11de:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11e2:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11e6:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11ea:	0ce56763          	bltu	a0,a4,12b8 <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    11ee:	02e5f63b          	remuw	a2,a1,a4
    11f2:	1602                	sll	a2,a2,0x20
    11f4:	9201                	srl	a2,a2,0x20
    11f6:	9636                	add	a2,a2,a3
    11f8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11fc:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1200:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    1204:	0ce5e363          	bltu	a1,a4,12ca <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    1208:	1782                	sll	a5,a5,0x20
    120a:	9381                	srl	a5,a5,0x20
    120c:	96be                	add	a3,a3,a5
    120e:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    1212:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    1214:	00f10723          	sb	a5,14(sp)
    if (sign)
    1218:	00088763          	beqz	a7,1226 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    121c:	02d00793          	li	a5,45
    1220:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1224:	4595                	li	a1,5
    write(f, s, l);
    1226:	003c                	add	a5,sp,8
    1228:	4641                	li	a2,16
    122a:	9e0d                	subw	a2,a2,a1
    122c:	4505                	li	a0,1
    122e:	95be                	add	a1,a1,a5
    1230:	29b000ef          	jal	1cca <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1234:	70a2                	ld	ra,40(sp)
    1236:	6145                	add	sp,sp,48
    1238:	8082                	ret
    i++;
    123a:	45a9                	li	a1,10
    if (sign)
    123c:	fe0885e3          	beqz	a7,1226 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1240:	02d00793          	li	a5,45
    1244:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1248:	45a5                	li	a1,9
    124a:	bff1                	j	1226 <printint.constprop.0+0x12c>
    i++;
    124c:	45bd                	li	a1,15
    if (sign)
    124e:	fc088ce3          	beqz	a7,1226 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1252:	02d00793          	li	a5,45
    1256:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    125a:	45b9                	li	a1,14
    125c:	b7e9                	j	1226 <printint.constprop.0+0x12c>
    i++;
    125e:	45b9                	li	a1,14
    if (sign)
    1260:	fc0883e3          	beqz	a7,1226 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1264:	02d00793          	li	a5,45
    1268:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    126c:	45b5                	li	a1,13
    126e:	bf65                	j	1226 <printint.constprop.0+0x12c>
    i++;
    1270:	45b5                	li	a1,13
    if (sign)
    1272:	fa088ae3          	beqz	a7,1226 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1276:	02d00793          	li	a5,45
    127a:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    127e:	45b1                	li	a1,12
    1280:	b75d                	j	1226 <printint.constprop.0+0x12c>
    i++;
    1282:	45b1                	li	a1,12
    if (sign)
    1284:	fa0881e3          	beqz	a7,1226 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1288:	02d00793          	li	a5,45
    128c:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1290:	45ad                	li	a1,11
    1292:	bf51                	j	1226 <printint.constprop.0+0x12c>
    i++;
    1294:	45ad                	li	a1,11
    if (sign)
    1296:	f80888e3          	beqz	a7,1226 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    129a:	02d00793          	li	a5,45
    129e:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12a2:	45a9                	li	a1,10
    12a4:	b749                	j	1226 <printint.constprop.0+0x12c>
    i++;
    12a6:	45a5                	li	a1,9
    if (sign)
    12a8:	f6088fe3          	beqz	a7,1226 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12ac:	02d00793          	li	a5,45
    12b0:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12b4:	45a1                	li	a1,8
    12b6:	bf85                	j	1226 <printint.constprop.0+0x12c>
    i++;
    12b8:	45a1                	li	a1,8
    if (sign)
    12ba:	f60886e3          	beqz	a7,1226 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12be:	02d00793          	li	a5,45
    12c2:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12c6:	459d                	li	a1,7
    12c8:	bfb9                	j	1226 <printint.constprop.0+0x12c>
    i++;
    12ca:	459d                	li	a1,7
    if (sign)
    12cc:	f4088de3          	beqz	a7,1226 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12d0:	02d00793          	li	a5,45
    12d4:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12d8:	4599                	li	a1,6
    12da:	b7b1                	j	1226 <printint.constprop.0+0x12c>

00000000000012dc <getchar>:
{
    12dc:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12de:	00f10593          	add	a1,sp,15
    12e2:	4605                	li	a2,1
    12e4:	4501                	li	a0,0
{
    12e6:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12e8:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12ec:	1d5000ef          	jal	1cc0 <read>
}
    12f0:	60e2                	ld	ra,24(sp)
    12f2:	00f14503          	lbu	a0,15(sp)
    12f6:	6105                	add	sp,sp,32
    12f8:	8082                	ret

00000000000012fa <putchar>:
{
    12fa:	1101                	add	sp,sp,-32
    12fc:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12fe:	00f10593          	add	a1,sp,15
    1302:	4605                	li	a2,1
    1304:	4505                	li	a0,1
{
    1306:	ec06                	sd	ra,24(sp)
    char byte = c;
    1308:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    130c:	1bf000ef          	jal	1cca <write>
}
    1310:	60e2                	ld	ra,24(sp)
    1312:	2501                	sext.w	a0,a0
    1314:	6105                	add	sp,sp,32
    1316:	8082                	ret

0000000000001318 <puts>:
{
    1318:	1141                	add	sp,sp,-16
    131a:	e406                	sd	ra,8(sp)
    131c:	e022                	sd	s0,0(sp)
    131e:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1320:	56c000ef          	jal	188c <strlen>
    1324:	862a                	mv	a2,a0
    1326:	85a2                	mv	a1,s0
    1328:	4505                	li	a0,1
    132a:	1a1000ef          	jal	1cca <write>
}
    132e:	60a2                	ld	ra,8(sp)
    1330:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1332:	957d                	sra	a0,a0,0x3f
    return r;
    1334:	2501                	sext.w	a0,a0
}
    1336:	0141                	add	sp,sp,16
    1338:	8082                	ret

000000000000133a <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    133a:	7131                	add	sp,sp,-192
    133c:	e4d6                	sd	s5,72(sp)
    133e:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    1340:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1342:	013c                	add	a5,sp,136
{
    1344:	f0ca                	sd	s2,96(sp)
    1346:	ecce                	sd	s3,88(sp)
    1348:	e8d2                	sd	s4,80(sp)
    134a:	e0da                	sd	s6,64(sp)
    134c:	fc5e                	sd	s7,56(sp)
    134e:	fc86                	sd	ra,120(sp)
    1350:	f8a2                	sd	s0,112(sp)
    1352:	f4a6                	sd	s1,104(sp)
    1354:	e52e                	sd	a1,136(sp)
    1356:	e932                	sd	a2,144(sp)
    1358:	ed36                	sd	a3,152(sp)
    135a:	f13a                	sd	a4,160(sp)
    135c:	f942                	sd	a6,176(sp)
    135e:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1360:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1362:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1366:	07300a13          	li	s4,115
    136a:	07800b93          	li	s7,120
    136e:	06400b13          	li	s6,100
    buf[i++] = '0';
    1372:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x5850>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1376:	00001997          	auipc	s3,0x1
    137a:	c6a98993          	add	s3,s3,-918 # 1fe0 <digits>
        if (!*s)
    137e:	00054783          	lbu	a5,0(a0)
    1382:	16078863          	beqz	a5,14f2 <printf+0x1b8>
    1386:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1388:	19278063          	beq	a5,s2,1508 <printf+0x1ce>
    138c:	00164783          	lbu	a5,1(a2)
    1390:	0605                	add	a2,a2,1
    1392:	fbfd                	bnez	a5,1388 <printf+0x4e>
    1394:	84b2                	mv	s1,a2
        l = z - a;
    1396:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    139a:	85aa                	mv	a1,a0
    139c:	8622                	mv	a2,s0
    139e:	4505                	li	a0,1
    13a0:	12b000ef          	jal	1cca <write>
        if (l)
    13a4:	18041763          	bnez	s0,1532 <printf+0x1f8>
        if (s[1] == 0)
    13a8:	0014c783          	lbu	a5,1(s1)
    13ac:	14078363          	beqz	a5,14f2 <printf+0x1b8>
        switch (s[1])
    13b0:	19478f63          	beq	a5,s4,154e <printf+0x214>
    13b4:	18fa6163          	bltu	s4,a5,1536 <printf+0x1fc>
    13b8:	1b678e63          	beq	a5,s6,1574 <printf+0x23a>
    13bc:	07000713          	li	a4,112
    13c0:	1ce79463          	bne	a5,a4,1588 <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13c4:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13c6:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13ca:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13cc:	631c                	ld	a5,0(a4)
    13ce:	0721                	add	a4,a4,8
    13d0:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13d2:	00479293          	sll	t0,a5,0x4
    13d6:	00879f93          	sll	t6,a5,0x8
    13da:	00c79f13          	sll	t5,a5,0xc
    13de:	01079e93          	sll	t4,a5,0x10
    13e2:	01479e13          	sll	t3,a5,0x14
    13e6:	01879313          	sll	t1,a5,0x18
    13ea:	01c79893          	sll	a7,a5,0x1c
    13ee:	02479813          	sll	a6,a5,0x24
    13f2:	02879513          	sll	a0,a5,0x28
    13f6:	02c79593          	sll	a1,a5,0x2c
    13fa:	03079693          	sll	a3,a5,0x30
    13fe:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1402:	03c7d413          	srl	s0,a5,0x3c
    1406:	01c7d39b          	srlw	t2,a5,0x1c
    140a:	03c2d293          	srl	t0,t0,0x3c
    140e:	03cfdf93          	srl	t6,t6,0x3c
    1412:	03cf5f13          	srl	t5,t5,0x3c
    1416:	03cede93          	srl	t4,t4,0x3c
    141a:	03ce5e13          	srl	t3,t3,0x3c
    141e:	03c35313          	srl	t1,t1,0x3c
    1422:	03c8d893          	srl	a7,a7,0x3c
    1426:	03c85813          	srl	a6,a6,0x3c
    142a:	9171                	srl	a0,a0,0x3c
    142c:	91f1                	srl	a1,a1,0x3c
    142e:	92f1                	srl	a3,a3,0x3c
    1430:	9371                	srl	a4,a4,0x3c
    1432:	974e                	add	a4,a4,s3
    1434:	944e                	add	s0,s0,s3
    1436:	92ce                	add	t0,t0,s3
    1438:	9fce                	add	t6,t6,s3
    143a:	9f4e                	add	t5,t5,s3
    143c:	9ece                	add	t4,t4,s3
    143e:	9e4e                	add	t3,t3,s3
    1440:	934e                	add	t1,t1,s3
    1442:	98ce                	add	a7,a7,s3
    1444:	93ce                	add	t2,t2,s3
    1446:	984e                	add	a6,a6,s3
    1448:	954e                	add	a0,a0,s3
    144a:	95ce                	add	a1,a1,s3
    144c:	96ce                	add	a3,a3,s3
    144e:	00074083          	lbu	ra,0(a4)
    1452:	0002c283          	lbu	t0,0(t0)
    1456:	000fcf83          	lbu	t6,0(t6)
    145a:	000f4f03          	lbu	t5,0(t5)
    145e:	000ece83          	lbu	t4,0(t4)
    1462:	000e4e03          	lbu	t3,0(t3)
    1466:	00034303          	lbu	t1,0(t1)
    146a:	0008c883          	lbu	a7,0(a7)
    146e:	0003c383          	lbu	t2,0(t2)
    1472:	00084803          	lbu	a6,0(a6)
    1476:	00054503          	lbu	a0,0(a0)
    147a:	0005c583          	lbu	a1,0(a1)
    147e:	0006c683          	lbu	a3,0(a3)
    1482:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1486:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    148a:	9371                	srl	a4,a4,0x3c
    148c:	8bbd                	and	a5,a5,15
    148e:	974e                	add	a4,a4,s3
    1490:	97ce                	add	a5,a5,s3
    1492:	005105a3          	sb	t0,11(sp)
    1496:	01f10623          	sb	t6,12(sp)
    149a:	01e106a3          	sb	t5,13(sp)
    149e:	01d10723          	sb	t4,14(sp)
    14a2:	01c107a3          	sb	t3,15(sp)
    14a6:	00610823          	sb	t1,16(sp)
    14aa:	011108a3          	sb	a7,17(sp)
    14ae:	00710923          	sb	t2,18(sp)
    14b2:	010109a3          	sb	a6,19(sp)
    14b6:	00a10a23          	sb	a0,20(sp)
    14ba:	00b10aa3          	sb	a1,21(sp)
    14be:	00d10b23          	sb	a3,22(sp)
    14c2:	00110ba3          	sb	ra,23(sp)
    14c6:	00810523          	sb	s0,10(sp)
    14ca:	00074703          	lbu	a4,0(a4)
    14ce:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14d2:	002c                	add	a1,sp,8
    14d4:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14d6:	00e10c23          	sb	a4,24(sp)
    14da:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14de:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14e2:	7e8000ef          	jal	1cca <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14e6:	00248513          	add	a0,s1,2
        if (!*s)
    14ea:	00054783          	lbu	a5,0(a0)
    14ee:	e8079ce3          	bnez	a5,1386 <printf+0x4c>
    }
    va_end(ap);
}
    14f2:	70e6                	ld	ra,120(sp)
    14f4:	7446                	ld	s0,112(sp)
    14f6:	74a6                	ld	s1,104(sp)
    14f8:	7906                	ld	s2,96(sp)
    14fa:	69e6                	ld	s3,88(sp)
    14fc:	6a46                	ld	s4,80(sp)
    14fe:	6aa6                	ld	s5,72(sp)
    1500:	6b06                	ld	s6,64(sp)
    1502:	7be2                	ld	s7,56(sp)
    1504:	6129                	add	sp,sp,192
    1506:	8082                	ret
    1508:	84b2                	mv	s1,a2
    150a:	a039                	j	1518 <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    150c:	0024c783          	lbu	a5,2(s1)
    1510:	0605                	add	a2,a2,1
    1512:	0489                	add	s1,s1,2
    1514:	e92791e3          	bne	a5,s2,1396 <printf+0x5c>
    1518:	0014c783          	lbu	a5,1(s1)
    151c:	ff2788e3          	beq	a5,s2,150c <printf+0x1d2>
        l = z - a;
    1520:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1524:	85aa                	mv	a1,a0
    1526:	8622                	mv	a2,s0
    1528:	4505                	li	a0,1
    152a:	7a0000ef          	jal	1cca <write>
        if (l)
    152e:	e6040de3          	beqz	s0,13a8 <printf+0x6e>
    1532:	8526                	mv	a0,s1
    1534:	b5a9                	j	137e <printf+0x44>
        switch (s[1])
    1536:	05779963          	bne	a5,s7,1588 <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    153a:	6782                	ld	a5,0(sp)
    153c:	45c1                	li	a1,16
    153e:	4388                	lw	a0,0(a5)
    1540:	07a1                	add	a5,a5,8
    1542:	e03e                	sd	a5,0(sp)
    1544:	bb7ff0ef          	jal	10fa <printint.constprop.0>
        s += 2;
    1548:	00248513          	add	a0,s1,2
    154c:	bf79                	j	14ea <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    154e:	6782                	ld	a5,0(sp)
    1550:	6380                	ld	s0,0(a5)
    1552:	07a1                	add	a5,a5,8
    1554:	e03e                	sd	a5,0(sp)
    1556:	cc21                	beqz	s0,15ae <printf+0x274>
            l = strnlen(a, 200);
    1558:	0c800593          	li	a1,200
    155c:	8522                	mv	a0,s0
    155e:	460000ef          	jal	19be <strnlen>
    write(f, s, l);
    1562:	0005061b          	sext.w	a2,a0
    1566:	85a2                	mv	a1,s0
    1568:	4505                	li	a0,1
    156a:	760000ef          	jal	1cca <write>
        s += 2;
    156e:	00248513          	add	a0,s1,2
    1572:	bfa5                	j	14ea <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    1574:	6782                	ld	a5,0(sp)
    1576:	45a9                	li	a1,10
    1578:	4388                	lw	a0,0(a5)
    157a:	07a1                	add	a5,a5,8
    157c:	e03e                	sd	a5,0(sp)
    157e:	b7dff0ef          	jal	10fa <printint.constprop.0>
        s += 2;
    1582:	00248513          	add	a0,s1,2
    1586:	b795                	j	14ea <printf+0x1b0>
    return write(stdout, &byte, 1);
    1588:	4605                	li	a2,1
    158a:	002c                	add	a1,sp,8
    158c:	4505                	li	a0,1
    char byte = c;
    158e:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1592:	738000ef          	jal	1cca <write>
    char byte = c;
    1596:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    159a:	4605                	li	a2,1
    159c:	002c                	add	a1,sp,8
    159e:	4505                	li	a0,1
    char byte = c;
    15a0:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15a4:	726000ef          	jal	1cca <write>
        s += 2;
    15a8:	00248513          	add	a0,s1,2
    15ac:	bf3d                	j	14ea <printf+0x1b0>
                a = "(null)";
    15ae:	00001417          	auipc	s0,0x1
    15b2:	a1a40413          	add	s0,s0,-1510 # 1fc8 <__clone+0xc6>
    15b6:	b74d                	j	1558 <printf+0x21e>

00000000000015b8 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15b8:	1141                	add	sp,sp,-16
    15ba:	e406                	sd	ra,8(sp)
    puts(m);
    15bc:	d5dff0ef          	jal	1318 <puts>
    exit(-100);
}
    15c0:	60a2                	ld	ra,8(sp)
    exit(-100);
    15c2:	f9c00513          	li	a0,-100
}
    15c6:	0141                	add	sp,sp,16
    exit(-100);
    15c8:	af89                	j	1d1a <exit>

00000000000015ca <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ca:	02000793          	li	a5,32
    15ce:	00f50663          	beq	a0,a5,15da <isspace+0x10>
    15d2:	355d                	addw	a0,a0,-9
    15d4:	00553513          	sltiu	a0,a0,5
    15d8:	8082                	ret
    15da:	4505                	li	a0,1
}
    15dc:	8082                	ret

00000000000015de <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15de:	fd05051b          	addw	a0,a0,-48
}
    15e2:	00a53513          	sltiu	a0,a0,10
    15e6:	8082                	ret

00000000000015e8 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15e8:	02000713          	li	a4,32
    15ec:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15ee:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15f2:	ff76879b          	addw	a5,a3,-9
    15f6:	06e68063          	beq	a3,a4,1656 <atoi+0x6e>
    15fa:	0006859b          	sext.w	a1,a3
    15fe:	04f67c63          	bgeu	a2,a5,1656 <atoi+0x6e>
        s++;
    switch (*s)
    1602:	02b00793          	li	a5,43
    1606:	06f68563          	beq	a3,a5,1670 <atoi+0x88>
    160a:	02d00793          	li	a5,45
    160e:	04f69663          	bne	a3,a5,165a <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1612:	00154683          	lbu	a3,1(a0)
    1616:	47a5                	li	a5,9
        s++;
    1618:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    161c:	fd06869b          	addw	a3,a3,-48
    1620:	8636                	mv	a2,a3
    while (isdigit(*s))
    1622:	04d7e563          	bltu	a5,a3,166c <atoi+0x84>
        neg = 1;
    1626:	4885                	li	a7,1
    int n = 0, neg = 0;
    1628:	4501                	li	a0,0
    while (isdigit(*s))
    162a:	4825                	li	a6,9
    162c:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1630:	0025179b          	sllw	a5,a0,0x2
    1634:	9fa9                	addw	a5,a5,a0
    1636:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    163a:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    163e:	85b2                	mv	a1,a2
    1640:	40c7853b          	subw	a0,a5,a2
    1644:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    1646:	8636                	mv	a2,a3
    while (isdigit(*s))
    1648:	fed872e3          	bgeu	a6,a3,162c <atoi+0x44>
    return neg ? n : -n;
    164c:	02089163          	bnez	a7,166e <atoi+0x86>
    1650:	40f5853b          	subw	a0,a1,a5
    1654:	8082                	ret
        s++;
    1656:	0505                	add	a0,a0,1
    1658:	bf59                	j	15ee <atoi+0x6>
    while (isdigit(*s))
    165a:	fd05859b          	addw	a1,a1,-48
    165e:	47a5                	li	a5,9
    1660:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1662:	4881                	li	a7,0
    1664:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    1668:	fcb7f0e3          	bgeu	a5,a1,1628 <atoi+0x40>
    return neg ? n : -n;
    166c:	4501                	li	a0,0
}
    166e:	8082                	ret
    while (isdigit(*s))
    1670:	00154683          	lbu	a3,1(a0)
    1674:	47a5                	li	a5,9
        s++;
    1676:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    167a:	fd06869b          	addw	a3,a3,-48
    167e:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    1680:	4881                	li	a7,0
    while (isdigit(*s))
    1682:	fad7f3e3          	bgeu	a5,a3,1628 <atoi+0x40>
    return neg ? n : -n;
    1686:	4501                	li	a0,0
    1688:	8082                	ret

000000000000168a <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    168a:	16060f63          	beqz	a2,1808 <memset+0x17e>
    168e:	40a006b3          	neg	a3,a0
    1692:	0076f793          	and	a5,a3,7
    1696:	00778813          	add	a6,a5,7
    169a:	48ad                	li	a7,11
    169c:	0ff5f713          	zext.b	a4,a1
    16a0:	fff60593          	add	a1,a2,-1
    16a4:	17186363          	bltu	a6,a7,180a <memset+0x180>
    16a8:	1705eb63          	bltu	a1,a6,181e <memset+0x194>
    16ac:	16078163          	beqz	a5,180e <memset+0x184>
    16b0:	00e50023          	sb	a4,0(a0)
    16b4:	0066f593          	and	a1,a3,6
    16b8:	14058e63          	beqz	a1,1814 <memset+0x18a>
    16bc:	00e500a3          	sb	a4,1(a0)
    16c0:	4589                	li	a1,2
    16c2:	00250813          	add	a6,a0,2
    16c6:	04f5f663          	bgeu	a1,a5,1712 <memset+0x88>
    16ca:	00e50123          	sb	a4,2(a0)
    16ce:	8a91                	and	a3,a3,4
    16d0:	00350813          	add	a6,a0,3
    16d4:	458d                	li	a1,3
    16d6:	ce95                	beqz	a3,1712 <memset+0x88>
    16d8:	00e501a3          	sb	a4,3(a0)
    16dc:	4691                	li	a3,4
    16de:	00450813          	add	a6,a0,4
    16e2:	4591                	li	a1,4
    16e4:	02f6f763          	bgeu	a3,a5,1712 <memset+0x88>
    16e8:	00e50223          	sb	a4,4(a0)
    16ec:	4695                	li	a3,5
    16ee:	00550813          	add	a6,a0,5
    16f2:	4595                	li	a1,5
    16f4:	00d78f63          	beq	a5,a3,1712 <memset+0x88>
    16f8:	00e502a3          	sb	a4,5(a0)
    16fc:	469d                	li	a3,7
    16fe:	00650813          	add	a6,a0,6
    1702:	4599                	li	a1,6
    1704:	00d79763          	bne	a5,a3,1712 <memset+0x88>
    1708:	00750813          	add	a6,a0,7
    170c:	00e50323          	sb	a4,6(a0)
    1710:	459d                	li	a1,7
    1712:	00871693          	sll	a3,a4,0x8
    1716:	01071313          	sll	t1,a4,0x10
    171a:	8ed9                	or	a3,a3,a4
    171c:	01871893          	sll	a7,a4,0x18
    1720:	0066e6b3          	or	a3,a3,t1
    1724:	0116e6b3          	or	a3,a3,a7
    1728:	02071313          	sll	t1,a4,0x20
    172c:	02871893          	sll	a7,a4,0x28
    1730:	0066e6b3          	or	a3,a3,t1
    1734:	40f60e33          	sub	t3,a2,a5
    1738:	03071313          	sll	t1,a4,0x30
    173c:	0116e6b3          	or	a3,a3,a7
    1740:	0066e6b3          	or	a3,a3,t1
    1744:	03871893          	sll	a7,a4,0x38
    1748:	97aa                	add	a5,a5,a0
    174a:	ff8e7313          	and	t1,t3,-8
    174e:	0116e6b3          	or	a3,a3,a7
    1752:	00f308b3          	add	a7,t1,a5
    1756:	e394                	sd	a3,0(a5)
    1758:	07a1                	add	a5,a5,8
    175a:	ff179ee3          	bne	a5,a7,1756 <memset+0xcc>
    175e:	006806b3          	add	a3,a6,t1
    1762:	00b307bb          	addw	a5,t1,a1
    1766:	0bc30b63          	beq	t1,t3,181c <memset+0x192>
    176a:	00e68023          	sb	a4,0(a3)
    176e:	0017859b          	addw	a1,a5,1
    1772:	08c5fb63          	bgeu	a1,a2,1808 <memset+0x17e>
    1776:	00e680a3          	sb	a4,1(a3)
    177a:	0027859b          	addw	a1,a5,2
    177e:	08c5f563          	bgeu	a1,a2,1808 <memset+0x17e>
    1782:	00e68123          	sb	a4,2(a3)
    1786:	0037859b          	addw	a1,a5,3
    178a:	06c5ff63          	bgeu	a1,a2,1808 <memset+0x17e>
    178e:	00e681a3          	sb	a4,3(a3)
    1792:	0047859b          	addw	a1,a5,4
    1796:	06c5f963          	bgeu	a1,a2,1808 <memset+0x17e>
    179a:	00e68223          	sb	a4,4(a3)
    179e:	0057859b          	addw	a1,a5,5
    17a2:	06c5f363          	bgeu	a1,a2,1808 <memset+0x17e>
    17a6:	00e682a3          	sb	a4,5(a3)
    17aa:	0067859b          	addw	a1,a5,6
    17ae:	04c5fd63          	bgeu	a1,a2,1808 <memset+0x17e>
    17b2:	00e68323          	sb	a4,6(a3)
    17b6:	0077859b          	addw	a1,a5,7
    17ba:	04c5f763          	bgeu	a1,a2,1808 <memset+0x17e>
    17be:	00e683a3          	sb	a4,7(a3)
    17c2:	0087859b          	addw	a1,a5,8
    17c6:	04c5f163          	bgeu	a1,a2,1808 <memset+0x17e>
    17ca:	00e68423          	sb	a4,8(a3)
    17ce:	0097859b          	addw	a1,a5,9
    17d2:	02c5fb63          	bgeu	a1,a2,1808 <memset+0x17e>
    17d6:	00e684a3          	sb	a4,9(a3)
    17da:	00a7859b          	addw	a1,a5,10
    17de:	02c5f563          	bgeu	a1,a2,1808 <memset+0x17e>
    17e2:	00e68523          	sb	a4,10(a3)
    17e6:	00b7859b          	addw	a1,a5,11
    17ea:	00c5ff63          	bgeu	a1,a2,1808 <memset+0x17e>
    17ee:	00e685a3          	sb	a4,11(a3)
    17f2:	00c7859b          	addw	a1,a5,12
    17f6:	00c5f963          	bgeu	a1,a2,1808 <memset+0x17e>
    17fa:	00e68623          	sb	a4,12(a3)
    17fe:	27b5                	addw	a5,a5,13
    1800:	00c7f463          	bgeu	a5,a2,1808 <memset+0x17e>
    1804:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    1808:	8082                	ret
    180a:	482d                	li	a6,11
    180c:	bd71                	j	16a8 <memset+0x1e>
    char *p = dest;
    180e:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1810:	4581                	li	a1,0
    1812:	b701                	j	1712 <memset+0x88>
    1814:	00150813          	add	a6,a0,1
    1818:	4585                	li	a1,1
    181a:	bde5                	j	1712 <memset+0x88>
    181c:	8082                	ret
    char *p = dest;
    181e:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1820:	4781                	li	a5,0
    1822:	b7a1                	j	176a <memset+0xe0>

0000000000001824 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1824:	00054783          	lbu	a5,0(a0)
    1828:	0005c703          	lbu	a4,0(a1)
    182c:	00e79863          	bne	a5,a4,183c <strcmp+0x18>
    1830:	0505                	add	a0,a0,1
    1832:	0585                	add	a1,a1,1
    1834:	fbe5                	bnez	a5,1824 <strcmp>
    1836:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1838:	9d19                	subw	a0,a0,a4
    183a:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    183c:	0007851b          	sext.w	a0,a5
    1840:	bfe5                	j	1838 <strcmp+0x14>

0000000000001842 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1842:	ca15                	beqz	a2,1876 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1844:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1848:	167d                	add	a2,a2,-1
    184a:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    184e:	eb99                	bnez	a5,1864 <strncmp+0x22>
    1850:	a815                	j	1884 <strncmp+0x42>
    1852:	00a68e63          	beq	a3,a0,186e <strncmp+0x2c>
    1856:	0505                	add	a0,a0,1
    1858:	00f71b63          	bne	a4,a5,186e <strncmp+0x2c>
    185c:	00054783          	lbu	a5,0(a0)
    1860:	cf89                	beqz	a5,187a <strncmp+0x38>
    1862:	85b2                	mv	a1,a2
    1864:	0005c703          	lbu	a4,0(a1)
    1868:	00158613          	add	a2,a1,1
    186c:	f37d                	bnez	a4,1852 <strncmp+0x10>
        ;
    return *l - *r;
    186e:	0007851b          	sext.w	a0,a5
    1872:	9d19                	subw	a0,a0,a4
    1874:	8082                	ret
        return 0;
    1876:	4501                	li	a0,0
}
    1878:	8082                	ret
    return *l - *r;
    187a:	0015c703          	lbu	a4,1(a1)
    187e:	4501                	li	a0,0
    1880:	9d19                	subw	a0,a0,a4
    1882:	8082                	ret
    1884:	0005c703          	lbu	a4,0(a1)
    1888:	4501                	li	a0,0
    188a:	b7e5                	j	1872 <strncmp+0x30>

000000000000188c <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    188c:	00757793          	and	a5,a0,7
    1890:	cf89                	beqz	a5,18aa <strlen+0x1e>
    1892:	87aa                	mv	a5,a0
    1894:	a029                	j	189e <strlen+0x12>
    1896:	0785                	add	a5,a5,1
    1898:	0077f713          	and	a4,a5,7
    189c:	cb01                	beqz	a4,18ac <strlen+0x20>
        if (!*s)
    189e:	0007c703          	lbu	a4,0(a5)
    18a2:	fb75                	bnez	a4,1896 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18a4:	40a78533          	sub	a0,a5,a0
}
    18a8:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18aa:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18ac:	feff05b7          	lui	a1,0xfeff0
    18b0:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedf1f>
    18b4:	f0101637          	lui	a2,0xf0101
    18b8:	05c2                	sll	a1,a1,0x10
    18ba:	0612                	sll	a2,a2,0x4
    18bc:	6394                	ld	a3,0(a5)
    18be:	eff58593          	add	a1,a1,-257
    18c2:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff121>
    18c6:	05c2                	sll	a1,a1,0x10
    18c8:	0642                	sll	a2,a2,0x10
    18ca:	eff58593          	add	a1,a1,-257
    18ce:	10160613          	add	a2,a2,257
    18d2:	00b68733          	add	a4,a3,a1
    18d6:	063e                	sll	a2,a2,0xf
    18d8:	fff6c693          	not	a3,a3
    18dc:	8f75                	and	a4,a4,a3
    18de:	08060613          	add	a2,a2,128
    18e2:	8f71                	and	a4,a4,a2
    18e4:	eb11                	bnez	a4,18f8 <strlen+0x6c>
    18e6:	6794                	ld	a3,8(a5)
    18e8:	07a1                	add	a5,a5,8
    18ea:	00b68733          	add	a4,a3,a1
    18ee:	fff6c693          	not	a3,a3
    18f2:	8f75                	and	a4,a4,a3
    18f4:	8f71                	and	a4,a4,a2
    18f6:	db65                	beqz	a4,18e6 <strlen+0x5a>
    for (; *s; s++)
    18f8:	0007c703          	lbu	a4,0(a5)
    18fc:	d745                	beqz	a4,18a4 <strlen+0x18>
    18fe:	0017c703          	lbu	a4,1(a5)
    1902:	0785                	add	a5,a5,1
    1904:	d345                	beqz	a4,18a4 <strlen+0x18>
    1906:	0017c703          	lbu	a4,1(a5)
    190a:	0785                	add	a5,a5,1
    190c:	fb6d                	bnez	a4,18fe <strlen+0x72>
    190e:	bf59                	j	18a4 <strlen+0x18>

0000000000001910 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1910:	00757713          	and	a4,a0,7
{
    1914:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1916:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    191a:	cb19                	beqz	a4,1930 <memchr+0x20>
    191c:	ce59                	beqz	a2,19ba <memchr+0xaa>
    191e:	0007c703          	lbu	a4,0(a5)
    1922:	00b70963          	beq	a4,a1,1934 <memchr+0x24>
    1926:	0785                	add	a5,a5,1
    1928:	0077f713          	and	a4,a5,7
    192c:	167d                	add	a2,a2,-1
    192e:	f77d                	bnez	a4,191c <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1930:	4501                	li	a0,0
    if (n && *s != c)
    1932:	c649                	beqz	a2,19bc <memchr+0xac>
    1934:	0007c703          	lbu	a4,0(a5)
    1938:	06b70663          	beq	a4,a1,19a4 <memchr+0x94>
        size_t k = ONES * c;
    193c:	01010737          	lui	a4,0x1010
    1940:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e121>
    1944:	0742                	sll	a4,a4,0x10
    1946:	10170713          	add	a4,a4,257
    194a:	0742                	sll	a4,a4,0x10
    194c:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1950:	469d                	li	a3,7
        size_t k = ONES * c;
    1952:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1956:	04c6f763          	bgeu	a3,a2,19a4 <memchr+0x94>
    195a:	f0101837          	lui	a6,0xf0101
    195e:	feff08b7          	lui	a7,0xfeff0
    1962:	0812                	sll	a6,a6,0x4
    1964:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedf1f>
    1968:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff121>
    196c:	08c2                	sll	a7,a7,0x10
    196e:	0842                	sll	a6,a6,0x10
    1970:	eff88893          	add	a7,a7,-257
    1974:	10180813          	add	a6,a6,257
    1978:	08c2                	sll	a7,a7,0x10
    197a:	083e                	sll	a6,a6,0xf
    197c:	eff88893          	add	a7,a7,-257
    1980:	08080813          	add	a6,a6,128
    1984:	431d                	li	t1,7
    1986:	a029                	j	1990 <memchr+0x80>
    1988:	1661                	add	a2,a2,-8
    198a:	07a1                	add	a5,a5,8
    198c:	02c37663          	bgeu	t1,a2,19b8 <memchr+0xa8>
    1990:	6398                	ld	a4,0(a5)
    1992:	8f29                	xor	a4,a4,a0
    1994:	011706b3          	add	a3,a4,a7
    1998:	fff74713          	not	a4,a4
    199c:	8f75                	and	a4,a4,a3
    199e:	01077733          	and	a4,a4,a6
    19a2:	d37d                	beqz	a4,1988 <memchr+0x78>
        s = (const void *)w;
    19a4:	853e                	mv	a0,a5
    19a6:	a019                	j	19ac <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    19a8:	0505                	add	a0,a0,1
    19aa:	ca01                	beqz	a2,19ba <memchr+0xaa>
    19ac:	00054783          	lbu	a5,0(a0)
    19b0:	167d                	add	a2,a2,-1
    19b2:	feb79be3          	bne	a5,a1,19a8 <memchr+0x98>
    19b6:	8082                	ret
    19b8:	f675                	bnez	a2,19a4 <memchr+0x94>
    return n ? (void *)s : 0;
    19ba:	4501                	li	a0,0
}
    19bc:	8082                	ret

00000000000019be <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19be:	1101                	add	sp,sp,-32
    19c0:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19c2:	862e                	mv	a2,a1
{
    19c4:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19c6:	4581                	li	a1,0
{
    19c8:	e426                	sd	s1,8(sp)
    19ca:	ec06                	sd	ra,24(sp)
    19cc:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19ce:	f43ff0ef          	jal	1910 <memchr>
    return p ? p - s : n;
    19d2:	c519                	beqz	a0,19e0 <strnlen+0x22>
}
    19d4:	60e2                	ld	ra,24(sp)
    19d6:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19d8:	8d05                	sub	a0,a0,s1
}
    19da:	64a2                	ld	s1,8(sp)
    19dc:	6105                	add	sp,sp,32
    19de:	8082                	ret
    19e0:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19e2:	8522                	mv	a0,s0
}
    19e4:	6442                	ld	s0,16(sp)
    19e6:	64a2                	ld	s1,8(sp)
    19e8:	6105                	add	sp,sp,32
    19ea:	8082                	ret

00000000000019ec <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19ec:	00b547b3          	xor	a5,a0,a1
    19f0:	8b9d                	and	a5,a5,7
    19f2:	efb1                	bnez	a5,1a4e <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19f4:	0075f793          	and	a5,a1,7
    19f8:	ebb5                	bnez	a5,1a6c <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19fa:	feff0637          	lui	a2,0xfeff0
    19fe:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedf1f>
    1a02:	f01016b7          	lui	a3,0xf0101
    1a06:	0642                	sll	a2,a2,0x10
    1a08:	0692                	sll	a3,a3,0x4
    1a0a:	6198                	ld	a4,0(a1)
    1a0c:	eff60613          	add	a2,a2,-257
    1a10:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff121>
    1a14:	0642                	sll	a2,a2,0x10
    1a16:	06c2                	sll	a3,a3,0x10
    1a18:	eff60613          	add	a2,a2,-257
    1a1c:	10168693          	add	a3,a3,257
    1a20:	00c707b3          	add	a5,a4,a2
    1a24:	fff74813          	not	a6,a4
    1a28:	06be                	sll	a3,a3,0xf
    1a2a:	0107f7b3          	and	a5,a5,a6
    1a2e:	08068693          	add	a3,a3,128
    1a32:	8ff5                	and	a5,a5,a3
    1a34:	ef89                	bnez	a5,1a4e <strcpy+0x62>
    1a36:	05a1                	add	a1,a1,8
    1a38:	e118                	sd	a4,0(a0)
    1a3a:	6198                	ld	a4,0(a1)
    1a3c:	0521                	add	a0,a0,8
    1a3e:	00c707b3          	add	a5,a4,a2
    1a42:	fff74813          	not	a6,a4
    1a46:	0107f7b3          	and	a5,a5,a6
    1a4a:	8ff5                	and	a5,a5,a3
    1a4c:	d7ed                	beqz	a5,1a36 <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a4e:	0005c783          	lbu	a5,0(a1)
    1a52:	00f50023          	sb	a5,0(a0)
    1a56:	c785                	beqz	a5,1a7e <strcpy+0x92>
    1a58:	0015c783          	lbu	a5,1(a1)
    1a5c:	0505                	add	a0,a0,1
    1a5e:	0585                	add	a1,a1,1
    1a60:	00f50023          	sb	a5,0(a0)
    1a64:	fbf5                	bnez	a5,1a58 <strcpy+0x6c>
        ;
    return d;
}
    1a66:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a68:	0505                	add	a0,a0,1
    1a6a:	db41                	beqz	a4,19fa <strcpy+0xe>
            if (!(*d = *s))
    1a6c:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a70:	0585                	add	a1,a1,1
    1a72:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a76:	00f50023          	sb	a5,0(a0)
    1a7a:	f7fd                	bnez	a5,1a68 <strcpy+0x7c>
}
    1a7c:	8082                	ret
    1a7e:	8082                	ret

0000000000001a80 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a80:	00b547b3          	xor	a5,a0,a1
    1a84:	8b9d                	and	a5,a5,7
    1a86:	efbd                	bnez	a5,1b04 <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a88:	0075f793          	and	a5,a1,7
    1a8c:	1c078563          	beqz	a5,1c56 <strncpy+0x1d6>
    1a90:	ea11                	bnez	a2,1aa4 <strncpy+0x24>
    1a92:	8082                	ret
    1a94:	0585                	add	a1,a1,1
    1a96:	0075f793          	and	a5,a1,7
    1a9a:	167d                	add	a2,a2,-1
    1a9c:	0505                	add	a0,a0,1
    1a9e:	1a078c63          	beqz	a5,1c56 <strncpy+0x1d6>
    1aa2:	ca3d                	beqz	a2,1b18 <strncpy+0x98>
    1aa4:	0005c783          	lbu	a5,0(a1)
    1aa8:	00f50023          	sb	a5,0(a0)
    1aac:	f7e5                	bnez	a5,1a94 <strncpy+0x14>
            ;
        if (!n || !*s)
    1aae:	0005c783          	lbu	a5,0(a1)
    1ab2:	c7a5                	beqz	a5,1b1a <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ab4:	479d                	li	a5,7
    1ab6:	04c7f863          	bgeu	a5,a2,1b06 <strncpy+0x86>
    1aba:	f01016b7          	lui	a3,0xf0101
    1abe:	feff0837          	lui	a6,0xfeff0
    1ac2:	0692                	sll	a3,a3,0x4
    1ac4:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedf1f>
    1ac8:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff121>
    1acc:	0842                	sll	a6,a6,0x10
    1ace:	06c2                	sll	a3,a3,0x10
    1ad0:	eff80813          	add	a6,a6,-257
    1ad4:	10168693          	add	a3,a3,257
    1ad8:	0842                	sll	a6,a6,0x10
    1ada:	06be                	sll	a3,a3,0xf
    1adc:	eff80813          	add	a6,a6,-257
    1ae0:	08068693          	add	a3,a3,128
    1ae4:	431d                	li	t1,7
    1ae6:	6198                	ld	a4,0(a1)
    1ae8:	010707b3          	add	a5,a4,a6
    1aec:	fff74893          	not	a7,a4
    1af0:	0117f7b3          	and	a5,a5,a7
    1af4:	8ff5                	and	a5,a5,a3
    1af6:	eb81                	bnez	a5,1b06 <strncpy+0x86>
            *wd = *ws;
    1af8:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1afa:	1661                	add	a2,a2,-8
    1afc:	05a1                	add	a1,a1,8
    1afe:	0521                	add	a0,a0,8
    1b00:	fec363e3          	bltu	t1,a2,1ae6 <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b04:	ca11                	beqz	a2,1b18 <strncpy+0x98>
    1b06:	0005c783          	lbu	a5,0(a1)
    1b0a:	0585                	add	a1,a1,1
    1b0c:	00f50023          	sb	a5,0(a0)
    1b10:	c789                	beqz	a5,1b1a <strncpy+0x9a>
    1b12:	167d                	add	a2,a2,-1
    1b14:	0505                	add	a0,a0,1
    1b16:	fa65                	bnez	a2,1b06 <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b18:	8082                	ret
    1b1a:	40a00733          	neg	a4,a0
    1b1e:	00777793          	and	a5,a4,7
    1b22:	00778693          	add	a3,a5,7
    1b26:	482d                	li	a6,11
    1b28:	fff60593          	add	a1,a2,-1
    1b2c:	1106ef63          	bltu	a3,a6,1c4a <strncpy+0x1ca>
    1b30:	12d5ee63          	bltu	a1,a3,1c6c <strncpy+0x1ec>
    1b34:	12078563          	beqz	a5,1c5e <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b38:	00050023          	sb	zero,0(a0)
    1b3c:	00677693          	and	a3,a4,6
    1b40:	12068263          	beqz	a3,1c64 <strncpy+0x1e4>
    1b44:	000500a3          	sb	zero,1(a0)
    1b48:	4689                	li	a3,2
    1b4a:	12f6f463          	bgeu	a3,a5,1c72 <strncpy+0x1f2>
    1b4e:	00050123          	sb	zero,2(a0)
    1b52:	8b11                	and	a4,a4,4
    1b54:	cf6d                	beqz	a4,1c4e <strncpy+0x1ce>
    1b56:	000501a3          	sb	zero,3(a0)
    1b5a:	4711                	li	a4,4
    1b5c:	00450693          	add	a3,a0,4
    1b60:	02f77363          	bgeu	a4,a5,1b86 <strncpy+0x106>
    1b64:	00050223          	sb	zero,4(a0)
    1b68:	4715                	li	a4,5
    1b6a:	00550693          	add	a3,a0,5
    1b6e:	00e78c63          	beq	a5,a4,1b86 <strncpy+0x106>
    1b72:	000502a3          	sb	zero,5(a0)
    1b76:	471d                	li	a4,7
    1b78:	10e79163          	bne	a5,a4,1c7a <strncpy+0x1fa>
    1b7c:	00750693          	add	a3,a0,7
    1b80:	00050323          	sb	zero,6(a0)
    1b84:	471d                	li	a4,7
    1b86:	40f608b3          	sub	a7,a2,a5
    1b8a:	ff88f813          	and	a6,a7,-8
    1b8e:	97aa                	add	a5,a5,a0
    1b90:	010785b3          	add	a1,a5,a6
    1b94:	0007b023          	sd	zero,0(a5)
    1b98:	07a1                	add	a5,a5,8
    1b9a:	feb79de3          	bne	a5,a1,1b94 <strncpy+0x114>
    1b9e:	00e807bb          	addw	a5,a6,a4
    1ba2:	01068733          	add	a4,a3,a6
    1ba6:	0b088b63          	beq	a7,a6,1c5c <strncpy+0x1dc>
    1baa:	00070023          	sb	zero,0(a4)
    1bae:	0017869b          	addw	a3,a5,1
    1bb2:	f6c6f3e3          	bgeu	a3,a2,1b18 <strncpy+0x98>
    1bb6:	000700a3          	sb	zero,1(a4)
    1bba:	0027869b          	addw	a3,a5,2
    1bbe:	f4c6fde3          	bgeu	a3,a2,1b18 <strncpy+0x98>
    1bc2:	00070123          	sb	zero,2(a4)
    1bc6:	0037869b          	addw	a3,a5,3
    1bca:	f4c6f7e3          	bgeu	a3,a2,1b18 <strncpy+0x98>
    1bce:	000701a3          	sb	zero,3(a4)
    1bd2:	0047869b          	addw	a3,a5,4
    1bd6:	f4c6f1e3          	bgeu	a3,a2,1b18 <strncpy+0x98>
    1bda:	00070223          	sb	zero,4(a4)
    1bde:	0057869b          	addw	a3,a5,5
    1be2:	f2c6fbe3          	bgeu	a3,a2,1b18 <strncpy+0x98>
    1be6:	000702a3          	sb	zero,5(a4)
    1bea:	0067869b          	addw	a3,a5,6
    1bee:	f2c6f5e3          	bgeu	a3,a2,1b18 <strncpy+0x98>
    1bf2:	00070323          	sb	zero,6(a4)
    1bf6:	0077869b          	addw	a3,a5,7
    1bfa:	f0c6ffe3          	bgeu	a3,a2,1b18 <strncpy+0x98>
    1bfe:	000703a3          	sb	zero,7(a4)
    1c02:	0087869b          	addw	a3,a5,8
    1c06:	f0c6f9e3          	bgeu	a3,a2,1b18 <strncpy+0x98>
    1c0a:	00070423          	sb	zero,8(a4)
    1c0e:	0097869b          	addw	a3,a5,9
    1c12:	f0c6f3e3          	bgeu	a3,a2,1b18 <strncpy+0x98>
    1c16:	000704a3          	sb	zero,9(a4)
    1c1a:	00a7869b          	addw	a3,a5,10
    1c1e:	eec6fde3          	bgeu	a3,a2,1b18 <strncpy+0x98>
    1c22:	00070523          	sb	zero,10(a4)
    1c26:	00b7869b          	addw	a3,a5,11
    1c2a:	eec6f7e3          	bgeu	a3,a2,1b18 <strncpy+0x98>
    1c2e:	000705a3          	sb	zero,11(a4)
    1c32:	00c7869b          	addw	a3,a5,12
    1c36:	eec6f1e3          	bgeu	a3,a2,1b18 <strncpy+0x98>
    1c3a:	00070623          	sb	zero,12(a4)
    1c3e:	27b5                	addw	a5,a5,13
    1c40:	ecc7fce3          	bgeu	a5,a2,1b18 <strncpy+0x98>
    1c44:	000706a3          	sb	zero,13(a4)
}
    1c48:	8082                	ret
    1c4a:	46ad                	li	a3,11
    1c4c:	b5d5                	j	1b30 <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c4e:	00350693          	add	a3,a0,3
    1c52:	470d                	li	a4,3
    1c54:	bf0d                	j	1b86 <strncpy+0x106>
        if (!n || !*s)
    1c56:	e4061ce3          	bnez	a2,1aae <strncpy+0x2e>
}
    1c5a:	8082                	ret
    1c5c:	8082                	ret
    char *p = dest;
    1c5e:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c60:	4701                	li	a4,0
    1c62:	b715                	j	1b86 <strncpy+0x106>
    1c64:	00150693          	add	a3,a0,1
    1c68:	4705                	li	a4,1
    1c6a:	bf31                	j	1b86 <strncpy+0x106>
    char *p = dest;
    1c6c:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c6e:	4781                	li	a5,0
    1c70:	bf2d                	j	1baa <strncpy+0x12a>
    1c72:	00250693          	add	a3,a0,2
    1c76:	4709                	li	a4,2
    1c78:	b739                	j	1b86 <strncpy+0x106>
    1c7a:	00650693          	add	a3,a0,6
    1c7e:	4719                	li	a4,6
    1c80:	b719                	j	1b86 <strncpy+0x106>

0000000000001c82 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c82:	87aa                	mv	a5,a0
    1c84:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c86:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c8a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c8e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c90:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c92:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c96:	2501                	sext.w	a0,a0
    1c98:	8082                	ret

0000000000001c9a <openat>:
    register long a7 __asm__("a7") = n;
    1c9a:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c9e:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ca2:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1ca6:	2501                	sext.w	a0,a0
    1ca8:	8082                	ret

0000000000001caa <fcntl>:
    register long a7 __asm__("a7") = n;
    1caa:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cac:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1cb0:	2501                	sext.w	a0,a0
    1cb2:	8082                	ret

0000000000001cb4 <close>:
    register long a7 __asm__("a7") = n;
    1cb4:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1cb8:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1cbc:	2501                	sext.w	a0,a0
    1cbe:	8082                	ret

0000000000001cc0 <read>:
    register long a7 __asm__("a7") = n;
    1cc0:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cc4:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1cc8:	8082                	ret

0000000000001cca <write>:
    register long a7 __asm__("a7") = n;
    1cca:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cce:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1cd2:	8082                	ret

0000000000001cd4 <getpid>:
    register long a7 __asm__("a7") = n;
    1cd4:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1cd8:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1cdc:	2501                	sext.w	a0,a0
    1cde:	8082                	ret

0000000000001ce0 <getppid>:
    register long a7 __asm__("a7") = n;
    1ce0:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1ce4:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1ce8:	2501                	sext.w	a0,a0
    1cea:	8082                	ret

0000000000001cec <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cec:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cf0:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cf4:	2501                	sext.w	a0,a0
    1cf6:	8082                	ret

0000000000001cf8 <fork>:
    register long a7 __asm__("a7") = n;
    1cf8:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cfc:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cfe:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d00:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d04:	2501                	sext.w	a0,a0
    1d06:	8082                	ret

0000000000001d08 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d08:	85b2                	mv	a1,a2
    1d0a:	863a                	mv	a2,a4
    if (stack)
    1d0c:	c191                	beqz	a1,1d10 <clone+0x8>
	stack += stack_size;
    1d0e:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d10:	4781                	li	a5,0
    1d12:	4701                	li	a4,0
    1d14:	4681                	li	a3,0
    1d16:	2601                	sext.w	a2,a2
    1d18:	a2ed                	j	1f02 <__clone>

0000000000001d1a <exit>:
    register long a7 __asm__("a7") = n;
    1d1a:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d1e:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d22:	8082                	ret

0000000000001d24 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d24:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d28:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d2a:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d2e:	2501                	sext.w	a0,a0
    1d30:	8082                	ret

0000000000001d32 <exec>:
    register long a7 __asm__("a7") = n;
    1d32:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d36:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d3a:	2501                	sext.w	a0,a0
    1d3c:	8082                	ret

0000000000001d3e <execve>:
    register long a7 __asm__("a7") = n;
    1d3e:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d42:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d46:	2501                	sext.w	a0,a0
    1d48:	8082                	ret

0000000000001d4a <times>:
    register long a7 __asm__("a7") = n;
    1d4a:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d4e:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d52:	2501                	sext.w	a0,a0
    1d54:	8082                	ret

0000000000001d56 <get_time>:

int64 get_time()
{
    1d56:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d58:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d5c:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d5e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d60:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d64:	2501                	sext.w	a0,a0
    1d66:	ed09                	bnez	a0,1d80 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d68:	67a2                	ld	a5,8(sp)
    1d6a:	3e800713          	li	a4,1000
    1d6e:	00015503          	lhu	a0,0(sp)
    1d72:	02e7d7b3          	divu	a5,a5,a4
    1d76:	02e50533          	mul	a0,a0,a4
    1d7a:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d7c:	0141                	add	sp,sp,16
    1d7e:	8082                	ret
        return -1;
    1d80:	557d                	li	a0,-1
    1d82:	bfed                	j	1d7c <get_time+0x26>

0000000000001d84 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d84:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d88:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d8c:	2501                	sext.w	a0,a0
    1d8e:	8082                	ret

0000000000001d90 <time>:
    register long a7 __asm__("a7") = n;
    1d90:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d94:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d98:	2501                	sext.w	a0,a0
    1d9a:	8082                	ret

0000000000001d9c <sleep>:

int sleep(unsigned long long time)
{
    1d9c:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d9e:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1da0:	850a                	mv	a0,sp
    1da2:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1da4:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1da8:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1daa:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1dae:	e501                	bnez	a0,1db6 <sleep+0x1a>
    return 0;
    1db0:	4501                	li	a0,0
}
    1db2:	0141                	add	sp,sp,16
    1db4:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1db6:	4502                	lw	a0,0(sp)
}
    1db8:	0141                	add	sp,sp,16
    1dba:	8082                	ret

0000000000001dbc <set_priority>:
    register long a7 __asm__("a7") = n;
    1dbc:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1dc0:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1dc4:	2501                	sext.w	a0,a0
    1dc6:	8082                	ret

0000000000001dc8 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1dc8:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1dcc:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1dd0:	8082                	ret

0000000000001dd2 <munmap>:
    register long a7 __asm__("a7") = n;
    1dd2:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dd6:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1dda:	2501                	sext.w	a0,a0
    1ddc:	8082                	ret

0000000000001dde <wait>:

int wait(int *code)
{
    1dde:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1de0:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1de4:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1de6:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1de8:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dea:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1dee:	2501                	sext.w	a0,a0
    1df0:	8082                	ret

0000000000001df2 <spawn>:
    register long a7 __asm__("a7") = n;
    1df2:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1df6:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dfa:	2501                	sext.w	a0,a0
    1dfc:	8082                	ret

0000000000001dfe <mailread>:
    register long a7 __asm__("a7") = n;
    1dfe:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e02:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e06:	2501                	sext.w	a0,a0
    1e08:	8082                	ret

0000000000001e0a <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e0a:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e0e:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e12:	2501                	sext.w	a0,a0
    1e14:	8082                	ret

0000000000001e16 <fstat>:
    register long a7 __asm__("a7") = n;
    1e16:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e1a:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e1e:	2501                	sext.w	a0,a0
    1e20:	8082                	ret

0000000000001e22 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e22:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e24:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e28:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e2a:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e2e:	2501                	sext.w	a0,a0
    1e30:	8082                	ret

0000000000001e32 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e32:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e34:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e38:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e3a:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e3e:	2501                	sext.w	a0,a0
    1e40:	8082                	ret

0000000000001e42 <link>:

int link(char *old_path, char *new_path)
{
    1e42:	87aa                	mv	a5,a0
    1e44:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e46:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e4a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e4e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e50:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e54:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e56:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e5a:	2501                	sext.w	a0,a0
    1e5c:	8082                	ret

0000000000001e5e <unlink>:

int unlink(char *path)
{
    1e5e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e60:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e64:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e68:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e6a:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e6e:	2501                	sext.w	a0,a0
    1e70:	8082                	ret

0000000000001e72 <uname>:
    register long a7 __asm__("a7") = n;
    1e72:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e76:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e7a:	2501                	sext.w	a0,a0
    1e7c:	8082                	ret

0000000000001e7e <brk>:
    register long a7 __asm__("a7") = n;
    1e7e:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e82:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e86:	2501                	sext.w	a0,a0
    1e88:	8082                	ret

0000000000001e8a <getcwd>:
    register long a7 __asm__("a7") = n;
    1e8a:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e8c:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e90:	8082                	ret

0000000000001e92 <chdir>:
    register long a7 __asm__("a7") = n;
    1e92:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e96:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e9a:	2501                	sext.w	a0,a0
    1e9c:	8082                	ret

0000000000001e9e <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e9e:	862e                	mv	a2,a1
    1ea0:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1ea2:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ea4:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1ea8:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1eac:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1eae:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eb0:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1eb4:	2501                	sext.w	a0,a0
    1eb6:	8082                	ret

0000000000001eb8 <getdents>:
    register long a7 __asm__("a7") = n;
    1eb8:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ebc:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1ec0:	2501                	sext.w	a0,a0
    1ec2:	8082                	ret

0000000000001ec4 <pipe>:
    register long a7 __asm__("a7") = n;
    1ec4:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1ec8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eca:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1ece:	2501                	sext.w	a0,a0
    1ed0:	8082                	ret

0000000000001ed2 <dup>:
    register long a7 __asm__("a7") = n;
    1ed2:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1ed4:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1ed8:	2501                	sext.w	a0,a0
    1eda:	8082                	ret

0000000000001edc <dup2>:
    register long a7 __asm__("a7") = n;
    1edc:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1ede:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ee0:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ee4:	2501                	sext.w	a0,a0
    1ee6:	8082                	ret

0000000000001ee8 <mount>:
    register long a7 __asm__("a7") = n;
    1ee8:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1eec:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ef0:	2501                	sext.w	a0,a0
    1ef2:	8082                	ret

0000000000001ef4 <umount>:
    register long a7 __asm__("a7") = n;
    1ef4:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ef8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1efa:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1efe:	2501                	sext.w	a0,a0
    1f00:	8082                	ret

0000000000001f02 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f02:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1f04:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f06:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f08:	8532                	mv	a0,a2
	mv a2, a4
    1f0a:	863a                	mv	a2,a4
	mv a3, a5
    1f0c:	86be                	mv	a3,a5
	mv a4, a6
    1f0e:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f10:	0dc00893          	li	a7,220
	ecall
    1f14:	00000073          	ecall

	beqz a0, 1f
    1f18:	c111                	beqz	a0,1f1c <__clone+0x1a>
	# Parent
	ret
    1f1a:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f1c:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f1e:	6522                	ld	a0,8(sp)
	jalr a1
    1f20:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f22:	05d00893          	li	a7,93
	ecall
    1f26:	00000073          	ecall
