
/home/brightnight/OScompetition/6.13晚final_main/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/munmap：     文件格式 elf64-littleriscv


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
    1004:	1101                	addi	sp,sp,-32
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f5250513          	addi	a0,a0,-174 # 1f58 <__clone+0x28>
void test_munmap(void){
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
    1012:	e426                	sd	s1,8(sp)
    TEST_START(__func__);
    1014:	370000ef          	jal	ra,1384 <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	0b850513          	addi	a0,a0,184 # 20d0 <__func__.0>
    1020:	364000ef          	jal	ra,1384 <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	f4c50513          	addi	a0,a0,-180 # 1f70 <__clone+0x40>
    102c:	358000ef          	jal	ra,1384 <puts>
    char *array;
    const char *str = "  Hello, mmap successfully!";
    int fd;

    fd = open("test_mmap.txt", O_RDWR | O_CREATE);
    1030:	04200593          	li	a1,66
    1034:	00001517          	auipc	a0,0x1
    1038:	f4c50513          	addi	a0,a0,-180 # 1f80 <__clone+0x50>
    103c:	475000ef          	jal	ra,1cb0 <open>
    1040:	842a                	mv	s0,a0
    write(fd, str, strlen(str));
    1042:	00001517          	auipc	a0,0x1
    1046:	f4e50513          	addi	a0,a0,-178 # 1f90 <__clone+0x60>
    104a:	0c1000ef          	jal	ra,190a <strlen>
    104e:	862a                	mv	a2,a0
    1050:	00001597          	auipc	a1,0x1
    1054:	f4058593          	addi	a1,a1,-192 # 1f90 <__clone+0x60>
    1058:	8522                	mv	a0,s0
    105a:	49f000ef          	jal	ra,1cf8 <write>
    fstat(fd, &kst);
    105e:	00001497          	auipc	s1,0x1
    1062:	ff248493          	addi	s1,s1,-14 # 2050 <kst>
    1066:	85a6                	mv	a1,s1
    1068:	8522                	mv	a0,s0
    106a:	5db000ef          	jal	ra,1e44 <fstat>
    printf("file len: %d\n", kst.st_size);
    106e:	788c                	ld	a1,48(s1)
    1070:	00001517          	auipc	a0,0x1
    1074:	f4050513          	addi	a0,a0,-192 # 1fb0 <__clone+0x80>
    1078:	32e000ef          	jal	ra,13a6 <printf>
    array = mmap(NULL, kst.st_size, PROT_WRITE | PROT_READ, MAP_FILE | MAP_SHARED, fd, 0);
    107c:	788c                	ld	a1,48(s1)
    107e:	4781                	li	a5,0
    1080:	8722                	mv	a4,s0
    1082:	4685                	li	a3,1
    1084:	460d                	li	a2,3
    1086:	4501                	li	a0,0
    1088:	56f000ef          	jal	ra,1df6 <mmap>
    //printf("return array: %x\n", array);

    if (array == MAP_FAILED) {
    108c:	57fd                	li	a5,-1
    108e:	06f50363          	beq	a0,a5,10f4 <test_munmap+0xf0>
	printf("mmap error.\n");
    }else{
	//printf("mmap content: %s\n", array);

    	int ret = munmap(array, kst.st_size);
    1092:	788c                	ld	a1,48(s1)
    1094:	56d000ef          	jal	ra,1e00 <munmap>
    1098:	84aa                	mv	s1,a0
	printf("munmap return: %d\n",ret);
    109a:	85aa                	mv	a1,a0
    109c:	00001517          	auipc	a0,0x1
    10a0:	f3450513          	addi	a0,a0,-204 # 1fd0 <__clone+0xa0>
    10a4:	302000ef          	jal	ra,13a6 <printf>
	assert(ret == 0);
    10a8:	ec9d                	bnez	s1,10e6 <test_munmap+0xe2>

	if (ret == 0)
		printf("munmap successfully!\n");
    10aa:	00001517          	auipc	a0,0x1
    10ae:	f6e50513          	addi	a0,a0,-146 # 2018 <__clone+0xe8>
    10b2:	2f4000ef          	jal	ra,13a6 <printf>
    }
    close(fd);
    10b6:	8522                	mv	a0,s0
    10b8:	42b000ef          	jal	ra,1ce2 <close>

    TEST_END(__func__);
    10bc:	00001517          	auipc	a0,0x1
    10c0:	f4c50513          	addi	a0,a0,-180 # 2008 <__clone+0xd8>
    10c4:	2c0000ef          	jal	ra,1384 <puts>
    10c8:	00001517          	auipc	a0,0x1
    10cc:	00850513          	addi	a0,a0,8 # 20d0 <__func__.0>
    10d0:	2b4000ef          	jal	ra,1384 <puts>
}
    10d4:	6442                	ld	s0,16(sp)
    10d6:	60e2                	ld	ra,24(sp)
    10d8:	64a2                	ld	s1,8(sp)
    TEST_END(__func__);
    10da:	00001517          	auipc	a0,0x1
    10de:	e9650513          	addi	a0,a0,-362 # 1f70 <__clone+0x40>
}
    10e2:	6105                	addi	sp,sp,32
    TEST_END(__func__);
    10e4:	a445                	j	1384 <puts>
	assert(ret == 0);
    10e6:	00001517          	auipc	a0,0x1
    10ea:	f0250513          	addi	a0,a0,-254 # 1fe8 <__clone+0xb8>
    10ee:	53c000ef          	jal	ra,162a <panic>
	if (ret == 0)
    10f2:	b7d1                	j	10b6 <test_munmap+0xb2>
	printf("mmap error.\n");
    10f4:	00001517          	auipc	a0,0x1
    10f8:	ecc50513          	addi	a0,a0,-308 # 1fc0 <__clone+0x90>
    10fc:	2aa000ef          	jal	ra,13a6 <printf>
    1100:	bf5d                	j	10b6 <test_munmap+0xb2>

0000000000001102 <main>:

int main(void){
    1102:	1141                	addi	sp,sp,-16
    1104:	e406                	sd	ra,8(sp)
    test_munmap();
    1106:	effff0ef          	jal	ra,1004 <test_munmap>
    return 0;
}
    110a:	60a2                	ld	ra,8(sp)
    110c:	4501                	li	a0,0
    110e:	0141                	addi	sp,sp,16
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
    1116:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    1118:	05a1                	addi	a1,a1,8
{
    111a:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    111c:	fe7ff0ef          	jal	ra,1102 <main>
    1120:	429000ef          	jal	ra,1d48 <exit>
	return 0;
}
    1124:	60a2                	ld	ra,8(sp)
    1126:	4501                	li	a0,0
    1128:	0141                	addi	sp,sp,16
    112a:	8082                	ret

