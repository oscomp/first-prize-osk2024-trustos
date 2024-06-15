
/root/oskernel2024-trustos/pre_ctests/build/riscv64/getdents:     file format elf64-littleriscv


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
    1004:	1101                	add	sp,sp,-32
  TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f2a50513          	add	a0,a0,-214 # 1f30 <__clone+0x2a>
void test_getdents(void) {
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
    1012:	e426                	sd	s1,8(sp)
  TEST_START(__func__);
    1014:	308000ef          	jal	131c <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	1b850513          	add	a0,a0,440 # 21d0 <__func__.0>
    1020:	2fc000ef          	jal	131c <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	f2450513          	add	a0,a0,-220 # 1f48 <__clone+0x42>
    102c:	2f0000ef          	jal	131c <puts>
  int fd, nread;
  struct linux_dirent64 *dirp64;
  dirp64 = buf;
  // fd = open(".", O_DIRECTORY);
  fd = open(".", O_RDONLY);
    1030:	4581                	li	a1,0
    1032:	00001517          	auipc	a0,0x1
    1036:	f2650513          	add	a0,a0,-218 # 1f58 <__clone+0x52>
    103a:	44d000ef          	jal	1c86 <open>
  printf("open fd:%d\n", fd);
    103e:	85aa                	mv	a1,a0
  fd = open(".", O_RDONLY);
    1040:	842a                	mv	s0,a0
  printf("open fd:%d\n", fd);
    1042:	00001517          	auipc	a0,0x1
    1046:	f1e50513          	add	a0,a0,-226 # 1f60 <__clone+0x5a>
    104a:	2f4000ef          	jal	133e <printf>

  nread = getdents(fd, dirp64, 512);
    104e:	20000613          	li	a2,512
    1052:	00001597          	auipc	a1,0x1
    1056:	f7e58593          	add	a1,a1,-130 # 1fd0 <buf>
    105a:	8522                	mv	a0,s0
    105c:	661000ef          	jal	1ebc <getdents>
  printf("getdents fd:%d\n", nread);
    1060:	85aa                	mv	a1,a0
  nread = getdents(fd, dirp64, 512);
    1062:	84aa                	mv	s1,a0
  printf("getdents fd:%d\n", nread);
    1064:	00001517          	auipc	a0,0x1
    1068:	f0c50513          	add	a0,a0,-244 # 1f70 <__clone+0x6a>
    106c:	2d2000ef          	jal	133e <printf>
  assert(nread != -1);
    1070:	57fd                	li	a5,-1
    1072:	04f48a63          	beq	s1,a5,10c6 <test_getdents+0xc2>
  printf("getdents success.\n%s\n", dirp64->d_name);
    1076:	00001597          	auipc	a1,0x1
    107a:	f6d58593          	add	a1,a1,-147 # 1fe3 <buf+0x13>
    107e:	00001517          	auipc	a0,0x1
    1082:	f2250513          	add	a0,a0,-222 # 1fa0 <__clone+0x9a>
    1086:	2b8000ef          	jal	133e <printf>
      printf(  "%s\t", d->d_name);
      bpos += d->d_reclen;
  }
  */

  printf("\n");
    108a:	00001517          	auipc	a0,0x1
    108e:	f0e50513          	add	a0,a0,-242 # 1f98 <__clone+0x92>
    1092:	2ac000ef          	jal	133e <printf>
  close(fd);
    1096:	8522                	mv	a0,s0
    1098:	421000ef          	jal	1cb8 <close>
  TEST_END(__func__);
    109c:	00001517          	auipc	a0,0x1
    10a0:	f1c50513          	add	a0,a0,-228 # 1fb8 <__clone+0xb2>
    10a4:	278000ef          	jal	131c <puts>
    10a8:	00001517          	auipc	a0,0x1
    10ac:	12850513          	add	a0,a0,296 # 21d0 <__func__.0>
    10b0:	26c000ef          	jal	131c <puts>
}
    10b4:	6442                	ld	s0,16(sp)
    10b6:	60e2                	ld	ra,24(sp)
    10b8:	64a2                	ld	s1,8(sp)
  TEST_END(__func__);
    10ba:	00001517          	auipc	a0,0x1
    10be:	e8e50513          	add	a0,a0,-370 # 1f48 <__clone+0x42>
}
    10c2:	6105                	add	sp,sp,32
  TEST_END(__func__);
    10c4:	aca1                	j	131c <puts>
  assert(nread != -1);
    10c6:	00001517          	auipc	a0,0x1
    10ca:	eba50513          	add	a0,a0,-326 # 1f80 <__clone+0x7a>
    10ce:	4ee000ef          	jal	15bc <panic>
    10d2:	b755                	j	1076 <test_getdents+0x72>

00000000000010d4 <main>:

int main(void) {
    10d4:	1141                	add	sp,sp,-16
    10d6:	e406                	sd	ra,8(sp)
  test_getdents();
    10d8:	f2dff0ef          	jal	1004 <test_getdents>
  return 0;
}
    10dc:	60a2                	ld	ra,8(sp)
    10de:	4501                	li	a0,0
    10e0:	0141                	add	sp,sp,16
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
    10e8:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10ea:	05a1                	add	a1,a1,8
{
    10ec:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10ee:	fe7ff0ef          	jal	10d4 <main>
    10f2:	42d000ef          	jal	1d1e <exit>
	return 0;
}
    10f6:	60a2                	ld	ra,8(sp)
    10f8:	4501                	li	a0,0
    10fa:	0141                	add	sp,sp,16
    10fc:	8082                	ret

