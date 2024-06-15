
/root/oskernel2024-trustos/pre_ctests/build/riscv64/mount:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a20d                	j	1124 <__start_main>

0000000000001004 <test_mount>:

static char mntpoint[64] = "./mnt";
static char device[64] = "/dev/vda2";
static const char *fs_type = "vfat";

void test_mount() {
    1004:	1141                	add	sp,sp,-16
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f6a50513          	add	a0,a0,-150 # 1f70 <__clone+0x2a>
void test_mount() {
    100e:	e406                	sd	ra,8(sp)
    1010:	e022                	sd	s0,0(sp)
	TEST_START(__func__);
    1012:	34a000ef          	jal	135c <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	0a250513          	add	a0,a0,162 # 20b8 <__func__.0>
    101e:	33e000ef          	jal	135c <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	f6650513          	add	a0,a0,-154 # 1f88 <__clone+0x42>
    102a:	332000ef          	jal	135c <puts>

	printf("Mounting dev:%s to %s\n", device, mntpoint);
    102e:	00001617          	auipc	a2,0x1
    1032:	00a60613          	add	a2,a2,10 # 2038 <mntpoint>
    1036:	00001597          	auipc	a1,0x1
    103a:	04258593          	add	a1,a1,66 # 2078 <device>
    103e:	00001517          	auipc	a0,0x1
    1042:	f5a50513          	add	a0,a0,-166 # 1f98 <__clone+0x52>
    1046:	338000ef          	jal	137e <printf>
	int ret = mount(device, mntpoint, fs_type, 0, NULL);
    104a:	00001597          	auipc	a1,0x1
    104e:	fee58593          	add	a1,a1,-18 # 2038 <mntpoint>
    1052:	4701                	li	a4,0
    1054:	4681                	li	a3,0
    1056:	00001617          	auipc	a2,0x1
    105a:	f5a60613          	add	a2,a2,-166 # 1fb0 <__clone+0x6a>
    105e:	00001517          	auipc	a0,0x1
    1062:	01a50513          	add	a0,a0,26 # 2078 <device>
    1066:	6c7000ef          	jal	1f2c <mount>
    106a:	842a                	mv	s0,a0
	printf("mount return: %d\n", ret);
    106c:	85aa                	mv	a1,a0
    106e:	00001517          	auipc	a0,0x1
    1072:	f4a50513          	add	a0,a0,-182 # 1fb8 <__clone+0x72>
    1076:	308000ef          	jal	137e <printf>
	assert(ret == 0);
    107a:	e821                	bnez	s0,10ca <test_mount+0xc6>

	if (ret == 0) {
		printf("mount successfully\n");
    107c:	00001517          	auipc	a0,0x1
    1080:	f5450513          	add	a0,a0,-172 # 1fd0 <__clone+0x8a>
    1084:	2fa000ef          	jal	137e <printf>
		ret = umount(mntpoint);
    1088:	00001517          	auipc	a0,0x1
    108c:	fb050513          	add	a0,a0,-80 # 2038 <mntpoint>
    1090:	6a9000ef          	jal	1f38 <umount>
    1094:	85aa                	mv	a1,a0
		printf("umount return: %d\n", ret);
    1096:	00001517          	auipc	a0,0x1
    109a:	f5250513          	add	a0,a0,-174 # 1fe8 <__clone+0xa2>
    109e:	2e0000ef          	jal	137e <printf>
	}

	TEST_END(__func__);
    10a2:	00001517          	auipc	a0,0x1
    10a6:	f7e50513          	add	a0,a0,-130 # 2020 <__clone+0xda>
    10aa:	2b2000ef          	jal	135c <puts>
    10ae:	00001517          	auipc	a0,0x1
    10b2:	00a50513          	add	a0,a0,10 # 20b8 <__func__.0>
    10b6:	2a6000ef          	jal	135c <puts>
}
    10ba:	6402                	ld	s0,0(sp)
    10bc:	60a2                	ld	ra,8(sp)
	TEST_END(__func__);
    10be:	00001517          	auipc	a0,0x1
    10c2:	eca50513          	add	a0,a0,-310 # 1f88 <__clone+0x42>
}
    10c6:	0141                	add	sp,sp,16
	TEST_END(__func__);
    10c8:	ac51                	j	135c <puts>
	assert(ret == 0);
    10ca:	00001517          	auipc	a0,0x1
    10ce:	f3650513          	add	a0,a0,-202 # 2000 <__clone+0xba>
    10d2:	52a000ef          	jal	15fc <panic>
	if (ret == 0) {
    10d6:	b7f1                	j	10a2 <test_mount+0x9e>

00000000000010d8 <main>:

int main(int argc,char *argv[]) {
    10d8:	1101                	add	sp,sp,-32
    10da:	ec06                	sd	ra,24(sp)
	if(argc >= 2){
    10dc:	4785                	li	a5,1
    10de:	00a7c863          	blt	a5,a0,10ee <main+0x16>

	if(argc >= 3){
		strcpy(mntpoint, argv[2]);
	}

	test_mount();
    10e2:	f23ff0ef          	jal	1004 <test_mount>
	return 0;
}
    10e6:	60e2                	ld	ra,24(sp)
    10e8:	4501                	li	a0,0
    10ea:	6105                	add	sp,sp,32
    10ec:	8082                	ret
		strcpy(device, argv[1]);
    10ee:	e426                	sd	s1,8(sp)
    10f0:	84ae                	mv	s1,a1
    10f2:	658c                	ld	a1,8(a1)
    10f4:	e822                	sd	s0,16(sp)
    10f6:	842a                	mv	s0,a0
    10f8:	00001517          	auipc	a0,0x1
    10fc:	f8050513          	add	a0,a0,-128 # 2078 <device>
    1100:	131000ef          	jal	1a30 <strcpy>
	if(argc >= 3){
    1104:	4789                	li	a5,2
    1106:	00f40c63          	beq	s0,a5,111e <main+0x46>
		strcpy(mntpoint, argv[2]);
    110a:	688c                	ld	a1,16(s1)
    110c:	00001517          	auipc	a0,0x1
    1110:	f2c50513          	add	a0,a0,-212 # 2038 <mntpoint>
    1114:	11d000ef          	jal	1a30 <strcpy>
    1118:	6442                	ld	s0,16(sp)
    111a:	64a2                	ld	s1,8(sp)
    111c:	b7d9                	j	10e2 <main+0xa>
    111e:	6442                	ld	s0,16(sp)
    1120:	64a2                	ld	s1,8(sp)
    1122:	b7c1                	j	10e2 <main+0xa>

0000000000001124 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1124:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1126:	4108                	lw	a0,0(a0)
{
    1128:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    112a:	05a1                	add	a1,a1,8
{
    112c:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    112e:	fabff0ef          	jal	10d8 <main>
    1132:	42d000ef          	jal	1d5e <exit>
	return 0;
}
    1136:	60a2                	ld	ra,8(sp)
    1138:	4501                	li	a0,0
    113a:	0141                	add	sp,sp,16
    113c:	8082                	ret

000000000000113e <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    113e:	7179                	add	sp,sp,-48
    1140:	f406                	sd	ra,40(sp)
    1142:	0005081b          	sext.w	a6,a0
    1146:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1148:	00055563          	bgez	a0,1152 <printint.constprop.0+0x14>
        x = -xx;
    114c:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    1150:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1152:	02b8763b          	remuw	a2,a6,a1
    1156:	00001697          	auipc	a3,0x1
    115a:	f7268693          	add	a3,a3,-142 # 20c8 <digits>
    buf[16] = 0;
    115e:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1162:	0005871b          	sext.w	a4,a1
    1166:	1602                	sll	a2,a2,0x20
    1168:	9201                	srl	a2,a2,0x20
    116a:	9636                	add	a2,a2,a3
    116c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1170:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    1174:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1178:	10b86c63          	bltu	a6,a1,1290 <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    117c:	02e5763b          	remuw	a2,a0,a4
    1180:	1602                	sll	a2,a2,0x20
    1182:	9201                	srl	a2,a2,0x20
    1184:	9636                	add	a2,a2,a3
    1186:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    118a:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    118e:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1192:	10e56863          	bltu	a0,a4,12a2 <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    1196:	02e5f63b          	remuw	a2,a1,a4
    119a:	1602                	sll	a2,a2,0x20
    119c:	9201                	srl	a2,a2,0x20
    119e:	9636                	add	a2,a2,a3
    11a0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a4:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11a8:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    11ac:	10e5e463          	bltu	a1,a4,12b4 <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    11b0:	02e5763b          	remuw	a2,a0,a4
    11b4:	1602                	sll	a2,a2,0x20
    11b6:	9201                	srl	a2,a2,0x20
    11b8:	9636                	add	a2,a2,a3
    11ba:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11be:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11c2:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    11c6:	10e56063          	bltu	a0,a4,12c6 <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    11ca:	02e5f63b          	remuw	a2,a1,a4
    11ce:	1602                	sll	a2,a2,0x20
    11d0:	9201                	srl	a2,a2,0x20
    11d2:	9636                	add	a2,a2,a3
    11d4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11d8:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11dc:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    11e0:	0ee5ec63          	bltu	a1,a4,12d8 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11e4:	02e5763b          	remuw	a2,a0,a4
    11e8:	1602                	sll	a2,a2,0x20
    11ea:	9201                	srl	a2,a2,0x20
    11ec:	9636                	add	a2,a2,a3
    11ee:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11f2:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11f6:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11fa:	08e56263          	bltu	a0,a4,127e <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    11fe:	02e5f63b          	remuw	a2,a1,a4
    1202:	1602                	sll	a2,a2,0x20
    1204:	9201                	srl	a2,a2,0x20
    1206:	9636                	add	a2,a2,a3
    1208:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    120c:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1210:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1214:	0ce5eb63          	bltu	a1,a4,12ea <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    1218:	02e5763b          	remuw	a2,a0,a4
    121c:	1602                	sll	a2,a2,0x20
    121e:	9201                	srl	a2,a2,0x20
    1220:	9636                	add	a2,a2,a3
    1222:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1226:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    122a:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    122e:	0ce56763          	bltu	a0,a4,12fc <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    1232:	02e5f63b          	remuw	a2,a1,a4
    1236:	1602                	sll	a2,a2,0x20
    1238:	9201                	srl	a2,a2,0x20
    123a:	9636                	add	a2,a2,a3
    123c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1240:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1244:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    1248:	0ce5e363          	bltu	a1,a4,130e <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    124c:	1782                	sll	a5,a5,0x20
    124e:	9381                	srl	a5,a5,0x20
    1250:	96be                	add	a3,a3,a5
    1252:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    1256:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    1258:	00f10723          	sb	a5,14(sp)
    if (sign)
    125c:	00088763          	beqz	a7,126a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1260:	02d00793          	li	a5,45
    1264:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1268:	4595                	li	a1,5
    write(f, s, l);
    126a:	003c                	add	a5,sp,8
    126c:	4641                	li	a2,16
    126e:	9e0d                	subw	a2,a2,a1
    1270:	4505                	li	a0,1
    1272:	95be                	add	a1,a1,a5
    1274:	29b000ef          	jal	1d0e <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1278:	70a2                	ld	ra,40(sp)
    127a:	6145                	add	sp,sp,48
    127c:	8082                	ret
    i++;
    127e:	45a9                	li	a1,10
    if (sign)
    1280:	fe0885e3          	beqz	a7,126a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1284:	02d00793          	li	a5,45
    1288:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    128c:	45a5                	li	a1,9
    128e:	bff1                	j	126a <printint.constprop.0+0x12c>
    i++;
    1290:	45bd                	li	a1,15
    if (sign)
    1292:	fc088ce3          	beqz	a7,126a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1296:	02d00793          	li	a5,45
    129a:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    129e:	45b9                	li	a1,14
    12a0:	b7e9                	j	126a <printint.constprop.0+0x12c>
    i++;
    12a2:	45b9                	li	a1,14
    if (sign)
    12a4:	fc0883e3          	beqz	a7,126a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12a8:	02d00793          	li	a5,45
    12ac:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    12b0:	45b5                	li	a1,13
    12b2:	bf65                	j	126a <printint.constprop.0+0x12c>
    i++;
    12b4:	45b5                	li	a1,13
    if (sign)
    12b6:	fa088ae3          	beqz	a7,126a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12ba:	02d00793          	li	a5,45
    12be:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    12c2:	45b1                	li	a1,12
    12c4:	b75d                	j	126a <printint.constprop.0+0x12c>
    i++;
    12c6:	45b1                	li	a1,12
    if (sign)
    12c8:	fa0881e3          	beqz	a7,126a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12cc:	02d00793          	li	a5,45
    12d0:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12d4:	45ad                	li	a1,11
    12d6:	bf51                	j	126a <printint.constprop.0+0x12c>
    i++;
    12d8:	45ad                	li	a1,11
    if (sign)
    12da:	f80888e3          	beqz	a7,126a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12de:	02d00793          	li	a5,45
    12e2:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12e6:	45a9                	li	a1,10
    12e8:	b749                	j	126a <printint.constprop.0+0x12c>
    i++;
    12ea:	45a5                	li	a1,9
    if (sign)
    12ec:	f6088fe3          	beqz	a7,126a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12f0:	02d00793          	li	a5,45
    12f4:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12f8:	45a1                	li	a1,8
    12fa:	bf85                	j	126a <printint.constprop.0+0x12c>
    i++;
    12fc:	45a1                	li	a1,8
    if (sign)
    12fe:	f60886e3          	beqz	a7,126a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1302:	02d00793          	li	a5,45
    1306:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    130a:	459d                	li	a1,7
    130c:	bfb9                	j	126a <printint.constprop.0+0x12c>
    i++;
    130e:	459d                	li	a1,7
    if (sign)
    1310:	f4088de3          	beqz	a7,126a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1314:	02d00793          	li	a5,45
    1318:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    131c:	4599                	li	a1,6
    131e:	b7b1                	j	126a <printint.constprop.0+0x12c>

0000000000001320 <getchar>:
{
    1320:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    1322:	00f10593          	add	a1,sp,15
    1326:	4605                	li	a2,1
    1328:	4501                	li	a0,0
{
    132a:	ec06                	sd	ra,24(sp)
    char byte = 0;
    132c:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1330:	1d5000ef          	jal	1d04 <read>
}
    1334:	60e2                	ld	ra,24(sp)
    1336:	00f14503          	lbu	a0,15(sp)
    133a:	6105                	add	sp,sp,32
    133c:	8082                	ret

000000000000133e <putchar>:
{
    133e:	1101                	add	sp,sp,-32
    1340:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1342:	00f10593          	add	a1,sp,15
    1346:	4605                	li	a2,1
    1348:	4505                	li	a0,1
{
    134a:	ec06                	sd	ra,24(sp)
    char byte = c;
    134c:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1350:	1bf000ef          	jal	1d0e <write>
}
    1354:	60e2                	ld	ra,24(sp)
    1356:	2501                	sext.w	a0,a0
    1358:	6105                	add	sp,sp,32
    135a:	8082                	ret

000000000000135c <puts>:
{
    135c:	1141                	add	sp,sp,-16
    135e:	e406                	sd	ra,8(sp)
    1360:	e022                	sd	s0,0(sp)
    1362:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1364:	56c000ef          	jal	18d0 <strlen>
    1368:	862a                	mv	a2,a0
    136a:	85a2                	mv	a1,s0
    136c:	4505                	li	a0,1
    136e:	1a1000ef          	jal	1d0e <write>
}
    1372:	60a2                	ld	ra,8(sp)
    1374:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1376:	957d                	sra	a0,a0,0x3f
    return r;
    1378:	2501                	sext.w	a0,a0
}
    137a:	0141                	add	sp,sp,16
    137c:	8082                	ret

000000000000137e <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    137e:	7131                	add	sp,sp,-192
    1380:	e4d6                	sd	s5,72(sp)
    1382:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    1384:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1386:	013c                	add	a5,sp,136
{
    1388:	f0ca                	sd	s2,96(sp)
    138a:	ecce                	sd	s3,88(sp)
    138c:	e8d2                	sd	s4,80(sp)
    138e:	e0da                	sd	s6,64(sp)
    1390:	fc5e                	sd	s7,56(sp)
    1392:	fc86                	sd	ra,120(sp)
    1394:	f8a2                	sd	s0,112(sp)
    1396:	f4a6                	sd	s1,104(sp)
    1398:	e52e                	sd	a1,136(sp)
    139a:	e932                	sd	a2,144(sp)
    139c:	ed36                	sd	a3,152(sp)
    139e:	f13a                	sd	a4,160(sp)
    13a0:	f942                	sd	a6,176(sp)
    13a2:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    13a4:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    13a6:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    13aa:	07300a13          	li	s4,115
    13ae:	07800b93          	li	s7,120
    13b2:	06400b13          	li	s6,100
    buf[i++] = '0';
    13b6:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x5768>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13ba:	00001997          	auipc	s3,0x1
    13be:	d0e98993          	add	s3,s3,-754 # 20c8 <digits>
        if (!*s)
    13c2:	00054783          	lbu	a5,0(a0)
    13c6:	16078863          	beqz	a5,1536 <printf+0x1b8>
    13ca:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13cc:	19278063          	beq	a5,s2,154c <printf+0x1ce>
    13d0:	00164783          	lbu	a5,1(a2)
    13d4:	0605                	add	a2,a2,1
    13d6:	fbfd                	bnez	a5,13cc <printf+0x4e>
    13d8:	84b2                	mv	s1,a2
        l = z - a;
    13da:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13de:	85aa                	mv	a1,a0
    13e0:	8622                	mv	a2,s0
    13e2:	4505                	li	a0,1
    13e4:	12b000ef          	jal	1d0e <write>
        if (l)
    13e8:	18041763          	bnez	s0,1576 <printf+0x1f8>
        if (s[1] == 0)
    13ec:	0014c783          	lbu	a5,1(s1)
    13f0:	14078363          	beqz	a5,1536 <printf+0x1b8>
        switch (s[1])
    13f4:	19478f63          	beq	a5,s4,1592 <printf+0x214>
    13f8:	18fa6163          	bltu	s4,a5,157a <printf+0x1fc>
    13fc:	1b678e63          	beq	a5,s6,15b8 <printf+0x23a>
    1400:	07000713          	li	a4,112
    1404:	1ce79463          	bne	a5,a4,15cc <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1408:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    140a:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    140e:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1410:	631c                	ld	a5,0(a4)
    1412:	0721                	add	a4,a4,8
    1414:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1416:	00479293          	sll	t0,a5,0x4
    141a:	00879f93          	sll	t6,a5,0x8
    141e:	00c79f13          	sll	t5,a5,0xc
    1422:	01079e93          	sll	t4,a5,0x10
    1426:	01479e13          	sll	t3,a5,0x14
    142a:	01879313          	sll	t1,a5,0x18
    142e:	01c79893          	sll	a7,a5,0x1c
    1432:	02479813          	sll	a6,a5,0x24
    1436:	02879513          	sll	a0,a5,0x28
    143a:	02c79593          	sll	a1,a5,0x2c
    143e:	03079693          	sll	a3,a5,0x30
    1442:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1446:	03c7d413          	srl	s0,a5,0x3c
    144a:	01c7d39b          	srlw	t2,a5,0x1c
    144e:	03c2d293          	srl	t0,t0,0x3c
    1452:	03cfdf93          	srl	t6,t6,0x3c
    1456:	03cf5f13          	srl	t5,t5,0x3c
    145a:	03cede93          	srl	t4,t4,0x3c
    145e:	03ce5e13          	srl	t3,t3,0x3c
    1462:	03c35313          	srl	t1,t1,0x3c
    1466:	03c8d893          	srl	a7,a7,0x3c
    146a:	03c85813          	srl	a6,a6,0x3c
    146e:	9171                	srl	a0,a0,0x3c
    1470:	91f1                	srl	a1,a1,0x3c
    1472:	92f1                	srl	a3,a3,0x3c
    1474:	9371                	srl	a4,a4,0x3c
    1476:	974e                	add	a4,a4,s3
    1478:	944e                	add	s0,s0,s3
    147a:	92ce                	add	t0,t0,s3
    147c:	9fce                	add	t6,t6,s3
    147e:	9f4e                	add	t5,t5,s3
    1480:	9ece                	add	t4,t4,s3
    1482:	9e4e                	add	t3,t3,s3
    1484:	934e                	add	t1,t1,s3
    1486:	98ce                	add	a7,a7,s3
    1488:	93ce                	add	t2,t2,s3
    148a:	984e                	add	a6,a6,s3
    148c:	954e                	add	a0,a0,s3
    148e:	95ce                	add	a1,a1,s3
    1490:	96ce                	add	a3,a3,s3
    1492:	00074083          	lbu	ra,0(a4)
    1496:	0002c283          	lbu	t0,0(t0)
    149a:	000fcf83          	lbu	t6,0(t6)
    149e:	000f4f03          	lbu	t5,0(t5)
    14a2:	000ece83          	lbu	t4,0(t4)
    14a6:	000e4e03          	lbu	t3,0(t3)
    14aa:	00034303          	lbu	t1,0(t1)
    14ae:	0008c883          	lbu	a7,0(a7)
    14b2:	0003c383          	lbu	t2,0(t2)
    14b6:	00084803          	lbu	a6,0(a6)
    14ba:	00054503          	lbu	a0,0(a0)
    14be:	0005c583          	lbu	a1,0(a1)
    14c2:	0006c683          	lbu	a3,0(a3)
    14c6:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14ca:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14ce:	9371                	srl	a4,a4,0x3c
    14d0:	8bbd                	and	a5,a5,15
    14d2:	974e                	add	a4,a4,s3
    14d4:	97ce                	add	a5,a5,s3
    14d6:	005105a3          	sb	t0,11(sp)
    14da:	01f10623          	sb	t6,12(sp)
    14de:	01e106a3          	sb	t5,13(sp)
    14e2:	01d10723          	sb	t4,14(sp)
    14e6:	01c107a3          	sb	t3,15(sp)
    14ea:	00610823          	sb	t1,16(sp)
    14ee:	011108a3          	sb	a7,17(sp)
    14f2:	00710923          	sb	t2,18(sp)
    14f6:	010109a3          	sb	a6,19(sp)
    14fa:	00a10a23          	sb	a0,20(sp)
    14fe:	00b10aa3          	sb	a1,21(sp)
    1502:	00d10b23          	sb	a3,22(sp)
    1506:	00110ba3          	sb	ra,23(sp)
    150a:	00810523          	sb	s0,10(sp)
    150e:	00074703          	lbu	a4,0(a4)
    1512:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1516:	002c                	add	a1,sp,8
    1518:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    151a:	00e10c23          	sb	a4,24(sp)
    151e:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1522:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1526:	7e8000ef          	jal	1d0e <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    152a:	00248513          	add	a0,s1,2
        if (!*s)
    152e:	00054783          	lbu	a5,0(a0)
    1532:	e8079ce3          	bnez	a5,13ca <printf+0x4c>
    }
    va_end(ap);
}
    1536:	70e6                	ld	ra,120(sp)
    1538:	7446                	ld	s0,112(sp)
    153a:	74a6                	ld	s1,104(sp)
    153c:	7906                	ld	s2,96(sp)
    153e:	69e6                	ld	s3,88(sp)
    1540:	6a46                	ld	s4,80(sp)
    1542:	6aa6                	ld	s5,72(sp)
    1544:	6b06                	ld	s6,64(sp)
    1546:	7be2                	ld	s7,56(sp)
    1548:	6129                	add	sp,sp,192
    154a:	8082                	ret
    154c:	84b2                	mv	s1,a2
    154e:	a039                	j	155c <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1550:	0024c783          	lbu	a5,2(s1)
    1554:	0605                	add	a2,a2,1
    1556:	0489                	add	s1,s1,2
    1558:	e92791e3          	bne	a5,s2,13da <printf+0x5c>
    155c:	0014c783          	lbu	a5,1(s1)
    1560:	ff2788e3          	beq	a5,s2,1550 <printf+0x1d2>
        l = z - a;
    1564:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1568:	85aa                	mv	a1,a0
    156a:	8622                	mv	a2,s0
    156c:	4505                	li	a0,1
    156e:	7a0000ef          	jal	1d0e <write>
        if (l)
    1572:	e6040de3          	beqz	s0,13ec <printf+0x6e>
    1576:	8526                	mv	a0,s1
    1578:	b5a9                	j	13c2 <printf+0x44>
        switch (s[1])
    157a:	05779963          	bne	a5,s7,15cc <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    157e:	6782                	ld	a5,0(sp)
    1580:	45c1                	li	a1,16
    1582:	4388                	lw	a0,0(a5)
    1584:	07a1                	add	a5,a5,8
    1586:	e03e                	sd	a5,0(sp)
    1588:	bb7ff0ef          	jal	113e <printint.constprop.0>
        s += 2;
    158c:	00248513          	add	a0,s1,2
    1590:	bf79                	j	152e <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    1592:	6782                	ld	a5,0(sp)
    1594:	6380                	ld	s0,0(a5)
    1596:	07a1                	add	a5,a5,8
    1598:	e03e                	sd	a5,0(sp)
    159a:	cc21                	beqz	s0,15f2 <printf+0x274>
            l = strnlen(a, 200);
    159c:	0c800593          	li	a1,200
    15a0:	8522                	mv	a0,s0
    15a2:	460000ef          	jal	1a02 <strnlen>
    write(f, s, l);
    15a6:	0005061b          	sext.w	a2,a0
    15aa:	85a2                	mv	a1,s0
    15ac:	4505                	li	a0,1
    15ae:	760000ef          	jal	1d0e <write>
        s += 2;
    15b2:	00248513          	add	a0,s1,2
    15b6:	bfa5                	j	152e <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    15b8:	6782                	ld	a5,0(sp)
    15ba:	45a9                	li	a1,10
    15bc:	4388                	lw	a0,0(a5)
    15be:	07a1                	add	a5,a5,8
    15c0:	e03e                	sd	a5,0(sp)
    15c2:	b7dff0ef          	jal	113e <printint.constprop.0>
        s += 2;
    15c6:	00248513          	add	a0,s1,2
    15ca:	b795                	j	152e <printf+0x1b0>
    return write(stdout, &byte, 1);
    15cc:	4605                	li	a2,1
    15ce:	002c                	add	a1,sp,8
    15d0:	4505                	li	a0,1
    char byte = c;
    15d2:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15d6:	738000ef          	jal	1d0e <write>
    char byte = c;
    15da:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15de:	4605                	li	a2,1
    15e0:	002c                	add	a1,sp,8
    15e2:	4505                	li	a0,1
    char byte = c;
    15e4:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15e8:	726000ef          	jal	1d0e <write>
        s += 2;
    15ec:	00248513          	add	a0,s1,2
    15f0:	bf3d                	j	152e <printf+0x1b0>
                a = "(null)";
    15f2:	00001417          	auipc	s0,0x1
    15f6:	a3e40413          	add	s0,s0,-1474 # 2030 <__clone+0xea>
    15fa:	b74d                	j	159c <printf+0x21e>

00000000000015fc <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15fc:	1141                	add	sp,sp,-16
    15fe:	e406                	sd	ra,8(sp)
    puts(m);
    1600:	d5dff0ef          	jal	135c <puts>
    exit(-100);
}
    1604:	60a2                	ld	ra,8(sp)
    exit(-100);
    1606:	f9c00513          	li	a0,-100
}
    160a:	0141                	add	sp,sp,16
    exit(-100);
    160c:	af89                	j	1d5e <exit>

000000000000160e <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    160e:	02000793          	li	a5,32
    1612:	00f50663          	beq	a0,a5,161e <isspace+0x10>
    1616:	355d                	addw	a0,a0,-9
    1618:	00553513          	sltiu	a0,a0,5
    161c:	8082                	ret
    161e:	4505                	li	a0,1
}
    1620:	8082                	ret

0000000000001622 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1622:	fd05051b          	addw	a0,a0,-48
}
    1626:	00a53513          	sltiu	a0,a0,10
    162a:	8082                	ret

