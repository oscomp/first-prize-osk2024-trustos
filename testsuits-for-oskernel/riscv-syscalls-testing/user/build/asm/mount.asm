
/home/brightnight/OScompetition/6.13晚final_main/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/mount：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	aa31                	j	111e <__start_main>

0000000000001004 <test_mount>:

static char mntpoint[64] = "./mnt";
static char device[64] = "/dev/vda2";
static const char *fs_type = "vfat";

void test_mount() {
    1004:	1141                	addi	sp,sp,-16
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f6250513          	addi	a0,a0,-158 # 1f68 <__clone+0x2c>
void test_mount() {
    100e:	e406                	sd	ra,8(sp)
    1010:	e022                	sd	s0,0(sp)
	TEST_START(__func__);
    1012:	37e000ef          	jal	ra,1390 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	0b250513          	addi	a0,a0,178 # 20c8 <__func__.0>
    101e:	372000ef          	jal	ra,1390 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	f5e50513          	addi	a0,a0,-162 # 1f80 <__clone+0x44>
    102a:	366000ef          	jal	ra,1390 <puts>

	printf("Mounting dev:%s to %s\n", device, mntpoint);
    102e:	00001617          	auipc	a2,0x1
    1032:	01a60613          	addi	a2,a2,26 # 2048 <mntpoint>
    1036:	00001597          	auipc	a1,0x1
    103a:	05258593          	addi	a1,a1,82 # 2088 <device>
    103e:	00001517          	auipc	a0,0x1
    1042:	f5250513          	addi	a0,a0,-174 # 1f90 <__clone+0x54>
    1046:	36c000ef          	jal	ra,13b2 <printf>
	int ret = mount(device, mntpoint, fs_type, 0, NULL);
    104a:	00001597          	auipc	a1,0x1
    104e:	ffe58593          	addi	a1,a1,-2 # 2048 <mntpoint>
    1052:	4701                	li	a4,0
    1054:	4681                	li	a3,0
    1056:	00001617          	auipc	a2,0x1
    105a:	f5260613          	addi	a2,a2,-174 # 1fa8 <__clone+0x6c>
    105e:	00001517          	auipc	a0,0x1
    1062:	02a50513          	addi	a0,a0,42 # 2088 <device>
    1066:	6bd000ef          	jal	ra,1f22 <mount>
    106a:	842a                	mv	s0,a0
	printf("mount return: %d\n", ret);
    106c:	85aa                	mv	a1,a0
    106e:	00001517          	auipc	a0,0x1
    1072:	f4250513          	addi	a0,a0,-190 # 1fb0 <__clone+0x74>
    1076:	33c000ef          	jal	ra,13b2 <printf>
	assert(ret == 0);
    107a:	e821                	bnez	s0,10ca <test_mount+0xc6>

	if (ret == 0) {
		printf("mount successfully\n");
    107c:	00001517          	auipc	a0,0x1
    1080:	f7c50513          	addi	a0,a0,-132 # 1ff8 <__clone+0xbc>
    1084:	32e000ef          	jal	ra,13b2 <printf>
		ret = umount(mntpoint);
    1088:	00001517          	auipc	a0,0x1
    108c:	fc050513          	addi	a0,a0,-64 # 2048 <mntpoint>
    1090:	69f000ef          	jal	ra,1f2e <umount>
    1094:	85aa                	mv	a1,a0
		printf("umount return: %d\n", ret);
    1096:	00001517          	auipc	a0,0x1
    109a:	f7a50513          	addi	a0,a0,-134 # 2010 <__clone+0xd4>
    109e:	314000ef          	jal	ra,13b2 <printf>
	}

	TEST_END(__func__);
    10a2:	00001517          	auipc	a0,0x1
    10a6:	f4650513          	addi	a0,a0,-186 # 1fe8 <__clone+0xac>
    10aa:	2e6000ef          	jal	ra,1390 <puts>
    10ae:	00001517          	auipc	a0,0x1
    10b2:	01a50513          	addi	a0,a0,26 # 20c8 <__func__.0>
    10b6:	2da000ef          	jal	ra,1390 <puts>
}
    10ba:	6402                	ld	s0,0(sp)
    10bc:	60a2                	ld	ra,8(sp)
	TEST_END(__func__);
    10be:	00001517          	auipc	a0,0x1
    10c2:	ec250513          	addi	a0,a0,-318 # 1f80 <__clone+0x44>
}
    10c6:	0141                	addi	sp,sp,16
	TEST_END(__func__);
    10c8:	a4e1                	j	1390 <puts>
	assert(ret == 0);
    10ca:	00001517          	auipc	a0,0x1
    10ce:	efe50513          	addi	a0,a0,-258 # 1fc8 <__clone+0x8c>
    10d2:	564000ef          	jal	ra,1636 <panic>
	if (ret == 0) {
    10d6:	b7f1                	j	10a2 <test_mount+0x9e>

00000000000010d8 <main>:

int main(int argc,char *argv[]) {
    10d8:	1101                	addi	sp,sp,-32
    10da:	ec06                	sd	ra,24(sp)
    10dc:	e822                	sd	s0,16(sp)
    10de:	e426                	sd	s1,8(sp)
	if(argc >= 2){
    10e0:	4785                	li	a5,1
    10e2:	00a7ca63          	blt	a5,a0,10f6 <main+0x1e>

	if(argc >= 3){
		strcpy(mntpoint, argv[2]);
	}

	test_mount();
    10e6:	f1fff0ef          	jal	ra,1004 <test_mount>
	return 0;
}
    10ea:	60e2                	ld	ra,24(sp)
    10ec:	6442                	ld	s0,16(sp)
    10ee:	64a2                	ld	s1,8(sp)
    10f0:	4501                	li	a0,0
    10f2:	6105                	addi	sp,sp,32
    10f4:	8082                	ret
		strcpy(device, argv[1]);
    10f6:	84ae                	mv	s1,a1
    10f8:	658c                	ld	a1,8(a1)
    10fa:	842a                	mv	s0,a0
    10fc:	00001517          	auipc	a0,0x1
    1100:	f8c50513          	addi	a0,a0,-116 # 2088 <device>
    1104:	12d000ef          	jal	ra,1a30 <strcpy>
	if(argc >= 3){
    1108:	4789                	li	a5,2
    110a:	fcf40ee3          	beq	s0,a5,10e6 <main+0xe>
		strcpy(mntpoint, argv[2]);
    110e:	688c                	ld	a1,16(s1)
    1110:	00001517          	auipc	a0,0x1
    1114:	f3850513          	addi	a0,a0,-200 # 2048 <mntpoint>
    1118:	119000ef          	jal	ra,1a30 <strcpy>
    111c:	b7e9                	j	10e6 <main+0xe>

000000000000111e <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    111e:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1120:	4108                	lw	a0,0(a0)
{
    1122:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    1124:	05a1                	addi	a1,a1,8
{
    1126:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1128:	fb1ff0ef          	jal	ra,10d8 <main>
    112c:	429000ef          	jal	ra,1d54 <exit>
	return 0;
}
    1130:	60a2                	ld	ra,8(sp)
    1132:	4501                	li	a0,0
    1134:	0141                	addi	sp,sp,16
    1136:	8082                	ret

0000000000001138 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1138:	7179                	addi	sp,sp,-48
    113a:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    113c:	12054b63          	bltz	a0,1272 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1140:	02b577bb          	remuw	a5,a0,a1
    1144:	00001617          	auipc	a2,0x1
    1148:	f9460613          	addi	a2,a2,-108 # 20d8 <digits>
    buf[16] = 0;
    114c:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1150:	0005871b          	sext.w	a4,a1
    1154:	1782                	slli	a5,a5,0x20
    1156:	9381                	srli	a5,a5,0x20
    1158:	97b2                	add	a5,a5,a2
    115a:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    115e:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1162:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1166:	1cb56363          	bltu	a0,a1,132c <printint.constprop.0+0x1f4>
        buf[i--] = digits[x % base];
    116a:	45b9                	li	a1,14
    116c:	02e877bb          	remuw	a5,a6,a4
    1170:	1782                	slli	a5,a5,0x20
    1172:	9381                	srli	a5,a5,0x20
    1174:	97b2                	add	a5,a5,a2
    1176:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    117a:	02e856bb          	divuw	a3,a6,a4
        buf[i--] = digits[x % base];
    117e:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    1182:	0ce86e63          	bltu	a6,a4,125e <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    1186:	02e6f5bb          	remuw	a1,a3,a4
    } while ((x /= base) != 0);
    118a:	02e6d7bb          	divuw	a5,a3,a4
        buf[i--] = digits[x % base];
    118e:	1582                	slli	a1,a1,0x20
    1190:	9181                	srli	a1,a1,0x20
    1192:	95b2                	add	a1,a1,a2
    1194:	0005c583          	lbu	a1,0(a1)
    1198:	00b10aa3          	sb	a1,21(sp)
    } while ((x /= base) != 0);
    119c:	0007859b          	sext.w	a1,a5
    11a0:	12e6ec63          	bltu	a3,a4,12d8 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    11a4:	02e7f6bb          	remuw	a3,a5,a4
    11a8:	1682                	slli	a3,a3,0x20
    11aa:	9281                	srli	a3,a3,0x20
    11ac:	96b2                	add	a3,a3,a2
    11ae:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11b2:	02e7d83b          	divuw	a6,a5,a4
        buf[i--] = digits[x % base];
    11b6:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    11ba:	12e5e863          	bltu	a1,a4,12ea <printint.constprop.0+0x1b2>
        buf[i--] = digits[x % base];
    11be:	02e876bb          	remuw	a3,a6,a4
    11c2:	1682                	slli	a3,a3,0x20
    11c4:	9281                	srli	a3,a3,0x20
    11c6:	96b2                	add	a3,a3,a2
    11c8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11cc:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11d0:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    11d4:	12e86463          	bltu	a6,a4,12fc <printint.constprop.0+0x1c4>
        buf[i--] = digits[x % base];
    11d8:	02e5f6bb          	remuw	a3,a1,a4
    11dc:	1682                	slli	a3,a3,0x20
    11de:	9281                	srli	a3,a3,0x20
    11e0:	96b2                	add	a3,a3,a2
    11e2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11e6:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11ea:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    11ee:	0ce5ec63          	bltu	a1,a4,12c6 <printint.constprop.0+0x18e>
        buf[i--] = digits[x % base];
    11f2:	02e876bb          	remuw	a3,a6,a4
    11f6:	1682                	slli	a3,a3,0x20
    11f8:	9281                	srli	a3,a3,0x20
    11fa:	96b2                	add	a3,a3,a2
    11fc:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1200:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1204:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1208:	10e86963          	bltu	a6,a4,131a <printint.constprop.0+0x1e2>
        buf[i--] = digits[x % base];
    120c:	02e5f6bb          	remuw	a3,a1,a4
    1210:	1682                	slli	a3,a3,0x20
    1212:	9281                	srli	a3,a3,0x20
    1214:	96b2                	add	a3,a3,a2
    1216:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    121a:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    121e:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    1222:	10e5e763          	bltu	a1,a4,1330 <printint.constprop.0+0x1f8>
        buf[i--] = digits[x % base];
    1226:	02e876bb          	remuw	a3,a6,a4
    122a:	1682                	slli	a3,a3,0x20
    122c:	9281                	srli	a3,a3,0x20
    122e:	96b2                	add	a3,a3,a2
    1230:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1234:	02e857bb          	divuw	a5,a6,a4
        buf[i--] = digits[x % base];
    1238:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    123c:	10e86363          	bltu	a6,a4,1342 <printint.constprop.0+0x20a>
        buf[i--] = digits[x % base];
    1240:	1782                	slli	a5,a5,0x20
    1242:	9381                	srli	a5,a5,0x20
    1244:	97b2                	add	a5,a5,a2
    1246:	0007c783          	lbu	a5,0(a5)
    124a:	4599                	li	a1,6
    124c:	00f10723          	sb	a5,14(sp)

    if (sign)
    1250:	00055763          	bgez	a0,125e <printint.constprop.0+0x126>
        buf[i--] = '-';
    1254:	02d00793          	li	a5,45
    1258:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    125c:	4595                	li	a1,5
    write(f, s, l);
    125e:	003c                	addi	a5,sp,8
    1260:	4641                	li	a2,16
    1262:	9e0d                	subw	a2,a2,a1
    1264:	4505                	li	a0,1
    1266:	95be                	add	a1,a1,a5
    1268:	29d000ef          	jal	ra,1d04 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    126c:	70a2                	ld	ra,40(sp)
    126e:	6145                	addi	sp,sp,48
    1270:	8082                	ret
        x = -xx;
    1272:	40a0083b          	negw	a6,a0
        buf[i--] = digits[x % base];
    1276:	02b877bb          	remuw	a5,a6,a1
    127a:	00001617          	auipc	a2,0x1
    127e:	e5e60613          	addi	a2,a2,-418 # 20d8 <digits>
    buf[16] = 0;
    1282:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1286:	0005871b          	sext.w	a4,a1
    128a:	1782                	slli	a5,a5,0x20
    128c:	9381                	srli	a5,a5,0x20
    128e:	97b2                	add	a5,a5,a2
    1290:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1294:	02b858bb          	divuw	a7,a6,a1
        buf[i--] = digits[x % base];
    1298:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    129c:	06b86963          	bltu	a6,a1,130e <printint.constprop.0+0x1d6>
        buf[i--] = digits[x % base];
    12a0:	02e8f7bb          	remuw	a5,a7,a4
    12a4:	1782                	slli	a5,a5,0x20
    12a6:	9381                	srli	a5,a5,0x20
    12a8:	97b2                	add	a5,a5,a2
    12aa:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    12ae:	02e8d6bb          	divuw	a3,a7,a4
        buf[i--] = digits[x % base];
    12b2:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    12b6:	ece8f8e3          	bgeu	a7,a4,1186 <printint.constprop.0+0x4e>
        buf[i--] = '-';
    12ba:	02d00793          	li	a5,45
    12be:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    12c2:	45b5                	li	a1,13
    12c4:	bf69                	j	125e <printint.constprop.0+0x126>
    12c6:	45a9                	li	a1,10
    if (sign)
    12c8:	f8055be3          	bgez	a0,125e <printint.constprop.0+0x126>
        buf[i--] = '-';
    12cc:	02d00793          	li	a5,45
    12d0:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    12d4:	45a5                	li	a1,9
    12d6:	b761                	j	125e <printint.constprop.0+0x126>
    12d8:	45b5                	li	a1,13
    if (sign)
    12da:	f80552e3          	bgez	a0,125e <printint.constprop.0+0x126>
        buf[i--] = '-';
    12de:	02d00793          	li	a5,45
    12e2:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    12e6:	45b1                	li	a1,12
    12e8:	bf9d                	j	125e <printint.constprop.0+0x126>
    12ea:	45b1                	li	a1,12
    if (sign)
    12ec:	f60559e3          	bgez	a0,125e <printint.constprop.0+0x126>
        buf[i--] = '-';
    12f0:	02d00793          	li	a5,45
    12f4:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12f8:	45ad                	li	a1,11
    12fa:	b795                	j	125e <printint.constprop.0+0x126>
    12fc:	45ad                	li	a1,11
    if (sign)
    12fe:	f60550e3          	bgez	a0,125e <printint.constprop.0+0x126>
        buf[i--] = '-';
    1302:	02d00793          	li	a5,45
    1306:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    130a:	45a9                	li	a1,10
    130c:	bf89                	j	125e <printint.constprop.0+0x126>
        buf[i--] = '-';
    130e:	02d00793          	li	a5,45
    1312:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1316:	45b9                	li	a1,14
    1318:	b799                	j	125e <printint.constprop.0+0x126>
    131a:	45a5                	li	a1,9
    if (sign)
    131c:	f40551e3          	bgez	a0,125e <printint.constprop.0+0x126>
        buf[i--] = '-';
    1320:	02d00793          	li	a5,45
    1324:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1328:	45a1                	li	a1,8
    132a:	bf15                	j	125e <printint.constprop.0+0x126>
    i = 15;
    132c:	45bd                	li	a1,15
    132e:	bf05                	j	125e <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    1330:	45a1                	li	a1,8
    if (sign)
    1332:	f20556e3          	bgez	a0,125e <printint.constprop.0+0x126>
        buf[i--] = '-';
    1336:	02d00793          	li	a5,45
    133a:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    133e:	459d                	li	a1,7
    1340:	bf39                	j	125e <printint.constprop.0+0x126>
    1342:	459d                	li	a1,7
    if (sign)
    1344:	f0055de3          	bgez	a0,125e <printint.constprop.0+0x126>
        buf[i--] = '-';
    1348:	02d00793          	li	a5,45
    134c:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1350:	4599                	li	a1,6
    1352:	b731                	j	125e <printint.constprop.0+0x126>

0000000000001354 <getchar>:
{
    1354:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1356:	00f10593          	addi	a1,sp,15
    135a:	4605                	li	a2,1
    135c:	4501                	li	a0,0
{
    135e:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1360:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1364:	197000ef          	jal	ra,1cfa <read>
}
    1368:	60e2                	ld	ra,24(sp)
    136a:	00f14503          	lbu	a0,15(sp)
    136e:	6105                	addi	sp,sp,32
    1370:	8082                	ret

0000000000001372 <putchar>:
{
    1372:	1101                	addi	sp,sp,-32
    1374:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1376:	00f10593          	addi	a1,sp,15
    137a:	4605                	li	a2,1
    137c:	4505                	li	a0,1
{
    137e:	ec06                	sd	ra,24(sp)
    char byte = c;
    1380:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1384:	181000ef          	jal	ra,1d04 <write>
}
    1388:	60e2                	ld	ra,24(sp)
    138a:	2501                	sext.w	a0,a0
    138c:	6105                	addi	sp,sp,32
    138e:	8082                	ret

0000000000001390 <puts>:
{
    1390:	1141                	addi	sp,sp,-16
    1392:	e406                	sd	ra,8(sp)
    1394:	e022                	sd	s0,0(sp)
    1396:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1398:	57e000ef          	jal	ra,1916 <strlen>
    139c:	862a                	mv	a2,a0
    139e:	85a2                	mv	a1,s0
    13a0:	4505                	li	a0,1
    13a2:	163000ef          	jal	ra,1d04 <write>
}
    13a6:	60a2                	ld	ra,8(sp)
    13a8:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    13aa:	957d                	srai	a0,a0,0x3f
    return r;
    13ac:	2501                	sext.w	a0,a0
}
    13ae:	0141                	addi	sp,sp,16
    13b0:	8082                	ret

00000000000013b2 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    13b2:	7171                	addi	sp,sp,-176
    13b4:	fc56                	sd	s5,56(sp)
    13b6:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    13b8:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    13ba:	18bc                	addi	a5,sp,120
{
    13bc:	e8ca                	sd	s2,80(sp)
    13be:	e4ce                	sd	s3,72(sp)
    13c0:	e0d2                	sd	s4,64(sp)
    13c2:	f85a                	sd	s6,48(sp)
    13c4:	f486                	sd	ra,104(sp)
    13c6:	f0a2                	sd	s0,96(sp)
    13c8:	eca6                	sd	s1,88(sp)
    13ca:	fcae                	sd	a1,120(sp)
    13cc:	e132                	sd	a2,128(sp)
    13ce:	e536                	sd	a3,136(sp)
    13d0:	e93a                	sd	a4,144(sp)
    13d2:	f142                	sd	a6,160(sp)
    13d4:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    13d6:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    13d8:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    13dc:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    13e0:	00001b17          	auipc	s6,0x1
    13e4:	c48b0b13          	addi	s6,s6,-952 # 2028 <__clone+0xec>
    buf[i++] = '0';
    13e8:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13ec:	00001997          	auipc	s3,0x1
    13f0:	cec98993          	addi	s3,s3,-788 # 20d8 <digits>
        if (!*s)
    13f4:	00054783          	lbu	a5,0(a0)
    13f8:	16078a63          	beqz	a5,156c <printf+0x1ba>
    13fc:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13fe:	19278163          	beq	a5,s2,1580 <printf+0x1ce>
    1402:	00164783          	lbu	a5,1(a2)
    1406:	0605                	addi	a2,a2,1
    1408:	fbfd                	bnez	a5,13fe <printf+0x4c>
    140a:	84b2                	mv	s1,a2
        l = z - a;
    140c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1410:	85aa                	mv	a1,a0
    1412:	8622                	mv	a2,s0
    1414:	4505                	li	a0,1
    1416:	0ef000ef          	jal	ra,1d04 <write>
        if (l)
    141a:	18041c63          	bnez	s0,15b2 <printf+0x200>
        if (s[1] == 0)
    141e:	0014c783          	lbu	a5,1(s1)
    1422:	14078563          	beqz	a5,156c <printf+0x1ba>
        switch (s[1])
    1426:	1d478063          	beq	a5,s4,15e6 <printf+0x234>
    142a:	18fa6663          	bltu	s4,a5,15b6 <printf+0x204>
    142e:	06400713          	li	a4,100
    1432:	1ae78063          	beq	a5,a4,15d2 <printf+0x220>
    1436:	07000713          	li	a4,112
    143a:	1ce79963          	bne	a5,a4,160c <printf+0x25a>
            printptr(va_arg(ap, uint64));
    143e:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1440:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1444:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1446:	631c                	ld	a5,0(a4)
    1448:	0721                	addi	a4,a4,8
    144a:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    144c:	00479293          	slli	t0,a5,0x4
    1450:	00879f93          	slli	t6,a5,0x8
    1454:	00c79f13          	slli	t5,a5,0xc
    1458:	01079e93          	slli	t4,a5,0x10
    145c:	01479e13          	slli	t3,a5,0x14
    1460:	01879313          	slli	t1,a5,0x18
    1464:	01c79893          	slli	a7,a5,0x1c
    1468:	02479813          	slli	a6,a5,0x24
    146c:	02879513          	slli	a0,a5,0x28
    1470:	02c79593          	slli	a1,a5,0x2c
    1474:	03079693          	slli	a3,a5,0x30
    1478:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    147c:	03c7d413          	srli	s0,a5,0x3c
    1480:	01c7d39b          	srliw	t2,a5,0x1c
    1484:	03c2d293          	srli	t0,t0,0x3c
    1488:	03cfdf93          	srli	t6,t6,0x3c
    148c:	03cf5f13          	srli	t5,t5,0x3c
    1490:	03cede93          	srli	t4,t4,0x3c
    1494:	03ce5e13          	srli	t3,t3,0x3c
    1498:	03c35313          	srli	t1,t1,0x3c
    149c:	03c8d893          	srli	a7,a7,0x3c
    14a0:	03c85813          	srli	a6,a6,0x3c
    14a4:	9171                	srli	a0,a0,0x3c
    14a6:	91f1                	srli	a1,a1,0x3c
    14a8:	92f1                	srli	a3,a3,0x3c
    14aa:	9371                	srli	a4,a4,0x3c
    14ac:	96ce                	add	a3,a3,s3
    14ae:	974e                	add	a4,a4,s3
    14b0:	944e                	add	s0,s0,s3
    14b2:	92ce                	add	t0,t0,s3
    14b4:	9fce                	add	t6,t6,s3
    14b6:	9f4e                	add	t5,t5,s3
    14b8:	9ece                	add	t4,t4,s3
    14ba:	9e4e                	add	t3,t3,s3
    14bc:	934e                	add	t1,t1,s3
    14be:	98ce                	add	a7,a7,s3
    14c0:	93ce                	add	t2,t2,s3
    14c2:	984e                	add	a6,a6,s3
    14c4:	954e                	add	a0,a0,s3
    14c6:	95ce                	add	a1,a1,s3
    14c8:	0006c083          	lbu	ra,0(a3)
    14cc:	0002c283          	lbu	t0,0(t0)
    14d0:	00074683          	lbu	a3,0(a4)
    14d4:	000fcf83          	lbu	t6,0(t6)
    14d8:	000f4f03          	lbu	t5,0(t5)
    14dc:	000ece83          	lbu	t4,0(t4)
    14e0:	000e4e03          	lbu	t3,0(t3)
    14e4:	00034303          	lbu	t1,0(t1)
    14e8:	0008c883          	lbu	a7,0(a7)
    14ec:	0003c383          	lbu	t2,0(t2)
    14f0:	00084803          	lbu	a6,0(a6)
    14f4:	00054503          	lbu	a0,0(a0)
    14f8:	0005c583          	lbu	a1,0(a1)
    14fc:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1500:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1504:	9371                	srli	a4,a4,0x3c
    1506:	8bbd                	andi	a5,a5,15
    1508:	974e                	add	a4,a4,s3
    150a:	97ce                	add	a5,a5,s3
    150c:	005105a3          	sb	t0,11(sp)
    1510:	01f10623          	sb	t6,12(sp)
    1514:	01e106a3          	sb	t5,13(sp)
    1518:	01d10723          	sb	t4,14(sp)
    151c:	01c107a3          	sb	t3,15(sp)
    1520:	00610823          	sb	t1,16(sp)
    1524:	011108a3          	sb	a7,17(sp)
    1528:	00710923          	sb	t2,18(sp)
    152c:	010109a3          	sb	a6,19(sp)
    1530:	00a10a23          	sb	a0,20(sp)
    1534:	00b10aa3          	sb	a1,21(sp)
    1538:	00110b23          	sb	ra,22(sp)
    153c:	00d10ba3          	sb	a3,23(sp)
    1540:	00810523          	sb	s0,10(sp)
    1544:	00074703          	lbu	a4,0(a4)
    1548:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    154c:	002c                	addi	a1,sp,8
    154e:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1550:	00e10c23          	sb	a4,24(sp)
    1554:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1558:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    155c:	7a8000ef          	jal	ra,1d04 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1560:	00248513          	addi	a0,s1,2
        if (!*s)
    1564:	00054783          	lbu	a5,0(a0)
    1568:	e8079ae3          	bnez	a5,13fc <printf+0x4a>
    }
    va_end(ap);
}
    156c:	70a6                	ld	ra,104(sp)
    156e:	7406                	ld	s0,96(sp)
    1570:	64e6                	ld	s1,88(sp)
    1572:	6946                	ld	s2,80(sp)
    1574:	69a6                	ld	s3,72(sp)
    1576:	6a06                	ld	s4,64(sp)
    1578:	7ae2                	ld	s5,56(sp)
    157a:	7b42                	ld	s6,48(sp)
    157c:	614d                	addi	sp,sp,176
    157e:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1580:	00064783          	lbu	a5,0(a2)
    1584:	84b2                	mv	s1,a2
    1586:	01278963          	beq	a5,s2,1598 <printf+0x1e6>
    158a:	b549                	j	140c <printf+0x5a>
    158c:	0024c783          	lbu	a5,2(s1)
    1590:	0605                	addi	a2,a2,1
    1592:	0489                	addi	s1,s1,2
    1594:	e7279ce3          	bne	a5,s2,140c <printf+0x5a>
    1598:	0014c783          	lbu	a5,1(s1)
    159c:	ff2788e3          	beq	a5,s2,158c <printf+0x1da>
        l = z - a;
    15a0:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    15a4:	85aa                	mv	a1,a0
    15a6:	8622                	mv	a2,s0
    15a8:	4505                	li	a0,1
    15aa:	75a000ef          	jal	ra,1d04 <write>
        if (l)
    15ae:	e60408e3          	beqz	s0,141e <printf+0x6c>
    15b2:	8526                	mv	a0,s1
    15b4:	b581                	j	13f4 <printf+0x42>
        switch (s[1])
    15b6:	07800713          	li	a4,120
    15ba:	04e79963          	bne	a5,a4,160c <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    15be:	6782                	ld	a5,0(sp)
    15c0:	45c1                	li	a1,16
    15c2:	4388                	lw	a0,0(a5)
    15c4:	07a1                	addi	a5,a5,8
    15c6:	e03e                	sd	a5,0(sp)
    15c8:	b71ff0ef          	jal	ra,1138 <printint.constprop.0>
        s += 2;
    15cc:	00248513          	addi	a0,s1,2
    15d0:	bf51                	j	1564 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    15d2:	6782                	ld	a5,0(sp)
    15d4:	45a9                	li	a1,10
    15d6:	4388                	lw	a0,0(a5)
    15d8:	07a1                	addi	a5,a5,8
    15da:	e03e                	sd	a5,0(sp)
    15dc:	b5dff0ef          	jal	ra,1138 <printint.constprop.0>
        s += 2;
    15e0:	00248513          	addi	a0,s1,2
    15e4:	b741                	j	1564 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    15e6:	6782                	ld	a5,0(sp)
    15e8:	6380                	ld	s0,0(a5)
    15ea:	07a1                	addi	a5,a5,8
    15ec:	e03e                	sd	a5,0(sp)
    15ee:	c031                	beqz	s0,1632 <printf+0x280>
            l = strnlen(a, 200);
    15f0:	0c800593          	li	a1,200
    15f4:	8522                	mv	a0,s0
    15f6:	40c000ef          	jal	ra,1a02 <strnlen>
    write(f, s, l);
    15fa:	0005061b          	sext.w	a2,a0
    15fe:	85a2                	mv	a1,s0
    1600:	4505                	li	a0,1
    1602:	702000ef          	jal	ra,1d04 <write>
        s += 2;
    1606:	00248513          	addi	a0,s1,2
    160a:	bfa9                	j	1564 <printf+0x1b2>
    return write(stdout, &byte, 1);
    160c:	4605                	li	a2,1
    160e:	002c                	addi	a1,sp,8
    1610:	4505                	li	a0,1
    char byte = c;
    1612:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1616:	6ee000ef          	jal	ra,1d04 <write>
    char byte = c;
    161a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    161e:	4605                	li	a2,1
    1620:	002c                	addi	a1,sp,8
    1622:	4505                	li	a0,1
    char byte = c;
    1624:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1628:	6dc000ef          	jal	ra,1d04 <write>
        s += 2;
    162c:	00248513          	addi	a0,s1,2
    1630:	bf15                	j	1564 <printf+0x1b2>
                a = "(null)";
    1632:	845a                	mv	s0,s6
    1634:	bf75                	j	15f0 <printf+0x23e>

0000000000001636 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1636:	1141                	addi	sp,sp,-16
    1638:	e406                	sd	ra,8(sp)
    puts(m);
    163a:	d57ff0ef          	jal	ra,1390 <puts>
    exit(-100);
}
    163e:	60a2                	ld	ra,8(sp)
    exit(-100);
    1640:	f9c00513          	li	a0,-100
}
    1644:	0141                	addi	sp,sp,16
    exit(-100);
    1646:	a739                	j	1d54 <exit>

