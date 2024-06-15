
/root/oskernel2024-trustos/pre_ctests/build/riscv64/umount:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	aa39                	j	1120 <__start_main>

0000000000001004 <test_umount>:

static char mntpoint[64] = "./mnt";
static char device[64] = "/dev/vda2";
static const char *fs_type = "vfat";

void test_umount() {
    1004:	1101                	add	sp,sp,-32
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f6a50513          	add	a0,a0,-150 # 1f70 <__clone+0x2e>
void test_umount() {
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
	TEST_START(__func__);
    1012:	346000ef          	jal	1358 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	09250513          	add	a0,a0,146 # 20a8 <__func__.0>
    101e:	33a000ef          	jal	1358 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	f6650513          	add	a0,a0,-154 # 1f88 <__clone+0x46>
    102a:	32e000ef          	jal	1358 <puts>

	printf("Mounting dev:%s to %s\n", device, mntpoint);
    102e:	00001617          	auipc	a2,0x1
    1032:	ffa60613          	add	a2,a2,-6 # 2028 <mntpoint>
    1036:	00001597          	auipc	a1,0x1
    103a:	03258593          	add	a1,a1,50 # 2068 <device>
    103e:	00001517          	auipc	a0,0x1
    1042:	f5a50513          	add	a0,a0,-166 # 1f98 <__clone+0x56>
    1046:	334000ef          	jal	137a <printf>
	int ret = mount(device, mntpoint, fs_type, 0, NULL);
    104a:	00001597          	auipc	a1,0x1
    104e:	fde58593          	add	a1,a1,-34 # 2028 <mntpoint>
    1052:	4701                	li	a4,0
    1054:	4681                	li	a3,0
    1056:	00001617          	auipc	a2,0x1
    105a:	f5a60613          	add	a2,a2,-166 # 1fb0 <__clone+0x6e>
    105e:	00001517          	auipc	a0,0x1
    1062:	00a50513          	add	a0,a0,10 # 2068 <device>
    1066:	6c3000ef          	jal	1f28 <mount>
    106a:	842a                	mv	s0,a0
	printf("mount return: %d\n", ret);
    106c:	85aa                	mv	a1,a0
    106e:	00001517          	auipc	a0,0x1
    1072:	f4a50513          	add	a0,a0,-182 # 1fb8 <__clone+0x76>
    1076:	304000ef          	jal	137a <printf>

	if (ret == 0) {
    107a:	c40d                	beqz	s0,10a4 <test_umount+0xa0>
		ret = umount(mntpoint);
		assert(ret == 0);
		printf("umount success.\nreturn: %d\n", ret);
	}

	TEST_END(__func__);
    107c:	00001517          	auipc	a0,0x1
    1080:	f9450513          	add	a0,a0,-108 # 2010 <__clone+0xce>
    1084:	2d4000ef          	jal	1358 <puts>
    1088:	00001517          	auipc	a0,0x1
    108c:	02050513          	add	a0,a0,32 # 20a8 <__func__.0>
    1090:	2c8000ef          	jal	1358 <puts>
}
    1094:	6442                	ld	s0,16(sp)
    1096:	60e2                	ld	ra,24(sp)
	TEST_END(__func__);
    1098:	00001517          	auipc	a0,0x1
    109c:	ef050513          	add	a0,a0,-272 # 1f88 <__clone+0x46>
}
    10a0:	6105                	add	sp,sp,32
	TEST_END(__func__);
    10a2:	ac5d                	j	1358 <puts>
		ret = umount(mntpoint);
    10a4:	00001517          	auipc	a0,0x1
    10a8:	f8450513          	add	a0,a0,-124 # 2028 <mntpoint>
    10ac:	689000ef          	jal	1f34 <umount>
    10b0:	85aa                	mv	a1,a0
		assert(ret == 0);
    10b2:	e901                	bnez	a0,10c2 <test_umount+0xbe>
		printf("umount success.\nreturn: %d\n", ret);
    10b4:	00001517          	auipc	a0,0x1
    10b8:	f3c50513          	add	a0,a0,-196 # 1ff0 <__clone+0xae>
    10bc:	2be000ef          	jal	137a <printf>
    10c0:	bf75                	j	107c <test_umount+0x78>
    10c2:	e42a                	sd	a0,8(sp)
		assert(ret == 0);
    10c4:	00001517          	auipc	a0,0x1
    10c8:	f0c50513          	add	a0,a0,-244 # 1fd0 <__clone+0x8e>
    10cc:	52c000ef          	jal	15f8 <panic>
    10d0:	65a2                	ld	a1,8(sp)
    10d2:	b7cd                	j	10b4 <test_umount+0xb0>

00000000000010d4 <main>:

