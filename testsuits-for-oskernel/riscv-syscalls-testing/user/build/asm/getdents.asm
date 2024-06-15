
/home/brightnight/OScompetition/6.13晚final_main/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/getdents：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a0cd                	j	10e4 <__start_main>

0000000000001004 <test_getdents>:
#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"

char buf[512];
void test_getdents(void) {
    1004:	1101                	addi	sp,sp,-32
  TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f2a50513          	addi	a0,a0,-214 # 1f30 <__clone+0x2e>
void test_getdents(void) {
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
    1012:	e426                	sd	s1,8(sp)
  TEST_START(__func__);
    1014:	342000ef          	jal	ra,1356 <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	1d050513          	addi	a0,a0,464 # 21e8 <__func__.0>
    1020:	336000ef          	jal	ra,1356 <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	f2450513          	addi	a0,a0,-220 # 1f48 <__clone+0x46>
    102c:	32a000ef          	jal	ra,1356 <puts>
  int fd, nread;
  struct linux_dirent64 *dirp64;
  dirp64 = buf;
  // fd = open(".", O_DIRECTORY);
  fd = open(".", O_RDONLY);
    1030:	4581                	li	a1,0
    1032:	00001517          	auipc	a0,0x1
    1036:	f2650513          	addi	a0,a0,-218 # 1f58 <__clone+0x56>
    103a:	449000ef          	jal	ra,1c82 <open>
  printf("open fd:%d\n", fd);
    103e:	85aa                	mv	a1,a0
  fd = open(".", O_RDONLY);
    1040:	842a                	mv	s0,a0
  printf("open fd:%d\n", fd);
    1042:	00001517          	auipc	a0,0x1
    1046:	f1e50513          	addi	a0,a0,-226 # 1f60 <__clone+0x5e>
    104a:	32e000ef          	jal	ra,1378 <printf>

  nread = getdents(fd, dirp64, 512);
    104e:	20000613          	li	a2,512
    1052:	00001597          	auipc	a1,0x1
    1056:	f9658593          	addi	a1,a1,-106 # 1fe8 <buf>
    105a:	8522                	mv	a0,s0
    105c:	65d000ef          	jal	ra,1eb8 <getdents>
  printf("getdents fd:%d\n", nread);
    1060:	85aa                	mv	a1,a0
  nread = getdents(fd, dirp64, 512);
    1062:	84aa                	mv	s1,a0
  printf("getdents fd:%d\n", nread);
    1064:	00001517          	auipc	a0,0x1
    1068:	f0c50513          	addi	a0,a0,-244 # 1f70 <__clone+0x6e>
    106c:	30c000ef          	jal	ra,1378 <printf>
  assert(nread != -1);
    1070:	57fd                	li	a5,-1
    1072:	04f48a63          	beq	s1,a5,10c6 <test_getdents+0xc2>
  printf("getdents success.\n%s\n", dirp64->d_name);
    1076:	00001597          	auipc	a1,0x1
    107a:	f8558593          	addi	a1,a1,-123 # 1ffb <buf+0x13>
    107e:	00001517          	auipc	a0,0x1
    1082:	f2250513          	addi	a0,a0,-222 # 1fa0 <__clone+0x9e>
    1086:	2f2000ef          	jal	ra,1378 <printf>
      printf(  "%s\t", d->d_name);
      bpos += d->d_reclen;
  }
  */

  printf("\n");
    108a:	00001517          	auipc	a0,0x1
    108e:	f0e50513          	addi	a0,a0,-242 # 1f98 <__clone+0x96>
    1092:	2e6000ef          	jal	ra,1378 <printf>
  close(fd);
    1096:	8522                	mv	a0,s0
    1098:	41d000ef          	jal	ra,1cb4 <close>
  TEST_END(__func__);
    109c:	00001517          	auipc	a0,0x1
    10a0:	f1c50513          	addi	a0,a0,-228 # 1fb8 <__clone+0xb6>
    10a4:	2b2000ef          	jal	ra,1356 <puts>
    10a8:	00001517          	auipc	a0,0x1
    10ac:	14050513          	addi	a0,a0,320 # 21e8 <__func__.0>
    10b0:	2a6000ef          	jal	ra,1356 <puts>
}
    10b4:	6442                	ld	s0,16(sp)
    10b6:	60e2                	ld	ra,24(sp)
    10b8:	64a2                	ld	s1,8(sp)
  TEST_END(__func__);
    10ba:	00001517          	auipc	a0,0x1
    10be:	e8e50513          	addi	a0,a0,-370 # 1f48 <__clone+0x46>
}
    10c2:	6105                	addi	sp,sp,32
  TEST_END(__func__);
    10c4:	ac49                	j	1356 <puts>
  assert(nread != -1);
    10c6:	00001517          	auipc	a0,0x1
    10ca:	eba50513          	addi	a0,a0,-326 # 1f80 <__clone+0x7e>
    10ce:	52e000ef          	jal	ra,15fc <panic>
    10d2:	b755                	j	1076 <test_getdents+0x72>

00000000000010d4 <main>:

int main(void) {
    10d4:	1141                	addi	sp,sp,-16
    10d6:	e406                	sd	ra,8(sp)
  test_getdents();
    10d8:	f2dff0ef          	jal	ra,1004 <test_getdents>
  return 0;
}
    10dc:	60a2                	ld	ra,8(sp)
    10de:	4501                	li	a0,0
    10e0:	0141                	addi	sp,sp,16
    10e2:	8082                	ret

