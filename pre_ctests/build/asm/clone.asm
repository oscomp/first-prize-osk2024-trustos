
/root/oskernel2024-trustos/pre_ctests/build/riscv64/clone:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a0f5                	j	10ee <__start_main>

0000000000001004 <child_func>:
#include "unistd.h"

size_t stack[1024] = {0};
static int child_pid;

static int child_func(void){
    1004:	1141                	add	sp,sp,-16
    printf("  Child says successfully!\n");
    1006:	00001517          	auipc	a0,0x1
    100a:	f3250513          	add	a0,a0,-206 # 1f38 <__clone+0x28>
static int child_func(void){
    100e:	e406                	sd	ra,8(sp)
    printf("  Child says successfully!\n");
    1010:	338000ef          	jal	1348 <printf>
    return 0;
}
    1014:	60a2                	ld	ra,8(sp)
    1016:	4501                	li	a0,0
    1018:	0141                	add	sp,sp,16
    101a:	8082                	ret

000000000000101c <test_clone>:

void test_clone(void){
    101c:	1101                	add	sp,sp,-32
    TEST_START(__func__);
    101e:	00001517          	auipc	a0,0x1
    1022:	f3a50513          	add	a0,a0,-198 # 1f58 <__clone+0x48>
void test_clone(void){
    1026:	ec06                	sd	ra,24(sp)
    1028:	e822                	sd	s0,16(sp)
    TEST_START(__func__);
    102a:	2fc000ef          	jal	1326 <puts>
    102e:	00003517          	auipc	a0,0x3
    1032:	fd250513          	add	a0,a0,-46 # 4000 <__func__.0>
    1036:	2f0000ef          	jal	1326 <puts>
    103a:	00001517          	auipc	a0,0x1
    103e:	f3650513          	add	a0,a0,-202 # 1f70 <__clone+0x60>
    1042:	2e4000ef          	jal	1326 <puts>
    int wstatus;
    child_pid = clone(child_func, NULL, stack, 1024, SIGCHLD);
    1046:	4745                	li	a4,17
    1048:	40000693          	li	a3,1024
    104c:	00001617          	auipc	a2,0x1
    1050:	fac60613          	add	a2,a2,-84 # 1ff8 <stack>
    1054:	4581                	li	a1,0
    1056:	00000517          	auipc	a0,0x0
    105a:	fae50513          	add	a0,a0,-82 # 1004 <child_func>
    105e:	4b9000ef          	jal	1d16 <clone>
    1062:	00003417          	auipc	s0,0x3
    1066:	f9640413          	add	s0,s0,-106 # 3ff8 <child_pid>
    106a:	c008                	sw	a0,0(s0)
    assert(child_pid != -1);
    106c:	57fd                	li	a5,-1
    106e:	04f50863          	beq	a0,a5,10be <test_clone+0xa2>
    if (child_pid == 0){
    1072:	e90d                	bnez	a0,10a4 <test_clone+0x88>
	exit(0);
    1074:	4b5000ef          	jal	1d28 <exit>
	    printf("clone process successfully.\npid:%d\n", child_pid);
	else
	    printf("clone process error.\n");
    }

    TEST_END(__func__);
    1078:	00001517          	auipc	a0,0x1
    107c:	f6850513          	add	a0,a0,-152 # 1fe0 <__clone+0xd0>
    1080:	2a6000ef          	jal	1326 <puts>
    1084:	00003517          	auipc	a0,0x3
    1088:	f7c50513          	add	a0,a0,-132 # 4000 <__func__.0>
    108c:	29a000ef          	jal	1326 <puts>
    1090:	00001517          	auipc	a0,0x1
    1094:	ee050513          	add	a0,a0,-288 # 1f70 <__clone+0x60>
    1098:	28e000ef          	jal	1326 <puts>
}
    109c:	60e2                	ld	ra,24(sp)
    109e:	6442                	ld	s0,16(sp)
    10a0:	6105                	add	sp,sp,32
    10a2:	8082                	ret
	if(wait(&wstatus) == child_pid)
    10a4:	0068                	add	a0,sp,12
    10a6:	547000ef          	jal	1dec <wait>
    10aa:	401c                	lw	a5,0(s0)
    10ac:	02f50163          	beq	a0,a5,10ce <test_clone+0xb2>
	    printf("clone process error.\n");
    10b0:	00001517          	auipc	a0,0x1
    10b4:	f1850513          	add	a0,a0,-232 # 1fc8 <__clone+0xb8>
    10b8:	290000ef          	jal	1348 <printf>
    10bc:	bf75                	j	1078 <test_clone+0x5c>
    assert(child_pid != -1);
    10be:	00001517          	auipc	a0,0x1
    10c2:	ec250513          	add	a0,a0,-318 # 1f80 <__clone+0x70>
    10c6:	500000ef          	jal	15c6 <panic>
    if (child_pid == 0){
    10ca:	4008                	lw	a0,0(s0)
    10cc:	b75d                	j	1072 <test_clone+0x56>
	    printf("clone process successfully.\npid:%d\n", child_pid);
    10ce:	85aa                	mv	a1,a0
    10d0:	00001517          	auipc	a0,0x1
    10d4:	ed050513          	add	a0,a0,-304 # 1fa0 <__clone+0x90>
    10d8:	270000ef          	jal	1348 <printf>
    10dc:	bf71                	j	1078 <test_clone+0x5c>

00000000000010de <main>:

int main(void){
    10de:	1141                	add	sp,sp,-16
    10e0:	e406                	sd	ra,8(sp)
    test_clone();
    10e2:	f3bff0ef          	jal	101c <test_clone>
    return 0;
}
    10e6:	60a2                	ld	ra,8(sp)
    10e8:	4501                	li	a0,0
    10ea:	0141                	add	sp,sp,16
    10ec:	8082                	ret

00000000000010ee <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10ee:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10f0:	4108                	lw	a0,0(a0)
{
    10f2:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10f4:	05a1                	add	a1,a1,8
{
    10f6:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10f8:	fe7ff0ef          	jal	10de <main>
    10fc:	42d000ef          	jal	1d28 <exit>
	return 0;
}
    1100:	60a2                	ld	ra,8(sp)
    1102:	4501                	li	a0,0
    1104:	0141                	add	sp,sp,16
    1106:	8082                	ret

0000000000001108 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1108:	7179                	add	sp,sp,-48
    110a:	f406                	sd	ra,40(sp)
    110c:	0005081b          	sext.w	a6,a0
    1110:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1112:	00055563          	bgez	a0,111c <printint.constprop.0+0x14>
        x = -xx;
    1116:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    111a:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    111c:	02b8763b          	remuw	a2,a6,a1
    1120:	00003697          	auipc	a3,0x3
    1124:	ef068693          	add	a3,a3,-272 # 4010 <digits>
    buf[16] = 0;
    1128:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    112c:	0005871b          	sext.w	a4,a1
    1130:	1602                	sll	a2,a2,0x20
    1132:	9201                	srl	a2,a2,0x20
    1134:	9636                	add	a2,a2,a3
    1136:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    113a:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    113e:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1142:	10b86c63          	bltu	a6,a1,125a <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    1146:	02e5763b          	remuw	a2,a0,a4
    114a:	1602                	sll	a2,a2,0x20
    114c:	9201                	srl	a2,a2,0x20
    114e:	9636                	add	a2,a2,a3
    1150:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1154:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1158:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    115c:	10e56863          	bltu	a0,a4,126c <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    1160:	02e5f63b          	remuw	a2,a1,a4
    1164:	1602                	sll	a2,a2,0x20
    1166:	9201                	srl	a2,a2,0x20
    1168:	9636                	add	a2,a2,a3
    116a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    116e:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1172:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1176:	10e5e463          	bltu	a1,a4,127e <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    117a:	02e5763b          	remuw	a2,a0,a4
    117e:	1602                	sll	a2,a2,0x20
    1180:	9201                	srl	a2,a2,0x20
    1182:	9636                	add	a2,a2,a3
    1184:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1188:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    118c:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1190:	10e56063          	bltu	a0,a4,1290 <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    1194:	02e5f63b          	remuw	a2,a1,a4
    1198:	1602                	sll	a2,a2,0x20
    119a:	9201                	srl	a2,a2,0x20
    119c:	9636                	add	a2,a2,a3
    119e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a2:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11a6:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    11aa:	0ee5ec63          	bltu	a1,a4,12a2 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11ae:	02e5763b          	remuw	a2,a0,a4
    11b2:	1602                	sll	a2,a2,0x20
    11b4:	9201                	srl	a2,a2,0x20
    11b6:	9636                	add	a2,a2,a3
    11b8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11bc:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11c0:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11c4:	08e56263          	bltu	a0,a4,1248 <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    11c8:	02e5f63b          	remuw	a2,a1,a4
    11cc:	1602                	sll	a2,a2,0x20
    11ce:	9201                	srl	a2,a2,0x20
    11d0:	9636                	add	a2,a2,a3
    11d2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11d6:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11da:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11de:	0ce5eb63          	bltu	a1,a4,12b4 <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    11e2:	02e5763b          	remuw	a2,a0,a4
    11e6:	1602                	sll	a2,a2,0x20
    11e8:	9201                	srl	a2,a2,0x20
    11ea:	9636                	add	a2,a2,a3
    11ec:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11f0:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11f4:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11f8:	0ce56763          	bltu	a0,a4,12c6 <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    11fc:	02e5f63b          	remuw	a2,a1,a4
    1200:	1602                	sll	a2,a2,0x20
    1202:	9201                	srl	a2,a2,0x20
    1204:	9636                	add	a2,a2,a3
    1206:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    120a:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    120e:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    1212:	0ce5e363          	bltu	a1,a4,12d8 <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    1216:	1782                	sll	a5,a5,0x20
    1218:	9381                	srl	a5,a5,0x20
    121a:	96be                	add	a3,a3,a5
    121c:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    1220:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    1222:	00f10723          	sb	a5,14(sp)
    if (sign)
    1226:	00088763          	beqz	a7,1234 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    122a:	02d00793          	li	a5,45
    122e:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1232:	4595                	li	a1,5
    write(f, s, l);
    1234:	003c                	add	a5,sp,8
    1236:	4641                	li	a2,16
    1238:	9e0d                	subw	a2,a2,a1
    123a:	4505                	li	a0,1
    123c:	95be                	add	a1,a1,a5
    123e:	29b000ef          	jal	1cd8 <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1242:	70a2                	ld	ra,40(sp)
    1244:	6145                	add	sp,sp,48
    1246:	8082                	ret
    i++;
    1248:	45a9                	li	a1,10
    if (sign)
    124a:	fe0885e3          	beqz	a7,1234 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    124e:	02d00793          	li	a5,45
    1252:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1256:	45a5                	li	a1,9
    1258:	bff1                	j	1234 <printint.constprop.0+0x12c>
    i++;
    125a:	45bd                	li	a1,15
    if (sign)
    125c:	fc088ce3          	beqz	a7,1234 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1260:	02d00793          	li	a5,45
    1264:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1268:	45b9                	li	a1,14
    126a:	b7e9                	j	1234 <printint.constprop.0+0x12c>
    i++;
    126c:	45b9                	li	a1,14
    if (sign)
    126e:	fc0883e3          	beqz	a7,1234 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1272:	02d00793          	li	a5,45
    1276:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    127a:	45b5                	li	a1,13
    127c:	bf65                	j	1234 <printint.constprop.0+0x12c>
    i++;
    127e:	45b5                	li	a1,13
    if (sign)
    1280:	fa088ae3          	beqz	a7,1234 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1284:	02d00793          	li	a5,45
    1288:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    128c:	45b1                	li	a1,12
    128e:	b75d                	j	1234 <printint.constprop.0+0x12c>
    i++;
    1290:	45b1                	li	a1,12
    if (sign)
    1292:	fa0881e3          	beqz	a7,1234 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1296:	02d00793          	li	a5,45
    129a:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    129e:	45ad                	li	a1,11
    12a0:	bf51                	j	1234 <printint.constprop.0+0x12c>
    i++;
    12a2:	45ad                	li	a1,11
    if (sign)
    12a4:	f80888e3          	beqz	a7,1234 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12a8:	02d00793          	li	a5,45
    12ac:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12b0:	45a9                	li	a1,10
    12b2:	b749                	j	1234 <printint.constprop.0+0x12c>
    i++;
    12b4:	45a5                	li	a1,9
    if (sign)
    12b6:	f6088fe3          	beqz	a7,1234 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12ba:	02d00793          	li	a5,45
    12be:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12c2:	45a1                	li	a1,8
    12c4:	bf85                	j	1234 <printint.constprop.0+0x12c>
    i++;
    12c6:	45a1                	li	a1,8
    if (sign)
    12c8:	f60886e3          	beqz	a7,1234 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12cc:	02d00793          	li	a5,45
    12d0:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12d4:	459d                	li	a1,7
    12d6:	bfb9                	j	1234 <printint.constprop.0+0x12c>
    i++;
    12d8:	459d                	li	a1,7
    if (sign)
    12da:	f4088de3          	beqz	a7,1234 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12de:	02d00793          	li	a5,45
    12e2:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12e6:	4599                	li	a1,6
    12e8:	b7b1                	j	1234 <printint.constprop.0+0x12c>

00000000000012ea <getchar>:
{
    12ea:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12ec:	00f10593          	add	a1,sp,15
    12f0:	4605                	li	a2,1
    12f2:	4501                	li	a0,0
{
    12f4:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12f6:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12fa:	1d5000ef          	jal	1cce <read>
}
    12fe:	60e2                	ld	ra,24(sp)
    1300:	00f14503          	lbu	a0,15(sp)
    1304:	6105                	add	sp,sp,32
    1306:	8082                	ret

0000000000001308 <putchar>:
{
    1308:	1101                	add	sp,sp,-32
    130a:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    130c:	00f10593          	add	a1,sp,15
    1310:	4605                	li	a2,1
    1312:	4505                	li	a0,1
{
    1314:	ec06                	sd	ra,24(sp)
    char byte = c;
    1316:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    131a:	1bf000ef          	jal	1cd8 <write>
}
    131e:	60e2                	ld	ra,24(sp)
    1320:	2501                	sext.w	a0,a0
    1322:	6105                	add	sp,sp,32
    1324:	8082                	ret

0000000000001326 <puts>:
{
    1326:	1141                	add	sp,sp,-16
    1328:	e406                	sd	ra,8(sp)
    132a:	e022                	sd	s0,0(sp)
    132c:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    132e:	56c000ef          	jal	189a <strlen>
    1332:	862a                	mv	a2,a0
    1334:	85a2                	mv	a1,s0
    1336:	4505                	li	a0,1
    1338:	1a1000ef          	jal	1cd8 <write>
}
    133c:	60a2                	ld	ra,8(sp)
    133e:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1340:	957d                	sra	a0,a0,0x3f
    return r;
    1342:	2501                	sext.w	a0,a0
}
    1344:	0141                	add	sp,sp,16
    1346:	8082                	ret

0000000000001348 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1348:	7131                	add	sp,sp,-192
    134a:	e4d6                	sd	s5,72(sp)
    134c:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    134e:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1350:	013c                	add	a5,sp,136
{
    1352:	f0ca                	sd	s2,96(sp)
    1354:	ecce                	sd	s3,88(sp)
    1356:	e8d2                	sd	s4,80(sp)
    1358:	e0da                	sd	s6,64(sp)
    135a:	fc5e                	sd	s7,56(sp)
    135c:	fc86                	sd	ra,120(sp)
    135e:	f8a2                	sd	s0,112(sp)
    1360:	f4a6                	sd	s1,104(sp)
    1362:	e52e                	sd	a1,136(sp)
    1364:	e932                	sd	a2,144(sp)
    1366:	ed36                	sd	a3,152(sp)
    1368:	f13a                	sd	a4,160(sp)
    136a:	f942                	sd	a6,176(sp)
    136c:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    136e:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1370:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1374:	07300a13          	li	s4,115
    1378:	07800b93          	li	s7,120
    137c:	06400b13          	li	s6,100
    buf[i++] = '0';
    1380:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x3820>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1384:	00003997          	auipc	s3,0x3
    1388:	c8c98993          	add	s3,s3,-884 # 4010 <digits>
        if (!*s)
    138c:	00054783          	lbu	a5,0(a0)
    1390:	16078863          	beqz	a5,1500 <printf+0x1b8>
    1394:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1396:	19278063          	beq	a5,s2,1516 <printf+0x1ce>
    139a:	00164783          	lbu	a5,1(a2)
    139e:	0605                	add	a2,a2,1
    13a0:	fbfd                	bnez	a5,1396 <printf+0x4e>
    13a2:	84b2                	mv	s1,a2
        l = z - a;
    13a4:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13a8:	85aa                	mv	a1,a0
    13aa:	8622                	mv	a2,s0
    13ac:	4505                	li	a0,1
    13ae:	12b000ef          	jal	1cd8 <write>
        if (l)
    13b2:	18041763          	bnez	s0,1540 <printf+0x1f8>
        if (s[1] == 0)
    13b6:	0014c783          	lbu	a5,1(s1)
    13ba:	14078363          	beqz	a5,1500 <printf+0x1b8>
        switch (s[1])
    13be:	19478f63          	beq	a5,s4,155c <printf+0x214>
    13c2:	18fa6163          	bltu	s4,a5,1544 <printf+0x1fc>
    13c6:	1b678e63          	beq	a5,s6,1582 <printf+0x23a>
    13ca:	07000713          	li	a4,112
    13ce:	1ce79463          	bne	a5,a4,1596 <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13d2:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13d4:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13d8:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13da:	631c                	ld	a5,0(a4)
    13dc:	0721                	add	a4,a4,8
    13de:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13e0:	00479293          	sll	t0,a5,0x4
    13e4:	00879f93          	sll	t6,a5,0x8
    13e8:	00c79f13          	sll	t5,a5,0xc
    13ec:	01079e93          	sll	t4,a5,0x10
    13f0:	01479e13          	sll	t3,a5,0x14
    13f4:	01879313          	sll	t1,a5,0x18
    13f8:	01c79893          	sll	a7,a5,0x1c
    13fc:	02479813          	sll	a6,a5,0x24
    1400:	02879513          	sll	a0,a5,0x28
    1404:	02c79593          	sll	a1,a5,0x2c
    1408:	03079693          	sll	a3,a5,0x30
    140c:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1410:	03c7d413          	srl	s0,a5,0x3c
    1414:	01c7d39b          	srlw	t2,a5,0x1c
    1418:	03c2d293          	srl	t0,t0,0x3c
    141c:	03cfdf93          	srl	t6,t6,0x3c
    1420:	03cf5f13          	srl	t5,t5,0x3c
    1424:	03cede93          	srl	t4,t4,0x3c
    1428:	03ce5e13          	srl	t3,t3,0x3c
    142c:	03c35313          	srl	t1,t1,0x3c
    1430:	03c8d893          	srl	a7,a7,0x3c
    1434:	03c85813          	srl	a6,a6,0x3c
    1438:	9171                	srl	a0,a0,0x3c
    143a:	91f1                	srl	a1,a1,0x3c
    143c:	92f1                	srl	a3,a3,0x3c
    143e:	9371                	srl	a4,a4,0x3c
    1440:	974e                	add	a4,a4,s3
    1442:	944e                	add	s0,s0,s3
    1444:	92ce                	add	t0,t0,s3
    1446:	9fce                	add	t6,t6,s3
    1448:	9f4e                	add	t5,t5,s3
    144a:	9ece                	add	t4,t4,s3
    144c:	9e4e                	add	t3,t3,s3
    144e:	934e                	add	t1,t1,s3
    1450:	98ce                	add	a7,a7,s3
    1452:	93ce                	add	t2,t2,s3
    1454:	984e                	add	a6,a6,s3
    1456:	954e                	add	a0,a0,s3
    1458:	95ce                	add	a1,a1,s3
    145a:	96ce                	add	a3,a3,s3
    145c:	00074083          	lbu	ra,0(a4)
    1460:	0002c283          	lbu	t0,0(t0)
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
    148c:	0006c683          	lbu	a3,0(a3)
    1490:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1494:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1498:	9371                	srl	a4,a4,0x3c
    149a:	8bbd                	and	a5,a5,15
    149c:	974e                	add	a4,a4,s3
    149e:	97ce                	add	a5,a5,s3
    14a0:	005105a3          	sb	t0,11(sp)
    14a4:	01f10623          	sb	t6,12(sp)
    14a8:	01e106a3          	sb	t5,13(sp)
    14ac:	01d10723          	sb	t4,14(sp)
    14b0:	01c107a3          	sb	t3,15(sp)
    14b4:	00610823          	sb	t1,16(sp)
    14b8:	011108a3          	sb	a7,17(sp)
    14bc:	00710923          	sb	t2,18(sp)
    14c0:	010109a3          	sb	a6,19(sp)
    14c4:	00a10a23          	sb	a0,20(sp)
    14c8:	00b10aa3          	sb	a1,21(sp)
    14cc:	00d10b23          	sb	a3,22(sp)
    14d0:	00110ba3          	sb	ra,23(sp)
    14d4:	00810523          	sb	s0,10(sp)
    14d8:	00074703          	lbu	a4,0(a4)
    14dc:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14e0:	002c                	add	a1,sp,8
    14e2:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14e4:	00e10c23          	sb	a4,24(sp)
    14e8:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14ec:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14f0:	7e8000ef          	jal	1cd8 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14f4:	00248513          	add	a0,s1,2
        if (!*s)
    14f8:	00054783          	lbu	a5,0(a0)
    14fc:	e8079ce3          	bnez	a5,1394 <printf+0x4c>
    }
    va_end(ap);
}
    1500:	70e6                	ld	ra,120(sp)
    1502:	7446                	ld	s0,112(sp)
    1504:	74a6                	ld	s1,104(sp)
    1506:	7906                	ld	s2,96(sp)
    1508:	69e6                	ld	s3,88(sp)
    150a:	6a46                	ld	s4,80(sp)
    150c:	6aa6                	ld	s5,72(sp)
    150e:	6b06                	ld	s6,64(sp)
    1510:	7be2                	ld	s7,56(sp)
    1512:	6129                	add	sp,sp,192
    1514:	8082                	ret
    1516:	84b2                	mv	s1,a2
    1518:	a039                	j	1526 <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    151a:	0024c783          	lbu	a5,2(s1)
    151e:	0605                	add	a2,a2,1
    1520:	0489                	add	s1,s1,2
    1522:	e92791e3          	bne	a5,s2,13a4 <printf+0x5c>
    1526:	0014c783          	lbu	a5,1(s1)
    152a:	ff2788e3          	beq	a5,s2,151a <printf+0x1d2>
        l = z - a;
    152e:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1532:	85aa                	mv	a1,a0
    1534:	8622                	mv	a2,s0
    1536:	4505                	li	a0,1
    1538:	7a0000ef          	jal	1cd8 <write>
        if (l)
    153c:	e6040de3          	beqz	s0,13b6 <printf+0x6e>
    1540:	8526                	mv	a0,s1
    1542:	b5a9                	j	138c <printf+0x44>
        switch (s[1])
    1544:	05779963          	bne	a5,s7,1596 <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    1548:	6782                	ld	a5,0(sp)
    154a:	45c1                	li	a1,16
    154c:	4388                	lw	a0,0(a5)
    154e:	07a1                	add	a5,a5,8
    1550:	e03e                	sd	a5,0(sp)
    1552:	bb7ff0ef          	jal	1108 <printint.constprop.0>
        s += 2;
    1556:	00248513          	add	a0,s1,2
    155a:	bf79                	j	14f8 <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    155c:	6782                	ld	a5,0(sp)
    155e:	6380                	ld	s0,0(a5)
    1560:	07a1                	add	a5,a5,8
    1562:	e03e                	sd	a5,0(sp)
    1564:	cc21                	beqz	s0,15bc <printf+0x274>
            l = strnlen(a, 200);
    1566:	0c800593          	li	a1,200
    156a:	8522                	mv	a0,s0
    156c:	460000ef          	jal	19cc <strnlen>
    write(f, s, l);
    1570:	0005061b          	sext.w	a2,a0
    1574:	85a2                	mv	a1,s0
    1576:	4505                	li	a0,1
    1578:	760000ef          	jal	1cd8 <write>
        s += 2;
    157c:	00248513          	add	a0,s1,2
    1580:	bfa5                	j	14f8 <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    1582:	6782                	ld	a5,0(sp)
    1584:	45a9                	li	a1,10
    1586:	4388                	lw	a0,0(a5)
    1588:	07a1                	add	a5,a5,8
    158a:	e03e                	sd	a5,0(sp)
    158c:	b7dff0ef          	jal	1108 <printint.constprop.0>
        s += 2;
    1590:	00248513          	add	a0,s1,2
    1594:	b795                	j	14f8 <printf+0x1b0>
    return write(stdout, &byte, 1);
    1596:	4605                	li	a2,1
    1598:	002c                	add	a1,sp,8
    159a:	4505                	li	a0,1
    char byte = c;
    159c:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15a0:	738000ef          	jal	1cd8 <write>
    char byte = c;
    15a4:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15a8:	4605                	li	a2,1
    15aa:	002c                	add	a1,sp,8
    15ac:	4505                	li	a0,1
    char byte = c;
    15ae:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15b2:	726000ef          	jal	1cd8 <write>
        s += 2;
    15b6:	00248513          	add	a0,s1,2
    15ba:	bf3d                	j	14f8 <printf+0x1b0>
                a = "(null)";
    15bc:	00001417          	auipc	s0,0x1
    15c0:	a3440413          	add	s0,s0,-1484 # 1ff0 <__clone+0xe0>
    15c4:	b74d                	j	1566 <printf+0x21e>

00000000000015c6 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15c6:	1141                	add	sp,sp,-16
    15c8:	e406                	sd	ra,8(sp)
    puts(m);
    15ca:	d5dff0ef          	jal	1326 <puts>
    exit(-100);
}
    15ce:	60a2                	ld	ra,8(sp)
    exit(-100);
    15d0:	f9c00513          	li	a0,-100
}
    15d4:	0141                	add	sp,sp,16
    exit(-100);
    15d6:	af89                	j	1d28 <exit>

00000000000015d8 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d8:	02000793          	li	a5,32
    15dc:	00f50663          	beq	a0,a5,15e8 <isspace+0x10>
    15e0:	355d                	addw	a0,a0,-9
    15e2:	00553513          	sltiu	a0,a0,5
    15e6:	8082                	ret
    15e8:	4505                	li	a0,1
}
    15ea:	8082                	ret

00000000000015ec <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15ec:	fd05051b          	addw	a0,a0,-48
}
    15f0:	00a53513          	sltiu	a0,a0,10
    15f4:	8082                	ret