000000000000162c <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    162c:	02000713          	li	a4,32
    1630:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1632:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1636:	ff76879b          	addw	a5,a3,-9
    163a:	06e68063          	beq	a3,a4,169a <atoi+0x6e>
    163e:	0006859b          	sext.w	a1,a3
    1642:	04f67c63          	bgeu	a2,a5,169a <atoi+0x6e>
        s++;
    switch (*s)
    1646:	02b00793          	li	a5,43
    164a:	06f68563          	beq	a3,a5,16b4 <atoi+0x88>
    164e:	02d00793          	li	a5,45
    1652:	04f69663          	bne	a3,a5,169e <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1656:	00154683          	lbu	a3,1(a0)
    165a:	47a5                	li	a5,9
        s++;
    165c:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1660:	fd06869b          	addw	a3,a3,-48
    1664:	8636                	mv	a2,a3
    while (isdigit(*s))
    1666:	04d7e563          	bltu	a5,a3,16b0 <atoi+0x84>
        neg = 1;
    166a:	4885                	li	a7,1
    int n = 0, neg = 0;
    166c:	4501                	li	a0,0
    while (isdigit(*s))
    166e:	4825                	li	a6,9
    1670:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1674:	0025179b          	sllw	a5,a0,0x2
    1678:	9fa9                	addw	a5,a5,a0
    167a:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    167e:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    1682:	85b2                	mv	a1,a2
    1684:	40c7853b          	subw	a0,a5,a2
    1688:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    168a:	8636                	mv	a2,a3
    while (isdigit(*s))
    168c:	fed872e3          	bgeu	a6,a3,1670 <atoi+0x44>
    return neg ? n : -n;
    1690:	02089163          	bnez	a7,16b2 <atoi+0x86>
    1694:	40f5853b          	subw	a0,a1,a5
    1698:	8082                	ret
        s++;
    169a:	0505                	add	a0,a0,1
    169c:	bf59                	j	1632 <atoi+0x6>
    while (isdigit(*s))
    169e:	fd05859b          	addw	a1,a1,-48
    16a2:	47a5                	li	a5,9
    16a4:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    16a6:	4881                	li	a7,0
    16a8:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    16ac:	fcb7f0e3          	bgeu	a5,a1,166c <atoi+0x40>
    return neg ? n : -n;
    16b0:	4501                	li	a0,0
}
    16b2:	8082                	ret
    while (isdigit(*s))
    16b4:	00154683          	lbu	a3,1(a0)
    16b8:	47a5                	li	a5,9
        s++;
    16ba:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    16be:	fd06869b          	addw	a3,a3,-48
    16c2:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    16c4:	4881                	li	a7,0
    while (isdigit(*s))
    16c6:	fad7f3e3          	bgeu	a5,a3,166c <atoi+0x40>
    return neg ? n : -n;
    16ca:	4501                	li	a0,0
    16cc:	8082                	ret

