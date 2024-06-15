
/root/oskernel2024-trustos/pre_ctests/build/riscv64/pipe:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	aa1d                	j	1138 <__start_main>

0000000000001004 <test_pipe>:
 * 成功测试时的输出：
 * "  Write to pipe successfully."
 */
static int fd[2];

void test_pipe(void){
    1004:	7135                	add	sp,sp,-160
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f8250513          	add	a0,a0,-126 # 1f88 <__clone+0x2e>
void test_pipe(void){
    100e:	ed06                	sd	ra,152(sp)
    1010:	e922                	sd	s0,144(sp)
    1012:	e526                	sd	s1,136(sp)
    TEST_START(__func__);
    1014:	35c000ef          	jal	1370 <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	00850513          	add	a0,a0,8 # 2020 <__func__.0>
    1020:	350000ef          	jal	1370 <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	f7c50513          	add	a0,a0,-132 # 1fa0 <__clone+0x46>
    102c:	344000ef          	jal	1370 <puts>
    int cpid;
    char buf[128] = {0};
    1030:	08000613          	li	a2,128
    1034:	4581                	li	a1,0
    1036:	850a                	mv	a0,sp
    1038:	6aa000ef          	jal	16e2 <memset>
    int ret = pipe(fd);
    103c:	00001517          	auipc	a0,0x1
    1040:	fdc50513          	add	a0,a0,-36 # 2018 <fd>
    1044:	6d9000ef          	jal	1f1c <pipe>
    assert(ret != -1);
    1048:	57fd                	li	a5,-1
    104a:	0cf50863          	beq	a0,a5,111a <test_pipe+0x116>
    const char *data = "  Write to pipe successfully.\n";
    cpid = fork();
    104e:	503000ef          	jal	1d50 <fork>
    printf("cpid: %d\n", cpid);
    1052:	85aa                	mv	a1,a0
    cpid = fork();
    1054:	84aa                	mv	s1,a0
    printf("cpid: %d\n", cpid);
    1056:	00001517          	auipc	a0,0x1
    105a:	f7a50513          	add	a0,a0,-134 # 1fd0 <__clone+0x76>
    105e:	334000ef          	jal	1392 <printf>
    if(cpid == 0){
    1062:	00001417          	auipc	s0,0x1
    1066:	fb640413          	add	s0,s0,-74 # 2018 <fd>
    106a:	c8b5                	beqz	s1,10de <test_pipe+0xda>
            write(STDOUT, buf, 1);
        write(STDOUT, "\n", 1);
        close(fd[0]);
        wait(NULL);
    }
    if(fork()==0){
    106c:	4e5000ef          	jal	1d50 <fork>
    1070:	e125                	bnez	a0,10d0 <test_pipe+0xcc>
        close(fd[0]);
    1072:	4008                	lw	a0,0(s0)
    1074:	499000ef          	jal	1d0c <close>
        write(fd[1], data, strlen(data));
    1078:	4044                	lw	s1,4(s0)
    107a:	00001517          	auipc	a0,0x1
    107e:	f6650513          	add	a0,a0,-154 # 1fe0 <__clone+0x86>
    1082:	063000ef          	jal	18e4 <strlen>
    1086:	862a                	mv	a2,a0
    1088:	00001597          	auipc	a1,0x1
    108c:	f5858593          	add	a1,a1,-168 # 1fe0 <__clone+0x86>
    1090:	8526                	mv	a0,s1
    1092:	491000ef          	jal	1d22 <write>
        close(fd[1]);
    1096:	4048                	lw	a0,4(s0)
    1098:	475000ef          	jal	1d0c <close>
        exit(0);
    109c:	4501                	li	a0,0
    109e:	4d5000ef          	jal	1d72 <exit>
    }else{
        close(fd[0]);
        close(fd[1]);
    }
    TEST_END(__func__);
    10a2:	00001517          	auipc	a0,0x1
    10a6:	f5e50513          	add	a0,a0,-162 # 2000 <__clone+0xa6>
    10aa:	2c6000ef          	jal	1370 <puts>
    10ae:	00001517          	auipc	a0,0x1
    10b2:	f7250513          	add	a0,a0,-142 # 2020 <__func__.0>
    10b6:	2ba000ef          	jal	1370 <puts>
    10ba:	00001517          	auipc	a0,0x1
    10be:	ee650513          	add	a0,a0,-282 # 1fa0 <__clone+0x46>
    10c2:	2ae000ef          	jal	1370 <puts>
}
    10c6:	60ea                	ld	ra,152(sp)
    10c8:	644a                	ld	s0,144(sp)
    10ca:	64aa                	ld	s1,136(sp)
    10cc:	610d                	add	sp,sp,160
    10ce:	8082                	ret
        close(fd[0]);
    10d0:	4008                	lw	a0,0(s0)
    10d2:	43b000ef          	jal	1d0c <close>
        close(fd[1]);
    10d6:	4048                	lw	a0,4(s0)
    10d8:	435000ef          	jal	1d0c <close>
    10dc:	b7d9                	j	10a2 <test_pipe+0x9e>
        close(fd[1]);
    10de:	4048                	lw	a0,4(s0)
    10e0:	42d000ef          	jal	1d0c <close>
        while(read(fd[0], buf, 1) > 0)
    10e4:	a019                	j	10ea <test_pipe+0xe6>
            write(STDOUT, buf, 1);
    10e6:	43d000ef          	jal	1d22 <write>
        while(read(fd[0], buf, 1) > 0)
    10ea:	4008                	lw	a0,0(s0)
    10ec:	4605                	li	a2,1
    10ee:	858a                	mv	a1,sp
    10f0:	429000ef          	jal	1d18 <read>
    10f4:	87aa                	mv	a5,a0
            write(STDOUT, buf, 1);
    10f6:	4605                	li	a2,1
    10f8:	858a                	mv	a1,sp
    10fa:	4505                	li	a0,1
        while(read(fd[0], buf, 1) > 0)
    10fc:	fef045e3          	bgtz	a5,10e6 <test_pipe+0xe2>
        write(STDOUT, "\n", 1);
    1100:	00001597          	auipc	a1,0x1
    1104:	ec858593          	add	a1,a1,-312 # 1fc8 <__clone+0x6e>
    1108:	41b000ef          	jal	1d22 <write>
        close(fd[0]);
    110c:	4008                	lw	a0,0(s0)
    110e:	3ff000ef          	jal	1d0c <close>
        wait(NULL);
    1112:	4501                	li	a0,0
    1114:	523000ef          	jal	1e36 <wait>
    1118:	bf91                	j	106c <test_pipe+0x68>
    assert(ret != -1);
    111a:	00001517          	auipc	a0,0x1
    111e:	e9650513          	add	a0,a0,-362 # 1fb0 <__clone+0x56>
    1122:	4ee000ef          	jal	1610 <panic>
    1126:	b725                	j	104e <test_pipe+0x4a>

0000000000001128 <main>:

int main(void){
    1128:	1141                	add	sp,sp,-16
    112a:	e406                	sd	ra,8(sp)
    test_pipe();
    112c:	ed9ff0ef          	jal	1004 <test_pipe>
    return 0;
}
    1130:	60a2                	ld	ra,8(sp)
    1132:	4501                	li	a0,0
    1134:	0141                	add	sp,sp,16
    1136:	8082                	ret

0000000000001138 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1138:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    113a:	4108                	lw	a0,0(a0)
{
    113c:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    113e:	05a1                	add	a1,a1,8
{
    1140:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1142:	fe7ff0ef          	jal	1128 <main>
    1146:	42d000ef          	jal	1d72 <exit>
	return 0;
}
    114a:	60a2                	ld	ra,8(sp)
    114c:	4501                	li	a0,0
    114e:	0141                	add	sp,sp,16
    1150:	8082                	ret

0000000000001152 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1152:	7179                	add	sp,sp,-48
    1154:	f406                	sd	ra,40(sp)
    1156:	0005081b          	sext.w	a6,a0
    115a:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    115c:	00055563          	bgez	a0,1166 <printint.constprop.0+0x14>
        x = -xx;
    1160:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    1164:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1166:	02b8763b          	remuw	a2,a6,a1
    116a:	00001697          	auipc	a3,0x1
    116e:	ec668693          	add	a3,a3,-314 # 2030 <digits>
    buf[16] = 0;
    1172:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1176:	0005871b          	sext.w	a4,a1
    117a:	1602                	sll	a2,a2,0x20
    117c:	9201                	srl	a2,a2,0x20
    117e:	9636                	add	a2,a2,a3
    1180:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1184:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    1188:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    118c:	10b86c63          	bltu	a6,a1,12a4 <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    1190:	02e5763b          	remuw	a2,a0,a4
    1194:	1602                	sll	a2,a2,0x20
    1196:	9201                	srl	a2,a2,0x20
    1198:	9636                	add	a2,a2,a3
    119a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    119e:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11a2:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    11a6:	10e56863          	bltu	a0,a4,12b6 <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    11aa:	02e5f63b          	remuw	a2,a1,a4
    11ae:	1602                	sll	a2,a2,0x20
    11b0:	9201                	srl	a2,a2,0x20
    11b2:	9636                	add	a2,a2,a3
    11b4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b8:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11bc:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    11c0:	10e5e463          	bltu	a1,a4,12c8 <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    11c4:	02e5763b          	remuw	a2,a0,a4
    11c8:	1602                	sll	a2,a2,0x20
    11ca:	9201                	srl	a2,a2,0x20
    11cc:	9636                	add	a2,a2,a3
    11ce:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11d2:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11d6:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    11da:	10e56063          	bltu	a0,a4,12da <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    11de:	02e5f63b          	remuw	a2,a1,a4
    11e2:	1602                	sll	a2,a2,0x20
    11e4:	9201                	srl	a2,a2,0x20
    11e6:	9636                	add	a2,a2,a3
    11e8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ec:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11f0:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    11f4:	0ee5ec63          	bltu	a1,a4,12ec <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11f8:	02e5763b          	remuw	a2,a0,a4
    11fc:	1602                	sll	a2,a2,0x20
    11fe:	9201                	srl	a2,a2,0x20
    1200:	9636                	add	a2,a2,a3
    1202:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1206:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    120a:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    120e:	08e56263          	bltu	a0,a4,1292 <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    1212:	02e5f63b          	remuw	a2,a1,a4
    1216:	1602                	sll	a2,a2,0x20
    1218:	9201                	srl	a2,a2,0x20
    121a:	9636                	add	a2,a2,a3
    121c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1220:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1224:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1228:	0ce5eb63          	bltu	a1,a4,12fe <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    122c:	02e5763b          	remuw	a2,a0,a4
    1230:	1602                	sll	a2,a2,0x20
    1232:	9201                	srl	a2,a2,0x20
    1234:	9636                	add	a2,a2,a3
    1236:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    123a:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    123e:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1242:	0ce56763          	bltu	a0,a4,1310 <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    1246:	02e5f63b          	remuw	a2,a1,a4
    124a:	1602                	sll	a2,a2,0x20
    124c:	9201                	srl	a2,a2,0x20
    124e:	9636                	add	a2,a2,a3
    1250:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1254:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1258:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    125c:	0ce5e363          	bltu	a1,a4,1322 <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    1260:	1782                	sll	a5,a5,0x20
    1262:	9381                	srl	a5,a5,0x20
    1264:	96be                	add	a3,a3,a5
    1266:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    126a:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    126c:	00f10723          	sb	a5,14(sp)
    if (sign)
    1270:	00088763          	beqz	a7,127e <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1274:	02d00793          	li	a5,45
    1278:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    127c:	4595                	li	a1,5
    write(f, s, l);
    127e:	003c                	add	a5,sp,8
    1280:	4641                	li	a2,16
    1282:	9e0d                	subw	a2,a2,a1
    1284:	4505                	li	a0,1
    1286:	95be                	add	a1,a1,a5
    1288:	29b000ef          	jal	1d22 <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    128c:	70a2                	ld	ra,40(sp)
    128e:	6145                	add	sp,sp,48
    1290:	8082                	ret
    i++;
    1292:	45a9                	li	a1,10
    if (sign)
    1294:	fe0885e3          	beqz	a7,127e <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1298:	02d00793          	li	a5,45
    129c:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    12a0:	45a5                	li	a1,9
    12a2:	bff1                	j	127e <printint.constprop.0+0x12c>
    i++;
    12a4:	45bd                	li	a1,15
    if (sign)
    12a6:	fc088ce3          	beqz	a7,127e <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12aa:	02d00793          	li	a5,45
    12ae:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12b2:	45b9                	li	a1,14
    12b4:	b7e9                	j	127e <printint.constprop.0+0x12c>
    i++;
    12b6:	45b9                	li	a1,14
    if (sign)
    12b8:	fc0883e3          	beqz	a7,127e <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12bc:	02d00793          	li	a5,45
    12c0:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    12c4:	45b5                	li	a1,13
    12c6:	bf65                	j	127e <printint.constprop.0+0x12c>
    i++;
    12c8:	45b5                	li	a1,13
    if (sign)
    12ca:	fa088ae3          	beqz	a7,127e <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12ce:	02d00793          	li	a5,45
    12d2:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    12d6:	45b1                	li	a1,12
    12d8:	b75d                	j	127e <printint.constprop.0+0x12c>
    i++;
    12da:	45b1                	li	a1,12
    if (sign)
    12dc:	fa0881e3          	beqz	a7,127e <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12e0:	02d00793          	li	a5,45
    12e4:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12e8:	45ad                	li	a1,11
    12ea:	bf51                	j	127e <printint.constprop.0+0x12c>
    i++;
    12ec:	45ad                	li	a1,11
    if (sign)
    12ee:	f80888e3          	beqz	a7,127e <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12f2:	02d00793          	li	a5,45
    12f6:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12fa:	45a9                	li	a1,10
    12fc:	b749                	j	127e <printint.constprop.0+0x12c>
    i++;
    12fe:	45a5                	li	a1,9
    if (sign)
    1300:	f6088fe3          	beqz	a7,127e <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1304:	02d00793          	li	a5,45
    1308:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    130c:	45a1                	li	a1,8
    130e:	bf85                	j	127e <printint.constprop.0+0x12c>
    i++;
    1310:	45a1                	li	a1,8
    if (sign)
    1312:	f60886e3          	beqz	a7,127e <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1316:	02d00793          	li	a5,45
    131a:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    131e:	459d                	li	a1,7
    1320:	bfb9                	j	127e <printint.constprop.0+0x12c>
    i++;
    1322:	459d                	li	a1,7
    if (sign)
    1324:	f4088de3          	beqz	a7,127e <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1328:	02d00793          	li	a5,45
    132c:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1330:	4599                	li	a1,6
    1332:	b7b1                	j	127e <printint.constprop.0+0x12c>

0000000000001334 <getchar>:
{
    1334:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    1336:	00f10593          	add	a1,sp,15
    133a:	4605                	li	a2,1
    133c:	4501                	li	a0,0
{
    133e:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1340:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1344:	1d5000ef          	jal	1d18 <read>
}
    1348:	60e2                	ld	ra,24(sp)
    134a:	00f14503          	lbu	a0,15(sp)
    134e:	6105                	add	sp,sp,32
    1350:	8082                	ret

0000000000001352 <putchar>:
{
    1352:	1101                	add	sp,sp,-32
    1354:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1356:	00f10593          	add	a1,sp,15
    135a:	4605                	li	a2,1
    135c:	4505                	li	a0,1
{
    135e:	ec06                	sd	ra,24(sp)
    char byte = c;
    1360:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1364:	1bf000ef          	jal	1d22 <write>
}
    1368:	60e2                	ld	ra,24(sp)
    136a:	2501                	sext.w	a0,a0
    136c:	6105                	add	sp,sp,32
    136e:	8082                	ret

0000000000001370 <puts>:
{
    1370:	1141                	add	sp,sp,-16
    1372:	e406                	sd	ra,8(sp)
    1374:	e022                	sd	s0,0(sp)
    1376:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1378:	56c000ef          	jal	18e4 <strlen>
    137c:	862a                	mv	a2,a0
    137e:	85a2                	mv	a1,s0
    1380:	4505                	li	a0,1
    1382:	1a1000ef          	jal	1d22 <write>
}
    1386:	60a2                	ld	ra,8(sp)
    1388:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    138a:	957d                	sra	a0,a0,0x3f
    return r;
    138c:	2501                	sext.w	a0,a0
}
    138e:	0141                	add	sp,sp,16
    1390:	8082                	ret

0000000000001392 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1392:	7131                	add	sp,sp,-192
    1394:	e4d6                	sd	s5,72(sp)
    1396:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    1398:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    139a:	013c                	add	a5,sp,136
{
    139c:	f0ca                	sd	s2,96(sp)
    139e:	ecce                	sd	s3,88(sp)
    13a0:	e8d2                	sd	s4,80(sp)
    13a2:	e0da                	sd	s6,64(sp)
    13a4:	fc5e                	sd	s7,56(sp)
    13a6:	fc86                	sd	ra,120(sp)
    13a8:	f8a2                	sd	s0,112(sp)
    13aa:	f4a6                	sd	s1,104(sp)
    13ac:	e52e                	sd	a1,136(sp)
    13ae:	e932                	sd	a2,144(sp)
    13b0:	ed36                	sd	a3,152(sp)
    13b2:	f13a                	sd	a4,160(sp)
    13b4:	f942                	sd	a6,176(sp)
    13b6:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    13b8:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    13ba:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    13be:	07300a13          	li	s4,115
    13c2:	07800b93          	li	s7,120
    13c6:	06400b13          	li	s6,100
    buf[i++] = '0';
    13ca:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x5800>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13ce:	00001997          	auipc	s3,0x1
    13d2:	c6298993          	add	s3,s3,-926 # 2030 <digits>
        if (!*s)
    13d6:	00054783          	lbu	a5,0(a0)
    13da:	16078863          	beqz	a5,154a <printf+0x1b8>
    13de:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13e0:	19278063          	beq	a5,s2,1560 <printf+0x1ce>
    13e4:	00164783          	lbu	a5,1(a2)
    13e8:	0605                	add	a2,a2,1
    13ea:	fbfd                	bnez	a5,13e0 <printf+0x4e>
    13ec:	84b2                	mv	s1,a2
        l = z - a;
    13ee:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13f2:	85aa                	mv	a1,a0
    13f4:	8622                	mv	a2,s0
    13f6:	4505                	li	a0,1
    13f8:	12b000ef          	jal	1d22 <write>
        if (l)
    13fc:	18041763          	bnez	s0,158a <printf+0x1f8>
        if (s[1] == 0)
    1400:	0014c783          	lbu	a5,1(s1)
    1404:	14078363          	beqz	a5,154a <printf+0x1b8>
        switch (s[1])
    1408:	19478f63          	beq	a5,s4,15a6 <printf+0x214>
    140c:	18fa6163          	bltu	s4,a5,158e <printf+0x1fc>
    1410:	1b678e63          	beq	a5,s6,15cc <printf+0x23a>
    1414:	07000713          	li	a4,112
    1418:	1ce79463          	bne	a5,a4,15e0 <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    141c:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    141e:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1422:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1424:	631c                	ld	a5,0(a4)
    1426:	0721                	add	a4,a4,8
    1428:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    142a:	00479293          	sll	t0,a5,0x4
    142e:	00879f93          	sll	t6,a5,0x8
    1432:	00c79f13          	sll	t5,a5,0xc
    1436:	01079e93          	sll	t4,a5,0x10
    143a:	01479e13          	sll	t3,a5,0x14
    143e:	01879313          	sll	t1,a5,0x18
    1442:	01c79893          	sll	a7,a5,0x1c
    1446:	02479813          	sll	a6,a5,0x24
    144a:	02879513          	sll	a0,a5,0x28
    144e:	02c79593          	sll	a1,a5,0x2c
    1452:	03079693          	sll	a3,a5,0x30
    1456:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    145a:	03c7d413          	srl	s0,a5,0x3c
    145e:	01c7d39b          	srlw	t2,a5,0x1c
    1462:	03c2d293          	srl	t0,t0,0x3c
    1466:	03cfdf93          	srl	t6,t6,0x3c
    146a:	03cf5f13          	srl	t5,t5,0x3c
    146e:	03cede93          	srl	t4,t4,0x3c
    1472:	03ce5e13          	srl	t3,t3,0x3c
    1476:	03c35313          	srl	t1,t1,0x3c
    147a:	03c8d893          	srl	a7,a7,0x3c
    147e:	03c85813          	srl	a6,a6,0x3c
    1482:	9171                	srl	a0,a0,0x3c
    1484:	91f1                	srl	a1,a1,0x3c
    1486:	92f1                	srl	a3,a3,0x3c
    1488:	9371                	srl	a4,a4,0x3c
    148a:	974e                	add	a4,a4,s3
    148c:	944e                	add	s0,s0,s3
    148e:	92ce                	add	t0,t0,s3
    1490:	9fce                	add	t6,t6,s3
    1492:	9f4e                	add	t5,t5,s3
    1494:	9ece                	add	t4,t4,s3
    1496:	9e4e                	add	t3,t3,s3
    1498:	934e                	add	t1,t1,s3
    149a:	98ce                	add	a7,a7,s3
    149c:	93ce                	add	t2,t2,s3
    149e:	984e                	add	a6,a6,s3
    14a0:	954e                	add	a0,a0,s3
    14a2:	95ce                	add	a1,a1,s3
    14a4:	96ce                	add	a3,a3,s3
    14a6:	00074083          	lbu	ra,0(a4)
    14aa:	0002c283          	lbu	t0,0(t0)
    14ae:	000fcf83          	lbu	t6,0(t6)
    14b2:	000f4f03          	lbu	t5,0(t5)
    14b6:	000ece83          	lbu	t4,0(t4)
    14ba:	000e4e03          	lbu	t3,0(t3)
    14be:	00034303          	lbu	t1,0(t1)
    14c2:	0008c883          	lbu	a7,0(a7)
    14c6:	0003c383          	lbu	t2,0(t2)
    14ca:	00084803          	lbu	a6,0(a6)
    14ce:	00054503          	lbu	a0,0(a0)
    14d2:	0005c583          	lbu	a1,0(a1)
    14d6:	0006c683          	lbu	a3,0(a3)
    14da:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14de:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14e2:	9371                	srl	a4,a4,0x3c
    14e4:	8bbd                	and	a5,a5,15
    14e6:	974e                	add	a4,a4,s3
    14e8:	97ce                	add	a5,a5,s3
    14ea:	005105a3          	sb	t0,11(sp)
    14ee:	01f10623          	sb	t6,12(sp)
    14f2:	01e106a3          	sb	t5,13(sp)
    14f6:	01d10723          	sb	t4,14(sp)
    14fa:	01c107a3          	sb	t3,15(sp)
    14fe:	00610823          	sb	t1,16(sp)
    1502:	011108a3          	sb	a7,17(sp)
    1506:	00710923          	sb	t2,18(sp)
    150a:	010109a3          	sb	a6,19(sp)
    150e:	00a10a23          	sb	a0,20(sp)
    1512:	00b10aa3          	sb	a1,21(sp)
    1516:	00d10b23          	sb	a3,22(sp)
    151a:	00110ba3          	sb	ra,23(sp)
    151e:	00810523          	sb	s0,10(sp)
    1522:	00074703          	lbu	a4,0(a4)
    1526:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    152a:	002c                	add	a1,sp,8
    152c:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    152e:	00e10c23          	sb	a4,24(sp)
    1532:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1536:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    153a:	7e8000ef          	jal	1d22 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    153e:	00248513          	add	a0,s1,2
        if (!*s)
    1542:	00054783          	lbu	a5,0(a0)
    1546:	e8079ce3          	bnez	a5,13de <printf+0x4c>
    }
    va_end(ap);
}
    154a:	70e6                	ld	ra,120(sp)
    154c:	7446                	ld	s0,112(sp)
    154e:	74a6                	ld	s1,104(sp)
    1550:	7906                	ld	s2,96(sp)
    1552:	69e6                	ld	s3,88(sp)
    1554:	6a46                	ld	s4,80(sp)
    1556:	6aa6                	ld	s5,72(sp)
    1558:	6b06                	ld	s6,64(sp)
    155a:	7be2                	ld	s7,56(sp)
    155c:	6129                	add	sp,sp,192
    155e:	8082                	ret
    1560:	84b2                	mv	s1,a2
    1562:	a039                	j	1570 <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1564:	0024c783          	lbu	a5,2(s1)
    1568:	0605                	add	a2,a2,1
    156a:	0489                	add	s1,s1,2
    156c:	e92791e3          	bne	a5,s2,13ee <printf+0x5c>
    1570:	0014c783          	lbu	a5,1(s1)
    1574:	ff2788e3          	beq	a5,s2,1564 <printf+0x1d2>
        l = z - a;
    1578:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    157c:	85aa                	mv	a1,a0
    157e:	8622                	mv	a2,s0
    1580:	4505                	li	a0,1
    1582:	7a0000ef          	jal	1d22 <write>
        if (l)
    1586:	e6040de3          	beqz	s0,1400 <printf+0x6e>
    158a:	8526                	mv	a0,s1
    158c:	b5a9                	j	13d6 <printf+0x44>
        switch (s[1])
    158e:	05779963          	bne	a5,s7,15e0 <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    1592:	6782                	ld	a5,0(sp)
    1594:	45c1                	li	a1,16
    1596:	4388                	lw	a0,0(a5)
    1598:	07a1                	add	a5,a5,8
    159a:	e03e                	sd	a5,0(sp)
    159c:	bb7ff0ef          	jal	1152 <printint.constprop.0>
        s += 2;
    15a0:	00248513          	add	a0,s1,2
    15a4:	bf79                	j	1542 <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    15a6:	6782                	ld	a5,0(sp)
    15a8:	6380                	ld	s0,0(a5)
    15aa:	07a1                	add	a5,a5,8
    15ac:	e03e                	sd	a5,0(sp)
    15ae:	cc21                	beqz	s0,1606 <printf+0x274>
            l = strnlen(a, 200);
    15b0:	0c800593          	li	a1,200
    15b4:	8522                	mv	a0,s0
    15b6:	460000ef          	jal	1a16 <strnlen>
    write(f, s, l);
    15ba:	0005061b          	sext.w	a2,a0
    15be:	85a2                	mv	a1,s0
    15c0:	4505                	li	a0,1
    15c2:	760000ef          	jal	1d22 <write>
        s += 2;
    15c6:	00248513          	add	a0,s1,2
    15ca:	bfa5                	j	1542 <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    15cc:	6782                	ld	a5,0(sp)
    15ce:	45a9                	li	a1,10
    15d0:	4388                	lw	a0,0(a5)
    15d2:	07a1                	add	a5,a5,8
    15d4:	e03e                	sd	a5,0(sp)
    15d6:	b7dff0ef          	jal	1152 <printint.constprop.0>
        s += 2;
    15da:	00248513          	add	a0,s1,2
    15de:	b795                	j	1542 <printf+0x1b0>
    return write(stdout, &byte, 1);
    15e0:	4605                	li	a2,1
    15e2:	002c                	add	a1,sp,8
    15e4:	4505                	li	a0,1
    char byte = c;
    15e6:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15ea:	738000ef          	jal	1d22 <write>
    char byte = c;
    15ee:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15f2:	4605                	li	a2,1
    15f4:	002c                	add	a1,sp,8
    15f6:	4505                	li	a0,1
    char byte = c;
    15f8:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15fc:	726000ef          	jal	1d22 <write>
        s += 2;
    1600:	00248513          	add	a0,s1,2
    1604:	bf3d                	j	1542 <printf+0x1b0>
                a = "(null)";
    1606:	00001417          	auipc	s0,0x1
    160a:	a0a40413          	add	s0,s0,-1526 # 2010 <__clone+0xb6>
    160e:	b74d                	j	15b0 <printf+0x21e>

0000000000001610 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1610:	1141                	add	sp,sp,-16
    1612:	e406                	sd	ra,8(sp)
    puts(m);
    1614:	d5dff0ef          	jal	1370 <puts>
    exit(-100);
}
    1618:	60a2                	ld	ra,8(sp)
    exit(-100);
    161a:	f9c00513          	li	a0,-100
}
    161e:	0141                	add	sp,sp,16
    exit(-100);
    1620:	af89                	j	1d72 <exit>