int main(int argc,char *argv[]) {
    10d4:	1101                	add	sp,sp,-32
    10d6:	ec06                	sd	ra,24(sp)
	if(argc >= 2){
    10d8:	4785                	li	a5,1
    10da:	00a7c863          	blt	a5,a0,10ea <main+0x16>

	if(argc >= 3){
		strcpy(mntpoint, argv[2]);
	}

	test_umount();
    10de:	f27ff0ef          	jal	1004 <test_umount>
	return 0;
}
    10e2:	60e2                	ld	ra,24(sp)
    10e4:	4501                	li	a0,0
    10e6:	6105                	add	sp,sp,32
    10e8:	8082                	ret
		strcpy(device, argv[1]);
    10ea:	e426                	sd	s1,8(sp)
    10ec:	84ae                	mv	s1,a1
    10ee:	658c                	ld	a1,8(a1)
    10f0:	e822                	sd	s0,16(sp)
    10f2:	842a                	mv	s0,a0
    10f4:	00001517          	auipc	a0,0x1
    10f8:	f7450513          	add	a0,a0,-140 # 2068 <device>
    10fc:	131000ef          	jal	1a2c <strcpy>
	if(argc >= 3){
    1100:	4789                	li	a5,2
    1102:	00f40c63          	beq	s0,a5,111a <main+0x46>
		strcpy(mntpoint, argv[2]);
    1106:	688c                	ld	a1,16(s1)
    1108:	00001517          	auipc	a0,0x1
    110c:	f2050513          	add	a0,a0,-224 # 2028 <mntpoint>
    1110:	11d000ef          	jal	1a2c <strcpy>
    1114:	6442                	ld	s0,16(sp)
    1116:	64a2                	ld	s1,8(sp)
    1118:	b7d9                	j	10de <main+0xa>
    111a:	6442                	ld	s0,16(sp)
    111c:	64a2                	ld	s1,8(sp)
    111e:	b7c1                	j	10de <main+0xa>

0000000000001120 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1120:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1122:	4108                	lw	a0,0(a0)
{
    1124:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    1126:	05a1                	add	a1,a1,8
{
    1128:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    112a:	fabff0ef          	jal	10d4 <main>
    112e:	42d000ef          	jal	1d5a <exit>
	return 0;
}
    1132:	60a2                	ld	ra,8(sp)
    1134:	4501                	li	a0,0
    1136:	0141                	add	sp,sp,16
    1138:	8082                	ret

000000000000113a <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    113a:	7179                	add	sp,sp,-48
    113c:	f406                	sd	ra,40(sp)
    113e:	0005081b          	sext.w	a6,a0
    1142:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1144:	00055563          	bgez	a0,114e <printint.constprop.0+0x14>
        x = -xx;
    1148:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    114c:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    114e:	02b8763b          	remuw	a2,a6,a1
    1152:	00001697          	auipc	a3,0x1
    1156:	f6668693          	add	a3,a3,-154 # 20b8 <digits>
    buf[16] = 0;
    115a:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    115e:	0005871b          	sext.w	a4,a1
    1162:	1602                	sll	a2,a2,0x20
    1164:	9201                	srl	a2,a2,0x20
    1166:	9636                	add	a2,a2,a3
    1168:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    116c:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    1170:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1174:	10b86c63          	bltu	a6,a1,128c <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    1178:	02e5763b          	remuw	a2,a0,a4
    117c:	1602                	sll	a2,a2,0x20
    117e:	9201                	srl	a2,a2,0x20
    1180:	9636                	add	a2,a2,a3
    1182:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1186:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    118a:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    118e:	10e56863          	bltu	a0,a4,129e <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    1192:	02e5f63b          	remuw	a2,a1,a4
    1196:	1602                	sll	a2,a2,0x20
    1198:	9201                	srl	a2,a2,0x20
    119a:	9636                	add	a2,a2,a3
    119c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a0:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11a4:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    11a8:	10e5e463          	bltu	a1,a4,12b0 <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    11ac:	02e5763b          	remuw	a2,a0,a4
    11b0:	1602                	sll	a2,a2,0x20
    11b2:	9201                	srl	a2,a2,0x20
    11b4:	9636                	add	a2,a2,a3
    11b6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ba:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11be:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    11c2:	10e56063          	bltu	a0,a4,12c2 <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    11c6:	02e5f63b          	remuw	a2,a1,a4
    11ca:	1602                	sll	a2,a2,0x20
    11cc:	9201                	srl	a2,a2,0x20
    11ce:	9636                	add	a2,a2,a3
    11d0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11d4:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11d8:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    11dc:	0ee5ec63          	bltu	a1,a4,12d4 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11e0:	02e5763b          	remuw	a2,a0,a4
    11e4:	1602                	sll	a2,a2,0x20
    11e6:	9201                	srl	a2,a2,0x20
    11e8:	9636                	add	a2,a2,a3
    11ea:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ee:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11f2:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11f6:	08e56263          	bltu	a0,a4,127a <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    11fa:	02e5f63b          	remuw	a2,a1,a4
    11fe:	1602                	sll	a2,a2,0x20
    1200:	9201                	srl	a2,a2,0x20
    1202:	9636                	add	a2,a2,a3
    1204:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1208:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    120c:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1210:	0ce5eb63          	bltu	a1,a4,12e6 <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    1214:	02e5763b          	remuw	a2,a0,a4
    1218:	1602                	sll	a2,a2,0x20
    121a:	9201                	srl	a2,a2,0x20
    121c:	9636                	add	a2,a2,a3
    121e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1222:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1226:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    122a:	0ce56763          	bltu	a0,a4,12f8 <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    122e:	02e5f63b          	remuw	a2,a1,a4
    1232:	1602                	sll	a2,a2,0x20
    1234:	9201                	srl	a2,a2,0x20
    1236:	9636                	add	a2,a2,a3
    1238:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    123c:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1240:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    1244:	0ce5e363          	bltu	a1,a4,130a <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    1248:	1782                	sll	a5,a5,0x20
    124a:	9381                	srl	a5,a5,0x20
    124c:	96be                	add	a3,a3,a5
    124e:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    1252:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    1254:	00f10723          	sb	a5,14(sp)
    if (sign)
    1258:	00088763          	beqz	a7,1266 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    125c:	02d00793          	li	a5,45
    1260:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1264:	4595                	li	a1,5
    write(f, s, l);
    1266:	003c                	add	a5,sp,8
    1268:	4641                	li	a2,16
    126a:	9e0d                	subw	a2,a2,a1
    126c:	4505                	li	a0,1
    126e:	95be                	add	a1,a1,a5
    1270:	29b000ef          	jal	1d0a <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1274:	70a2                	ld	ra,40(sp)
    1276:	6145                	add	sp,sp,48
    1278:	8082                	ret
    i++;
    127a:	45a9                	li	a1,10
    if (sign)
    127c:	fe0885e3          	beqz	a7,1266 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1280:	02d00793          	li	a5,45
    1284:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1288:	45a5                	li	a1,9
    128a:	bff1                	j	1266 <printint.constprop.0+0x12c>
    i++;
    128c:	45bd                	li	a1,15
    if (sign)
    128e:	fc088ce3          	beqz	a7,1266 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1292:	02d00793          	li	a5,45
    1296:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    129a:	45b9                	li	a1,14
    129c:	b7e9                	j	1266 <printint.constprop.0+0x12c>
    i++;
    129e:	45b9                	li	a1,14
    if (sign)
    12a0:	fc0883e3          	beqz	a7,1266 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12a4:	02d00793          	li	a5,45
    12a8:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    12ac:	45b5                	li	a1,13
    12ae:	bf65                	j	1266 <printint.constprop.0+0x12c>
    i++;
    12b0:	45b5                	li	a1,13
    if (sign)
    12b2:	fa088ae3          	beqz	a7,1266 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12b6:	02d00793          	li	a5,45
    12ba:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    12be:	45b1                	li	a1,12
    12c0:	b75d                	j	1266 <printint.constprop.0+0x12c>
    i++;
    12c2:	45b1                	li	a1,12
    if (sign)
    12c4:	fa0881e3          	beqz	a7,1266 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12c8:	02d00793          	li	a5,45
    12cc:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12d0:	45ad                	li	a1,11
    12d2:	bf51                	j	1266 <printint.constprop.0+0x12c>
    i++;
    12d4:	45ad                	li	a1,11
    if (sign)
    12d6:	f80888e3          	beqz	a7,1266 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12da:	02d00793          	li	a5,45
    12de:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12e2:	45a9                	li	a1,10
    12e4:	b749                	j	1266 <printint.constprop.0+0x12c>
    i++;
    12e6:	45a5                	li	a1,9
    if (sign)
    12e8:	f6088fe3          	beqz	a7,1266 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12ec:	02d00793          	li	a5,45
    12f0:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12f4:	45a1                	li	a1,8
    12f6:	bf85                	j	1266 <printint.constprop.0+0x12c>
    i++;
    12f8:	45a1                	li	a1,8
    if (sign)
    12fa:	f60886e3          	beqz	a7,1266 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12fe:	02d00793          	li	a5,45
    1302:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1306:	459d                	li	a1,7
    1308:	bfb9                	j	1266 <printint.constprop.0+0x12c>
    i++;
    130a:	459d                	li	a1,7
    if (sign)
    130c:	f4088de3          	beqz	a7,1266 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1310:	02d00793          	li	a5,45
    1314:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1318:	4599                	li	a1,6
    131a:	b7b1                	j	1266 <printint.constprop.0+0x12c>

000000000000131c <getchar>:
{
    131c:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    131e:	00f10593          	add	a1,sp,15
    1322:	4605                	li	a2,1
    1324:	4501                	li	a0,0
{
    1326:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1328:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    132c:	1d5000ef          	jal	1d00 <read>
}
    1330:	60e2                	ld	ra,24(sp)
    1332:	00f14503          	lbu	a0,15(sp)
    1336:	6105                	add	sp,sp,32
    1338:	8082                	ret

000000000000133a <putchar>:
{
    133a:	1101                	add	sp,sp,-32
    133c:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    133e:	00f10593          	add	a1,sp,15
    1342:	4605                	li	a2,1
    1344:	4505                	li	a0,1
{
    1346:	ec06                	sd	ra,24(sp)
    char byte = c;
    1348:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    134c:	1bf000ef          	jal	1d0a <write>
}
    1350:	60e2                	ld	ra,24(sp)
    1352:	2501                	sext.w	a0,a0
    1354:	6105                	add	sp,sp,32
    1356:	8082                	ret

0000000000001358 <puts>:
{
    1358:	1141                	add	sp,sp,-16
    135a:	e406                	sd	ra,8(sp)
    135c:	e022                	sd	s0,0(sp)
    135e:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1360:	56c000ef          	jal	18cc <strlen>
    1364:	862a                	mv	a2,a0
    1366:	85a2                	mv	a1,s0
    1368:	4505                	li	a0,1
    136a:	1a1000ef          	jal	1d0a <write>
}
    136e:	60a2                	ld	ra,8(sp)
    1370:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1372:	957d                	sra	a0,a0,0x3f
    return r;
    1374:	2501                	sext.w	a0,a0
}
    1376:	0141                	add	sp,sp,16
    1378:	8082                	ret

000000000000137a <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    137a:	7131                	add	sp,sp,-192
    137c:	e4d6                	sd	s5,72(sp)
    137e:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    1380:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1382:	013c                	add	a5,sp,136
{
    1384:	f0ca                	sd	s2,96(sp)
    1386:	ecce                	sd	s3,88(sp)
    1388:	e8d2                	sd	s4,80(sp)
    138a:	e0da                	sd	s6,64(sp)
    138c:	fc5e                	sd	s7,56(sp)
    138e:	fc86                	sd	ra,120(sp)
    1390:	f8a2                	sd	s0,112(sp)
    1392:	f4a6                	sd	s1,104(sp)
    1394:	e52e                	sd	a1,136(sp)
    1396:	e932                	sd	a2,144(sp)
    1398:	ed36                	sd	a3,152(sp)
    139a:	f13a                	sd	a4,160(sp)
    139c:	f942                	sd	a6,176(sp)
    139e:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    13a0:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    13a2:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    13a6:	07300a13          	li	s4,115
    13aa:	07800b93          	li	s7,120
    13ae:	06400b13          	li	s6,100
    buf[i++] = '0';
    13b2:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x5778>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13b6:	00001997          	auipc	s3,0x1
    13ba:	d0298993          	add	s3,s3,-766 # 20b8 <digits>
        if (!*s)
    13be:	00054783          	lbu	a5,0(a0)
    13c2:	16078863          	beqz	a5,1532 <printf+0x1b8>
    13c6:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13c8:	19278063          	beq	a5,s2,1548 <printf+0x1ce>
    13cc:	00164783          	lbu	a5,1(a2)
    13d0:	0605                	add	a2,a2,1
    13d2:	fbfd                	bnez	a5,13c8 <printf+0x4e>
    13d4:	84b2                	mv	s1,a2
        l = z - a;
    13d6:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13da:	85aa                	mv	a1,a0
    13dc:	8622                	mv	a2,s0
    13de:	4505                	li	a0,1
    13e0:	12b000ef          	jal	1d0a <write>
        if (l)
    13e4:	18041763          	bnez	s0,1572 <printf+0x1f8>
        if (s[1] == 0)
    13e8:	0014c783          	lbu	a5,1(s1)
    13ec:	14078363          	beqz	a5,1532 <printf+0x1b8>
        switch (s[1])
    13f0:	19478f63          	beq	a5,s4,158e <printf+0x214>
    13f4:	18fa6163          	bltu	s4,a5,1576 <printf+0x1fc>
    13f8:	1b678e63          	beq	a5,s6,15b4 <printf+0x23a>
    13fc:	07000713          	li	a4,112
    1400:	1ce79463          	bne	a5,a4,15c8 <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1404:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1406:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    140a:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    140c:	631c                	ld	a5,0(a4)
    140e:	0721                	add	a4,a4,8
    1410:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1412:	00479293          	sll	t0,a5,0x4
    1416:	00879f93          	sll	t6,a5,0x8
    141a:	00c79f13          	sll	t5,a5,0xc
    141e:	01079e93          	sll	t4,a5,0x10
    1422:	01479e13          	sll	t3,a5,0x14
    1426:	01879313          	sll	t1,a5,0x18
    142a:	01c79893          	sll	a7,a5,0x1c
    142e:	02479813          	sll	a6,a5,0x24
    1432:	02879513          	sll	a0,a5,0x28
    1436:	02c79593          	sll	a1,a5,0x2c
    143a:	03079693          	sll	a3,a5,0x30
    143e:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1442:	03c7d413          	srl	s0,a5,0x3c
    1446:	01c7d39b          	srlw	t2,a5,0x1c
    144a:	03c2d293          	srl	t0,t0,0x3c
    144e:	03cfdf93          	srl	t6,t6,0x3c
    1452:	03cf5f13          	srl	t5,t5,0x3c
    1456:	03cede93          	srl	t4,t4,0x3c
    145a:	03ce5e13          	srl	t3,t3,0x3c
    145e:	03c35313          	srl	t1,t1,0x3c
    1462:	03c8d893          	srl	a7,a7,0x3c
    1466:	03c85813          	srl	a6,a6,0x3c
    146a:	9171                	srl	a0,a0,0x3c
    146c:	91f1                	srl	a1,a1,0x3c
    146e:	92f1                	srl	a3,a3,0x3c
    1470:	9371                	srl	a4,a4,0x3c
    1472:	974e                	add	a4,a4,s3
    1474:	944e                	add	s0,s0,s3
    1476:	92ce                	add	t0,t0,s3
    1478:	9fce                	add	t6,t6,s3
    147a:	9f4e                	add	t5,t5,s3
    147c:	9ece                	add	t4,t4,s3
    147e:	9e4e                	add	t3,t3,s3
    1480:	934e                	add	t1,t1,s3
    1482:	98ce                	add	a7,a7,s3
    1484:	93ce                	add	t2,t2,s3
    1486:	984e                	add	a6,a6,s3
    1488:	954e                	add	a0,a0,s3
    148a:	95ce                	add	a1,a1,s3
    148c:	96ce                	add	a3,a3,s3
    148e:	00074083          	lbu	ra,0(a4)
    1492:	0002c283          	lbu	t0,0(t0)
    1496:	000fcf83          	lbu	t6,0(t6)
    149a:	000f4f03          	lbu	t5,0(t5)
    149e:	000ece83          	lbu	t4,0(t4)
    14a2:	000e4e03          	lbu	t3,0(t3)
    14a6:	00034303          	lbu	t1,0(t1)
    14aa:	0008c883          	lbu	a7,0(a7)
    14ae:	0003c383          	lbu	t2,0(t2)
    14b2:	00084803          	lbu	a6,0(a6)
    14b6:	00054503          	lbu	a0,0(a0)
    14ba:	0005c583          	lbu	a1,0(a1)
    14be:	0006c683          	lbu	a3,0(a3)
    14c2:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14c6:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14ca:	9371                	srl	a4,a4,0x3c
    14cc:	8bbd                	and	a5,a5,15
    14ce:	974e                	add	a4,a4,s3
    14d0:	97ce                	add	a5,a5,s3
    14d2:	005105a3          	sb	t0,11(sp)
    14d6:	01f10623          	sb	t6,12(sp)
    14da:	01e106a3          	sb	t5,13(sp)
    14de:	01d10723          	sb	t4,14(sp)
    14e2:	01c107a3          	sb	t3,15(sp)
    14e6:	00610823          	sb	t1,16(sp)
    14ea:	011108a3          	sb	a7,17(sp)
    14ee:	00710923          	sb	t2,18(sp)
    14f2:	010109a3          	sb	a6,19(sp)
    14f6:	00a10a23          	sb	a0,20(sp)
    14fa:	00b10aa3          	sb	a1,21(sp)
    14fe:	00d10b23          	sb	a3,22(sp)
    1502:	00110ba3          	sb	ra,23(sp)
    1506:	00810523          	sb	s0,10(sp)
    150a:	00074703          	lbu	a4,0(a4)
    150e:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1512:	002c                	add	a1,sp,8
    1514:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1516:	00e10c23          	sb	a4,24(sp)
    151a:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    151e:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1522:	7e8000ef          	jal	1d0a <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1526:	00248513          	add	a0,s1,2
        if (!*s)
    152a:	00054783          	lbu	a5,0(a0)
    152e:	e8079ce3          	bnez	a5,13c6 <printf+0x4c>
    }
    va_end(ap);
}
    1532:	70e6                	ld	ra,120(sp)
    1534:	7446                	ld	s0,112(sp)
    1536:	74a6                	ld	s1,104(sp)
    1538:	7906                	ld	s2,96(sp)
    153a:	69e6                	ld	s3,88(sp)
    153c:	6a46                	ld	s4,80(sp)
    153e:	6aa6                	ld	s5,72(sp)
    1540:	6b06                	ld	s6,64(sp)
    1542:	7be2                	ld	s7,56(sp)
    1544:	6129                	add	sp,sp,192
    1546:	8082                	ret
    1548:	84b2                	mv	s1,a2
    154a:	a039                	j	1558 <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    154c:	0024c783          	lbu	a5,2(s1)
    1550:	0605                	add	a2,a2,1
    1552:	0489                	add	s1,s1,2
    1554:	e92791e3          	bne	a5,s2,13d6 <printf+0x5c>
    1558:	0014c783          	lbu	a5,1(s1)
    155c:	ff2788e3          	beq	a5,s2,154c <printf+0x1d2>
        l = z - a;
    1560:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1564:	85aa                	mv	a1,a0
    1566:	8622                	mv	a2,s0
    1568:	4505                	li	a0,1
    156a:	7a0000ef          	jal	1d0a <write>
        if (l)
    156e:	e6040de3          	beqz	s0,13e8 <printf+0x6e>
    1572:	8526                	mv	a0,s1
    1574:	b5a9                	j	13be <printf+0x44>
        switch (s[1])
    1576:	05779963          	bne	a5,s7,15c8 <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    157a:	6782                	ld	a5,0(sp)
    157c:	45c1                	li	a1,16
    157e:	4388                	lw	a0,0(a5)
    1580:	07a1                	add	a5,a5,8
    1582:	e03e                	sd	a5,0(sp)
    1584:	bb7ff0ef          	jal	113a <printint.constprop.0>
        s += 2;
    1588:	00248513          	add	a0,s1,2
    158c:	bf79                	j	152a <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    158e:	6782                	ld	a5,0(sp)
    1590:	6380                	ld	s0,0(a5)
    1592:	07a1                	add	a5,a5,8
    1594:	e03e                	sd	a5,0(sp)
    1596:	cc21                	beqz	s0,15ee <printf+0x274>
            l = strnlen(a, 200);
    1598:	0c800593          	li	a1,200
    159c:	8522                	mv	a0,s0
    159e:	460000ef          	jal	19fe <strnlen>
    write(f, s, l);
    15a2:	0005061b          	sext.w	a2,a0
    15a6:	85a2                	mv	a1,s0
    15a8:	4505                	li	a0,1
    15aa:	760000ef          	jal	1d0a <write>
        s += 2;
    15ae:	00248513          	add	a0,s1,2
    15b2:	bfa5                	j	152a <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    15b4:	6782                	ld	a5,0(sp)
    15b6:	45a9                	li	a1,10
    15b8:	4388                	lw	a0,0(a5)
    15ba:	07a1                	add	a5,a5,8
    15bc:	e03e                	sd	a5,0(sp)
    15be:	b7dff0ef          	jal	113a <printint.constprop.0>
        s += 2;
    15c2:	00248513          	add	a0,s1,2
    15c6:	b795                	j	152a <printf+0x1b0>
    return write(stdout, &byte, 1);
    15c8:	4605                	li	a2,1
    15ca:	002c                	add	a1,sp,8
    15cc:	4505                	li	a0,1
    char byte = c;
    15ce:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15d2:	738000ef          	jal	1d0a <write>
    char byte = c;
    15d6:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15da:	4605                	li	a2,1
    15dc:	002c                	add	a1,sp,8
    15de:	4505                	li	a0,1
    char byte = c;
    15e0:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15e4:	726000ef          	jal	1d0a <write>
        s += 2;
    15e8:	00248513          	add	a0,s1,2
    15ec:	bf3d                	j	152a <printf+0x1b0>
                a = "(null)";
    15ee:	00001417          	auipc	s0,0x1
    15f2:	a3240413          	add	s0,s0,-1486 # 2020 <__clone+0xde>
    15f6:	b74d                	j	1598 <printf+0x21e>

00000000000015f8 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15f8:	1141                	add	sp,sp,-16
    15fa:	e406                	sd	ra,8(sp)
    puts(m);
    15fc:	d5dff0ef          	jal	1358 <puts>
    exit(-100);
}
    1600:	60a2                	ld	ra,8(sp)
    exit(-100);
    1602:	f9c00513          	li	a0,-100
}
    1606:	0141                	add	sp,sp,16
    exit(-100);
    1608:	af89                	j	1d5a <exit>

000000000000160a <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    160a:	02000793          	li	a5,32
    160e:	00f50663          	beq	a0,a5,161a <isspace+0x10>
    1612:	355d                	addw	a0,a0,-9
    1614:	00553513          	sltiu	a0,a0,5
    1618:	8082                	ret
    161a:	4505                	li	a0,1
}
    161c:	8082                	ret

