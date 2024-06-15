
/home/brightnight/OScompetition/6.13晚final_main/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/umount：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	aa21                	j	111a <__start_main>

0000000000001004 <test_umount>:

static char mntpoint[64] = "./mnt";
static char device[64] = "/dev/vda2";
static const char *fs_type = "vfat";

void test_umount() {
    1004:	1101                	addi	sp,sp,-32
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f5a50513          	addi	a0,a0,-166 # 1f60 <__clone+0x28>
void test_umount() {
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
	TEST_START(__func__);
    1012:	37a000ef          	jal	ra,138c <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	09a50513          	addi	a0,a0,154 # 20b0 <__func__.0>
    101e:	36e000ef          	jal	ra,138c <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	f5650513          	addi	a0,a0,-170 # 1f78 <__clone+0x40>
    102a:	362000ef          	jal	ra,138c <puts>

	printf("Mounting dev:%s to %s\n", device, mntpoint);
    102e:	00001617          	auipc	a2,0x1
    1032:	00260613          	addi	a2,a2,2 # 2030 <mntpoint>
    1036:	00001597          	auipc	a1,0x1
    103a:	03a58593          	addi	a1,a1,58 # 2070 <device>
    103e:	00001517          	auipc	a0,0x1
    1042:	f4a50513          	addi	a0,a0,-182 # 1f88 <__clone+0x50>
    1046:	368000ef          	jal	ra,13ae <printf>
	int ret = mount(device, mntpoint, fs_type, 0, NULL);
    104a:	00001597          	auipc	a1,0x1
    104e:	fe658593          	addi	a1,a1,-26 # 2030 <mntpoint>
    1052:	4701                	li	a4,0
    1054:	4681                	li	a3,0
    1056:	00001617          	auipc	a2,0x1
    105a:	f4a60613          	addi	a2,a2,-182 # 1fa0 <__clone+0x68>
    105e:	00001517          	auipc	a0,0x1
    1062:	01250513          	addi	a0,a0,18 # 2070 <device>
    1066:	6b9000ef          	jal	ra,1f1e <mount>
    106a:	842a                	mv	s0,a0
	printf("mount return: %d\n", ret);
    106c:	85aa                	mv	a1,a0
    106e:	00001517          	auipc	a0,0x1
    1072:	f3a50513          	addi	a0,a0,-198 # 1fa8 <__clone+0x70>
    1076:	338000ef          	jal	ra,13ae <printf>

	if (ret == 0) {
    107a:	c40d                	beqz	s0,10a4 <test_umount+0xa0>
		ret = umount(mntpoint);
		assert(ret == 0);
		printf("umount success.\nreturn: %d\n", ret);
	}

	TEST_END(__func__);
    107c:	00001517          	auipc	a0,0x1
    1080:	f8450513          	addi	a0,a0,-124 # 2000 <__clone+0xc8>
    1084:	308000ef          	jal	ra,138c <puts>
    1088:	00001517          	auipc	a0,0x1
    108c:	02850513          	addi	a0,a0,40 # 20b0 <__func__.0>
    1090:	2fc000ef          	jal	ra,138c <puts>
}
    1094:	6442                	ld	s0,16(sp)
    1096:	60e2                	ld	ra,24(sp)
	TEST_END(__func__);
    1098:	00001517          	auipc	a0,0x1
    109c:	ee050513          	addi	a0,a0,-288 # 1f78 <__clone+0x40>
}
    10a0:	6105                	addi	sp,sp,32
	TEST_END(__func__);
    10a2:	a4ed                	j	138c <puts>
		ret = umount(mntpoint);
    10a4:	00001517          	auipc	a0,0x1
    10a8:	f8c50513          	addi	a0,a0,-116 # 2030 <mntpoint>
    10ac:	67f000ef          	jal	ra,1f2a <umount>
    10b0:	85aa                	mv	a1,a0
		assert(ret == 0);
    10b2:	e901                	bnez	a0,10c2 <test_umount+0xbe>
		printf("umount success.\nreturn: %d\n", ret);
    10b4:	00001517          	auipc	a0,0x1
    10b8:	f2c50513          	addi	a0,a0,-212 # 1fe0 <__clone+0xa8>
    10bc:	2f2000ef          	jal	ra,13ae <printf>
    10c0:	bf75                	j	107c <test_umount+0x78>
    10c2:	e42a                	sd	a0,8(sp)
		assert(ret == 0);
    10c4:	00001517          	auipc	a0,0x1
    10c8:	efc50513          	addi	a0,a0,-260 # 1fc0 <__clone+0x88>
    10cc:	566000ef          	jal	ra,1632 <panic>
    10d0:	65a2                	ld	a1,8(sp)
    10d2:	b7cd                	j	10b4 <test_umount+0xb0>

00000000000010d4 <main>:

int main(int argc,char *argv[]) {
    10d4:	1101                	addi	sp,sp,-32
    10d6:	ec06                	sd	ra,24(sp)
    10d8:	e822                	sd	s0,16(sp)
    10da:	e426                	sd	s1,8(sp)
	if(argc >= 2){
    10dc:	4785                	li	a5,1
    10de:	00a7ca63          	blt	a5,a0,10f2 <main+0x1e>

	if(argc >= 3){
		strcpy(mntpoint, argv[2]);
	}

	test_umount();
    10e2:	f23ff0ef          	jal	ra,1004 <test_umount>
	return 0;
}
    10e6:	60e2                	ld	ra,24(sp)
    10e8:	6442                	ld	s0,16(sp)
    10ea:	64a2                	ld	s1,8(sp)
    10ec:	4501                	li	a0,0
    10ee:	6105                	addi	sp,sp,32
    10f0:	8082                	ret
		strcpy(device, argv[1]);
    10f2:	84ae                	mv	s1,a1
    10f4:	658c                	ld	a1,8(a1)
    10f6:	842a                	mv	s0,a0
    10f8:	00001517          	auipc	a0,0x1
    10fc:	f7850513          	addi	a0,a0,-136 # 2070 <device>
    1100:	12d000ef          	jal	ra,1a2c <strcpy>
	if(argc >= 3){
    1104:	4789                	li	a5,2
    1106:	fcf40ee3          	beq	s0,a5,10e2 <main+0xe>
		strcpy(mntpoint, argv[2]);
    110a:	688c                	ld	a1,16(s1)
    110c:	00001517          	auipc	a0,0x1
    1110:	f2450513          	addi	a0,a0,-220 # 2030 <mntpoint>
    1114:	119000ef          	jal	ra,1a2c <strcpy>
    1118:	b7e9                	j	10e2 <main+0xe>

000000000000111a <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    111a:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    111c:	4108                	lw	a0,0(a0)
{
    111e:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    1120:	05a1                	addi	a1,a1,8
{
    1122:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1124:	fb1ff0ef          	jal	ra,10d4 <main>
    1128:	429000ef          	jal	ra,1d50 <exit>
	return 0;
}
    112c:	60a2                	ld	ra,8(sp)
    112e:	4501                	li	a0,0
    1130:	0141                	addi	sp,sp,16
    1132:	8082                	ret

0000000000001134 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1134:	7179                	addi	sp,sp,-48
    1136:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1138:	12054b63          	bltz	a0,126e <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    113c:	02b577bb          	remuw	a5,a0,a1
    1140:	00001617          	auipc	a2,0x1
    1144:	f8060613          	addi	a2,a2,-128 # 20c0 <digits>
    buf[16] = 0;
    1148:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    114c:	0005871b          	sext.w	a4,a1
    1150:	1782                	slli	a5,a5,0x20
    1152:	9381                	srli	a5,a5,0x20
    1154:	97b2                	add	a5,a5,a2
    1156:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    115a:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    115e:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1162:	1cb56363          	bltu	a0,a1,1328 <printint.constprop.0+0x1f4>
        buf[i--] = digits[x % base];
    1166:	45b9                	li	a1,14
    1168:	02e877bb          	remuw	a5,a6,a4
    116c:	1782                	slli	a5,a5,0x20
    116e:	9381                	srli	a5,a5,0x20
    1170:	97b2                	add	a5,a5,a2
    1172:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1176:	02e856bb          	divuw	a3,a6,a4
        buf[i--] = digits[x % base];
    117a:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    117e:	0ce86e63          	bltu	a6,a4,125a <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    1182:	02e6f5bb          	remuw	a1,a3,a4
    } while ((x /= base) != 0);
    1186:	02e6d7bb          	divuw	a5,a3,a4
        buf[i--] = digits[x % base];
    118a:	1582                	slli	a1,a1,0x20
    118c:	9181                	srli	a1,a1,0x20
    118e:	95b2                	add	a1,a1,a2
    1190:	0005c583          	lbu	a1,0(a1)
    1194:	00b10aa3          	sb	a1,21(sp)
    } while ((x /= base) != 0);
    1198:	0007859b          	sext.w	a1,a5
    119c:	12e6ec63          	bltu	a3,a4,12d4 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    11a0:	02e7f6bb          	remuw	a3,a5,a4
    11a4:	1682                	slli	a3,a3,0x20
    11a6:	9281                	srli	a3,a3,0x20
    11a8:	96b2                	add	a3,a3,a2
    11aa:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11ae:	02e7d83b          	divuw	a6,a5,a4
        buf[i--] = digits[x % base];
    11b2:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    11b6:	12e5e863          	bltu	a1,a4,12e6 <printint.constprop.0+0x1b2>
        buf[i--] = digits[x % base];
    11ba:	02e876bb          	remuw	a3,a6,a4
    11be:	1682                	slli	a3,a3,0x20
    11c0:	9281                	srli	a3,a3,0x20
    11c2:	96b2                	add	a3,a3,a2
    11c4:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11c8:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11cc:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    11d0:	12e86463          	bltu	a6,a4,12f8 <printint.constprop.0+0x1c4>
        buf[i--] = digits[x % base];
    11d4:	02e5f6bb          	remuw	a3,a1,a4
    11d8:	1682                	slli	a3,a3,0x20
    11da:	9281                	srli	a3,a3,0x20
    11dc:	96b2                	add	a3,a3,a2
    11de:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11e2:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11e6:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    11ea:	0ce5ec63          	bltu	a1,a4,12c2 <printint.constprop.0+0x18e>
        buf[i--] = digits[x % base];
    11ee:	02e876bb          	remuw	a3,a6,a4
    11f2:	1682                	slli	a3,a3,0x20
    11f4:	9281                	srli	a3,a3,0x20
    11f6:	96b2                	add	a3,a3,a2
    11f8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11fc:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1200:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1204:	10e86963          	bltu	a6,a4,1316 <printint.constprop.0+0x1e2>
        buf[i--] = digits[x % base];
    1208:	02e5f6bb          	remuw	a3,a1,a4
    120c:	1682                	slli	a3,a3,0x20
    120e:	9281                	srli	a3,a3,0x20
    1210:	96b2                	add	a3,a3,a2
    1212:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1216:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    121a:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    121e:	10e5e763          	bltu	a1,a4,132c <printint.constprop.0+0x1f8>
        buf[i--] = digits[x % base];
    1222:	02e876bb          	remuw	a3,a6,a4
    1226:	1682                	slli	a3,a3,0x20
    1228:	9281                	srli	a3,a3,0x20
    122a:	96b2                	add	a3,a3,a2
    122c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1230:	02e857bb          	divuw	a5,a6,a4
        buf[i--] = digits[x % base];
    1234:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    1238:	10e86363          	bltu	a6,a4,133e <printint.constprop.0+0x20a>
        buf[i--] = digits[x % base];
    123c:	1782                	slli	a5,a5,0x20
    123e:	9381                	srli	a5,a5,0x20
    1240:	97b2                	add	a5,a5,a2
    1242:	0007c783          	lbu	a5,0(a5)
    1246:	4599                	li	a1,6
    1248:	00f10723          	sb	a5,14(sp)

    if (sign)
    124c:	00055763          	bgez	a0,125a <printint.constprop.0+0x126>
        buf[i--] = '-';
    1250:	02d00793          	li	a5,45
    1254:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1258:	4595                	li	a1,5
    write(f, s, l);
    125a:	003c                	addi	a5,sp,8
    125c:	4641                	li	a2,16
    125e:	9e0d                	subw	a2,a2,a1
    1260:	4505                	li	a0,1
    1262:	95be                	add	a1,a1,a5
    1264:	29d000ef          	jal	ra,1d00 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1268:	70a2                	ld	ra,40(sp)
    126a:	6145                	addi	sp,sp,48
    126c:	8082                	ret
        x = -xx;
    126e:	40a0083b          	negw	a6,a0
        buf[i--] = digits[x % base];
    1272:	02b877bb          	remuw	a5,a6,a1
    1276:	00001617          	auipc	a2,0x1
    127a:	e4a60613          	addi	a2,a2,-438 # 20c0 <digits>
    buf[16] = 0;
    127e:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1282:	0005871b          	sext.w	a4,a1
    1286:	1782                	slli	a5,a5,0x20
    1288:	9381                	srli	a5,a5,0x20
    128a:	97b2                	add	a5,a5,a2
    128c:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1290:	02b858bb          	divuw	a7,a6,a1
        buf[i--] = digits[x % base];
    1294:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1298:	06b86963          	bltu	a6,a1,130a <printint.constprop.0+0x1d6>
        buf[i--] = digits[x % base];
    129c:	02e8f7bb          	remuw	a5,a7,a4
    12a0:	1782                	slli	a5,a5,0x20
    12a2:	9381                	srli	a5,a5,0x20
    12a4:	97b2                	add	a5,a5,a2
    12a6:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    12aa:	02e8d6bb          	divuw	a3,a7,a4
        buf[i--] = digits[x % base];
    12ae:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    12b2:	ece8f8e3          	bgeu	a7,a4,1182 <printint.constprop.0+0x4e>
        buf[i--] = '-';
    12b6:	02d00793          	li	a5,45
    12ba:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    12be:	45b5                	li	a1,13
    12c0:	bf69                	j	125a <printint.constprop.0+0x126>
    12c2:	45a9                	li	a1,10
    if (sign)
    12c4:	f8055be3          	bgez	a0,125a <printint.constprop.0+0x126>
        buf[i--] = '-';
    12c8:	02d00793          	li	a5,45
    12cc:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    12d0:	45a5                	li	a1,9
    12d2:	b761                	j	125a <printint.constprop.0+0x126>
    12d4:	45b5                	li	a1,13
    if (sign)
    12d6:	f80552e3          	bgez	a0,125a <printint.constprop.0+0x126>
        buf[i--] = '-';
    12da:	02d00793          	li	a5,45
    12de:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    12e2:	45b1                	li	a1,12
    12e4:	bf9d                	j	125a <printint.constprop.0+0x126>
    12e6:	45b1                	li	a1,12
    if (sign)
    12e8:	f60559e3          	bgez	a0,125a <printint.constprop.0+0x126>
        buf[i--] = '-';
    12ec:	02d00793          	li	a5,45
    12f0:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12f4:	45ad                	li	a1,11
    12f6:	b795                	j	125a <printint.constprop.0+0x126>
    12f8:	45ad                	li	a1,11
    if (sign)
    12fa:	f60550e3          	bgez	a0,125a <printint.constprop.0+0x126>
        buf[i--] = '-';
    12fe:	02d00793          	li	a5,45
    1302:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1306:	45a9                	li	a1,10
    1308:	bf89                	j	125a <printint.constprop.0+0x126>
        buf[i--] = '-';
    130a:	02d00793          	li	a5,45
    130e:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1312:	45b9                	li	a1,14
    1314:	b799                	j	125a <printint.constprop.0+0x126>
    1316:	45a5                	li	a1,9
    if (sign)
    1318:	f40551e3          	bgez	a0,125a <printint.constprop.0+0x126>
        buf[i--] = '-';
    131c:	02d00793          	li	a5,45
    1320:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1324:	45a1                	li	a1,8
    1326:	bf15                	j	125a <printint.constprop.0+0x126>
    i = 15;
    1328:	45bd                	li	a1,15
    132a:	bf05                	j	125a <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    132c:	45a1                	li	a1,8
    if (sign)
    132e:	f20556e3          	bgez	a0,125a <printint.constprop.0+0x126>
        buf[i--] = '-';
    1332:	02d00793          	li	a5,45
    1336:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    133a:	459d                	li	a1,7
    133c:	bf39                	j	125a <printint.constprop.0+0x126>
    133e:	459d                	li	a1,7
    if (sign)
    1340:	f0055de3          	bgez	a0,125a <printint.constprop.0+0x126>
        buf[i--] = '-';
    1344:	02d00793          	li	a5,45
    1348:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    134c:	4599                	li	a1,6
    134e:	b731                	j	125a <printint.constprop.0+0x126>

0000000000001350 <getchar>:
{
    1350:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1352:	00f10593          	addi	a1,sp,15
    1356:	4605                	li	a2,1
    1358:	4501                	li	a0,0
{
    135a:	ec06                	sd	ra,24(sp)
    char byte = 0;
    135c:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1360:	197000ef          	jal	ra,1cf6 <read>
}
    1364:	60e2                	ld	ra,24(sp)
    1366:	00f14503          	lbu	a0,15(sp)
    136a:	6105                	addi	sp,sp,32
    136c:	8082                	ret

000000000000136e <putchar>:
{
    136e:	1101                	addi	sp,sp,-32
    1370:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1372:	00f10593          	addi	a1,sp,15
    1376:	4605                	li	a2,1
    1378:	4505                	li	a0,1
{
    137a:	ec06                	sd	ra,24(sp)
    char byte = c;
    137c:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1380:	181000ef          	jal	ra,1d00 <write>
}
    1384:	60e2                	ld	ra,24(sp)
    1386:	2501                	sext.w	a0,a0
    1388:	6105                	addi	sp,sp,32
    138a:	8082                	ret

000000000000138c <puts>:
{
    138c:	1141                	addi	sp,sp,-16
    138e:	e406                	sd	ra,8(sp)
    1390:	e022                	sd	s0,0(sp)
    1392:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1394:	57e000ef          	jal	ra,1912 <strlen>
    1398:	862a                	mv	a2,a0
    139a:	85a2                	mv	a1,s0
    139c:	4505                	li	a0,1
    139e:	163000ef          	jal	ra,1d00 <write>
}
    13a2:	60a2                	ld	ra,8(sp)
    13a4:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    13a6:	957d                	srai	a0,a0,0x3f
    return r;
    13a8:	2501                	sext.w	a0,a0
}
    13aa:	0141                	addi	sp,sp,16
    13ac:	8082                	ret

00000000000013ae <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    13ae:	7171                	addi	sp,sp,-176
    13b0:	fc56                	sd	s5,56(sp)
    13b2:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    13b4:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    13b6:	18bc                	addi	a5,sp,120
{
    13b8:	e8ca                	sd	s2,80(sp)
    13ba:	e4ce                	sd	s3,72(sp)
    13bc:	e0d2                	sd	s4,64(sp)
    13be:	f85a                	sd	s6,48(sp)
    13c0:	f486                	sd	ra,104(sp)
    13c2:	f0a2                	sd	s0,96(sp)
    13c4:	eca6                	sd	s1,88(sp)
    13c6:	fcae                	sd	a1,120(sp)
    13c8:	e132                	sd	a2,128(sp)
    13ca:	e536                	sd	a3,136(sp)
    13cc:	e93a                	sd	a4,144(sp)
    13ce:	f142                	sd	a6,160(sp)
    13d0:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    13d2:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    13d4:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    13d8:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    13dc:	00001b17          	auipc	s6,0x1
    13e0:	c34b0b13          	addi	s6,s6,-972 # 2010 <__clone+0xd8>
    buf[i++] = '0';
    13e4:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13e8:	00001997          	auipc	s3,0x1
    13ec:	cd898993          	addi	s3,s3,-808 # 20c0 <digits>
        if (!*s)
    13f0:	00054783          	lbu	a5,0(a0)
    13f4:	16078a63          	beqz	a5,1568 <printf+0x1ba>
    13f8:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13fa:	19278163          	beq	a5,s2,157c <printf+0x1ce>
    13fe:	00164783          	lbu	a5,1(a2)
    1402:	0605                	addi	a2,a2,1
    1404:	fbfd                	bnez	a5,13fa <printf+0x4c>
    1406:	84b2                	mv	s1,a2
        l = z - a;
    1408:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    140c:	85aa                	mv	a1,a0
    140e:	8622                	mv	a2,s0
    1410:	4505                	li	a0,1
    1412:	0ef000ef          	jal	ra,1d00 <write>
        if (l)
    1416:	18041c63          	bnez	s0,15ae <printf+0x200>
        if (s[1] == 0)
    141a:	0014c783          	lbu	a5,1(s1)
    141e:	14078563          	beqz	a5,1568 <printf+0x1ba>
        switch (s[1])
    1422:	1d478063          	beq	a5,s4,15e2 <printf+0x234>
    1426:	18fa6663          	bltu	s4,a5,15b2 <printf+0x204>
    142a:	06400713          	li	a4,100
    142e:	1ae78063          	beq	a5,a4,15ce <printf+0x220>
    1432:	07000713          	li	a4,112
    1436:	1ce79963          	bne	a5,a4,1608 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    143a:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    143c:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1440:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1442:	631c                	ld	a5,0(a4)
    1444:	0721                	addi	a4,a4,8
    1446:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1448:	00479293          	slli	t0,a5,0x4
    144c:	00879f93          	slli	t6,a5,0x8
    1450:	00c79f13          	slli	t5,a5,0xc
    1454:	01079e93          	slli	t4,a5,0x10
    1458:	01479e13          	slli	t3,a5,0x14
    145c:	01879313          	slli	t1,a5,0x18
    1460:	01c79893          	slli	a7,a5,0x1c
    1464:	02479813          	slli	a6,a5,0x24
    1468:	02879513          	slli	a0,a5,0x28
    146c:	02c79593          	slli	a1,a5,0x2c
    1470:	03079693          	slli	a3,a5,0x30
    1474:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1478:	03c7d413          	srli	s0,a5,0x3c
    147c:	01c7d39b          	srliw	t2,a5,0x1c
    1480:	03c2d293          	srli	t0,t0,0x3c
    1484:	03cfdf93          	srli	t6,t6,0x3c
    1488:	03cf5f13          	srli	t5,t5,0x3c
    148c:	03cede93          	srli	t4,t4,0x3c
    1490:	03ce5e13          	srli	t3,t3,0x3c
    1494:	03c35313          	srli	t1,t1,0x3c
    1498:	03c8d893          	srli	a7,a7,0x3c
    149c:	03c85813          	srli	a6,a6,0x3c
    14a0:	9171                	srli	a0,a0,0x3c
    14a2:	91f1                	srli	a1,a1,0x3c
    14a4:	92f1                	srli	a3,a3,0x3c
    14a6:	9371                	srli	a4,a4,0x3c
    14a8:	96ce                	add	a3,a3,s3
    14aa:	974e                	add	a4,a4,s3
    14ac:	944e                	add	s0,s0,s3
    14ae:	92ce                	add	t0,t0,s3
    14b0:	9fce                	add	t6,t6,s3
    14b2:	9f4e                	add	t5,t5,s3
    14b4:	9ece                	add	t4,t4,s3
    14b6:	9e4e                	add	t3,t3,s3
    14b8:	934e                	add	t1,t1,s3
    14ba:	98ce                	add	a7,a7,s3
    14bc:	93ce                	add	t2,t2,s3
    14be:	984e                	add	a6,a6,s3
    14c0:	954e                	add	a0,a0,s3
    14c2:	95ce                	add	a1,a1,s3
    14c4:	0006c083          	lbu	ra,0(a3)
    14c8:	0002c283          	lbu	t0,0(t0)
    14cc:	00074683          	lbu	a3,0(a4)
    14d0:	000fcf83          	lbu	t6,0(t6)
    14d4:	000f4f03          	lbu	t5,0(t5)
    14d8:	000ece83          	lbu	t4,0(t4)
    14dc:	000e4e03          	lbu	t3,0(t3)
    14e0:	00034303          	lbu	t1,0(t1)
    14e4:	0008c883          	lbu	a7,0(a7)
    14e8:	0003c383          	lbu	t2,0(t2)
    14ec:	00084803          	lbu	a6,0(a6)
    14f0:	00054503          	lbu	a0,0(a0)
    14f4:	0005c583          	lbu	a1,0(a1)
    14f8:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14fc:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1500:	9371                	srli	a4,a4,0x3c
    1502:	8bbd                	andi	a5,a5,15
    1504:	974e                	add	a4,a4,s3
    1506:	97ce                	add	a5,a5,s3
    1508:	005105a3          	sb	t0,11(sp)
    150c:	01f10623          	sb	t6,12(sp)
    1510:	01e106a3          	sb	t5,13(sp)
    1514:	01d10723          	sb	t4,14(sp)
    1518:	01c107a3          	sb	t3,15(sp)
    151c:	00610823          	sb	t1,16(sp)
    1520:	011108a3          	sb	a7,17(sp)
    1524:	00710923          	sb	t2,18(sp)
    1528:	010109a3          	sb	a6,19(sp)
    152c:	00a10a23          	sb	a0,20(sp)
    1530:	00b10aa3          	sb	a1,21(sp)
    1534:	00110b23          	sb	ra,22(sp)
    1538:	00d10ba3          	sb	a3,23(sp)
    153c:	00810523          	sb	s0,10(sp)
    1540:	00074703          	lbu	a4,0(a4)
    1544:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1548:	002c                	addi	a1,sp,8
    154a:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    154c:	00e10c23          	sb	a4,24(sp)
    1550:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1554:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1558:	7a8000ef          	jal	ra,1d00 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    155c:	00248513          	addi	a0,s1,2
        if (!*s)
    1560:	00054783          	lbu	a5,0(a0)
    1564:	e8079ae3          	bnez	a5,13f8 <printf+0x4a>
    }
    va_end(ap);
}
    1568:	70a6                	ld	ra,104(sp)
    156a:	7406                	ld	s0,96(sp)
    156c:	64e6                	ld	s1,88(sp)
    156e:	6946                	ld	s2,80(sp)
    1570:	69a6                	ld	s3,72(sp)
    1572:	6a06                	ld	s4,64(sp)
    1574:	7ae2                	ld	s5,56(sp)
    1576:	7b42                	ld	s6,48(sp)
    1578:	614d                	addi	sp,sp,176
    157a:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    157c:	00064783          	lbu	a5,0(a2)
    1580:	84b2                	mv	s1,a2
    1582:	01278963          	beq	a5,s2,1594 <printf+0x1e6>
    1586:	b549                	j	1408 <printf+0x5a>
    1588:	0024c783          	lbu	a5,2(s1)
    158c:	0605                	addi	a2,a2,1
    158e:	0489                	addi	s1,s1,2
    1590:	e7279ce3          	bne	a5,s2,1408 <printf+0x5a>
    1594:	0014c783          	lbu	a5,1(s1)
    1598:	ff2788e3          	beq	a5,s2,1588 <printf+0x1da>
        l = z - a;
    159c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    15a0:	85aa                	mv	a1,a0
    15a2:	8622                	mv	a2,s0
    15a4:	4505                	li	a0,1
    15a6:	75a000ef          	jal	ra,1d00 <write>
        if (l)
    15aa:	e60408e3          	beqz	s0,141a <printf+0x6c>
    15ae:	8526                	mv	a0,s1
    15b0:	b581                	j	13f0 <printf+0x42>
        switch (s[1])
    15b2:	07800713          	li	a4,120
    15b6:	04e79963          	bne	a5,a4,1608 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    15ba:	6782                	ld	a5,0(sp)
    15bc:	45c1                	li	a1,16
    15be:	4388                	lw	a0,0(a5)
    15c0:	07a1                	addi	a5,a5,8
    15c2:	e03e                	sd	a5,0(sp)
    15c4:	b71ff0ef          	jal	ra,1134 <printint.constprop.0>
        s += 2;
    15c8:	00248513          	addi	a0,s1,2
    15cc:	bf51                	j	1560 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    15ce:	6782                	ld	a5,0(sp)
    15d0:	45a9                	li	a1,10
    15d2:	4388                	lw	a0,0(a5)
    15d4:	07a1                	addi	a5,a5,8
    15d6:	e03e                	sd	a5,0(sp)
    15d8:	b5dff0ef          	jal	ra,1134 <printint.constprop.0>
        s += 2;
    15dc:	00248513          	addi	a0,s1,2
    15e0:	b741                	j	1560 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    15e2:	6782                	ld	a5,0(sp)
    15e4:	6380                	ld	s0,0(a5)
    15e6:	07a1                	addi	a5,a5,8
    15e8:	e03e                	sd	a5,0(sp)
    15ea:	c031                	beqz	s0,162e <printf+0x280>
            l = strnlen(a, 200);
    15ec:	0c800593          	li	a1,200
    15f0:	8522                	mv	a0,s0
    15f2:	40c000ef          	jal	ra,19fe <strnlen>
    write(f, s, l);
    15f6:	0005061b          	sext.w	a2,a0
    15fa:	85a2                	mv	a1,s0
    15fc:	4505                	li	a0,1
    15fe:	702000ef          	jal	ra,1d00 <write>
        s += 2;
    1602:	00248513          	addi	a0,s1,2
    1606:	bfa9                	j	1560 <printf+0x1b2>
    return write(stdout, &byte, 1);
    1608:	4605                	li	a2,1
    160a:	002c                	addi	a1,sp,8
    160c:	4505                	li	a0,1
    char byte = c;
    160e:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1612:	6ee000ef          	jal	ra,1d00 <write>
    char byte = c;
    1616:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    161a:	4605                	li	a2,1
    161c:	002c                	addi	a1,sp,8
    161e:	4505                	li	a0,1
    char byte = c;
    1620:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1624:	6dc000ef          	jal	ra,1d00 <write>
        s += 2;
    1628:	00248513          	addi	a0,s1,2
    162c:	bf15                	j	1560 <printf+0x1b2>
                a = "(null)";
    162e:	845a                	mv	s0,s6
    1630:	bf75                	j	15ec <printf+0x23e>

0000000000001632 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1632:	1141                	addi	sp,sp,-16
    1634:	e406                	sd	ra,8(sp)
    puts(m);
    1636:	d57ff0ef          	jal	ra,138c <puts>
    exit(-100);
}
    163a:	60a2                	ld	ra,8(sp)
    exit(-100);
    163c:	f9c00513          	li	a0,-100
}
    1640:	0141                	addi	sp,sp,16
    exit(-100);
    1642:	a739                	j	1d50 <exit>

