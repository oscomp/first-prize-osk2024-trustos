
/home/windflower/Desktop/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/yield:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a86d                	j	10bc <__start_main>

0000000000001004 <test_yield>:

/*
理想结果：三个子进程交替输出
*/

int test_yield(){
    1004:	7179                	add	sp,sp,-48
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	eea50513          	add	a0,a0,-278 # 1ef0 <__clone+0x2e>
int test_yield(){
    100e:	f406                	sd	ra,40(sp)
    1010:	f022                	sd	s0,32(sp)
    1012:	e44e                	sd	s3,8(sp)
    1014:	ec26                	sd	s1,24(sp)
    1016:	e84a                	sd	s2,16(sp)
    TEST_START(__func__);
    1018:	2dc000ef          	jal	12f4 <puts>
    101c:	00001517          	auipc	a0,0x1
    1020:	f4450513          	add	a0,a0,-188 # 1f60 <__func__.0>
    1024:	2d0000ef          	jal	12f4 <puts>
    1028:	00001517          	auipc	a0,0x1
    102c:	ee050513          	add	a0,a0,-288 # 1f08 <__clone+0x46>
    1030:	2c4000ef          	jal	12f4 <puts>

    for (int i = 0; i < 3; ++i){
    1034:	4401                	li	s0,0
    1036:	498d                	li	s3,3
        if(fork() == 0){
    1038:	481000ef          	jal	1cb8 <fork>
    103c:	c521                	beqz	a0,1084 <test_yield+0x80>
    for (int i = 0; i < 3; ++i){
    103e:	2405                	addw	s0,s0,1
    1040:	ff341ce3          	bne	s0,s3,1038 <test_yield+0x34>
                printf("  I am child process: %d. iteration %d.\n", getpid(), i);
	    }
	    exit(0);
        }
    }
    wait(NULL);
    1044:	4501                	li	a0,0
    1046:	559000ef          	jal	1d9e <wait>
    wait(NULL);
    104a:	4501                	li	a0,0
    104c:	553000ef          	jal	1d9e <wait>
    wait(NULL);
    1050:	4501                	li	a0,0
    1052:	54d000ef          	jal	1d9e <wait>
    TEST_END(__func__);
    1056:	00001517          	auipc	a0,0x1
    105a:	ef250513          	add	a0,a0,-270 # 1f48 <__clone+0x86>
    105e:	296000ef          	jal	12f4 <puts>
    1062:	00001517          	auipc	a0,0x1
    1066:	efe50513          	add	a0,a0,-258 # 1f60 <__func__.0>
    106a:	28a000ef          	jal	12f4 <puts>
}
    106e:	7402                	ld	s0,32(sp)
    1070:	70a2                	ld	ra,40(sp)
    1072:	64e2                	ld	s1,24(sp)
    1074:	6942                	ld	s2,16(sp)
    1076:	69a2                	ld	s3,8(sp)
    TEST_END(__func__);
    1078:	00001517          	auipc	a0,0x1
    107c:	e9050513          	add	a0,a0,-368 # 1f08 <__clone+0x46>
}
    1080:	6145                	add	sp,sp,48
    TEST_END(__func__);
    1082:	ac8d                	j	12f4 <puts>
    1084:	4495                	li	s1,5
                printf("  I am child process: %d. iteration %d.\n", getpid(), i);
    1086:	00001917          	auipc	s2,0x1
    108a:	e9290913          	add	s2,s2,-366 # 1f18 <__clone+0x56>
                sched_yield();
    108e:	41f000ef          	jal	1cac <sched_yield>
                printf("  I am child process: %d. iteration %d.\n", getpid(), i);
    1092:	403000ef          	jal	1c94 <getpid>
    1096:	85aa                	mv	a1,a0
    1098:	8622                	mv	a2,s0
    109a:	854a                	mv	a0,s2
	    for (int j = 0; j< 5; ++j){
    109c:	34fd                	addw	s1,s1,-1
                printf("  I am child process: %d. iteration %d.\n", getpid(), i);
    109e:	278000ef          	jal	1316 <printf>
	    for (int j = 0; j< 5; ++j){
    10a2:	f4f5                	bnez	s1,108e <test_yield+0x8a>
	    exit(0);
    10a4:	4501                	li	a0,0
    10a6:	435000ef          	jal	1cda <exit>
    10aa:	bf51                	j	103e <test_yield+0x3a>

00000000000010ac <main>:

int main(void) {
    10ac:	1141                	add	sp,sp,-16
    10ae:	e406                	sd	ra,8(sp)
    test_yield();
    10b0:	f55ff0ef          	jal	1004 <test_yield>
    return 0;
}
    10b4:	60a2                	ld	ra,8(sp)
    10b6:	4501                	li	a0,0
    10b8:	0141                	add	sp,sp,16
    10ba:	8082                	ret

00000000000010bc <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10bc:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10be:	4108                	lw	a0,0(a0)
{
    10c0:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10c2:	05a1                	add	a1,a1,8
{
    10c4:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10c6:	fe7ff0ef          	jal	10ac <main>
    10ca:	411000ef          	jal	1cda <exit>
	return 0;
}
    10ce:	60a2                	ld	ra,8(sp)
    10d0:	4501                	li	a0,0
    10d2:	0141                	add	sp,sp,16
    10d4:	8082                	ret

00000000000010d6 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10d6:	7179                	add	sp,sp,-48
    10d8:	f406                	sd	ra,40(sp)
    10da:	0005081b          	sext.w	a6,a0
    10de:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10e0:	00055563          	bgez	a0,10ea <printint.constprop.0+0x14>
        x = -xx;
    10e4:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    10e8:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10ea:	02b8763b          	remuw	a2,a6,a1
    10ee:	00001697          	auipc	a3,0x1
    10f2:	e8268693          	add	a3,a3,-382 # 1f70 <digits>
    buf[16] = 0;
    10f6:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10fa:	0005871b          	sext.w	a4,a1
    10fe:	1602                	sll	a2,a2,0x20
    1100:	9201                	srl	a2,a2,0x20
    1102:	9636                	add	a2,a2,a3
    1104:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1108:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    110c:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1110:	10b86c63          	bltu	a6,a1,1228 <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    1114:	02e5763b          	remuw	a2,a0,a4
    1118:	1602                	sll	a2,a2,0x20
    111a:	9201                	srl	a2,a2,0x20
    111c:	9636                	add	a2,a2,a3
    111e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1122:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1126:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    112a:	10e56863          	bltu	a0,a4,123a <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    112e:	02e5f63b          	remuw	a2,a1,a4
    1132:	1602                	sll	a2,a2,0x20
    1134:	9201                	srl	a2,a2,0x20
    1136:	9636                	add	a2,a2,a3
    1138:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    113c:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1140:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1144:	10e5e463          	bltu	a1,a4,124c <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    1148:	02e5763b          	remuw	a2,a0,a4
    114c:	1602                	sll	a2,a2,0x20
    114e:	9201                	srl	a2,a2,0x20
    1150:	9636                	add	a2,a2,a3
    1152:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1156:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    115a:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    115e:	10e56063          	bltu	a0,a4,125e <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    1162:	02e5f63b          	remuw	a2,a1,a4
    1166:	1602                	sll	a2,a2,0x20
    1168:	9201                	srl	a2,a2,0x20
    116a:	9636                	add	a2,a2,a3
    116c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1170:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1174:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1178:	0ee5ec63          	bltu	a1,a4,1270 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    117c:	02e5763b          	remuw	a2,a0,a4
    1180:	1602                	sll	a2,a2,0x20
    1182:	9201                	srl	a2,a2,0x20
    1184:	9636                	add	a2,a2,a3
    1186:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    118a:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    118e:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1192:	08e56263          	bltu	a0,a4,1216 <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    1196:	02e5f63b          	remuw	a2,a1,a4
    119a:	1602                	sll	a2,a2,0x20
    119c:	9201                	srl	a2,a2,0x20
    119e:	9636                	add	a2,a2,a3
    11a0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a4:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    11a8:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11ac:	0ce5eb63          	bltu	a1,a4,1282 <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    11b0:	02e5763b          	remuw	a2,a0,a4
    11b4:	1602                	sll	a2,a2,0x20
    11b6:	9201                	srl	a2,a2,0x20
    11b8:	9636                	add	a2,a2,a3
    11ba:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11be:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11c2:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11c6:	0ce56763          	bltu	a0,a4,1294 <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    11ca:	02e5f63b          	remuw	a2,a1,a4
    11ce:	1602                	sll	a2,a2,0x20
    11d0:	9201                	srl	a2,a2,0x20
    11d2:	9636                	add	a2,a2,a3
    11d4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11d8:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11dc:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11e0:	0ce5e363          	bltu	a1,a4,12a6 <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    11e4:	1782                	sll	a5,a5,0x20
    11e6:	9381                	srl	a5,a5,0x20
    11e8:	96be                	add	a3,a3,a5
    11ea:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    11ee:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    11f0:	00f10723          	sb	a5,14(sp)
    if (sign)
    11f4:	00088763          	beqz	a7,1202 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11f8:	02d00793          	li	a5,45
    11fc:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1200:	4595                	li	a1,5
    write(f, s, l);
    1202:	003c                	add	a5,sp,8
    1204:	4641                	li	a2,16
    1206:	9e0d                	subw	a2,a2,a1
    1208:	4505                	li	a0,1
    120a:	95be                	add	a1,a1,a5
    120c:	27f000ef          	jal	1c8a <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1210:	70a2                	ld	ra,40(sp)
    1212:	6145                	add	sp,sp,48
    1214:	8082                	ret
    i++;
    1216:	45a9                	li	a1,10
    if (sign)
    1218:	fe0885e3          	beqz	a7,1202 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    121c:	02d00793          	li	a5,45
    1220:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1224:	45a5                	li	a1,9
    1226:	bff1                	j	1202 <printint.constprop.0+0x12c>
    i++;
    1228:	45bd                	li	a1,15
    if (sign)
    122a:	fc088ce3          	beqz	a7,1202 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    122e:	02d00793          	li	a5,45
    1232:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1236:	45b9                	li	a1,14
    1238:	b7e9                	j	1202 <printint.constprop.0+0x12c>
    i++;
    123a:	45b9                	li	a1,14
    if (sign)
    123c:	fc0883e3          	beqz	a7,1202 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1240:	02d00793          	li	a5,45
    1244:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1248:	45b5                	li	a1,13
    124a:	bf65                	j	1202 <printint.constprop.0+0x12c>
    i++;
    124c:	45b5                	li	a1,13
    if (sign)
    124e:	fa088ae3          	beqz	a7,1202 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1252:	02d00793          	li	a5,45
    1256:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    125a:	45b1                	li	a1,12
    125c:	b75d                	j	1202 <printint.constprop.0+0x12c>
    i++;
    125e:	45b1                	li	a1,12
    if (sign)
    1260:	fa0881e3          	beqz	a7,1202 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1264:	02d00793          	li	a5,45
    1268:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    126c:	45ad                	li	a1,11
    126e:	bf51                	j	1202 <printint.constprop.0+0x12c>
    i++;
    1270:	45ad                	li	a1,11
    if (sign)
    1272:	f80888e3          	beqz	a7,1202 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1276:	02d00793          	li	a5,45
    127a:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    127e:	45a9                	li	a1,10
    1280:	b749                	j	1202 <printint.constprop.0+0x12c>
    i++;
    1282:	45a5                	li	a1,9
    if (sign)
    1284:	f6088fe3          	beqz	a7,1202 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1288:	02d00793          	li	a5,45
    128c:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1290:	45a1                	li	a1,8
    1292:	bf85                	j	1202 <printint.constprop.0+0x12c>
    i++;
    1294:	45a1                	li	a1,8
    if (sign)
    1296:	f60886e3          	beqz	a7,1202 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    129a:	02d00793          	li	a5,45
    129e:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12a2:	459d                	li	a1,7
    12a4:	bfb9                	j	1202 <printint.constprop.0+0x12c>
    i++;
    12a6:	459d                	li	a1,7
    if (sign)
    12a8:	f4088de3          	beqz	a7,1202 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    12ac:	02d00793          	li	a5,45
    12b0:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12b4:	4599                	li	a1,6
    12b6:	b7b1                	j	1202 <printint.constprop.0+0x12c>

00000000000012b8 <getchar>:
{
    12b8:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12ba:	00f10593          	add	a1,sp,15
    12be:	4605                	li	a2,1
    12c0:	4501                	li	a0,0
{
    12c2:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12c4:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12c8:	1b9000ef          	jal	1c80 <read>
}
    12cc:	60e2                	ld	ra,24(sp)
    12ce:	00f14503          	lbu	a0,15(sp)
    12d2:	6105                	add	sp,sp,32
    12d4:	8082                	ret

00000000000012d6 <putchar>:
{
    12d6:	1101                	add	sp,sp,-32
    12d8:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12da:	00f10593          	add	a1,sp,15
    12de:	4605                	li	a2,1
    12e0:	4505                	li	a0,1
{
    12e2:	ec06                	sd	ra,24(sp)
    char byte = c;
    12e4:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12e8:	1a3000ef          	jal	1c8a <write>
}
    12ec:	60e2                	ld	ra,24(sp)
    12ee:	2501                	sext.w	a0,a0
    12f0:	6105                	add	sp,sp,32
    12f2:	8082                	ret

00000000000012f4 <puts>:
{
    12f4:	1141                	add	sp,sp,-16
    12f6:	e406                	sd	ra,8(sp)
    12f8:	e022                	sd	s0,0(sp)
    12fa:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12fc:	55a000ef          	jal	1856 <strlen>
    1300:	862a                	mv	a2,a0
    1302:	85a2                	mv	a1,s0
    1304:	4505                	li	a0,1
    1306:	185000ef          	jal	1c8a <write>
}
    130a:	60a2                	ld	ra,8(sp)
    130c:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    130e:	957d                	sra	a0,a0,0x3f
    return r;
    1310:	2501                	sext.w	a0,a0
}
    1312:	0141                	add	sp,sp,16
    1314:	8082                	ret

0000000000001316 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1316:	7131                	add	sp,sp,-192
    1318:	e4d6                	sd	s5,72(sp)
    131a:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    131c:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    131e:	013c                	add	a5,sp,136
{
    1320:	f0ca                	sd	s2,96(sp)
    1322:	ecce                	sd	s3,88(sp)
    1324:	e8d2                	sd	s4,80(sp)
    1326:	e0da                	sd	s6,64(sp)
    1328:	fc5e                	sd	s7,56(sp)
    132a:	fc86                	sd	ra,120(sp)
    132c:	f8a2                	sd	s0,112(sp)
    132e:	f4a6                	sd	s1,104(sp)
    1330:	e52e                	sd	a1,136(sp)
    1332:	e932                	sd	a2,144(sp)
    1334:	ed36                	sd	a3,152(sp)
    1336:	f13a                	sd	a4,160(sp)
    1338:	f942                	sd	a6,176(sp)
    133a:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    133c:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    133e:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1342:	07300a13          	li	s4,115
    1346:	07800b93          	li	s7,120
    134a:	06400b13          	li	s6,100
    buf[i++] = '0';
    134e:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x58c0>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1352:	00001997          	auipc	s3,0x1
    1356:	c1e98993          	add	s3,s3,-994 # 1f70 <digits>
        if (!*s)
    135a:	00054783          	lbu	a5,0(a0)
    135e:	16078863          	beqz	a5,14ce <printf+0x1b8>
    1362:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1364:	19278063          	beq	a5,s2,14e4 <printf+0x1ce>
    1368:	00164783          	lbu	a5,1(a2)
    136c:	0605                	add	a2,a2,1
    136e:	fbfd                	bnez	a5,1364 <printf+0x4e>
    1370:	84b2                	mv	s1,a2
        l = z - a;
    1372:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1376:	85aa                	mv	a1,a0
    1378:	8622                	mv	a2,s0
    137a:	4505                	li	a0,1
    137c:	10f000ef          	jal	1c8a <write>
        if (l)
    1380:	18041763          	bnez	s0,150e <printf+0x1f8>
        if (s[1] == 0)
    1384:	0014c783          	lbu	a5,1(s1)
    1388:	14078363          	beqz	a5,14ce <printf+0x1b8>
        switch (s[1])
    138c:	19478f63          	beq	a5,s4,152a <printf+0x214>
    1390:	18fa6163          	bltu	s4,a5,1512 <printf+0x1fc>
    1394:	1b678e63          	beq	a5,s6,1550 <printf+0x23a>
    1398:	07000713          	li	a4,112
    139c:	1ce79463          	bne	a5,a4,1564 <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13a0:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13a2:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13a6:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13a8:	631c                	ld	a5,0(a4)
    13aa:	0721                	add	a4,a4,8
    13ac:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13ae:	00479293          	sll	t0,a5,0x4
    13b2:	00879f93          	sll	t6,a5,0x8
    13b6:	00c79f13          	sll	t5,a5,0xc
    13ba:	01079e93          	sll	t4,a5,0x10
    13be:	01479e13          	sll	t3,a5,0x14
    13c2:	01879313          	sll	t1,a5,0x18
    13c6:	01c79893          	sll	a7,a5,0x1c
    13ca:	02479813          	sll	a6,a5,0x24
    13ce:	02879513          	sll	a0,a5,0x28
    13d2:	02c79593          	sll	a1,a5,0x2c
    13d6:	03079693          	sll	a3,a5,0x30
    13da:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13de:	03c7d413          	srl	s0,a5,0x3c
    13e2:	01c7d39b          	srlw	t2,a5,0x1c
    13e6:	03c2d293          	srl	t0,t0,0x3c
    13ea:	03cfdf93          	srl	t6,t6,0x3c
    13ee:	03cf5f13          	srl	t5,t5,0x3c
    13f2:	03cede93          	srl	t4,t4,0x3c
    13f6:	03ce5e13          	srl	t3,t3,0x3c
    13fa:	03c35313          	srl	t1,t1,0x3c
    13fe:	03c8d893          	srl	a7,a7,0x3c
    1402:	03c85813          	srl	a6,a6,0x3c
    1406:	9171                	srl	a0,a0,0x3c
    1408:	91f1                	srl	a1,a1,0x3c
    140a:	92f1                	srl	a3,a3,0x3c
    140c:	9371                	srl	a4,a4,0x3c
    140e:	974e                	add	a4,a4,s3
    1410:	944e                	add	s0,s0,s3
    1412:	92ce                	add	t0,t0,s3
    1414:	9fce                	add	t6,t6,s3
    1416:	9f4e                	add	t5,t5,s3
    1418:	9ece                	add	t4,t4,s3
    141a:	9e4e                	add	t3,t3,s3
    141c:	934e                	add	t1,t1,s3
    141e:	98ce                	add	a7,a7,s3
    1420:	93ce                	add	t2,t2,s3
    1422:	984e                	add	a6,a6,s3
    1424:	954e                	add	a0,a0,s3
    1426:	95ce                	add	a1,a1,s3
    1428:	96ce                	add	a3,a3,s3
    142a:	00074083          	lbu	ra,0(a4)
    142e:	0002c283          	lbu	t0,0(t0)
    1432:	000fcf83          	lbu	t6,0(t6)
    1436:	000f4f03          	lbu	t5,0(t5)
    143a:	000ece83          	lbu	t4,0(t4)
    143e:	000e4e03          	lbu	t3,0(t3)
    1442:	00034303          	lbu	t1,0(t1)
    1446:	0008c883          	lbu	a7,0(a7)
    144a:	0003c383          	lbu	t2,0(t2)
    144e:	00084803          	lbu	a6,0(a6)
    1452:	00054503          	lbu	a0,0(a0)
    1456:	0005c583          	lbu	a1,0(a1)
    145a:	0006c683          	lbu	a3,0(a3)
    145e:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1462:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1466:	9371                	srl	a4,a4,0x3c
    1468:	8bbd                	and	a5,a5,15
    146a:	974e                	add	a4,a4,s3
    146c:	97ce                	add	a5,a5,s3
    146e:	005105a3          	sb	t0,11(sp)
    1472:	01f10623          	sb	t6,12(sp)
    1476:	01e106a3          	sb	t5,13(sp)
    147a:	01d10723          	sb	t4,14(sp)
    147e:	01c107a3          	sb	t3,15(sp)
    1482:	00610823          	sb	t1,16(sp)
    1486:	011108a3          	sb	a7,17(sp)
    148a:	00710923          	sb	t2,18(sp)
    148e:	010109a3          	sb	a6,19(sp)
    1492:	00a10a23          	sb	a0,20(sp)
    1496:	00b10aa3          	sb	a1,21(sp)
    149a:	00d10b23          	sb	a3,22(sp)
    149e:	00110ba3          	sb	ra,23(sp)
    14a2:	00810523          	sb	s0,10(sp)
    14a6:	00074703          	lbu	a4,0(a4)
    14aa:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14ae:	002c                	add	a1,sp,8
    14b0:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14b2:	00e10c23          	sb	a4,24(sp)
    14b6:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14ba:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14be:	7cc000ef          	jal	1c8a <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14c2:	00248513          	add	a0,s1,2
        if (!*s)
    14c6:	00054783          	lbu	a5,0(a0)
    14ca:	e8079ce3          	bnez	a5,1362 <printf+0x4c>
    }
    va_end(ap);
}
    14ce:	70e6                	ld	ra,120(sp)
    14d0:	7446                	ld	s0,112(sp)
    14d2:	74a6                	ld	s1,104(sp)
    14d4:	7906                	ld	s2,96(sp)
    14d6:	69e6                	ld	s3,88(sp)
    14d8:	6a46                	ld	s4,80(sp)
    14da:	6aa6                	ld	s5,72(sp)
    14dc:	6b06                	ld	s6,64(sp)
    14de:	7be2                	ld	s7,56(sp)
    14e0:	6129                	add	sp,sp,192
    14e2:	8082                	ret
    14e4:	84b2                	mv	s1,a2
    14e6:	a039                	j	14f4 <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14e8:	0024c783          	lbu	a5,2(s1)
    14ec:	0605                	add	a2,a2,1
    14ee:	0489                	add	s1,s1,2
    14f0:	e92791e3          	bne	a5,s2,1372 <printf+0x5c>
    14f4:	0014c783          	lbu	a5,1(s1)
    14f8:	ff2788e3          	beq	a5,s2,14e8 <printf+0x1d2>
        l = z - a;
    14fc:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1500:	85aa                	mv	a1,a0
    1502:	8622                	mv	a2,s0
    1504:	4505                	li	a0,1
    1506:	784000ef          	jal	1c8a <write>
        if (l)
    150a:	e6040de3          	beqz	s0,1384 <printf+0x6e>
    150e:	8526                	mv	a0,s1
    1510:	b5a9                	j	135a <printf+0x44>
        switch (s[1])
    1512:	05779963          	bne	a5,s7,1564 <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    1516:	6782                	ld	a5,0(sp)
    1518:	45c1                	li	a1,16
    151a:	4388                	lw	a0,0(a5)
    151c:	07a1                	add	a5,a5,8
    151e:	e03e                	sd	a5,0(sp)
    1520:	bb7ff0ef          	jal	10d6 <printint.constprop.0>
        s += 2;
    1524:	00248513          	add	a0,s1,2
    1528:	bf79                	j	14c6 <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    152a:	6782                	ld	a5,0(sp)
    152c:	6380                	ld	s0,0(a5)
    152e:	07a1                	add	a5,a5,8
    1530:	e03e                	sd	a5,0(sp)
    1532:	cc21                	beqz	s0,158a <printf+0x274>
            l = strnlen(a, 200);
    1534:	0c800593          	li	a1,200
    1538:	8522                	mv	a0,s0
    153a:	44e000ef          	jal	1988 <strnlen>
    write(f, s, l);
    153e:	0005061b          	sext.w	a2,a0
    1542:	85a2                	mv	a1,s0
    1544:	4505                	li	a0,1
    1546:	744000ef          	jal	1c8a <write>
        s += 2;
    154a:	00248513          	add	a0,s1,2
    154e:	bfa5                	j	14c6 <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    1550:	6782                	ld	a5,0(sp)
    1552:	45a9                	li	a1,10
    1554:	4388                	lw	a0,0(a5)
    1556:	07a1                	add	a5,a5,8
    1558:	e03e                	sd	a5,0(sp)
    155a:	b7dff0ef          	jal	10d6 <printint.constprop.0>
        s += 2;
    155e:	00248513          	add	a0,s1,2
    1562:	b795                	j	14c6 <printf+0x1b0>
    return write(stdout, &byte, 1);
    1564:	4605                	li	a2,1
    1566:	002c                	add	a1,sp,8
    1568:	4505                	li	a0,1
    char byte = c;
    156a:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    156e:	71c000ef          	jal	1c8a <write>
    char byte = c;
    1572:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1576:	4605                	li	a2,1
    1578:	002c                	add	a1,sp,8
    157a:	4505                	li	a0,1
    char byte = c;
    157c:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1580:	70a000ef          	jal	1c8a <write>
        s += 2;
    1584:	00248513          	add	a0,s1,2
    1588:	bf3d                	j	14c6 <printf+0x1b0>
                a = "(null)";
    158a:	00001417          	auipc	s0,0x1
    158e:	9ce40413          	add	s0,s0,-1586 # 1f58 <__clone+0x96>
    1592:	b74d                	j	1534 <printf+0x21e>

0000000000001594 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1594:	02000793          	li	a5,32
    1598:	00f50663          	beq	a0,a5,15a4 <isspace+0x10>
    159c:	355d                	addw	a0,a0,-9
    159e:	00553513          	sltiu	a0,a0,5
    15a2:	8082                	ret
    15a4:	4505                	li	a0,1
}
    15a6:	8082                	ret

00000000000015a8 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15a8:	fd05051b          	addw	a0,a0,-48
}
    15ac:	00a53513          	sltiu	a0,a0,10
    15b0:	8082                	ret

00000000000015b2 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15b2:	02000713          	li	a4,32
    15b6:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15b8:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15bc:	ff76879b          	addw	a5,a3,-9
    15c0:	06e68063          	beq	a3,a4,1620 <atoi+0x6e>
    15c4:	0006859b          	sext.w	a1,a3
    15c8:	04f67c63          	bgeu	a2,a5,1620 <atoi+0x6e>
        s++;
    switch (*s)
    15cc:	02b00793          	li	a5,43
    15d0:	06f68563          	beq	a3,a5,163a <atoi+0x88>
    15d4:	02d00793          	li	a5,45
    15d8:	04f69663          	bne	a3,a5,1624 <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15dc:	00154683          	lbu	a3,1(a0)
    15e0:	47a5                	li	a5,9
        s++;
    15e2:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    15e6:	fd06869b          	addw	a3,a3,-48
    15ea:	8636                	mv	a2,a3
    while (isdigit(*s))
    15ec:	04d7e563          	bltu	a5,a3,1636 <atoi+0x84>
        neg = 1;
    15f0:	4885                	li	a7,1
    int n = 0, neg = 0;
    15f2:	4501                	li	a0,0
    while (isdigit(*s))
    15f4:	4825                	li	a6,9
    15f6:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    15fa:	0025179b          	sllw	a5,a0,0x2
    15fe:	9fa9                	addw	a5,a5,a0
    1600:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    1604:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    1608:	85b2                	mv	a1,a2
    160a:	40c7853b          	subw	a0,a5,a2
    160e:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    1610:	8636                	mv	a2,a3
    while (isdigit(*s))
    1612:	fed872e3          	bgeu	a6,a3,15f6 <atoi+0x44>
    return neg ? n : -n;
    1616:	02089163          	bnez	a7,1638 <atoi+0x86>
    161a:	40f5853b          	subw	a0,a1,a5
    161e:	8082                	ret
        s++;
    1620:	0505                	add	a0,a0,1
    1622:	bf59                	j	15b8 <atoi+0x6>
    while (isdigit(*s))
    1624:	fd05859b          	addw	a1,a1,-48
    1628:	47a5                	li	a5,9
    162a:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    162c:	4881                	li	a7,0
    162e:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    1632:	fcb7f0e3          	bgeu	a5,a1,15f2 <atoi+0x40>
    return neg ? n : -n;
    1636:	4501                	li	a0,0
}
    1638:	8082                	ret
    while (isdigit(*s))
    163a:	00154683          	lbu	a3,1(a0)
    163e:	47a5                	li	a5,9
        s++;
    1640:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1644:	fd06869b          	addw	a3,a3,-48
    1648:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    164a:	4881                	li	a7,0
    while (isdigit(*s))
    164c:	fad7f3e3          	bgeu	a5,a3,15f2 <atoi+0x40>
    return neg ? n : -n;
    1650:	4501                	li	a0,0
    1652:	8082                	ret

