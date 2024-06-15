
/home/brightnight/OScompetition/6.13晚final_main/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/pipe：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a2a9                	j	114c <__start_main>

0000000000001004 <test_pipe>:
 * 成功测试时的输出：
 * "  Write to pipe successfully."
 */
static int fd[2];

void test_pipe(void){
    1004:	7135                	addi	sp,sp,-160
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f9250513          	addi	a0,a0,-110 # 1f98 <__clone+0x2e>
void test_pipe(void){
    100e:	ed06                	sd	ra,152(sp)
    1010:	e922                	sd	s0,144(sp)
    1012:	e526                	sd	s1,136(sp)
    TEST_START(__func__);
    1014:	3aa000ef          	jal	ra,13be <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	03050513          	addi	a0,a0,48 # 2048 <__func__.0>
    1020:	39e000ef          	jal	ra,13be <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	f8c50513          	addi	a0,a0,-116 # 1fb0 <__clone+0x46>
    102c:	392000ef          	jal	ra,13be <puts>
    int cpid;
    char buf[128] = {0};
    int ret = pipe(fd);
    1030:	00001517          	auipc	a0,0x1
    1034:	01050513          	addi	a0,a0,16 # 2040 <fd>
    char buf[128] = {0};
    1038:	e002                	sd	zero,0(sp)
    103a:	e402                	sd	zero,8(sp)
    103c:	e802                	sd	zero,16(sp)
    103e:	ec02                	sd	zero,24(sp)
    1040:	f002                	sd	zero,32(sp)
    1042:	f402                	sd	zero,40(sp)
    1044:	f802                	sd	zero,48(sp)
    1046:	fc02                	sd	zero,56(sp)
    1048:	e082                	sd	zero,64(sp)
    104a:	e482                	sd	zero,72(sp)
    104c:	e882                	sd	zero,80(sp)
    104e:	ec82                	sd	zero,88(sp)
    1050:	f082                	sd	zero,96(sp)
    1052:	f482                	sd	zero,104(sp)
    1054:	f882                	sd	zero,112(sp)
    1056:	fc82                	sd	zero,120(sp)
    int ret = pipe(fd);
    1058:	6d5000ef          	jal	ra,1f2c <pipe>
    assert(ret != -1);
    105c:	57fd                	li	a5,-1
    105e:	0cf50863          	beq	a0,a5,112e <test_pipe+0x12a>
    const char *data = "  Write to pipe successfully.\n";
    cpid = fork();
    1062:	4ff000ef          	jal	ra,1d60 <fork>
    printf("cpid: %d\n", cpid);
    1066:	85aa                	mv	a1,a0
    cpid = fork();
    1068:	84aa                	mv	s1,a0
    printf("cpid: %d\n", cpid);
    106a:	00001517          	auipc	a0,0x1
    106e:	f7650513          	addi	a0,a0,-138 # 1fe0 <__clone+0x76>
    1072:	36e000ef          	jal	ra,13e0 <printf>
    if(cpid == 0){
    1076:	00001417          	auipc	s0,0x1
    107a:	fca40413          	addi	s0,s0,-54 # 2040 <fd>
    107e:	c8b5                	beqz	s1,10f2 <test_pipe+0xee>
            write(STDOUT, buf, 1);
        write(STDOUT, "\n", 1);
        close(fd[0]);
        wait(NULL);
    }
    if(fork()==0){
    1080:	4e1000ef          	jal	ra,1d60 <fork>
    1084:	e125                	bnez	a0,10e4 <test_pipe+0xe0>
        close(fd[0]);
    1086:	4008                	lw	a0,0(s0)
    1088:	495000ef          	jal	ra,1d1c <close>
        write(fd[1], data, strlen(data));
    108c:	4044                	lw	s1,4(s0)
    108e:	00001517          	auipc	a0,0x1
    1092:	f6250513          	addi	a0,a0,-158 # 1ff0 <__clone+0x86>
    1096:	0af000ef          	jal	ra,1944 <strlen>
    109a:	862a                	mv	a2,a0
    109c:	00001597          	auipc	a1,0x1
    10a0:	f5458593          	addi	a1,a1,-172 # 1ff0 <__clone+0x86>
    10a4:	8526                	mv	a0,s1
    10a6:	48d000ef          	jal	ra,1d32 <write>
        close(fd[1]);
    10aa:	4048                	lw	a0,4(s0)
    10ac:	471000ef          	jal	ra,1d1c <close>
        exit(0);
    10b0:	4501                	li	a0,0
    10b2:	4d1000ef          	jal	ra,1d82 <exit>
    }else{
        close(fd[0]);
        close(fd[1]);
    }
    TEST_END(__func__);
    10b6:	00001517          	auipc	a0,0x1
    10ba:	f5a50513          	addi	a0,a0,-166 # 2010 <__clone+0xa6>
    10be:	300000ef          	jal	ra,13be <puts>
    10c2:	00001517          	auipc	a0,0x1
    10c6:	f8650513          	addi	a0,a0,-122 # 2048 <__func__.0>
    10ca:	2f4000ef          	jal	ra,13be <puts>
    10ce:	00001517          	auipc	a0,0x1
    10d2:	ee250513          	addi	a0,a0,-286 # 1fb0 <__clone+0x46>
    10d6:	2e8000ef          	jal	ra,13be <puts>
}
    10da:	60ea                	ld	ra,152(sp)
    10dc:	644a                	ld	s0,144(sp)
    10de:	64aa                	ld	s1,136(sp)
    10e0:	610d                	addi	sp,sp,160
    10e2:	8082                	ret
        close(fd[0]);
    10e4:	4008                	lw	a0,0(s0)
    10e6:	437000ef          	jal	ra,1d1c <close>
        close(fd[1]);
    10ea:	4048                	lw	a0,4(s0)
    10ec:	431000ef          	jal	ra,1d1c <close>
    10f0:	b7d9                	j	10b6 <test_pipe+0xb2>
        close(fd[1]);
    10f2:	4048                	lw	a0,4(s0)
    10f4:	429000ef          	jal	ra,1d1c <close>
        while(read(fd[0], buf, 1) > 0)
    10f8:	a019                	j	10fe <test_pipe+0xfa>
            write(STDOUT, buf, 1);
    10fa:	439000ef          	jal	ra,1d32 <write>
        while(read(fd[0], buf, 1) > 0)
    10fe:	4008                	lw	a0,0(s0)
    1100:	4605                	li	a2,1
    1102:	858a                	mv	a1,sp
    1104:	425000ef          	jal	ra,1d28 <read>
    1108:	87aa                	mv	a5,a0
            write(STDOUT, buf, 1);
    110a:	4605                	li	a2,1
    110c:	858a                	mv	a1,sp
    110e:	4505                	li	a0,1
        while(read(fd[0], buf, 1) > 0)
    1110:	fef045e3          	bgtz	a5,10fa <test_pipe+0xf6>
        write(STDOUT, "\n", 1);
    1114:	00001597          	auipc	a1,0x1
    1118:	ec458593          	addi	a1,a1,-316 # 1fd8 <__clone+0x6e>
    111c:	417000ef          	jal	ra,1d32 <write>
        close(fd[0]);
    1120:	4008                	lw	a0,0(s0)
    1122:	3fb000ef          	jal	ra,1d1c <close>
        wait(NULL);
    1126:	4501                	li	a0,0
    1128:	51f000ef          	jal	ra,1e46 <wait>
    112c:	bf91                	j	1080 <test_pipe+0x7c>
    assert(ret != -1);
    112e:	00001517          	auipc	a0,0x1
    1132:	e9250513          	addi	a0,a0,-366 # 1fc0 <__clone+0x56>
    1136:	52e000ef          	jal	ra,1664 <panic>
    113a:	b725                	j	1062 <test_pipe+0x5e>

000000000000113c <main>:

int main(void){
    113c:	1141                	addi	sp,sp,-16
    113e:	e406                	sd	ra,8(sp)
    test_pipe();
    1140:	ec5ff0ef          	jal	ra,1004 <test_pipe>
    return 0;
}
    1144:	60a2                	ld	ra,8(sp)
    1146:	4501                	li	a0,0
    1148:	0141                	addi	sp,sp,16
    114a:	8082                	ret

000000000000114c <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    114c:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    114e:	4108                	lw	a0,0(a0)
{
    1150:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    1152:	05a1                	addi	a1,a1,8
{
    1154:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1156:	fe7ff0ef          	jal	ra,113c <main>
    115a:	429000ef          	jal	ra,1d82 <exit>
	return 0;
}
    115e:	60a2                	ld	ra,8(sp)
    1160:	4501                	li	a0,0
    1162:	0141                	addi	sp,sp,16
    1164:	8082                	ret

0000000000001166 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1166:	7179                	addi	sp,sp,-48
    1168:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    116a:	12054b63          	bltz	a0,12a0 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    116e:	02b577bb          	remuw	a5,a0,a1
    1172:	00001617          	auipc	a2,0x1
    1176:	ee660613          	addi	a2,a2,-282 # 2058 <digits>
    buf[16] = 0;
    117a:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    117e:	0005871b          	sext.w	a4,a1
    1182:	1782                	slli	a5,a5,0x20
    1184:	9381                	srli	a5,a5,0x20
    1186:	97b2                	add	a5,a5,a2
    1188:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    118c:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1190:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1194:	1cb56363          	bltu	a0,a1,135a <printint.constprop.0+0x1f4>
        buf[i--] = digits[x % base];
    1198:	45b9                	li	a1,14
    119a:	02e877bb          	remuw	a5,a6,a4
    119e:	1782                	slli	a5,a5,0x20
    11a0:	9381                	srli	a5,a5,0x20
    11a2:	97b2                	add	a5,a5,a2
    11a4:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    11a8:	02e856bb          	divuw	a3,a6,a4
        buf[i--] = digits[x % base];
    11ac:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    11b0:	0ce86e63          	bltu	a6,a4,128c <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    11b4:	02e6f5bb          	remuw	a1,a3,a4
    } while ((x /= base) != 0);
    11b8:	02e6d7bb          	divuw	a5,a3,a4
        buf[i--] = digits[x % base];
    11bc:	1582                	slli	a1,a1,0x20
    11be:	9181                	srli	a1,a1,0x20
    11c0:	95b2                	add	a1,a1,a2
    11c2:	0005c583          	lbu	a1,0(a1)
    11c6:	00b10aa3          	sb	a1,21(sp)
    } while ((x /= base) != 0);
    11ca:	0007859b          	sext.w	a1,a5
    11ce:	12e6ec63          	bltu	a3,a4,1306 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    11d2:	02e7f6bb          	remuw	a3,a5,a4
    11d6:	1682                	slli	a3,a3,0x20
    11d8:	9281                	srli	a3,a3,0x20
    11da:	96b2                	add	a3,a3,a2
    11dc:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11e0:	02e7d83b          	divuw	a6,a5,a4
        buf[i--] = digits[x % base];
    11e4:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    11e8:	12e5e863          	bltu	a1,a4,1318 <printint.constprop.0+0x1b2>
        buf[i--] = digits[x % base];
    11ec:	02e876bb          	remuw	a3,a6,a4
    11f0:	1682                	slli	a3,a3,0x20
    11f2:	9281                	srli	a3,a3,0x20
    11f4:	96b2                	add	a3,a3,a2
    11f6:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11fa:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11fe:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1202:	12e86463          	bltu	a6,a4,132a <printint.constprop.0+0x1c4>
        buf[i--] = digits[x % base];
    1206:	02e5f6bb          	remuw	a3,a1,a4
    120a:	1682                	slli	a3,a3,0x20
    120c:	9281                	srli	a3,a3,0x20
    120e:	96b2                	add	a3,a3,a2
    1210:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1214:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1218:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    121c:	0ce5ec63          	bltu	a1,a4,12f4 <printint.constprop.0+0x18e>
        buf[i--] = digits[x % base];
    1220:	02e876bb          	remuw	a3,a6,a4
    1224:	1682                	slli	a3,a3,0x20
    1226:	9281                	srli	a3,a3,0x20
    1228:	96b2                	add	a3,a3,a2
    122a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    122e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1232:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1236:	10e86963          	bltu	a6,a4,1348 <printint.constprop.0+0x1e2>
        buf[i--] = digits[x % base];
    123a:	02e5f6bb          	remuw	a3,a1,a4
    123e:	1682                	slli	a3,a3,0x20
    1240:	9281                	srli	a3,a3,0x20
    1242:	96b2                	add	a3,a3,a2
    1244:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1248:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    124c:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    1250:	10e5e763          	bltu	a1,a4,135e <printint.constprop.0+0x1f8>
        buf[i--] = digits[x % base];
    1254:	02e876bb          	remuw	a3,a6,a4
    1258:	1682                	slli	a3,a3,0x20
    125a:	9281                	srli	a3,a3,0x20
    125c:	96b2                	add	a3,a3,a2
    125e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1262:	02e857bb          	divuw	a5,a6,a4
        buf[i--] = digits[x % base];
    1266:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    126a:	10e86363          	bltu	a6,a4,1370 <printint.constprop.0+0x20a>
        buf[i--] = digits[x % base];
    126e:	1782                	slli	a5,a5,0x20
    1270:	9381                	srli	a5,a5,0x20
    1272:	97b2                	add	a5,a5,a2
    1274:	0007c783          	lbu	a5,0(a5)
    1278:	4599                	li	a1,6
    127a:	00f10723          	sb	a5,14(sp)

    if (sign)
    127e:	00055763          	bgez	a0,128c <printint.constprop.0+0x126>
        buf[i--] = '-';
    1282:	02d00793          	li	a5,45
    1286:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    128a:	4595                	li	a1,5
    write(f, s, l);
    128c:	003c                	addi	a5,sp,8
    128e:	4641                	li	a2,16
    1290:	9e0d                	subw	a2,a2,a1
    1292:	4505                	li	a0,1
    1294:	95be                	add	a1,a1,a5
    1296:	29d000ef          	jal	ra,1d32 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    129a:	70a2                	ld	ra,40(sp)
    129c:	6145                	addi	sp,sp,48
    129e:	8082                	ret
        x = -xx;
    12a0:	40a0083b          	negw	a6,a0
        buf[i--] = digits[x % base];
    12a4:	02b877bb          	remuw	a5,a6,a1
    12a8:	00001617          	auipc	a2,0x1
    12ac:	db060613          	addi	a2,a2,-592 # 2058 <digits>
    buf[16] = 0;
    12b0:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    12b4:	0005871b          	sext.w	a4,a1
    12b8:	1782                	slli	a5,a5,0x20
    12ba:	9381                	srli	a5,a5,0x20
    12bc:	97b2                	add	a5,a5,a2
    12be:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    12c2:	02b858bb          	divuw	a7,a6,a1
        buf[i--] = digits[x % base];
    12c6:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    12ca:	06b86963          	bltu	a6,a1,133c <printint.constprop.0+0x1d6>
        buf[i--] = digits[x % base];
    12ce:	02e8f7bb          	remuw	a5,a7,a4
    12d2:	1782                	slli	a5,a5,0x20
    12d4:	9381                	srli	a5,a5,0x20
    12d6:	97b2                	add	a5,a5,a2
    12d8:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    12dc:	02e8d6bb          	divuw	a3,a7,a4
        buf[i--] = digits[x % base];
    12e0:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    12e4:	ece8f8e3          	bgeu	a7,a4,11b4 <printint.constprop.0+0x4e>
        buf[i--] = '-';
    12e8:	02d00793          	li	a5,45
    12ec:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    12f0:	45b5                	li	a1,13
    12f2:	bf69                	j	128c <printint.constprop.0+0x126>
    12f4:	45a9                	li	a1,10
    if (sign)
    12f6:	f8055be3          	bgez	a0,128c <printint.constprop.0+0x126>
        buf[i--] = '-';
    12fa:	02d00793          	li	a5,45
    12fe:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1302:	45a5                	li	a1,9
    1304:	b761                	j	128c <printint.constprop.0+0x126>
    1306:	45b5                	li	a1,13
    if (sign)
    1308:	f80552e3          	bgez	a0,128c <printint.constprop.0+0x126>
        buf[i--] = '-';
    130c:	02d00793          	li	a5,45
    1310:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1314:	45b1                	li	a1,12
    1316:	bf9d                	j	128c <printint.constprop.0+0x126>
    1318:	45b1                	li	a1,12
    if (sign)
    131a:	f60559e3          	bgez	a0,128c <printint.constprop.0+0x126>
        buf[i--] = '-';
    131e:	02d00793          	li	a5,45
    1322:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1326:	45ad                	li	a1,11
    1328:	b795                	j	128c <printint.constprop.0+0x126>
    132a:	45ad                	li	a1,11
    if (sign)
    132c:	f60550e3          	bgez	a0,128c <printint.constprop.0+0x126>
        buf[i--] = '-';
    1330:	02d00793          	li	a5,45
    1334:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1338:	45a9                	li	a1,10
    133a:	bf89                	j	128c <printint.constprop.0+0x126>
        buf[i--] = '-';
    133c:	02d00793          	li	a5,45
    1340:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1344:	45b9                	li	a1,14
    1346:	b799                	j	128c <printint.constprop.0+0x126>
    1348:	45a5                	li	a1,9
    if (sign)
    134a:	f40551e3          	bgez	a0,128c <printint.constprop.0+0x126>
        buf[i--] = '-';
    134e:	02d00793          	li	a5,45
    1352:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1356:	45a1                	li	a1,8
    1358:	bf15                	j	128c <printint.constprop.0+0x126>
    i = 15;
    135a:	45bd                	li	a1,15
    135c:	bf05                	j	128c <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    135e:	45a1                	li	a1,8
    if (sign)
    1360:	f20556e3          	bgez	a0,128c <printint.constprop.0+0x126>
        buf[i--] = '-';
    1364:	02d00793          	li	a5,45
    1368:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    136c:	459d                	li	a1,7
    136e:	bf39                	j	128c <printint.constprop.0+0x126>
    1370:	459d                	li	a1,7
    if (sign)
    1372:	f0055de3          	bgez	a0,128c <printint.constprop.0+0x126>
        buf[i--] = '-';
    1376:	02d00793          	li	a5,45
    137a:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    137e:	4599                	li	a1,6
    1380:	b731                	j	128c <printint.constprop.0+0x126>

