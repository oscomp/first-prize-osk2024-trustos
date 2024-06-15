
/root/oskernel2024-trustos/pre_ctests/build/riscv64/munmap:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	aa01                	j	1112 <__start_main>

0000000000001004 <test_munmap>:
 * "  Hello, mmap success"
 * 测试失败时输出：
 * "mmap error."
 */
static struct kstat kst;
void test_munmap(void){
    1004:	1101                	add	sp,sp,-32
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f5a50513          	add	a0,a0,-166 # 1f60 <__clone+0x2c>
void test_munmap(void){
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
    1012:	e426                	sd	s1,8(sp)
    TEST_START(__func__);
    1014:	336000ef          	jal	134a <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	0a850513          	add	a0,a0,168 # 20c0 <__func__.0>
    1020:	32a000ef          	jal	134a <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	f5450513          	add	a0,a0,-172 # 1f78 <__clone+0x44>
    102c:	31e000ef          	jal	134a <puts>
    char *array;
    const char *str = "  Hello, mmap successfully!";
    int fd;

    fd = open("test_mmap.txt", O_RDWR | O_CREATE);
    1030:	04200593          	li	a1,66
    1034:	00001517          	auipc	a0,0x1
    1038:	f5450513          	add	a0,a0,-172 # 1f88 <__clone+0x54>
    103c:	479000ef          	jal	1cb4 <open>
    1040:	842a                	mv	s0,a0
    write(fd, str, strlen(str));
    1042:	00001517          	auipc	a0,0x1
    1046:	f5650513          	add	a0,a0,-170 # 1f98 <__clone+0x64>
    104a:	075000ef          	jal	18be <strlen>
    104e:	862a                	mv	a2,a0
    1050:	00001597          	auipc	a1,0x1
    1054:	f4858593          	add	a1,a1,-184 # 1f98 <__clone+0x64>
    1058:	8522                	mv	a0,s0
    105a:	4a3000ef          	jal	1cfc <write>
    fstat(fd, &kst);
    105e:	00001497          	auipc	s1,0x1
    1062:	fe248493          	add	s1,s1,-30 # 2040 <kst>
    1066:	85a6                	mv	a1,s1
    1068:	8522                	mv	a0,s0
    106a:	5df000ef          	jal	1e48 <fstat>
    printf("file len: %d\n", kst.st_size);
    106e:	788c                	ld	a1,48(s1)
    1070:	00001517          	auipc	a0,0x1
    1074:	f4850513          	add	a0,a0,-184 # 1fb8 <__clone+0x84>
    1078:	2f4000ef          	jal	136c <printf>
    array = mmap(NULL, kst.st_size, PROT_WRITE | PROT_READ, MAP_FILE | MAP_SHARED, fd, 0);
    107c:	788c                	ld	a1,48(s1)
    107e:	4781                	li	a5,0
    1080:	8722                	mv	a4,s0
    1082:	4685                	li	a3,1
    1084:	460d                	li	a2,3
    1086:	4501                	li	a0,0
    1088:	573000ef          	jal	1dfa <mmap>
    //printf("return array: %x\n", array);

    if (array == MAP_FAILED) {
    108c:	57fd                	li	a5,-1
    108e:	06f50363          	beq	a0,a5,10f4 <test_munmap+0xf0>
	printf("mmap error.\n");
    }else{
	//printf("mmap content: %s\n", array);

    	int ret = munmap(array, kst.st_size);
    1092:	788c                	ld	a1,48(s1)
    1094:	571000ef          	jal	1e04 <munmap>
    1098:	84aa                	mv	s1,a0
	printf("munmap return: %d\n",ret);
    109a:	85aa                	mv	a1,a0
    109c:	00001517          	auipc	a0,0x1
    10a0:	f3c50513          	add	a0,a0,-196 # 1fd8 <__clone+0xa4>
    10a4:	2c8000ef          	jal	136c <printf>
	assert(ret == 0);
    10a8:	ec9d                	bnez	s1,10e6 <test_munmap+0xe2>

	if (ret == 0)
		printf("munmap successfully!\n");
    10aa:	00001517          	auipc	a0,0x1
    10ae:	f4650513          	add	a0,a0,-186 # 1ff0 <__clone+0xbc>
    10b2:	2ba000ef          	jal	136c <printf>
    }
    close(fd);
    10b6:	8522                	mv	a0,s0
    10b8:	42f000ef          	jal	1ce6 <close>

    TEST_END(__func__);
    10bc:	00001517          	auipc	a0,0x1
    10c0:	f6c50513          	add	a0,a0,-148 # 2028 <__clone+0xf4>
    10c4:	286000ef          	jal	134a <puts>
    10c8:	00001517          	auipc	a0,0x1
    10cc:	ff850513          	add	a0,a0,-8 # 20c0 <__func__.0>
    10d0:	27a000ef          	jal	134a <puts>
}
    10d4:	6442                	ld	s0,16(sp)
    10d6:	60e2                	ld	ra,24(sp)
    10d8:	64a2                	ld	s1,8(sp)
    TEST_END(__func__);
    10da:	00001517          	auipc	a0,0x1
    10de:	e9e50513          	add	a0,a0,-354 # 1f78 <__clone+0x44>
}
    10e2:	6105                	add	sp,sp,32
    TEST_END(__func__);
    10e4:	a49d                	j	134a <puts>
	assert(ret == 0);
    10e6:	00001517          	auipc	a0,0x1
    10ea:	f2250513          	add	a0,a0,-222 # 2008 <__clone+0xd4>
    10ee:	4fc000ef          	jal	15ea <panic>
	if (ret == 0)
    10f2:	b7d1                	j	10b6 <test_munmap+0xb2>
	printf("mmap error.\n");
    10f4:	00001517          	auipc	a0,0x1
    10f8:	ed450513          	add	a0,a0,-300 # 1fc8 <__clone+0x94>
    10fc:	270000ef          	jal	136c <printf>
    1100:	bf5d                	j	10b6 <test_munmap+0xb2>

0000000000001102 <main>:

int main(void){
    1102:	1141                	add	sp,sp,-16
    1104:	e406                	sd	ra,8(sp)
    test_munmap();
    1106:	effff0ef          	jal	1004 <test_munmap>
    return 0;
}
    110a:	60a2                	ld	ra,8(sp)
    110c:	4501                	li	a0,0
    110e:	0141                	add	sp,sp,16
    1110:	8082                	ret