0000000000001644 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1644:	02000793          	li	a5,32
    1648:	00f50663          	beq	a0,a5,1654 <isspace+0x10>
    164c:	355d                	addiw	a0,a0,-9
    164e:	00553513          	sltiu	a0,a0,5
    1652:	8082                	ret
    1654:	4505                	li	a0,1
}
    1656:	8082                	ret

0000000000001658 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1658:	fd05051b          	addiw	a0,a0,-48
}
    165c:	00a53513          	sltiu	a0,a0,10
    1660:	8082                	ret

0000000000001662 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1662:	02000613          	li	a2,32
    1666:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1668:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    166c:	ff77869b          	addiw	a3,a5,-9
    1670:	04c78c63          	beq	a5,a2,16c8 <atoi+0x66>
    1674:	0007871b          	sext.w	a4,a5
    1678:	04d5f863          	bgeu	a1,a3,16c8 <atoi+0x66>
        s++;
    switch (*s)
    167c:	02b00693          	li	a3,43
    1680:	04d78963          	beq	a5,a3,16d2 <atoi+0x70>
    1684:	02d00693          	li	a3,45
    1688:	06d78263          	beq	a5,a3,16ec <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    168c:	fd07061b          	addiw	a2,a4,-48
    1690:	47a5                	li	a5,9
    1692:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1694:	4e01                	li	t3,0
    while (isdigit(*s))
    1696:	04c7e963          	bltu	a5,a2,16e8 <atoi+0x86>
    int n = 0, neg = 0;
    169a:	4501                	li	a0,0
    while (isdigit(*s))
    169c:	4825                	li	a6,9
    169e:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    16a2:	0025179b          	slliw	a5,a0,0x2
    16a6:	9fa9                	addw	a5,a5,a0
    16a8:	fd07031b          	addiw	t1,a4,-48
    16ac:	0017989b          	slliw	a7,a5,0x1
    while (isdigit(*s))
    16b0:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    16b4:	0685                	addi	a3,a3,1
    16b6:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    16ba:	0006071b          	sext.w	a4,a2
    16be:	feb870e3          	bgeu	a6,a1,169e <atoi+0x3c>
    return neg ? n : -n;
    16c2:	000e0563          	beqz	t3,16cc <atoi+0x6a>
}
    16c6:	8082                	ret
        s++;
    16c8:	0505                	addi	a0,a0,1
    16ca:	bf79                	j	1668 <atoi+0x6>
    return neg ? n : -n;
    16cc:	4113053b          	subw	a0,t1,a7
    16d0:	8082                	ret
    while (isdigit(*s))
    16d2:	00154703          	lbu	a4,1(a0)
    16d6:	47a5                	li	a5,9
        s++;
    16d8:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    16dc:	fd07061b          	addiw	a2,a4,-48
    int n = 0, neg = 0;
    16e0:	4e01                	li	t3,0
    while (isdigit(*s))
    16e2:	2701                	sext.w	a4,a4
    16e4:	fac7fbe3          	bgeu	a5,a2,169a <atoi+0x38>
    16e8:	4501                	li	a0,0
}
    16ea:	8082                	ret
    while (isdigit(*s))
    16ec:	00154703          	lbu	a4,1(a0)
    16f0:	47a5                	li	a5,9
        s++;
    16f2:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    16f6:	fd07061b          	addiw	a2,a4,-48
    16fa:	2701                	sext.w	a4,a4
    16fc:	fec7e6e3          	bltu	a5,a2,16e8 <atoi+0x86>
        neg = 1;
    1700:	4e05                	li	t3,1
    1702:	bf61                	j	169a <atoi+0x38>