0000000000001622 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1622:	02000793          	li	a5,32
    1626:	00f50663          	beq	a0,a5,1632 <isspace+0x10>
    162a:	355d                	addw	a0,a0,-9
    162c:	00553513          	sltiu	a0,a0,5
    1630:	8082                	ret
    1632:	4505                	li	a0,1
}
    1634:	8082                	ret

0000000000001636 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1636:	fd05051b          	addw	a0,a0,-48
}
    163a:	00a53513          	sltiu	a0,a0,10
    163e:	8082                	ret

0000000000001640 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1640:	02000713          	li	a4,32
    1644:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1646:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    164a:	ff76879b          	addw	a5,a3,-9
    164e:	06e68063          	beq	a3,a4,16ae <atoi+0x6e>
    1652:	0006859b          	sext.w	a1,a3
    1656:	04f67c63          	bgeu	a2,a5,16ae <atoi+0x6e>
        s++;
    switch (*s)
    165a:	02b00793          	li	a5,43
    165e:	06f68563          	beq	a3,a5,16c8 <atoi+0x88>
    1662:	02d00793          	li	a5,45
    1666:	04f69663          	bne	a3,a5,16b2 <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    166a:	00154683          	lbu	a3,1(a0)
    166e:	47a5                	li	a5,9
        s++;
    1670:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1674:	fd06869b          	addw	a3,a3,-48
    1678:	8636                	mv	a2,a3
    while (isdigit(*s))
    167a:	04d7e563          	bltu	a5,a3,16c4 <atoi+0x84>
        neg = 1;
    167e:	4885                	li	a7,1
    int n = 0, neg = 0;
    1680:	4501                	li	a0,0
    while (isdigit(*s))
    1682:	4825                	li	a6,9
    1684:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1688:	0025179b          	sllw	a5,a0,0x2
    168c:	9fa9                	addw	a5,a5,a0
    168e:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    1692:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    1696:	85b2                	mv	a1,a2
    1698:	40c7853b          	subw	a0,a5,a2
    169c:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    169e:	8636                	mv	a2,a3
    while (isdigit(*s))
    16a0:	fed872e3          	bgeu	a6,a3,1684 <atoi+0x44>
    return neg ? n : -n;
    16a4:	02089163          	bnez	a7,16c6 <atoi+0x86>
    16a8:	40f5853b          	subw	a0,a1,a5
    16ac:	8082                	ret
        s++;
    16ae:	0505                	add	a0,a0,1
    16b0:	bf59                	j	1646 <atoi+0x6>
    while (isdigit(*s))
    16b2:	fd05859b          	addw	a1,a1,-48
    16b6:	47a5                	li	a5,9
    16b8:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    16ba:	4881                	li	a7,0
    16bc:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    16c0:	fcb7f0e3          	bgeu	a5,a1,1680 <atoi+0x40>
    return neg ? n : -n;
    16c4:	4501                	li	a0,0
}
    16c6:	8082                	ret
    while (isdigit(*s))
    16c8:	00154683          	lbu	a3,1(a0)
    16cc:	47a5                	li	a5,9
        s++;
    16ce:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    16d2:	fd06869b          	addw	a3,a3,-48
    16d6:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    16d8:	4881                	li	a7,0
    while (isdigit(*s))
    16da:	fad7f3e3          	bgeu	a5,a3,1680 <atoi+0x40>
    return neg ? n : -n;
    16de:	4501                	li	a0,0
    16e0:	8082                	ret

