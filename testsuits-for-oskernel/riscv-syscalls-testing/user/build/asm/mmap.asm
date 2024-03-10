
/home/windflower/Desktop/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/mmap:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a201                	j	1102 <__start_main>

0000000000001004 <test_mmap>:
 * "  Hello, mmap success"
 * 测试失败时输出：
 * "mmap error."
 */
static struct kstat kst;
void test_mmap(void){
    1004:	1101                	add	sp,sp,-32
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f2a50513          	add	a0,a0,-214 # 1f30 <__clone+0x28>
void test_mmap(void){
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
    1012:	e04a                	sd	s2,0(sp)
    TEST_START(__func__);
    1014:	326000ef          	jal	133a <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	04050513          	add	a0,a0,64 # 2058 <__func__.0>
    1020:	31a000ef          	jal	133a <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	f2450513          	add	a0,a0,-220 # 1f48 <__clone+0x40>
    102c:	30e000ef          	jal	133a <puts>
    char *array;
    const char *str = "  Hello, mmap successfully!";
    int fd;

    fd = open("test_mmap.txt", O_RDWR | O_CREATE);
    1030:	04200593          	li	a1,66
    1034:	00001517          	auipc	a0,0x1
    1038:	f2450513          	add	a0,a0,-220 # 1f58 <__clone+0x50>
    103c:	457000ef          	jal	1c92 <open>
    1040:	842a                	mv	s0,a0
    write(fd, str, strlen(str));
    1042:	00001517          	auipc	a0,0x1
    1046:	f2650513          	add	a0,a0,-218 # 1f68 <__clone+0x60>
    104a:	053000ef          	jal	189c <strlen>
    104e:	862a                	mv	a2,a0
    1050:	00001597          	auipc	a1,0x1
    1054:	f1858593          	add	a1,a1,-232 # 1f68 <__clone+0x60>
    1058:	8522                	mv	a0,s0
    105a:	477000ef          	jal	1cd0 <write>
    fstat(fd, &kst);
    105e:	00001917          	auipc	s2,0x1
    1062:	f7a90913          	add	s2,s2,-134 # 1fd8 <kst>
    1066:	85ca                	mv	a1,s2
    1068:	8522                	mv	a0,s0
    106a:	5b3000ef          	jal	1e1c <fstat>
    printf("file len: %d\n", kst.st_size);
    106e:	03093583          	ld	a1,48(s2)
    1072:	00001517          	auipc	a0,0x1
    1076:	f1650513          	add	a0,a0,-234 # 1f88 <__clone+0x80>
    107a:	2e2000ef          	jal	135c <printf>
    array = mmap(NULL, kst.st_size, PROT_WRITE | PROT_READ, MAP_FILE | MAP_SHARED, fd, 0);
    107e:	03093583          	ld	a1,48(s2)
    1082:	4781                	li	a5,0
    1084:	8722                	mv	a4,s0
    1086:	4685                	li	a3,1
    1088:	460d                	li	a2,3
    108a:	4501                	li	a0,0
    108c:	543000ef          	jal	1dce <mmap>
    //printf("return array: %x\n", array);

    if (array == MAP_FAILED) {
    1090:	57fd                	li	a5,-1
    1092:	04f50963          	beq	a0,a5,10e4 <test_mmap+0xe0>
	printf("mmap error.\n");
    }else{
	printf("mmap content: %s\n", array);
    1096:	e426                	sd	s1,8(sp)
    1098:	85aa                	mv	a1,a0
    109a:	84aa                	mv	s1,a0
    109c:	00001517          	auipc	a0,0x1
    10a0:	f0c50513          	add	a0,a0,-244 # 1fa8 <__clone+0xa0>
    10a4:	2b8000ef          	jal	135c <printf>
	//printf("%s\n", str);

	munmap(array, kst.st_size);
    10a8:	03093583          	ld	a1,48(s2)
    10ac:	8526                	mv	a0,s1
    10ae:	52b000ef          	jal	1dd8 <munmap>
    10b2:	64a2                	ld	s1,8(sp)
    }

    close(fd);
    10b4:	8522                	mv	a0,s0
    10b6:	405000ef          	jal	1cba <close>

    TEST_END(__func__);
    10ba:	00001517          	auipc	a0,0x1
    10be:	f0650513          	add	a0,a0,-250 # 1fc0 <__clone+0xb8>
    10c2:	278000ef          	jal	133a <puts>
    10c6:	00001517          	auipc	a0,0x1
    10ca:	f9250513          	add	a0,a0,-110 # 2058 <__func__.0>
    10ce:	26c000ef          	jal	133a <puts>
}
    10d2:	6442                	ld	s0,16(sp)
    10d4:	60e2                	ld	ra,24(sp)
    10d6:	6902                	ld	s2,0(sp)
    TEST_END(__func__);
    10d8:	00001517          	auipc	a0,0x1
    10dc:	e7050513          	add	a0,a0,-400 # 1f48 <__clone+0x40>
}
    10e0:	6105                	add	sp,sp,32
    TEST_END(__func__);
    10e2:	aca1                	j	133a <puts>
	printf("mmap error.\n");
    10e4:	00001517          	auipc	a0,0x1
    10e8:	eb450513          	add	a0,a0,-332 # 1f98 <__clone+0x90>
    10ec:	270000ef          	jal	135c <printf>
    10f0:	b7d1                	j	10b4 <test_mmap+0xb0>

00000000000010f2 <main>:

int main(void){
    10f2:	1141                	add	sp,sp,-16
    10f4:	e406                	sd	ra,8(sp)
    test_mmap();
    10f6:	f0fff0ef          	jal	1004 <test_mmap>
    return 0;
}
    10fa:	60a2                	ld	ra,8(sp)
    10fc:	4501                	li	a0,0
    10fe:	0141                	add	sp,sp,16
    1100:	8082                	ret

