
/home/windflower/Desktop/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/pipe:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a235                	j	112e <__start_main>

0000000000001004 <test_pipe>:
 * 成功测试时的输出：
 * "  Write to pipe successfully."
 */
static int fd[2];

void test_pipe(void){
    1004:	7135                	add	sp,sp,-160
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f6a50513          	add	a0,a0,-150 # 1f70 <__clone+0x2a>
void test_pipe(void){
    100e:	ed06                	sd	ra,152(sp)
    1010:	e922                	sd	s0,144(sp)
    TEST_START(__func__);
    1012:	354000ef          	jal	1366 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	ff250513          	add	a0,a0,-14 # 2008 <__func__.0>
    101e:	348000ef          	jal	1366 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	f6650513          	add	a0,a0,-154 # 1f88 <__clone+0x42>
    102a:	33c000ef          	jal	1366 <puts>
    int cpid;
    char buf[128] = {0};
    102e:	08000613          	li	a2,128
    1032:	4581                	li	a1,0
    1034:	850a                	mv	a0,sp
    1036:	6a2000ef          	jal	16d8 <memset>
    int ret = pipe(fd);
    103a:	00001517          	auipc	a0,0x1
    103e:	fc650513          	add	a0,a0,-58 # 2000 <fd>
    1042:	6c7000ef          	jal	1f08 <pipe>
    assert(ret != -1);
    1046:	57fd                	li	a5,-1
    1048:	0cf50463          	beq	a0,a5,1110 <test_pipe+0x10c>
    const char *data = "  Write to pipe successfully.\n";
    cpid = fork();
    104c:	4f1000ef          	jal	1d3c <fork>
    1050:	842a                	mv	s0,a0
    printf("cpid: %d\n", cpid);
    1052:	85aa                	mv	a1,a0
    1054:	00001517          	auipc	a0,0x1
    1058:	f6450513          	add	a0,a0,-156 # 1fb8 <__clone+0x72>
    105c:	32c000ef          	jal	1388 <printf>
    if(cpid > 0){
    1060:	06805963          	blez	s0,10d2 <test_pipe+0xce>
	close(fd[1]);
    1064:	00001417          	auipc	s0,0x1
    1068:	f9c40413          	add	s0,s0,-100 # 2000 <fd>
    106c:	4048                	lw	a0,4(s0)
    106e:	48b000ef          	jal	1cf8 <close>
	while(read(fd[0], buf, 1) > 0)
    1072:	a019                	j	1078 <test_pipe+0x74>
            write(STDOUT, buf, 1);
    1074:	49b000ef          	jal	1d0e <write>
	while(read(fd[0], buf, 1) > 0)
    1078:	4008                	lw	a0,0(s0)
    107a:	4605                	li	a2,1
    107c:	858a                	mv	a1,sp
    107e:	487000ef          	jal	1d04 <read>
    1082:	87aa                	mv	a5,a0
            write(STDOUT, buf, 1);
    1084:	4605                	li	a2,1
    1086:	858a                	mv	a1,sp
    1088:	4505                	li	a0,1
	while(read(fd[0], buf, 1) > 0)
    108a:	fef045e3          	bgtz	a5,1074 <test_pipe+0x70>
	write(STDOUT, "\n", 1);
    108e:	00001597          	auipc	a1,0x1
    1092:	f2258593          	add	a1,a1,-222 # 1fb0 <__clone+0x6a>
    1096:	479000ef          	jal	1d0e <write>
	close(fd[0]);
    109a:	4008                	lw	a0,0(s0)
    109c:	45d000ef          	jal	1cf8 <close>
	wait(NULL);
    10a0:	4501                	li	a0,0
    10a2:	581000ef          	jal	1e22 <wait>
	close(fd[0]);
	write(fd[1], data, strlen(data));
	close(fd[1]);
	exit(0);
    }
    TEST_END(__func__);
    10a6:	00001517          	auipc	a0,0x1
    10aa:	f4250513          	add	a0,a0,-190 # 1fe8 <__clone+0xa2>
    10ae:	2b8000ef          	jal	1366 <puts>
    10b2:	00001517          	auipc	a0,0x1
    10b6:	f5650513          	add	a0,a0,-170 # 2008 <__func__.0>
    10ba:	2ac000ef          	jal	1366 <puts>
    10be:	00001517          	auipc	a0,0x1
    10c2:	eca50513          	add	a0,a0,-310 # 1f88 <__clone+0x42>
    10c6:	2a0000ef          	jal	1366 <puts>
}
    10ca:	60ea                	ld	ra,152(sp)
    10cc:	644a                	ld	s0,144(sp)
    10ce:	610d                	add	sp,sp,160
    10d0:	8082                	ret
	close(fd[0]);
    10d2:	00001417          	auipc	s0,0x1
    10d6:	f2e40413          	add	s0,s0,-210 # 2000 <fd>
    10da:	4008                	lw	a0,0(s0)
    10dc:	e526                	sd	s1,136(sp)
    10de:	41b000ef          	jal	1cf8 <close>
	write(fd[1], data, strlen(data));
    10e2:	4044                	lw	s1,4(s0)
    10e4:	00001517          	auipc	a0,0x1
    10e8:	ee450513          	add	a0,a0,-284 # 1fc8 <__clone+0x82>
    10ec:	7ee000ef          	jal	18da <strlen>
    10f0:	862a                	mv	a2,a0
    10f2:	00001597          	auipc	a1,0x1
    10f6:	ed658593          	add	a1,a1,-298 # 1fc8 <__clone+0x82>
    10fa:	8526                	mv	a0,s1
    10fc:	413000ef          	jal	1d0e <write>
	close(fd[1]);
    1100:	4048                	lw	a0,4(s0)
    1102:	3f7000ef          	jal	1cf8 <close>
	exit(0);
    1106:	4501                	li	a0,0
    1108:	457000ef          	jal	1d5e <exit>
    110c:	64aa                	ld	s1,136(sp)
    110e:	bf61                	j	10a6 <test_pipe+0xa2>
    assert(ret != -1);
    1110:	00001517          	auipc	a0,0x1
    1114:	e8850513          	add	a0,a0,-376 # 1f98 <__clone+0x52>
    1118:	4ee000ef          	jal	1606 <panic>
    111c:	bf05                	j	104c <test_pipe+0x48>

000000000000111e <main>:

int main(void){
    111e:	1141                	add	sp,sp,-16
    1120:	e406                	sd	ra,8(sp)
    test_pipe();
    1122:	ee3ff0ef          	jal	1004 <test_pipe>
    return 0;
}
    1126:	60a2                	ld	ra,8(sp)
    1128:	4501                	li	a0,0
    112a:	0141                	add	sp,sp,16
    112c:	8082                	ret

000000000000112e <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    112e:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1130:	4108                	lw	a0,0(a0)
{
    1132:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    1134:	05a1                	add	a1,a1,8
{
    1136:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1138:	fe7ff0ef          	jal	111e <main>
    113c:	423000ef          	jal	1d5e <exit>
	return 0;
}
    1140:	60a2                	ld	ra,8(sp)
    1142:	4501                	li	a0,0
    1144:	0141                	add	sp,sp,16
    1146:	8082                	ret

0000000000001148 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1148:	7179                	add	sp,sp,-48
    114a:	f406                	sd	ra,40(sp)
    114c:	0005081b          	sext.w	a6,a0
    1150:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1152:	00055563          	bgez	a0,115c <printint.constprop.0+0x14>
        x = -xx;
    1156:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    115a:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    115c:	02b8763b          	remuw	a2,a6,a1
    1160:	00001697          	auipc	a3,0x1
    1164:	eb868693          	add	a3,a3,-328 # 2018 <digits>
    buf[16] = 0;
    1168:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    116c:	0005871b          	sext.w	a4,a1
    1170:	1602                	sll	a2,a2,0x20
    1172:	9201                	srl	a2,a2,0x20
    1174:	9636                	add	a2,a2,a3
    1176:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    117a:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    117e:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1182:	10b86c63          	bltu	a6,a1,129a <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    1186:	02e5763b          	remuw	a2,a0,a4
    118a:	1602                	sll	a2,a2,0x20
    118c:	9201                	srl	a2,a2,0x20
    118e:	9636                	add	a2,a2,a3
    1190:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1194:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1198:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    119c:	10e56863          	bltu	a0,a4,12ac <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    11a0:	02e5f63b          	remuw	a2,a1,a4
    11a4:	1602                	sll	a2,a2,0x20
    11a6:	9201                	srl	a2,a2,0x20
    11a8:	9636                	add	a2,a2,a3
    11aa:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ae:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11b2:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    11b6:	10e5e463          	bltu	a1,a4,12be <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    11ba:	02e5763b          	remuw	a2,a0,a4
    11be:	1602                	sll	a2,a2,0x20
    11c0:	9201                	srl	a2,a2,0x20
    11c2:	9636                	add	a2,a2,a3
    11c4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c8:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11cc:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    11d0:	10e56063          	bltu	a0,a4,12d0 <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    11d4:	02e5f63b          	remuw	a2,a1,a4
    11d8:	1602                	sll	a2,a2,0x20
    11da:	9201                	srl	a2,a2,0x20
    11dc:	9636                	add	a2,a2,a3
    11de:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11e2:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11e6:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    11ea:	0ee5ec63          	bltu	a1,a4,12e2 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11ee:	02e5763b          	remuw	a2,a0,a4
    11f2:	1602                	sll	a2,a2,0x20
    11f4:	9201                	srl	a2,a2,0x20
    11f6:	9636                	add	a2,a2,a3
    11f8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11fc:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1200:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1204:	08e56263          	bltu	a0,a4,1288 <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    1208:	02e5f63b          	remuw	a2,a1,a4
    120c:	1602                	sll	a2,a2,0x20
    120e:	9201                	srl	a2,a2,0x20
    1210:	9636                	add	a2,a2,a3
    1212:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1216:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    121a:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    121e:	0ce5eb63          	bltu	a1,a4,12f4 <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    1222:	02e5763b          	remuw	a2,a0,a4
    1226:	1602                	sll	a2,a2,0x20
    1228:	9201                	srl	a2,a2,0x20
    122a:	9636                	add	a2,a2,a3
    122c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1230:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1234:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1238:	0ce56763          	bltu	a0,a4,1306 <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    123c:	02e5f63b          	remuw	a2,a1,a4
    1240:	1602                	sll	a2,a2,0x20
    1242:	9201                	srl	a2,a2,0x20
    1244:	9636                	add	a2,a2,a3
    1246:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    124a:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    124e:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    1252:	0ce5e363          	bltu	a1,a4,1318 <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    1256:	1782                	sll	a5,a5,0x20
    1258:	9381                	srl	a5,a5,0x20
    125a:	96be                	add	a3,a3,a5
    125c:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    1260:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    1262:	00f10723          	sb	a5,14(sp)
    if (sign)
    1266:	00088763          	beqz	a7,1274 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    126a:	02d00793          	li	a5,45
    126e:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1272:	4595                	li	a1,5
    write(f, s, l);
    1274:	003c                	add	a5,sp,8
    1276:	4641                	li	a2,16
    1278:	9e0d                	subw	a2,a2,a1
    127a:	4505                	li	a0,1
    127c:	95be                	add	a1,a1,a5
    127e:	291000ef          	jal	1d0e <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1282:	70a2                	ld	ra,40(sp)
    1284:	6145                	add	sp,sp,48
    1286:	8082                	ret
    i++;
    1288:	45a9                	li	a1,10
    if (sign)
    128a:	fe0885e3          	beqz	a7,1274 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    128e:	02d00793          	li	a5,45
    1292:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1296:	45a5                	li	a1,9
    1298:	bff1                	j	1274 <printint.constprop.0+0x12c>
    i++;
    129a:	45bd                	li	a1,15
    if (sign)
    129c:	fc088ce3          	beqz	a7,1274 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12a0:	02d00793          	li	a5,45
    12a4:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12a8:	45b9                	li	a1,14
    12aa:	b7e9                	j	1274 <printint.constprop.0+0x12c>
    i++;
    12ac:	45b9                	li	a1,14
    if (sign)
    12ae:	fc0883e3          	beqz	a7,1274 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12b2:	02d00793          	li	a5,45
    12b6:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    12ba:	45b5                	li	a1,13
    12bc:	bf65                	j	1274 <printint.constprop.0+0x12c>
    i++;
    12be:	45b5                	li	a1,13
    if (sign)
    12c0:	fa088ae3          	beqz	a7,1274 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12c4:	02d00793          	li	a5,45
    12c8:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    12cc:	45b1                	li	a1,12
    12ce:	b75d                	j	1274 <printint.constprop.0+0x12c>
    i++;
    12d0:	45b1                	li	a1,12
    if (sign)
    12d2:	fa0881e3          	beqz	a7,1274 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12d6:	02d00793          	li	a5,45
    12da:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12de:	45ad                	li	a1,11
    12e0:	bf51                	j	1274 <printint.constprop.0+0x12c>
    i++;
    12e2:	45ad                	li	a1,11
    if (sign)
    12e4:	f80888e3          	beqz	a7,1274 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12e8:	02d00793          	li	a5,45
    12ec:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12f0:	45a9                	li	a1,10
    12f2:	b749                	j	1274 <printint.constprop.0+0x12c>
    i++;
    12f4:	45a5                	li	a1,9
    if (sign)
    12f6:	f6088fe3          	beqz	a7,1274 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12fa:	02d00793          	li	a5,45
    12fe:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1302:	45a1                	li	a1,8
    1304:	bf85                	j	1274 <printint.constprop.0+0x12c>
    i++;
    1306:	45a1                	li	a1,8
    if (sign)
    1308:	f60886e3          	beqz	a7,1274 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    130c:	02d00793          	li	a5,45
    1310:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1314:	459d                	li	a1,7
    1316:	bfb9                	j	1274 <printint.constprop.0+0x12c>
    i++;
    1318:	459d                	li	a1,7
    if (sign)
    131a:	f4088de3          	beqz	a7,1274 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    131e:	02d00793          	li	a5,45
    1322:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1326:	4599                	li	a1,6
    1328:	b7b1                	j	1274 <printint.constprop.0+0x12c>

000000000000132a <getchar>:
{
    132a:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    132c:	00f10593          	add	a1,sp,15
    1330:	4605                	li	a2,1
    1332:	4501                	li	a0,0
{
    1334:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1336:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    133a:	1cb000ef          	jal	1d04 <read>
}
    133e:	60e2                	ld	ra,24(sp)
    1340:	00f14503          	lbu	a0,15(sp)
    1344:	6105                	add	sp,sp,32
    1346:	8082                	ret

0000000000001348 <putchar>:
{
    1348:	1101                	add	sp,sp,-32
    134a:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    134c:	00f10593          	add	a1,sp,15
    1350:	4605                	li	a2,1
    1352:	4505                	li	a0,1
{
    1354:	ec06                	sd	ra,24(sp)
    char byte = c;
    1356:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    135a:	1b5000ef          	jal	1d0e <write>
}
    135e:	60e2                	ld	ra,24(sp)
    1360:	2501                	sext.w	a0,a0
    1362:	6105                	add	sp,sp,32
    1364:	8082                	ret

0000000000001366 <puts>:
{
    1366:	1141                	add	sp,sp,-16
    1368:	e406                	sd	ra,8(sp)
    136a:	e022                	sd	s0,0(sp)
    136c:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    136e:	56c000ef          	jal	18da <strlen>
    1372:	862a                	mv	a2,a0
    1374:	85a2                	mv	a1,s0
    1376:	4505                	li	a0,1
    1378:	197000ef          	jal	1d0e <write>
}
    137c:	60a2                	ld	ra,8(sp)
    137e:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1380:	957d                	sra	a0,a0,0x3f
    return r;
    1382:	2501                	sext.w	a0,a0
}
    1384:	0141                	add	sp,sp,16
    1386:	8082                	ret

0000000000001388 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1388:	7131                	add	sp,sp,-192
    138a:	e4d6                	sd	s5,72(sp)
    138c:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    138e:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1390:	013c                	add	a5,sp,136
{
    1392:	f0ca                	sd	s2,96(sp)
    1394:	ecce                	sd	s3,88(sp)
    1396:	e8d2                	sd	s4,80(sp)
    1398:	e0da                	sd	s6,64(sp)
    139a:	fc5e                	sd	s7,56(sp)
    139c:	fc86                	sd	ra,120(sp)
    139e:	f8a2                	sd	s0,112(sp)
    13a0:	f4a6                	sd	s1,104(sp)
    13a2:	e52e                	sd	a1,136(sp)
    13a4:	e932                	sd	a2,144(sp)
    13a6:	ed36                	sd	a3,152(sp)
    13a8:	f13a                	sd	a4,160(sp)
    13aa:	f942                	sd	a6,176(sp)
    13ac:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    13ae:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    13b0:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    13b4:	07300a13          	li	s4,115
    13b8:	07800b93          	li	s7,120
    13bc:	06400b13          	li	s6,100
    buf[i++] = '0';
    13c0:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x5818>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13c4:	00001997          	auipc	s3,0x1
    13c8:	c5498993          	add	s3,s3,-940 # 2018 <digits>
        if (!*s)
    13cc:	00054783          	lbu	a5,0(a0)
    13d0:	16078863          	beqz	a5,1540 <printf+0x1b8>
    13d4:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13d6:	19278063          	beq	a5,s2,1556 <printf+0x1ce>
    13da:	00164783          	lbu	a5,1(a2)
    13de:	0605                	add	a2,a2,1
    13e0:	fbfd                	bnez	a5,13d6 <printf+0x4e>
    13e2:	84b2                	mv	s1,a2
        l = z - a;
    13e4:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13e8:	85aa                	mv	a1,a0
    13ea:	8622                	mv	a2,s0
    13ec:	4505                	li	a0,1
    13ee:	121000ef          	jal	1d0e <write>
        if (l)
    13f2:	18041763          	bnez	s0,1580 <printf+0x1f8>
        if (s[1] == 0)
    13f6:	0014c783          	lbu	a5,1(s1)
    13fa:	14078363          	beqz	a5,1540 <printf+0x1b8>
        switch (s[1])
    13fe:	19478f63          	beq	a5,s4,159c <printf+0x214>
    1402:	18fa6163          	bltu	s4,a5,1584 <printf+0x1fc>
    1406:	1b678e63          	beq	a5,s6,15c2 <printf+0x23a>
    140a:	07000713          	li	a4,112
    140e:	1ce79463          	bne	a5,a4,15d6 <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1412:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1414:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1418:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    141a:	631c                	ld	a5,0(a4)
    141c:	0721                	add	a4,a4,8
    141e:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1420:	00479293          	sll	t0,a5,0x4
    1424:	00879f93          	sll	t6,a5,0x8
    1428:	00c79f13          	sll	t5,a5,0xc
    142c:	01079e93          	sll	t4,a5,0x10
    1430:	01479e13          	sll	t3,a5,0x14
    1434:	01879313          	sll	t1,a5,0x18
    1438:	01c79893          	sll	a7,a5,0x1c
    143c:	02479813          	sll	a6,a5,0x24
    1440:	02879513          	sll	a0,a5,0x28
    1444:	02c79593          	sll	a1,a5,0x2c
    1448:	03079693          	sll	a3,a5,0x30
    144c:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1450:	03c7d413          	srl	s0,a5,0x3c
    1454:	01c7d39b          	srlw	t2,a5,0x1c
    1458:	03c2d293          	srl	t0,t0,0x3c
    145c:	03cfdf93          	srl	t6,t6,0x3c
    1460:	03cf5f13          	srl	t5,t5,0x3c
    1464:	03cede93          	srl	t4,t4,0x3c
    1468:	03ce5e13          	srl	t3,t3,0x3c
    146c:	03c35313          	srl	t1,t1,0x3c
    1470:	03c8d893          	srl	a7,a7,0x3c
    1474:	03c85813          	srl	a6,a6,0x3c
    1478:	9171                	srl	a0,a0,0x3c
    147a:	91f1                	srl	a1,a1,0x3c
    147c:	92f1                	srl	a3,a3,0x3c
    147e:	9371                	srl	a4,a4,0x3c
    1480:	974e                	add	a4,a4,s3
    1482:	944e                	add	s0,s0,s3
    1484:	92ce                	add	t0,t0,s3
    1486:	9fce                	add	t6,t6,s3
    1488:	9f4e                	add	t5,t5,s3
    148a:	9ece                	add	t4,t4,s3
    148c:	9e4e                	add	t3,t3,s3
    148e:	934e                	add	t1,t1,s3
    1490:	98ce                	add	a7,a7,s3
    1492:	93ce                	add	t2,t2,s3
    1494:	984e                	add	a6,a6,s3
    1496:	954e                	add	a0,a0,s3
    1498:	95ce                	add	a1,a1,s3
    149a:	96ce                	add	a3,a3,s3
    149c:	00074083          	lbu	ra,0(a4)
    14a0:	0002c283          	lbu	t0,0(t0)
    14a4:	000fcf83          	lbu	t6,0(t6)
    14a8:	000f4f03          	lbu	t5,0(t5)
    14ac:	000ece83          	lbu	t4,0(t4)
    14b0:	000e4e03          	lbu	t3,0(t3)
    14b4:	00034303          	lbu	t1,0(t1)
    14b8:	0008c883          	lbu	a7,0(a7)
    14bc:	0003c383          	lbu	t2,0(t2)
    14c0:	00084803          	lbu	a6,0(a6)
    14c4:	00054503          	lbu	a0,0(a0)
    14c8:	0005c583          	lbu	a1,0(a1)
    14cc:	0006c683          	lbu	a3,0(a3)
    14d0:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14d4:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14d8:	9371                	srl	a4,a4,0x3c
    14da:	8bbd                	and	a5,a5,15
    14dc:	974e                	add	a4,a4,s3
    14de:	97ce                	add	a5,a5,s3
    14e0:	005105a3          	sb	t0,11(sp)
    14e4:	01f10623          	sb	t6,12(sp)
    14e8:	01e106a3          	sb	t5,13(sp)
    14ec:	01d10723          	sb	t4,14(sp)
    14f0:	01c107a3          	sb	t3,15(sp)
    14f4:	00610823          	sb	t1,16(sp)
    14f8:	011108a3          	sb	a7,17(sp)
    14fc:	00710923          	sb	t2,18(sp)
    1500:	010109a3          	sb	a6,19(sp)
    1504:	00a10a23          	sb	a0,20(sp)
    1508:	00b10aa3          	sb	a1,21(sp)
    150c:	00d10b23          	sb	a3,22(sp)
    1510:	00110ba3          	sb	ra,23(sp)
    1514:	00810523          	sb	s0,10(sp)
    1518:	00074703          	lbu	a4,0(a4)
    151c:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1520:	002c                	add	a1,sp,8
    1522:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1524:	00e10c23          	sb	a4,24(sp)
    1528:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    152c:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1530:	7de000ef          	jal	1d0e <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1534:	00248513          	add	a0,s1,2
        if (!*s)
    1538:	00054783          	lbu	a5,0(a0)
    153c:	e8079ce3          	bnez	a5,13d4 <printf+0x4c>
    }
    va_end(ap);
}
    1540:	70e6                	ld	ra,120(sp)
    1542:	7446                	ld	s0,112(sp)
    1544:	74a6                	ld	s1,104(sp)
    1546:	7906                	ld	s2,96(sp)
    1548:	69e6                	ld	s3,88(sp)
    154a:	6a46                	ld	s4,80(sp)
    154c:	6aa6                	ld	s5,72(sp)
    154e:	6b06                	ld	s6,64(sp)
    1550:	7be2                	ld	s7,56(sp)
    1552:	6129                	add	sp,sp,192
    1554:	8082                	ret
    1556:	84b2                	mv	s1,a2
    1558:	a039                	j	1566 <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    155a:	0024c783          	lbu	a5,2(s1)
    155e:	0605                	add	a2,a2,1
    1560:	0489                	add	s1,s1,2
    1562:	e92791e3          	bne	a5,s2,13e4 <printf+0x5c>
    1566:	0014c783          	lbu	a5,1(s1)
    156a:	ff2788e3          	beq	a5,s2,155a <printf+0x1d2>
        l = z - a;
    156e:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1572:	85aa                	mv	a1,a0
    1574:	8622                	mv	a2,s0
    1576:	4505                	li	a0,1
    1578:	796000ef          	jal	1d0e <write>
        if (l)
    157c:	e6040de3          	beqz	s0,13f6 <printf+0x6e>
    1580:	8526                	mv	a0,s1
    1582:	b5a9                	j	13cc <printf+0x44>
        switch (s[1])
    1584:	05779963          	bne	a5,s7,15d6 <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    1588:	6782                	ld	a5,0(sp)
    158a:	45c1                	li	a1,16
    158c:	4388                	lw	a0,0(a5)
    158e:	07a1                	add	a5,a5,8
    1590:	e03e                	sd	a5,0(sp)
    1592:	bb7ff0ef          	jal	1148 <printint.constprop.0>
        s += 2;
    1596:	00248513          	add	a0,s1,2
    159a:	bf79                	j	1538 <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    159c:	6782                	ld	a5,0(sp)
    159e:	6380                	ld	s0,0(a5)
    15a0:	07a1                	add	a5,a5,8
    15a2:	e03e                	sd	a5,0(sp)
    15a4:	cc21                	beqz	s0,15fc <printf+0x274>
            l = strnlen(a, 200);
    15a6:	0c800593          	li	a1,200
    15aa:	8522                	mv	a0,s0
    15ac:	460000ef          	jal	1a0c <strnlen>
    write(f, s, l);
    15b0:	0005061b          	sext.w	a2,a0
    15b4:	85a2                	mv	a1,s0
    15b6:	4505                	li	a0,1
    15b8:	756000ef          	jal	1d0e <write>
        s += 2;
    15bc:	00248513          	add	a0,s1,2
    15c0:	bfa5                	j	1538 <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    15c2:	6782                	ld	a5,0(sp)
    15c4:	45a9                	li	a1,10
    15c6:	4388                	lw	a0,0(a5)
    15c8:	07a1                	add	a5,a5,8
    15ca:	e03e                	sd	a5,0(sp)
    15cc:	b7dff0ef          	jal	1148 <printint.constprop.0>
        s += 2;
    15d0:	00248513          	add	a0,s1,2
    15d4:	b795                	j	1538 <printf+0x1b0>
    return write(stdout, &byte, 1);
    15d6:	4605                	li	a2,1
    15d8:	002c                	add	a1,sp,8
    15da:	4505                	li	a0,1
    char byte = c;
    15dc:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15e0:	72e000ef          	jal	1d0e <write>
    char byte = c;
    15e4:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15e8:	4605                	li	a2,1
    15ea:	002c                	add	a1,sp,8
    15ec:	4505                	li	a0,1
    char byte = c;
    15ee:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15f2:	71c000ef          	jal	1d0e <write>
        s += 2;
    15f6:	00248513          	add	a0,s1,2
    15fa:	bf3d                	j	1538 <printf+0x1b0>
                a = "(null)";
    15fc:	00001417          	auipc	s0,0x1
    1600:	9fc40413          	add	s0,s0,-1540 # 1ff8 <__clone+0xb2>
    1604:	b74d                	j	15a6 <printf+0x21e>

0000000000001606 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1606:	1141                	add	sp,sp,-16
    1608:	e406                	sd	ra,8(sp)
    puts(m);
    160a:	d5dff0ef          	jal	1366 <puts>
    exit(-100);
}
    160e:	60a2                	ld	ra,8(sp)
    exit(-100);
    1610:	f9c00513          	li	a0,-100
}
    1614:	0141                	add	sp,sp,16
    exit(-100);
    1616:	a7a1                	j	1d5e <exit>