00000000000015f6 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15f6:	02000713          	li	a4,32
    15fa:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15fc:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1600:	ff76879b          	addw	a5,a3,-9
    1604:	06e68063          	beq	a3,a4,1664 <atoi+0x6e>
    1608:	0006859b          	sext.w	a1,a3
    160c:	04f67c63          	bgeu	a2,a5,1664 <atoi+0x6e>
        s++;
    switch (*s)
    1610:	02b00793          	li	a5,43
    1614:	06f68563          	beq	a3,a5,167e <atoi+0x88>
    1618:	02d00793          	li	a5,45
    161c:	04f69663          	bne	a3,a5,1668 <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1620:	00154683          	lbu	a3,1(a0)
    1624:	47a5                	li	a5,9
        s++;
    1626:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    162a:	fd06869b          	addw	a3,a3,-48
    162e:	8636                	mv	a2,a3
    while (isdigit(*s))
    1630:	04d7e563          	bltu	a5,a3,167a <atoi+0x84>
        neg = 1;
    1634:	4885                	li	a7,1
    int n = 0, neg = 0;
    1636:	4501                	li	a0,0
    while (isdigit(*s))
    1638:	4825                	li	a6,9
    163a:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    163e:	0025179b          	sllw	a5,a0,0x2
    1642:	9fa9                	addw	a5,a5,a0
    1644:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    1648:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    164c:	85b2                	mv	a1,a2
    164e:	40c7853b          	subw	a0,a5,a2
    1652:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    1654:	8636                	mv	a2,a3
    while (isdigit(*s))
    1656:	fed872e3          	bgeu	a6,a3,163a <atoi+0x44>
    return neg ? n : -n;
    165a:	02089163          	bnez	a7,167c <atoi+0x86>
    165e:	40f5853b          	subw	a0,a1,a5
    1662:	8082                	ret
        s++;
    1664:	0505                	add	a0,a0,1
    1666:	bf59                	j	15fc <atoi+0x6>
    while (isdigit(*s))
    1668:	fd05859b          	addw	a1,a1,-48
    166c:	47a5                	li	a5,9
    166e:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1670:	4881                	li	a7,0
    1672:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    1676:	fcb7f0e3          	bgeu	a5,a1,1636 <atoi+0x40>
    return neg ? n : -n;
    167a:	4501                	li	a0,0
}
    167c:	8082                	ret
    while (isdigit(*s))
    167e:	00154683          	lbu	a3,1(a0)
    1682:	47a5                	li	a5,9
        s++;
    1684:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1688:	fd06869b          	addw	a3,a3,-48
    168c:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    168e:	4881                	li	a7,0
    while (isdigit(*s))
    1690:	fad7f3e3          	bgeu	a5,a3,1636 <atoi+0x40>
    return neg ? n : -n;
    1694:	4501                	li	a0,0
    1696:	8082                	ret