0000000000001382 <getchar>:
{
    1382:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1384:	00f10593          	addi	a1,sp,15
    1388:	4605                	li	a2,1
    138a:	4501                	li	a0,0
{
    138c:	ec06                	sd	ra,24(sp)
    char byte = 0;
    138e:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1392:	197000ef          	jal	ra,1d28 <read>
}
    1396:	60e2                	ld	ra,24(sp)
    1398:	00f14503          	lbu	a0,15(sp)
    139c:	6105                	addi	sp,sp,32
    139e:	8082                	ret

00000000000013a0 <putchar>:
{
    13a0:	1101                	addi	sp,sp,-32
    13a2:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    13a4:	00f10593          	addi	a1,sp,15
    13a8:	4605                	li	a2,1
    13aa:	4505                	li	a0,1
{
    13ac:	ec06                	sd	ra,24(sp)
    char byte = c;
    13ae:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    13b2:	181000ef          	jal	ra,1d32 <write>
}
    13b6:	60e2                	ld	ra,24(sp)
    13b8:	2501                	sext.w	a0,a0
    13ba:	6105                	addi	sp,sp,32
    13bc:	8082                	ret

00000000000013be <puts>:
{
    13be:	1141                	addi	sp,sp,-16
    13c0:	e406                	sd	ra,8(sp)
    13c2:	e022                	sd	s0,0(sp)
    13c4:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    13c6:	57e000ef          	jal	ra,1944 <strlen>
    13ca:	862a                	mv	a2,a0
    13cc:	85a2                	mv	a1,s0
    13ce:	4505                	li	a0,1
    13d0:	163000ef          	jal	ra,1d32 <write>
}
    13d4:	60a2                	ld	ra,8(sp)
    13d6:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    13d8:	957d                	srai	a0,a0,0x3f
    return r;
    13da:	2501                	sext.w	a0,a0
}
    13dc:	0141                	addi	sp,sp,16
    13de:	8082                	ret

00000000000013e0 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    13e0:	7171                	addi	sp,sp,-176
    13e2:	fc56                	sd	s5,56(sp)
    13e4:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    13e6:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    13e8:	18bc                	addi	a5,sp,120
{
    13ea:	e8ca                	sd	s2,80(sp)
    13ec:	e4ce                	sd	s3,72(sp)
    13ee:	e0d2                	sd	s4,64(sp)
    13f0:	f85a                	sd	s6,48(sp)
    13f2:	f486                	sd	ra,104(sp)
    13f4:	f0a2                	sd	s0,96(sp)
    13f6:	eca6                	sd	s1,88(sp)
    13f8:	fcae                	sd	a1,120(sp)
    13fa:	e132                	sd	a2,128(sp)
    13fc:	e536                	sd	a3,136(sp)
    13fe:	e93a                	sd	a4,144(sp)
    1400:	f142                	sd	a6,160(sp)
    1402:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1404:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1406:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    140a:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    140e:	00001b17          	auipc	s6,0x1
    1412:	c12b0b13          	addi	s6,s6,-1006 # 2020 <__clone+0xb6>
    buf[i++] = '0';
    1416:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    141a:	00001997          	auipc	s3,0x1
    141e:	c3e98993          	addi	s3,s3,-962 # 2058 <digits>
        if (!*s)
    1422:	00054783          	lbu	a5,0(a0)
    1426:	16078a63          	beqz	a5,159a <printf+0x1ba>
    142a:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    142c:	19278163          	beq	a5,s2,15ae <printf+0x1ce>
    1430:	00164783          	lbu	a5,1(a2)
    1434:	0605                	addi	a2,a2,1
    1436:	fbfd                	bnez	a5,142c <printf+0x4c>
    1438:	84b2                	mv	s1,a2
        l = z - a;
    143a:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    143e:	85aa                	mv	a1,a0
    1440:	8622                	mv	a2,s0
    1442:	4505                	li	a0,1
    1444:	0ef000ef          	jal	ra,1d32 <write>
        if (l)
    1448:	18041c63          	bnez	s0,15e0 <printf+0x200>
        if (s[1] == 0)
    144c:	0014c783          	lbu	a5,1(s1)
    1450:	14078563          	beqz	a5,159a <printf+0x1ba>
        switch (s[1])
    1454:	1d478063          	beq	a5,s4,1614 <printf+0x234>
    1458:	18fa6663          	bltu	s4,a5,15e4 <printf+0x204>
    145c:	06400713          	li	a4,100
    1460:	1ae78063          	beq	a5,a4,1600 <printf+0x220>
    1464:	07000713          	li	a4,112
    1468:	1ce79963          	bne	a5,a4,163a <printf+0x25a>
            printptr(va_arg(ap, uint64));
    146c:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    146e:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1472:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1474:	631c                	ld	a5,0(a4)
    1476:	0721                	addi	a4,a4,8
    1478:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    147a:	00479293          	slli	t0,a5,0x4
    147e:	00879f93          	slli	t6,a5,0x8
    1482:	00c79f13          	slli	t5,a5,0xc
    1486:	01079e93          	slli	t4,a5,0x10
    148a:	01479e13          	slli	t3,a5,0x14
    148e:	01879313          	slli	t1,a5,0x18
    1492:	01c79893          	slli	a7,a5,0x1c
    1496:	02479813          	slli	a6,a5,0x24
    149a:	02879513          	slli	a0,a5,0x28
    149e:	02c79593          	slli	a1,a5,0x2c
    14a2:	03079693          	slli	a3,a5,0x30
    14a6:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14aa:	03c7d413          	srli	s0,a5,0x3c
    14ae:	01c7d39b          	srliw	t2,a5,0x1c
    14b2:	03c2d293          	srli	t0,t0,0x3c
    14b6:	03cfdf93          	srli	t6,t6,0x3c
    14ba:	03cf5f13          	srli	t5,t5,0x3c
    14be:	03cede93          	srli	t4,t4,0x3c
    14c2:	03ce5e13          	srli	t3,t3,0x3c
    14c6:	03c35313          	srli	t1,t1,0x3c
    14ca:	03c8d893          	srli	a7,a7,0x3c
    14ce:	03c85813          	srli	a6,a6,0x3c
    14d2:	9171                	srli	a0,a0,0x3c
    14d4:	91f1                	srli	a1,a1,0x3c
    14d6:	92f1                	srli	a3,a3,0x3c
    14d8:	9371                	srli	a4,a4,0x3c
    14da:	96ce                	add	a3,a3,s3
    14dc:	974e                	add	a4,a4,s3
    14de:	944e                	add	s0,s0,s3
    14e0:	92ce                	add	t0,t0,s3
    14e2:	9fce                	add	t6,t6,s3
    14e4:	9f4e                	add	t5,t5,s3
    14e6:	9ece                	add	t4,t4,s3
    14e8:	9e4e                	add	t3,t3,s3
    14ea:	934e                	add	t1,t1,s3
    14ec:	98ce                	add	a7,a7,s3
    14ee:	93ce                	add	t2,t2,s3
    14f0:	984e                	add	a6,a6,s3
    14f2:	954e                	add	a0,a0,s3
    14f4:	95ce                	add	a1,a1,s3
    14f6:	0006c083          	lbu	ra,0(a3)
    14fa:	0002c283          	lbu	t0,0(t0)
    14fe:	00074683          	lbu	a3,0(a4)
    1502:	000fcf83          	lbu	t6,0(t6)
    1506:	000f4f03          	lbu	t5,0(t5)
    150a:	000ece83          	lbu	t4,0(t4)
    150e:	000e4e03          	lbu	t3,0(t3)
    1512:	00034303          	lbu	t1,0(t1)
    1516:	0008c883          	lbu	a7,0(a7)
    151a:	0003c383          	lbu	t2,0(t2)
    151e:	00084803          	lbu	a6,0(a6)
    1522:	00054503          	lbu	a0,0(a0)
    1526:	0005c583          	lbu	a1,0(a1)
    152a:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    152e:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1532:	9371                	srli	a4,a4,0x3c
    1534:	8bbd                	andi	a5,a5,15
    1536:	974e                	add	a4,a4,s3
    1538:	97ce                	add	a5,a5,s3
    153a:	005105a3          	sb	t0,11(sp)
    153e:	01f10623          	sb	t6,12(sp)
    1542:	01e106a3          	sb	t5,13(sp)
    1546:	01d10723          	sb	t4,14(sp)
    154a:	01c107a3          	sb	t3,15(sp)
    154e:	00610823          	sb	t1,16(sp)
    1552:	011108a3          	sb	a7,17(sp)
    1556:	00710923          	sb	t2,18(sp)
    155a:	010109a3          	sb	a6,19(sp)
    155e:	00a10a23          	sb	a0,20(sp)
    1562:	00b10aa3          	sb	a1,21(sp)
    1566:	00110b23          	sb	ra,22(sp)
    156a:	00d10ba3          	sb	a3,23(sp)
    156e:	00810523          	sb	s0,10(sp)
    1572:	00074703          	lbu	a4,0(a4)
    1576:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    157a:	002c                	addi	a1,sp,8
    157c:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    157e:	00e10c23          	sb	a4,24(sp)
    1582:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1586:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    158a:	7a8000ef          	jal	ra,1d32 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    158e:	00248513          	addi	a0,s1,2
        if (!*s)
    1592:	00054783          	lbu	a5,0(a0)
    1596:	e8079ae3          	bnez	a5,142a <printf+0x4a>
    }
    va_end(ap);
}
    159a:	70a6                	ld	ra,104(sp)
    159c:	7406                	ld	s0,96(sp)
    159e:	64e6                	ld	s1,88(sp)
    15a0:	6946                	ld	s2,80(sp)
    15a2:	69a6                	ld	s3,72(sp)
    15a4:	6a06                	ld	s4,64(sp)
    15a6:	7ae2                	ld	s5,56(sp)
    15a8:	7b42                	ld	s6,48(sp)
    15aa:	614d                	addi	sp,sp,176
    15ac:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    15ae:	00064783          	lbu	a5,0(a2)
    15b2:	84b2                	mv	s1,a2
    15b4:	01278963          	beq	a5,s2,15c6 <printf+0x1e6>
    15b8:	b549                	j	143a <printf+0x5a>
    15ba:	0024c783          	lbu	a5,2(s1)
    15be:	0605                	addi	a2,a2,1
    15c0:	0489                	addi	s1,s1,2
    15c2:	e7279ce3          	bne	a5,s2,143a <printf+0x5a>
    15c6:	0014c783          	lbu	a5,1(s1)
    15ca:	ff2788e3          	beq	a5,s2,15ba <printf+0x1da>
        l = z - a;
    15ce:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    15d2:	85aa                	mv	a1,a0
    15d4:	8622                	mv	a2,s0
    15d6:	4505                	li	a0,1
    15d8:	75a000ef          	jal	ra,1d32 <write>
        if (l)
    15dc:	e60408e3          	beqz	s0,144c <printf+0x6c>
    15e0:	8526                	mv	a0,s1
    15e2:	b581                	j	1422 <printf+0x42>
        switch (s[1])
    15e4:	07800713          	li	a4,120
    15e8:	04e79963          	bne	a5,a4,163a <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    15ec:	6782                	ld	a5,0(sp)
    15ee:	45c1                	li	a1,16
    15f0:	4388                	lw	a0,0(a5)
    15f2:	07a1                	addi	a5,a5,8
    15f4:	e03e                	sd	a5,0(sp)
    15f6:	b71ff0ef          	jal	ra,1166 <printint.constprop.0>
        s += 2;
    15fa:	00248513          	addi	a0,s1,2
    15fe:	bf51                	j	1592 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    1600:	6782                	ld	a5,0(sp)
    1602:	45a9                	li	a1,10
    1604:	4388                	lw	a0,0(a5)
    1606:	07a1                	addi	a5,a5,8
    1608:	e03e                	sd	a5,0(sp)
    160a:	b5dff0ef          	jal	ra,1166 <printint.constprop.0>
        s += 2;
    160e:	00248513          	addi	a0,s1,2
    1612:	b741                	j	1592 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1614:	6782                	ld	a5,0(sp)
    1616:	6380                	ld	s0,0(a5)
    1618:	07a1                	addi	a5,a5,8
    161a:	e03e                	sd	a5,0(sp)
    161c:	c031                	beqz	s0,1660 <printf+0x280>
            l = strnlen(a, 200);
    161e:	0c800593          	li	a1,200
    1622:	8522                	mv	a0,s0
    1624:	40c000ef          	jal	ra,1a30 <strnlen>
    write(f, s, l);
    1628:	0005061b          	sext.w	a2,a0
    162c:	85a2                	mv	a1,s0
    162e:	4505                	li	a0,1
    1630:	702000ef          	jal	ra,1d32 <write>
        s += 2;
    1634:	00248513          	addi	a0,s1,2
    1638:	bfa9                	j	1592 <printf+0x1b2>
    return write(stdout, &byte, 1);
    163a:	4605                	li	a2,1
    163c:	002c                	addi	a1,sp,8
    163e:	4505                	li	a0,1
    char byte = c;
    1640:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1644:	6ee000ef          	jal	ra,1d32 <write>
    char byte = c;
    1648:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    164c:	4605                	li	a2,1
    164e:	002c                	addi	a1,sp,8
    1650:	4505                	li	a0,1
    char byte = c;
    1652:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1656:	6dc000ef          	jal	ra,1d32 <write>
        s += 2;
    165a:	00248513          	addi	a0,s1,2
    165e:	bf15                	j	1592 <printf+0x1b2>
                a = "(null)";
    1660:	845a                	mv	s0,s6
    1662:	bf75                	j	161e <printf+0x23e>