0000000000001102 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1102:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1104:	4108                	lw	a0,0(a0)
{
    1106:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    1108:	05a1                	add	a1,a1,8
{
    110a:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    110c:	fe7ff0ef          	jal	10f2 <main>
    1110:	411000ef          	jal	1d20 <exit>
	return 0;
}
    1114:	60a2                	ld	ra,8(sp)
    1116:	4501                	li	a0,0
    1118:	0141                	add	sp,sp,16
    111a:	8082                	ret

000000000000111c <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    111c:	7179                	add	sp,sp,-48
    111e:	f406                	sd	ra,40(sp)
    1120:	0005081b          	sext.w	a6,a0
    1124:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1126:	00055563          	bgez	a0,1130 <printint.constprop.0+0x14>
        x = -xx;
    112a:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    112e:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1130:	02b8763b          	remuw	a2,a6,a1
    1134:	00001697          	auipc	a3,0x1
    1138:	f3468693          	add	a3,a3,-204 # 2068 <digits>
    buf[16] = 0;
    113c:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1140:	0005871b          	sext.w	a4,a1
    1144:	1602                	sll	a2,a2,0x20
    1146:	9201                	srl	a2,a2,0x20
    1148:	9636                	add	a2,a2,a3
    114a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    114e:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    1152:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1156:	10b86c63          	bltu	a6,a1,126e <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    115a:	02e5763b          	remuw	a2,a0,a4
    115e:	1602                	sll	a2,a2,0x20
    1160:	9201                	srl	a2,a2,0x20
    1162:	9636                	add	a2,a2,a3
    1164:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1168:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    116c:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1170:	10e56863          	bltu	a0,a4,1280 <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    1174:	02e5f63b          	remuw	a2,a1,a4
    1178:	1602                	sll	a2,a2,0x20
    117a:	9201                	srl	a2,a2,0x20
    117c:	9636                	add	a2,a2,a3
    117e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1182:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1186:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    118a:	10e5e463          	bltu	a1,a4,1292 <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    118e:	02e5763b          	remuw	a2,a0,a4
    1192:	1602                	sll	a2,a2,0x20
    1194:	9201                	srl	a2,a2,0x20
    1196:	9636                	add	a2,a2,a3
    1198:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    119c:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11a0:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    11a4:	10e56063          	bltu	a0,a4,12a4 <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    11a8:	02e5f63b          	remuw	a2,a1,a4
    11ac:	1602                	sll	a2,a2,0x20
    11ae:	9201                	srl	a2,a2,0x20
    11b0:	9636                	add	a2,a2,a3
    11b2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b6:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11ba:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    11be:	0ee5ec63          	bltu	a1,a4,12b6 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11c2:	02e5763b          	remuw	a2,a0,a4
    11c6:	1602                	sll	a2,a2,0x20
    11c8:	9201                	srl	a2,a2,0x20
    11ca:	9636                	add	a2,a2,a3
    11cc:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11d0:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11d4:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11d8:	08e56263          	bltu	a0,a4,125c <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    11dc:	02e5f63b          	remuw	a2,a1,a4
    11e0:	1602                	sll	a2,a2,0x20
    11e2:	9201                	srl	a2,a2,0x20
    11e4:	9636                	add	a2,a2,a3
    11e6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ea:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11ee:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11f2:	0ce5eb63          	bltu	a1,a4,12c8 <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    11f6:	02e5763b          	remuw	a2,a0,a4
    11fa:	1602                	sll	a2,a2,0x20
    11fc:	9201                	srl	a2,a2,0x20
    11fe:	9636                	add	a2,a2,a3
    1200:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1204:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1208:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    120c:	0ce56763          	bltu	a0,a4,12da <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    1210:	02e5f63b          	remuw	a2,a1,a4
    1214:	1602                	sll	a2,a2,0x20
    1216:	9201                	srl	a2,a2,0x20
    1218:	9636                	add	a2,a2,a3
    121a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    121e:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1222:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    1226:	0ce5e363          	bltu	a1,a4,12ec <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    122a:	1782                	sll	a5,a5,0x20
    122c:	9381                	srl	a5,a5,0x20
    122e:	96be                	add	a3,a3,a5
    1230:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    1234:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    1236:	00f10723          	sb	a5,14(sp)
    if (sign)
    123a:	00088763          	beqz	a7,1248 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    123e:	02d00793          	li	a5,45
    1242:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1246:	4595                	li	a1,5
    write(f, s, l);
    1248:	003c                	add	a5,sp,8
    124a:	4641                	li	a2,16
    124c:	9e0d                	subw	a2,a2,a1
    124e:	4505                	li	a0,1
    1250:	95be                	add	a1,a1,a5
    1252:	27f000ef          	jal	1cd0 <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1256:	70a2                	ld	ra,40(sp)
    1258:	6145                	add	sp,sp,48
    125a:	8082                	ret
    i++;
    125c:	45a9                	li	a1,10
    if (sign)
    125e:	fe0885e3          	beqz	a7,1248 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1262:	02d00793          	li	a5,45
    1266:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    126a:	45a5                	li	a1,9
    126c:	bff1                	j	1248 <printint.constprop.0+0x12c>
    i++;
    126e:	45bd                	li	a1,15
    if (sign)
    1270:	fc088ce3          	beqz	a7,1248 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1274:	02d00793          	li	a5,45
    1278:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    127c:	45b9                	li	a1,14
    127e:	b7e9                	j	1248 <printint.constprop.0+0x12c>
    i++;
    1280:	45b9                	li	a1,14
    if (sign)
    1282:	fc0883e3          	beqz	a7,1248 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1286:	02d00793          	li	a5,45
    128a:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    128e:	45b5                	li	a1,13
    1290:	bf65                	j	1248 <printint.constprop.0+0x12c>
    i++;
    1292:	45b5                	li	a1,13
    if (sign)
    1294:	fa088ae3          	beqz	a7,1248 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1298:	02d00793          	li	a5,45
    129c:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    12a0:	45b1                	li	a1,12
    12a2:	b75d                	j	1248 <printint.constprop.0+0x12c>
    i++;
    12a4:	45b1                	li	a1,12
    if (sign)
    12a6:	fa0881e3          	beqz	a7,1248 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12aa:	02d00793          	li	a5,45
    12ae:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12b2:	45ad                	li	a1,11
    12b4:	bf51                	j	1248 <printint.constprop.0+0x12c>
    i++;
    12b6:	45ad                	li	a1,11
    if (sign)
    12b8:	f80888e3          	beqz	a7,1248 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12bc:	02d00793          	li	a5,45
    12c0:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12c4:	45a9                	li	a1,10
    12c6:	b749                	j	1248 <printint.constprop.0+0x12c>
    i++;
    12c8:	45a5                	li	a1,9
    if (sign)
    12ca:	f6088fe3          	beqz	a7,1248 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12ce:	02d00793          	li	a5,45
    12d2:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12d6:	45a1                	li	a1,8
    12d8:	bf85                	j	1248 <printint.constprop.0+0x12c>
    i++;
    12da:	45a1                	li	a1,8
    if (sign)
    12dc:	f60886e3          	beqz	a7,1248 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12e0:	02d00793          	li	a5,45
    12e4:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12e8:	459d                	li	a1,7
    12ea:	bfb9                	j	1248 <printint.constprop.0+0x12c>
    i++;
    12ec:	459d                	li	a1,7
    if (sign)
    12ee:	f4088de3          	beqz	a7,1248 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12f2:	02d00793          	li	a5,45
    12f6:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12fa:	4599                	li	a1,6
    12fc:	b7b1                	j	1248 <printint.constprop.0+0x12c>

00000000000012fe <getchar>:
{
    12fe:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    1300:	00f10593          	add	a1,sp,15
    1304:	4605                	li	a2,1
    1306:	4501                	li	a0,0
{
    1308:	ec06                	sd	ra,24(sp)
    char byte = 0;
    130a:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    130e:	1b9000ef          	jal	1cc6 <read>
}
    1312:	60e2                	ld	ra,24(sp)
    1314:	00f14503          	lbu	a0,15(sp)
    1318:	6105                	add	sp,sp,32
    131a:	8082                	ret

000000000000131c <putchar>:
{
    131c:	1101                	add	sp,sp,-32
    131e:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1320:	00f10593          	add	a1,sp,15
    1324:	4605                	li	a2,1
    1326:	4505                	li	a0,1
{
    1328:	ec06                	sd	ra,24(sp)
    char byte = c;
    132a:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    132e:	1a3000ef          	jal	1cd0 <write>
}
    1332:	60e2                	ld	ra,24(sp)
    1334:	2501                	sext.w	a0,a0
    1336:	6105                	add	sp,sp,32
    1338:	8082                	ret

000000000000133a <puts>:
{
    133a:	1141                	add	sp,sp,-16
    133c:	e406                	sd	ra,8(sp)
    133e:	e022                	sd	s0,0(sp)
    1340:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1342:	55a000ef          	jal	189c <strlen>
    1346:	862a                	mv	a2,a0
    1348:	85a2                	mv	a1,s0
    134a:	4505                	li	a0,1
    134c:	185000ef          	jal	1cd0 <write>
}
    1350:	60a2                	ld	ra,8(sp)
    1352:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1354:	957d                	sra	a0,a0,0x3f
    return r;
    1356:	2501                	sext.w	a0,a0
}
    1358:	0141                	add	sp,sp,16
    135a:	8082                	ret

000000000000135c <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    135c:	7131                	add	sp,sp,-192
    135e:	e4d6                	sd	s5,72(sp)
    1360:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    1362:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1364:	013c                	add	a5,sp,136
{
    1366:	f0ca                	sd	s2,96(sp)
    1368:	ecce                	sd	s3,88(sp)
    136a:	e8d2                	sd	s4,80(sp)
    136c:	e0da                	sd	s6,64(sp)
    136e:	fc5e                	sd	s7,56(sp)
    1370:	fc86                	sd	ra,120(sp)
    1372:	f8a2                	sd	s0,112(sp)
    1374:	f4a6                	sd	s1,104(sp)
    1376:	e52e                	sd	a1,136(sp)
    1378:	e932                	sd	a2,144(sp)
    137a:	ed36                	sd	a3,152(sp)
    137c:	f13a                	sd	a4,160(sp)
    137e:	f942                	sd	a6,176(sp)
    1380:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1382:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1384:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1388:	07300a13          	li	s4,115
    138c:	07800b93          	li	s7,120
    1390:	06400b13          	li	s6,100
    buf[i++] = '0';
    1394:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x57c8>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1398:	00001997          	auipc	s3,0x1
    139c:	cd098993          	add	s3,s3,-816 # 2068 <digits>
        if (!*s)
    13a0:	00054783          	lbu	a5,0(a0)
    13a4:	16078863          	beqz	a5,1514 <printf+0x1b8>
    13a8:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13aa:	19278063          	beq	a5,s2,152a <printf+0x1ce>
    13ae:	00164783          	lbu	a5,1(a2)
    13b2:	0605                	add	a2,a2,1
    13b4:	fbfd                	bnez	a5,13aa <printf+0x4e>
    13b6:	84b2                	mv	s1,a2
        l = z - a;
    13b8:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13bc:	85aa                	mv	a1,a0
    13be:	8622                	mv	a2,s0
    13c0:	4505                	li	a0,1
    13c2:	10f000ef          	jal	1cd0 <write>
        if (l)
    13c6:	18041763          	bnez	s0,1554 <printf+0x1f8>
        if (s[1] == 0)
    13ca:	0014c783          	lbu	a5,1(s1)
    13ce:	14078363          	beqz	a5,1514 <printf+0x1b8>
        switch (s[1])
    13d2:	19478f63          	beq	a5,s4,1570 <printf+0x214>
    13d6:	18fa6163          	bltu	s4,a5,1558 <printf+0x1fc>
    13da:	1b678e63          	beq	a5,s6,1596 <printf+0x23a>
    13de:	07000713          	li	a4,112
    13e2:	1ce79463          	bne	a5,a4,15aa <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13e6:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13e8:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13ec:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13ee:	631c                	ld	a5,0(a4)
    13f0:	0721                	add	a4,a4,8
    13f2:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13f4:	00479293          	sll	t0,a5,0x4
    13f8:	00879f93          	sll	t6,a5,0x8
    13fc:	00c79f13          	sll	t5,a5,0xc
    1400:	01079e93          	sll	t4,a5,0x10
    1404:	01479e13          	sll	t3,a5,0x14
    1408:	01879313          	sll	t1,a5,0x18
    140c:	01c79893          	sll	a7,a5,0x1c
    1410:	02479813          	sll	a6,a5,0x24
    1414:	02879513          	sll	a0,a5,0x28
    1418:	02c79593          	sll	a1,a5,0x2c
    141c:	03079693          	sll	a3,a5,0x30
    1420:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1424:	03c7d413          	srl	s0,a5,0x3c
    1428:	01c7d39b          	srlw	t2,a5,0x1c
    142c:	03c2d293          	srl	t0,t0,0x3c
    1430:	03cfdf93          	srl	t6,t6,0x3c
    1434:	03cf5f13          	srl	t5,t5,0x3c
    1438:	03cede93          	srl	t4,t4,0x3c
    143c:	03ce5e13          	srl	t3,t3,0x3c
    1440:	03c35313          	srl	t1,t1,0x3c
    1444:	03c8d893          	srl	a7,a7,0x3c
    1448:	03c85813          	srl	a6,a6,0x3c
    144c:	9171                	srl	a0,a0,0x3c
    144e:	91f1                	srl	a1,a1,0x3c
    1450:	92f1                	srl	a3,a3,0x3c
    1452:	9371                	srl	a4,a4,0x3c
    1454:	974e                	add	a4,a4,s3
    1456:	944e                	add	s0,s0,s3
    1458:	92ce                	add	t0,t0,s3
    145a:	9fce                	add	t6,t6,s3
    145c:	9f4e                	add	t5,t5,s3
    145e:	9ece                	add	t4,t4,s3
    1460:	9e4e                	add	t3,t3,s3
    1462:	934e                	add	t1,t1,s3
    1464:	98ce                	add	a7,a7,s3
    1466:	93ce                	add	t2,t2,s3
    1468:	984e                	add	a6,a6,s3
    146a:	954e                	add	a0,a0,s3
    146c:	95ce                	add	a1,a1,s3
    146e:	96ce                	add	a3,a3,s3
    1470:	00074083          	lbu	ra,0(a4)
    1474:	0002c283          	lbu	t0,0(t0)
    1478:	000fcf83          	lbu	t6,0(t6)
    147c:	000f4f03          	lbu	t5,0(t5)
    1480:	000ece83          	lbu	t4,0(t4)
    1484:	000e4e03          	lbu	t3,0(t3)
    1488:	00034303          	lbu	t1,0(t1)
    148c:	0008c883          	lbu	a7,0(a7)
    1490:	0003c383          	lbu	t2,0(t2)
    1494:	00084803          	lbu	a6,0(a6)
    1498:	00054503          	lbu	a0,0(a0)
    149c:	0005c583          	lbu	a1,0(a1)
    14a0:	0006c683          	lbu	a3,0(a3)
    14a4:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14a8:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14ac:	9371                	srl	a4,a4,0x3c
    14ae:	8bbd                	and	a5,a5,15
    14b0:	974e                	add	a4,a4,s3
    14b2:	97ce                	add	a5,a5,s3
    14b4:	005105a3          	sb	t0,11(sp)
    14b8:	01f10623          	sb	t6,12(sp)
    14bc:	01e106a3          	sb	t5,13(sp)
    14c0:	01d10723          	sb	t4,14(sp)
    14c4:	01c107a3          	sb	t3,15(sp)
    14c8:	00610823          	sb	t1,16(sp)
    14cc:	011108a3          	sb	a7,17(sp)
    14d0:	00710923          	sb	t2,18(sp)
    14d4:	010109a3          	sb	a6,19(sp)
    14d8:	00a10a23          	sb	a0,20(sp)
    14dc:	00b10aa3          	sb	a1,21(sp)
    14e0:	00d10b23          	sb	a3,22(sp)
    14e4:	00110ba3          	sb	ra,23(sp)
    14e8:	00810523          	sb	s0,10(sp)
    14ec:	00074703          	lbu	a4,0(a4)
    14f0:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14f4:	002c                	add	a1,sp,8
    14f6:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14f8:	00e10c23          	sb	a4,24(sp)
    14fc:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1500:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1504:	7cc000ef          	jal	1cd0 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1508:	00248513          	add	a0,s1,2
        if (!*s)
    150c:	00054783          	lbu	a5,0(a0)
    1510:	e8079ce3          	bnez	a5,13a8 <printf+0x4c>
    }
    va_end(ap);
}
    1514:	70e6                	ld	ra,120(sp)
    1516:	7446                	ld	s0,112(sp)
    1518:	74a6                	ld	s1,104(sp)
    151a:	7906                	ld	s2,96(sp)
    151c:	69e6                	ld	s3,88(sp)
    151e:	6a46                	ld	s4,80(sp)
    1520:	6aa6                	ld	s5,72(sp)
    1522:	6b06                	ld	s6,64(sp)
    1524:	7be2                	ld	s7,56(sp)
    1526:	6129                	add	sp,sp,192
    1528:	8082                	ret
    152a:	84b2                	mv	s1,a2
    152c:	a039                	j	153a <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    152e:	0024c783          	lbu	a5,2(s1)
    1532:	0605                	add	a2,a2,1
    1534:	0489                	add	s1,s1,2
    1536:	e92791e3          	bne	a5,s2,13b8 <printf+0x5c>
    153a:	0014c783          	lbu	a5,1(s1)
    153e:	ff2788e3          	beq	a5,s2,152e <printf+0x1d2>
        l = z - a;
    1542:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1546:	85aa                	mv	a1,a0
    1548:	8622                	mv	a2,s0
    154a:	4505                	li	a0,1
    154c:	784000ef          	jal	1cd0 <write>
        if (l)
    1550:	e6040de3          	beqz	s0,13ca <printf+0x6e>
    1554:	8526                	mv	a0,s1
    1556:	b5a9                	j	13a0 <printf+0x44>
        switch (s[1])
    1558:	05779963          	bne	a5,s7,15aa <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    155c:	6782                	ld	a5,0(sp)
    155e:	45c1                	li	a1,16
    1560:	4388                	lw	a0,0(a5)
    1562:	07a1                	add	a5,a5,8
    1564:	e03e                	sd	a5,0(sp)
    1566:	bb7ff0ef          	jal	111c <printint.constprop.0>
        s += 2;
    156a:	00248513          	add	a0,s1,2
    156e:	bf79                	j	150c <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    1570:	6782                	ld	a5,0(sp)
    1572:	6380                	ld	s0,0(a5)
    1574:	07a1                	add	a5,a5,8
    1576:	e03e                	sd	a5,0(sp)
    1578:	cc21                	beqz	s0,15d0 <printf+0x274>
            l = strnlen(a, 200);
    157a:	0c800593          	li	a1,200
    157e:	8522                	mv	a0,s0
    1580:	44e000ef          	jal	19ce <strnlen>
    write(f, s, l);
    1584:	0005061b          	sext.w	a2,a0
    1588:	85a2                	mv	a1,s0
    158a:	4505                	li	a0,1
    158c:	744000ef          	jal	1cd0 <write>
        s += 2;
    1590:	00248513          	add	a0,s1,2
    1594:	bfa5                	j	150c <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    1596:	6782                	ld	a5,0(sp)
    1598:	45a9                	li	a1,10
    159a:	4388                	lw	a0,0(a5)
    159c:	07a1                	add	a5,a5,8
    159e:	e03e                	sd	a5,0(sp)
    15a0:	b7dff0ef          	jal	111c <printint.constprop.0>
        s += 2;
    15a4:	00248513          	add	a0,s1,2
    15a8:	b795                	j	150c <printf+0x1b0>
    return write(stdout, &byte, 1);
    15aa:	4605                	li	a2,1
    15ac:	002c                	add	a1,sp,8
    15ae:	4505                	li	a0,1
    char byte = c;
    15b0:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15b4:	71c000ef          	jal	1cd0 <write>
    char byte = c;
    15b8:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15bc:	4605                	li	a2,1
    15be:	002c                	add	a1,sp,8
    15c0:	4505                	li	a0,1
    char byte = c;
    15c2:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15c6:	70a000ef          	jal	1cd0 <write>
        s += 2;
    15ca:	00248513          	add	a0,s1,2
    15ce:	bf3d                	j	150c <printf+0x1b0>
                a = "(null)";
    15d0:	00001417          	auipc	s0,0x1
    15d4:	a0040413          	add	s0,s0,-1536 # 1fd0 <__clone+0xc8>
    15d8:	b74d                	j	157a <printf+0x21e>

00000000000015da <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15da:	02000793          	li	a5,32
    15de:	00f50663          	beq	a0,a5,15ea <isspace+0x10>
    15e2:	355d                	addw	a0,a0,-9
    15e4:	00553513          	sltiu	a0,a0,5
    15e8:	8082                	ret
    15ea:	4505                	li	a0,1
}
    15ec:	8082                	ret

