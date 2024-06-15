
/root/oskernel2024-trustos/pre_ctests/build/riscv64/getcwd:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a861                	j	109a <__start_main>

0000000000001004 <test_getcwd>:
 * 测试通过时输出：
 * "getcwd OK."
 * 测试失败时输出：
 * "getcwd ERROR."
 */
void test_getcwd(void){
    1004:	7175                	add	sp,sp,-144
   TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	ed250513          	add	a0,a0,-302 # 1ed8 <__clone+0x2e>
void test_getcwd(void){
    100e:	e506                	sd	ra,136(sp)
   TEST_START(__func__);
    1010:	2c2000ef          	jal	12d2 <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	f3450513          	add	a0,a0,-204 # 1f48 <__func__.0>
    101c:	2b6000ef          	jal	12d2 <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	ed050513          	add	a0,a0,-304 # 1ef0 <__clone+0x46>
    1028:	2aa000ef          	jal	12d2 <puts>
    char *cwd = NULL;
    char buf[128] = {0};
    102c:	4581                	li	a1,0
    102e:	08000613          	li	a2,128
    1032:	850a                	mv	a0,sp
    1034:	5fe000ef          	jal	1632 <memset>
    cwd = getcwd(buf, 128);
    1038:	08000593          	li	a1,128
    103c:	850a                	mv	a0,sp
    103e:	5f5000ef          	jal	1e32 <getcwd>
    if(cwd != NULL) printf("getcwd: %s successfully!\n", buf);
    1042:	cd0d                	beqz	a0,107c <test_getcwd+0x78>
    1044:	858a                	mv	a1,sp
    1046:	00001517          	auipc	a0,0x1
    104a:	eba50513          	add	a0,a0,-326 # 1f00 <__clone+0x56>
    104e:	2a6000ef          	jal	12f4 <printf>
    else printf("getcwd ERROR.\n");
   TEST_END(__func__);
    1052:	00001517          	auipc	a0,0x1
    1056:	ede50513          	add	a0,a0,-290 # 1f30 <__clone+0x86>
    105a:	278000ef          	jal	12d2 <puts>
    105e:	00001517          	auipc	a0,0x1
    1062:	eea50513          	add	a0,a0,-278 # 1f48 <__func__.0>
    1066:	26c000ef          	jal	12d2 <puts>
    106a:	00001517          	auipc	a0,0x1
    106e:	e8650513          	add	a0,a0,-378 # 1ef0 <__clone+0x46>
    1072:	260000ef          	jal	12d2 <puts>
}
    1076:	60aa                	ld	ra,136(sp)
    1078:	6149                	add	sp,sp,144
    107a:	8082                	ret
    else printf("getcwd ERROR.\n");
    107c:	00001517          	auipc	a0,0x1
    1080:	ea450513          	add	a0,a0,-348 # 1f20 <__clone+0x76>
    1084:	270000ef          	jal	12f4 <printf>
    1088:	b7e9                	j	1052 <test_getcwd+0x4e>

000000000000108a <main>:

int main(void){
    108a:	1141                	add	sp,sp,-16
    108c:	e406                	sd	ra,8(sp)
    test_getcwd();
    108e:	f77ff0ef          	jal	1004 <test_getcwd>
    return 0;
}
    1092:	60a2                	ld	ra,8(sp)
    1094:	4501                	li	a0,0
    1096:	0141                	add	sp,sp,16
    1098:	8082                	ret

000000000000109a <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    109a:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    109c:	4108                	lw	a0,0(a0)
{
    109e:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10a0:	05a1                	add	a1,a1,8
{
    10a2:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10a4:	fe7ff0ef          	jal	108a <main>
    10a8:	41b000ef          	jal	1cc2 <exit>
	return 0;
}
    10ac:	60a2                	ld	ra,8(sp)
    10ae:	4501                	li	a0,0
    10b0:	0141                	add	sp,sp,16
    10b2:	8082                	ret

00000000000010b4 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10b4:	7179                	add	sp,sp,-48
    10b6:	f406                	sd	ra,40(sp)
    10b8:	0005081b          	sext.w	a6,a0
    10bc:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10be:	00055563          	bgez	a0,10c8 <printint.constprop.0+0x14>
        x = -xx;
    10c2:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    10c6:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10c8:	02b8763b          	remuw	a2,a6,a1
    10cc:	00001697          	auipc	a3,0x1
    10d0:	e8c68693          	add	a3,a3,-372 # 1f58 <digits>
    buf[16] = 0;
    10d4:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10d8:	0005871b          	sext.w	a4,a1
    10dc:	1602                	sll	a2,a2,0x20
    10de:	9201                	srl	a2,a2,0x20
    10e0:	9636                	add	a2,a2,a3
    10e2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10e6:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    10ea:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    10ee:	10b86c63          	bltu	a6,a1,1206 <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    10f2:	02e5763b          	remuw	a2,a0,a4
    10f6:	1602                	sll	a2,a2,0x20
    10f8:	9201                	srl	a2,a2,0x20
    10fa:	9636                	add	a2,a2,a3
    10fc:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1100:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1104:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1108:	10e56863          	bltu	a0,a4,1218 <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    110c:	02e5f63b          	remuw	a2,a1,a4
    1110:	1602                	sll	a2,a2,0x20
    1112:	9201                	srl	a2,a2,0x20
    1114:	9636                	add	a2,a2,a3
    1116:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    111a:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    111e:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1122:	10e5e463          	bltu	a1,a4,122a <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    1126:	02e5763b          	remuw	a2,a0,a4
    112a:	1602                	sll	a2,a2,0x20
    112c:	9201                	srl	a2,a2,0x20
    112e:	9636                	add	a2,a2,a3
    1130:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1134:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1138:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    113c:	10e56063          	bltu	a0,a4,123c <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    1140:	02e5f63b          	remuw	a2,a1,a4
    1144:	1602                	sll	a2,a2,0x20
    1146:	9201                	srl	a2,a2,0x20
    1148:	9636                	add	a2,a2,a3
    114a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    114e:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1152:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1156:	0ee5ec63          	bltu	a1,a4,124e <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    115a:	02e5763b          	remuw	a2,a0,a4
    115e:	1602                	sll	a2,a2,0x20
    1160:	9201                	srl	a2,a2,0x20
    1162:	9636                	add	a2,a2,a3
    1164:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1168:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    116c:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1170:	08e56263          	bltu	a0,a4,11f4 <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    1174:	02e5f63b          	remuw	a2,a1,a4
    1178:	1602                	sll	a2,a2,0x20
    117a:	9201                	srl	a2,a2,0x20
    117c:	9636                	add	a2,a2,a3
    117e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1182:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1186:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    118a:	0ce5eb63          	bltu	a1,a4,1260 <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    118e:	02e5763b          	remuw	a2,a0,a4
    1192:	1602                	sll	a2,a2,0x20
    1194:	9201                	srl	a2,a2,0x20
    1196:	9636                	add	a2,a2,a3
    1198:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    119c:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    11a0:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11a4:	0ce56763          	bltu	a0,a4,1272 <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    11a8:	02e5f63b          	remuw	a2,a1,a4
    11ac:	1602                	sll	a2,a2,0x20
    11ae:	9201                	srl	a2,a2,0x20
    11b0:	9636                	add	a2,a2,a3
    11b2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b6:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11ba:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11be:	0ce5e363          	bltu	a1,a4,1284 <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    11c2:	1782                	sll	a5,a5,0x20
    11c4:	9381                	srl	a5,a5,0x20
    11c6:	96be                	add	a3,a3,a5
    11c8:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    11cc:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    11ce:	00f10723          	sb	a5,14(sp)
    if (sign)
    11d2:	00088763          	beqz	a7,11e0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11d6:	02d00793          	li	a5,45
    11da:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    11de:	4595                	li	a1,5
    write(f, s, l);
    11e0:	003c                	add	a5,sp,8
    11e2:	4641                	li	a2,16
    11e4:	9e0d                	subw	a2,a2,a1
    11e6:	4505                	li	a0,1
    11e8:	95be                	add	a1,a1,a5
    11ea:	289000ef          	jal	1c72 <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11ee:	70a2                	ld	ra,40(sp)
    11f0:	6145                	add	sp,sp,48
    11f2:	8082                	ret
    i++;
    11f4:	45a9                	li	a1,10
    if (sign)
    11f6:	fe0885e3          	beqz	a7,11e0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11fa:	02d00793          	li	a5,45
    11fe:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1202:	45a5                	li	a1,9
    1204:	bff1                	j	11e0 <printint.constprop.0+0x12c>
    i++;
    1206:	45bd                	li	a1,15
    if (sign)
    1208:	fc088ce3          	beqz	a7,11e0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    120c:	02d00793          	li	a5,45
    1210:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1214:	45b9                	li	a1,14
    1216:	b7e9                	j	11e0 <printint.constprop.0+0x12c>
    i++;
    1218:	45b9                	li	a1,14
    if (sign)
    121a:	fc0883e3          	beqz	a7,11e0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    121e:	02d00793          	li	a5,45
    1222:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1226:	45b5                	li	a1,13
    1228:	bf65                	j	11e0 <printint.constprop.0+0x12c>
    i++;
    122a:	45b5                	li	a1,13
    if (sign)
    122c:	fa088ae3          	beqz	a7,11e0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1230:	02d00793          	li	a5,45
    1234:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1238:	45b1                	li	a1,12
    123a:	b75d                	j	11e0 <printint.constprop.0+0x12c>
    i++;
    123c:	45b1                	li	a1,12
    if (sign)
    123e:	fa0881e3          	beqz	a7,11e0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1242:	02d00793          	li	a5,45
    1246:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    124a:	45ad                	li	a1,11
    124c:	bf51                	j	11e0 <printint.constprop.0+0x12c>
    i++;
    124e:	45ad                	li	a1,11
    if (sign)
    1250:	f80888e3          	beqz	a7,11e0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1254:	02d00793          	li	a5,45
    1258:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    125c:	45a9                	li	a1,10
    125e:	b749                	j	11e0 <printint.constprop.0+0x12c>
    i++;
    1260:	45a5                	li	a1,9
    if (sign)
    1262:	f6088fe3          	beqz	a7,11e0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1266:	02d00793          	li	a5,45
    126a:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    126e:	45a1                	li	a1,8
    1270:	bf85                	j	11e0 <printint.constprop.0+0x12c>
    i++;
    1272:	45a1                	li	a1,8
    if (sign)
    1274:	f60886e3          	beqz	a7,11e0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1278:	02d00793          	li	a5,45
    127c:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1280:	459d                	li	a1,7
    1282:	bfb9                	j	11e0 <printint.constprop.0+0x12c>
    i++;
    1284:	459d                	li	a1,7
    if (sign)
    1286:	f4088de3          	beqz	a7,11e0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    128a:	02d00793          	li	a5,45
    128e:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1292:	4599                	li	a1,6
    1294:	b7b1                	j	11e0 <printint.constprop.0+0x12c>

0000000000001296 <getchar>:
{
    1296:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    1298:	00f10593          	add	a1,sp,15
    129c:	4605                	li	a2,1
    129e:	4501                	li	a0,0
{
    12a0:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12a2:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12a6:	1c3000ef          	jal	1c68 <read>
}
    12aa:	60e2                	ld	ra,24(sp)
    12ac:	00f14503          	lbu	a0,15(sp)
    12b0:	6105                	add	sp,sp,32
    12b2:	8082                	ret

00000000000012b4 <putchar>:
{
    12b4:	1101                	add	sp,sp,-32
    12b6:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12b8:	00f10593          	add	a1,sp,15
    12bc:	4605                	li	a2,1
    12be:	4505                	li	a0,1
{
    12c0:	ec06                	sd	ra,24(sp)
    char byte = c;
    12c2:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12c6:	1ad000ef          	jal	1c72 <write>
}
    12ca:	60e2                	ld	ra,24(sp)
    12cc:	2501                	sext.w	a0,a0
    12ce:	6105                	add	sp,sp,32
    12d0:	8082                	ret

00000000000012d2 <puts>:
{
    12d2:	1141                	add	sp,sp,-16
    12d4:	e406                	sd	ra,8(sp)
    12d6:	e022                	sd	s0,0(sp)
    12d8:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12da:	55a000ef          	jal	1834 <strlen>
    12de:	862a                	mv	a2,a0
    12e0:	85a2                	mv	a1,s0
    12e2:	4505                	li	a0,1
    12e4:	18f000ef          	jal	1c72 <write>
}
    12e8:	60a2                	ld	ra,8(sp)
    12ea:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12ec:	957d                	sra	a0,a0,0x3f
    return r;
    12ee:	2501                	sext.w	a0,a0
}
    12f0:	0141                	add	sp,sp,16
    12f2:	8082                	ret

00000000000012f4 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12f4:	7131                	add	sp,sp,-192
    12f6:	e4d6                	sd	s5,72(sp)
    12f8:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12fa:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12fc:	013c                	add	a5,sp,136
{
    12fe:	f0ca                	sd	s2,96(sp)
    1300:	ecce                	sd	s3,88(sp)
    1302:	e8d2                	sd	s4,80(sp)
    1304:	e0da                	sd	s6,64(sp)
    1306:	fc5e                	sd	s7,56(sp)
    1308:	fc86                	sd	ra,120(sp)
    130a:	f8a2                	sd	s0,112(sp)
    130c:	f4a6                	sd	s1,104(sp)
    130e:	e52e                	sd	a1,136(sp)
    1310:	e932                	sd	a2,144(sp)
    1312:	ed36                	sd	a3,152(sp)
    1314:	f13a                	sd	a4,160(sp)
    1316:	f942                	sd	a6,176(sp)
    1318:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    131a:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    131c:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1320:	07300a13          	li	s4,115
    1324:	07800b93          	li	s7,120
    1328:	06400b13          	li	s6,100
    buf[i++] = '0';
    132c:	830a8a93          	add	s5,s5,-2000 # 7830 <digits+0x58d8>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1330:	00001997          	auipc	s3,0x1
    1334:	c2898993          	add	s3,s3,-984 # 1f58 <digits>
        if (!*s)
    1338:	00054783          	lbu	a5,0(a0)
    133c:	16078863          	beqz	a5,14ac <printf+0x1b8>
    1340:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1342:	19278063          	beq	a5,s2,14c2 <printf+0x1ce>
    1346:	00164783          	lbu	a5,1(a2)
    134a:	0605                	add	a2,a2,1
    134c:	fbfd                	bnez	a5,1342 <printf+0x4e>
    134e:	84b2                	mv	s1,a2
        l = z - a;
    1350:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1354:	85aa                	mv	a1,a0
    1356:	8622                	mv	a2,s0
    1358:	4505                	li	a0,1
    135a:	119000ef          	jal	1c72 <write>
        if (l)
    135e:	18041763          	bnez	s0,14ec <printf+0x1f8>
        if (s[1] == 0)
    1362:	0014c783          	lbu	a5,1(s1)
    1366:	14078363          	beqz	a5,14ac <printf+0x1b8>
        switch (s[1])
    136a:	19478f63          	beq	a5,s4,1508 <printf+0x214>
    136e:	18fa6163          	bltu	s4,a5,14f0 <printf+0x1fc>
    1372:	1b678e63          	beq	a5,s6,152e <printf+0x23a>
    1376:	07000713          	li	a4,112
    137a:	1ce79463          	bne	a5,a4,1542 <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    137e:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1380:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1384:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1386:	631c                	ld	a5,0(a4)
    1388:	0721                	add	a4,a4,8
    138a:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    138c:	00479293          	sll	t0,a5,0x4
    1390:	00879f93          	sll	t6,a5,0x8
    1394:	00c79f13          	sll	t5,a5,0xc
    1398:	01079e93          	sll	t4,a5,0x10
    139c:	01479e13          	sll	t3,a5,0x14
    13a0:	01879313          	sll	t1,a5,0x18
    13a4:	01c79893          	sll	a7,a5,0x1c
    13a8:	02479813          	sll	a6,a5,0x24
    13ac:	02879513          	sll	a0,a5,0x28
    13b0:	02c79593          	sll	a1,a5,0x2c
    13b4:	03079693          	sll	a3,a5,0x30
    13b8:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13bc:	03c7d413          	srl	s0,a5,0x3c
    13c0:	01c7d39b          	srlw	t2,a5,0x1c
    13c4:	03c2d293          	srl	t0,t0,0x3c
    13c8:	03cfdf93          	srl	t6,t6,0x3c
    13cc:	03cf5f13          	srl	t5,t5,0x3c
    13d0:	03cede93          	srl	t4,t4,0x3c
    13d4:	03ce5e13          	srl	t3,t3,0x3c
    13d8:	03c35313          	srl	t1,t1,0x3c
    13dc:	03c8d893          	srl	a7,a7,0x3c
    13e0:	03c85813          	srl	a6,a6,0x3c
    13e4:	9171                	srl	a0,a0,0x3c
    13e6:	91f1                	srl	a1,a1,0x3c
    13e8:	92f1                	srl	a3,a3,0x3c
    13ea:	9371                	srl	a4,a4,0x3c
    13ec:	974e                	add	a4,a4,s3
    13ee:	944e                	add	s0,s0,s3
    13f0:	92ce                	add	t0,t0,s3
    13f2:	9fce                	add	t6,t6,s3
    13f4:	9f4e                	add	t5,t5,s3
    13f6:	9ece                	add	t4,t4,s3
    13f8:	9e4e                	add	t3,t3,s3
    13fa:	934e                	add	t1,t1,s3
    13fc:	98ce                	add	a7,a7,s3
    13fe:	93ce                	add	t2,t2,s3
    1400:	984e                	add	a6,a6,s3
    1402:	954e                	add	a0,a0,s3
    1404:	95ce                	add	a1,a1,s3
    1406:	96ce                	add	a3,a3,s3
    1408:	00074083          	lbu	ra,0(a4)
    140c:	0002c283          	lbu	t0,0(t0)
    1410:	000fcf83          	lbu	t6,0(t6)
    1414:	000f4f03          	lbu	t5,0(t5)
    1418:	000ece83          	lbu	t4,0(t4)
    141c:	000e4e03          	lbu	t3,0(t3)
    1420:	00034303          	lbu	t1,0(t1)
    1424:	0008c883          	lbu	a7,0(a7)
    1428:	0003c383          	lbu	t2,0(t2)
    142c:	00084803          	lbu	a6,0(a6)
    1430:	00054503          	lbu	a0,0(a0)
    1434:	0005c583          	lbu	a1,0(a1)
    1438:	0006c683          	lbu	a3,0(a3)
    143c:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1440:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1444:	9371                	srl	a4,a4,0x3c
    1446:	8bbd                	and	a5,a5,15
    1448:	974e                	add	a4,a4,s3
    144a:	97ce                	add	a5,a5,s3
    144c:	005105a3          	sb	t0,11(sp)
    1450:	01f10623          	sb	t6,12(sp)
    1454:	01e106a3          	sb	t5,13(sp)
    1458:	01d10723          	sb	t4,14(sp)
    145c:	01c107a3          	sb	t3,15(sp)
    1460:	00610823          	sb	t1,16(sp)
    1464:	011108a3          	sb	a7,17(sp)
    1468:	00710923          	sb	t2,18(sp)
    146c:	010109a3          	sb	a6,19(sp)
    1470:	00a10a23          	sb	a0,20(sp)
    1474:	00b10aa3          	sb	a1,21(sp)
    1478:	00d10b23          	sb	a3,22(sp)
    147c:	00110ba3          	sb	ra,23(sp)
    1480:	00810523          	sb	s0,10(sp)
    1484:	00074703          	lbu	a4,0(a4)
    1488:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    148c:	002c                	add	a1,sp,8
    148e:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1490:	00e10c23          	sb	a4,24(sp)
    1494:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1498:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    149c:	7d6000ef          	jal	1c72 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14a0:	00248513          	add	a0,s1,2
        if (!*s)
    14a4:	00054783          	lbu	a5,0(a0)
    14a8:	e8079ce3          	bnez	a5,1340 <printf+0x4c>
    }
    va_end(ap);
}
    14ac:	70e6                	ld	ra,120(sp)
    14ae:	7446                	ld	s0,112(sp)
    14b0:	74a6                	ld	s1,104(sp)
    14b2:	7906                	ld	s2,96(sp)
    14b4:	69e6                	ld	s3,88(sp)
    14b6:	6a46                	ld	s4,80(sp)
    14b8:	6aa6                	ld	s5,72(sp)
    14ba:	6b06                	ld	s6,64(sp)
    14bc:	7be2                	ld	s7,56(sp)
    14be:	6129                	add	sp,sp,192
    14c0:	8082                	ret
    14c2:	84b2                	mv	s1,a2
    14c4:	a039                	j	14d2 <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14c6:	0024c783          	lbu	a5,2(s1)
    14ca:	0605                	add	a2,a2,1
    14cc:	0489                	add	s1,s1,2
    14ce:	e92791e3          	bne	a5,s2,1350 <printf+0x5c>
    14d2:	0014c783          	lbu	a5,1(s1)
    14d6:	ff2788e3          	beq	a5,s2,14c6 <printf+0x1d2>
        l = z - a;
    14da:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14de:	85aa                	mv	a1,a0
    14e0:	8622                	mv	a2,s0
    14e2:	4505                	li	a0,1
    14e4:	78e000ef          	jal	1c72 <write>
        if (l)
    14e8:	e6040de3          	beqz	s0,1362 <printf+0x6e>
    14ec:	8526                	mv	a0,s1
    14ee:	b5a9                	j	1338 <printf+0x44>
        switch (s[1])
    14f0:	05779963          	bne	a5,s7,1542 <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    14f4:	6782                	ld	a5,0(sp)
    14f6:	45c1                	li	a1,16
    14f8:	4388                	lw	a0,0(a5)
    14fa:	07a1                	add	a5,a5,8
    14fc:	e03e                	sd	a5,0(sp)
    14fe:	bb7ff0ef          	jal	10b4 <printint.constprop.0>
        s += 2;
    1502:	00248513          	add	a0,s1,2
    1506:	bf79                	j	14a4 <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    1508:	6782                	ld	a5,0(sp)
    150a:	6380                	ld	s0,0(a5)
    150c:	07a1                	add	a5,a5,8
    150e:	e03e                	sd	a5,0(sp)
    1510:	cc21                	beqz	s0,1568 <printf+0x274>
            l = strnlen(a, 200);
    1512:	0c800593          	li	a1,200
    1516:	8522                	mv	a0,s0
    1518:	44e000ef          	jal	1966 <strnlen>
    write(f, s, l);
    151c:	0005061b          	sext.w	a2,a0
    1520:	85a2                	mv	a1,s0
    1522:	4505                	li	a0,1
    1524:	74e000ef          	jal	1c72 <write>
        s += 2;
    1528:	00248513          	add	a0,s1,2
    152c:	bfa5                	j	14a4 <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    152e:	6782                	ld	a5,0(sp)
    1530:	45a9                	li	a1,10
    1532:	4388                	lw	a0,0(a5)
    1534:	07a1                	add	a5,a5,8
    1536:	e03e                	sd	a5,0(sp)
    1538:	b7dff0ef          	jal	10b4 <printint.constprop.0>
        s += 2;
    153c:	00248513          	add	a0,s1,2
    1540:	b795                	j	14a4 <printf+0x1b0>
    return write(stdout, &byte, 1);
    1542:	4605                	li	a2,1
    1544:	002c                	add	a1,sp,8
    1546:	4505                	li	a0,1
    char byte = c;
    1548:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    154c:	726000ef          	jal	1c72 <write>
    char byte = c;
    1550:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1554:	4605                	li	a2,1
    1556:	002c                	add	a1,sp,8
    1558:	4505                	li	a0,1
    char byte = c;
    155a:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    155e:	714000ef          	jal	1c72 <write>
        s += 2;
    1562:	00248513          	add	a0,s1,2
    1566:	bf3d                	j	14a4 <printf+0x1b0>
                a = "(null)";
    1568:	00001417          	auipc	s0,0x1
    156c:	9d840413          	add	s0,s0,-1576 # 1f40 <__clone+0x96>
    1570:	b74d                	j	1512 <printf+0x21e>

0000000000001572 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1572:	02000793          	li	a5,32
    1576:	00f50663          	beq	a0,a5,1582 <isspace+0x10>
    157a:	355d                	addw	a0,a0,-9
    157c:	00553513          	sltiu	a0,a0,5
    1580:	8082                	ret
    1582:	4505                	li	a0,1
}
    1584:	8082                	ret

0000000000001586 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1586:	fd05051b          	addw	a0,a0,-48
}
    158a:	00a53513          	sltiu	a0,a0,10
    158e:	8082                	ret