0000000000001664 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1664:	1141                	addi	sp,sp,-16
    1666:	e406                	sd	ra,8(sp)
    puts(m);
    1668:	d57ff0ef          	jal	ra,13be <puts>
    exit(-100);
}
    166c:	60a2                	ld	ra,8(sp)
    exit(-100);
    166e:	f9c00513          	li	a0,-100
}
    1672:	0141                	addi	sp,sp,16
    exit(-100);
    1674:	a739                	j	1d82 <exit>

0000000000001676 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1676:	02000793          	li	a5,32
    167a:	00f50663          	beq	a0,a5,1686 <isspace+0x10>
    167e:	355d                	addiw	a0,a0,-9
    1680:	00553513          	sltiu	a0,a0,5
    1684:	8082                	ret
    1686:	4505                	li	a0,1
}
    1688:	8082                	ret

000000000000168a <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    168a:	fd05051b          	addiw	a0,a0,-48
}
    168e:	00a53513          	sltiu	a0,a0,10
    1692:	8082                	ret

0000000000001694 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1694:	02000613          	li	a2,32
    1698:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    169a:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    169e:	ff77869b          	addiw	a3,a5,-9
    16a2:	04c78c63          	beq	a5,a2,16fa <atoi+0x66>
    16a6:	0007871b          	sext.w	a4,a5
    16aa:	04d5f863          	bgeu	a1,a3,16fa <atoi+0x66>
        s++;
    switch (*s)
    16ae:	02b00693          	li	a3,43
    16b2:	04d78963          	beq	a5,a3,1704 <atoi+0x70>
    16b6:	02d00693          	li	a3,45
    16ba:	06d78263          	beq	a5,a3,171e <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    16be:	fd07061b          	addiw	a2,a4,-48
    16c2:	47a5                	li	a5,9
    16c4:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    16c6:	4e01                	li	t3,0
    while (isdigit(*s))
    16c8:	04c7e963          	bltu	a5,a2,171a <atoi+0x86>
    int n = 0, neg = 0;
    16cc:	4501                	li	a0,0
    while (isdigit(*s))
    16ce:	4825                	li	a6,9
    16d0:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    16d4:	0025179b          	slliw	a5,a0,0x2
    16d8:	9fa9                	addw	a5,a5,a0
    16da:	fd07031b          	addiw	t1,a4,-48
    16de:	0017989b          	slliw	a7,a5,0x1
    while (isdigit(*s))
    16e2:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    16e6:	0685                	addi	a3,a3,1
    16e8:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    16ec:	0006071b          	sext.w	a4,a2
    16f0:	feb870e3          	bgeu	a6,a1,16d0 <atoi+0x3c>
    return neg ? n : -n;
    16f4:	000e0563          	beqz	t3,16fe <atoi+0x6a>
}
    16f8:	8082                	ret
        s++;
    16fa:	0505                	addi	a0,a0,1
    16fc:	bf79                	j	169a <atoi+0x6>
    return neg ? n : -n;
    16fe:	4113053b          	subw	a0,t1,a7
    1702:	8082                	ret
    while (isdigit(*s))
    1704:	00154703          	lbu	a4,1(a0)
    1708:	47a5                	li	a5,9
        s++;
    170a:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    170e:	fd07061b          	addiw	a2,a4,-48
    int n = 0, neg = 0;
    1712:	4e01                	li	t3,0
    while (isdigit(*s))
    1714:	2701                	sext.w	a4,a4
    1716:	fac7fbe3          	bgeu	a5,a2,16cc <atoi+0x38>
    171a:	4501                	li	a0,0
}
    171c:	8082                	ret
    while (isdigit(*s))
    171e:	00154703          	lbu	a4,1(a0)
    1722:	47a5                	li	a5,9
        s++;
    1724:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1728:	fd07061b          	addiw	a2,a4,-48
    172c:	2701                	sext.w	a4,a4
    172e:	fec7e6e3          	bltu	a5,a2,171a <atoi+0x86>
        neg = 1;
    1732:	4e05                	li	t3,1
    1734:	bf61                	j	16cc <atoi+0x38>