00000000000015ee <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15ee:	fd05051b          	addw	a0,a0,-48
}
    15f2:	00a53513          	sltiu	a0,a0,10
    15f6:	8082                	ret

00000000000015f8 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15f8:	02000713          	li	a4,32
    15fc:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15fe:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1602:	ff76879b          	addw	a5,a3,-9
    1606:	06e68063          	beq	a3,a4,1666 <atoi+0x6e>
    160a:	0006859b          	sext.w	a1,a3
    160e:	04f67c63          	bgeu	a2,a5,1666 <atoi+0x6e>
        s++;
    switch (*s)
    1612:	02b00793          	li	a5,43
    1616:	06f68563          	beq	a3,a5,1680 <atoi+0x88>
    161a:	02d00793          	li	a5,45
    161e:	04f69663          	bne	a3,a5,166a <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1622:	00154683          	lbu	a3,1(a0)
    1626:	47a5                	li	a5,9
        s++;
    1628:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    162c:	fd06869b          	addw	a3,a3,-48
    1630:	8636                	mv	a2,a3
    while (isdigit(*s))
    1632:	04d7e563          	bltu	a5,a3,167c <atoi+0x84>
        neg = 1;
    1636:	4885                	li	a7,1
    int n = 0, neg = 0;
    1638:	4501                	li	a0,0
    while (isdigit(*s))
    163a:	4825                	li	a6,9
    163c:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1640:	0025179b          	sllw	a5,a0,0x2
    1644:	9fa9                	addw	a5,a5,a0
    1646:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    164a:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    164e:	85b2                	mv	a1,a2
    1650:	40c7853b          	subw	a0,a5,a2
    1654:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    1656:	8636                	mv	a2,a3
    while (isdigit(*s))
    1658:	fed872e3          	bgeu	a6,a3,163c <atoi+0x44>
    return neg ? n : -n;
    165c:	02089163          	bnez	a7,167e <atoi+0x86>
    1660:	40f5853b          	subw	a0,a1,a5
    1664:	8082                	ret
        s++;
    1666:	0505                	add	a0,a0,1
    1668:	bf59                	j	15fe <atoi+0x6>
    while (isdigit(*s))
    166a:	fd05859b          	addw	a1,a1,-48
    166e:	47a5                	li	a5,9
    1670:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1672:	4881                	li	a7,0
    1674:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    1678:	fcb7f0e3          	bgeu	a5,a1,1638 <atoi+0x40>
    return neg ? n : -n;
    167c:	4501                	li	a0,0
}
    167e:	8082                	ret
    while (isdigit(*s))
    1680:	00154683          	lbu	a3,1(a0)
    1684:	47a5                	li	a5,9
        s++;
    1686:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    168a:	fd06869b          	addw	a3,a3,-48
    168e:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    1690:	4881                	li	a7,0
    while (isdigit(*s))
    1692:	fad7f3e3          	bgeu	a5,a3,1638 <atoi+0x40>
    return neg ? n : -n;
    1696:	4501                	li	a0,0
    1698:	8082                	ret