0000000000001590 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1590:	02000713          	li	a4,32
    1594:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1596:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    159a:	ff76879b          	addw	a5,a3,-9
    159e:	06e68063          	beq	a3,a4,15fe <atoi+0x6e>
    15a2:	0006859b          	sext.w	a1,a3
    15a6:	04f67c63          	bgeu	a2,a5,15fe <atoi+0x6e>
        s++;
    switch (*s)
    15aa:	02b00793          	li	a5,43
    15ae:	06f68563          	beq	a3,a5,1618 <atoi+0x88>
    15b2:	02d00793          	li	a5,45
    15b6:	04f69663          	bne	a3,a5,1602 <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15ba:	00154683          	lbu	a3,1(a0)
    15be:	47a5                	li	a5,9
        s++;
    15c0:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    15c4:	fd06869b          	addw	a3,a3,-48
    15c8:	8636                	mv	a2,a3
    while (isdigit(*s))
    15ca:	04d7e563          	bltu	a5,a3,1614 <atoi+0x84>
        neg = 1;
    15ce:	4885                	li	a7,1
    int n = 0, neg = 0;
    15d0:	4501                	li	a0,0
    while (isdigit(*s))
    15d2:	4825                	li	a6,9
    15d4:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    15d8:	0025179b          	sllw	a5,a0,0x2
    15dc:	9fa9                	addw	a5,a5,a0
    15de:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    15e2:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    15e6:	85b2                	mv	a1,a2
    15e8:	40c7853b          	subw	a0,a5,a2
    15ec:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    15ee:	8636                	mv	a2,a3
    while (isdigit(*s))
    15f0:	fed872e3          	bgeu	a6,a3,15d4 <atoi+0x44>
    return neg ? n : -n;
    15f4:	02089163          	bnez	a7,1616 <atoi+0x86>
    15f8:	40f5853b          	subw	a0,a1,a5
    15fc:	8082                	ret
        s++;
    15fe:	0505                	add	a0,a0,1
    1600:	bf59                	j	1596 <atoi+0x6>
    while (isdigit(*s))
    1602:	fd05859b          	addw	a1,a1,-48
    1606:	47a5                	li	a5,9
    1608:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    160a:	4881                	li	a7,0
    160c:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    1610:	fcb7f0e3          	bgeu	a5,a1,15d0 <atoi+0x40>
    return neg ? n : -n;
    1614:	4501                	li	a0,0
}
    1616:	8082                	ret
    while (isdigit(*s))
    1618:	00154683          	lbu	a3,1(a0)
    161c:	47a5                	li	a5,9
        s++;
    161e:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    1622:	fd06869b          	addw	a3,a3,-48
    1626:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    1628:	4881                	li	a7,0
    while (isdigit(*s))
    162a:	fad7f3e3          	bgeu	a5,a3,15d0 <atoi+0x40>
    return neg ? n : -n;
    162e:	4501                	li	a0,0
    1630:	8082                	ret