0000000000001698 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1698:	16060f63          	beqz	a2,1816 <memset+0x17e>
    169c:	40a006b3          	neg	a3,a0
    16a0:	0076f793          	and	a5,a3,7
    16a4:	00778813          	add	a6,a5,7
    16a8:	48ad                	li	a7,11
    16aa:	0ff5f713          	zext.b	a4,a1
    16ae:	fff60593          	add	a1,a2,-1
    16b2:	17186363          	bltu	a6,a7,1818 <memset+0x180>
    16b6:	1705eb63          	bltu	a1,a6,182c <memset+0x194>
    16ba:	16078163          	beqz	a5,181c <memset+0x184>
    16be:	00e50023          	sb	a4,0(a0)
    16c2:	0066f593          	and	a1,a3,6
    16c6:	14058e63          	beqz	a1,1822 <memset+0x18a>
    16ca:	00e500a3          	sb	a4,1(a0)
    16ce:	4589                	li	a1,2
    16d0:	00250813          	add	a6,a0,2
    16d4:	04f5f663          	bgeu	a1,a5,1720 <memset+0x88>
    16d8:	00e50123          	sb	a4,2(a0)
    16dc:	8a91                	and	a3,a3,4
    16de:	00350813          	add	a6,a0,3
    16e2:	458d                	li	a1,3
    16e4:	ce95                	beqz	a3,1720 <memset+0x88>
    16e6:	00e501a3          	sb	a4,3(a0)
    16ea:	4691                	li	a3,4
    16ec:	00450813          	add	a6,a0,4
    16f0:	4591                	li	a1,4
    16f2:	02f6f763          	bgeu	a3,a5,1720 <memset+0x88>
    16f6:	00e50223          	sb	a4,4(a0)
    16fa:	4695                	li	a3,5
    16fc:	00550813          	add	a6,a0,5
    1700:	4595                	li	a1,5
    1702:	00d78f63          	beq	a5,a3,1720 <memset+0x88>
    1706:	00e502a3          	sb	a4,5(a0)
    170a:	469d                	li	a3,7
    170c:	00650813          	add	a6,a0,6
    1710:	4599                	li	a1,6
    1712:	00d79763          	bne	a5,a3,1720 <memset+0x88>
    1716:	00750813          	add	a6,a0,7
    171a:	00e50323          	sb	a4,6(a0)
    171e:	459d                	li	a1,7
    1720:	00871693          	sll	a3,a4,0x8
    1724:	01071313          	sll	t1,a4,0x10
    1728:	8ed9                	or	a3,a3,a4
    172a:	01871893          	sll	a7,a4,0x18
    172e:	0066e6b3          	or	a3,a3,t1
    1732:	0116e6b3          	or	a3,a3,a7
    1736:	02071313          	sll	t1,a4,0x20
    173a:	02871893          	sll	a7,a4,0x28
    173e:	0066e6b3          	or	a3,a3,t1
    1742:	40f60e33          	sub	t3,a2,a5
    1746:	03071313          	sll	t1,a4,0x30
    174a:	0116e6b3          	or	a3,a3,a7
    174e:	0066e6b3          	or	a3,a3,t1
    1752:	03871893          	sll	a7,a4,0x38
    1756:	97aa                	add	a5,a5,a0
    1758:	ff8e7313          	and	t1,t3,-8
    175c:	0116e6b3          	or	a3,a3,a7
    1760:	00f308b3          	add	a7,t1,a5
    1764:	e394                	sd	a3,0(a5)
    1766:	07a1                	add	a5,a5,8
    1768:	ff179ee3          	bne	a5,a7,1764 <memset+0xcc>
    176c:	006806b3          	add	a3,a6,t1
    1770:	00b307bb          	addw	a5,t1,a1
    1774:	0bc30b63          	beq	t1,t3,182a <memset+0x192>
    1778:	00e68023          	sb	a4,0(a3)
    177c:	0017859b          	addw	a1,a5,1
    1780:	08c5fb63          	bgeu	a1,a2,1816 <memset+0x17e>
    1784:	00e680a3          	sb	a4,1(a3)
    1788:	0027859b          	addw	a1,a5,2
    178c:	08c5f563          	bgeu	a1,a2,1816 <memset+0x17e>
    1790:	00e68123          	sb	a4,2(a3)
    1794:	0037859b          	addw	a1,a5,3
    1798:	06c5ff63          	bgeu	a1,a2,1816 <memset+0x17e>
    179c:	00e681a3          	sb	a4,3(a3)
    17a0:	0047859b          	addw	a1,a5,4
    17a4:	06c5f963          	bgeu	a1,a2,1816 <memset+0x17e>
    17a8:	00e68223          	sb	a4,4(a3)
    17ac:	0057859b          	addw	a1,a5,5
    17b0:	06c5f363          	bgeu	a1,a2,1816 <memset+0x17e>
    17b4:	00e682a3          	sb	a4,5(a3)
    17b8:	0067859b          	addw	a1,a5,6
    17bc:	04c5fd63          	bgeu	a1,a2,1816 <memset+0x17e>
    17c0:	00e68323          	sb	a4,6(a3)
    17c4:	0077859b          	addw	a1,a5,7
    17c8:	04c5f763          	bgeu	a1,a2,1816 <memset+0x17e>
    17cc:	00e683a3          	sb	a4,7(a3)
    17d0:	0087859b          	addw	a1,a5,8
    17d4:	04c5f163          	bgeu	a1,a2,1816 <memset+0x17e>
    17d8:	00e68423          	sb	a4,8(a3)
    17dc:	0097859b          	addw	a1,a5,9
    17e0:	02c5fb63          	bgeu	a1,a2,1816 <memset+0x17e>
    17e4:	00e684a3          	sb	a4,9(a3)
    17e8:	00a7859b          	addw	a1,a5,10
    17ec:	02c5f563          	bgeu	a1,a2,1816 <memset+0x17e>
    17f0:	00e68523          	sb	a4,10(a3)
    17f4:	00b7859b          	addw	a1,a5,11
    17f8:	00c5ff63          	bgeu	a1,a2,1816 <memset+0x17e>
    17fc:	00e685a3          	sb	a4,11(a3)
    1800:	00c7859b          	addw	a1,a5,12
    1804:	00c5f963          	bgeu	a1,a2,1816 <memset+0x17e>
    1808:	00e68623          	sb	a4,12(a3)
    180c:	27b5                	addw	a5,a5,13
    180e:	00c7f463          	bgeu	a5,a2,1816 <memset+0x17e>
    1812:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    1816:	8082                	ret
    1818:	482d                	li	a6,11
    181a:	bd71                	j	16b6 <memset+0x1e>
    char *p = dest;
    181c:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    181e:	4581                	li	a1,0
    1820:	b701                	j	1720 <memset+0x88>
    1822:	00150813          	add	a6,a0,1
    1826:	4585                	li	a1,1
    1828:	bde5                	j	1720 <memset+0x88>
    182a:	8082                	ret
    char *p = dest;
    182c:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    182e:	4781                	li	a5,0
    1830:	b7a1                	j	1778 <memset+0xe0>

