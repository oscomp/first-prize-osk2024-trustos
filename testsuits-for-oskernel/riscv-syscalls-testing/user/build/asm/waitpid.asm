
/home/windflower/Desktop/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/waitpid:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	aa11                	j	1116 <__start_main>

0000000000001004 <test_waitpid>:
#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"

int i = 1000;
void test_waitpid(void){
    1004:	7179                	add	sp,sp,-48
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f5250513          	add	a0,a0,-174 # 1f58 <__clone+0x2a>
void test_waitpid(void){
    100e:	f406                	sd	ra,40(sp)
    1010:	f022                	sd	s0,32(sp)
    1012:	ec26                	sd	s1,24(sp)
    TEST_START(__func__);
    1014:	33a000ef          	jal	134e <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	ff050513          	add	a0,a0,-16 # 2008 <__func__.0>
    1020:	32e000ef          	jal	134e <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	f4c50513          	add	a0,a0,-180 # 1f70 <__clone+0x42>
    102c:	322000ef          	jal	134e <puts>
    int cpid, wstatus;
    cpid = fork();
    1030:	4f5000ef          	jal	1d24 <fork>
    assert(cpid != -1);
    1034:	547d                	li	s0,-1
    cpid = fork();
    1036:	84aa                	mv	s1,a0
    assert(cpid != -1);
    1038:	04850963          	beq	a0,s0,108a <test_waitpid+0x86>
    if(cpid == 0){
    103c:	e93d                	bnez	a0,10b2 <test_waitpid+0xae>
	while(i--);
    103e:	00001797          	auipc	a5,0x1
    1042:	fe87a723          	sw	s0,-18(a5) # 202c <i>
	sched_yield();
    1046:	4d3000ef          	jal	1d18 <sched_yield>
	printf("This is child process\n");
    104a:	00001517          	auipc	a0,0x1
    104e:	f5650513          	add	a0,a0,-170 # 1fa0 <__clone+0x72>
    1052:	31e000ef          	jal	1370 <printf>
        exit(3);
    1056:	450d                	li	a0,3
    1058:	4ef000ef          	jal	1d46 <exit>
	    printf("waitpid successfully.\nwstatus: %x\n", WEXITSTATUS(wstatus));
	else
	    printf("waitpid error.\n");

    }
    TEST_END(__func__);
    105c:	00001517          	auipc	a0,0x1
    1060:	f9450513          	add	a0,a0,-108 # 1ff0 <__clone+0xc2>
    1064:	2ea000ef          	jal	134e <puts>
    1068:	00001517          	auipc	a0,0x1
    106c:	fa050513          	add	a0,a0,-96 # 2008 <__func__.0>
    1070:	2de000ef          	jal	134e <puts>
    1074:	00001517          	auipc	a0,0x1
    1078:	efc50513          	add	a0,a0,-260 # 1f70 <__clone+0x42>
    107c:	2d2000ef          	jal	134e <puts>
}
    1080:	70a2                	ld	ra,40(sp)
    1082:	7402                	ld	s0,32(sp)
    1084:	64e2                	ld	s1,24(sp)
    1086:	6145                	add	sp,sp,48
    1088:	8082                	ret
    assert(cpid != -1);
    108a:	00001517          	auipc	a0,0x1
    108e:	ef650513          	add	a0,a0,-266 # 1f80 <__clone+0x52>
    1092:	55c000ef          	jal	15ee <panic>
	pid_t ret = waitpid(cpid, &wstatus, 0);
    1096:	4601                	li	a2,0
    1098:	006c                	add	a1,sp,12
    109a:	557d                	li	a0,-1
    109c:	4b5000ef          	jal	1d50 <waitpid>
	assert(ret != -1);
    10a0:	04950563          	beq	a0,s1,10ea <test_waitpid+0xe6>
	    printf("waitpid error.\n");
    10a4:	00001517          	auipc	a0,0x1
    10a8:	f3c50513          	add	a0,a0,-196 # 1fe0 <__clone+0xb2>
    10ac:	2c4000ef          	jal	1370 <printf>
    10b0:	b775                	j	105c <test_waitpid+0x58>
	pid_t ret = waitpid(cpid, &wstatus, 0);
    10b2:	4601                	li	a2,0
    10b4:	006c                	add	a1,sp,12
    10b6:	49b000ef          	jal	1d50 <waitpid>
	assert(ret != -1);
    10ba:	02850f63          	beq	a0,s0,10f8 <test_waitpid+0xf4>
	if(ret == cpid && WEXITSTATUS(wstatus) == 3)
    10be:	fea493e3          	bne	s1,a0,10a4 <test_waitpid+0xa0>
    10c2:	4732                	lw	a4,12(sp)
    10c4:	67c1                	lui	a5,0x10
    10c6:	f0078793          	add	a5,a5,-256 # ff00 <i+0xded4>
    10ca:	8ff9                	and	a5,a5,a4
    10cc:	30000693          	li	a3,768
    10d0:	fcd79ae3          	bne	a5,a3,10a4 <test_waitpid+0xa0>
	    printf("waitpid successfully.\nwstatus: %x\n", WEXITSTATUS(wstatus));
    10d4:	4087571b          	sraw	a4,a4,0x8
    10d8:	0ff77593          	zext.b	a1,a4
    10dc:	00001517          	auipc	a0,0x1
    10e0:	edc50513          	add	a0,a0,-292 # 1fb8 <__clone+0x8a>
    10e4:	28c000ef          	jal	1370 <printf>
    10e8:	bf95                	j	105c <test_waitpid+0x58>
	assert(ret != -1);
    10ea:	00001517          	auipc	a0,0x1
    10ee:	e9650513          	add	a0,a0,-362 # 1f80 <__clone+0x52>
    10f2:	4fc000ef          	jal	15ee <panic>
	if(ret == cpid && WEXITSTATUS(wstatus) == 3)
    10f6:	b7f1                	j	10c2 <test_waitpid+0xbe>
	assert(ret != -1);
    10f8:	00001517          	auipc	a0,0x1
    10fc:	e8850513          	add	a0,a0,-376 # 1f80 <__clone+0x52>
    1100:	4ee000ef          	jal	15ee <panic>
	if(ret == cpid && WEXITSTATUS(wstatus) == 3)
    1104:	b745                	j	10a4 <test_waitpid+0xa0>

0000000000001106 <main>:

int main(void){
    1106:	1141                	add	sp,sp,-16
    1108:	e406                	sd	ra,8(sp)
    test_waitpid();
    110a:	efbff0ef          	jal	1004 <test_waitpid>
    return 0;
}
    110e:	60a2                	ld	ra,8(sp)
    1110:	4501                	li	a0,0
    1112:	0141                	add	sp,sp,16
    1114:	8082                	ret

0000000000001116 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1116:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1118:	4108                	lw	a0,0(a0)
{
    111a:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    111c:	05a1                	add	a1,a1,8
{
    111e:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1120:	fe7ff0ef          	jal	1106 <main>
    1124:	423000ef          	jal	1d46 <exit>
	return 0;
}
    1128:	60a2                	ld	ra,8(sp)
    112a:	4501                	li	a0,0
    112c:	0141                	add	sp,sp,16
    112e:	8082                	ret

0000000000001130 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1130:	7179                	add	sp,sp,-48
    1132:	f406                	sd	ra,40(sp)
    1134:	0005081b          	sext.w	a6,a0
    1138:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    113a:	00055563          	bgez	a0,1144 <printint.constprop.0+0x14>
        x = -xx;
    113e:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    1142:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1144:	02b8763b          	remuw	a2,a6,a1
    1148:	00001697          	auipc	a3,0x1
    114c:	ed068693          	add	a3,a3,-304 # 2018 <digits>
    buf[16] = 0;
    1150:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1154:	0005871b          	sext.w	a4,a1
    1158:	1602                	sll	a2,a2,0x20
    115a:	9201                	srl	a2,a2,0x20
    115c:	9636                	add	a2,a2,a3
    115e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1162:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    1166:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    116a:	10b86c63          	bltu	a6,a1,1282 <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    116e:	02e5763b          	remuw	a2,a0,a4
    1172:	1602                	sll	a2,a2,0x20
    1174:	9201                	srl	a2,a2,0x20
    1176:	9636                	add	a2,a2,a3
    1178:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    117c:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1180:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1184:	10e56863          	bltu	a0,a4,1294 <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    1188:	02e5f63b          	remuw	a2,a1,a4
    118c:	1602                	sll	a2,a2,0x20
    118e:	9201                	srl	a2,a2,0x20
    1190:	9636                	add	a2,a2,a3
    1192:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1196:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    119a:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    119e:	10e5e463          	bltu	a1,a4,12a6 <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    11a2:	02e5763b          	remuw	a2,a0,a4
    11a6:	1602                	sll	a2,a2,0x20
    11a8:	9201                	srl	a2,a2,0x20
    11aa:	9636                	add	a2,a2,a3
    11ac:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b0:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11b4:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    11b8:	10e56063          	bltu	a0,a4,12b8 <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    11bc:	02e5f63b          	remuw	a2,a1,a4
    11c0:	1602                	sll	a2,a2,0x20
    11c2:	9201                	srl	a2,a2,0x20
    11c4:	9636                	add	a2,a2,a3
    11c6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ca:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11ce:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    11d2:	0ee5ec63          	bltu	a1,a4,12ca <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11d6:	02e5763b          	remuw	a2,a0,a4
    11da:	1602                	sll	a2,a2,0x20
    11dc:	9201                	srl	a2,a2,0x20
    11de:	9636                	add	a2,a2,a3
    11e0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11e4:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11e8:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11ec:	08e56263          	bltu	a0,a4,1270 <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    11f0:	02e5f63b          	remuw	a2,a1,a4
    11f4:	1602                	sll	a2,a2,0x20
    11f6:	9201                	srl	a2,a2,0x20
    11f8:	9636                	add	a2,a2,a3
    11fa:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11fe:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1202:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1206:	0ce5eb63          	bltu	a1,a4,12dc <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    120a:	02e5763b          	remuw	a2,a0,a4
    120e:	1602                	sll	a2,a2,0x20
    1210:	9201                	srl	a2,a2,0x20
    1212:	9636                	add	a2,a2,a3
    1214:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1218:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    121c:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1220:	0ce56763          	bltu	a0,a4,12ee <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    1224:	02e5f63b          	remuw	a2,a1,a4
    1228:	1602                	sll	a2,a2,0x20
    122a:	9201                	srl	a2,a2,0x20
    122c:	9636                	add	a2,a2,a3
    122e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1232:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1236:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    123a:	0ce5e363          	bltu	a1,a4,1300 <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    123e:	1782                	sll	a5,a5,0x20
    1240:	9381                	srl	a5,a5,0x20
    1242:	96be                	add	a3,a3,a5
    1244:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    1248:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    124a:	00f10723          	sb	a5,14(sp)
    if (sign)
    124e:	00088763          	beqz	a7,125c <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1252:	02d00793          	li	a5,45
    1256:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    125a:	4595                	li	a1,5
    write(f, s, l);
    125c:	003c                	add	a5,sp,8
    125e:	4641                	li	a2,16
    1260:	9e0d                	subw	a2,a2,a1
    1262:	4505                	li	a0,1
    1264:	95be                	add	a1,a1,a5
    1266:	291000ef          	jal	1cf6 <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    126a:	70a2                	ld	ra,40(sp)
    126c:	6145                	add	sp,sp,48
    126e:	8082                	ret
    i++;
    1270:	45a9                	li	a1,10
    if (sign)
    1272:	fe0885e3          	beqz	a7,125c <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1276:	02d00793          	li	a5,45
    127a:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    127e:	45a5                	li	a1,9
    1280:	bff1                	j	125c <printint.constprop.0+0x12c>
    i++;
    1282:	45bd                	li	a1,15
    if (sign)
    1284:	fc088ce3          	beqz	a7,125c <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1288:	02d00793          	li	a5,45
    128c:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1290:	45b9                	li	a1,14
    1292:	b7e9                	j	125c <printint.constprop.0+0x12c>
    i++;
    1294:	45b9                	li	a1,14
    if (sign)
    1296:	fc0883e3          	beqz	a7,125c <printint.constprop.0+0x12c>
        buf[i--] = '-';
    129a:	02d00793          	li	a5,45
    129e:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    12a2:	45b5                	li	a1,13
    12a4:	bf65                	j	125c <printint.constprop.0+0x12c>
    i++;
    12a6:	45b5                	li	a1,13
    if (sign)
    12a8:	fa088ae3          	beqz	a7,125c <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12ac:	02d00793          	li	a5,45
    12b0:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    12b4:	45b1                	li	a1,12
    12b6:	b75d                	j	125c <printint.constprop.0+0x12c>
    i++;
    12b8:	45b1                	li	a1,12
    if (sign)
    12ba:	fa0881e3          	beqz	a7,125c <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12be:	02d00793          	li	a5,45
    12c2:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12c6:	45ad                	li	a1,11
    12c8:	bf51                	j	125c <printint.constprop.0+0x12c>
    i++;
    12ca:	45ad                	li	a1,11
    if (sign)
    12cc:	f80888e3          	beqz	a7,125c <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12d0:	02d00793          	li	a5,45
    12d4:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12d8:	45a9                	li	a1,10
    12da:	b749                	j	125c <printint.constprop.0+0x12c>
    i++;
    12dc:	45a5                	li	a1,9
    if (sign)
    12de:	f6088fe3          	beqz	a7,125c <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12e2:	02d00793          	li	a5,45
    12e6:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12ea:	45a1                	li	a1,8
    12ec:	bf85                	j	125c <printint.constprop.0+0x12c>
    i++;
    12ee:	45a1                	li	a1,8
    if (sign)
    12f0:	f60886e3          	beqz	a7,125c <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12f4:	02d00793          	li	a5,45
    12f8:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12fc:	459d                	li	a1,7
    12fe:	bfb9                	j	125c <printint.constprop.0+0x12c>
    i++;
    1300:	459d                	li	a1,7
    if (sign)
    1302:	f4088de3          	beqz	a7,125c <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1306:	02d00793          	li	a5,45
    130a:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    130e:	4599                	li	a1,6
    1310:	b7b1                	j	125c <printint.constprop.0+0x12c>

0000000000001312 <getchar>:
{
    1312:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    1314:	00f10593          	add	a1,sp,15
    1318:	4605                	li	a2,1
    131a:	4501                	li	a0,0
{
    131c:	ec06                	sd	ra,24(sp)
    char byte = 0;
    131e:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1322:	1cb000ef          	jal	1cec <read>
}
    1326:	60e2                	ld	ra,24(sp)
    1328:	00f14503          	lbu	a0,15(sp)
    132c:	6105                	add	sp,sp,32
    132e:	8082                	ret

0000000000001330 <putchar>:
{
    1330:	1101                	add	sp,sp,-32
    1332:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1334:	00f10593          	add	a1,sp,15
    1338:	4605                	li	a2,1
    133a:	4505                	li	a0,1
{
    133c:	ec06                	sd	ra,24(sp)
    char byte = c;
    133e:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1342:	1b5000ef          	jal	1cf6 <write>
}
    1346:	60e2                	ld	ra,24(sp)
    1348:	2501                	sext.w	a0,a0
    134a:	6105                	add	sp,sp,32
    134c:	8082                	ret

000000000000134e <puts>:
{
    134e:	1141                	add	sp,sp,-16
    1350:	e406                	sd	ra,8(sp)
    1352:	e022                	sd	s0,0(sp)
    1354:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1356:	56c000ef          	jal	18c2 <strlen>
    135a:	862a                	mv	a2,a0
    135c:	85a2                	mv	a1,s0
    135e:	4505                	li	a0,1
    1360:	197000ef          	jal	1cf6 <write>
}
    1364:	60a2                	ld	ra,8(sp)
    1366:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1368:	957d                	sra	a0,a0,0x3f
    return r;
    136a:	2501                	sext.w	a0,a0
}
    136c:	0141                	add	sp,sp,16
    136e:	8082                	ret

0000000000001370 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1370:	7131                	add	sp,sp,-192
    1372:	e4d6                	sd	s5,72(sp)
    1374:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    1376:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1378:	013c                	add	a5,sp,136
{
    137a:	f0ca                	sd	s2,96(sp)
    137c:	ecce                	sd	s3,88(sp)
    137e:	e8d2                	sd	s4,80(sp)
    1380:	e0da                	sd	s6,64(sp)
    1382:	fc5e                	sd	s7,56(sp)
    1384:	fc86                	sd	ra,120(sp)
    1386:	f8a2                	sd	s0,112(sp)
    1388:	f4a6                	sd	s1,104(sp)
    138a:	e52e                	sd	a1,136(sp)
    138c:	e932                	sd	a2,144(sp)
    138e:	ed36                	sd	a3,152(sp)
    1390:	f13a                	sd	a4,160(sp)
    1392:	f942                	sd	a6,176(sp)
    1394:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1396:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1398:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    139c:	07300a13          	li	s4,115
    13a0:	07800b93          	li	s7,120
    13a4:	06400b13          	li	s6,100
    buf[i++] = '0';
    13a8:	830a8a93          	add	s5,s5,-2000 # 7830 <i+0x5804>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13ac:	00001997          	auipc	s3,0x1
    13b0:	c6c98993          	add	s3,s3,-916 # 2018 <digits>
        if (!*s)
    13b4:	00054783          	lbu	a5,0(a0)
    13b8:	16078863          	beqz	a5,1528 <printf+0x1b8>
    13bc:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13be:	19278063          	beq	a5,s2,153e <printf+0x1ce>
    13c2:	00164783          	lbu	a5,1(a2)
    13c6:	0605                	add	a2,a2,1
    13c8:	fbfd                	bnez	a5,13be <printf+0x4e>
    13ca:	84b2                	mv	s1,a2
        l = z - a;
    13cc:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13d0:	85aa                	mv	a1,a0
    13d2:	8622                	mv	a2,s0
    13d4:	4505                	li	a0,1
    13d6:	121000ef          	jal	1cf6 <write>
        if (l)
    13da:	18041763          	bnez	s0,1568 <printf+0x1f8>
        if (s[1] == 0)
    13de:	0014c783          	lbu	a5,1(s1)
    13e2:	14078363          	beqz	a5,1528 <printf+0x1b8>
        switch (s[1])
    13e6:	19478f63          	beq	a5,s4,1584 <printf+0x214>
    13ea:	18fa6163          	bltu	s4,a5,156c <printf+0x1fc>
    13ee:	1b678e63          	beq	a5,s6,15aa <printf+0x23a>
    13f2:	07000713          	li	a4,112
    13f6:	1ce79463          	bne	a5,a4,15be <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13fa:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13fc:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1400:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1402:	631c                	ld	a5,0(a4)
    1404:	0721                	add	a4,a4,8
    1406:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1408:	00479293          	sll	t0,a5,0x4
    140c:	00879f93          	sll	t6,a5,0x8
    1410:	00c79f13          	sll	t5,a5,0xc
    1414:	01079e93          	sll	t4,a5,0x10
    1418:	01479e13          	sll	t3,a5,0x14
    141c:	01879313          	sll	t1,a5,0x18
    1420:	01c79893          	sll	a7,a5,0x1c
    1424:	02479813          	sll	a6,a5,0x24
    1428:	02879513          	sll	a0,a5,0x28
    142c:	02c79593          	sll	a1,a5,0x2c
    1430:	03079693          	sll	a3,a5,0x30
    1434:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1438:	03c7d413          	srl	s0,a5,0x3c
    143c:	01c7d39b          	srlw	t2,a5,0x1c
    1440:	03c2d293          	srl	t0,t0,0x3c
    1444:	03cfdf93          	srl	t6,t6,0x3c
    1448:	03cf5f13          	srl	t5,t5,0x3c
    144c:	03cede93          	srl	t4,t4,0x3c
    1450:	03ce5e13          	srl	t3,t3,0x3c
    1454:	03c35313          	srl	t1,t1,0x3c
    1458:	03c8d893          	srl	a7,a7,0x3c
    145c:	03c85813          	srl	a6,a6,0x3c
    1460:	9171                	srl	a0,a0,0x3c
    1462:	91f1                	srl	a1,a1,0x3c
    1464:	92f1                	srl	a3,a3,0x3c
    1466:	9371                	srl	a4,a4,0x3c
    1468:	974e                	add	a4,a4,s3
    146a:	944e                	add	s0,s0,s3
    146c:	92ce                	add	t0,t0,s3
    146e:	9fce                	add	t6,t6,s3
    1470:	9f4e                	add	t5,t5,s3
    1472:	9ece                	add	t4,t4,s3
    1474:	9e4e                	add	t3,t3,s3
    1476:	934e                	add	t1,t1,s3
    1478:	98ce                	add	a7,a7,s3
    147a:	93ce                	add	t2,t2,s3
    147c:	984e                	add	a6,a6,s3
    147e:	954e                	add	a0,a0,s3
    1480:	95ce                	add	a1,a1,s3
    1482:	96ce                	add	a3,a3,s3
    1484:	00074083          	lbu	ra,0(a4)
    1488:	0002c283          	lbu	t0,0(t0)
    148c:	000fcf83          	lbu	t6,0(t6)
    1490:	000f4f03          	lbu	t5,0(t5)
    1494:	000ece83          	lbu	t4,0(t4)
    1498:	000e4e03          	lbu	t3,0(t3)
    149c:	00034303          	lbu	t1,0(t1)
    14a0:	0008c883          	lbu	a7,0(a7)
    14a4:	0003c383          	lbu	t2,0(t2)
    14a8:	00084803          	lbu	a6,0(a6)
    14ac:	00054503          	lbu	a0,0(a0)
    14b0:	0005c583          	lbu	a1,0(a1)
    14b4:	0006c683          	lbu	a3,0(a3)
    14b8:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14bc:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14c0:	9371                	srl	a4,a4,0x3c
    14c2:	8bbd                	and	a5,a5,15
    14c4:	974e                	add	a4,a4,s3
    14c6:	97ce                	add	a5,a5,s3
    14c8:	005105a3          	sb	t0,11(sp)
    14cc:	01f10623          	sb	t6,12(sp)
    14d0:	01e106a3          	sb	t5,13(sp)
    14d4:	01d10723          	sb	t4,14(sp)
    14d8:	01c107a3          	sb	t3,15(sp)
    14dc:	00610823          	sb	t1,16(sp)
    14e0:	011108a3          	sb	a7,17(sp)
    14e4:	00710923          	sb	t2,18(sp)
    14e8:	010109a3          	sb	a6,19(sp)
    14ec:	00a10a23          	sb	a0,20(sp)
    14f0:	00b10aa3          	sb	a1,21(sp)
    14f4:	00d10b23          	sb	a3,22(sp)
    14f8:	00110ba3          	sb	ra,23(sp)
    14fc:	00810523          	sb	s0,10(sp)
    1500:	00074703          	lbu	a4,0(a4)
    1504:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1508:	002c                	add	a1,sp,8
    150a:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    150c:	00e10c23          	sb	a4,24(sp)
    1510:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1514:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1518:	7de000ef          	jal	1cf6 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    151c:	00248513          	add	a0,s1,2
        if (!*s)
    1520:	00054783          	lbu	a5,0(a0)
    1524:	e8079ce3          	bnez	a5,13bc <printf+0x4c>
    }
    va_end(ap);
}
    1528:	70e6                	ld	ra,120(sp)
    152a:	7446                	ld	s0,112(sp)
    152c:	74a6                	ld	s1,104(sp)
    152e:	7906                	ld	s2,96(sp)
    1530:	69e6                	ld	s3,88(sp)
    1532:	6a46                	ld	s4,80(sp)
    1534:	6aa6                	ld	s5,72(sp)
    1536:	6b06                	ld	s6,64(sp)
    1538:	7be2                	ld	s7,56(sp)
    153a:	6129                	add	sp,sp,192
    153c:	8082                	ret
    153e:	84b2                	mv	s1,a2
    1540:	a039                	j	154e <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1542:	0024c783          	lbu	a5,2(s1)
    1546:	0605                	add	a2,a2,1
    1548:	0489                	add	s1,s1,2
    154a:	e92791e3          	bne	a5,s2,13cc <printf+0x5c>
    154e:	0014c783          	lbu	a5,1(s1)
    1552:	ff2788e3          	beq	a5,s2,1542 <printf+0x1d2>
        l = z - a;
    1556:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    155a:	85aa                	mv	a1,a0
    155c:	8622                	mv	a2,s0
    155e:	4505                	li	a0,1
    1560:	796000ef          	jal	1cf6 <write>
        if (l)
    1564:	e6040de3          	beqz	s0,13de <printf+0x6e>
    1568:	8526                	mv	a0,s1
    156a:	b5a9                	j	13b4 <printf+0x44>
        switch (s[1])
    156c:	05779963          	bne	a5,s7,15be <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    1570:	6782                	ld	a5,0(sp)
    1572:	45c1                	li	a1,16
    1574:	4388                	lw	a0,0(a5)
    1576:	07a1                	add	a5,a5,8
    1578:	e03e                	sd	a5,0(sp)
    157a:	bb7ff0ef          	jal	1130 <printint.constprop.0>
        s += 2;
    157e:	00248513          	add	a0,s1,2
    1582:	bf79                	j	1520 <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    1584:	6782                	ld	a5,0(sp)
    1586:	6380                	ld	s0,0(a5)
    1588:	07a1                	add	a5,a5,8
    158a:	e03e                	sd	a5,0(sp)
    158c:	cc21                	beqz	s0,15e4 <printf+0x274>
            l = strnlen(a, 200);
    158e:	0c800593          	li	a1,200
    1592:	8522                	mv	a0,s0
    1594:	460000ef          	jal	19f4 <strnlen>
    write(f, s, l);
    1598:	0005061b          	sext.w	a2,a0
    159c:	85a2                	mv	a1,s0
    159e:	4505                	li	a0,1
    15a0:	756000ef          	jal	1cf6 <write>
        s += 2;
    15a4:	00248513          	add	a0,s1,2
    15a8:	bfa5                	j	1520 <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    15aa:	6782                	ld	a5,0(sp)
    15ac:	45a9                	li	a1,10
    15ae:	4388                	lw	a0,0(a5)
    15b0:	07a1                	add	a5,a5,8
    15b2:	e03e                	sd	a5,0(sp)
    15b4:	b7dff0ef          	jal	1130 <printint.constprop.0>
        s += 2;
    15b8:	00248513          	add	a0,s1,2
    15bc:	b795                	j	1520 <printf+0x1b0>
    return write(stdout, &byte, 1);
    15be:	4605                	li	a2,1
    15c0:	002c                	add	a1,sp,8
    15c2:	4505                	li	a0,1
    char byte = c;
    15c4:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15c8:	72e000ef          	jal	1cf6 <write>
    char byte = c;
    15cc:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15d0:	4605                	li	a2,1
    15d2:	002c                	add	a1,sp,8
    15d4:	4505                	li	a0,1
    char byte = c;
    15d6:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15da:	71c000ef          	jal	1cf6 <write>
        s += 2;
    15de:	00248513          	add	a0,s1,2
    15e2:	bf3d                	j	1520 <printf+0x1b0>
                a = "(null)";
    15e4:	00001417          	auipc	s0,0x1
    15e8:	a1c40413          	add	s0,s0,-1508 # 2000 <__clone+0xd2>
    15ec:	b74d                	j	158e <printf+0x21e>

00000000000015ee <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15ee:	1141                	add	sp,sp,-16
    15f0:	e406                	sd	ra,8(sp)
    puts(m);
    15f2:	d5dff0ef          	jal	134e <puts>
    exit(-100);
}
    15f6:	60a2                	ld	ra,8(sp)
    exit(-100);
    15f8:	f9c00513          	li	a0,-100
}
    15fc:	0141                	add	sp,sp,16
    exit(-100);
    15fe:	a7a1                	j	1d46 <exit>