0000000000001632 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1632:	16060f63          	beqz	a2,17b0 <memset+0x17e>
    1636:	40a006b3          	neg	a3,a0
    163a:	0076f793          	and	a5,a3,7
    163e:	00778813          	add	a6,a5,7
    1642:	48ad                	li	a7,11
    1644:	0ff5f713          	zext.b	a4,a1
    1648:	fff60593          	add	a1,a2,-1
    164c:	17186363          	bltu	a6,a7,17b2 <memset+0x180>
    1650:	1705eb63          	bltu	a1,a6,17c6 <memset+0x194>
    1654:	16078163          	beqz	a5,17b6 <memset+0x184>
    1658:	00e50023          	sb	a4,0(a0)
    165c:	0066f593          	and	a1,a3,6
    1660:	14058e63          	beqz	a1,17bc <memset+0x18a>
    1664:	00e500a3          	sb	a4,1(a0)
    1668:	4589                	li	a1,2
    166a:	00250813          	add	a6,a0,2
    166e:	04f5f663          	bgeu	a1,a5,16ba <memset+0x88>
    1672:	00e50123          	sb	a4,2(a0)
    1676:	8a91                	and	a3,a3,4
    1678:	00350813          	add	a6,a0,3
    167c:	458d                	li	a1,3
    167e:	ce95                	beqz	a3,16ba <memset+0x88>
    1680:	00e501a3          	sb	a4,3(a0)
    1684:	4691                	li	a3,4
    1686:	00450813          	add	a6,a0,4
    168a:	4591                	li	a1,4
    168c:	02f6f763          	bgeu	a3,a5,16ba <memset+0x88>
    1690:	00e50223          	sb	a4,4(a0)
    1694:	4695                	li	a3,5
    1696:	00550813          	add	a6,a0,5
    169a:	4595                	li	a1,5
    169c:	00d78f63          	beq	a5,a3,16ba <memset+0x88>
    16a0:	00e502a3          	sb	a4,5(a0)
    16a4:	469d                	li	a3,7
    16a6:	00650813          	add	a6,a0,6
    16aa:	4599                	li	a1,6
    16ac:	00d79763          	bne	a5,a3,16ba <memset+0x88>
    16b0:	00750813          	add	a6,a0,7
    16b4:	00e50323          	sb	a4,6(a0)
    16b8:	459d                	li	a1,7
    16ba:	00871693          	sll	a3,a4,0x8
    16be:	01071313          	sll	t1,a4,0x10
    16c2:	8ed9                	or	a3,a3,a4
    16c4:	01871893          	sll	a7,a4,0x18
    16c8:	0066e6b3          	or	a3,a3,t1
    16cc:	0116e6b3          	or	a3,a3,a7
    16d0:	02071313          	sll	t1,a4,0x20
    16d4:	02871893          	sll	a7,a4,0x28
    16d8:	0066e6b3          	or	a3,a3,t1
    16dc:	40f60e33          	sub	t3,a2,a5
    16e0:	03071313          	sll	t1,a4,0x30
    16e4:	0116e6b3          	or	a3,a3,a7
    16e8:	0066e6b3          	or	a3,a3,t1
    16ec:	03871893          	sll	a7,a4,0x38
    16f0:	97aa                	add	a5,a5,a0
    16f2:	ff8e7313          	and	t1,t3,-8
    16f6:	0116e6b3          	or	a3,a3,a7
    16fa:	00f308b3          	add	a7,t1,a5
    16fe:	e394                	sd	a3,0(a5)
    1700:	07a1                	add	a5,a5,8
    1702:	ff179ee3          	bne	a5,a7,16fe <memset+0xcc>
    1706:	006806b3          	add	a3,a6,t1
    170a:	00b307bb          	addw	a5,t1,a1
    170e:	0bc30b63          	beq	t1,t3,17c4 <memset+0x192>
    1712:	00e68023          	sb	a4,0(a3)
    1716:	0017859b          	addw	a1,a5,1
    171a:	08c5fb63          	bgeu	a1,a2,17b0 <memset+0x17e>
    171e:	00e680a3          	sb	a4,1(a3)
    1722:	0027859b          	addw	a1,a5,2
    1726:	08c5f563          	bgeu	a1,a2,17b0 <memset+0x17e>
    172a:	00e68123          	sb	a4,2(a3)
    172e:	0037859b          	addw	a1,a5,3
    1732:	06c5ff63          	bgeu	a1,a2,17b0 <memset+0x17e>
    1736:	00e681a3          	sb	a4,3(a3)
    173a:	0047859b          	addw	a1,a5,4
    173e:	06c5f963          	bgeu	a1,a2,17b0 <memset+0x17e>
    1742:	00e68223          	sb	a4,4(a3)
    1746:	0057859b          	addw	a1,a5,5
    174a:	06c5f363          	bgeu	a1,a2,17b0 <memset+0x17e>
    174e:	00e682a3          	sb	a4,5(a3)
    1752:	0067859b          	addw	a1,a5,6
    1756:	04c5fd63          	bgeu	a1,a2,17b0 <memset+0x17e>
    175a:	00e68323          	sb	a4,6(a3)
    175e:	0077859b          	addw	a1,a5,7
    1762:	04c5f763          	bgeu	a1,a2,17b0 <memset+0x17e>
    1766:	00e683a3          	sb	a4,7(a3)
    176a:	0087859b          	addw	a1,a5,8
    176e:	04c5f163          	bgeu	a1,a2,17b0 <memset+0x17e>
    1772:	00e68423          	sb	a4,8(a3)
    1776:	0097859b          	addw	a1,a5,9
    177a:	02c5fb63          	bgeu	a1,a2,17b0 <memset+0x17e>
    177e:	00e684a3          	sb	a4,9(a3)
    1782:	00a7859b          	addw	a1,a5,10
    1786:	02c5f563          	bgeu	a1,a2,17b0 <memset+0x17e>
    178a:	00e68523          	sb	a4,10(a3)
    178e:	00b7859b          	addw	a1,a5,11
    1792:	00c5ff63          	bgeu	a1,a2,17b0 <memset+0x17e>
    1796:	00e685a3          	sb	a4,11(a3)
    179a:	00c7859b          	addw	a1,a5,12
    179e:	00c5f963          	bgeu	a1,a2,17b0 <memset+0x17e>
    17a2:	00e68623          	sb	a4,12(a3)
    17a6:	27b5                	addw	a5,a5,13
    17a8:	00c7f463          	bgeu	a5,a2,17b0 <memset+0x17e>
    17ac:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    17b0:	8082                	ret
    17b2:	482d                	li	a6,11
    17b4:	bd71                	j	1650 <memset+0x1e>
    char *p = dest;
    17b6:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17b8:	4581                	li	a1,0
    17ba:	b701                	j	16ba <memset+0x88>
    17bc:	00150813          	add	a6,a0,1
    17c0:	4585                	li	a1,1
    17c2:	bde5                	j	16ba <memset+0x88>
    17c4:	8082                	ret
    char *p = dest;
    17c6:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    17c8:	4781                	li	a5,0
    17ca:	b7a1                	j	1712 <memset+0xe0>

