
/home/brightnight/OScompetition/6.13晚final_main/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/exit：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a075                	j	10ae <__start_main>

0000000000001004 <test_exit>:
 * 测试成功则输出：
 * "exit OK."
 * 测试失败则输出：
 * "exit ERR."
 */
void test_exit(void){
    1004:	1101                	addi	sp,sp,-32
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	ef250513          	addi	a0,a0,-270 # 1ef8 <__clone+0x2c>
void test_exit(void){
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
    TEST_START(__func__);
    1012:	30e000ef          	jal	ra,1320 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	f7a50513          	addi	a0,a0,-134 # 1f90 <__func__.0>
    101e:	302000ef          	jal	ra,1320 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	eee50513          	addi	a0,a0,-274 # 1f10 <__clone+0x44>
    102a:	2f6000ef          	jal	ra,1320 <puts>
    int cpid, waitret, wstatus;
    cpid = fork();
    102e:	495000ef          	jal	ra,1cc2 <fork>
    assert(cpid != -1);
    1032:	57fd                	li	a5,-1
    cpid = fork();
    1034:	842a                	mv	s0,a0
    assert(cpid != -1);
    1036:	02f50b63          	beq	a0,a5,106c <test_exit+0x68>
    if(cpid == 0){
    103a:	ed1d                	bnez	a0,1078 <test_exit+0x74>
        exit(0);
    103c:	4a9000ef          	jal	ra,1ce4 <exit>
    }else{
        waitret = wait(&wstatus);
        if(waitret == cpid) printf("exit OK.\n");
        else printf("exit ERR.\n");
    }
    TEST_END(__func__);
    1040:	00001517          	auipc	a0,0x1
    1044:	f2050513          	addi	a0,a0,-224 # 1f60 <__clone+0x94>
    1048:	2d8000ef          	jal	ra,1320 <puts>
    104c:	00001517          	auipc	a0,0x1
    1050:	f4450513          	addi	a0,a0,-188 # 1f90 <__func__.0>
    1054:	2cc000ef          	jal	ra,1320 <puts>
    1058:	00001517          	auipc	a0,0x1
    105c:	eb850513          	addi	a0,a0,-328 # 1f10 <__clone+0x44>
    1060:	2c0000ef          	jal	ra,1320 <puts>
}
    1064:	60e2                	ld	ra,24(sp)
    1066:	6442                	ld	s0,16(sp)
    1068:	6105                	addi	sp,sp,32
    106a:	8082                	ret
    assert(cpid != -1);
    106c:	00001517          	auipc	a0,0x1
    1070:	eb450513          	addi	a0,a0,-332 # 1f20 <__clone+0x54>
    1074:	552000ef          	jal	ra,15c6 <panic>
        waitret = wait(&wstatus);
    1078:	0068                	addi	a0,sp,12
    107a:	52f000ef          	jal	ra,1da8 <wait>
        if(waitret == cpid) printf("exit OK.\n");
    107e:	00a40963          	beq	s0,a0,1090 <test_exit+0x8c>
        else printf("exit ERR.\n");
    1082:	00001517          	auipc	a0,0x1
    1086:	ece50513          	addi	a0,a0,-306 # 1f50 <__clone+0x84>
    108a:	2b8000ef          	jal	ra,1342 <printf>
    108e:	bf4d                	j	1040 <test_exit+0x3c>
        if(waitret == cpid) printf("exit OK.\n");
    1090:	00001517          	auipc	a0,0x1
    1094:	eb050513          	addi	a0,a0,-336 # 1f40 <__clone+0x74>
    1098:	2aa000ef          	jal	ra,1342 <printf>
    109c:	b755                	j	1040 <test_exit+0x3c>

000000000000109e <main>:

int main(void){
    109e:	1141                	addi	sp,sp,-16
    10a0:	e406                	sd	ra,8(sp)
    test_exit();
    10a2:	f63ff0ef          	jal	ra,1004 <test_exit>
    return 0;
}
    10a6:	60a2                	ld	ra,8(sp)
    10a8:	4501                	li	a0,0
    10aa:	0141                	addi	sp,sp,16
    10ac:	8082                	ret

00000000000010ae <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10ae:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10b0:	4108                	lw	a0,0(a0)
{
    10b2:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10b4:	05a1                	addi	a1,a1,8
{
    10b6:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10b8:	fe7ff0ef          	jal	ra,109e <main>
    10bc:	429000ef          	jal	ra,1ce4 <exit>
	return 0;
}
    10c0:	60a2                	ld	ra,8(sp)
    10c2:	4501                	li	a0,0
    10c4:	0141                	addi	sp,sp,16
    10c6:	8082                	ret

00000000000010c8 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10c8:	7179                	addi	sp,sp,-48
    10ca:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10cc:	12054b63          	bltz	a0,1202 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10d0:	02b577bb          	remuw	a5,a0,a1
    10d4:	00001617          	auipc	a2,0x1
    10d8:	ecc60613          	addi	a2,a2,-308 # 1fa0 <digits>
    buf[16] = 0;
    10dc:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10e0:	0005871b          	sext.w	a4,a1
    10e4:	1782                	slli	a5,a5,0x20
    10e6:	9381                	srli	a5,a5,0x20
    10e8:	97b2                	add	a5,a5,a2
    10ea:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10ee:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10f2:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10f6:	1cb56363          	bltu	a0,a1,12bc <printint.constprop.0+0x1f4>
        buf[i--] = digits[x % base];
    10fa:	45b9                	li	a1,14
    10fc:	02e877bb          	remuw	a5,a6,a4
    1100:	1782                	slli	a5,a5,0x20
    1102:	9381                	srli	a5,a5,0x20
    1104:	97b2                	add	a5,a5,a2
    1106:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    110a:	02e856bb          	divuw	a3,a6,a4
        buf[i--] = digits[x % base];
    110e:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    1112:	0ce86e63          	bltu	a6,a4,11ee <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    1116:	02e6f5bb          	remuw	a1,a3,a4
    } while ((x /= base) != 0);
    111a:	02e6d7bb          	divuw	a5,a3,a4
        buf[i--] = digits[x % base];
    111e:	1582                	slli	a1,a1,0x20
    1120:	9181                	srli	a1,a1,0x20
    1122:	95b2                	add	a1,a1,a2
    1124:	0005c583          	lbu	a1,0(a1)
    1128:	00b10aa3          	sb	a1,21(sp)
    } while ((x /= base) != 0);
    112c:	0007859b          	sext.w	a1,a5
    1130:	12e6ec63          	bltu	a3,a4,1268 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    1134:	02e7f6bb          	remuw	a3,a5,a4
    1138:	1682                	slli	a3,a3,0x20
    113a:	9281                	srli	a3,a3,0x20
    113c:	96b2                	add	a3,a3,a2
    113e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1142:	02e7d83b          	divuw	a6,a5,a4
        buf[i--] = digits[x % base];
    1146:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    114a:	12e5e863          	bltu	a1,a4,127a <printint.constprop.0+0x1b2>
        buf[i--] = digits[x % base];
    114e:	02e876bb          	remuw	a3,a6,a4
    1152:	1682                	slli	a3,a3,0x20
    1154:	9281                	srli	a3,a3,0x20
    1156:	96b2                	add	a3,a3,a2
    1158:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    115c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1160:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1164:	12e86463          	bltu	a6,a4,128c <printint.constprop.0+0x1c4>
        buf[i--] = digits[x % base];
    1168:	02e5f6bb          	remuw	a3,a1,a4
    116c:	1682                	slli	a3,a3,0x20
    116e:	9281                	srli	a3,a3,0x20
    1170:	96b2                	add	a3,a3,a2
    1172:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1176:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    117a:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    117e:	0ce5ec63          	bltu	a1,a4,1256 <printint.constprop.0+0x18e>
        buf[i--] = digits[x % base];
    1182:	02e876bb          	remuw	a3,a6,a4
    1186:	1682                	slli	a3,a3,0x20
    1188:	9281                	srli	a3,a3,0x20
    118a:	96b2                	add	a3,a3,a2
    118c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1190:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1194:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1198:	10e86963          	bltu	a6,a4,12aa <printint.constprop.0+0x1e2>
        buf[i--] = digits[x % base];
    119c:	02e5f6bb          	remuw	a3,a1,a4
    11a0:	1682                	slli	a3,a3,0x20
    11a2:	9281                	srli	a3,a3,0x20
    11a4:	96b2                	add	a3,a3,a2
    11a6:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11aa:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11ae:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11b2:	10e5e763          	bltu	a1,a4,12c0 <printint.constprop.0+0x1f8>
        buf[i--] = digits[x % base];
    11b6:	02e876bb          	remuw	a3,a6,a4
    11ba:	1682                	slli	a3,a3,0x20
    11bc:	9281                	srli	a3,a3,0x20
    11be:	96b2                	add	a3,a3,a2
    11c0:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11c4:	02e857bb          	divuw	a5,a6,a4
        buf[i--] = digits[x % base];
    11c8:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11cc:	10e86363          	bltu	a6,a4,12d2 <printint.constprop.0+0x20a>
        buf[i--] = digits[x % base];
    11d0:	1782                	slli	a5,a5,0x20
    11d2:	9381                	srli	a5,a5,0x20
    11d4:	97b2                	add	a5,a5,a2
    11d6:	0007c783          	lbu	a5,0(a5)
    11da:	4599                	li	a1,6
    11dc:	00f10723          	sb	a5,14(sp)

    if (sign)
    11e0:	00055763          	bgez	a0,11ee <printint.constprop.0+0x126>
        buf[i--] = '-';
    11e4:	02d00793          	li	a5,45
    11e8:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11ec:	4595                	li	a1,5
    write(f, s, l);
    11ee:	003c                	addi	a5,sp,8
    11f0:	4641                	li	a2,16
    11f2:	9e0d                	subw	a2,a2,a1
    11f4:	4505                	li	a0,1
    11f6:	95be                	add	a1,a1,a5
    11f8:	29d000ef          	jal	ra,1c94 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11fc:	70a2                	ld	ra,40(sp)
    11fe:	6145                	addi	sp,sp,48
    1200:	8082                	ret
        x = -xx;
    1202:	40a0083b          	negw	a6,a0
        buf[i--] = digits[x % base];
    1206:	02b877bb          	remuw	a5,a6,a1
    120a:	00001617          	auipc	a2,0x1
    120e:	d9660613          	addi	a2,a2,-618 # 1fa0 <digits>
    buf[16] = 0;
    1212:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1216:	0005871b          	sext.w	a4,a1
    121a:	1782                	slli	a5,a5,0x20
    121c:	9381                	srli	a5,a5,0x20
    121e:	97b2                	add	a5,a5,a2
    1220:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1224:	02b858bb          	divuw	a7,a6,a1
        buf[i--] = digits[x % base];
    1228:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    122c:	06b86963          	bltu	a6,a1,129e <printint.constprop.0+0x1d6>
        buf[i--] = digits[x % base];
    1230:	02e8f7bb          	remuw	a5,a7,a4
    1234:	1782                	slli	a5,a5,0x20
    1236:	9381                	srli	a5,a5,0x20
    1238:	97b2                	add	a5,a5,a2
    123a:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    123e:	02e8d6bb          	divuw	a3,a7,a4
        buf[i--] = digits[x % base];
    1242:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    1246:	ece8f8e3          	bgeu	a7,a4,1116 <printint.constprop.0+0x4e>
        buf[i--] = '-';
    124a:	02d00793          	li	a5,45
    124e:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1252:	45b5                	li	a1,13
    1254:	bf69                	j	11ee <printint.constprop.0+0x126>
    1256:	45a9                	li	a1,10
    if (sign)
    1258:	f8055be3          	bgez	a0,11ee <printint.constprop.0+0x126>
        buf[i--] = '-';
    125c:	02d00793          	li	a5,45
    1260:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1264:	45a5                	li	a1,9
    1266:	b761                	j	11ee <printint.constprop.0+0x126>
    1268:	45b5                	li	a1,13
    if (sign)
    126a:	f80552e3          	bgez	a0,11ee <printint.constprop.0+0x126>
        buf[i--] = '-';
    126e:	02d00793          	li	a5,45
    1272:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1276:	45b1                	li	a1,12
    1278:	bf9d                	j	11ee <printint.constprop.0+0x126>
    127a:	45b1                	li	a1,12
    if (sign)
    127c:	f60559e3          	bgez	a0,11ee <printint.constprop.0+0x126>
        buf[i--] = '-';
    1280:	02d00793          	li	a5,45
    1284:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1288:	45ad                	li	a1,11
    128a:	b795                	j	11ee <printint.constprop.0+0x126>
    128c:	45ad                	li	a1,11
    if (sign)
    128e:	f60550e3          	bgez	a0,11ee <printint.constprop.0+0x126>
        buf[i--] = '-';
    1292:	02d00793          	li	a5,45
    1296:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    129a:	45a9                	li	a1,10
    129c:	bf89                	j	11ee <printint.constprop.0+0x126>
        buf[i--] = '-';
    129e:	02d00793          	li	a5,45
    12a2:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12a6:	45b9                	li	a1,14
    12a8:	b799                	j	11ee <printint.constprop.0+0x126>
    12aa:	45a5                	li	a1,9
    if (sign)
    12ac:	f40551e3          	bgez	a0,11ee <printint.constprop.0+0x126>
        buf[i--] = '-';
    12b0:	02d00793          	li	a5,45
    12b4:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12b8:	45a1                	li	a1,8
    12ba:	bf15                	j	11ee <printint.constprop.0+0x126>
    i = 15;
    12bc:	45bd                	li	a1,15
    12be:	bf05                	j	11ee <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    12c0:	45a1                	li	a1,8
    if (sign)
    12c2:	f20556e3          	bgez	a0,11ee <printint.constprop.0+0x126>
        buf[i--] = '-';
    12c6:	02d00793          	li	a5,45
    12ca:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12ce:	459d                	li	a1,7
    12d0:	bf39                	j	11ee <printint.constprop.0+0x126>
    12d2:	459d                	li	a1,7
    if (sign)
    12d4:	f0055de3          	bgez	a0,11ee <printint.constprop.0+0x126>
        buf[i--] = '-';
    12d8:	02d00793          	li	a5,45
    12dc:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12e0:	4599                	li	a1,6
    12e2:	b731                	j	11ee <printint.constprop.0+0x126>