00000000000016ce <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16ce:	16060f63          	beqz	a2,184c <memset+0x17e>
    16d2:	40a006b3          	neg	a3,a0
    16d6:	0076f793          	and	a5,a3,7
    16da:	00778813          	add	a6,a5,7
    16de:	48ad                	li	a7,11
    16e0:	0ff5f713          	zext.b	a4,a1
    16e4:	fff60593          	add	a1,a2,-1
    16e8:	17186363          	bltu	a6,a7,184e <memset+0x180>
    16ec:	1705eb63          	bltu	a1,a6,1862 <memset+0x194>
    16f0:	16078163          	beqz	a5,1852 <memset+0x184>
    16f4:	00e50023          	sb	a4,0(a0)
    16f8:	0066f593          	and	a1,a3,6
    16fc:	14058e63          	beqz	a1,1858 <memset+0x18a>
    1700:	00e500a3          	sb	a4,1(a0)
    1704:	4589                	li	a1,2
    1706:	00250813          	add	a6,a0,2
    170a:	04f5f663          	bgeu	a1,a5,1756 <memset+0x88>
    170e:	00e50123          	sb	a4,2(a0)
    1712:	8a91                	and	a3,a3,4
    1714:	00350813          	add	a6,a0,3
    1718:	458d                	li	a1,3
    171a:	ce95                	beqz	a3,1756 <memset+0x88>
    171c:	00e501a3          	sb	a4,3(a0)
    1720:	4691                	li	a3,4
    1722:	00450813          	add	a6,a0,4
    1726:	4591                	li	a1,4
    1728:	02f6f763          	bgeu	a3,a5,1756 <memset+0x88>
    172c:	00e50223          	sb	a4,4(a0)
    1730:	4695                	li	a3,5
    1732:	00550813          	add	a6,a0,5
    1736:	4595                	li	a1,5
    1738:	00d78f63          	beq	a5,a3,1756 <memset+0x88>
    173c:	00e502a3          	sb	a4,5(a0)
    1740:	469d                	li	a3,7
    1742:	00650813          	add	a6,a0,6
    1746:	4599                	li	a1,6
    1748:	00d79763          	bne	a5,a3,1756 <memset+0x88>
    174c:	00750813          	add	a6,a0,7
    1750:	00e50323          	sb	a4,6(a0)
    1754:	459d                	li	a1,7
    1756:	00871693          	sll	a3,a4,0x8
    175a:	01071313          	sll	t1,a4,0x10
    175e:	8ed9                	or	a3,a3,a4
    1760:	01871893          	sll	a7,a4,0x18
    1764:	0066e6b3          	or	a3,a3,t1
    1768:	0116e6b3          	or	a3,a3,a7
    176c:	02071313          	sll	t1,a4,0x20
    1770:	02871893          	sll	a7,a4,0x28
    1774:	0066e6b3          	or	a3,a3,t1
    1778:	40f60e33          	sub	t3,a2,a5
    177c:	03071313          	sll	t1,a4,0x30
    1780:	0116e6b3          	or	a3,a3,a7
    1784:	0066e6b3          	or	a3,a3,t1
    1788:	03871893          	sll	a7,a4,0x38
    178c:	97aa                	add	a5,a5,a0
    178e:	ff8e7313          	and	t1,t3,-8
    1792:	0116e6b3          	or	a3,a3,a7
    1796:	00f308b3          	add	a7,t1,a5
    179a:	e394                	sd	a3,0(a5)
    179c:	07a1                	add	a5,a5,8
    179e:	ff179ee3          	bne	a5,a7,179a <memset+0xcc>
    17a2:	006806b3          	add	a3,a6,t1
    17a6:	00b307bb          	addw	a5,t1,a1
    17aa:	0bc30b63          	beq	t1,t3,1860 <memset+0x192>
    17ae:	00e68023          	sb	a4,0(a3)
    17b2:	0017859b          	addw	a1,a5,1
    17b6:	08c5fb63          	bgeu	a1,a2,184c <memset+0x17e>
    17ba:	00e680a3          	sb	a4,1(a3)
    17be:	0027859b          	addw	a1,a5,2
    17c2:	08c5f563          	bgeu	a1,a2,184c <memset+0x17e>
    17c6:	00e68123          	sb	a4,2(a3)
    17ca:	0037859b          	addw	a1,a5,3
    17ce:	06c5ff63          	bgeu	a1,a2,184c <memset+0x17e>
    17d2:	00e681a3          	sb	a4,3(a3)
    17d6:	0047859b          	addw	a1,a5,4
    17da:	06c5f963          	bgeu	a1,a2,184c <memset+0x17e>
    17de:	00e68223          	sb	a4,4(a3)
    17e2:	0057859b          	addw	a1,a5,5
    17e6:	06c5f363          	bgeu	a1,a2,184c <memset+0x17e>
    17ea:	00e682a3          	sb	a4,5(a3)
    17ee:	0067859b          	addw	a1,a5,6
    17f2:	04c5fd63          	bgeu	a1,a2,184c <memset+0x17e>
    17f6:	00e68323          	sb	a4,6(a3)
    17fa:	0077859b          	addw	a1,a5,7
    17fe:	04c5f763          	bgeu	a1,a2,184c <memset+0x17e>
    1802:	00e683a3          	sb	a4,7(a3)
    1806:	0087859b          	addw	a1,a5,8
    180a:	04c5f163          	bgeu	a1,a2,184c <memset+0x17e>
    180e:	00e68423          	sb	a4,8(a3)
    1812:	0097859b          	addw	a1,a5,9
    1816:	02c5fb63          	bgeu	a1,a2,184c <memset+0x17e>
    181a:	00e684a3          	sb	a4,9(a3)
    181e:	00a7859b          	addw	a1,a5,10
    1822:	02c5f563          	bgeu	a1,a2,184c <memset+0x17e>
    1826:	00e68523          	sb	a4,10(a3)
    182a:	00b7859b          	addw	a1,a5,11
    182e:	00c5ff63          	bgeu	a1,a2,184c <memset+0x17e>
    1832:	00e685a3          	sb	a4,11(a3)
    1836:	00c7859b          	addw	a1,a5,12
    183a:	00c5f963          	bgeu	a1,a2,184c <memset+0x17e>
    183e:	00e68623          	sb	a4,12(a3)
    1842:	27b5                	addw	a5,a5,13
    1844:	00c7f463          	bgeu	a5,a2,184c <memset+0x17e>
    1848:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    184c:	8082                	ret
    184e:	482d                	li	a6,11
    1850:	bd71                	j	16ec <memset+0x1e>
    char *p = dest;
    1852:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1854:	4581                	li	a1,0
    1856:	b701                	j	1756 <memset+0x88>
    1858:	00150813          	add	a6,a0,1
    185c:	4585                	li	a1,1
    185e:	bde5                	j	1756 <memset+0x88>
    1860:	8082                	ret
    char *p = dest;
    1862:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1864:	4781                	li	a5,0
    1866:	b7a1                	j	17ae <memset+0xe0>