000000000000169a <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    169a:	16060f63          	beqz	a2,1818 <memset+0x17e>
    169e:	40a006b3          	neg	a3,a0
    16a2:	0076f793          	and	a5,a3,7
    16a6:	00778813          	add	a6,a5,7
    16aa:	48ad                	li	a7,11
    16ac:	0ff5f713          	zext.b	a4,a1
    16b0:	fff60593          	add	a1,a2,-1
    16b4:	17186363          	bltu	a6,a7,181a <memset+0x180>
    16b8:	1705eb63          	bltu	a1,a6,182e <memset+0x194>
    16bc:	16078163          	beqz	a5,181e <memset+0x184>
    16c0:	00e50023          	sb	a4,0(a0)
    16c4:	0066f593          	and	a1,a3,6
    16c8:	14058e63          	beqz	a1,1824 <memset+0x18a>
    16cc:	00e500a3          	sb	a4,1(a0)
    16d0:	4589                	li	a1,2
    16d2:	00250813          	add	a6,a0,2
    16d6:	04f5f663          	bgeu	a1,a5,1722 <memset+0x88>
    16da:	00e50123          	sb	a4,2(a0)
    16de:	8a91                	and	a3,a3,4
    16e0:	00350813          	add	a6,a0,3
    16e4:	458d                	li	a1,3
    16e6:	ce95                	beqz	a3,1722 <memset+0x88>
    16e8:	00e501a3          	sb	a4,3(a0)
    16ec:	4691                	li	a3,4
    16ee:	00450813          	add	a6,a0,4
    16f2:	4591                	li	a1,4
    16f4:	02f6f763          	bgeu	a3,a5,1722 <memset+0x88>
    16f8:	00e50223          	sb	a4,4(a0)
    16fc:	4695                	li	a3,5
    16fe:	00550813          	add	a6,a0,5
    1702:	4595                	li	a1,5
    1704:	00d78f63          	beq	a5,a3,1722 <memset+0x88>
    1708:	00e502a3          	sb	a4,5(a0)
    170c:	469d                	li	a3,7
    170e:	00650813          	add	a6,a0,6
    1712:	4599                	li	a1,6
    1714:	00d79763          	bne	a5,a3,1722 <memset+0x88>
    1718:	00750813          	add	a6,a0,7
    171c:	00e50323          	sb	a4,6(a0)
    1720:	459d                	li	a1,7
    1722:	00871693          	sll	a3,a4,0x8
    1726:	01071313          	sll	t1,a4,0x10
    172a:	8ed9                	or	a3,a3,a4
    172c:	01871893          	sll	a7,a4,0x18
    1730:	0066e6b3          	or	a3,a3,t1
    1734:	0116e6b3          	or	a3,a3,a7
    1738:	02071313          	sll	t1,a4,0x20
    173c:	02871893          	sll	a7,a4,0x28
    1740:	0066e6b3          	or	a3,a3,t1
    1744:	40f60e33          	sub	t3,a2,a5
    1748:	03071313          	sll	t1,a4,0x30
    174c:	0116e6b3          	or	a3,a3,a7
    1750:	0066e6b3          	or	a3,a3,t1
    1754:	03871893          	sll	a7,a4,0x38
    1758:	97aa                	add	a5,a5,a0
    175a:	ff8e7313          	and	t1,t3,-8
    175e:	0116e6b3          	or	a3,a3,a7
    1762:	00f308b3          	add	a7,t1,a5
    1766:	e394                	sd	a3,0(a5)
    1768:	07a1                	add	a5,a5,8
    176a:	ff179ee3          	bne	a5,a7,1766 <memset+0xcc>
    176e:	006806b3          	add	a3,a6,t1
    1772:	00b307bb          	addw	a5,t1,a1
    1776:	0bc30b63          	beq	t1,t3,182c <memset+0x192>
    177a:	00e68023          	sb	a4,0(a3)
    177e:	0017859b          	addw	a1,a5,1
    1782:	08c5fb63          	bgeu	a1,a2,1818 <memset+0x17e>
    1786:	00e680a3          	sb	a4,1(a3)
    178a:	0027859b          	addw	a1,a5,2
    178e:	08c5f563          	bgeu	a1,a2,1818 <memset+0x17e>
    1792:	00e68123          	sb	a4,2(a3)
    1796:	0037859b          	addw	a1,a5,3
    179a:	06c5ff63          	bgeu	a1,a2,1818 <memset+0x17e>
    179e:	00e681a3          	sb	a4,3(a3)
    17a2:	0047859b          	addw	a1,a5,4
    17a6:	06c5f963          	bgeu	a1,a2,1818 <memset+0x17e>
    17aa:	00e68223          	sb	a4,4(a3)
    17ae:	0057859b          	addw	a1,a5,5
    17b2:	06c5f363          	bgeu	a1,a2,1818 <memset+0x17e>
    17b6:	00e682a3          	sb	a4,5(a3)
    17ba:	0067859b          	addw	a1,a5,6
    17be:	04c5fd63          	bgeu	a1,a2,1818 <memset+0x17e>
    17c2:	00e68323          	sb	a4,6(a3)
    17c6:	0077859b          	addw	a1,a5,7
    17ca:	04c5f763          	bgeu	a1,a2,1818 <memset+0x17e>
    17ce:	00e683a3          	sb	a4,7(a3)
    17d2:	0087859b          	addw	a1,a5,8
    17d6:	04c5f163          	bgeu	a1,a2,1818 <memset+0x17e>
    17da:	00e68423          	sb	a4,8(a3)
    17de:	0097859b          	addw	a1,a5,9
    17e2:	02c5fb63          	bgeu	a1,a2,1818 <memset+0x17e>
    17e6:	00e684a3          	sb	a4,9(a3)
    17ea:	00a7859b          	addw	a1,a5,10
    17ee:	02c5f563          	bgeu	a1,a2,1818 <memset+0x17e>
    17f2:	00e68523          	sb	a4,10(a3)
    17f6:	00b7859b          	addw	a1,a5,11
    17fa:	00c5ff63          	bgeu	a1,a2,1818 <memset+0x17e>
    17fe:	00e685a3          	sb	a4,11(a3)
    1802:	00c7859b          	addw	a1,a5,12
    1806:	00c5f963          	bgeu	a1,a2,1818 <memset+0x17e>
    180a:	00e68623          	sb	a4,12(a3)
    180e:	27b5                	addw	a5,a5,13
    1810:	00c7f463          	bgeu	a5,a2,1818 <memset+0x17e>
    1814:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    1818:	8082                	ret
    181a:	482d                	li	a6,11
    181c:	bd71                	j	16b8 <memset+0x1e>
    char *p = dest;
    181e:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1820:	4581                	li	a1,0
    1822:	b701                	j	1722 <memset+0x88>
    1824:	00150813          	add	a6,a0,1
    1828:	4585                	li	a1,1
    182a:	bde5                	j	1722 <memset+0x88>
    182c:	8082                	ret
    char *p = dest;
    182e:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1830:	4781                	li	a5,0
    1832:	b7a1                	j	177a <memset+0xe0>