00000000000012e4 <getchar>:
{
    12e4:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12e6:	00f10593          	addi	a1,sp,15
    12ea:	4605                	li	a2,1
    12ec:	4501                	li	a0,0
{
    12ee:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12f0:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12f4:	197000ef          	jal	ra,1c8a <read>
}
    12f8:	60e2                	ld	ra,24(sp)
    12fa:	00f14503          	lbu	a0,15(sp)
    12fe:	6105                	addi	sp,sp,32
    1300:	8082                	ret

0000000000001302 <putchar>:
{
    1302:	1101                	addi	sp,sp,-32
    1304:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1306:	00f10593          	addi	a1,sp,15
    130a:	4605                	li	a2,1
    130c:	4505                	li	a0,1
{
    130e:	ec06                	sd	ra,24(sp)
    char byte = c;
    1310:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1314:	181000ef          	jal	ra,1c94 <write>
}
    1318:	60e2                	ld	ra,24(sp)
    131a:	2501                	sext.w	a0,a0
    131c:	6105                	addi	sp,sp,32
    131e:	8082                	ret

0000000000001320 <puts>:
{
    1320:	1141                	addi	sp,sp,-16
    1322:	e406                	sd	ra,8(sp)
    1324:	e022                	sd	s0,0(sp)
    1326:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1328:	57e000ef          	jal	ra,18a6 <strlen>
    132c:	862a                	mv	a2,a0
    132e:	85a2                	mv	a1,s0
    1330:	4505                	li	a0,1
    1332:	163000ef          	jal	ra,1c94 <write>
}
    1336:	60a2                	ld	ra,8(sp)
    1338:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    133a:	957d                	srai	a0,a0,0x3f
    return r;
    133c:	2501                	sext.w	a0,a0
}
    133e:	0141                	addi	sp,sp,16
    1340:	8082                	ret

0000000000001342 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1342:	7171                	addi	sp,sp,-176
    1344:	fc56                	sd	s5,56(sp)
    1346:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1348:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    134a:	18bc                	addi	a5,sp,120
{
    134c:	e8ca                	sd	s2,80(sp)
    134e:	e4ce                	sd	s3,72(sp)
    1350:	e0d2                	sd	s4,64(sp)
    1352:	f85a                	sd	s6,48(sp)
    1354:	f486                	sd	ra,104(sp)
    1356:	f0a2                	sd	s0,96(sp)
    1358:	eca6                	sd	s1,88(sp)
    135a:	fcae                	sd	a1,120(sp)
    135c:	e132                	sd	a2,128(sp)
    135e:	e536                	sd	a3,136(sp)
    1360:	e93a                	sd	a4,144(sp)
    1362:	f142                	sd	a6,160(sp)
    1364:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1366:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1368:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    136c:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1370:	00001b17          	auipc	s6,0x1
    1374:	c00b0b13          	addi	s6,s6,-1024 # 1f70 <__clone+0xa4>
    buf[i++] = '0';
    1378:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    137c:	00001997          	auipc	s3,0x1
    1380:	c2498993          	addi	s3,s3,-988 # 1fa0 <digits>
        if (!*s)
    1384:	00054783          	lbu	a5,0(a0)
    1388:	16078a63          	beqz	a5,14fc <printf+0x1ba>
    138c:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    138e:	19278163          	beq	a5,s2,1510 <printf+0x1ce>
    1392:	00164783          	lbu	a5,1(a2)
    1396:	0605                	addi	a2,a2,1
    1398:	fbfd                	bnez	a5,138e <printf+0x4c>
    139a:	84b2                	mv	s1,a2
        l = z - a;
    139c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13a0:	85aa                	mv	a1,a0
    13a2:	8622                	mv	a2,s0
    13a4:	4505                	li	a0,1
    13a6:	0ef000ef          	jal	ra,1c94 <write>
        if (l)
    13aa:	18041c63          	bnez	s0,1542 <printf+0x200>
        if (s[1] == 0)
    13ae:	0014c783          	lbu	a5,1(s1)
    13b2:	14078563          	beqz	a5,14fc <printf+0x1ba>
        switch (s[1])
    13b6:	1d478063          	beq	a5,s4,1576 <printf+0x234>
    13ba:	18fa6663          	bltu	s4,a5,1546 <printf+0x204>
    13be:	06400713          	li	a4,100
    13c2:	1ae78063          	beq	a5,a4,1562 <printf+0x220>
    13c6:	07000713          	li	a4,112
    13ca:	1ce79963          	bne	a5,a4,159c <printf+0x25a>
            printptr(va_arg(ap, uint64));
    13ce:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13d0:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13d4:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13d6:	631c                	ld	a5,0(a4)
    13d8:	0721                	addi	a4,a4,8
    13da:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13dc:	00479293          	slli	t0,a5,0x4
    13e0:	00879f93          	slli	t6,a5,0x8
    13e4:	00c79f13          	slli	t5,a5,0xc
    13e8:	01079e93          	slli	t4,a5,0x10
    13ec:	01479e13          	slli	t3,a5,0x14
    13f0:	01879313          	slli	t1,a5,0x18
    13f4:	01c79893          	slli	a7,a5,0x1c
    13f8:	02479813          	slli	a6,a5,0x24
    13fc:	02879513          	slli	a0,a5,0x28
    1400:	02c79593          	slli	a1,a5,0x2c
    1404:	03079693          	slli	a3,a5,0x30
    1408:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    140c:	03c7d413          	srli	s0,a5,0x3c
    1410:	01c7d39b          	srliw	t2,a5,0x1c
    1414:	03c2d293          	srli	t0,t0,0x3c
    1418:	03cfdf93          	srli	t6,t6,0x3c
    141c:	03cf5f13          	srli	t5,t5,0x3c
    1420:	03cede93          	srli	t4,t4,0x3c
    1424:	03ce5e13          	srli	t3,t3,0x3c
    1428:	03c35313          	srli	t1,t1,0x3c
    142c:	03c8d893          	srli	a7,a7,0x3c
    1430:	03c85813          	srli	a6,a6,0x3c
    1434:	9171                	srli	a0,a0,0x3c
    1436:	91f1                	srli	a1,a1,0x3c
    1438:	92f1                	srli	a3,a3,0x3c
    143a:	9371                	srli	a4,a4,0x3c
    143c:	96ce                	add	a3,a3,s3
    143e:	974e                	add	a4,a4,s3
    1440:	944e                	add	s0,s0,s3
    1442:	92ce                	add	t0,t0,s3
    1444:	9fce                	add	t6,t6,s3
    1446:	9f4e                	add	t5,t5,s3
    1448:	9ece                	add	t4,t4,s3
    144a:	9e4e                	add	t3,t3,s3
    144c:	934e                	add	t1,t1,s3
    144e:	98ce                	add	a7,a7,s3
    1450:	93ce                	add	t2,t2,s3
    1452:	984e                	add	a6,a6,s3
    1454:	954e                	add	a0,a0,s3
    1456:	95ce                	add	a1,a1,s3
    1458:	0006c083          	lbu	ra,0(a3)
    145c:	0002c283          	lbu	t0,0(t0)
    1460:	00074683          	lbu	a3,0(a4)
    1464:	000fcf83          	lbu	t6,0(t6)
    1468:	000f4f03          	lbu	t5,0(t5)
    146c:	000ece83          	lbu	t4,0(t4)
    1470:	000e4e03          	lbu	t3,0(t3)
    1474:	00034303          	lbu	t1,0(t1)
    1478:	0008c883          	lbu	a7,0(a7)
    147c:	0003c383          	lbu	t2,0(t2)
    1480:	00084803          	lbu	a6,0(a6)
    1484:	00054503          	lbu	a0,0(a0)
    1488:	0005c583          	lbu	a1,0(a1)
    148c:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1490:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1494:	9371                	srli	a4,a4,0x3c
    1496:	8bbd                	andi	a5,a5,15
    1498:	974e                	add	a4,a4,s3
    149a:	97ce                	add	a5,a5,s3
    149c:	005105a3          	sb	t0,11(sp)
    14a0:	01f10623          	sb	t6,12(sp)
    14a4:	01e106a3          	sb	t5,13(sp)
    14a8:	01d10723          	sb	t4,14(sp)
    14ac:	01c107a3          	sb	t3,15(sp)
    14b0:	00610823          	sb	t1,16(sp)
    14b4:	011108a3          	sb	a7,17(sp)
    14b8:	00710923          	sb	t2,18(sp)
    14bc:	010109a3          	sb	a6,19(sp)
    14c0:	00a10a23          	sb	a0,20(sp)
    14c4:	00b10aa3          	sb	a1,21(sp)
    14c8:	00110b23          	sb	ra,22(sp)
    14cc:	00d10ba3          	sb	a3,23(sp)
    14d0:	00810523          	sb	s0,10(sp)
    14d4:	00074703          	lbu	a4,0(a4)
    14d8:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14dc:	002c                	addi	a1,sp,8
    14de:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14e0:	00e10c23          	sb	a4,24(sp)
    14e4:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14e8:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14ec:	7a8000ef          	jal	ra,1c94 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14f0:	00248513          	addi	a0,s1,2
        if (!*s)
    14f4:	00054783          	lbu	a5,0(a0)
    14f8:	e8079ae3          	bnez	a5,138c <printf+0x4a>
    }
    va_end(ap);
}
    14fc:	70a6                	ld	ra,104(sp)
    14fe:	7406                	ld	s0,96(sp)
    1500:	64e6                	ld	s1,88(sp)
    1502:	6946                	ld	s2,80(sp)
    1504:	69a6                	ld	s3,72(sp)
    1506:	6a06                	ld	s4,64(sp)
    1508:	7ae2                	ld	s5,56(sp)
    150a:	7b42                	ld	s6,48(sp)
    150c:	614d                	addi	sp,sp,176
    150e:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1510:	00064783          	lbu	a5,0(a2)
    1514:	84b2                	mv	s1,a2
    1516:	01278963          	beq	a5,s2,1528 <printf+0x1e6>
    151a:	b549                	j	139c <printf+0x5a>
    151c:	0024c783          	lbu	a5,2(s1)
    1520:	0605                	addi	a2,a2,1
    1522:	0489                	addi	s1,s1,2
    1524:	e7279ce3          	bne	a5,s2,139c <printf+0x5a>
    1528:	0014c783          	lbu	a5,1(s1)
    152c:	ff2788e3          	beq	a5,s2,151c <printf+0x1da>
        l = z - a;
    1530:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1534:	85aa                	mv	a1,a0
    1536:	8622                	mv	a2,s0
    1538:	4505                	li	a0,1
    153a:	75a000ef          	jal	ra,1c94 <write>
        if (l)
    153e:	e60408e3          	beqz	s0,13ae <printf+0x6c>
    1542:	8526                	mv	a0,s1
    1544:	b581                	j	1384 <printf+0x42>
        switch (s[1])
    1546:	07800713          	li	a4,120
    154a:	04e79963          	bne	a5,a4,159c <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    154e:	6782                	ld	a5,0(sp)
    1550:	45c1                	li	a1,16
    1552:	4388                	lw	a0,0(a5)
    1554:	07a1                	addi	a5,a5,8
    1556:	e03e                	sd	a5,0(sp)
    1558:	b71ff0ef          	jal	ra,10c8 <printint.constprop.0>
        s += 2;
    155c:	00248513          	addi	a0,s1,2
    1560:	bf51                	j	14f4 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    1562:	6782                	ld	a5,0(sp)
    1564:	45a9                	li	a1,10
    1566:	4388                	lw	a0,0(a5)
    1568:	07a1                	addi	a5,a5,8
    156a:	e03e                	sd	a5,0(sp)
    156c:	b5dff0ef          	jal	ra,10c8 <printint.constprop.0>
        s += 2;
    1570:	00248513          	addi	a0,s1,2
    1574:	b741                	j	14f4 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1576:	6782                	ld	a5,0(sp)
    1578:	6380                	ld	s0,0(a5)
    157a:	07a1                	addi	a5,a5,8
    157c:	e03e                	sd	a5,0(sp)
    157e:	c031                	beqz	s0,15c2 <printf+0x280>
            l = strnlen(a, 200);
    1580:	0c800593          	li	a1,200
    1584:	8522                	mv	a0,s0
    1586:	40c000ef          	jal	ra,1992 <strnlen>
    write(f, s, l);
    158a:	0005061b          	sext.w	a2,a0
    158e:	85a2                	mv	a1,s0
    1590:	4505                	li	a0,1
    1592:	702000ef          	jal	ra,1c94 <write>
        s += 2;
    1596:	00248513          	addi	a0,s1,2
    159a:	bfa9                	j	14f4 <printf+0x1b2>
    return write(stdout, &byte, 1);
    159c:	4605                	li	a2,1
    159e:	002c                	addi	a1,sp,8
    15a0:	4505                	li	a0,1
    char byte = c;
    15a2:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15a6:	6ee000ef          	jal	ra,1c94 <write>
    char byte = c;
    15aa:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15ae:	4605                	li	a2,1
    15b0:	002c                	addi	a1,sp,8
    15b2:	4505                	li	a0,1
    char byte = c;
    15b4:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15b8:	6dc000ef          	jal	ra,1c94 <write>
        s += 2;
    15bc:	00248513          	addi	a0,s1,2
    15c0:	bf15                	j	14f4 <printf+0x1b2>
                a = "(null)";
    15c2:	845a                	mv	s0,s6
    15c4:	bf75                	j	1580 <printf+0x23e>