0000000000001618 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1618:	02000793          	li	a5,32
    161c:	00f50663          	beq	a0,a5,1628 <isspace+0x10>
    1620:	355d                	addw	a0,a0,-9
    1622:	00553513          	sltiu	a0,a0,5
    1626:	8082                	ret
    1628:	4505                	li	a0,1
}
    162a:	8082                	ret

000000000000162c <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    162c:	fd05051b          	addw	a0,a0,-48
}
    1630:	00a53513          	sltiu	a0,a0,10
    1634:	8082                	ret

0000000000001636 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1636:	02000713          	li	a4,32
    163a:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    163c:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1640:	ff76879b          	addw	a5,a3,-9
    1644:	06e68063          	beq	a3,a4,16a4 <atoi+0x6e>
    1648:	0006859b          	sext.w	a1,a3
    164c:	04f67c63          	bgeu	a2,a5,16a4 <atoi+0x6e>
        s++;
    switch (*s)
    1650:	02b00793          	li	a5,43
    1654:	06f68563          	beq	a3,a5,16be <atoi+0x88>
    1658:	02d00793          	li	a5,45
    165c:	04f69663          	bne	a3,a5,16a8 <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1660:	00154683          	lbu	a3,1(a0)
    1664:	47a5                	li	a5,9
        s++;
    1666:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    166a:	fd06869b          	addw	a3,a3,-48
    166e:	8636                	mv	a2,a3
    while (isdigit(*s))
    1670:	04d7e563          	bltu	a5,a3,16ba <atoi+0x84>
        neg = 1;
    1674:	4885                	li	a7,1
    int n = 0, neg = 0;
    1676:	4501                	li	a0,0
    while (isdigit(*s))
    1678:	4825                	li	a6,9
    167a:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    167e:	0025179b          	sllw	a5,a0,0x2
    1682:	9fa9                	addw	a5,a5,a0
    1684:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    1688:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    168c:	85b2                	mv	a1,a2
    168e:	40c7853b          	subw	a0,a5,a2
    1692:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    1694:	8636                	mv	a2,a3
    while (isdigit(*s))
    1696:	fed872e3          	bgeu	a6,a3,167a <atoi+0x44>
    return neg ? n : -n;
    169a:	02089163          	bnez	a7,16bc <atoi+0x86>
    169e:	40f5853b          	subw	a0,a1,a5
    16a2:	8082                	ret
        s++;
    16a4:	0505                	add	a0,a0,1
    16a6:	bf59                	j	163c <atoi+0x6>
    while (isdigit(*s))
    16a8:	fd05859b          	addw	a1,a1,-48
    16ac:	47a5                	li	a5,9
    16ae:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    16b0:	4881                	li	a7,0
    16b2:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    16b6:	fcb7f0e3          	bgeu	a5,a1,1676 <atoi+0x40>
    return neg ? n : -n;
    16ba:	4501                	li	a0,0
}
    16bc:	8082                	ret
    while (isdigit(*s))
    16be:	00154683          	lbu	a3,1(a0)
    16c2:	47a5                	li	a5,9
        s++;
    16c4:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    16c8:	fd06869b          	addw	a3,a3,-48
    16cc:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    16ce:	4881                	li	a7,0
    while (isdigit(*s))
    16d0:	fad7f3e3          	bgeu	a5,a3,1676 <atoi+0x40>
    return neg ? n : -n;
    16d4:	4501                	li	a0,0
    16d6:	8082                	ret