0000000000001834 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1834:	00054783          	lbu	a5,0(a0)
    1838:	0005c703          	lbu	a4,0(a1)
    183c:	00e79863          	bne	a5,a4,184c <strcmp+0x18>
    1840:	0505                	add	a0,a0,1
    1842:	0585                	add	a1,a1,1
    1844:	fbe5                	bnez	a5,1834 <strcmp>
    1846:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1848:	9d19                	subw	a0,a0,a4
    184a:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    184c:	0007851b          	sext.w	a0,a5
    1850:	bfe5                	j	1848 <strcmp+0x14>

0000000000001852 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1852:	ca15                	beqz	a2,1886 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1854:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1858:	167d                	add	a2,a2,-1
    185a:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    185e:	eb99                	bnez	a5,1874 <strncmp+0x22>
    1860:	a815                	j	1894 <strncmp+0x42>
    1862:	00a68e63          	beq	a3,a0,187e <strncmp+0x2c>
    1866:	0505                	add	a0,a0,1
    1868:	00f71b63          	bne	a4,a5,187e <strncmp+0x2c>
    186c:	00054783          	lbu	a5,0(a0)
    1870:	cf89                	beqz	a5,188a <strncmp+0x38>
    1872:	85b2                	mv	a1,a2
    1874:	0005c703          	lbu	a4,0(a1)
    1878:	00158613          	add	a2,a1,1
    187c:	f37d                	bnez	a4,1862 <strncmp+0x10>
        ;
    return *l - *r;
    187e:	0007851b          	sext.w	a0,a5
    1882:	9d19                	subw	a0,a0,a4
    1884:	8082                	ret
        return 0;
    1886:	4501                	li	a0,0
}
    1888:	8082                	ret
    return *l - *r;
    188a:	0015c703          	lbu	a4,1(a1)
    188e:	4501                	li	a0,0
    1890:	9d19                	subw	a0,a0,a4
    1892:	8082                	ret
    1894:	0005c703          	lbu	a4,0(a1)
    1898:	4501                	li	a0,0
    189a:	b7e5                	j	1882 <strncmp+0x30>

000000000000189c <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    189c:	00757793          	and	a5,a0,7
    18a0:	cf89                	beqz	a5,18ba <strlen+0x1e>
    18a2:	87aa                	mv	a5,a0
    18a4:	a029                	j	18ae <strlen+0x12>
    18a6:	0785                	add	a5,a5,1
    18a8:	0077f713          	and	a4,a5,7
    18ac:	cb01                	beqz	a4,18bc <strlen+0x20>
        if (!*s)
    18ae:	0007c703          	lbu	a4,0(a5)
    18b2:	fb75                	bnez	a4,18a6 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18b4:	40a78533          	sub	a0,a5,a0
}
    18b8:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18ba:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18bc:	feff05b7          	lui	a1,0xfeff0
    18c0:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefede97>
    18c4:	f0101637          	lui	a2,0xf0101
    18c8:	05c2                	sll	a1,a1,0x10
    18ca:	0612                	sll	a2,a2,0x4
    18cc:	6394                	ld	a3,0(a5)
    18ce:	eff58593          	add	a1,a1,-257
    18d2:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff099>
    18d6:	05c2                	sll	a1,a1,0x10
    18d8:	0642                	sll	a2,a2,0x10
    18da:	eff58593          	add	a1,a1,-257
    18de:	10160613          	add	a2,a2,257
    18e2:	00b68733          	add	a4,a3,a1
    18e6:	063e                	sll	a2,a2,0xf
    18e8:	fff6c693          	not	a3,a3
    18ec:	8f75                	and	a4,a4,a3
    18ee:	08060613          	add	a2,a2,128
    18f2:	8f71                	and	a4,a4,a2
    18f4:	eb11                	bnez	a4,1908 <strlen+0x6c>
    18f6:	6794                	ld	a3,8(a5)
    18f8:	07a1                	add	a5,a5,8
    18fa:	00b68733          	add	a4,a3,a1
    18fe:	fff6c693          	not	a3,a3
    1902:	8f75                	and	a4,a4,a3
    1904:	8f71                	and	a4,a4,a2
    1906:	db65                	beqz	a4,18f6 <strlen+0x5a>
    for (; *s; s++)
    1908:	0007c703          	lbu	a4,0(a5)
    190c:	d745                	beqz	a4,18b4 <strlen+0x18>
    190e:	0017c703          	lbu	a4,1(a5)
    1912:	0785                	add	a5,a5,1
    1914:	d345                	beqz	a4,18b4 <strlen+0x18>
    1916:	0017c703          	lbu	a4,1(a5)
    191a:	0785                	add	a5,a5,1
    191c:	fb6d                	bnez	a4,190e <strlen+0x72>
    191e:	bf59                	j	18b4 <strlen+0x18>