00000000000015c6 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15c6:	1141                	addi	sp,sp,-16
    15c8:	e406                	sd	ra,8(sp)
    puts(m);
    15ca:	d57ff0ef          	jal	ra,1320 <puts>
    exit(-100);
}
    15ce:	60a2                	ld	ra,8(sp)
    exit(-100);
    15d0:	f9c00513          	li	a0,-100
}
    15d4:	0141                	addi	sp,sp,16
    exit(-100);
    15d6:	a739                	j	1ce4 <exit>

00000000000015d8 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d8:	02000793          	li	a5,32
    15dc:	00f50663          	beq	a0,a5,15e8 <isspace+0x10>
    15e0:	355d                	addiw	a0,a0,-9
    15e2:	00553513          	sltiu	a0,a0,5
    15e6:	8082                	ret
    15e8:	4505                	li	a0,1
}
    15ea:	8082                	ret

00000000000015ec <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15ec:	fd05051b          	addiw	a0,a0,-48
}
    15f0:	00a53513          	sltiu	a0,a0,10
    15f4:	8082                	ret

00000000000015f6 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15f6:	02000613          	li	a2,32
    15fa:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15fc:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1600:	ff77869b          	addiw	a3,a5,-9
    1604:	04c78c63          	beq	a5,a2,165c <atoi+0x66>
    1608:	0007871b          	sext.w	a4,a5
    160c:	04d5f863          	bgeu	a1,a3,165c <atoi+0x66>
        s++;
    switch (*s)
    1610:	02b00693          	li	a3,43
    1614:	04d78963          	beq	a5,a3,1666 <atoi+0x70>
    1618:	02d00693          	li	a3,45
    161c:	06d78263          	beq	a5,a3,1680 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1620:	fd07061b          	addiw	a2,a4,-48
    1624:	47a5                	li	a5,9
    1626:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1628:	4e01                	li	t3,0
    while (isdigit(*s))
    162a:	04c7e963          	bltu	a5,a2,167c <atoi+0x86>
    int n = 0, neg = 0;
    162e:	4501                	li	a0,0
    while (isdigit(*s))
    1630:	4825                	li	a6,9
    1632:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    1636:	0025179b          	slliw	a5,a0,0x2
    163a:	9fa9                	addw	a5,a5,a0
    163c:	fd07031b          	addiw	t1,a4,-48
    1640:	0017989b          	slliw	a7,a5,0x1
    while (isdigit(*s))
    1644:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1648:	0685                	addi	a3,a3,1
    164a:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    164e:	0006071b          	sext.w	a4,a2
    1652:	feb870e3          	bgeu	a6,a1,1632 <atoi+0x3c>
    return neg ? n : -n;
    1656:	000e0563          	beqz	t3,1660 <atoi+0x6a>
}
    165a:	8082                	ret
        s++;
    165c:	0505                	addi	a0,a0,1
    165e:	bf79                	j	15fc <atoi+0x6>
    return neg ? n : -n;
    1660:	4113053b          	subw	a0,t1,a7
    1664:	8082                	ret
    while (isdigit(*s))
    1666:	00154703          	lbu	a4,1(a0)
    166a:	47a5                	li	a5,9
        s++;
    166c:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1670:	fd07061b          	addiw	a2,a4,-48
    int n = 0, neg = 0;
    1674:	4e01                	li	t3,0
    while (isdigit(*s))
    1676:	2701                	sext.w	a4,a4
    1678:	fac7fbe3          	bgeu	a5,a2,162e <atoi+0x38>
    167c:	4501                	li	a0,0
}
    167e:	8082                	ret
    while (isdigit(*s))
    1680:	00154703          	lbu	a4,1(a0)
    1684:	47a5                	li	a5,9
        s++;
    1686:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    168a:	fd07061b          	addiw	a2,a4,-48
    168e:	2701                	sext.w	a4,a4
    1690:	fec7e6e3          	bltu	a5,a2,167c <atoi+0x86>
        neg = 1;
    1694:	4e05                	li	t3,1
    1696:	bf61                	j	162e <atoi+0x38>