00000000000016d8 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16d8:	16060f63          	beqz	a2,1856 <memset+0x17e>
    16dc:	40a006b3          	neg	a3,a0
    16e0:	0076f793          	and	a5,a3,7
    16e4:	00778813          	add	a6,a5,7
    16e8:	48ad                	li	a7,11
    16ea:	0ff5f713          	zext.b	a4,a1
    16ee:	fff60593          	add	a1,a2,-1
    16f2:	17186363          	bltu	a6,a7,1858 <memset+0x180>
    16f6:	1705eb63          	bltu	a1,a6,186c <memset+0x194>
    16fa:	16078163          	beqz	a5,185c <memset+0x184>
    16fe:	00e50023          	sb	a4,0(a0)
    1702:	0066f593          	and	a1,a3,6
    1706:	14058e63          	beqz	a1,1862 <memset+0x18a>
    170a:	00e500a3          	sb	a4,1(a0)
    170e:	4589                	li	a1,2
    1710:	00250813          	add	a6,a0,2
    1714:	04f5f663          	bgeu	a1,a5,1760 <memset+0x88>
    1718:	00e50123          	sb	a4,2(a0)
    171c:	8a91                	and	a3,a3,4
    171e:	00350813          	add	a6,a0,3
    1722:	458d                	li	a1,3
    1724:	ce95                	beqz	a3,1760 <memset+0x88>
    1726:	00e501a3          	sb	a4,3(a0)
    172a:	4691                	li	a3,4
    172c:	00450813          	add	a6,a0,4
    1730:	4591                	li	a1,4
    1732:	02f6f763          	bgeu	a3,a5,1760 <memset+0x88>
    1736:	00e50223          	sb	a4,4(a0)
    173a:	4695                	li	a3,5
    173c:	00550813          	add	a6,a0,5
    1740:	4595                	li	a1,5
    1742:	00d78f63          	beq	a5,a3,1760 <memset+0x88>
    1746:	00e502a3          	sb	a4,5(a0)
    174a:	469d                	li	a3,7
    174c:	00650813          	add	a6,a0,6
    1750:	4599                	li	a1,6
    1752:	00d79763          	bne	a5,a3,1760 <memset+0x88>
    1756:	00750813          	add	a6,a0,7
    175a:	00e50323          	sb	a4,6(a0)
    175e:	459d                	li	a1,7
    1760:	00871693          	sll	a3,a4,0x8
    1764:	01071313          	sll	t1,a4,0x10
    1768:	8ed9                	or	a3,a3,a4
    176a:	01871893          	sll	a7,a4,0x18
    176e:	0066e6b3          	or	a3,a3,t1
    1772:	0116e6b3          	or	a3,a3,a7
    1776:	02071313          	sll	t1,a4,0x20
    177a:	02871893          	sll	a7,a4,0x28
    177e:	0066e6b3          	or	a3,a3,t1
    1782:	40f60e33          	sub	t3,a2,a5
    1786:	03071313          	sll	t1,a4,0x30
    178a:	0116e6b3          	or	a3,a3,a7
    178e:	0066e6b3          	or	a3,a3,t1
    1792:	03871893          	sll	a7,a4,0x38
    1796:	97aa                	add	a5,a5,a0
    1798:	ff8e7313          	and	t1,t3,-8
    179c:	0116e6b3          	or	a3,a3,a7
    17a0:	00f308b3          	add	a7,t1,a5
    17a4:	e394                	sd	a3,0(a5)
    17a6:	07a1                	add	a5,a5,8
    17a8:	ff179ee3          	bne	a5,a7,17a4 <memset+0xcc>
    17ac:	006806b3          	add	a3,a6,t1
    17b0:	00b307bb          	addw	a5,t1,a1
    17b4:	0bc30b63          	beq	t1,t3,186a <memset+0x192>
    17b8:	00e68023          	sb	a4,0(a3)
    17bc:	0017859b          	addw	a1,a5,1
    17c0:	08c5fb63          	bgeu	a1,a2,1856 <memset+0x17e>
    17c4:	00e680a3          	sb	a4,1(a3)
    17c8:	0027859b          	addw	a1,a5,2
    17cc:	08c5f563          	bgeu	a1,a2,1856 <memset+0x17e>
    17d0:	00e68123          	sb	a4,2(a3)
    17d4:	0037859b          	addw	a1,a5,3
    17d8:	06c5ff63          	bgeu	a1,a2,1856 <memset+0x17e>
    17dc:	00e681a3          	sb	a4,3(a3)
    17e0:	0047859b          	addw	a1,a5,4
    17e4:	06c5f963          	bgeu	a1,a2,1856 <memset+0x17e>
    17e8:	00e68223          	sb	a4,4(a3)
    17ec:	0057859b          	addw	a1,a5,5
    17f0:	06c5f363          	bgeu	a1,a2,1856 <memset+0x17e>
    17f4:	00e682a3          	sb	a4,5(a3)
    17f8:	0067859b          	addw	a1,a5,6
    17fc:	04c5fd63          	bgeu	a1,a2,1856 <memset+0x17e>
    1800:	00e68323          	sb	a4,6(a3)
    1804:	0077859b          	addw	a1,a5,7
    1808:	04c5f763          	bgeu	a1,a2,1856 <memset+0x17e>
    180c:	00e683a3          	sb	a4,7(a3)
    1810:	0087859b          	addw	a1,a5,8
    1814:	04c5f163          	bgeu	a1,a2,1856 <memset+0x17e>
    1818:	00e68423          	sb	a4,8(a3)
    181c:	0097859b          	addw	a1,a5,9
    1820:	02c5fb63          	bgeu	a1,a2,1856 <memset+0x17e>
    1824:	00e684a3          	sb	a4,9(a3)
    1828:	00a7859b          	addw	a1,a5,10
    182c:	02c5f563          	bgeu	a1,a2,1856 <memset+0x17e>
    1830:	00e68523          	sb	a4,10(a3)
    1834:	00b7859b          	addw	a1,a5,11
    1838:	00c5ff63          	bgeu	a1,a2,1856 <memset+0x17e>
    183c:	00e685a3          	sb	a4,11(a3)
    1840:	00c7859b          	addw	a1,a5,12
    1844:	00c5f963          	bgeu	a1,a2,1856 <memset+0x17e>
    1848:	00e68623          	sb	a4,12(a3)
    184c:	27b5                	addw	a5,a5,13
    184e:	00c7f463          	bgeu	a5,a2,1856 <memset+0x17e>
    1852:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    1856:	8082                	ret
    1858:	482d                	li	a6,11
    185a:	bd71                	j	16f6 <memset+0x1e>
    char *p = dest;
    185c:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    185e:	4581                	li	a1,0
    1860:	b701                	j	1760 <memset+0x88>
    1862:	00150813          	add	a6,a0,1
    1866:	4585                	li	a1,1
    1868:	bde5                	j	1760 <memset+0x88>
    186a:	8082                	ret
    char *p = dest;
    186c:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    186e:	4781                	li	a5,0
    1870:	b7a1                	j	17b8 <memset+0xe0>