0000000000001920 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1920:	00757713          	and	a4,a0,7
{
    1924:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1926:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    192a:	cb19                	beqz	a4,1940 <memchr+0x20>
    192c:	ce59                	beqz	a2,19ca <memchr+0xaa>
    192e:	0007c703          	lbu	a4,0(a5)
    1932:	00b70963          	beq	a4,a1,1944 <memchr+0x24>
    1936:	0785                	add	a5,a5,1
    1938:	0077f713          	and	a4,a5,7
    193c:	167d                	add	a2,a2,-1
    193e:	f77d                	bnez	a4,192c <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1940:	4501                	li	a0,0
    if (n && *s != c)
    1942:	c649                	beqz	a2,19cc <memchr+0xac>
    1944:	0007c703          	lbu	a4,0(a5)
    1948:	06b70663          	beq	a4,a1,19b4 <memchr+0x94>
        size_t k = ONES * c;
    194c:	01010737          	lui	a4,0x1010
    1950:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e099>
    1954:	0742                	sll	a4,a4,0x10
    1956:	10170713          	add	a4,a4,257
    195a:	0742                	sll	a4,a4,0x10
    195c:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1960:	469d                	li	a3,7
        size_t k = ONES * c;
    1962:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1966:	04c6f763          	bgeu	a3,a2,19b4 <memchr+0x94>
    196a:	f0101837          	lui	a6,0xf0101
    196e:	feff08b7          	lui	a7,0xfeff0
    1972:	0812                	sll	a6,a6,0x4
    1974:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefede97>
    1978:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff099>
    197c:	08c2                	sll	a7,a7,0x10
    197e:	0842                	sll	a6,a6,0x10
    1980:	eff88893          	add	a7,a7,-257
    1984:	10180813          	add	a6,a6,257
    1988:	08c2                	sll	a7,a7,0x10
    198a:	083e                	sll	a6,a6,0xf
    198c:	eff88893          	add	a7,a7,-257
    1990:	08080813          	add	a6,a6,128
    1994:	431d                	li	t1,7
    1996:	a029                	j	19a0 <memchr+0x80>
    1998:	1661                	add	a2,a2,-8
    199a:	07a1                	add	a5,a5,8
    199c:	02c37663          	bgeu	t1,a2,19c8 <memchr+0xa8>
    19a0:	6398                	ld	a4,0(a5)
    19a2:	8f29                	xor	a4,a4,a0
    19a4:	011706b3          	add	a3,a4,a7
    19a8:	fff74713          	not	a4,a4
    19ac:	8f75                	and	a4,a4,a3
    19ae:	01077733          	and	a4,a4,a6
    19b2:	d37d                	beqz	a4,1998 <memchr+0x78>
        s = (const void *)w;
    19b4:	853e                	mv	a0,a5
    19b6:	a019                	j	19bc <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    19b8:	0505                	add	a0,a0,1
    19ba:	ca01                	beqz	a2,19ca <memchr+0xaa>
    19bc:	00054783          	lbu	a5,0(a0)
    19c0:	167d                	add	a2,a2,-1
    19c2:	feb79be3          	bne	a5,a1,19b8 <memchr+0x98>
    19c6:	8082                	ret
    19c8:	f675                	bnez	a2,19b4 <memchr+0x94>
    return n ? (void *)s : 0;
    19ca:	4501                	li	a0,0
}
    19cc:	8082                	ret

00000000000019ce <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19ce:	1101                	add	sp,sp,-32
    19d0:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19d2:	862e                	mv	a2,a1
{
    19d4:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19d6:	4581                	li	a1,0
{
    19d8:	e426                	sd	s1,8(sp)
    19da:	ec06                	sd	ra,24(sp)
    19dc:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19de:	f43ff0ef          	jal	1920 <memchr>
    return p ? p - s : n;
    19e2:	c519                	beqz	a0,19f0 <strnlen+0x22>
}
    19e4:	60e2                	ld	ra,24(sp)
    19e6:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19e8:	8d05                	sub	a0,a0,s1
}
    19ea:	64a2                	ld	s1,8(sp)
    19ec:	6105                	add	sp,sp,32
    19ee:	8082                	ret
    19f0:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19f2:	8522                	mv	a0,s0
}
    19f4:	6442                	ld	s0,16(sp)
    19f6:	64a2                	ld	s1,8(sp)
    19f8:	6105                	add	sp,sp,32
    19fa:	8082                	ret

00000000000019fc <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19fc:	00b547b3          	xor	a5,a0,a1
    1a00:	8b9d                	and	a5,a5,7
    1a02:	efb1                	bnez	a5,1a5e <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a04:	0075f793          	and	a5,a1,7
    1a08:	ebb5                	bnez	a5,1a7c <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a0a:	feff0637          	lui	a2,0xfeff0
    1a0e:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefede97>
    1a12:	f01016b7          	lui	a3,0xf0101
    1a16:	0642                	sll	a2,a2,0x10
    1a18:	0692                	sll	a3,a3,0x4
    1a1a:	6198                	ld	a4,0(a1)
    1a1c:	eff60613          	add	a2,a2,-257
    1a20:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff099>
    1a24:	0642                	sll	a2,a2,0x10
    1a26:	06c2                	sll	a3,a3,0x10
    1a28:	eff60613          	add	a2,a2,-257
    1a2c:	10168693          	add	a3,a3,257
    1a30:	00c707b3          	add	a5,a4,a2
    1a34:	fff74813          	not	a6,a4
    1a38:	06be                	sll	a3,a3,0xf
    1a3a:	0107f7b3          	and	a5,a5,a6
    1a3e:	08068693          	add	a3,a3,128
    1a42:	8ff5                	and	a5,a5,a3
    1a44:	ef89                	bnez	a5,1a5e <strcpy+0x62>
    1a46:	05a1                	add	a1,a1,8
    1a48:	e118                	sd	a4,0(a0)
    1a4a:	6198                	ld	a4,0(a1)
    1a4c:	0521                	add	a0,a0,8
    1a4e:	00c707b3          	add	a5,a4,a2
    1a52:	fff74813          	not	a6,a4
    1a56:	0107f7b3          	and	a5,a5,a6
    1a5a:	8ff5                	and	a5,a5,a3
    1a5c:	d7ed                	beqz	a5,1a46 <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a5e:	0005c783          	lbu	a5,0(a1)
    1a62:	00f50023          	sb	a5,0(a0)
    1a66:	c785                	beqz	a5,1a8e <strcpy+0x92>
    1a68:	0015c783          	lbu	a5,1(a1)
    1a6c:	0505                	add	a0,a0,1
    1a6e:	0585                	add	a1,a1,1
    1a70:	00f50023          	sb	a5,0(a0)
    1a74:	fbf5                	bnez	a5,1a68 <strcpy+0x6c>
        ;
    return d;
}
    1a76:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a78:	0505                	add	a0,a0,1
    1a7a:	db41                	beqz	a4,1a0a <strcpy+0xe>
            if (!(*d = *s))
    1a7c:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a80:	0585                	add	a1,a1,1
    1a82:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a86:	00f50023          	sb	a5,0(a0)
    1a8a:	f7fd                	bnez	a5,1a78 <strcpy+0x7c>
}
    1a8c:	8082                	ret
    1a8e:	8082                	ret