000000000000112c <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    112c:	7179                	addi	sp,sp,-48
    112e:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1130:	12054b63          	bltz	a0,1266 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1134:	02b577bb          	remuw	a5,a0,a1
    1138:	00001617          	auipc	a2,0x1
    113c:	fa860613          	addi	a2,a2,-88 # 20e0 <digits>
    buf[16] = 0;
    1140:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1144:	0005871b          	sext.w	a4,a1
    1148:	1782                	slli	a5,a5,0x20
    114a:	9381                	srli	a5,a5,0x20
    114c:	97b2                	add	a5,a5,a2
    114e:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1152:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1156:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    115a:	1cb56363          	bltu	a0,a1,1320 <printint.constprop.0+0x1f4>
        buf[i--] = digits[x % base];
    115e:	45b9                	li	a1,14
    1160:	02e877bb          	remuw	a5,a6,a4
    1164:	1782                	slli	a5,a5,0x20
    1166:	9381                	srli	a5,a5,0x20
    1168:	97b2                	add	a5,a5,a2
    116a:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    116e:	02e856bb          	divuw	a3,a6,a4
        buf[i--] = digits[x % base];
    1172:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    1176:	0ce86e63          	bltu	a6,a4,1252 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    117a:	02e6f5bb          	remuw	a1,a3,a4
    } while ((x /= base) != 0);
    117e:	02e6d7bb          	divuw	a5,a3,a4
        buf[i--] = digits[x % base];
    1182:	1582                	slli	a1,a1,0x20
    1184:	9181                	srli	a1,a1,0x20
    1186:	95b2                	add	a1,a1,a2
    1188:	0005c583          	lbu	a1,0(a1)
    118c:	00b10aa3          	sb	a1,21(sp)
    } while ((x /= base) != 0);
    1190:	0007859b          	sext.w	a1,a5
    1194:	12e6ec63          	bltu	a3,a4,12cc <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    1198:	02e7f6bb          	remuw	a3,a5,a4
    119c:	1682                	slli	a3,a3,0x20
    119e:	9281                	srli	a3,a3,0x20
    11a0:	96b2                	add	a3,a3,a2
    11a2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11a6:	02e7d83b          	divuw	a6,a5,a4
        buf[i--] = digits[x % base];
    11aa:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    11ae:	12e5e863          	bltu	a1,a4,12de <printint.constprop.0+0x1b2>
        buf[i--] = digits[x % base];
    11b2:	02e876bb          	remuw	a3,a6,a4
    11b6:	1682                	slli	a3,a3,0x20
    11b8:	9281                	srli	a3,a3,0x20
    11ba:	96b2                	add	a3,a3,a2
    11bc:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11c0:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11c4:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    11c8:	12e86463          	bltu	a6,a4,12f0 <printint.constprop.0+0x1c4>
        buf[i--] = digits[x % base];
    11cc:	02e5f6bb          	remuw	a3,a1,a4
    11d0:	1682                	slli	a3,a3,0x20
    11d2:	9281                	srli	a3,a3,0x20
    11d4:	96b2                	add	a3,a3,a2
    11d6:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11da:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11de:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    11e2:	0ce5ec63          	bltu	a1,a4,12ba <printint.constprop.0+0x18e>
        buf[i--] = digits[x % base];
    11e6:	02e876bb          	remuw	a3,a6,a4
    11ea:	1682                	slli	a3,a3,0x20
    11ec:	9281                	srli	a3,a3,0x20
    11ee:	96b2                	add	a3,a3,a2
    11f0:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11f4:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11f8:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11fc:	10e86963          	bltu	a6,a4,130e <printint.constprop.0+0x1e2>
        buf[i--] = digits[x % base];
    1200:	02e5f6bb          	remuw	a3,a1,a4
    1204:	1682                	slli	a3,a3,0x20
    1206:	9281                	srli	a3,a3,0x20
    1208:	96b2                	add	a3,a3,a2
    120a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    120e:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1212:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    1216:	10e5e763          	bltu	a1,a4,1324 <printint.constprop.0+0x1f8>
        buf[i--] = digits[x % base];
    121a:	02e876bb          	remuw	a3,a6,a4
    121e:	1682                	slli	a3,a3,0x20
    1220:	9281                	srli	a3,a3,0x20
    1222:	96b2                	add	a3,a3,a2
    1224:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1228:	02e857bb          	divuw	a5,a6,a4
        buf[i--] = digits[x % base];
    122c:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    1230:	10e86363          	bltu	a6,a4,1336 <printint.constprop.0+0x20a>
        buf[i--] = digits[x % base];
    1234:	1782                	slli	a5,a5,0x20
    1236:	9381                	srli	a5,a5,0x20
    1238:	97b2                	add	a5,a5,a2
    123a:	0007c783          	lbu	a5,0(a5)
    123e:	4599                	li	a1,6
    1240:	00f10723          	sb	a5,14(sp)

    if (sign)
    1244:	00055763          	bgez	a0,1252 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1248:	02d00793          	li	a5,45
    124c:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1250:	4595                	li	a1,5
    write(f, s, l);
    1252:	003c                	addi	a5,sp,8
    1254:	4641                	li	a2,16
    1256:	9e0d                	subw	a2,a2,a1
    1258:	4505                	li	a0,1
    125a:	95be                	add	a1,a1,a5
    125c:	29d000ef          	jal	ra,1cf8 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1260:	70a2                	ld	ra,40(sp)
    1262:	6145                	addi	sp,sp,48
    1264:	8082                	ret
        x = -xx;
    1266:	40a0083b          	negw	a6,a0
        buf[i--] = digits[x % base];
    126a:	02b877bb          	remuw	a5,a6,a1
    126e:	00001617          	auipc	a2,0x1
    1272:	e7260613          	addi	a2,a2,-398 # 20e0 <digits>
    buf[16] = 0;
    1276:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    127a:	0005871b          	sext.w	a4,a1
    127e:	1782                	slli	a5,a5,0x20
    1280:	9381                	srli	a5,a5,0x20
    1282:	97b2                	add	a5,a5,a2
    1284:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1288:	02b858bb          	divuw	a7,a6,a1
        buf[i--] = digits[x % base];
    128c:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1290:	06b86963          	bltu	a6,a1,1302 <printint.constprop.0+0x1d6>
        buf[i--] = digits[x % base];
    1294:	02e8f7bb          	remuw	a5,a7,a4
    1298:	1782                	slli	a5,a5,0x20
    129a:	9381                	srli	a5,a5,0x20
    129c:	97b2                	add	a5,a5,a2
    129e:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    12a2:	02e8d6bb          	divuw	a3,a7,a4
        buf[i--] = digits[x % base];
    12a6:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    12aa:	ece8f8e3          	bgeu	a7,a4,117a <printint.constprop.0+0x4e>
        buf[i--] = '-';
    12ae:	02d00793          	li	a5,45
    12b2:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    12b6:	45b5                	li	a1,13
    12b8:	bf69                	j	1252 <printint.constprop.0+0x126>
    12ba:	45a9                	li	a1,10
    if (sign)
    12bc:	f8055be3          	bgez	a0,1252 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12c0:	02d00793          	li	a5,45
    12c4:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    12c8:	45a5                	li	a1,9
    12ca:	b761                	j	1252 <printint.constprop.0+0x126>
    12cc:	45b5                	li	a1,13
    if (sign)
    12ce:	f80552e3          	bgez	a0,1252 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12d2:	02d00793          	li	a5,45
    12d6:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    12da:	45b1                	li	a1,12
    12dc:	bf9d                	j	1252 <printint.constprop.0+0x126>
    12de:	45b1                	li	a1,12
    if (sign)
    12e0:	f60559e3          	bgez	a0,1252 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12e4:	02d00793          	li	a5,45
    12e8:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12ec:	45ad                	li	a1,11
    12ee:	b795                	j	1252 <printint.constprop.0+0x126>
    12f0:	45ad                	li	a1,11
    if (sign)
    12f2:	f60550e3          	bgez	a0,1252 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12f6:	02d00793          	li	a5,45
    12fa:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12fe:	45a9                	li	a1,10
    1300:	bf89                	j	1252 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1302:	02d00793          	li	a5,45
    1306:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    130a:	45b9                	li	a1,14
    130c:	b799                	j	1252 <printint.constprop.0+0x126>
    130e:	45a5                	li	a1,9
    if (sign)
    1310:	f40551e3          	bgez	a0,1252 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1314:	02d00793          	li	a5,45
    1318:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    131c:	45a1                	li	a1,8
    131e:	bf15                	j	1252 <printint.constprop.0+0x126>
    i = 15;
    1320:	45bd                	li	a1,15
    1322:	bf05                	j	1252 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    1324:	45a1                	li	a1,8
    if (sign)
    1326:	f20556e3          	bgez	a0,1252 <printint.constprop.0+0x126>
        buf[i--] = '-';
    132a:	02d00793          	li	a5,45
    132e:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1332:	459d                	li	a1,7
    1334:	bf39                	j	1252 <printint.constprop.0+0x126>
    1336:	459d                	li	a1,7
    if (sign)
    1338:	f0055de3          	bgez	a0,1252 <printint.constprop.0+0x126>
        buf[i--] = '-';
    133c:	02d00793          	li	a5,45
    1340:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1344:	4599                	li	a1,6
    1346:	b731                	j	1252 <printint.constprop.0+0x126>