00000000000010e4 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10e4:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10e6:	4108                	lw	a0,0(a0)
{
    10e8:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10ea:	05a1                	addi	a1,a1,8
{
    10ec:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10ee:	fe7ff0ef          	jal	ra,10d4 <main>
    10f2:	429000ef          	jal	ra,1d1a <exit>
	return 0;
}
    10f6:	60a2                	ld	ra,8(sp)
    10f8:	4501                	li	a0,0
    10fa:	0141                	addi	sp,sp,16
    10fc:	8082                	ret

00000000000010fe <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10fe:	7179                	addi	sp,sp,-48
    1100:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1102:	12054b63          	bltz	a0,1238 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1106:	02b577bb          	remuw	a5,a0,a1
    110a:	00001617          	auipc	a2,0x1
    110e:	0ee60613          	addi	a2,a2,238 # 21f8 <digits>
    buf[16] = 0;
    1112:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1116:	0005871b          	sext.w	a4,a1
    111a:	1782                	slli	a5,a5,0x20
    111c:	9381                	srli	a5,a5,0x20
    111e:	97b2                	add	a5,a5,a2
    1120:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1124:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1128:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    112c:	1cb56363          	bltu	a0,a1,12f2 <printint.constprop.0+0x1f4>
        buf[i--] = digits[x % base];
    1130:	45b9                	li	a1,14
    1132:	02e877bb          	remuw	a5,a6,a4
    1136:	1782                	slli	a5,a5,0x20
    1138:	9381                	srli	a5,a5,0x20
    113a:	97b2                	add	a5,a5,a2
    113c:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1140:	02e856bb          	divuw	a3,a6,a4
        buf[i--] = digits[x % base];
    1144:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    1148:	0ce86e63          	bltu	a6,a4,1224 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    114c:	02e6f5bb          	remuw	a1,a3,a4
    } while ((x /= base) != 0);
    1150:	02e6d7bb          	divuw	a5,a3,a4
        buf[i--] = digits[x % base];
    1154:	1582                	slli	a1,a1,0x20
    1156:	9181                	srli	a1,a1,0x20
    1158:	95b2                	add	a1,a1,a2
    115a:	0005c583          	lbu	a1,0(a1)
    115e:	00b10aa3          	sb	a1,21(sp)
    } while ((x /= base) != 0);
    1162:	0007859b          	sext.w	a1,a5
    1166:	12e6ec63          	bltu	a3,a4,129e <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    116a:	02e7f6bb          	remuw	a3,a5,a4
    116e:	1682                	slli	a3,a3,0x20
    1170:	9281                	srli	a3,a3,0x20
    1172:	96b2                	add	a3,a3,a2
    1174:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1178:	02e7d83b          	divuw	a6,a5,a4
        buf[i--] = digits[x % base];
    117c:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1180:	12e5e863          	bltu	a1,a4,12b0 <printint.constprop.0+0x1b2>
        buf[i--] = digits[x % base];
    1184:	02e876bb          	remuw	a3,a6,a4
    1188:	1682                	slli	a3,a3,0x20
    118a:	9281                	srli	a3,a3,0x20
    118c:	96b2                	add	a3,a3,a2
    118e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1192:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1196:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    119a:	12e86463          	bltu	a6,a4,12c2 <printint.constprop.0+0x1c4>
        buf[i--] = digits[x % base];
    119e:	02e5f6bb          	remuw	a3,a1,a4
    11a2:	1682                	slli	a3,a3,0x20
    11a4:	9281                	srli	a3,a3,0x20
    11a6:	96b2                	add	a3,a3,a2
    11a8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11ac:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11b0:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    11b4:	0ce5ec63          	bltu	a1,a4,128c <printint.constprop.0+0x18e>
        buf[i--] = digits[x % base];
    11b8:	02e876bb          	remuw	a3,a6,a4
    11bc:	1682                	slli	a3,a3,0x20
    11be:	9281                	srli	a3,a3,0x20
    11c0:	96b2                	add	a3,a3,a2
    11c2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11c6:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11ca:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11ce:	10e86963          	bltu	a6,a4,12e0 <printint.constprop.0+0x1e2>
        buf[i--] = digits[x % base];
    11d2:	02e5f6bb          	remuw	a3,a1,a4
    11d6:	1682                	slli	a3,a3,0x20
    11d8:	9281                	srli	a3,a3,0x20
    11da:	96b2                	add	a3,a3,a2
    11dc:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11e0:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11e4:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11e8:	10e5e763          	bltu	a1,a4,12f6 <printint.constprop.0+0x1f8>
        buf[i--] = digits[x % base];
    11ec:	02e876bb          	remuw	a3,a6,a4
    11f0:	1682                	slli	a3,a3,0x20
    11f2:	9281                	srli	a3,a3,0x20
    11f4:	96b2                	add	a3,a3,a2
    11f6:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11fa:	02e857bb          	divuw	a5,a6,a4
        buf[i--] = digits[x % base];
    11fe:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    1202:	10e86363          	bltu	a6,a4,1308 <printint.constprop.0+0x20a>
        buf[i--] = digits[x % base];
    1206:	1782                	slli	a5,a5,0x20
    1208:	9381                	srli	a5,a5,0x20
    120a:	97b2                	add	a5,a5,a2
    120c:	0007c783          	lbu	a5,0(a5)
    1210:	4599                	li	a1,6
    1212:	00f10723          	sb	a5,14(sp)

    if (sign)
    1216:	00055763          	bgez	a0,1224 <printint.constprop.0+0x126>
        buf[i--] = '-';
    121a:	02d00793          	li	a5,45
    121e:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1222:	4595                	li	a1,5
    write(f, s, l);
    1224:	003c                	addi	a5,sp,8
    1226:	4641                	li	a2,16
    1228:	9e0d                	subw	a2,a2,a1
    122a:	4505                	li	a0,1
    122c:	95be                	add	a1,a1,a5
    122e:	29d000ef          	jal	ra,1cca <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1232:	70a2                	ld	ra,40(sp)
    1234:	6145                	addi	sp,sp,48
    1236:	8082                	ret
        x = -xx;
    1238:	40a0083b          	negw	a6,a0
        buf[i--] = digits[x % base];
    123c:	02b877bb          	remuw	a5,a6,a1
    1240:	00001617          	auipc	a2,0x1
    1244:	fb860613          	addi	a2,a2,-72 # 21f8 <digits>
    buf[16] = 0;
    1248:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    124c:	0005871b          	sext.w	a4,a1
    1250:	1782                	slli	a5,a5,0x20
    1252:	9381                	srli	a5,a5,0x20
    1254:	97b2                	add	a5,a5,a2
    1256:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    125a:	02b858bb          	divuw	a7,a6,a1
        buf[i--] = digits[x % base];
    125e:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1262:	06b86963          	bltu	a6,a1,12d4 <printint.constprop.0+0x1d6>
        buf[i--] = digits[x % base];
    1266:	02e8f7bb          	remuw	a5,a7,a4
    126a:	1782                	slli	a5,a5,0x20
    126c:	9381                	srli	a5,a5,0x20
    126e:	97b2                	add	a5,a5,a2
    1270:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1274:	02e8d6bb          	divuw	a3,a7,a4
        buf[i--] = digits[x % base];
    1278:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    127c:	ece8f8e3          	bgeu	a7,a4,114c <printint.constprop.0+0x4e>
        buf[i--] = '-';
    1280:	02d00793          	li	a5,45
    1284:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1288:	45b5                	li	a1,13
    128a:	bf69                	j	1224 <printint.constprop.0+0x126>
    128c:	45a9                	li	a1,10
    if (sign)
    128e:	f8055be3          	bgez	a0,1224 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1292:	02d00793          	li	a5,45
    1296:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    129a:	45a5                	li	a1,9
    129c:	b761                	j	1224 <printint.constprop.0+0x126>
    129e:	45b5                	li	a1,13
    if (sign)
    12a0:	f80552e3          	bgez	a0,1224 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12a4:	02d00793          	li	a5,45
    12a8:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    12ac:	45b1                	li	a1,12
    12ae:	bf9d                	j	1224 <printint.constprop.0+0x126>
    12b0:	45b1                	li	a1,12
    if (sign)
    12b2:	f60559e3          	bgez	a0,1224 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12b6:	02d00793          	li	a5,45
    12ba:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12be:	45ad                	li	a1,11
    12c0:	b795                	j	1224 <printint.constprop.0+0x126>
    12c2:	45ad                	li	a1,11
    if (sign)
    12c4:	f60550e3          	bgez	a0,1224 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12c8:	02d00793          	li	a5,45
    12cc:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12d0:	45a9                	li	a1,10
    12d2:	bf89                	j	1224 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12d4:	02d00793          	li	a5,45
    12d8:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12dc:	45b9                	li	a1,14
    12de:	b799                	j	1224 <printint.constprop.0+0x126>
    12e0:	45a5                	li	a1,9
    if (sign)
    12e2:	f40551e3          	bgez	a0,1224 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12e6:	02d00793          	li	a5,45
    12ea:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12ee:	45a1                	li	a1,8
    12f0:	bf15                	j	1224 <printint.constprop.0+0x126>
    i = 15;
    12f2:	45bd                	li	a1,15
    12f4:	bf05                	j	1224 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    12f6:	45a1                	li	a1,8
    if (sign)
    12f8:	f20556e3          	bgez	a0,1224 <printint.constprop.0+0x126>
        buf[i--] = '-';
    12fc:	02d00793          	li	a5,45
    1300:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1304:	459d                	li	a1,7
    1306:	bf39                	j	1224 <printint.constprop.0+0x126>
    1308:	459d                	li	a1,7
    if (sign)
    130a:	f0055de3          	bgez	a0,1224 <printint.constprop.0+0x126>
        buf[i--] = '-';
    130e:	02d00793          	li	a5,45
    1312:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1316:	4599                	li	a1,6
    1318:	b731                	j	1224 <printint.constprop.0+0x126>