0000000000001600 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1600:	02000793          	li	a5,32
    1604:	00f50663          	beq	a0,a5,1610 <isspace+0x10>
    1608:	355d                	addw	a0,a0,-9
    160a:	00553513          	sltiu	a0,a0,5
    160e:	8082                	ret
    1610:	4505                	li	a0,1
}
    1612:	8082                	ret

0000000000001614 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1614:	fd05051b          	addw	a0,a0,-48
}
    1618:	00a53513          	sltiu	a0,a0,10
    161c:	8082                	ret

000000000000161e <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    161e:	02000713          	li	a4,32
    1622:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1624:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1628:	ff76879b          	addw	a5,a3,-9
    162c:	06e68063          	beq	a3,a4,168c <atoi+0x6e>
    1630:	0006859b          	sext.w	a1,a3
    1634:	04f67c63          	bgeu	a2,a5,168c <atoi+0x6e>
        s++;
    switch (*s)
    1638:	02b00793          	li	a5,43
    163c:	06f68563          	beq	a3,a5,16a6 <atoi+0x88>
    1640:	02d00793          	li	a5,45
    1644:	04f69663          	bne	a3,a5,1690 <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1648:	00154683          	lbu	a3,1(a0)
    164c:	47a5                	li	a5,9
        s++;
    164e:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1652:	fd06869b          	addw	a3,a3,-48
    1656:	8636                	mv	a2,a3
    while (isdigit(*s))
    1658:	04d7e563          	bltu	a5,a3,16a2 <atoi+0x84>
        neg = 1;
    165c:	4885                	li	a7,1
    int n = 0, neg = 0;
    165e:	4501                	li	a0,0
    while (isdigit(*s))
    1660:	4825                	li	a6,9
    1662:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1666:	0025179b          	sllw	a5,a0,0x2
    166a:	9fa9                	addw	a5,a5,a0
    166c:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    1670:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    1674:	85b2                	mv	a1,a2
    1676:	40c7853b          	subw	a0,a5,a2
    167a:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    167c:	8636                	mv	a2,a3
    while (isdigit(*s))
    167e:	fed872e3          	bgeu	a6,a3,1662 <atoi+0x44>
    return neg ? n : -n;
    1682:	02089163          	bnez	a7,16a4 <atoi+0x86>
    1686:	40f5853b          	subw	a0,a1,a5
    168a:	8082                	ret
        s++;
    168c:	0505                	add	a0,a0,1
    168e:	bf59                	j	1624 <atoi+0x6>
    while (isdigit(*s))
    1690:	fd05859b          	addw	a1,a1,-48
    1694:	47a5                	li	a5,9
    1696:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1698:	4881                	li	a7,0
    169a:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    169e:	fcb7f0e3          	bgeu	a5,a1,165e <atoi+0x40>
    return neg ? n : -n;
    16a2:	4501                	li	a0,0
}
    16a4:	8082                	ret
    while (isdigit(*s))
    16a6:	00154683          	lbu	a3,1(a0)
    16aa:	47a5                	li	a5,9
        s++;
    16ac:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    16b0:	fd06869b          	addw	a3,a3,-48
    16b4:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    16b6:	4881                	li	a7,0
    while (isdigit(*s))
    16b8:	fad7f3e3          	bgeu	a5,a3,165e <atoi+0x40>
    return neg ? n : -n;
    16bc:	4501                	li	a0,0
    16be:	8082                	ret