0000000000001348 <getchar>:
{
    1348:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    134a:	00f10593          	addi	a1,sp,15
    134e:	4605                	li	a2,1
    1350:	4501                	li	a0,0
{
    1352:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1354:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1358:	197000ef          	jal	ra,1cee <read>
}
    135c:	60e2                	ld	ra,24(sp)
    135e:	00f14503          	lbu	a0,15(sp)
    1362:	6105                	addi	sp,sp,32
    1364:	8082                	ret

0000000000001366 <putchar>:
{
    1366:	1101                	addi	sp,sp,-32
    1368:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    136a:	00f10593          	addi	a1,sp,15
    136e:	4605                	li	a2,1
    1370:	4505                	li	a0,1
{
    1372:	ec06                	sd	ra,24(sp)
    char byte = c;
    1374:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1378:	181000ef          	jal	ra,1cf8 <write>
}
    137c:	60e2                	ld	ra,24(sp)
    137e:	2501                	sext.w	a0,a0
    1380:	6105                	addi	sp,sp,32
    1382:	8082                	ret

0000000000001384 <puts>:
{
    1384:	1141                	addi	sp,sp,-16
    1386:	e406                	sd	ra,8(sp)
    1388:	e022                	sd	s0,0(sp)
    138a:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    138c:	57e000ef          	jal	ra,190a <strlen>
    1390:	862a                	mv	a2,a0
    1392:	85a2                	mv	a1,s0
    1394:	4505                	li	a0,1
    1396:	163000ef          	jal	ra,1cf8 <write>
}
    139a:	60a2                	ld	ra,8(sp)
    139c:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    139e:	957d                	srai	a0,a0,0x3f
    return r;
    13a0:	2501                	sext.w	a0,a0
}
    13a2:	0141                	addi	sp,sp,16
    13a4:	8082                	ret

00000000000013a6 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    13a6:	7171                	addi	sp,sp,-176
    13a8:	fc56                	sd	s5,56(sp)
    13aa:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    13ac:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    13ae:	18bc                	addi	a5,sp,120
{
    13b0:	e8ca                	sd	s2,80(sp)
    13b2:	e4ce                	sd	s3,72(sp)
    13b4:	e0d2                	sd	s4,64(sp)
    13b6:	f85a                	sd	s6,48(sp)
    13b8:	f486                	sd	ra,104(sp)
    13ba:	f0a2                	sd	s0,96(sp)
    13bc:	eca6                	sd	s1,88(sp)
    13be:	fcae                	sd	a1,120(sp)
    13c0:	e132                	sd	a2,128(sp)
    13c2:	e536                	sd	a3,136(sp)
    13c4:	e93a                	sd	a4,144(sp)
    13c6:	f142                	sd	a6,160(sp)
    13c8:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    13ca:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    13cc:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    13d0:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    13d4:	00001b17          	auipc	s6,0x1
    13d8:	c5cb0b13          	addi	s6,s6,-932 # 2030 <__clone+0x100>
    buf[i++] = '0';
    13dc:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13e0:	00001997          	auipc	s3,0x1
    13e4:	d0098993          	addi	s3,s3,-768 # 20e0 <digits>
        if (!*s)
    13e8:	00054783          	lbu	a5,0(a0)
    13ec:	16078a63          	beqz	a5,1560 <printf+0x1ba>
    13f0:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13f2:	19278163          	beq	a5,s2,1574 <printf+0x1ce>
    13f6:	00164783          	lbu	a5,1(a2)
    13fa:	0605                	addi	a2,a2,1
    13fc:	fbfd                	bnez	a5,13f2 <printf+0x4c>
    13fe:	84b2                	mv	s1,a2
        l = z - a;
    1400:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1404:	85aa                	mv	a1,a0
    1406:	8622                	mv	a2,s0
    1408:	4505                	li	a0,1
    140a:	0ef000ef          	jal	ra,1cf8 <write>
        if (l)
    140e:	18041c63          	bnez	s0,15a6 <printf+0x200>
        if (s[1] == 0)
    1412:	0014c783          	lbu	a5,1(s1)
    1416:	14078563          	beqz	a5,1560 <printf+0x1ba>
        switch (s[1])
    141a:	1d478063          	beq	a5,s4,15da <printf+0x234>
    141e:	18fa6663          	bltu	s4,a5,15aa <printf+0x204>
    1422:	06400713          	li	a4,100
    1426:	1ae78063          	beq	a5,a4,15c6 <printf+0x220>
    142a:	07000713          	li	a4,112
    142e:	1ce79963          	bne	a5,a4,1600 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    1432:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1434:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1438:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    143a:	631c                	ld	a5,0(a4)
    143c:	0721                	addi	a4,a4,8
    143e:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1440:	00479293          	slli	t0,a5,0x4
    1444:	00879f93          	slli	t6,a5,0x8
    1448:	00c79f13          	slli	t5,a5,0xc
    144c:	01079e93          	slli	t4,a5,0x10
    1450:	01479e13          	slli	t3,a5,0x14
    1454:	01879313          	slli	t1,a5,0x18
    1458:	01c79893          	slli	a7,a5,0x1c
    145c:	02479813          	slli	a6,a5,0x24
    1460:	02879513          	slli	a0,a5,0x28
    1464:	02c79593          	slli	a1,a5,0x2c
    1468:	03079693          	slli	a3,a5,0x30
    146c:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1470:	03c7d413          	srli	s0,a5,0x3c
    1474:	01c7d39b          	srliw	t2,a5,0x1c
    1478:	03c2d293          	srli	t0,t0,0x3c
    147c:	03cfdf93          	srli	t6,t6,0x3c
    1480:	03cf5f13          	srli	t5,t5,0x3c
    1484:	03cede93          	srli	t4,t4,0x3c
    1488:	03ce5e13          	srli	t3,t3,0x3c
    148c:	03c35313          	srli	t1,t1,0x3c
    1490:	03c8d893          	srli	a7,a7,0x3c
    1494:	03c85813          	srli	a6,a6,0x3c
    1498:	9171                	srli	a0,a0,0x3c
    149a:	91f1                	srli	a1,a1,0x3c
    149c:	92f1                	srli	a3,a3,0x3c
    149e:	9371                	srli	a4,a4,0x3c
    14a0:	96ce                	add	a3,a3,s3
    14a2:	974e                	add	a4,a4,s3
    14a4:	944e                	add	s0,s0,s3
    14a6:	92ce                	add	t0,t0,s3
    14a8:	9fce                	add	t6,t6,s3
    14aa:	9f4e                	add	t5,t5,s3
    14ac:	9ece                	add	t4,t4,s3
    14ae:	9e4e                	add	t3,t3,s3
    14b0:	934e                	add	t1,t1,s3
    14b2:	98ce                	add	a7,a7,s3
    14b4:	93ce                	add	t2,t2,s3
    14b6:	984e                	add	a6,a6,s3
    14b8:	954e                	add	a0,a0,s3
    14ba:	95ce                	add	a1,a1,s3
    14bc:	0006c083          	lbu	ra,0(a3)
    14c0:	0002c283          	lbu	t0,0(t0)
    14c4:	00074683          	lbu	a3,0(a4)
    14c8:	000fcf83          	lbu	t6,0(t6)
    14cc:	000f4f03          	lbu	t5,0(t5)
    14d0:	000ece83          	lbu	t4,0(t4)
    14d4:	000e4e03          	lbu	t3,0(t3)
    14d8:	00034303          	lbu	t1,0(t1)
    14dc:	0008c883          	lbu	a7,0(a7)
    14e0:	0003c383          	lbu	t2,0(t2)
    14e4:	00084803          	lbu	a6,0(a6)
    14e8:	00054503          	lbu	a0,0(a0)
    14ec:	0005c583          	lbu	a1,0(a1)
    14f0:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14f4:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14f8:	9371                	srli	a4,a4,0x3c
    14fa:	8bbd                	andi	a5,a5,15
    14fc:	974e                	add	a4,a4,s3
    14fe:	97ce                	add	a5,a5,s3
    1500:	005105a3          	sb	t0,11(sp)
    1504:	01f10623          	sb	t6,12(sp)
    1508:	01e106a3          	sb	t5,13(sp)
    150c:	01d10723          	sb	t4,14(sp)
    1510:	01c107a3          	sb	t3,15(sp)
    1514:	00610823          	sb	t1,16(sp)
    1518:	011108a3          	sb	a7,17(sp)
    151c:	00710923          	sb	t2,18(sp)
    1520:	010109a3          	sb	a6,19(sp)
    1524:	00a10a23          	sb	a0,20(sp)
    1528:	00b10aa3          	sb	a1,21(sp)
    152c:	00110b23          	sb	ra,22(sp)
    1530:	00d10ba3          	sb	a3,23(sp)
    1534:	00810523          	sb	s0,10(sp)
    1538:	00074703          	lbu	a4,0(a4)
    153c:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1540:	002c                	addi	a1,sp,8
    1542:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1544:	00e10c23          	sb	a4,24(sp)
    1548:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    154c:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1550:	7a8000ef          	jal	ra,1cf8 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1554:	00248513          	addi	a0,s1,2
        if (!*s)
    1558:	00054783          	lbu	a5,0(a0)
    155c:	e8079ae3          	bnez	a5,13f0 <printf+0x4a>
    }
    va_end(ap);
}
    1560:	70a6                	ld	ra,104(sp)
    1562:	7406                	ld	s0,96(sp)
    1564:	64e6                	ld	s1,88(sp)
    1566:	6946                	ld	s2,80(sp)
    1568:	69a6                	ld	s3,72(sp)
    156a:	6a06                	ld	s4,64(sp)
    156c:	7ae2                	ld	s5,56(sp)
    156e:	7b42                	ld	s6,48(sp)
    1570:	614d                	addi	sp,sp,176
    1572:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1574:	00064783          	lbu	a5,0(a2)
    1578:	84b2                	mv	s1,a2
    157a:	01278963          	beq	a5,s2,158c <printf+0x1e6>
    157e:	b549                	j	1400 <printf+0x5a>
    1580:	0024c783          	lbu	a5,2(s1)
    1584:	0605                	addi	a2,a2,1
    1586:	0489                	addi	s1,s1,2
    1588:	e7279ce3          	bne	a5,s2,1400 <printf+0x5a>
    158c:	0014c783          	lbu	a5,1(s1)
    1590:	ff2788e3          	beq	a5,s2,1580 <printf+0x1da>
        l = z - a;
    1594:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1598:	85aa                	mv	a1,a0
    159a:	8622                	mv	a2,s0
    159c:	4505                	li	a0,1
    159e:	75a000ef          	jal	ra,1cf8 <write>
        if (l)
    15a2:	e60408e3          	beqz	s0,1412 <printf+0x6c>
    15a6:	8526                	mv	a0,s1
    15a8:	b581                	j	13e8 <printf+0x42>
        switch (s[1])
    15aa:	07800713          	li	a4,120
    15ae:	04e79963          	bne	a5,a4,1600 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    15b2:	6782                	ld	a5,0(sp)
    15b4:	45c1                	li	a1,16
    15b6:	4388                	lw	a0,0(a5)
    15b8:	07a1                	addi	a5,a5,8
    15ba:	e03e                	sd	a5,0(sp)
    15bc:	b71ff0ef          	jal	ra,112c <printint.constprop.0>
        s += 2;
    15c0:	00248513          	addi	a0,s1,2
    15c4:	bf51                	j	1558 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    15c6:	6782                	ld	a5,0(sp)
    15c8:	45a9                	li	a1,10
    15ca:	4388                	lw	a0,0(a5)
    15cc:	07a1                	addi	a5,a5,8
    15ce:	e03e                	sd	a5,0(sp)
    15d0:	b5dff0ef          	jal	ra,112c <printint.constprop.0>
        s += 2;
    15d4:	00248513          	addi	a0,s1,2
    15d8:	b741                	j	1558 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    15da:	6782                	ld	a5,0(sp)
    15dc:	6380                	ld	s0,0(a5)
    15de:	07a1                	addi	a5,a5,8
    15e0:	e03e                	sd	a5,0(sp)
    15e2:	c031                	beqz	s0,1626 <printf+0x280>
            l = strnlen(a, 200);
    15e4:	0c800593          	li	a1,200
    15e8:	8522                	mv	a0,s0
    15ea:	40c000ef          	jal	ra,19f6 <strnlen>
    write(f, s, l);
    15ee:	0005061b          	sext.w	a2,a0
    15f2:	85a2                	mv	a1,s0
    15f4:	4505                	li	a0,1
    15f6:	702000ef          	jal	ra,1cf8 <write>
        s += 2;
    15fa:	00248513          	addi	a0,s1,2
    15fe:	bfa9                	j	1558 <printf+0x1b2>
    return write(stdout, &byte, 1);
    1600:	4605                	li	a2,1
    1602:	002c                	addi	a1,sp,8
    1604:	4505                	li	a0,1
    char byte = c;
    1606:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    160a:	6ee000ef          	jal	ra,1cf8 <write>
    char byte = c;
    160e:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1612:	4605                	li	a2,1
    1614:	002c                	addi	a1,sp,8
    1616:	4505                	li	a0,1
    char byte = c;
    1618:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    161c:	6dc000ef          	jal	ra,1cf8 <write>
        s += 2;
    1620:	00248513          	addi	a0,s1,2
    1624:	bf15                	j	1558 <printf+0x1b2>
                a = "(null)";
    1626:	845a                	mv	s0,s6
    1628:	bf75                	j	15e4 <printf+0x23e>

