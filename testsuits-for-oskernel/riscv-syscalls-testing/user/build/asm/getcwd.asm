
/home/brightnight/OScompetition/6.13晚final_main/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/getcwd：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a075                	j	10ae <__start_main>

0000000000001004 <test_getcwd>:
 * 测试通过时输出：
 * "getcwd OK."
 * 测试失败时输出：
 * "getcwd ERROR."
 */
void test_getcwd(void){
    1004:	7175                	addi	sp,sp,-144
   TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	ee250513          	addi	a0,a0,-286 # 1ee8 <__clone+0x2e>
void test_getcwd(void){
    100e:	e506                	sd	ra,136(sp)
   TEST_START(__func__);
    1010:	310000ef          	jal	ra,1320 <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	f5c50513          	addi	a0,a0,-164 # 1f70 <__func__.0>
    101c:	304000ef          	jal	ra,1320 <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	ee050513          	addi	a0,a0,-288 # 1f00 <__clone+0x46>
    1028:	2f8000ef          	jal	ra,1320 <puts>
    char *cwd = NULL;
    char buf[128] = {0};
    cwd = getcwd(buf, 128);
    102c:	08000593          	li	a1,128
    1030:	850a                	mv	a0,sp
    char buf[128] = {0};
    1032:	e002                	sd	zero,0(sp)
    1034:	e402                	sd	zero,8(sp)
    1036:	e802                	sd	zero,16(sp)
    1038:	ec02                	sd	zero,24(sp)
    103a:	f002                	sd	zero,32(sp)
    103c:	f402                	sd	zero,40(sp)
    103e:	f802                	sd	zero,48(sp)
    1040:	fc02                	sd	zero,56(sp)
    1042:	e082                	sd	zero,64(sp)
    1044:	e482                	sd	zero,72(sp)
    1046:	e882                	sd	zero,80(sp)
    1048:	ec82                	sd	zero,88(sp)
    104a:	f082                	sd	zero,96(sp)
    104c:	f482                	sd	zero,104(sp)
    104e:	f882                	sd	zero,112(sp)
    1050:	fc82                	sd	zero,120(sp)
    cwd = getcwd(buf, 128);
    1052:	5f1000ef          	jal	ra,1e42 <getcwd>
    if(cwd != NULL) printf("getcwd: %s successfully!\n", buf);
    1056:	cd0d                	beqz	a0,1090 <test_getcwd+0x8c>
    1058:	858a                	mv	a1,sp
    105a:	00001517          	auipc	a0,0x1
    105e:	eb650513          	addi	a0,a0,-330 # 1f10 <__clone+0x56>
    1062:	2e0000ef          	jal	ra,1342 <printf>
    else printf("getcwd ERROR.\n");
   TEST_END(__func__);
    1066:	00001517          	auipc	a0,0x1
    106a:	eda50513          	addi	a0,a0,-294 # 1f40 <__clone+0x86>
    106e:	2b2000ef          	jal	ra,1320 <puts>
    1072:	00001517          	auipc	a0,0x1
    1076:	efe50513          	addi	a0,a0,-258 # 1f70 <__func__.0>
    107a:	2a6000ef          	jal	ra,1320 <puts>
    107e:	00001517          	auipc	a0,0x1
    1082:	e8250513          	addi	a0,a0,-382 # 1f00 <__clone+0x46>
    1086:	29a000ef          	jal	ra,1320 <puts>
}
    108a:	60aa                	ld	ra,136(sp)
    108c:	6149                	addi	sp,sp,144
    108e:	8082                	ret
    else printf("getcwd ERROR.\n");
    1090:	00001517          	auipc	a0,0x1
    1094:	ea050513          	addi	a0,a0,-352 # 1f30 <__clone+0x76>
    1098:	2aa000ef          	jal	ra,1342 <printf>
    109c:	b7e9                	j	1066 <test_getcwd+0x62>

000000000000109e <main>:

int main(void){
    109e:	1141                	addi	sp,sp,-16
    10a0:	e406                	sd	ra,8(sp)
    test_getcwd();
    10a2:	f63ff0ef          	jal	ra,1004 <test_getcwd>
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
    10bc:	417000ef          	jal	ra,1cd2 <exit>
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
    10d8:	eac60613          	addi	a2,a2,-340 # 1f80 <digits>
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
    11f8:	28b000ef          	jal	ra,1c82 <write>
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
    120e:	d7660613          	addi	a2,a2,-650 # 1f80 <digits>
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
    12f4:	185000ef          	jal	ra,1c78 <read>
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
    1314:	16f000ef          	jal	ra,1c82 <write>
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
    1328:	56c000ef          	jal	ra,1894 <strlen>
    132c:	862a                	mv	a2,a0
    132e:	85a2                	mv	a1,s0
    1330:	4505                	li	a0,1
    1332:	151000ef          	jal	ra,1c82 <write>
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
    1374:	be0b0b13          	addi	s6,s6,-1056 # 1f50 <__clone+0x96>
    buf[i++] = '0';
    1378:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    137c:	00001997          	auipc	s3,0x1
    1380:	c0498993          	addi	s3,s3,-1020 # 1f80 <digits>
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
    13a6:	0dd000ef          	jal	ra,1c82 <write>
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
    14ec:	796000ef          	jal	ra,1c82 <write>
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
    153a:	748000ef          	jal	ra,1c82 <write>
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
    1586:	3fa000ef          	jal	ra,1980 <strnlen>
    write(f, s, l);
    158a:	0005061b          	sext.w	a2,a0
    158e:	85a2                	mv	a1,s0
    1590:	4505                	li	a0,1
    1592:	6f0000ef          	jal	ra,1c82 <write>
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
    15a6:	6dc000ef          	jal	ra,1c82 <write>
    char byte = c;
    15aa:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15ae:	4605                	li	a2,1
    15b0:	002c                	addi	a1,sp,8
    15b2:	4505                	li	a0,1
    char byte = c;
    15b4:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15b8:	6ca000ef          	jal	ra,1c82 <write>
        s += 2;
    15bc:	00248513          	addi	a0,s1,2
    15c0:	bf15                	j	14f4 <printf+0x1b2>
                a = "(null)";
    15c2:	845a                	mv	s0,s6
    15c4:	bf75                	j	1580 <printf+0x23e>

00000000000015c6 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15c6:	02000793          	li	a5,32
    15ca:	00f50663          	beq	a0,a5,15d6 <isspace+0x10>
    15ce:	355d                	addiw	a0,a0,-9
    15d0:	00553513          	sltiu	a0,a0,5
    15d4:	8082                	ret
    15d6:	4505                	li	a0,1
}
    15d8:	8082                	ret

00000000000015da <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15da:	fd05051b          	addiw	a0,a0,-48
}
    15de:	00a53513          	sltiu	a0,a0,10
    15e2:	8082                	ret