0000000000001868 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1868:	00054783          	lbu	a5,0(a0)
    186c:	0005c703          	lbu	a4,0(a1)
    1870:	00e79863          	bne	a5,a4,1880 <strcmp+0x18>
    1874:	0505                	add	a0,a0,1
    1876:	0585                	add	a1,a1,1
    1878:	fbe5                	bnez	a5,1868 <strcmp>
    187a:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    187c:	9d19                	subw	a0,a0,a4
    187e:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1880:	0007851b          	sext.w	a0,a5
    1884:	bfe5                	j	187c <strcmp+0x14>

0000000000001886 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1886:	ca15                	beqz	a2,18ba <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1888:	00054783          	lbu	a5,0(a0)
    if (!n--)
    188c:	167d                	add	a2,a2,-1
    188e:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1892:	eb99                	bnez	a5,18a8 <strncmp+0x22>
    1894:	a815                	j	18c8 <strncmp+0x42>
    1896:	00a68e63          	beq	a3,a0,18b2 <strncmp+0x2c>
    189a:	0505                	add	a0,a0,1
    189c:	00f71b63          	bne	a4,a5,18b2 <strncmp+0x2c>
    18a0:	00054783          	lbu	a5,0(a0)
    18a4:	cf89                	beqz	a5,18be <strncmp+0x38>
    18a6:	85b2                	mv	a1,a2
    18a8:	0005c703          	lbu	a4,0(a1)
    18ac:	00158613          	add	a2,a1,1
    18b0:	f37d                	bnez	a4,1896 <strncmp+0x10>
        ;
    return *l - *r;
    18b2:	0007851b          	sext.w	a0,a5
    18b6:	9d19                	subw	a0,a0,a4
    18b8:	8082                	ret
        return 0;
    18ba:	4501                	li	a0,0
}
    18bc:	8082                	ret
    return *l - *r;
    18be:	0015c703          	lbu	a4,1(a1)
    18c2:	4501                	li	a0,0
    18c4:	9d19                	subw	a0,a0,a4
    18c6:	8082                	ret
    18c8:	0005c703          	lbu	a4,0(a1)
    18cc:	4501                	li	a0,0
    18ce:	b7e5                	j	18b6 <strncmp+0x30>