0000000000001648 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1648:	02000793          	li	a5,32
    164c:	00f50663          	beq	a0,a5,1658 <isspace+0x10>
    1650:	355d                	addiw	a0,a0,-9
    1652:	00553513          	sltiu	a0,a0,5
    1656:	8082                	ret
    1658:	4505                	li	a0,1
}
    165a:	8082                	ret

000000000000165c <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    165c:	fd05051b          	addiw	a0,a0,-48
}
    1660:	00a53513          	sltiu	a0,a0,10
    1664:	8082                	ret

0000000000001666 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1666:	02000613          	li	a2,32
    166a:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    166c:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1670:	ff77869b          	addiw	a3,a5,-9
    1674:	04c78c63          	beq	a5,a2,16cc <atoi+0x66>
    1678:	0007871b          	sext.w	a4,a5
    167c:	04d5f863          	bgeu	a1,a3,16cc <atoi+0x66>
        s++;
    switch (*s)
    1680:	02b00693          	li	a3,43
    1684:	04d78963          	beq	a5,a3,16d6 <atoi+0x70>
    1688:	02d00693          	li	a3,45
    168c:	06d78263          	beq	a5,a3,16f0 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1690:	fd07061b          	addiw	a2,a4,-48
    1694:	47a5                	li	a5,9
    1696:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1698:	4e01                	li	t3,0
    while (isdigit(*s))
    169a:	04c7e963          	bltu	a5,a2,16ec <atoi+0x86>
    int n = 0, neg = 0;
    169e:	4501                	li	a0,0
    while (isdigit(*s))
    16a0:	4825                	li	a6,9
    16a2:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    16a6:	0025179b          	slliw	a5,a0,0x2
    16aa:	9fa9                	addw	a5,a5,a0
    16ac:	fd07031b          	addiw	t1,a4,-48
    16b0:	0017989b          	slliw	a7,a5,0x1
    while (isdigit(*s))
    16b4:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    16b8:	0685                	addi	a3,a3,1
    16ba:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    16be:	0006071b          	sext.w	a4,a2
    16c2:	feb870e3          	bgeu	a6,a1,16a2 <atoi+0x3c>
    return neg ? n : -n;
    16c6:	000e0563          	beqz	t3,16d0 <atoi+0x6a>
}
    16ca:	8082                	ret
        s++;
    16cc:	0505                	addi	a0,a0,1
    16ce:	bf79                	j	166c <atoi+0x6>
    return neg ? n : -n;
    16d0:	4113053b          	subw	a0,t1,a7
    16d4:	8082                	ret
    while (isdigit(*s))
    16d6:	00154703          	lbu	a4,1(a0)
    16da:	47a5                	li	a5,9
        s++;
    16dc:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    16e0:	fd07061b          	addiw	a2,a4,-48
    int n = 0, neg = 0;
    16e4:	4e01                	li	t3,0
    while (isdigit(*s))
    16e6:	2701                	sext.w	a4,a4
    16e8:	fac7fbe3          	bgeu	a5,a2,169e <atoi+0x38>
    16ec:	4501                	li	a0,0
}
    16ee:	8082                	ret
    while (isdigit(*s))
    16f0:	00154703          	lbu	a4,1(a0)
    16f4:	47a5                	li	a5,9
        s++;
    16f6:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    16fa:	fd07061b          	addiw	a2,a4,-48
    16fe:	2701                	sext.w	a4,a4
    1700:	fec7e6e3          	bltu	a5,a2,16ec <atoi+0x86>
        neg = 1;
    1704:	4e05                	li	t3,1
    1706:	bf61                	j	169e <atoi+0x38>