00000000000016c0 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16c0:	16060f63          	beqz	a2,183e <memset+0x17e>
    16c4:	40a006b3          	neg	a3,a0
    16c8:	0076f793          	and	a5,a3,7
    16cc:	00778813          	add	a6,a5,7
    16d0:	48ad                	li	a7,11
    16d2:	0ff5f713          	zext.b	a4,a1
    16d6:	fff60593          	add	a1,a2,-1
    16da:	17186363          	bltu	a6,a7,1840 <memset+0x180>
    16de:	1705eb63          	bltu	a1,a6,1854 <memset+0x194>
    16e2:	16078163          	beqz	a5,1844 <memset+0x184>
    16e6:	00e50023          	sb	a4,0(a0)
    16ea:	0066f593          	and	a1,a3,6
    16ee:	14058e63          	beqz	a1,184a <memset+0x18a>
    16f2:	00e500a3          	sb	a4,1(a0)
    16f6:	4589                	li	a1,2
    16f8:	00250813          	add	a6,a0,2
    16fc:	04f5f663          	bgeu	a1,a5,1748 <memset+0x88>
    1700:	00e50123          	sb	a4,2(a0)
    1704:	8a91                	and	a3,a3,4
    1706:	00350813          	add	a6,a0,3
    170a:	458d                	li	a1,3
    170c:	ce95                	beqz	a3,1748 <memset+0x88>
    170e:	00e501a3          	sb	a4,3(a0)
    1712:	4691                	li	a3,4
    1714:	00450813          	add	a6,a0,4
    1718:	4591                	li	a1,4
    171a:	02f6f763          	bgeu	a3,a5,1748 <memset+0x88>
    171e:	00e50223          	sb	a4,4(a0)
    1722:	4695                	li	a3,5
    1724:	00550813          	add	a6,a0,5
    1728:	4595                	li	a1,5
    172a:	00d78f63          	beq	a5,a3,1748 <memset+0x88>
    172e:	00e502a3          	sb	a4,5(a0)
    1732:	469d                	li	a3,7
    1734:	00650813          	add	a6,a0,6
    1738:	4599                	li	a1,6
    173a:	00d79763          	bne	a5,a3,1748 <memset+0x88>
    173e:	00750813          	add	a6,a0,7
    1742:	00e50323          	sb	a4,6(a0)
    1746:	459d                	li	a1,7
    1748:	00871693          	sll	a3,a4,0x8
    174c:	01071313          	sll	t1,a4,0x10
    1750:	8ed9                	or	a3,a3,a4
    1752:	01871893          	sll	a7,a4,0x18
    1756:	0066e6b3          	or	a3,a3,t1
    175a:	0116e6b3          	or	a3,a3,a7
    175e:	02071313          	sll	t1,a4,0x20
    1762:	02871893          	sll	a7,a4,0x28
    1766:	0066e6b3          	or	a3,a3,t1
    176a:	40f60e33          	sub	t3,a2,a5
    176e:	03071313          	sll	t1,a4,0x30
    1772:	0116e6b3          	or	a3,a3,a7
    1776:	0066e6b3          	or	a3,a3,t1
    177a:	03871893          	sll	a7,a4,0x38
    177e:	97aa                	add	a5,a5,a0
    1780:	ff8e7313          	and	t1,t3,-8
    1784:	0116e6b3          	or	a3,a3,a7
    1788:	00f308b3          	add	a7,t1,a5
    178c:	e394                	sd	a3,0(a5)
    178e:	07a1                	add	a5,a5,8
    1790:	ff179ee3          	bne	a5,a7,178c <memset+0xcc>
    1794:	006806b3          	add	a3,a6,t1
    1798:	00b307bb          	addw	a5,t1,a1
    179c:	0bc30b63          	beq	t1,t3,1852 <memset+0x192>
    17a0:	00e68023          	sb	a4,0(a3)
    17a4:	0017859b          	addw	a1,a5,1
    17a8:	08c5fb63          	bgeu	a1,a2,183e <memset+0x17e>
    17ac:	00e680a3          	sb	a4,1(a3)
    17b0:	0027859b          	addw	a1,a5,2
    17b4:	08c5f563          	bgeu	a1,a2,183e <memset+0x17e>
    17b8:	00e68123          	sb	a4,2(a3)
    17bc:	0037859b          	addw	a1,a5,3
    17c0:	06c5ff63          	bgeu	a1,a2,183e <memset+0x17e>
    17c4:	00e681a3          	sb	a4,3(a3)
    17c8:	0047859b          	addw	a1,a5,4
    17cc:	06c5f963          	bgeu	a1,a2,183e <memset+0x17e>
    17d0:	00e68223          	sb	a4,4(a3)
    17d4:	0057859b          	addw	a1,a5,5
    17d8:	06c5f363          	bgeu	a1,a2,183e <memset+0x17e>
    17dc:	00e682a3          	sb	a4,5(a3)
    17e0:	0067859b          	addw	a1,a5,6
    17e4:	04c5fd63          	bgeu	a1,a2,183e <memset+0x17e>
    17e8:	00e68323          	sb	a4,6(a3)
    17ec:	0077859b          	addw	a1,a5,7
    17f0:	04c5f763          	bgeu	a1,a2,183e <memset+0x17e>
    17f4:	00e683a3          	sb	a4,7(a3)
    17f8:	0087859b          	addw	a1,a5,8
    17fc:	04c5f163          	bgeu	a1,a2,183e <memset+0x17e>
    1800:	00e68423          	sb	a4,8(a3)
    1804:	0097859b          	addw	a1,a5,9
    1808:	02c5fb63          	bgeu	a1,a2,183e <memset+0x17e>
    180c:	00e684a3          	sb	a4,9(a3)
    1810:	00a7859b          	addw	a1,a5,10
    1814:	02c5f563          	bgeu	a1,a2,183e <memset+0x17e>
    1818:	00e68523          	sb	a4,10(a3)
    181c:	00b7859b          	addw	a1,a5,11
    1820:	00c5ff63          	bgeu	a1,a2,183e <memset+0x17e>
    1824:	00e685a3          	sb	a4,11(a3)
    1828:	00c7859b          	addw	a1,a5,12
    182c:	00c5f963          	bgeu	a1,a2,183e <memset+0x17e>
    1830:	00e68623          	sb	a4,12(a3)
    1834:	27b5                	addw	a5,a5,13
    1836:	00c7f463          	bgeu	a5,a2,183e <memset+0x17e>
    183a:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    183e:	8082                	ret
    1840:	482d                	li	a6,11
    1842:	bd71                	j	16de <memset+0x1e>
    char *p = dest;
    1844:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1846:	4581                	li	a1,0
    1848:	b701                	j	1748 <memset+0x88>
    184a:	00150813          	add	a6,a0,1
    184e:	4585                	li	a1,1
    1850:	bde5                	j	1748 <memset+0x88>
    1852:	8082                	ret
    char *p = dest;
    1854:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1856:	4781                	li	a5,0
    1858:	b7a1                	j	17a0 <memset+0xe0>