0000000000001112 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1112:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1114:	4108                	lw	a0,0(a0)
{
    1116:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    1118:	05a1                	add	a1,a1,8
{
    111a:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    111c:	fe7ff0ef          	jal	1102 <main>
    1120:	42d000ef          	jal	1d4c <exit>
	return 0;
}
    1124:	60a2                	ld	ra,8(sp)
    1126:	4501                	li	a0,0
    1128:	0141                	add	sp,sp,16
    112a:	8082                	ret

000000000000112c <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    112c:	7179                	add	sp,sp,-48
    112e:	f406                	sd	ra,40(sp)
    1130:	0005081b          	sext.w	a6,a0
    1134:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1136:	00055563          	bgez	a0,1140 <printint.constprop.0+0x14>
        x = -xx;
    113a:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    113e:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1140:	02b8763b          	remuw	a2,a6,a1
    1144:	00001697          	auipc	a3,0x1
    1148:	f8c68693          	add	a3,a3,-116 # 20d0 <digits>
    buf[16] = 0;
    114c:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1150:	0005871b          	sext.w	a4,a1
    1154:	1602                	sll	a2,a2,0x20
    1156:	9201                	srl	a2,a2,0x20
    1158:	9636                	add	a2,a2,a3
    115a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    115e:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    1162:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1166:	10b86c63          	bltu	a6,a1,127e <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    116a:	02e5763b          	remuw	a2,a0,a4
    116e:	1602                	sll	a2,a2,0x20
    1170:	9201                	srl	a2,a2,0x20
    1172:	9636                	add	a2,a2,a3
    1174:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1178:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    117c:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1180:	10e56863          	bltu	a0,a4,1290 <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    1184:	02e5f63b          	remuw	a2,a1,a4
    1188:	1602                	sll	a2,a2,0x20
    118a:	9201                	srl	a2,a2,0x20
    118c:	9636                	add	a2,a2,a3
    118e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1192:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1196:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    119a:	10e5e463          	bltu	a1,a4,12a2 <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    119e:	02e5763b          	remuw	a2,a0,a4
    11a2:	1602                	sll	a2,a2,0x20
    11a4:	9201                	srl	a2,a2,0x20
    11a6:	9636                	add	a2,a2,a3
    11a8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ac:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11b0:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    11b4:	10e56063          	bltu	a0,a4,12b4 <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    11b8:	02e5f63b          	remuw	a2,a1,a4
    11bc:	1602                	sll	a2,a2,0x20
    11be:	9201                	srl	a2,a2,0x20
    11c0:	9636                	add	a2,a2,a3
    11c2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c6:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11ca:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    11ce:	0ee5ec63          	bltu	a1,a4,12c6 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11d2:	02e5763b          	remuw	a2,a0,a4
    11d6:	1602                	sll	a2,a2,0x20
    11d8:	9201                	srl	a2,a2,0x20
    11da:	9636                	add	a2,a2,a3
    11dc:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11e0:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11e4:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11e8:	08e56263          	bltu	a0,a4,126c <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    11ec:	02e5f63b          	remuw	a2,a1,a4
    11f0:	1602                	sll	a2,a2,0x20
    11f2:	9201                	srl	a2,a2,0x20
    11f4:	9636                	add	a2,a2,a3
    11f6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11fa:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11fe:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1202:	0ce5eb63          	bltu	a1,a4,12d8 <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    1206:	02e5763b          	remuw	a2,a0,a4
    120a:	1602                	sll	a2,a2,0x20
    120c:	9201                	srl	a2,a2,0x20
    120e:	9636                	add	a2,a2,a3
    1210:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1214:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1218:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    121c:	0ce56763          	bltu	a0,a4,12ea <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    1220:	02e5f63b          	remuw	a2,a1,a4
    1224:	1602                	sll	a2,a2,0x20
    1226:	9201                	srl	a2,a2,0x20
    1228:	9636                	add	a2,a2,a3
    122a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    122e:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1232:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    1236:	0ce5e363          	bltu	a1,a4,12fc <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    123a:	1782                	sll	a5,a5,0x20
    123c:	9381                	srl	a5,a5,0x20
    123e:	96be                	add	a3,a3,a5
    1240:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    1244:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    1246:	00f10723          	sb	a5,14(sp)
    if (sign)
    124a:	00088763          	beqz	a7,1258 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    124e:	02d00793          	li	a5,45
    1252:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1256:	4595                	li	a1,5
    write(f, s, l);
    1258:	003c                	add	a5,sp,8
    125a:	4641                	li	a2,16
    125c:	9e0d                	subw	a2,a2,a1
    125e:	4505                	li	a0,1
    1260:	95be                	add	a1,a1,a5
    1262:	29b000ef          	jal	1cfc <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1266:	70a2                	ld	ra,40(sp)
    1268:	6145                	add	sp,sp,48
    126a:	8082                	ret
    i++;
    126c:	45a9                	li	a1,10
    if (sign)
    126e:	fe0885e3          	beqz	a7,1258 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1272:	02d00793          	li	a5,45
    1276:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    127a:	45a5                	li	a1,9
    127c:	bff1                	j	1258 <printint.constprop.0+0x12c>
    i++;
    127e:	45bd                	li	a1,15
    if (sign)
    1280:	fc088ce3          	beqz	a7,1258 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1284:	02d00793          	li	a5,45
    1288:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    128c:	45b9                	li	a1,14
    128e:	b7e9                	j	1258 <printint.constprop.0+0x12c>
    i++;
    1290:	45b9                	li	a1,14
    if (sign)
    1292:	fc0883e3          	beqz	a7,1258 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1296:	02d00793          	li	a5,45
    129a:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    129e:	45b5                	li	a1,13
    12a0:	bf65                	j	1258 <printint.constprop.0+0x12c>
    i++;
    12a2:	45b5                	li	a1,13
    if (sign)
    12a4:	fa088ae3          	beqz	a7,1258 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12a8:	02d00793          	li	a5,45
    12ac:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    12b0:	45b1                	li	a1,12
    12b2:	b75d                	j	1258 <printint.constprop.0+0x12c>
    i++;
    12b4:	45b1                	li	a1,12
    if (sign)
    12b6:	fa0881e3          	beqz	a7,1258 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12ba:	02d00793          	li	a5,45
    12be:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12c2:	45ad                	li	a1,11
    12c4:	bf51                	j	1258 <printint.constprop.0+0x12c>
    i++;
    12c6:	45ad                	li	a1,11
    if (sign)
    12c8:	f80888e3          	beqz	a7,1258 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12cc:	02d00793          	li	a5,45
    12d0:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12d4:	45a9                	li	a1,10
    12d6:	b749                	j	1258 <printint.constprop.0+0x12c>
    i++;
    12d8:	45a5                	li	a1,9
    if (sign)
    12da:	f6088fe3          	beqz	a7,1258 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12de:	02d00793          	li	a5,45
    12e2:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12e6:	45a1                	li	a1,8
    12e8:	bf85                	j	1258 <printint.constprop.0+0x12c>
    i++;
    12ea:	45a1                	li	a1,8
    if (sign)
    12ec:	f60886e3          	beqz	a7,1258 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12f0:	02d00793          	li	a5,45
    12f4:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12f8:	459d                	li	a1,7
    12fa:	bfb9                	j	1258 <printint.constprop.0+0x12c>
    i++;
    12fc:	459d                	li	a1,7
    if (sign)
    12fe:	f4088de3          	beqz	a7,1258 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1302:	02d00793          	li	a5,45
    1306:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    130a:	4599                	li	a1,6
    130c:	b7b1                	j	1258 <printint.constprop.0+0x12c>

000000000000130e <getchar>:
{
    130e:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    1310:	00f10593          	add	a1,sp,15
    1314:	4605                	li	a2,1
    1316:	4501                	li	a0,0
{
    1318:	ec06                	sd	ra,24(sp)
    char byte = 0;
    131a:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    131e:	1d5000ef          	jal	1cf2 <read>
}
    1322:	60e2                	ld	ra,24(sp)
    1324:	00f14503          	lbu	a0,15(sp)
    1328:	6105                	add	sp,sp,32
    132a:	8082                	ret

000000000000132c <putchar>:
{
    132c:	1101                	add	sp,sp,-32
    132e:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1330:	00f10593          	add	a1,sp,15
    1334:	4605                	li	a2,1
    1336:	4505                	li	a0,1
{
    1338:	ec06                	sd	ra,24(sp)
    char byte = c;
    133a:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    133e:	1bf000ef          	jal	1cfc <write>
}
    1342:	60e2                	ld	ra,24(sp)
    1344:	2501                	sext.w	a0,a0
    1346:	6105                	add	sp,sp,32
    1348:	8082                	ret

000000000000134a <puts>:
{
    134a:	1141                	add	sp,sp,-16
    134c:	e406                	sd	ra,8(sp)
    134e:	e022                	sd	s0,0(sp)
    1350:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1352:	56c000ef          	jal	18be <strlen>
    1356:	862a                	mv	a2,a0
    1358:	85a2                	mv	a1,s0
    135a:	4505                	li	a0,1
    135c:	1a1000ef          	jal	1cfc <write>
}
    1360:	60a2                	ld	ra,8(sp)
    1362:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1364:	957d                	sra	a0,a0,0x3f
    return r;
    1366:	2501                	sext.w	a0,a0
}
    1368:	0141                	add	sp,sp,16
    136a:	8082                	ret

000000000000136c <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    136c:	7131                	add	sp,sp,-192
    136e:	e4d6                	sd	s5,72(sp)
    1370:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    1372:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1374:	013c                	add	a5,sp,136
{
    1376:	f0ca                	sd	s2,96(sp)
    1378:	ecce                	sd	s3,88(sp)
    137a:	e8d2                	sd	s4,80(sp)
    137c:	e0da                	sd	s6,64(sp)
    137e:	fc5e                	sd	s7,56(sp)
    1380:	fc86                	sd	ra,120(sp)
    1382:	f8a2                	sd	s0,112(sp)
    1384:	f4a6                	sd	s1,104(sp)
    1386:	e52e                	sd	a1,136(sp)
    1388:	e932                	sd	a2,144(sp)
    138a:	ed36                	sd	a3,152(sp)
    138c:	f13a                	sd	a4,160(sp)
    138e:	f942                	sd	a6,176(sp)
    1390:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1392:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1394:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1398:	07300a13          	li	s4,115
    139c:	07800b93          	li	s7,120
    13a0:	06400b13          	li	s6,100
    buf[i++] = '0';
    13a4:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x5760>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13a8:	00001997          	auipc	s3,0x1
    13ac:	d2898993          	add	s3,s3,-728 # 20d0 <digits>
        if (!*s)
    13b0:	00054783          	lbu	a5,0(a0)
    13b4:	16078863          	beqz	a5,1524 <printf+0x1b8>
    13b8:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13ba:	19278063          	beq	a5,s2,153a <printf+0x1ce>
    13be:	00164783          	lbu	a5,1(a2)
    13c2:	0605                	add	a2,a2,1
    13c4:	fbfd                	bnez	a5,13ba <printf+0x4e>
    13c6:	84b2                	mv	s1,a2
        l = z - a;
    13c8:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13cc:	85aa                	mv	a1,a0
    13ce:	8622                	mv	a2,s0
    13d0:	4505                	li	a0,1
    13d2:	12b000ef          	jal	1cfc <write>
        if (l)
    13d6:	18041763          	bnez	s0,1564 <printf+0x1f8>
        if (s[1] == 0)
    13da:	0014c783          	lbu	a5,1(s1)
    13de:	14078363          	beqz	a5,1524 <printf+0x1b8>
        switch (s[1])
    13e2:	19478f63          	beq	a5,s4,1580 <printf+0x214>
    13e6:	18fa6163          	bltu	s4,a5,1568 <printf+0x1fc>
    13ea:	1b678e63          	beq	a5,s6,15a6 <printf+0x23a>
    13ee:	07000713          	li	a4,112
    13f2:	1ce79463          	bne	a5,a4,15ba <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13f6:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13f8:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13fc:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13fe:	631c                	ld	a5,0(a4)
    1400:	0721                	add	a4,a4,8
    1402:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1404:	00479293          	sll	t0,a5,0x4
    1408:	00879f93          	sll	t6,a5,0x8
    140c:	00c79f13          	sll	t5,a5,0xc
    1410:	01079e93          	sll	t4,a5,0x10
    1414:	01479e13          	sll	t3,a5,0x14
    1418:	01879313          	sll	t1,a5,0x18
    141c:	01c79893          	sll	a7,a5,0x1c
    1420:	02479813          	sll	a6,a5,0x24
    1424:	02879513          	sll	a0,a5,0x28
    1428:	02c79593          	sll	a1,a5,0x2c
    142c:	03079693          	sll	a3,a5,0x30
    1430:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1434:	03c7d413          	srl	s0,a5,0x3c
    1438:	01c7d39b          	srlw	t2,a5,0x1c
    143c:	03c2d293          	srl	t0,t0,0x3c
    1440:	03cfdf93          	srl	t6,t6,0x3c
    1444:	03cf5f13          	srl	t5,t5,0x3c
    1448:	03cede93          	srl	t4,t4,0x3c
    144c:	03ce5e13          	srl	t3,t3,0x3c
    1450:	03c35313          	srl	t1,t1,0x3c
    1454:	03c8d893          	srl	a7,a7,0x3c
    1458:	03c85813          	srl	a6,a6,0x3c
    145c:	9171                	srl	a0,a0,0x3c
    145e:	91f1                	srl	a1,a1,0x3c
    1460:	92f1                	srl	a3,a3,0x3c
    1462:	9371                	srl	a4,a4,0x3c
    1464:	974e                	add	a4,a4,s3
    1466:	944e                	add	s0,s0,s3
    1468:	92ce                	add	t0,t0,s3
    146a:	9fce                	add	t6,t6,s3
    146c:	9f4e                	add	t5,t5,s3
    146e:	9ece                	add	t4,t4,s3
    1470:	9e4e                	add	t3,t3,s3
    1472:	934e                	add	t1,t1,s3
    1474:	98ce                	add	a7,a7,s3
    1476:	93ce                	add	t2,t2,s3
    1478:	984e                	add	a6,a6,s3
    147a:	954e                	add	a0,a0,s3
    147c:	95ce                	add	a1,a1,s3
    147e:	96ce                	add	a3,a3,s3
    1480:	00074083          	lbu	ra,0(a4)
    1484:	0002c283          	lbu	t0,0(t0)
    1488:	000fcf83          	lbu	t6,0(t6)
    148c:	000f4f03          	lbu	t5,0(t5)
    1490:	000ece83          	lbu	t4,0(t4)
    1494:	000e4e03          	lbu	t3,0(t3)
    1498:	00034303          	lbu	t1,0(t1)
    149c:	0008c883          	lbu	a7,0(a7)
    14a0:	0003c383          	lbu	t2,0(t2)
    14a4:	00084803          	lbu	a6,0(a6)
    14a8:	00054503          	lbu	a0,0(a0)
    14ac:	0005c583          	lbu	a1,0(a1)
    14b0:	0006c683          	lbu	a3,0(a3)
    14b4:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14b8:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14bc:	9371                	srl	a4,a4,0x3c
    14be:	8bbd                	and	a5,a5,15
    14c0:	974e                	add	a4,a4,s3
    14c2:	97ce                	add	a5,a5,s3
    14c4:	005105a3          	sb	t0,11(sp)
    14c8:	01f10623          	sb	t6,12(sp)
    14cc:	01e106a3          	sb	t5,13(sp)
    14d0:	01d10723          	sb	t4,14(sp)
    14d4:	01c107a3          	sb	t3,15(sp)
    14d8:	00610823          	sb	t1,16(sp)
    14dc:	011108a3          	sb	a7,17(sp)
    14e0:	00710923          	sb	t2,18(sp)
    14e4:	010109a3          	sb	a6,19(sp)
    14e8:	00a10a23          	sb	a0,20(sp)
    14ec:	00b10aa3          	sb	a1,21(sp)
    14f0:	00d10b23          	sb	a3,22(sp)
    14f4:	00110ba3          	sb	ra,23(sp)
    14f8:	00810523          	sb	s0,10(sp)
    14fc:	00074703          	lbu	a4,0(a4)
    1500:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1504:	002c                	add	a1,sp,8
    1506:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1508:	00e10c23          	sb	a4,24(sp)
    150c:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1510:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1514:	7e8000ef          	jal	1cfc <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1518:	00248513          	add	a0,s1,2
        if (!*s)
    151c:	00054783          	lbu	a5,0(a0)
    1520:	e8079ce3          	bnez	a5,13b8 <printf+0x4c>
    }
    va_end(ap);
}
    1524:	70e6                	ld	ra,120(sp)
    1526:	7446                	ld	s0,112(sp)
    1528:	74a6                	ld	s1,104(sp)
    152a:	7906                	ld	s2,96(sp)
    152c:	69e6                	ld	s3,88(sp)
    152e:	6a46                	ld	s4,80(sp)
    1530:	6aa6                	ld	s5,72(sp)
    1532:	6b06                	ld	s6,64(sp)
    1534:	7be2                	ld	s7,56(sp)
    1536:	6129                	add	sp,sp,192
    1538:	8082                	ret
    153a:	84b2                	mv	s1,a2
    153c:	a039                	j	154a <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    153e:	0024c783          	lbu	a5,2(s1)
    1542:	0605                	add	a2,a2,1
    1544:	0489                	add	s1,s1,2
    1546:	e92791e3          	bne	a5,s2,13c8 <printf+0x5c>
    154a:	0014c783          	lbu	a5,1(s1)
    154e:	ff2788e3          	beq	a5,s2,153e <printf+0x1d2>
        l = z - a;
    1552:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1556:	85aa                	mv	a1,a0
    1558:	8622                	mv	a2,s0
    155a:	4505                	li	a0,1
    155c:	7a0000ef          	jal	1cfc <write>
        if (l)
    1560:	e6040de3          	beqz	s0,13da <printf+0x6e>
    1564:	8526                	mv	a0,s1
    1566:	b5a9                	j	13b0 <printf+0x44>
        switch (s[1])
    1568:	05779963          	bne	a5,s7,15ba <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    156c:	6782                	ld	a5,0(sp)
    156e:	45c1                	li	a1,16
    1570:	4388                	lw	a0,0(a5)
    1572:	07a1                	add	a5,a5,8
    1574:	e03e                	sd	a5,0(sp)
    1576:	bb7ff0ef          	jal	112c <printint.constprop.0>
        s += 2;
    157a:	00248513          	add	a0,s1,2
    157e:	bf79                	j	151c <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    1580:	6782                	ld	a5,0(sp)
    1582:	6380                	ld	s0,0(a5)
    1584:	07a1                	add	a5,a5,8
    1586:	e03e                	sd	a5,0(sp)
    1588:	cc21                	beqz	s0,15e0 <printf+0x274>
            l = strnlen(a, 200);
    158a:	0c800593          	li	a1,200
    158e:	8522                	mv	a0,s0
    1590:	460000ef          	jal	19f0 <strnlen>
    write(f, s, l);
    1594:	0005061b          	sext.w	a2,a0
    1598:	85a2                	mv	a1,s0
    159a:	4505                	li	a0,1
    159c:	760000ef          	jal	1cfc <write>
        s += 2;
    15a0:	00248513          	add	a0,s1,2
    15a4:	bfa5                	j	151c <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    15a6:	6782                	ld	a5,0(sp)
    15a8:	45a9                	li	a1,10
    15aa:	4388                	lw	a0,0(a5)
    15ac:	07a1                	add	a5,a5,8
    15ae:	e03e                	sd	a5,0(sp)
    15b0:	b7dff0ef          	jal	112c <printint.constprop.0>
        s += 2;
    15b4:	00248513          	add	a0,s1,2
    15b8:	b795                	j	151c <printf+0x1b0>
    return write(stdout, &byte, 1);
    15ba:	4605                	li	a2,1
    15bc:	002c                	add	a1,sp,8
    15be:	4505                	li	a0,1
    char byte = c;
    15c0:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15c4:	738000ef          	jal	1cfc <write>
    char byte = c;
    15c8:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15cc:	4605                	li	a2,1
    15ce:	002c                	add	a1,sp,8
    15d0:	4505                	li	a0,1
    char byte = c;
    15d2:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15d6:	726000ef          	jal	1cfc <write>
        s += 2;
    15da:	00248513          	add	a0,s1,2
    15de:	bf3d                	j	151c <printf+0x1b0>
                a = "(null)";
    15e0:	00001417          	auipc	s0,0x1
    15e4:	a5840413          	add	s0,s0,-1448 # 2038 <__clone+0x104>
    15e8:	b74d                	j	158a <printf+0x21e>

00000000000015ea <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15ea:	1141                	add	sp,sp,-16
    15ec:	e406                	sd	ra,8(sp)
    puts(m);
    15ee:	d5dff0ef          	jal	134a <puts>
    exit(-100);
}
    15f2:	60a2                	ld	ra,8(sp)
    exit(-100);
    15f4:	f9c00513          	li	a0,-100
}
    15f8:	0141                	add	sp,sp,16
    exit(-100);
    15fa:	af89                	j	1d4c <exit>