00000000000010fe <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10fe:	7179                	add	sp,sp,-48
    1100:	f406                	sd	ra,40(sp)
    1102:	0005081b          	sext.w	a6,a0
    1106:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1108:	00055563          	bgez	a0,1112 <printint.constprop.0+0x14>
        x = -xx;
    110c:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    1110:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1112:	02b8763b          	remuw	a2,a6,a1
    1116:	00001697          	auipc	a3,0x1
    111a:	0ca68693          	add	a3,a3,202 # 21e0 <digits>
    buf[16] = 0;
    111e:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1122:	0005871b          	sext.w	a4,a1
    1126:	1602                	sll	a2,a2,0x20
    1128:	9201                	srl	a2,a2,0x20
    112a:	9636                	add	a2,a2,a3
    112c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1130:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    1134:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1138:	10b86c63          	bltu	a6,a1,1250 <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    113c:	02e5763b          	remuw	a2,a0,a4
    1140:	1602                	sll	a2,a2,0x20
    1142:	9201                	srl	a2,a2,0x20
    1144:	9636                	add	a2,a2,a3
    1146:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    114a:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    114e:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1152:	10e56863          	bltu	a0,a4,1262 <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    1156:	02e5f63b          	remuw	a2,a1,a4
    115a:	1602                	sll	a2,a2,0x20
    115c:	9201                	srl	a2,a2,0x20
    115e:	9636                	add	a2,a2,a3
    1160:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1164:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1168:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    116c:	10e5e463          	bltu	a1,a4,1274 <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    1170:	02e5763b          	remuw	a2,a0,a4
    1174:	1602                	sll	a2,a2,0x20
    1176:	9201                	srl	a2,a2,0x20
    1178:	9636                	add	a2,a2,a3
    117a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    117e:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1182:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1186:	10e56063          	bltu	a0,a4,1286 <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    118a:	02e5f63b          	remuw	a2,a1,a4
    118e:	1602                	sll	a2,a2,0x20
    1190:	9201                	srl	a2,a2,0x20
    1192:	9636                	add	a2,a2,a3
    1194:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1198:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    119c:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    11a0:	0ee5ec63          	bltu	a1,a4,1298 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11a4:	02e5763b          	remuw	a2,a0,a4
    11a8:	1602                	sll	a2,a2,0x20
    11aa:	9201                	srl	a2,a2,0x20
    11ac:	9636                	add	a2,a2,a3
    11ae:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b2:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11b6:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11ba:	08e56263          	bltu	a0,a4,123e <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    11be:	02e5f63b          	remuw	a2,a1,a4
    11c2:	1602                	sll	a2,a2,0x20
    11c4:	9201                	srl	a2,a2,0x20
    11c6:	9636                	add	a2,a2,a3
    11c8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11cc:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11d0:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11d4:	0ce5eb63          	bltu	a1,a4,12aa <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    11d8:	02e5763b          	remuw	a2,a0,a4
    11dc:	1602                	sll	a2,a2,0x20
    11de:	9201                	srl	a2,a2,0x20
    11e0:	9636                	add	a2,a2,a3
    11e2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11e6:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11ea:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11ee:	0ce56763          	bltu	a0,a4,12bc <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    11f2:	02e5f63b          	remuw	a2,a1,a4
    11f6:	1602                	sll	a2,a2,0x20
    11f8:	9201                	srl	a2,a2,0x20
    11fa:	9636                	add	a2,a2,a3
    11fc:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1200:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1204:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    1208:	0ce5e363          	bltu	a1,a4,12ce <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    120c:	1782                	sll	a5,a5,0x20
    120e:	9381                	srl	a5,a5,0x20
    1210:	96be                	add	a3,a3,a5
    1212:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    1216:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    1218:	00f10723          	sb	a5,14(sp)
    if (sign)
    121c:	00088763          	beqz	a7,122a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1220:	02d00793          	li	a5,45
    1224:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1228:	4595                	li	a1,5
    write(f, s, l);
    122a:	003c                	add	a5,sp,8
    122c:	4641                	li	a2,16
    122e:	9e0d                	subw	a2,a2,a1
    1230:	4505                	li	a0,1
    1232:	95be                	add	a1,a1,a5
    1234:	29b000ef          	jal	1cce <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1238:	70a2                	ld	ra,40(sp)
    123a:	6145                	add	sp,sp,48
    123c:	8082                	ret
    i++;
    123e:	45a9                	li	a1,10
    if (sign)
    1240:	fe0885e3          	beqz	a7,122a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1244:	02d00793          	li	a5,45
    1248:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    124c:	45a5                	li	a1,9
    124e:	bff1                	j	122a <printint.constprop.0+0x12c>
    i++;
    1250:	45bd                	li	a1,15
    if (sign)
    1252:	fc088ce3          	beqz	a7,122a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1256:	02d00793          	li	a5,45
    125a:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    125e:	45b9                	li	a1,14
    1260:	b7e9                	j	122a <printint.constprop.0+0x12c>
    i++;
    1262:	45b9                	li	a1,14
    if (sign)
    1264:	fc0883e3          	beqz	a7,122a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1268:	02d00793          	li	a5,45
    126c:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1270:	45b5                	li	a1,13
    1272:	bf65                	j	122a <printint.constprop.0+0x12c>
    i++;
    1274:	45b5                	li	a1,13
    if (sign)
    1276:	fa088ae3          	beqz	a7,122a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    127a:	02d00793          	li	a5,45
    127e:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1282:	45b1                	li	a1,12
    1284:	b75d                	j	122a <printint.constprop.0+0x12c>
    i++;
    1286:	45b1                	li	a1,12
    if (sign)
    1288:	fa0881e3          	beqz	a7,122a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    128c:	02d00793          	li	a5,45
    1290:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1294:	45ad                	li	a1,11
    1296:	bf51                	j	122a <printint.constprop.0+0x12c>
    i++;
    1298:	45ad                	li	a1,11
    if (sign)
    129a:	f80888e3          	beqz	a7,122a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    129e:	02d00793          	li	a5,45
    12a2:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12a6:	45a9                	li	a1,10
    12a8:	b749                	j	122a <printint.constprop.0+0x12c>
    i++;
    12aa:	45a5                	li	a1,9
    if (sign)
    12ac:	f6088fe3          	beqz	a7,122a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12b0:	02d00793          	li	a5,45
    12b4:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12b8:	45a1                	li	a1,8
    12ba:	bf85                	j	122a <printint.constprop.0+0x12c>
    i++;
    12bc:	45a1                	li	a1,8
    if (sign)
    12be:	f60886e3          	beqz	a7,122a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12c2:	02d00793          	li	a5,45
    12c6:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12ca:	459d                	li	a1,7
    12cc:	bfb9                	j	122a <printint.constprop.0+0x12c>
    i++;
    12ce:	459d                	li	a1,7
    if (sign)
    12d0:	f4088de3          	beqz	a7,122a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12d4:	02d00793          	li	a5,45
    12d8:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12dc:	4599                	li	a1,6
    12de:	b7b1                	j	122a <printint.constprop.0+0x12c>