00000000000017cc <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17cc:	00054783          	lbu	a5,0(a0)
    17d0:	0005c703          	lbu	a4,0(a1)
    17d4:	00e79863          	bne	a5,a4,17e4 <strcmp+0x18>
    17d8:	0505                	add	a0,a0,1
    17da:	0585                	add	a1,a1,1
    17dc:	fbe5                	bnez	a5,17cc <strcmp>
    17de:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    17e0:	9d19                	subw	a0,a0,a4
    17e2:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    17e4:	0007851b          	sext.w	a0,a5
    17e8:	bfe5                	j	17e0 <strcmp+0x14>

00000000000017ea <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    17ea:	ca15                	beqz	a2,181e <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17ec:	00054783          	lbu	a5,0(a0)
    if (!n--)
    17f0:	167d                	add	a2,a2,-1
    17f2:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17f6:	eb99                	bnez	a5,180c <strncmp+0x22>
    17f8:	a815                	j	182c <strncmp+0x42>
    17fa:	00a68e63          	beq	a3,a0,1816 <strncmp+0x2c>
    17fe:	0505                	add	a0,a0,1
    1800:	00f71b63          	bne	a4,a5,1816 <strncmp+0x2c>
    1804:	00054783          	lbu	a5,0(a0)
    1808:	cf89                	beqz	a5,1822 <strncmp+0x38>
    180a:	85b2                	mv	a1,a2
    180c:	0005c703          	lbu	a4,0(a1)
    1810:	00158613          	add	a2,a1,1
    1814:	f37d                	bnez	a4,17fa <strncmp+0x10>
        ;
    return *l - *r;
    1816:	0007851b          	sext.w	a0,a5
    181a:	9d19                	subw	a0,a0,a4
    181c:	8082                	ret
        return 0;
    181e:	4501                	li	a0,0
}
    1820:	8082                	ret
    return *l - *r;
    1822:	0015c703          	lbu	a4,1(a1)
    1826:	4501                	li	a0,0
    1828:	9d19                	subw	a0,a0,a4
    182a:	8082                	ret
    182c:	0005c703          	lbu	a4,0(a1)
    1830:	4501                	li	a0,0
    1832:	b7e5                	j	181a <strncmp+0x30>