00000000000016e2 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16e2:	16060f63          	beqz	a2,1860 <memset+0x17e>
    16e6:	40a006b3          	neg	a3,a0
    16ea:	0076f793          	and	a5,a3,7
    16ee:	00778813          	add	a6,a5,7
    16f2:	48ad                	li	a7,11
    16f4:	0ff5f713          	zext.b	a4,a1
    16f8:	fff60593          	add	a1,a2,-1
    16fc:	17186363          	bltu	a6,a7,1862 <memset+0x180>
    1700:	1705eb63          	bltu	a1,a6,1876 <memset+0x194>
    1704:	16078163          	beqz	a5,1866 <memset+0x184>
    1708:	00e50023          	sb	a4,0(a0)
    170c:	0066f593          	and	a1,a3,6
    1710:	14058e63          	beqz	a1,186c <memset+0x18a>
    1714:	00e500a3          	sb	a4,1(a0)
    1718:	4589                	li	a1,2
    171a:	00250813          	add	a6,a0,2
    171e:	04f5f663          	bgeu	a1,a5,176a <memset+0x88>
    1722:	00e50123          	sb	a4,2(a0)
    1726:	8a91                	and	a3,a3,4
    1728:	00350813          	add	a6,a0,3
    172c:	458d                	li	a1,3
    172e:	ce95                	beqz	a3,176a <memset+0x88>
    1730:	00e501a3          	sb	a4,3(a0)
    1734:	4691                	li	a3,4
    1736:	00450813          	add	a6,a0,4
    173a:	4591                	li	a1,4
    173c:	02f6f763          	bgeu	a3,a5,176a <memset+0x88>
    1740:	00e50223          	sb	a4,4(a0)
    1744:	4695                	li	a3,5
    1746:	00550813          	add	a6,a0,5
    174a:	4595                	li	a1,5
    174c:	00d78f63          	beq	a5,a3,176a <memset+0x88>
    1750:	00e502a3          	sb	a4,5(a0)
    1754:	469d                	li	a3,7
    1756:	00650813          	add	a6,a0,6
    175a:	4599                	li	a1,6
    175c:	00d79763          	bne	a5,a3,176a <memset+0x88>
    1760:	00750813          	add	a6,a0,7
    1764:	00e50323          	sb	a4,6(a0)
    1768:	459d                	li	a1,7
    176a:	00871693          	sll	a3,a4,0x8
    176e:	01071313          	sll	t1,a4,0x10
    1772:	8ed9                	or	a3,a3,a4
    1774:	01871893          	sll	a7,a4,0x18
    1778:	0066e6b3          	or	a3,a3,t1
    177c:	0116e6b3          	or	a3,a3,a7
    1780:	02071313          	sll	t1,a4,0x20
    1784:	02871893          	sll	a7,a4,0x28
    1788:	0066e6b3          	or	a3,a3,t1
    178c:	40f60e33          	sub	t3,a2,a5
    1790:	03071313          	sll	t1,a4,0x30
    1794:	0116e6b3          	or	a3,a3,a7
    1798:	0066e6b3          	or	a3,a3,t1
    179c:	03871893          	sll	a7,a4,0x38
    17a0:	97aa                	add	a5,a5,a0
    17a2:	ff8e7313          	and	t1,t3,-8
    17a6:	0116e6b3          	or	a3,a3,a7
    17aa:	00f308b3          	add	a7,t1,a5
    17ae:	e394                	sd	a3,0(a5)
    17b0:	07a1                	add	a5,a5,8
    17b2:	ff179ee3          	bne	a5,a7,17ae <memset+0xcc>
    17b6:	006806b3          	add	a3,a6,t1
    17ba:	00b307bb          	addw	a5,t1,a1
    17be:	0bc30b63          	beq	t1,t3,1874 <memset+0x192>
    17c2:	00e68023          	sb	a4,0(a3)
    17c6:	0017859b          	addw	a1,a5,1
    17ca:	08c5fb63          	bgeu	a1,a2,1860 <memset+0x17e>
    17ce:	00e680a3          	sb	a4,1(a3)
    17d2:	0027859b          	addw	a1,a5,2
    17d6:	08c5f563          	bgeu	a1,a2,1860 <memset+0x17e>
    17da:	00e68123          	sb	a4,2(a3)
    17de:	0037859b          	addw	a1,a5,3
    17e2:	06c5ff63          	bgeu	a1,a2,1860 <memset+0x17e>
    17e6:	00e681a3          	sb	a4,3(a3)
    17ea:	0047859b          	addw	a1,a5,4
    17ee:	06c5f963          	bgeu	a1,a2,1860 <memset+0x17e>
    17f2:	00e68223          	sb	a4,4(a3)
    17f6:	0057859b          	addw	a1,a5,5
    17fa:	06c5f363          	bgeu	a1,a2,1860 <memset+0x17e>
    17fe:	00e682a3          	sb	a4,5(a3)
    1802:	0067859b          	addw	a1,a5,6
    1806:	04c5fd63          	bgeu	a1,a2,1860 <memset+0x17e>
    180a:	00e68323          	sb	a4,6(a3)
    180e:	0077859b          	addw	a1,a5,7
    1812:	04c5f763          	bgeu	a1,a2,1860 <memset+0x17e>
    1816:	00e683a3          	sb	a4,7(a3)
    181a:	0087859b          	addw	a1,a5,8
    181e:	04c5f163          	bgeu	a1,a2,1860 <memset+0x17e>
    1822:	00e68423          	sb	a4,8(a3)
    1826:	0097859b          	addw	a1,a5,9
    182a:	02c5fb63          	bgeu	a1,a2,1860 <memset+0x17e>
    182e:	00e684a3          	sb	a4,9(a3)
    1832:	00a7859b          	addw	a1,a5,10
    1836:	02c5f563          	bgeu	a1,a2,1860 <memset+0x17e>
    183a:	00e68523          	sb	a4,10(a3)
    183e:	00b7859b          	addw	a1,a5,11
    1842:	00c5ff63          	bgeu	a1,a2,1860 <memset+0x17e>
    1846:	00e685a3          	sb	a4,11(a3)
    184a:	00c7859b          	addw	a1,a5,12
    184e:	00c5f963          	bgeu	a1,a2,1860 <memset+0x17e>
    1852:	00e68623          	sb	a4,12(a3)
    1856:	27b5                	addw	a5,a5,13
    1858:	00c7f463          	bgeu	a5,a2,1860 <memset+0x17e>
    185c:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    1860:	8082                	ret
    1862:	482d                	li	a6,11
    1864:	bd71                	j	1700 <memset+0x1e>
    char *p = dest;
    1866:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1868:	4581                	li	a1,0
    186a:	b701                	j	176a <memset+0x88>
    186c:	00150813          	add	a6,a0,1
    1870:	4585                	li	a1,1
    1872:	bde5                	j	176a <memset+0x88>
    1874:	8082                	ret
    char *p = dest;
    1876:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1878:	4781                	li	a5,0
    187a:	b7a1                	j	17c2 <memset+0xe0>