0000000000001704 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1704:	16060d63          	beqz	a2,187e <memset+0x17a>
    1708:	40a007b3          	neg	a5,a0
    170c:	8b9d                	andi	a5,a5,7
    170e:	00778693          	addi	a3,a5,7
    1712:	482d                	li	a6,11
    1714:	0ff5f713          	zext.b	a4,a1
    1718:	fff60593          	addi	a1,a2,-1
    171c:	1706e263          	bltu	a3,a6,1880 <memset+0x17c>
    1720:	16d5ea63          	bltu	a1,a3,1894 <memset+0x190>
    1724:	16078563          	beqz	a5,188e <memset+0x18a>
    1728:	00e50023          	sb	a4,0(a0)
    172c:	4685                	li	a3,1
    172e:	00150593          	addi	a1,a0,1
    1732:	14d78c63          	beq	a5,a3,188a <memset+0x186>
    1736:	00e500a3          	sb	a4,1(a0)
    173a:	4689                	li	a3,2
    173c:	00250593          	addi	a1,a0,2
    1740:	14d78d63          	beq	a5,a3,189a <memset+0x196>
    1744:	00e50123          	sb	a4,2(a0)
    1748:	468d                	li	a3,3
    174a:	00350593          	addi	a1,a0,3
    174e:	12d78b63          	beq	a5,a3,1884 <memset+0x180>
    1752:	00e501a3          	sb	a4,3(a0)
    1756:	4691                	li	a3,4
    1758:	00450593          	addi	a1,a0,4
    175c:	14d78163          	beq	a5,a3,189e <memset+0x19a>
    1760:	00e50223          	sb	a4,4(a0)
    1764:	4695                	li	a3,5
    1766:	00550593          	addi	a1,a0,5
    176a:	12d78c63          	beq	a5,a3,18a2 <memset+0x19e>
    176e:	00e502a3          	sb	a4,5(a0)
    1772:	469d                	li	a3,7
    1774:	00650593          	addi	a1,a0,6
    1778:	12d79763          	bne	a5,a3,18a6 <memset+0x1a2>
    177c:	00750593          	addi	a1,a0,7
    1780:	00e50323          	sb	a4,6(a0)
    1784:	481d                	li	a6,7
    1786:	00871693          	slli	a3,a4,0x8
    178a:	01071893          	slli	a7,a4,0x10
    178e:	8ed9                	or	a3,a3,a4
    1790:	01871313          	slli	t1,a4,0x18
    1794:	0116e6b3          	or	a3,a3,a7
    1798:	0066e6b3          	or	a3,a3,t1
    179c:	02071893          	slli	a7,a4,0x20
    17a0:	02871e13          	slli	t3,a4,0x28
    17a4:	0116e6b3          	or	a3,a3,a7
    17a8:	40f60333          	sub	t1,a2,a5
    17ac:	03071893          	slli	a7,a4,0x30
    17b0:	01c6e6b3          	or	a3,a3,t3
    17b4:	0116e6b3          	or	a3,a3,a7
    17b8:	03871e13          	slli	t3,a4,0x38
    17bc:	97aa                	add	a5,a5,a0
    17be:	ff837893          	andi	a7,t1,-8
    17c2:	01c6e6b3          	or	a3,a3,t3
    17c6:	98be                	add	a7,a7,a5
    17c8:	e394                	sd	a3,0(a5)
    17ca:	07a1                	addi	a5,a5,8
    17cc:	ff179ee3          	bne	a5,a7,17c8 <memset+0xc4>
    17d0:	ff837893          	andi	a7,t1,-8
    17d4:	011587b3          	add	a5,a1,a7
    17d8:	010886bb          	addw	a3,a7,a6
    17dc:	0b130663          	beq	t1,a7,1888 <memset+0x184>
    17e0:	00e78023          	sb	a4,0(a5)
    17e4:	0016859b          	addiw	a1,a3,1
    17e8:	08c5fb63          	bgeu	a1,a2,187e <memset+0x17a>
    17ec:	00e780a3          	sb	a4,1(a5)
    17f0:	0026859b          	addiw	a1,a3,2
    17f4:	08c5f563          	bgeu	a1,a2,187e <memset+0x17a>
    17f8:	00e78123          	sb	a4,2(a5)
    17fc:	0036859b          	addiw	a1,a3,3
    1800:	06c5ff63          	bgeu	a1,a2,187e <memset+0x17a>
    1804:	00e781a3          	sb	a4,3(a5)
    1808:	0046859b          	addiw	a1,a3,4
    180c:	06c5f963          	bgeu	a1,a2,187e <memset+0x17a>
    1810:	00e78223          	sb	a4,4(a5)
    1814:	0056859b          	addiw	a1,a3,5
    1818:	06c5f363          	bgeu	a1,a2,187e <memset+0x17a>
    181c:	00e782a3          	sb	a4,5(a5)
    1820:	0066859b          	addiw	a1,a3,6
    1824:	04c5fd63          	bgeu	a1,a2,187e <memset+0x17a>
    1828:	00e78323          	sb	a4,6(a5)
    182c:	0076859b          	addiw	a1,a3,7
    1830:	04c5f763          	bgeu	a1,a2,187e <memset+0x17a>
    1834:	00e783a3          	sb	a4,7(a5)
    1838:	0086859b          	addiw	a1,a3,8
    183c:	04c5f163          	bgeu	a1,a2,187e <memset+0x17a>
    1840:	00e78423          	sb	a4,8(a5)
    1844:	0096859b          	addiw	a1,a3,9
    1848:	02c5fb63          	bgeu	a1,a2,187e <memset+0x17a>
    184c:	00e784a3          	sb	a4,9(a5)
    1850:	00a6859b          	addiw	a1,a3,10
    1854:	02c5f563          	bgeu	a1,a2,187e <memset+0x17a>
    1858:	00e78523          	sb	a4,10(a5)
    185c:	00b6859b          	addiw	a1,a3,11
    1860:	00c5ff63          	bgeu	a1,a2,187e <memset+0x17a>
    1864:	00e785a3          	sb	a4,11(a5)
    1868:	00c6859b          	addiw	a1,a3,12
    186c:	00c5f963          	bgeu	a1,a2,187e <memset+0x17a>
    1870:	00e78623          	sb	a4,12(a5)
    1874:	26b5                	addiw	a3,a3,13
    1876:	00c6f463          	bgeu	a3,a2,187e <memset+0x17a>
    187a:	00e786a3          	sb	a4,13(a5)
        ;
    return dest;
}
    187e:	8082                	ret
    1880:	46ad                	li	a3,11
    1882:	bd79                	j	1720 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1884:	480d                	li	a6,3
    1886:	b701                	j	1786 <memset+0x82>
    1888:	8082                	ret
    188a:	4805                	li	a6,1
    188c:	bded                	j	1786 <memset+0x82>
    188e:	85aa                	mv	a1,a0
    1890:	4801                	li	a6,0
    1892:	bdd5                	j	1786 <memset+0x82>
    1894:	87aa                	mv	a5,a0
    1896:	4681                	li	a3,0
    1898:	b7a1                	j	17e0 <memset+0xdc>
    189a:	4809                	li	a6,2
    189c:	b5ed                	j	1786 <memset+0x82>
    189e:	4811                	li	a6,4
    18a0:	b5dd                	j	1786 <memset+0x82>
    18a2:	4815                	li	a6,5
    18a4:	b5cd                	j	1786 <memset+0x82>
    18a6:	4819                	li	a6,6
    18a8:	bdf9                	j	1786 <memset+0x82>