000000000000131a <getchar>:
{
    131a:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    131c:	00f10593          	addi	a1,sp,15
    1320:	4605                	li	a2,1
    1322:	4501                	li	a0,0
{
    1324:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1326:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    132a:	197000ef          	jal	ra,1cc0 <read>
}
    132e:	60e2                	ld	ra,24(sp)
    1330:	00f14503          	lbu	a0,15(sp)
    1334:	6105                	addi	sp,sp,32
    1336:	8082                	ret

0000000000001338 <putchar>:
{
    1338:	1101                	addi	sp,sp,-32
    133a:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    133c:	00f10593          	addi	a1,sp,15
    1340:	4605                	li	a2,1
    1342:	4505                	li	a0,1
{
    1344:	ec06                	sd	ra,24(sp)
    char byte = c;
    1346:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    134a:	181000ef          	jal	ra,1cca <write>
}
    134e:	60e2                	ld	ra,24(sp)
    1350:	2501                	sext.w	a0,a0
    1352:	6105                	addi	sp,sp,32
    1354:	8082                	ret

0000000000001356 <puts>:
{
    1356:	1141                	addi	sp,sp,-16
    1358:	e406                	sd	ra,8(sp)
    135a:	e022                	sd	s0,0(sp)
    135c:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    135e:	57e000ef          	jal	ra,18dc <strlen>
    1362:	862a                	mv	a2,a0
    1364:	85a2                	mv	a1,s0
    1366:	4505                	li	a0,1
    1368:	163000ef          	jal	ra,1cca <write>
}
    136c:	60a2                	ld	ra,8(sp)
    136e:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1370:	957d                	srai	a0,a0,0x3f
    return r;
    1372:	2501                	sext.w	a0,a0
}
    1374:	0141                	addi	sp,sp,16
    1376:	8082                	ret

0000000000001378 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1378:	7171                	addi	sp,sp,-176
    137a:	fc56                	sd	s5,56(sp)
    137c:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    137e:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1380:	18bc                	addi	a5,sp,120
{
    1382:	e8ca                	sd	s2,80(sp)
    1384:	e4ce                	sd	s3,72(sp)
    1386:	e0d2                	sd	s4,64(sp)
    1388:	f85a                	sd	s6,48(sp)
    138a:	f486                	sd	ra,104(sp)
    138c:	f0a2                	sd	s0,96(sp)
    138e:	eca6                	sd	s1,88(sp)
    1390:	fcae                	sd	a1,120(sp)
    1392:	e132                	sd	a2,128(sp)
    1394:	e536                	sd	a3,136(sp)
    1396:	e93a                	sd	a4,144(sp)
    1398:	f142                	sd	a6,160(sp)
    139a:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    139c:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    139e:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    13a2:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    13a6:	00001b17          	auipc	s6,0x1
    13aa:	c22b0b13          	addi	s6,s6,-990 # 1fc8 <__clone+0xc6>
    buf[i++] = '0';
    13ae:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13b2:	00001997          	auipc	s3,0x1
    13b6:	e4698993          	addi	s3,s3,-442 # 21f8 <digits>
        if (!*s)
    13ba:	00054783          	lbu	a5,0(a0)
    13be:	16078a63          	beqz	a5,1532 <printf+0x1ba>
    13c2:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13c4:	19278163          	beq	a5,s2,1546 <printf+0x1ce>
    13c8:	00164783          	lbu	a5,1(a2)
    13cc:	0605                	addi	a2,a2,1
    13ce:	fbfd                	bnez	a5,13c4 <printf+0x4c>
    13d0:	84b2                	mv	s1,a2
        l = z - a;
    13d2:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13d6:	85aa                	mv	a1,a0
    13d8:	8622                	mv	a2,s0
    13da:	4505                	li	a0,1
    13dc:	0ef000ef          	jal	ra,1cca <write>
        if (l)
    13e0:	18041c63          	bnez	s0,1578 <printf+0x200>
        if (s[1] == 0)
    13e4:	0014c783          	lbu	a5,1(s1)
    13e8:	14078563          	beqz	a5,1532 <printf+0x1ba>
        switch (s[1])
    13ec:	1d478063          	beq	a5,s4,15ac <printf+0x234>
    13f0:	18fa6663          	bltu	s4,a5,157c <printf+0x204>
    13f4:	06400713          	li	a4,100
    13f8:	1ae78063          	beq	a5,a4,1598 <printf+0x220>
    13fc:	07000713          	li	a4,112
    1400:	1ce79963          	bne	a5,a4,15d2 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    1404:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1406:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    140a:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    140c:	631c                	ld	a5,0(a4)
    140e:	0721                	addi	a4,a4,8
    1410:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1412:	00479293          	slli	t0,a5,0x4
    1416:	00879f93          	slli	t6,a5,0x8
    141a:	00c79f13          	slli	t5,a5,0xc
    141e:	01079e93          	slli	t4,a5,0x10
    1422:	01479e13          	slli	t3,a5,0x14
    1426:	01879313          	slli	t1,a5,0x18
    142a:	01c79893          	slli	a7,a5,0x1c
    142e:	02479813          	slli	a6,a5,0x24
    1432:	02879513          	slli	a0,a5,0x28
    1436:	02c79593          	slli	a1,a5,0x2c
    143a:	03079693          	slli	a3,a5,0x30
    143e:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1442:	03c7d413          	srli	s0,a5,0x3c
    1446:	01c7d39b          	srliw	t2,a5,0x1c
    144a:	03c2d293          	srli	t0,t0,0x3c
    144e:	03cfdf93          	srli	t6,t6,0x3c
    1452:	03cf5f13          	srli	t5,t5,0x3c
    1456:	03cede93          	srli	t4,t4,0x3c
    145a:	03ce5e13          	srli	t3,t3,0x3c
    145e:	03c35313          	srli	t1,t1,0x3c
    1462:	03c8d893          	srli	a7,a7,0x3c
    1466:	03c85813          	srli	a6,a6,0x3c
    146a:	9171                	srli	a0,a0,0x3c
    146c:	91f1                	srli	a1,a1,0x3c
    146e:	92f1                	srli	a3,a3,0x3c
    1470:	9371                	srli	a4,a4,0x3c
    1472:	96ce                	add	a3,a3,s3
    1474:	974e                	add	a4,a4,s3
    1476:	944e                	add	s0,s0,s3
    1478:	92ce                	add	t0,t0,s3
    147a:	9fce                	add	t6,t6,s3
    147c:	9f4e                	add	t5,t5,s3
    147e:	9ece                	add	t4,t4,s3
    1480:	9e4e                	add	t3,t3,s3
    1482:	934e                	add	t1,t1,s3
    1484:	98ce                	add	a7,a7,s3
    1486:	93ce                	add	t2,t2,s3
    1488:	984e                	add	a6,a6,s3
    148a:	954e                	add	a0,a0,s3
    148c:	95ce                	add	a1,a1,s3
    148e:	0006c083          	lbu	ra,0(a3)
    1492:	0002c283          	lbu	t0,0(t0)
    1496:	00074683          	lbu	a3,0(a4)
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
    14c2:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14c6:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14ca:	9371                	srli	a4,a4,0x3c
    14cc:	8bbd                	andi	a5,a5,15
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
    14fe:	00110b23          	sb	ra,22(sp)
    1502:	00d10ba3          	sb	a3,23(sp)
    1506:	00810523          	sb	s0,10(sp)
    150a:	00074703          	lbu	a4,0(a4)
    150e:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1512:	002c                	addi	a1,sp,8
    1514:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1516:	00e10c23          	sb	a4,24(sp)
    151a:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    151e:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1522:	7a8000ef          	jal	ra,1cca <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1526:	00248513          	addi	a0,s1,2
        if (!*s)
    152a:	00054783          	lbu	a5,0(a0)
    152e:	e8079ae3          	bnez	a5,13c2 <printf+0x4a>
    }
    va_end(ap);
}
    1532:	70a6                	ld	ra,104(sp)
    1534:	7406                	ld	s0,96(sp)
    1536:	64e6                	ld	s1,88(sp)
    1538:	6946                	ld	s2,80(sp)
    153a:	69a6                	ld	s3,72(sp)
    153c:	6a06                	ld	s4,64(sp)
    153e:	7ae2                	ld	s5,56(sp)
    1540:	7b42                	ld	s6,48(sp)
    1542:	614d                	addi	sp,sp,176
    1544:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1546:	00064783          	lbu	a5,0(a2)
    154a:	84b2                	mv	s1,a2
    154c:	01278963          	beq	a5,s2,155e <printf+0x1e6>
    1550:	b549                	j	13d2 <printf+0x5a>
    1552:	0024c783          	lbu	a5,2(s1)
    1556:	0605                	addi	a2,a2,1
    1558:	0489                	addi	s1,s1,2
    155a:	e7279ce3          	bne	a5,s2,13d2 <printf+0x5a>
    155e:	0014c783          	lbu	a5,1(s1)
    1562:	ff2788e3          	beq	a5,s2,1552 <printf+0x1da>
        l = z - a;
    1566:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    156a:	85aa                	mv	a1,a0
    156c:	8622                	mv	a2,s0
    156e:	4505                	li	a0,1
    1570:	75a000ef          	jal	ra,1cca <write>
        if (l)
    1574:	e60408e3          	beqz	s0,13e4 <printf+0x6c>
    1578:	8526                	mv	a0,s1
    157a:	b581                	j	13ba <printf+0x42>
        switch (s[1])
    157c:	07800713          	li	a4,120
    1580:	04e79963          	bne	a5,a4,15d2 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    1584:	6782                	ld	a5,0(sp)
    1586:	45c1                	li	a1,16
    1588:	4388                	lw	a0,0(a5)
    158a:	07a1                	addi	a5,a5,8
    158c:	e03e                	sd	a5,0(sp)
    158e:	b71ff0ef          	jal	ra,10fe <printint.constprop.0>
        s += 2;
    1592:	00248513          	addi	a0,s1,2
    1596:	bf51                	j	152a <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    1598:	6782                	ld	a5,0(sp)
    159a:	45a9                	li	a1,10
    159c:	4388                	lw	a0,0(a5)
    159e:	07a1                	addi	a5,a5,8
    15a0:	e03e                	sd	a5,0(sp)
    15a2:	b5dff0ef          	jal	ra,10fe <printint.constprop.0>
        s += 2;
    15a6:	00248513          	addi	a0,s1,2
    15aa:	b741                	j	152a <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    15ac:	6782                	ld	a5,0(sp)
    15ae:	6380                	ld	s0,0(a5)
    15b0:	07a1                	addi	a5,a5,8
    15b2:	e03e                	sd	a5,0(sp)
    15b4:	c031                	beqz	s0,15f8 <printf+0x280>
            l = strnlen(a, 200);
    15b6:	0c800593          	li	a1,200
    15ba:	8522                	mv	a0,s0
    15bc:	40c000ef          	jal	ra,19c8 <strnlen>
    write(f, s, l);
    15c0:	0005061b          	sext.w	a2,a0
    15c4:	85a2                	mv	a1,s0
    15c6:	4505                	li	a0,1
    15c8:	702000ef          	jal	ra,1cca <write>
        s += 2;
    15cc:	00248513          	addi	a0,s1,2
    15d0:	bfa9                	j	152a <printf+0x1b2>
    return write(stdout, &byte, 1);
    15d2:	4605                	li	a2,1
    15d4:	002c                	addi	a1,sp,8
    15d6:	4505                	li	a0,1
    char byte = c;
    15d8:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15dc:	6ee000ef          	jal	ra,1cca <write>
    char byte = c;
    15e0:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15e4:	4605                	li	a2,1
    15e6:	002c                	addi	a1,sp,8
    15e8:	4505                	li	a0,1
    char byte = c;
    15ea:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15ee:	6dc000ef          	jal	ra,1cca <write>
        s += 2;
    15f2:	00248513          	addi	a0,s1,2
    15f6:	bf15                	j	152a <printf+0x1b2>
                a = "(null)";
    15f8:	845a                	mv	s0,s6
    15fa:	bf75                	j	15b6 <printf+0x23e>