0000000000001832 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1832:	00054783          	lbu	a5,0(a0)
    1836:	0005c703          	lbu	a4,0(a1)
    183a:	00e79863          	bne	a5,a4,184a <strcmp+0x18>
    183e:	0505                	add	a0,a0,1
    1840:	0585                	add	a1,a1,1
    1842:	fbe5                	bnez	a5,1832 <strcmp>
    1844:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1846:	9d19                	subw	a0,a0,a4
    1848:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    184a:	0007851b          	sext.w	a0,a5
    184e:	bfe5                	j	1846 <strcmp+0x14>

0000000000001850 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1850:	ca15                	beqz	a2,1884 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1852:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1856:	167d                	add	a2,a2,-1
    1858:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    185c:	eb99                	bnez	a5,1872 <strncmp+0x22>
    185e:	a815                	j	1892 <strncmp+0x42>
    1860:	00a68e63          	beq	a3,a0,187c <strncmp+0x2c>
    1864:	0505                	add	a0,a0,1
    1866:	00f71b63          	bne	a4,a5,187c <strncmp+0x2c>
    186a:	00054783          	lbu	a5,0(a0)
    186e:	cf89                	beqz	a5,1888 <strncmp+0x38>
    1870:	85b2                	mv	a1,a2
    1872:	0005c703          	lbu	a4,0(a1)
    1876:	00158613          	add	a2,a1,1
    187a:	f37d                	bnez	a4,1860 <strncmp+0x10>
        ;
    return *l - *r;
    187c:	0007851b          	sext.w	a0,a5
    1880:	9d19                	subw	a0,a0,a4
    1882:	8082                	ret
        return 0;
    1884:	4501                	li	a0,0
}
    1886:	8082                	ret
    return *l - *r;
    1888:	0015c703          	lbu	a4,1(a1)
    188c:	4501                	li	a0,0
    188e:	9d19                	subw	a0,a0,a4
    1890:	8082                	ret
    1892:	0005c703          	lbu	a4,0(a1)
    1896:	4501                	li	a0,0
    1898:	b7e5                	j	1880 <strncmp+0x30>