0000000000001654 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1654:	16060f63          	beqz	a2,17d2 <memset+0x17e>
    1658:	40a006b3          	neg	a3,a0
    165c:	0076f793          	and	a5,a3,7
    1660:	00778813          	add	a6,a5,7
    1664:	48ad                	li	a7,11
    1666:	0ff5f713          	zext.b	a4,a1
    166a:	fff60593          	add	a1,a2,-1
    166e:	17186363          	bltu	a6,a7,17d4 <memset+0x180>
    1672:	1705eb63          	bltu	a1,a6,17e8 <memset+0x194>
    1676:	16078163          	beqz	a5,17d8 <memset+0x184>
    167a:	00e50023          	sb	a4,0(a0)
    167e:	0066f593          	and	a1,a3,6
    1682:	14058e63          	beqz	a1,17de <memset+0x18a>
    1686:	00e500a3          	sb	a4,1(a0)
    168a:	4589                	li	a1,2
    168c:	00250813          	add	a6,a0,2
    1690:	04f5f663          	bgeu	a1,a5,16dc <memset+0x88>
    1694:	00e50123          	sb	a4,2(a0)
    1698:	8a91                	and	a3,a3,4
    169a:	00350813          	add	a6,a0,3
    169e:	458d                	li	a1,3
    16a0:	ce95                	beqz	a3,16dc <memset+0x88>
    16a2:	00e501a3          	sb	a4,3(a0)
    16a6:	4691                	li	a3,4
    16a8:	00450813          	add	a6,a0,4
    16ac:	4591                	li	a1,4
    16ae:	02f6f763          	bgeu	a3,a5,16dc <memset+0x88>
    16b2:	00e50223          	sb	a4,4(a0)
    16b6:	4695                	li	a3,5
    16b8:	00550813          	add	a6,a0,5
    16bc:	4595                	li	a1,5
    16be:	00d78f63          	beq	a5,a3,16dc <memset+0x88>
    16c2:	00e502a3          	sb	a4,5(a0)
    16c6:	469d                	li	a3,7
    16c8:	00650813          	add	a6,a0,6
    16cc:	4599                	li	a1,6
    16ce:	00d79763          	bne	a5,a3,16dc <memset+0x88>
    16d2:	00750813          	add	a6,a0,7
    16d6:	00e50323          	sb	a4,6(a0)
    16da:	459d                	li	a1,7
    16dc:	00871693          	sll	a3,a4,0x8
    16e0:	01071313          	sll	t1,a4,0x10
    16e4:	8ed9                	or	a3,a3,a4
    16e6:	01871893          	sll	a7,a4,0x18
    16ea:	0066e6b3          	or	a3,a3,t1
    16ee:	0116e6b3          	or	a3,a3,a7
    16f2:	02071313          	sll	t1,a4,0x20
    16f6:	02871893          	sll	a7,a4,0x28
    16fa:	0066e6b3          	or	a3,a3,t1
    16fe:	40f60e33          	sub	t3,a2,a5
    1702:	03071313          	sll	t1,a4,0x30
    1706:	0116e6b3          	or	a3,a3,a7
    170a:	0066e6b3          	or	a3,a3,t1
    170e:	03871893          	sll	a7,a4,0x38
    1712:	97aa                	add	a5,a5,a0
    1714:	ff8e7313          	and	t1,t3,-8
    1718:	0116e6b3          	or	a3,a3,a7
    171c:	00f308b3          	add	a7,t1,a5
    1720:	e394                	sd	a3,0(a5)
    1722:	07a1                	add	a5,a5,8
    1724:	ff179ee3          	bne	a5,a7,1720 <memset+0xcc>
    1728:	006806b3          	add	a3,a6,t1
    172c:	00b307bb          	addw	a5,t1,a1
    1730:	0bc30b63          	beq	t1,t3,17e6 <memset+0x192>
    1734:	00e68023          	sb	a4,0(a3)
    1738:	0017859b          	addw	a1,a5,1
    173c:	08c5fb63          	bgeu	a1,a2,17d2 <memset+0x17e>
    1740:	00e680a3          	sb	a4,1(a3)
    1744:	0027859b          	addw	a1,a5,2
    1748:	08c5f563          	bgeu	a1,a2,17d2 <memset+0x17e>
    174c:	00e68123          	sb	a4,2(a3)
    1750:	0037859b          	addw	a1,a5,3
    1754:	06c5ff63          	bgeu	a1,a2,17d2 <memset+0x17e>
    1758:	00e681a3          	sb	a4,3(a3)
    175c:	0047859b          	addw	a1,a5,4
    1760:	06c5f963          	bgeu	a1,a2,17d2 <memset+0x17e>
    1764:	00e68223          	sb	a4,4(a3)
    1768:	0057859b          	addw	a1,a5,5
    176c:	06c5f363          	bgeu	a1,a2,17d2 <memset+0x17e>
    1770:	00e682a3          	sb	a4,5(a3)
    1774:	0067859b          	addw	a1,a5,6
    1778:	04c5fd63          	bgeu	a1,a2,17d2 <memset+0x17e>
    177c:	00e68323          	sb	a4,6(a3)
    1780:	0077859b          	addw	a1,a5,7
    1784:	04c5f763          	bgeu	a1,a2,17d2 <memset+0x17e>
    1788:	00e683a3          	sb	a4,7(a3)
    178c:	0087859b          	addw	a1,a5,8
    1790:	04c5f163          	bgeu	a1,a2,17d2 <memset+0x17e>
    1794:	00e68423          	sb	a4,8(a3)
    1798:	0097859b          	addw	a1,a5,9
    179c:	02c5fb63          	bgeu	a1,a2,17d2 <memset+0x17e>
    17a0:	00e684a3          	sb	a4,9(a3)
    17a4:	00a7859b          	addw	a1,a5,10
    17a8:	02c5f563          	bgeu	a1,a2,17d2 <memset+0x17e>
    17ac:	00e68523          	sb	a4,10(a3)
    17b0:	00b7859b          	addw	a1,a5,11
    17b4:	00c5ff63          	bgeu	a1,a2,17d2 <memset+0x17e>
    17b8:	00e685a3          	sb	a4,11(a3)
    17bc:	00c7859b          	addw	a1,a5,12
    17c0:	00c5f963          	bgeu	a1,a2,17d2 <memset+0x17e>
    17c4:	00e68623          	sb	a4,12(a3)
    17c8:	27b5                	addw	a5,a5,13
    17ca:	00c7f463          	bgeu	a5,a2,17d2 <memset+0x17e>
    17ce:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17d2:	8082                	ret
    17d4:	482d                	li	a6,11
    17d6:	bd71                	j	1672 <memset+0x1e>
    char *p = dest;
    17d8:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17da:	4581                	li	a1,0
    17dc:	b701                	j	16dc <memset+0x88>
    17de:	00150813          	add	a6,a0,1
    17e2:	4585                	li	a1,1
    17e4:	bde5                	j	16dc <memset+0x88>
    17e6:	8082                	ret
    char *p = dest;
    17e8:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17ea:	4781                	li	a5,0
    17ec:	b7a1                	j	1734 <memset+0xe0>