0000000000001872 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1872:	00054783          	lbu	a5,0(a0)
    1876:	0005c703          	lbu	a4,0(a1)
    187a:	00e79863          	bne	a5,a4,188a <strcmp+0x18>
    187e:	0505                	add	a0,a0,1
    1880:	0585                	add	a1,a1,1
    1882:	fbe5                	bnez	a5,1872 <strcmp>
    1884:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1886:	9d19                	subw	a0,a0,a4
    1888:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    188a:	0007851b          	sext.w	a0,a5
    188e:	bfe5                	j	1886 <strcmp+0x14>

0000000000001890 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1890:	ca15                	beqz	a2,18c4 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1892:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1896:	167d                	add	a2,a2,-1
    1898:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    189c:	eb99                	bnez	a5,18b2 <strncmp+0x22>
    189e:	a815                	j	18d2 <strncmp+0x42>
    18a0:	00a68e63          	beq	a3,a0,18bc <strncmp+0x2c>
    18a4:	0505                	add	a0,a0,1
    18a6:	00f71b63          	bne	a4,a5,18bc <strncmp+0x2c>
    18aa:	00054783          	lbu	a5,0(a0)
    18ae:	cf89                	beqz	a5,18c8 <strncmp+0x38>
    18b0:	85b2                	mv	a1,a2
    18b2:	0005c703          	lbu	a4,0(a1)
    18b6:	00158613          	add	a2,a1,1
    18ba:	f37d                	bnez	a4,18a0 <strncmp+0x10>
        ;
    return *l - *r;
    18bc:	0007851b          	sext.w	a0,a5
    18c0:	9d19                	subw	a0,a0,a4
    18c2:	8082                	ret
        return 0;
    18c4:	4501                	li	a0,0
}
    18c6:	8082                	ret
    return *l - *r;
    18c8:	0015c703          	lbu	a4,1(a1)
    18cc:	4501                	li	a0,0
    18ce:	9d19                	subw	a0,a0,a4
    18d0:	8082                	ret
    18d2:	0005c703          	lbu	a4,0(a1)
    18d6:	4501                	li	a0,0
    18d8:	b7e5                	j	18c0 <strncmp+0x30>