00000000000015fc <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15fc:	02000793          	li	a5,32
    1600:	00f50663          	beq	a0,a5,160c <isspace+0x10>
    1604:	355d                	addw	a0,a0,-9
    1606:	00553513          	sltiu	a0,a0,5
    160a:	8082                	ret
    160c:	4505                	li	a0,1
}
    160e:	8082                	ret

0000000000001610 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1610:	fd05051b          	addw	a0,a0,-48
}
    1614:	00a53513          	sltiu	a0,a0,10
    1618:	8082                	ret

000000000000161a <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    161a:	02000713          	li	a4,32
    161e:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1620:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1624:	ff76879b          	addw	a5,a3,-9
    1628:	06e68063          	beq	a3,a4,1688 <atoi+0x6e>
    162c:	0006859b          	sext.w	a1,a3
    1630:	04f67c63          	bgeu	a2,a5,1688 <atoi+0x6e>
        s++;
    switch (*s)
    1634:	02b00793          	li	a5,43
    1638:	06f68563          	beq	a3,a5,16a2 <atoi+0x88>
    163c:	02d00793          	li	a5,45
    1640:	04f69663          	bne	a3,a5,168c <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1644:	00154683          	lbu	a3,1(a0)
    1648:	47a5                	li	a5,9
        s++;
    164a:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    164e:	fd06869b          	addw	a3,a3,-48
    1652:	8636                	mv	a2,a3
    while (isdigit(*s))
    1654:	04d7e563          	bltu	a5,a3,169e <atoi+0x84>
        neg = 1;
    1658:	4885                	li	a7,1
    int n = 0, neg = 0;
    165a:	4501                	li	a0,0
    while (isdigit(*s))
    165c:	4825                	li	a6,9
    165e:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1662:	0025179b          	sllw	a5,a0,0x2
    1666:	9fa9                	addw	a5,a5,a0
    1668:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    166c:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    1670:	85b2                	mv	a1,a2
    1672:	40c7853b          	subw	a0,a5,a2
    1676:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    1678:	8636                	mv	a2,a3
    while (isdigit(*s))
    167a:	fed872e3          	bgeu	a6,a3,165e <atoi+0x44>
    return neg ? n : -n;
    167e:	02089163          	bnez	a7,16a0 <atoi+0x86>
    1682:	40f5853b          	subw	a0,a1,a5
    1686:	8082                	ret
        s++;
    1688:	0505                	add	a0,a0,1
    168a:	bf59                	j	1620 <atoi+0x6>
    while (isdigit(*s))
    168c:	fd05859b          	addw	a1,a1,-48
    1690:	47a5                	li	a5,9
    1692:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1694:	4881                	li	a7,0
    1696:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    169a:	fcb7f0e3          	bgeu	a5,a1,165a <atoi+0x40>
    return neg ? n : -n;
    169e:	4501                	li	a0,0
}
    16a0:	8082                	ret
    while (isdigit(*s))
    16a2:	00154683          	lbu	a3,1(a0)
    16a6:	47a5                	li	a5,9
        s++;
    16a8:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    16ac:	fd06869b          	addw	a3,a3,-48
    16b0:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    16b2:	4881                	li	a7,0
    while (isdigit(*s))
    16b4:	fad7f3e3          	bgeu	a5,a3,165a <atoi+0x40>
    return neg ? n : -n;
    16b8:	4501                	li	a0,0
    16ba:	8082                	ret