00000000000018d0 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18d0:	00757793          	and	a5,a0,7
    18d4:	cf89                	beqz	a5,18ee <strlen+0x1e>
    18d6:	87aa                	mv	a5,a0
    18d8:	a029                	j	18e2 <strlen+0x12>
    18da:	0785                	add	a5,a5,1
    18dc:	0077f713          	and	a4,a5,7
    18e0:	cb01                	beqz	a4,18f0 <strlen+0x20>
        if (!*s)
    18e2:	0007c703          	lbu	a4,0(a5)
    18e6:	fb75                	bnez	a4,18da <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18e8:	40a78533          	sub	a0,a5,a0
}
    18ec:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18ee:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18f0:	feff05b7          	lui	a1,0xfeff0
    18f4:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefede37>
    18f8:	f0101637          	lui	a2,0xf0101
    18fc:	05c2                	sll	a1,a1,0x10
    18fe:	0612                	sll	a2,a2,0x4
    1900:	6394                	ld	a3,0(a5)
    1902:	eff58593          	add	a1,a1,-257
    1906:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff039>
    190a:	05c2                	sll	a1,a1,0x10
    190c:	0642                	sll	a2,a2,0x10
    190e:	eff58593          	add	a1,a1,-257
    1912:	10160613          	add	a2,a2,257
    1916:	00b68733          	add	a4,a3,a1
    191a:	063e                	sll	a2,a2,0xf
    191c:	fff6c693          	not	a3,a3
    1920:	8f75                	and	a4,a4,a3
    1922:	08060613          	add	a2,a2,128
    1926:	8f71                	and	a4,a4,a2
    1928:	eb11                	bnez	a4,193c <strlen+0x6c>
    192a:	6794                	ld	a3,8(a5)
    192c:	07a1                	add	a5,a5,8
    192e:	00b68733          	add	a4,a3,a1
    1932:	fff6c693          	not	a3,a3
    1936:	8f75                	and	a4,a4,a3
    1938:	8f71                	and	a4,a4,a2
    193a:	db65                	beqz	a4,192a <strlen+0x5a>
    for (; *s; s++)
    193c:	0007c703          	lbu	a4,0(a5)
    1940:	d745                	beqz	a4,18e8 <strlen+0x18>
    1942:	0017c703          	lbu	a4,1(a5)
    1946:	0785                	add	a5,a5,1
    1948:	d345                	beqz	a4,18e8 <strlen+0x18>
    194a:	0017c703          	lbu	a4,1(a5)
    194e:	0785                	add	a5,a5,1
    1950:	fb6d                	bnez	a4,1942 <strlen+0x72>
    1952:	bf59                	j	18e8 <strlen+0x18>