0000000000001698 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1698:	16060d63          	beqz	a2,1812 <memset+0x17a>
    169c:	40a007b3          	neg	a5,a0
    16a0:	8b9d                	andi	a5,a5,7
    16a2:	00778693          	addi	a3,a5,7
    16a6:	482d                	li	a6,11
    16a8:	0ff5f713          	zext.b	a4,a1
    16ac:	fff60593          	addi	a1,a2,-1
    16b0:	1706e263          	bltu	a3,a6,1814 <memset+0x17c>
    16b4:	16d5ea63          	bltu	a1,a3,1828 <memset+0x190>
    16b8:	16078563          	beqz	a5,1822 <memset+0x18a>
    16bc:	00e50023          	sb	a4,0(a0)
    16c0:	4685                	li	a3,1
    16c2:	00150593          	addi	a1,a0,1
    16c6:	14d78c63          	beq	a5,a3,181e <memset+0x186>
    16ca:	00e500a3          	sb	a4,1(a0)
    16ce:	4689                	li	a3,2
    16d0:	00250593          	addi	a1,a0,2
    16d4:	14d78d63          	beq	a5,a3,182e <memset+0x196>
    16d8:	00e50123          	sb	a4,2(a0)
    16dc:	468d                	li	a3,3
    16de:	00350593          	addi	a1,a0,3
    16e2:	12d78b63          	beq	a5,a3,1818 <memset+0x180>
    16e6:	00e501a3          	sb	a4,3(a0)
    16ea:	4691                	li	a3,4
    16ec:	00450593          	addi	a1,a0,4
    16f0:	14d78163          	beq	a5,a3,1832 <memset+0x19a>
    16f4:	00e50223          	sb	a4,4(a0)
    16f8:	4695                	li	a3,5
    16fa:	00550593          	addi	a1,a0,5
    16fe:	12d78c63          	beq	a5,a3,1836 <memset+0x19e>
    1702:	00e502a3          	sb	a4,5(a0)
    1706:	469d                	li	a3,7
    1708:	00650593          	addi	a1,a0,6
    170c:	12d79763          	bne	a5,a3,183a <memset+0x1a2>
    1710:	00750593          	addi	a1,a0,7
    1714:	00e50323          	sb	a4,6(a0)
    1718:	481d                	li	a6,7
    171a:	00871693          	slli	a3,a4,0x8
    171e:	01071893          	slli	a7,a4,0x10
    1722:	8ed9                	or	a3,a3,a4
    1724:	01871313          	slli	t1,a4,0x18
    1728:	0116e6b3          	or	a3,a3,a7
    172c:	0066e6b3          	or	a3,a3,t1
    1730:	02071893          	slli	a7,a4,0x20
    1734:	02871e13          	slli	t3,a4,0x28
    1738:	0116e6b3          	or	a3,a3,a7
    173c:	40f60333          	sub	t1,a2,a5
    1740:	03071893          	slli	a7,a4,0x30
    1744:	01c6e6b3          	or	a3,a3,t3
    1748:	0116e6b3          	or	a3,a3,a7
    174c:	03871e13          	slli	t3,a4,0x38
    1750:	97aa                	add	a5,a5,a0
    1752:	ff837893          	andi	a7,t1,-8
    1756:	01c6e6b3          	or	a3,a3,t3
    175a:	98be                	add	a7,a7,a5
    175c:	e394                	sd	a3,0(a5)
    175e:	07a1                	addi	a5,a5,8
    1760:	ff179ee3          	bne	a5,a7,175c <memset+0xc4>
    1764:	ff837893          	andi	a7,t1,-8
    1768:	011587b3          	add	a5,a1,a7
    176c:	010886bb          	addw	a3,a7,a6
    1770:	0b130663          	beq	t1,a7,181c <memset+0x184>
    1774:	00e78023          	sb	a4,0(a5)
    1778:	0016859b          	addiw	a1,a3,1
    177c:	08c5fb63          	bgeu	a1,a2,1812 <memset+0x17a>
    1780:	00e780a3          	sb	a4,1(a5)
    1784:	0026859b          	addiw	a1,a3,2
    1788:	08c5f563          	bgeu	a1,a2,1812 <memset+0x17a>
    178c:	00e78123          	sb	a4,2(a5)
    1790:	0036859b          	addiw	a1,a3,3
    1794:	06c5ff63          	bgeu	a1,a2,1812 <memset+0x17a>
    1798:	00e781a3          	sb	a4,3(a5)
    179c:	0046859b          	addiw	a1,a3,4
    17a0:	06c5f963          	bgeu	a1,a2,1812 <memset+0x17a>
    17a4:	00e78223          	sb	a4,4(a5)
    17a8:	0056859b          	addiw	a1,a3,5
    17ac:	06c5f363          	bgeu	a1,a2,1812 <memset+0x17a>
    17b0:	00e782a3          	sb	a4,5(a5)
    17b4:	0066859b          	addiw	a1,a3,6
    17b8:	04c5fd63          	bgeu	a1,a2,1812 <memset+0x17a>
    17bc:	00e78323          	sb	a4,6(a5)
    17c0:	0076859b          	addiw	a1,a3,7
    17c4:	04c5f763          	bgeu	a1,a2,1812 <memset+0x17a>
    17c8:	00e783a3          	sb	a4,7(a5)
    17cc:	0086859b          	addiw	a1,a3,8
    17d0:	04c5f163          	bgeu	a1,a2,1812 <memset+0x17a>
    17d4:	00e78423          	sb	a4,8(a5)
    17d8:	0096859b          	addiw	a1,a3,9
    17dc:	02c5fb63          	bgeu	a1,a2,1812 <memset+0x17a>
    17e0:	00e784a3          	sb	a4,9(a5)
    17e4:	00a6859b          	addiw	a1,a3,10
    17e8:	02c5f563          	bgeu	a1,a2,1812 <memset+0x17a>
    17ec:	00e78523          	sb	a4,10(a5)
    17f0:	00b6859b          	addiw	a1,a3,11
    17f4:	00c5ff63          	bgeu	a1,a2,1812 <memset+0x17a>
    17f8:	00e785a3          	sb	a4,11(a5)
    17fc:	00c6859b          	addiw	a1,a3,12
    1800:	00c5f963          	bgeu	a1,a2,1812 <memset+0x17a>
    1804:	00e78623          	sb	a4,12(a5)
    1808:	26b5                	addiw	a3,a3,13
    180a:	00c6f463          	bgeu	a3,a2,1812 <memset+0x17a>
    180e:	00e786a3          	sb	a4,13(a5)
        ;
    return dest;
}
    1812:	8082                	ret
    1814:	46ad                	li	a3,11
    1816:	bd79                	j	16b4 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1818:	480d                	li	a6,3
    181a:	b701                	j	171a <memset+0x82>
    181c:	8082                	ret
    181e:	4805                	li	a6,1
    1820:	bded                	j	171a <memset+0x82>
    1822:	85aa                	mv	a1,a0
    1824:	4801                	li	a6,0
    1826:	bdd5                	j	171a <memset+0x82>
    1828:	87aa                	mv	a5,a0
    182a:	4681                	li	a3,0
    182c:	b7a1                	j	1774 <memset+0xdc>
    182e:	4809                	li	a6,2
    1830:	b5ed                	j	171a <memset+0x82>
    1832:	4811                	li	a6,4
    1834:	b5dd                	j	171a <memset+0x82>
    1836:	4815                	li	a6,5
    1838:	b5cd                	j	171a <memset+0x82>
    183a:	4819                	li	a6,6
    183c:	bdf9                	j	171a <memset+0x82>