000000000000185a <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    185a:	00054783          	lbu	a5,0(a0)
    185e:	0005c703          	lbu	a4,0(a1)
    1862:	00e79863          	bne	a5,a4,1872 <strcmp+0x18>
    1866:	0505                	add	a0,a0,1
    1868:	0585                	add	a1,a1,1
    186a:	fbe5                	bnez	a5,185a <strcmp>
    186c:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    186e:	9d19                	subw	a0,a0,a4
    1870:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1872:	0007851b          	sext.w	a0,a5
    1876:	bfe5                	j	186e <strcmp+0x14>

0000000000001878 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1878:	ca15                	beqz	a2,18ac <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    187a:	00054783          	lbu	a5,0(a0)
    if (!n--)
    187e:	167d                	add	a2,a2,-1
    1880:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1884:	eb99                	bnez	a5,189a <strncmp+0x22>
    1886:	a815                	j	18ba <strncmp+0x42>
    1888:	00a68e63          	beq	a3,a0,18a4 <strncmp+0x2c>
    188c:	0505                	add	a0,a0,1
    188e:	00f71b63          	bne	a4,a5,18a4 <strncmp+0x2c>
    1892:	00054783          	lbu	a5,0(a0)
    1896:	cf89                	beqz	a5,18b0 <strncmp+0x38>
    1898:	85b2                	mv	a1,a2
    189a:	0005c703          	lbu	a4,0(a1)
    189e:	00158613          	add	a2,a1,1
    18a2:	f37d                	bnez	a4,1888 <strncmp+0x10>
        ;
    return *l - *r;
    18a4:	0007851b          	sext.w	a0,a5
    18a8:	9d19                	subw	a0,a0,a4
    18aa:	8082                	ret
        return 0;
    18ac:	4501                	li	a0,0
}
    18ae:	8082                	ret
    return *l - *r;
    18b0:	0015c703          	lbu	a4,1(a1)
    18b4:	4501                	li	a0,0
    18b6:	9d19                	subw	a0,a0,a4
    18b8:	8082                	ret
    18ba:	0005c703          	lbu	a4,0(a1)
    18be:	4501                	li	a0,0
    18c0:	b7e5                	j	18a8 <strncmp+0x30>