0000000000001954 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1954:	00757713          	and	a4,a0,7
{
    1958:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    195a:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    195e:	cb19                	beqz	a4,1974 <memchr+0x20>
    1960:	ce59                	beqz	a2,19fe <memchr+0xaa>
    1962:	0007c703          	lbu	a4,0(a5)
    1966:	00b70963          	beq	a4,a1,1978 <memchr+0x24>
    196a:	0785                	add	a5,a5,1
    196c:	0077f713          	and	a4,a5,7
    1970:	167d                	add	a2,a2,-1
    1972:	f77d                	bnez	a4,1960 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1974:	4501                	li	a0,0
    if (n && *s != c)
    1976:	c649                	beqz	a2,1a00 <memchr+0xac>
    1978:	0007c703          	lbu	a4,0(a5)
    197c:	06b70663          	beq	a4,a1,19e8 <memchr+0x94>
        size_t k = ONES * c;
    1980:	01010737          	lui	a4,0x1010
    1984:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e039>
    1988:	0742                	sll	a4,a4,0x10
    198a:	10170713          	add	a4,a4,257
    198e:	0742                	sll	a4,a4,0x10
    1990:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1994:	469d                	li	a3,7
        size_t k = ONES * c;
    1996:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    199a:	04c6f763          	bgeu	a3,a2,19e8 <memchr+0x94>
    199e:	f0101837          	lui	a6,0xf0101
    19a2:	feff08b7          	lui	a7,0xfeff0
    19a6:	0812                	sll	a6,a6,0x4
    19a8:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefede37>
    19ac:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff039>
    19b0:	08c2                	sll	a7,a7,0x10
    19b2:	0842                	sll	a6,a6,0x10
    19b4:	eff88893          	add	a7,a7,-257
    19b8:	10180813          	add	a6,a6,257
    19bc:	08c2                	sll	a7,a7,0x10
    19be:	083e                	sll	a6,a6,0xf
    19c0:	eff88893          	add	a7,a7,-257
    19c4:	08080813          	add	a6,a6,128
    19c8:	431d                	li	t1,7
    19ca:	a029                	j	19d4 <memchr+0x80>
    19cc:	1661                	add	a2,a2,-8
    19ce:	07a1                	add	a5,a5,8
    19d0:	02c37663          	bgeu	t1,a2,19fc <memchr+0xa8>
    19d4:	6398                	ld	a4,0(a5)
    19d6:	8f29                	xor	a4,a4,a0
    19d8:	011706b3          	add	a3,a4,a7
    19dc:	fff74713          	not	a4,a4
    19e0:	8f75                	and	a4,a4,a3
    19e2:	01077733          	and	a4,a4,a6
    19e6:	d37d                	beqz	a4,19cc <memchr+0x78>
        s = (const void *)w;
    19e8:	853e                	mv	a0,a5
    19ea:	a019                	j	19f0 <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    19ec:	0505                	add	a0,a0,1
    19ee:	ca01                	beqz	a2,19fe <memchr+0xaa>
    19f0:	00054783          	lbu	a5,0(a0)
    19f4:	167d                	add	a2,a2,-1
    19f6:	feb79be3          	bne	a5,a1,19ec <memchr+0x98>
    19fa:	8082                	ret
    19fc:	f675                	bnez	a2,19e8 <memchr+0x94>
    return n ? (void *)s : 0;
    19fe:	4501                	li	a0,0
}
    1a00:	8082                	ret

0000000000001a02 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1a02:	1101                	add	sp,sp,-32
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
    1a12:	f43ff0ef          	jal	1954 <memchr>
    return p ? p - s : n;
    1a16:	c519                	beqz	a0,1a24 <strnlen+0x22>
}
    1a18:	60e2                	ld	ra,24(sp)
    1a1a:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1a1c:	8d05                	sub	a0,a0,s1
}
    1a1e:	64a2                	ld	s1,8(sp)
    1a20:	6105                	add	sp,sp,32
    1a22:	8082                	ret
    1a24:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1a26:	8522                	mv	a0,s0
}
    1a28:	6442                	ld	s0,16(sp)
    1a2a:	64a2                	ld	s1,8(sp)
    1a2c:	6105                	add	sp,sp,32
    1a2e:	8082                	ret

0000000000001a30 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a30:	00b547b3          	xor	a5,a0,a1
    1a34:	8b9d                	and	a5,a5,7
    1a36:	efb1                	bnez	a5,1a92 <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a38:	0075f793          	and	a5,a1,7
    1a3c:	ebb5                	bnez	a5,1ab0 <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a3e:	feff0637          	lui	a2,0xfeff0
    1a42:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefede37>
    1a46:	f01016b7          	lui	a3,0xf0101
    1a4a:	0642                	sll	a2,a2,0x10
    1a4c:	0692                	sll	a3,a3,0x4
    1a4e:	6198                	ld	a4,0(a1)
    1a50:	eff60613          	add	a2,a2,-257
    1a54:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff039>
    1a58:	0642                	sll	a2,a2,0x10
    1a5a:	06c2                	sll	a3,a3,0x10
    1a5c:	eff60613          	add	a2,a2,-257
    1a60:	10168693          	add	a3,a3,257
    1a64:	00c707b3          	add	a5,a4,a2
    1a68:	fff74813          	not	a6,a4
    1a6c:	06be                	sll	a3,a3,0xf
    1a6e:	0107f7b3          	and	a5,a5,a6
    1a72:	08068693          	add	a3,a3,128
    1a76:	8ff5                	and	a5,a5,a3
    1a78:	ef89                	bnez	a5,1a92 <strcpy+0x62>
    1a7a:	05a1                	add	a1,a1,8
    1a7c:	e118                	sd	a4,0(a0)
    1a7e:	6198                	ld	a4,0(a1)
    1a80:	0521                	add	a0,a0,8
    1a82:	00c707b3          	add	a5,a4,a2
    1a86:	fff74813          	not	a6,a4
    1a8a:	0107f7b3          	and	a5,a5,a6
    1a8e:	8ff5                	and	a5,a5,a3
    1a90:	d7ed                	beqz	a5,1a7a <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a92:	0005c783          	lbu	a5,0(a1)
    1a96:	00f50023          	sb	a5,0(a0)
    1a9a:	c785                	beqz	a5,1ac2 <strcpy+0x92>
    1a9c:	0015c783          	lbu	a5,1(a1)
    1aa0:	0505                	add	a0,a0,1
    1aa2:	0585                	add	a1,a1,1
    1aa4:	00f50023          	sb	a5,0(a0)
    1aa8:	fbf5                	bnez	a5,1a9c <strcpy+0x6c>
        ;
    return d;
}
    1aaa:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1aac:	0505                	add	a0,a0,1
    1aae:	db41                	beqz	a4,1a3e <strcpy+0xe>
            if (!(*d = *s))
    1ab0:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1ab4:	0585                	add	a1,a1,1
    1ab6:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1aba:	00f50023          	sb	a5,0(a0)
    1abe:	f7fd                	bnez	a5,1aac <strcpy+0x7c>
}
    1ac0:	8082                	ret
    1ac2:	8082                	ret