0000000000001834 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1834:	00757793          	and	a5,a0,7
    1838:	cf89                	beqz	a5,1852 <strlen+0x1e>
    183a:	87aa                	mv	a5,a0
    183c:	a029                	j	1846 <strlen+0x12>
    183e:	0785                	add	a5,a5,1
    1840:	0077f713          	and	a4,a5,7
    1844:	cb01                	beqz	a4,1854 <strlen+0x20>
        if (!*s)
    1846:	0007c703          	lbu	a4,0(a5)
    184a:	fb75                	bnez	a4,183e <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    184c:	40a78533          	sub	a0,a5,a0
}
    1850:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1852:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1854:	feff05b7          	lui	a1,0xfeff0
    1858:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <digits+0xfffffffffefedfa7>
    185c:	f0101637          	lui	a2,0xf0101
    1860:	05c2                	sll	a1,a1,0x10
    1862:	0612                	sll	a2,a2,0x4
    1864:	6394                	ld	a3,0(a5)
    1866:	eff58593          	add	a1,a1,-257
    186a:	10160613          	add	a2,a2,257 # fffffffff0101101 <digits+0xfffffffff00ff1a9>
    186e:	05c2                	sll	a1,a1,0x10
    1870:	0642                	sll	a2,a2,0x10
    1872:	eff58593          	add	a1,a1,-257
    1876:	10160613          	add	a2,a2,257
    187a:	00b68733          	add	a4,a3,a1
    187e:	063e                	sll	a2,a2,0xf
    1880:	fff6c693          	not	a3,a3
    1884:	8f75                	and	a4,a4,a3
    1886:	08060613          	add	a2,a2,128
    188a:	8f71                	and	a4,a4,a2
    188c:	eb11                	bnez	a4,18a0 <strlen+0x6c>
    188e:	6794                	ld	a3,8(a5)
    1890:	07a1                	add	a5,a5,8
    1892:	00b68733          	add	a4,a3,a1
    1896:	fff6c693          	not	a3,a3
    189a:	8f75                	and	a4,a4,a3
    189c:	8f71                	and	a4,a4,a2
    189e:	db65                	beqz	a4,188e <strlen+0x5a>
    for (; *s; s++)
    18a0:	0007c703          	lbu	a4,0(a5)
    18a4:	d745                	beqz	a4,184c <strlen+0x18>
    18a6:	0017c703          	lbu	a4,1(a5)
    18aa:	0785                	add	a5,a5,1
    18ac:	d345                	beqz	a4,184c <strlen+0x18>
    18ae:	0017c703          	lbu	a4,1(a5)
    18b2:	0785                	add	a5,a5,1
    18b4:	fb6d                	bnez	a4,18a6 <strlen+0x72>
    18b6:	bf59                	j	184c <strlen+0x18>

00000000000018b8 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18b8:	00757713          	and	a4,a0,7
{
    18bc:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18be:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18c2:	cb19                	beqz	a4,18d8 <memchr+0x20>
    18c4:	ce59                	beqz	a2,1962 <memchr+0xaa>
    18c6:	0007c703          	lbu	a4,0(a5)
    18ca:	00b70963          	beq	a4,a1,18dc <memchr+0x24>
    18ce:	0785                	add	a5,a5,1
    18d0:	0077f713          	and	a4,a5,7
    18d4:	167d                	add	a2,a2,-1
    18d6:	f77d                	bnez	a4,18c4 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18d8:	4501                	li	a0,0
    if (n && *s != c)
    18da:	c649                	beqz	a2,1964 <memchr+0xac>
    18dc:	0007c703          	lbu	a4,0(a5)
    18e0:	06b70663          	beq	a4,a1,194c <memchr+0x94>
        size_t k = ONES * c;
    18e4:	01010737          	lui	a4,0x1010
    18e8:	10170713          	add	a4,a4,257 # 1010101 <digits+0x100e1a9>
    18ec:	0742                	sll	a4,a4,0x10
    18ee:	10170713          	add	a4,a4,257
    18f2:	0742                	sll	a4,a4,0x10
    18f4:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18f8:	469d                	li	a3,7
        size_t k = ONES * c;
    18fa:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18fe:	04c6f763          	bgeu	a3,a2,194c <memchr+0x94>
    1902:	f0101837          	lui	a6,0xf0101
    1906:	feff08b7          	lui	a7,0xfeff0
    190a:	0812                	sll	a6,a6,0x4
    190c:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <digits+0xfffffffffefedfa7>
    1910:	10180813          	add	a6,a6,257 # fffffffff0101101 <digits+0xfffffffff00ff1a9>
    1914:	08c2                	sll	a7,a7,0x10
    1916:	0842                	sll	a6,a6,0x10
    1918:	eff88893          	add	a7,a7,-257
    191c:	10180813          	add	a6,a6,257
    1920:	08c2                	sll	a7,a7,0x10
    1922:	083e                	sll	a6,a6,0xf
    1924:	eff88893          	add	a7,a7,-257
    1928:	08080813          	add	a6,a6,128
    192c:	431d                	li	t1,7
    192e:	a029                	j	1938 <memchr+0x80>
    1930:	1661                	add	a2,a2,-8
    1932:	07a1                	add	a5,a5,8
    1934:	02c37663          	bgeu	t1,a2,1960 <memchr+0xa8>
    1938:	6398                	ld	a4,0(a5)
    193a:	8f29                	xor	a4,a4,a0
    193c:	011706b3          	add	a3,a4,a7
    1940:	fff74713          	not	a4,a4
    1944:	8f75                	and	a4,a4,a3
    1946:	01077733          	and	a4,a4,a6
    194a:	d37d                	beqz	a4,1930 <memchr+0x78>
        s = (const void *)w;
    194c:	853e                	mv	a0,a5
    194e:	a019                	j	1954 <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    1950:	0505                	add	a0,a0,1
    1952:	ca01                	beqz	a2,1962 <memchr+0xaa>
    1954:	00054783          	lbu	a5,0(a0)
    1958:	167d                	add	a2,a2,-1
    195a:	feb79be3          	bne	a5,a1,1950 <memchr+0x98>
    195e:	8082                	ret
    1960:	f675                	bnez	a2,194c <memchr+0x94>
    return n ? (void *)s : 0;
    1962:	4501                	li	a0,0
}
    1964:	8082                	ret