000000000000187c <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    187c:	00054783          	lbu	a5,0(a0)
    1880:	0005c703          	lbu	a4,0(a1)
    1884:	00e79863          	bne	a5,a4,1894 <strcmp+0x18>
    1888:	0505                	add	a0,a0,1
    188a:	0585                	add	a1,a1,1
    188c:	fbe5                	bnez	a5,187c <strcmp>
    188e:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1890:	9d19                	subw	a0,a0,a4
    1892:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1894:	0007851b          	sext.w	a0,a5
    1898:	bfe5                	j	1890 <strcmp+0x14>

000000000000189a <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    189a:	ca15                	beqz	a2,18ce <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    189c:	00054783          	lbu	a5,0(a0)
    if (!n--)
    18a0:	167d                	add	a2,a2,-1
    18a2:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18a6:	eb99                	bnez	a5,18bc <strncmp+0x22>
    18a8:	a815                	j	18dc <strncmp+0x42>
    18aa:	00a68e63          	beq	a3,a0,18c6 <strncmp+0x2c>
    18ae:	0505                	add	a0,a0,1
    18b0:	00f71b63          	bne	a4,a5,18c6 <strncmp+0x2c>
    18b4:	00054783          	lbu	a5,0(a0)
    18b8:	cf89                	beqz	a5,18d2 <strncmp+0x38>
    18ba:	85b2                	mv	a1,a2
    18bc:	0005c703          	lbu	a4,0(a1)
    18c0:	00158613          	add	a2,a1,1
    18c4:	f37d                	bnez	a4,18aa <strncmp+0x10>
        ;
    return *l - *r;
    18c6:	0007851b          	sext.w	a0,a5
    18ca:	9d19                	subw	a0,a0,a4
    18cc:	8082                	ret
        return 0;
    18ce:	4501                	li	a0,0
}
    18d0:	8082                	ret
    return *l - *r;
    18d2:	0015c703          	lbu	a4,1(a1)
    18d6:	4501                	li	a0,0
    18d8:	9d19                	subw	a0,a0,a4
    18da:	8082                	ret
    18dc:	0005c703          	lbu	a4,0(a1)
    18e0:	4501                	li	a0,0
    18e2:	b7e5                	j	18ca <strncmp+0x30>