00000000000018c2 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18c2:	00757793          	and	a5,a0,7
    18c6:	cf89                	beqz	a5,18e0 <strlen+0x1e>
    18c8:	87aa                	mv	a5,a0
    18ca:	a029                	j	18d4 <strlen+0x12>
    18cc:	0785                	add	a5,a5,1
    18ce:	0077f713          	and	a4,a5,7
    18d2:	cb01                	beqz	a4,18e2 <strlen+0x20>
        if (!*s)
    18d4:	0007c703          	lbu	a4,0(a5)
    18d8:	fb75                	bnez	a4,18cc <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18da:	40a78533          	sub	a0,a5,a0
}
    18de:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18e0:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18e2:	feff05b7          	lui	a1,0xfeff0
    18e6:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <i+0xfffffffffefeded3>
    18ea:	f0101637          	lui	a2,0xf0101
    18ee:	05c2                	sll	a1,a1,0x10
    18f0:	0612                	sll	a2,a2,0x4
    18f2:	6394                	ld	a3,0(a5)
    18f4:	eff58593          	add	a1,a1,-257
    18f8:	10160613          	add	a2,a2,257 # fffffffff0101101 <i+0xfffffffff00ff0d5>
    18fc:	05c2                	sll	a1,a1,0x10
    18fe:	0642                	sll	a2,a2,0x10
    1900:	eff58593          	add	a1,a1,-257
    1904:	10160613          	add	a2,a2,257
    1908:	00b68733          	add	a4,a3,a1
    190c:	063e                	sll	a2,a2,0xf
    190e:	fff6c693          	not	a3,a3
    1912:	8f75                	and	a4,a4,a3
    1914:	08060613          	add	a2,a2,128
    1918:	8f71                	and	a4,a4,a2
    191a:	eb11                	bnez	a4,192e <strlen+0x6c>
    191c:	6794                	ld	a3,8(a5)
    191e:	07a1                	add	a5,a5,8
    1920:	00b68733          	add	a4,a3,a1
    1924:	fff6c693          	not	a3,a3
    1928:	8f75                	and	a4,a4,a3
    192a:	8f71                	and	a4,a4,a2
    192c:	db65                	beqz	a4,191c <strlen+0x5a>
    for (; *s; s++)
    192e:	0007c703          	lbu	a4,0(a5)
    1932:	d745                	beqz	a4,18da <strlen+0x18>
    1934:	0017c703          	lbu	a4,1(a5)
    1938:	0785                	add	a5,a5,1
    193a:	d345                	beqz	a4,18da <strlen+0x18>
    193c:	0017c703          	lbu	a4,1(a5)
    1940:	0785                	add	a5,a5,1
    1942:	fb6d                	bnez	a4,1934 <strlen+0x72>
    1944:	bf59                	j	18da <strlen+0x18>