0000000000001736 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1736:	16060d63          	beqz	a2,18b0 <memset+0x17a>
    173a:	40a007b3          	neg	a5,a0
    173e:	8b9d                	andi	a5,a5,7
    1740:	00778693          	addi	a3,a5,7
    1744:	482d                	li	a6,11
    1746:	0ff5f713          	zext.b	a4,a1
    174a:	fff60593          	addi	a1,a2,-1
    174e:	1706e263          	bltu	a3,a6,18b2 <memset+0x17c>
    1752:	16d5ea63          	bltu	a1,a3,18c6 <memset+0x190>
    1756:	16078563          	beqz	a5,18c0 <memset+0x18a>
    175a:	00e50023          	sb	a4,0(a0)
    175e:	4685                	li	a3,1
    1760:	00150593          	addi	a1,a0,1
    1764:	14d78c63          	beq	a5,a3,18bc <memset+0x186>
    1768:	00e500a3          	sb	a4,1(a0)
    176c:	4689                	li	a3,2
    176e:	00250593          	addi	a1,a0,2
    1772:	14d78d63          	beq	a5,a3,18cc <memset+0x196>
    1776:	00e50123          	sb	a4,2(a0)
    177a:	468d                	li	a3,3
    177c:	00350593          	addi	a1,a0,3
    1780:	12d78b63          	beq	a5,a3,18b6 <memset+0x180>
    1784:	00e501a3          	sb	a4,3(a0)
    1788:	4691                	li	a3,4
    178a:	00450593          	addi	a1,a0,4
    178e:	14d78163          	beq	a5,a3,18d0 <memset+0x19a>
    1792:	00e50223          	sb	a4,4(a0)
    1796:	4695                	li	a3,5
    1798:	00550593          	addi	a1,a0,5
    179c:	12d78c63          	beq	a5,a3,18d4 <memset+0x19e>
    17a0:	00e502a3          	sb	a4,5(a0)
    17a4:	469d                	li	a3,7
    17a6:	00650593          	addi	a1,a0,6
    17aa:	12d79763          	bne	a5,a3,18d8 <memset+0x1a2>
    17ae:	00750593          	addi	a1,a0,7
    17b2:	00e50323          	sb	a4,6(a0)
    17b6:	481d                	li	a6,7
    17b8:	00871693          	slli	a3,a4,0x8
    17bc:	01071893          	slli	a7,a4,0x10
    17c0:	8ed9                	or	a3,a3,a4
    17c2:	01871313          	slli	t1,a4,0x18
    17c6:	0116e6b3          	or	a3,a3,a7
    17ca:	0066e6b3          	or	a3,a3,t1
    17ce:	02071893          	slli	a7,a4,0x20
    17d2:	02871e13          	slli	t3,a4,0x28
    17d6:	0116e6b3          	or	a3,a3,a7
    17da:	40f60333          	sub	t1,a2,a5
    17de:	03071893          	slli	a7,a4,0x30
    17e2:	01c6e6b3          	or	a3,a3,t3
    17e6:	0116e6b3          	or	a3,a3,a7
    17ea:	03871e13          	slli	t3,a4,0x38
    17ee:	97aa                	add	a5,a5,a0
    17f0:	ff837893          	andi	a7,t1,-8
    17f4:	01c6e6b3          	or	a3,a3,t3
    17f8:	98be                	add	a7,a7,a5
    17fa:	e394                	sd	a3,0(a5)
    17fc:	07a1                	addi	a5,a5,8
    17fe:	ff179ee3          	bne	a5,a7,17fa <memset+0xc4>
    1802:	ff837893          	andi	a7,t1,-8
    1806:	011587b3          	add	a5,a1,a7
    180a:	010886bb          	addw	a3,a7,a6
    180e:	0b130663          	beq	t1,a7,18ba <memset+0x184>
    1812:	00e78023          	sb	a4,0(a5)
    1816:	0016859b          	addiw	a1,a3,1
    181a:	08c5fb63          	bgeu	a1,a2,18b0 <memset+0x17a>
    181e:	00e780a3          	sb	a4,1(a5)
    1822:	0026859b          	addiw	a1,a3,2
    1826:	08c5f563          	bgeu	a1,a2,18b0 <memset+0x17a>
    182a:	00e78123          	sb	a4,2(a5)
    182e:	0036859b          	addiw	a1,a3,3
    1832:	06c5ff63          	bgeu	a1,a2,18b0 <memset+0x17a>
    1836:	00e781a3          	sb	a4,3(a5)
    183a:	0046859b          	addiw	a1,a3,4
    183e:	06c5f963          	bgeu	a1,a2,18b0 <memset+0x17a>
    1842:	00e78223          	sb	a4,4(a5)
    1846:	0056859b          	addiw	a1,a3,5
    184a:	06c5f363          	bgeu	a1,a2,18b0 <memset+0x17a>
    184e:	00e782a3          	sb	a4,5(a5)
    1852:	0066859b          	addiw	a1,a3,6
    1856:	04c5fd63          	bgeu	a1,a2,18b0 <memset+0x17a>
    185a:	00e78323          	sb	a4,6(a5)
    185e:	0076859b          	addiw	a1,a3,7
    1862:	04c5f763          	bgeu	a1,a2,18b0 <memset+0x17a>
    1866:	00e783a3          	sb	a4,7(a5)
    186a:	0086859b          	addiw	a1,a3,8
    186e:	04c5f163          	bgeu	a1,a2,18b0 <memset+0x17a>
    1872:	00e78423          	sb	a4,8(a5)
    1876:	0096859b          	addiw	a1,a3,9
    187a:	02c5fb63          	bgeu	a1,a2,18b0 <memset+0x17a>
    187e:	00e784a3          	sb	a4,9(a5)
    1882:	00a6859b          	addiw	a1,a3,10
    1886:	02c5f563          	bgeu	a1,a2,18b0 <memset+0x17a>
    188a:	00e78523          	sb	a4,10(a5)
    188e:	00b6859b          	addiw	a1,a3,11
    1892:	00c5ff63          	bgeu	a1,a2,18b0 <memset+0x17a>
    1896:	00e785a3          	sb	a4,11(a5)
    189a:	00c6859b          	addiw	a1,a3,12
    189e:	00c5f963          	bgeu	a1,a2,18b0 <memset+0x17a>
    18a2:	00e78623          	sb	a4,12(a5)
    18a6:	26b5                	addiw	a3,a3,13
    18a8:	00c6f463          	bgeu	a3,a2,18b0 <memset+0x17a>
    18ac:	00e786a3          	sb	a4,13(a5)
        ;
    return dest;
}
    18b0:	8082                	ret
    18b2:	46ad                	li	a3,11
    18b4:	bd79                	j	1752 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    18b6:	480d                	li	a6,3
    18b8:	b701                	j	17b8 <memset+0x82>
    18ba:	8082                	ret
    18bc:	4805                	li	a6,1
    18be:	bded                	j	17b8 <memset+0x82>
    18c0:	85aa                	mv	a1,a0
    18c2:	4801                	li	a6,0
    18c4:	bdd5                	j	17b8 <memset+0x82>
    18c6:	87aa                	mv	a5,a0
    18c8:	4681                	li	a3,0
    18ca:	b7a1                	j	1812 <memset+0xdc>
    18cc:	4809                	li	a6,2
    18ce:	b5ed                	j	17b8 <memset+0x82>
    18d0:	4811                	li	a6,4
    18d2:	b5dd                	j	17b8 <memset+0x82>
    18d4:	4815                	li	a6,5
    18d6:	b5cd                	j	17b8 <memset+0x82>
    18d8:	4819                	li	a6,6
    18da:	bdf9                	j	17b8 <memset+0x82>