00000000000012e0 <getchar>:
{
    12e0:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12e2:	00f10593          	add	a1,sp,15
    12e6:	4605                	li	a2,1
    12e8:	4501                	li	a0,0
{
    12ea:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12ec:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12f0:	1d5000ef          	jal	1cc4 <read>
}
    12f4:	60e2                	ld	ra,24(sp)
    12f6:	00f14503          	lbu	a0,15(sp)
    12fa:	6105                	add	sp,sp,32
    12fc:	8082                	ret

00000000000012fe <putchar>:
{
    12fe:	1101                	add	sp,sp,-32
    1300:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1302:	00f10593          	add	a1,sp,15
    1306:	4605                	li	a2,1
    1308:	4505                	li	a0,1
{
    130a:	ec06                	sd	ra,24(sp)
    char byte = c;
    130c:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1310:	1bf000ef          	jal	1cce <write>
}
    1314:	60e2                	ld	ra,24(sp)
    1316:	2501                	sext.w	a0,a0
    1318:	6105                	add	sp,sp,32
    131a:	8082                	ret

000000000000131c <puts>:
{
    131c:	1141                	add	sp,sp,-16
    131e:	e406                	sd	ra,8(sp)
    1320:	e022                	sd	s0,0(sp)
    1322:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1324:	56c000ef          	jal	1890 <strlen>
    1328:	862a                	mv	a2,a0
    132a:	85a2                	mv	a1,s0
    132c:	4505                	li	a0,1
    132e:	1a1000ef          	jal	1cce <write>
}
    1332:	60a2                	ld	ra,8(sp)
    1334:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1336:	957d                	sra	a0,a0,0x3f
    return r;
    1338:	2501                	sext.w	a0,a0
}
    133a:	0141                	add	sp,sp,16
    133c:	8082                	ret

000000000000133e <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    133e:	7131                	add	sp,sp,-192
    1340:	e4d6                	sd	s5,72(sp)
    1342:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    1344:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1346:	013c                	add	a5,sp,136
{
    1348:	f0ca                	sd	s2,96(sp)
    134a:	ecce                	sd	s3,88(sp)
    134c:	e8d2                	sd	s4,80(sp)
    134e:	e0da                	sd	s6,64(sp)
    1350:	fc5e                	sd	s7,56(sp)
    1352:	fc86                	sd	ra,120(sp)
    1354:	f8a2                	sd	s0,112(sp)
    1356:	f4a6                	sd	s1,104(sp)
    1358:	e52e                	sd	a1,136(sp)
    135a:	e932                	sd	a2,144(sp)
    135c:	ed36                	sd	a3,152(sp)
    135e:	f13a                	sd	a4,160(sp)
    1360:	f942                	sd	a6,176(sp)
    1362:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1364:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1366:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    136a:	07300a13          	li	s4,115
    136e:	07800b93          	li	s7,120
    1372:	06400b13          	li	s6,100
    buf[i++] = '0';
    1376:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x5650>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    137a:	00001997          	auipc	s3,0x1
    137e:	e6698993          	add	s3,s3,-410 # 21e0 <digits>
        if (!*s)
    1382:	00054783          	lbu	a5,0(a0)
    1386:	16078863          	beqz	a5,14f6 <printf+0x1b8>
    138a:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    138c:	19278063          	beq	a5,s2,150c <printf+0x1ce>
    1390:	00164783          	lbu	a5,1(a2)
    1394:	0605                	add	a2,a2,1
    1396:	fbfd                	bnez	a5,138c <printf+0x4e>
    1398:	84b2                	mv	s1,a2
        l = z - a;
    139a:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    139e:	85aa                	mv	a1,a0
    13a0:	8622                	mv	a2,s0
    13a2:	4505                	li	a0,1
    13a4:	12b000ef          	jal	1cce <write>
        if (l)
    13a8:	18041763          	bnez	s0,1536 <printf+0x1f8>
        if (s[1] == 0)
    13ac:	0014c783          	lbu	a5,1(s1)
    13b0:	14078363          	beqz	a5,14f6 <printf+0x1b8>
        switch (s[1])
    13b4:	19478f63          	beq	a5,s4,1552 <printf+0x214>
    13b8:	18fa6163          	bltu	s4,a5,153a <printf+0x1fc>
    13bc:	1b678e63          	beq	a5,s6,1578 <printf+0x23a>
    13c0:	07000713          	li	a4,112
    13c4:	1ce79463          	bne	a5,a4,158c <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13c8:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13ca:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13ce:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13d0:	631c                	ld	a5,0(a4)
    13d2:	0721                	add	a4,a4,8
    13d4:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13d6:	00479293          	sll	t0,a5,0x4
    13da:	00879f93          	sll	t6,a5,0x8
    13de:	00c79f13          	sll	t5,a5,0xc
    13e2:	01079e93          	sll	t4,a5,0x10
    13e6:	01479e13          	sll	t3,a5,0x14
    13ea:	01879313          	sll	t1,a5,0x18
    13ee:	01c79893          	sll	a7,a5,0x1c
    13f2:	02479813          	sll	a6,a5,0x24
    13f6:	02879513          	sll	a0,a5,0x28
    13fa:	02c79593          	sll	a1,a5,0x2c
    13fe:	03079693          	sll	a3,a5,0x30
    1402:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1406:	03c7d413          	srl	s0,a5,0x3c
    140a:	01c7d39b          	srlw	t2,a5,0x1c
    140e:	03c2d293          	srl	t0,t0,0x3c
    1412:	03cfdf93          	srl	t6,t6,0x3c
    1416:	03cf5f13          	srl	t5,t5,0x3c
    141a:	03cede93          	srl	t4,t4,0x3c
    141e:	03ce5e13          	srl	t3,t3,0x3c
    1422:	03c35313          	srl	t1,t1,0x3c
    1426:	03c8d893          	srl	a7,a7,0x3c
    142a:	03c85813          	srl	a6,a6,0x3c
    142e:	9171                	srl	a0,a0,0x3c
    1430:	91f1                	srl	a1,a1,0x3c
    1432:	92f1                	srl	a3,a3,0x3c
    1434:	9371                	srl	a4,a4,0x3c
    1436:	974e                	add	a4,a4,s3
    1438:	944e                	add	s0,s0,s3
    143a:	92ce                	add	t0,t0,s3
    143c:	9fce                	add	t6,t6,s3
    143e:	9f4e                	add	t5,t5,s3
    1440:	9ece                	add	t4,t4,s3
    1442:	9e4e                	add	t3,t3,s3
    1444:	934e                	add	t1,t1,s3
    1446:	98ce                	add	a7,a7,s3
    1448:	93ce                	add	t2,t2,s3
    144a:	984e                	add	a6,a6,s3
    144c:	954e                	add	a0,a0,s3
    144e:	95ce                	add	a1,a1,s3
    1450:	96ce                	add	a3,a3,s3
    1452:	00074083          	lbu	ra,0(a4)
    1456:	0002c283          	lbu	t0,0(t0)
    145a:	000fcf83          	lbu	t6,0(t6)
    145e:	000f4f03          	lbu	t5,0(t5)
    1462:	000ece83          	lbu	t4,0(t4)
    1466:	000e4e03          	lbu	t3,0(t3)
    146a:	00034303          	lbu	t1,0(t1)
    146e:	0008c883          	lbu	a7,0(a7)
    1472:	0003c383          	lbu	t2,0(t2)
    1476:	00084803          	lbu	a6,0(a6)
    147a:	00054503          	lbu	a0,0(a0)
    147e:	0005c583          	lbu	a1,0(a1)
    1482:	0006c683          	lbu	a3,0(a3)
    1486:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    148a:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    148e:	9371                	srl	a4,a4,0x3c
    1490:	8bbd                	and	a5,a5,15
    1492:	974e                	add	a4,a4,s3
    1494:	97ce                	add	a5,a5,s3
    1496:	005105a3          	sb	t0,11(sp)
    149a:	01f10623          	sb	t6,12(sp)
    149e:	01e106a3          	sb	t5,13(sp)
    14a2:	01d10723          	sb	t4,14(sp)
    14a6:	01c107a3          	sb	t3,15(sp)
    14aa:	00610823          	sb	t1,16(sp)
    14ae:	011108a3          	sb	a7,17(sp)
    14b2:	00710923          	sb	t2,18(sp)
    14b6:	010109a3          	sb	a6,19(sp)
    14ba:	00a10a23          	sb	a0,20(sp)
    14be:	00b10aa3          	sb	a1,21(sp)
    14c2:	00d10b23          	sb	a3,22(sp)
    14c6:	00110ba3          	sb	ra,23(sp)
    14ca:	00810523          	sb	s0,10(sp)
    14ce:	00074703          	lbu	a4,0(a4)
    14d2:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14d6:	002c                	add	a1,sp,8
    14d8:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14da:	00e10c23          	sb	a4,24(sp)
    14de:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14e2:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14e6:	7e8000ef          	jal	1cce <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14ea:	00248513          	add	a0,s1,2
        if (!*s)
    14ee:	00054783          	lbu	a5,0(a0)
    14f2:	e8079ce3          	bnez	a5,138a <printf+0x4c>
    }
    va_end(ap);
}
    14f6:	70e6                	ld	ra,120(sp)
    14f8:	7446                	ld	s0,112(sp)
    14fa:	74a6                	ld	s1,104(sp)
    14fc:	7906                	ld	s2,96(sp)
    14fe:	69e6                	ld	s3,88(sp)
    1500:	6a46                	ld	s4,80(sp)
    1502:	6aa6                	ld	s5,72(sp)
    1504:	6b06                	ld	s6,64(sp)
    1506:	7be2                	ld	s7,56(sp)
    1508:	6129                	add	sp,sp,192
    150a:	8082                	ret
    150c:	84b2                	mv	s1,a2
    150e:	a039                	j	151c <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1510:	0024c783          	lbu	a5,2(s1)
    1514:	0605                	add	a2,a2,1
    1516:	0489                	add	s1,s1,2
    1518:	e92791e3          	bne	a5,s2,139a <printf+0x5c>
    151c:	0014c783          	lbu	a5,1(s1)
    1520:	ff2788e3          	beq	a5,s2,1510 <printf+0x1d2>
        l = z - a;
    1524:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1528:	85aa                	mv	a1,a0
    152a:	8622                	mv	a2,s0
    152c:	4505                	li	a0,1
    152e:	7a0000ef          	jal	1cce <write>
        if (l)
    1532:	e6040de3          	beqz	s0,13ac <printf+0x6e>
    1536:	8526                	mv	a0,s1
    1538:	b5a9                	j	1382 <printf+0x44>
        switch (s[1])
    153a:	05779963          	bne	a5,s7,158c <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    153e:	6782                	ld	a5,0(sp)
    1540:	45c1                	li	a1,16
    1542:	4388                	lw	a0,0(a5)
    1544:	07a1                	add	a5,a5,8
    1546:	e03e                	sd	a5,0(sp)
    1548:	bb7ff0ef          	jal	10fe <printint.constprop.0>
        s += 2;
    154c:	00248513          	add	a0,s1,2
    1550:	bf79                	j	14ee <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    1552:	6782                	ld	a5,0(sp)
    1554:	6380                	ld	s0,0(a5)
    1556:	07a1                	add	a5,a5,8
    1558:	e03e                	sd	a5,0(sp)
    155a:	cc21                	beqz	s0,15b2 <printf+0x274>
            l = strnlen(a, 200);
    155c:	0c800593          	li	a1,200
    1560:	8522                	mv	a0,s0
    1562:	460000ef          	jal	19c2 <strnlen>
    write(f, s, l);
    1566:	0005061b          	sext.w	a2,a0
    156a:	85a2                	mv	a1,s0
    156c:	4505                	li	a0,1
    156e:	760000ef          	jal	1cce <write>
        s += 2;
    1572:	00248513          	add	a0,s1,2
    1576:	bfa5                	j	14ee <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    1578:	6782                	ld	a5,0(sp)
    157a:	45a9                	li	a1,10
    157c:	4388                	lw	a0,0(a5)
    157e:	07a1                	add	a5,a5,8
    1580:	e03e                	sd	a5,0(sp)
    1582:	b7dff0ef          	jal	10fe <printint.constprop.0>
        s += 2;
    1586:	00248513          	add	a0,s1,2
    158a:	b795                	j	14ee <printf+0x1b0>
    return write(stdout, &byte, 1);
    158c:	4605                	li	a2,1
    158e:	002c                	add	a1,sp,8
    1590:	4505                	li	a0,1
    char byte = c;
    1592:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1596:	738000ef          	jal	1cce <write>
    char byte = c;
    159a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    159e:	4605                	li	a2,1
    15a0:	002c                	add	a1,sp,8
    15a2:	4505                	li	a0,1
    char byte = c;
    15a4:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15a8:	726000ef          	jal	1cce <write>
        s += 2;
    15ac:	00248513          	add	a0,s1,2
    15b0:	bf3d                	j	14ee <printf+0x1b0>
                a = "(null)";
    15b2:	00001417          	auipc	s0,0x1
    15b6:	a1640413          	add	s0,s0,-1514 # 1fc8 <__clone+0xc2>
    15ba:	b74d                	j	155c <printf+0x21e>