00000000000017ee <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17ee:	00054783          	lbu	a5,0(a0)
    17f2:	0005c703          	lbu	a4,0(a1)
    17f6:	00e79863          	bne	a5,a4,1806 <strcmp+0x18>
    17fa:	0505                	add	a0,a0,1
    17fc:	0585                	add	a1,a1,1
    17fe:	fbe5                	bnez	a5,17ee <strcmp>
    1800:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1802:	9d19                	subw	a0,a0,a4
    1804:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1806:	0007851b          	sext.w	a0,a5
    180a:	bfe5                	j	1802 <strcmp+0x14>

000000000000180c <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    180c:	ca15                	beqz	a2,1840 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    180e:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1812:	167d                	add	a2,a2,-1
    1814:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1818:	eb99                	bnez	a5,182e <strncmp+0x22>
    181a:	a815                	j	184e <strncmp+0x42>
    181c:	00a68e63          	beq	a3,a0,1838 <strncmp+0x2c>
    1820:	0505                	add	a0,a0,1
    1822:	00f71b63          	bne	a4,a5,1838 <strncmp+0x2c>
    1826:	00054783          	lbu	a5,0(a0)
    182a:	cf89                	beqz	a5,1844 <strncmp+0x38>
    182c:	85b2                	mv	a1,a2
    182e:	0005c703          	lbu	a4,0(a1)
    1832:	00158613          	add	a2,a1,1
    1836:	f37d                	bnez	a4,181c <strncmp+0x10>
        ;
    return *l - *r;
    1838:	0007851b          	sext.w	a0,a5
    183c:	9d19                	subw	a0,a0,a4
    183e:	8082                	ret
        return 0;
    1840:	4501                	li	a0,0
}
    1842:	8082                	ret
    return *l - *r;
    1844:	0015c703          	lbu	a4,1(a1)
    1848:	4501                	li	a0,0
    184a:	9d19                	subw	a0,a0,a4
    184c:	8082                	ret
    184e:	0005c703          	lbu	a4,0(a1)
    1852:	4501                	li	a0,0
    1854:	b7e5                	j	183c <strncmp+0x30>