00000000000016bc <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16bc:	16060f63          	beqz	a2,183a <memset+0x17e>
    16c0:	40a006b3          	neg	a3,a0
    16c4:	0076f793          	and	a5,a3,7
    16c8:	00778813          	add	a6,a5,7
    16cc:	48ad                	li	a7,11
    16ce:	0ff5f713          	zext.b	a4,a1
    16d2:	fff60593          	add	a1,a2,-1
    16d6:	17186363          	bltu	a6,a7,183c <memset+0x180>
    16da:	1705eb63          	bltu	a1,a6,1850 <memset+0x194>
    16de:	16078163          	beqz	a5,1840 <memset+0x184>
    16e2:	00e50023          	sb	a4,0(a0)
    16e6:	0066f593          	and	a1,a3,6
    16ea:	14058e63          	beqz	a1,1846 <memset+0x18a>
    16ee:	00e500a3          	sb	a4,1(a0)
    16f2:	4589                	li	a1,2
    16f4:	00250813          	add	a6,a0,2
    16f8:	04f5f663          	bgeu	a1,a5,1744 <memset+0x88>
    16fc:	00e50123          	sb	a4,2(a0)
    1700:	8a91                	and	a3,a3,4
    1702:	00350813          	add	a6,a0,3
    1706:	458d                	li	a1,3
    1708:	ce95                	beqz	a3,1744 <memset+0x88>
    170a:	00e501a3          	sb	a4,3(a0)
    170e:	4691                	li	a3,4
    1710:	00450813          	add	a6,a0,4
    1714:	4591                	li	a1,4
    1716:	02f6f763          	bgeu	a3,a5,1744 <memset+0x88>
    171a:	00e50223          	sb	a4,4(a0)
    171e:	4695                	li	a3,5
    1720:	00550813          	add	a6,a0,5
    1724:	4595                	li	a1,5
    1726:	00d78f63          	beq	a5,a3,1744 <memset+0x88>
    172a:	00e502a3          	sb	a4,5(a0)
    172e:	469d                	li	a3,7
    1730:	00650813          	add	a6,a0,6
    1734:	4599                	li	a1,6
    1736:	00d79763          	bne	a5,a3,1744 <memset+0x88>
    173a:	00750813          	add	a6,a0,7
    173e:	00e50323          	sb	a4,6(a0)
    1742:	459d                	li	a1,7
    1744:	00871693          	sll	a3,a4,0x8
    1748:	01071313          	sll	t1,a4,0x10
    174c:	8ed9                	or	a3,a3,a4
    174e:	01871893          	sll	a7,a4,0x18
    1752:	0066e6b3          	or	a3,a3,t1
    1756:	0116e6b3          	or	a3,a3,a7
    175a:	02071313          	sll	t1,a4,0x20
    175e:	02871893          	sll	a7,a4,0x28
    1762:	0066e6b3          	or	a3,a3,t1
    1766:	40f60e33          	sub	t3,a2,a5
    176a:	03071313          	sll	t1,a4,0x30
    176e:	0116e6b3          	or	a3,a3,a7
    1772:	0066e6b3          	or	a3,a3,t1
    1776:	03871893          	sll	a7,a4,0x38
    177a:	97aa                	add	a5,a5,a0
    177c:	ff8e7313          	and	t1,t3,-8
    1780:	0116e6b3          	or	a3,a3,a7
    1784:	00f308b3          	add	a7,t1,a5
    1788:	e394                	sd	a3,0(a5)
    178a:	07a1                	add	a5,a5,8
    178c:	ff179ee3          	bne	a5,a7,1788 <memset+0xcc>
    1790:	006806b3          	add	a3,a6,t1
    1794:	00b307bb          	addw	a5,t1,a1
    1798:	0bc30b63          	beq	t1,t3,184e <memset+0x192>
    179c:	00e68023          	sb	a4,0(a3)
    17a0:	0017859b          	addw	a1,a5,1
    17a4:	08c5fb63          	bgeu	a1,a2,183a <memset+0x17e>
    17a8:	00e680a3          	sb	a4,1(a3)
    17ac:	0027859b          	addw	a1,a5,2
    17b0:	08c5f563          	bgeu	a1,a2,183a <memset+0x17e>
    17b4:	00e68123          	sb	a4,2(a3)
    17b8:	0037859b          	addw	a1,a5,3
    17bc:	06c5ff63          	bgeu	a1,a2,183a <memset+0x17e>
    17c0:	00e681a3          	sb	a4,3(a3)
    17c4:	0047859b          	addw	a1,a5,4
    17c8:	06c5f963          	bgeu	a1,a2,183a <memset+0x17e>
    17cc:	00e68223          	sb	a4,4(a3)
    17d0:	0057859b          	addw	a1,a5,5
    17d4:	06c5f363          	bgeu	a1,a2,183a <memset+0x17e>
    17d8:	00e682a3          	sb	a4,5(a3)
    17dc:	0067859b          	addw	a1,a5,6
    17e0:	04c5fd63          	bgeu	a1,a2,183a <memset+0x17e>
    17e4:	00e68323          	sb	a4,6(a3)
    17e8:	0077859b          	addw	a1,a5,7
    17ec:	04c5f763          	bgeu	a1,a2,183a <memset+0x17e>
    17f0:	00e683a3          	sb	a4,7(a3)
    17f4:	0087859b          	addw	a1,a5,8
    17f8:	04c5f163          	bgeu	a1,a2,183a <memset+0x17e>
    17fc:	00e68423          	sb	a4,8(a3)
    1800:	0097859b          	addw	a1,a5,9
    1804:	02c5fb63          	bgeu	a1,a2,183a <memset+0x17e>
    1808:	00e684a3          	sb	a4,9(a3)
    180c:	00a7859b          	addw	a1,a5,10
    1810:	02c5f563          	bgeu	a1,a2,183a <memset+0x17e>
    1814:	00e68523          	sb	a4,10(a3)
    1818:	00b7859b          	addw	a1,a5,11
    181c:	00c5ff63          	bgeu	a1,a2,183a <memset+0x17e>
    1820:	00e685a3          	sb	a4,11(a3)
    1824:	00c7859b          	addw	a1,a5,12
    1828:	00c5f963          	bgeu	a1,a2,183a <memset+0x17e>
    182c:	00e68623          	sb	a4,12(a3)
    1830:	27b5                	addw	a5,a5,13
    1832:	00c7f463          	bgeu	a5,a2,183a <memset+0x17e>
    1836:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    183a:	8082                	ret
    183c:	482d                	li	a6,11
    183e:	bd71                	j	16da <memset+0x1e>
    char *p = dest;
    1840:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1842:	4581                	li	a1,0
    1844:	b701                	j	1744 <memset+0x88>
    1846:	00150813          	add	a6,a0,1
    184a:	4585                	li	a1,1
    184c:	bde5                	j	1744 <memset+0x88>
    184e:	8082                	ret
    char *p = dest;
    1850:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1852:	4781                	li	a5,0
    1854:	b7a1                	j	179c <memset+0xe0>