0000000000001708 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1708:	16060d63          	beqz	a2,1882 <memset+0x17a>
    170c:	40a007b3          	neg	a5,a0
    1710:	8b9d                	andi	a5,a5,7
    1712:	00778693          	addi	a3,a5,7
    1716:	482d                	li	a6,11
    1718:	0ff5f713          	zext.b	a4,a1
    171c:	fff60593          	addi	a1,a2,-1
    1720:	1706e263          	bltu	a3,a6,1884 <memset+0x17c>
    1724:	16d5ea63          	bltu	a1,a3,1898 <memset+0x190>
    1728:	16078563          	beqz	a5,1892 <memset+0x18a>
    172c:	00e50023          	sb	a4,0(a0)
    1730:	4685                	li	a3,1
    1732:	00150593          	addi	a1,a0,1
    1736:	14d78c63          	beq	a5,a3,188e <memset+0x186>
    173a:	00e500a3          	sb	a4,1(a0)
    173e:	4689                	li	a3,2
    1740:	00250593          	addi	a1,a0,2
    1744:	14d78d63          	beq	a5,a3,189e <memset+0x196>
    1748:	00e50123          	sb	a4,2(a0)
    174c:	468d                	li	a3,3
    174e:	00350593          	addi	a1,a0,3
    1752:	12d78b63          	beq	a5,a3,1888 <memset+0x180>
    1756:	00e501a3          	sb	a4,3(a0)
    175a:	4691                	li	a3,4
    175c:	00450593          	addi	a1,a0,4
    1760:	14d78163          	beq	a5,a3,18a2 <memset+0x19a>
    1764:	00e50223          	sb	a4,4(a0)
    1768:	4695                	li	a3,5
    176a:	00550593          	addi	a1,a0,5
    176e:	12d78c63          	beq	a5,a3,18a6 <memset+0x19e>
    1772:	00e502a3          	sb	a4,5(a0)
    1776:	469d                	li	a3,7
    1778:	00650593          	addi	a1,a0,6
    177c:	12d79763          	bne	a5,a3,18aa <memset+0x1a2>
    1780:	00750593          	addi	a1,a0,7
    1784:	00e50323          	sb	a4,6(a0)
    1788:	481d                	li	a6,7
    178a:	00871693          	slli	a3,a4,0x8
    178e:	01071893          	slli	a7,a4,0x10
    1792:	8ed9                	or	a3,a3,a4
    1794:	01871313          	slli	t1,a4,0x18
    1798:	0116e6b3          	or	a3,a3,a7
    179c:	0066e6b3          	or	a3,a3,t1
    17a0:	02071893          	slli	a7,a4,0x20
    17a4:	02871e13          	slli	t3,a4,0x28
    17a8:	0116e6b3          	or	a3,a3,a7
    17ac:	40f60333          	sub	t1,a2,a5
    17b0:	03071893          	slli	a7,a4,0x30
    17b4:	01c6e6b3          	or	a3,a3,t3
    17b8:	0116e6b3          	or	a3,a3,a7
    17bc:	03871e13          	slli	t3,a4,0x38
    17c0:	97aa                	add	a5,a5,a0
    17c2:	ff837893          	andi	a7,t1,-8
    17c6:	01c6e6b3          	or	a3,a3,t3
    17ca:	98be                	add	a7,a7,a5
    17cc:	e394                	sd	a3,0(a5)
    17ce:	07a1                	addi	a5,a5,8
    17d0:	ff179ee3          	bne	a5,a7,17cc <memset+0xc4>
    17d4:	ff837893          	andi	a7,t1,-8
    17d8:	011587b3          	add	a5,a1,a7
    17dc:	010886bb          	addw	a3,a7,a6
    17e0:	0b130663          	beq	t1,a7,188c <memset+0x184>
    17e4:	00e78023          	sb	a4,0(a5)
    17e8:	0016859b          	addiw	a1,a3,1
    17ec:	08c5fb63          	bgeu	a1,a2,1882 <memset+0x17a>
    17f0:	00e780a3          	sb	a4,1(a5)
    17f4:	0026859b          	addiw	a1,a3,2
    17f8:	08c5f563          	bgeu	a1,a2,1882 <memset+0x17a>
    17fc:	00e78123          	sb	a4,2(a5)
    1800:	0036859b          	addiw	a1,a3,3
    1804:	06c5ff63          	bgeu	a1,a2,1882 <memset+0x17a>
    1808:	00e781a3          	sb	a4,3(a5)
    180c:	0046859b          	addiw	a1,a3,4
    1810:	06c5f963          	bgeu	a1,a2,1882 <memset+0x17a>
    1814:	00e78223          	sb	a4,4(a5)
    1818:	0056859b          	addiw	a1,a3,5
    181c:	06c5f363          	bgeu	a1,a2,1882 <memset+0x17a>
    1820:	00e782a3          	sb	a4,5(a5)
    1824:	0066859b          	addiw	a1,a3,6
    1828:	04c5fd63          	bgeu	a1,a2,1882 <memset+0x17a>
    182c:	00e78323          	sb	a4,6(a5)
    1830:	0076859b          	addiw	a1,a3,7
    1834:	04c5f763          	bgeu	a1,a2,1882 <memset+0x17a>
    1838:	00e783a3          	sb	a4,7(a5)
    183c:	0086859b          	addiw	a1,a3,8
    1840:	04c5f163          	bgeu	a1,a2,1882 <memset+0x17a>
    1844:	00e78423          	sb	a4,8(a5)
    1848:	0096859b          	addiw	a1,a3,9
    184c:	02c5fb63          	bgeu	a1,a2,1882 <memset+0x17a>
    1850:	00e784a3          	sb	a4,9(a5)
    1854:	00a6859b          	addiw	a1,a3,10
    1858:	02c5f563          	bgeu	a1,a2,1882 <memset+0x17a>
    185c:	00e78523          	sb	a4,10(a5)
    1860:	00b6859b          	addiw	a1,a3,11
    1864:	00c5ff63          	bgeu	a1,a2,1882 <memset+0x17a>
    1868:	00e785a3          	sb	a4,11(a5)
    186c:	00c6859b          	addiw	a1,a3,12
    1870:	00c5f963          	bgeu	a1,a2,1882 <memset+0x17a>
    1874:	00e78623          	sb	a4,12(a5)
    1878:	26b5                	addiw	a3,a3,13
    187a:	00c6f463          	bgeu	a3,a2,1882 <memset+0x17a>
    187e:	00e786a3          	sb	a4,13(a5)
        ;
    return dest;
}
    1882:	8082                	ret
    1884:	46ad                	li	a3,11
    1886:	bd79                	j	1724 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1888:	480d                	li	a6,3
    188a:	b701                	j	178a <memset+0x82>
    188c:	8082                	ret
    188e:	4805                	li	a6,1
    1890:	bded                	j	178a <memset+0x82>
    1892:	85aa                	mv	a1,a0
    1894:	4801                	li	a6,0
    1896:	bdd5                	j	178a <memset+0x82>
    1898:	87aa                	mv	a5,a0
    189a:	4681                	li	a3,0
    189c:	b7a1                	j	17e4 <memset+0xdc>
    189e:	4809                	li	a6,2
    18a0:	b5ed                	j	178a <memset+0x82>
    18a2:	4811                	li	a6,4
    18a4:	b5dd                	j	178a <memset+0x82>
    18a6:	4815                	li	a6,5
    18a8:	b5cd                	j	178a <memset+0x82>
    18aa:	4819                	li	a6,6
    18ac:	bdf9                	j	178a <memset+0x82>