000000000000183e <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    183e:	00054783          	lbu	a5,0(a0)
    1842:	0005c703          	lbu	a4,0(a1)
    1846:	00e79863          	bne	a5,a4,1856 <strcmp+0x18>
    184a:	0505                	addi	a0,a0,1
    184c:	0585                	addi	a1,a1,1
    184e:	fbe5                	bnez	a5,183e <strcmp>
    1850:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1852:	9d19                	subw	a0,a0,a4
    1854:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1856:	0007851b          	sext.w	a0,a5
    185a:	bfe5                	j	1852 <strcmp+0x14>

000000000000185c <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    185c:	ca15                	beqz	a2,1890 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    185e:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1862:	167d                	addi	a2,a2,-1
    1864:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1868:	eb99                	bnez	a5,187e <strncmp+0x22>
    186a:	a815                	j	189e <strncmp+0x42>
    186c:	00a68e63          	beq	a3,a0,1888 <strncmp+0x2c>
    1870:	0505                	addi	a0,a0,1
    1872:	00f71b63          	bne	a4,a5,1888 <strncmp+0x2c>
    1876:	00054783          	lbu	a5,0(a0)
    187a:	cf89                	beqz	a5,1894 <strncmp+0x38>
    187c:	85b2                	mv	a1,a2
    187e:	0005c703          	lbu	a4,0(a1)
    1882:	00158613          	addi	a2,a1,1
    1886:	f37d                	bnez	a4,186c <strncmp+0x10>
        ;
    return *l - *r;
    1888:	0007851b          	sext.w	a0,a5
    188c:	9d19                	subw	a0,a0,a4
    188e:	8082                	ret
        return 0;
    1890:	4501                	li	a0,0
}
    1892:	8082                	ret
    return *l - *r;
    1894:	0015c703          	lbu	a4,1(a1)
    1898:	4501                	li	a0,0
    189a:	9d19                	subw	a0,a0,a4
    189c:	8082                	ret
    189e:	0005c703          	lbu	a4,0(a1)
    18a2:	4501                	li	a0,0
    18a4:	b7e5                	j	188c <strncmp+0x30>

00000000000018a6 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18a6:	00757793          	andi	a5,a0,7
    18aa:	cf89                	beqz	a5,18c4 <strlen+0x1e>
    18ac:	87aa                	mv	a5,a0
    18ae:	a029                	j	18b8 <strlen+0x12>
    18b0:	0785                	addi	a5,a5,1
    18b2:	0077f713          	andi	a4,a5,7
    18b6:	cb01                	beqz	a4,18c6 <strlen+0x20>
        if (!*s)
    18b8:	0007c703          	lbu	a4,0(a5)
    18bc:	fb75                	bnez	a4,18b0 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18be:	40a78533          	sub	a0,a5,a0
}
    18c2:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18c4:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18c6:	6394                	ld	a3,0(a5)
    18c8:	00000597          	auipc	a1,0x0
    18cc:	6b05b583          	ld	a1,1712(a1) # 1f78 <__clone+0xac>
    18d0:	00000617          	auipc	a2,0x0
    18d4:	6b063603          	ld	a2,1712(a2) # 1f80 <__clone+0xb4>
    18d8:	a019                	j	18de <strlen+0x38>
    18da:	6794                	ld	a3,8(a5)
    18dc:	07a1                	addi	a5,a5,8
    18de:	00b68733          	add	a4,a3,a1
    18e2:	fff6c693          	not	a3,a3
    18e6:	8f75                	and	a4,a4,a3
    18e8:	8f71                	and	a4,a4,a2
    18ea:	db65                	beqz	a4,18da <strlen+0x34>
    for (; *s; s++)
    18ec:	0007c703          	lbu	a4,0(a5)
    18f0:	d779                	beqz	a4,18be <strlen+0x18>
    18f2:	0017c703          	lbu	a4,1(a5)
    18f6:	0785                	addi	a5,a5,1
    18f8:	d379                	beqz	a4,18be <strlen+0x18>
    18fa:	0017c703          	lbu	a4,1(a5)
    18fe:	0785                	addi	a5,a5,1
    1900:	fb6d                	bnez	a4,18f2 <strlen+0x4c>
    1902:	bf75                	j	18be <strlen+0x18>