000000000000189a <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    189a:	00757793          	and	a5,a0,7
    189e:	cf89                	beqz	a5,18b8 <strlen+0x1e>
    18a0:	87aa                	mv	a5,a0
    18a2:	a029                	j	18ac <strlen+0x12>
    18a4:	0785                	add	a5,a5,1
    18a6:	0077f713          	and	a4,a5,7
    18aa:	cb01                	beqz	a4,18ba <strlen+0x20>
        if (!*s)
    18ac:	0007c703          	lbu	a4,0(a5)
    18b0:	fb75                	bnez	a4,18a4 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18b2:	40a78533          	sub	a0,a5,a0
}
    18b6:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18b8:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18ba:	feff05b7          	lui	a1,0xfeff0
    18be:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefebeef>
    18c2:	f0101637          	lui	a2,0xf0101
    18c6:	05c2                	sll	a1,a1,0x10
    18c8:	0612                	sll	a2,a2,0x4
    18ca:	6394                	ld	a3,0(a5)
    18cc:	eff58593          	add	a1,a1,-257
    18d0:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00fd0f1>
    18d4:	05c2                	sll	a1,a1,0x10
    18d6:	0642                	sll	a2,a2,0x10
    18d8:	eff58593          	add	a1,a1,-257
    18dc:	10160613          	add	a2,a2,257
    18e0:	00b68733          	add	a4,a3,a1
    18e4:	063e                	sll	a2,a2,0xf
    18e6:	fff6c693          	not	a3,a3
    18ea:	8f75                	and	a4,a4,a3
    18ec:	08060613          	add	a2,a2,128
    18f0:	8f71                	and	a4,a4,a2
    18f2:	eb11                	bnez	a4,1906 <strlen+0x6c>
    18f4:	6794                	ld	a3,8(a5)
    18f6:	07a1                	add	a5,a5,8
    18f8:	00b68733          	add	a4,a3,a1
    18fc:	fff6c693          	not	a3,a3
    1900:	8f75                	and	a4,a4,a3
    1902:	8f71                	and	a4,a4,a2
    1904:	db65                	beqz	a4,18f4 <strlen+0x5a>
    for (; *s; s++)
    1906:	0007c703          	lbu	a4,0(a5)
    190a:	d745                	beqz	a4,18b2 <strlen+0x18>
    190c:	0017c703          	lbu	a4,1(a5)
    1910:	0785                	add	a5,a5,1
    1912:	d345                	beqz	a4,18b2 <strlen+0x18>
    1914:	0017c703          	lbu	a4,1(a5)
    1918:	0785                	add	a5,a5,1
    191a:	fb6d                	bnez	a4,190c <strlen+0x72>
    191c:	bf59                	j	18b2 <strlen+0x18>