00000000000018da <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18da:	00757793          	and	a5,a0,7
    18de:	cf89                	beqz	a5,18f8 <strlen+0x1e>
    18e0:	87aa                	mv	a5,a0
    18e2:	a029                	j	18ec <strlen+0x12>
    18e4:	0785                	add	a5,a5,1
    18e6:	0077f713          	and	a4,a5,7
    18ea:	cb01                	beqz	a4,18fa <strlen+0x20>
        if (!*s)
    18ec:	0007c703          	lbu	a4,0(a5)
    18f0:	fb75                	bnez	a4,18e4 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18f2:	40a78533          	sub	a0,a5,a0
}
    18f6:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18f8:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18fa:	feff05b7          	lui	a1,0xfeff0
    18fe:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedee7>
    1902:	f0101637          	lui	a2,0xf0101
    1906:	05c2                	sll	a1,a1,0x10
    1908:	0612                	sll	a2,a2,0x4
    190a:	6394                	ld	a3,0(a5)
    190c:	eff58593          	add	a1,a1,-257
    1910:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff0e9>
    1914:	05c2                	sll	a1,a1,0x10
    1916:	0642                	sll	a2,a2,0x10
    1918:	eff58593          	add	a1,a1,-257
    191c:	10160613          	add	a2,a2,257
    1920:	00b68733          	add	a4,a3,a1
    1924:	063e                	sll	a2,a2,0xf
    1926:	fff6c693          	not	a3,a3
    192a:	8f75                	and	a4,a4,a3
    192c:	08060613          	add	a2,a2,128
    1930:	8f71                	and	a4,a4,a2
    1932:	eb11                	bnez	a4,1946 <strlen+0x6c>
    1934:	6794                	ld	a3,8(a5)
    1936:	07a1                	add	a5,a5,8
    1938:	00b68733          	add	a4,a3,a1
    193c:	fff6c693          	not	a3,a3
    1940:	8f75                	and	a4,a4,a3
    1942:	8f71                	and	a4,a4,a2
    1944:	db65                	beqz	a4,1934 <strlen+0x5a>
    for (; *s; s++)
    1946:	0007c703          	lbu	a4,0(a5)
    194a:	d745                	beqz	a4,18f2 <strlen+0x18>
    194c:	0017c703          	lbu	a4,1(a5)
    1950:	0785                	add	a5,a5,1
    1952:	d345                	beqz	a4,18f2 <strlen+0x18>
    1954:	0017c703          	lbu	a4,1(a5)
    1958:	0785                	add	a5,a5,1
    195a:	fb6d                	bnez	a4,194c <strlen+0x72>
    195c:	bf59                	j	18f2 <strlen+0x18>