00000000000015e4 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15e4:	02000613          	li	a2,32
    15e8:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15ea:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ee:	ff77869b          	addiw	a3,a5,-9
    15f2:	04c78c63          	beq	a5,a2,164a <atoi+0x66>
    15f6:	0007871b          	sext.w	a4,a5
    15fa:	04d5f863          	bgeu	a1,a3,164a <atoi+0x66>
        s++;
    switch (*s)
    15fe:	02b00693          	li	a3,43
    1602:	04d78963          	beq	a5,a3,1654 <atoi+0x70>
    1606:	02d00693          	li	a3,45
    160a:	06d78263          	beq	a5,a3,166e <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    160e:	fd07061b          	addiw	a2,a4,-48
    1612:	47a5                	li	a5,9
    1614:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1616:	4e01                	li	t3,0
    while (isdigit(*s))
    1618:	04c7e963          	bltu	a5,a2,166a <atoi+0x86>
    int n = 0, neg = 0;
    161c:	4501                	li	a0,0
    while (isdigit(*s))
    161e:	4825                	li	a6,9
    1620:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    1624:	0025179b          	slliw	a5,a0,0x2
    1628:	9fa9                	addw	a5,a5,a0
    162a:	fd07031b          	addiw	t1,a4,-48
    162e:	0017989b          	slliw	a7,a5,0x1
    while (isdigit(*s))
    1632:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1636:	0685                	addi	a3,a3,1
    1638:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    163c:	0006071b          	sext.w	a4,a2
    1640:	feb870e3          	bgeu	a6,a1,1620 <atoi+0x3c>
    return neg ? n : -n;
    1644:	000e0563          	beqz	t3,164e <atoi+0x6a>
}
    1648:	8082                	ret
        s++;
    164a:	0505                	addi	a0,a0,1
    164c:	bf79                	j	15ea <atoi+0x6>
    return neg ? n : -n;
    164e:	4113053b          	subw	a0,t1,a7
    1652:	8082                	ret
    while (isdigit(*s))
    1654:	00154703          	lbu	a4,1(a0)
    1658:	47a5                	li	a5,9
        s++;
    165a:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    165e:	fd07061b          	addiw	a2,a4,-48
    int n = 0, neg = 0;
    1662:	4e01                	li	t3,0
    while (isdigit(*s))
    1664:	2701                	sext.w	a4,a4
    1666:	fac7fbe3          	bgeu	a5,a2,161c <atoi+0x38>
    166a:	4501                	li	a0,0
}
    166c:	8082                	ret
    while (isdigit(*s))
    166e:	00154703          	lbu	a4,1(a0)
    1672:	47a5                	li	a5,9
        s++;
    1674:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1678:	fd07061b          	addiw	a2,a4,-48
    167c:	2701                	sext.w	a4,a4
    167e:	fec7e6e3          	bltu	a5,a2,166a <atoi+0x86>
        neg = 1;
    1682:	4e05                	li	t3,1
    1684:	bf61                	j	161c <atoi+0x38>