00000000000018ae <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    18ae:	00054783          	lbu	a5,0(a0)
    18b2:	0005c703          	lbu	a4,0(a1)
    18b6:	00e79863          	bne	a5,a4,18c6 <strcmp+0x18>
    18ba:	0505                	addi	a0,a0,1
    18bc:	0585                	addi	a1,a1,1
    18be:	fbe5                	bnez	a5,18ae <strcmp>
    18c0:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    18c2:	9d19                	subw	a0,a0,a4
    18c4:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    18c6:	0007851b          	sext.w	a0,a5
    18ca:	bfe5                	j	18c2 <strcmp+0x14>

00000000000018cc <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    18cc:	ca15                	beqz	a2,1900 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18ce:	00054783          	lbu	a5,0(a0)
    if (!n--)
    18d2:	167d                	addi	a2,a2,-1
    18d4:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18d8:	eb99                	bnez	a5,18ee <strncmp+0x22>
    18da:	a815                	j	190e <strncmp+0x42>
    18dc:	00a68e63          	beq	a3,a0,18f8 <strncmp+0x2c>
    18e0:	0505                	addi	a0,a0,1
    18e2:	00f71b63          	bne	a4,a5,18f8 <strncmp+0x2c>
    18e6:	00054783          	lbu	a5,0(a0)
    18ea:	cf89                	beqz	a5,1904 <strncmp+0x38>
    18ec:	85b2                	mv	a1,a2
    18ee:	0005c703          	lbu	a4,0(a1)
    18f2:	00158613          	addi	a2,a1,1
    18f6:	f37d                	bnez	a4,18dc <strncmp+0x10>
        ;
    return *l - *r;
    18f8:	0007851b          	sext.w	a0,a5
    18fc:	9d19                	subw	a0,a0,a4
    18fe:	8082                	ret
        return 0;
    1900:	4501                	li	a0,0
}
    1902:	8082                	ret
    return *l - *r;
    1904:	0015c703          	lbu	a4,1(a1)
    1908:	4501                	li	a0,0
    190a:	9d19                	subw	a0,a0,a4
    190c:	8082                	ret
    190e:	0005c703          	lbu	a4,0(a1)
    1912:	4501                	li	a0,0
    1914:	b7e5                	j	18fc <strncmp+0x30>