00000000000018e4 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18e4:	00757793          	and	a5,a0,7
    18e8:	cf89                	beqz	a5,1902 <strlen+0x1e>
    18ea:	87aa                	mv	a5,a0
    18ec:	a029                	j	18f6 <strlen+0x12>
    18ee:	0785                	add	a5,a5,1
    18f0:	0077f713          	and	a4,a5,7
    18f4:	cb01                	beqz	a4,1904 <strlen+0x20>
        if (!*s)
    18f6:	0007c703          	lbu	a4,0(a5)
    18fa:	fb75                	bnez	a4,18ee <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18fc:	40a78533          	sub	a0,a5,a0
}
    1900:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1902:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1904:	feff05b7          	lui	a1,0xfeff0
    1908:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedecf>
    190c:	f0101637          	lui	a2,0xf0101
    1910:	05c2                	sll	a1,a1,0x10
    1912:	0612                	sll	a2,a2,0x4
    1914:	6394                	ld	a3,0(a5)
    1916:	eff58593          	add	a1,a1,-257
    191a:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff0d1>
    191e:	05c2                	sll	a1,a1,0x10
    1920:	0642                	sll	a2,a2,0x10
    1922:	eff58593          	add	a1,a1,-257
    1926:	10160613          	add	a2,a2,257
    192a:	00b68733          	add	a4,a3,a1
    192e:	063e                	sll	a2,a2,0xf
    1930:	fff6c693          	not	a3,a3
    1934:	8f75                	and	a4,a4,a3
    1936:	08060613          	add	a2,a2,128
    193a:	8f71                	and	a4,a4,a2
    193c:	eb11                	bnez	a4,1950 <strlen+0x6c>
    193e:	6794                	ld	a3,8(a5)
    1940:	07a1                	add	a5,a5,8
    1942:	00b68733          	add	a4,a3,a1
    1946:	fff6c693          	not	a3,a3
    194a:	8f75                	and	a4,a4,a3
    194c:	8f71                	and	a4,a4,a2
    194e:	db65                	beqz	a4,193e <strlen+0x5a>
    for (; *s; s++)
    1950:	0007c703          	lbu	a4,0(a5)
    1954:	d745                	beqz	a4,18fc <strlen+0x18>
    1956:	0017c703          	lbu	a4,1(a5)
    195a:	0785                	add	a5,a5,1
    195c:	d345                	beqz	a4,18fc <strlen+0x18>
    195e:	0017c703          	lbu	a4,1(a5)
    1962:	0785                	add	a5,a5,1
    1964:	fb6d                	bnez	a4,1956 <strlen+0x72>
    1966:	bf59                	j	18fc <strlen+0x18>