0000000000001686 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1686:	16060d63          	beqz	a2,1800 <memset+0x17a>
    168a:	40a007b3          	neg	a5,a0
    168e:	8b9d                	andi	a5,a5,7
    1690:	00778693          	addi	a3,a5,7
    1694:	482d                	li	a6,11
    1696:	0ff5f713          	zext.b	a4,a1
    169a:	fff60593          	addi	a1,a2,-1
    169e:	1706e263          	bltu	a3,a6,1802 <memset+0x17c>
    16a2:	16d5ea63          	bltu	a1,a3,1816 <memset+0x190>
    16a6:	16078563          	beqz	a5,1810 <memset+0x18a>
    16aa:	00e50023          	sb	a4,0(a0)
    16ae:	4685                	li	a3,1
    16b0:	00150593          	addi	a1,a0,1
    16b4:	14d78c63          	beq	a5,a3,180c <memset+0x186>
    16b8:	00e500a3          	sb	a4,1(a0)
    16bc:	4689                	li	a3,2
    16be:	00250593          	addi	a1,a0,2
    16c2:	14d78d63          	beq	a5,a3,181c <memset+0x196>
    16c6:	00e50123          	sb	a4,2(a0)
    16ca:	468d                	li	a3,3
    16cc:	00350593          	addi	a1,a0,3
    16d0:	12d78b63          	beq	a5,a3,1806 <memset+0x180>
    16d4:	00e501a3          	sb	a4,3(a0)
    16d8:	4691                	li	a3,4
    16da:	00450593          	addi	a1,a0,4
    16de:	14d78163          	beq	a5,a3,1820 <memset+0x19a>
    16e2:	00e50223          	sb	a4,4(a0)
    16e6:	4695                	li	a3,5
    16e8:	00550593          	addi	a1,a0,5
    16ec:	12d78c63          	beq	a5,a3,1824 <memset+0x19e>
    16f0:	00e502a3          	sb	a4,5(a0)
    16f4:	469d                	li	a3,7
    16f6:	00650593          	addi	a1,a0,6
    16fa:	12d79763          	bne	a5,a3,1828 <memset+0x1a2>
    16fe:	00750593          	addi	a1,a0,7
    1702:	00e50323          	sb	a4,6(a0)
    1706:	481d                	li	a6,7
    1708:	00871693          	slli	a3,a4,0x8
    170c:	01071893          	slli	a7,a4,0x10
    1710:	8ed9                	or	a3,a3,a4
    1712:	01871313          	slli	t1,a4,0x18
    1716:	0116e6b3          	or	a3,a3,a7
    171a:	0066e6b3          	or	a3,a3,t1
    171e:	02071893          	slli	a7,a4,0x20
    1722:	02871e13          	slli	t3,a4,0x28
    1726:	0116e6b3          	or	a3,a3,a7
    172a:	40f60333          	sub	t1,a2,a5
    172e:	03071893          	slli	a7,a4,0x30
    1732:	01c6e6b3          	or	a3,a3,t3
    1736:	0116e6b3          	or	a3,a3,a7
    173a:	03871e13          	slli	t3,a4,0x38
    173e:	97aa                	add	a5,a5,a0
    1740:	ff837893          	andi	a7,t1,-8
    1744:	01c6e6b3          	or	a3,a3,t3
    1748:	98be                	add	a7,a7,a5
    174a:	e394                	sd	a3,0(a5)
    174c:	07a1                	addi	a5,a5,8
    174e:	ff179ee3          	bne	a5,a7,174a <memset+0xc4>
    1752:	ff837893          	andi	a7,t1,-8
    1756:	011587b3          	add	a5,a1,a7
    175a:	010886bb          	addw	a3,a7,a6
    175e:	0b130663          	beq	t1,a7,180a <memset+0x184>
    1762:	00e78023          	sb	a4,0(a5)
    1766:	0016859b          	addiw	a1,a3,1
    176a:	08c5fb63          	bgeu	a1,a2,1800 <memset+0x17a>
    176e:	00e780a3          	sb	a4,1(a5)
    1772:	0026859b          	addiw	a1,a3,2
    1776:	08c5f563          	bgeu	a1,a2,1800 <memset+0x17a>
    177a:	00e78123          	sb	a4,2(a5)
    177e:	0036859b          	addiw	a1,a3,3
    1782:	06c5ff63          	bgeu	a1,a2,1800 <memset+0x17a>
    1786:	00e781a3          	sb	a4,3(a5)
    178a:	0046859b          	addiw	a1,a3,4
    178e:	06c5f963          	bgeu	a1,a2,1800 <memset+0x17a>
    1792:	00e78223          	sb	a4,4(a5)
    1796:	0056859b          	addiw	a1,a3,5
    179a:	06c5f363          	bgeu	a1,a2,1800 <memset+0x17a>
    179e:	00e782a3          	sb	a4,5(a5)
    17a2:	0066859b          	addiw	a1,a3,6
    17a6:	04c5fd63          	bgeu	a1,a2,1800 <memset+0x17a>
    17aa:	00e78323          	sb	a4,6(a5)
    17ae:	0076859b          	addiw	a1,a3,7
    17b2:	04c5f763          	bgeu	a1,a2,1800 <memset+0x17a>
    17b6:	00e783a3          	sb	a4,7(a5)
    17ba:	0086859b          	addiw	a1,a3,8
    17be:	04c5f163          	bgeu	a1,a2,1800 <memset+0x17a>
    17c2:	00e78423          	sb	a4,8(a5)
    17c6:	0096859b          	addiw	a1,a3,9
    17ca:	02c5fb63          	bgeu	a1,a2,1800 <memset+0x17a>
    17ce:	00e784a3          	sb	a4,9(a5)
    17d2:	00a6859b          	addiw	a1,a3,10
    17d6:	02c5f563          	bgeu	a1,a2,1800 <memset+0x17a>
    17da:	00e78523          	sb	a4,10(a5)
    17de:	00b6859b          	addiw	a1,a3,11
    17e2:	00c5ff63          	bgeu	a1,a2,1800 <memset+0x17a>
    17e6:	00e785a3          	sb	a4,11(a5)
    17ea:	00c6859b          	addiw	a1,a3,12
    17ee:	00c5f963          	bgeu	a1,a2,1800 <memset+0x17a>
    17f2:	00e78623          	sb	a4,12(a5)
    17f6:	26b5                	addiw	a3,a3,13
    17f8:	00c6f463          	bgeu	a3,a2,1800 <memset+0x17a>
    17fc:	00e786a3          	sb	a4,13(a5)
        ;
    return dest;
}
    1800:	8082                	ret
    1802:	46ad                	li	a3,11
    1804:	bd79                	j	16a2 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1806:	480d                	li	a6,3
    1808:	b701                	j	1708 <memset+0x82>
    180a:	8082                	ret
    180c:	4805                	li	a6,1
    180e:	bded                	j	1708 <memset+0x82>
    1810:	85aa                	mv	a1,a0
    1812:	4801                	li	a6,0
    1814:	bdd5                	j	1708 <memset+0x82>
    1816:	87aa                	mv	a5,a0
    1818:	4681                	li	a3,0
    181a:	b7a1                	j	1762 <memset+0xdc>
    181c:	4809                	li	a6,2
    181e:	b5ed                	j	1708 <memset+0x82>
    1820:	4811                	li	a6,4
    1822:	b5dd                	j	1708 <memset+0x82>
    1824:	4815                	li	a6,5
    1826:	b5cd                	j	1708 <memset+0x82>
    1828:	4819                	li	a6,6
    182a:	bdf9                	j	1708 <memset+0x82>

000000000000182c <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    182c:	00054783          	lbu	a5,0(a0)
    1830:	0005c703          	lbu	a4,0(a1)
    1834:	00e79863          	bne	a5,a4,1844 <strcmp+0x18>
    1838:	0505                	addi	a0,a0,1
    183a:	0585                	addi	a1,a1,1
    183c:	fbe5                	bnez	a5,182c <strcmp>
    183e:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1840:	9d19                	subw	a0,a0,a4
    1842:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1844:	0007851b          	sext.w	a0,a5
    1848:	bfe5                	j	1840 <strcmp+0x14>