00000000000018aa <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    18aa:	00054783          	lbu	a5,0(a0)
    18ae:	0005c703          	lbu	a4,0(a1)
    18b2:	00e79863          	bne	a5,a4,18c2 <strcmp+0x18>
    18b6:	0505                	addi	a0,a0,1
    18b8:	0585                	addi	a1,a1,1
    18ba:	fbe5                	bnez	a5,18aa <strcmp>
    18bc:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    18be:	9d19                	subw	a0,a0,a4
    18c0:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    18c2:	0007851b          	sext.w	a0,a5
    18c6:	bfe5                	j	18be <strcmp+0x14>

00000000000018c8 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    18c8:	ca15                	beqz	a2,18fc <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18ca:	00054783          	lbu	a5,0(a0)
    if (!n--)
    18ce:	167d                	addi	a2,a2,-1
    18d0:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18d4:	eb99                	bnez	a5,18ea <strncmp+0x22>
    18d6:	a815                	j	190a <strncmp+0x42>
    18d8:	00a68e63          	beq	a3,a0,18f4 <strncmp+0x2c>
    18dc:	0505                	addi	a0,a0,1
    18de:	00f71b63          	bne	a4,a5,18f4 <strncmp+0x2c>
    18e2:	00054783          	lbu	a5,0(a0)
    18e6:	cf89                	beqz	a5,1900 <strncmp+0x38>
    18e8:	85b2                	mv	a1,a2
    18ea:	0005c703          	lbu	a4,0(a1)
    18ee:	00158613          	addi	a2,a1,1
    18f2:	f37d                	bnez	a4,18d8 <strncmp+0x10>
        ;
    return *l - *r;
    18f4:	0007851b          	sext.w	a0,a5
    18f8:	9d19                	subw	a0,a0,a4
    18fa:	8082                	ret
        return 0;
    18fc:	4501                	li	a0,0
}
    18fe:	8082                	ret
    return *l - *r;
    1900:	0015c703          	lbu	a4,1(a1)
    1904:	4501                	li	a0,0
    1906:	9d19                	subw	a0,a0,a4
    1908:	8082                	ret
    190a:	0005c703          	lbu	a4,0(a1)
    190e:	4501                	li	a0,0
    1910:	b7e5                	j	18f8 <strncmp+0x30>

0000000000001912 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1912:	00757793          	andi	a5,a0,7
    1916:	cf89                	beqz	a5,1930 <strlen+0x1e>
    1918:	87aa                	mv	a5,a0
    191a:	a029                	j	1924 <strlen+0x12>
    191c:	0785                	addi	a5,a5,1
    191e:	0077f713          	andi	a4,a5,7
    1922:	cb01                	beqz	a4,1932 <strlen+0x20>
        if (!*s)
    1924:	0007c703          	lbu	a4,0(a5)
    1928:	fb75                	bnez	a4,191c <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    192a:	40a78533          	sub	a0,a5,a0
}
    192e:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1930:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1932:	6394                	ld	a3,0(a5)
    1934:	00000597          	auipc	a1,0x0
    1938:	6e45b583          	ld	a1,1764(a1) # 2018 <__clone+0xe0>
    193c:	00000617          	auipc	a2,0x0
    1940:	6e463603          	ld	a2,1764(a2) # 2020 <__clone+0xe8>
    1944:	a019                	j	194a <strlen+0x38>
    1946:	6794                	ld	a3,8(a5)
    1948:	07a1                	addi	a5,a5,8
    194a:	00b68733          	add	a4,a3,a1
    194e:	fff6c693          	not	a3,a3
    1952:	8f75                	and	a4,a4,a3
    1954:	8f71                	and	a4,a4,a2
    1956:	db65                	beqz	a4,1946 <strlen+0x34>
    for (; *s; s++)
    1958:	0007c703          	lbu	a4,0(a5)
    195c:	d779                	beqz	a4,192a <strlen+0x18>
    195e:	0017c703          	lbu	a4,1(a5)
    1962:	0785                	addi	a5,a5,1
    1964:	d379                	beqz	a4,192a <strlen+0x18>
    1966:	0017c703          	lbu	a4,1(a5)
    196a:	0785                	addi	a5,a5,1
    196c:	fb6d                	bnez	a4,195e <strlen+0x4c>
    196e:	bf75                	j	192a <strlen+0x18>