0000000000001856 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1856:	00054783          	lbu	a5,0(a0)
    185a:	0005c703          	lbu	a4,0(a1)
    185e:	00e79863          	bne	a5,a4,186e <strcmp+0x18>
    1862:	0505                	add	a0,a0,1
    1864:	0585                	add	a1,a1,1
    1866:	fbe5                	bnez	a5,1856 <strcmp>
    1868:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    186a:	9d19                	subw	a0,a0,a4
    186c:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    186e:	0007851b          	sext.w	a0,a5
    1872:	bfe5                	j	186a <strcmp+0x14>

0000000000001874 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1874:	ca15                	beqz	a2,18a8 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1876:	00054783          	lbu	a5,0(a0)
    if (!n--)
    187a:	167d                	add	a2,a2,-1
    187c:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1880:	eb99                	bnez	a5,1896 <strncmp+0x22>
    1882:	a815                	j	18b6 <strncmp+0x42>
    1884:	00a68e63          	beq	a3,a0,18a0 <strncmp+0x2c>
    1888:	0505                	add	a0,a0,1
    188a:	00f71b63          	bne	a4,a5,18a0 <strncmp+0x2c>
    188e:	00054783          	lbu	a5,0(a0)
    1892:	cf89                	beqz	a5,18ac <strncmp+0x38>
    1894:	85b2                	mv	a1,a2
    1896:	0005c703          	lbu	a4,0(a1)
    189a:	00158613          	add	a2,a1,1
    189e:	f37d                	bnez	a4,1884 <strncmp+0x10>
        ;
    return *l - *r;
    18a0:	0007851b          	sext.w	a0,a5
    18a4:	9d19                	subw	a0,a0,a4
    18a6:	8082                	ret
        return 0;
    18a8:	4501                	li	a0,0
}
    18aa:	8082                	ret
    return *l - *r;
    18ac:	0015c703          	lbu	a4,1(a1)
    18b0:	4501                	li	a0,0
    18b2:	9d19                	subw	a0,a0,a4
    18b4:	8082                	ret
    18b6:	0005c703          	lbu	a4,0(a1)
    18ba:	4501                	li	a0,0
    18bc:	b7e5                	j	18a4 <strncmp+0x30>

00000000000018be <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18be:	00757793          	and	a5,a0,7
    18c2:	cf89                	beqz	a5,18dc <strlen+0x1e>
    18c4:	87aa                	mv	a5,a0
    18c6:	a029                	j	18d0 <strlen+0x12>
    18c8:	0785                	add	a5,a5,1
    18ca:	0077f713          	and	a4,a5,7
    18ce:	cb01                	beqz	a4,18de <strlen+0x20>
        if (!*s)
    18d0:	0007c703          	lbu	a4,0(a5)
    18d4:	fb75                	bnez	a4,18c8 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18d6:	40a78533          	sub	a0,a5,a0
}
    18da:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18dc:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18de:	feff05b7          	lui	a1,0xfeff0
    18e2:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefede2f>
    18e6:	f0101637          	lui	a2,0xf0101
    18ea:	05c2                	sll	a1,a1,0x10
    18ec:	0612                	sll	a2,a2,0x4
    18ee:	6394                	ld	a3,0(a5)
    18f0:	eff58593          	add	a1,a1,-257
    18f4:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff031>
    18f8:	05c2                	sll	a1,a1,0x10
    18fa:	0642                	sll	a2,a2,0x10
    18fc:	eff58593          	add	a1,a1,-257
    1900:	10160613          	add	a2,a2,257
    1904:	00b68733          	add	a4,a3,a1
    1908:	063e                	sll	a2,a2,0xf
    190a:	fff6c693          	not	a3,a3
    190e:	8f75                	and	a4,a4,a3
    1910:	08060613          	add	a2,a2,128
    1914:	8f71                	and	a4,a4,a2
    1916:	eb11                	bnez	a4,192a <strlen+0x6c>
    1918:	6794                	ld	a3,8(a5)
    191a:	07a1                	add	a5,a5,8
    191c:	00b68733          	add	a4,a3,a1
    1920:	fff6c693          	not	a3,a3
    1924:	8f75                	and	a4,a4,a3
    1926:	8f71                	and	a4,a4,a2
    1928:	db65                	beqz	a4,1918 <strlen+0x5a>
    for (; *s; s++)
    192a:	0007c703          	lbu	a4,0(a5)
    192e:	d745                	beqz	a4,18d6 <strlen+0x18>
    1930:	0017c703          	lbu	a4,1(a5)
    1934:	0785                	add	a5,a5,1
    1936:	d345                	beqz	a4,18d6 <strlen+0x18>
    1938:	0017c703          	lbu	a4,1(a5)
    193c:	0785                	add	a5,a5,1
    193e:	fb6d                	bnez	a4,1930 <strlen+0x72>
    1940:	bf59                	j	18d6 <strlen+0x18>