000000000000161e <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    161e:	fd05051b          	addw	a0,a0,-48
}
    1622:	00a53513          	sltiu	a0,a0,10
    1626:	8082                	ret

0000000000001628 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1628:	02000713          	li	a4,32
    162c:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    162e:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1632:	ff76879b          	addw	a5,a3,-9
    1636:	06e68063          	beq	a3,a4,1696 <atoi+0x6e>
    163a:	0006859b          	sext.w	a1,a3
    163e:	04f67c63          	bgeu	a2,a5,1696 <atoi+0x6e>
        s++;
    switch (*s)
    1642:	02b00793          	li	a5,43
    1646:	06f68563          	beq	a3,a5,16b0 <atoi+0x88>
    164a:	02d00793          	li	a5,45
    164e:	04f69663          	bne	a3,a5,169a <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1652:	00154683          	lbu	a3,1(a0)
    1656:	47a5                	li	a5,9
        s++;
    1658:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    165c:	fd06869b          	addw	a3,a3,-48
    1660:	8636                	mv	a2,a3
    while (isdigit(*s))
    1662:	04d7e563          	bltu	a5,a3,16ac <atoi+0x84>
        neg = 1;
    1666:	4885                	li	a7,1
    int n = 0, neg = 0;
    1668:	4501                	li	a0,0
    while (isdigit(*s))
    166a:	4825                	li	a6,9
    166c:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1670:	0025179b          	sllw	a5,a0,0x2
    1674:	9fa9                	addw	a5,a5,a0
    1676:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    167a:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    167e:	85b2                	mv	a1,a2
    1680:	40c7853b          	subw	a0,a5,a2
    1684:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    1686:	8636                	mv	a2,a3
    while (isdigit(*s))
    1688:	fed872e3          	bgeu	a6,a3,166c <atoi+0x44>
    return neg ? n : -n;
    168c:	02089163          	bnez	a7,16ae <atoi+0x86>
    1690:	40f5853b          	subw	a0,a1,a5
    1694:	8082                	ret
        s++;
    1696:	0505                	add	a0,a0,1
    1698:	bf59                	j	162e <atoi+0x6>
    while (isdigit(*s))
    169a:	fd05859b          	addw	a1,a1,-48
    169e:	47a5                	li	a5,9
    16a0:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    16a2:	4881                	li	a7,0
    16a4:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    16a8:	fcb7f0e3          	bgeu	a5,a1,1668 <atoi+0x40>
    return neg ? n : -n;
    16ac:	4501                	li	a0,0
}
    16ae:	8082                	ret
    while (isdigit(*s))
    16b0:	00154683          	lbu	a3,1(a0)
    16b4:	47a5                	li	a5,9
        s++;
    16b6:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    16ba:	fd06869b          	addw	a3,a3,-48
    16be:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    16c0:	4881                	li	a7,0
    while (isdigit(*s))
    16c2:	fad7f3e3          	bgeu	a5,a3,1668 <atoi+0x40>
    return neg ? n : -n;
    16c6:	4501                	li	a0,0
    16c8:	8082                	ret