00000000000018dc <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    18dc:	00054783          	lbu	a5,0(a0)
    18e0:	0005c703          	lbu	a4,0(a1)
    18e4:	00e79863          	bne	a5,a4,18f4 <strcmp+0x18>
    18e8:	0505                	addi	a0,a0,1
    18ea:	0585                	addi	a1,a1,1
    18ec:	fbe5                	bnez	a5,18dc <strcmp>
    18ee:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    18f0:	9d19                	subw	a0,a0,a4
    18f2:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    18f4:	0007851b          	sext.w	a0,a5
    18f8:	bfe5                	j	18f0 <strcmp+0x14>

00000000000018fa <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    18fa:	ca15                	beqz	a2,192e <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18fc:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1900:	167d                	addi	a2,a2,-1
    1902:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1906:	eb99                	bnez	a5,191c <strncmp+0x22>
    1908:	a815                	j	193c <strncmp+0x42>
    190a:	00a68e63          	beq	a3,a0,1926 <strncmp+0x2c>
    190e:	0505                	addi	a0,a0,1
    1910:	00f71b63          	bne	a4,a5,1926 <strncmp+0x2c>
    1914:	00054783          	lbu	a5,0(a0)
    1918:	cf89                	beqz	a5,1932 <strncmp+0x38>
    191a:	85b2                	mv	a1,a2
    191c:	0005c703          	lbu	a4,0(a1)
    1920:	00158613          	addi	a2,a1,1
    1924:	f37d                	bnez	a4,190a <strncmp+0x10>
        ;
    return *l - *r;
    1926:	0007851b          	sext.w	a0,a5
    192a:	9d19                	subw	a0,a0,a4
    192c:	8082                	ret
        return 0;
    192e:	4501                	li	a0,0
}
    1930:	8082                	ret
    return *l - *r;
    1932:	0015c703          	lbu	a4,1(a1)
    1936:	4501                	li	a0,0
    1938:	9d19                	subw	a0,a0,a4
    193a:	8082                	ret
    193c:	0005c703          	lbu	a4,0(a1)
    1940:	4501                	li	a0,0
    1942:	b7e5                	j	192a <strncmp+0x30>

0000000000001944 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1944:	00757793          	andi	a5,a0,7
    1948:	cf89                	beqz	a5,1962 <strlen+0x1e>
    194a:	87aa                	mv	a5,a0
    194c:	a029                	j	1956 <strlen+0x12>
    194e:	0785                	addi	a5,a5,1
    1950:	0077f713          	andi	a4,a5,7
    1954:	cb01                	beqz	a4,1964 <strlen+0x20>
        if (!*s)
    1956:	0007c703          	lbu	a4,0(a5)
    195a:	fb75                	bnez	a4,194e <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    195c:	40a78533          	sub	a0,a5,a0
}
    1960:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1962:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1964:	6394                	ld	a3,0(a5)
    1966:	00000597          	auipc	a1,0x0
    196a:	6c25b583          	ld	a1,1730(a1) # 2028 <__clone+0xbe>
    196e:	00000617          	auipc	a2,0x0
    1972:	6c263603          	ld	a2,1730(a2) # 2030 <__clone+0xc6>
    1976:	a019                	j	197c <strlen+0x38>
    1978:	6794                	ld	a3,8(a5)
    197a:	07a1                	addi	a5,a5,8
    197c:	00b68733          	add	a4,a3,a1
    1980:	fff6c693          	not	a3,a3
    1984:	8f75                	and	a4,a4,a3
    1986:	8f71                	and	a4,a4,a2
    1988:	db65                	beqz	a4,1978 <strlen+0x34>
    for (; *s; s++)
    198a:	0007c703          	lbu	a4,0(a5)
    198e:	d779                	beqz	a4,195c <strlen+0x18>
    1990:	0017c703          	lbu	a4,1(a5)
    1994:	0785                	addi	a5,a5,1
    1996:	d379                	beqz	a4,195c <strlen+0x18>
    1998:	0017c703          	lbu	a4,1(a5)
    199c:	0785                	addi	a5,a5,1
    199e:	fb6d                	bnez	a4,1990 <strlen+0x4c>
    19a0:	bf75                	j	195c <strlen+0x18>