0000000000001942 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1942:	00757713          	and	a4,a0,7
{
    1946:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1948:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    194c:	cb19                	beqz	a4,1962 <memchr+0x20>
    194e:	ce59                	beqz	a2,19ec <memchr+0xaa>
    1950:	0007c703          	lbu	a4,0(a5)
    1954:	00b70963          	beq	a4,a1,1966 <memchr+0x24>
    1958:	0785                	add	a5,a5,1
    195a:	0077f713          	and	a4,a5,7
    195e:	167d                	add	a2,a2,-1
    1960:	f77d                	bnez	a4,194e <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1962:	4501                	li	a0,0
    if (n && *s != c)
    1964:	c649                	beqz	a2,19ee <memchr+0xac>
    1966:	0007c703          	lbu	a4,0(a5)
    196a:	06b70663          	beq	a4,a1,19d6 <memchr+0x94>
        size_t k = ONES * c;
    196e:	01010737          	lui	a4,0x1010
    1972:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e031>
    1976:	0742                	sll	a4,a4,0x10
    1978:	10170713          	add	a4,a4,257
    197c:	0742                	sll	a4,a4,0x10
    197e:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1982:	469d                	li	a3,7
        size_t k = ONES * c;
    1984:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1988:	04c6f763          	bgeu	a3,a2,19d6 <memchr+0x94>
    198c:	f0101837          	lui	a6,0xf0101
    1990:	feff08b7          	lui	a7,0xfeff0
    1994:	0812                	sll	a6,a6,0x4
    1996:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefede2f>
    199a:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff031>
    199e:	08c2                	sll	a7,a7,0x10
    19a0:	0842                	sll	a6,a6,0x10
    19a2:	eff88893          	add	a7,a7,-257
    19a6:	10180813          	add	a6,a6,257
    19aa:	08c2                	sll	a7,a7,0x10
    19ac:	083e                	sll	a6,a6,0xf
    19ae:	eff88893          	add	a7,a7,-257
    19b2:	08080813          	add	a6,a6,128
    19b6:	431d                	li	t1,7
    19b8:	a029                	j	19c2 <memchr+0x80>
    19ba:	1661                	add	a2,a2,-8
    19bc:	07a1                	add	a5,a5,8
    19be:	02c37663          	bgeu	t1,a2,19ea <memchr+0xa8>
    19c2:	6398                	ld	a4,0(a5)
    19c4:	8f29                	xor	a4,a4,a0
    19c6:	011706b3          	add	a3,a4,a7
    19ca:	fff74713          	not	a4,a4
    19ce:	8f75                	and	a4,a4,a3
    19d0:	01077733          	and	a4,a4,a6
    19d4:	d37d                	beqz	a4,19ba <memchr+0x78>
        s = (const void *)w;
    19d6:	853e                	mv	a0,a5
    19d8:	a019                	j	19de <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    19da:	0505                	add	a0,a0,1
    19dc:	ca01                	beqz	a2,19ec <memchr+0xaa>
    19de:	00054783          	lbu	a5,0(a0)
    19e2:	167d                	add	a2,a2,-1
    19e4:	feb79be3          	bne	a5,a1,19da <memchr+0x98>
    19e8:	8082                	ret
    19ea:	f675                	bnez	a2,19d6 <memchr+0x94>
    return n ? (void *)s : 0;
    19ec:	4501                	li	a0,0
}
    19ee:	8082                	ret

00000000000019f0 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19f0:	1101                	add	sp,sp,-32
    19f2:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19f4:	862e                	mv	a2,a1
{
    19f6:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19f8:	4581                	li	a1,0
{
    19fa:	e426                	sd	s1,8(sp)
    19fc:	ec06                	sd	ra,24(sp)
    19fe:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1a00:	f43ff0ef          	jal	1942 <memchr>
    return p ? p - s : n;
    1a04:	c519                	beqz	a0,1a12 <strnlen+0x22>
}
    1a06:	60e2                	ld	ra,24(sp)
    1a08:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1a0a:	8d05                	sub	a0,a0,s1
}
    1a0c:	64a2                	ld	s1,8(sp)
    1a0e:	6105                	add	sp,sp,32
    1a10:	8082                	ret
    1a12:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1a14:	8522                	mv	a0,s0
}
    1a16:	6442                	ld	s0,16(sp)
    1a18:	64a2                	ld	s1,8(sp)
    1a1a:	6105                	add	sp,sp,32
    1a1c:	8082                	ret

0000000000001a1e <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a1e:	00b547b3          	xor	a5,a0,a1
    1a22:	8b9d                	and	a5,a5,7
    1a24:	efb1                	bnez	a5,1a80 <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a26:	0075f793          	and	a5,a1,7
    1a2a:	ebb5                	bnez	a5,1a9e <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a2c:	feff0637          	lui	a2,0xfeff0
    1a30:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefede2f>
    1a34:	f01016b7          	lui	a3,0xf0101
    1a38:	0642                	sll	a2,a2,0x10
    1a3a:	0692                	sll	a3,a3,0x4
    1a3c:	6198                	ld	a4,0(a1)
    1a3e:	eff60613          	add	a2,a2,-257
    1a42:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff031>
    1a46:	0642                	sll	a2,a2,0x10
    1a48:	06c2                	sll	a3,a3,0x10
    1a4a:	eff60613          	add	a2,a2,-257
    1a4e:	10168693          	add	a3,a3,257
    1a52:	00c707b3          	add	a5,a4,a2
    1a56:	fff74813          	not	a6,a4
    1a5a:	06be                	sll	a3,a3,0xf
    1a5c:	0107f7b3          	and	a5,a5,a6
    1a60:	08068693          	add	a3,a3,128
    1a64:	8ff5                	and	a5,a5,a3
    1a66:	ef89                	bnez	a5,1a80 <strcpy+0x62>
    1a68:	05a1                	add	a1,a1,8
    1a6a:	e118                	sd	a4,0(a0)
    1a6c:	6198                	ld	a4,0(a1)
    1a6e:	0521                	add	a0,a0,8
    1a70:	00c707b3          	add	a5,a4,a2
    1a74:	fff74813          	not	a6,a4
    1a78:	0107f7b3          	and	a5,a5,a6
    1a7c:	8ff5                	and	a5,a5,a3
    1a7e:	d7ed                	beqz	a5,1a68 <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a80:	0005c783          	lbu	a5,0(a1)
    1a84:	00f50023          	sb	a5,0(a0)
    1a88:	c785                	beqz	a5,1ab0 <strcpy+0x92>
    1a8a:	0015c783          	lbu	a5,1(a1)
    1a8e:	0505                	add	a0,a0,1
    1a90:	0585                	add	a1,a1,1
    1a92:	00f50023          	sb	a5,0(a0)
    1a96:	fbf5                	bnez	a5,1a8a <strcpy+0x6c>
        ;
    return d;
}
    1a98:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a9a:	0505                	add	a0,a0,1
    1a9c:	db41                	beqz	a4,1a2c <strcpy+0xe>
            if (!(*d = *s))
    1a9e:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1aa2:	0585                	add	a1,a1,1
    1aa4:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1aa8:	00f50023          	sb	a5,0(a0)
    1aac:	f7fd                	bnez	a5,1a9a <strcpy+0x7c>
}
    1aae:	8082                	ret
    1ab0:	8082                	ret