00000000000016ca <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16ca:	16060f63          	beqz	a2,1848 <memset+0x17e>
    16ce:	40a006b3          	neg	a3,a0
    16d2:	0076f793          	and	a5,a3,7
    16d6:	00778813          	add	a6,a5,7
    16da:	48ad                	li	a7,11
    16dc:	0ff5f713          	zext.b	a4,a1
    16e0:	fff60593          	add	a1,a2,-1
    16e4:	17186363          	bltu	a6,a7,184a <memset+0x180>
    16e8:	1705eb63          	bltu	a1,a6,185e <memset+0x194>
    16ec:	16078163          	beqz	a5,184e <memset+0x184>
    16f0:	00e50023          	sb	a4,0(a0)
    16f4:	0066f593          	and	a1,a3,6
    16f8:	14058e63          	beqz	a1,1854 <memset+0x18a>
    16fc:	00e500a3          	sb	a4,1(a0)
    1700:	4589                	li	a1,2
    1702:	00250813          	add	a6,a0,2
    1706:	04f5f663          	bgeu	a1,a5,1752 <memset+0x88>
    170a:	00e50123          	sb	a4,2(a0)
    170e:	8a91                	and	a3,a3,4
    1710:	00350813          	add	a6,a0,3
    1714:	458d                	li	a1,3
    1716:	ce95                	beqz	a3,1752 <memset+0x88>
    1718:	00e501a3          	sb	a4,3(a0)
    171c:	4691                	li	a3,4
    171e:	00450813          	add	a6,a0,4
    1722:	4591                	li	a1,4
    1724:	02f6f763          	bgeu	a3,a5,1752 <memset+0x88>
    1728:	00e50223          	sb	a4,4(a0)
    172c:	4695                	li	a3,5
    172e:	00550813          	add	a6,a0,5
    1732:	4595                	li	a1,5
    1734:	00d78f63          	beq	a5,a3,1752 <memset+0x88>
    1738:	00e502a3          	sb	a4,5(a0)
    173c:	469d                	li	a3,7
    173e:	00650813          	add	a6,a0,6
    1742:	4599                	li	a1,6
    1744:	00d79763          	bne	a5,a3,1752 <memset+0x88>
    1748:	00750813          	add	a6,a0,7
    174c:	00e50323          	sb	a4,6(a0)
    1750:	459d                	li	a1,7
    1752:	00871693          	sll	a3,a4,0x8
    1756:	01071313          	sll	t1,a4,0x10
    175a:	8ed9                	or	a3,a3,a4
    175c:	01871893          	sll	a7,a4,0x18
    1760:	0066e6b3          	or	a3,a3,t1
    1764:	0116e6b3          	or	a3,a3,a7
    1768:	02071313          	sll	t1,a4,0x20
    176c:	02871893          	sll	a7,a4,0x28
    1770:	0066e6b3          	or	a3,a3,t1
    1774:	40f60e33          	sub	t3,a2,a5
    1778:	03071313          	sll	t1,a4,0x30
    177c:	0116e6b3          	or	a3,a3,a7
    1780:	0066e6b3          	or	a3,a3,t1
    1784:	03871893          	sll	a7,a4,0x38
    1788:	97aa                	add	a5,a5,a0
    178a:	ff8e7313          	and	t1,t3,-8
    178e:	0116e6b3          	or	a3,a3,a7
    1792:	00f308b3          	add	a7,t1,a5
    1796:	e394                	sd	a3,0(a5)
    1798:	07a1                	add	a5,a5,8
    179a:	ff179ee3          	bne	a5,a7,1796 <memset+0xcc>
    179e:	006806b3          	add	a3,a6,t1
    17a2:	00b307bb          	addw	a5,t1,a1
    17a6:	0bc30b63          	beq	t1,t3,185c <memset+0x192>
    17aa:	00e68023          	sb	a4,0(a3)
    17ae:	0017859b          	addw	a1,a5,1
    17b2:	08c5fb63          	bgeu	a1,a2,1848 <memset+0x17e>
    17b6:	00e680a3          	sb	a4,1(a3)
    17ba:	0027859b          	addw	a1,a5,2
    17be:	08c5f563          	bgeu	a1,a2,1848 <memset+0x17e>
    17c2:	00e68123          	sb	a4,2(a3)
    17c6:	0037859b          	addw	a1,a5,3
    17ca:	06c5ff63          	bgeu	a1,a2,1848 <memset+0x17e>
    17ce:	00e681a3          	sb	a4,3(a3)
    17d2:	0047859b          	addw	a1,a5,4
    17d6:	06c5f963          	bgeu	a1,a2,1848 <memset+0x17e>
    17da:	00e68223          	sb	a4,4(a3)
    17de:	0057859b          	addw	a1,a5,5
    17e2:	06c5f363          	bgeu	a1,a2,1848 <memset+0x17e>
    17e6:	00e682a3          	sb	a4,5(a3)
    17ea:	0067859b          	addw	a1,a5,6
    17ee:	04c5fd63          	bgeu	a1,a2,1848 <memset+0x17e>
    17f2:	00e68323          	sb	a4,6(a3)
    17f6:	0077859b          	addw	a1,a5,7
    17fa:	04c5f763          	bgeu	a1,a2,1848 <memset+0x17e>
    17fe:	00e683a3          	sb	a4,7(a3)
    1802:	0087859b          	addw	a1,a5,8
    1806:	04c5f163          	bgeu	a1,a2,1848 <memset+0x17e>
    180a:	00e68423          	sb	a4,8(a3)
    180e:	0097859b          	addw	a1,a5,9
    1812:	02c5fb63          	bgeu	a1,a2,1848 <memset+0x17e>
    1816:	00e684a3          	sb	a4,9(a3)
    181a:	00a7859b          	addw	a1,a5,10
    181e:	02c5f563          	bgeu	a1,a2,1848 <memset+0x17e>
    1822:	00e68523          	sb	a4,10(a3)
    1826:	00b7859b          	addw	a1,a5,11
    182a:	00c5ff63          	bgeu	a1,a2,1848 <memset+0x17e>
    182e:	00e685a3          	sb	a4,11(a3)
    1832:	00c7859b          	addw	a1,a5,12
    1836:	00c5f963          	bgeu	a1,a2,1848 <memset+0x17e>
    183a:	00e68623          	sb	a4,12(a3)
    183e:	27b5                	addw	a5,a5,13
    1840:	00c7f463          	bgeu	a5,a2,1848 <memset+0x17e>
    1844:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    1848:	8082                	ret
    184a:	482d                	li	a6,11
    184c:	bd71                	j	16e8 <memset+0x1e>
    char *p = dest;
    184e:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1850:	4581                	li	a1,0
    1852:	b701                	j	1752 <memset+0x88>
    1854:	00150813          	add	a6,a0,1
    1858:	4585                	li	a1,1
    185a:	bde5                	j	1752 <memset+0x88>
    185c:	8082                	ret
    char *p = dest;
    185e:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1860:	4781                	li	a5,0
    1862:	b7a1                	j	17aa <memset+0xe0>