0000000000001966 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1966:	1101                	add	sp,sp,-32
    1968:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    196a:	862e                	mv	a2,a1
{
    196c:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    196e:	4581                	li	a1,0
{
    1970:	e426                	sd	s1,8(sp)
    1972:	ec06                	sd	ra,24(sp)
    1974:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1976:	f43ff0ef          	jal	18b8 <memchr>
    return p ? p - s : n;
    197a:	c519                	beqz	a0,1988 <strnlen+0x22>
}
    197c:	60e2                	ld	ra,24(sp)
    197e:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1980:	8d05                	sub	a0,a0,s1
}
    1982:	64a2                	ld	s1,8(sp)
    1984:	6105                	add	sp,sp,32
    1986:	8082                	ret
    1988:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    198a:	8522                	mv	a0,s0
}
    198c:	6442                	ld	s0,16(sp)
    198e:	64a2                	ld	s1,8(sp)
    1990:	6105                	add	sp,sp,32
    1992:	8082                	ret

0000000000001994 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1994:	00b547b3          	xor	a5,a0,a1
    1998:	8b9d                	and	a5,a5,7
    199a:	efb1                	bnez	a5,19f6 <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    199c:	0075f793          	and	a5,a1,7
    19a0:	ebb5                	bnez	a5,1a14 <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19a2:	feff0637          	lui	a2,0xfeff0
    19a6:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <digits+0xfffffffffefedfa7>
    19aa:	f01016b7          	lui	a3,0xf0101
    19ae:	0642                	sll	a2,a2,0x10
    19b0:	0692                	sll	a3,a3,0x4
    19b2:	6198                	ld	a4,0(a1)
    19b4:	eff60613          	add	a2,a2,-257
    19b8:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff1a9>
    19bc:	0642                	sll	a2,a2,0x10
    19be:	06c2                	sll	a3,a3,0x10
    19c0:	eff60613          	add	a2,a2,-257
    19c4:	10168693          	add	a3,a3,257
    19c8:	00c707b3          	add	a5,a4,a2
    19cc:	fff74813          	not	a6,a4
    19d0:	06be                	sll	a3,a3,0xf
    19d2:	0107f7b3          	and	a5,a5,a6
    19d6:	08068693          	add	a3,a3,128
    19da:	8ff5                	and	a5,a5,a3
    19dc:	ef89                	bnez	a5,19f6 <strcpy+0x62>
    19de:	05a1                	add	a1,a1,8
    19e0:	e118                	sd	a4,0(a0)
    19e2:	6198                	ld	a4,0(a1)
    19e4:	0521                	add	a0,a0,8
    19e6:	00c707b3          	add	a5,a4,a2
    19ea:	fff74813          	not	a6,a4
    19ee:	0107f7b3          	and	a5,a5,a6
    19f2:	8ff5                	and	a5,a5,a3
    19f4:	d7ed                	beqz	a5,19de <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19f6:	0005c783          	lbu	a5,0(a1)
    19fa:	00f50023          	sb	a5,0(a0)
    19fe:	c785                	beqz	a5,1a26 <strcpy+0x92>
    1a00:	0015c783          	lbu	a5,1(a1)
    1a04:	0505                	add	a0,a0,1
    1a06:	0585                	add	a1,a1,1
    1a08:	00f50023          	sb	a5,0(a0)
    1a0c:	fbf5                	bnez	a5,1a00 <strcpy+0x6c>
        ;
    return d;
}
    1a0e:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a10:	0505                	add	a0,a0,1
    1a12:	db41                	beqz	a4,19a2 <strcpy+0xe>
            if (!(*d = *s))
    1a14:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a18:	0585                	add	a1,a1,1
    1a1a:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a1e:	00f50023          	sb	a5,0(a0)
    1a22:	f7fd                	bnez	a5,1a10 <strcpy+0x7c>
}
    1a24:	8082                	ret
    1a26:	8082                	ret