0000000000001ab2 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1ab2:	00b547b3          	xor	a5,a0,a1
    1ab6:	8b9d                	and	a5,a5,7
    1ab8:	efbd                	bnez	a5,1b36 <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1aba:	0075f793          	and	a5,a1,7
    1abe:	1c078563          	beqz	a5,1c88 <strncpy+0x1d6>
    1ac2:	ea11                	bnez	a2,1ad6 <strncpy+0x24>
    1ac4:	8082                	ret
    1ac6:	0585                	add	a1,a1,1
    1ac8:	0075f793          	and	a5,a1,7
    1acc:	167d                	add	a2,a2,-1
    1ace:	0505                	add	a0,a0,1
    1ad0:	1a078c63          	beqz	a5,1c88 <strncpy+0x1d6>
    1ad4:	ca3d                	beqz	a2,1b4a <strncpy+0x98>
    1ad6:	0005c783          	lbu	a5,0(a1)
    1ada:	00f50023          	sb	a5,0(a0)
    1ade:	f7e5                	bnez	a5,1ac6 <strncpy+0x14>
            ;
        if (!n || !*s)
    1ae0:	0005c783          	lbu	a5,0(a1)
    1ae4:	c7a5                	beqz	a5,1b4c <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ae6:	479d                	li	a5,7
    1ae8:	04c7f863          	bgeu	a5,a2,1b38 <strncpy+0x86>
    1aec:	f01016b7          	lui	a3,0xf0101
    1af0:	feff0837          	lui	a6,0xfeff0
    1af4:	0692                	sll	a3,a3,0x4
    1af6:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefede2f>
    1afa:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff031>
    1afe:	0842                	sll	a6,a6,0x10
    1b00:	06c2                	sll	a3,a3,0x10
    1b02:	eff80813          	add	a6,a6,-257
    1b06:	10168693          	add	a3,a3,257
    1b0a:	0842                	sll	a6,a6,0x10
    1b0c:	06be                	sll	a3,a3,0xf
    1b0e:	eff80813          	add	a6,a6,-257
    1b12:	08068693          	add	a3,a3,128
    1b16:	431d                	li	t1,7
    1b18:	6198                	ld	a4,0(a1)
    1b1a:	010707b3          	add	a5,a4,a6
    1b1e:	fff74893          	not	a7,a4
    1b22:	0117f7b3          	and	a5,a5,a7
    1b26:	8ff5                	and	a5,a5,a3
    1b28:	eb81                	bnez	a5,1b38 <strncpy+0x86>
            *wd = *ws;
    1b2a:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b2c:	1661                	add	a2,a2,-8
    1b2e:	05a1                	add	a1,a1,8
    1b30:	0521                	add	a0,a0,8
    1b32:	fec363e3          	bltu	t1,a2,1b18 <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b36:	ca11                	beqz	a2,1b4a <strncpy+0x98>
    1b38:	0005c783          	lbu	a5,0(a1)
    1b3c:	0585                	add	a1,a1,1
    1b3e:	00f50023          	sb	a5,0(a0)
    1b42:	c789                	beqz	a5,1b4c <strncpy+0x9a>
    1b44:	167d                	add	a2,a2,-1
    1b46:	0505                	add	a0,a0,1
    1b48:	fa65                	bnez	a2,1b38 <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b4a:	8082                	ret
    1b4c:	40a00733          	neg	a4,a0
    1b50:	00777793          	and	a5,a4,7
    1b54:	00778693          	add	a3,a5,7
    1b58:	482d                	li	a6,11
    1b5a:	fff60593          	add	a1,a2,-1
    1b5e:	1106ef63          	bltu	a3,a6,1c7c <strncpy+0x1ca>
    1b62:	12d5ee63          	bltu	a1,a3,1c9e <strncpy+0x1ec>
    1b66:	12078563          	beqz	a5,1c90 <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b6a:	00050023          	sb	zero,0(a0)
    1b6e:	00677693          	and	a3,a4,6
    1b72:	12068263          	beqz	a3,1c96 <strncpy+0x1e4>
    1b76:	000500a3          	sb	zero,1(a0)
    1b7a:	4689                	li	a3,2
    1b7c:	12f6f463          	bgeu	a3,a5,1ca4 <strncpy+0x1f2>
    1b80:	00050123          	sb	zero,2(a0)
    1b84:	8b11                	and	a4,a4,4
    1b86:	cf6d                	beqz	a4,1c80 <strncpy+0x1ce>
    1b88:	000501a3          	sb	zero,3(a0)
    1b8c:	4711                	li	a4,4
    1b8e:	00450693          	add	a3,a0,4
    1b92:	02f77363          	bgeu	a4,a5,1bb8 <strncpy+0x106>
    1b96:	00050223          	sb	zero,4(a0)
    1b9a:	4715                	li	a4,5
    1b9c:	00550693          	add	a3,a0,5
    1ba0:	00e78c63          	beq	a5,a4,1bb8 <strncpy+0x106>
    1ba4:	000502a3          	sb	zero,5(a0)
    1ba8:	471d                	li	a4,7
    1baa:	10e79163          	bne	a5,a4,1cac <strncpy+0x1fa>
    1bae:	00750693          	add	a3,a0,7
    1bb2:	00050323          	sb	zero,6(a0)
    1bb6:	471d                	li	a4,7
    1bb8:	40f608b3          	sub	a7,a2,a5
    1bbc:	ff88f813          	and	a6,a7,-8
    1bc0:	97aa                	add	a5,a5,a0
    1bc2:	010785b3          	add	a1,a5,a6
    1bc6:	0007b023          	sd	zero,0(a5)
    1bca:	07a1                	add	a5,a5,8
    1bcc:	feb79de3          	bne	a5,a1,1bc6 <strncpy+0x114>
    1bd0:	00e807bb          	addw	a5,a6,a4
    1bd4:	01068733          	add	a4,a3,a6
    1bd8:	0b088b63          	beq	a7,a6,1c8e <strncpy+0x1dc>
    1bdc:	00070023          	sb	zero,0(a4)
    1be0:	0017869b          	addw	a3,a5,1
    1be4:	f6c6f3e3          	bgeu	a3,a2,1b4a <strncpy+0x98>
    1be8:	000700a3          	sb	zero,1(a4)
    1bec:	0027869b          	addw	a3,a5,2
    1bf0:	f4c6fde3          	bgeu	a3,a2,1b4a <strncpy+0x98>
    1bf4:	00070123          	sb	zero,2(a4)
    1bf8:	0037869b          	addw	a3,a5,3
    1bfc:	f4c6f7e3          	bgeu	a3,a2,1b4a <strncpy+0x98>
    1c00:	000701a3          	sb	zero,3(a4)
    1c04:	0047869b          	addw	a3,a5,4
    1c08:	f4c6f1e3          	bgeu	a3,a2,1b4a <strncpy+0x98>
    1c0c:	00070223          	sb	zero,4(a4)
    1c10:	0057869b          	addw	a3,a5,5
    1c14:	f2c6fbe3          	bgeu	a3,a2,1b4a <strncpy+0x98>
    1c18:	000702a3          	sb	zero,5(a4)
    1c1c:	0067869b          	addw	a3,a5,6
    1c20:	f2c6f5e3          	bgeu	a3,a2,1b4a <strncpy+0x98>
    1c24:	00070323          	sb	zero,6(a4)
    1c28:	0077869b          	addw	a3,a5,7
    1c2c:	f0c6ffe3          	bgeu	a3,a2,1b4a <strncpy+0x98>
    1c30:	000703a3          	sb	zero,7(a4)
    1c34:	0087869b          	addw	a3,a5,8
    1c38:	f0c6f9e3          	bgeu	a3,a2,1b4a <strncpy+0x98>
    1c3c:	00070423          	sb	zero,8(a4)
    1c40:	0097869b          	addw	a3,a5,9
    1c44:	f0c6f3e3          	bgeu	a3,a2,1b4a <strncpy+0x98>
    1c48:	000704a3          	sb	zero,9(a4)
    1c4c:	00a7869b          	addw	a3,a5,10
    1c50:	eec6fde3          	bgeu	a3,a2,1b4a <strncpy+0x98>
    1c54:	00070523          	sb	zero,10(a4)
    1c58:	00b7869b          	addw	a3,a5,11
    1c5c:	eec6f7e3          	bgeu	a3,a2,1b4a <strncpy+0x98>
    1c60:	000705a3          	sb	zero,11(a4)
    1c64:	00c7869b          	addw	a3,a5,12
    1c68:	eec6f1e3          	bgeu	a3,a2,1b4a <strncpy+0x98>
    1c6c:	00070623          	sb	zero,12(a4)
    1c70:	27b5                	addw	a5,a5,13
    1c72:	ecc7fce3          	bgeu	a5,a2,1b4a <strncpy+0x98>
    1c76:	000706a3          	sb	zero,13(a4)
}
    1c7a:	8082                	ret
    1c7c:	46ad                	li	a3,11
    1c7e:	b5d5                	j	1b62 <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c80:	00350693          	add	a3,a0,3
    1c84:	470d                	li	a4,3
    1c86:	bf0d                	j	1bb8 <strncpy+0x106>
        if (!n || !*s)
    1c88:	e4061ce3          	bnez	a2,1ae0 <strncpy+0x2e>
}
    1c8c:	8082                	ret
    1c8e:	8082                	ret
    char *p = dest;
    1c90:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c92:	4701                	li	a4,0
    1c94:	b715                	j	1bb8 <strncpy+0x106>
    1c96:	00150693          	add	a3,a0,1
    1c9a:	4705                	li	a4,1
    1c9c:	bf31                	j	1bb8 <strncpy+0x106>
    char *p = dest;
    1c9e:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ca0:	4781                	li	a5,0
    1ca2:	bf2d                	j	1bdc <strncpy+0x12a>
    1ca4:	00250693          	add	a3,a0,2
    1ca8:	4709                	li	a4,2
    1caa:	b739                	j	1bb8 <strncpy+0x106>
    1cac:	00650693          	add	a3,a0,6
    1cb0:	4719                	li	a4,6
    1cb2:	b719                	j	1bb8 <strncpy+0x106>

0000000000001cb4 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1cb4:	87aa                	mv	a5,a0
    1cb6:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1cb8:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1cbc:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1cc0:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1cc2:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cc4:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1cc8:	2501                	sext.w	a0,a0
    1cca:	8082                	ret

0000000000001ccc <openat>:
    register long a7 __asm__("a7") = n;
    1ccc:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1cd0:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cd4:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1cd8:	2501                	sext.w	a0,a0
    1cda:	8082                	ret

0000000000001cdc <fcntl>:
    register long a7 __asm__("a7") = n;
    1cdc:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cde:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1ce2:	2501                	sext.w	a0,a0
    1ce4:	8082                	ret

0000000000001ce6 <close>:
    register long a7 __asm__("a7") = n;
    1ce6:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1cea:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1cee:	2501                	sext.w	a0,a0
    1cf0:	8082                	ret

0000000000001cf2 <read>:
    register long a7 __asm__("a7") = n;
    1cf2:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cf6:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1cfa:	8082                	ret