00000000000015fc <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15fc:	1141                	addi	sp,sp,-16
    15fe:	e406                	sd	ra,8(sp)
    puts(m);
    1600:	d57ff0ef          	jal	ra,1356 <puts>
    exit(-100);
}
    1604:	60a2                	ld	ra,8(sp)
    exit(-100);
    1606:	f9c00513          	li	a0,-100
}
    160a:	0141                	addi	sp,sp,16
    exit(-100);
    160c:	a739                	j	1d1a <exit>

000000000000160e <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    160e:	02000793          	li	a5,32
    1612:	00f50663          	beq	a0,a5,161e <isspace+0x10>
    1616:	355d                	addiw	a0,a0,-9
    1618:	00553513          	sltiu	a0,a0,5
    161c:	8082                	ret
    161e:	4505                	li	a0,1
}
    1620:	8082                	ret

0000000000001622 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1622:	fd05051b          	addiw	a0,a0,-48
}
    1626:	00a53513          	sltiu	a0,a0,10
    162a:	8082                	ret

000000000000162c <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    162c:	02000613          	li	a2,32
    1630:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1632:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1636:	ff77869b          	addiw	a3,a5,-9
    163a:	04c78c63          	beq	a5,a2,1692 <atoi+0x66>
    163e:	0007871b          	sext.w	a4,a5
    1642:	04d5f863          	bgeu	a1,a3,1692 <atoi+0x66>
        s++;
    switch (*s)
    1646:	02b00693          	li	a3,43
    164a:	04d78963          	beq	a5,a3,169c <atoi+0x70>
    164e:	02d00693          	li	a3,45
    1652:	06d78263          	beq	a5,a3,16b6 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1656:	fd07061b          	addiw	a2,a4,-48
    165a:	47a5                	li	a5,9
    165c:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    165e:	4e01                	li	t3,0
    while (isdigit(*s))
    1660:	04c7e963          	bltu	a5,a2,16b2 <atoi+0x86>
    int n = 0, neg = 0;
    1664:	4501                	li	a0,0
    while (isdigit(*s))
    1666:	4825                	li	a6,9
    1668:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    166c:	0025179b          	slliw	a5,a0,0x2
    1670:	9fa9                	addw	a5,a5,a0
    1672:	fd07031b          	addiw	t1,a4,-48
    1676:	0017989b          	slliw	a7,a5,0x1
    while (isdigit(*s))
    167a:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    167e:	0685                	addi	a3,a3,1
    1680:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1684:	0006071b          	sext.w	a4,a2
    1688:	feb870e3          	bgeu	a6,a1,1668 <atoi+0x3c>
    return neg ? n : -n;
    168c:	000e0563          	beqz	t3,1696 <atoi+0x6a>
}
    1690:	8082                	ret
        s++;
    1692:	0505                	addi	a0,a0,1
    1694:	bf79                	j	1632 <atoi+0x6>
    return neg ? n : -n;
    1696:	4113053b          	subw	a0,t1,a7
    169a:	8082                	ret
    while (isdigit(*s))
    169c:	00154703          	lbu	a4,1(a0)
    16a0:	47a5                	li	a5,9
        s++;
    16a2:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    16a6:	fd07061b          	addiw	a2,a4,-48
    int n = 0, neg = 0;
    16aa:	4e01                	li	t3,0
    while (isdigit(*s))
    16ac:	2701                	sext.w	a4,a4
    16ae:	fac7fbe3          	bgeu	a5,a2,1664 <atoi+0x38>
    16b2:	4501                	li	a0,0
}
    16b4:	8082                	ret
    while (isdigit(*s))
    16b6:	00154703          	lbu	a4,1(a0)
    16ba:	47a5                	li	a5,9
        s++;
    16bc:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    16c0:	fd07061b          	addiw	a2,a4,-48
    16c4:	2701                	sext.w	a4,a4
    16c6:	fec7e6e3          	bltu	a5,a2,16b2 <atoi+0x86>
        neg = 1;
    16ca:	4e05                	li	t3,1
    16cc:	bf61                	j	1664 <atoi+0x38>