0000000000001968 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1968:	00757713          	and	a4,a0,7
{
    196c:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    196e:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1972:	cb19                	beqz	a4,1988 <memchr+0x20>
    1974:	ce59                	beqz	a2,1a12 <memchr+0xaa>
    1976:	0007c703          	lbu	a4,0(a5)
    197a:	00b70963          	beq	a4,a1,198c <memchr+0x24>
    197e:	0785                	add	a5,a5,1
    1980:	0077f713          	and	a4,a5,7
    1984:	167d                	add	a2,a2,-1
    1986:	f77d                	bnez	a4,1974 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1988:	4501                	li	a0,0
    if (n && *s != c)
    198a:	c649                	beqz	a2,1a14 <memchr+0xac>
    198c:	0007c703          	lbu	a4,0(a5)
    1990:	06b70663          	beq	a4,a1,19fc <memchr+0x94>
        size_t k = ONES * c;
    1994:	01010737          	lui	a4,0x1010
    1998:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e0d1>
    199c:	0742                	sll	a4,a4,0x10
    199e:	10170713          	add	a4,a4,257
    19a2:	0742                	sll	a4,a4,0x10
    19a4:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19a8:	469d                	li	a3,7
        size_t k = ONES * c;
    19aa:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19ae:	04c6f763          	bgeu	a3,a2,19fc <memchr+0x94>
    19b2:	f0101837          	lui	a6,0xf0101
    19b6:	feff08b7          	lui	a7,0xfeff0
    19ba:	0812                	sll	a6,a6,0x4
    19bc:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedecf>
    19c0:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff0d1>
    19c4:	08c2                	sll	a7,a7,0x10
    19c6:	0842                	sll	a6,a6,0x10
    19c8:	eff88893          	add	a7,a7,-257
    19cc:	10180813          	add	a6,a6,257
    19d0:	08c2                	sll	a7,a7,0x10
    19d2:	083e                	sll	a6,a6,0xf
    19d4:	eff88893          	add	a7,a7,-257
    19d8:	08080813          	add	a6,a6,128
    19dc:	431d                	li	t1,7
    19de:	a029                	j	19e8 <memchr+0x80>
    19e0:	1661                	add	a2,a2,-8
    19e2:	07a1                	add	a5,a5,8
    19e4:	02c37663          	bgeu	t1,a2,1a10 <memchr+0xa8>
    19e8:	6398                	ld	a4,0(a5)
    19ea:	8f29                	xor	a4,a4,a0
    19ec:	011706b3          	add	a3,a4,a7
    19f0:	fff74713          	not	a4,a4
    19f4:	8f75                	and	a4,a4,a3
    19f6:	01077733          	and	a4,a4,a6
    19fa:	d37d                	beqz	a4,19e0 <memchr+0x78>
        s = (const void *)w;
    19fc:	853e                	mv	a0,a5
    19fe:	a019                	j	1a04 <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    1a00:	0505                	add	a0,a0,1
    1a02:	ca01                	beqz	a2,1a12 <memchr+0xaa>
    1a04:	00054783          	lbu	a5,0(a0)
    1a08:	167d                	add	a2,a2,-1
    1a0a:	feb79be3          	bne	a5,a1,1a00 <memchr+0x98>
    1a0e:	8082                	ret
    1a10:	f675                	bnez	a2,19fc <memchr+0x94>
    return n ? (void *)s : 0;
    1a12:	4501                	li	a0,0
}
    1a14:	8082                	ret

0000000000001a16 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1a16:	1101                	add	sp,sp,-32
    1a18:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1a1a:	862e                	mv	a2,a1
{
    1a1c:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1a1e:	4581                	li	a1,0
{
    1a20:	e426                	sd	s1,8(sp)
    1a22:	ec06                	sd	ra,24(sp)
    1a24:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1a26:	f43ff0ef          	jal	1968 <memchr>
    return p ? p - s : n;
    1a2a:	c519                	beqz	a0,1a38 <strnlen+0x22>
}
    1a2c:	60e2                	ld	ra,24(sp)
    1a2e:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1a30:	8d05                	sub	a0,a0,s1
}
    1a32:	64a2                	ld	s1,8(sp)
    1a34:	6105                	add	sp,sp,32
    1a36:	8082                	ret
    1a38:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1a3a:	8522                	mv	a0,s0
}
    1a3c:	6442                	ld	s0,16(sp)
    1a3e:	64a2                	ld	s1,8(sp)
    1a40:	6105                	add	sp,sp,32
    1a42:	8082                	ret

0000000000001a44 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a44:	00b547b3          	xor	a5,a0,a1
    1a48:	8b9d                	and	a5,a5,7
    1a4a:	efb1                	bnez	a5,1aa6 <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a4c:	0075f793          	and	a5,a1,7
    1a50:	ebb5                	bnez	a5,1ac4 <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a52:	feff0637          	lui	a2,0xfeff0
    1a56:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedecf>
    1a5a:	f01016b7          	lui	a3,0xf0101
    1a5e:	0642                	sll	a2,a2,0x10
    1a60:	0692                	sll	a3,a3,0x4
    1a62:	6198                	ld	a4,0(a1)
    1a64:	eff60613          	add	a2,a2,-257
    1a68:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff0d1>
    1a6c:	0642                	sll	a2,a2,0x10
    1a6e:	06c2                	sll	a3,a3,0x10
    1a70:	eff60613          	add	a2,a2,-257
    1a74:	10168693          	add	a3,a3,257
    1a78:	00c707b3          	add	a5,a4,a2
    1a7c:	fff74813          	not	a6,a4
    1a80:	06be                	sll	a3,a3,0xf
    1a82:	0107f7b3          	and	a5,a5,a6
    1a86:	08068693          	add	a3,a3,128
    1a8a:	8ff5                	and	a5,a5,a3
    1a8c:	ef89                	bnez	a5,1aa6 <strcpy+0x62>
    1a8e:	05a1                	add	a1,a1,8
    1a90:	e118                	sd	a4,0(a0)
    1a92:	6198                	ld	a4,0(a1)
    1a94:	0521                	add	a0,a0,8
    1a96:	00c707b3          	add	a5,a4,a2
    1a9a:	fff74813          	not	a6,a4
    1a9e:	0107f7b3          	and	a5,a5,a6
    1aa2:	8ff5                	and	a5,a5,a3
    1aa4:	d7ed                	beqz	a5,1a8e <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1aa6:	0005c783          	lbu	a5,0(a1)
    1aaa:	00f50023          	sb	a5,0(a0)
    1aae:	c785                	beqz	a5,1ad6 <strcpy+0x92>
    1ab0:	0015c783          	lbu	a5,1(a1)
    1ab4:	0505                	add	a0,a0,1
    1ab6:	0585                	add	a1,a1,1
    1ab8:	00f50023          	sb	a5,0(a0)
    1abc:	fbf5                	bnez	a5,1ab0 <strcpy+0x6c>
        ;
    return d;
}
    1abe:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1ac0:	0505                	add	a0,a0,1
    1ac2:	db41                	beqz	a4,1a52 <strcpy+0xe>
            if (!(*d = *s))
    1ac4:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1ac8:	0585                	add	a1,a1,1
    1aca:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1ace:	00f50023          	sb	a5,0(a0)
    1ad2:	f7fd                	bnez	a5,1ac0 <strcpy+0x7c>
}
    1ad4:	8082                	ret
    1ad6:	8082                	ret