0000000000001946 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1946:	00757713          	and	a4,a0,7
{
    194a:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    194c:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1950:	cb19                	beqz	a4,1966 <memchr+0x20>
    1952:	ce59                	beqz	a2,19f0 <memchr+0xaa>
    1954:	0007c703          	lbu	a4,0(a5)
    1958:	00b70963          	beq	a4,a1,196a <memchr+0x24>
    195c:	0785                	add	a5,a5,1
    195e:	0077f713          	and	a4,a5,7
    1962:	167d                	add	a2,a2,-1
    1964:	f77d                	bnez	a4,1952 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1966:	4501                	li	a0,0
    if (n && *s != c)
    1968:	c649                	beqz	a2,19f2 <memchr+0xac>
    196a:	0007c703          	lbu	a4,0(a5)
    196e:	06b70663          	beq	a4,a1,19da <memchr+0x94>
        size_t k = ONES * c;
    1972:	01010737          	lui	a4,0x1010
    1976:	10170713          	add	a4,a4,257 # 1010101 <i+0x100e0d5>
    197a:	0742                	sll	a4,a4,0x10
    197c:	10170713          	add	a4,a4,257
    1980:	0742                	sll	a4,a4,0x10
    1982:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1986:	469d                	li	a3,7
        size_t k = ONES * c;
    1988:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    198c:	04c6f763          	bgeu	a3,a2,19da <memchr+0x94>
    1990:	f0101837          	lui	a6,0xf0101
    1994:	feff08b7          	lui	a7,0xfeff0
    1998:	0812                	sll	a6,a6,0x4
    199a:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <i+0xfffffffffefeded3>
    199e:	10180813          	add	a6,a6,257 # fffffffff0101101 <i+0xfffffffff00ff0d5>
    19a2:	08c2                	sll	a7,a7,0x10
    19a4:	0842                	sll	a6,a6,0x10
    19a6:	eff88893          	add	a7,a7,-257
    19aa:	10180813          	add	a6,a6,257
    19ae:	08c2                	sll	a7,a7,0x10
    19b0:	083e                	sll	a6,a6,0xf
    19b2:	eff88893          	add	a7,a7,-257
    19b6:	08080813          	add	a6,a6,128
    19ba:	431d                	li	t1,7
    19bc:	a029                	j	19c6 <memchr+0x80>
    19be:	1661                	add	a2,a2,-8
    19c0:	07a1                	add	a5,a5,8
    19c2:	02c37663          	bgeu	t1,a2,19ee <memchr+0xa8>
    19c6:	6398                	ld	a4,0(a5)
    19c8:	8f29                	xor	a4,a4,a0
    19ca:	011706b3          	add	a3,a4,a7
    19ce:	fff74713          	not	a4,a4
    19d2:	8f75                	and	a4,a4,a3
    19d4:	01077733          	and	a4,a4,a6
    19d8:	d37d                	beqz	a4,19be <memchr+0x78>
        s = (const void *)w;
    19da:	853e                	mv	a0,a5
    19dc:	a019                	j	19e2 <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    19de:	0505                	add	a0,a0,1
    19e0:	ca01                	beqz	a2,19f0 <memchr+0xaa>
    19e2:	00054783          	lbu	a5,0(a0)
    19e6:	167d                	add	a2,a2,-1
    19e8:	feb79be3          	bne	a5,a1,19de <memchr+0x98>
    19ec:	8082                	ret
    19ee:	f675                	bnez	a2,19da <memchr+0x94>
    return n ? (void *)s : 0;
    19f0:	4501                	li	a0,0
}
    19f2:	8082                	ret

00000000000019f4 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19f4:	1101                	add	sp,sp,-32
    19f6:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19f8:	862e                	mv	a2,a1
{
    19fa:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19fc:	4581                	li	a1,0
{
    19fe:	e426                	sd	s1,8(sp)
    1a00:	ec06                	sd	ra,24(sp)
    1a02:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1a04:	f43ff0ef          	jal	1946 <memchr>
    return p ? p - s : n;
    1a08:	c519                	beqz	a0,1a16 <strnlen+0x22>
}
    1a0a:	60e2                	ld	ra,24(sp)
    1a0c:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1a0e:	8d05                	sub	a0,a0,s1
}
    1a10:	64a2                	ld	s1,8(sp)
    1a12:	6105                	add	sp,sp,32
    1a14:	8082                	ret
    1a16:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1a18:	8522                	mv	a0,s0
}
    1a1a:	6442                	ld	s0,16(sp)
    1a1c:	64a2                	ld	s1,8(sp)
    1a1e:	6105                	add	sp,sp,32
    1a20:	8082                	ret

0000000000001a22 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a22:	00b547b3          	xor	a5,a0,a1
    1a26:	8b9d                	and	a5,a5,7
    1a28:	efb1                	bnez	a5,1a84 <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a2a:	0075f793          	and	a5,a1,7
    1a2e:	ebb5                	bnez	a5,1aa2 <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a30:	feff0637          	lui	a2,0xfeff0
    1a34:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <i+0xfffffffffefeded3>
    1a38:	f01016b7          	lui	a3,0xf0101
    1a3c:	0642                	sll	a2,a2,0x10
    1a3e:	0692                	sll	a3,a3,0x4
    1a40:	6198                	ld	a4,0(a1)
    1a42:	eff60613          	add	a2,a2,-257
    1a46:	10168693          	add	a3,a3,257 # fffffffff0101101 <i+0xfffffffff00ff0d5>
    1a4a:	0642                	sll	a2,a2,0x10
    1a4c:	06c2                	sll	a3,a3,0x10
    1a4e:	eff60613          	add	a2,a2,-257
    1a52:	10168693          	add	a3,a3,257
    1a56:	00c707b3          	add	a5,a4,a2
    1a5a:	fff74813          	not	a6,a4
    1a5e:	06be                	sll	a3,a3,0xf
    1a60:	0107f7b3          	and	a5,a5,a6
    1a64:	08068693          	add	a3,a3,128
    1a68:	8ff5                	and	a5,a5,a3
    1a6a:	ef89                	bnez	a5,1a84 <strcpy+0x62>
    1a6c:	05a1                	add	a1,a1,8
    1a6e:	e118                	sd	a4,0(a0)
    1a70:	6198                	ld	a4,0(a1)
    1a72:	0521                	add	a0,a0,8
    1a74:	00c707b3          	add	a5,a4,a2
    1a78:	fff74813          	not	a6,a4
    1a7c:	0107f7b3          	and	a5,a5,a6
    1a80:	8ff5                	and	a5,a5,a3
    1a82:	d7ed                	beqz	a5,1a6c <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a84:	0005c783          	lbu	a5,0(a1)
    1a88:	00f50023          	sb	a5,0(a0)
    1a8c:	c785                	beqz	a5,1ab4 <strcpy+0x92>
    1a8e:	0015c783          	lbu	a5,1(a1)
    1a92:	0505                	add	a0,a0,1
    1a94:	0585                	add	a1,a1,1
    1a96:	00f50023          	sb	a5,0(a0)
    1a9a:	fbf5                	bnez	a5,1a8e <strcpy+0x6c>
        ;
    return d;
}
    1a9c:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a9e:	0505                	add	a0,a0,1
    1aa0:	db41                	beqz	a4,1a30 <strcpy+0xe>
            if (!(*d = *s))
    1aa2:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1aa6:	0585                	add	a1,a1,1
    1aa8:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1aac:	00f50023          	sb	a5,0(a0)
    1ab0:	f7fd                	bnez	a5,1a9e <strcpy+0x7c>
}
    1ab2:	8082                	ret
    1ab4:	8082                	ret