0000000000001ac4 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1ac4:	00b547b3          	xor	a5,a0,a1
    1ac8:	8b9d                	and	a5,a5,7
    1aca:	efbd                	bnez	a5,1b48 <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1acc:	0075f793          	and	a5,a1,7
    1ad0:	1c078563          	beqz	a5,1c9a <strncpy+0x1d6>
    1ad4:	ea11                	bnez	a2,1ae8 <strncpy+0x24>
    1ad6:	8082                	ret
    1ad8:	0585                	add	a1,a1,1
    1ada:	0075f793          	and	a5,a1,7
    1ade:	167d                	add	a2,a2,-1
    1ae0:	0505                	add	a0,a0,1
    1ae2:	1a078c63          	beqz	a5,1c9a <strncpy+0x1d6>
    1ae6:	ca3d                	beqz	a2,1b5c <strncpy+0x98>
    1ae8:	0005c783          	lbu	a5,0(a1)
    1aec:	00f50023          	sb	a5,0(a0)
    1af0:	f7e5                	bnez	a5,1ad8 <strncpy+0x14>
            ;
        if (!n || !*s)
    1af2:	0005c783          	lbu	a5,0(a1)
    1af6:	c7a5                	beqz	a5,1b5e <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1af8:	479d                	li	a5,7
    1afa:	04c7f863          	bgeu	a5,a2,1b4a <strncpy+0x86>
    1afe:	f01016b7          	lui	a3,0xf0101
    1b02:	feff0837          	lui	a6,0xfeff0
    1b06:	0692                	sll	a3,a3,0x4
    1b08:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefede37>
    1b0c:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff039>
    1b10:	0842                	sll	a6,a6,0x10
    1b12:	06c2                	sll	a3,a3,0x10
    1b14:	eff80813          	add	a6,a6,-257
    1b18:	10168693          	add	a3,a3,257
    1b1c:	0842                	sll	a6,a6,0x10
    1b1e:	06be                	sll	a3,a3,0xf
    1b20:	eff80813          	add	a6,a6,-257
    1b24:	08068693          	add	a3,a3,128
    1b28:	431d                	li	t1,7
    1b2a:	6198                	ld	a4,0(a1)
    1b2c:	010707b3          	add	a5,a4,a6
    1b30:	fff74893          	not	a7,a4
    1b34:	0117f7b3          	and	a5,a5,a7
    1b38:	8ff5                	and	a5,a5,a3
    1b3a:	eb81                	bnez	a5,1b4a <strncpy+0x86>
            *wd = *ws;
    1b3c:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b3e:	1661                	add	a2,a2,-8
    1b40:	05a1                	add	a1,a1,8
    1b42:	0521                	add	a0,a0,8
    1b44:	fec363e3          	bltu	t1,a2,1b2a <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b48:	ca11                	beqz	a2,1b5c <strncpy+0x98>
    1b4a:	0005c783          	lbu	a5,0(a1)
    1b4e:	0585                	add	a1,a1,1
    1b50:	00f50023          	sb	a5,0(a0)
    1b54:	c789                	beqz	a5,1b5e <strncpy+0x9a>
    1b56:	167d                	add	a2,a2,-1
    1b58:	0505                	add	a0,a0,1
    1b5a:	fa65                	bnez	a2,1b4a <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b5c:	8082                	ret
    1b5e:	40a00733          	neg	a4,a0
    1b62:	00777793          	and	a5,a4,7
    1b66:	00778693          	add	a3,a5,7
    1b6a:	482d                	li	a6,11
    1b6c:	fff60593          	add	a1,a2,-1
    1b70:	1106ef63          	bltu	a3,a6,1c8e <strncpy+0x1ca>
    1b74:	12d5ee63          	bltu	a1,a3,1cb0 <strncpy+0x1ec>
    1b78:	12078563          	beqz	a5,1ca2 <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b7c:	00050023          	sb	zero,0(a0)
    1b80:	00677693          	and	a3,a4,6
    1b84:	12068263          	beqz	a3,1ca8 <strncpy+0x1e4>
    1b88:	000500a3          	sb	zero,1(a0)
    1b8c:	4689                	li	a3,2
    1b8e:	12f6f463          	bgeu	a3,a5,1cb6 <strncpy+0x1f2>
    1b92:	00050123          	sb	zero,2(a0)
    1b96:	8b11                	and	a4,a4,4
    1b98:	cf6d                	beqz	a4,1c92 <strncpy+0x1ce>
    1b9a:	000501a3          	sb	zero,3(a0)
    1b9e:	4711                	li	a4,4
    1ba0:	00450693          	add	a3,a0,4
    1ba4:	02f77363          	bgeu	a4,a5,1bca <strncpy+0x106>
    1ba8:	00050223          	sb	zero,4(a0)
    1bac:	4715                	li	a4,5
    1bae:	00550693          	add	a3,a0,5
    1bb2:	00e78c63          	beq	a5,a4,1bca <strncpy+0x106>
    1bb6:	000502a3          	sb	zero,5(a0)
    1bba:	471d                	li	a4,7
    1bbc:	10e79163          	bne	a5,a4,1cbe <strncpy+0x1fa>
    1bc0:	00750693          	add	a3,a0,7
    1bc4:	00050323          	sb	zero,6(a0)
    1bc8:	471d                	li	a4,7
    1bca:	40f608b3          	sub	a7,a2,a5
    1bce:	ff88f813          	and	a6,a7,-8
    1bd2:	97aa                	add	a5,a5,a0
    1bd4:	010785b3          	add	a1,a5,a6
    1bd8:	0007b023          	sd	zero,0(a5)
    1bdc:	07a1                	add	a5,a5,8
    1bde:	feb79de3          	bne	a5,a1,1bd8 <strncpy+0x114>
    1be2:	00e807bb          	addw	a5,a6,a4
    1be6:	01068733          	add	a4,a3,a6
    1bea:	0b088b63          	beq	a7,a6,1ca0 <strncpy+0x1dc>
    1bee:	00070023          	sb	zero,0(a4)
    1bf2:	0017869b          	addw	a3,a5,1
    1bf6:	f6c6f3e3          	bgeu	a3,a2,1b5c <strncpy+0x98>
    1bfa:	000700a3          	sb	zero,1(a4)
    1bfe:	0027869b          	addw	a3,a5,2
    1c02:	f4c6fde3          	bgeu	a3,a2,1b5c <strncpy+0x98>
    1c06:	00070123          	sb	zero,2(a4)
    1c0a:	0037869b          	addw	a3,a5,3
    1c0e:	f4c6f7e3          	bgeu	a3,a2,1b5c <strncpy+0x98>
    1c12:	000701a3          	sb	zero,3(a4)
    1c16:	0047869b          	addw	a3,a5,4
    1c1a:	f4c6f1e3          	bgeu	a3,a2,1b5c <strncpy+0x98>
    1c1e:	00070223          	sb	zero,4(a4)
    1c22:	0057869b          	addw	a3,a5,5
    1c26:	f2c6fbe3          	bgeu	a3,a2,1b5c <strncpy+0x98>
    1c2a:	000702a3          	sb	zero,5(a4)
    1c2e:	0067869b          	addw	a3,a5,6
    1c32:	f2c6f5e3          	bgeu	a3,a2,1b5c <strncpy+0x98>
    1c36:	00070323          	sb	zero,6(a4)
    1c3a:	0077869b          	addw	a3,a5,7
    1c3e:	f0c6ffe3          	bgeu	a3,a2,1b5c <strncpy+0x98>
    1c42:	000703a3          	sb	zero,7(a4)
    1c46:	0087869b          	addw	a3,a5,8
    1c4a:	f0c6f9e3          	bgeu	a3,a2,1b5c <strncpy+0x98>
    1c4e:	00070423          	sb	zero,8(a4)
    1c52:	0097869b          	addw	a3,a5,9
    1c56:	f0c6f3e3          	bgeu	a3,a2,1b5c <strncpy+0x98>
    1c5a:	000704a3          	sb	zero,9(a4)
    1c5e:	00a7869b          	addw	a3,a5,10
    1c62:	eec6fde3          	bgeu	a3,a2,1b5c <strncpy+0x98>
    1c66:	00070523          	sb	zero,10(a4)
    1c6a:	00b7869b          	addw	a3,a5,11
    1c6e:	eec6f7e3          	bgeu	a3,a2,1b5c <strncpy+0x98>
    1c72:	000705a3          	sb	zero,11(a4)
    1c76:	00c7869b          	addw	a3,a5,12
    1c7a:	eec6f1e3          	bgeu	a3,a2,1b5c <strncpy+0x98>
    1c7e:	00070623          	sb	zero,12(a4)
    1c82:	27b5                	addw	a5,a5,13
    1c84:	ecc7fce3          	bgeu	a5,a2,1b5c <strncpy+0x98>
    1c88:	000706a3          	sb	zero,13(a4)
}
    1c8c:	8082                	ret
    1c8e:	46ad                	li	a3,11
    1c90:	b5d5                	j	1b74 <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c92:	00350693          	add	a3,a0,3
    1c96:	470d                	li	a4,3
    1c98:	bf0d                	j	1bca <strncpy+0x106>
        if (!n || !*s)
    1c9a:	e4061ce3          	bnez	a2,1af2 <strncpy+0x2e>
}
    1c9e:	8082                	ret
    1ca0:	8082                	ret
    char *p = dest;
    1ca2:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ca4:	4701                	li	a4,0
    1ca6:	b715                	j	1bca <strncpy+0x106>
    1ca8:	00150693          	add	a3,a0,1
    1cac:	4705                	li	a4,1
    1cae:	bf31                	j	1bca <strncpy+0x106>
    char *p = dest;
    1cb0:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cb2:	4781                	li	a5,0
    1cb4:	bf2d                	j	1bee <strncpy+0x12a>
    1cb6:	00250693          	add	a3,a0,2
    1cba:	4709                	li	a4,2
    1cbc:	b739                	j	1bca <strncpy+0x106>
    1cbe:	00650693          	add	a3,a0,6
    1cc2:	4719                	li	a4,6
    1cc4:	b719                	j	1bca <strncpy+0x106>

0000000000001cc6 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1cc6:	87aa                	mv	a5,a0
    1cc8:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1cca:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1cce:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1cd2:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1cd4:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cd6:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1cda:	2501                	sext.w	a0,a0
    1cdc:	8082                	ret

0000000000001cde <openat>:
    register long a7 __asm__("a7") = n;
    1cde:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1ce2:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ce6:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1cea:	2501                	sext.w	a0,a0
    1cec:	8082                	ret

0000000000001cee <fcntl>:
    register long a7 __asm__("a7") = n;
    1cee:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cf0:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1cf4:	2501                	sext.w	a0,a0
    1cf6:	8082                	ret

0000000000001cf8 <close>:
    register long a7 __asm__("a7") = n;
    1cf8:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1cfc:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d00:	2501                	sext.w	a0,a0
    1d02:	8082                	ret

0000000000001d04 <read>:
    register long a7 __asm__("a7") = n;
    1d04:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d08:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d0c:	8082                	ret