0000000000001cfc <write>:
    register long a7 __asm__("a7") = n;
    1cfc:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d00:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d04:	8082                	ret

0000000000001d06 <getpid>:
    register long a7 __asm__("a7") = n;
    1d06:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d0a:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d0e:	2501                	sext.w	a0,a0
    1d10:	8082                	ret

0000000000001d12 <getppid>:
    register long a7 __asm__("a7") = n;
    1d12:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d16:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d1a:	2501                	sext.w	a0,a0
    1d1c:	8082                	ret

0000000000001d1e <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d1e:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d22:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d26:	2501                	sext.w	a0,a0
    1d28:	8082                	ret

0000000000001d2a <fork>:
    register long a7 __asm__("a7") = n;
    1d2a:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d2e:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d30:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d32:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d36:	2501                	sext.w	a0,a0
    1d38:	8082                	ret

0000000000001d3a <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d3a:	85b2                	mv	a1,a2
    1d3c:	863a                	mv	a2,a4
    if (stack)
    1d3e:	c191                	beqz	a1,1d42 <clone+0x8>
	stack += stack_size;
    1d40:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d42:	4781                	li	a5,0
    1d44:	4701                	li	a4,0
    1d46:	4681                	li	a3,0
    1d48:	2601                	sext.w	a2,a2
    1d4a:	a2ed                	j	1f34 <__clone>

0000000000001d4c <exit>:
    register long a7 __asm__("a7") = n;
    1d4c:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d50:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d54:	8082                	ret

0000000000001d56 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d56:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d5a:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d5c:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d60:	2501                	sext.w	a0,a0
    1d62:	8082                	ret

0000000000001d64 <exec>:
    register long a7 __asm__("a7") = n;
    1d64:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d68:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d6c:	2501                	sext.w	a0,a0
    1d6e:	8082                	ret

0000000000001d70 <execve>:
    register long a7 __asm__("a7") = n;
    1d70:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d74:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d78:	2501                	sext.w	a0,a0
    1d7a:	8082                	ret

0000000000001d7c <times>:
    register long a7 __asm__("a7") = n;
    1d7c:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d80:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d84:	2501                	sext.w	a0,a0
    1d86:	8082                	ret

0000000000001d88 <get_time>:

int64 get_time()
{
    1d88:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d8a:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d8e:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d90:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d92:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d96:	2501                	sext.w	a0,a0
    1d98:	ed09                	bnez	a0,1db2 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d9a:	67a2                	ld	a5,8(sp)
    1d9c:	3e800713          	li	a4,1000
    1da0:	00015503          	lhu	a0,0(sp)
    1da4:	02e7d7b3          	divu	a5,a5,a4
    1da8:	02e50533          	mul	a0,a0,a4
    1dac:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1dae:	0141                	add	sp,sp,16
    1db0:	8082                	ret
        return -1;
    1db2:	557d                	li	a0,-1
    1db4:	bfed                	j	1dae <get_time+0x26>

0000000000001db6 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1db6:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dba:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	8082                	ret

0000000000001dc2 <time>:
    register long a7 __asm__("a7") = n;
    1dc2:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1dc6:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1dca:	2501                	sext.w	a0,a0
    1dcc:	8082                	ret

0000000000001dce <sleep>:

int sleep(unsigned long long time)
{
    1dce:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1dd0:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1dd2:	850a                	mv	a0,sp
    1dd4:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1dd6:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1dda:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ddc:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1de0:	e501                	bnez	a0,1de8 <sleep+0x1a>
    return 0;
    1de2:	4501                	li	a0,0
}
    1de4:	0141                	add	sp,sp,16
    1de6:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1de8:	4502                	lw	a0,0(sp)
}
    1dea:	0141                	add	sp,sp,16
    1dec:	8082                	ret

0000000000001dee <set_priority>:
    register long a7 __asm__("a7") = n;
    1dee:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1df2:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1df6:	2501                	sext.w	a0,a0
    1df8:	8082                	ret

0000000000001dfa <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1dfa:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1dfe:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e02:	8082                	ret

0000000000001e04 <munmap>:
    register long a7 __asm__("a7") = n;
    1e04:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e08:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e0c:	2501                	sext.w	a0,a0
    1e0e:	8082                	ret

0000000000001e10 <wait>:

int wait(int *code)
{
    1e10:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e12:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e16:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e18:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e1a:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e1c:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e20:	2501                	sext.w	a0,a0
    1e22:	8082                	ret

0000000000001e24 <spawn>:
    register long a7 __asm__("a7") = n;
    1e24:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e28:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e2c:	2501                	sext.w	a0,a0
    1e2e:	8082                	ret

0000000000001e30 <mailread>:
    register long a7 __asm__("a7") = n;
    1e30:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e34:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e38:	2501                	sext.w	a0,a0
    1e3a:	8082                	ret

0000000000001e3c <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e3c:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e40:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e44:	2501                	sext.w	a0,a0
    1e46:	8082                	ret

0000000000001e48 <fstat>:
    register long a7 __asm__("a7") = n;
    1e48:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e4c:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e50:	2501                	sext.w	a0,a0
    1e52:	8082                	ret

0000000000001e54 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e54:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e56:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e5a:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e5c:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e60:	2501                	sext.w	a0,a0
    1e62:	8082                	ret

0000000000001e64 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e64:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e66:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e6a:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e6c:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e70:	2501                	sext.w	a0,a0
    1e72:	8082                	ret

0000000000001e74 <link>:

int link(char *old_path, char *new_path)
{
    1e74:	87aa                	mv	a5,a0
    1e76:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e78:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e7c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e80:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e82:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e86:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e88:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e8c:	2501                	sext.w	a0,a0
    1e8e:	8082                	ret

0000000000001e90 <unlink>:

int unlink(char *path)
{
    1e90:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e92:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e96:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e9a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e9c:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1ea0:	2501                	sext.w	a0,a0
    1ea2:	8082                	ret

0000000000001ea4 <uname>:
    register long a7 __asm__("a7") = n;
    1ea4:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1ea8:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1eac:	2501                	sext.w	a0,a0
    1eae:	8082                	ret

0000000000001eb0 <brk>:
    register long a7 __asm__("a7") = n;
    1eb0:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1eb4:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1eb8:	2501                	sext.w	a0,a0
    1eba:	8082                	ret

0000000000001ebc <getcwd>:
    register long a7 __asm__("a7") = n;
    1ebc:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ebe:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1ec2:	8082                	ret

0000000000001ec4 <chdir>:
    register long a7 __asm__("a7") = n;
    1ec4:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1ec8:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1ecc:	2501                	sext.w	a0,a0
    1ece:	8082                	ret

0000000000001ed0 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1ed0:	862e                	mv	a2,a1
    1ed2:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1ed4:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ed6:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1eda:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ede:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1ee0:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ee2:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1ee6:	2501                	sext.w	a0,a0
    1ee8:	8082                	ret

0000000000001eea <getdents>:
    register long a7 __asm__("a7") = n;
    1eea:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eee:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1ef2:	2501                	sext.w	a0,a0
    1ef4:	8082                	ret

0000000000001ef6 <pipe>:
    register long a7 __asm__("a7") = n;
    1ef6:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1efa:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1efc:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f00:	2501                	sext.w	a0,a0
    1f02:	8082                	ret

0000000000001f04 <dup>:
    register long a7 __asm__("a7") = n;
    1f04:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f06:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f0a:	2501                	sext.w	a0,a0
    1f0c:	8082                	ret

0000000000001f0e <dup2>:
    register long a7 __asm__("a7") = n;
    1f0e:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f10:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f12:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f16:	2501                	sext.w	a0,a0
    1f18:	8082                	ret

0000000000001f1a <mount>:
    register long a7 __asm__("a7") = n;
    1f1a:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f1e:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f22:	2501                	sext.w	a0,a0
    1f24:	8082                	ret

0000000000001f26 <umount>:
    register long a7 __asm__("a7") = n;
    1f26:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f2a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f2c:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f30:	2501                	sext.w	a0,a0
    1f32:	8082                	ret

0000000000001f34 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f34:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1f36:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f38:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f3a:	8532                	mv	a0,a2
	mv a2, a4
    1f3c:	863a                	mv	a2,a4
	mv a3, a5
    1f3e:	86be                	mv	a3,a5
	mv a4, a6
    1f40:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f42:	0dc00893          	li	a7,220
	ecall
    1f46:	00000073          	ecall

	beqz a0, 1f
    1f4a:	c111                	beqz	a0,1f4e <__clone+0x1a>
	# Parent
	ret
    1f4c:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f4e:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f50:	6522                	ld	a0,8(sp)
	jalr a1
    1f52:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f54:	05d00893          	li	a7,93
	ecall
    1f58:	00000073          	ecall