00000000000016ce <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16ce:	16060d63          	beqz	a2,1848 <memset+0x17a>
    16d2:	40a007b3          	neg	a5,a0
    16d6:	8b9d                	andi	a5,a5,7
    16d8:	00778693          	addi	a3,a5,7
    16dc:	482d                	li	a6,11
    16de:	0ff5f713          	zext.b	a4,a1
    16e2:	fff60593          	addi	a1,a2,-1
    16e6:	1706e263          	bltu	a3,a6,184a <memset+0x17c>
    16ea:	16d5ea63          	bltu	a1,a3,185e <memset+0x190>
    16ee:	16078563          	beqz	a5,1858 <memset+0x18a>
    16f2:	00e50023          	sb	a4,0(a0)
    16f6:	4685                	li	a3,1
    16f8:	00150593          	addi	a1,a0,1
    16fc:	14d78c63          	beq	a5,a3,1854 <memset+0x186>
    1700:	00e500a3          	sb	a4,1(a0)
    1704:	4689                	li	a3,2
    1706:	00250593          	addi	a1,a0,2
    170a:	14d78d63          	beq	a5,a3,1864 <memset+0x196>
    170e:	00e50123          	sb	a4,2(a0)
    1712:	468d                	li	a3,3
    1714:	00350593          	addi	a1,a0,3
    1718:	12d78b63          	beq	a5,a3,184e <memset+0x180>
    171c:	00e501a3          	sb	a4,3(a0)
    1720:	4691                	li	a3,4
    1722:	00450593          	addi	a1,a0,4
    1726:	14d78163          	beq	a5,a3,1868 <memset+0x19a>
    172a:	00e50223          	sb	a4,4(a0)
    172e:	4695                	li	a3,5
    1730:	00550593          	addi	a1,a0,5
    1734:	12d78c63          	beq	a5,a3,186c <memset+0x19e>
    1738:	00e502a3          	sb	a4,5(a0)
    173c:	469d                	li	a3,7
    173e:	00650593          	addi	a1,a0,6
    1742:	12d79763          	bne	a5,a3,1870 <memset+0x1a2>
    1746:	00750593          	addi	a1,a0,7
    174a:	00e50323          	sb	a4,6(a0)
    174e:	481d                	li	a6,7
    1750:	00871693          	slli	a3,a4,0x8
    1754:	01071893          	slli	a7,a4,0x10
    1758:	8ed9                	or	a3,a3,a4
    175a:	01871313          	slli	t1,a4,0x18
    175e:	0116e6b3          	or	a3,a3,a7
    1762:	0066e6b3          	or	a3,a3,t1
    1766:	02071893          	slli	a7,a4,0x20
    176a:	02871e13          	slli	t3,a4,0x28
    176e:	0116e6b3          	or	a3,a3,a7
    1772:	40f60333          	sub	t1,a2,a5
    1776:	03071893          	slli	a7,a4,0x30
    177a:	01c6e6b3          	or	a3,a3,t3
    177e:	0116e6b3          	or	a3,a3,a7
    1782:	03871e13          	slli	t3,a4,0x38
    1786:	97aa                	add	a5,a5,a0
    1788:	ff837893          	andi	a7,t1,-8
    178c:	01c6e6b3          	or	a3,a3,t3
    1790:	98be                	add	a7,a7,a5
    1792:	e394                	sd	a3,0(a5)
    1794:	07a1                	addi	a5,a5,8
    1796:	ff179ee3          	bne	a5,a7,1792 <memset+0xc4>
    179a:	ff837893          	andi	a7,t1,-8
    179e:	011587b3          	add	a5,a1,a7
    17a2:	010886bb          	addw	a3,a7,a6
    17a6:	0b130663          	beq	t1,a7,1852 <memset+0x184>
    17aa:	00e78023          	sb	a4,0(a5)
    17ae:	0016859b          	addiw	a1,a3,1
    17b2:	08c5fb63          	bgeu	a1,a2,1848 <memset+0x17a>
    17b6:	00e780a3          	sb	a4,1(a5)
    17ba:	0026859b          	addiw	a1,a3,2
    17be:	08c5f563          	bgeu	a1,a2,1848 <memset+0x17a>
    17c2:	00e78123          	sb	a4,2(a5)
    17c6:	0036859b          	addiw	a1,a3,3
    17ca:	06c5ff63          	bgeu	a1,a2,1848 <memset+0x17a>
    17ce:	00e781a3          	sb	a4,3(a5)
    17d2:	0046859b          	addiw	a1,a3,4
    17d6:	06c5f963          	bgeu	a1,a2,1848 <memset+0x17a>
    17da:	00e78223          	sb	a4,4(a5)
    17de:	0056859b          	addiw	a1,a3,5
    17e2:	06c5f363          	bgeu	a1,a2,1848 <memset+0x17a>
    17e6:	00e782a3          	sb	a4,5(a5)
    17ea:	0066859b          	addiw	a1,a3,6
    17ee:	04c5fd63          	bgeu	a1,a2,1848 <memset+0x17a>
    17f2:	00e78323          	sb	a4,6(a5)
    17f6:	0076859b          	addiw	a1,a3,7
    17fa:	04c5f763          	bgeu	a1,a2,1848 <memset+0x17a>
    17fe:	00e783a3          	sb	a4,7(a5)
    1802:	0086859b          	addiw	a1,a3,8
    1806:	04c5f163          	bgeu	a1,a2,1848 <memset+0x17a>
    180a:	00e78423          	sb	a4,8(a5)
    180e:	0096859b          	addiw	a1,a3,9
    1812:	02c5fb63          	bgeu	a1,a2,1848 <memset+0x17a>
    1816:	00e784a3          	sb	a4,9(a5)
    181a:	00a6859b          	addiw	a1,a3,10
    181e:	02c5f563          	bgeu	a1,a2,1848 <memset+0x17a>
    1822:	00e78523          	sb	a4,10(a5)
    1826:	00b6859b          	addiw	a1,a3,11
    182a:	00c5ff63          	bgeu	a1,a2,1848 <memset+0x17a>
    182e:	00e785a3          	sb	a4,11(a5)
    1832:	00c6859b          	addiw	a1,a3,12
    1836:	00c5f963          	bgeu	a1,a2,1848 <memset+0x17a>
    183a:	00e78623          	sb	a4,12(a5)
    183e:	26b5                	addiw	a3,a3,13
    1840:	00c6f463          	bgeu	a3,a2,1848 <memset+0x17a>
    1844:	00e786a3          	sb	a4,13(a5)
        ;
    return dest;
}
    1848:	8082                	ret
    184a:	46ad                	li	a3,11
    184c:	bd79                	j	16ea <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    184e:	480d                	li	a6,3
    1850:	b701                	j	1750 <memset+0x82>
    1852:	8082                	ret
    1854:	4805                	li	a6,1
    1856:	bded                	j	1750 <memset+0x82>
    1858:	85aa                	mv	a1,a0
    185a:	4801                	li	a6,0
    185c:	bdd5                	j	1750 <memset+0x82>
    185e:	87aa                	mv	a5,a0
    1860:	4681                	li	a3,0
    1862:	b7a1                	j	17aa <memset+0xdc>
    1864:	4809                	li	a6,2
    1866:	b5ed                	j	1750 <memset+0x82>
    1868:	4811                	li	a6,4
    186a:	b5dd                	j	1750 <memset+0x82>
    186c:	4815                	li	a6,5
    186e:	b5cd                	j	1750 <memset+0x82>
    1870:	4819                	li	a6,6
    1872:	bdf9                	j	1750 <memset+0x82>