0000000000001d0e <write>:
    register long a7 __asm__("a7") = n;
    1d0e:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d12:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d16:	8082                	ret

0000000000001d18 <getpid>:
    register long a7 __asm__("a7") = n;
    1d18:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d1c:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d20:	2501                	sext.w	a0,a0
    1d22:	8082                	ret

0000000000001d24 <getppid>:
    register long a7 __asm__("a7") = n;
    1d24:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d28:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d2c:	2501                	sext.w	a0,a0
    1d2e:	8082                	ret

0000000000001d30 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d30:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d34:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d38:	2501                	sext.w	a0,a0
    1d3a:	8082                	ret

0000000000001d3c <fork>:
    register long a7 __asm__("a7") = n;
    1d3c:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d40:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d42:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d44:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d48:	2501                	sext.w	a0,a0
    1d4a:	8082                	ret

0000000000001d4c <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d4c:	85b2                	mv	a1,a2
    1d4e:	863a                	mv	a2,a4
    if (stack)
    1d50:	c191                	beqz	a1,1d54 <clone+0x8>
	stack += stack_size;
    1d52:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d54:	4781                	li	a5,0
    1d56:	4701                	li	a4,0
    1d58:	4681                	li	a3,0
    1d5a:	2601                	sext.w	a2,a2
    1d5c:	a2ed                	j	1f46 <__clone>

0000000000001d5e <exit>:
    register long a7 __asm__("a7") = n;
    1d5e:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d62:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d66:	8082                	ret

0000000000001d68 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d68:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d6c:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d6e:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d72:	2501                	sext.w	a0,a0
    1d74:	8082                	ret

0000000000001d76 <exec>:
    register long a7 __asm__("a7") = n;
    1d76:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d7a:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d7e:	2501                	sext.w	a0,a0
    1d80:	8082                	ret

0000000000001d82 <execve>:
    register long a7 __asm__("a7") = n;
    1d82:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d86:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d8a:	2501                	sext.w	a0,a0
    1d8c:	8082                	ret

0000000000001d8e <times>:
    register long a7 __asm__("a7") = n;
    1d8e:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d92:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d96:	2501                	sext.w	a0,a0
    1d98:	8082                	ret

0000000000001d9a <get_time>:

int64 get_time()
{
    1d9a:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d9c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1da0:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1da2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1da4:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1da8:	2501                	sext.w	a0,a0
    1daa:	ed09                	bnez	a0,1dc4 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1dac:	67a2                	ld	a5,8(sp)
    1dae:	3e800713          	li	a4,1000
    1db2:	00015503          	lhu	a0,0(sp)
    1db6:	02e7d7b3          	divu	a5,a5,a4
    1dba:	02e50533          	mul	a0,a0,a4
    1dbe:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1dc0:	0141                	add	sp,sp,16
    1dc2:	8082                	ret
        return -1;
    1dc4:	557d                	li	a0,-1
    1dc6:	bfed                	j	1dc0 <get_time+0x26>

0000000000001dc8 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1dc8:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dcc:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1dd0:	2501                	sext.w	a0,a0
    1dd2:	8082                	ret

0000000000001dd4 <time>:
    register long a7 __asm__("a7") = n;
    1dd4:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1dd8:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1ddc:	2501                	sext.w	a0,a0
    1dde:	8082                	ret

0000000000001de0 <sleep>:

int sleep(unsigned long long time)
{
    1de0:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1de2:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1de4:	850a                	mv	a0,sp
    1de6:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1de8:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1dec:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dee:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1df2:	e501                	bnez	a0,1dfa <sleep+0x1a>
    return 0;
    1df4:	4501                	li	a0,0
}
    1df6:	0141                	add	sp,sp,16
    1df8:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1dfa:	4502                	lw	a0,0(sp)
}
    1dfc:	0141                	add	sp,sp,16
    1dfe:	8082                	ret

0000000000001e00 <set_priority>:
    register long a7 __asm__("a7") = n;
    1e00:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e04:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e08:	2501                	sext.w	a0,a0
    1e0a:	8082                	ret

0000000000001e0c <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e0c:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e10:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e14:	8082                	ret

0000000000001e16 <munmap>:
    register long a7 __asm__("a7") = n;
    1e16:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e1a:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e1e:	2501                	sext.w	a0,a0
    1e20:	8082                	ret

0000000000001e22 <wait>:

int wait(int *code)
{
    1e22:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e24:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e28:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e2a:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e2c:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e2e:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e32:	2501                	sext.w	a0,a0
    1e34:	8082                	ret

0000000000001e36 <spawn>:
    register long a7 __asm__("a7") = n;
    1e36:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e3a:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e3e:	2501                	sext.w	a0,a0
    1e40:	8082                	ret

0000000000001e42 <mailread>:
    register long a7 __asm__("a7") = n;
    1e42:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e46:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e4a:	2501                	sext.w	a0,a0
    1e4c:	8082                	ret

0000000000001e4e <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e4e:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e52:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e56:	2501                	sext.w	a0,a0
    1e58:	8082                	ret

0000000000001e5a <fstat>:
    register long a7 __asm__("a7") = n;
    1e5a:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5e:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e62:	2501                	sext.w	a0,a0
    1e64:	8082                	ret

0000000000001e66 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e66:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e68:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e6c:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e6e:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e72:	2501                	sext.w	a0,a0
    1e74:	8082                	ret

0000000000001e76 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e76:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e78:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e7c:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e7e:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e82:	2501                	sext.w	a0,a0
    1e84:	8082                	ret

0000000000001e86 <link>:

int link(char *old_path, char *new_path)
{
    1e86:	87aa                	mv	a5,a0
    1e88:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e8a:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e8e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e92:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e94:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e98:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e9a:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e9e:	2501                	sext.w	a0,a0
    1ea0:	8082                	ret

0000000000001ea2 <unlink>:

int unlink(char *path)
{
    1ea2:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1ea4:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1ea8:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1eac:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eae:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1eb2:	2501                	sext.w	a0,a0
    1eb4:	8082                	ret

0000000000001eb6 <uname>:
    register long a7 __asm__("a7") = n;
    1eb6:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1eba:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1ebe:	2501                	sext.w	a0,a0
    1ec0:	8082                	ret

0000000000001ec2 <brk>:
    register long a7 __asm__("a7") = n;
    1ec2:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1ec6:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1eca:	2501                	sext.w	a0,a0
    1ecc:	8082                	ret

0000000000001ece <getcwd>:
    register long a7 __asm__("a7") = n;
    1ece:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed0:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1ed4:	8082                	ret

0000000000001ed6 <chdir>:
    register long a7 __asm__("a7") = n;
    1ed6:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1eda:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1ede:	2501                	sext.w	a0,a0
    1ee0:	8082                	ret

0000000000001ee2 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1ee2:	862e                	mv	a2,a1
    1ee4:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1ee6:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ee8:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1eec:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ef0:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1ef2:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ef4:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1ef8:	2501                	sext.w	a0,a0
    1efa:	8082                	ret

0000000000001efc <getdents>:
    register long a7 __asm__("a7") = n;
    1efc:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f00:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f04:	2501                	sext.w	a0,a0
    1f06:	8082                	ret

0000000000001f08 <pipe>:
    register long a7 __asm__("a7") = n;
    1f08:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f0c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f0e:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f12:	2501                	sext.w	a0,a0
    1f14:	8082                	ret

0000000000001f16 <dup>:
    register long a7 __asm__("a7") = n;
    1f16:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f18:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f1c:	2501                	sext.w	a0,a0
    1f1e:	8082                	ret

0000000000001f20 <dup2>:
    register long a7 __asm__("a7") = n;
    1f20:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f22:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f24:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f28:	2501                	sext.w	a0,a0
    1f2a:	8082                	ret

0000000000001f2c <mount>:
    register long a7 __asm__("a7") = n;
    1f2c:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f30:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f34:	2501                	sext.w	a0,a0
    1f36:	8082                	ret

0000000000001f38 <umount>:
    register long a7 __asm__("a7") = n;
    1f38:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f3c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f3e:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f42:	2501                	sext.w	a0,a0
    1f44:	8082                	ret

0000000000001f46 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f46:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1f48:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f4a:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f4c:	8532                	mv	a0,a2
	mv a2, a4
    1f4e:	863a                	mv	a2,a4
	mv a3, a5
    1f50:	86be                	mv	a3,a5
	mv a4, a6
    1f52:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f54:	0dc00893          	li	a7,220
	ecall
    1f58:	00000073          	ecall

	beqz a0, 1f
    1f5c:	c111                	beqz	a0,1f60 <__clone+0x1a>
	# Parent
	ret
    1f5e:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f60:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f62:	6522                	ld	a0,8(sp)
	jalr a1
    1f64:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f66:	05d00893          	li	a7,93
	ecall
    1f6a:	00000073          	ecall