0000000000001ab6 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1ab6:	00b547b3          	xor	a5,a0,a1
    1aba:	8b9d                	and	a5,a5,7
    1abc:	efbd                	bnez	a5,1b3a <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1abe:	0075f793          	and	a5,a1,7
    1ac2:	1c078563          	beqz	a5,1c8c <strncpy+0x1d6>
    1ac6:	ea11                	bnez	a2,1ada <strncpy+0x24>
    1ac8:	8082                	ret
    1aca:	0585                	add	a1,a1,1
    1acc:	0075f793          	and	a5,a1,7
    1ad0:	167d                	add	a2,a2,-1
    1ad2:	0505                	add	a0,a0,1
    1ad4:	1a078c63          	beqz	a5,1c8c <strncpy+0x1d6>
    1ad8:	ca3d                	beqz	a2,1b4e <strncpy+0x98>
    1ada:	0005c783          	lbu	a5,0(a1)
    1ade:	00f50023          	sb	a5,0(a0)
    1ae2:	f7e5                	bnez	a5,1aca <strncpy+0x14>
            ;
        if (!n || !*s)
    1ae4:	0005c783          	lbu	a5,0(a1)
    1ae8:	c7a5                	beqz	a5,1b50 <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1aea:	479d                	li	a5,7
    1aec:	04c7f863          	bgeu	a5,a2,1b3c <strncpy+0x86>
    1af0:	f01016b7          	lui	a3,0xf0101
    1af4:	feff0837          	lui	a6,0xfeff0
    1af8:	0692                	sll	a3,a3,0x4
    1afa:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <i+0xfffffffffefeded3>
    1afe:	10168693          	add	a3,a3,257 # fffffffff0101101 <i+0xfffffffff00ff0d5>
    1b02:	0842                	sll	a6,a6,0x10
    1b04:	06c2                	sll	a3,a3,0x10
    1b06:	eff80813          	add	a6,a6,-257
    1b0a:	10168693          	add	a3,a3,257
    1b0e:	0842                	sll	a6,a6,0x10
    1b10:	06be                	sll	a3,a3,0xf
    1b12:	eff80813          	add	a6,a6,-257
    1b16:	08068693          	add	a3,a3,128
    1b1a:	431d                	li	t1,7
    1b1c:	6198                	ld	a4,0(a1)
    1b1e:	010707b3          	add	a5,a4,a6
    1b22:	fff74893          	not	a7,a4
    1b26:	0117f7b3          	and	a5,a5,a7
    1b2a:	8ff5                	and	a5,a5,a3
    1b2c:	eb81                	bnez	a5,1b3c <strncpy+0x86>
            *wd = *ws;
    1b2e:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b30:	1661                	add	a2,a2,-8
    1b32:	05a1                	add	a1,a1,8
    1b34:	0521                	add	a0,a0,8
    1b36:	fec363e3          	bltu	t1,a2,1b1c <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b3a:	ca11                	beqz	a2,1b4e <strncpy+0x98>
    1b3c:	0005c783          	lbu	a5,0(a1)
    1b40:	0585                	add	a1,a1,1
    1b42:	00f50023          	sb	a5,0(a0)
    1b46:	c789                	beqz	a5,1b50 <strncpy+0x9a>
    1b48:	167d                	add	a2,a2,-1
    1b4a:	0505                	add	a0,a0,1
    1b4c:	fa65                	bnez	a2,1b3c <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b4e:	8082                	ret
    1b50:	40a00733          	neg	a4,a0
    1b54:	00777793          	and	a5,a4,7
    1b58:	00778693          	add	a3,a5,7
    1b5c:	482d                	li	a6,11
    1b5e:	fff60593          	add	a1,a2,-1
    1b62:	1106ef63          	bltu	a3,a6,1c80 <strncpy+0x1ca>
    1b66:	12d5ee63          	bltu	a1,a3,1ca2 <strncpy+0x1ec>
    1b6a:	12078563          	beqz	a5,1c94 <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b6e:	00050023          	sb	zero,0(a0)
    1b72:	00677693          	and	a3,a4,6
    1b76:	12068263          	beqz	a3,1c9a <strncpy+0x1e4>
    1b7a:	000500a3          	sb	zero,1(a0)
    1b7e:	4689                	li	a3,2
    1b80:	12f6f463          	bgeu	a3,a5,1ca8 <strncpy+0x1f2>
    1b84:	00050123          	sb	zero,2(a0)
    1b88:	8b11                	and	a4,a4,4
    1b8a:	cf6d                	beqz	a4,1c84 <strncpy+0x1ce>
    1b8c:	000501a3          	sb	zero,3(a0)
    1b90:	4711                	li	a4,4
    1b92:	00450693          	add	a3,a0,4
    1b96:	02f77363          	bgeu	a4,a5,1bbc <strncpy+0x106>
    1b9a:	00050223          	sb	zero,4(a0)
    1b9e:	4715                	li	a4,5
    1ba0:	00550693          	add	a3,a0,5
    1ba4:	00e78c63          	beq	a5,a4,1bbc <strncpy+0x106>
    1ba8:	000502a3          	sb	zero,5(a0)
    1bac:	471d                	li	a4,7
    1bae:	10e79163          	bne	a5,a4,1cb0 <strncpy+0x1fa>
    1bb2:	00750693          	add	a3,a0,7
    1bb6:	00050323          	sb	zero,6(a0)
    1bba:	471d                	li	a4,7
    1bbc:	40f608b3          	sub	a7,a2,a5
    1bc0:	ff88f813          	and	a6,a7,-8
    1bc4:	97aa                	add	a5,a5,a0
    1bc6:	010785b3          	add	a1,a5,a6
    1bca:	0007b023          	sd	zero,0(a5)
    1bce:	07a1                	add	a5,a5,8
    1bd0:	feb79de3          	bne	a5,a1,1bca <strncpy+0x114>
    1bd4:	00e807bb          	addw	a5,a6,a4
    1bd8:	01068733          	add	a4,a3,a6
    1bdc:	0b088b63          	beq	a7,a6,1c92 <strncpy+0x1dc>
    1be0:	00070023          	sb	zero,0(a4)
    1be4:	0017869b          	addw	a3,a5,1
    1be8:	f6c6f3e3          	bgeu	a3,a2,1b4e <strncpy+0x98>
    1bec:	000700a3          	sb	zero,1(a4)
    1bf0:	0027869b          	addw	a3,a5,2
    1bf4:	f4c6fde3          	bgeu	a3,a2,1b4e <strncpy+0x98>
    1bf8:	00070123          	sb	zero,2(a4)
    1bfc:	0037869b          	addw	a3,a5,3
    1c00:	f4c6f7e3          	bgeu	a3,a2,1b4e <strncpy+0x98>
    1c04:	000701a3          	sb	zero,3(a4)
    1c08:	0047869b          	addw	a3,a5,4
    1c0c:	f4c6f1e3          	bgeu	a3,a2,1b4e <strncpy+0x98>
    1c10:	00070223          	sb	zero,4(a4)
    1c14:	0057869b          	addw	a3,a5,5
    1c18:	f2c6fbe3          	bgeu	a3,a2,1b4e <strncpy+0x98>
    1c1c:	000702a3          	sb	zero,5(a4)
    1c20:	0067869b          	addw	a3,a5,6
    1c24:	f2c6f5e3          	bgeu	a3,a2,1b4e <strncpy+0x98>
    1c28:	00070323          	sb	zero,6(a4)
    1c2c:	0077869b          	addw	a3,a5,7
    1c30:	f0c6ffe3          	bgeu	a3,a2,1b4e <strncpy+0x98>
    1c34:	000703a3          	sb	zero,7(a4)
    1c38:	0087869b          	addw	a3,a5,8
    1c3c:	f0c6f9e3          	bgeu	a3,a2,1b4e <strncpy+0x98>
    1c40:	00070423          	sb	zero,8(a4)
    1c44:	0097869b          	addw	a3,a5,9
    1c48:	f0c6f3e3          	bgeu	a3,a2,1b4e <strncpy+0x98>
    1c4c:	000704a3          	sb	zero,9(a4)
    1c50:	00a7869b          	addw	a3,a5,10
    1c54:	eec6fde3          	bgeu	a3,a2,1b4e <strncpy+0x98>
    1c58:	00070523          	sb	zero,10(a4)
    1c5c:	00b7869b          	addw	a3,a5,11
    1c60:	eec6f7e3          	bgeu	a3,a2,1b4e <strncpy+0x98>
    1c64:	000705a3          	sb	zero,11(a4)
    1c68:	00c7869b          	addw	a3,a5,12
    1c6c:	eec6f1e3          	bgeu	a3,a2,1b4e <strncpy+0x98>
    1c70:	00070623          	sb	zero,12(a4)
    1c74:	27b5                	addw	a5,a5,13
    1c76:	ecc7fce3          	bgeu	a5,a2,1b4e <strncpy+0x98>
    1c7a:	000706a3          	sb	zero,13(a4)
}
    1c7e:	8082                	ret
    1c80:	46ad                	li	a3,11
    1c82:	b5d5                	j	1b66 <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c84:	00350693          	add	a3,a0,3
    1c88:	470d                	li	a4,3
    1c8a:	bf0d                	j	1bbc <strncpy+0x106>
        if (!n || !*s)
    1c8c:	e4061ce3          	bnez	a2,1ae4 <strncpy+0x2e>
}
    1c90:	8082                	ret
    1c92:	8082                	ret
    char *p = dest;
    1c94:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c96:	4701                	li	a4,0
    1c98:	b715                	j	1bbc <strncpy+0x106>
    1c9a:	00150693          	add	a3,a0,1
    1c9e:	4705                	li	a4,1
    1ca0:	bf31                	j	1bbc <strncpy+0x106>
    char *p = dest;
    1ca2:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ca4:	4781                	li	a5,0
    1ca6:	bf2d                	j	1be0 <strncpy+0x12a>
    1ca8:	00250693          	add	a3,a0,2
    1cac:	4709                	li	a4,2
    1cae:	b739                	j	1bbc <strncpy+0x106>
    1cb0:	00650693          	add	a3,a0,6
    1cb4:	4719                	li	a4,6
    1cb6:	b719                	j	1bbc <strncpy+0x106>

0000000000001cb8 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1cb8:	87aa                	mv	a5,a0
    1cba:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1cbc:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1cc0:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1cc4:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1cc6:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cc8:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1ccc:	2501                	sext.w	a0,a0
    1cce:	8082                	ret

0000000000001cd0 <openat>:
    register long a7 __asm__("a7") = n;
    1cd0:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1cd4:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cd8:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1cdc:	2501                	sext.w	a0,a0
    1cde:	8082                	ret

0000000000001ce0 <close>:
    register long a7 __asm__("a7") = n;
    1ce0:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1ce4:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1ce8:	2501                	sext.w	a0,a0
    1cea:	8082                	ret

0000000000001cec <read>:
    register long a7 __asm__("a7") = n;
    1cec:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cf0:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1cf4:	8082                	ret