000000000000162a <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    162a:	1141                	addi	sp,sp,-16
    162c:	e406                	sd	ra,8(sp)
    puts(m);
    162e:	d57ff0ef          	jal	ra,1384 <puts>
    exit(-100);
}
    1632:	60a2                	ld	ra,8(sp)
    exit(-100);
    1634:	f9c00513          	li	a0,-100
}
    1638:	0141                	addi	sp,sp,16
    exit(-100);
    163a:	a739                	j	1d48 <exit>

000000000000163c <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    163c:	02000793          	li	a5,32
    1640:	00f50663          	beq	a0,a5,164c <isspace+0x10>
    1644:	355d                	addiw	a0,a0,-9
    1646:	00553513          	sltiu	a0,a0,5
    164a:	8082                	ret
    164c:	4505                	li	a0,1
}
    164e:	8082                	ret

0000000000001650 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1650:	fd05051b          	addiw	a0,a0,-48
}
    1654:	00a53513          	sltiu	a0,a0,10
    1658:	8082                	ret

000000000000165a <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    165a:	02000613          	li	a2,32
    165e:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1660:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1664:	ff77869b          	addiw	a3,a5,-9
    1668:	04c78c63          	beq	a5,a2,16c0 <atoi+0x66>
    166c:	0007871b          	sext.w	a4,a5
    1670:	04d5f863          	bgeu	a1,a3,16c0 <atoi+0x66>
        s++;
    switch (*s)
    1674:	02b00693          	li	a3,43
    1678:	04d78963          	beq	a5,a3,16ca <atoi+0x70>
    167c:	02d00693          	li	a3,45
    1680:	06d78263          	beq	a5,a3,16e4 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1684:	fd07061b          	addiw	a2,a4,-48
    1688:	47a5                	li	a5,9
    168a:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    168c:	4e01                	li	t3,0
    while (isdigit(*s))
    168e:	04c7e963          	bltu	a5,a2,16e0 <atoi+0x86>
    int n = 0, neg = 0;
    1692:	4501                	li	a0,0
    while (isdigit(*s))
    1694:	4825                	li	a6,9
    1696:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    169a:	0025179b          	slliw	a5,a0,0x2
    169e:	9fa9                	addw	a5,a5,a0
    16a0:	fd07031b          	addiw	t1,a4,-48
    16a4:	0017989b          	slliw	a7,a5,0x1
    while (isdigit(*s))
    16a8:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    16ac:	0685                	addi	a3,a3,1
    16ae:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    16b2:	0006071b          	sext.w	a4,a2
    16b6:	feb870e3          	bgeu	a6,a1,1696 <atoi+0x3c>
    return neg ? n : -n;
    16ba:	000e0563          	beqz	t3,16c4 <atoi+0x6a>
}
    16be:	8082                	ret
        s++;
    16c0:	0505                	addi	a0,a0,1
    16c2:	bf79                	j	1660 <atoi+0x6>
    return neg ? n : -n;
    16c4:	4113053b          	subw	a0,t1,a7
    16c8:	8082                	ret
    while (isdigit(*s))
    16ca:	00154703          	lbu	a4,1(a0)
    16ce:	47a5                	li	a5,9
        s++;
    16d0:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    16d4:	fd07061b          	addiw	a2,a4,-48
    int n = 0, neg = 0;
    16d8:	4e01                	li	t3,0
    while (isdigit(*s))
    16da:	2701                	sext.w	a4,a4
    16dc:	fac7fbe3          	bgeu	a5,a2,1692 <atoi+0x38>
    16e0:	4501                	li	a0,0
}
    16e2:	8082                	ret
    while (isdigit(*s))
    16e4:	00154703          	lbu	a4,1(a0)
    16e8:	47a5                	li	a5,9
        s++;
    16ea:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    16ee:	fd07061b          	addiw	a2,a4,-48
    16f2:	2701                	sext.w	a4,a4
    16f4:	fec7e6e3          	bltu	a5,a2,16e0 <atoi+0x86>
        neg = 1;
    16f8:	4e05                	li	t3,1
    16fa:	bf61                	j	1692 <atoi+0x38>