00000000000015bc <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15bc:	1141                	add	sp,sp,-16
    15be:	e406                	sd	ra,8(sp)
    puts(m);
    15c0:	d5dff0ef          	jal	131c <puts>
    exit(-100);
}
    15c4:	60a2                	ld	ra,8(sp)
    exit(-100);
    15c6:	f9c00513          	li	a0,-100
}
    15ca:	0141                	add	sp,sp,16
    exit(-100);
    15cc:	af89                	j	1d1e <exit>

00000000000015ce <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ce:	02000793          	li	a5,32
    15d2:	00f50663          	beq	a0,a5,15de <isspace+0x10>
    15d6:	355d                	addw	a0,a0,-9
    15d8:	00553513          	sltiu	a0,a0,5
    15dc:	8082                	ret
    15de:	4505                	li	a0,1
}
    15e0:	8082                	ret

00000000000015e2 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15e2:	fd05051b          	addw	a0,a0,-48
}
    15e6:	00a53513          	sltiu	a0,a0,10
    15ea:	8082                	ret

00000000000015ec <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ec:	02000713          	li	a4,32
    15f0:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15f2:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15f6:	ff76879b          	addw	a5,a3,-9
    15fa:	06e68063          	beq	a3,a4,165a <atoi+0x6e>
    15fe:	0006859b          	sext.w	a1,a3
    1602:	04f67c63          	bgeu	a2,a5,165a <atoi+0x6e>
        s++;
    switch (*s)
    1606:	02b00793          	li	a5,43
    160a:	06f68563          	beq	a3,a5,1674 <atoi+0x88>
    160e:	02d00793          	li	a5,45
    1612:	04f69663          	bne	a3,a5,165e <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1616:	00154683          	lbu	a3,1(a0)
    161a:	47a5                	li	a5,9
        s++;
    161c:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1620:	fd06869b          	addw	a3,a3,-48
    1624:	8636                	mv	a2,a3
    while (isdigit(*s))
    1626:	04d7e563          	bltu	a5,a3,1670 <atoi+0x84>
        neg = 1;
    162a:	4885                	li	a7,1
    int n = 0, neg = 0;
    162c:	4501                	li	a0,0
    while (isdigit(*s))
    162e:	4825                	li	a6,9
    1630:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1634:	0025179b          	sllw	a5,a0,0x2
    1638:	9fa9                	addw	a5,a5,a0
    163a:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    163e:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    1642:	85b2                	mv	a1,a2
    1644:	40c7853b          	subw	a0,a5,a2
    1648:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    164a:	8636                	mv	a2,a3
    while (isdigit(*s))
    164c:	fed872e3          	bgeu	a6,a3,1630 <atoi+0x44>
    return neg ? n : -n;
    1650:	02089163          	bnez	a7,1672 <atoi+0x86>
    1654:	40f5853b          	subw	a0,a1,a5
    1658:	8082                	ret
        s++;
    165a:	0505                	add	a0,a0,1
    165c:	bf59                	j	15f2 <atoi+0x6>
    while (isdigit(*s))
    165e:	fd05859b          	addw	a1,a1,-48
    1662:	47a5                	li	a5,9
    1664:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1666:	4881                	li	a7,0
    1668:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    166c:	fcb7f0e3          	bgeu	a5,a1,162c <atoi+0x40>
    return neg ? n : -n;
    1670:	4501                	li	a0,0
}
    1672:	8082                	ret
    while (isdigit(*s))
    1674:	00154683          	lbu	a3,1(a0)
    1678:	47a5                	li	a5,9
        s++;
    167a:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    167e:	fd06869b          	addw	a3,a3,-48
    1682:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    1684:	4881                	li	a7,0
    while (isdigit(*s))
    1686:	fad7f3e3          	bgeu	a5,a3,162c <atoi+0x40>
    return neg ? n : -n;
    168a:	4501                	li	a0,0
    168c:	8082                	ret

000000000000168e <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    168e:	16060f63          	beqz	a2,180c <memset+0x17e>
    1692:	40a006b3          	neg	a3,a0
    1696:	0076f793          	and	a5,a3,7
    169a:	00778813          	add	a6,a5,7
    169e:	48ad                	li	a7,11
    16a0:	0ff5f713          	zext.b	a4,a1
    16a4:	fff60593          	add	a1,a2,-1
    16a8:	17186363          	bltu	a6,a7,180e <memset+0x180>
    16ac:	1705eb63          	bltu	a1,a6,1822 <memset+0x194>
    16b0:	16078163          	beqz	a5,1812 <memset+0x184>
    16b4:	00e50023          	sb	a4,0(a0)
    16b8:	0066f593          	and	a1,a3,6
    16bc:	14058e63          	beqz	a1,1818 <memset+0x18a>
    16c0:	00e500a3          	sb	a4,1(a0)
    16c4:	4589                	li	a1,2
    16c6:	00250813          	add	a6,a0,2
    16ca:	04f5f663          	bgeu	a1,a5,1716 <memset+0x88>
    16ce:	00e50123          	sb	a4,2(a0)
    16d2:	8a91                	and	a3,a3,4
    16d4:	00350813          	add	a6,a0,3
    16d8:	458d                	li	a1,3
    16da:	ce95                	beqz	a3,1716 <memset+0x88>
    16dc:	00e501a3          	sb	a4,3(a0)
    16e0:	4691                	li	a3,4
    16e2:	00450813          	add	a6,a0,4
    16e6:	4591                	li	a1,4
    16e8:	02f6f763          	bgeu	a3,a5,1716 <memset+0x88>
    16ec:	00e50223          	sb	a4,4(a0)
    16f0:	4695                	li	a3,5
    16f2:	00550813          	add	a6,a0,5
    16f6:	4595                	li	a1,5
    16f8:	00d78f63          	beq	a5,a3,1716 <memset+0x88>
    16fc:	00e502a3          	sb	a4,5(a0)
    1700:	469d                	li	a3,7
    1702:	00650813          	add	a6,a0,6
    1706:	4599                	li	a1,6
    1708:	00d79763          	bne	a5,a3,1716 <memset+0x88>
    170c:	00750813          	add	a6,a0,7
    1710:	00e50323          	sb	a4,6(a0)
    1714:	459d                	li	a1,7
    1716:	00871693          	sll	a3,a4,0x8
    171a:	01071313          	sll	t1,a4,0x10
    171e:	8ed9                	or	a3,a3,a4
    1720:	01871893          	sll	a7,a4,0x18
    1724:	0066e6b3          	or	a3,a3,t1
    1728:	0116e6b3          	or	a3,a3,a7
    172c:	02071313          	sll	t1,a4,0x20
    1730:	02871893          	sll	a7,a4,0x28
    1734:	0066e6b3          	or	a3,a3,t1
    1738:	40f60e33          	sub	t3,a2,a5
    173c:	03071313          	sll	t1,a4,0x30
    1740:	0116e6b3          	or	a3,a3,a7
    1744:	0066e6b3          	or	a3,a3,t1
    1748:	03871893          	sll	a7,a4,0x38
    174c:	97aa                	add	a5,a5,a0
    174e:	ff8e7313          	and	t1,t3,-8
    1752:	0116e6b3          	or	a3,a3,a7
    1756:	00f308b3          	add	a7,t1,a5
    175a:	e394                	sd	a3,0(a5)
    175c:	07a1                	add	a5,a5,8
    175e:	ff179ee3          	bne	a5,a7,175a <memset+0xcc>
    1762:	006806b3          	add	a3,a6,t1
    1766:	00b307bb          	addw	a5,t1,a1
    176a:	0bc30b63          	beq	t1,t3,1820 <memset+0x192>
    176e:	00e68023          	sb	a4,0(a3)
    1772:	0017859b          	addw	a1,a5,1
    1776:	08c5fb63          	bgeu	a1,a2,180c <memset+0x17e>
    177a:	00e680a3          	sb	a4,1(a3)
    177e:	0027859b          	addw	a1,a5,2
    1782:	08c5f563          	bgeu	a1,a2,180c <memset+0x17e>
    1786:	00e68123          	sb	a4,2(a3)
    178a:	0037859b          	addw	a1,a5,3
    178e:	06c5ff63          	bgeu	a1,a2,180c <memset+0x17e>
    1792:	00e681a3          	sb	a4,3(a3)
    1796:	0047859b          	addw	a1,a5,4
    179a:	06c5f963          	bgeu	a1,a2,180c <memset+0x17e>
    179e:	00e68223          	sb	a4,4(a3)
    17a2:	0057859b          	addw	a1,a5,5
    17a6:	06c5f363          	bgeu	a1,a2,180c <memset+0x17e>
    17aa:	00e682a3          	sb	a4,5(a3)
    17ae:	0067859b          	addw	a1,a5,6
    17b2:	04c5fd63          	bgeu	a1,a2,180c <memset+0x17e>
    17b6:	00e68323          	sb	a4,6(a3)
    17ba:	0077859b          	addw	a1,a5,7
    17be:	04c5f763          	bgeu	a1,a2,180c <memset+0x17e>
    17c2:	00e683a3          	sb	a4,7(a3)
    17c6:	0087859b          	addw	a1,a5,8
    17ca:	04c5f163          	bgeu	a1,a2,180c <memset+0x17e>
    17ce:	00e68423          	sb	a4,8(a3)
    17d2:	0097859b          	addw	a1,a5,9
    17d6:	02c5fb63          	bgeu	a1,a2,180c <memset+0x17e>
    17da:	00e684a3          	sb	a4,9(a3)
    17de:	00a7859b          	addw	a1,a5,10
    17e2:	02c5f563          	bgeu	a1,a2,180c <memset+0x17e>
    17e6:	00e68523          	sb	a4,10(a3)
    17ea:	00b7859b          	addw	a1,a5,11
    17ee:	00c5ff63          	bgeu	a1,a2,180c <memset+0x17e>
    17f2:	00e685a3          	sb	a4,11(a3)
    17f6:	00c7859b          	addw	a1,a5,12
    17fa:	00c5f963          	bgeu	a1,a2,180c <memset+0x17e>
    17fe:	00e68623          	sb	a4,12(a3)
    1802:	27b5                	addw	a5,a5,13
    1804:	00c7f463          	bgeu	a5,a2,180c <memset+0x17e>
    1808:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    180c:	8082                	ret
    180e:	482d                	li	a6,11
    1810:	bd71                	j	16ac <memset+0x1e>
    char *p = dest;
    1812:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1814:	4581                	li	a1,0
    1816:	b701                	j	1716 <memset+0x88>
    1818:	00150813          	add	a6,a0,1
    181c:	4585                	li	a1,1
    181e:	bde5                	j	1716 <memset+0x88>
    1820:	8082                	ret
    char *p = dest;
    1822:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1824:	4781                	li	a5,0
    1826:	b7a1                	j	176e <memset+0xe0>