0000000000001a90 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a90:	00b547b3          	xor	a5,a0,a1
    1a94:	8b9d                	and	a5,a5,7
    1a96:	efbd                	bnez	a5,1b14 <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a98:	0075f793          	and	a5,a1,7
    1a9c:	1c078563          	beqz	a5,1c66 <strncpy+0x1d6>
    1aa0:	ea11                	bnez	a2,1ab4 <strncpy+0x24>
    1aa2:	8082                	ret
    1aa4:	0585                	add	a1,a1,1
    1aa6:	0075f793          	and	a5,a1,7
    1aaa:	167d                	add	a2,a2,-1
    1aac:	0505                	add	a0,a0,1
    1aae:	1a078c63          	beqz	a5,1c66 <strncpy+0x1d6>
    1ab2:	ca3d                	beqz	a2,1b28 <strncpy+0x98>
    1ab4:	0005c783          	lbu	a5,0(a1)
    1ab8:	00f50023          	sb	a5,0(a0)
    1abc:	f7e5                	bnez	a5,1aa4 <strncpy+0x14>
            ;
        if (!n || !*s)
    1abe:	0005c783          	lbu	a5,0(a1)
    1ac2:	c7a5                	beqz	a5,1b2a <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ac4:	479d                	li	a5,7
    1ac6:	04c7f863          	bgeu	a5,a2,1b16 <strncpy+0x86>
    1aca:	f01016b7          	lui	a3,0xf0101
    1ace:	feff0837          	lui	a6,0xfeff0
    1ad2:	0692                	sll	a3,a3,0x4
    1ad4:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefede97>
    1ad8:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff099>
    1adc:	0842                	sll	a6,a6,0x10
    1ade:	06c2                	sll	a3,a3,0x10
    1ae0:	eff80813          	add	a6,a6,-257
    1ae4:	10168693          	add	a3,a3,257
    1ae8:	0842                	sll	a6,a6,0x10
    1aea:	06be                	sll	a3,a3,0xf
    1aec:	eff80813          	add	a6,a6,-257
    1af0:	08068693          	add	a3,a3,128
    1af4:	431d                	li	t1,7
    1af6:	6198                	ld	a4,0(a1)
    1af8:	010707b3          	add	a5,a4,a6
    1afc:	fff74893          	not	a7,a4
    1b00:	0117f7b3          	and	a5,a5,a7
    1b04:	8ff5                	and	a5,a5,a3
    1b06:	eb81                	bnez	a5,1b16 <strncpy+0x86>
            *wd = *ws;
    1b08:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b0a:	1661                	add	a2,a2,-8
    1b0c:	05a1                	add	a1,a1,8
    1b0e:	0521                	add	a0,a0,8
    1b10:	fec363e3          	bltu	t1,a2,1af6 <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b14:	ca11                	beqz	a2,1b28 <strncpy+0x98>
    1b16:	0005c783          	lbu	a5,0(a1)
    1b1a:	0585                	add	a1,a1,1
    1b1c:	00f50023          	sb	a5,0(a0)
    1b20:	c789                	beqz	a5,1b2a <strncpy+0x9a>
    1b22:	167d                	add	a2,a2,-1
    1b24:	0505                	add	a0,a0,1
    1b26:	fa65                	bnez	a2,1b16 <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b28:	8082                	ret
    1b2a:	40a00733          	neg	a4,a0
    1b2e:	00777793          	and	a5,a4,7
    1b32:	00778693          	add	a3,a5,7
    1b36:	482d                	li	a6,11
    1b38:	fff60593          	add	a1,a2,-1
    1b3c:	1106ef63          	bltu	a3,a6,1c5a <strncpy+0x1ca>
    1b40:	12d5ee63          	bltu	a1,a3,1c7c <strncpy+0x1ec>
    1b44:	12078563          	beqz	a5,1c6e <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b48:	00050023          	sb	zero,0(a0)
    1b4c:	00677693          	and	a3,a4,6
    1b50:	12068263          	beqz	a3,1c74 <strncpy+0x1e4>
    1b54:	000500a3          	sb	zero,1(a0)
    1b58:	4689                	li	a3,2
    1b5a:	12f6f463          	bgeu	a3,a5,1c82 <strncpy+0x1f2>
    1b5e:	00050123          	sb	zero,2(a0)
    1b62:	8b11                	and	a4,a4,4
    1b64:	cf6d                	beqz	a4,1c5e <strncpy+0x1ce>
    1b66:	000501a3          	sb	zero,3(a0)
    1b6a:	4711                	li	a4,4
    1b6c:	00450693          	add	a3,a0,4
    1b70:	02f77363          	bgeu	a4,a5,1b96 <strncpy+0x106>
    1b74:	00050223          	sb	zero,4(a0)
    1b78:	4715                	li	a4,5
    1b7a:	00550693          	add	a3,a0,5
    1b7e:	00e78c63          	beq	a5,a4,1b96 <strncpy+0x106>
    1b82:	000502a3          	sb	zero,5(a0)
    1b86:	471d                	li	a4,7
    1b88:	10e79163          	bne	a5,a4,1c8a <strncpy+0x1fa>
    1b8c:	00750693          	add	a3,a0,7
    1b90:	00050323          	sb	zero,6(a0)
    1b94:	471d                	li	a4,7
    1b96:	40f608b3          	sub	a7,a2,a5
    1b9a:	ff88f813          	and	a6,a7,-8
    1b9e:	97aa                	add	a5,a5,a0
    1ba0:	010785b3          	add	a1,a5,a6
    1ba4:	0007b023          	sd	zero,0(a5)
    1ba8:	07a1                	add	a5,a5,8
    1baa:	feb79de3          	bne	a5,a1,1ba4 <strncpy+0x114>
    1bae:	00e807bb          	addw	a5,a6,a4
    1bb2:	01068733          	add	a4,a3,a6
    1bb6:	0b088b63          	beq	a7,a6,1c6c <strncpy+0x1dc>
    1bba:	00070023          	sb	zero,0(a4)
    1bbe:	0017869b          	addw	a3,a5,1
    1bc2:	f6c6f3e3          	bgeu	a3,a2,1b28 <strncpy+0x98>
    1bc6:	000700a3          	sb	zero,1(a4)
    1bca:	0027869b          	addw	a3,a5,2
    1bce:	f4c6fde3          	bgeu	a3,a2,1b28 <strncpy+0x98>
    1bd2:	00070123          	sb	zero,2(a4)
    1bd6:	0037869b          	addw	a3,a5,3
    1bda:	f4c6f7e3          	bgeu	a3,a2,1b28 <strncpy+0x98>
    1bde:	000701a3          	sb	zero,3(a4)
    1be2:	0047869b          	addw	a3,a5,4
    1be6:	f4c6f1e3          	bgeu	a3,a2,1b28 <strncpy+0x98>
    1bea:	00070223          	sb	zero,4(a4)
    1bee:	0057869b          	addw	a3,a5,5
    1bf2:	f2c6fbe3          	bgeu	a3,a2,1b28 <strncpy+0x98>
    1bf6:	000702a3          	sb	zero,5(a4)
    1bfa:	0067869b          	addw	a3,a5,6
    1bfe:	f2c6f5e3          	bgeu	a3,a2,1b28 <strncpy+0x98>
    1c02:	00070323          	sb	zero,6(a4)
    1c06:	0077869b          	addw	a3,a5,7
    1c0a:	f0c6ffe3          	bgeu	a3,a2,1b28 <strncpy+0x98>
    1c0e:	000703a3          	sb	zero,7(a4)
    1c12:	0087869b          	addw	a3,a5,8
    1c16:	f0c6f9e3          	bgeu	a3,a2,1b28 <strncpy+0x98>
    1c1a:	00070423          	sb	zero,8(a4)
    1c1e:	0097869b          	addw	a3,a5,9
    1c22:	f0c6f3e3          	bgeu	a3,a2,1b28 <strncpy+0x98>
    1c26:	000704a3          	sb	zero,9(a4)
    1c2a:	00a7869b          	addw	a3,a5,10
    1c2e:	eec6fde3          	bgeu	a3,a2,1b28 <strncpy+0x98>
    1c32:	00070523          	sb	zero,10(a4)
    1c36:	00b7869b          	addw	a3,a5,11
    1c3a:	eec6f7e3          	bgeu	a3,a2,1b28 <strncpy+0x98>
    1c3e:	000705a3          	sb	zero,11(a4)
    1c42:	00c7869b          	addw	a3,a5,12
    1c46:	eec6f1e3          	bgeu	a3,a2,1b28 <strncpy+0x98>
    1c4a:	00070623          	sb	zero,12(a4)
    1c4e:	27b5                	addw	a5,a5,13
    1c50:	ecc7fce3          	bgeu	a5,a2,1b28 <strncpy+0x98>
    1c54:	000706a3          	sb	zero,13(a4)
}
    1c58:	8082                	ret
    1c5a:	46ad                	li	a3,11
    1c5c:	b5d5                	j	1b40 <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c5e:	00350693          	add	a3,a0,3
    1c62:	470d                	li	a4,3
    1c64:	bf0d                	j	1b96 <strncpy+0x106>
        if (!n || !*s)
    1c66:	e4061ce3          	bnez	a2,1abe <strncpy+0x2e>
}
    1c6a:	8082                	ret
    1c6c:	8082                	ret
    char *p = dest;
    1c6e:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c70:	4701                	li	a4,0
    1c72:	b715                	j	1b96 <strncpy+0x106>
    1c74:	00150693          	add	a3,a0,1
    1c78:	4705                	li	a4,1
    1c7a:	bf31                	j	1b96 <strncpy+0x106>
    char *p = dest;
    1c7c:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c7e:	4781                	li	a5,0
    1c80:	bf2d                	j	1bba <strncpy+0x12a>
    1c82:	00250693          	add	a3,a0,2
    1c86:	4709                	li	a4,2
    1c88:	b739                	j	1b96 <strncpy+0x106>
    1c8a:	00650693          	add	a3,a0,6
    1c8e:	4719                	li	a4,6
    1c90:	b719                	j	1b96 <strncpy+0x106>

0000000000001c92 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c92:	87aa                	mv	a5,a0
    1c94:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c96:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c9a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c9e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1ca0:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ca2:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1ca6:	2501                	sext.w	a0,a0
    1ca8:	8082                	ret

0000000000001caa <openat>:
    register long a7 __asm__("a7") = n;
    1caa:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1cae:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cb2:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1cb6:	2501                	sext.w	a0,a0
    1cb8:	8082                	ret

0000000000001cba <close>:
    register long a7 __asm__("a7") = n;
    1cba:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1cbe:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1cc2:	2501                	sext.w	a0,a0
    1cc4:	8082                	ret

0000000000001cc6 <read>:
    register long a7 __asm__("a7") = n;
    1cc6:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cca:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1cce:	8082                	ret

0000000000001cd0 <write>:
    register long a7 __asm__("a7") = n;
    1cd0:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cd4:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1cd8:	8082                	ret