00000000000016fc <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16fc:	16060d63          	beqz	a2,1876 <memset+0x17a>
    1700:	40a007b3          	neg	a5,a0
    1704:	8b9d                	andi	a5,a5,7
    1706:	00778693          	addi	a3,a5,7
    170a:	482d                	li	a6,11
    170c:	0ff5f713          	zext.b	a4,a1
    1710:	fff60593          	addi	a1,a2,-1
    1714:	1706e263          	bltu	a3,a6,1878 <memset+0x17c>
    1718:	16d5ea63          	bltu	a1,a3,188c <memset+0x190>
    171c:	16078563          	beqz	a5,1886 <memset+0x18a>
    1720:	00e50023          	sb	a4,0(a0)
    1724:	4685                	li	a3,1
    1726:	00150593          	addi	a1,a0,1
    172a:	14d78c63          	beq	a5,a3,1882 <memset+0x186>
    172e:	00e500a3          	sb	a4,1(a0)
    1732:	4689                	li	a3,2
    1734:	00250593          	addi	a1,a0,2
    1738:	14d78d63          	beq	a5,a3,1892 <memset+0x196>
    173c:	00e50123          	sb	a4,2(a0)
    1740:	468d                	li	a3,3
    1742:	00350593          	addi	a1,a0,3
    1746:	12d78b63          	beq	a5,a3,187c <memset+0x180>
    174a:	00e501a3          	sb	a4,3(a0)
    174e:	4691                	li	a3,4
    1750:	00450593          	addi	a1,a0,4
    1754:	14d78163          	beq	a5,a3,1896 <memset+0x19a>
    1758:	00e50223          	sb	a4,4(a0)
    175c:	4695                	li	a3,5
    175e:	00550593          	addi	a1,a0,5
    1762:	12d78c63          	beq	a5,a3,189a <memset+0x19e>
    1766:	00e502a3          	sb	a4,5(a0)
    176a:	469d                	li	a3,7
    176c:	00650593          	addi	a1,a0,6
    1770:	12d79763          	bne	a5,a3,189e <memset+0x1a2>
    1774:	00750593          	addi	a1,a0,7
    1778:	00e50323          	sb	a4,6(a0)
    177c:	481d                	li	a6,7
    177e:	00871693          	slli	a3,a4,0x8
    1782:	01071893          	slli	a7,a4,0x10
    1786:	8ed9                	or	a3,a3,a4
    1788:	01871313          	slli	t1,a4,0x18
    178c:	0116e6b3          	or	a3,a3,a7
    1790:	0066e6b3          	or	a3,a3,t1
    1794:	02071893          	slli	a7,a4,0x20
    1798:	02871e13          	slli	t3,a4,0x28
    179c:	0116e6b3          	or	a3,a3,a7
    17a0:	40f60333          	sub	t1,a2,a5
    17a4:	03071893          	slli	a7,a4,0x30
    17a8:	01c6e6b3          	or	a3,a3,t3
    17ac:	0116e6b3          	or	a3,a3,a7
    17b0:	03871e13          	slli	t3,a4,0x38
    17b4:	97aa                	add	a5,a5,a0
    17b6:	ff837893          	andi	a7,t1,-8
    17ba:	01c6e6b3          	or	a3,a3,t3
    17be:	98be                	add	a7,a7,a5
    17c0:	e394                	sd	a3,0(a5)
    17c2:	07a1                	addi	a5,a5,8
    17c4:	ff179ee3          	bne	a5,a7,17c0 <memset+0xc4>
    17c8:	ff837893          	andi	a7,t1,-8
    17cc:	011587b3          	add	a5,a1,a7
    17d0:	010886bb          	addw	a3,a7,a6
    17d4:	0b130663          	beq	t1,a7,1880 <memset+0x184>
    17d8:	00e78023          	sb	a4,0(a5)
    17dc:	0016859b          	addiw	a1,a3,1
    17e0:	08c5fb63          	bgeu	a1,a2,1876 <memset+0x17a>
    17e4:	00e780a3          	sb	a4,1(a5)
    17e8:	0026859b          	addiw	a1,a3,2
    17ec:	08c5f563          	bgeu	a1,a2,1876 <memset+0x17a>
    17f0:	00e78123          	sb	a4,2(a5)
    17f4:	0036859b          	addiw	a1,a3,3
    17f8:	06c5ff63          	bgeu	a1,a2,1876 <memset+0x17a>
    17fc:	00e781a3          	sb	a4,3(a5)
    1800:	0046859b          	addiw	a1,a3,4
    1804:	06c5f963          	bgeu	a1,a2,1876 <memset+0x17a>
    1808:	00e78223          	sb	a4,4(a5)
    180c:	0056859b          	addiw	a1,a3,5
    1810:	06c5f363          	bgeu	a1,a2,1876 <memset+0x17a>
    1814:	00e782a3          	sb	a4,5(a5)
    1818:	0066859b          	addiw	a1,a3,6
    181c:	04c5fd63          	bgeu	a1,a2,1876 <memset+0x17a>
    1820:	00e78323          	sb	a4,6(a5)
    1824:	0076859b          	addiw	a1,a3,7
    1828:	04c5f763          	bgeu	a1,a2,1876 <memset+0x17a>
    182c:	00e783a3          	sb	a4,7(a5)
    1830:	0086859b          	addiw	a1,a3,8
    1834:	04c5f163          	bgeu	a1,a2,1876 <memset+0x17a>
    1838:	00e78423          	sb	a4,8(a5)
    183c:	0096859b          	addiw	a1,a3,9
    1840:	02c5fb63          	bgeu	a1,a2,1876 <memset+0x17a>
    1844:	00e784a3          	sb	a4,9(a5)
    1848:	00a6859b          	addiw	a1,a3,10
    184c:	02c5f563          	bgeu	a1,a2,1876 <memset+0x17a>
    1850:	00e78523          	sb	a4,10(a5)
    1854:	00b6859b          	addiw	a1,a3,11
    1858:	00c5ff63          	bgeu	a1,a2,1876 <memset+0x17a>
    185c:	00e785a3          	sb	a4,11(a5)
    1860:	00c6859b          	addiw	a1,a3,12
    1864:	00c5f963          	bgeu	a1,a2,1876 <memset+0x17a>
    1868:	00e78623          	sb	a4,12(a5)
    186c:	26b5                	addiw	a3,a3,13
    186e:	00c6f463          	bgeu	a3,a2,1876 <memset+0x17a>
    1872:	00e786a3          	sb	a4,13(a5)
        ;
    return dest;
}
    1876:	8082                	ret
    1878:	46ad                	li	a3,11
    187a:	bd79                	j	1718 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    187c:	480d                	li	a6,3
    187e:	b701                	j	177e <memset+0x82>
    1880:	8082                	ret
    1882:	4805                	li	a6,1
    1884:	bded                	j	177e <memset+0x82>
    1886:	85aa                	mv	a1,a0
    1888:	4801                	li	a6,0
    188a:	bdd5                	j	177e <memset+0x82>
    188c:	87aa                	mv	a5,a0
    188e:	4681                	li	a3,0
    1890:	b7a1                	j	17d8 <memset+0xdc>
    1892:	4809                	li	a6,2
    1894:	b5ed                	j	177e <memset+0x82>
    1896:	4811                	li	a6,4
    1898:	b5dd                	j	177e <memset+0x82>
    189a:	4815                	li	a6,5
    189c:	b5cd                	j	177e <memset+0x82>
    189e:	4819                	li	a6,6
    18a0:	bdf9                	j	177e <memset+0x82>

00000000000018a2 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    18a2:	00054783          	lbu	a5,0(a0)
    18a6:	0005c703          	lbu	a4,0(a1)
    18aa:	00e79863          	bne	a5,a4,18ba <strcmp+0x18>
    18ae:	0505                	addi	a0,a0,1
    18b0:	0585                	addi	a1,a1,1
    18b2:	fbe5                	bnez	a5,18a2 <strcmp>
    18b4:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    18b6:	9d19                	subw	a0,a0,a4
    18b8:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    18ba:	0007851b          	sext.w	a0,a5
    18be:	bfe5                	j	18b6 <strcmp+0x14>

00000000000018c0 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    18c0:	ca15                	beqz	a2,18f4 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18c2:	00054783          	lbu	a5,0(a0)
    if (!n--)
    18c6:	167d                	addi	a2,a2,-1
    18c8:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18cc:	eb99                	bnez	a5,18e2 <strncmp+0x22>
    18ce:	a815                	j	1902 <strncmp+0x42>
    18d0:	00a68e63          	beq	a3,a0,18ec <strncmp+0x2c>
    18d4:	0505                	addi	a0,a0,1
    18d6:	00f71b63          	bne	a4,a5,18ec <strncmp+0x2c>
    18da:	00054783          	lbu	a5,0(a0)
    18de:	cf89                	beqz	a5,18f8 <strncmp+0x38>
    18e0:	85b2                	mv	a1,a2
    18e2:	0005c703          	lbu	a4,0(a1)
    18e6:	00158613          	addi	a2,a1,1
    18ea:	f37d                	bnez	a4,18d0 <strncmp+0x10>
        ;
    return *l - *r;
    18ec:	0007851b          	sext.w	a0,a5
    18f0:	9d19                	subw	a0,a0,a4
    18f2:	8082                	ret
        return 0;
    18f4:	4501                	li	a0,0
}
    18f6:	8082                	ret
    return *l - *r;
    18f8:	0015c703          	lbu	a4,1(a1)
    18fc:	4501                	li	a0,0
    18fe:	9d19                	subw	a0,a0,a4
    1900:	8082                	ret
    1902:	0005c703          	lbu	a4,0(a1)
    1906:	4501                	li	a0,0
    1908:	b7e5                	j	18f0 <strncmp+0x30>

000000000000190a <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    190a:	00757793          	andi	a5,a0,7
    190e:	cf89                	beqz	a5,1928 <strlen+0x1e>
    1910:	87aa                	mv	a5,a0
    1912:	a029                	j	191c <strlen+0x12>
    1914:	0785                	addi	a5,a5,1
    1916:	0077f713          	andi	a4,a5,7
    191a:	cb01                	beqz	a4,192a <strlen+0x20>
        if (!*s)
    191c:	0007c703          	lbu	a4,0(a5)
    1920:	fb75                	bnez	a4,1914 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1922:	40a78533          	sub	a0,a5,a0
}
    1926:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1928:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    192a:	6394                	ld	a3,0(a5)
    192c:	00000597          	auipc	a1,0x0
    1930:	70c5b583          	ld	a1,1804(a1) # 2038 <__clone+0x108>
    1934:	00000617          	auipc	a2,0x0
    1938:	70c63603          	ld	a2,1804(a2) # 2040 <__clone+0x110>
    193c:	a019                	j	1942 <strlen+0x38>
    193e:	6794                	ld	a3,8(a5)
    1940:	07a1                	addi	a5,a5,8
    1942:	00b68733          	add	a4,a3,a1
    1946:	fff6c693          	not	a3,a3
    194a:	8f75                	and	a4,a4,a3
    194c:	8f71                	and	a4,a4,a2
    194e:	db65                	beqz	a4,193e <strlen+0x34>
    for (; *s; s++)
    1950:	0007c703          	lbu	a4,0(a5)
    1954:	d779                	beqz	a4,1922 <strlen+0x18>
    1956:	0017c703          	lbu	a4,1(a5)
    195a:	0785                	addi	a5,a5,1
    195c:	d379                	beqz	a4,1922 <strlen+0x18>
    195e:	0017c703          	lbu	a4,1(a5)
    1962:	0785                	addi	a5,a5,1
    1964:	fb6d                	bnez	a4,1956 <strlen+0x4c>
    1966:	bf75                	j	1922 <strlen+0x18>