0000000000001916 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1916:	00757793          	andi	a5,a0,7
    191a:	cf89                	beqz	a5,1934 <strlen+0x1e>
    191c:	87aa                	mv	a5,a0
    191e:	a029                	j	1928 <strlen+0x12>
    1920:	0785                	addi	a5,a5,1
    1922:	0077f713          	andi	a4,a5,7
    1926:	cb01                	beqz	a4,1936 <strlen+0x20>
        if (!*s)
    1928:	0007c703          	lbu	a4,0(a5)
    192c:	fb75                	bnez	a4,1920 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    192e:	40a78533          	sub	a0,a5,a0
}
    1932:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1934:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1936:	6394                	ld	a3,0(a5)
    1938:	00000597          	auipc	a1,0x0
    193c:	6f85b583          	ld	a1,1784(a1) # 2030 <__clone+0xf4>
    1940:	00000617          	auipc	a2,0x0
    1944:	6f863603          	ld	a2,1784(a2) # 2038 <__clone+0xfc>
    1948:	a019                	j	194e <strlen+0x38>
    194a:	6794                	ld	a3,8(a5)
    194c:	07a1                	addi	a5,a5,8
    194e:	00b68733          	add	a4,a3,a1
    1952:	fff6c693          	not	a3,a3
    1956:	8f75                	and	a4,a4,a3
    1958:	8f71                	and	a4,a4,a2
    195a:	db65                	beqz	a4,194a <strlen+0x34>
    for (; *s; s++)
    195c:	0007c703          	lbu	a4,0(a5)
    1960:	d779                	beqz	a4,192e <strlen+0x18>
    1962:	0017c703          	lbu	a4,1(a5)
    1966:	0785                	addi	a5,a5,1
    1968:	d379                	beqz	a4,192e <strlen+0x18>
    196a:	0017c703          	lbu	a4,1(a5)
    196e:	0785                	addi	a5,a5,1
    1970:	fb6d                	bnez	a4,1962 <strlen+0x4c>
    1972:	bf75                	j	192e <strlen+0x18>