0000000000001904 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1904:	00757713          	andi	a4,a0,7
{
    1908:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    190a:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    190e:	cb19                	beqz	a4,1924 <memchr+0x20>
    1910:	ce25                	beqz	a2,1988 <memchr+0x84>
    1912:	0007c703          	lbu	a4,0(a5)
    1916:	04b70e63          	beq	a4,a1,1972 <memchr+0x6e>
    191a:	0785                	addi	a5,a5,1
    191c:	0077f713          	andi	a4,a5,7
    1920:	167d                	addi	a2,a2,-1
    1922:	f77d                	bnez	a4,1910 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1924:	4501                	li	a0,0
    if (n && *s != c)
    1926:	c235                	beqz	a2,198a <memchr+0x86>
    1928:	0007c703          	lbu	a4,0(a5)
    192c:	04b70363          	beq	a4,a1,1972 <memchr+0x6e>
        size_t k = ONES * c;
    1930:	00000517          	auipc	a0,0x0
    1934:	65853503          	ld	a0,1624(a0) # 1f88 <__clone+0xbc>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1938:	471d                	li	a4,7
        size_t k = ONES * c;
    193a:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    193e:	02c77a63          	bgeu	a4,a2,1972 <memchr+0x6e>
    1942:	00000897          	auipc	a7,0x0
    1946:	6368b883          	ld	a7,1590(a7) # 1f78 <__clone+0xac>
    194a:	00000817          	auipc	a6,0x0
    194e:	63683803          	ld	a6,1590(a6) # 1f80 <__clone+0xb4>
    1952:	431d                	li	t1,7
    1954:	a029                	j	195e <memchr+0x5a>
    1956:	1661                	addi	a2,a2,-8
    1958:	07a1                	addi	a5,a5,8
    195a:	02c37963          	bgeu	t1,a2,198c <memchr+0x88>
    195e:	6398                	ld	a4,0(a5)
    1960:	8f29                	xor	a4,a4,a0
    1962:	011706b3          	add	a3,a4,a7
    1966:	fff74713          	not	a4,a4
    196a:	8f75                	and	a4,a4,a3
    196c:	01077733          	and	a4,a4,a6
    1970:	d37d                	beqz	a4,1956 <memchr+0x52>
{
    1972:	853e                	mv	a0,a5
    1974:	97b2                	add	a5,a5,a2
    1976:	a021                	j	197e <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1978:	0505                	addi	a0,a0,1
    197a:	00f50763          	beq	a0,a5,1988 <memchr+0x84>
    197e:	00054703          	lbu	a4,0(a0)
    1982:	feb71be3          	bne	a4,a1,1978 <memchr+0x74>
    1986:	8082                	ret
    return n ? (void *)s : 0;
    1988:	4501                	li	a0,0
}
    198a:	8082                	ret
    return n ? (void *)s : 0;
    198c:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    198e:	f275                	bnez	a2,1972 <memchr+0x6e>
}
    1990:	8082                	ret

0000000000001992 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1992:	1101                	addi	sp,sp,-32
    1994:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1996:	862e                	mv	a2,a1
{
    1998:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    199a:	4581                	li	a1,0
{
    199c:	e426                	sd	s1,8(sp)
    199e:	ec06                	sd	ra,24(sp)
    19a0:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19a2:	f63ff0ef          	jal	ra,1904 <memchr>
    return p ? p - s : n;
    19a6:	c519                	beqz	a0,19b4 <strnlen+0x22>
}
    19a8:	60e2                	ld	ra,24(sp)
    19aa:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19ac:	8d05                	sub	a0,a0,s1
}
    19ae:	64a2                	ld	s1,8(sp)
    19b0:	6105                	addi	sp,sp,32
    19b2:	8082                	ret
    19b4:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19b6:	8522                	mv	a0,s0
}
    19b8:	6442                	ld	s0,16(sp)
    19ba:	64a2                	ld	s1,8(sp)
    19bc:	6105                	addi	sp,sp,32
    19be:	8082                	ret

00000000000019c0 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19c0:	00a5c7b3          	xor	a5,a1,a0
    19c4:	8b9d                	andi	a5,a5,7
    19c6:	eb95                	bnez	a5,19fa <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19c8:	0075f793          	andi	a5,a1,7
    19cc:	e7b1                	bnez	a5,1a18 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19ce:	6198                	ld	a4,0(a1)
    19d0:	00000617          	auipc	a2,0x0
    19d4:	5a863603          	ld	a2,1448(a2) # 1f78 <__clone+0xac>
    19d8:	00000817          	auipc	a6,0x0
    19dc:	5a883803          	ld	a6,1448(a6) # 1f80 <__clone+0xb4>
    19e0:	a029                	j	19ea <strcpy+0x2a>
    19e2:	05a1                	addi	a1,a1,8
    19e4:	e118                	sd	a4,0(a0)
    19e6:	6198                	ld	a4,0(a1)
    19e8:	0521                	addi	a0,a0,8
    19ea:	00c707b3          	add	a5,a4,a2
    19ee:	fff74693          	not	a3,a4
    19f2:	8ff5                	and	a5,a5,a3
    19f4:	0107f7b3          	and	a5,a5,a6
    19f8:	d7ed                	beqz	a5,19e2 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19fa:	0005c783          	lbu	a5,0(a1)
    19fe:	00f50023          	sb	a5,0(a0)
    1a02:	c785                	beqz	a5,1a2a <strcpy+0x6a>
    1a04:	0015c783          	lbu	a5,1(a1)
    1a08:	0505                	addi	a0,a0,1
    1a0a:	0585                	addi	a1,a1,1
    1a0c:	00f50023          	sb	a5,0(a0)
    1a10:	fbf5                	bnez	a5,1a04 <strcpy+0x44>
        ;
    return d;
}
    1a12:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a14:	0505                	addi	a0,a0,1
    1a16:	df45                	beqz	a4,19ce <strcpy+0xe>
            if (!(*d = *s))
    1a18:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a1c:	0585                	addi	a1,a1,1
    1a1e:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1a22:	00f50023          	sb	a5,0(a0)
    1a26:	f7fd                	bnez	a5,1a14 <strcpy+0x54>
}
    1a28:	8082                	ret
    1a2a:	8082                	ret