0000000000001968 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1968:	00757713          	andi	a4,a0,7
{
    196c:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    196e:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1972:	cb19                	beqz	a4,1988 <memchr+0x20>
    1974:	ce25                	beqz	a2,19ec <memchr+0x84>
    1976:	0007c703          	lbu	a4,0(a5)
    197a:	04b70e63          	beq	a4,a1,19d6 <memchr+0x6e>
    197e:	0785                	addi	a5,a5,1
    1980:	0077f713          	andi	a4,a5,7
    1984:	167d                	addi	a2,a2,-1
    1986:	f77d                	bnez	a4,1974 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1988:	4501                	li	a0,0
    if (n && *s != c)
    198a:	c235                	beqz	a2,19ee <memchr+0x86>
    198c:	0007c703          	lbu	a4,0(a5)
    1990:	04b70363          	beq	a4,a1,19d6 <memchr+0x6e>
        size_t k = ONES * c;
    1994:	00000517          	auipc	a0,0x0
    1998:	6b453503          	ld	a0,1716(a0) # 2048 <__clone+0x118>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    199c:	471d                	li	a4,7
        size_t k = ONES * c;
    199e:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19a2:	02c77a63          	bgeu	a4,a2,19d6 <memchr+0x6e>
    19a6:	00000897          	auipc	a7,0x0
    19aa:	6928b883          	ld	a7,1682(a7) # 2038 <__clone+0x108>
    19ae:	00000817          	auipc	a6,0x0
    19b2:	69283803          	ld	a6,1682(a6) # 2040 <__clone+0x110>
    19b6:	431d                	li	t1,7
    19b8:	a029                	j	19c2 <memchr+0x5a>
    19ba:	1661                	addi	a2,a2,-8
    19bc:	07a1                	addi	a5,a5,8
    19be:	02c37963          	bgeu	t1,a2,19f0 <memchr+0x88>
    19c2:	6398                	ld	a4,0(a5)
    19c4:	8f29                	xor	a4,a4,a0
    19c6:	011706b3          	add	a3,a4,a7
    19ca:	fff74713          	not	a4,a4
    19ce:	8f75                	and	a4,a4,a3
    19d0:	01077733          	and	a4,a4,a6
    19d4:	d37d                	beqz	a4,19ba <memchr+0x52>
{
    19d6:	853e                	mv	a0,a5
    19d8:	97b2                	add	a5,a5,a2
    19da:	a021                	j	19e2 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    19dc:	0505                	addi	a0,a0,1
    19de:	00f50763          	beq	a0,a5,19ec <memchr+0x84>
    19e2:	00054703          	lbu	a4,0(a0)
    19e6:	feb71be3          	bne	a4,a1,19dc <memchr+0x74>
    19ea:	8082                	ret
    return n ? (void *)s : 0;
    19ec:	4501                	li	a0,0
}
    19ee:	8082                	ret
    return n ? (void *)s : 0;
    19f0:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    19f2:	f275                	bnez	a2,19d6 <memchr+0x6e>
}
    19f4:	8082                	ret

00000000000019f6 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19f6:	1101                	addi	sp,sp,-32
    19f8:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19fa:	862e                	mv	a2,a1
{
    19fc:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19fe:	4581                	li	a1,0
{
    1a00:	e426                	sd	s1,8(sp)
    1a02:	ec06                	sd	ra,24(sp)
    1a04:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1a06:	f63ff0ef          	jal	ra,1968 <memchr>
    return p ? p - s : n;
    1a0a:	c519                	beqz	a0,1a18 <strnlen+0x22>
}
    1a0c:	60e2                	ld	ra,24(sp)
    1a0e:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1a10:	8d05                	sub	a0,a0,s1
}
    1a12:	64a2                	ld	s1,8(sp)
    1a14:	6105                	addi	sp,sp,32
    1a16:	8082                	ret
    1a18:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1a1a:	8522                	mv	a0,s0
}
    1a1c:	6442                	ld	s0,16(sp)
    1a1e:	64a2                	ld	s1,8(sp)
    1a20:	6105                	addi	sp,sp,32
    1a22:	8082                	ret