0000000000001a28 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a28:	00b547b3          	xor	a5,a0,a1
    1a2c:	8b9d                	and	a5,a5,7
    1a2e:	efbd                	bnez	a5,1aac <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a30:	0075f793          	and	a5,a1,7
    1a34:	1c078563          	beqz	a5,1bfe <strncpy+0x1d6>
    1a38:	ea11                	bnez	a2,1a4c <strncpy+0x24>
    1a3a:	8082                	ret
    1a3c:	0585                	add	a1,a1,1
    1a3e:	0075f793          	and	a5,a1,7
    1a42:	167d                	add	a2,a2,-1
    1a44:	0505                	add	a0,a0,1
    1a46:	1a078c63          	beqz	a5,1bfe <strncpy+0x1d6>
    1a4a:	ca3d                	beqz	a2,1ac0 <strncpy+0x98>
    1a4c:	0005c783          	lbu	a5,0(a1)
    1a50:	00f50023          	sb	a5,0(a0)
    1a54:	f7e5                	bnez	a5,1a3c <strncpy+0x14>
            ;
        if (!n || !*s)
    1a56:	0005c783          	lbu	a5,0(a1)
    1a5a:	c7a5                	beqz	a5,1ac2 <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a5c:	479d                	li	a5,7
    1a5e:	04c7f863          	bgeu	a5,a2,1aae <strncpy+0x86>
    1a62:	f01016b7          	lui	a3,0xf0101
    1a66:	feff0837          	lui	a6,0xfeff0
    1a6a:	0692                	sll	a3,a3,0x4
    1a6c:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <digits+0xfffffffffefedfa7>
    1a70:	10168693          	add	a3,a3,257 # fffffffff0101101 <digits+0xfffffffff00ff1a9>
    1a74:	0842                	sll	a6,a6,0x10
    1a76:	06c2                	sll	a3,a3,0x10
    1a78:	eff80813          	add	a6,a6,-257
    1a7c:	10168693          	add	a3,a3,257
    1a80:	0842                	sll	a6,a6,0x10
    1a82:	06be                	sll	a3,a3,0xf
    1a84:	eff80813          	add	a6,a6,-257
    1a88:	08068693          	add	a3,a3,128
    1a8c:	431d                	li	t1,7
    1a8e:	6198                	ld	a4,0(a1)
    1a90:	010707b3          	add	a5,a4,a6
    1a94:	fff74893          	not	a7,a4
    1a98:	0117f7b3          	and	a5,a5,a7
    1a9c:	8ff5                	and	a5,a5,a3
    1a9e:	eb81                	bnez	a5,1aae <strncpy+0x86>
            *wd = *ws;
    1aa0:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1aa2:	1661                	add	a2,a2,-8
    1aa4:	05a1                	add	a1,a1,8
    1aa6:	0521                	add	a0,a0,8
    1aa8:	fec363e3          	bltu	t1,a2,1a8e <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1aac:	ca11                	beqz	a2,1ac0 <strncpy+0x98>
    1aae:	0005c783          	lbu	a5,0(a1)
    1ab2:	0585                	add	a1,a1,1
    1ab4:	00f50023          	sb	a5,0(a0)
    1ab8:	c789                	beqz	a5,1ac2 <strncpy+0x9a>
    1aba:	167d                	add	a2,a2,-1
    1abc:	0505                	add	a0,a0,1
    1abe:	fa65                	bnez	a2,1aae <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1ac0:	8082                	ret
    1ac2:	40a00733          	neg	a4,a0
    1ac6:	00777793          	and	a5,a4,7
    1aca:	00778693          	add	a3,a5,7
    1ace:	482d                	li	a6,11
    1ad0:	fff60593          	add	a1,a2,-1
    1ad4:	1106ef63          	bltu	a3,a6,1bf2 <strncpy+0x1ca>
    1ad8:	12d5ee63          	bltu	a1,a3,1c14 <strncpy+0x1ec>
    1adc:	12078563          	beqz	a5,1c06 <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ae0:	00050023          	sb	zero,0(a0)
    1ae4:	00677693          	and	a3,a4,6
    1ae8:	12068263          	beqz	a3,1c0c <strncpy+0x1e4>
    1aec:	000500a3          	sb	zero,1(a0)
    1af0:	4689                	li	a3,2
    1af2:	12f6f463          	bgeu	a3,a5,1c1a <strncpy+0x1f2>
    1af6:	00050123          	sb	zero,2(a0)
    1afa:	8b11                	and	a4,a4,4
    1afc:	cf6d                	beqz	a4,1bf6 <strncpy+0x1ce>
    1afe:	000501a3          	sb	zero,3(a0)
    1b02:	4711                	li	a4,4
    1b04:	00450693          	add	a3,a0,4
    1b08:	02f77363          	bgeu	a4,a5,1b2e <strncpy+0x106>
    1b0c:	00050223          	sb	zero,4(a0)
    1b10:	4715                	li	a4,5
    1b12:	00550693          	add	a3,a0,5
    1b16:	00e78c63          	beq	a5,a4,1b2e <strncpy+0x106>
    1b1a:	000502a3          	sb	zero,5(a0)
    1b1e:	471d                	li	a4,7
    1b20:	10e79163          	bne	a5,a4,1c22 <strncpy+0x1fa>
    1b24:	00750693          	add	a3,a0,7
    1b28:	00050323          	sb	zero,6(a0)
    1b2c:	471d                	li	a4,7
    1b2e:	40f608b3          	sub	a7,a2,a5
    1b32:	ff88f813          	and	a6,a7,-8
    1b36:	97aa                	add	a5,a5,a0
    1b38:	010785b3          	add	a1,a5,a6
    1b3c:	0007b023          	sd	zero,0(a5)
    1b40:	07a1                	add	a5,a5,8
    1b42:	feb79de3          	bne	a5,a1,1b3c <strncpy+0x114>
    1b46:	00e807bb          	addw	a5,a6,a4
    1b4a:	01068733          	add	a4,a3,a6
    1b4e:	0b088b63          	beq	a7,a6,1c04 <strncpy+0x1dc>
    1b52:	00070023          	sb	zero,0(a4)
    1b56:	0017869b          	addw	a3,a5,1
    1b5a:	f6c6f3e3          	bgeu	a3,a2,1ac0 <strncpy+0x98>
    1b5e:	000700a3          	sb	zero,1(a4)
    1b62:	0027869b          	addw	a3,a5,2
    1b66:	f4c6fde3          	bgeu	a3,a2,1ac0 <strncpy+0x98>
    1b6a:	00070123          	sb	zero,2(a4)
    1b6e:	0037869b          	addw	a3,a5,3
    1b72:	f4c6f7e3          	bgeu	a3,a2,1ac0 <strncpy+0x98>
    1b76:	000701a3          	sb	zero,3(a4)
    1b7a:	0047869b          	addw	a3,a5,4
    1b7e:	f4c6f1e3          	bgeu	a3,a2,1ac0 <strncpy+0x98>
    1b82:	00070223          	sb	zero,4(a4)
    1b86:	0057869b          	addw	a3,a5,5
    1b8a:	f2c6fbe3          	bgeu	a3,a2,1ac0 <strncpy+0x98>
    1b8e:	000702a3          	sb	zero,5(a4)
    1b92:	0067869b          	addw	a3,a5,6
    1b96:	f2c6f5e3          	bgeu	a3,a2,1ac0 <strncpy+0x98>
    1b9a:	00070323          	sb	zero,6(a4)
    1b9e:	0077869b          	addw	a3,a5,7
    1ba2:	f0c6ffe3          	bgeu	a3,a2,1ac0 <strncpy+0x98>
    1ba6:	000703a3          	sb	zero,7(a4)
    1baa:	0087869b          	addw	a3,a5,8
    1bae:	f0c6f9e3          	bgeu	a3,a2,1ac0 <strncpy+0x98>
    1bb2:	00070423          	sb	zero,8(a4)
    1bb6:	0097869b          	addw	a3,a5,9
    1bba:	f0c6f3e3          	bgeu	a3,a2,1ac0 <strncpy+0x98>
    1bbe:	000704a3          	sb	zero,9(a4)
    1bc2:	00a7869b          	addw	a3,a5,10
    1bc6:	eec6fde3          	bgeu	a3,a2,1ac0 <strncpy+0x98>
    1bca:	00070523          	sb	zero,10(a4)
    1bce:	00b7869b          	addw	a3,a5,11
    1bd2:	eec6f7e3          	bgeu	a3,a2,1ac0 <strncpy+0x98>
    1bd6:	000705a3          	sb	zero,11(a4)
    1bda:	00c7869b          	addw	a3,a5,12
    1bde:	eec6f1e3          	bgeu	a3,a2,1ac0 <strncpy+0x98>
    1be2:	00070623          	sb	zero,12(a4)
    1be6:	27b5                	addw	a5,a5,13
    1be8:	ecc7fce3          	bgeu	a5,a2,1ac0 <strncpy+0x98>
    1bec:	000706a3          	sb	zero,13(a4)
}
    1bf0:	8082                	ret
    1bf2:	46ad                	li	a3,11
    1bf4:	b5d5                	j	1ad8 <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bf6:	00350693          	add	a3,a0,3
    1bfa:	470d                	li	a4,3
    1bfc:	bf0d                	j	1b2e <strncpy+0x106>
        if (!n || !*s)
    1bfe:	e4061ce3          	bnez	a2,1a56 <strncpy+0x2e>
}
    1c02:	8082                	ret
    1c04:	8082                	ret
    char *p = dest;
    1c06:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c08:	4701                	li	a4,0
    1c0a:	b715                	j	1b2e <strncpy+0x106>
    1c0c:	00150693          	add	a3,a0,1
    1c10:	4705                	li	a4,1
    1c12:	bf31                	j	1b2e <strncpy+0x106>
    char *p = dest;
    1c14:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c16:	4781                	li	a5,0
    1c18:	bf2d                	j	1b52 <strncpy+0x12a>
    1c1a:	00250693          	add	a3,a0,2
    1c1e:	4709                	li	a4,2
    1c20:	b739                	j	1b2e <strncpy+0x106>
    1c22:	00650693          	add	a3,a0,6
    1c26:	4719                	li	a4,6
    1c28:	b719                	j	1b2e <strncpy+0x106>

0000000000001c2a <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c2a:	87aa                	mv	a5,a0
    1c2c:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c2e:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c32:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c36:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c38:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c3a:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c3e:	2501                	sext.w	a0,a0
    1c40:	8082                	ret

0000000000001c42 <openat>:
    register long a7 __asm__("a7") = n;
    1c42:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c46:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c4a:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c4e:	2501                	sext.w	a0,a0
    1c50:	8082                	ret

0000000000001c52 <fcntl>:
    register long a7 __asm__("a7") = n;
    1c52:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c54:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    1c58:	2501                	sext.w	a0,a0
    1c5a:	8082                	ret

0000000000001c5c <close>:
    register long a7 __asm__("a7") = n;
    1c5c:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c60:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c64:	2501                	sext.w	a0,a0
    1c66:	8082                	ret

0000000000001c68 <read>:
    register long a7 __asm__("a7") = n;
    1c68:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c6c:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c70:	8082                	ret

0000000000001c72 <write>:
    register long a7 __asm__("a7") = n;
    1c72:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c76:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c7a:	8082                	ret

0000000000001c7c <getpid>:
    register long a7 __asm__("a7") = n;
    1c7c:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c80:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c84:	2501                	sext.w	a0,a0
    1c86:	8082                	ret