0000000000001856 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1856:	00757793          	and	a5,a0,7
    185a:	cf89                	beqz	a5,1874 <strlen+0x1e>
    185c:	87aa                	mv	a5,a0
    185e:	a029                	j	1868 <strlen+0x12>
    1860:	0785                	add	a5,a5,1
    1862:	0077f713          	and	a4,a5,7
    1866:	cb01                	beqz	a4,1876 <strlen+0x20>
        if (!*s)
    1868:	0007c703          	lbu	a4,0(a5)
    186c:	fb75                	bnez	a4,1860 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    186e:	40a78533          	sub	a0,a5,a0
}
    1872:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1874:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1876:	feff05b7          	lui	a1,0xfeff0
    187a:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedf8f>
    187e:	f0101637          	lui	a2,0xf0101
    1882:	05c2                	sll	a1,a1,0x10
    1884:	0612                	sll	a2,a2,0x4
    1886:	6394                	ld	a3,0(a5)
    1888:	eff58593          	add	a1,a1,-257
    188c:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff191>
    1890:	05c2                	sll	a1,a1,0x10
    1892:	0642                	sll	a2,a2,0x10
    1894:	eff58593          	add	a1,a1,-257
    1898:	10160613          	add	a2,a2,257
    189c:	00b68733          	add	a4,a3,a1
    18a0:	063e                	sll	a2,a2,0xf
    18a2:	fff6c693          	not	a3,a3
    18a6:	8f75                	and	a4,a4,a3
    18a8:	08060613          	add	a2,a2,128
    18ac:	8f71                	and	a4,a4,a2
    18ae:	eb11                	bnez	a4,18c2 <strlen+0x6c>
    18b0:	6794                	ld	a3,8(a5)
    18b2:	07a1                	add	a5,a5,8
    18b4:	00b68733          	add	a4,a3,a1
    18b8:	fff6c693          	not	a3,a3
    18bc:	8f75                	and	a4,a4,a3
    18be:	8f71                	and	a4,a4,a2
    18c0:	db65                	beqz	a4,18b0 <strlen+0x5a>
    for (; *s; s++)
    18c2:	0007c703          	lbu	a4,0(a5)
    18c6:	d745                	beqz	a4,186e <strlen+0x18>
    18c8:	0017c703          	lbu	a4,1(a5)
    18cc:	0785                	add	a5,a5,1
    18ce:	d345                	beqz	a4,186e <strlen+0x18>
    18d0:	0017c703          	lbu	a4,1(a5)
    18d4:	0785                	add	a5,a5,1
    18d6:	fb6d                	bnez	a4,18c8 <strlen+0x72>
    18d8:	bf59                	j	186e <strlen+0x18>