0000000000001974 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1974:	00757713          	andi	a4,a0,7
{
    1978:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    197a:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    197e:	cb19                	beqz	a4,1994 <memchr+0x20>
    1980:	ce25                	beqz	a2,19f8 <memchr+0x84>
    1982:	0007c703          	lbu	a4,0(a5)
    1986:	04b70e63          	beq	a4,a1,19e2 <memchr+0x6e>
    198a:	0785                	addi	a5,a5,1
    198c:	0077f713          	andi	a4,a5,7
    1990:	167d                	addi	a2,a2,-1
    1992:	f77d                	bnez	a4,1980 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1994:	4501                	li	a0,0
    if (n && *s != c)
    1996:	c235                	beqz	a2,19fa <memchr+0x86>
    1998:	0007c703          	lbu	a4,0(a5)
    199c:	04b70363          	beq	a4,a1,19e2 <memchr+0x6e>
        size_t k = ONES * c;
    19a0:	00000517          	auipc	a0,0x0
    19a4:	6a053503          	ld	a0,1696(a0) # 2040 <__clone+0x104>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19a8:	471d                	li	a4,7
        size_t k = ONES * c;
    19aa:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19ae:	02c77a63          	bgeu	a4,a2,19e2 <memchr+0x6e>
    19b2:	00000897          	auipc	a7,0x0
    19b6:	67e8b883          	ld	a7,1662(a7) # 2030 <__clone+0xf4>
    19ba:	00000817          	auipc	a6,0x0
    19be:	67e83803          	ld	a6,1662(a6) # 2038 <__clone+0xfc>
    19c2:	431d                	li	t1,7
    19c4:	a029                	j	19ce <memchr+0x5a>
    19c6:	1661                	addi	a2,a2,-8
    19c8:	07a1                	addi	a5,a5,8
    19ca:	02c37963          	bgeu	t1,a2,19fc <memchr+0x88>
    19ce:	6398                	ld	a4,0(a5)
    19d0:	8f29                	xor	a4,a4,a0
    19d2:	011706b3          	add	a3,a4,a7
    19d6:	fff74713          	not	a4,a4
    19da:	8f75                	and	a4,a4,a3
    19dc:	01077733          	and	a4,a4,a6
    19e0:	d37d                	beqz	a4,19c6 <memchr+0x52>
{
    19e2:	853e                	mv	a0,a5
    19e4:	97b2                	add	a5,a5,a2
    19e6:	a021                	j	19ee <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    19e8:	0505                	addi	a0,a0,1
    19ea:	00f50763          	beq	a0,a5,19f8 <memchr+0x84>
    19ee:	00054703          	lbu	a4,0(a0)
    19f2:	feb71be3          	bne	a4,a1,19e8 <memchr+0x74>
    19f6:	8082                	ret
    return n ? (void *)s : 0;
    19f8:	4501                	li	a0,0
}
    19fa:	8082                	ret
    return n ? (void *)s : 0;
    19fc:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    19fe:	f275                	bnez	a2,19e2 <memchr+0x6e>
}
    1a00:	8082                	ret

0000000000001a02 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1a02:	1101                	addi	sp,sp,-32
    1a04:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1a06:	862e                	mv	a2,a1
{
    1a08:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1a0a:	4581                	li	a1,0
{
    1a0c:	e426                	sd	s1,8(sp)
    1a0e:	ec06                	sd	ra,24(sp)
    1a10:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1a12:	f63ff0ef          	jal	ra,1974 <memchr>
    return p ? p - s : n;
    1a16:	c519                	beqz	a0,1a24 <strnlen+0x22>
}
    1a18:	60e2                	ld	ra,24(sp)
    1a1a:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1a1c:	8d05                	sub	a0,a0,s1
}
    1a1e:	64a2                	ld	s1,8(sp)
    1a20:	6105                	addi	sp,sp,32
    1a22:	8082                	ret
    1a24:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1a26:	8522                	mv	a0,s0
}
    1a28:	6442                	ld	s0,16(sp)
    1a2a:	64a2                	ld	s1,8(sp)
    1a2c:	6105                	addi	sp,sp,32
    1a2e:	8082                	ret

0000000000001a30 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a30:	00a5c7b3          	xor	a5,a1,a0
    1a34:	8b9d                	andi	a5,a5,7
    1a36:	eb95                	bnez	a5,1a6a <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a38:	0075f793          	andi	a5,a1,7
    1a3c:	e7b1                	bnez	a5,1a88 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a3e:	6198                	ld	a4,0(a1)
    1a40:	00000617          	auipc	a2,0x0
    1a44:	5f063603          	ld	a2,1520(a2) # 2030 <__clone+0xf4>
    1a48:	00000817          	auipc	a6,0x0
    1a4c:	5f083803          	ld	a6,1520(a6) # 2038 <__clone+0xfc>
    1a50:	a029                	j	1a5a <strcpy+0x2a>
    1a52:	05a1                	addi	a1,a1,8
    1a54:	e118                	sd	a4,0(a0)
    1a56:	6198                	ld	a4,0(a1)
    1a58:	0521                	addi	a0,a0,8
    1a5a:	00c707b3          	add	a5,a4,a2
    1a5e:	fff74693          	not	a3,a4
    1a62:	8ff5                	and	a5,a5,a3
    1a64:	0107f7b3          	and	a5,a5,a6
    1a68:	d7ed                	beqz	a5,1a52 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a6a:	0005c783          	lbu	a5,0(a1)
    1a6e:	00f50023          	sb	a5,0(a0)
    1a72:	c785                	beqz	a5,1a9a <strcpy+0x6a>
    1a74:	0015c783          	lbu	a5,1(a1)
    1a78:	0505                	addi	a0,a0,1
    1a7a:	0585                	addi	a1,a1,1
    1a7c:	00f50023          	sb	a5,0(a0)
    1a80:	fbf5                	bnez	a5,1a74 <strcpy+0x44>
        ;
    return d;
}
    1a82:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a84:	0505                	addi	a0,a0,1
    1a86:	df45                	beqz	a4,1a3e <strcpy+0xe>
            if (!(*d = *s))
    1a88:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a8c:	0585                	addi	a1,a1,1
    1a8e:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1a92:	00f50023          	sb	a5,0(a0)
    1a96:	f7fd                	bnez	a5,1a84 <strcpy+0x54>
}
    1a98:	8082                	ret
    1a9a:	8082                	ret