000000000000195e <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    195e:	00757713          	and	a4,a0,7
{
    1962:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1964:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1968:	cb19                	beqz	a4,197e <memchr+0x20>
    196a:	ce59                	beqz	a2,1a08 <memchr+0xaa>
    196c:	0007c703          	lbu	a4,0(a5)
    1970:	00b70963          	beq	a4,a1,1982 <memchr+0x24>
    1974:	0785                	add	a5,a5,1
    1976:	0077f713          	and	a4,a5,7
    197a:	167d                	add	a2,a2,-1
    197c:	f77d                	bnez	a4,196a <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    197e:	4501                	li	a0,0
    if (n && *s != c)
    1980:	c649                	beqz	a2,1a0a <memchr+0xac>
    1982:	0007c703          	lbu	a4,0(a5)
    1986:	06b70663          	beq	a4,a1,19f2 <memchr+0x94>
        size_t k = ONES * c;
    198a:	01010737          	lui	a4,0x1010
    198e:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e0e9>
    1992:	0742                	sll	a4,a4,0x10
    1994:	10170713          	add	a4,a4,257
    1998:	0742                	sll	a4,a4,0x10
    199a:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    199e:	469d                	li	a3,7
        size_t k = ONES * c;
    19a0:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19a4:	04c6f763          	bgeu	a3,a2,19f2 <memchr+0x94>
    19a8:	f0101837          	lui	a6,0xf0101
    19ac:	feff08b7          	lui	a7,0xfeff0
    19b0:	0812                	sll	a6,a6,0x4
    19b2:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedee7>
    19b6:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff0e9>
    19ba:	08c2                	sll	a7,a7,0x10
    19bc:	0842                	sll	a6,a6,0x10
    19be:	eff88893          	add	a7,a7,-257
    19c2:	10180813          	add	a6,a6,257
    19c6:	08c2                	sll	a7,a7,0x10
    19c8:	083e                	sll	a6,a6,0xf
    19ca:	eff88893          	add	a7,a7,-257
    19ce:	08080813          	add	a6,a6,128
    19d2:	431d                	li	t1,7
    19d4:	a029                	j	19de <memchr+0x80>
    19d6:	1661                	add	a2,a2,-8
    19d8:	07a1                	add	a5,a5,8
    19da:	02c37663          	bgeu	t1,a2,1a06 <memchr+0xa8>
    19de:	6398                	ld	a4,0(a5)
    19e0:	8f29                	xor	a4,a4,a0
    19e2:	011706b3          	add	a3,a4,a7
    19e6:	fff74713          	not	a4,a4
    19ea:	8f75                	and	a4,a4,a3
    19ec:	01077733          	and	a4,a4,a6
    19f0:	d37d                	beqz	a4,19d6 <memchr+0x78>
        s = (const void *)w;
    19f2:	853e                	mv	a0,a5
    19f4:	a019                	j	19fa <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    19f6:	0505                	add	a0,a0,1
    19f8:	ca01                	beqz	a2,1a08 <memchr+0xaa>
    19fa:	00054783          	lbu	a5,0(a0)
    19fe:	167d                	add	a2,a2,-1
    1a00:	feb79be3          	bne	a5,a1,19f6 <memchr+0x98>
    1a04:	8082                	ret
    1a06:	f675                	bnez	a2,19f2 <memchr+0x94>
    return n ? (void *)s : 0;
    1a08:	4501                	li	a0,0
}
    1a0a:	8082                	ret