00000000000019a2 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19a2:	00757713          	andi	a4,a0,7
{
    19a6:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    19a8:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19ac:	cb19                	beqz	a4,19c2 <memchr+0x20>
    19ae:	ce25                	beqz	a2,1a26 <memchr+0x84>
    19b0:	0007c703          	lbu	a4,0(a5)
    19b4:	04b70e63          	beq	a4,a1,1a10 <memchr+0x6e>
    19b8:	0785                	addi	a5,a5,1
    19ba:	0077f713          	andi	a4,a5,7
    19be:	167d                	addi	a2,a2,-1
    19c0:	f77d                	bnez	a4,19ae <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    19c2:	4501                	li	a0,0
    if (n && *s != c)
    19c4:	c235                	beqz	a2,1a28 <memchr+0x86>
    19c6:	0007c703          	lbu	a4,0(a5)
    19ca:	04b70363          	beq	a4,a1,1a10 <memchr+0x6e>
        size_t k = ONES * c;
    19ce:	00000517          	auipc	a0,0x0
    19d2:	66a53503          	ld	a0,1642(a0) # 2038 <__clone+0xce>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19d6:	471d                	li	a4,7
        size_t k = ONES * c;
    19d8:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19dc:	02c77a63          	bgeu	a4,a2,1a10 <memchr+0x6e>
    19e0:	00000897          	auipc	a7,0x0
    19e4:	6488b883          	ld	a7,1608(a7) # 2028 <__clone+0xbe>
    19e8:	00000817          	auipc	a6,0x0
    19ec:	64883803          	ld	a6,1608(a6) # 2030 <__clone+0xc6>
    19f0:	431d                	li	t1,7
    19f2:	a029                	j	19fc <memchr+0x5a>
    19f4:	1661                	addi	a2,a2,-8
    19f6:	07a1                	addi	a5,a5,8
    19f8:	02c37963          	bgeu	t1,a2,1a2a <memchr+0x88>
    19fc:	6398                	ld	a4,0(a5)
    19fe:	8f29                	xor	a4,a4,a0
    1a00:	011706b3          	add	a3,a4,a7
    1a04:	fff74713          	not	a4,a4
    1a08:	8f75                	and	a4,a4,a3
    1a0a:	01077733          	and	a4,a4,a6
    1a0e:	d37d                	beqz	a4,19f4 <memchr+0x52>
{
    1a10:	853e                	mv	a0,a5
    1a12:	97b2                	add	a5,a5,a2
    1a14:	a021                	j	1a1c <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1a16:	0505                	addi	a0,a0,1
    1a18:	00f50763          	beq	a0,a5,1a26 <memchr+0x84>
    1a1c:	00054703          	lbu	a4,0(a0)
    1a20:	feb71be3          	bne	a4,a1,1a16 <memchr+0x74>
    1a24:	8082                	ret
    return n ? (void *)s : 0;
    1a26:	4501                	li	a0,0
}
    1a28:	8082                	ret
    return n ? (void *)s : 0;
    1a2a:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1a2c:	f275                	bnez	a2,1a10 <memchr+0x6e>
}
    1a2e:	8082                	ret

0000000000001a30 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1a30:	1101                	addi	sp,sp,-32
    1a32:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1a34:	862e                	mv	a2,a1
{
    1a36:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1a38:	4581                	li	a1,0
{
    1a3a:	e426                	sd	s1,8(sp)
    1a3c:	ec06                	sd	ra,24(sp)
    1a3e:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1a40:	f63ff0ef          	jal	ra,19a2 <memchr>
    return p ? p - s : n;
    1a44:	c519                	beqz	a0,1a52 <strnlen+0x22>
}
    1a46:	60e2                	ld	ra,24(sp)
    1a48:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1a4a:	8d05                	sub	a0,a0,s1
}
    1a4c:	64a2                	ld	s1,8(sp)
    1a4e:	6105                	addi	sp,sp,32
    1a50:	8082                	ret
    1a52:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1a54:	8522                	mv	a0,s0
}
    1a56:	6442                	ld	s0,16(sp)
    1a58:	64a2                	ld	s1,8(sp)
    1a5a:	6105                	addi	sp,sp,32
    1a5c:	8082                	ret

0000000000001a5e <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a5e:	00a5c7b3          	xor	a5,a1,a0
    1a62:	8b9d                	andi	a5,a5,7
    1a64:	eb95                	bnez	a5,1a98 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a66:	0075f793          	andi	a5,a1,7
    1a6a:	e7b1                	bnez	a5,1ab6 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a6c:	6198                	ld	a4,0(a1)
    1a6e:	00000617          	auipc	a2,0x0
    1a72:	5ba63603          	ld	a2,1466(a2) # 2028 <__clone+0xbe>
    1a76:	00000817          	auipc	a6,0x0
    1a7a:	5ba83803          	ld	a6,1466(a6) # 2030 <__clone+0xc6>
    1a7e:	a029                	j	1a88 <strcpy+0x2a>
    1a80:	05a1                	addi	a1,a1,8
    1a82:	e118                	sd	a4,0(a0)
    1a84:	6198                	ld	a4,0(a1)
    1a86:	0521                	addi	a0,a0,8
    1a88:	00c707b3          	add	a5,a4,a2
    1a8c:	fff74693          	not	a3,a4
    1a90:	8ff5                	and	a5,a5,a3
    1a92:	0107f7b3          	and	a5,a5,a6
    1a96:	d7ed                	beqz	a5,1a80 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a98:	0005c783          	lbu	a5,0(a1)
    1a9c:	00f50023          	sb	a5,0(a0)
    1aa0:	c785                	beqz	a5,1ac8 <strcpy+0x6a>
    1aa2:	0015c783          	lbu	a5,1(a1)
    1aa6:	0505                	addi	a0,a0,1
    1aa8:	0585                	addi	a1,a1,1
    1aaa:	00f50023          	sb	a5,0(a0)
    1aae:	fbf5                	bnez	a5,1aa2 <strcpy+0x44>
        ;
    return d;
}
    1ab0:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1ab2:	0505                	addi	a0,a0,1
    1ab4:	df45                	beqz	a4,1a6c <strcpy+0xe>
            if (!(*d = *s))
    1ab6:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1aba:	0585                	addi	a1,a1,1
    1abc:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1ac0:	00f50023          	sb	a5,0(a0)
    1ac4:	f7fd                	bnez	a5,1ab2 <strcpy+0x54>
}
    1ac6:	8082                	ret
    1ac8:	8082                	ret