0000000000001970 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1970:	00757713          	andi	a4,a0,7
{
    1974:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1976:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    197a:	cb19                	beqz	a4,1990 <memchr+0x20>
    197c:	ce25                	beqz	a2,19f4 <memchr+0x84>
    197e:	0007c703          	lbu	a4,0(a5)
    1982:	04b70e63          	beq	a4,a1,19de <memchr+0x6e>
    1986:	0785                	addi	a5,a5,1
    1988:	0077f713          	andi	a4,a5,7
    198c:	167d                	addi	a2,a2,-1
    198e:	f77d                	bnez	a4,197c <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1990:	4501                	li	a0,0
    if (n && *s != c)
    1992:	c235                	beqz	a2,19f6 <memchr+0x86>
    1994:	0007c703          	lbu	a4,0(a5)
    1998:	04b70363          	beq	a4,a1,19de <memchr+0x6e>
        size_t k = ONES * c;
    199c:	00000517          	auipc	a0,0x0
    19a0:	68c53503          	ld	a0,1676(a0) # 2028 <__clone+0xf0>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19a4:	471d                	li	a4,7
        size_t k = ONES * c;
    19a6:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19aa:	02c77a63          	bgeu	a4,a2,19de <memchr+0x6e>
    19ae:	00000897          	auipc	a7,0x0
    19b2:	66a8b883          	ld	a7,1642(a7) # 2018 <__clone+0xe0>
    19b6:	00000817          	auipc	a6,0x0
    19ba:	66a83803          	ld	a6,1642(a6) # 2020 <__clone+0xe8>
    19be:	431d                	li	t1,7
    19c0:	a029                	j	19ca <memchr+0x5a>
    19c2:	1661                	addi	a2,a2,-8
    19c4:	07a1                	addi	a5,a5,8
    19c6:	02c37963          	bgeu	t1,a2,19f8 <memchr+0x88>
    19ca:	6398                	ld	a4,0(a5)
    19cc:	8f29                	xor	a4,a4,a0
    19ce:	011706b3          	add	a3,a4,a7
    19d2:	fff74713          	not	a4,a4
    19d6:	8f75                	and	a4,a4,a3
    19d8:	01077733          	and	a4,a4,a6
    19dc:	d37d                	beqz	a4,19c2 <memchr+0x52>
{
    19de:	853e                	mv	a0,a5
    19e0:	97b2                	add	a5,a5,a2
    19e2:	a021                	j	19ea <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    19e4:	0505                	addi	a0,a0,1
    19e6:	00f50763          	beq	a0,a5,19f4 <memchr+0x84>
    19ea:	00054703          	lbu	a4,0(a0)
    19ee:	feb71be3          	bne	a4,a1,19e4 <memchr+0x74>
    19f2:	8082                	ret
    return n ? (void *)s : 0;
    19f4:	4501                	li	a0,0
}
    19f6:	8082                	ret
    return n ? (void *)s : 0;
    19f8:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    19fa:	f275                	bnez	a2,19de <memchr+0x6e>
}
    19fc:	8082                	ret

00000000000019fe <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19fe:	1101                	addi	sp,sp,-32
    1a00:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1a02:	862e                	mv	a2,a1
{
    1a04:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1a06:	4581                	li	a1,0
{
    1a08:	e426                	sd	s1,8(sp)
    1a0a:	ec06                	sd	ra,24(sp)
    1a0c:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1a0e:	f63ff0ef          	jal	ra,1970 <memchr>
    return p ? p - s : n;
    1a12:	c519                	beqz	a0,1a20 <strnlen+0x22>
}
    1a14:	60e2                	ld	ra,24(sp)
    1a16:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1a18:	8d05                	sub	a0,a0,s1
}
    1a1a:	64a2                	ld	s1,8(sp)
    1a1c:	6105                	addi	sp,sp,32
    1a1e:	8082                	ret
    1a20:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1a22:	8522                	mv	a0,s0
}
    1a24:	6442                	ld	s0,16(sp)
    1a26:	64a2                	ld	s1,8(sp)
    1a28:	6105                	addi	sp,sp,32
    1a2a:	8082                	ret

0000000000001a2c <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a2c:	00a5c7b3          	xor	a5,a1,a0
    1a30:	8b9d                	andi	a5,a5,7
    1a32:	eb95                	bnez	a5,1a66 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a34:	0075f793          	andi	a5,a1,7
    1a38:	e7b1                	bnez	a5,1a84 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a3a:	6198                	ld	a4,0(a1)
    1a3c:	00000617          	auipc	a2,0x0
    1a40:	5dc63603          	ld	a2,1500(a2) # 2018 <__clone+0xe0>
    1a44:	00000817          	auipc	a6,0x0
    1a48:	5dc83803          	ld	a6,1500(a6) # 2020 <__clone+0xe8>
    1a4c:	a029                	j	1a56 <strcpy+0x2a>
    1a4e:	05a1                	addi	a1,a1,8
    1a50:	e118                	sd	a4,0(a0)
    1a52:	6198                	ld	a4,0(a1)
    1a54:	0521                	addi	a0,a0,8
    1a56:	00c707b3          	add	a5,a4,a2
    1a5a:	fff74693          	not	a3,a4
    1a5e:	8ff5                	and	a5,a5,a3
    1a60:	0107f7b3          	and	a5,a5,a6
    1a64:	d7ed                	beqz	a5,1a4e <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a66:	0005c783          	lbu	a5,0(a1)
    1a6a:	00f50023          	sb	a5,0(a0)
    1a6e:	c785                	beqz	a5,1a96 <strcpy+0x6a>
    1a70:	0015c783          	lbu	a5,1(a1)
    1a74:	0505                	addi	a0,a0,1
    1a76:	0585                	addi	a1,a1,1
    1a78:	00f50023          	sb	a5,0(a0)
    1a7c:	fbf5                	bnez	a5,1a70 <strcpy+0x44>
        ;
    return d;
}
    1a7e:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a80:	0505                	addi	a0,a0,1
    1a82:	df45                	beqz	a4,1a3a <strcpy+0xe>
            if (!(*d = *s))
    1a84:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a88:	0585                	addi	a1,a1,1
    1a8a:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1a8e:	00f50023          	sb	a5,0(a0)
    1a92:	f7fd                	bnez	a5,1a80 <strcpy+0x54>
}
    1a94:	8082                	ret
    1a96:	8082                	ret