0000000000001828 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1828:	00054783          	lbu	a5,0(a0)
    182c:	0005c703          	lbu	a4,0(a1)
    1830:	00e79863          	bne	a5,a4,1840 <strcmp+0x18>
    1834:	0505                	add	a0,a0,1
    1836:	0585                	add	a1,a1,1
    1838:	fbe5                	bnez	a5,1828 <strcmp>
    183a:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    183c:	9d19                	subw	a0,a0,a4
    183e:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1840:	0007851b          	sext.w	a0,a5
    1844:	bfe5                	j	183c <strcmp+0x14>

0000000000001846 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1846:	ca15                	beqz	a2,187a <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1848:	00054783          	lbu	a5,0(a0)
    if (!n--)
    184c:	167d                	add	a2,a2,-1
    184e:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1852:	eb99                	bnez	a5,1868 <strncmp+0x22>
    1854:	a815                	j	1888 <strncmp+0x42>
    1856:	00a68e63          	beq	a3,a0,1872 <strncmp+0x2c>
    185a:	0505                	add	a0,a0,1
    185c:	00f71b63          	bne	a4,a5,1872 <strncmp+0x2c>
    1860:	00054783          	lbu	a5,0(a0)
    1864:	cf89                	beqz	a5,187e <strncmp+0x38>
    1866:	85b2                	mv	a1,a2
    1868:	0005c703          	lbu	a4,0(a1)
    186c:	00158613          	add	a2,a1,1
    1870:	f37d                	bnez	a4,1856 <strncmp+0x10>
        ;
    return *l - *r;
    1872:	0007851b          	sext.w	a0,a5
    1876:	9d19                	subw	a0,a0,a4
    1878:	8082                	ret
        return 0;
    187a:	4501                	li	a0,0
}
    187c:	8082                	ret
    return *l - *r;
    187e:	0015c703          	lbu	a4,1(a1)
    1882:	4501                	li	a0,0
    1884:	9d19                	subw	a0,a0,a4
    1886:	8082                	ret
    1888:	0005c703          	lbu	a4,0(a1)
    188c:	4501                	li	a0,0
    188e:	b7e5                	j	1876 <strncmp+0x30>

0000000000001890 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1890:	00757793          	and	a5,a0,7
    1894:	cf89                	beqz	a5,18ae <strlen+0x1e>
    1896:	87aa                	mv	a5,a0
    1898:	a029                	j	18a2 <strlen+0x12>
    189a:	0785                	add	a5,a5,1
    189c:	0077f713          	and	a4,a5,7
    18a0:	cb01                	beqz	a4,18b0 <strlen+0x20>
        if (!*s)
    18a2:	0007c703          	lbu	a4,0(a5)
    18a6:	fb75                	bnez	a4,189a <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18a8:	40a78533          	sub	a0,a5,a0
}
    18ac:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18ae:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18b0:	feff05b7          	lui	a1,0xfeff0
    18b4:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedd1f>
    18b8:	f0101637          	lui	a2,0xf0101
    18bc:	05c2                	sll	a1,a1,0x10
    18be:	0612                	sll	a2,a2,0x4
    18c0:	6394                	ld	a3,0(a5)
    18c2:	eff58593          	add	a1,a1,-257
    18c6:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00fef21>
    18ca:	05c2                	sll	a1,a1,0x10
    18cc:	0642                	sll	a2,a2,0x10
    18ce:	eff58593          	add	a1,a1,-257
    18d2:	10160613          	add	a2,a2,257
    18d6:	00b68733          	add	a4,a3,a1
    18da:	063e                	sll	a2,a2,0xf
    18dc:	fff6c693          	not	a3,a3
    18e0:	8f75                	and	a4,a4,a3
    18e2:	08060613          	add	a2,a2,128
    18e6:	8f71                	and	a4,a4,a2
    18e8:	eb11                	bnez	a4,18fc <strlen+0x6c>
    18ea:	6794                	ld	a3,8(a5)
    18ec:	07a1                	add	a5,a5,8
    18ee:	00b68733          	add	a4,a3,a1
    18f2:	fff6c693          	not	a3,a3
    18f6:	8f75                	and	a4,a4,a3
    18f8:	8f71                	and	a4,a4,a2
    18fa:	db65                	beqz	a4,18ea <strlen+0x5a>
    for (; *s; s++)
    18fc:	0007c703          	lbu	a4,0(a5)
    1900:	d745                	beqz	a4,18a8 <strlen+0x18>
    1902:	0017c703          	lbu	a4,1(a5)
    1906:	0785                	add	a5,a5,1
    1908:	d345                	beqz	a4,18a8 <strlen+0x18>
    190a:	0017c703          	lbu	a4,1(a5)
    190e:	0785                	add	a5,a5,1
    1910:	fb6d                	bnez	a4,1902 <strlen+0x72>
    1912:	bf59                	j	18a8 <strlen+0x18>