0000000000001aca <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1aca:	00a5c7b3          	xor	a5,a1,a0
    1ace:	8b9d                	andi	a5,a5,7
    1ad0:	1a079863          	bnez	a5,1c80 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1ad4:	0075f793          	andi	a5,a1,7
    1ad8:	16078463          	beqz	a5,1c40 <strncpy+0x176>
    1adc:	ea01                	bnez	a2,1aec <strncpy+0x22>
    1ade:	a421                	j	1ce6 <strncpy+0x21c>
    1ae0:	167d                	addi	a2,a2,-1
    1ae2:	0505                	addi	a0,a0,1
    1ae4:	14070e63          	beqz	a4,1c40 <strncpy+0x176>
    1ae8:	1a060863          	beqz	a2,1c98 <strncpy+0x1ce>
    1aec:	0005c783          	lbu	a5,0(a1)
    1af0:	0585                	addi	a1,a1,1
    1af2:	0075f713          	andi	a4,a1,7
    1af6:	00f50023          	sb	a5,0(a0)
    1afa:	f3fd                	bnez	a5,1ae0 <strncpy+0x16>
    1afc:	4805                	li	a6,1
    1afe:	1a061863          	bnez	a2,1cae <strncpy+0x1e4>
    1b02:	40a007b3          	neg	a5,a0
    1b06:	8b9d                	andi	a5,a5,7
    1b08:	4681                	li	a3,0
    1b0a:	18061a63          	bnez	a2,1c9e <strncpy+0x1d4>
    1b0e:	00778713          	addi	a4,a5,7
    1b12:	45ad                	li	a1,11
    1b14:	18b76363          	bltu	a4,a1,1c9a <strncpy+0x1d0>
    1b18:	1ae6eb63          	bltu	a3,a4,1cce <strncpy+0x204>
    1b1c:	1a078363          	beqz	a5,1cc2 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b20:	00050023          	sb	zero,0(a0)
    1b24:	4685                	li	a3,1
    1b26:	00150713          	addi	a4,a0,1
    1b2a:	18d78f63          	beq	a5,a3,1cc8 <strncpy+0x1fe>
    1b2e:	000500a3          	sb	zero,1(a0)
    1b32:	4689                	li	a3,2
    1b34:	00250713          	addi	a4,a0,2
    1b38:	18d78e63          	beq	a5,a3,1cd4 <strncpy+0x20a>
    1b3c:	00050123          	sb	zero,2(a0)
    1b40:	468d                	li	a3,3
    1b42:	00350713          	addi	a4,a0,3
    1b46:	16d78c63          	beq	a5,a3,1cbe <strncpy+0x1f4>
    1b4a:	000501a3          	sb	zero,3(a0)
    1b4e:	4691                	li	a3,4
    1b50:	00450713          	addi	a4,a0,4
    1b54:	18d78263          	beq	a5,a3,1cd8 <strncpy+0x20e>
    1b58:	00050223          	sb	zero,4(a0)
    1b5c:	4695                	li	a3,5
    1b5e:	00550713          	addi	a4,a0,5
    1b62:	16d78d63          	beq	a5,a3,1cdc <strncpy+0x212>
    1b66:	000502a3          	sb	zero,5(a0)
    1b6a:	469d                	li	a3,7
    1b6c:	00650713          	addi	a4,a0,6
    1b70:	16d79863          	bne	a5,a3,1ce0 <strncpy+0x216>
    1b74:	00750713          	addi	a4,a0,7
    1b78:	00050323          	sb	zero,6(a0)
    1b7c:	40f80833          	sub	a6,a6,a5
    1b80:	ff887593          	andi	a1,a6,-8
    1b84:	97aa                	add	a5,a5,a0
    1b86:	95be                	add	a1,a1,a5
    1b88:	0007b023          	sd	zero,0(a5)
    1b8c:	07a1                	addi	a5,a5,8
    1b8e:	feb79de3          	bne	a5,a1,1b88 <strncpy+0xbe>
    1b92:	ff887593          	andi	a1,a6,-8
    1b96:	9ead                	addw	a3,a3,a1
    1b98:	00b707b3          	add	a5,a4,a1
    1b9c:	12b80863          	beq	a6,a1,1ccc <strncpy+0x202>
    1ba0:	00078023          	sb	zero,0(a5)
    1ba4:	0016871b          	addiw	a4,a3,1
    1ba8:	0ec77863          	bgeu	a4,a2,1c98 <strncpy+0x1ce>
    1bac:	000780a3          	sb	zero,1(a5)
    1bb0:	0026871b          	addiw	a4,a3,2
    1bb4:	0ec77263          	bgeu	a4,a2,1c98 <strncpy+0x1ce>
    1bb8:	00078123          	sb	zero,2(a5)
    1bbc:	0036871b          	addiw	a4,a3,3
    1bc0:	0cc77c63          	bgeu	a4,a2,1c98 <strncpy+0x1ce>
    1bc4:	000781a3          	sb	zero,3(a5)
    1bc8:	0046871b          	addiw	a4,a3,4
    1bcc:	0cc77663          	bgeu	a4,a2,1c98 <strncpy+0x1ce>
    1bd0:	00078223          	sb	zero,4(a5)
    1bd4:	0056871b          	addiw	a4,a3,5
    1bd8:	0cc77063          	bgeu	a4,a2,1c98 <strncpy+0x1ce>
    1bdc:	000782a3          	sb	zero,5(a5)
    1be0:	0066871b          	addiw	a4,a3,6
    1be4:	0ac77a63          	bgeu	a4,a2,1c98 <strncpy+0x1ce>
    1be8:	00078323          	sb	zero,6(a5)
    1bec:	0076871b          	addiw	a4,a3,7
    1bf0:	0ac77463          	bgeu	a4,a2,1c98 <strncpy+0x1ce>
    1bf4:	000783a3          	sb	zero,7(a5)
    1bf8:	0086871b          	addiw	a4,a3,8
    1bfc:	08c77e63          	bgeu	a4,a2,1c98 <strncpy+0x1ce>
    1c00:	00078423          	sb	zero,8(a5)
    1c04:	0096871b          	addiw	a4,a3,9
    1c08:	08c77863          	bgeu	a4,a2,1c98 <strncpy+0x1ce>
    1c0c:	000784a3          	sb	zero,9(a5)
    1c10:	00a6871b          	addiw	a4,a3,10
    1c14:	08c77263          	bgeu	a4,a2,1c98 <strncpy+0x1ce>
    1c18:	00078523          	sb	zero,10(a5)
    1c1c:	00b6871b          	addiw	a4,a3,11
    1c20:	06c77c63          	bgeu	a4,a2,1c98 <strncpy+0x1ce>
    1c24:	000785a3          	sb	zero,11(a5)
    1c28:	00c6871b          	addiw	a4,a3,12
    1c2c:	06c77663          	bgeu	a4,a2,1c98 <strncpy+0x1ce>
    1c30:	00078623          	sb	zero,12(a5)
    1c34:	26b5                	addiw	a3,a3,13
    1c36:	06c6f163          	bgeu	a3,a2,1c98 <strncpy+0x1ce>
    1c3a:	000786a3          	sb	zero,13(a5)
    1c3e:	8082                	ret
            ;
        if (!n || !*s)
    1c40:	c645                	beqz	a2,1ce8 <strncpy+0x21e>
    1c42:	0005c783          	lbu	a5,0(a1)
    1c46:	ea078be3          	beqz	a5,1afc <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1c4a:	479d                	li	a5,7
    1c4c:	02c7ff63          	bgeu	a5,a2,1c8a <strncpy+0x1c0>
    1c50:	00000897          	auipc	a7,0x0
    1c54:	3d88b883          	ld	a7,984(a7) # 2028 <__clone+0xbe>
    1c58:	00000817          	auipc	a6,0x0
    1c5c:	3d883803          	ld	a6,984(a6) # 2030 <__clone+0xc6>
    1c60:	431d                	li	t1,7
    1c62:	6198                	ld	a4,0(a1)
    1c64:	011707b3          	add	a5,a4,a7
    1c68:	fff74693          	not	a3,a4
    1c6c:	8ff5                	and	a5,a5,a3
    1c6e:	0107f7b3          	and	a5,a5,a6
    1c72:	ef81                	bnez	a5,1c8a <strncpy+0x1c0>
            *wd = *ws;
    1c74:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1c76:	1661                	addi	a2,a2,-8
    1c78:	05a1                	addi	a1,a1,8
    1c7a:	0521                	addi	a0,a0,8
    1c7c:	fec363e3          	bltu	t1,a2,1c62 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1c80:	e609                	bnez	a2,1c8a <strncpy+0x1c0>
    1c82:	a08d                	j	1ce4 <strncpy+0x21a>
    1c84:	167d                	addi	a2,a2,-1
    1c86:	0505                	addi	a0,a0,1
    1c88:	ca01                	beqz	a2,1c98 <strncpy+0x1ce>
    1c8a:	0005c783          	lbu	a5,0(a1)
    1c8e:	0585                	addi	a1,a1,1
    1c90:	00f50023          	sb	a5,0(a0)
    1c94:	fbe5                	bnez	a5,1c84 <strncpy+0x1ba>
        ;
tail:
    1c96:	b59d                	j	1afc <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1c98:	8082                	ret
    1c9a:	472d                	li	a4,11
    1c9c:	bdb5                	j	1b18 <strncpy+0x4e>
    1c9e:	00778713          	addi	a4,a5,7
    1ca2:	45ad                	li	a1,11
    1ca4:	fff60693          	addi	a3,a2,-1
    1ca8:	e6b778e3          	bgeu	a4,a1,1b18 <strncpy+0x4e>
    1cac:	b7fd                	j	1c9a <strncpy+0x1d0>
    1cae:	40a007b3          	neg	a5,a0
    1cb2:	8832                	mv	a6,a2
    1cb4:	8b9d                	andi	a5,a5,7
    1cb6:	4681                	li	a3,0
    1cb8:	e4060be3          	beqz	a2,1b0e <strncpy+0x44>
    1cbc:	b7cd                	j	1c9e <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cbe:	468d                	li	a3,3
    1cc0:	bd75                	j	1b7c <strncpy+0xb2>
    1cc2:	872a                	mv	a4,a0
    1cc4:	4681                	li	a3,0
    1cc6:	bd5d                	j	1b7c <strncpy+0xb2>
    1cc8:	4685                	li	a3,1
    1cca:	bd4d                	j	1b7c <strncpy+0xb2>
    1ccc:	8082                	ret
    1cce:	87aa                	mv	a5,a0
    1cd0:	4681                	li	a3,0
    1cd2:	b5f9                	j	1ba0 <strncpy+0xd6>
    1cd4:	4689                	li	a3,2
    1cd6:	b55d                	j	1b7c <strncpy+0xb2>
    1cd8:	4691                	li	a3,4
    1cda:	b54d                	j	1b7c <strncpy+0xb2>
    1cdc:	4695                	li	a3,5
    1cde:	bd79                	j	1b7c <strncpy+0xb2>
    1ce0:	4699                	li	a3,6
    1ce2:	bd69                	j	1b7c <strncpy+0xb2>
    1ce4:	8082                	ret
    1ce6:	8082                	ret
    1ce8:	8082                	ret

0000000000001cea <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1cea:	87aa                	mv	a5,a0
    1cec:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1cee:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1cf2:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1cf6:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1cf8:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cfa:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1cfe:	2501                	sext.w	a0,a0
    1d00:	8082                	ret

0000000000001d02 <openat>:
    register long a7 __asm__("a7") = n;
    1d02:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d06:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d0a:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d0e:	2501                	sext.w	a0,a0
    1d10:	8082                	ret