0000000000001874 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1874:	00054783          	lbu	a5,0(a0)
    1878:	0005c703          	lbu	a4,0(a1)
    187c:	00e79863          	bne	a5,a4,188c <strcmp+0x18>
    1880:	0505                	addi	a0,a0,1
    1882:	0585                	addi	a1,a1,1
    1884:	fbe5                	bnez	a5,1874 <strcmp>
    1886:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1888:	9d19                	subw	a0,a0,a4
    188a:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    188c:	0007851b          	sext.w	a0,a5
    1890:	bfe5                	j	1888 <strcmp+0x14>

0000000000001892 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1892:	ca15                	beqz	a2,18c6 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1894:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1898:	167d                	addi	a2,a2,-1
    189a:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    189e:	eb99                	bnez	a5,18b4 <strncmp+0x22>
    18a0:	a815                	j	18d4 <strncmp+0x42>
    18a2:	00a68e63          	beq	a3,a0,18be <strncmp+0x2c>
    18a6:	0505                	addi	a0,a0,1
    18a8:	00f71b63          	bne	a4,a5,18be <strncmp+0x2c>
    18ac:	00054783          	lbu	a5,0(a0)
    18b0:	cf89                	beqz	a5,18ca <strncmp+0x38>
    18b2:	85b2                	mv	a1,a2
    18b4:	0005c703          	lbu	a4,0(a1)
    18b8:	00158613          	addi	a2,a1,1
    18bc:	f37d                	bnez	a4,18a2 <strncmp+0x10>
        ;
    return *l - *r;
    18be:	0007851b          	sext.w	a0,a5
    18c2:	9d19                	subw	a0,a0,a4
    18c4:	8082                	ret
        return 0;
    18c6:	4501                	li	a0,0
}
    18c8:	8082                	ret
    return *l - *r;
    18ca:	0015c703          	lbu	a4,1(a1)
    18ce:	4501                	li	a0,0
    18d0:	9d19                	subw	a0,a0,a4
    18d2:	8082                	ret
    18d4:	0005c703          	lbu	a4,0(a1)
    18d8:	4501                	li	a0,0
    18da:	b7e5                	j	18c2 <strncmp+0x30>

00000000000018dc <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18dc:	00757793          	andi	a5,a0,7
    18e0:	cf89                	beqz	a5,18fa <strlen+0x1e>
    18e2:	87aa                	mv	a5,a0
    18e4:	a029                	j	18ee <strlen+0x12>
    18e6:	0785                	addi	a5,a5,1
    18e8:	0077f713          	andi	a4,a5,7
    18ec:	cb01                	beqz	a4,18fc <strlen+0x20>
        if (!*s)
    18ee:	0007c703          	lbu	a4,0(a5)
    18f2:	fb75                	bnez	a4,18e6 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18f4:	40a78533          	sub	a0,a5,a0
}
    18f8:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18fa:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18fc:	6394                	ld	a3,0(a5)
    18fe:	00000597          	auipc	a1,0x0
    1902:	6d25b583          	ld	a1,1746(a1) # 1fd0 <__clone+0xce>
    1906:	00000617          	auipc	a2,0x0
    190a:	6d263603          	ld	a2,1746(a2) # 1fd8 <__clone+0xd6>
    190e:	a019                	j	1914 <strlen+0x38>
    1910:	6794                	ld	a3,8(a5)
    1912:	07a1                	addi	a5,a5,8
    1914:	00b68733          	add	a4,a3,a1
    1918:	fff6c693          	not	a3,a3
    191c:	8f75                	and	a4,a4,a3
    191e:	8f71                	and	a4,a4,a2
    1920:	db65                	beqz	a4,1910 <strlen+0x34>
    for (; *s; s++)
    1922:	0007c703          	lbu	a4,0(a5)
    1926:	d779                	beqz	a4,18f4 <strlen+0x18>
    1928:	0017c703          	lbu	a4,1(a5)
    192c:	0785                	addi	a5,a5,1
    192e:	d379                	beqz	a4,18f4 <strlen+0x18>
    1930:	0017c703          	lbu	a4,1(a5)
    1934:	0785                	addi	a5,a5,1
    1936:	fb6d                	bnez	a4,1928 <strlen+0x4c>
    1938:	bf75                	j	18f4 <strlen+0x18>

000000000000193a <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    193a:	00757713          	andi	a4,a0,7
{
    193e:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1940:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1944:	cb19                	beqz	a4,195a <memchr+0x20>
    1946:	ce25                	beqz	a2,19be <memchr+0x84>
    1948:	0007c703          	lbu	a4,0(a5)
    194c:	04b70e63          	beq	a4,a1,19a8 <memchr+0x6e>
    1950:	0785                	addi	a5,a5,1
    1952:	0077f713          	andi	a4,a5,7
    1956:	167d                	addi	a2,a2,-1
    1958:	f77d                	bnez	a4,1946 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    195a:	4501                	li	a0,0
    if (n && *s != c)
    195c:	c235                	beqz	a2,19c0 <memchr+0x86>
    195e:	0007c703          	lbu	a4,0(a5)
    1962:	04b70363          	beq	a4,a1,19a8 <memchr+0x6e>
        size_t k = ONES * c;
    1966:	00000517          	auipc	a0,0x0
    196a:	67a53503          	ld	a0,1658(a0) # 1fe0 <__clone+0xde>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    196e:	471d                	li	a4,7
        size_t k = ONES * c;
    1970:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1974:	02c77a63          	bgeu	a4,a2,19a8 <memchr+0x6e>
    1978:	00000897          	auipc	a7,0x0
    197c:	6588b883          	ld	a7,1624(a7) # 1fd0 <__clone+0xce>
    1980:	00000817          	auipc	a6,0x0
    1984:	65883803          	ld	a6,1624(a6) # 1fd8 <__clone+0xd6>
    1988:	431d                	li	t1,7
    198a:	a029                	j	1994 <memchr+0x5a>
    198c:	1661                	addi	a2,a2,-8
    198e:	07a1                	addi	a5,a5,8
    1990:	02c37963          	bgeu	t1,a2,19c2 <memchr+0x88>
    1994:	6398                	ld	a4,0(a5)
    1996:	8f29                	xor	a4,a4,a0
    1998:	011706b3          	add	a3,a4,a7
    199c:	fff74713          	not	a4,a4
    19a0:	8f75                	and	a4,a4,a3
    19a2:	01077733          	and	a4,a4,a6
    19a6:	d37d                	beqz	a4,198c <memchr+0x52>
{
    19a8:	853e                	mv	a0,a5
    19aa:	97b2                	add	a5,a5,a2
    19ac:	a021                	j	19b4 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    19ae:	0505                	addi	a0,a0,1
    19b0:	00f50763          	beq	a0,a5,19be <memchr+0x84>
    19b4:	00054703          	lbu	a4,0(a0)
    19b8:	feb71be3          	bne	a4,a1,19ae <memchr+0x74>
    19bc:	8082                	ret
    return n ? (void *)s : 0;
    19be:	4501                	li	a0,0
}
    19c0:	8082                	ret
    return n ? (void *)s : 0;
    19c2:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    19c4:	f275                	bnez	a2,19a8 <memchr+0x6e>
}
    19c6:	8082                	ret