0000000000001a2c <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a2c:	00a5c7b3          	xor	a5,a1,a0
    1a30:	8b9d                	andi	a5,a5,7
    1a32:	1a079863          	bnez	a5,1be2 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a36:	0075f793          	andi	a5,a1,7
    1a3a:	16078463          	beqz	a5,1ba2 <strncpy+0x176>
    1a3e:	ea01                	bnez	a2,1a4e <strncpy+0x22>
    1a40:	a421                	j	1c48 <strncpy+0x21c>
    1a42:	167d                	addi	a2,a2,-1
    1a44:	0505                	addi	a0,a0,1
    1a46:	14070e63          	beqz	a4,1ba2 <strncpy+0x176>
    1a4a:	1a060863          	beqz	a2,1bfa <strncpy+0x1ce>
    1a4e:	0005c783          	lbu	a5,0(a1)
    1a52:	0585                	addi	a1,a1,1
    1a54:	0075f713          	andi	a4,a1,7
    1a58:	00f50023          	sb	a5,0(a0)
    1a5c:	f3fd                	bnez	a5,1a42 <strncpy+0x16>
    1a5e:	4805                	li	a6,1
    1a60:	1a061863          	bnez	a2,1c10 <strncpy+0x1e4>
    1a64:	40a007b3          	neg	a5,a0
    1a68:	8b9d                	andi	a5,a5,7
    1a6a:	4681                	li	a3,0
    1a6c:	18061a63          	bnez	a2,1c00 <strncpy+0x1d4>
    1a70:	00778713          	addi	a4,a5,7
    1a74:	45ad                	li	a1,11
    1a76:	18b76363          	bltu	a4,a1,1bfc <strncpy+0x1d0>
    1a7a:	1ae6eb63          	bltu	a3,a4,1c30 <strncpy+0x204>
    1a7e:	1a078363          	beqz	a5,1c24 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a82:	00050023          	sb	zero,0(a0)
    1a86:	4685                	li	a3,1
    1a88:	00150713          	addi	a4,a0,1
    1a8c:	18d78f63          	beq	a5,a3,1c2a <strncpy+0x1fe>
    1a90:	000500a3          	sb	zero,1(a0)
    1a94:	4689                	li	a3,2
    1a96:	00250713          	addi	a4,a0,2
    1a9a:	18d78e63          	beq	a5,a3,1c36 <strncpy+0x20a>
    1a9e:	00050123          	sb	zero,2(a0)
    1aa2:	468d                	li	a3,3
    1aa4:	00350713          	addi	a4,a0,3
    1aa8:	16d78c63          	beq	a5,a3,1c20 <strncpy+0x1f4>
    1aac:	000501a3          	sb	zero,3(a0)
    1ab0:	4691                	li	a3,4
    1ab2:	00450713          	addi	a4,a0,4
    1ab6:	18d78263          	beq	a5,a3,1c3a <strncpy+0x20e>
    1aba:	00050223          	sb	zero,4(a0)
    1abe:	4695                	li	a3,5
    1ac0:	00550713          	addi	a4,a0,5
    1ac4:	16d78d63          	beq	a5,a3,1c3e <strncpy+0x212>
    1ac8:	000502a3          	sb	zero,5(a0)
    1acc:	469d                	li	a3,7
    1ace:	00650713          	addi	a4,a0,6
    1ad2:	16d79863          	bne	a5,a3,1c42 <strncpy+0x216>
    1ad6:	00750713          	addi	a4,a0,7
    1ada:	00050323          	sb	zero,6(a0)
    1ade:	40f80833          	sub	a6,a6,a5
    1ae2:	ff887593          	andi	a1,a6,-8
    1ae6:	97aa                	add	a5,a5,a0
    1ae8:	95be                	add	a1,a1,a5
    1aea:	0007b023          	sd	zero,0(a5)
    1aee:	07a1                	addi	a5,a5,8
    1af0:	feb79de3          	bne	a5,a1,1aea <strncpy+0xbe>
    1af4:	ff887593          	andi	a1,a6,-8
    1af8:	9ead                	addw	a3,a3,a1
    1afa:	00b707b3          	add	a5,a4,a1
    1afe:	12b80863          	beq	a6,a1,1c2e <strncpy+0x202>
    1b02:	00078023          	sb	zero,0(a5)
    1b06:	0016871b          	addiw	a4,a3,1
    1b0a:	0ec77863          	bgeu	a4,a2,1bfa <strncpy+0x1ce>
    1b0e:	000780a3          	sb	zero,1(a5)
    1b12:	0026871b          	addiw	a4,a3,2
    1b16:	0ec77263          	bgeu	a4,a2,1bfa <strncpy+0x1ce>
    1b1a:	00078123          	sb	zero,2(a5)
    1b1e:	0036871b          	addiw	a4,a3,3
    1b22:	0cc77c63          	bgeu	a4,a2,1bfa <strncpy+0x1ce>
    1b26:	000781a3          	sb	zero,3(a5)
    1b2a:	0046871b          	addiw	a4,a3,4
    1b2e:	0cc77663          	bgeu	a4,a2,1bfa <strncpy+0x1ce>
    1b32:	00078223          	sb	zero,4(a5)
    1b36:	0056871b          	addiw	a4,a3,5
    1b3a:	0cc77063          	bgeu	a4,a2,1bfa <strncpy+0x1ce>
    1b3e:	000782a3          	sb	zero,5(a5)
    1b42:	0066871b          	addiw	a4,a3,6
    1b46:	0ac77a63          	bgeu	a4,a2,1bfa <strncpy+0x1ce>
    1b4a:	00078323          	sb	zero,6(a5)
    1b4e:	0076871b          	addiw	a4,a3,7
    1b52:	0ac77463          	bgeu	a4,a2,1bfa <strncpy+0x1ce>
    1b56:	000783a3          	sb	zero,7(a5)
    1b5a:	0086871b          	addiw	a4,a3,8
    1b5e:	08c77e63          	bgeu	a4,a2,1bfa <strncpy+0x1ce>
    1b62:	00078423          	sb	zero,8(a5)
    1b66:	0096871b          	addiw	a4,a3,9
    1b6a:	08c77863          	bgeu	a4,a2,1bfa <strncpy+0x1ce>
    1b6e:	000784a3          	sb	zero,9(a5)
    1b72:	00a6871b          	addiw	a4,a3,10
    1b76:	08c77263          	bgeu	a4,a2,1bfa <strncpy+0x1ce>
    1b7a:	00078523          	sb	zero,10(a5)
    1b7e:	00b6871b          	addiw	a4,a3,11
    1b82:	06c77c63          	bgeu	a4,a2,1bfa <strncpy+0x1ce>
    1b86:	000785a3          	sb	zero,11(a5)
    1b8a:	00c6871b          	addiw	a4,a3,12
    1b8e:	06c77663          	bgeu	a4,a2,1bfa <strncpy+0x1ce>
    1b92:	00078623          	sb	zero,12(a5)
    1b96:	26b5                	addiw	a3,a3,13
    1b98:	06c6f163          	bgeu	a3,a2,1bfa <strncpy+0x1ce>
    1b9c:	000786a3          	sb	zero,13(a5)
    1ba0:	8082                	ret
            ;
        if (!n || !*s)
    1ba2:	c645                	beqz	a2,1c4a <strncpy+0x21e>
    1ba4:	0005c783          	lbu	a5,0(a1)
    1ba8:	ea078be3          	beqz	a5,1a5e <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bac:	479d                	li	a5,7
    1bae:	02c7ff63          	bgeu	a5,a2,1bec <strncpy+0x1c0>
    1bb2:	00000897          	auipc	a7,0x0
    1bb6:	3c68b883          	ld	a7,966(a7) # 1f78 <__clone+0xac>
    1bba:	00000817          	auipc	a6,0x0
    1bbe:	3c683803          	ld	a6,966(a6) # 1f80 <__clone+0xb4>
    1bc2:	431d                	li	t1,7
    1bc4:	6198                	ld	a4,0(a1)
    1bc6:	011707b3          	add	a5,a4,a7
    1bca:	fff74693          	not	a3,a4
    1bce:	8ff5                	and	a5,a5,a3
    1bd0:	0107f7b3          	and	a5,a5,a6
    1bd4:	ef81                	bnez	a5,1bec <strncpy+0x1c0>
            *wd = *ws;
    1bd6:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bd8:	1661                	addi	a2,a2,-8
    1bda:	05a1                	addi	a1,a1,8
    1bdc:	0521                	addi	a0,a0,8
    1bde:	fec363e3          	bltu	t1,a2,1bc4 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1be2:	e609                	bnez	a2,1bec <strncpy+0x1c0>
    1be4:	a08d                	j	1c46 <strncpy+0x21a>
    1be6:	167d                	addi	a2,a2,-1
    1be8:	0505                	addi	a0,a0,1
    1bea:	ca01                	beqz	a2,1bfa <strncpy+0x1ce>
    1bec:	0005c783          	lbu	a5,0(a1)
    1bf0:	0585                	addi	a1,a1,1
    1bf2:	00f50023          	sb	a5,0(a0)
    1bf6:	fbe5                	bnez	a5,1be6 <strncpy+0x1ba>
        ;
tail:
    1bf8:	b59d                	j	1a5e <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1bfa:	8082                	ret
    1bfc:	472d                	li	a4,11
    1bfe:	bdb5                	j	1a7a <strncpy+0x4e>
    1c00:	00778713          	addi	a4,a5,7
    1c04:	45ad                	li	a1,11
    1c06:	fff60693          	addi	a3,a2,-1
    1c0a:	e6b778e3          	bgeu	a4,a1,1a7a <strncpy+0x4e>
    1c0e:	b7fd                	j	1bfc <strncpy+0x1d0>
    1c10:	40a007b3          	neg	a5,a0
    1c14:	8832                	mv	a6,a2
    1c16:	8b9d                	andi	a5,a5,7
    1c18:	4681                	li	a3,0
    1c1a:	e4060be3          	beqz	a2,1a70 <strncpy+0x44>
    1c1e:	b7cd                	j	1c00 <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c20:	468d                	li	a3,3
    1c22:	bd75                	j	1ade <strncpy+0xb2>
    1c24:	872a                	mv	a4,a0
    1c26:	4681                	li	a3,0
    1c28:	bd5d                	j	1ade <strncpy+0xb2>
    1c2a:	4685                	li	a3,1
    1c2c:	bd4d                	j	1ade <strncpy+0xb2>
    1c2e:	8082                	ret
    1c30:	87aa                	mv	a5,a0
    1c32:	4681                	li	a3,0
    1c34:	b5f9                	j	1b02 <strncpy+0xd6>
    1c36:	4689                	li	a3,2
    1c38:	b55d                	j	1ade <strncpy+0xb2>
    1c3a:	4691                	li	a3,4
    1c3c:	b54d                	j	1ade <strncpy+0xb2>
    1c3e:	4695                	li	a3,5
    1c40:	bd79                	j	1ade <strncpy+0xb2>
    1c42:	4699                	li	a3,6
    1c44:	bd69                	j	1ade <strncpy+0xb2>
    1c46:	8082                	ret
    1c48:	8082                	ret
    1c4a:	8082                	ret

0000000000001c4c <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c4c:	87aa                	mv	a5,a0
    1c4e:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c50:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c54:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c58:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c5a:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c5c:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c60:	2501                	sext.w	a0,a0
    1c62:	8082                	ret

0000000000001c64 <openat>:
    register long a7 __asm__("a7") = n;
    1c64:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c68:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c6c:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c70:	2501                	sext.w	a0,a0
    1c72:	8082                	ret

0000000000001c74 <fcntl>:
    register long a7 __asm__("a7") = n;
    1c74:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c76:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1c7a:	2501                	sext.w	a0,a0
    1c7c:	8082                	ret

0000000000001c7e <close>:
    register long a7 __asm__("a7") = n;
    1c7e:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c82:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c86:	2501                	sext.w	a0,a0
    1c88:	8082                	ret