0000000000001864 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1864:	00054783          	lbu	a5,0(a0)
    1868:	0005c703          	lbu	a4,0(a1)
    186c:	00e79863          	bne	a5,a4,187c <strcmp+0x18>
    1870:	0505                	add	a0,a0,1
    1872:	0585                	add	a1,a1,1
    1874:	fbe5                	bnez	a5,1864 <strcmp>
    1876:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1878:	9d19                	subw	a0,a0,a4
    187a:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    187c:	0007851b          	sext.w	a0,a5
    1880:	bfe5                	j	1878 <strcmp+0x14>

0000000000001882 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1882:	ca15                	beqz	a2,18b6 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1884:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1888:	167d                	add	a2,a2,-1
    188a:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    188e:	eb99                	bnez	a5,18a4 <strncmp+0x22>
    1890:	a815                	j	18c4 <strncmp+0x42>
    1892:	00a68e63          	beq	a3,a0,18ae <strncmp+0x2c>
    1896:	0505                	add	a0,a0,1
    1898:	00f71b63          	bne	a4,a5,18ae <strncmp+0x2c>
    189c:	00054783          	lbu	a5,0(a0)
    18a0:	cf89                	beqz	a5,18ba <strncmp+0x38>
    18a2:	85b2                	mv	a1,a2
    18a4:	0005c703          	lbu	a4,0(a1)
    18a8:	00158613          	add	a2,a1,1
    18ac:	f37d                	bnez	a4,1892 <strncmp+0x10>
        ;
    return *l - *r;
    18ae:	0007851b          	sext.w	a0,a5
    18b2:	9d19                	subw	a0,a0,a4
    18b4:	8082                	ret
        return 0;
    18b6:	4501                	li	a0,0
}
    18b8:	8082                	ret
    return *l - *r;
    18ba:	0015c703          	lbu	a4,1(a1)
    18be:	4501                	li	a0,0
    18c0:	9d19                	subw	a0,a0,a4
    18c2:	8082                	ret
    18c4:	0005c703          	lbu	a4,0(a1)
    18c8:	4501                	li	a0,0
    18ca:	b7e5                	j	18b2 <strncmp+0x30>

00000000000018cc <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18cc:	00757793          	and	a5,a0,7
    18d0:	cf89                	beqz	a5,18ea <strlen+0x1e>
    18d2:	87aa                	mv	a5,a0
    18d4:	a029                	j	18de <strlen+0x12>
    18d6:	0785                	add	a5,a5,1
    18d8:	0077f713          	and	a4,a5,7
    18dc:	cb01                	beqz	a4,18ec <strlen+0x20>
        if (!*s)
    18de:	0007c703          	lbu	a4,0(a5)
    18e2:	fb75                	bnez	a4,18d6 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18e4:	40a78533          	sub	a0,a5,a0
}
    18e8:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18ea:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18ec:	feff05b7          	lui	a1,0xfeff0
    18f0:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefede47>
    18f4:	f0101637          	lui	a2,0xf0101
    18f8:	05c2                	sll	a1,a1,0x10
    18fa:	0612                	sll	a2,a2,0x4
    18fc:	6394                	ld	a3,0(a5)
    18fe:	eff58593          	add	a1,a1,-257
    1902:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff049>
    1906:	05c2                	sll	a1,a1,0x10
    1908:	0642                	sll	a2,a2,0x10
    190a:	eff58593          	add	a1,a1,-257
    190e:	10160613          	add	a2,a2,257
    1912:	00b68733          	add	a4,a3,a1
    1916:	063e                	sll	a2,a2,0xf
    1918:	fff6c693          	not	a3,a3
    191c:	8f75                	and	a4,a4,a3
    191e:	08060613          	add	a2,a2,128
    1922:	8f71                	and	a4,a4,a2
    1924:	eb11                	bnez	a4,1938 <strlen+0x6c>
    1926:	6794                	ld	a3,8(a5)
    1928:	07a1                	add	a5,a5,8
    192a:	00b68733          	add	a4,a3,a1
    192e:	fff6c693          	not	a3,a3
    1932:	8f75                	and	a4,a4,a3
    1934:	8f71                	and	a4,a4,a2
    1936:	db65                	beqz	a4,1926 <strlen+0x5a>
    for (; *s; s++)
    1938:	0007c703          	lbu	a4,0(a5)
    193c:	d745                	beqz	a4,18e4 <strlen+0x18>
    193e:	0017c703          	lbu	a4,1(a5)
    1942:	0785                	add	a5,a5,1
    1944:	d345                	beqz	a4,18e4 <strlen+0x18>
    1946:	0017c703          	lbu	a4,1(a5)
    194a:	0785                	add	a5,a5,1
    194c:	fb6d                	bnez	a4,193e <strlen+0x72>
    194e:	bf59                	j	18e4 <strlen+0x18>