000000000000184a <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    184a:	ca15                	beqz	a2,187e <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    184c:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1850:	167d                	addi	a2,a2,-1
    1852:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1856:	eb99                	bnez	a5,186c <strncmp+0x22>
    1858:	a815                	j	188c <strncmp+0x42>
    185a:	00a68e63          	beq	a3,a0,1876 <strncmp+0x2c>
    185e:	0505                	addi	a0,a0,1
    1860:	00f71b63          	bne	a4,a5,1876 <strncmp+0x2c>
    1864:	00054783          	lbu	a5,0(a0)
    1868:	cf89                	beqz	a5,1882 <strncmp+0x38>
    186a:	85b2                	mv	a1,a2
    186c:	0005c703          	lbu	a4,0(a1)
    1870:	00158613          	addi	a2,a1,1
    1874:	f37d                	bnez	a4,185a <strncmp+0x10>
        ;
    return *l - *r;
    1876:	0007851b          	sext.w	a0,a5
    187a:	9d19                	subw	a0,a0,a4
    187c:	8082                	ret
        return 0;
    187e:	4501                	li	a0,0
}
    1880:	8082                	ret
    return *l - *r;
    1882:	0015c703          	lbu	a4,1(a1)
    1886:	4501                	li	a0,0
    1888:	9d19                	subw	a0,a0,a4
    188a:	8082                	ret
    188c:	0005c703          	lbu	a4,0(a1)
    1890:	4501                	li	a0,0
    1892:	b7e5                	j	187a <strncmp+0x30>

0000000000001894 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1894:	00757793          	andi	a5,a0,7
    1898:	cf89                	beqz	a5,18b2 <strlen+0x1e>
    189a:	87aa                	mv	a5,a0
    189c:	a029                	j	18a6 <strlen+0x12>
    189e:	0785                	addi	a5,a5,1
    18a0:	0077f713          	andi	a4,a5,7
    18a4:	cb01                	beqz	a4,18b4 <strlen+0x20>
        if (!*s)
    18a6:	0007c703          	lbu	a4,0(a5)
    18aa:	fb75                	bnez	a4,189e <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18ac:	40a78533          	sub	a0,a5,a0
}
    18b0:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18b2:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18b4:	6394                	ld	a3,0(a5)
    18b6:	00000597          	auipc	a1,0x0
    18ba:	6a25b583          	ld	a1,1698(a1) # 1f58 <__clone+0x9e>
    18be:	00000617          	auipc	a2,0x0
    18c2:	6a263603          	ld	a2,1698(a2) # 1f60 <__clone+0xa6>
    18c6:	a019                	j	18cc <strlen+0x38>
    18c8:	6794                	ld	a3,8(a5)
    18ca:	07a1                	addi	a5,a5,8
    18cc:	00b68733          	add	a4,a3,a1
    18d0:	fff6c693          	not	a3,a3
    18d4:	8f75                	and	a4,a4,a3
    18d6:	8f71                	and	a4,a4,a2
    18d8:	db65                	beqz	a4,18c8 <strlen+0x34>
    for (; *s; s++)
    18da:	0007c703          	lbu	a4,0(a5)
    18de:	d779                	beqz	a4,18ac <strlen+0x18>
    18e0:	0017c703          	lbu	a4,1(a5)
    18e4:	0785                	addi	a5,a5,1
    18e6:	d379                	beqz	a4,18ac <strlen+0x18>
    18e8:	0017c703          	lbu	a4,1(a5)
    18ec:	0785                	addi	a5,a5,1
    18ee:	fb6d                	bnez	a4,18e0 <strlen+0x4c>
    18f0:	bf75                	j	18ac <strlen+0x18>

00000000000018f2 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18f2:	00757713          	andi	a4,a0,7
{
    18f6:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18f8:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18fc:	cb19                	beqz	a4,1912 <memchr+0x20>
    18fe:	ce25                	beqz	a2,1976 <memchr+0x84>
    1900:	0007c703          	lbu	a4,0(a5)
    1904:	04b70e63          	beq	a4,a1,1960 <memchr+0x6e>
    1908:	0785                	addi	a5,a5,1
    190a:	0077f713          	andi	a4,a5,7
    190e:	167d                	addi	a2,a2,-1
    1910:	f77d                	bnez	a4,18fe <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1912:	4501                	li	a0,0
    if (n && *s != c)
    1914:	c235                	beqz	a2,1978 <memchr+0x86>
    1916:	0007c703          	lbu	a4,0(a5)
    191a:	04b70363          	beq	a4,a1,1960 <memchr+0x6e>
        size_t k = ONES * c;
    191e:	00000517          	auipc	a0,0x0
    1922:	64a53503          	ld	a0,1610(a0) # 1f68 <__clone+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1926:	471d                	li	a4,7
        size_t k = ONES * c;
    1928:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    192c:	02c77a63          	bgeu	a4,a2,1960 <memchr+0x6e>
    1930:	00000897          	auipc	a7,0x0
    1934:	6288b883          	ld	a7,1576(a7) # 1f58 <__clone+0x9e>
    1938:	00000817          	auipc	a6,0x0
    193c:	62883803          	ld	a6,1576(a6) # 1f60 <__clone+0xa6>
    1940:	431d                	li	t1,7
    1942:	a029                	j	194c <memchr+0x5a>
    1944:	1661                	addi	a2,a2,-8
    1946:	07a1                	addi	a5,a5,8
    1948:	02c37963          	bgeu	t1,a2,197a <memchr+0x88>
    194c:	6398                	ld	a4,0(a5)
    194e:	8f29                	xor	a4,a4,a0
    1950:	011706b3          	add	a3,a4,a7
    1954:	fff74713          	not	a4,a4
    1958:	8f75                	and	a4,a4,a3
    195a:	01077733          	and	a4,a4,a6
    195e:	d37d                	beqz	a4,1944 <memchr+0x52>
{
    1960:	853e                	mv	a0,a5
    1962:	97b2                	add	a5,a5,a2
    1964:	a021                	j	196c <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1966:	0505                	addi	a0,a0,1
    1968:	00f50763          	beq	a0,a5,1976 <memchr+0x84>
    196c:	00054703          	lbu	a4,0(a0)
    1970:	feb71be3          	bne	a4,a1,1966 <memchr+0x74>
    1974:	8082                	ret
    return n ? (void *)s : 0;
    1976:	4501                	li	a0,0
}
    1978:	8082                	ret
    return n ? (void *)s : 0;
    197a:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    197c:	f275                	bnez	a2,1960 <memchr+0x6e>
}
    197e:	8082                	ret