0000000000001a0c <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1a0c:	1101                	add	sp,sp,-32
    1a0e:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1a10:	862e                	mv	a2,a1
{
    1a12:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1a14:	4581                	li	a1,0
{
    1a16:	e426                	sd	s1,8(sp)
    1a18:	ec06                	sd	ra,24(sp)
    1a1a:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1a1c:	f43ff0ef          	jal	195e <memchr>
    return p ? p - s : n;
    1a20:	c519                	beqz	a0,1a2e <strnlen+0x22>
}
    1a22:	60e2                	ld	ra,24(sp)
    1a24:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1a26:	8d05                	sub	a0,a0,s1
}
    1a28:	64a2                	ld	s1,8(sp)
    1a2a:	6105                	add	sp,sp,32
    1a2c:	8082                	ret
    1a2e:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1a30:	8522                	mv	a0,s0
}
    1a32:	6442                	ld	s0,16(sp)
    1a34:	64a2                	ld	s1,8(sp)
    1a36:	6105                	add	sp,sp,32
    1a38:	8082                	ret

0000000000001a3a <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a3a:	00b547b3          	xor	a5,a0,a1
    1a3e:	8b9d                	and	a5,a5,7
    1a40:	efb1                	bnez	a5,1a9c <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a42:	0075f793          	and	a5,a1,7
    1a46:	ebb5                	bnez	a5,1aba <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a48:	feff0637          	lui	a2,0xfeff0
    1a4c:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedee7>
    1a50:	f01016b7          	lui	a3,0xf0101
    1a54:	0642                	sll	a2,a2,0x10
    1a56:	0692                	sll	a3,a3,0x4
    1a58:	6198                	ld	a4,0(a1)
    1a5a:	eff60613          	add	a2,a2,-257
    1a5e:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff0e9>
    1a62:	0642                	sll	a2,a2,0x10
    1a64:	06c2                	sll	a3,a3,0x10
    1a66:	eff60613          	add	a2,a2,-257
    1a6a:	10168693          	add	a3,a3,257
    1a6e:	00c707b3          	add	a5,a4,a2
    1a72:	fff74813          	not	a6,a4
    1a76:	06be                	sll	a3,a3,0xf
    1a78:	0107f7b3          	and	a5,a5,a6
    1a7c:	08068693          	add	a3,a3,128
    1a80:	8ff5                	and	a5,a5,a3
    1a82:	ef89                	bnez	a5,1a9c <strcpy+0x62>
    1a84:	05a1                	add	a1,a1,8
    1a86:	e118                	sd	a4,0(a0)
    1a88:	6198                	ld	a4,0(a1)
    1a8a:	0521                	add	a0,a0,8
    1a8c:	00c707b3          	add	a5,a4,a2
    1a90:	fff74813          	not	a6,a4
    1a94:	0107f7b3          	and	a5,a5,a6
    1a98:	8ff5                	and	a5,a5,a3
    1a9a:	d7ed                	beqz	a5,1a84 <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a9c:	0005c783          	lbu	a5,0(a1)
    1aa0:	00f50023          	sb	a5,0(a0)
    1aa4:	c785                	beqz	a5,1acc <strcpy+0x92>
    1aa6:	0015c783          	lbu	a5,1(a1)
    1aaa:	0505                	add	a0,a0,1
    1aac:	0585                	add	a1,a1,1
    1aae:	00f50023          	sb	a5,0(a0)
    1ab2:	fbf5                	bnez	a5,1aa6 <strcpy+0x6c>
        ;
    return d;
}
    1ab4:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1ab6:	0505                	add	a0,a0,1
    1ab8:	db41                	beqz	a4,1a48 <strcpy+0xe>
            if (!(*d = *s))
    1aba:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1abe:	0585                	add	a1,a1,1
    1ac0:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1ac4:	00f50023          	sb	a5,0(a0)
    1ac8:	f7fd                	bnez	a5,1ab6 <strcpy+0x7c>
}
    1aca:	8082                	ret
    1acc:	8082                	ret