0000000000001950 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1950:	00757713          	and	a4,a0,7
{
    1954:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1956:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    195a:	cb19                	beqz	a4,1970 <memchr+0x20>
    195c:	ce59                	beqz	a2,19fa <memchr+0xaa>
    195e:	0007c703          	lbu	a4,0(a5)
    1962:	00b70963          	beq	a4,a1,1974 <memchr+0x24>
    1966:	0785                	add	a5,a5,1
    1968:	0077f713          	and	a4,a5,7
    196c:	167d                	add	a2,a2,-1
    196e:	f77d                	bnez	a4,195c <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1970:	4501                	li	a0,0
    if (n && *s != c)
    1972:	c649                	beqz	a2,19fc <memchr+0xac>
    1974:	0007c703          	lbu	a4,0(a5)
    1978:	06b70663          	beq	a4,a1,19e4 <memchr+0x94>
        size_t k = ONES * c;
    197c:	01010737          	lui	a4,0x1010
    1980:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e049>
    1984:	0742                	sll	a4,a4,0x10
    1986:	10170713          	add	a4,a4,257
    198a:	0742                	sll	a4,a4,0x10
    198c:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1990:	469d                	li	a3,7
        size_t k = ONES * c;
    1992:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1996:	04c6f763          	bgeu	a3,a2,19e4 <memchr+0x94>
    199a:	f0101837          	lui	a6,0xf0101
    199e:	feff08b7          	lui	a7,0xfeff0
    19a2:	0812                	sll	a6,a6,0x4
    19a4:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefede47>
    19a8:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff049>
    19ac:	08c2                	sll	a7,a7,0x10
    19ae:	0842                	sll	a6,a6,0x10
    19b0:	eff88893          	add	a7,a7,-257
    19b4:	10180813          	add	a6,a6,257
    19b8:	08c2                	sll	a7,a7,0x10
    19ba:	083e                	sll	a6,a6,0xf
    19bc:	eff88893          	add	a7,a7,-257
    19c0:	08080813          	add	a6,a6,128
    19c4:	431d                	li	t1,7
    19c6:	a029                	j	19d0 <memchr+0x80>
    19c8:	1661                	add	a2,a2,-8
    19ca:	07a1                	add	a5,a5,8
    19cc:	02c37663          	bgeu	t1,a2,19f8 <memchr+0xa8>
    19d0:	6398                	ld	a4,0(a5)
    19d2:	8f29                	xor	a4,a4,a0
    19d4:	011706b3          	add	a3,a4,a7
    19d8:	fff74713          	not	a4,a4
    19dc:	8f75                	and	a4,a4,a3
    19de:	01077733          	and	a4,a4,a6
    19e2:	d37d                	beqz	a4,19c8 <memchr+0x78>
        s = (const void *)w;
    19e4:	853e                	mv	a0,a5
    19e6:	a019                	j	19ec <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    19e8:	0505                	add	a0,a0,1
    19ea:	ca01                	beqz	a2,19fa <memchr+0xaa>
    19ec:	00054783          	lbu	a5,0(a0)
    19f0:	167d                	add	a2,a2,-1
    19f2:	feb79be3          	bne	a5,a1,19e8 <memchr+0x98>
    19f6:	8082                	ret
    19f8:	f675                	bnez	a2,19e4 <memchr+0x94>
    return n ? (void *)s : 0;
    19fa:	4501                	li	a0,0
}
    19fc:	8082                	ret

00000000000019fe <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19fe:	1101                	add	sp,sp,-32
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
    1a0e:	f43ff0ef          	jal	1950 <memchr>
    return p ? p - s : n;
    1a12:	c519                	beqz	a0,1a20 <strnlen+0x22>
}
    1a14:	60e2                	ld	ra,24(sp)
    1a16:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1a18:	8d05                	sub	a0,a0,s1
}
    1a1a:	64a2                	ld	s1,8(sp)
    1a1c:	6105                	add	sp,sp,32
    1a1e:	8082                	ret
    1a20:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1a22:	8522                	mv	a0,s0
}
    1a24:	6442                	ld	s0,16(sp)
    1a26:	64a2                	ld	s1,8(sp)
    1a28:	6105                	add	sp,sp,32
    1a2a:	8082                	ret

0000000000001a2c <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a2c:	00b547b3          	xor	a5,a0,a1
    1a30:	8b9d                	and	a5,a5,7
    1a32:	efb1                	bnez	a5,1a8e <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a34:	0075f793          	and	a5,a1,7
    1a38:	ebb5                	bnez	a5,1aac <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a3a:	feff0637          	lui	a2,0xfeff0
    1a3e:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefede47>
    1a42:	f01016b7          	lui	a3,0xf0101
    1a46:	0642                	sll	a2,a2,0x10
    1a48:	0692                	sll	a3,a3,0x4
    1a4a:	6198                	ld	a4,0(a1)
    1a4c:	eff60613          	add	a2,a2,-257
    1a50:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff049>
    1a54:	0642                	sll	a2,a2,0x10
    1a56:	06c2                	sll	a3,a3,0x10
    1a58:	eff60613          	add	a2,a2,-257
    1a5c:	10168693          	add	a3,a3,257
    1a60:	00c707b3          	add	a5,a4,a2
    1a64:	fff74813          	not	a6,a4
    1a68:	06be                	sll	a3,a3,0xf
    1a6a:	0107f7b3          	and	a5,a5,a6
    1a6e:	08068693          	add	a3,a3,128
    1a72:	8ff5                	and	a5,a5,a3
    1a74:	ef89                	bnez	a5,1a8e <strcpy+0x62>
    1a76:	05a1                	add	a1,a1,8
    1a78:	e118                	sd	a4,0(a0)
    1a7a:	6198                	ld	a4,0(a1)
    1a7c:	0521                	add	a0,a0,8
    1a7e:	00c707b3          	add	a5,a4,a2
    1a82:	fff74813          	not	a6,a4
    1a86:	0107f7b3          	and	a5,a5,a6
    1a8a:	8ff5                	and	a5,a5,a3
    1a8c:	d7ed                	beqz	a5,1a76 <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a8e:	0005c783          	lbu	a5,0(a1)
    1a92:	00f50023          	sb	a5,0(a0)
    1a96:	c785                	beqz	a5,1abe <strcpy+0x92>
    1a98:	0015c783          	lbu	a5,1(a1)
    1a9c:	0505                	add	a0,a0,1
    1a9e:	0585                	add	a1,a1,1
    1aa0:	00f50023          	sb	a5,0(a0)
    1aa4:	fbf5                	bnez	a5,1a98 <strcpy+0x6c>
        ;
    return d;
}
    1aa6:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1aa8:	0505                	add	a0,a0,1
    1aaa:	db41                	beqz	a4,1a3a <strcpy+0xe>
            if (!(*d = *s))
    1aac:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1ab0:	0585                	add	a1,a1,1
    1ab2:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1ab6:	00f50023          	sb	a5,0(a0)
    1aba:	f7fd                	bnez	a5,1aa8 <strcpy+0x7c>
}
    1abc:	8082                	ret
    1abe:	8082                	ret