0000000000001914 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1914:	00757713          	and	a4,a0,7
{
    1918:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    191a:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    191e:	cb19                	beqz	a4,1934 <memchr+0x20>
    1920:	ce59                	beqz	a2,19be <memchr+0xaa>
    1922:	0007c703          	lbu	a4,0(a5)
    1926:	00b70963          	beq	a4,a1,1938 <memchr+0x24>
    192a:	0785                	add	a5,a5,1
    192c:	0077f713          	and	a4,a5,7
    1930:	167d                	add	a2,a2,-1
    1932:	f77d                	bnez	a4,1920 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1934:	4501                	li	a0,0
    if (n && *s != c)
    1936:	c649                	beqz	a2,19c0 <memchr+0xac>
    1938:	0007c703          	lbu	a4,0(a5)
    193c:	06b70663          	beq	a4,a1,19a8 <memchr+0x94>
        size_t k = ONES * c;
    1940:	01010737          	lui	a4,0x1010
    1944:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100df21>
    1948:	0742                	sll	a4,a4,0x10
    194a:	10170713          	add	a4,a4,257
    194e:	0742                	sll	a4,a4,0x10
    1950:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1954:	469d                	li	a3,7
        size_t k = ONES * c;
    1956:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    195a:	04c6f763          	bgeu	a3,a2,19a8 <memchr+0x94>
    195e:	f0101837          	lui	a6,0xf0101
    1962:	feff08b7          	lui	a7,0xfeff0
    1966:	0812                	sll	a6,a6,0x4
    1968:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedd1f>
    196c:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00fef21>
    1970:	08c2                	sll	a7,a7,0x10
    1972:	0842                	sll	a6,a6,0x10
    1974:	eff88893          	add	a7,a7,-257
    1978:	10180813          	add	a6,a6,257
    197c:	08c2                	sll	a7,a7,0x10
    197e:	083e                	sll	a6,a6,0xf
    1980:	eff88893          	add	a7,a7,-257
    1984:	08080813          	add	a6,a6,128
    1988:	431d                	li	t1,7
    198a:	a029                	j	1994 <memchr+0x80>
    198c:	1661                	add	a2,a2,-8
    198e:	07a1                	add	a5,a5,8
    1990:	02c37663          	bgeu	t1,a2,19bc <memchr+0xa8>
    1994:	6398                	ld	a4,0(a5)
    1996:	8f29                	xor	a4,a4,a0
    1998:	011706b3          	add	a3,a4,a7
    199c:	fff74713          	not	a4,a4
    19a0:	8f75                	and	a4,a4,a3
    19a2:	01077733          	and	a4,a4,a6
    19a6:	d37d                	beqz	a4,198c <memchr+0x78>
        s = (const void *)w;
    19a8:	853e                	mv	a0,a5
    19aa:	a019                	j	19b0 <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    19ac:	0505                	add	a0,a0,1
    19ae:	ca01                	beqz	a2,19be <memchr+0xaa>
    19b0:	00054783          	lbu	a5,0(a0)
    19b4:	167d                	add	a2,a2,-1
    19b6:	feb79be3          	bne	a5,a1,19ac <memchr+0x98>
    19ba:	8082                	ret
    19bc:	f675                	bnez	a2,19a8 <memchr+0x94>
    return n ? (void *)s : 0;
    19be:	4501                	li	a0,0
}
    19c0:	8082                	ret

00000000000019c2 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19c2:	1101                	add	sp,sp,-32
    19c4:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19c6:	862e                	mv	a2,a1
{
    19c8:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19ca:	4581                	li	a1,0
{
    19cc:	e426                	sd	s1,8(sp)
    19ce:	ec06                	sd	ra,24(sp)
    19d0:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19d2:	f43ff0ef          	jal	1914 <memchr>
    return p ? p - s : n;
    19d6:	c519                	beqz	a0,19e4 <strnlen+0x22>
}
    19d8:	60e2                	ld	ra,24(sp)
    19da:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19dc:	8d05                	sub	a0,a0,s1
}
    19de:	64a2                	ld	s1,8(sp)
    19e0:	6105                	add	sp,sp,32
    19e2:	8082                	ret
    19e4:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19e6:	8522                	mv	a0,s0
}
    19e8:	6442                	ld	s0,16(sp)
    19ea:	64a2                	ld	s1,8(sp)
    19ec:	6105                	add	sp,sp,32
    19ee:	8082                	ret

00000000000019f0 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19f0:	00b547b3          	xor	a5,a0,a1
    19f4:	8b9d                	and	a5,a5,7
    19f6:	efb1                	bnez	a5,1a52 <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19f8:	0075f793          	and	a5,a1,7
    19fc:	ebb5                	bnez	a5,1a70 <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19fe:	feff0637          	lui	a2,0xfeff0
    1a02:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedd1f>
    1a06:	f01016b7          	lui	a3,0xf0101
    1a0a:	0642                	sll	a2,a2,0x10
    1a0c:	0692                	sll	a3,a3,0x4
    1a0e:	6198                	ld	a4,0(a1)
    1a10:	eff60613          	add	a2,a2,-257
    1a14:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00fef21>
    1a18:	0642                	sll	a2,a2,0x10
    1a1a:	06c2                	sll	a3,a3,0x10
    1a1c:	eff60613          	add	a2,a2,-257
    1a20:	10168693          	add	a3,a3,257
    1a24:	00c707b3          	add	a5,a4,a2
    1a28:	fff74813          	not	a6,a4
    1a2c:	06be                	sll	a3,a3,0xf
    1a2e:	0107f7b3          	and	a5,a5,a6
    1a32:	08068693          	add	a3,a3,128
    1a36:	8ff5                	and	a5,a5,a3
    1a38:	ef89                	bnez	a5,1a52 <strcpy+0x62>
    1a3a:	05a1                	add	a1,a1,8
    1a3c:	e118                	sd	a4,0(a0)
    1a3e:	6198                	ld	a4,0(a1)
    1a40:	0521                	add	a0,a0,8
    1a42:	00c707b3          	add	a5,a4,a2
    1a46:	fff74813          	not	a6,a4
    1a4a:	0107f7b3          	and	a5,a5,a6
    1a4e:	8ff5                	and	a5,a5,a3
    1a50:	d7ed                	beqz	a5,1a3a <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a52:	0005c783          	lbu	a5,0(a1)
    1a56:	00f50023          	sb	a5,0(a0)
    1a5a:	c785                	beqz	a5,1a82 <strcpy+0x92>
    1a5c:	0015c783          	lbu	a5,1(a1)
    1a60:	0505                	add	a0,a0,1
    1a62:	0585                	add	a1,a1,1
    1a64:	00f50023          	sb	a5,0(a0)
    1a68:	fbf5                	bnez	a5,1a5c <strcpy+0x6c>
        ;
    return d;
}
    1a6a:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a6c:	0505                	add	a0,a0,1
    1a6e:	db41                	beqz	a4,19fe <strcpy+0xe>
            if (!(*d = *s))
    1a70:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a74:	0585                	add	a1,a1,1
    1a76:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a7a:	00f50023          	sb	a5,0(a0)
    1a7e:	f7fd                	bnez	a5,1a6c <strcpy+0x7c>
}
    1a80:	8082                	ret
    1a82:	8082                	ret