0000000000001a98 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a98:	00a5c7b3          	xor	a5,a1,a0
    1a9c:	8b9d                	andi	a5,a5,7
    1a9e:	1a079863          	bnez	a5,1c4e <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1aa2:	0075f793          	andi	a5,a1,7
    1aa6:	16078463          	beqz	a5,1c0e <strncpy+0x176>
    1aaa:	ea01                	bnez	a2,1aba <strncpy+0x22>
    1aac:	a421                	j	1cb4 <strncpy+0x21c>
    1aae:	167d                	addi	a2,a2,-1
    1ab0:	0505                	addi	a0,a0,1
    1ab2:	14070e63          	beqz	a4,1c0e <strncpy+0x176>
    1ab6:	1a060863          	beqz	a2,1c66 <strncpy+0x1ce>
    1aba:	0005c783          	lbu	a5,0(a1)
    1abe:	0585                	addi	a1,a1,1
    1ac0:	0075f713          	andi	a4,a1,7
    1ac4:	00f50023          	sb	a5,0(a0)
    1ac8:	f3fd                	bnez	a5,1aae <strncpy+0x16>
    1aca:	4805                	li	a6,1
    1acc:	1a061863          	bnez	a2,1c7c <strncpy+0x1e4>
    1ad0:	40a007b3          	neg	a5,a0
    1ad4:	8b9d                	andi	a5,a5,7
    1ad6:	4681                	li	a3,0
    1ad8:	18061a63          	bnez	a2,1c6c <strncpy+0x1d4>
    1adc:	00778713          	addi	a4,a5,7
    1ae0:	45ad                	li	a1,11
    1ae2:	18b76363          	bltu	a4,a1,1c68 <strncpy+0x1d0>
    1ae6:	1ae6eb63          	bltu	a3,a4,1c9c <strncpy+0x204>
    1aea:	1a078363          	beqz	a5,1c90 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1aee:	00050023          	sb	zero,0(a0)
    1af2:	4685                	li	a3,1
    1af4:	00150713          	addi	a4,a0,1
    1af8:	18d78f63          	beq	a5,a3,1c96 <strncpy+0x1fe>
    1afc:	000500a3          	sb	zero,1(a0)
    1b00:	4689                	li	a3,2
    1b02:	00250713          	addi	a4,a0,2
    1b06:	18d78e63          	beq	a5,a3,1ca2 <strncpy+0x20a>
    1b0a:	00050123          	sb	zero,2(a0)
    1b0e:	468d                	li	a3,3
    1b10:	00350713          	addi	a4,a0,3
    1b14:	16d78c63          	beq	a5,a3,1c8c <strncpy+0x1f4>
    1b18:	000501a3          	sb	zero,3(a0)
    1b1c:	4691                	li	a3,4
    1b1e:	00450713          	addi	a4,a0,4
    1b22:	18d78263          	beq	a5,a3,1ca6 <strncpy+0x20e>
    1b26:	00050223          	sb	zero,4(a0)
    1b2a:	4695                	li	a3,5
    1b2c:	00550713          	addi	a4,a0,5
    1b30:	16d78d63          	beq	a5,a3,1caa <strncpy+0x212>
    1b34:	000502a3          	sb	zero,5(a0)
    1b38:	469d                	li	a3,7
    1b3a:	00650713          	addi	a4,a0,6
    1b3e:	16d79863          	bne	a5,a3,1cae <strncpy+0x216>
    1b42:	00750713          	addi	a4,a0,7
    1b46:	00050323          	sb	zero,6(a0)
    1b4a:	40f80833          	sub	a6,a6,a5
    1b4e:	ff887593          	andi	a1,a6,-8
    1b52:	97aa                	add	a5,a5,a0
    1b54:	95be                	add	a1,a1,a5
    1b56:	0007b023          	sd	zero,0(a5)
    1b5a:	07a1                	addi	a5,a5,8
    1b5c:	feb79de3          	bne	a5,a1,1b56 <strncpy+0xbe>
    1b60:	ff887593          	andi	a1,a6,-8
    1b64:	9ead                	addw	a3,a3,a1
    1b66:	00b707b3          	add	a5,a4,a1
    1b6a:	12b80863          	beq	a6,a1,1c9a <strncpy+0x202>
    1b6e:	00078023          	sb	zero,0(a5)
    1b72:	0016871b          	addiw	a4,a3,1
    1b76:	0ec77863          	bgeu	a4,a2,1c66 <strncpy+0x1ce>
    1b7a:	000780a3          	sb	zero,1(a5)
    1b7e:	0026871b          	addiw	a4,a3,2
    1b82:	0ec77263          	bgeu	a4,a2,1c66 <strncpy+0x1ce>
    1b86:	00078123          	sb	zero,2(a5)
    1b8a:	0036871b          	addiw	a4,a3,3
    1b8e:	0cc77c63          	bgeu	a4,a2,1c66 <strncpy+0x1ce>
    1b92:	000781a3          	sb	zero,3(a5)
    1b96:	0046871b          	addiw	a4,a3,4
    1b9a:	0cc77663          	bgeu	a4,a2,1c66 <strncpy+0x1ce>
    1b9e:	00078223          	sb	zero,4(a5)
    1ba2:	0056871b          	addiw	a4,a3,5
    1ba6:	0cc77063          	bgeu	a4,a2,1c66 <strncpy+0x1ce>
    1baa:	000782a3          	sb	zero,5(a5)
    1bae:	0066871b          	addiw	a4,a3,6
    1bb2:	0ac77a63          	bgeu	a4,a2,1c66 <strncpy+0x1ce>
    1bb6:	00078323          	sb	zero,6(a5)
    1bba:	0076871b          	addiw	a4,a3,7
    1bbe:	0ac77463          	bgeu	a4,a2,1c66 <strncpy+0x1ce>
    1bc2:	000783a3          	sb	zero,7(a5)
    1bc6:	0086871b          	addiw	a4,a3,8
    1bca:	08c77e63          	bgeu	a4,a2,1c66 <strncpy+0x1ce>
    1bce:	00078423          	sb	zero,8(a5)
    1bd2:	0096871b          	addiw	a4,a3,9
    1bd6:	08c77863          	bgeu	a4,a2,1c66 <strncpy+0x1ce>
    1bda:	000784a3          	sb	zero,9(a5)
    1bde:	00a6871b          	addiw	a4,a3,10
    1be2:	08c77263          	bgeu	a4,a2,1c66 <strncpy+0x1ce>
    1be6:	00078523          	sb	zero,10(a5)
    1bea:	00b6871b          	addiw	a4,a3,11
    1bee:	06c77c63          	bgeu	a4,a2,1c66 <strncpy+0x1ce>
    1bf2:	000785a3          	sb	zero,11(a5)
    1bf6:	00c6871b          	addiw	a4,a3,12
    1bfa:	06c77663          	bgeu	a4,a2,1c66 <strncpy+0x1ce>
    1bfe:	00078623          	sb	zero,12(a5)
    1c02:	26b5                	addiw	a3,a3,13
    1c04:	06c6f163          	bgeu	a3,a2,1c66 <strncpy+0x1ce>
    1c08:	000786a3          	sb	zero,13(a5)
    1c0c:	8082                	ret
            ;
        if (!n || !*s)
    1c0e:	c645                	beqz	a2,1cb6 <strncpy+0x21e>
    1c10:	0005c783          	lbu	a5,0(a1)
    1c14:	ea078be3          	beqz	a5,1aca <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1c18:	479d                	li	a5,7
    1c1a:	02c7ff63          	bgeu	a5,a2,1c58 <strncpy+0x1c0>
    1c1e:	00000897          	auipc	a7,0x0
    1c22:	3fa8b883          	ld	a7,1018(a7) # 2018 <__clone+0xe0>
    1c26:	00000817          	auipc	a6,0x0
    1c2a:	3fa83803          	ld	a6,1018(a6) # 2020 <__clone+0xe8>
    1c2e:	431d                	li	t1,7
    1c30:	6198                	ld	a4,0(a1)
    1c32:	011707b3          	add	a5,a4,a7
    1c36:	fff74693          	not	a3,a4
    1c3a:	8ff5                	and	a5,a5,a3
    1c3c:	0107f7b3          	and	a5,a5,a6
    1c40:	ef81                	bnez	a5,1c58 <strncpy+0x1c0>
            *wd = *ws;
    1c42:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1c44:	1661                	addi	a2,a2,-8
    1c46:	05a1                	addi	a1,a1,8
    1c48:	0521                	addi	a0,a0,8
    1c4a:	fec363e3          	bltu	t1,a2,1c30 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1c4e:	e609                	bnez	a2,1c58 <strncpy+0x1c0>
    1c50:	a08d                	j	1cb2 <strncpy+0x21a>
    1c52:	167d                	addi	a2,a2,-1
    1c54:	0505                	addi	a0,a0,1
    1c56:	ca01                	beqz	a2,1c66 <strncpy+0x1ce>
    1c58:	0005c783          	lbu	a5,0(a1)
    1c5c:	0585                	addi	a1,a1,1
    1c5e:	00f50023          	sb	a5,0(a0)
    1c62:	fbe5                	bnez	a5,1c52 <strncpy+0x1ba>
        ;
tail:
    1c64:	b59d                	j	1aca <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1c66:	8082                	ret
    1c68:	472d                	li	a4,11
    1c6a:	bdb5                	j	1ae6 <strncpy+0x4e>
    1c6c:	00778713          	addi	a4,a5,7
    1c70:	45ad                	li	a1,11
    1c72:	fff60693          	addi	a3,a2,-1
    1c76:	e6b778e3          	bgeu	a4,a1,1ae6 <strncpy+0x4e>
    1c7a:	b7fd                	j	1c68 <strncpy+0x1d0>
    1c7c:	40a007b3          	neg	a5,a0
    1c80:	8832                	mv	a6,a2
    1c82:	8b9d                	andi	a5,a5,7
    1c84:	4681                	li	a3,0
    1c86:	e4060be3          	beqz	a2,1adc <strncpy+0x44>
    1c8a:	b7cd                	j	1c6c <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c8c:	468d                	li	a3,3
    1c8e:	bd75                	j	1b4a <strncpy+0xb2>
    1c90:	872a                	mv	a4,a0
    1c92:	4681                	li	a3,0
    1c94:	bd5d                	j	1b4a <strncpy+0xb2>
    1c96:	4685                	li	a3,1
    1c98:	bd4d                	j	1b4a <strncpy+0xb2>
    1c9a:	8082                	ret
    1c9c:	87aa                	mv	a5,a0
    1c9e:	4681                	li	a3,0
    1ca0:	b5f9                	j	1b6e <strncpy+0xd6>
    1ca2:	4689                	li	a3,2
    1ca4:	b55d                	j	1b4a <strncpy+0xb2>
    1ca6:	4691                	li	a3,4
    1ca8:	b54d                	j	1b4a <strncpy+0xb2>
    1caa:	4695                	li	a3,5
    1cac:	bd79                	j	1b4a <strncpy+0xb2>
    1cae:	4699                	li	a3,6
    1cb0:	bd69                	j	1b4a <strncpy+0xb2>
    1cb2:	8082                	ret
    1cb4:	8082                	ret
    1cb6:	8082                	ret

0000000000001cb8 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1cb8:	87aa                	mv	a5,a0
    1cba:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1cbc:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1cc0:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1cc4:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1cc6:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cc8:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1ccc:	2501                	sext.w	a0,a0
    1cce:	8082                	ret

0000000000001cd0 <openat>:
    register long a7 __asm__("a7") = n;
    1cd0:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1cd4:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cd8:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1cdc:	2501                	sext.w	a0,a0
    1cde:	8082                	ret

0000000000001ce0 <fcntl>:
    register long a7 __asm__("a7") = n;
    1ce0:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ce2:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1ce6:	2501                	sext.w	a0,a0
    1ce8:	8082                	ret