0000000000001cf6 <write>:
    register long a7 __asm__("a7") = n;
    1cf6:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cfa:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1cfe:	8082                	ret

0000000000001d00 <getpid>:
    register long a7 __asm__("a7") = n;
    1d00:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d04:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d08:	2501                	sext.w	a0,a0
    1d0a:	8082                	ret

0000000000001d0c <getppid>:
    register long a7 __asm__("a7") = n;
    1d0c:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d10:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d14:	2501                	sext.w	a0,a0
    1d16:	8082                	ret

0000000000001d18 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d18:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d1c:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d20:	2501                	sext.w	a0,a0
    1d22:	8082                	ret

0000000000001d24 <fork>:
    register long a7 __asm__("a7") = n;
    1d24:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d28:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d2a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d2c:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d30:	2501                	sext.w	a0,a0
    1d32:	8082                	ret

0000000000001d34 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d34:	85b2                	mv	a1,a2
    1d36:	863a                	mv	a2,a4
    if (stack)
    1d38:	c191                	beqz	a1,1d3c <clone+0x8>
	stack += stack_size;
    1d3a:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d3c:	4781                	li	a5,0
    1d3e:	4701                	li	a4,0
    1d40:	4681                	li	a3,0
    1d42:	2601                	sext.w	a2,a2
    1d44:	a2ed                	j	1f2e <__clone>

0000000000001d46 <exit>:
    register long a7 __asm__("a7") = n;
    1d46:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d4a:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d4e:	8082                	ret

0000000000001d50 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d50:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d54:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d56:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d5a:	2501                	sext.w	a0,a0
    1d5c:	8082                	ret

0000000000001d5e <exec>:
    register long a7 __asm__("a7") = n;
    1d5e:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d62:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d66:	2501                	sext.w	a0,a0
    1d68:	8082                	ret

0000000000001d6a <execve>:
    register long a7 __asm__("a7") = n;
    1d6a:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d6e:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d72:	2501                	sext.w	a0,a0
    1d74:	8082                	ret

0000000000001d76 <times>:
    register long a7 __asm__("a7") = n;
    1d76:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d7a:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d7e:	2501                	sext.w	a0,a0
    1d80:	8082                	ret

0000000000001d82 <get_time>:

int64 get_time()
{
    1d82:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d84:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d88:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d8a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d8c:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d90:	2501                	sext.w	a0,a0
    1d92:	ed09                	bnez	a0,1dac <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d94:	67a2                	ld	a5,8(sp)
    1d96:	3e800713          	li	a4,1000
    1d9a:	00015503          	lhu	a0,0(sp)
    1d9e:	02e7d7b3          	divu	a5,a5,a4
    1da2:	02e50533          	mul	a0,a0,a4
    1da6:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1da8:	0141                	add	sp,sp,16
    1daa:	8082                	ret
        return -1;
    1dac:	557d                	li	a0,-1
    1dae:	bfed                	j	1da8 <get_time+0x26>

0000000000001db0 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1db0:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db4:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1db8:	2501                	sext.w	a0,a0
    1dba:	8082                	ret

0000000000001dbc <time>:
    register long a7 __asm__("a7") = n;
    1dbc:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1dc0:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1dc4:	2501                	sext.w	a0,a0
    1dc6:	8082                	ret

0000000000001dc8 <sleep>:

int sleep(unsigned long long time)
{
    1dc8:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1dca:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1dcc:	850a                	mv	a0,sp
    1dce:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1dd0:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1dd4:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dd6:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1dda:	e501                	bnez	a0,1de2 <sleep+0x1a>
    return 0;
    1ddc:	4501                	li	a0,0
}
    1dde:	0141                	add	sp,sp,16
    1de0:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1de2:	4502                	lw	a0,0(sp)
}
    1de4:	0141                	add	sp,sp,16
    1de6:	8082                	ret

0000000000001de8 <set_priority>:
    register long a7 __asm__("a7") = n;
    1de8:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1dec:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1df0:	2501                	sext.w	a0,a0
    1df2:	8082                	ret

0000000000001df4 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1df4:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1df8:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1dfc:	8082                	ret

0000000000001dfe <munmap>:
    register long a7 __asm__("a7") = n;
    1dfe:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e02:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e06:	2501                	sext.w	a0,a0
    1e08:	8082                	ret

0000000000001e0a <wait>:

int wait(int *code)
{
    1e0a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e0c:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e10:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e12:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e14:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e16:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e1a:	2501                	sext.w	a0,a0
    1e1c:	8082                	ret

0000000000001e1e <spawn>:
    register long a7 __asm__("a7") = n;
    1e1e:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e22:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e26:	2501                	sext.w	a0,a0
    1e28:	8082                	ret

0000000000001e2a <mailread>:
    register long a7 __asm__("a7") = n;
    1e2a:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e2e:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e32:	2501                	sext.w	a0,a0
    1e34:	8082                	ret

0000000000001e36 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e36:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e3a:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e3e:	2501                	sext.w	a0,a0
    1e40:	8082                	ret

0000000000001e42 <fstat>:
    register long a7 __asm__("a7") = n;
    1e42:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e46:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e4a:	2501                	sext.w	a0,a0
    1e4c:	8082                	ret

0000000000001e4e <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e4e:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e50:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e54:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e56:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e5a:	2501                	sext.w	a0,a0
    1e5c:	8082                	ret

0000000000001e5e <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e5e:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e60:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e64:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e66:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e6a:	2501                	sext.w	a0,a0
    1e6c:	8082                	ret

0000000000001e6e <link>:

int link(char *old_path, char *new_path)
{
    1e6e:	87aa                	mv	a5,a0
    1e70:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e72:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e76:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e7a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e7c:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e80:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e82:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e86:	2501                	sext.w	a0,a0
    1e88:	8082                	ret

0000000000001e8a <unlink>:

int unlink(char *path)
{
    1e8a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e8c:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e90:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e94:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e96:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e9a:	2501                	sext.w	a0,a0
    1e9c:	8082                	ret

0000000000001e9e <uname>:
    register long a7 __asm__("a7") = n;
    1e9e:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1ea2:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1ea6:	2501                	sext.w	a0,a0
    1ea8:	8082                	ret

0000000000001eaa <brk>:
    register long a7 __asm__("a7") = n;
    1eaa:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1eae:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1eb2:	2501                	sext.w	a0,a0
    1eb4:	8082                	ret

0000000000001eb6 <getcwd>:
    register long a7 __asm__("a7") = n;
    1eb6:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb8:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1ebc:	8082                	ret

0000000000001ebe <chdir>:
    register long a7 __asm__("a7") = n;
    1ebe:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1ec2:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1ec6:	2501                	sext.w	a0,a0
    1ec8:	8082                	ret

0000000000001eca <mkdir>:

int mkdir(const char *path, mode_t mode){
    1eca:	862e                	mv	a2,a1
    1ecc:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1ece:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ed0:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1ed4:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ed8:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1eda:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1edc:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1ee0:	2501                	sext.w	a0,a0
    1ee2:	8082                	ret

0000000000001ee4 <getdents>:
    register long a7 __asm__("a7") = n;
    1ee4:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ee8:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1eec:	2501                	sext.w	a0,a0
    1eee:	8082                	ret

0000000000001ef0 <pipe>:
    register long a7 __asm__("a7") = n;
    1ef0:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1ef4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ef6:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1efa:	2501                	sext.w	a0,a0
    1efc:	8082                	ret

0000000000001efe <dup>:
    register long a7 __asm__("a7") = n;
    1efe:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f00:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f04:	2501                	sext.w	a0,a0
    1f06:	8082                	ret

0000000000001f08 <dup2>:
    register long a7 __asm__("a7") = n;
    1f08:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f0a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f0c:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f10:	2501                	sext.w	a0,a0
    1f12:	8082                	ret

0000000000001f14 <mount>:
    register long a7 __asm__("a7") = n;
    1f14:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f18:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f1c:	2501                	sext.w	a0,a0
    1f1e:	8082                	ret

0000000000001f20 <umount>:
    register long a7 __asm__("a7") = n;
    1f20:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f24:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f26:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f2a:	2501                	sext.w	a0,a0
    1f2c:	8082                	ret

0000000000001f2e <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f2e:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1f30:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f32:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f34:	8532                	mv	a0,a2
	mv a2, a4
    1f36:	863a                	mv	a2,a4
	mv a3, a5
    1f38:	86be                	mv	a3,a5
	mv a4, a6
    1f3a:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f3c:	0dc00893          	li	a7,220
	ecall
    1f40:	00000073          	ecall

	beqz a0, 1f
    1f44:	c111                	beqz	a0,1f48 <__clone+0x1a>
	# Parent
	ret
    1f46:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f48:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f4a:	6522                	ld	a0,8(sp)
	jalr a1
    1f4c:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f4e:	05d00893          	li	a7,93
	ecall
    1f52:	00000073          	ecall