0000000000001a9c <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a9c:	00a5c7b3          	xor	a5,a1,a0
    1aa0:	8b9d                	andi	a5,a5,7
    1aa2:	1a079863          	bnez	a5,1c52 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1aa6:	0075f793          	andi	a5,a1,7
    1aaa:	16078463          	beqz	a5,1c12 <strncpy+0x176>
    1aae:	ea01                	bnez	a2,1abe <strncpy+0x22>
    1ab0:	a421                	j	1cb8 <strncpy+0x21c>
    1ab2:	167d                	addi	a2,a2,-1
    1ab4:	0505                	addi	a0,a0,1
    1ab6:	14070e63          	beqz	a4,1c12 <strncpy+0x176>
    1aba:	1a060863          	beqz	a2,1c6a <strncpy+0x1ce>
    1abe:	0005c783          	lbu	a5,0(a1)
    1ac2:	0585                	addi	a1,a1,1
    1ac4:	0075f713          	andi	a4,a1,7
    1ac8:	00f50023          	sb	a5,0(a0)
    1acc:	f3fd                	bnez	a5,1ab2 <strncpy+0x16>
    1ace:	4805                	li	a6,1
    1ad0:	1a061863          	bnez	a2,1c80 <strncpy+0x1e4>
    1ad4:	40a007b3          	neg	a5,a0
    1ad8:	8b9d                	andi	a5,a5,7
    1ada:	4681                	li	a3,0
    1adc:	18061a63          	bnez	a2,1c70 <strncpy+0x1d4>
    1ae0:	00778713          	addi	a4,a5,7
    1ae4:	45ad                	li	a1,11
    1ae6:	18b76363          	bltu	a4,a1,1c6c <strncpy+0x1d0>
    1aea:	1ae6eb63          	bltu	a3,a4,1ca0 <strncpy+0x204>
    1aee:	1a078363          	beqz	a5,1c94 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1af2:	00050023          	sb	zero,0(a0)
    1af6:	4685                	li	a3,1
    1af8:	00150713          	addi	a4,a0,1
    1afc:	18d78f63          	beq	a5,a3,1c9a <strncpy+0x1fe>
    1b00:	000500a3          	sb	zero,1(a0)
    1b04:	4689                	li	a3,2
    1b06:	00250713          	addi	a4,a0,2
    1b0a:	18d78e63          	beq	a5,a3,1ca6 <strncpy+0x20a>
    1b0e:	00050123          	sb	zero,2(a0)
    1b12:	468d                	li	a3,3
    1b14:	00350713          	addi	a4,a0,3
    1b18:	16d78c63          	beq	a5,a3,1c90 <strncpy+0x1f4>
    1b1c:	000501a3          	sb	zero,3(a0)
    1b20:	4691                	li	a3,4
    1b22:	00450713          	addi	a4,a0,4
    1b26:	18d78263          	beq	a5,a3,1caa <strncpy+0x20e>
    1b2a:	00050223          	sb	zero,4(a0)
    1b2e:	4695                	li	a3,5
    1b30:	00550713          	addi	a4,a0,5
    1b34:	16d78d63          	beq	a5,a3,1cae <strncpy+0x212>
    1b38:	000502a3          	sb	zero,5(a0)
    1b3c:	469d                	li	a3,7
    1b3e:	00650713          	addi	a4,a0,6
    1b42:	16d79863          	bne	a5,a3,1cb2 <strncpy+0x216>
    1b46:	00750713          	addi	a4,a0,7
    1b4a:	00050323          	sb	zero,6(a0)
    1b4e:	40f80833          	sub	a6,a6,a5
    1b52:	ff887593          	andi	a1,a6,-8
    1b56:	97aa                	add	a5,a5,a0
    1b58:	95be                	add	a1,a1,a5
    1b5a:	0007b023          	sd	zero,0(a5)
    1b5e:	07a1                	addi	a5,a5,8
    1b60:	feb79de3          	bne	a5,a1,1b5a <strncpy+0xbe>
    1b64:	ff887593          	andi	a1,a6,-8
    1b68:	9ead                	addw	a3,a3,a1
    1b6a:	00b707b3          	add	a5,a4,a1
    1b6e:	12b80863          	beq	a6,a1,1c9e <strncpy+0x202>
    1b72:	00078023          	sb	zero,0(a5)
    1b76:	0016871b          	addiw	a4,a3,1
    1b7a:	0ec77863          	bgeu	a4,a2,1c6a <strncpy+0x1ce>
    1b7e:	000780a3          	sb	zero,1(a5)
    1b82:	0026871b          	addiw	a4,a3,2
    1b86:	0ec77263          	bgeu	a4,a2,1c6a <strncpy+0x1ce>
    1b8a:	00078123          	sb	zero,2(a5)
    1b8e:	0036871b          	addiw	a4,a3,3
    1b92:	0cc77c63          	bgeu	a4,a2,1c6a <strncpy+0x1ce>
    1b96:	000781a3          	sb	zero,3(a5)
    1b9a:	0046871b          	addiw	a4,a3,4
    1b9e:	0cc77663          	bgeu	a4,a2,1c6a <strncpy+0x1ce>
    1ba2:	00078223          	sb	zero,4(a5)
    1ba6:	0056871b          	addiw	a4,a3,5
    1baa:	0cc77063          	bgeu	a4,a2,1c6a <strncpy+0x1ce>
    1bae:	000782a3          	sb	zero,5(a5)
    1bb2:	0066871b          	addiw	a4,a3,6
    1bb6:	0ac77a63          	bgeu	a4,a2,1c6a <strncpy+0x1ce>
    1bba:	00078323          	sb	zero,6(a5)
    1bbe:	0076871b          	addiw	a4,a3,7
    1bc2:	0ac77463          	bgeu	a4,a2,1c6a <strncpy+0x1ce>
    1bc6:	000783a3          	sb	zero,7(a5)
    1bca:	0086871b          	addiw	a4,a3,8
    1bce:	08c77e63          	bgeu	a4,a2,1c6a <strncpy+0x1ce>
    1bd2:	00078423          	sb	zero,8(a5)
    1bd6:	0096871b          	addiw	a4,a3,9
    1bda:	08c77863          	bgeu	a4,a2,1c6a <strncpy+0x1ce>
    1bde:	000784a3          	sb	zero,9(a5)
    1be2:	00a6871b          	addiw	a4,a3,10
    1be6:	08c77263          	bgeu	a4,a2,1c6a <strncpy+0x1ce>
    1bea:	00078523          	sb	zero,10(a5)
    1bee:	00b6871b          	addiw	a4,a3,11
    1bf2:	06c77c63          	bgeu	a4,a2,1c6a <strncpy+0x1ce>
    1bf6:	000785a3          	sb	zero,11(a5)
    1bfa:	00c6871b          	addiw	a4,a3,12
    1bfe:	06c77663          	bgeu	a4,a2,1c6a <strncpy+0x1ce>
    1c02:	00078623          	sb	zero,12(a5)
    1c06:	26b5                	addiw	a3,a3,13
    1c08:	06c6f163          	bgeu	a3,a2,1c6a <strncpy+0x1ce>
    1c0c:	000786a3          	sb	zero,13(a5)
    1c10:	8082                	ret
            ;
        if (!n || !*s)
    1c12:	c645                	beqz	a2,1cba <strncpy+0x21e>
    1c14:	0005c783          	lbu	a5,0(a1)
    1c18:	ea078be3          	beqz	a5,1ace <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1c1c:	479d                	li	a5,7
    1c1e:	02c7ff63          	bgeu	a5,a2,1c5c <strncpy+0x1c0>
    1c22:	00000897          	auipc	a7,0x0
    1c26:	40e8b883          	ld	a7,1038(a7) # 2030 <__clone+0xf4>
    1c2a:	00000817          	auipc	a6,0x0
    1c2e:	40e83803          	ld	a6,1038(a6) # 2038 <__clone+0xfc>
    1c32:	431d                	li	t1,7
    1c34:	6198                	ld	a4,0(a1)
    1c36:	011707b3          	add	a5,a4,a7
    1c3a:	fff74693          	not	a3,a4
    1c3e:	8ff5                	and	a5,a5,a3
    1c40:	0107f7b3          	and	a5,a5,a6
    1c44:	ef81                	bnez	a5,1c5c <strncpy+0x1c0>
            *wd = *ws;
    1c46:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1c48:	1661                	addi	a2,a2,-8
    1c4a:	05a1                	addi	a1,a1,8
    1c4c:	0521                	addi	a0,a0,8
    1c4e:	fec363e3          	bltu	t1,a2,1c34 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1c52:	e609                	bnez	a2,1c5c <strncpy+0x1c0>
    1c54:	a08d                	j	1cb6 <strncpy+0x21a>
    1c56:	167d                	addi	a2,a2,-1
    1c58:	0505                	addi	a0,a0,1
    1c5a:	ca01                	beqz	a2,1c6a <strncpy+0x1ce>
    1c5c:	0005c783          	lbu	a5,0(a1)
    1c60:	0585                	addi	a1,a1,1
    1c62:	00f50023          	sb	a5,0(a0)
    1c66:	fbe5                	bnez	a5,1c56 <strncpy+0x1ba>
        ;
tail:
    1c68:	b59d                	j	1ace <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1c6a:	8082                	ret
    1c6c:	472d                	li	a4,11
    1c6e:	bdb5                	j	1aea <strncpy+0x4e>
    1c70:	00778713          	addi	a4,a5,7
    1c74:	45ad                	li	a1,11
    1c76:	fff60693          	addi	a3,a2,-1
    1c7a:	e6b778e3          	bgeu	a4,a1,1aea <strncpy+0x4e>
    1c7e:	b7fd                	j	1c6c <strncpy+0x1d0>
    1c80:	40a007b3          	neg	a5,a0
    1c84:	8832                	mv	a6,a2
    1c86:	8b9d                	andi	a5,a5,7
    1c88:	4681                	li	a3,0
    1c8a:	e4060be3          	beqz	a2,1ae0 <strncpy+0x44>
    1c8e:	b7cd                	j	1c70 <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c90:	468d                	li	a3,3
    1c92:	bd75                	j	1b4e <strncpy+0xb2>
    1c94:	872a                	mv	a4,a0
    1c96:	4681                	li	a3,0
    1c98:	bd5d                	j	1b4e <strncpy+0xb2>
    1c9a:	4685                	li	a3,1
    1c9c:	bd4d                	j	1b4e <strncpy+0xb2>
    1c9e:	8082                	ret
    1ca0:	87aa                	mv	a5,a0
    1ca2:	4681                	li	a3,0
    1ca4:	b5f9                	j	1b72 <strncpy+0xd6>
    1ca6:	4689                	li	a3,2
    1ca8:	b55d                	j	1b4e <strncpy+0xb2>
    1caa:	4691                	li	a3,4
    1cac:	b54d                	j	1b4e <strncpy+0xb2>
    1cae:	4695                	li	a3,5
    1cb0:	bd79                	j	1b4e <strncpy+0xb2>
    1cb2:	4699                	li	a3,6
    1cb4:	bd69                	j	1b4e <strncpy+0xb2>
    1cb6:	8082                	ret
    1cb8:	8082                	ret
    1cba:	8082                	ret

0000000000001cbc <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1cbc:	87aa                	mv	a5,a0
    1cbe:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1cc0:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1cc4:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1cc8:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1cca:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ccc:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1cd0:	2501                	sext.w	a0,a0
    1cd2:	8082                	ret

0000000000001cd4 <openat>:
    register long a7 __asm__("a7") = n;
    1cd4:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1cd8:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cdc:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1ce0:	2501                	sext.w	a0,a0
    1ce2:	8082                	ret