0000000000001ac0 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1ac0:	00b547b3          	xor	a5,a0,a1
    1ac4:	8b9d                	and	a5,a5,7
    1ac6:	efbd                	bnez	a5,1b44 <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1ac8:	0075f793          	and	a5,a1,7
    1acc:	1c078563          	beqz	a5,1c96 <strncpy+0x1d6>
    1ad0:	ea11                	bnez	a2,1ae4 <strncpy+0x24>
    1ad2:	8082                	ret
    1ad4:	0585                	add	a1,a1,1
    1ad6:	0075f793          	and	a5,a1,7
    1ada:	167d                	add	a2,a2,-1
    1adc:	0505                	add	a0,a0,1
    1ade:	1a078c63          	beqz	a5,1c96 <strncpy+0x1d6>
    1ae2:	ca3d                	beqz	a2,1b58 <strncpy+0x98>
    1ae4:	0005c783          	lbu	a5,0(a1)
    1ae8:	00f50023          	sb	a5,0(a0)
    1aec:	f7e5                	bnez	a5,1ad4 <strncpy+0x14>
            ;
        if (!n || !*s)
    1aee:	0005c783          	lbu	a5,0(a1)
    1af2:	c7a5                	beqz	a5,1b5a <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1af4:	479d                	li	a5,7
    1af6:	04c7f863          	bgeu	a5,a2,1b46 <strncpy+0x86>
    1afa:	f01016b7          	lui	a3,0xf0101
    1afe:	feff0837          	lui	a6,0xfeff0
    1b02:	0692                	sll	a3,a3,0x4
    1b04:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefede47>
    1b08:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff049>
    1b0c:	0842                	sll	a6,a6,0x10
    1b0e:	06c2                	sll	a3,a3,0x10
    1b10:	eff80813          	add	a6,a6,-257
    1b14:	10168693          	add	a3,a3,257
    1b18:	0842                	sll	a6,a6,0x10
    1b1a:	06be                	sll	a3,a3,0xf
    1b1c:	eff80813          	add	a6,a6,-257
    1b20:	08068693          	add	a3,a3,128
    1b24:	431d                	li	t1,7
    1b26:	6198                	ld	a4,0(a1)
    1b28:	010707b3          	add	a5,a4,a6
    1b2c:	fff74893          	not	a7,a4
    1b30:	0117f7b3          	and	a5,a5,a7
    1b34:	8ff5                	and	a5,a5,a3
    1b36:	eb81                	bnez	a5,1b46 <strncpy+0x86>
            *wd = *ws;
    1b38:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b3a:	1661                	add	a2,a2,-8
    1b3c:	05a1                	add	a1,a1,8
    1b3e:	0521                	add	a0,a0,8
    1b40:	fec363e3          	bltu	t1,a2,1b26 <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b44:	ca11                	beqz	a2,1b58 <strncpy+0x98>
    1b46:	0005c783          	lbu	a5,0(a1)
    1b4a:	0585                	add	a1,a1,1
    1b4c:	00f50023          	sb	a5,0(a0)
    1b50:	c789                	beqz	a5,1b5a <strncpy+0x9a>
    1b52:	167d                	add	a2,a2,-1
    1b54:	0505                	add	a0,a0,1
    1b56:	fa65                	bnez	a2,1b46 <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b58:	8082                	ret
    1b5a:	40a00733          	neg	a4,a0
    1b5e:	00777793          	and	a5,a4,7
    1b62:	00778693          	add	a3,a5,7
    1b66:	482d                	li	a6,11
    1b68:	fff60593          	add	a1,a2,-1
    1b6c:	1106ef63          	bltu	a3,a6,1c8a <strncpy+0x1ca>
    1b70:	12d5ee63          	bltu	a1,a3,1cac <strncpy+0x1ec>
    1b74:	12078563          	beqz	a5,1c9e <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b78:	00050023          	sb	zero,0(a0)
    1b7c:	00677693          	and	a3,a4,6
    1b80:	12068263          	beqz	a3,1ca4 <strncpy+0x1e4>
    1b84:	000500a3          	sb	zero,1(a0)
    1b88:	4689                	li	a3,2
    1b8a:	12f6f463          	bgeu	a3,a5,1cb2 <strncpy+0x1f2>
    1b8e:	00050123          	sb	zero,2(a0)
    1b92:	8b11                	and	a4,a4,4
    1b94:	cf6d                	beqz	a4,1c8e <strncpy+0x1ce>
    1b96:	000501a3          	sb	zero,3(a0)
    1b9a:	4711                	li	a4,4
    1b9c:	00450693          	add	a3,a0,4
    1ba0:	02f77363          	bgeu	a4,a5,1bc6 <strncpy+0x106>
    1ba4:	00050223          	sb	zero,4(a0)
    1ba8:	4715                	li	a4,5
    1baa:	00550693          	add	a3,a0,5
    1bae:	00e78c63          	beq	a5,a4,1bc6 <strncpy+0x106>
    1bb2:	000502a3          	sb	zero,5(a0)
    1bb6:	471d                	li	a4,7
    1bb8:	10e79163          	bne	a5,a4,1cba <strncpy+0x1fa>
    1bbc:	00750693          	add	a3,a0,7
    1bc0:	00050323          	sb	zero,6(a0)
    1bc4:	471d                	li	a4,7
    1bc6:	40f608b3          	sub	a7,a2,a5
    1bca:	ff88f813          	and	a6,a7,-8
    1bce:	97aa                	add	a5,a5,a0
    1bd0:	010785b3          	add	a1,a5,a6
    1bd4:	0007b023          	sd	zero,0(a5)
    1bd8:	07a1                	add	a5,a5,8
    1bda:	feb79de3          	bne	a5,a1,1bd4 <strncpy+0x114>
    1bde:	00e807bb          	addw	a5,a6,a4
    1be2:	01068733          	add	a4,a3,a6
    1be6:	0b088b63          	beq	a7,a6,1c9c <strncpy+0x1dc>
    1bea:	00070023          	sb	zero,0(a4)
    1bee:	0017869b          	addw	a3,a5,1
    1bf2:	f6c6f3e3          	bgeu	a3,a2,1b58 <strncpy+0x98>
    1bf6:	000700a3          	sb	zero,1(a4)
    1bfa:	0027869b          	addw	a3,a5,2
    1bfe:	f4c6fde3          	bgeu	a3,a2,1b58 <strncpy+0x98>
    1c02:	00070123          	sb	zero,2(a4)
    1c06:	0037869b          	addw	a3,a5,3
    1c0a:	f4c6f7e3          	bgeu	a3,a2,1b58 <strncpy+0x98>
    1c0e:	000701a3          	sb	zero,3(a4)
    1c12:	0047869b          	addw	a3,a5,4
    1c16:	f4c6f1e3          	bgeu	a3,a2,1b58 <strncpy+0x98>
    1c1a:	00070223          	sb	zero,4(a4)
    1c1e:	0057869b          	addw	a3,a5,5
    1c22:	f2c6fbe3          	bgeu	a3,a2,1b58 <strncpy+0x98>
    1c26:	000702a3          	sb	zero,5(a4)
    1c2a:	0067869b          	addw	a3,a5,6
    1c2e:	f2c6f5e3          	bgeu	a3,a2,1b58 <strncpy+0x98>
    1c32:	00070323          	sb	zero,6(a4)
    1c36:	0077869b          	addw	a3,a5,7
    1c3a:	f0c6ffe3          	bgeu	a3,a2,1b58 <strncpy+0x98>
    1c3e:	000703a3          	sb	zero,7(a4)
    1c42:	0087869b          	addw	a3,a5,8
    1c46:	f0c6f9e3          	bgeu	a3,a2,1b58 <strncpy+0x98>
    1c4a:	00070423          	sb	zero,8(a4)
    1c4e:	0097869b          	addw	a3,a5,9
    1c52:	f0c6f3e3          	bgeu	a3,a2,1b58 <strncpy+0x98>
    1c56:	000704a3          	sb	zero,9(a4)
    1c5a:	00a7869b          	addw	a3,a5,10
    1c5e:	eec6fde3          	bgeu	a3,a2,1b58 <strncpy+0x98>
    1c62:	00070523          	sb	zero,10(a4)
    1c66:	00b7869b          	addw	a3,a5,11
    1c6a:	eec6f7e3          	bgeu	a3,a2,1b58 <strncpy+0x98>
    1c6e:	000705a3          	sb	zero,11(a4)
    1c72:	00c7869b          	addw	a3,a5,12
    1c76:	eec6f1e3          	bgeu	a3,a2,1b58 <strncpy+0x98>
    1c7a:	00070623          	sb	zero,12(a4)
    1c7e:	27b5                	addw	a5,a5,13
    1c80:	ecc7fce3          	bgeu	a5,a2,1b58 <strncpy+0x98>
    1c84:	000706a3          	sb	zero,13(a4)
}
    1c88:	8082                	ret
    1c8a:	46ad                	li	a3,11
    1c8c:	b5d5                	j	1b70 <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c8e:	00350693          	add	a3,a0,3
    1c92:	470d                	li	a4,3
    1c94:	bf0d                	j	1bc6 <strncpy+0x106>
        if (!n || !*s)
    1c96:	e4061ce3          	bnez	a2,1aee <strncpy+0x2e>
}
    1c9a:	8082                	ret
    1c9c:	8082                	ret
    char *p = dest;
    1c9e:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ca0:	4701                	li	a4,0
    1ca2:	b715                	j	1bc6 <strncpy+0x106>
    1ca4:	00150693          	add	a3,a0,1
    1ca8:	4705                	li	a4,1
    1caa:	bf31                	j	1bc6 <strncpy+0x106>
    char *p = dest;
    1cac:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cae:	4781                	li	a5,0
    1cb0:	bf2d                	j	1bea <strncpy+0x12a>
    1cb2:	00250693          	add	a3,a0,2
    1cb6:	4709                	li	a4,2
    1cb8:	b739                	j	1bc6 <strncpy+0x106>
    1cba:	00650693          	add	a3,a0,6
    1cbe:	4719                	li	a4,6
    1cc0:	b719                	j	1bc6 <strncpy+0x106>

0000000000001cc2 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1cc2:	87aa                	mv	a5,a0
    1cc4:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1cc6:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1cca:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1cce:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1cd0:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cd2:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1cd6:	2501                	sext.w	a0,a0
    1cd8:	8082                	ret

0000000000001cda <openat>:
    register long a7 __asm__("a7") = n;
    1cda:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1cde:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ce2:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1ce6:	2501                	sext.w	a0,a0
    1ce8:	8082                	ret

0000000000001cea <fcntl>:
    register long a7 __asm__("a7") = n;
    1cea:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cec:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1cf0:	2501                	sext.w	a0,a0
    1cf2:	8082                	ret

0000000000001cf4 <close>:
    register long a7 __asm__("a7") = n;
    1cf4:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1cf8:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1cfc:	2501                	sext.w	a0,a0
    1cfe:	8082                	ret

0000000000001d00 <read>:
    register long a7 __asm__("a7") = n;
    1d00:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d04:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d08:	8082                	ret

0000000000001d0a <write>:
    register long a7 __asm__("a7") = n;
    1d0a:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d0e:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d12:	8082                	ret