00000000000018da <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18da:	00757713          	and	a4,a0,7
{
    18de:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18e0:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18e4:	cb19                	beqz	a4,18fa <memchr+0x20>
    18e6:	ce59                	beqz	a2,1984 <memchr+0xaa>
    18e8:	0007c703          	lbu	a4,0(a5)
    18ec:	00b70963          	beq	a4,a1,18fe <memchr+0x24>
    18f0:	0785                	add	a5,a5,1
    18f2:	0077f713          	and	a4,a5,7
    18f6:	167d                	add	a2,a2,-1
    18f8:	f77d                	bnez	a4,18e6 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18fa:	4501                	li	a0,0
    if (n && *s != c)
    18fc:	c649                	beqz	a2,1986 <memchr+0xac>
    18fe:	0007c703          	lbu	a4,0(a5)
    1902:	06b70663          	beq	a4,a1,196e <memchr+0x94>
        size_t k = ONES * c;
    1906:	01010737          	lui	a4,0x1010
    190a:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e191>
    190e:	0742                	sll	a4,a4,0x10
    1910:	10170713          	add	a4,a4,257
    1914:	0742                	sll	a4,a4,0x10
    1916:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    191a:	469d                	li	a3,7
        size_t k = ONES * c;
    191c:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1920:	04c6f763          	bgeu	a3,a2,196e <memchr+0x94>
    1924:	f0101837          	lui	a6,0xf0101
    1928:	feff08b7          	lui	a7,0xfeff0
    192c:	0812                	sll	a6,a6,0x4
    192e:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedf8f>
    1932:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff191>
    1936:	08c2                	sll	a7,a7,0x10
    1938:	0842                	sll	a6,a6,0x10
    193a:	eff88893          	add	a7,a7,-257
    193e:	10180813          	add	a6,a6,257
    1942:	08c2                	sll	a7,a7,0x10
    1944:	083e                	sll	a6,a6,0xf
    1946:	eff88893          	add	a7,a7,-257
    194a:	08080813          	add	a6,a6,128
    194e:	431d                	li	t1,7
    1950:	a029                	j	195a <memchr+0x80>
    1952:	1661                	add	a2,a2,-8
    1954:	07a1                	add	a5,a5,8
    1956:	02c37663          	bgeu	t1,a2,1982 <memchr+0xa8>
    195a:	6398                	ld	a4,0(a5)
    195c:	8f29                	xor	a4,a4,a0
    195e:	011706b3          	add	a3,a4,a7
    1962:	fff74713          	not	a4,a4
    1966:	8f75                	and	a4,a4,a3
    1968:	01077733          	and	a4,a4,a6
    196c:	d37d                	beqz	a4,1952 <memchr+0x78>
        s = (const void *)w;
    196e:	853e                	mv	a0,a5
    1970:	a019                	j	1976 <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    1972:	0505                	add	a0,a0,1
    1974:	ca01                	beqz	a2,1984 <memchr+0xaa>
    1976:	00054783          	lbu	a5,0(a0)
    197a:	167d                	add	a2,a2,-1
    197c:	feb79be3          	bne	a5,a1,1972 <memchr+0x98>
    1980:	8082                	ret
    1982:	f675                	bnez	a2,196e <memchr+0x94>
    return n ? (void *)s : 0;
    1984:	4501                	li	a0,0
}
    1986:	8082                	ret