0000000000001cea <close>:
    register long a7 __asm__("a7") = n;
    1cea:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1cee:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1cf2:	2501                	sext.w	a0,a0
    1cf4:	8082                	ret

0000000000001cf6 <read>:
    register long a7 __asm__("a7") = n;
    1cf6:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cfa:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1cfe:	8082                	ret

0000000000001d00 <write>:
    register long a7 __asm__("a7") = n;
    1d00:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d04:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d08:	8082                	ret

0000000000001d0a <getpid>:
    register long a7 __asm__("a7") = n;
    1d0a:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d0e:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d12:	2501                	sext.w	a0,a0
    1d14:	8082                	ret

0000000000001d16 <getppid>:
    register long a7 __asm__("a7") = n;
    1d16:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d1a:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d1e:	2501                	sext.w	a0,a0
    1d20:	8082                	ret

0000000000001d22 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d22:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d26:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d2a:	2501                	sext.w	a0,a0
    1d2c:	8082                	ret

0000000000001d2e <fork>:
    register long a7 __asm__("a7") = n;
    1d2e:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d32:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d34:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d36:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d3a:	2501                	sext.w	a0,a0
    1d3c:	8082                	ret

0000000000001d3e <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d3e:	85b2                	mv	a1,a2
    1d40:	863a                	mv	a2,a4
    if (stack)
    1d42:	c191                	beqz	a1,1d46 <clone+0x8>
	stack += stack_size;
    1d44:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d46:	4781                	li	a5,0
    1d48:	4701                	li	a4,0
    1d4a:	4681                	li	a3,0
    1d4c:	2601                	sext.w	a2,a2
    1d4e:	a2ed                	j	1f38 <__clone>

0000000000001d50 <exit>:
    register long a7 __asm__("a7") = n;
    1d50:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d54:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d58:	8082                	ret

0000000000001d5a <waitpid>:
    register long a7 __asm__("a7") = n;
    1d5a:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d5e:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d60:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d64:	2501                	sext.w	a0,a0
    1d66:	8082                	ret

0000000000001d68 <exec>:
    register long a7 __asm__("a7") = n;
    1d68:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d6c:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d70:	2501                	sext.w	a0,a0
    1d72:	8082                	ret

0000000000001d74 <execve>:
    register long a7 __asm__("a7") = n;
    1d74:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d78:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d7c:	2501                	sext.w	a0,a0
    1d7e:	8082                	ret

0000000000001d80 <times>:
    register long a7 __asm__("a7") = n;
    1d80:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d84:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d88:	2501                	sext.w	a0,a0
    1d8a:	8082                	ret

0000000000001d8c <get_time>:

int64 get_time()
{
    1d8c:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d8e:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d92:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d94:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d96:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d9a:	2501                	sext.w	a0,a0
    1d9c:	ed09                	bnez	a0,1db6 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d9e:	67a2                	ld	a5,8(sp)
    1da0:	3e800713          	li	a4,1000
    1da4:	00015503          	lhu	a0,0(sp)
    1da8:	02e7d7b3          	divu	a5,a5,a4
    1dac:	02e50533          	mul	a0,a0,a4
    1db0:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1db2:	0141                	addi	sp,sp,16
    1db4:	8082                	ret
        return -1;
    1db6:	557d                	li	a0,-1
    1db8:	bfed                	j	1db2 <get_time+0x26>

0000000000001dba <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1dba:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dbe:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1dc2:	2501                	sext.w	a0,a0
    1dc4:	8082                	ret

0000000000001dc6 <time>:
    register long a7 __asm__("a7") = n;
    1dc6:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1dca:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1dce:	2501                	sext.w	a0,a0
    1dd0:	8082                	ret

0000000000001dd2 <sleep>:

int sleep(unsigned long long time)
{
    1dd2:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1dd4:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1dd6:	850a                	mv	a0,sp
    1dd8:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1dda:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1dde:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1de0:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1de4:	e501                	bnez	a0,1dec <sleep+0x1a>
    return 0;
    1de6:	4501                	li	a0,0
}
    1de8:	0141                	addi	sp,sp,16
    1dea:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1dec:	4502                	lw	a0,0(sp)
}
    1dee:	0141                	addi	sp,sp,16
    1df0:	8082                	ret

0000000000001df2 <set_priority>:
    register long a7 __asm__("a7") = n;
    1df2:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1df6:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1dfa:	2501                	sext.w	a0,a0
    1dfc:	8082                	ret

0000000000001dfe <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1dfe:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e02:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e06:	8082                	ret

0000000000001e08 <munmap>:
    register long a7 __asm__("a7") = n;
    1e08:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e0c:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e10:	2501                	sext.w	a0,a0
    1e12:	8082                	ret

0000000000001e14 <wait>:

int wait(int *code)
{
    1e14:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e16:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e1a:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e1c:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e1e:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e20:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e24:	2501                	sext.w	a0,a0
    1e26:	8082                	ret

0000000000001e28 <spawn>:
    register long a7 __asm__("a7") = n;
    1e28:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e2c:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e30:	2501                	sext.w	a0,a0
    1e32:	8082                	ret

0000000000001e34 <mailread>:
    register long a7 __asm__("a7") = n;
    1e34:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e38:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e3c:	2501                	sext.w	a0,a0
    1e3e:	8082                	ret

0000000000001e40 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e40:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e44:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e48:	2501                	sext.w	a0,a0
    1e4a:	8082                	ret

0000000000001e4c <fstat>:
    register long a7 __asm__("a7") = n;
    1e4c:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e50:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e54:	2501                	sext.w	a0,a0
    1e56:	8082                	ret

0000000000001e58 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e58:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e5a:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e5e:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e60:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e64:	2501                	sext.w	a0,a0
    1e66:	8082                	ret

0000000000001e68 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e68:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e6a:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e6e:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e70:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e74:	2501                	sext.w	a0,a0
    1e76:	8082                	ret

0000000000001e78 <link>:

int link(char *old_path, char *new_path)
{
    1e78:	87aa                	mv	a5,a0
    1e7a:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e7c:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e80:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e84:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e86:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e8a:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e8c:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e90:	2501                	sext.w	a0,a0
    1e92:	8082                	ret

0000000000001e94 <unlink>:

int unlink(char *path)
{
    1e94:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e96:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e9a:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e9e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ea0:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1ea4:	2501                	sext.w	a0,a0
    1ea6:	8082                	ret

0000000000001ea8 <uname>:
    register long a7 __asm__("a7") = n;
    1ea8:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1eac:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1eb0:	2501                	sext.w	a0,a0
    1eb2:	8082                	ret

0000000000001eb4 <brk>:
    register long a7 __asm__("a7") = n;
    1eb4:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1eb8:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1ebc:	2501                	sext.w	a0,a0
    1ebe:	8082                	ret

0000000000001ec0 <getcwd>:
    register long a7 __asm__("a7") = n;
    1ec0:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec2:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1ec6:	8082                	ret

0000000000001ec8 <chdir>:
    register long a7 __asm__("a7") = n;
    1ec8:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1ecc:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1ed0:	2501                	sext.w	a0,a0
    1ed2:	8082                	ret

0000000000001ed4 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1ed4:	862e                	mv	a2,a1
    1ed6:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1ed8:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1eda:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1ede:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ee2:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1ee4:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ee6:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1eea:	2501                	sext.w	a0,a0
    1eec:	8082                	ret

0000000000001eee <getdents>:
    register long a7 __asm__("a7") = n;
    1eee:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ef2:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1ef6:	2501                	sext.w	a0,a0
    1ef8:	8082                	ret

0000000000001efa <pipe>:
    register long a7 __asm__("a7") = n;
    1efa:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1efe:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f00:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f04:	2501                	sext.w	a0,a0
    1f06:	8082                	ret

0000000000001f08 <dup>:
    register long a7 __asm__("a7") = n;
    1f08:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f0a:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f0e:	2501                	sext.w	a0,a0
    1f10:	8082                	ret

0000000000001f12 <dup2>:
    register long a7 __asm__("a7") = n;
    1f12:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f14:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f16:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f1a:	2501                	sext.w	a0,a0
    1f1c:	8082                	ret

0000000000001f1e <mount>:
    register long a7 __asm__("a7") = n;
    1f1e:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f22:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f26:	2501                	sext.w	a0,a0
    1f28:	8082                	ret

0000000000001f2a <umount>:
    register long a7 __asm__("a7") = n;
    1f2a:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f2e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f30:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f34:	2501                	sext.w	a0,a0
    1f36:	8082                	ret

0000000000001f38 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f38:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1f3a:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f3c:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f3e:	8532                	mv	a0,a2
	mv a2, a4
    1f40:	863a                	mv	a2,a4
	mv a3, a5
    1f42:	86be                	mv	a3,a5
	mv a4, a6
    1f44:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f46:	0dc00893          	li	a7,220
	ecall
    1f4a:	00000073          	ecall

	beqz a0, 1f
    1f4e:	c111                	beqz	a0,1f52 <__clone+0x1a>
	# Parent
	ret
    1f50:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f52:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f54:	6522                	ld	a0,8(sp)
	jalr a1
    1f56:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f58:	05d00893          	li	a7,93
	ecall
    1f5c:	00000073          	ecall