0000000000001980 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1980:	1101                	addi	sp,sp,-32
    1982:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1984:	862e                	mv	a2,a1
{
    1986:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1988:	4581                	li	a1,0
{
    198a:	e426                	sd	s1,8(sp)
    198c:	ec06                	sd	ra,24(sp)
    198e:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1990:	f63ff0ef          	jal	ra,18f2 <memchr>
    return p ? p - s : n;
    1994:	c519                	beqz	a0,19a2 <strnlen+0x22>
}
    1996:	60e2                	ld	ra,24(sp)
    1998:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    199a:	8d05                	sub	a0,a0,s1
}
    199c:	64a2                	ld	s1,8(sp)
    199e:	6105                	addi	sp,sp,32
    19a0:	8082                	ret
    19a2:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19a4:	8522                	mv	a0,s0
}
    19a6:	6442                	ld	s0,16(sp)
    19a8:	64a2                	ld	s1,8(sp)
    19aa:	6105                	addi	sp,sp,32
    19ac:	8082                	ret

00000000000019ae <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19ae:	00a5c7b3          	xor	a5,a1,a0
    19b2:	8b9d                	andi	a5,a5,7
    19b4:	eb95                	bnez	a5,19e8 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19b6:	0075f793          	andi	a5,a1,7
    19ba:	e7b1                	bnez	a5,1a06 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19bc:	6198                	ld	a4,0(a1)
    19be:	00000617          	auipc	a2,0x0
    19c2:	59a63603          	ld	a2,1434(a2) # 1f58 <__clone+0x9e>
    19c6:	00000817          	auipc	a6,0x0
    19ca:	59a83803          	ld	a6,1434(a6) # 1f60 <__clone+0xa6>
    19ce:	a029                	j	19d8 <strcpy+0x2a>
    19d0:	05a1                	addi	a1,a1,8
    19d2:	e118                	sd	a4,0(a0)
    19d4:	6198                	ld	a4,0(a1)
    19d6:	0521                	addi	a0,a0,8
    19d8:	00c707b3          	add	a5,a4,a2
    19dc:	fff74693          	not	a3,a4
    19e0:	8ff5                	and	a5,a5,a3
    19e2:	0107f7b3          	and	a5,a5,a6
    19e6:	d7ed                	beqz	a5,19d0 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19e8:	0005c783          	lbu	a5,0(a1)
    19ec:	00f50023          	sb	a5,0(a0)
    19f0:	c785                	beqz	a5,1a18 <strcpy+0x6a>
    19f2:	0015c783          	lbu	a5,1(a1)
    19f6:	0505                	addi	a0,a0,1
    19f8:	0585                	addi	a1,a1,1
    19fa:	00f50023          	sb	a5,0(a0)
    19fe:	fbf5                	bnez	a5,19f2 <strcpy+0x44>
        ;
    return d;
}
    1a00:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a02:	0505                	addi	a0,a0,1
    1a04:	df45                	beqz	a4,19bc <strcpy+0xe>
            if (!(*d = *s))
    1a06:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a0a:	0585                	addi	a1,a1,1
    1a0c:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1a10:	00f50023          	sb	a5,0(a0)
    1a14:	f7fd                	bnez	a5,1a02 <strcpy+0x54>
}
    1a16:	8082                	ret
    1a18:	8082                	ret