0000000000001a84 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a84:	00b547b3          	xor	a5,a0,a1
    1a88:	8b9d                	and	a5,a5,7
    1a8a:	efbd                	bnez	a5,1b08 <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a8c:	0075f793          	and	a5,a1,7
    1a90:	1c078563          	beqz	a5,1c5a <strncpy+0x1d6>
    1a94:	ea11                	bnez	a2,1aa8 <strncpy+0x24>
    1a96:	8082                	ret
    1a98:	0585                	add	a1,a1,1
    1a9a:	0075f793          	and	a5,a1,7
    1a9e:	167d                	add	a2,a2,-1
    1aa0:	0505                	add	a0,a0,1
    1aa2:	1a078c63          	beqz	a5,1c5a <strncpy+0x1d6>
    1aa6:	ca3d                	beqz	a2,1b1c <strncpy+0x98>
    1aa8:	0005c783          	lbu	a5,0(a1)
    1aac:	00f50023          	sb	a5,0(a0)
    1ab0:	f7e5                	bnez	a5,1a98 <strncpy+0x14>
            ;
        if (!n || !*s)
    1ab2:	0005c783          	lbu	a5,0(a1)
    1ab6:	c7a5                	beqz	a5,1b1e <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ab8:	479d                	li	a5,7
    1aba:	04c7f863          	bgeu	a5,a2,1b0a <strncpy+0x86>
    1abe:	f01016b7          	lui	a3,0xf0101
    1ac2:	feff0837          	lui	a6,0xfeff0
    1ac6:	0692                	sll	a3,a3,0x4
    1ac8:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedd1f>
    1acc:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00fef21>
    1ad0:	0842                	sll	a6,a6,0x10
    1ad2:	06c2                	sll	a3,a3,0x10
    1ad4:	eff80813          	add	a6,a6,-257
    1ad8:	10168693          	add	a3,a3,257
    1adc:	0842                	sll	a6,a6,0x10
    1ade:	06be                	sll	a3,a3,0xf
    1ae0:	eff80813          	add	a6,a6,-257
    1ae4:	08068693          	add	a3,a3,128
    1ae8:	431d                	li	t1,7
    1aea:	6198                	ld	a4,0(a1)
    1aec:	010707b3          	add	a5,a4,a6
    1af0:	fff74893          	not	a7,a4
    1af4:	0117f7b3          	and	a5,a5,a7
    1af8:	8ff5                	and	a5,a5,a3
    1afa:	eb81                	bnez	a5,1b0a <strncpy+0x86>
            *wd = *ws;
    1afc:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1afe:	1661                	add	a2,a2,-8
    1b00:	05a1                	add	a1,a1,8
    1b02:	0521                	add	a0,a0,8
    1b04:	fec363e3          	bltu	t1,a2,1aea <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b08:	ca11                	beqz	a2,1b1c <strncpy+0x98>
    1b0a:	0005c783          	lbu	a5,0(a1)
    1b0e:	0585                	add	a1,a1,1
    1b10:	00f50023          	sb	a5,0(a0)
    1b14:	c789                	beqz	a5,1b1e <strncpy+0x9a>
    1b16:	167d                	add	a2,a2,-1
    1b18:	0505                	add	a0,a0,1
    1b1a:	fa65                	bnez	a2,1b0a <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b1c:	8082                	ret
    1b1e:	40a00733          	neg	a4,a0
    1b22:	00777793          	and	a5,a4,7
    1b26:	00778693          	add	a3,a5,7
    1b2a:	482d                	li	a6,11
    1b2c:	fff60593          	add	a1,a2,-1
    1b30:	1106ef63          	bltu	a3,a6,1c4e <strncpy+0x1ca>
    1b34:	12d5ee63          	bltu	a1,a3,1c70 <strncpy+0x1ec>
    1b38:	12078563          	beqz	a5,1c62 <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b3c:	00050023          	sb	zero,0(a0)
    1b40:	00677693          	and	a3,a4,6
    1b44:	12068263          	beqz	a3,1c68 <strncpy+0x1e4>
    1b48:	000500a3          	sb	zero,1(a0)
    1b4c:	4689                	li	a3,2
    1b4e:	12f6f463          	bgeu	a3,a5,1c76 <strncpy+0x1f2>
    1b52:	00050123          	sb	zero,2(a0)
    1b56:	8b11                	and	a4,a4,4
    1b58:	cf6d                	beqz	a4,1c52 <strncpy+0x1ce>
    1b5a:	000501a3          	sb	zero,3(a0)
    1b5e:	4711                	li	a4,4
    1b60:	00450693          	add	a3,a0,4
    1b64:	02f77363          	bgeu	a4,a5,1b8a <strncpy+0x106>
    1b68:	00050223          	sb	zero,4(a0)
    1b6c:	4715                	li	a4,5
    1b6e:	00550693          	add	a3,a0,5
    1b72:	00e78c63          	beq	a5,a4,1b8a <strncpy+0x106>
    1b76:	000502a3          	sb	zero,5(a0)
    1b7a:	471d                	li	a4,7
    1b7c:	10e79163          	bne	a5,a4,1c7e <strncpy+0x1fa>
    1b80:	00750693          	add	a3,a0,7
    1b84:	00050323          	sb	zero,6(a0)
    1b88:	471d                	li	a4,7
    1b8a:	40f608b3          	sub	a7,a2,a5
    1b8e:	ff88f813          	and	a6,a7,-8
    1b92:	97aa                	add	a5,a5,a0
    1b94:	010785b3          	add	a1,a5,a6
    1b98:	0007b023          	sd	zero,0(a5)
    1b9c:	07a1                	add	a5,a5,8
    1b9e:	feb79de3          	bne	a5,a1,1b98 <strncpy+0x114>
    1ba2:	00e807bb          	addw	a5,a6,a4
    1ba6:	01068733          	add	a4,a3,a6
    1baa:	0b088b63          	beq	a7,a6,1c60 <strncpy+0x1dc>
    1bae:	00070023          	sb	zero,0(a4)
    1bb2:	0017869b          	addw	a3,a5,1
    1bb6:	f6c6f3e3          	bgeu	a3,a2,1b1c <strncpy+0x98>
    1bba:	000700a3          	sb	zero,1(a4)
    1bbe:	0027869b          	addw	a3,a5,2
    1bc2:	f4c6fde3          	bgeu	a3,a2,1b1c <strncpy+0x98>
    1bc6:	00070123          	sb	zero,2(a4)
    1bca:	0037869b          	addw	a3,a5,3
    1bce:	f4c6f7e3          	bgeu	a3,a2,1b1c <strncpy+0x98>
    1bd2:	000701a3          	sb	zero,3(a4)
    1bd6:	0047869b          	addw	a3,a5,4
    1bda:	f4c6f1e3          	bgeu	a3,a2,1b1c <strncpy+0x98>
    1bde:	00070223          	sb	zero,4(a4)
    1be2:	0057869b          	addw	a3,a5,5
    1be6:	f2c6fbe3          	bgeu	a3,a2,1b1c <strncpy+0x98>
    1bea:	000702a3          	sb	zero,5(a4)
    1bee:	0067869b          	addw	a3,a5,6
    1bf2:	f2c6f5e3          	bgeu	a3,a2,1b1c <strncpy+0x98>
    1bf6:	00070323          	sb	zero,6(a4)
    1bfa:	0077869b          	addw	a3,a5,7
    1bfe:	f0c6ffe3          	bgeu	a3,a2,1b1c <strncpy+0x98>
    1c02:	000703a3          	sb	zero,7(a4)
    1c06:	0087869b          	addw	a3,a5,8
    1c0a:	f0c6f9e3          	bgeu	a3,a2,1b1c <strncpy+0x98>
    1c0e:	00070423          	sb	zero,8(a4)
    1c12:	0097869b          	addw	a3,a5,9
    1c16:	f0c6f3e3          	bgeu	a3,a2,1b1c <strncpy+0x98>
    1c1a:	000704a3          	sb	zero,9(a4)
    1c1e:	00a7869b          	addw	a3,a5,10
    1c22:	eec6fde3          	bgeu	a3,a2,1b1c <strncpy+0x98>
    1c26:	00070523          	sb	zero,10(a4)
    1c2a:	00b7869b          	addw	a3,a5,11
    1c2e:	eec6f7e3          	bgeu	a3,a2,1b1c <strncpy+0x98>
    1c32:	000705a3          	sb	zero,11(a4)
    1c36:	00c7869b          	addw	a3,a5,12
    1c3a:	eec6f1e3          	bgeu	a3,a2,1b1c <strncpy+0x98>
    1c3e:	00070623          	sb	zero,12(a4)
    1c42:	27b5                	addw	a5,a5,13
    1c44:	ecc7fce3          	bgeu	a5,a2,1b1c <strncpy+0x98>
    1c48:	000706a3          	sb	zero,13(a4)
}
    1c4c:	8082                	ret
    1c4e:	46ad                	li	a3,11
    1c50:	b5d5                	j	1b34 <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c52:	00350693          	add	a3,a0,3
    1c56:	470d                	li	a4,3
    1c58:	bf0d                	j	1b8a <strncpy+0x106>
        if (!n || !*s)
    1c5a:	e4061ce3          	bnez	a2,1ab2 <strncpy+0x2e>
}
    1c5e:	8082                	ret
    1c60:	8082                	ret
    char *p = dest;
    1c62:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c64:	4701                	li	a4,0
    1c66:	b715                	j	1b8a <strncpy+0x106>
    1c68:	00150693          	add	a3,a0,1
    1c6c:	4705                	li	a4,1
    1c6e:	bf31                	j	1b8a <strncpy+0x106>
    char *p = dest;
    1c70:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c72:	4781                	li	a5,0
    1c74:	bf2d                	j	1bae <strncpy+0x12a>
    1c76:	00250693          	add	a3,a0,2
    1c7a:	4709                	li	a4,2
    1c7c:	b739                	j	1b8a <strncpy+0x106>
    1c7e:	00650693          	add	a3,a0,6
    1c82:	4719                	li	a4,6
    1c84:	b719                	j	1b8a <strncpy+0x106>

0000000000001c86 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c86:	87aa                	mv	a5,a0
    1c88:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c8a:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c8e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c92:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c94:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c96:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c9a:	2501                	sext.w	a0,a0
    1c9c:	8082                	ret

0000000000001c9e <openat>:
    register long a7 __asm__("a7") = n;
    1c9e:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1ca2:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ca6:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1caa:	2501                	sext.w	a0,a0
    1cac:	8082                	ret

0000000000001cae <fcntl>:
    register long a7 __asm__("a7") = n;
    1cae:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cb0:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1cb4:	2501                	sext.w	a0,a0
    1cb6:	8082                	ret

0000000000001cb8 <close>:
    register long a7 __asm__("a7") = n;
    1cb8:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1cbc:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1cc0:	2501                	sext.w	a0,a0
    1cc2:	8082                	ret

0000000000001cc4 <read>:
    register long a7 __asm__("a7") = n;
    1cc4:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cc8:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1ccc:	8082                	ret

0000000000001cce <write>:
    register long a7 __asm__("a7") = n;
    1cce:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cd2:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1cd6:	8082                	ret

0000000000001cd8 <getpid>:
    register long a7 __asm__("a7") = n;
    1cd8:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1cdc:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1ce0:	2501                	sext.w	a0,a0
    1ce2:	8082                	ret