0000000000001cda <getpid>:
    register long a7 __asm__("a7") = n;
    1cda:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1cde:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1ce2:	2501                	sext.w	a0,a0
    1ce4:	8082                	ret

0000000000001ce6 <getppid>:
    register long a7 __asm__("a7") = n;
    1ce6:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1cea:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cee:	2501                	sext.w	a0,a0
    1cf0:	8082                	ret

0000000000001cf2 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cf2:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cf6:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cfa:	2501                	sext.w	a0,a0
    1cfc:	8082                	ret

0000000000001cfe <fork>:
    register long a7 __asm__("a7") = n;
    1cfe:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d02:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d04:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d06:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d0a:	2501                	sext.w	a0,a0
    1d0c:	8082                	ret

0000000000001d0e <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d0e:	85b2                	mv	a1,a2
    1d10:	863a                	mv	a2,a4
    if (stack)
    1d12:	c191                	beqz	a1,1d16 <clone+0x8>
	stack += stack_size;
    1d14:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d16:	4781                	li	a5,0
    1d18:	4701                	li	a4,0
    1d1a:	4681                	li	a3,0
    1d1c:	2601                	sext.w	a2,a2
    1d1e:	a2ed                	j	1f08 <__clone>

0000000000001d20 <exit>:
    register long a7 __asm__("a7") = n;
    1d20:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d24:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d28:	8082                	ret

0000000000001d2a <waitpid>:
    register long a7 __asm__("a7") = n;
    1d2a:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d2e:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d30:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d34:	2501                	sext.w	a0,a0
    1d36:	8082                	ret

0000000000001d38 <exec>:
    register long a7 __asm__("a7") = n;
    1d38:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d3c:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d40:	2501                	sext.w	a0,a0
    1d42:	8082                	ret

0000000000001d44 <execve>:
    register long a7 __asm__("a7") = n;
    1d44:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d48:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d4c:	2501                	sext.w	a0,a0
    1d4e:	8082                	ret

0000000000001d50 <times>:
    register long a7 __asm__("a7") = n;
    1d50:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d54:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d58:	2501                	sext.w	a0,a0
    1d5a:	8082                	ret

0000000000001d5c <get_time>:

int64 get_time()
{
    1d5c:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d5e:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d62:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d64:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d66:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d6a:	2501                	sext.w	a0,a0
    1d6c:	ed09                	bnez	a0,1d86 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d6e:	67a2                	ld	a5,8(sp)
    1d70:	3e800713          	li	a4,1000
    1d74:	00015503          	lhu	a0,0(sp)
    1d78:	02e7d7b3          	divu	a5,a5,a4
    1d7c:	02e50533          	mul	a0,a0,a4
    1d80:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d82:	0141                	add	sp,sp,16
    1d84:	8082                	ret
        return -1;
    1d86:	557d                	li	a0,-1
    1d88:	bfed                	j	1d82 <get_time+0x26>

0000000000001d8a <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d8a:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d8e:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d92:	2501                	sext.w	a0,a0
    1d94:	8082                	ret

0000000000001d96 <time>:
    register long a7 __asm__("a7") = n;
    1d96:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d9a:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d9e:	2501                	sext.w	a0,a0
    1da0:	8082                	ret

0000000000001da2 <sleep>:

int sleep(unsigned long long time)
{
    1da2:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1da4:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1da6:	850a                	mv	a0,sp
    1da8:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1daa:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1dae:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db0:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1db4:	e501                	bnez	a0,1dbc <sleep+0x1a>
    return 0;
    1db6:	4501                	li	a0,0
}
    1db8:	0141                	add	sp,sp,16
    1dba:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1dbc:	4502                	lw	a0,0(sp)
}
    1dbe:	0141                	add	sp,sp,16
    1dc0:	8082                	ret

0000000000001dc2 <set_priority>:
    register long a7 __asm__("a7") = n;
    1dc2:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1dc6:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1dca:	2501                	sext.w	a0,a0
    1dcc:	8082                	ret

0000000000001dce <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1dce:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1dd2:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1dd6:	8082                	ret

0000000000001dd8 <munmap>:
    register long a7 __asm__("a7") = n;
    1dd8:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ddc:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1de0:	2501                	sext.w	a0,a0
    1de2:	8082                	ret

0000000000001de4 <wait>:

int wait(int *code)
{
    1de4:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1de6:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1dea:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1dec:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1dee:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1df0:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1df4:	2501                	sext.w	a0,a0
    1df6:	8082                	ret

0000000000001df8 <spawn>:
    register long a7 __asm__("a7") = n;
    1df8:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1dfc:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e00:	2501                	sext.w	a0,a0
    1e02:	8082                	ret

0000000000001e04 <mailread>:
    register long a7 __asm__("a7") = n;
    1e04:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e08:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e0c:	2501                	sext.w	a0,a0
    1e0e:	8082                	ret

0000000000001e10 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e10:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e14:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e18:	2501                	sext.w	a0,a0
    1e1a:	8082                	ret

0000000000001e1c <fstat>:
    register long a7 __asm__("a7") = n;
    1e1c:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e20:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e24:	2501                	sext.w	a0,a0
    1e26:	8082                	ret

0000000000001e28 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e28:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e2a:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e2e:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e30:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e38:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e3a:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e3e:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e40:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e44:	2501                	sext.w	a0,a0
    1e46:	8082                	ret

0000000000001e48 <link>:

int link(char *old_path, char *new_path)
{
    1e48:	87aa                	mv	a5,a0
    1e4a:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e4c:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e50:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e54:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e56:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e5a:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e5c:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e60:	2501                	sext.w	a0,a0
    1e62:	8082                	ret

0000000000001e64 <unlink>:

int unlink(char *path)
{
    1e64:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e66:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e6a:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e6e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e70:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e74:	2501                	sext.w	a0,a0
    1e76:	8082                	ret

0000000000001e78 <uname>:
    register long a7 __asm__("a7") = n;
    1e78:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e7c:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e80:	2501                	sext.w	a0,a0
    1e82:	8082                	ret

0000000000001e84 <brk>:
    register long a7 __asm__("a7") = n;
    1e84:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e88:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e8c:	2501                	sext.w	a0,a0
    1e8e:	8082                	ret

0000000000001e90 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e90:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e92:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e96:	8082                	ret

0000000000001e98 <chdir>:
    register long a7 __asm__("a7") = n;
    1e98:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e9c:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1ea0:	2501                	sext.w	a0,a0
    1ea2:	8082                	ret

0000000000001ea4 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1ea4:	862e                	mv	a2,a1
    1ea6:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1ea8:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1eaa:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1eae:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1eb2:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1eb4:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eb6:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1eba:	2501                	sext.w	a0,a0
    1ebc:	8082                	ret

0000000000001ebe <getdents>:
    register long a7 __asm__("a7") = n;
    1ebe:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ec2:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1ec6:	2501                	sext.w	a0,a0
    1ec8:	8082                	ret

0000000000001eca <pipe>:
    register long a7 __asm__("a7") = n;
    1eca:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1ece:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed0:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1ed4:	2501                	sext.w	a0,a0
    1ed6:	8082                	ret

0000000000001ed8 <dup>:
    register long a7 __asm__("a7") = n;
    1ed8:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1eda:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1ede:	2501                	sext.w	a0,a0
    1ee0:	8082                	ret

0000000000001ee2 <dup2>:
    register long a7 __asm__("a7") = n;
    1ee2:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1ee4:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ee6:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1eea:	2501                	sext.w	a0,a0
    1eec:	8082                	ret

0000000000001eee <mount>:
    register long a7 __asm__("a7") = n;
    1eee:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ef2:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ef6:	2501                	sext.w	a0,a0
    1ef8:	8082                	ret

0000000000001efa <umount>:
    register long a7 __asm__("a7") = n;
    1efa:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1efe:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f00:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f04:	2501                	sext.w	a0,a0
    1f06:	8082                	ret

0000000000001f08 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f08:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1f0a:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f0c:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f0e:	8532                	mv	a0,a2
	mv a2, a4
    1f10:	863a                	mv	a2,a4
	mv a3, a5
    1f12:	86be                	mv	a3,a5
	mv a4, a6
    1f14:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f16:	0dc00893          	li	a7,220
	ecall
    1f1a:	00000073          	ecall

	beqz a0, 1f
    1f1e:	c111                	beqz	a0,1f22 <__clone+0x1a>
	# Parent
	ret
    1f20:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f22:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f24:	6522                	ld	a0,8(sp)
	jalr a1
    1f26:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f28:	05d00893          	li	a7,93
	ecall
    1f2c:	00000073          	ecall