0000000000001988 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1988:	1101                	add	sp,sp,-32
    198a:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    198c:	862e                	mv	a2,a1
{
    198e:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1990:	4581                	li	a1,0
{
    1992:	e426                	sd	s1,8(sp)
    1994:	ec06                	sd	ra,24(sp)
    1996:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1998:	f43ff0ef          	jal	18da <memchr>
    return p ? p - s : n;
    199c:	c519                	beqz	a0,19aa <strnlen+0x22>
}
    199e:	60e2                	ld	ra,24(sp)
    19a0:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19a2:	8d05                	sub	a0,a0,s1
}
    19a4:	64a2                	ld	s1,8(sp)
    19a6:	6105                	add	sp,sp,32
    19a8:	8082                	ret
    19aa:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19ac:	8522                	mv	a0,s0
}
    19ae:	6442                	ld	s0,16(sp)
    19b0:	64a2                	ld	s1,8(sp)
    19b2:	6105                	add	sp,sp,32
    19b4:	8082                	ret

00000000000019b6 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19b6:	00b547b3          	xor	a5,a0,a1
    19ba:	8b9d                	and	a5,a5,7
    19bc:	efb1                	bnez	a5,1a18 <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19be:	0075f793          	and	a5,a1,7
    19c2:	ebb5                	bnez	a5,1a36 <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19c4:	feff0637          	lui	a2,0xfeff0
    19c8:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedf8f>
    19cc:	f01016b7          	lui	a3,0xf0101
    19d0:	0642                	sll	a2,a2,0x10
    19d2:	0692                	sll	a3,a3,0x4
    19d4:	6198                	ld	a4,0(a1)
    19d6:	eff60613          	add	a2,a2,-257
    19da:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff191>
    19de:	0642                	sll	a2,a2,0x10
    19e0:	06c2                	sll	a3,a3,0x10
    19e2:	eff60613          	add	a2,a2,-257
    19e6:	10168693          	add	a3,a3,257
    19ea:	00c707b3          	add	a5,a4,a2
    19ee:	fff74813          	not	a6,a4
    19f2:	06be                	sll	a3,a3,0xf
    19f4:	0107f7b3          	and	a5,a5,a6
    19f8:	08068693          	add	a3,a3,128
    19fc:	8ff5                	and	a5,a5,a3
    19fe:	ef89                	bnez	a5,1a18 <strcpy+0x62>
    1a00:	05a1                	add	a1,a1,8
    1a02:	e118                	sd	a4,0(a0)
    1a04:	6198                	ld	a4,0(a1)
    1a06:	0521                	add	a0,a0,8
    1a08:	00c707b3          	add	a5,a4,a2
    1a0c:	fff74813          	not	a6,a4
    1a10:	0107f7b3          	and	a5,a5,a6
    1a14:	8ff5                	and	a5,a5,a3
    1a16:	d7ed                	beqz	a5,1a00 <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a18:	0005c783          	lbu	a5,0(a1)
    1a1c:	00f50023          	sb	a5,0(a0)
    1a20:	c785                	beqz	a5,1a48 <strcpy+0x92>
    1a22:	0015c783          	lbu	a5,1(a1)
    1a26:	0505                	add	a0,a0,1
    1a28:	0585                	add	a1,a1,1
    1a2a:	00f50023          	sb	a5,0(a0)
    1a2e:	fbf5                	bnez	a5,1a22 <strcpy+0x6c>
        ;
    return d;
}
    1a30:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a32:	0505                	add	a0,a0,1
    1a34:	db41                	beqz	a4,19c4 <strcpy+0xe>
            if (!(*d = *s))
    1a36:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a3a:	0585                	add	a1,a1,1
    1a3c:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a40:	00f50023          	sb	a5,0(a0)
    1a44:	f7fd                	bnez	a5,1a32 <strcpy+0x7c>
}
    1a46:	8082                	ret
    1a48:	8082                	ret