0000000000001c88 <getppid>:
    register long a7 __asm__("a7") = n;
    1c88:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c8c:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c90:	2501                	sext.w	a0,a0
    1c92:	8082                	ret

0000000000001c94 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c94:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c98:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c9c:	2501                	sext.w	a0,a0
    1c9e:	8082                	ret

0000000000001ca0 <fork>:
    register long a7 __asm__("a7") = n;
    1ca0:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1ca4:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1ca6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ca8:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cac:	2501                	sext.w	a0,a0
    1cae:	8082                	ret

0000000000001cb0 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cb0:	85b2                	mv	a1,a2
    1cb2:	863a                	mv	a2,a4
    if (stack)
    1cb4:	c191                	beqz	a1,1cb8 <clone+0x8>
	stack += stack_size;
    1cb6:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cb8:	4781                	li	a5,0
    1cba:	4701                	li	a4,0
    1cbc:	4681                	li	a3,0
    1cbe:	2601                	sext.w	a2,a2
    1cc0:	a2ed                	j	1eaa <__clone>

0000000000001cc2 <exit>:
    register long a7 __asm__("a7") = n;
    1cc2:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cc6:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cca:	8082                	ret

0000000000001ccc <waitpid>:
    register long a7 __asm__("a7") = n;
    1ccc:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cd0:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cd2:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cd6:	2501                	sext.w	a0,a0
    1cd8:	8082                	ret

0000000000001cda <exec>:
    register long a7 __asm__("a7") = n;
    1cda:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cde:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1ce2:	2501                	sext.w	a0,a0
    1ce4:	8082                	ret

0000000000001ce6 <execve>:
    register long a7 __asm__("a7") = n;
    1ce6:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cea:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cee:	2501                	sext.w	a0,a0
    1cf0:	8082                	ret

0000000000001cf2 <times>:
    register long a7 __asm__("a7") = n;
    1cf2:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cf6:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1cfa:	2501                	sext.w	a0,a0
    1cfc:	8082                	ret

0000000000001cfe <get_time>:

int64 get_time()
{
    1cfe:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d00:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d04:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d06:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d08:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d0c:	2501                	sext.w	a0,a0
    1d0e:	ed09                	bnez	a0,1d28 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d10:	67a2                	ld	a5,8(sp)
    1d12:	3e800713          	li	a4,1000
    1d16:	00015503          	lhu	a0,0(sp)
    1d1a:	02e7d7b3          	divu	a5,a5,a4
    1d1e:	02e50533          	mul	a0,a0,a4
    1d22:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d24:	0141                	add	sp,sp,16
    1d26:	8082                	ret
        return -1;
    1d28:	557d                	li	a0,-1
    1d2a:	bfed                	j	1d24 <get_time+0x26>

0000000000001d2c <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d2c:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d30:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d34:	2501                	sext.w	a0,a0
    1d36:	8082                	ret

0000000000001d38 <time>:
    register long a7 __asm__("a7") = n;
    1d38:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d3c:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d40:	2501                	sext.w	a0,a0
    1d42:	8082                	ret

0000000000001d44 <sleep>:

int sleep(unsigned long long time)
{
    1d44:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d46:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d48:	850a                	mv	a0,sp
    1d4a:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d4c:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d50:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d52:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d56:	e501                	bnez	a0,1d5e <sleep+0x1a>
    return 0;
    1d58:	4501                	li	a0,0
}
    1d5a:	0141                	add	sp,sp,16
    1d5c:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d5e:	4502                	lw	a0,0(sp)
}
    1d60:	0141                	add	sp,sp,16
    1d62:	8082                	ret

0000000000001d64 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d64:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d68:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d6c:	2501                	sext.w	a0,a0
    1d6e:	8082                	ret

0000000000001d70 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d70:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d74:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d78:	8082                	ret

0000000000001d7a <munmap>:
    register long a7 __asm__("a7") = n;
    1d7a:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d7e:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d82:	2501                	sext.w	a0,a0
    1d84:	8082                	ret

0000000000001d86 <wait>:

int wait(int *code)
{
    1d86:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d88:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d8c:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d8e:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d90:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d92:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d96:	2501                	sext.w	a0,a0
    1d98:	8082                	ret

0000000000001d9a <spawn>:
    register long a7 __asm__("a7") = n;
    1d9a:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d9e:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1da2:	2501                	sext.w	a0,a0
    1da4:	8082                	ret

0000000000001da6 <mailread>:
    register long a7 __asm__("a7") = n;
    1da6:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1daa:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dae:	2501                	sext.w	a0,a0
    1db0:	8082                	ret

0000000000001db2 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1db2:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1db6:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dba:	2501                	sext.w	a0,a0
    1dbc:	8082                	ret

0000000000001dbe <fstat>:
    register long a7 __asm__("a7") = n;
    1dbe:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc2:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dc6:	2501                	sext.w	a0,a0
    1dc8:	8082                	ret

0000000000001dca <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dca:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dcc:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dd0:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dd2:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1dd6:	2501                	sext.w	a0,a0
    1dd8:	8082                	ret

0000000000001dda <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1dda:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ddc:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1de0:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de2:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1de6:	2501                	sext.w	a0,a0
    1de8:	8082                	ret

0000000000001dea <link>:

int link(char *old_path, char *new_path)
{
    1dea:	87aa                	mv	a5,a0
    1dec:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1dee:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1df2:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1df6:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1df8:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1dfc:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dfe:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e02:	2501                	sext.w	a0,a0
    1e04:	8082                	ret

0000000000001e06 <unlink>:

int unlink(char *path)
{
    1e06:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e08:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e0c:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e10:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e12:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e16:	2501                	sext.w	a0,a0
    1e18:	8082                	ret

0000000000001e1a <uname>:
    register long a7 __asm__("a7") = n;
    1e1a:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e1e:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e22:	2501                	sext.w	a0,a0
    1e24:	8082                	ret

0000000000001e26 <brk>:
    register long a7 __asm__("a7") = n;
    1e26:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e2a:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e2e:	2501                	sext.w	a0,a0
    1e30:	8082                	ret

0000000000001e32 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e32:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e34:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e38:	8082                	ret

0000000000001e3a <chdir>:
    register long a7 __asm__("a7") = n;
    1e3a:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e3e:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e42:	2501                	sext.w	a0,a0
    1e44:	8082                	ret

0000000000001e46 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e46:	862e                	mv	a2,a1
    1e48:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e4a:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e4c:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e50:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e54:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e56:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e58:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e5c:	2501                	sext.w	a0,a0
    1e5e:	8082                	ret

0000000000001e60 <getdents>:
    register long a7 __asm__("a7") = n;
    1e60:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e64:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e68:	2501                	sext.w	a0,a0
    1e6a:	8082                	ret

0000000000001e6c <pipe>:
    register long a7 __asm__("a7") = n;
    1e6c:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e70:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e72:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e76:	2501                	sext.w	a0,a0
    1e78:	8082                	ret

0000000000001e7a <dup>:
    register long a7 __asm__("a7") = n;
    1e7a:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e7c:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e80:	2501                	sext.w	a0,a0
    1e82:	8082                	ret

0000000000001e84 <dup2>:
    register long a7 __asm__("a7") = n;
    1e84:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e86:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e88:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e8c:	2501                	sext.w	a0,a0
    1e8e:	8082                	ret

0000000000001e90 <mount>:
    register long a7 __asm__("a7") = n;
    1e90:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e94:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e98:	2501                	sext.w	a0,a0
    1e9a:	8082                	ret

0000000000001e9c <umount>:
    register long a7 __asm__("a7") = n;
    1e9c:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ea0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea2:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ea6:	2501                	sext.w	a0,a0
    1ea8:	8082                	ret

0000000000001eaa <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1eaa:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1eac:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1eae:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1eb0:	8532                	mv	a0,a2
	mv a2, a4
    1eb2:	863a                	mv	a2,a4
	mv a3, a5
    1eb4:	86be                	mv	a3,a5
	mv a4, a6
    1eb6:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1eb8:	0dc00893          	li	a7,220
	ecall
    1ebc:	00000073          	ecall

	beqz a0, 1f
    1ec0:	c111                	beqz	a0,1ec4 <__clone+0x1a>
	# Parent
	ret
    1ec2:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ec4:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ec6:	6522                	ld	a0,8(sp)
	jalr a1
    1ec8:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1eca:	05d00893          	li	a7,93
	ecall
    1ece:	00000073          	ecall