0000000000001a24 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a24:	00a5c7b3          	xor	a5,a1,a0
    1a28:	8b9d                	andi	a5,a5,7
    1a2a:	eb95                	bnez	a5,1a5e <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a2c:	0075f793          	andi	a5,a1,7
    1a30:	e7b1                	bnez	a5,1a7c <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a32:	6198                	ld	a4,0(a1)
    1a34:	00000617          	auipc	a2,0x0
    1a38:	60463603          	ld	a2,1540(a2) # 2038 <__clone+0x108>
    1a3c:	00000817          	auipc	a6,0x0
    1a40:	60483803          	ld	a6,1540(a6) # 2040 <__clone+0x110>
    1a44:	a029                	j	1a4e <strcpy+0x2a>
    1a46:	05a1                	addi	a1,a1,8
    1a48:	e118                	sd	a4,0(a0)
    1a4a:	6198                	ld	a4,0(a1)
    1a4c:	0521                	addi	a0,a0,8
    1a4e:	00c707b3          	add	a5,a4,a2
    1a52:	fff74693          	not	a3,a4
    1a56:	8ff5                	and	a5,a5,a3
    1a58:	0107f7b3          	and	a5,a5,a6
    1a5c:	d7ed                	beqz	a5,1a46 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a5e:	0005c783          	lbu	a5,0(a1)
    1a62:	00f50023          	sb	a5,0(a0)
    1a66:	c785                	beqz	a5,1a8e <strcpy+0x6a>
    1a68:	0015c783          	lbu	a5,1(a1)
    1a6c:	0505                	addi	a0,a0,1
    1a6e:	0585                	addi	a1,a1,1
    1a70:	00f50023          	sb	a5,0(a0)
    1a74:	fbf5                	bnez	a5,1a68 <strcpy+0x44>
        ;
    return d;
}
    1a76:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a78:	0505                	addi	a0,a0,1
    1a7a:	df45                	beqz	a4,1a32 <strcpy+0xe>
            if (!(*d = *s))
    1a7c:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a80:	0585                	addi	a1,a1,1
    1a82:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1a86:	00f50023          	sb	a5,0(a0)
    1a8a:	f7fd                	bnez	a5,1a78 <strcpy+0x54>
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
    1a90:	00a5c7b3          	xor	a5,a1,a0
    1a94:	8b9d                	andi	a5,a5,7
    1a96:	1a079863          	bnez	a5,1c46 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a9a:	0075f793          	andi	a5,a1,7
    1a9e:	16078463          	beqz	a5,1c06 <strncpy+0x176>
    1aa2:	ea01                	bnez	a2,1ab2 <strncpy+0x22>
    1aa4:	a421                	j	1cac <strncpy+0x21c>
    1aa6:	167d                	addi	a2,a2,-1
    1aa8:	0505                	addi	a0,a0,1
    1aaa:	14070e63          	beqz	a4,1c06 <strncpy+0x176>
    1aae:	1a060863          	beqz	a2,1c5e <strncpy+0x1ce>
    1ab2:	0005c783          	lbu	a5,0(a1)
    1ab6:	0585                	addi	a1,a1,1
    1ab8:	0075f713          	andi	a4,a1,7
    1abc:	00f50023          	sb	a5,0(a0)
    1ac0:	f3fd                	bnez	a5,1aa6 <strncpy+0x16>
    1ac2:	4805                	li	a6,1
    1ac4:	1a061863          	bnez	a2,1c74 <strncpy+0x1e4>
    1ac8:	40a007b3          	neg	a5,a0
    1acc:	8b9d                	andi	a5,a5,7
    1ace:	4681                	li	a3,0
    1ad0:	18061a63          	bnez	a2,1c64 <strncpy+0x1d4>
    1ad4:	00778713          	addi	a4,a5,7
    1ad8:	45ad                	li	a1,11
    1ada:	18b76363          	bltu	a4,a1,1c60 <strncpy+0x1d0>
    1ade:	1ae6eb63          	bltu	a3,a4,1c94 <strncpy+0x204>
    1ae2:	1a078363          	beqz	a5,1c88 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ae6:	00050023          	sb	zero,0(a0)
    1aea:	4685                	li	a3,1
    1aec:	00150713          	addi	a4,a0,1
    1af0:	18d78f63          	beq	a5,a3,1c8e <strncpy+0x1fe>
    1af4:	000500a3          	sb	zero,1(a0)
    1af8:	4689                	li	a3,2
    1afa:	00250713          	addi	a4,a0,2
    1afe:	18d78e63          	beq	a5,a3,1c9a <strncpy+0x20a>
    1b02:	00050123          	sb	zero,2(a0)
    1b06:	468d                	li	a3,3
    1b08:	00350713          	addi	a4,a0,3
    1b0c:	16d78c63          	beq	a5,a3,1c84 <strncpy+0x1f4>
    1b10:	000501a3          	sb	zero,3(a0)
    1b14:	4691                	li	a3,4
    1b16:	00450713          	addi	a4,a0,4
    1b1a:	18d78263          	beq	a5,a3,1c9e <strncpy+0x20e>
    1b1e:	00050223          	sb	zero,4(a0)
    1b22:	4695                	li	a3,5
    1b24:	00550713          	addi	a4,a0,5
    1b28:	16d78d63          	beq	a5,a3,1ca2 <strncpy+0x212>
    1b2c:	000502a3          	sb	zero,5(a0)
    1b30:	469d                	li	a3,7
    1b32:	00650713          	addi	a4,a0,6
    1b36:	16d79863          	bne	a5,a3,1ca6 <strncpy+0x216>
    1b3a:	00750713          	addi	a4,a0,7
    1b3e:	00050323          	sb	zero,6(a0)
    1b42:	40f80833          	sub	a6,a6,a5
    1b46:	ff887593          	andi	a1,a6,-8
    1b4a:	97aa                	add	a5,a5,a0
    1b4c:	95be                	add	a1,a1,a5
    1b4e:	0007b023          	sd	zero,0(a5)
    1b52:	07a1                	addi	a5,a5,8
    1b54:	feb79de3          	bne	a5,a1,1b4e <strncpy+0xbe>
    1b58:	ff887593          	andi	a1,a6,-8
    1b5c:	9ead                	addw	a3,a3,a1
    1b5e:	00b707b3          	add	a5,a4,a1
    1b62:	12b80863          	beq	a6,a1,1c92 <strncpy+0x202>
    1b66:	00078023          	sb	zero,0(a5)
    1b6a:	0016871b          	addiw	a4,a3,1
    1b6e:	0ec77863          	bgeu	a4,a2,1c5e <strncpy+0x1ce>
    1b72:	000780a3          	sb	zero,1(a5)
    1b76:	0026871b          	addiw	a4,a3,2
    1b7a:	0ec77263          	bgeu	a4,a2,1c5e <strncpy+0x1ce>
    1b7e:	00078123          	sb	zero,2(a5)
    1b82:	0036871b          	addiw	a4,a3,3
    1b86:	0cc77c63          	bgeu	a4,a2,1c5e <strncpy+0x1ce>
    1b8a:	000781a3          	sb	zero,3(a5)
    1b8e:	0046871b          	addiw	a4,a3,4
    1b92:	0cc77663          	bgeu	a4,a2,1c5e <strncpy+0x1ce>
    1b96:	00078223          	sb	zero,4(a5)
    1b9a:	0056871b          	addiw	a4,a3,5
    1b9e:	0cc77063          	bgeu	a4,a2,1c5e <strncpy+0x1ce>
    1ba2:	000782a3          	sb	zero,5(a5)
    1ba6:	0066871b          	addiw	a4,a3,6
    1baa:	0ac77a63          	bgeu	a4,a2,1c5e <strncpy+0x1ce>
    1bae:	00078323          	sb	zero,6(a5)
    1bb2:	0076871b          	addiw	a4,a3,7
    1bb6:	0ac77463          	bgeu	a4,a2,1c5e <strncpy+0x1ce>
    1bba:	000783a3          	sb	zero,7(a5)
    1bbe:	0086871b          	addiw	a4,a3,8
    1bc2:	08c77e63          	bgeu	a4,a2,1c5e <strncpy+0x1ce>
    1bc6:	00078423          	sb	zero,8(a5)
    1bca:	0096871b          	addiw	a4,a3,9
    1bce:	08c77863          	bgeu	a4,a2,1c5e <strncpy+0x1ce>
    1bd2:	000784a3          	sb	zero,9(a5)
    1bd6:	00a6871b          	addiw	a4,a3,10
    1bda:	08c77263          	bgeu	a4,a2,1c5e <strncpy+0x1ce>
    1bde:	00078523          	sb	zero,10(a5)
    1be2:	00b6871b          	addiw	a4,a3,11
    1be6:	06c77c63          	bgeu	a4,a2,1c5e <strncpy+0x1ce>
    1bea:	000785a3          	sb	zero,11(a5)
    1bee:	00c6871b          	addiw	a4,a3,12
    1bf2:	06c77663          	bgeu	a4,a2,1c5e <strncpy+0x1ce>
    1bf6:	00078623          	sb	zero,12(a5)
    1bfa:	26b5                	addiw	a3,a3,13
    1bfc:	06c6f163          	bgeu	a3,a2,1c5e <strncpy+0x1ce>
    1c00:	000786a3          	sb	zero,13(a5)
    1c04:	8082                	ret
            ;
        if (!n || !*s)
    1c06:	c645                	beqz	a2,1cae <strncpy+0x21e>
    1c08:	0005c783          	lbu	a5,0(a1)
    1c0c:	ea078be3          	beqz	a5,1ac2 <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1c10:	479d                	li	a5,7
    1c12:	02c7ff63          	bgeu	a5,a2,1c50 <strncpy+0x1c0>
    1c16:	00000897          	auipc	a7,0x0
    1c1a:	4228b883          	ld	a7,1058(a7) # 2038 <__clone+0x108>
    1c1e:	00000817          	auipc	a6,0x0
    1c22:	42283803          	ld	a6,1058(a6) # 2040 <__clone+0x110>
    1c26:	431d                	li	t1,7
    1c28:	6198                	ld	a4,0(a1)
    1c2a:	011707b3          	add	a5,a4,a7
    1c2e:	fff74693          	not	a3,a4
    1c32:	8ff5                	and	a5,a5,a3
    1c34:	0107f7b3          	and	a5,a5,a6
    1c38:	ef81                	bnez	a5,1c50 <strncpy+0x1c0>
            *wd = *ws;
    1c3a:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1c3c:	1661                	addi	a2,a2,-8
    1c3e:	05a1                	addi	a1,a1,8
    1c40:	0521                	addi	a0,a0,8
    1c42:	fec363e3          	bltu	t1,a2,1c28 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1c46:	e609                	bnez	a2,1c50 <strncpy+0x1c0>
    1c48:	a08d                	j	1caa <strncpy+0x21a>
    1c4a:	167d                	addi	a2,a2,-1
    1c4c:	0505                	addi	a0,a0,1
    1c4e:	ca01                	beqz	a2,1c5e <strncpy+0x1ce>
    1c50:	0005c783          	lbu	a5,0(a1)
    1c54:	0585                	addi	a1,a1,1
    1c56:	00f50023          	sb	a5,0(a0)
    1c5a:	fbe5                	bnez	a5,1c4a <strncpy+0x1ba>
        ;
tail:
    1c5c:	b59d                	j	1ac2 <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1c5e:	8082                	ret
    1c60:	472d                	li	a4,11
    1c62:	bdb5                	j	1ade <strncpy+0x4e>
    1c64:	00778713          	addi	a4,a5,7
    1c68:	45ad                	li	a1,11
    1c6a:	fff60693          	addi	a3,a2,-1
    1c6e:	e6b778e3          	bgeu	a4,a1,1ade <strncpy+0x4e>
    1c72:	b7fd                	j	1c60 <strncpy+0x1d0>
    1c74:	40a007b3          	neg	a5,a0
    1c78:	8832                	mv	a6,a2
    1c7a:	8b9d                	andi	a5,a5,7
    1c7c:	4681                	li	a3,0
    1c7e:	e4060be3          	beqz	a2,1ad4 <strncpy+0x44>
    1c82:	b7cd                	j	1c64 <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c84:	468d                	li	a3,3
    1c86:	bd75                	j	1b42 <strncpy+0xb2>
    1c88:	872a                	mv	a4,a0
    1c8a:	4681                	li	a3,0
    1c8c:	bd5d                	j	1b42 <strncpy+0xb2>
    1c8e:	4685                	li	a3,1
    1c90:	bd4d                	j	1b42 <strncpy+0xb2>
    1c92:	8082                	ret
    1c94:	87aa                	mv	a5,a0
    1c96:	4681                	li	a3,0
    1c98:	b5f9                	j	1b66 <strncpy+0xd6>
    1c9a:	4689                	li	a3,2
    1c9c:	b55d                	j	1b42 <strncpy+0xb2>
    1c9e:	4691                	li	a3,4
    1ca0:	b54d                	j	1b42 <strncpy+0xb2>
    1ca2:	4695                	li	a3,5
    1ca4:	bd79                	j	1b42 <strncpy+0xb2>
    1ca6:	4699                	li	a3,6
    1ca8:	bd69                	j	1b42 <strncpy+0xb2>
    1caa:	8082                	ret
    1cac:	8082                	ret
    1cae:	8082                	ret

0000000000001cb0 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1cb0:	87aa                	mv	a5,a0
    1cb2:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1cb4:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1cb8:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1cbc:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1cbe:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cc0:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1cc4:	2501                	sext.w	a0,a0
    1cc6:	8082                	ret

0000000000001cc8 <openat>:
    register long a7 __asm__("a7") = n;
    1cc8:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1ccc:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cd0:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1cd4:	2501                	sext.w	a0,a0
    1cd6:	8082                	ret

0000000000001cd8 <fcntl>:
    register long a7 __asm__("a7") = n;
    1cd8:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cda:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1cde:	2501                	sext.w	a0,a0
    1ce0:	8082                	ret