00000000000019c8 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19c8:	1101                	addi	sp,sp,-32
    19ca:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19cc:	862e                	mv	a2,a1
{
    19ce:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19d0:	4581                	li	a1,0
{
    19d2:	e426                	sd	s1,8(sp)
    19d4:	ec06                	sd	ra,24(sp)
    19d6:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19d8:	f63ff0ef          	jal	ra,193a <memchr>
    return p ? p - s : n;
    19dc:	c519                	beqz	a0,19ea <strnlen+0x22>
}
    19de:	60e2                	ld	ra,24(sp)
    19e0:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19e2:	8d05                	sub	a0,a0,s1
}
    19e4:	64a2                	ld	s1,8(sp)
    19e6:	6105                	addi	sp,sp,32
    19e8:	8082                	ret
    19ea:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19ec:	8522                	mv	a0,s0
}
    19ee:	6442                	ld	s0,16(sp)
    19f0:	64a2                	ld	s1,8(sp)
    19f2:	6105                	addi	sp,sp,32
    19f4:	8082                	ret

00000000000019f6 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19f6:	00a5c7b3          	xor	a5,a1,a0
    19fa:	8b9d                	andi	a5,a5,7
    19fc:	eb95                	bnez	a5,1a30 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19fe:	0075f793          	andi	a5,a1,7
    1a02:	e7b1                	bnez	a5,1a4e <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a04:	6198                	ld	a4,0(a1)
    1a06:	00000617          	auipc	a2,0x0
    1a0a:	5ca63603          	ld	a2,1482(a2) # 1fd0 <__clone+0xce>
    1a0e:	00000817          	auipc	a6,0x0
    1a12:	5ca83803          	ld	a6,1482(a6) # 1fd8 <__clone+0xd6>
    1a16:	a029                	j	1a20 <strcpy+0x2a>
    1a18:	05a1                	addi	a1,a1,8
    1a1a:	e118                	sd	a4,0(a0)
    1a1c:	6198                	ld	a4,0(a1)
    1a1e:	0521                	addi	a0,a0,8
    1a20:	00c707b3          	add	a5,a4,a2
    1a24:	fff74693          	not	a3,a4
    1a28:	8ff5                	and	a5,a5,a3
    1a2a:	0107f7b3          	and	a5,a5,a6
    1a2e:	d7ed                	beqz	a5,1a18 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a30:	0005c783          	lbu	a5,0(a1)
    1a34:	00f50023          	sb	a5,0(a0)
    1a38:	c785                	beqz	a5,1a60 <strcpy+0x6a>
    1a3a:	0015c783          	lbu	a5,1(a1)
    1a3e:	0505                	addi	a0,a0,1
    1a40:	0585                	addi	a1,a1,1
    1a42:	00f50023          	sb	a5,0(a0)
    1a46:	fbf5                	bnez	a5,1a3a <strcpy+0x44>
        ;
    return d;
}
    1a48:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a4a:	0505                	addi	a0,a0,1
    1a4c:	df45                	beqz	a4,1a04 <strcpy+0xe>
            if (!(*d = *s))
    1a4e:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a52:	0585                	addi	a1,a1,1
    1a54:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1a58:	00f50023          	sb	a5,0(a0)
    1a5c:	f7fd                	bnez	a5,1a4a <strcpy+0x54>
}
    1a5e:	8082                	ret
    1a60:	8082                	ret