0000000000001ace <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1ace:	00b547b3          	xor	a5,a0,a1
    1ad2:	8b9d                	and	a5,a5,7
    1ad4:	efbd                	bnez	a5,1b52 <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1ad6:	0075f793          	and	a5,a1,7
    1ada:	1c078563          	beqz	a5,1ca4 <strncpy+0x1d6>
    1ade:	ea11                	bnez	a2,1af2 <strncpy+0x24>
    1ae0:	8082                	ret
    1ae2:	0585                	add	a1,a1,1
    1ae4:	0075f793          	and	a5,a1,7
    1ae8:	167d                	add	a2,a2,-1
    1aea:	0505                	add	a0,a0,1
    1aec:	1a078c63          	beqz	a5,1ca4 <strncpy+0x1d6>
    1af0:	ca3d                	beqz	a2,1b66 <strncpy+0x98>
    1af2:	0005c783          	lbu	a5,0(a1)
    1af6:	00f50023          	sb	a5,0(a0)
    1afa:	f7e5                	bnez	a5,1ae2 <strncpy+0x14>
            ;
        if (!n || !*s)
    1afc:	0005c783          	lbu	a5,0(a1)
    1b00:	c7a5                	beqz	a5,1b68 <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b02:	479d                	li	a5,7
    1b04:	04c7f863          	bgeu	a5,a2,1b54 <strncpy+0x86>
    1b08:	f01016b7          	lui	a3,0xf0101
    1b0c:	feff0837          	lui	a6,0xfeff0
    1b10:	0692                	sll	a3,a3,0x4
    1b12:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedee7>
    1b16:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff0e9>
    1b1a:	0842                	sll	a6,a6,0x10
    1b1c:	06c2                	sll	a3,a3,0x10
    1b1e:	eff80813          	add	a6,a6,-257
    1b22:	10168693          	add	a3,a3,257
    1b26:	0842                	sll	a6,a6,0x10
    1b28:	06be                	sll	a3,a3,0xf
    1b2a:	eff80813          	add	a6,a6,-257
    1b2e:	08068693          	add	a3,a3,128
    1b32:	431d                	li	t1,7
    1b34:	6198                	ld	a4,0(a1)
    1b36:	010707b3          	add	a5,a4,a6
    1b3a:	fff74893          	not	a7,a4
    1b3e:	0117f7b3          	and	a5,a5,a7
    1b42:	8ff5                	and	a5,a5,a3
    1b44:	eb81                	bnez	a5,1b54 <strncpy+0x86>
            *wd = *ws;
    1b46:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b48:	1661                	add	a2,a2,-8
    1b4a:	05a1                	add	a1,a1,8
    1b4c:	0521                	add	a0,a0,8
    1b4e:	fec363e3          	bltu	t1,a2,1b34 <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b52:	ca11                	beqz	a2,1b66 <strncpy+0x98>
    1b54:	0005c783          	lbu	a5,0(a1)
    1b58:	0585                	add	a1,a1,1
    1b5a:	00f50023          	sb	a5,0(a0)
    1b5e:	c789                	beqz	a5,1b68 <strncpy+0x9a>
    1b60:	167d                	add	a2,a2,-1
    1b62:	0505                	add	a0,a0,1
    1b64:	fa65                	bnez	a2,1b54 <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b66:	8082                	ret
    1b68:	40a00733          	neg	a4,a0
    1b6c:	00777793          	and	a5,a4,7
    1b70:	00778693          	add	a3,a5,7
    1b74:	482d                	li	a6,11
    1b76:	fff60593          	add	a1,a2,-1
    1b7a:	1106ef63          	bltu	a3,a6,1c98 <strncpy+0x1ca>
    1b7e:	12d5ee63          	bltu	a1,a3,1cba <strncpy+0x1ec>
    1b82:	12078563          	beqz	a5,1cac <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b86:	00050023          	sb	zero,0(a0)
    1b8a:	00677693          	and	a3,a4,6
    1b8e:	12068263          	beqz	a3,1cb2 <strncpy+0x1e4>
    1b92:	000500a3          	sb	zero,1(a0)
    1b96:	4689                	li	a3,2
    1b98:	12f6f463          	bgeu	a3,a5,1cc0 <strncpy+0x1f2>
    1b9c:	00050123          	sb	zero,2(a0)
    1ba0:	8b11                	and	a4,a4,4
    1ba2:	cf6d                	beqz	a4,1c9c <strncpy+0x1ce>
    1ba4:	000501a3          	sb	zero,3(a0)
    1ba8:	4711                	li	a4,4
    1baa:	00450693          	add	a3,a0,4
    1bae:	02f77363          	bgeu	a4,a5,1bd4 <strncpy+0x106>
    1bb2:	00050223          	sb	zero,4(a0)
    1bb6:	4715                	li	a4,5
    1bb8:	00550693          	add	a3,a0,5
    1bbc:	00e78c63          	beq	a5,a4,1bd4 <strncpy+0x106>
    1bc0:	000502a3          	sb	zero,5(a0)
    1bc4:	471d                	li	a4,7
    1bc6:	10e79163          	bne	a5,a4,1cc8 <strncpy+0x1fa>
    1bca:	00750693          	add	a3,a0,7
    1bce:	00050323          	sb	zero,6(a0)
    1bd2:	471d                	li	a4,7
    1bd4:	40f608b3          	sub	a7,a2,a5
    1bd8:	ff88f813          	and	a6,a7,-8
    1bdc:	97aa                	add	a5,a5,a0
    1bde:	010785b3          	add	a1,a5,a6
    1be2:	0007b023          	sd	zero,0(a5)
    1be6:	07a1                	add	a5,a5,8
    1be8:	feb79de3          	bne	a5,a1,1be2 <strncpy+0x114>
    1bec:	00e807bb          	addw	a5,a6,a4
    1bf0:	01068733          	add	a4,a3,a6
    1bf4:	0b088b63          	beq	a7,a6,1caa <strncpy+0x1dc>
    1bf8:	00070023          	sb	zero,0(a4)
    1bfc:	0017869b          	addw	a3,a5,1
    1c00:	f6c6f3e3          	bgeu	a3,a2,1b66 <strncpy+0x98>
    1c04:	000700a3          	sb	zero,1(a4)
    1c08:	0027869b          	addw	a3,a5,2
    1c0c:	f4c6fde3          	bgeu	a3,a2,1b66 <strncpy+0x98>
    1c10:	00070123          	sb	zero,2(a4)
    1c14:	0037869b          	addw	a3,a5,3
    1c18:	f4c6f7e3          	bgeu	a3,a2,1b66 <strncpy+0x98>
    1c1c:	000701a3          	sb	zero,3(a4)
    1c20:	0047869b          	addw	a3,a5,4
    1c24:	f4c6f1e3          	bgeu	a3,a2,1b66 <strncpy+0x98>
    1c28:	00070223          	sb	zero,4(a4)
    1c2c:	0057869b          	addw	a3,a5,5
    1c30:	f2c6fbe3          	bgeu	a3,a2,1b66 <strncpy+0x98>
    1c34:	000702a3          	sb	zero,5(a4)
    1c38:	0067869b          	addw	a3,a5,6
    1c3c:	f2c6f5e3          	bgeu	a3,a2,1b66 <strncpy+0x98>
    1c40:	00070323          	sb	zero,6(a4)
    1c44:	0077869b          	addw	a3,a5,7
    1c48:	f0c6ffe3          	bgeu	a3,a2,1b66 <strncpy+0x98>
    1c4c:	000703a3          	sb	zero,7(a4)
    1c50:	0087869b          	addw	a3,a5,8
    1c54:	f0c6f9e3          	bgeu	a3,a2,1b66 <strncpy+0x98>
    1c58:	00070423          	sb	zero,8(a4)
    1c5c:	0097869b          	addw	a3,a5,9
    1c60:	f0c6f3e3          	bgeu	a3,a2,1b66 <strncpy+0x98>
    1c64:	000704a3          	sb	zero,9(a4)
    1c68:	00a7869b          	addw	a3,a5,10
    1c6c:	eec6fde3          	bgeu	a3,a2,1b66 <strncpy+0x98>
    1c70:	00070523          	sb	zero,10(a4)
    1c74:	00b7869b          	addw	a3,a5,11
    1c78:	eec6f7e3          	bgeu	a3,a2,1b66 <strncpy+0x98>
    1c7c:	000705a3          	sb	zero,11(a4)
    1c80:	00c7869b          	addw	a3,a5,12
    1c84:	eec6f1e3          	bgeu	a3,a2,1b66 <strncpy+0x98>
    1c88:	00070623          	sb	zero,12(a4)
    1c8c:	27b5                	addw	a5,a5,13
    1c8e:	ecc7fce3          	bgeu	a5,a2,1b66 <strncpy+0x98>
    1c92:	000706a3          	sb	zero,13(a4)
}
    1c96:	8082                	ret
    1c98:	46ad                	li	a3,11
    1c9a:	b5d5                	j	1b7e <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c9c:	00350693          	add	a3,a0,3
    1ca0:	470d                	li	a4,3
    1ca2:	bf0d                	j	1bd4 <strncpy+0x106>
        if (!n || !*s)
    1ca4:	e4061ce3          	bnez	a2,1afc <strncpy+0x2e>
}
    1ca8:	8082                	ret
    1caa:	8082                	ret
    char *p = dest;
    1cac:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cae:	4701                	li	a4,0
    1cb0:	b715                	j	1bd4 <strncpy+0x106>
    1cb2:	00150693          	add	a3,a0,1
    1cb6:	4705                	li	a4,1
    1cb8:	bf31                	j	1bd4 <strncpy+0x106>
    char *p = dest;
    1cba:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cbc:	4781                	li	a5,0
    1cbe:	bf2d                	j	1bf8 <strncpy+0x12a>
    1cc0:	00250693          	add	a3,a0,2
    1cc4:	4709                	li	a4,2
    1cc6:	b739                	j	1bd4 <strncpy+0x106>
    1cc8:	00650693          	add	a3,a0,6
    1ccc:	4719                	li	a4,6
    1cce:	b719                	j	1bd4 <strncpy+0x106>

0000000000001cd0 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1cd0:	87aa                	mv	a5,a0
    1cd2:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1cd4:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1cd8:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1cdc:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1cde:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ce0:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1ce4:	2501                	sext.w	a0,a0
    1ce6:	8082                	ret

0000000000001ce8 <openat>:
    register long a7 __asm__("a7") = n;
    1ce8:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1cec:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cf0:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
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