0000000000001a4a <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a4a:	00b547b3          	xor	a5,a0,a1
    1a4e:	8b9d                	and	a5,a5,7
    1a50:	efbd                	bnez	a5,1ace <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a52:	0075f793          	and	a5,a1,7
    1a56:	1c078563          	beqz	a5,1c20 <strncpy+0x1d6>
    1a5a:	ea11                	bnez	a2,1a6e <strncpy+0x24>
    1a5c:	8082                	ret
    1a5e:	0585                	add	a1,a1,1
    1a60:	0075f793          	and	a5,a1,7
    1a64:	167d                	add	a2,a2,-1
    1a66:	0505                	add	a0,a0,1
    1a68:	1a078c63          	beqz	a5,1c20 <strncpy+0x1d6>
    1a6c:	ca3d                	beqz	a2,1ae2 <strncpy+0x98>
    1a6e:	0005c783          	lbu	a5,0(a1)
    1a72:	00f50023          	sb	a5,0(a0)
    1a76:	f7e5                	bnez	a5,1a5e <strncpy+0x14>
            ;
        if (!n || !*s)
    1a78:	0005c783          	lbu	a5,0(a1)
    1a7c:	c7a5                	beqz	a5,1ae4 <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a7e:	479d                	li	a5,7
    1a80:	04c7f863          	bgeu	a5,a2,1ad0 <strncpy+0x86>
    1a84:	f01016b7          	lui	a3,0xf0101
    1a88:	feff0837          	lui	a6,0xfeff0
    1a8c:	0692                	sll	a3,a3,0x4
    1a8e:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedf8f>
    1a92:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff191>
    1a96:	0842                	sll	a6,a6,0x10
    1a98:	06c2                	sll	a3,a3,0x10
    1a9a:	eff80813          	add	a6,a6,-257
    1a9e:	10168693          	add	a3,a3,257
    1aa2:	0842                	sll	a6,a6,0x10
    1aa4:	06be                	sll	a3,a3,0xf
    1aa6:	eff80813          	add	a6,a6,-257
    1aaa:	08068693          	add	a3,a3,128
    1aae:	431d                	li	t1,7
    1ab0:	6198                	ld	a4,0(a1)
    1ab2:	010707b3          	add	a5,a4,a6
    1ab6:	fff74893          	not	a7,a4
    1aba:	0117f7b3          	and	a5,a5,a7
    1abe:	8ff5                	and	a5,a5,a3
    1ac0:	eb81                	bnez	a5,1ad0 <strncpy+0x86>
            *wd = *ws;
    1ac2:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ac4:	1661                	add	a2,a2,-8
    1ac6:	05a1                	add	a1,a1,8
    1ac8:	0521                	add	a0,a0,8
    1aca:	fec363e3          	bltu	t1,a2,1ab0 <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1ace:	ca11                	beqz	a2,1ae2 <strncpy+0x98>
    1ad0:	0005c783          	lbu	a5,0(a1)
    1ad4:	0585                	add	a1,a1,1
    1ad6:	00f50023          	sb	a5,0(a0)
    1ada:	c789                	beqz	a5,1ae4 <strncpy+0x9a>
    1adc:	167d                	add	a2,a2,-1
    1ade:	0505                	add	a0,a0,1
    1ae0:	fa65                	bnez	a2,1ad0 <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1ae2:	8082                	ret
    1ae4:	40a00733          	neg	a4,a0
    1ae8:	00777793          	and	a5,a4,7
    1aec:	00778693          	add	a3,a5,7
    1af0:	482d                	li	a6,11
    1af2:	fff60593          	add	a1,a2,-1
    1af6:	1106ef63          	bltu	a3,a6,1c14 <strncpy+0x1ca>
    1afa:	12d5ee63          	bltu	a1,a3,1c36 <strncpy+0x1ec>
    1afe:	12078563          	beqz	a5,1c28 <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b02:	00050023          	sb	zero,0(a0)
    1b06:	00677693          	and	a3,a4,6
    1b0a:	12068263          	beqz	a3,1c2e <strncpy+0x1e4>
    1b0e:	000500a3          	sb	zero,1(a0)
    1b12:	4689                	li	a3,2
    1b14:	12f6f463          	bgeu	a3,a5,1c3c <strncpy+0x1f2>
    1b18:	00050123          	sb	zero,2(a0)
    1b1c:	8b11                	and	a4,a4,4
    1b1e:	cf6d                	beqz	a4,1c18 <strncpy+0x1ce>
    1b20:	000501a3          	sb	zero,3(a0)
    1b24:	4711                	li	a4,4
    1b26:	00450693          	add	a3,a0,4
    1b2a:	02f77363          	bgeu	a4,a5,1b50 <strncpy+0x106>
    1b2e:	00050223          	sb	zero,4(a0)
    1b32:	4715                	li	a4,5
    1b34:	00550693          	add	a3,a0,5
    1b38:	00e78c63          	beq	a5,a4,1b50 <strncpy+0x106>
    1b3c:	000502a3          	sb	zero,5(a0)
    1b40:	471d                	li	a4,7
    1b42:	10e79163          	bne	a5,a4,1c44 <strncpy+0x1fa>
    1b46:	00750693          	add	a3,a0,7
    1b4a:	00050323          	sb	zero,6(a0)
    1b4e:	471d                	li	a4,7
    1b50:	40f608b3          	sub	a7,a2,a5
    1b54:	ff88f813          	and	a6,a7,-8
    1b58:	97aa                	add	a5,a5,a0
    1b5a:	010785b3          	add	a1,a5,a6
    1b5e:	0007b023          	sd	zero,0(a5)
    1b62:	07a1                	add	a5,a5,8
    1b64:	feb79de3          	bne	a5,a1,1b5e <strncpy+0x114>
    1b68:	00e807bb          	addw	a5,a6,a4
    1b6c:	01068733          	add	a4,a3,a6
    1b70:	0b088b63          	beq	a7,a6,1c26 <strncpy+0x1dc>
    1b74:	00070023          	sb	zero,0(a4)
    1b78:	0017869b          	addw	a3,a5,1
    1b7c:	f6c6f3e3          	bgeu	a3,a2,1ae2 <strncpy+0x98>
    1b80:	000700a3          	sb	zero,1(a4)
    1b84:	0027869b          	addw	a3,a5,2
    1b88:	f4c6fde3          	bgeu	a3,a2,1ae2 <strncpy+0x98>
    1b8c:	00070123          	sb	zero,2(a4)
    1b90:	0037869b          	addw	a3,a5,3
    1b94:	f4c6f7e3          	bgeu	a3,a2,1ae2 <strncpy+0x98>
    1b98:	000701a3          	sb	zero,3(a4)
    1b9c:	0047869b          	addw	a3,a5,4
    1ba0:	f4c6f1e3          	bgeu	a3,a2,1ae2 <strncpy+0x98>
    1ba4:	00070223          	sb	zero,4(a4)
    1ba8:	0057869b          	addw	a3,a5,5
    1bac:	f2c6fbe3          	bgeu	a3,a2,1ae2 <strncpy+0x98>
    1bb0:	000702a3          	sb	zero,5(a4)
    1bb4:	0067869b          	addw	a3,a5,6
    1bb8:	f2c6f5e3          	bgeu	a3,a2,1ae2 <strncpy+0x98>
    1bbc:	00070323          	sb	zero,6(a4)
    1bc0:	0077869b          	addw	a3,a5,7
    1bc4:	f0c6ffe3          	bgeu	a3,a2,1ae2 <strncpy+0x98>
    1bc8:	000703a3          	sb	zero,7(a4)
    1bcc:	0087869b          	addw	a3,a5,8
    1bd0:	f0c6f9e3          	bgeu	a3,a2,1ae2 <strncpy+0x98>
    1bd4:	00070423          	sb	zero,8(a4)
    1bd8:	0097869b          	addw	a3,a5,9
    1bdc:	f0c6f3e3          	bgeu	a3,a2,1ae2 <strncpy+0x98>
    1be0:	000704a3          	sb	zero,9(a4)
    1be4:	00a7869b          	addw	a3,a5,10
    1be8:	eec6fde3          	bgeu	a3,a2,1ae2 <strncpy+0x98>
    1bec:	00070523          	sb	zero,10(a4)
    1bf0:	00b7869b          	addw	a3,a5,11
    1bf4:	eec6f7e3          	bgeu	a3,a2,1ae2 <strncpy+0x98>
    1bf8:	000705a3          	sb	zero,11(a4)
    1bfc:	00c7869b          	addw	a3,a5,12
    1c00:	eec6f1e3          	bgeu	a3,a2,1ae2 <strncpy+0x98>
    1c04:	00070623          	sb	zero,12(a4)
    1c08:	27b5                	addw	a5,a5,13
    1c0a:	ecc7fce3          	bgeu	a5,a2,1ae2 <strncpy+0x98>
    1c0e:	000706a3          	sb	zero,13(a4)
}
    1c12:	8082                	ret
    1c14:	46ad                	li	a3,11
    1c16:	b5d5                	j	1afa <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c18:	00350693          	add	a3,a0,3
    1c1c:	470d                	li	a4,3
    1c1e:	bf0d                	j	1b50 <strncpy+0x106>
        if (!n || !*s)
    1c20:	e4061ce3          	bnez	a2,1a78 <strncpy+0x2e>
}
    1c24:	8082                	ret
    1c26:	8082                	ret
    char *p = dest;
    1c28:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c2a:	4701                	li	a4,0
    1c2c:	b715                	j	1b50 <strncpy+0x106>
    1c2e:	00150693          	add	a3,a0,1
    1c32:	4705                	li	a4,1
    1c34:	bf31                	j	1b50 <strncpy+0x106>
    char *p = dest;
    1c36:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c38:	4781                	li	a5,0
    1c3a:	bf2d                	j	1b74 <strncpy+0x12a>
    1c3c:	00250693          	add	a3,a0,2
    1c40:	4709                	li	a4,2
    1c42:	b739                	j	1b50 <strncpy+0x106>
    1c44:	00650693          	add	a3,a0,6
    1c48:	4719                	li	a4,6
    1c4a:	b719                	j	1b50 <strncpy+0x106>

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

0000000000001c74 <close>:
    register long a7 __asm__("a7") = n;
    1c74:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c78:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c7c:	2501                	sext.w	a0,a0
    1c7e:	8082                	ret

0000000000001c80 <read>:
    register long a7 __asm__("a7") = n;
    1c80:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c84:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c88:	8082                	ret

0000000000001c8a <write>:
    register long a7 __asm__("a7") = n;
    1c8a:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c8e:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c92:	8082                	ret

0000000000001c94 <getpid>:
    register long a7 __asm__("a7") = n;
    1c94:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c98:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c9c:	2501                	sext.w	a0,a0
    1c9e:	8082                	ret

0000000000001ca0 <getppid>:
    register long a7 __asm__("a7") = n;
    1ca0:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1ca4:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1ca8:	2501                	sext.w	a0,a0
    1caa:	8082                	ret