0000000000001c8a <read>:
    register long a7 __asm__("a7") = n;
    1c8a:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c8e:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c92:	8082                	ret

0000000000001c94 <write>:
    register long a7 __asm__("a7") = n;
    1c94:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c98:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c9c:	8082                	ret

0000000000001c9e <getpid>:
    register long a7 __asm__("a7") = n;
    1c9e:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1ca2:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1ca6:	2501                	sext.w	a0,a0
    1ca8:	8082                	ret

0000000000001caa <getppid>:
    register long a7 __asm__("a7") = n;
    1caa:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1cae:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cb2:	2501                	sext.w	a0,a0
    1cb4:	8082                	ret

0000000000001cb6 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cb6:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cba:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cbe:	2501                	sext.w	a0,a0
    1cc0:	8082                	ret

0000000000001cc2 <fork>:
    register long a7 __asm__("a7") = n;
    1cc2:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cc6:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cc8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cca:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cce:	2501                	sext.w	a0,a0
    1cd0:	8082                	ret

0000000000001cd2 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cd2:	85b2                	mv	a1,a2
    1cd4:	863a                	mv	a2,a4
    if (stack)
    1cd6:	c191                	beqz	a1,1cda <clone+0x8>
	stack += stack_size;
    1cd8:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cda:	4781                	li	a5,0
    1cdc:	4701                	li	a4,0
    1cde:	4681                	li	a3,0
    1ce0:	2601                	sext.w	a2,a2
    1ce2:	a2ed                	j	1ecc <__clone>

0000000000001ce4 <exit>:
    register long a7 __asm__("a7") = n;
    1ce4:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1ce8:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cec:	8082                	ret

0000000000001cee <waitpid>:
    register long a7 __asm__("a7") = n;
    1cee:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cf2:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cf4:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cf8:	2501                	sext.w	a0,a0
    1cfa:	8082                	ret

0000000000001cfc <exec>:
    register long a7 __asm__("a7") = n;
    1cfc:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d00:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d04:	2501                	sext.w	a0,a0
    1d06:	8082                	ret

0000000000001d08 <execve>:
    register long a7 __asm__("a7") = n;
    1d08:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d0c:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d10:	2501                	sext.w	a0,a0
    1d12:	8082                	ret

0000000000001d14 <times>:
    register long a7 __asm__("a7") = n;
    1d14:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d18:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d1c:	2501                	sext.w	a0,a0
    1d1e:	8082                	ret

0000000000001d20 <get_time>:

int64 get_time()
{
    1d20:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d22:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d26:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d28:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d2a:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d2e:	2501                	sext.w	a0,a0
    1d30:	ed09                	bnez	a0,1d4a <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d32:	67a2                	ld	a5,8(sp)
    1d34:	3e800713          	li	a4,1000
    1d38:	00015503          	lhu	a0,0(sp)
    1d3c:	02e7d7b3          	divu	a5,a5,a4
    1d40:	02e50533          	mul	a0,a0,a4
    1d44:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d46:	0141                	addi	sp,sp,16
    1d48:	8082                	ret
        return -1;
    1d4a:	557d                	li	a0,-1
    1d4c:	bfed                	j	1d46 <get_time+0x26>

0000000000001d4e <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d4e:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d52:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d56:	2501                	sext.w	a0,a0
    1d58:	8082                	ret

0000000000001d5a <time>:
    register long a7 __asm__("a7") = n;
    1d5a:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d5e:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d62:	2501                	sext.w	a0,a0
    1d64:	8082                	ret

0000000000001d66 <sleep>:

int sleep(unsigned long long time)
{
    1d66:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d68:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d6a:	850a                	mv	a0,sp
    1d6c:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d6e:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d72:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d74:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d78:	e501                	bnez	a0,1d80 <sleep+0x1a>
    return 0;
    1d7a:	4501                	li	a0,0
}
    1d7c:	0141                	addi	sp,sp,16
    1d7e:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d80:	4502                	lw	a0,0(sp)
}
    1d82:	0141                	addi	sp,sp,16
    1d84:	8082                	ret

0000000000001d86 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d86:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d8a:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d8e:	2501                	sext.w	a0,a0
    1d90:	8082                	ret

0000000000001d92 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d92:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d96:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d9a:	8082                	ret

0000000000001d9c <munmap>:
    register long a7 __asm__("a7") = n;
    1d9c:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1da0:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1da4:	2501                	sext.w	a0,a0
    1da6:	8082                	ret

0000000000001da8 <wait>:

int wait(int *code)
{
    1da8:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1daa:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1dae:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1db0:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1db2:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1db4:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1db8:	2501                	sext.w	a0,a0
    1dba:	8082                	ret

0000000000001dbc <spawn>:
    register long a7 __asm__("a7") = n;
    1dbc:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1dc0:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dc4:	2501                	sext.w	a0,a0
    1dc6:	8082                	ret

0000000000001dc8 <mailread>:
    register long a7 __asm__("a7") = n;
    1dc8:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dcc:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dd0:	2501                	sext.w	a0,a0
    1dd2:	8082                	ret

0000000000001dd4 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dd4:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd8:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1ddc:	2501                	sext.w	a0,a0
    1dde:	8082                	ret

0000000000001de0 <fstat>:
    register long a7 __asm__("a7") = n;
    1de0:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1de4:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1de8:	2501                	sext.w	a0,a0
    1dea:	8082                	ret

0000000000001dec <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dec:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dee:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1df2:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1df4:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1df8:	2501                	sext.w	a0,a0
    1dfa:	8082                	ret

0000000000001dfc <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1dfc:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dfe:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e02:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e04:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e08:	2501                	sext.w	a0,a0
    1e0a:	8082                	ret

0000000000001e0c <link>:

int link(char *old_path, char *new_path)
{
    1e0c:	87aa                	mv	a5,a0
    1e0e:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e10:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e14:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e18:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e1a:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e1e:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e20:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e24:	2501                	sext.w	a0,a0
    1e26:	8082                	ret

0000000000001e28 <unlink>:

int unlink(char *path)
{
    1e28:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e2a:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e2e:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e32:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e34:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e38:	2501                	sext.w	a0,a0
    1e3a:	8082                	ret

0000000000001e3c <uname>:
    register long a7 __asm__("a7") = n;
    1e3c:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e40:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e44:	2501                	sext.w	a0,a0
    1e46:	8082                	ret

0000000000001e48 <brk>:
    register long a7 __asm__("a7") = n;
    1e48:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e4c:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e50:	2501                	sext.w	a0,a0
    1e52:	8082                	ret

0000000000001e54 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e54:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e56:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e5a:	8082                	ret

0000000000001e5c <chdir>:
    register long a7 __asm__("a7") = n;
    1e5c:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e60:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e64:	2501                	sext.w	a0,a0
    1e66:	8082                	ret

0000000000001e68 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e68:	862e                	mv	a2,a1
    1e6a:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e6c:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e6e:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e72:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e76:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e78:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e7a:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e7e:	2501                	sext.w	a0,a0
    1e80:	8082                	ret

0000000000001e82 <getdents>:
    register long a7 __asm__("a7") = n;
    1e82:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e86:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e8a:	2501                	sext.w	a0,a0
    1e8c:	8082                	ret

0000000000001e8e <pipe>:
    register long a7 __asm__("a7") = n;
    1e8e:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e92:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e94:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e98:	2501                	sext.w	a0,a0
    1e9a:	8082                	ret

0000000000001e9c <dup>:
    register long a7 __asm__("a7") = n;
    1e9c:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e9e:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1ea2:	2501                	sext.w	a0,a0
    1ea4:	8082                	ret

0000000000001ea6 <dup2>:
    register long a7 __asm__("a7") = n;
    1ea6:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1ea8:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eaa:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1eae:	2501                	sext.w	a0,a0
    1eb0:	8082                	ret

0000000000001eb2 <mount>:
    register long a7 __asm__("a7") = n;
    1eb2:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1eb6:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1eba:	2501                	sext.w	a0,a0
    1ebc:	8082                	ret

0000000000001ebe <umount>:
    register long a7 __asm__("a7") = n;
    1ebe:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ec2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec4:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ec8:	2501                	sext.w	a0,a0
    1eca:	8082                	ret

0000000000001ecc <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ecc:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1ece:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ed0:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ed2:	8532                	mv	a0,a2
	mv a2, a4
    1ed4:	863a                	mv	a2,a4
	mv a3, a5
    1ed6:	86be                	mv	a3,a5
	mv a4, a6
    1ed8:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1eda:	0dc00893          	li	a7,220
	ecall
    1ede:	00000073          	ecall

	beqz a0, 1f
    1ee2:	c111                	beqz	a0,1ee6 <__clone+0x1a>
	# Parent
	ret
    1ee4:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ee6:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ee8:	6522                	ld	a0,8(sp)
	jalr a1
    1eea:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1eec:	05d00893          	li	a7,93
	ecall
    1ef0:	00000073          	ecall