0000000000001d14 <getpid>:
    register long a7 __asm__("a7") = n;
    1d14:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d18:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d1c:	2501                	sext.w	a0,a0
    1d1e:	8082                	ret

0000000000001d20 <getppid>:
    register long a7 __asm__("a7") = n;
    1d20:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d24:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d28:	2501                	sext.w	a0,a0
    1d2a:	8082                	ret

0000000000001d2c <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d2c:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d30:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d34:	2501                	sext.w	a0,a0
    1d36:	8082                	ret

0000000000001d38 <fork>:
    register long a7 __asm__("a7") = n;
    1d38:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d3c:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d3e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d40:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d44:	2501                	sext.w	a0,a0
    1d46:	8082                	ret

0000000000001d48 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d48:	85b2                	mv	a1,a2
    1d4a:	863a                	mv	a2,a4
    if (stack)
    1d4c:	c191                	beqz	a1,1d50 <clone+0x8>
	stack += stack_size;
    1d4e:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d50:	4781                	li	a5,0
    1d52:	4701                	li	a4,0
    1d54:	4681                	li	a3,0
    1d56:	2601                	sext.w	a2,a2
    1d58:	a2ed                	j	1f42 <__clone>

0000000000001d5a <exit>:
    register long a7 __asm__("a7") = n;
    1d5a:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d5e:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d62:	8082                	ret

0000000000001d64 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d64:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d68:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d6a:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d6e:	2501                	sext.w	a0,a0
    1d70:	8082                	ret

0000000000001d72 <exec>:
    register long a7 __asm__("a7") = n;
    1d72:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d76:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d7a:	2501                	sext.w	a0,a0
    1d7c:	8082                	ret

0000000000001d7e <execve>:
    register long a7 __asm__("a7") = n;
    1d7e:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d82:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d86:	2501                	sext.w	a0,a0
    1d88:	8082                	ret

0000000000001d8a <times>:
    register long a7 __asm__("a7") = n;
    1d8a:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d8e:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d92:	2501                	sext.w	a0,a0
    1d94:	8082                	ret

0000000000001d96 <get_time>:

int64 get_time()
{
    1d96:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d98:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d9c:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d9e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1da0:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1da4:	2501                	sext.w	a0,a0
    1da6:	ed09                	bnez	a0,1dc0 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1da8:	67a2                	ld	a5,8(sp)
    1daa:	3e800713          	li	a4,1000
    1dae:	00015503          	lhu	a0,0(sp)
    1db2:	02e7d7b3          	divu	a5,a5,a4
    1db6:	02e50533          	mul	a0,a0,a4
    1dba:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1dbc:	0141                	add	sp,sp,16
    1dbe:	8082                	ret
        return -1;
    1dc0:	557d                	li	a0,-1
    1dc2:	bfed                	j	1dbc <get_time+0x26>

0000000000001dc4 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1dc4:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc8:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1dcc:	2501                	sext.w	a0,a0
    1dce:	8082                	ret

0000000000001dd0 <time>:
    register long a7 __asm__("a7") = n;
    1dd0:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1dd4:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1dd8:	2501                	sext.w	a0,a0
    1dda:	8082                	ret

0000000000001ddc <sleep>:

int sleep(unsigned long long time)
{
    1ddc:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1dde:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1de0:	850a                	mv	a0,sp
    1de2:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1de4:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1de8:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dea:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1dee:	e501                	bnez	a0,1df6 <sleep+0x1a>
    return 0;
    1df0:	4501                	li	a0,0
}
    1df2:	0141                	add	sp,sp,16
    1df4:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1df6:	4502                	lw	a0,0(sp)
}
    1df8:	0141                	add	sp,sp,16
    1dfa:	8082                	ret

0000000000001dfc <set_priority>:
    register long a7 __asm__("a7") = n;
    1dfc:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e00:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e04:	2501                	sext.w	a0,a0
    1e06:	8082                	ret

0000000000001e08 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e08:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e0c:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e10:	8082                	ret

0000000000001e12 <munmap>:
    register long a7 __asm__("a7") = n;
    1e12:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e16:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e1a:	2501                	sext.w	a0,a0
    1e1c:	8082                	ret

0000000000001e1e <wait>:

int wait(int *code)
{
    1e1e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e20:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e24:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e26:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e28:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e2a:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e2e:	2501                	sext.w	a0,a0
    1e30:	8082                	ret

0000000000001e32 <spawn>:
    register long a7 __asm__("a7") = n;
    1e32:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e36:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e3a:	2501                	sext.w	a0,a0
    1e3c:	8082                	ret

0000000000001e3e <mailread>:
    register long a7 __asm__("a7") = n;
    1e3e:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e42:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e46:	2501                	sext.w	a0,a0
    1e48:	8082                	ret

0000000000001e4a <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e4a:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e4e:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e52:	2501                	sext.w	a0,a0
    1e54:	8082                	ret

0000000000001e56 <fstat>:
    register long a7 __asm__("a7") = n;
    1e56:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5a:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e5e:	2501                	sext.w	a0,a0
    1e60:	8082                	ret

0000000000001e62 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e62:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e64:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e68:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e6a:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e6e:	2501                	sext.w	a0,a0
    1e70:	8082                	ret

0000000000001e72 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e72:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e74:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e78:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e7a:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e7e:	2501                	sext.w	a0,a0
    1e80:	8082                	ret

0000000000001e82 <link>:

int link(char *old_path, char *new_path)
{
    1e82:	87aa                	mv	a5,a0
    1e84:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e86:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e8a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e8e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e90:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e94:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e96:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e9a:	2501                	sext.w	a0,a0
    1e9c:	8082                	ret

0000000000001e9e <unlink>:

int unlink(char *path)
{
    1e9e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1ea0:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1ea4:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1ea8:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eaa:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1eae:	2501                	sext.w	a0,a0
    1eb0:	8082                	ret

0000000000001eb2 <uname>:
    register long a7 __asm__("a7") = n;
    1eb2:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1eb6:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1eba:	2501                	sext.w	a0,a0
    1ebc:	8082                	ret

0000000000001ebe <brk>:
    register long a7 __asm__("a7") = n;
    1ebe:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1ec2:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1ec6:	2501                	sext.w	a0,a0
    1ec8:	8082                	ret

0000000000001eca <getcwd>:
    register long a7 __asm__("a7") = n;
    1eca:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ecc:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1ed0:	8082                	ret

0000000000001ed2 <chdir>:
    register long a7 __asm__("a7") = n;
    1ed2:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1ed6:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1eda:	2501                	sext.w	a0,a0
    1edc:	8082                	ret

0000000000001ede <mkdir>:

int mkdir(const char *path, mode_t mode){
    1ede:	862e                	mv	a2,a1
    1ee0:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1ee2:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ee4:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1ee8:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1eec:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1eee:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ef0:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1ef4:	2501                	sext.w	a0,a0
    1ef6:	8082                	ret

0000000000001ef8 <getdents>:
    register long a7 __asm__("a7") = n;
    1ef8:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1efc:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f00:	2501                	sext.w	a0,a0
    1f02:	8082                	ret

0000000000001f04 <pipe>:
    register long a7 __asm__("a7") = n;
    1f04:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f08:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f0a:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f0e:	2501                	sext.w	a0,a0
    1f10:	8082                	ret

0000000000001f12 <dup>:
    register long a7 __asm__("a7") = n;
    1f12:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f14:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f18:	2501                	sext.w	a0,a0
    1f1a:	8082                	ret

0000000000001f1c <dup2>:
    register long a7 __asm__("a7") = n;
    1f1c:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f1e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f20:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f24:	2501                	sext.w	a0,a0
    1f26:	8082                	ret

0000000000001f28 <mount>:
    register long a7 __asm__("a7") = n;
    1f28:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f2c:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f30:	2501                	sext.w	a0,a0
    1f32:	8082                	ret

0000000000001f34 <umount>:
    register long a7 __asm__("a7") = n;
    1f34:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f38:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f3a:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f3e:	2501                	sext.w	a0,a0
    1f40:	8082                	ret

0000000000001f42 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f42:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1f44:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f46:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f48:	8532                	mv	a0,a2
	mv a2, a4
    1f4a:	863a                	mv	a2,a4
	mv a3, a5
    1f4c:	86be                	mv	a3,a5
	mv a4, a6
    1f4e:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f50:	0dc00893          	li	a7,220
	ecall
    1f54:	00000073          	ecall

	beqz a0, 1f
    1f58:	c111                	beqz	a0,1f5c <__clone+0x1a>
	# Parent
	ret
    1f5a:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f5c:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f5e:	6522                	ld	a0,8(sp)
	jalr a1
    1f60:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f62:	05d00893          	li	a7,93
	ecall
    1f66:	00000073          	ecall