0000000000001a1a <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a1a:	00a5c7b3          	xor	a5,a1,a0
    1a1e:	8b9d                	andi	a5,a5,7
    1a20:	1a079863          	bnez	a5,1bd0 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a24:	0075f793          	andi	a5,a1,7
    1a28:	16078463          	beqz	a5,1b90 <strncpy+0x176>
    1a2c:	ea01                	bnez	a2,1a3c <strncpy+0x22>
    1a2e:	a421                	j	1c36 <strncpy+0x21c>
    1a30:	167d                	addi	a2,a2,-1
    1a32:	0505                	addi	a0,a0,1
    1a34:	14070e63          	beqz	a4,1b90 <strncpy+0x176>
    1a38:	1a060863          	beqz	a2,1be8 <strncpy+0x1ce>
    1a3c:	0005c783          	lbu	a5,0(a1)
    1a40:	0585                	addi	a1,a1,1
    1a42:	0075f713          	andi	a4,a1,7
    1a46:	00f50023          	sb	a5,0(a0)
    1a4a:	f3fd                	bnez	a5,1a30 <strncpy+0x16>
    1a4c:	4805                	li	a6,1
    1a4e:	1a061863          	bnez	a2,1bfe <strncpy+0x1e4>
    1a52:	40a007b3          	neg	a5,a0
    1a56:	8b9d                	andi	a5,a5,7
    1a58:	4681                	li	a3,0
    1a5a:	18061a63          	bnez	a2,1bee <strncpy+0x1d4>
    1a5e:	00778713          	addi	a4,a5,7
    1a62:	45ad                	li	a1,11
    1a64:	18b76363          	bltu	a4,a1,1bea <strncpy+0x1d0>
    1a68:	1ae6eb63          	bltu	a3,a4,1c1e <strncpy+0x204>
    1a6c:	1a078363          	beqz	a5,1c12 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a70:	00050023          	sb	zero,0(a0)
    1a74:	4685                	li	a3,1
    1a76:	00150713          	addi	a4,a0,1
    1a7a:	18d78f63          	beq	a5,a3,1c18 <strncpy+0x1fe>
    1a7e:	000500a3          	sb	zero,1(a0)
    1a82:	4689                	li	a3,2
    1a84:	00250713          	addi	a4,a0,2
    1a88:	18d78e63          	beq	a5,a3,1c24 <strncpy+0x20a>
    1a8c:	00050123          	sb	zero,2(a0)
    1a90:	468d                	li	a3,3
    1a92:	00350713          	addi	a4,a0,3
    1a96:	16d78c63          	beq	a5,a3,1c0e <strncpy+0x1f4>
    1a9a:	000501a3          	sb	zero,3(a0)
    1a9e:	4691                	li	a3,4
    1aa0:	00450713          	addi	a4,a0,4
    1aa4:	18d78263          	beq	a5,a3,1c28 <strncpy+0x20e>
    1aa8:	00050223          	sb	zero,4(a0)
    1aac:	4695                	li	a3,5
    1aae:	00550713          	addi	a4,a0,5
    1ab2:	16d78d63          	beq	a5,a3,1c2c <strncpy+0x212>
    1ab6:	000502a3          	sb	zero,5(a0)
    1aba:	469d                	li	a3,7
    1abc:	00650713          	addi	a4,a0,6
    1ac0:	16d79863          	bne	a5,a3,1c30 <strncpy+0x216>
    1ac4:	00750713          	addi	a4,a0,7
    1ac8:	00050323          	sb	zero,6(a0)
    1acc:	40f80833          	sub	a6,a6,a5
    1ad0:	ff887593          	andi	a1,a6,-8
    1ad4:	97aa                	add	a5,a5,a0
    1ad6:	95be                	add	a1,a1,a5
    1ad8:	0007b023          	sd	zero,0(a5)
    1adc:	07a1                	addi	a5,a5,8
    1ade:	feb79de3          	bne	a5,a1,1ad8 <strncpy+0xbe>
    1ae2:	ff887593          	andi	a1,a6,-8
    1ae6:	9ead                	addw	a3,a3,a1
    1ae8:	00b707b3          	add	a5,a4,a1
    1aec:	12b80863          	beq	a6,a1,1c1c <strncpy+0x202>
    1af0:	00078023          	sb	zero,0(a5)
    1af4:	0016871b          	addiw	a4,a3,1
    1af8:	0ec77863          	bgeu	a4,a2,1be8 <strncpy+0x1ce>
    1afc:	000780a3          	sb	zero,1(a5)
    1b00:	0026871b          	addiw	a4,a3,2
    1b04:	0ec77263          	bgeu	a4,a2,1be8 <strncpy+0x1ce>
    1b08:	00078123          	sb	zero,2(a5)
    1b0c:	0036871b          	addiw	a4,a3,3
    1b10:	0cc77c63          	bgeu	a4,a2,1be8 <strncpy+0x1ce>
    1b14:	000781a3          	sb	zero,3(a5)
    1b18:	0046871b          	addiw	a4,a3,4
    1b1c:	0cc77663          	bgeu	a4,a2,1be8 <strncpy+0x1ce>
    1b20:	00078223          	sb	zero,4(a5)
    1b24:	0056871b          	addiw	a4,a3,5
    1b28:	0cc77063          	bgeu	a4,a2,1be8 <strncpy+0x1ce>
    1b2c:	000782a3          	sb	zero,5(a5)
    1b30:	0066871b          	addiw	a4,a3,6
    1b34:	0ac77a63          	bgeu	a4,a2,1be8 <strncpy+0x1ce>
    1b38:	00078323          	sb	zero,6(a5)
    1b3c:	0076871b          	addiw	a4,a3,7
    1b40:	0ac77463          	bgeu	a4,a2,1be8 <strncpy+0x1ce>
    1b44:	000783a3          	sb	zero,7(a5)
    1b48:	0086871b          	addiw	a4,a3,8
    1b4c:	08c77e63          	bgeu	a4,a2,1be8 <strncpy+0x1ce>
    1b50:	00078423          	sb	zero,8(a5)
    1b54:	0096871b          	addiw	a4,a3,9
    1b58:	08c77863          	bgeu	a4,a2,1be8 <strncpy+0x1ce>
    1b5c:	000784a3          	sb	zero,9(a5)
    1b60:	00a6871b          	addiw	a4,a3,10
    1b64:	08c77263          	bgeu	a4,a2,1be8 <strncpy+0x1ce>
    1b68:	00078523          	sb	zero,10(a5)
    1b6c:	00b6871b          	addiw	a4,a3,11
    1b70:	06c77c63          	bgeu	a4,a2,1be8 <strncpy+0x1ce>
    1b74:	000785a3          	sb	zero,11(a5)
    1b78:	00c6871b          	addiw	a4,a3,12
    1b7c:	06c77663          	bgeu	a4,a2,1be8 <strncpy+0x1ce>
    1b80:	00078623          	sb	zero,12(a5)
    1b84:	26b5                	addiw	a3,a3,13
    1b86:	06c6f163          	bgeu	a3,a2,1be8 <strncpy+0x1ce>
    1b8a:	000786a3          	sb	zero,13(a5)
    1b8e:	8082                	ret
            ;
        if (!n || !*s)
    1b90:	c645                	beqz	a2,1c38 <strncpy+0x21e>
    1b92:	0005c783          	lbu	a5,0(a1)
    1b96:	ea078be3          	beqz	a5,1a4c <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b9a:	479d                	li	a5,7
    1b9c:	02c7ff63          	bgeu	a5,a2,1bda <strncpy+0x1c0>
    1ba0:	00000897          	auipc	a7,0x0
    1ba4:	3b88b883          	ld	a7,952(a7) # 1f58 <__clone+0x9e>
    1ba8:	00000817          	auipc	a6,0x0
    1bac:	3b883803          	ld	a6,952(a6) # 1f60 <__clone+0xa6>
    1bb0:	431d                	li	t1,7
    1bb2:	6198                	ld	a4,0(a1)
    1bb4:	011707b3          	add	a5,a4,a7
    1bb8:	fff74693          	not	a3,a4
    1bbc:	8ff5                	and	a5,a5,a3
    1bbe:	0107f7b3          	and	a5,a5,a6
    1bc2:	ef81                	bnez	a5,1bda <strncpy+0x1c0>
            *wd = *ws;
    1bc4:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bc6:	1661                	addi	a2,a2,-8
    1bc8:	05a1                	addi	a1,a1,8
    1bca:	0521                	addi	a0,a0,8
    1bcc:	fec363e3          	bltu	t1,a2,1bb2 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1bd0:	e609                	bnez	a2,1bda <strncpy+0x1c0>
    1bd2:	a08d                	j	1c34 <strncpy+0x21a>
    1bd4:	167d                	addi	a2,a2,-1
    1bd6:	0505                	addi	a0,a0,1
    1bd8:	ca01                	beqz	a2,1be8 <strncpy+0x1ce>
    1bda:	0005c783          	lbu	a5,0(a1)
    1bde:	0585                	addi	a1,a1,1
    1be0:	00f50023          	sb	a5,0(a0)
    1be4:	fbe5                	bnez	a5,1bd4 <strncpy+0x1ba>
        ;