0000000000001ad8 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1ad8:	00b547b3          	xor	a5,a0,a1
    1adc:	8b9d                	and	a5,a5,7
    1ade:	efbd                	bnez	a5,1b5c <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1ae0:	0075f793          	and	a5,a1,7
    1ae4:	1c078563          	beqz	a5,1cae <strncpy+0x1d6>
    1ae8:	ea11                	bnez	a2,1afc <strncpy+0x24>
    1aea:	8082                	ret
    1aec:	0585                	add	a1,a1,1
    1aee:	0075f793          	and	a5,a1,7
    1af2:	167d                	add	a2,a2,-1
    1af4:	0505                	add	a0,a0,1
    1af6:	1a078c63          	beqz	a5,1cae <strncpy+0x1d6>
    1afa:	ca3d                	beqz	a2,1b70 <strncpy+0x98>
    1afc:	0005c783          	lbu	a5,0(a1)
    1b00:	00f50023          	sb	a5,0(a0)
    1b04:	f7e5                	bnez	a5,1aec <strncpy+0x14>
            ;
        if (!n || !*s)
    1b06:	0005c783          	lbu	a5,0(a1)
    1b0a:	c7a5                	beqz	a5,1b72 <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b0c:	479d                	li	a5,7
    1b0e:	04c7f863          	bgeu	a5,a2,1b5e <strncpy+0x86>
    1b12:	f01016b7          	lui	a3,0xf0101
    1b16:	feff0837          	lui	a6,0xfeff0
    1b1a:	0692                	sll	a3,a3,0x4
    1b1c:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedecf>
    1b20:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff0d1>
    1b24:	0842                	sll	a6,a6,0x10
    1b26:	06c2                	sll	a3,a3,0x10
    1b28:	eff80813          	add	a6,a6,-257
    1b2c:	10168693          	add	a3,a3,257
    1b30:	0842                	sll	a6,a6,0x10
    1b32:	06be                	sll	a3,a3,0xf
    1b34:	eff80813          	add	a6,a6,-257
    1b38:	08068693          	add	a3,a3,128
    1b3c:	431d                	li	t1,7
    1b3e:	6198                	ld	a4,0(a1)
    1b40:	010707b3          	add	a5,a4,a6
    1b44:	fff74893          	not	a7,a4
    1b48:	0117f7b3          	and	a5,a5,a7
    1b4c:	8ff5                	and	a5,a5,a3
    1b4e:	eb81                	bnez	a5,1b5e <strncpy+0x86>
            *wd = *ws;
    1b50:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b52:	1661                	add	a2,a2,-8
    1b54:	05a1                	add	a1,a1,8
    1b56:	0521                	add	a0,a0,8
    1b58:	fec363e3          	bltu	t1,a2,1b3e <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b5c:	ca11                	beqz	a2,1b70 <strncpy+0x98>
    1b5e:	0005c783          	lbu	a5,0(a1)
    1b62:	0585                	add	a1,a1,1
    1b64:	00f50023          	sb	a5,0(a0)
    1b68:	c789                	beqz	a5,1b72 <strncpy+0x9a>
    1b6a:	167d                	add	a2,a2,-1
    1b6c:	0505                	add	a0,a0,1
    1b6e:	fa65                	bnez	a2,1b5e <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b70:	8082                	ret
    1b72:	40a00733          	neg	a4,a0
    1b76:	00777793          	and	a5,a4,7
    1b7a:	00778693          	add	a3,a5,7
    1b7e:	482d                	li	a6,11
    1b80:	fff60593          	add	a1,a2,-1
    1b84:	1106ef63          	bltu	a3,a6,1ca2 <strncpy+0x1ca>
    1b88:	12d5ee63          	bltu	a1,a3,1cc4 <strncpy+0x1ec>
    1b8c:	12078563          	beqz	a5,1cb6 <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b90:	00050023          	sb	zero,0(a0)
    1b94:	00677693          	and	a3,a4,6
    1b98:	12068263          	beqz	a3,1cbc <strncpy+0x1e4>
    1b9c:	000500a3          	sb	zero,1(a0)
    1ba0:	4689                	li	a3,2
    1ba2:	12f6f463          	bgeu	a3,a5,1cca <strncpy+0x1f2>
    1ba6:	00050123          	sb	zero,2(a0)
    1baa:	8b11                	and	a4,a4,4
    1bac:	cf6d                	beqz	a4,1ca6 <strncpy+0x1ce>
    1bae:	000501a3          	sb	zero,3(a0)
    1bb2:	4711                	li	a4,4
    1bb4:	00450693          	add	a3,a0,4
    1bb8:	02f77363          	bgeu	a4,a5,1bde <strncpy+0x106>
    1bbc:	00050223          	sb	zero,4(a0)
    1bc0:	4715                	li	a4,5
    1bc2:	00550693          	add	a3,a0,5
    1bc6:	00e78c63          	beq	a5,a4,1bde <strncpy+0x106>
    1bca:	000502a3          	sb	zero,5(a0)
    1bce:	471d                	li	a4,7
    1bd0:	10e79163          	bne	a5,a4,1cd2 <strncpy+0x1fa>
    1bd4:	00750693          	add	a3,a0,7
    1bd8:	00050323          	sb	zero,6(a0)
    1bdc:	471d                	li	a4,7
    1bde:	40f608b3          	sub	a7,a2,a5
    1be2:	ff88f813          	and	a6,a7,-8
    1be6:	97aa                	add	a5,a5,a0
    1be8:	010785b3          	add	a1,a5,a6
    1bec:	0007b023          	sd	zero,0(a5)
    1bf0:	07a1                	add	a5,a5,8
    1bf2:	feb79de3          	bne	a5,a1,1bec <strncpy+0x114>
    1bf6:	00e807bb          	addw	a5,a6,a4
    1bfa:	01068733          	add	a4,a3,a6
    1bfe:	0b088b63          	beq	a7,a6,1cb4 <strncpy+0x1dc>
    1c02:	00070023          	sb	zero,0(a4)
    1c06:	0017869b          	addw	a3,a5,1
    1c0a:	f6c6f3e3          	bgeu	a3,a2,1b70 <strncpy+0x98>
    1c0e:	000700a3          	sb	zero,1(a4)
    1c12:	0027869b          	addw	a3,a5,2
    1c16:	f4c6fde3          	bgeu	a3,a2,1b70 <strncpy+0x98>
    1c1a:	00070123          	sb	zero,2(a4)
    1c1e:	0037869b          	addw	a3,a5,3
    1c22:	f4c6f7e3          	bgeu	a3,a2,1b70 <strncpy+0x98>
    1c26:	000701a3          	sb	zero,3(a4)
    1c2a:	0047869b          	addw	a3,a5,4
    1c2e:	f4c6f1e3          	bgeu	a3,a2,1b70 <strncpy+0x98>
    1c32:	00070223          	sb	zero,4(a4)
    1c36:	0057869b          	addw	a3,a5,5
    1c3a:	f2c6fbe3          	bgeu	a3,a2,1b70 <strncpy+0x98>
    1c3e:	000702a3          	sb	zero,5(a4)
    1c42:	0067869b          	addw	a3,a5,6
    1c46:	f2c6f5e3          	bgeu	a3,a2,1b70 <strncpy+0x98>
    1c4a:	00070323          	sb	zero,6(a4)
    1c4e:	0077869b          	addw	a3,a5,7
    1c52:	f0c6ffe3          	bgeu	a3,a2,1b70 <strncpy+0x98>
    1c56:	000703a3          	sb	zero,7(a4)
    1c5a:	0087869b          	addw	a3,a5,8
    1c5e:	f0c6f9e3          	bgeu	a3,a2,1b70 <strncpy+0x98>
    1c62:	00070423          	sb	zero,8(a4)
    1c66:	0097869b          	addw	a3,a5,9
    1c6a:	f0c6f3e3          	bgeu	a3,a2,1b70 <strncpy+0x98>
    1c6e:	000704a3          	sb	zero,9(a4)
    1c72:	00a7869b          	addw	a3,a5,10
    1c76:	eec6fde3          	bgeu	a3,a2,1b70 <strncpy+0x98>
    1c7a:	00070523          	sb	zero,10(a4)
    1c7e:	00b7869b          	addw	a3,a5,11
    1c82:	eec6f7e3          	bgeu	a3,a2,1b70 <strncpy+0x98>
    1c86:	000705a3          	sb	zero,11(a4)
    1c8a:	00c7869b          	addw	a3,a5,12
    1c8e:	eec6f1e3          	bgeu	a3,a2,1b70 <strncpy+0x98>
    1c92:	00070623          	sb	zero,12(a4)
    1c96:	27b5                	addw	a5,a5,13
    1c98:	ecc7fce3          	bgeu	a5,a2,1b70 <strncpy+0x98>
    1c9c:	000706a3          	sb	zero,13(a4)
}
    1ca0:	8082                	ret
    1ca2:	46ad                	li	a3,11
    1ca4:	b5d5                	j	1b88 <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ca6:	00350693          	add	a3,a0,3
    1caa:	470d                	li	a4,3
    1cac:	bf0d                	j	1bde <strncpy+0x106>
        if (!n || !*s)
    1cae:	e4061ce3          	bnez	a2,1b06 <strncpy+0x2e>
}
    1cb2:	8082                	ret
    1cb4:	8082                	ret
    char *p = dest;
    1cb6:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cb8:	4701                	li	a4,0
    1cba:	b715                	j	1bde <strncpy+0x106>
    1cbc:	00150693          	add	a3,a0,1
    1cc0:	4705                	li	a4,1
    1cc2:	bf31                	j	1bde <strncpy+0x106>
    char *p = dest;
    1cc4:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cc6:	4781                	li	a5,0
    1cc8:	bf2d                	j	1c02 <strncpy+0x12a>
    1cca:	00250693          	add	a3,a0,2
    1cce:	4709                	li	a4,2
    1cd0:	b739                	j	1bde <strncpy+0x106>
    1cd2:	00650693          	add	a3,a0,6
    1cd6:	4719                	li	a4,6
    1cd8:	b719                	j	1bde <strncpy+0x106>

0000000000001cda <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1cda:	87aa                	mv	a5,a0
    1cdc:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1cde:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1ce2:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ce6:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1ce8:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cea:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1cee:	2501                	sext.w	a0,a0
    1cf0:	8082                	ret

0000000000001cf2 <openat>:
    register long a7 __asm__("a7") = n;
    1cf2:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1cf6:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cfa:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1cfe:	2501                	sext.w	a0,a0
    1d00:	8082                	ret

0000000000001d02 <fcntl>:
    register long a7 __asm__("a7") = n;
    1d02:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d04:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1d08:	2501                	sext.w	a0,a0
    1d0a:	8082                	ret

0000000000001d0c <close>:
    register long a7 __asm__("a7") = n;
    1d0c:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d10:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d14:	2501                	sext.w	a0,a0
    1d16:	8082                	ret

0000000000001d18 <read>:
    register long a7 __asm__("a7") = n;
    1d18:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d1c:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d20:	8082                	ret