0000000000001a62 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a62:	00a5c7b3          	xor	a5,a1,a0
    1a66:	8b9d                	andi	a5,a5,7
    1a68:	1a079863          	bnez	a5,1c18 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a6c:	0075f793          	andi	a5,a1,7
    1a70:	16078463          	beqz	a5,1bd8 <strncpy+0x176>
    1a74:	ea01                	bnez	a2,1a84 <strncpy+0x22>
    1a76:	a421                	j	1c7e <strncpy+0x21c>
    1a78:	167d                	addi	a2,a2,-1
    1a7a:	0505                	addi	a0,a0,1
    1a7c:	14070e63          	beqz	a4,1bd8 <strncpy+0x176>
    1a80:	1a060863          	beqz	a2,1c30 <strncpy+0x1ce>
    1a84:	0005c783          	lbu	a5,0(a1)
    1a88:	0585                	addi	a1,a1,1
    1a8a:	0075f713          	andi	a4,a1,7
    1a8e:	00f50023          	sb	a5,0(a0)
    1a92:	f3fd                	bnez	a5,1a78 <strncpy+0x16>
    1a94:	4805                	li	a6,1
    1a96:	1a061863          	bnez	a2,1c46 <strncpy+0x1e4>
    1a9a:	40a007b3          	neg	a5,a0
    1a9e:	8b9d                	andi	a5,a5,7
    1aa0:	4681                	li	a3,0
    1aa2:	18061a63          	bnez	a2,1c36 <strncpy+0x1d4>
    1aa6:	00778713          	addi	a4,a5,7
    1aaa:	45ad                	li	a1,11
    1aac:	18b76363          	bltu	a4,a1,1c32 <strncpy+0x1d0>
    1ab0:	1ae6eb63          	bltu	a3,a4,1c66 <strncpy+0x204>
    1ab4:	1a078363          	beqz	a5,1c5a <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ab8:	00050023          	sb	zero,0(a0)
    1abc:	4685                	li	a3,1
    1abe:	00150713          	addi	a4,a0,1
    1ac2:	18d78f63          	beq	a5,a3,1c60 <strncpy+0x1fe>
    1ac6:	000500a3          	sb	zero,1(a0)
    1aca:	4689                	li	a3,2
    1acc:	00250713          	addi	a4,a0,2
    1ad0:	18d78e63          	beq	a5,a3,1c6c <strncpy+0x20a>
    1ad4:	00050123          	sb	zero,2(a0)
    1ad8:	468d                	li	a3,3
    1ada:	00350713          	addi	a4,a0,3
    1ade:	16d78c63          	beq	a5,a3,1c56 <strncpy+0x1f4>
    1ae2:	000501a3          	sb	zero,3(a0)
    1ae6:	4691                	li	a3,4
    1ae8:	00450713          	addi	a4,a0,4
    1aec:	18d78263          	beq	a5,a3,1c70 <strncpy+0x20e>
    1af0:	00050223          	sb	zero,4(a0)
    1af4:	4695                	li	a3,5
    1af6:	00550713          	addi	a4,a0,5
    1afa:	16d78d63          	beq	a5,a3,1c74 <strncpy+0x212>
    1afe:	000502a3          	sb	zero,5(a0)
    1b02:	469d                	li	a3,7
    1b04:	00650713          	addi	a4,a0,6
    1b08:	16d79863          	bne	a5,a3,1c78 <strncpy+0x216>
    1b0c:	00750713          	addi	a4,a0,7
    1b10:	00050323          	sb	zero,6(a0)
    1b14:	40f80833          	sub	a6,a6,a5
    1b18:	ff887593          	andi	a1,a6,-8
    1b1c:	97aa                	add	a5,a5,a0
    1b1e:	95be                	add	a1,a1,a5
    1b20:	0007b023          	sd	zero,0(a5)
    1b24:	07a1                	addi	a5,a5,8
    1b26:	feb79de3          	bne	a5,a1,1b20 <strncpy+0xbe>
    1b2a:	ff887593          	andi	a1,a6,-8
    1b2e:	9ead                	addw	a3,a3,a1
    1b30:	00b707b3          	add	a5,a4,a1
    1b34:	12b80863          	beq	a6,a1,1c64 <strncpy+0x202>
    1b38:	00078023          	sb	zero,0(a5)
    1b3c:	0016871b          	addiw	a4,a3,1
    1b40:	0ec77863          	bgeu	a4,a2,1c30 <strncpy+0x1ce>
    1b44:	000780a3          	sb	zero,1(a5)
    1b48:	0026871b          	addiw	a4,a3,2
    1b4c:	0ec77263          	bgeu	a4,a2,1c30 <strncpy+0x1ce>
    1b50:	00078123          	sb	zero,2(a5)
    1b54:	0036871b          	addiw	a4,a3,3
    1b58:	0cc77c63          	bgeu	a4,a2,1c30 <strncpy+0x1ce>
    1b5c:	000781a3          	sb	zero,3(a5)
    1b60:	0046871b          	addiw	a4,a3,4
    1b64:	0cc77663          	bgeu	a4,a2,1c30 <strncpy+0x1ce>
    1b68:	00078223          	sb	zero,4(a5)
    1b6c:	0056871b          	addiw	a4,a3,5
    1b70:	0cc77063          	bgeu	a4,a2,1c30 <strncpy+0x1ce>
    1b74:	000782a3          	sb	zero,5(a5)
    1b78:	0066871b          	addiw	a4,a3,6
    1b7c:	0ac77a63          	bgeu	a4,a2,1c30 <strncpy+0x1ce>
    1b80:	00078323          	sb	zero,6(a5)
    1b84:	0076871b          	addiw	a4,a3,7
    1b88:	0ac77463          	bgeu	a4,a2,1c30 <strncpy+0x1ce>
    1b8c:	000783a3          	sb	zero,7(a5)
    1b90:	0086871b          	addiw	a4,a3,8
    1b94:	08c77e63          	bgeu	a4,a2,1c30 <strncpy+0x1ce>
    1b98:	00078423          	sb	zero,8(a5)
    1b9c:	0096871b          	addiw	a4,a3,9
    1ba0:	08c77863          	bgeu	a4,a2,1c30 <strncpy+0x1ce>
    1ba4:	000784a3          	sb	zero,9(a5)
    1ba8:	00a6871b          	addiw	a4,a3,10
    1bac:	08c77263          	bgeu	a4,a2,1c30 <strncpy+0x1ce>
    1bb0:	00078523          	sb	zero,10(a5)
    1bb4:	00b6871b          	addiw	a4,a3,11
    1bb8:	06c77c63          	bgeu	a4,a2,1c30 <strncpy+0x1ce>
    1bbc:	000785a3          	sb	zero,11(a5)
    1bc0:	00c6871b          	addiw	a4,a3,12
    1bc4:	06c77663          	bgeu	a4,a2,1c30 <strncpy+0x1ce>
    1bc8:	00078623          	sb	zero,12(a5)
    1bcc:	26b5                	addiw	a3,a3,13
    1bce:	06c6f163          	bgeu	a3,a2,1c30 <strncpy+0x1ce>
    1bd2:	000786a3          	sb	zero,13(a5)
    1bd6:	8082                	ret
            ;
        if (!n || !*s)
    1bd8:	c645                	beqz	a2,1c80 <strncpy+0x21e>
    1bda:	0005c783          	lbu	a5,0(a1)
    1bde:	ea078be3          	beqz	a5,1a94 <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1be2:	479d                	li	a5,7
    1be4:	02c7ff63          	bgeu	a5,a2,1c22 <strncpy+0x1c0>
    1be8:	00000897          	auipc	a7,0x0
    1bec:	3e88b883          	ld	a7,1000(a7) # 1fd0 <__clone+0xce>
    1bf0:	00000817          	auipc	a6,0x0
    1bf4:	3e883803          	ld	a6,1000(a6) # 1fd8 <__clone+0xd6>
    1bf8:	431d                	li	t1,7
    1bfa:	6198                	ld	a4,0(a1)
    1bfc:	011707b3          	add	a5,a4,a7
    1c00:	fff74693          	not	a3,a4
    1c04:	8ff5                	and	a5,a5,a3
    1c06:	0107f7b3          	and	a5,a5,a6
    1c0a:	ef81                	bnez	a5,1c22 <strncpy+0x1c0>
            *wd = *ws;
    1c0c:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1c0e:	1661                	addi	a2,a2,-8
    1c10:	05a1                	addi	a1,a1,8
    1c12:	0521                	addi	a0,a0,8
    1c14:	fec363e3          	bltu	t1,a2,1bfa <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1c18:	e609                	bnez	a2,1c22 <strncpy+0x1c0>
    1c1a:	a08d                	j	1c7c <strncpy+0x21a>
    1c1c:	167d                	addi	a2,a2,-1
    1c1e:	0505                	addi	a0,a0,1
    1c20:	ca01                	beqz	a2,1c30 <strncpy+0x1ce>
    1c22:	0005c783          	lbu	a5,0(a1)
    1c26:	0585                	addi	a1,a1,1
    1c28:	00f50023          	sb	a5,0(a0)
    1c2c:	fbe5                	bnez	a5,1c1c <strncpy+0x1ba>
        ;
tail:
    1c2e:	b59d                	j	1a94 <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1c30:	8082                	ret
    1c32:	472d                	li	a4,11
    1c34:	bdb5                	j	1ab0 <strncpy+0x4e>
    1c36:	00778713          	addi	a4,a5,7
    1c3a:	45ad                	li	a1,11
    1c3c:	fff60693          	addi	a3,a2,-1
    1c40:	e6b778e3          	bgeu	a4,a1,1ab0 <strncpy+0x4e>
    1c44:	b7fd                	j	1c32 <strncpy+0x1d0>
    1c46:	40a007b3          	neg	a5,a0
    1c4a:	8832                	mv	a6,a2
    1c4c:	8b9d                	andi	a5,a5,7
    1c4e:	4681                	li	a3,0
    1c50:	e4060be3          	beqz	a2,1aa6 <strncpy+0x44>
    1c54:	b7cd                	j	1c36 <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c56:	468d                	li	a3,3
    1c58:	bd75                	j	1b14 <strncpy+0xb2>
    1c5a:	872a                	mv	a4,a0
    1c5c:	4681                	li	a3,0
    1c5e:	bd5d                	j	1b14 <strncpy+0xb2>
    1c60:	4685                	li	a3,1
    1c62:	bd4d                	j	1b14 <strncpy+0xb2>
    1c64:	8082                	ret
    1c66:	87aa                	mv	a5,a0
    1c68:	4681                	li	a3,0
    1c6a:	b5f9                	j	1b38 <strncpy+0xd6>
    1c6c:	4689                	li	a3,2
    1c6e:	b55d                	j	1b14 <strncpy+0xb2>
    1c70:	4691                	li	a3,4
    1c72:	b54d                	j	1b14 <strncpy+0xb2>
    1c74:	4695                	li	a3,5
    1c76:	bd79                	j	1b14 <strncpy+0xb2>
    1c78:	4699                	li	a3,6
    1c7a:	bd69                	j	1b14 <strncpy+0xb2>
    1c7c:	8082                	ret
    1c7e:	8082                	ret
    1c80:	8082                	ret

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
    1d56:	1141                	addi	sp,sp,-16
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
    1d7c:	0141                	addi	sp,sp,16
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
    1d9c:	1141                	addi	sp,sp,-16
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
    1db2:	0141                	addi	sp,sp,16
    1db4:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1db6:	4502                	lw	a0,0(sp)
}
    1db8:	0141                	addi	sp,sp,16
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
    1e22:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e24:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e28:	9301                	srli	a4,a4,0x20
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
    1e32:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e34:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e38:	9201                	srli	a2,a2,0x20
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
    1ea2:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ea4:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1ea8:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1eac:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1eae:	9201                	srli	a2,a2,0x20
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
    1f02:	15c1                	addi	a1,a1,-16
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