tail:
    1be6:	b59d                	j	1a4c <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1be8:	8082                	ret
    1bea:	472d                	li	a4,11
    1bec:	bdb5                	j	1a68 <strncpy+0x4e>
    1bee:	00778713          	addi	a4,a5,7
    1bf2:	45ad                	li	a1,11
    1bf4:	fff60693          	addi	a3,a2,-1
    1bf8:	e6b778e3          	bgeu	a4,a1,1a68 <strncpy+0x4e>
    1bfc:	b7fd                	j	1bea <strncpy+0x1d0>
    1bfe:	40a007b3          	neg	a5,a0
    1c02:	8832                	mv	a6,a2
    1c04:	8b9d                	andi	a5,a5,7
    1c06:	4681                	li	a3,0
    1c08:	e4060be3          	beqz	a2,1a5e <strncpy+0x44>
    1c0c:	b7cd                	j	1bee <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c0e:	468d                	li	a3,3
    1c10:	bd75                	j	1acc <strncpy+0xb2>
    1c12:	872a                	mv	a4,a0
    1c14:	4681                	li	a3,0
    1c16:	bd5d                	j	1acc <strncpy+0xb2>
    1c18:	4685                	li	a3,1
    1c1a:	bd4d                	j	1acc <strncpy+0xb2>
    1c1c:	8082                	ret
    1c1e:	87aa                	mv	a5,a0
    1c20:	4681                	li	a3,0
    1c22:	b5f9                	j	1af0 <strncpy+0xd6>
    1c24:	4689                	li	a3,2
    1c26:	b55d                	j	1acc <strncpy+0xb2>
    1c28:	4691                	li	a3,4
    1c2a:	b54d                	j	1acc <strncpy+0xb2>
    1c2c:	4695                	li	a3,5
    1c2e:	bd79                	j	1acc <strncpy+0xb2>
    1c30:	4699                	li	a3,6
    1c32:	bd69                	j	1acc <strncpy+0xb2>
    1c34:	8082                	ret
    1c36:	8082                	ret
    1c38:	8082                	ret

0000000000001c3a <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c3a:	87aa                	mv	a5,a0
    1c3c:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c3e:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c42:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c46:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c48:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c4a:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c4e:	2501                	sext.w	a0,a0
    1c50:	8082                	ret

0000000000001c52 <openat>:
    register long a7 __asm__("a7") = n;
    1c52:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c56:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c5a:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c5e:	2501                	sext.w	a0,a0
    1c60:	8082                	ret

0000000000001c62 <fcntl>:
    register long a7 __asm__("a7") = n;
    1c62:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c64:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1c68:	2501                	sext.w	a0,a0
    1c6a:	8082                	ret

0000000000001c6c <close>:
    register long a7 __asm__("a7") = n;
    1c6c:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c70:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c74:	2501                	sext.w	a0,a0
    1c76:	8082                	ret

0000000000001c78 <read>:
    register long a7 __asm__("a7") = n;
    1c78:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c7c:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c80:	8082                	ret

0000000000001c82 <write>:
    register long a7 __asm__("a7") = n;
    1c82:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c86:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c8a:	8082                	ret

0000000000001c8c <getpid>:
    register long a7 __asm__("a7") = n;
    1c8c:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c90:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c94:	2501                	sext.w	a0,a0
    1c96:	8082                	ret

0000000000001c98 <getppid>:
    register long a7 __asm__("a7") = n;
    1c98:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c9c:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1ca0:	2501                	sext.w	a0,a0
    1ca2:	8082                	ret

0000000000001ca4 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1ca4:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1ca8:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cac:	2501                	sext.w	a0,a0
    1cae:	8082                	ret

0000000000001cb0 <fork>:
    register long a7 __asm__("a7") = n;
    1cb0:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cb4:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cb6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cb8:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cbc:	2501                	sext.w	a0,a0
    1cbe:	8082                	ret

0000000000001cc0 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cc0:	85b2                	mv	a1,a2
    1cc2:	863a                	mv	a2,a4
    if (stack)
    1cc4:	c191                	beqz	a1,1cc8 <clone+0x8>
	stack += stack_size;
    1cc6:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cc8:	4781                	li	a5,0
    1cca:	4701                	li	a4,0
    1ccc:	4681                	li	a3,0
    1cce:	2601                	sext.w	a2,a2
    1cd0:	a2ed                	j	1eba <__clone>

0000000000001cd2 <exit>:
    register long a7 __asm__("a7") = n;
    1cd2:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cd6:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cda:	8082                	ret

0000000000001cdc <waitpid>:
    register long a7 __asm__("a7") = n;
    1cdc:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1ce0:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ce2:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1ce6:	2501                	sext.w	a0,a0
    1ce8:	8082                	ret

0000000000001cea <exec>:
    register long a7 __asm__("a7") = n;
    1cea:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cee:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cf2:	2501                	sext.w	a0,a0
    1cf4:	8082                	ret

0000000000001cf6 <execve>:
    register long a7 __asm__("a7") = n;
    1cf6:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cfa:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cfe:	2501                	sext.w	a0,a0
    1d00:	8082                	ret

0000000000001d02 <times>:
    register long a7 __asm__("a7") = n;
    1d02:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d06:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d0a:	2501                	sext.w	a0,a0
    1d0c:	8082                	ret

0000000000001d0e <get_time>:

int64 get_time()
{
    1d0e:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d10:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d14:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d16:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d18:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d1c:	2501                	sext.w	a0,a0
    1d1e:	ed09                	bnez	a0,1d38 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d20:	67a2                	ld	a5,8(sp)
    1d22:	3e800713          	li	a4,1000
    1d26:	00015503          	lhu	a0,0(sp)
    1d2a:	02e7d7b3          	divu	a5,a5,a4
    1d2e:	02e50533          	mul	a0,a0,a4
    1d32:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d34:	0141                	addi	sp,sp,16
    1d36:	8082                	ret
        return -1;
    1d38:	557d                	li	a0,-1
    1d3a:	bfed                	j	1d34 <get_time+0x26>

0000000000001d3c <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d3c:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d40:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d44:	2501                	sext.w	a0,a0
    1d46:	8082                	ret

0000000000001d48 <time>:
    register long a7 __asm__("a7") = n;
    1d48:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d4c:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d50:	2501                	sext.w	a0,a0
    1d52:	8082                	ret

0000000000001d54 <sleep>:

int sleep(unsigned long long time)
{
    1d54:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d56:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d58:	850a                	mv	a0,sp
    1d5a:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d5c:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d60:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d62:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d66:	e501                	bnez	a0,1d6e <sleep+0x1a>
    return 0;
    1d68:	4501                	li	a0,0
}
    1d6a:	0141                	addi	sp,sp,16
    1d6c:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d6e:	4502                	lw	a0,0(sp)
}
    1d70:	0141                	addi	sp,sp,16
    1d72:	8082                	ret

0000000000001d74 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d74:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d78:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d7c:	2501                	sext.w	a0,a0
    1d7e:	8082                	ret

0000000000001d80 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d80:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d84:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d88:	8082                	ret

0000000000001d8a <munmap>:
    register long a7 __asm__("a7") = n;
    1d8a:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d8e:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d92:	2501                	sext.w	a0,a0
    1d94:	8082                	ret

0000000000001d96 <wait>:

int wait(int *code)
{
    1d96:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d98:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d9c:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d9e:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1da0:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1da2:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1da6:	2501                	sext.w	a0,a0
    1da8:	8082                	ret

0000000000001daa <spawn>:
    register long a7 __asm__("a7") = n;
    1daa:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1dae:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1db2:	2501                	sext.w	a0,a0
    1db4:	8082                	ret

0000000000001db6 <mailread>:
    register long a7 __asm__("a7") = n;
    1db6:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dba:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	8082                	ret

0000000000001dc2 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dc2:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dc6:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dca:	2501                	sext.w	a0,a0
    1dcc:	8082                	ret

0000000000001dce <fstat>:
    register long a7 __asm__("a7") = n;
    1dce:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dd2:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dd6:	2501                	sext.w	a0,a0
    1dd8:	8082                	ret

0000000000001dda <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dda:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1ddc:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1de0:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1de2:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1de6:	2501                	sext.w	a0,a0
    1de8:	8082                	ret

0000000000001dea <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1dea:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dec:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1df0:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df2:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1df6:	2501                	sext.w	a0,a0
    1df8:	8082                	ret

0000000000001dfa <link>:

int link(char *old_path, char *new_path)
{
    1dfa:	87aa                	mv	a5,a0
    1dfc:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1dfe:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e02:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e06:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e08:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e0c:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e0e:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e12:	2501                	sext.w	a0,a0
    1e14:	8082                	ret

0000000000001e16 <unlink>:

int unlink(char *path)
{
    1e16:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e18:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e1c:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e20:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e22:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e26:	2501                	sext.w	a0,a0
    1e28:	8082                	ret

0000000000001e2a <uname>:
    register long a7 __asm__("a7") = n;
    1e2a:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e2e:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e32:	2501                	sext.w	a0,a0
    1e34:	8082                	ret

0000000000001e36 <brk>:
    register long a7 __asm__("a7") = n;
    1e36:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e3a:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e3e:	2501                	sext.w	a0,a0
    1e40:	8082                	ret

0000000000001e42 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e42:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e44:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e48:	8082                	ret

0000000000001e4a <chdir>:
    register long a7 __asm__("a7") = n;
    1e4a:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e4e:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e52:	2501                	sext.w	a0,a0
    1e54:	8082                	ret

0000000000001e56 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e56:	862e                	mv	a2,a1
    1e58:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e5a:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e5c:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e60:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e64:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e66:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e68:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e6c:	2501                	sext.w	a0,a0
    1e6e:	8082                	ret

0000000000001e70 <getdents>:
    register long a7 __asm__("a7") = n;
    1e70:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e74:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e78:	2501                	sext.w	a0,a0
    1e7a:	8082                	ret

0000000000001e7c <pipe>:
    register long a7 __asm__("a7") = n;
    1e7c:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e80:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e82:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e86:	2501                	sext.w	a0,a0
    1e88:	8082                	ret

0000000000001e8a <dup>:
    register long a7 __asm__("a7") = n;
    1e8a:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e8c:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e90:	2501                	sext.w	a0,a0
    1e92:	8082                	ret

0000000000001e94 <dup2>:
    register long a7 __asm__("a7") = n;
    1e94:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e96:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e98:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e9c:	2501                	sext.w	a0,a0
    1e9e:	8082                	ret

0000000000001ea0 <mount>:
    register long a7 __asm__("a7") = n;
    1ea0:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ea4:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ea8:	2501                	sext.w	a0,a0
    1eaa:	8082                	ret

0000000000001eac <umount>:
    register long a7 __asm__("a7") = n;
    1eac:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1eb0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb2:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1eb6:	2501                	sext.w	a0,a0
    1eb8:	8082                	ret

0000000000001eba <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1eba:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1ebc:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ebe:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ec0:	8532                	mv	a0,a2
	mv a2, a4
    1ec2:	863a                	mv	a2,a4
	mv a3, a5
    1ec4:	86be                	mv	a3,a5
	mv a4, a6
    1ec6:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ec8:	0dc00893          	li	a7,220
	ecall
    1ecc:	00000073          	ecall

	beqz a0, 1f
    1ed0:	c111                	beqz	a0,1ed4 <__clone+0x1a>
	# Parent
	ret
    1ed2:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ed4:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ed6:	6522                	ld	a0,8(sp)
	jalr a1
    1ed8:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1eda:	05d00893          	li	a7,93
	ecall
    1ede:	00000073          	ecall