0000000000001d22 <write>:
    register long a7 __asm__("a7") = n;
    1d22:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d26:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d2a:	8082                	ret

0000000000001d2c <getpid>:
    register long a7 __asm__("a7") = n;
    1d2c:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d30:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d34:	2501                	sext.w	a0,a0
    1d36:	8082                	ret

0000000000001d38 <getppid>:
    register long a7 __asm__("a7") = n;
    1d38:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d3c:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d40:	2501                	sext.w	a0,a0
    1d42:	8082                	ret

0000000000001d44 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d44:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d48:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d4c:	2501                	sext.w	a0,a0
    1d4e:	8082                	ret

0000000000001d50 <fork>:
    register long a7 __asm__("a7") = n;
    1d50:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d54:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d56:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d58:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d5c:	2501                	sext.w	a0,a0
    1d5e:	8082                	ret

0000000000001d60 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d60:	85b2                	mv	a1,a2
    1d62:	863a                	mv	a2,a4
    if (stack)
    1d64:	c191                	beqz	a1,1d68 <clone+0x8>
	stack += stack_size;
    1d66:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d68:	4781                	li	a5,0
    1d6a:	4701                	li	a4,0
    1d6c:	4681                	li	a3,0
    1d6e:	2601                	sext.w	a2,a2
    1d70:	a2ed                	j	1f5a <__clone>

0000000000001d72 <exit>:
    register long a7 __asm__("a7") = n;
    1d72:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d76:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d7a:	8082                	ret

0000000000001d7c <waitpid>:
    register long a7 __asm__("a7") = n;
    1d7c:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d80:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d82:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d86:	2501                	sext.w	a0,a0
    1d88:	8082                	ret

0000000000001d8a <exec>:
    register long a7 __asm__("a7") = n;
    1d8a:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d8e:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d92:	2501                	sext.w	a0,a0
    1d94:	8082                	ret

0000000000001d96 <execve>:
    register long a7 __asm__("a7") = n;
    1d96:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d9a:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d9e:	2501                	sext.w	a0,a0
    1da0:	8082                	ret

0000000000001da2 <times>:
    register long a7 __asm__("a7") = n;
    1da2:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1da6:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1daa:	2501                	sext.w	a0,a0
    1dac:	8082                	ret

0000000000001dae <get_time>:

int64 get_time()
{
    1dae:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1db0:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1db4:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1db6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db8:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1dbc:	2501                	sext.w	a0,a0
    1dbe:	ed09                	bnez	a0,1dd8 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1dc0:	67a2                	ld	a5,8(sp)
    1dc2:	3e800713          	li	a4,1000
    1dc6:	00015503          	lhu	a0,0(sp)
    1dca:	02e7d7b3          	divu	a5,a5,a4
    1dce:	02e50533          	mul	a0,a0,a4
    1dd2:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1dd4:	0141                	add	sp,sp,16
    1dd6:	8082                	ret
        return -1;
    1dd8:	557d                	li	a0,-1
    1dda:	bfed                	j	1dd4 <get_time+0x26>

0000000000001ddc <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1ddc:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1de0:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1de4:	2501                	sext.w	a0,a0
    1de6:	8082                	ret

0000000000001de8 <time>:
    register long a7 __asm__("a7") = n;
    1de8:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1dec:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1df0:	2501                	sext.w	a0,a0
    1df2:	8082                	ret

0000000000001df4 <sleep>:

int sleep(unsigned long long time)
{
    1df4:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1df6:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1df8:	850a                	mv	a0,sp
    1dfa:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1dfc:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e00:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e02:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e06:	e501                	bnez	a0,1e0e <sleep+0x1a>
    return 0;
    1e08:	4501                	li	a0,0
}
    1e0a:	0141                	add	sp,sp,16
    1e0c:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e0e:	4502                	lw	a0,0(sp)
}
    1e10:	0141                	add	sp,sp,16
    1e12:	8082                	ret

0000000000001e14 <set_priority>:
    register long a7 __asm__("a7") = n;
    1e14:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e18:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e1c:	2501                	sext.w	a0,a0
    1e1e:	8082                	ret

0000000000001e20 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e20:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e24:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e28:	8082                	ret

0000000000001e2a <munmap>:
    register long a7 __asm__("a7") = n;
    1e2a:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e2e:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e32:	2501                	sext.w	a0,a0
    1e34:	8082                	ret

0000000000001e36 <wait>:

int wait(int *code)
{
    1e36:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e38:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e3c:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e3e:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e40:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e42:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e46:	2501                	sext.w	a0,a0
    1e48:	8082                	ret

0000000000001e4a <spawn>:
    register long a7 __asm__("a7") = n;
    1e4a:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e4e:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e52:	2501                	sext.w	a0,a0
    1e54:	8082                	ret

0000000000001e56 <mailread>:
    register long a7 __asm__("a7") = n;
    1e56:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5a:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e5e:	2501                	sext.w	a0,a0
    1e60:	8082                	ret

0000000000001e62 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e62:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e66:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e6a:	2501                	sext.w	a0,a0
    1e6c:	8082                	ret

0000000000001e6e <fstat>:
    register long a7 __asm__("a7") = n;
    1e6e:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e72:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e76:	2501                	sext.w	a0,a0
    1e78:	8082                	ret

0000000000001e7a <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e7a:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e7c:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e80:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e82:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e86:	2501                	sext.w	a0,a0
    1e88:	8082                	ret

0000000000001e8a <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e8a:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e8c:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e90:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e92:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e96:	2501                	sext.w	a0,a0
    1e98:	8082                	ret

0000000000001e9a <link>:

int link(char *old_path, char *new_path)
{
    1e9a:	87aa                	mv	a5,a0
    1e9c:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e9e:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1ea2:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ea6:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1ea8:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1eac:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1eae:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1eb2:	2501                	sext.w	a0,a0
    1eb4:	8082                	ret

0000000000001eb6 <unlink>:

int unlink(char *path)
{
    1eb6:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1eb8:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1ebc:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1ec0:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ec2:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1ec6:	2501                	sext.w	a0,a0
    1ec8:	8082                	ret

0000000000001eca <uname>:
    register long a7 __asm__("a7") = n;
    1eca:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1ece:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1ed2:	2501                	sext.w	a0,a0
    1ed4:	8082                	ret

0000000000001ed6 <brk>:
    register long a7 __asm__("a7") = n;
    1ed6:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1eda:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1ede:	2501                	sext.w	a0,a0
    1ee0:	8082                	ret

0000000000001ee2 <getcwd>:
    register long a7 __asm__("a7") = n;
    1ee2:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ee4:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1ee8:	8082                	ret

0000000000001eea <chdir>:
    register long a7 __asm__("a7") = n;
    1eea:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1eee:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1ef2:	2501                	sext.w	a0,a0
    1ef4:	8082                	ret

0000000000001ef6 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1ef6:	862e                	mv	a2,a1
    1ef8:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1efa:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1efc:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f00:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f04:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f06:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f08:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1f0c:	2501                	sext.w	a0,a0
    1f0e:	8082                	ret

0000000000001f10 <getdents>:
    register long a7 __asm__("a7") = n;
    1f10:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f14:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f18:	2501                	sext.w	a0,a0
    1f1a:	8082                	ret

0000000000001f1c <pipe>:
    register long a7 __asm__("a7") = n;
    1f1c:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f20:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f22:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f26:	2501                	sext.w	a0,a0
    1f28:	8082                	ret

0000000000001f2a <dup>:
    register long a7 __asm__("a7") = n;
    1f2a:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f2c:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f30:	2501                	sext.w	a0,a0
    1f32:	8082                	ret

0000000000001f34 <dup2>:
    register long a7 __asm__("a7") = n;
    1f34:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f36:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f38:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f3c:	2501                	sext.w	a0,a0
    1f3e:	8082                	ret

0000000000001f40 <mount>:
    register long a7 __asm__("a7") = n;
    1f40:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f44:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f48:	2501                	sext.w	a0,a0
    1f4a:	8082                	ret

0000000000001f4c <umount>:
    register long a7 __asm__("a7") = n;
    1f4c:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f50:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f52:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f56:	2501                	sext.w	a0,a0
    1f58:	8082                	ret

0000000000001f5a <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f5a:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1f5c:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f5e:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f60:	8532                	mv	a0,a2
	mv a2, a4
    1f62:	863a                	mv	a2,a4
	mv a3, a5
    1f64:	86be                	mv	a3,a5
	mv a4, a6
    1f66:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f68:	0dc00893          	li	a7,220
	ecall
    1f6c:	00000073          	ecall

	beqz a0, 1f
    1f70:	c111                	beqz	a0,1f74 <__clone+0x1a>
	# Parent
	ret
    1f72:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f74:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f76:	6522                	ld	a0,8(sp)
	jalr a1
    1f78:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f7a:	05d00893          	li	a7,93
	ecall
    1f7e:	00000073          	ecall