000000000000191e <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    191e:	00757713          	and	a4,a0,7
{
    1922:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1924:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1928:	cb19                	beqz	a4,193e <memchr+0x20>
    192a:	ce59                	beqz	a2,19c8 <memchr+0xaa>
    192c:	0007c703          	lbu	a4,0(a5)
    1930:	00b70963          	beq	a4,a1,1942 <memchr+0x24>
    1934:	0785                	add	a5,a5,1
    1936:	0077f713          	and	a4,a5,7
    193a:	167d                	add	a2,a2,-1
    193c:	f77d                	bnez	a4,192a <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    193e:	4501                	li	a0,0
    if (n && *s != c)
    1940:	c649                	beqz	a2,19ca <memchr+0xac>
    1942:	0007c703          	lbu	a4,0(a5)
    1946:	06b70663          	beq	a4,a1,19b2 <memchr+0x94>
        size_t k = ONES * c;
    194a:	01010737          	lui	a4,0x1010
    194e:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100c0f1>
    1952:	0742                	sll	a4,a4,0x10
    1954:	10170713          	add	a4,a4,257
    1958:	0742                	sll	a4,a4,0x10
    195a:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    195e:	469d                	li	a3,7
        size_t k = ONES * c;
    1960:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1964:	04c6f763          	bgeu	a3,a2,19b2 <memchr+0x94>
    1968:	f0101837          	lui	a6,0xf0101
    196c:	feff08b7          	lui	a7,0xfeff0
    1970:	0812                	sll	a6,a6,0x4
    1972:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefebeef>
    1976:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00fd0f1>
    197a:	08c2                	sll	a7,a7,0x10
    197c:	0842                	sll	a6,a6,0x10
    197e:	eff88893          	add	a7,a7,-257
    1982:	10180813          	add	a6,a6,257
    1986:	08c2                	sll	a7,a7,0x10
    1988:	083e                	sll	a6,a6,0xf
    198a:	eff88893          	add	a7,a7,-257
    198e:	08080813          	add	a6,a6,128
    1992:	431d                	li	t1,7
    1994:	a029                	j	199e <memchr+0x80>
    1996:	1661                	add	a2,a2,-8
    1998:	07a1                	add	a5,a5,8
    199a:	02c37663          	bgeu	t1,a2,19c6 <memchr+0xa8>
    199e:	6398                	ld	a4,0(a5)
    19a0:	8f29                	xor	a4,a4,a0
    19a2:	011706b3          	add	a3,a4,a7
    19a6:	fff74713          	not	a4,a4
    19aa:	8f75                	and	a4,a4,a3
    19ac:	01077733          	and	a4,a4,a6
    19b0:	d37d                	beqz	a4,1996 <memchr+0x78>
        s = (const void *)w;
    19b2:	853e                	mv	a0,a5
    19b4:	a019                	j	19ba <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    19b6:	0505                	add	a0,a0,1
    19b8:	ca01                	beqz	a2,19c8 <memchr+0xaa>
    19ba:	00054783          	lbu	a5,0(a0)
    19be:	167d                	add	a2,a2,-1
    19c0:	feb79be3          	bne	a5,a1,19b6 <memchr+0x98>
    19c4:	8082                	ret
    19c6:	f675                	bnez	a2,19b2 <memchr+0x94>
    return n ? (void *)s : 0;
    19c8:	4501                	li	a0,0
}
    19ca:	8082                	ret

00000000000019cc <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19cc:	1101                	add	sp,sp,-32
    19ce:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19d0:	862e                	mv	a2,a1
{
    19d2:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19d4:	4581                	li	a1,0
{
    19d6:	e426                	sd	s1,8(sp)
    19d8:	ec06                	sd	ra,24(sp)
    19da:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19dc:	f43ff0ef          	jal	191e <memchr>
    return p ? p - s : n;
    19e0:	c519                	beqz	a0,19ee <strnlen+0x22>
}
    19e2:	60e2                	ld	ra,24(sp)
    19e4:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19e6:	8d05                	sub	a0,a0,s1
}
    19e8:	64a2                	ld	s1,8(sp)
    19ea:	6105                	add	sp,sp,32
    19ec:	8082                	ret
    19ee:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19f0:	8522                	mv	a0,s0
}
    19f2:	6442                	ld	s0,16(sp)
    19f4:	64a2                	ld	s1,8(sp)
    19f6:	6105                	add	sp,sp,32
    19f8:	8082                	ret

00000000000019fa <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19fa:	00b547b3          	xor	a5,a0,a1
    19fe:	8b9d                	and	a5,a5,7
    1a00:	efb1                	bnez	a5,1a5c <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a02:	0075f793          	and	a5,a1,7
    1a06:	ebb5                	bnez	a5,1a7a <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a08:	feff0637          	lui	a2,0xfeff0
    1a0c:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefebeef>
    1a10:	f01016b7          	lui	a3,0xf0101
    1a14:	0642                	sll	a2,a2,0x10
    1a16:	0692                	sll	a3,a3,0x4
    1a18:	6198                	ld	a4,0(a1)
    1a1a:	eff60613          	add	a2,a2,-257
    1a1e:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00fd0f1>
    1a22:	0642                	sll	a2,a2,0x10
    1a24:	06c2                	sll	a3,a3,0x10
    1a26:	eff60613          	add	a2,a2,-257
    1a2a:	10168693          	add	a3,a3,257
    1a2e:	00c707b3          	add	a5,a4,a2
    1a32:	fff74813          	not	a6,a4
    1a36:	06be                	sll	a3,a3,0xf
    1a38:	0107f7b3          	and	a5,a5,a6
    1a3c:	08068693          	add	a3,a3,128
    1a40:	8ff5                	and	a5,a5,a3
    1a42:	ef89                	bnez	a5,1a5c <strcpy+0x62>
    1a44:	05a1                	add	a1,a1,8
    1a46:	e118                	sd	a4,0(a0)
    1a48:	6198                	ld	a4,0(a1)
    1a4a:	0521                	add	a0,a0,8
    1a4c:	00c707b3          	add	a5,a4,a2
    1a50:	fff74813          	not	a6,a4
    1a54:	0107f7b3          	and	a5,a5,a6
    1a58:	8ff5                	and	a5,a5,a3
    1a5a:	d7ed                	beqz	a5,1a44 <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a5c:	0005c783          	lbu	a5,0(a1)
    1a60:	00f50023          	sb	a5,0(a0)
    1a64:	c785                	beqz	a5,1a8c <strcpy+0x92>
    1a66:	0015c783          	lbu	a5,1(a1)
    1a6a:	0505                	add	a0,a0,1
    1a6c:	0585                	add	a1,a1,1
    1a6e:	00f50023          	sb	a5,0(a0)
    1a72:	fbf5                	bnez	a5,1a66 <strcpy+0x6c>
        ;
    return d;
}
    1a74:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a76:	0505                	add	a0,a0,1
    1a78:	db41                	beqz	a4,1a08 <strcpy+0xe>
            if (!(*d = *s))
    1a7a:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a7e:	0585                	add	a1,a1,1
    1a80:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a84:	00f50023          	sb	a5,0(a0)
    1a88:	f7fd                	bnez	a5,1a76 <strcpy+0x7c>
}
    1a8a:	8082                	ret
    1a8c:	8082                	ret