0000000000001ce4 <getppid>:
    register long a7 __asm__("a7") = n;
    1ce4:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1ce8:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cec:	2501                	sext.w	a0,a0
    1cee:	8082                	ret

0000000000001cf0 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cf0:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cf4:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cf8:	2501                	sext.w	a0,a0
    1cfa:	8082                	ret

0000000000001cfc <fork>:
    register long a7 __asm__("a7") = n;
    1cfc:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d00:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d02:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d04:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d08:	2501                	sext.w	a0,a0
    1d0a:	8082                	ret

0000000000001d0c <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d0c:	85b2                	mv	a1,a2
    1d0e:	863a                	mv	a2,a4
    if (stack)
    1d10:	c191                	beqz	a1,1d14 <clone+0x8>
	stack += stack_size;
    1d12:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d14:	4781                	li	a5,0
    1d16:	4701                	li	a4,0
    1d18:	4681                	li	a3,0
    1d1a:	2601                	sext.w	a2,a2
    1d1c:	a2ed                	j	1f06 <__clone>

0000000000001d1e <exit>:
    register long a7 __asm__("a7") = n;
    1d1e:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d22:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d26:	8082                	ret

0000000000001d28 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d28:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d2c:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d2e:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d32:	2501                	sext.w	a0,a0
    1d34:	8082                	ret

0000000000001d36 <exec>:
    register long a7 __asm__("a7") = n;
    1d36:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d3a:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d3e:	2501                	sext.w	a0,a0
    1d40:	8082                	ret

0000000000001d42 <execve>:
    register long a7 __asm__("a7") = n;
    1d42:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d46:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d4a:	2501                	sext.w	a0,a0
    1d4c:	8082                	ret

0000000000001d4e <times>:
    register long a7 __asm__("a7") = n;
    1d4e:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d52:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d56:	2501                	sext.w	a0,a0
    1d58:	8082                	ret

0000000000001d5a <get_time>:

int64 get_time()
{
    1d5a:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d5c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d60:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d62:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d64:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d68:	2501                	sext.w	a0,a0
    1d6a:	ed09                	bnez	a0,1d84 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d6c:	67a2                	ld	a5,8(sp)
    1d6e:	3e800713          	li	a4,1000
    1d72:	00015503          	lhu	a0,0(sp)
    1d76:	02e7d7b3          	divu	a5,a5,a4
    1d7a:	02e50533          	mul	a0,a0,a4
    1d7e:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d80:	0141                	add	sp,sp,16
    1d82:	8082                	ret
        return -1;
    1d84:	557d                	li	a0,-1
    1d86:	bfed                	j	1d80 <get_time+0x26>

0000000000001d88 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d88:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d8c:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d90:	2501                	sext.w	a0,a0
    1d92:	8082                	ret

0000000000001d94 <time>:
    register long a7 __asm__("a7") = n;
    1d94:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d98:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d9c:	2501                	sext.w	a0,a0
    1d9e:	8082                	ret

0000000000001da0 <sleep>:

int sleep(unsigned long long time)
{
    1da0:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1da2:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1da4:	850a                	mv	a0,sp
    1da6:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1da8:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1dac:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dae:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1db2:	e501                	bnez	a0,1dba <sleep+0x1a>
    return 0;
    1db4:	4501                	li	a0,0
}
    1db6:	0141                	add	sp,sp,16
    1db8:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1dba:	4502                	lw	a0,0(sp)
}
    1dbc:	0141                	add	sp,sp,16
    1dbe:	8082                	ret

0000000000001dc0 <set_priority>:
    register long a7 __asm__("a7") = n;
    1dc0:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1dc4:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1dc8:	2501                	sext.w	a0,a0
    1dca:	8082                	ret

0000000000001dcc <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1dcc:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1dd0:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1dd4:	8082                	ret

0000000000001dd6 <munmap>:
    register long a7 __asm__("a7") = n;
    1dd6:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dda:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1dde:	2501                	sext.w	a0,a0
    1de0:	8082                	ret

0000000000001de2 <wait>:

int wait(int *code)
{
    1de2:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1de4:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1de8:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1dea:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1dec:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dee:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1df2:	2501                	sext.w	a0,a0
    1df4:	8082                	ret

0000000000001df6 <spawn>:
    register long a7 __asm__("a7") = n;
    1df6:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1dfa:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dfe:	2501                	sext.w	a0,a0
    1e00:	8082                	ret

0000000000001e02 <mailread>:
    register long a7 __asm__("a7") = n;
    1e02:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e06:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e0a:	2501                	sext.w	a0,a0
    1e0c:	8082                	ret

0000000000001e0e <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e0e:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e12:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e16:	2501                	sext.w	a0,a0
    1e18:	8082                	ret

0000000000001e1a <fstat>:
    register long a7 __asm__("a7") = n;
    1e1a:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e1e:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e22:	2501                	sext.w	a0,a0
    1e24:	8082                	ret

0000000000001e26 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e26:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e28:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e2c:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e2e:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e32:	2501                	sext.w	a0,a0
    1e34:	8082                	ret

0000000000001e36 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e36:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e38:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e3c:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e3e:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e42:	2501                	sext.w	a0,a0
    1e44:	8082                	ret

0000000000001e46 <link>:

int link(char *old_path, char *new_path)
{
    1e46:	87aa                	mv	a5,a0
    1e48:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e4a:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e4e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e52:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e54:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e58:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e5a:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e5e:	2501                	sext.w	a0,a0
    1e60:	8082                	ret

0000000000001e62 <unlink>:

int unlink(char *path)
{
    1e62:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e64:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e68:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e6c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e6e:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e72:	2501                	sext.w	a0,a0
    1e74:	8082                	ret

0000000000001e76 <uname>:
    register long a7 __asm__("a7") = n;
    1e76:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e7a:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e7e:	2501                	sext.w	a0,a0
    1e80:	8082                	ret

0000000000001e82 <brk>:
    register long a7 __asm__("a7") = n;
    1e82:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e86:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e8a:	2501                	sext.w	a0,a0
    1e8c:	8082                	ret

0000000000001e8e <getcwd>:
    register long a7 __asm__("a7") = n;
    1e8e:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e90:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e94:	8082                	ret

0000000000001e96 <chdir>:
    register long a7 __asm__("a7") = n;
    1e96:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e9a:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e9e:	2501                	sext.w	a0,a0
    1ea0:	8082                	ret

0000000000001ea2 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1ea2:	862e                	mv	a2,a1
    1ea4:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1ea6:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ea8:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1eac:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1eb0:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1eb2:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eb4:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1eb8:	2501                	sext.w	a0,a0
    1eba:	8082                	ret

0000000000001ebc <getdents>:
    register long a7 __asm__("a7") = n;
    1ebc:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ec0:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1ec4:	2501                	sext.w	a0,a0
    1ec6:	8082                	ret

0000000000001ec8 <pipe>:
    register long a7 __asm__("a7") = n;
    1ec8:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1ecc:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ece:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1ed2:	2501                	sext.w	a0,a0
    1ed4:	8082                	ret

0000000000001ed6 <dup>:
    register long a7 __asm__("a7") = n;
    1ed6:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1ed8:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1edc:	2501                	sext.w	a0,a0
    1ede:	8082                	ret

0000000000001ee0 <dup2>:
    register long a7 __asm__("a7") = n;
    1ee0:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1ee2:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ee4:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ee8:	2501                	sext.w	a0,a0
    1eea:	8082                	ret

0000000000001eec <mount>:
    register long a7 __asm__("a7") = n;
    1eec:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ef0:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ef4:	2501                	sext.w	a0,a0
    1ef6:	8082                	ret

0000000000001ef8 <umount>:
    register long a7 __asm__("a7") = n;
    1ef8:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1efc:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1efe:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f02:	2501                	sext.w	a0,a0
    1f04:	8082                	ret

0000000000001f06 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f06:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1f08:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f0a:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f0c:	8532                	mv	a0,a2
	mv a2, a4
    1f0e:	863a                	mv	a2,a4
	mv a3, a5
    1f10:	86be                	mv	a3,a5
	mv a4, a6
    1f12:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f14:	0dc00893          	li	a7,220
	ecall
    1f18:	00000073          	ecall

	beqz a0, 1f
    1f1c:	c111                	beqz	a0,1f20 <__clone+0x1a>
	# Parent
	ret
    1f1e:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f20:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f22:	6522                	ld	a0,8(sp)
	jalr a1
    1f24:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f26:	05d00893          	li	a7,93
	ecall
    1f2a:	00000073          	ecall