0000000000001ce4 <fcntl>:
    register long a7 __asm__("a7") = n;
    1ce4:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ce6:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1cea:	2501                	sext.w	a0,a0
    1cec:	8082                	ret

0000000000001cee <close>:
    register long a7 __asm__("a7") = n;
    1cee:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1cf2:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1cf6:	2501                	sext.w	a0,a0
    1cf8:	8082                	ret

0000000000001cfa <read>:
    register long a7 __asm__("a7") = n;
    1cfa:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cfe:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d02:	8082                	ret

0000000000001d04 <write>:
    register long a7 __asm__("a7") = n;
    1d04:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d08:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d0c:	8082                	ret

0000000000001d0e <getpid>:
    register long a7 __asm__("a7") = n;
    1d0e:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d12:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d16:	2501                	sext.w	a0,a0
    1d18:	8082                	ret

0000000000001d1a <getppid>:
    register long a7 __asm__("a7") = n;
    1d1a:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d1e:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d22:	2501                	sext.w	a0,a0
    1d24:	8082                	ret

0000000000001d26 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d26:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d2a:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d2e:	2501                	sext.w	a0,a0
    1d30:	8082                	ret

0000000000001d32 <fork>:
    register long a7 __asm__("a7") = n;
    1d32:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d36:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d38:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d3a:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d3e:	2501                	sext.w	a0,a0
    1d40:	8082                	ret

0000000000001d42 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d42:	85b2                	mv	a1,a2
    1d44:	863a                	mv	a2,a4
    if (stack)
    1d46:	c191                	beqz	a1,1d4a <clone+0x8>
	stack += stack_size;
    1d48:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d4a:	4781                	li	a5,0
    1d4c:	4701                	li	a4,0
    1d4e:	4681                	li	a3,0
    1d50:	2601                	sext.w	a2,a2
    1d52:	a2ed                	j	1f3c <__clone>

0000000000001d54 <exit>:
    register long a7 __asm__("a7") = n;
    1d54:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d58:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d5c:	8082                	ret

0000000000001d5e <waitpid>:
    register long a7 __asm__("a7") = n;
    1d5e:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d62:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d64:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d68:	2501                	sext.w	a0,a0
    1d6a:	8082                	ret

0000000000001d6c <exec>:
    register long a7 __asm__("a7") = n;
    1d6c:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d70:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d74:	2501                	sext.w	a0,a0
    1d76:	8082                	ret

0000000000001d78 <execve>:
    register long a7 __asm__("a7") = n;
    1d78:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d7c:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d80:	2501                	sext.w	a0,a0
    1d82:	8082                	ret

0000000000001d84 <times>:
    register long a7 __asm__("a7") = n;
    1d84:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d88:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d8c:	2501                	sext.w	a0,a0
    1d8e:	8082                	ret

0000000000001d90 <get_time>:

int64 get_time()
{
    1d90:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d92:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d96:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d98:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d9a:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d9e:	2501                	sext.w	a0,a0
    1da0:	ed09                	bnez	a0,1dba <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1da2:	67a2                	ld	a5,8(sp)
    1da4:	3e800713          	li	a4,1000
    1da8:	00015503          	lhu	a0,0(sp)
    1dac:	02e7d7b3          	divu	a5,a5,a4
    1db0:	02e50533          	mul	a0,a0,a4
    1db4:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1db6:	0141                	addi	sp,sp,16
    1db8:	8082                	ret
        return -1;
    1dba:	557d                	li	a0,-1
    1dbc:	bfed                	j	1db6 <get_time+0x26>

0000000000001dbe <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1dbe:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc2:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1dc6:	2501                	sext.w	a0,a0
    1dc8:	8082                	ret

0000000000001dca <time>:
    register long a7 __asm__("a7") = n;
    1dca:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1dce:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1dd2:	2501                	sext.w	a0,a0
    1dd4:	8082                	ret

0000000000001dd6 <sleep>:

int sleep(unsigned long long time)
{
    1dd6:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1dd8:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1dda:	850a                	mv	a0,sp
    1ddc:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1dde:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1de2:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1de4:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1de8:	e501                	bnez	a0,1df0 <sleep+0x1a>
    return 0;
    1dea:	4501                	li	a0,0
}
    1dec:	0141                	addi	sp,sp,16
    1dee:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1df0:	4502                	lw	a0,0(sp)
}
    1df2:	0141                	addi	sp,sp,16
    1df4:	8082                	ret

0000000000001df6 <set_priority>:
    register long a7 __asm__("a7") = n;
    1df6:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1dfa:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1dfe:	2501                	sext.w	a0,a0
    1e00:	8082                	ret

0000000000001e02 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e02:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e06:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e0a:	8082                	ret

0000000000001e0c <munmap>:
    register long a7 __asm__("a7") = n;
    1e0c:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e10:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e14:	2501                	sext.w	a0,a0
    1e16:	8082                	ret

0000000000001e18 <wait>:

int wait(int *code)
{
    1e18:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e1a:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e1e:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e20:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e22:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e24:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <spawn>:
    register long a7 __asm__("a7") = n;
    1e2c:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e30:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <mailread>:
    register long a7 __asm__("a7") = n;
    1e38:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e3c:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e40:	2501                	sext.w	a0,a0
    1e42:	8082                	ret

0000000000001e44 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e44:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e48:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e4c:	2501                	sext.w	a0,a0
    1e4e:	8082                	ret

0000000000001e50 <fstat>:
    register long a7 __asm__("a7") = n;
    1e50:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e54:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e58:	2501                	sext.w	a0,a0
    1e5a:	8082                	ret

0000000000001e5c <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e5c:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e5e:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e62:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e64:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e68:	2501                	sext.w	a0,a0
    1e6a:	8082                	ret

0000000000001e6c <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e6c:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e6e:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e72:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e74:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e78:	2501                	sext.w	a0,a0
    1e7a:	8082                	ret

0000000000001e7c <link>:

int link(char *old_path, char *new_path)
{
    1e7c:	87aa                	mv	a5,a0
    1e7e:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e80:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e84:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e88:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e8a:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e8e:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e90:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e94:	2501                	sext.w	a0,a0
    1e96:	8082                	ret

0000000000001e98 <unlink>:

int unlink(char *path)
{
    1e98:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e9a:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e9e:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1ea2:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ea4:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1ea8:	2501                	sext.w	a0,a0
    1eaa:	8082                	ret

0000000000001eac <uname>:
    register long a7 __asm__("a7") = n;
    1eac:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1eb0:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1eb4:	2501                	sext.w	a0,a0
    1eb6:	8082                	ret

0000000000001eb8 <brk>:
    register long a7 __asm__("a7") = n;
    1eb8:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1ebc:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1ec0:	2501                	sext.w	a0,a0
    1ec2:	8082                	ret

0000000000001ec4 <getcwd>:
    register long a7 __asm__("a7") = n;
    1ec4:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec6:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1eca:	8082                	ret

0000000000001ecc <chdir>:
    register long a7 __asm__("a7") = n;
    1ecc:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1ed0:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1ed4:	2501                	sext.w	a0,a0
    1ed6:	8082                	ret

0000000000001ed8 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1ed8:	862e                	mv	a2,a1
    1eda:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1edc:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ede:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1ee2:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ee6:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1ee8:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eea:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1eee:	2501                	sext.w	a0,a0
    1ef0:	8082                	ret

0000000000001ef2 <getdents>:
    register long a7 __asm__("a7") = n;
    1ef2:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ef6:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1efa:	2501                	sext.w	a0,a0
    1efc:	8082                	ret

0000000000001efe <pipe>:
    register long a7 __asm__("a7") = n;
    1efe:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f02:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f04:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f08:	2501                	sext.w	a0,a0
    1f0a:	8082                	ret

0000000000001f0c <dup>:
    register long a7 __asm__("a7") = n;
    1f0c:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f0e:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f12:	2501                	sext.w	a0,a0
    1f14:	8082                	ret

0000000000001f16 <dup2>:
    register long a7 __asm__("a7") = n;
    1f16:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f18:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f1a:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f1e:	2501                	sext.w	a0,a0
    1f20:	8082                	ret

0000000000001f22 <mount>:
    register long a7 __asm__("a7") = n;
    1f22:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f26:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f2a:	2501                	sext.w	a0,a0
    1f2c:	8082                	ret

0000000000001f2e <umount>:
    register long a7 __asm__("a7") = n;
    1f2e:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f32:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f34:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f38:	2501                	sext.w	a0,a0
    1f3a:	8082                	ret

0000000000001f3c <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f3c:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1f3e:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f40:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f42:	8532                	mv	a0,a2
	mv a2, a4
    1f44:	863a                	mv	a2,a4
	mv a3, a5
    1f46:	86be                	mv	a3,a5
	mv a4, a6
    1f48:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f4a:	0dc00893          	li	a7,220
	ecall
    1f4e:	00000073          	ecall

	beqz a0, 1f
    1f52:	c111                	beqz	a0,1f56 <__clone+0x1a>
	# Parent
	ret
    1f54:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f56:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f58:	6522                	ld	a0,8(sp)
	jalr a1
    1f5a:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f5c:	05d00893          	li	a7,93
	ecall
    1f60:	00000073          	ecall