0000000000001a8e <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a8e:	00b547b3          	xor	a5,a0,a1
    1a92:	8b9d                	and	a5,a5,7
    1a94:	efbd                	bnez	a5,1b12 <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a96:	0075f793          	and	a5,a1,7
    1a9a:	1c078563          	beqz	a5,1c64 <strncpy+0x1d6>
    1a9e:	ea11                	bnez	a2,1ab2 <strncpy+0x24>
    1aa0:	8082                	ret
    1aa2:	0585                	add	a1,a1,1
    1aa4:	0075f793          	and	a5,a1,7
    1aa8:	167d                	add	a2,a2,-1
    1aaa:	0505                	add	a0,a0,1
    1aac:	1a078c63          	beqz	a5,1c64 <strncpy+0x1d6>
    1ab0:	ca3d                	beqz	a2,1b26 <strncpy+0x98>
    1ab2:	0005c783          	lbu	a5,0(a1)
    1ab6:	00f50023          	sb	a5,0(a0)
    1aba:	f7e5                	bnez	a5,1aa2 <strncpy+0x14>
            ;
        if (!n || !*s)
    1abc:	0005c783          	lbu	a5,0(a1)
    1ac0:	c7a5                	beqz	a5,1b28 <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ac2:	479d                	li	a5,7
    1ac4:	04c7f863          	bgeu	a5,a2,1b14 <strncpy+0x86>
    1ac8:	f01016b7          	lui	a3,0xf0101
    1acc:	feff0837          	lui	a6,0xfeff0
    1ad0:	0692                	sll	a3,a3,0x4
    1ad2:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefebeef>
    1ad6:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00fd0f1>
    1ada:	0842                	sll	a6,a6,0x10
    1adc:	06c2                	sll	a3,a3,0x10
    1ade:	eff80813          	add	a6,a6,-257
    1ae2:	10168693          	add	a3,a3,257
    1ae6:	0842                	sll	a6,a6,0x10
    1ae8:	06be                	sll	a3,a3,0xf
    1aea:	eff80813          	add	a6,a6,-257
    1aee:	08068693          	add	a3,a3,128
    1af2:	431d                	li	t1,7
    1af4:	6198                	ld	a4,0(a1)
    1af6:	010707b3          	add	a5,a4,a6
    1afa:	fff74893          	not	a7,a4
    1afe:	0117f7b3          	and	a5,a5,a7
    1b02:	8ff5                	and	a5,a5,a3
    1b04:	eb81                	bnez	a5,1b14 <strncpy+0x86>
            *wd = *ws;
    1b06:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b08:	1661                	add	a2,a2,-8
    1b0a:	05a1                	add	a1,a1,8
    1b0c:	0521                	add	a0,a0,8
    1b0e:	fec363e3          	bltu	t1,a2,1af4 <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b12:	ca11                	beqz	a2,1b26 <strncpy+0x98>
    1b14:	0005c783          	lbu	a5,0(a1)
    1b18:	0585                	add	a1,a1,1
    1b1a:	00f50023          	sb	a5,0(a0)
    1b1e:	c789                	beqz	a5,1b28 <strncpy+0x9a>
    1b20:	167d                	add	a2,a2,-1
    1b22:	0505                	add	a0,a0,1
    1b24:	fa65                	bnez	a2,1b14 <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b26:	8082                	ret
    1b28:	40a00733          	neg	a4,a0
    1b2c:	00777793          	and	a5,a4,7
    1b30:	00778693          	add	a3,a5,7
    1b34:	482d                	li	a6,11
    1b36:	fff60593          	add	a1,a2,-1
    1b3a:	1106ef63          	bltu	a3,a6,1c58 <strncpy+0x1ca>
    1b3e:	12d5ee63          	bltu	a1,a3,1c7a <strncpy+0x1ec>
    1b42:	12078563          	beqz	a5,1c6c <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b46:	00050023          	sb	zero,0(a0)
    1b4a:	00677693          	and	a3,a4,6
    1b4e:	12068263          	beqz	a3,1c72 <strncpy+0x1e4>
    1b52:	000500a3          	sb	zero,1(a0)
    1b56:	4689                	li	a3,2
    1b58:	12f6f463          	bgeu	a3,a5,1c80 <strncpy+0x1f2>
    1b5c:	00050123          	sb	zero,2(a0)
    1b60:	8b11                	and	a4,a4,4
    1b62:	cf6d                	beqz	a4,1c5c <strncpy+0x1ce>
    1b64:	000501a3          	sb	zero,3(a0)
    1b68:	4711                	li	a4,4
    1b6a:	00450693          	add	a3,a0,4
    1b6e:	02f77363          	bgeu	a4,a5,1b94 <strncpy+0x106>
    1b72:	00050223          	sb	zero,4(a0)
    1b76:	4715                	li	a4,5
    1b78:	00550693          	add	a3,a0,5
    1b7c:	00e78c63          	beq	a5,a4,1b94 <strncpy+0x106>
    1b80:	000502a3          	sb	zero,5(a0)
    1b84:	471d                	li	a4,7
    1b86:	10e79163          	bne	a5,a4,1c88 <strncpy+0x1fa>
    1b8a:	00750693          	add	a3,a0,7
    1b8e:	00050323          	sb	zero,6(a0)
    1b92:	471d                	li	a4,7
    1b94:	40f608b3          	sub	a7,a2,a5
    1b98:	ff88f813          	and	a6,a7,-8
    1b9c:	97aa                	add	a5,a5,a0
    1b9e:	010785b3          	add	a1,a5,a6
    1ba2:	0007b023          	sd	zero,0(a5)
    1ba6:	07a1                	add	a5,a5,8
    1ba8:	feb79de3          	bne	a5,a1,1ba2 <strncpy+0x114>
    1bac:	00e807bb          	addw	a5,a6,a4
    1bb0:	01068733          	add	a4,a3,a6
    1bb4:	0b088b63          	beq	a7,a6,1c6a <strncpy+0x1dc>
    1bb8:	00070023          	sb	zero,0(a4)
    1bbc:	0017869b          	addw	a3,a5,1
    1bc0:	f6c6f3e3          	bgeu	a3,a2,1b26 <strncpy+0x98>
    1bc4:	000700a3          	sb	zero,1(a4)
    1bc8:	0027869b          	addw	a3,a5,2
    1bcc:	f4c6fde3          	bgeu	a3,a2,1b26 <strncpy+0x98>
    1bd0:	00070123          	sb	zero,2(a4)
    1bd4:	0037869b          	addw	a3,a5,3
    1bd8:	f4c6f7e3          	bgeu	a3,a2,1b26 <strncpy+0x98>
    1bdc:	000701a3          	sb	zero,3(a4)
    1be0:	0047869b          	addw	a3,a5,4
    1be4:	f4c6f1e3          	bgeu	a3,a2,1b26 <strncpy+0x98>
    1be8:	00070223          	sb	zero,4(a4)
    1bec:	0057869b          	addw	a3,a5,5
    1bf0:	f2c6fbe3          	bgeu	a3,a2,1b26 <strncpy+0x98>
    1bf4:	000702a3          	sb	zero,5(a4)
    1bf8:	0067869b          	addw	a3,a5,6
    1bfc:	f2c6f5e3          	bgeu	a3,a2,1b26 <strncpy+0x98>
    1c00:	00070323          	sb	zero,6(a4)
    1c04:	0077869b          	addw	a3,a5,7
    1c08:	f0c6ffe3          	bgeu	a3,a2,1b26 <strncpy+0x98>
    1c0c:	000703a3          	sb	zero,7(a4)
    1c10:	0087869b          	addw	a3,a5,8
    1c14:	f0c6f9e3          	bgeu	a3,a2,1b26 <strncpy+0x98>
    1c18:	00070423          	sb	zero,8(a4)
    1c1c:	0097869b          	addw	a3,a5,9
    1c20:	f0c6f3e3          	bgeu	a3,a2,1b26 <strncpy+0x98>
    1c24:	000704a3          	sb	zero,9(a4)
    1c28:	00a7869b          	addw	a3,a5,10
    1c2c:	eec6fde3          	bgeu	a3,a2,1b26 <strncpy+0x98>
    1c30:	00070523          	sb	zero,10(a4)
    1c34:	00b7869b          	addw	a3,a5,11
    1c38:	eec6f7e3          	bgeu	a3,a2,1b26 <strncpy+0x98>
    1c3c:	000705a3          	sb	zero,11(a4)
    1c40:	00c7869b          	addw	a3,a5,12
    1c44:	eec6f1e3          	bgeu	a3,a2,1b26 <strncpy+0x98>
    1c48:	00070623          	sb	zero,12(a4)
    1c4c:	27b5                	addw	a5,a5,13
    1c4e:	ecc7fce3          	bgeu	a5,a2,1b26 <strncpy+0x98>
    1c52:	000706a3          	sb	zero,13(a4)
}
    1c56:	8082                	ret
    1c58:	46ad                	li	a3,11
    1c5a:	b5d5                	j	1b3e <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c5c:	00350693          	add	a3,a0,3
    1c60:	470d                	li	a4,3
    1c62:	bf0d                	j	1b94 <strncpy+0x106>
        if (!n || !*s)
    1c64:	e4061ce3          	bnez	a2,1abc <strncpy+0x2e>
}
    1c68:	8082                	ret
    1c6a:	8082                	ret
    char *p = dest;
    1c6c:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c6e:	4701                	li	a4,0
    1c70:	b715                	j	1b94 <strncpy+0x106>
    1c72:	00150693          	add	a3,a0,1
    1c76:	4705                	li	a4,1
    1c78:	bf31                	j	1b94 <strncpy+0x106>
    char *p = dest;
    1c7a:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c7c:	4781                	li	a5,0
    1c7e:	bf2d                	j	1bb8 <strncpy+0x12a>
    1c80:	00250693          	add	a3,a0,2
    1c84:	4709                	li	a4,2
    1c86:	b739                	j	1b94 <strncpy+0x106>
    1c88:	00650693          	add	a3,a0,6
    1c8c:	4719                	li	a4,6
    1c8e:	b719                	j	1b94 <strncpy+0x106>

0000000000001c90 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c90:	87aa                	mv	a5,a0
    1c92:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c94:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c98:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c9c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c9e:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ca0:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1ca4:	2501                	sext.w	a0,a0
    1ca6:	8082                	ret

0000000000001ca8 <openat>:
    register long a7 __asm__("a7") = n;
    1ca8:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1cac:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cb0:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1cb4:	2501                	sext.w	a0,a0
    1cb6:	8082                	ret

0000000000001cb8 <fcntl>:
    register long a7 __asm__("a7") = n;
    1cb8:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cba:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1cbe:	2501                	sext.w	a0,a0
    1cc0:	8082                	ret

0000000000001cc2 <close>:
    register long a7 __asm__("a7") = n;
    1cc2:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1cc6:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1cca:	2501                	sext.w	a0,a0
    1ccc:	8082                	ret

0000000000001cce <read>:
    register long a7 __asm__("a7") = n;
    1cce:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cd2:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1cd6:	8082                	ret

0000000000001cd8 <write>:
    register long a7 __asm__("a7") = n;
    1cd8:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cdc:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1ce0:	8082                	ret