0000000000001ce2 <close>:
    register long a7 __asm__("a7") = n;
    1ce2:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1ce6:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1cea:	2501                	sext.w	a0,a0
    1cec:	8082                	ret

0000000000001cee <read>:
    register long a7 __asm__("a7") = n;
    1cee:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cf2:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1cf6:	8082                	ret

0000000000001cf8 <write>:
    register long a7 __asm__("a7") = n;
    1cf8:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cfc:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d00:	8082                	ret

0000000000001d02 <getpid>:
    register long a7 __asm__("a7") = n;
    1d02:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d06:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d0a:	2501                	sext.w	a0,a0
    1d0c:	8082                	ret

0000000000001d0e <getppid>:
    register long a7 __asm__("a7") = n;
    1d0e:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d12:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d16:	2501                	sext.w	a0,a0
    1d18:	8082                	ret

0000000000001d1a <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d1a:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d1e:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d22:	2501                	sext.w	a0,a0
    1d24:	8082                	ret

0000000000001d26 <fork>:
    register long a7 __asm__("a7") = n;
    1d26:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d2a:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d2c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d2e:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d32:	2501                	sext.w	a0,a0
    1d34:	8082                	ret

0000000000001d36 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d36:	85b2                	mv	a1,a2
    1d38:	863a                	mv	a2,a4
    if (stack)
    1d3a:	c191                	beqz	a1,1d3e <clone+0x8>
	stack += stack_size;
    1d3c:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d3e:	4781                	li	a5,0
    1d40:	4701                	li	a4,0
    1d42:	4681                	li	a3,0
    1d44:	2601                	sext.w	a2,a2
    1d46:	a2ed                	j	1f30 <__clone>

0000000000001d48 <exit>:
    register long a7 __asm__("a7") = n;
    1d48:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d4c:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d50:	8082                	ret

0000000000001d52 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d52:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d56:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d58:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d5c:	2501                	sext.w	a0,a0
    1d5e:	8082                	ret

0000000000001d60 <exec>:
    register long a7 __asm__("a7") = n;
    1d60:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d64:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d68:	2501                	sext.w	a0,a0
    1d6a:	8082                	ret

0000000000001d6c <execve>:
    register long a7 __asm__("a7") = n;
    1d6c:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d70:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d74:	2501                	sext.w	a0,a0
    1d76:	8082                	ret

0000000000001d78 <times>:
    register long a7 __asm__("a7") = n;
    1d78:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d7c:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d80:	2501                	sext.w	a0,a0
    1d82:	8082                	ret

0000000000001d84 <get_time>:

int64 get_time()
{
    1d84:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d86:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d8a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d8c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d8e:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d92:	2501                	sext.w	a0,a0
    1d94:	ed09                	bnez	a0,1dae <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d96:	67a2                	ld	a5,8(sp)
    1d98:	3e800713          	li	a4,1000
    1d9c:	00015503          	lhu	a0,0(sp)
    1da0:	02e7d7b3          	divu	a5,a5,a4
    1da4:	02e50533          	mul	a0,a0,a4
    1da8:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1daa:	0141                	addi	sp,sp,16
    1dac:	8082                	ret
        return -1;
    1dae:	557d                	li	a0,-1
    1db0:	bfed                	j	1daa <get_time+0x26>

0000000000001db2 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1db2:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db6:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1dba:	2501                	sext.w	a0,a0
    1dbc:	8082                	ret

0000000000001dbe <time>:
    register long a7 __asm__("a7") = n;
    1dbe:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1dc2:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1dc6:	2501                	sext.w	a0,a0
    1dc8:	8082                	ret

0000000000001dca <sleep>:

int sleep(unsigned long long time)
{
    1dca:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1dcc:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1dce:	850a                	mv	a0,sp
    1dd0:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1dd2:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1dd6:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dd8:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1ddc:	e501                	bnez	a0,1de4 <sleep+0x1a>
    return 0;
    1dde:	4501                	li	a0,0
}
    1de0:	0141                	addi	sp,sp,16
    1de2:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1de4:	4502                	lw	a0,0(sp)
}
    1de6:	0141                	addi	sp,sp,16
    1de8:	8082                	ret

0000000000001dea <set_priority>:
    register long a7 __asm__("a7") = n;
    1dea:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1dee:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1df2:	2501                	sext.w	a0,a0
    1df4:	8082                	ret

0000000000001df6 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1df6:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1dfa:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1dfe:	8082                	ret

0000000000001e00 <munmap>:
    register long a7 __asm__("a7") = n;
    1e00:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e04:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e08:	2501                	sext.w	a0,a0
    1e0a:	8082                	ret

0000000000001e0c <wait>:

int wait(int *code)
{
    1e0c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e0e:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e12:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e14:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e16:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e18:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e1c:	2501                	sext.w	a0,a0
    1e1e:	8082                	ret

0000000000001e20 <spawn>:
    register long a7 __asm__("a7") = n;
    1e20:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e24:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <mailread>:
    register long a7 __asm__("a7") = n;
    1e2c:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e30:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e38:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e3c:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e40:	2501                	sext.w	a0,a0
    1e42:	8082                	ret

0000000000001e44 <fstat>:
    register long a7 __asm__("a7") = n;
    1e44:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e48:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e4c:	2501                	sext.w	a0,a0
    1e4e:	8082                	ret

0000000000001e50 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e50:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e52:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e56:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e58:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e5c:	2501                	sext.w	a0,a0
    1e5e:	8082                	ret

0000000000001e60 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e60:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e62:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e66:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e68:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e6c:	2501                	sext.w	a0,a0
    1e6e:	8082                	ret

0000000000001e70 <link>:

int link(char *old_path, char *new_path)
{
    1e70:	87aa                	mv	a5,a0
    1e72:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e74:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e78:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e7c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e7e:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e82:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e84:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e88:	2501                	sext.w	a0,a0
    1e8a:	8082                	ret

0000000000001e8c <unlink>:

int unlink(char *path)
{
    1e8c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e8e:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e92:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e96:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e98:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e9c:	2501                	sext.w	a0,a0
    1e9e:	8082                	ret

0000000000001ea0 <uname>:
    register long a7 __asm__("a7") = n;
    1ea0:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1ea4:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1ea8:	2501                	sext.w	a0,a0
    1eaa:	8082                	ret

0000000000001eac <brk>:
    register long a7 __asm__("a7") = n;
    1eac:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1eb0:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1eb4:	2501                	sext.w	a0,a0
    1eb6:	8082                	ret

0000000000001eb8 <getcwd>:
    register long a7 __asm__("a7") = n;
    1eb8:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eba:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1ebe:	8082                	ret

0000000000001ec0 <chdir>:
    register long a7 __asm__("a7") = n;
    1ec0:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1ec4:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1ec8:	2501                	sext.w	a0,a0
    1eca:	8082                	ret

0000000000001ecc <mkdir>:

int mkdir(const char *path, mode_t mode){
    1ecc:	862e                	mv	a2,a1
    1ece:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1ed0:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ed2:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1ed6:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1eda:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1edc:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ede:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1ee2:	2501                	sext.w	a0,a0
    1ee4:	8082                	ret

0000000000001ee6 <getdents>:
    register long a7 __asm__("a7") = n;
    1ee6:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eea:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1eee:	2501                	sext.w	a0,a0
    1ef0:	8082                	ret

0000000000001ef2 <pipe>:
    register long a7 __asm__("a7") = n;
    1ef2:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1ef6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ef8:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1efc:	2501                	sext.w	a0,a0
    1efe:	8082                	ret

0000000000001f00 <dup>:
    register long a7 __asm__("a7") = n;
    1f00:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f02:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f06:	2501                	sext.w	a0,a0
    1f08:	8082                	ret

0000000000001f0a <dup2>:
    register long a7 __asm__("a7") = n;
    1f0a:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f0c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f0e:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f12:	2501                	sext.w	a0,a0
    1f14:	8082                	ret

0000000000001f16 <mount>:
    register long a7 __asm__("a7") = n;
    1f16:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f1a:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f1e:	2501                	sext.w	a0,a0
    1f20:	8082                	ret

0000000000001f22 <umount>:
    register long a7 __asm__("a7") = n;
    1f22:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f26:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f28:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f2c:	2501                	sext.w	a0,a0
    1f2e:	8082                	ret

0000000000001f30 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f30:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1f32:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f34:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f36:	8532                	mv	a0,a2
	mv a2, a4
    1f38:	863a                	mv	a2,a4
	mv a3, a5
    1f3a:	86be                	mv	a3,a5
	mv a4, a6
    1f3c:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f3e:	0dc00893          	li	a7,220
	ecall
    1f42:	00000073          	ecall

	beqz a0, 1f
    1f46:	c111                	beqz	a0,1f4a <__clone+0x1a>
	# Parent
	ret
    1f48:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f4a:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f4c:	6522                	ld	a0,8(sp)
	jalr a1
    1f4e:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f50:	05d00893          	li	a7,93
	ecall
    1f54:	00000073          	ecall