0000000000001d12 <fcntl>:
    register long a7 __asm__("a7") = n;
    1d12:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d14:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1d18:	2501                	sext.w	a0,a0
    1d1a:	8082                	ret

0000000000001d1c <close>:
    register long a7 __asm__("a7") = n;
    1d1c:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d20:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d24:	2501                	sext.w	a0,a0
    1d26:	8082                	ret

0000000000001d28 <read>:
    register long a7 __asm__("a7") = n;
    1d28:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d2c:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d30:	8082                	ret

0000000000001d32 <write>:
    register long a7 __asm__("a7") = n;
    1d32:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d36:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d3a:	8082                	ret

0000000000001d3c <getpid>:
    register long a7 __asm__("a7") = n;
    1d3c:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d40:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d44:	2501                	sext.w	a0,a0
    1d46:	8082                	ret

0000000000001d48 <getppid>:
    register long a7 __asm__("a7") = n;
    1d48:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d4c:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d50:	2501                	sext.w	a0,a0
    1d52:	8082                	ret

0000000000001d54 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d54:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d58:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d5c:	2501                	sext.w	a0,a0
    1d5e:	8082                	ret

0000000000001d60 <fork>:
    register long a7 __asm__("a7") = n;
    1d60:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d64:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d66:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d68:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d6c:	2501                	sext.w	a0,a0
    1d6e:	8082                	ret

0000000000001d70 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d70:	85b2                	mv	a1,a2
    1d72:	863a                	mv	a2,a4
    if (stack)
    1d74:	c191                	beqz	a1,1d78 <clone+0x8>
	stack += stack_size;
    1d76:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d78:	4781                	li	a5,0
    1d7a:	4701                	li	a4,0
    1d7c:	4681                	li	a3,0
    1d7e:	2601                	sext.w	a2,a2
    1d80:	a2ed                	j	1f6a <__clone>

0000000000001d82 <exit>:
    register long a7 __asm__("a7") = n;
    1d82:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d86:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d8a:	8082                	ret

0000000000001d8c <waitpid>:
    register long a7 __asm__("a7") = n;
    1d8c:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d90:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d92:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d96:	2501                	sext.w	a0,a0
    1d98:	8082                	ret

0000000000001d9a <exec>:
    register long a7 __asm__("a7") = n;
    1d9a:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d9e:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1da2:	2501                	sext.w	a0,a0
    1da4:	8082                	ret

0000000000001da6 <execve>:
    register long a7 __asm__("a7") = n;
    1da6:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1daa:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1dae:	2501                	sext.w	a0,a0
    1db0:	8082                	ret

0000000000001db2 <times>:
    register long a7 __asm__("a7") = n;
    1db2:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1db6:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1dba:	2501                	sext.w	a0,a0
    1dbc:	8082                	ret

0000000000001dbe <get_time>:

int64 get_time()
{
    1dbe:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1dc0:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1dc4:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1dc6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc8:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1dcc:	2501                	sext.w	a0,a0
    1dce:	ed09                	bnez	a0,1de8 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1dd0:	67a2                	ld	a5,8(sp)
    1dd2:	3e800713          	li	a4,1000
    1dd6:	00015503          	lhu	a0,0(sp)
    1dda:	02e7d7b3          	divu	a5,a5,a4
    1dde:	02e50533          	mul	a0,a0,a4
    1de2:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1de4:	0141                	addi	sp,sp,16
    1de6:	8082                	ret
        return -1;
    1de8:	557d                	li	a0,-1
    1dea:	bfed                	j	1de4 <get_time+0x26>

0000000000001dec <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1dec:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1df0:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1df4:	2501                	sext.w	a0,a0
    1df6:	8082                	ret

0000000000001df8 <time>:
    register long a7 __asm__("a7") = n;
    1df8:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1dfc:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e00:	2501                	sext.w	a0,a0
    1e02:	8082                	ret

0000000000001e04 <sleep>:

int sleep(unsigned long long time)
{
    1e04:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e06:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e08:	850a                	mv	a0,sp
    1e0a:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e0c:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e10:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e12:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e16:	e501                	bnez	a0,1e1e <sleep+0x1a>
    return 0;
    1e18:	4501                	li	a0,0
}
    1e1a:	0141                	addi	sp,sp,16
    1e1c:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e1e:	4502                	lw	a0,0(sp)
}
    1e20:	0141                	addi	sp,sp,16
    1e22:	8082                	ret

0000000000001e24 <set_priority>:
    register long a7 __asm__("a7") = n;
    1e24:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e28:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e2c:	2501                	sext.w	a0,a0
    1e2e:	8082                	ret

0000000000001e30 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e30:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e34:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e38:	8082                	ret

0000000000001e3a <munmap>:
    register long a7 __asm__("a7") = n;
    1e3a:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e3e:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e42:	2501                	sext.w	a0,a0
    1e44:	8082                	ret

0000000000001e46 <wait>:

int wait(int *code)
{
    1e46:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e48:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e4c:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e4e:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e50:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e52:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e56:	2501                	sext.w	a0,a0
    1e58:	8082                	ret

0000000000001e5a <spawn>:
    register long a7 __asm__("a7") = n;
    1e5a:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e5e:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e62:	2501                	sext.w	a0,a0
    1e64:	8082                	ret

0000000000001e66 <mailread>:
    register long a7 __asm__("a7") = n;
    1e66:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e6a:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e6e:	2501                	sext.w	a0,a0
    1e70:	8082                	ret

0000000000001e72 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e72:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e76:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e7a:	2501                	sext.w	a0,a0
    1e7c:	8082                	ret

0000000000001e7e <fstat>:
    register long a7 __asm__("a7") = n;
    1e7e:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e82:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e86:	2501                	sext.w	a0,a0
    1e88:	8082                	ret

0000000000001e8a <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e8a:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e8c:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e90:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e92:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e96:	2501                	sext.w	a0,a0
    1e98:	8082                	ret

0000000000001e9a <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e9a:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e9c:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1ea0:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ea2:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1ea6:	2501                	sext.w	a0,a0
    1ea8:	8082                	ret

0000000000001eaa <link>:

int link(char *old_path, char *new_path)
{
    1eaa:	87aa                	mv	a5,a0
    1eac:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1eae:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1eb2:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1eb6:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1eb8:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1ebc:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ebe:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1ec2:	2501                	sext.w	a0,a0
    1ec4:	8082                	ret

0000000000001ec6 <unlink>:

int unlink(char *path)
{
    1ec6:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1ec8:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1ecc:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1ed0:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ed2:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1ed6:	2501                	sext.w	a0,a0
    1ed8:	8082                	ret

0000000000001eda <uname>:
    register long a7 __asm__("a7") = n;
    1eda:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1ede:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1ee2:	2501                	sext.w	a0,a0
    1ee4:	8082                	ret

0000000000001ee6 <brk>:
    register long a7 __asm__("a7") = n;
    1ee6:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1eea:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1eee:	2501                	sext.w	a0,a0
    1ef0:	8082                	ret

0000000000001ef2 <getcwd>:
    register long a7 __asm__("a7") = n;
    1ef2:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ef4:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1ef8:	8082                	ret

0000000000001efa <chdir>:
    register long a7 __asm__("a7") = n;
    1efa:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1efe:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f02:	2501                	sext.w	a0,a0
    1f04:	8082                	ret

0000000000001f06 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f06:	862e                	mv	a2,a1
    1f08:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1f0a:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f0c:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f10:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f14:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f16:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f18:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1f1c:	2501                	sext.w	a0,a0
    1f1e:	8082                	ret

0000000000001f20 <getdents>:
    register long a7 __asm__("a7") = n;
    1f20:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f24:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f28:	2501                	sext.w	a0,a0
    1f2a:	8082                	ret

0000000000001f2c <pipe>:
    register long a7 __asm__("a7") = n;
    1f2c:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f30:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f32:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f36:	2501                	sext.w	a0,a0
    1f38:	8082                	ret

0000000000001f3a <dup>:
    register long a7 __asm__("a7") = n;
    1f3a:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f3c:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f40:	2501                	sext.w	a0,a0
    1f42:	8082                	ret

0000000000001f44 <dup2>:
    register long a7 __asm__("a7") = n;
    1f44:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f46:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f48:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f4c:	2501                	sext.w	a0,a0
    1f4e:	8082                	ret

0000000000001f50 <mount>:
    register long a7 __asm__("a7") = n;
    1f50:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f54:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f58:	2501                	sext.w	a0,a0
    1f5a:	8082                	ret

0000000000001f5c <umount>:
    register long a7 __asm__("a7") = n;
    1f5c:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f60:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f62:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f66:	2501                	sext.w	a0,a0
    1f68:	8082                	ret

0000000000001f6a <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f6a:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1f6c:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f6e:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f70:	8532                	mv	a0,a2
	mv a2, a4
    1f72:	863a                	mv	a2,a4
	mv a3, a5
    1f74:	86be                	mv	a3,a5
	mv a4, a6
    1f76:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f78:	0dc00893          	li	a7,220
	ecall
    1f7c:	00000073          	ecall

	beqz a0, 1f
    1f80:	c111                	beqz	a0,1f84 <__clone+0x1a>
	# Parent
	ret
    1f82:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f84:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f86:	6522                	ld	a0,8(sp)
	jalr a1
    1f88:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f8a:	05d00893          	li	a7,93
	ecall
    1f8e:	00000073          	ecall