0000000000001ce2 <getpid>:
    register long a7 __asm__("a7") = n;
    1ce2:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1ce6:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1cea:	2501                	sext.w	a0,a0
    1cec:	8082                	ret

0000000000001cee <getppid>:
    register long a7 __asm__("a7") = n;
    1cee:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1cf2:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cf6:	2501                	sext.w	a0,a0
    1cf8:	8082                	ret

0000000000001cfa <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cfa:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cfe:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d02:	2501                	sext.w	a0,a0
    1d04:	8082                	ret

0000000000001d06 <fork>:
    register long a7 __asm__("a7") = n;
    1d06:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d0a:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d0c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d0e:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d12:	2501                	sext.w	a0,a0
    1d14:	8082                	ret

0000000000001d16 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d16:	85b2                	mv	a1,a2
    1d18:	863a                	mv	a2,a4
    if (stack)
    1d1a:	c191                	beqz	a1,1d1e <clone+0x8>
	stack += stack_size;
    1d1c:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d1e:	4781                	li	a5,0
    1d20:	4701                	li	a4,0
    1d22:	4681                	li	a3,0
    1d24:	2601                	sext.w	a2,a2
    1d26:	a2ed                	j	1f10 <__clone>

0000000000001d28 <exit>:
    register long a7 __asm__("a7") = n;
    1d28:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d2c:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d30:	8082                	ret

0000000000001d32 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d32:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d36:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d38:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d3c:	2501                	sext.w	a0,a0
    1d3e:	8082                	ret

0000000000001d40 <exec>:
    register long a7 __asm__("a7") = n;
    1d40:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d44:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d48:	2501                	sext.w	a0,a0
    1d4a:	8082                	ret

0000000000001d4c <execve>:
    register long a7 __asm__("a7") = n;
    1d4c:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d50:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d54:	2501                	sext.w	a0,a0
    1d56:	8082                	ret

0000000000001d58 <times>:
    register long a7 __asm__("a7") = n;
    1d58:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d5c:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d60:	2501                	sext.w	a0,a0
    1d62:	8082                	ret

0000000000001d64 <get_time>:

int64 get_time()
{
    1d64:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d66:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d6a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d6c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d6e:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d72:	2501                	sext.w	a0,a0
    1d74:	ed09                	bnez	a0,1d8e <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d76:	67a2                	ld	a5,8(sp)
    1d78:	3e800713          	li	a4,1000
    1d7c:	00015503          	lhu	a0,0(sp)
    1d80:	02e7d7b3          	divu	a5,a5,a4
    1d84:	02e50533          	mul	a0,a0,a4
    1d88:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d8a:	0141                	add	sp,sp,16
    1d8c:	8082                	ret
        return -1;
    1d8e:	557d                	li	a0,-1
    1d90:	bfed                	j	1d8a <get_time+0x26>

0000000000001d92 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d92:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d96:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d9a:	2501                	sext.w	a0,a0
    1d9c:	8082                	ret

0000000000001d9e <time>:
    register long a7 __asm__("a7") = n;
    1d9e:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1da2:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1da6:	2501                	sext.w	a0,a0
    1da8:	8082                	ret

0000000000001daa <sleep>:

int sleep(unsigned long long time)
{
    1daa:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1dac:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1dae:	850a                	mv	a0,sp
    1db0:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1db2:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1db6:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db8:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1dbc:	e501                	bnez	a0,1dc4 <sleep+0x1a>
    return 0;
    1dbe:	4501                	li	a0,0
}
    1dc0:	0141                	add	sp,sp,16
    1dc2:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1dc4:	4502                	lw	a0,0(sp)
}
    1dc6:	0141                	add	sp,sp,16
    1dc8:	8082                	ret

0000000000001dca <set_priority>:
    register long a7 __asm__("a7") = n;
    1dca:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1dce:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1dd2:	2501                	sext.w	a0,a0
    1dd4:	8082                	ret

0000000000001dd6 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1dd6:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1dda:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1dde:	8082                	ret

0000000000001de0 <munmap>:
    register long a7 __asm__("a7") = n;
    1de0:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1de4:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1de8:	2501                	sext.w	a0,a0
    1dea:	8082                	ret

0000000000001dec <wait>:

int wait(int *code)
{
    1dec:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dee:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1df2:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1df4:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1df6:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1df8:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1dfc:	2501                	sext.w	a0,a0
    1dfe:	8082                	ret

0000000000001e00 <spawn>:
    register long a7 __asm__("a7") = n;
    1e00:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e04:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e08:	2501                	sext.w	a0,a0
    1e0a:	8082                	ret

0000000000001e0c <mailread>:
    register long a7 __asm__("a7") = n;
    1e0c:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e10:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e14:	2501                	sext.w	a0,a0
    1e16:	8082                	ret

0000000000001e18 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e18:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e1c:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e20:	2501                	sext.w	a0,a0
    1e22:	8082                	ret

0000000000001e24 <fstat>:
    register long a7 __asm__("a7") = n;
    1e24:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e28:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e2c:	2501                	sext.w	a0,a0
    1e2e:	8082                	ret

0000000000001e30 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e30:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e32:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e36:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e38:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e3c:	2501                	sext.w	a0,a0
    1e3e:	8082                	ret

0000000000001e40 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e40:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e42:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e46:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e48:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e4c:	2501                	sext.w	a0,a0
    1e4e:	8082                	ret

0000000000001e50 <link>:

int link(char *old_path, char *new_path)
{
    1e50:	87aa                	mv	a5,a0
    1e52:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e54:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e58:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e5c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e5e:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e62:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e64:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e68:	2501                	sext.w	a0,a0
    1e6a:	8082                	ret

0000000000001e6c <unlink>:

int unlink(char *path)
{
    1e6c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e6e:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e72:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e76:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e78:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e7c:	2501                	sext.w	a0,a0
    1e7e:	8082                	ret

0000000000001e80 <uname>:
    register long a7 __asm__("a7") = n;
    1e80:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e84:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e88:	2501                	sext.w	a0,a0
    1e8a:	8082                	ret

0000000000001e8c <brk>:
    register long a7 __asm__("a7") = n;
    1e8c:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e90:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e94:	2501                	sext.w	a0,a0
    1e96:	8082                	ret

0000000000001e98 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e98:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e9a:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e9e:	8082                	ret

0000000000001ea0 <chdir>:
    register long a7 __asm__("a7") = n;
    1ea0:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1ea4:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1ea8:	2501                	sext.w	a0,a0
    1eaa:	8082                	ret

0000000000001eac <mkdir>:

int mkdir(const char *path, mode_t mode){
    1eac:	862e                	mv	a2,a1
    1eae:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1eb0:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1eb2:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1eb6:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1eba:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1ebc:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ebe:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1ec2:	2501                	sext.w	a0,a0
    1ec4:	8082                	ret

0000000000001ec6 <getdents>:
    register long a7 __asm__("a7") = n;
    1ec6:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eca:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1ece:	2501                	sext.w	a0,a0
    1ed0:	8082                	ret

0000000000001ed2 <pipe>:
    register long a7 __asm__("a7") = n;
    1ed2:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1ed6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed8:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1edc:	2501                	sext.w	a0,a0
    1ede:	8082                	ret

0000000000001ee0 <dup>:
    register long a7 __asm__("a7") = n;
    1ee0:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1ee2:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1ee6:	2501                	sext.w	a0,a0
    1ee8:	8082                	ret

0000000000001eea <dup2>:
    register long a7 __asm__("a7") = n;
    1eea:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1eec:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eee:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ef2:	2501                	sext.w	a0,a0
    1ef4:	8082                	ret

0000000000001ef6 <mount>:
    register long a7 __asm__("a7") = n;
    1ef6:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1efa:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1efe:	2501                	sext.w	a0,a0
    1f00:	8082                	ret

0000000000001f02 <umount>:
    register long a7 __asm__("a7") = n;
    1f02:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f06:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f08:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f0c:	2501                	sext.w	a0,a0
    1f0e:	8082                	ret

0000000000001f10 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f10:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1f12:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f14:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f16:	8532                	mv	a0,a2
	mv a2, a4
    1f18:	863a                	mv	a2,a4
	mv a3, a5
    1f1a:	86be                	mv	a3,a5
	mv a4, a6
    1f1c:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f1e:	0dc00893          	li	a7,220
	ecall
    1f22:	00000073          	ecall

	beqz a0, 1f
    1f26:	c111                	beqz	a0,1f2a <__clone+0x1a>
	# Parent
	ret
    1f28:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f2a:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f2c:	6522                	ld	a0,8(sp)
	jalr a1
    1f2e:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f30:	05d00893          	li	a7,93
	ecall
    1f34:	00000073          	ecall