0000000000001cac <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cac:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cb0:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cb4:	2501                	sext.w	a0,a0
    1cb6:	8082                	ret

0000000000001cb8 <fork>:
    register long a7 __asm__("a7") = n;
    1cb8:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cbc:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cbe:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cc0:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cc4:	2501                	sext.w	a0,a0
    1cc6:	8082                	ret

0000000000001cc8 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cc8:	85b2                	mv	a1,a2
    1cca:	863a                	mv	a2,a4
    if (stack)
    1ccc:	c191                	beqz	a1,1cd0 <clone+0x8>
	stack += stack_size;
    1cce:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cd0:	4781                	li	a5,0
    1cd2:	4701                	li	a4,0
    1cd4:	4681                	li	a3,0
    1cd6:	2601                	sext.w	a2,a2
    1cd8:	a2ed                	j	1ec2 <__clone>

0000000000001cda <exit>:
    register long a7 __asm__("a7") = n;
    1cda:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cde:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1ce2:	8082                	ret

0000000000001ce4 <waitpid>:
    register long a7 __asm__("a7") = n;
    1ce4:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1ce8:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cea:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cee:	2501                	sext.w	a0,a0
    1cf0:	8082                	ret

0000000000001cf2 <exec>:
    register long a7 __asm__("a7") = n;
    1cf2:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cf6:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cfa:	2501                	sext.w	a0,a0
    1cfc:	8082                	ret

0000000000001cfe <execve>:
    register long a7 __asm__("a7") = n;
    1cfe:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d02:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d06:	2501                	sext.w	a0,a0
    1d08:	8082                	ret

0000000000001d0a <times>:
    register long a7 __asm__("a7") = n;
    1d0a:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d0e:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d12:	2501                	sext.w	a0,a0
    1d14:	8082                	ret

0000000000001d16 <get_time>:

int64 get_time()
{
    1d16:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d18:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d1c:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d1e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d20:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d24:	2501                	sext.w	a0,a0
    1d26:	ed09                	bnez	a0,1d40 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d28:	67a2                	ld	a5,8(sp)
    1d2a:	3e800713          	li	a4,1000
    1d2e:	00015503          	lhu	a0,0(sp)
    1d32:	02e7d7b3          	divu	a5,a5,a4
    1d36:	02e50533          	mul	a0,a0,a4
    1d3a:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d3c:	0141                	add	sp,sp,16
    1d3e:	8082                	ret
        return -1;
    1d40:	557d                	li	a0,-1
    1d42:	bfed                	j	1d3c <get_time+0x26>

0000000000001d44 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d44:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d48:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d4c:	2501                	sext.w	a0,a0
    1d4e:	8082                	ret

0000000000001d50 <time>:
    register long a7 __asm__("a7") = n;
    1d50:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d54:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d58:	2501                	sext.w	a0,a0
    1d5a:	8082                	ret

0000000000001d5c <sleep>:

int sleep(unsigned long long time)
{
    1d5c:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d5e:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d60:	850a                	mv	a0,sp
    1d62:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d64:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d68:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d6a:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d6e:	e501                	bnez	a0,1d76 <sleep+0x1a>
    return 0;
    1d70:	4501                	li	a0,0
}
    1d72:	0141                	add	sp,sp,16
    1d74:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d76:	4502                	lw	a0,0(sp)
}
    1d78:	0141                	add	sp,sp,16
    1d7a:	8082                	ret

0000000000001d7c <set_priority>:
    register long a7 __asm__("a7") = n;
    1d7c:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d80:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d84:	2501                	sext.w	a0,a0
    1d86:	8082                	ret

0000000000001d88 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d88:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d8c:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d90:	8082                	ret

0000000000001d92 <munmap>:
    register long a7 __asm__("a7") = n;
    1d92:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d96:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d9a:	2501                	sext.w	a0,a0
    1d9c:	8082                	ret

0000000000001d9e <wait>:

int wait(int *code)
{
    1d9e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1da0:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1da4:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1da6:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1da8:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1daa:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1dae:	2501                	sext.w	a0,a0
    1db0:	8082                	ret

0000000000001db2 <spawn>:
    register long a7 __asm__("a7") = n;
    1db2:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1db6:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dba:	2501                	sext.w	a0,a0
    1dbc:	8082                	ret

0000000000001dbe <mailread>:
    register long a7 __asm__("a7") = n;
    1dbe:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc2:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dc6:	2501                	sext.w	a0,a0
    1dc8:	8082                	ret

0000000000001dca <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dca:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dce:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dd2:	2501                	sext.w	a0,a0
    1dd4:	8082                	ret

0000000000001dd6 <fstat>:
    register long a7 __asm__("a7") = n;
    1dd6:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dda:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dde:	2501                	sext.w	a0,a0
    1de0:	8082                	ret

0000000000001de2 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1de2:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1de4:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1de8:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dea:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1dee:	2501                	sext.w	a0,a0
    1df0:	8082                	ret

0000000000001df2 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1df2:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1df4:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1df8:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dfa:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1dfe:	2501                	sext.w	a0,a0
    1e00:	8082                	ret

0000000000001e02 <link>:

int link(char *old_path, char *new_path)
{
    1e02:	87aa                	mv	a5,a0
    1e04:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e06:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e0a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e0e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e10:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e14:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e16:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e1a:	2501                	sext.w	a0,a0
    1e1c:	8082                	ret

0000000000001e1e <unlink>:

int unlink(char *path)
{
    1e1e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e20:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e24:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e28:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e2a:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e2e:	2501                	sext.w	a0,a0
    1e30:	8082                	ret

0000000000001e32 <uname>:
    register long a7 __asm__("a7") = n;
    1e32:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e36:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e3a:	2501                	sext.w	a0,a0
    1e3c:	8082                	ret

0000000000001e3e <brk>:
    register long a7 __asm__("a7") = n;
    1e3e:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e42:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e46:	2501                	sext.w	a0,a0
    1e48:	8082                	ret

0000000000001e4a <getcwd>:
    register long a7 __asm__("a7") = n;
    1e4a:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e4c:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e50:	8082                	ret

0000000000001e52 <chdir>:
    register long a7 __asm__("a7") = n;
    1e52:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e56:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e5a:	2501                	sext.w	a0,a0
    1e5c:	8082                	ret

0000000000001e5e <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e5e:	862e                	mv	a2,a1
    1e60:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e62:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e64:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e68:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e6c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e6e:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e70:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e74:	2501                	sext.w	a0,a0
    1e76:	8082                	ret

0000000000001e78 <getdents>:
    register long a7 __asm__("a7") = n;
    1e78:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e7c:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e80:	2501                	sext.w	a0,a0
    1e82:	8082                	ret

0000000000001e84 <pipe>:
    register long a7 __asm__("a7") = n;
    1e84:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e88:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e8a:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e8e:	2501                	sext.w	a0,a0
    1e90:	8082                	ret

0000000000001e92 <dup>:
    register long a7 __asm__("a7") = n;
    1e92:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e94:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e98:	2501                	sext.w	a0,a0
    1e9a:	8082                	ret

0000000000001e9c <dup2>:
    register long a7 __asm__("a7") = n;
    1e9c:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e9e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ea0:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ea4:	2501                	sext.w	a0,a0
    1ea6:	8082                	ret

0000000000001ea8 <mount>:
    register long a7 __asm__("a7") = n;
    1ea8:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1eac:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1eb0:	2501                	sext.w	a0,a0
    1eb2:	8082                	ret

0000000000001eb4 <umount>:
    register long a7 __asm__("a7") = n;
    1eb4:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1eb8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eba:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ebe:	2501                	sext.w	a0,a0
    1ec0:	8082                	ret

0000000000001ec2 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ec2:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1ec4:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ec6:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ec8:	8532                	mv	a0,a2
	mv a2, a4
    1eca:	863a                	mv	a2,a4
	mv a3, a5
    1ecc:	86be                	mv	a3,a5
	mv a4, a6
    1ece:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ed0:	0dc00893          	li	a7,220
	ecall
    1ed4:	00000073          	ecall

	beqz a0, 1f
    1ed8:	c111                	beqz	a0,1edc <__clone+0x1a>
	# Parent
	ret
    1eda:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1edc:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ede:	6522                	ld	a0,8(sp)
	jalr a1
    1ee0:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ee2:	05d00893          	li	a7,93
	ecall
    1ee6:	00000073          	ecall
