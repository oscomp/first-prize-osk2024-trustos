
/home/brightnight/OScompetition/6.13晚final_main/oskernel2024-trustos/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/mmaptest：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	6c90006f          	j	1eca <__start_main>

0000000000001006 <err>:
  exit(0);
}

char *testname = "???";

void err(char *why) {
    1006:	1101                	addi	sp,sp,-32
    1008:	ec06                	sd	ra,24(sp)
    100a:	e822                	sd	s0,16(sp)
    100c:	e426                	sd	s1,8(sp)
    100e:	842a                	mv	s0,a0
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1010:	00002497          	auipc	s1,0x2
    1014:	5f04b483          	ld	s1,1520(s1) # 3600 <testname>
    1018:	291010ef          	jal	ra,2aa8 <getpid>
    101c:	86aa                	mv	a3,a0
    101e:	8622                	mv	a2,s0
    1020:	85a6                	mv	a1,s1
    1022:	00002517          	auipc	a0,0x2
    1026:	cde50513          	addi	a0,a0,-802 # 2d00 <__clone+0x2a>
    102a:	134010ef          	jal	ra,215e <printf>
  exit(1);
}
    102e:	6442                	ld	s0,16(sp)
    1030:	60e2                	ld	ra,24(sp)
    1032:	64a2                	ld	s1,8(sp)
  exit(1);
    1034:	4505                	li	a0,1
}
    1036:	6105                	addi	sp,sp,32
  exit(1);
    1038:	2b70106f          	j	2aee <exit>

000000000000103c <_v1>:

//
// check the content of the two mapped pages.
//
void _v1(char *p) {
    103c:	7159                	addi	sp,sp,-112
    103e:	e4ce                	sd	s3,72(sp)
  int i;
  for (i = 0; i < PGSIZE * 2; i++) {
    if (i < PGSIZE + (PGSIZE / 2)) {
    1040:	6985                	lui	s3,0x1
void _v1(char *p) {
    1042:	f0a2                	sd	s0,96(sp)
    1044:	eca6                	sd	s1,88(sp)
    1046:	e8ca                	sd	s2,80(sp)
    1048:	e0d2                	sd	s4,64(sp)
    104a:	fc56                	sd	s5,56(sp)
    104c:	f85a                	sd	s6,48(sp)
    104e:	f45e                	sd	s7,40(sp)
    1050:	f062                	sd	s8,32(sp)
    1052:	ec66                	sd	s9,24(sp)
    1054:	e86a                	sd	s10,16(sp)
    1056:	f486                	sd	ra,104(sp)
    1058:	e46e                	sd	s11,8(sp)
    105a:	84aa                	mv	s1,a0
    105c:	4905                	li	s2,1
    105e:	4401                	li	s0,0
    if (i < PGSIZE + (PGSIZE / 2)) {
    1060:	7ff98993          	addi	s3,s3,2047 # 17ff <mmap_test+0x5c9>
  for (i = 0; i < PGSIZE * 2; i++) {
    1064:	6b89                	lui	s7,0x2
               (uint64)(p + i));
        err("v1 mismatch (1)");
      }
    } else {
      if (p[i] != 0) {
        printf("mismatch at %d, wanted zero, got 0x%x\n", i, p[i]);
    1066:	00002c97          	auipc	s9,0x2
    106a:	d0ac8c93          	addi	s9,s9,-758 # 2d70 <__clone+0x9a>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    106e:	00002b17          	auipc	s6,0x2
    1072:	592b0b13          	addi	s6,s6,1426 # 3600 <testname>
    1076:	00002c17          	auipc	s8,0x2
    107a:	d22c0c13          	addi	s8,s8,-734 # 2d98 <__clone+0xc2>
    107e:	00002a97          	auipc	s5,0x2
    1082:	c82a8a93          	addi	s5,s5,-894 # 2d00 <__clone+0x2a>
      if (p[i] != 'A') {
    1086:	04100a13          	li	s4,65
        printf("mismatch at %d,wanted 'A', got 0x%x,wrong addr=%p\n", i, p[i],
    108a:	00002d17          	auipc	s10,0x2
    108e:	c9ed0d13          	addi	s10,s10,-866 # 2d28 <__clone+0x52>
    1092:	a815                	j	10c6 <_v1+0x8a>
    1094:	86a6                	mv	a3,s1
    1096:	856a                	mv	a0,s10
      if (p[i] != 'A') {
    1098:	03460463          	beq	a2,s4,10c0 <_v1+0x84>
        printf("mismatch at %d,wanted 'A', got 0x%x,wrong addr=%p\n", i, p[i],
    109c:	0c2010ef          	jal	ra,215e <printf>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    10a0:	000b3d83          	ld	s11,0(s6)
    10a4:	205010ef          	jal	ra,2aa8 <getpid>
    10a8:	86aa                	mv	a3,a0
    10aa:	00002617          	auipc	a2,0x2
    10ae:	cb660613          	addi	a2,a2,-842 # 2d60 <__clone+0x8a>
    10b2:	8556                	mv	a0,s5
    10b4:	85ee                	mv	a1,s11
    10b6:	0a8010ef          	jal	ra,215e <printf>
  exit(1);
    10ba:	4505                	li	a0,1
    10bc:	233010ef          	jal	ra,2aee <exit>
    10c0:	0405                	addi	s0,s0,1
    10c2:	0485                	addi	s1,s1,1
    10c4:	2905                	addiw	s2,s2,1
      if (p[i] != 'A') {
    10c6:	0004c603          	lbu	a2,0(s1)
    10ca:	0004059b          	sext.w	a1,s0
    if (i < PGSIZE + (PGSIZE / 2)) {
    10ce:	fc89f3e3          	bgeu	s3,s0,1094 <_v1+0x58>
      if (p[i] != 0) {
    10d2:	e215                	bnez	a2,10f6 <_v1+0xba>
  for (i = 0; i < PGSIZE * 2; i++) {
    10d4:	ff7916e3          	bne	s2,s7,10c0 <_v1+0x84>
        err("v1 mismatch (2)");
      }
    }
  }
}
    10d8:	70a6                	ld	ra,104(sp)
    10da:	7406                	ld	s0,96(sp)
    10dc:	64e6                	ld	s1,88(sp)
    10de:	6946                	ld	s2,80(sp)
    10e0:	69a6                	ld	s3,72(sp)
    10e2:	6a06                	ld	s4,64(sp)
    10e4:	7ae2                	ld	s5,56(sp)
    10e6:	7b42                	ld	s6,48(sp)
    10e8:	7ba2                	ld	s7,40(sp)
    10ea:	7c02                	ld	s8,32(sp)
    10ec:	6ce2                	ld	s9,24(sp)
    10ee:	6d42                	ld	s10,16(sp)
    10f0:	6da2                	ld	s11,8(sp)
    10f2:	6165                	addi	sp,sp,112
    10f4:	8082                	ret
        printf("mismatch at %d, wanted zero, got 0x%x\n", i, p[i]);
    10f6:	8566                	mv	a0,s9
    10f8:	066010ef          	jal	ra,215e <printf>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    10fc:	000b3d83          	ld	s11,0(s6)
    1100:	1a9010ef          	jal	ra,2aa8 <getpid>
    1104:	86aa                	mv	a3,a0
    1106:	8662                	mv	a2,s8
    1108:	8556                	mv	a0,s5
    110a:	85ee                	mv	a1,s11
    110c:	052010ef          	jal	ra,215e <printf>
  exit(1);
    1110:	4505                	li	a0,1
    1112:	1dd010ef          	jal	ra,2aee <exit>
  for (i = 0; i < PGSIZE * 2; i++) {
    1116:	fb7915e3          	bne	s2,s7,10c0 <_v1+0x84>
    111a:	bf7d                	j	10d8 <_v1+0x9c>

000000000000111c <makefile>:

//
// create a file to be mapped, containing
// 1.5 pages of 'A' and half a page of zeros.
//
void makefile(const char *f) {
    111c:	7139                	addi	sp,sp,-64
    111e:	fc06                	sd	ra,56(sp)
    1120:	f822                	sd	s0,48(sp)
    1122:	f426                	sd	s1,40(sp)
    1124:	842a                	mv	s0,a0
    1126:	f04a                	sd	s2,32(sp)
    1128:	ec4e                	sd	s3,24(sp)
    112a:	e852                	sd	s4,16(sp)
    112c:	e456                	sd	s5,8(sp)
    112e:	e05a                	sd	s6,0(sp)
  int i;
  int n = PGSIZE / BSIZE;

  unlink(f);
    1130:	303010ef          	jal	ra,2c32 <unlink>
  int fd = open(f, O_WRONLY | O_CREATE);
    1134:	04100593          	li	a1,65
    1138:	8522                	mv	a0,s0
    113a:	11d010ef          	jal	ra,2a56 <open>
  if (fd == -1)
    113e:	57fd                	li	a5,-1
  int fd = open(f, O_WRONLY | O_CREATE);
    1140:	84aa                	mv	s1,a0
  if (fd == -1)
    1142:	08f50663          	beq	a0,a5,11ce <makefile+0xb2>
    err("open");
  memset(buf, 'A', BSIZE);
    1146:	40000613          	li	a2,1024
    114a:	04100593          	li	a1,65
    114e:	00002517          	auipc	a0,0x2
    1152:	09a50513          	addi	a0,a0,154 # 31e8 <buf>
    1156:	34c010ef          	jal	ra,24a2 <memset>
    115a:	4419                	li	s0,6
  // write 1.5 page
  for (i = 0; i < n + n / 2; i++) {
    if (write(fd, buf, BSIZE) != BSIZE)
    115c:	00002917          	auipc	s2,0x2
    1160:	08c90913          	addi	s2,s2,140 # 31e8 <buf>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1164:	00002b17          	auipc	s6,0x2
    1168:	49cb0b13          	addi	s6,s6,1180 # 3600 <testname>
    116c:	00002a97          	auipc	s5,0x2
    1170:	c44a8a93          	addi	s5,s5,-956 # 2db0 <__clone+0xda>
    1174:	00002a17          	auipc	s4,0x2
    1178:	b8ca0a13          	addi	s4,s4,-1140 # 2d00 <__clone+0x2a>
    if (write(fd, buf, BSIZE) != BSIZE)
    117c:	40000613          	li	a2,1024
    1180:	85ca                	mv	a1,s2
    1182:	8526                	mv	a0,s1
    1184:	11b010ef          	jal	ra,2a9e <write>
    1188:	40000793          	li	a5,1024
  for (i = 0; i < n + n / 2; i++) {
    118c:	347d                	addiw	s0,s0,-1
    if (write(fd, buf, BSIZE) != BSIZE)
    118e:	00f50f63          	beq	a0,a5,11ac <makefile+0x90>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1192:	000b3983          	ld	s3,0(s6)
    1196:	113010ef          	jal	ra,2aa8 <getpid>
    119a:	86aa                	mv	a3,a0
    119c:	8656                	mv	a2,s5
    119e:	8552                	mv	a0,s4
    11a0:	85ce                	mv	a1,s3
    11a2:	7bd000ef          	jal	ra,215e <printf>
  exit(1);
    11a6:	4505                	li	a0,1
    11a8:	147010ef          	jal	ra,2aee <exit>
  for (i = 0; i < n + n / 2; i++) {
    11ac:	f861                	bnez	s0,117c <makefile+0x60>
      err("write 0 makefile");
  }
  if (close(fd) == -1)
    11ae:	8526                	mv	a0,s1
    11b0:	0d9010ef          	jal	ra,2a88 <close>
    11b4:	57fd                	li	a5,-1
    11b6:	04f50263          	beq	a0,a5,11fa <makefile+0xde>
    err("close");
}
    11ba:	70e2                	ld	ra,56(sp)
    11bc:	7442                	ld	s0,48(sp)
    11be:	74a2                	ld	s1,40(sp)
    11c0:	7902                	ld	s2,32(sp)
    11c2:	69e2                	ld	s3,24(sp)
    11c4:	6a42                	ld	s4,16(sp)
    11c6:	6aa2                	ld	s5,8(sp)
    11c8:	6b02                	ld	s6,0(sp)
    11ca:	6121                	addi	sp,sp,64
    11cc:	8082                	ret
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    11ce:	00002417          	auipc	s0,0x2
    11d2:	43243403          	ld	s0,1074(s0) # 3600 <testname>
    11d6:	0d3010ef          	jal	ra,2aa8 <getpid>
    11da:	86aa                	mv	a3,a0
    11dc:	00002617          	auipc	a2,0x2
    11e0:	bcc60613          	addi	a2,a2,-1076 # 2da8 <__clone+0xd2>
    11e4:	00002517          	auipc	a0,0x2
    11e8:	b1c50513          	addi	a0,a0,-1252 # 2d00 <__clone+0x2a>
    11ec:	85a2                	mv	a1,s0
    11ee:	771000ef          	jal	ra,215e <printf>
  exit(1);
    11f2:	4505                	li	a0,1
    11f4:	0fb010ef          	jal	ra,2aee <exit>
}
    11f8:	b7b9                	j	1146 <makefile+0x2a>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    11fa:	00002417          	auipc	s0,0x2
    11fe:	40643403          	ld	s0,1030(s0) # 3600 <testname>
    1202:	0a7010ef          	jal	ra,2aa8 <getpid>
    1206:	86aa                	mv	a3,a0
    1208:	85a2                	mv	a1,s0
    120a:	00002517          	auipc	a0,0x2
    120e:	af650513          	addi	a0,a0,-1290 # 2d00 <__clone+0x2a>
    1212:	00002617          	auipc	a2,0x2
    1216:	bb660613          	addi	a2,a2,-1098 # 2dc8 <__clone+0xf2>
    121a:	745000ef          	jal	ra,215e <printf>
}
    121e:	7442                	ld	s0,48(sp)
    1220:	70e2                	ld	ra,56(sp)
    1222:	74a2                	ld	s1,40(sp)
    1224:	7902                	ld	s2,32(sp)
    1226:	69e2                	ld	s3,24(sp)
    1228:	6a42                	ld	s4,16(sp)
    122a:	6aa2                	ld	s5,8(sp)
    122c:	6b02                	ld	s6,0(sp)
  exit(1);
    122e:	4505                	li	a0,1
}
    1230:	6121                	addi	sp,sp,64
  exit(1);
    1232:	0bd0106f          	j	2aee <exit>

0000000000001236 <mmap_test>:

void mmap_test(void) {
    1236:	711d                	addi	sp,sp,-96
  int fd;
  int i;
  const char *const f = "mmap.dur";
  printf("mmap_test starting\n");
    1238:	00002517          	auipc	a0,0x2
    123c:	b9850513          	addi	a0,a0,-1128 # 2dd0 <__clone+0xfa>
void mmap_test(void) {
    1240:	ec86                	sd	ra,88(sp)
    1242:	e8a2                	sd	s0,80(sp)
    1244:	e4a6                	sd	s1,72(sp)
    1246:	e0ca                	sd	s2,64(sp)
    1248:	fc4e                	sd	s3,56(sp)
    124a:	f852                	sd	s4,48(sp)
    124c:	f456                	sd	s5,40(sp)
    124e:	f05a                	sd	s6,32(sp)
    1250:	ec5e                	sd	s7,24(sp)
    1252:	e862                	sd	s8,16(sp)
  printf("mmap_test starting\n");
    1254:	70b000ef          	jal	ra,215e <printf>
  testname = "mmap_test";
    1258:	00002797          	auipc	a5,0x2
    125c:	b9078793          	addi	a5,a5,-1136 # 2de8 <__clone+0x112>
  //
  // create a file with known content, map it into memory, check that
  // the mapped memory has the same bytes as originally written to the
  // file.
  //
  makefile(f);
    1260:	00002517          	auipc	a0,0x2
    1264:	b9850513          	addi	a0,a0,-1128 # 2df8 <__clone+0x122>
  testname = "mmap_test";
    1268:	00002497          	auipc	s1,0x2
    126c:	39848493          	addi	s1,s1,920 # 3600 <testname>
    1270:	e09c                	sd	a5,0(s1)
  makefile(f);
    1272:	eabff0ef          	jal	ra,111c <makefile>
  if ((fd = open(f, O_RDONLY)) == -1)
    1276:	4581                	li	a1,0
    1278:	00002517          	auipc	a0,0x2
    127c:	b8050513          	addi	a0,a0,-1152 # 2df8 <__clone+0x122>
    1280:	7d6010ef          	jal	ra,2a56 <open>
    1284:	57fd                	li	a5,-1
    1286:	842a                	mv	s0,a0
    1288:	76f50063          	beq	a0,a5,19e8 <mmap_test+0x7b2>
    err("open");

  printf("test mmap f\n");
    128c:	00002517          	auipc	a0,0x2
    1290:	b7c50513          	addi	a0,a0,-1156 # 2e08 <__clone+0x132>
    1294:	6cb000ef          	jal	ra,215e <printf>
  // same file (of course in this case updates are prohibited
  // due to PROT_READ). the fifth argument is the file descriptor
  // of the file to be mapped. the last argument is the starting
  // offset in the file.
  //
  char *p = mmap(0, PGSIZE * 2, PROT_READ, MAP_PRIVATE, fd, 0);
    1298:	4781                	li	a5,0
    129a:	8722                	mv	a4,s0
    129c:	4689                	li	a3,2
    129e:	4605                	li	a2,1
    12a0:	6589                	lui	a1,0x2
    12a2:	4501                	li	a0,0
    12a4:	0f9010ef          	jal	ra,2b9c <mmap>
  if (p == MAP_FAILED)
    12a8:	57fd                	li	a5,-1
  char *p = mmap(0, PGSIZE * 2, PROT_READ, MAP_PRIVATE, fd, 0);
    12aa:	892a                	mv	s2,a0
  if (p == MAP_FAILED)
    12ac:	18f50ce3          	beq	a0,a5,1c44 <mmap_test+0xa0e>
    err("mmap (1)");
  _v1(p);
    12b0:	854a                	mv	a0,s2
    12b2:	d8bff0ef          	jal	ra,103c <_v1>
  if (munmap(p, PGSIZE * 2) == -1)
    12b6:	6589                	lui	a1,0x2
    12b8:	854a                	mv	a0,s2
    12ba:	0ed010ef          	jal	ra,2ba6 <munmap>
    12be:	57fd                	li	a5,-1
    12c0:	6af50963          	beq	a0,a5,1972 <mmap_test+0x73c>
    err("munmap (1)");

  printf("test mmap f: OK\n");
    12c4:	00002517          	auipc	a0,0x2
    12c8:	b7450513          	addi	a0,a0,-1164 # 2e38 <__clone+0x162>
    12cc:	693000ef          	jal	ra,215e <printf>

  printf("test mmap private\n");
    12d0:	00002517          	auipc	a0,0x2
    12d4:	b8050513          	addi	a0,a0,-1152 # 2e50 <__clone+0x17a>
    12d8:	687000ef          	jal	ra,215e <printf>
  // should be able to map file opened read-only with private writable
  // mapping
  p = mmap(0, PGSIZE * 2, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0);
    12dc:	4781                	li	a5,0
    12de:	8722                	mv	a4,s0
    12e0:	4689                	li	a3,2
    12e2:	460d                	li	a2,3
    12e4:	6589                	lui	a1,0x2
    12e6:	4501                	li	a0,0
    12e8:	0b5010ef          	jal	ra,2b9c <mmap>
  if (p == MAP_FAILED)
    12ec:	59fd                	li	s3,-1
  p = mmap(0, PGSIZE * 2, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0);
    12ee:	892a                	mv	s2,a0
  if (p == MAP_FAILED)
    12f0:	113504e3          	beq	a0,s3,1bf8 <mmap_test+0x9c2>
    err("mmap (2)");
  if (close(fd) == -1)
    12f4:	8522                	mv	a0,s0
    12f6:	792010ef          	jal	ra,2a88 <close>
    12fa:	71350c63          	beq	a0,s3,1a12 <mmap_test+0x7dc>
    err("close");
  _v1(p);
    12fe:	854a                	mv	a0,s2
    1300:	d3dff0ef          	jal	ra,103c <_v1>
  for (i = 0; i < PGSIZE * 2; i++)
    1304:	41200733          	neg	a4,s2
    1308:	8b1d                	andi	a4,a4,7
    130a:	72070e63          	beqz	a4,1a46 <mmap_test+0x810>
    p[i] = 'Z';
    130e:	05a00793          	li	a5,90
    1312:	00f90023          	sb	a5,0(s2)
  for (i = 0; i < PGSIZE * 2; i++)
    1316:	4685                	li	a3,1
    1318:	12d700e3          	beq	a4,a3,1c38 <mmap_test+0xa02>
    p[i] = 'Z';
    131c:	00f900a3          	sb	a5,1(s2)
  for (i = 0; i < PGSIZE * 2; i++)
    1320:	4689                	li	a3,2
    1322:	14d70be3          	beq	a4,a3,1c78 <mmap_test+0xa42>
    p[i] = 'Z';
    1326:	00f90123          	sb	a5,2(s2)
  for (i = 0; i < PGSIZE * 2; i++)
    132a:	468d                	li	a3,3
    132c:	14d70ce3          	beq	a4,a3,1c84 <mmap_test+0xa4e>
    p[i] = 'Z';
    1330:	00f901a3          	sb	a5,3(s2)
  for (i = 0; i < PGSIZE * 2; i++)
    1334:	4691                	li	a3,4
    1336:	00d70fe3          	beq	a4,a3,1b54 <mmap_test+0x91e>
    p[i] = 'Z';
    133a:	00f90223          	sb	a5,4(s2)
  for (i = 0; i < PGSIZE * 2; i++)
    133e:	4695                	li	a3,5
    1340:	16d702e3          	beq	a4,a3,1ca4 <mmap_test+0xa6e>
    p[i] = 'Z';
    1344:	00f902a3          	sb	a5,5(s2)
  for (i = 0; i < PGSIZE * 2; i++)
    1348:	469d                	li	a3,7
    134a:	16d718e3          	bne	a4,a3,1cba <mmap_test+0xa84>
    p[i] = 'Z';
    134e:	00f90323          	sb	a5,6(s2)
  for (i = 0; i < PGSIZE * 2; i++)
    1352:	6789                	lui	a5,0x2
    1354:	ff978513          	addi	a0,a5,-7 # 1ff9 <printint.constprop.0+0x115>
    1358:	489d                	li	a7,7
    135a:	6589                	lui	a1,0x2
    135c:	9d99                	subw	a1,a1,a4
    135e:	0035d69b          	srliw	a3,a1,0x3
    1362:	36fd                	addiw	a3,a3,-1
    1364:	02069793          	slli	a5,a3,0x20
    1368:	974a                	add	a4,a4,s2
    136a:	01d7d693          	srli	a3,a5,0x1d
    136e:	00002417          	auipc	s0,0x2
    1372:	e5a40413          	addi	s0,s0,-422 # 31c8 <__clone+0x4f2>
    1376:	00870793          	addi	a5,a4,8
    p[i] = 'Z';
    137a:	6010                	ld	a2,0(s0)
    137c:	0005881b          	sext.w	a6,a1
    1380:	96be                	add	a3,a3,a5
    1382:	a011                	j	1386 <mmap_test+0x150>
    1384:	07a1                	addi	a5,a5,8
    1386:	e310                	sd	a2,0(a4)
  for (i = 0; i < PGSIZE * 2; i++)
    1388:	873e                	mv	a4,a5
    138a:	fed79de3          	bne	a5,a3,1384 <mmap_test+0x14e>
    138e:	99e1                	andi	a1,a1,-8
    1390:	0115873b          	addw	a4,a1,a7
    1394:	2581                	sext.w	a1,a1
    1396:	863a                	mv	a2,a4
    1398:	06b80863          	beq	a6,a1,1408 <mmap_test+0x1d2>
    p[i] = 'Z';
    139c:	9d0d                	subw	a0,a0,a1
    139e:	974a                	add	a4,a4,s2
    13a0:	05a00593          	li	a1,90
    13a4:	00b70023          	sb	a1,0(a4)
  for (i = 0; i < PGSIZE * 2; i++)
    13a8:	fff5069b          	addiw	a3,a0,-1
    13ac:	0016071b          	addiw	a4,a2,1
    13b0:	cea1                	beqz	a3,1408 <mmap_test+0x1d2>
    p[i] = 'Z';
    13b2:	974a                	add	a4,a4,s2
    13b4:	00b70023          	sb	a1,0(a4)
  for (i = 0; i < PGSIZE * 2; i++)
    13b8:	ffe5069b          	addiw	a3,a0,-2
    13bc:	0026071b          	addiw	a4,a2,2
    13c0:	c6a1                	beqz	a3,1408 <mmap_test+0x1d2>
    p[i] = 'Z';
    13c2:	974a                	add	a4,a4,s2
    13c4:	00b70023          	sb	a1,0(a4)
  for (i = 0; i < PGSIZE * 2; i++)
    13c8:	ffd5069b          	addiw	a3,a0,-3
    13cc:	0036071b          	addiw	a4,a2,3
    13d0:	ce85                	beqz	a3,1408 <mmap_test+0x1d2>
    p[i] = 'Z';
    13d2:	974a                	add	a4,a4,s2
    13d4:	00b70023          	sb	a1,0(a4)
  for (i = 0; i < PGSIZE * 2; i++)
    13d8:	ffc5069b          	addiw	a3,a0,-4
    13dc:	0046071b          	addiw	a4,a2,4
    13e0:	c685                	beqz	a3,1408 <mmap_test+0x1d2>
    p[i] = 'Z';
    13e2:	974a                	add	a4,a4,s2
    13e4:	00b70023          	sb	a1,0(a4)
  for (i = 0; i < PGSIZE * 2; i++)
    13e8:	ffb5079b          	addiw	a5,a0,-5
    13ec:	0056071b          	addiw	a4,a2,5
    13f0:	cf81                	beqz	a5,1408 <mmap_test+0x1d2>
    p[i] = 'Z';
    13f2:	974a                	add	a4,a4,s2
    13f4:	00b70023          	sb	a1,0(a4)
  for (i = 0; i < PGSIZE * 2; i++)
    13f8:	4719                	li	a4,6
    13fa:	0066079b          	addiw	a5,a2,6
    13fe:	00e50563          	beq	a0,a4,1408 <mmap_test+0x1d2>
    p[i] = 'Z';
    1402:	97ca                	add	a5,a5,s2
    1404:	00b78023          	sb	a1,0(a5)
  if (munmap(p, PGSIZE * 2) == -1)
    1408:	6589                	lui	a1,0x2
    140a:	854a                	mv	a0,s2
    140c:	79a010ef          	jal	ra,2ba6 <munmap>
    1410:	57fd                	li	a5,-1
    1412:	70f50c63          	beq	a0,a5,1b2a <mmap_test+0x8f4>
    err("munmap (2)");

  printf("test mmap private: OK\n");
    1416:	00002517          	auipc	a0,0x2
    141a:	a7250513          	addi	a0,a0,-1422 # 2e88 <__clone+0x1b2>
    141e:	541000ef          	jal	ra,215e <printf>

  printf("test mmap read-only\n");
    1422:	00002517          	auipc	a0,0x2
    1426:	a7e50513          	addi	a0,a0,-1410 # 2ea0 <__clone+0x1ca>
    142a:	535000ef          	jal	ra,215e <printf>

  // check that mmap doesn't allow read/write mapping of a
  // file opened read-only.
  if ((fd = open(f, O_RDONLY)) == -1)
    142e:	4581                	li	a1,0
    1430:	00002517          	auipc	a0,0x2
    1434:	9c850513          	addi	a0,a0,-1592 # 2df8 <__clone+0x122>
    1438:	61e010ef          	jal	ra,2a56 <open>
    143c:	57fd                	li	a5,-1
    143e:	892a                	mv	s2,a0
    1440:	6cf50063          	beq	a0,a5,1b00 <mmap_test+0x8ca>
    err("open");
  p = mmap(0, PGSIZE * 3, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    1444:	4781                	li	a5,0
    1446:	874a                	mv	a4,s2
    1448:	4685                	li	a3,1
    144a:	460d                	li	a2,3
    144c:	658d                	lui	a1,0x3
    144e:	4501                	li	a0,0
    1450:	74c010ef          	jal	ra,2b9c <mmap>
  if (p != MAP_FAILED)
    1454:	57fd                	li	a5,-1
    1456:	02f50563          	beq	a0,a5,1480 <mmap_test+0x24a>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    145a:	0004b983          	ld	s3,0(s1)
    145e:	64a010ef          	jal	ra,2aa8 <getpid>
    1462:	86aa                	mv	a3,a0
    1464:	00002617          	auipc	a2,0x2
    1468:	a5460613          	addi	a2,a2,-1452 # 2eb8 <__clone+0x1e2>
    146c:	00002517          	auipc	a0,0x2
    1470:	89450513          	addi	a0,a0,-1900 # 2d00 <__clone+0x2a>
    1474:	85ce                	mv	a1,s3
    1476:	4e9000ef          	jal	ra,215e <printf>
  exit(1);
    147a:	4505                	li	a0,1
    147c:	672010ef          	jal	ra,2aee <exit>
    err("mmap call should have failed");
  if (close(fd) == -1)
    1480:	854a                	mv	a0,s2
    1482:	606010ef          	jal	ra,2a88 <close>
    1486:	57fd                	li	a5,-1
    1488:	64f50863          	beq	a0,a5,1ad8 <mmap_test+0x8a2>
    err("close");

  printf("test mmap read-only: OK\n");
    148c:	00002517          	auipc	a0,0x2
    1490:	a4c50513          	addi	a0,a0,-1460 # 2ed8 <__clone+0x202>
    1494:	4cb000ef          	jal	ra,215e <printf>

  printf("test mmap read/write\n");
    1498:	00002517          	auipc	a0,0x2
    149c:	a6050513          	addi	a0,a0,-1440 # 2ef8 <__clone+0x222>
    14a0:	4bf000ef          	jal	ra,215e <printf>
  //   char *p;
  // check that mmap does allow read/write mapping of a
  // file opened read/write.
  if ((fd = open(f, O_RDWR)) == -1)
    14a4:	4589                	li	a1,2
    14a6:	00002517          	auipc	a0,0x2
    14aa:	95250513          	addi	a0,a0,-1710 # 2df8 <__clone+0x122>
    14ae:	5a8010ef          	jal	ra,2a56 <open>
    14b2:	57fd                	li	a5,-1
    14b4:	892a                	mv	s2,a0
    14b6:	5ef50d63          	beq	a0,a5,1ab0 <mmap_test+0x87a>
    err("open");
  p = mmap(0, PGSIZE * 3, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    14ba:	4781                	li	a5,0
    14bc:	874a                	mv	a4,s2
    14be:	4685                	li	a3,1
    14c0:	460d                	li	a2,3
    14c2:	658d                	lui	a1,0x3
    14c4:	4501                	li	a0,0
    14c6:	6d6010ef          	jal	ra,2b9c <mmap>
  if (p == MAP_FAILED)
    14ca:	59fd                	li	s3,-1
  p = mmap(0, PGSIZE * 3, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    14cc:	8c2a                	mv	s8,a0
  if (p == MAP_FAILED)
    14ce:	6f350063          	beq	a0,s3,1bae <mmap_test+0x978>
    err("mmap (3)");
  if (close(fd) == -1)
    14d2:	854a                	mv	a0,s2
    14d4:	5b4010ef          	jal	ra,2a88 <close>
    14d8:	59350e63          	beq	a0,s3,1a74 <mmap_test+0x83e>
    err("close");

  // check that the mapping still works after close(fd).
  _v1(p);
    14dc:	8562                	mv	a0,s8
    14de:	b5fff0ef          	jal	ra,103c <_v1>

  // write the mapped memory.
  for (i = 0; i < PGSIZE * 2; i++)
    14e2:	41800733          	neg	a4,s8
    14e6:	8b1d                	andi	a4,a4,7
    14e8:	5c070163          	beqz	a4,1aaa <mmap_test+0x874>
    p[i] = 'Z';
    14ec:	05a00793          	li	a5,90
    14f0:	00fc0023          	sb	a5,0(s8)
  for (i = 0; i < PGSIZE * 2; i++)
    14f4:	4685                	li	a3,1
    14f6:	6ed70c63          	beq	a4,a3,1bee <mmap_test+0x9b8>
    p[i] = 'Z';
    14fa:	00fc00a3          	sb	a5,1(s8)
  for (i = 0; i < PGSIZE * 2; i++)
    14fe:	4689                	li	a3,2
    1500:	76d70763          	beq	a4,a3,1c6e <mmap_test+0xa38>
    p[i] = 'Z';
    1504:	00fc0123          	sb	a5,2(s8)
  for (i = 0; i < PGSIZE * 2; i++)
    1508:	468d                	li	a3,3
    150a:	78d70363          	beq	a4,a3,1c90 <mmap_test+0xa5a>
    p[i] = 'Z';
    150e:	00fc01a3          	sb	a5,3(s8)
  for (i = 0; i < PGSIZE * 2; i++)
    1512:	4691                	li	a3,4
    1514:	78d70363          	beq	a4,a3,1c9a <mmap_test+0xa64>
    p[i] = 'Z';
    1518:	00fc0223          	sb	a5,4(s8)
  for (i = 0; i < PGSIZE * 2; i++)
    151c:	4695                	li	a3,5
    151e:	78d70963          	beq	a4,a3,1cb0 <mmap_test+0xa7a>
    p[i] = 'Z';
    1522:	00fc02a3          	sb	a5,5(s8)
  for (i = 0; i < PGSIZE * 2; i++)
    1526:	469d                	li	a3,7
    1528:	78d71f63          	bne	a4,a3,1cc6 <mmap_test+0xa90>
    152c:	6509                	lui	a0,0x2
    p[i] = 'Z';
    152e:	00fc0323          	sb	a5,6(s8)
  for (i = 0; i < PGSIZE * 2; i++)
    1532:	1565                	addi	a0,a0,-7
    1534:	489d                	li	a7,7
    1536:	6589                	lui	a1,0x2
    1538:	9d99                	subw	a1,a1,a4
    153a:	0035d69b          	srliw	a3,a1,0x3
    153e:	36fd                	addiw	a3,a3,-1
    1540:	02069793          	slli	a5,a3,0x20
    1544:	9762                	add	a4,a4,s8
    1546:	01d7d693          	srli	a3,a5,0x1d
    154a:	00870793          	addi	a5,a4,8
    p[i] = 'Z';
    154e:	6010                	ld	a2,0(s0)
    1550:	0005881b          	sext.w	a6,a1
    1554:	96be                	add	a3,a3,a5
    1556:	a011                	j	155a <mmap_test+0x324>
    1558:	07a1                	addi	a5,a5,8
    155a:	e310                	sd	a2,0(a4)
  for (i = 0; i < PGSIZE * 2; i++)
    155c:	873e                	mv	a4,a5
    155e:	fed79de3          	bne	a5,a3,1558 <mmap_test+0x322>
    1562:	99e1                	andi	a1,a1,-8
    1564:	011586bb          	addw	a3,a1,a7
    1568:	2581                	sext.w	a1,a1
    156a:	87b6                	mv	a5,a3
    156c:	06b80963          	beq	a6,a1,15de <mmap_test+0x3a8>
    p[i] = 'Z';
    1570:	00dc0633          	add	a2,s8,a3
    1574:	9d0d                	subw	a0,a0,a1
    1576:	05a00693          	li	a3,90
    157a:	00d60023          	sb	a3,0(a2)
  for (i = 0; i < PGSIZE * 2; i++)
    157e:	fff5059b          	addiw	a1,a0,-1
    1582:	0017861b          	addiw	a2,a5,1
    1586:	cda1                	beqz	a1,15de <mmap_test+0x3a8>
    p[i] = 'Z';
    1588:	9662                	add	a2,a2,s8
    158a:	00d60023          	sb	a3,0(a2)
  for (i = 0; i < PGSIZE * 2; i++)
    158e:	ffe5059b          	addiw	a1,a0,-2
    1592:	0027861b          	addiw	a2,a5,2
    1596:	c5a1                	beqz	a1,15de <mmap_test+0x3a8>
    p[i] = 'Z';
    1598:	9662                	add	a2,a2,s8
    159a:	00d60023          	sb	a3,0(a2)
  for (i = 0; i < PGSIZE * 2; i++)
    159e:	ffd5059b          	addiw	a1,a0,-3
    15a2:	0037861b          	addiw	a2,a5,3
    15a6:	cd85                	beqz	a1,15de <mmap_test+0x3a8>
    p[i] = 'Z';
    15a8:	9662                	add	a2,a2,s8
    15aa:	00d60023          	sb	a3,0(a2)
  for (i = 0; i < PGSIZE * 2; i++)
    15ae:	ffc5059b          	addiw	a1,a0,-4
    15b2:	0047861b          	addiw	a2,a5,4
    15b6:	c585                	beqz	a1,15de <mmap_test+0x3a8>
    p[i] = 'Z';
    15b8:	9662                	add	a2,a2,s8
    15ba:	00d60023          	sb	a3,0(a2)
  for (i = 0; i < PGSIZE * 2; i++)
    15be:	ffb5071b          	addiw	a4,a0,-5
    15c2:	0057861b          	addiw	a2,a5,5
    15c6:	cf01                	beqz	a4,15de <mmap_test+0x3a8>
    p[i] = 'Z';
    15c8:	00cc0733          	add	a4,s8,a2
    15cc:	00d70023          	sb	a3,0(a4)
  for (i = 0; i < PGSIZE * 2; i++)
    15d0:	4719                	li	a4,6
    15d2:	2799                	addiw	a5,a5,6
    15d4:	00e50563          	beq	a0,a4,15de <mmap_test+0x3a8>
    p[i] = 'Z';
    15d8:	97e2                	add	a5,a5,s8
    15da:	00d78023          	sb	a3,0(a5)

  // unmap just the first two of three pages of mapped memory.
  if (munmap(p, PGSIZE * 2) == -1)
    15de:	6589                	lui	a1,0x2
    15e0:	8562                	mv	a0,s8
    15e2:	5c4010ef          	jal	ra,2ba6 <munmap>
    15e6:	57fd                	li	a5,-1
    15e8:	46f50363          	beq	a0,a5,1a4e <mmap_test+0x818>
    err("munmap (3)");

  printf("test mmap read/write: OK\n");
    15ec:	00002517          	auipc	a0,0x2
    15f0:	94450513          	addi	a0,a0,-1724 # 2f30 <__clone+0x25a>
    15f4:	36b000ef          	jal	ra,215e <printf>

  printf("test mmap dirty\n");
    15f8:	00002517          	auipc	a0,0x2
    15fc:	95850513          	addi	a0,a0,-1704 # 2f50 <__clone+0x27a>
    1600:	35f000ef          	jal	ra,215e <printf>

  // check that the writes to the mapped memory were
  // written to the file.
  if ((fd = open(f, O_RDWR)) == -1)
    1604:	4589                	li	a1,2
    1606:	00001517          	auipc	a0,0x1
    160a:	7f250513          	addi	a0,a0,2034 # 2df8 <__clone+0x122>
    160e:	448010ef          	jal	ra,2a56 <open>
    1612:	57fd                	li	a5,-1
    1614:	892a                	mv	s2,a0
    1616:	3af50663          	beq	a0,a5,19c2 <mmap_test+0x78c>
  for (i = 0; i < PGSIZE * 2; i++)
    161a:	6409                	lui	s0,0x2
    161c:	80040413          	addi	s0,s0,-2048 # 1800 <mmap_test+0x5ca>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1620:	00002b97          	auipc	s7,0x2
    1624:	948b8b93          	addi	s7,s7,-1720 # 2f68 <__clone+0x292>
    1628:	00001a17          	auipc	s4,0x1
    162c:	6d8a0a13          	addi	s4,s4,1752 # 2d00 <__clone+0x2a>
    err("open");
  for (i = 0; i < PGSIZE + (PGSIZE / 2); i++) {
    char b;
    if (read(fd, &b, 1) != 1)
      err("read (1)");
    if (b != 'Z')
    1630:	05a00993          	li	s3,90
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1634:	00002b17          	auipc	s6,0x2
    1638:	944b0b13          	addi	s6,s6,-1724 # 2f78 <__clone+0x2a2>
    if (read(fd, &b, 1) != 1)
    163c:	4605                	li	a2,1
    163e:	00f10593          	addi	a1,sp,15
    1642:	854a                	mv	a0,s2
    1644:	450010ef          	jal	ra,2a94 <read>
    1648:	4785                	li	a5,1
    164a:	00f50f63          	beq	a0,a5,1668 <mmap_test+0x432>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    164e:	0004ba83          	ld	s5,0(s1)
    1652:	456010ef          	jal	ra,2aa8 <getpid>
    1656:	86aa                	mv	a3,a0
    1658:	865e                	mv	a2,s7
    165a:	8552                	mv	a0,s4
    165c:	85d6                	mv	a1,s5
    165e:	301000ef          	jal	ra,215e <printf>
  exit(1);
    1662:	4505                	li	a0,1
    1664:	48a010ef          	jal	ra,2aee <exit>
    if (b != 'Z')
    1668:	00f14783          	lbu	a5,15(sp)
    166c:	21378463          	beq	a5,s3,1874 <mmap_test+0x63e>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1670:	0004ba83          	ld	s5,0(s1)
    1674:	434010ef          	jal	ra,2aa8 <getpid>
    1678:	86aa                	mv	a3,a0
    167a:	865a                	mv	a2,s6
    167c:	8552                	mv	a0,s4
    167e:	85d6                	mv	a1,s5
    1680:	2df000ef          	jal	ra,215e <printf>
  for (i = 0; i < PGSIZE + (PGSIZE / 2); i++) {
    1684:	347d                	addiw	s0,s0,-1
  exit(1);
    1686:	4505                	li	a0,1
    1688:	466010ef          	jal	ra,2aee <exit>
  for (i = 0; i < PGSIZE + (PGSIZE / 2); i++) {
    168c:	f845                	bnez	s0,163c <mmap_test+0x406>
      err("file does not contain modifications");
  }
  if (close(fd) == -1)
    168e:	854a                	mv	a0,s2
    1690:	3f8010ef          	jal	ra,2a88 <close>
    1694:	57fd                	li	a5,-1
    1696:	1ef50863          	beq	a0,a5,1886 <mmap_test+0x650>
    err("close");

  printf("test mmap dirty: OK\n");
    169a:	00002517          	auipc	a0,0x2
    169e:	90650513          	addi	a0,a0,-1786 # 2fa0 <__clone+0x2ca>
    16a2:	2bd000ef          	jal	ra,215e <printf>

  printf("test not-mapped unmap\n");
    16a6:	00002517          	auipc	a0,0x2
    16aa:	91250513          	addi	a0,a0,-1774 # 2fb8 <__clone+0x2e2>
    16ae:	2b1000ef          	jal	ra,215e <printf>

  // unmap the rest of the mapped memory.
  if (munmap(p + PGSIZE * 2, PGSIZE) == -1)
    16b2:	6509                	lui	a0,0x2
    16b4:	6585                	lui	a1,0x1
    16b6:	9562                	add	a0,a0,s8
    16b8:	4ee010ef          	jal	ra,2ba6 <munmap>
    16bc:	57fd                	li	a5,-1
    16be:	2cf50f63          	beq	a0,a5,199c <mmap_test+0x766>
    err("munmap (4)");

  printf("test not-mapped unmap: OK\n");
    16c2:	00002517          	auipc	a0,0x2
    16c6:	91e50513          	addi	a0,a0,-1762 # 2fe0 <__clone+0x30a>
    16ca:	295000ef          	jal	ra,215e <printf>

  printf("test mmap two files\n");
    16ce:	00002517          	auipc	a0,0x2
    16d2:	93250513          	addi	a0,a0,-1742 # 3000 <__clone+0x32a>
    16d6:	289000ef          	jal	ra,215e <printf>

  //
  // mmap two files at the same time.
  //
  int fd1;
  if ((fd1 = open("mmap1", O_RDWR | O_CREATE)) < 0)
    16da:	04200593          	li	a1,66
    16de:	00002517          	auipc	a0,0x2
    16e2:	93a50513          	addi	a0,a0,-1734 # 3018 <__clone+0x342>
    16e6:	370010ef          	jal	ra,2a56 <open>
    16ea:	842a                	mv	s0,a0
    16ec:	24054f63          	bltz	a0,194a <mmap_test+0x714>
    err("open mmap1");
  if (write(fd1, "12345", 5) != 5)
    16f0:	4615                	li	a2,5
    16f2:	00002597          	auipc	a1,0x2
    16f6:	93e58593          	addi	a1,a1,-1730 # 3030 <__clone+0x35a>
    16fa:	8522                	mv	a0,s0
    16fc:	3a2010ef          	jal	ra,2a9e <write>
    1700:	4795                	li	a5,5
    1702:	02f50563          	beq	a0,a5,172c <mmap_test+0x4f6>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1706:	0004b903          	ld	s2,0(s1)
    170a:	39e010ef          	jal	ra,2aa8 <getpid>
    170e:	86aa                	mv	a3,a0
    1710:	00002617          	auipc	a2,0x2
    1714:	92860613          	addi	a2,a2,-1752 # 3038 <__clone+0x362>
    1718:	00001517          	auipc	a0,0x1
    171c:	5e850513          	addi	a0,a0,1512 # 2d00 <__clone+0x2a>
    1720:	85ca                	mv	a1,s2
    1722:	23d000ef          	jal	ra,215e <printf>
  exit(1);
    1726:	4505                	li	a0,1
    1728:	3c6010ef          	jal	ra,2aee <exit>
    err("write mmap1");
  close(fd1);
    172c:	8522                	mv	a0,s0
    172e:	35a010ef          	jal	ra,2a88 <close>
  fd1 = open("mmap1", O_RDWR);
    1732:	4589                	li	a1,2
    1734:	00002517          	auipc	a0,0x2
    1738:	8e450513          	addi	a0,a0,-1820 # 3018 <__clone+0x342>
    173c:	31a010ef          	jal	ra,2a56 <open>

  char *p1 = mmap(0, PGSIZE, PROT_READ, MAP_PRIVATE, fd1, 0);
    1740:	4781                	li	a5,0
    1742:	872a                	mv	a4,a0
  fd1 = open("mmap1", O_RDWR);
    1744:	89aa                	mv	s3,a0
  char *p1 = mmap(0, PGSIZE, PROT_READ, MAP_PRIVATE, fd1, 0);
    1746:	4689                	li	a3,2
    1748:	4605                	li	a2,1
    174a:	6585                	lui	a1,0x1
    174c:	4501                	li	a0,0
    174e:	44e010ef          	jal	ra,2b9c <mmap>

  if (p1 == MAP_FAILED)
    1752:	57fd                	li	a5,-1
  char *p1 = mmap(0, PGSIZE, PROT_READ, MAP_PRIVATE, fd1, 0);
    1754:	892a                	mv	s2,a0
  if (p1 == MAP_FAILED)
    1756:	42f50963          	beq	a0,a5,1b88 <mmap_test+0x952>
    err("mmap mmap1");

  int fd2;
  if ((fd2 = open("mmap2", O_RDWR | O_CREATE)) < 0)
    175a:	04200593          	li	a1,66
    175e:	00002517          	auipc	a0,0x2
    1762:	8fa50513          	addi	a0,a0,-1798 # 3058 <__clone+0x382>
    1766:	2f0010ef          	jal	ra,2a56 <open>
    176a:	842a                	mv	s0,a0
    176c:	1a054b63          	bltz	a0,1922 <mmap_test+0x6ec>
    err("open mmap2");
  if (write(fd2, "67890", 5) != 5)
    1770:	4615                	li	a2,5
    1772:	00002597          	auipc	a1,0x2
    1776:	8fe58593          	addi	a1,a1,-1794 # 3070 <__clone+0x39a>
    177a:	8522                	mv	a0,s0
    177c:	322010ef          	jal	ra,2a9e <write>
    1780:	4795                	li	a5,5
    1782:	02f50563          	beq	a0,a5,17ac <mmap_test+0x576>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1786:	0004ba03          	ld	s4,0(s1)
    178a:	31e010ef          	jal	ra,2aa8 <getpid>
    178e:	86aa                	mv	a3,a0
    1790:	00002617          	auipc	a2,0x2
    1794:	8e860613          	addi	a2,a2,-1816 # 3078 <__clone+0x3a2>
    1798:	00001517          	auipc	a0,0x1
    179c:	56850513          	addi	a0,a0,1384 # 2d00 <__clone+0x2a>
    17a0:	85d2                	mv	a1,s4
    17a2:	1bd000ef          	jal	ra,215e <printf>
  exit(1);
    17a6:	4505                	li	a0,1
    17a8:	346010ef          	jal	ra,2aee <exit>
    err("write mmap2");
  close(fd2);
    17ac:	8522                	mv	a0,s0
    17ae:	2da010ef          	jal	ra,2a88 <close>
  fd2 = open("mmap2", O_RDWR);
    17b2:	4589                	li	a1,2
    17b4:	00002517          	auipc	a0,0x2
    17b8:	8a450513          	addi	a0,a0,-1884 # 3058 <__clone+0x382>
    17bc:	29a010ef          	jal	ra,2a56 <open>
  char *p2 = mmap(0, PGSIZE, PROT_READ, MAP_PRIVATE, fd2, 0);
    17c0:	4781                	li	a5,0
    17c2:	872a                	mv	a4,a0
  fd2 = open("mmap2", O_RDWR);
    17c4:	8a2a                	mv	s4,a0
  char *p2 = mmap(0, PGSIZE, PROT_READ, MAP_PRIVATE, fd2, 0);
    17c6:	4689                	li	a3,2
    17c8:	4605                	li	a2,1
    17ca:	6585                	lui	a1,0x1
    17cc:	4501                	li	a0,0
    17ce:	3ce010ef          	jal	ra,2b9c <mmap>
  if (p2 == MAP_FAILED)
    17d2:	57fd                	li	a5,-1
  char *p2 = mmap(0, PGSIZE, PROT_READ, MAP_PRIVATE, fd2, 0);
    17d4:	842a                	mv	s0,a0
  if (p2 == MAP_FAILED)
    17d6:	38f50563          	beq	a0,a5,1b60 <mmap_test+0x92a>
    err("mmap mmap2");

  if (strncmp(p1, "12345", 5) != 0) {
    17da:	4615                	li	a2,5
    17dc:	00002597          	auipc	a1,0x2
    17e0:	85458593          	addi	a1,a1,-1964 # 3030 <__clone+0x35a>
    17e4:	854a                	mv	a0,s2
    17e6:	681000ef          	jal	ra,2666 <strncmp>
    17ea:	10051863          	bnez	a0,18fa <mmap_test+0x6c4>
    err("mmap1 mismatch");
  }
  close(fd1);
    17ee:	854e                	mv	a0,s3
    17f0:	298010ef          	jal	ra,2a88 <close>
  unlink("mmap1");
    17f4:	00002517          	auipc	a0,0x2
    17f8:	82450513          	addi	a0,a0,-2012 # 3018 <__clone+0x342>
    17fc:	436010ef          	jal	ra,2c32 <unlink>
  if (strncmp(p2, "67890", 5) != 0)
    1800:	4615                	li	a2,5
    1802:	00002597          	auipc	a1,0x2
    1806:	86e58593          	addi	a1,a1,-1938 # 3070 <__clone+0x39a>
    180a:	8522                	mv	a0,s0
    180c:	65b000ef          	jal	ra,2666 <strncmp>
    1810:	e169                	bnez	a0,18d2 <mmap_test+0x69c>
    err("mmap2 mismatch");

  munmap(p1, PGSIZE);
    1812:	6585                	lui	a1,0x1
    1814:	854a                	mv	a0,s2
    1816:	390010ef          	jal	ra,2ba6 <munmap>
  if (strncmp(p2, "67890", 5) != 0)
    181a:	4615                	li	a2,5
    181c:	00002597          	auipc	a1,0x2
    1820:	85458593          	addi	a1,a1,-1964 # 3070 <__clone+0x39a>
    1824:	8522                	mv	a0,s0
    1826:	641000ef          	jal	ra,2666 <strncmp>
    182a:	e149                	bnez	a0,18ac <mmap_test+0x676>
    err("mmap2 mismatch (2)");
  close(fd2);
    182c:	8552                	mv	a0,s4
    182e:	25a010ef          	jal	ra,2a88 <close>
  munmap(p2, PGSIZE);
    1832:	6585                	lui	a1,0x1
    1834:	8522                	mv	a0,s0
    1836:	370010ef          	jal	ra,2ba6 <munmap>
  unlink("mmap2");
    183a:	00002517          	auipc	a0,0x2
    183e:	81e50513          	addi	a0,a0,-2018 # 3058 <__clone+0x382>
    1842:	3f0010ef          	jal	ra,2c32 <unlink>

  printf("test mmap two files: OK\n");
    1846:	00002517          	auipc	a0,0x2
    184a:	88a50513          	addi	a0,a0,-1910 # 30d0 <__clone+0x3fa>
    184e:	111000ef          	jal	ra,215e <printf>

  printf("mmap_test: ALL OK\n");
}
    1852:	6446                	ld	s0,80(sp)
    1854:	60e6                	ld	ra,88(sp)
    1856:	64a6                	ld	s1,72(sp)
    1858:	6906                	ld	s2,64(sp)
    185a:	79e2                	ld	s3,56(sp)
    185c:	7a42                	ld	s4,48(sp)
    185e:	7aa2                	ld	s5,40(sp)
    1860:	7b02                	ld	s6,32(sp)
    1862:	6be2                	ld	s7,24(sp)
    1864:	6c42                	ld	s8,16(sp)
  printf("mmap_test: ALL OK\n");
    1866:	00002517          	auipc	a0,0x2
    186a:	88a50513          	addi	a0,a0,-1910 # 30f0 <__clone+0x41a>
}
    186e:	6125                	addi	sp,sp,96
  printf("mmap_test: ALL OK\n");
    1870:	0ef0006f          	j	215e <printf>
  for (i = 0; i < PGSIZE + (PGSIZE / 2); i++) {
    1874:	347d                	addiw	s0,s0,-1
    1876:	dc0413e3          	bnez	s0,163c <mmap_test+0x406>
  if (close(fd) == -1)
    187a:	854a                	mv	a0,s2
    187c:	20c010ef          	jal	ra,2a88 <close>
    1880:	57fd                	li	a5,-1
    1882:	e0f51ce3          	bne	a0,a5,169a <mmap_test+0x464>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1886:	6080                	ld	s0,0(s1)
    1888:	220010ef          	jal	ra,2aa8 <getpid>
    188c:	86aa                	mv	a3,a0
    188e:	00001617          	auipc	a2,0x1
    1892:	53a60613          	addi	a2,a2,1338 # 2dc8 <__clone+0xf2>
    1896:	00001517          	auipc	a0,0x1
    189a:	46a50513          	addi	a0,a0,1130 # 2d00 <__clone+0x2a>
    189e:	85a2                	mv	a1,s0
    18a0:	0bf000ef          	jal	ra,215e <printf>
  exit(1);
    18a4:	4505                	li	a0,1
    18a6:	248010ef          	jal	ra,2aee <exit>
}
    18aa:	bbc5                	j	169a <mmap_test+0x464>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    18ac:	6084                	ld	s1,0(s1)
    18ae:	1fa010ef          	jal	ra,2aa8 <getpid>
    18b2:	86aa                	mv	a3,a0
    18b4:	00002617          	auipc	a2,0x2
    18b8:	80460613          	addi	a2,a2,-2044 # 30b8 <__clone+0x3e2>
    18bc:	00001517          	auipc	a0,0x1
    18c0:	44450513          	addi	a0,a0,1092 # 2d00 <__clone+0x2a>
    18c4:	85a6                	mv	a1,s1
    18c6:	099000ef          	jal	ra,215e <printf>
  exit(1);
    18ca:	4505                	li	a0,1
    18cc:	222010ef          	jal	ra,2aee <exit>
}
    18d0:	bfb1                	j	182c <mmap_test+0x5f6>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    18d2:	0004b983          	ld	s3,0(s1)
    18d6:	1d2010ef          	jal	ra,2aa8 <getpid>
    18da:	86aa                	mv	a3,a0
    18dc:	00001617          	auipc	a2,0x1
    18e0:	7cc60613          	addi	a2,a2,1996 # 30a8 <__clone+0x3d2>
    18e4:	00001517          	auipc	a0,0x1
    18e8:	41c50513          	addi	a0,a0,1052 # 2d00 <__clone+0x2a>
    18ec:	85ce                	mv	a1,s3
    18ee:	071000ef          	jal	ra,215e <printf>
  exit(1);
    18f2:	4505                	li	a0,1
    18f4:	1fa010ef          	jal	ra,2aee <exit>
}
    18f8:	bf29                	j	1812 <mmap_test+0x5dc>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    18fa:	0004ba83          	ld	s5,0(s1)
    18fe:	1aa010ef          	jal	ra,2aa8 <getpid>
    1902:	86aa                	mv	a3,a0
    1904:	00001617          	auipc	a2,0x1
    1908:	79460613          	addi	a2,a2,1940 # 3098 <__clone+0x3c2>
    190c:	00001517          	auipc	a0,0x1
    1910:	3f450513          	addi	a0,a0,1012 # 2d00 <__clone+0x2a>
    1914:	85d6                	mv	a1,s5
    1916:	049000ef          	jal	ra,215e <printf>
  exit(1);
    191a:	4505                	li	a0,1
    191c:	1d2010ef          	jal	ra,2aee <exit>
}
    1920:	b5f9                	j	17ee <mmap_test+0x5b8>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1922:	0004ba03          	ld	s4,0(s1)
    1926:	182010ef          	jal	ra,2aa8 <getpid>
    192a:	86aa                	mv	a3,a0
    192c:	00001617          	auipc	a2,0x1
    1930:	73460613          	addi	a2,a2,1844 # 3060 <__clone+0x38a>
    1934:	00001517          	auipc	a0,0x1
    1938:	3cc50513          	addi	a0,a0,972 # 2d00 <__clone+0x2a>
    193c:	85d2                	mv	a1,s4
    193e:	021000ef          	jal	ra,215e <printf>
  exit(1);
    1942:	4505                	li	a0,1
    1944:	1aa010ef          	jal	ra,2aee <exit>
}
    1948:	b525                	j	1770 <mmap_test+0x53a>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    194a:	0004b903          	ld	s2,0(s1)
    194e:	15a010ef          	jal	ra,2aa8 <getpid>
    1952:	86aa                	mv	a3,a0
    1954:	00001617          	auipc	a2,0x1
    1958:	6cc60613          	addi	a2,a2,1740 # 3020 <__clone+0x34a>
    195c:	00001517          	auipc	a0,0x1
    1960:	3a450513          	addi	a0,a0,932 # 2d00 <__clone+0x2a>
    1964:	85ca                	mv	a1,s2
    1966:	7f8000ef          	jal	ra,215e <printf>
  exit(1);
    196a:	4505                	li	a0,1
    196c:	182010ef          	jal	ra,2aee <exit>
}
    1970:	b341                	j	16f0 <mmap_test+0x4ba>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1972:	0004b903          	ld	s2,0(s1)
    1976:	132010ef          	jal	ra,2aa8 <getpid>
    197a:	86aa                	mv	a3,a0
    197c:	00001617          	auipc	a2,0x1
    1980:	4ac60613          	addi	a2,a2,1196 # 2e28 <__clone+0x152>
    1984:	00001517          	auipc	a0,0x1
    1988:	37c50513          	addi	a0,a0,892 # 2d00 <__clone+0x2a>
    198c:	85ca                	mv	a1,s2
    198e:	7d0000ef          	jal	ra,215e <printf>
  exit(1);
    1992:	4505                	li	a0,1
    1994:	15a010ef          	jal	ra,2aee <exit>
}
    1998:	92dff06f          	j	12c4 <mmap_test+0x8e>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    199c:	6080                	ld	s0,0(s1)
    199e:	10a010ef          	jal	ra,2aa8 <getpid>
    19a2:	86aa                	mv	a3,a0
    19a4:	00001617          	auipc	a2,0x1
    19a8:	62c60613          	addi	a2,a2,1580 # 2fd0 <__clone+0x2fa>
    19ac:	00001517          	auipc	a0,0x1
    19b0:	35450513          	addi	a0,a0,852 # 2d00 <__clone+0x2a>
    19b4:	85a2                	mv	a1,s0
    19b6:	7a8000ef          	jal	ra,215e <printf>
  exit(1);
    19ba:	4505                	li	a0,1
    19bc:	132010ef          	jal	ra,2aee <exit>
}
    19c0:	b309                	j	16c2 <mmap_test+0x48c>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    19c2:	6080                	ld	s0,0(s1)
    19c4:	0e4010ef          	jal	ra,2aa8 <getpid>
    19c8:	86aa                	mv	a3,a0
    19ca:	00001617          	auipc	a2,0x1
    19ce:	3de60613          	addi	a2,a2,990 # 2da8 <__clone+0xd2>
    19d2:	00001517          	auipc	a0,0x1
    19d6:	32e50513          	addi	a0,a0,814 # 2d00 <__clone+0x2a>
    19da:	85a2                	mv	a1,s0
    19dc:	782000ef          	jal	ra,215e <printf>
  exit(1);
    19e0:	4505                	li	a0,1
    19e2:	10c010ef          	jal	ra,2aee <exit>
}
    19e6:	b915                	j	161a <mmap_test+0x3e4>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    19e8:	0004b903          	ld	s2,0(s1)
    19ec:	0bc010ef          	jal	ra,2aa8 <getpid>
    19f0:	86aa                	mv	a3,a0
    19f2:	00001617          	auipc	a2,0x1
    19f6:	3b660613          	addi	a2,a2,950 # 2da8 <__clone+0xd2>
    19fa:	00001517          	auipc	a0,0x1
    19fe:	30650513          	addi	a0,a0,774 # 2d00 <__clone+0x2a>
    1a02:	85ca                	mv	a1,s2
    1a04:	75a000ef          	jal	ra,215e <printf>
  exit(1);
    1a08:	4505                	li	a0,1
    1a0a:	0e4010ef          	jal	ra,2aee <exit>
}
    1a0e:	87fff06f          	j	128c <mmap_test+0x56>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1a12:	6080                	ld	s0,0(s1)
    1a14:	094010ef          	jal	ra,2aa8 <getpid>
    1a18:	86aa                	mv	a3,a0
    1a1a:	00001617          	auipc	a2,0x1
    1a1e:	3ae60613          	addi	a2,a2,942 # 2dc8 <__clone+0xf2>
    1a22:	85a2                	mv	a1,s0
    1a24:	00001517          	auipc	a0,0x1
    1a28:	2dc50513          	addi	a0,a0,732 # 2d00 <__clone+0x2a>
    1a2c:	732000ef          	jal	ra,215e <printf>
  exit(1);
    1a30:	4505                	li	a0,1
    1a32:	0bc010ef          	jal	ra,2aee <exit>
  _v1(p);
    1a36:	854a                	mv	a0,s2
    1a38:	e04ff0ef          	jal	ra,103c <_v1>
  for (i = 0; i < PGSIZE * 2; i++)
    1a3c:	41200733          	neg	a4,s2
    1a40:	8b1d                	andi	a4,a4,7
    1a42:	8c0716e3          	bnez	a4,130e <mmap_test+0xd8>
  _v1(p);
    1a46:	6509                	lui	a0,0x2
  for (i = 0; i < PGSIZE * 2; i++)
    1a48:	4881                	li	a7,0
    1a4a:	911ff06f          	j	135a <mmap_test+0x124>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1a4e:	6080                	ld	s0,0(s1)
    1a50:	058010ef          	jal	ra,2aa8 <getpid>
    1a54:	86aa                	mv	a3,a0
    1a56:	00001617          	auipc	a2,0x1
    1a5a:	4ca60613          	addi	a2,a2,1226 # 2f20 <__clone+0x24a>
    1a5e:	00001517          	auipc	a0,0x1
    1a62:	2a250513          	addi	a0,a0,674 # 2d00 <__clone+0x2a>
    1a66:	85a2                	mv	a1,s0
    1a68:	6f6000ef          	jal	ra,215e <printf>
  exit(1);
    1a6c:	4505                	li	a0,1
    1a6e:	080010ef          	jal	ra,2aee <exit>
}
    1a72:	bead                	j	15ec <mmap_test+0x3b6>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1a74:	0004b903          	ld	s2,0(s1)
    1a78:	030010ef          	jal	ra,2aa8 <getpid>
    1a7c:	86aa                	mv	a3,a0
    1a7e:	00001617          	auipc	a2,0x1
    1a82:	34a60613          	addi	a2,a2,842 # 2dc8 <__clone+0xf2>
    1a86:	85ca                	mv	a1,s2
    1a88:	00001517          	auipc	a0,0x1
    1a8c:	27850513          	addi	a0,a0,632 # 2d00 <__clone+0x2a>
    1a90:	6ce000ef          	jal	ra,215e <printf>
  exit(1);
    1a94:	4505                	li	a0,1
    1a96:	058010ef          	jal	ra,2aee <exit>
  _v1(p);
    1a9a:	8562                	mv	a0,s8
    1a9c:	da0ff0ef          	jal	ra,103c <_v1>
  for (i = 0; i < PGSIZE * 2; i++)
    1aa0:	41800733          	neg	a4,s8
    1aa4:	8b1d                	andi	a4,a4,7
    1aa6:	a40713e3          	bnez	a4,14ec <mmap_test+0x2b6>
  _v1(p);
    1aaa:	6509                	lui	a0,0x2
  for (i = 0; i < PGSIZE * 2; i++)
    1aac:	4881                	li	a7,0
    1aae:	b461                	j	1536 <mmap_test+0x300>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1ab0:	0004b983          	ld	s3,0(s1)
    1ab4:	7f5000ef          	jal	ra,2aa8 <getpid>
    1ab8:	86aa                	mv	a3,a0
    1aba:	00001617          	auipc	a2,0x1
    1abe:	2ee60613          	addi	a2,a2,750 # 2da8 <__clone+0xd2>
    1ac2:	00001517          	auipc	a0,0x1
    1ac6:	23e50513          	addi	a0,a0,574 # 2d00 <__clone+0x2a>
    1aca:	85ce                	mv	a1,s3
    1acc:	692000ef          	jal	ra,215e <printf>
  exit(1);
    1ad0:	4505                	li	a0,1
    1ad2:	01c010ef          	jal	ra,2aee <exit>
}
    1ad6:	b2d5                	j	14ba <mmap_test+0x284>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1ad8:	0004b903          	ld	s2,0(s1)
    1adc:	7cd000ef          	jal	ra,2aa8 <getpid>
    1ae0:	86aa                	mv	a3,a0
    1ae2:	00001617          	auipc	a2,0x1
    1ae6:	2e660613          	addi	a2,a2,742 # 2dc8 <__clone+0xf2>
    1aea:	00001517          	auipc	a0,0x1
    1aee:	21650513          	addi	a0,a0,534 # 2d00 <__clone+0x2a>
    1af2:	85ca                	mv	a1,s2
    1af4:	66a000ef          	jal	ra,215e <printf>
  exit(1);
    1af8:	4505                	li	a0,1
    1afa:	7f5000ef          	jal	ra,2aee <exit>
}
    1afe:	b279                	j	148c <mmap_test+0x256>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1b00:	0004b983          	ld	s3,0(s1)
    1b04:	7a5000ef          	jal	ra,2aa8 <getpid>
    1b08:	86aa                	mv	a3,a0
    1b0a:	00001617          	auipc	a2,0x1
    1b0e:	29e60613          	addi	a2,a2,670 # 2da8 <__clone+0xd2>
    1b12:	00001517          	auipc	a0,0x1
    1b16:	1ee50513          	addi	a0,a0,494 # 2d00 <__clone+0x2a>
    1b1a:	85ce                	mv	a1,s3
    1b1c:	642000ef          	jal	ra,215e <printf>
  exit(1);
    1b20:	4505                	li	a0,1
    1b22:	7cd000ef          	jal	ra,2aee <exit>
}
    1b26:	91fff06f          	j	1444 <mmap_test+0x20e>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1b2a:	0004b903          	ld	s2,0(s1)
    1b2e:	77b000ef          	jal	ra,2aa8 <getpid>
    1b32:	86aa                	mv	a3,a0
    1b34:	00001617          	auipc	a2,0x1
    1b38:	34460613          	addi	a2,a2,836 # 2e78 <__clone+0x1a2>
    1b3c:	00001517          	auipc	a0,0x1
    1b40:	1c450513          	addi	a0,a0,452 # 2d00 <__clone+0x2a>
    1b44:	85ca                	mv	a1,s2
    1b46:	618000ef          	jal	ra,215e <printf>
  exit(1);
    1b4a:	4505                	li	a0,1
    1b4c:	7a3000ef          	jal	ra,2aee <exit>
}
    1b50:	8c7ff06f          	j	1416 <mmap_test+0x1e0>
  for (i = 0; i < PGSIZE * 2; i++)
    1b54:	6789                	lui	a5,0x2
    1b56:	ffc78513          	addi	a0,a5,-4 # 1ffc <printint.constprop.0+0x118>
    1b5a:	4891                	li	a7,4
    1b5c:	ffeff06f          	j	135a <mmap_test+0x124>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1b60:	0004ba83          	ld	s5,0(s1)
    1b64:	745000ef          	jal	ra,2aa8 <getpid>
    1b68:	86aa                	mv	a3,a0
    1b6a:	00001617          	auipc	a2,0x1
    1b6e:	51e60613          	addi	a2,a2,1310 # 3088 <__clone+0x3b2>
    1b72:	00001517          	auipc	a0,0x1
    1b76:	18e50513          	addi	a0,a0,398 # 2d00 <__clone+0x2a>
    1b7a:	85d6                	mv	a1,s5
    1b7c:	5e2000ef          	jal	ra,215e <printf>
  exit(1);
    1b80:	4505                	li	a0,1
    1b82:	76d000ef          	jal	ra,2aee <exit>
}
    1b86:	b991                	j	17da <mmap_test+0x5a4>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1b88:	6080                	ld	s0,0(s1)
    1b8a:	71f000ef          	jal	ra,2aa8 <getpid>
    1b8e:	86aa                	mv	a3,a0
    1b90:	00001617          	auipc	a2,0x1
    1b94:	4b860613          	addi	a2,a2,1208 # 3048 <__clone+0x372>
    1b98:	00001517          	auipc	a0,0x1
    1b9c:	16850513          	addi	a0,a0,360 # 2d00 <__clone+0x2a>
    1ba0:	85a2                	mv	a1,s0
    1ba2:	5bc000ef          	jal	ra,215e <printf>
  exit(1);
    1ba6:	4505                	li	a0,1
    1ba8:	747000ef          	jal	ra,2aee <exit>
}
    1bac:	b67d                	j	175a <mmap_test+0x524>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1bae:	0004b983          	ld	s3,0(s1)
    1bb2:	6f7000ef          	jal	ra,2aa8 <getpid>
    1bb6:	86aa                	mv	a3,a0
    1bb8:	00001617          	auipc	a2,0x1
    1bbc:	35860613          	addi	a2,a2,856 # 2f10 <__clone+0x23a>
    1bc0:	85ce                	mv	a1,s3
    1bc2:	00001517          	auipc	a0,0x1
    1bc6:	13e50513          	addi	a0,a0,318 # 2d00 <__clone+0x2a>
    1bca:	594000ef          	jal	ra,215e <printf>
  exit(1);
    1bce:	4505                	li	a0,1
    1bd0:	71f000ef          	jal	ra,2aee <exit>
  if (close(fd) == -1)
    1bd4:	854a                	mv	a0,s2
    1bd6:	6b3000ef          	jal	ra,2a88 <close>
    1bda:	e8ac0de3          	beq	s8,a0,1a74 <mmap_test+0x83e>
  _v1(p);
    1bde:	557d                	li	a0,-1
    1be0:	c5cff0ef          	jal	ra,103c <_v1>
    p[i] = 'Z';
    1be4:	05a00793          	li	a5,90
    1be8:	00fc0023          	sb	a5,0(s8)
    1bec:	4705                	li	a4,1
  for (i = 0; i < PGSIZE * 2; i++)
    1bee:	6509                	lui	a0,0x2
    1bf0:	157d                	addi	a0,a0,-1
    1bf2:	4885                	li	a7,1
    1bf4:	943ff06f          	j	1536 <mmap_test+0x300>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1bf8:	0004b983          	ld	s3,0(s1)
    1bfc:	6ad000ef          	jal	ra,2aa8 <getpid>
    1c00:	86aa                	mv	a3,a0
    1c02:	00001617          	auipc	a2,0x1
    1c06:	26660613          	addi	a2,a2,614 # 2e68 <__clone+0x192>
    1c0a:	85ce                	mv	a1,s3
    1c0c:	00001517          	auipc	a0,0x1
    1c10:	0f450513          	addi	a0,a0,244 # 2d00 <__clone+0x2a>
    1c14:	54a000ef          	jal	ra,215e <printf>
  exit(1);
    1c18:	4505                	li	a0,1
    1c1a:	6d5000ef          	jal	ra,2aee <exit>
  if (close(fd) == -1)
    1c1e:	8522                	mv	a0,s0
    1c20:	669000ef          	jal	ra,2a88 <close>
    1c24:	dea907e3          	beq	s2,a0,1a12 <mmap_test+0x7dc>
  _v1(p);
    1c28:	557d                	li	a0,-1
    1c2a:	c12ff0ef          	jal	ra,103c <_v1>
    p[i] = 'Z';
    1c2e:	05a00793          	li	a5,90
    1c32:	00f90023          	sb	a5,0(s2)
    1c36:	4705                	li	a4,1
  for (i = 0; i < PGSIZE * 2; i++)
    1c38:	6789                	lui	a5,0x2
    1c3a:	fff78513          	addi	a0,a5,-1 # 1fff <printint.constprop.0+0x11b>
    1c3e:	4885                	li	a7,1
    1c40:	f1aff06f          	j	135a <mmap_test+0x124>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1c44:	0004b983          	ld	s3,0(s1)
    1c48:	661000ef          	jal	ra,2aa8 <getpid>
    1c4c:	86aa                	mv	a3,a0
    1c4e:	00001617          	auipc	a2,0x1
    1c52:	1ca60613          	addi	a2,a2,458 # 2e18 <__clone+0x142>
    1c56:	00001517          	auipc	a0,0x1
    1c5a:	0aa50513          	addi	a0,a0,170 # 2d00 <__clone+0x2a>
    1c5e:	85ce                	mv	a1,s3
    1c60:	4fe000ef          	jal	ra,215e <printf>
  exit(1);
    1c64:	4505                	li	a0,1
    1c66:	689000ef          	jal	ra,2aee <exit>
}
    1c6a:	e46ff06f          	j	12b0 <mmap_test+0x7a>
  for (i = 0; i < PGSIZE * 2; i++)
    1c6e:	6509                	lui	a0,0x2
    1c70:	1579                	addi	a0,a0,-2
    1c72:	4889                	li	a7,2
    1c74:	8c3ff06f          	j	1536 <mmap_test+0x300>
  for (i = 0; i < PGSIZE * 2; i++)
    1c78:	6789                	lui	a5,0x2
    1c7a:	ffe78513          	addi	a0,a5,-2 # 1ffe <printint.constprop.0+0x11a>
    1c7e:	4889                	li	a7,2
    1c80:	edaff06f          	j	135a <mmap_test+0x124>
    1c84:	6789                	lui	a5,0x2
    1c86:	ffd78513          	addi	a0,a5,-3 # 1ffd <printint.constprop.0+0x119>
    1c8a:	488d                	li	a7,3
    1c8c:	eceff06f          	j	135a <mmap_test+0x124>
  for (i = 0; i < PGSIZE * 2; i++)
    1c90:	6509                	lui	a0,0x2
    1c92:	1575                	addi	a0,a0,-3
    1c94:	488d                	li	a7,3
    1c96:	8a1ff06f          	j	1536 <mmap_test+0x300>
    1c9a:	6509                	lui	a0,0x2
    1c9c:	1571                	addi	a0,a0,-4
    1c9e:	4891                	li	a7,4
    1ca0:	897ff06f          	j	1536 <mmap_test+0x300>
  for (i = 0; i < PGSIZE * 2; i++)
    1ca4:	6789                	lui	a5,0x2
    1ca6:	ffb78513          	addi	a0,a5,-5 # 1ffb <printint.constprop.0+0x117>
    1caa:	4895                	li	a7,5
    1cac:	eaeff06f          	j	135a <mmap_test+0x124>
  for (i = 0; i < PGSIZE * 2; i++)
    1cb0:	6509                	lui	a0,0x2
    1cb2:	156d                	addi	a0,a0,-5
    1cb4:	4895                	li	a7,5
    1cb6:	881ff06f          	j	1536 <mmap_test+0x300>
  for (i = 0; i < PGSIZE * 2; i++)
    1cba:	6789                	lui	a5,0x2
    1cbc:	ffa78513          	addi	a0,a5,-6 # 1ffa <printint.constprop.0+0x116>
    1cc0:	4899                	li	a7,6
    1cc2:	e98ff06f          	j	135a <mmap_test+0x124>
  for (i = 0; i < PGSIZE * 2; i++)
    1cc6:	6509                	lui	a0,0x2
    1cc8:	1569                	addi	a0,a0,-6
    1cca:	4899                	li	a7,6
    1ccc:	86bff06f          	j	1536 <mmap_test+0x300>

0000000000001cd0 <fork_test>:

//
// mmap a file, then fork.
// check that the child sees the mapped file.
//
void fork_test(void) {
    1cd0:	7139                	addi	sp,sp,-64
  int fd;
  int pid;
  const char *const f = "mmap.dur";

  printf("fork_test starting\n");
    1cd2:	00001517          	auipc	a0,0x1
    1cd6:	43650513          	addi	a0,a0,1078 # 3108 <__clone+0x432>
void fork_test(void) {
    1cda:	fc06                	sd	ra,56(sp)
    1cdc:	f426                	sd	s1,40(sp)
    1cde:	f04a                	sd	s2,32(sp)
    1ce0:	f822                	sd	s0,48(sp)
    1ce2:	ec4e                	sd	s3,24(sp)
  printf("fork_test starting\n");
    1ce4:	47a000ef          	jal	ra,215e <printf>
  testname = "fork_test";
    1ce8:	00001797          	auipc	a5,0x1
    1cec:	43878793          	addi	a5,a5,1080 # 3120 <__clone+0x44a>

  // mmap the file twice.
  makefile(f);
    1cf0:	00001517          	auipc	a0,0x1
    1cf4:	10850513          	addi	a0,a0,264 # 2df8 <__clone+0x122>
  testname = "fork_test";
    1cf8:	00002917          	auipc	s2,0x2
    1cfc:	90890913          	addi	s2,s2,-1784 # 3600 <testname>
    1d00:	00f93023          	sd	a5,0(s2)
  makefile(f);
    1d04:	c18ff0ef          	jal	ra,111c <makefile>
  if ((fd = open(f, O_RDONLY)) == -1)
    1d08:	4581                	li	a1,0
    1d0a:	00001517          	auipc	a0,0x1
    1d0e:	0ee50513          	addi	a0,a0,238 # 2df8 <__clone+0x122>
    1d12:	545000ef          	jal	ra,2a56 <open>
    1d16:	57fd                	li	a5,-1
    1d18:	84aa                	mv	s1,a0
    1d1a:	10f50963          	beq	a0,a5,1e2c <fork_test+0x15c>
    err("open");
  char *p1 = mmap(0, PGSIZE * 2, PROT_READ, MAP_SHARED, fd, 0);
    1d1e:	4781                	li	a5,0
    1d20:	8726                	mv	a4,s1
    1d22:	4685                	li	a3,1
    1d24:	4605                	li	a2,1
    1d26:	6589                	lui	a1,0x2
    1d28:	4501                	li	a0,0
    1d2a:	673000ef          	jal	ra,2b9c <mmap>
  if (p1 == MAP_FAILED)
    1d2e:	57fd                	li	a5,-1
  char *p1 = mmap(0, PGSIZE * 2, PROT_READ, MAP_SHARED, fd, 0);
    1d30:	842a                	mv	s0,a0
  if (p1 == MAP_FAILED)
    1d32:	14f50563          	beq	a0,a5,1e7c <fork_test+0x1ac>
    err("mmap (4)");
  char *p2 = mmap(0, PGSIZE * 2, PROT_READ, MAP_SHARED, fd, 0);
    1d36:	4781                	li	a5,0
    1d38:	8726                	mv	a4,s1
    1d3a:	4685                	li	a3,1
    1d3c:	4605                	li	a2,1
    1d3e:	6589                	lui	a1,0x2
    1d40:	4501                	li	a0,0
    1d42:	65b000ef          	jal	ra,2b9c <mmap>
  if (p2 == MAP_FAILED)
    1d46:	57fd                	li	a5,-1
  char *p2 = mmap(0, PGSIZE * 2, PROT_READ, MAP_SHARED, fd, 0);
    1d48:	84aa                	mv	s1,a0
  if (p2 == MAP_FAILED)
    1d4a:	10f50563          	beq	a0,a5,1e54 <fork_test+0x184>
    err("mmap (5)");

  // read just 2nd page.
  if (*(p1 + PGSIZE) != 'A')
    1d4e:	6785                	lui	a5,0x1
    1d50:	97a2                	add	a5,a5,s0
    1d52:	0007c703          	lbu	a4,0(a5) # 1000 <_start>
    1d56:	04100793          	li	a5,65
    1d5a:	02f70563          	beq	a4,a5,1d84 <fork_test+0xb4>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1d5e:	00093983          	ld	s3,0(s2)
    1d62:	547000ef          	jal	ra,2aa8 <getpid>
    1d66:	86aa                	mv	a3,a0
    1d68:	00001617          	auipc	a2,0x1
    1d6c:	3e860613          	addi	a2,a2,1000 # 3150 <__clone+0x47a>
    1d70:	00001517          	auipc	a0,0x1
    1d74:	f9050513          	addi	a0,a0,-112 # 2d00 <__clone+0x2a>
    1d78:	85ce                	mv	a1,s3
    1d7a:	3e4000ef          	jal	ra,215e <printf>
  exit(1);
    1d7e:	4505                	li	a0,1
    1d80:	56f000ef          	jal	ra,2aee <exit>
    err("fork mismatch (1)");

  if ((pid = fork()) < 0)
    1d84:	549000ef          	jal	ra,2acc <fork>
    1d88:	06054e63          	bltz	a0,1e04 <fork_test+0x134>
    err("fork");
  if (pid == 0) {
    1d8c:	c129                	beqz	a0,1dce <fork_test+0xfe>
    _v1(p1);
    munmap(p1, PGSIZE); // just the first page
    exit(0);            // tell the parent that the mapping looks OK.
  }

  int status = -1;
    1d8e:	57fd                	li	a5,-1
  wait(&status);
    1d90:	0068                	addi	a0,sp,12
  int status = -1;
    1d92:	c63e                	sw	a5,12(sp)
  wait(&status);
    1d94:	61f000ef          	jal	ra,2bb2 <wait>

  if (status != 0) {
    1d98:	47b2                	lw	a5,12(sp)
    1d9a:	ebb9                	bnez	a5,1df0 <fork_test+0x120>
    printf("fork_test failed\n");
    exit(1);
  }

  // check that the parent's mappings are still there.
  _v1(p1);
    1d9c:	8522                	mv	a0,s0
    1d9e:	a9eff0ef          	jal	ra,103c <_v1>
  _v1(p2);
    1da2:	8526                	mv	a0,s1
    1da4:	a98ff0ef          	jal	ra,103c <_v1>
  unlink(f);
    1da8:	00001517          	auipc	a0,0x1
    1dac:	05050513          	addi	a0,a0,80 # 2df8 <__clone+0x122>
    1db0:	683000ef          	jal	ra,2c32 <unlink>

  printf("fork_test OK\n");
    1db4:	00001517          	auipc	a0,0x1
    1db8:	3d450513          	addi	a0,a0,980 # 3188 <__clone+0x4b2>
    1dbc:	3a2000ef          	jal	ra,215e <printf>
}
    1dc0:	70e2                	ld	ra,56(sp)
    1dc2:	7442                	ld	s0,48(sp)
    1dc4:	74a2                	ld	s1,40(sp)
    1dc6:	7902                	ld	s2,32(sp)
    1dc8:	69e2                	ld	s3,24(sp)
    1dca:	6121                	addi	sp,sp,64
    1dcc:	8082                	ret
    _v1(p1);
    1dce:	8522                	mv	a0,s0
    1dd0:	a6cff0ef          	jal	ra,103c <_v1>
    munmap(p1, PGSIZE); // just the first page
    1dd4:	6585                	lui	a1,0x1
    1dd6:	8522                	mv	a0,s0
    1dd8:	5cf000ef          	jal	ra,2ba6 <munmap>
    exit(0);            // tell the parent that the mapping looks OK.
    1ddc:	4501                	li	a0,0
    1dde:	511000ef          	jal	ra,2aee <exit>
  int status = -1;
    1de2:	57fd                	li	a5,-1
  wait(&status);
    1de4:	0068                	addi	a0,sp,12
  int status = -1;
    1de6:	c63e                	sw	a5,12(sp)
  wait(&status);
    1de8:	5cb000ef          	jal	ra,2bb2 <wait>
  if (status != 0) {
    1dec:	47b2                	lw	a5,12(sp)
    1dee:	d7dd                	beqz	a5,1d9c <fork_test+0xcc>
    printf("fork_test failed\n");
    1df0:	00001517          	auipc	a0,0x1
    1df4:	38050513          	addi	a0,a0,896 # 3170 <__clone+0x49a>
    1df8:	366000ef          	jal	ra,215e <printf>
    exit(1);
    1dfc:	4505                	li	a0,1
    1dfe:	4f1000ef          	jal	ra,2aee <exit>
    1e02:	bf69                	j	1d9c <fork_test+0xcc>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1e04:	00093903          	ld	s2,0(s2)
    1e08:	4a1000ef          	jal	ra,2aa8 <getpid>
    1e0c:	86aa                	mv	a3,a0
    1e0e:	00001617          	auipc	a2,0x1
    1e12:	35a60613          	addi	a2,a2,858 # 3168 <__clone+0x492>
    1e16:	85ca                	mv	a1,s2
    1e18:	00001517          	auipc	a0,0x1
    1e1c:	ee850513          	addi	a0,a0,-280 # 2d00 <__clone+0x2a>
    1e20:	33e000ef          	jal	ra,215e <printf>
  exit(1);
    1e24:	4505                	li	a0,1
    1e26:	4c9000ef          	jal	ra,2aee <exit>
  if (pid == 0) {
    1e2a:	b795                	j	1d8e <fork_test+0xbe>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1e2c:	00093403          	ld	s0,0(s2)
    1e30:	479000ef          	jal	ra,2aa8 <getpid>
    1e34:	86aa                	mv	a3,a0
    1e36:	00001617          	auipc	a2,0x1
    1e3a:	f7260613          	addi	a2,a2,-142 # 2da8 <__clone+0xd2>
    1e3e:	00001517          	auipc	a0,0x1
    1e42:	ec250513          	addi	a0,a0,-318 # 2d00 <__clone+0x2a>
    1e46:	85a2                	mv	a1,s0
    1e48:	316000ef          	jal	ra,215e <printf>
  exit(1);
    1e4c:	4505                	li	a0,1
    1e4e:	4a1000ef          	jal	ra,2aee <exit>
}
    1e52:	b5f1                	j	1d1e <fork_test+0x4e>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1e54:	00093983          	ld	s3,0(s2)
    1e58:	451000ef          	jal	ra,2aa8 <getpid>
    1e5c:	86aa                	mv	a3,a0
    1e5e:	00001617          	auipc	a2,0x1
    1e62:	2e260613          	addi	a2,a2,738 # 3140 <__clone+0x46a>
    1e66:	00001517          	auipc	a0,0x1
    1e6a:	e9a50513          	addi	a0,a0,-358 # 2d00 <__clone+0x2a>
    1e6e:	85ce                	mv	a1,s3
    1e70:	2ee000ef          	jal	ra,215e <printf>
  exit(1);
    1e74:	4505                	li	a0,1
    1e76:	479000ef          	jal	ra,2aee <exit>
}
    1e7a:	bdd1                	j	1d4e <fork_test+0x7e>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1e7c:	00093983          	ld	s3,0(s2)
    1e80:	429000ef          	jal	ra,2aa8 <getpid>
    1e84:	86aa                	mv	a3,a0
    1e86:	00001617          	auipc	a2,0x1
    1e8a:	2aa60613          	addi	a2,a2,682 # 3130 <__clone+0x45a>
    1e8e:	00001517          	auipc	a0,0x1
    1e92:	e7250513          	addi	a0,a0,-398 # 2d00 <__clone+0x2a>
    1e96:	85ce                	mv	a1,s3
    1e98:	2c6000ef          	jal	ra,215e <printf>
  exit(1);
    1e9c:	4505                	li	a0,1
    1e9e:	451000ef          	jal	ra,2aee <exit>
}
    1ea2:	bd51                	j	1d36 <fork_test+0x66>

0000000000001ea4 <main>:
int main(int argc, char *argv[]) {
    1ea4:	1141                	addi	sp,sp,-16
    1ea6:	e406                	sd	ra,8(sp)
  mmap_test();
    1ea8:	b8eff0ef          	jal	ra,1236 <mmap_test>
  fork_test();
    1eac:	e25ff0ef          	jal	ra,1cd0 <fork_test>
  printf("mmaptest: all tests succeeded\n");
    1eb0:	00001517          	auipc	a0,0x1
    1eb4:	2e850513          	addi	a0,a0,744 # 3198 <__clone+0x4c2>
    1eb8:	2a6000ef          	jal	ra,215e <printf>
  exit(0);
    1ebc:	4501                	li	a0,0
    1ebe:	431000ef          	jal	ra,2aee <exit>
}
    1ec2:	60a2                	ld	ra,8(sp)
    1ec4:	4501                	li	a0,0
    1ec6:	0141                	addi	sp,sp,16
    1ec8:	8082                	ret

0000000000001eca <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1eca:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1ecc:	4108                	lw	a0,0(a0)
{
    1ece:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    1ed0:	05a1                	addi	a1,a1,8
{
    1ed2:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1ed4:	fd1ff0ef          	jal	ra,1ea4 <main>
    1ed8:	417000ef          	jal	ra,2aee <exit>
	return 0;
}
    1edc:	60a2                	ld	ra,8(sp)
    1ede:	4501                	li	a0,0
    1ee0:	0141                	addi	sp,sp,16
    1ee2:	8082                	ret

0000000000001ee4 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1ee4:	7179                	addi	sp,sp,-48
    1ee6:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1ee8:	12054b63          	bltz	a0,201e <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1eec:	02b577bb          	remuw	a5,a0,a1
    1ef0:	00001617          	auipc	a2,0x1
    1ef4:	6f860613          	addi	a2,a2,1784 # 35e8 <digits>
    buf[16] = 0;
    1ef8:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1efc:	0005871b          	sext.w	a4,a1
    1f00:	1782                	slli	a5,a5,0x20
    1f02:	9381                	srli	a5,a5,0x20
    1f04:	97b2                	add	a5,a5,a2
    1f06:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1f0a:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1f0e:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1f12:	1cb56363          	bltu	a0,a1,20d8 <printint.constprop.0+0x1f4>
        buf[i--] = digits[x % base];
    1f16:	45b9                	li	a1,14
    1f18:	02e877bb          	remuw	a5,a6,a4
    1f1c:	1782                	slli	a5,a5,0x20
    1f1e:	9381                	srli	a5,a5,0x20
    1f20:	97b2                	add	a5,a5,a2
    1f22:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1f26:	02e856bb          	divuw	a3,a6,a4
        buf[i--] = digits[x % base];
    1f2a:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    1f2e:	0ce86e63          	bltu	a6,a4,200a <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    1f32:	02e6f5bb          	remuw	a1,a3,a4
    } while ((x /= base) != 0);
    1f36:	02e6d7bb          	divuw	a5,a3,a4
        buf[i--] = digits[x % base];
    1f3a:	1582                	slli	a1,a1,0x20
    1f3c:	9181                	srli	a1,a1,0x20
    1f3e:	95b2                	add	a1,a1,a2
    1f40:	0005c583          	lbu	a1,0(a1) # 1000 <_start>
    1f44:	00b10aa3          	sb	a1,21(sp)
    } while ((x /= base) != 0);
    1f48:	0007859b          	sext.w	a1,a5
    1f4c:	12e6ec63          	bltu	a3,a4,2084 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    1f50:	02e7f6bb          	remuw	a3,a5,a4
    1f54:	1682                	slli	a3,a3,0x20
    1f56:	9281                	srli	a3,a3,0x20
    1f58:	96b2                	add	a3,a3,a2
    1f5a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1f5e:	02e7d83b          	divuw	a6,a5,a4
        buf[i--] = digits[x % base];
    1f62:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1f66:	12e5e863          	bltu	a1,a4,2096 <printint.constprop.0+0x1b2>
        buf[i--] = digits[x % base];
    1f6a:	02e876bb          	remuw	a3,a6,a4
    1f6e:	1682                	slli	a3,a3,0x20
    1f70:	9281                	srli	a3,a3,0x20
    1f72:	96b2                	add	a3,a3,a2
    1f74:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1f78:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1f7c:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1f80:	12e86463          	bltu	a6,a4,20a8 <printint.constprop.0+0x1c4>
        buf[i--] = digits[x % base];
    1f84:	02e5f6bb          	remuw	a3,a1,a4
    1f88:	1682                	slli	a3,a3,0x20
    1f8a:	9281                	srli	a3,a3,0x20
    1f8c:	96b2                	add	a3,a3,a2
    1f8e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1f92:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1f96:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    1f9a:	0ce5ec63          	bltu	a1,a4,2072 <printint.constprop.0+0x18e>
        buf[i--] = digits[x % base];
    1f9e:	02e876bb          	remuw	a3,a6,a4
    1fa2:	1682                	slli	a3,a3,0x20
    1fa4:	9281                	srli	a3,a3,0x20
    1fa6:	96b2                	add	a3,a3,a2
    1fa8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1fac:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1fb0:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1fb4:	10e86963          	bltu	a6,a4,20c6 <printint.constprop.0+0x1e2>
        buf[i--] = digits[x % base];
    1fb8:	02e5f6bb          	remuw	a3,a1,a4
    1fbc:	1682                	slli	a3,a3,0x20
    1fbe:	9281                	srli	a3,a3,0x20
    1fc0:	96b2                	add	a3,a3,a2
    1fc2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1fc6:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1fca:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    1fce:	10e5e763          	bltu	a1,a4,20dc <printint.constprop.0+0x1f8>
        buf[i--] = digits[x % base];
    1fd2:	02e876bb          	remuw	a3,a6,a4
    1fd6:	1682                	slli	a3,a3,0x20
    1fd8:	9281                	srli	a3,a3,0x20
    1fda:	96b2                	add	a3,a3,a2
    1fdc:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1fe0:	02e857bb          	divuw	a5,a6,a4
        buf[i--] = digits[x % base];
    1fe4:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    1fe8:	10e86363          	bltu	a6,a4,20ee <printint.constprop.0+0x20a>
        buf[i--] = digits[x % base];
    1fec:	1782                	slli	a5,a5,0x20
    1fee:	9381                	srli	a5,a5,0x20
    1ff0:	97b2                	add	a5,a5,a2
    1ff2:	0007c783          	lbu	a5,0(a5)
    1ff6:	4599                	li	a1,6
    1ff8:	00f10723          	sb	a5,14(sp)

    if (sign)
    1ffc:	00055763          	bgez	a0,200a <printint.constprop.0+0x126>
        buf[i--] = '-';
    2000:	02d00793          	li	a5,45
    2004:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    2008:	4595                	li	a1,5
    write(f, s, l);
    200a:	003c                	addi	a5,sp,8
    200c:	4641                	li	a2,16
    200e:	9e0d                	subw	a2,a2,a1
    2010:	4505                	li	a0,1
    2012:	95be                	add	a1,a1,a5
    2014:	28b000ef          	jal	ra,2a9e <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    2018:	70a2                	ld	ra,40(sp)
    201a:	6145                	addi	sp,sp,48
    201c:	8082                	ret
        x = -xx;
    201e:	40a0083b          	negw	a6,a0
        buf[i--] = digits[x % base];
    2022:	02b877bb          	remuw	a5,a6,a1
    2026:	00001617          	auipc	a2,0x1
    202a:	5c260613          	addi	a2,a2,1474 # 35e8 <digits>
    buf[16] = 0;
    202e:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    2032:	0005871b          	sext.w	a4,a1
    2036:	1782                	slli	a5,a5,0x20
    2038:	9381                	srli	a5,a5,0x20
    203a:	97b2                	add	a5,a5,a2
    203c:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    2040:	02b858bb          	divuw	a7,a6,a1
        buf[i--] = digits[x % base];
    2044:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    2048:	06b86963          	bltu	a6,a1,20ba <printint.constprop.0+0x1d6>
        buf[i--] = digits[x % base];
    204c:	02e8f7bb          	remuw	a5,a7,a4
    2050:	1782                	slli	a5,a5,0x20
    2052:	9381                	srli	a5,a5,0x20
    2054:	97b2                	add	a5,a5,a2
    2056:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    205a:	02e8d6bb          	divuw	a3,a7,a4
        buf[i--] = digits[x % base];
    205e:	00f10b23          	sb	a5,22(sp)
    } while ((x /= base) != 0);
    2062:	ece8f8e3          	bgeu	a7,a4,1f32 <printint.constprop.0+0x4e>
        buf[i--] = '-';
    2066:	02d00793          	li	a5,45
    206a:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    206e:	45b5                	li	a1,13
    2070:	bf69                	j	200a <printint.constprop.0+0x126>
    2072:	45a9                	li	a1,10
    if (sign)
    2074:	f8055be3          	bgez	a0,200a <printint.constprop.0+0x126>
        buf[i--] = '-';
    2078:	02d00793          	li	a5,45
    207c:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    2080:	45a5                	li	a1,9
    2082:	b761                	j	200a <printint.constprop.0+0x126>
    2084:	45b5                	li	a1,13
    if (sign)
    2086:	f80552e3          	bgez	a0,200a <printint.constprop.0+0x126>
        buf[i--] = '-';
    208a:	02d00793          	li	a5,45
    208e:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    2092:	45b1                	li	a1,12
    2094:	bf9d                	j	200a <printint.constprop.0+0x126>
    2096:	45b1                	li	a1,12
    if (sign)
    2098:	f60559e3          	bgez	a0,200a <printint.constprop.0+0x126>
        buf[i--] = '-';
    209c:	02d00793          	li	a5,45
    20a0:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    20a4:	45ad                	li	a1,11
    20a6:	b795                	j	200a <printint.constprop.0+0x126>
    20a8:	45ad                	li	a1,11
    if (sign)
    20aa:	f60550e3          	bgez	a0,200a <printint.constprop.0+0x126>
        buf[i--] = '-';
    20ae:	02d00793          	li	a5,45
    20b2:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    20b6:	45a9                	li	a1,10
    20b8:	bf89                	j	200a <printint.constprop.0+0x126>
        buf[i--] = '-';
    20ba:	02d00793          	li	a5,45
    20be:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    20c2:	45b9                	li	a1,14
    20c4:	b799                	j	200a <printint.constprop.0+0x126>
    20c6:	45a5                	li	a1,9
    if (sign)
    20c8:	f40551e3          	bgez	a0,200a <printint.constprop.0+0x126>
        buf[i--] = '-';
    20cc:	02d00793          	li	a5,45
    20d0:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    20d4:	45a1                	li	a1,8
    20d6:	bf15                	j	200a <printint.constprop.0+0x126>
    i = 15;
    20d8:	45bd                	li	a1,15
    20da:	bf05                	j	200a <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    20dc:	45a1                	li	a1,8
    if (sign)
    20de:	f20556e3          	bgez	a0,200a <printint.constprop.0+0x126>
        buf[i--] = '-';
    20e2:	02d00793          	li	a5,45
    20e6:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    20ea:	459d                	li	a1,7
    20ec:	bf39                	j	200a <printint.constprop.0+0x126>
    20ee:	459d                	li	a1,7
    if (sign)
    20f0:	f0055de3          	bgez	a0,200a <printint.constprop.0+0x126>
        buf[i--] = '-';
    20f4:	02d00793          	li	a5,45
    20f8:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    20fc:	4599                	li	a1,6
    20fe:	b731                	j	200a <printint.constprop.0+0x126>

0000000000002100 <getchar>:
{
    2100:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    2102:	00f10593          	addi	a1,sp,15
    2106:	4605                	li	a2,1
    2108:	4501                	li	a0,0
{
    210a:	ec06                	sd	ra,24(sp)
    char byte = 0;
    210c:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    2110:	185000ef          	jal	ra,2a94 <read>
}
    2114:	60e2                	ld	ra,24(sp)
    2116:	00f14503          	lbu	a0,15(sp)
    211a:	6105                	addi	sp,sp,32
    211c:	8082                	ret

000000000000211e <putchar>:
{
    211e:	1101                	addi	sp,sp,-32
    2120:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    2122:	00f10593          	addi	a1,sp,15
    2126:	4605                	li	a2,1
    2128:	4505                	li	a0,1
{
    212a:	ec06                	sd	ra,24(sp)
    char byte = c;
    212c:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    2130:	16f000ef          	jal	ra,2a9e <write>
}
    2134:	60e2                	ld	ra,24(sp)
    2136:	2501                	sext.w	a0,a0
    2138:	6105                	addi	sp,sp,32
    213a:	8082                	ret

000000000000213c <puts>:
{
    213c:	1141                	addi	sp,sp,-16
    213e:	e406                	sd	ra,8(sp)
    2140:	e022                	sd	s0,0(sp)
    2142:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    2144:	56c000ef          	jal	ra,26b0 <strlen>
    2148:	862a                	mv	a2,a0
    214a:	85a2                	mv	a1,s0
    214c:	4505                	li	a0,1
    214e:	151000ef          	jal	ra,2a9e <write>
}
    2152:	60a2                	ld	ra,8(sp)
    2154:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    2156:	957d                	srai	a0,a0,0x3f
    return r;
    2158:	2501                	sext.w	a0,a0
}
    215a:	0141                	addi	sp,sp,16
    215c:	8082                	ret

000000000000215e <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    215e:	7171                	addi	sp,sp,-176
    2160:	fc56                	sd	s5,56(sp)
    2162:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    2164:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    2166:	18bc                	addi	a5,sp,120
{
    2168:	e8ca                	sd	s2,80(sp)
    216a:	e4ce                	sd	s3,72(sp)
    216c:	e0d2                	sd	s4,64(sp)
    216e:	f85a                	sd	s6,48(sp)
    2170:	f486                	sd	ra,104(sp)
    2172:	f0a2                	sd	s0,96(sp)
    2174:	eca6                	sd	s1,88(sp)
    2176:	fcae                	sd	a1,120(sp)
    2178:	e132                	sd	a2,128(sp)
    217a:	e536                	sd	a3,136(sp)
    217c:	e93a                	sd	a4,144(sp)
    217e:	f142                	sd	a6,160(sp)
    2180:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    2182:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    2184:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    2188:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    218c:	00001b17          	auipc	s6,0x1
    2190:	034b0b13          	addi	s6,s6,52 # 31c0 <__clone+0x4ea>
    buf[i++] = '0';
    2194:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    2198:	00001997          	auipc	s3,0x1
    219c:	45098993          	addi	s3,s3,1104 # 35e8 <digits>
        if (!*s)
    21a0:	00054783          	lbu	a5,0(a0)
    21a4:	16078a63          	beqz	a5,2318 <printf+0x1ba>
    21a8:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    21aa:	19278163          	beq	a5,s2,232c <printf+0x1ce>
    21ae:	00164783          	lbu	a5,1(a2)
    21b2:	0605                	addi	a2,a2,1
    21b4:	fbfd                	bnez	a5,21aa <printf+0x4c>
    21b6:	84b2                	mv	s1,a2
        l = z - a;
    21b8:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    21bc:	85aa                	mv	a1,a0
    21be:	8622                	mv	a2,s0
    21c0:	4505                	li	a0,1
    21c2:	0dd000ef          	jal	ra,2a9e <write>
        if (l)
    21c6:	18041c63          	bnez	s0,235e <printf+0x200>
        if (s[1] == 0)
    21ca:	0014c783          	lbu	a5,1(s1)
    21ce:	14078563          	beqz	a5,2318 <printf+0x1ba>
        switch (s[1])
    21d2:	1d478063          	beq	a5,s4,2392 <printf+0x234>
    21d6:	18fa6663          	bltu	s4,a5,2362 <printf+0x204>
    21da:	06400713          	li	a4,100
    21de:	1ae78063          	beq	a5,a4,237e <printf+0x220>
    21e2:	07000713          	li	a4,112
    21e6:	1ce79963          	bne	a5,a4,23b8 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    21ea:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    21ec:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    21f0:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    21f2:	631c                	ld	a5,0(a4)
    21f4:	0721                	addi	a4,a4,8
    21f6:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    21f8:	00479293          	slli	t0,a5,0x4
    21fc:	00879f93          	slli	t6,a5,0x8
    2200:	00c79f13          	slli	t5,a5,0xc
    2204:	01079e93          	slli	t4,a5,0x10
    2208:	01479e13          	slli	t3,a5,0x14
    220c:	01879313          	slli	t1,a5,0x18
    2210:	01c79893          	slli	a7,a5,0x1c
    2214:	02479813          	slli	a6,a5,0x24
    2218:	02879513          	slli	a0,a5,0x28
    221c:	02c79593          	slli	a1,a5,0x2c
    2220:	03079693          	slli	a3,a5,0x30
    2224:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    2228:	03c7d413          	srli	s0,a5,0x3c
    222c:	01c7d39b          	srliw	t2,a5,0x1c
    2230:	03c2d293          	srli	t0,t0,0x3c
    2234:	03cfdf93          	srli	t6,t6,0x3c
    2238:	03cf5f13          	srli	t5,t5,0x3c
    223c:	03cede93          	srli	t4,t4,0x3c
    2240:	03ce5e13          	srli	t3,t3,0x3c
    2244:	03c35313          	srli	t1,t1,0x3c
    2248:	03c8d893          	srli	a7,a7,0x3c
    224c:	03c85813          	srli	a6,a6,0x3c
    2250:	9171                	srli	a0,a0,0x3c
    2252:	91f1                	srli	a1,a1,0x3c
    2254:	92f1                	srli	a3,a3,0x3c
    2256:	9371                	srli	a4,a4,0x3c
    2258:	96ce                	add	a3,a3,s3
    225a:	974e                	add	a4,a4,s3
    225c:	944e                	add	s0,s0,s3
    225e:	92ce                	add	t0,t0,s3
    2260:	9fce                	add	t6,t6,s3
    2262:	9f4e                	add	t5,t5,s3
    2264:	9ece                	add	t4,t4,s3
    2266:	9e4e                	add	t3,t3,s3
    2268:	934e                	add	t1,t1,s3
    226a:	98ce                	add	a7,a7,s3
    226c:	93ce                	add	t2,t2,s3
    226e:	984e                	add	a6,a6,s3
    2270:	954e                	add	a0,a0,s3
    2272:	95ce                	add	a1,a1,s3
    2274:	0006c083          	lbu	ra,0(a3)
    2278:	0002c283          	lbu	t0,0(t0)
    227c:	00074683          	lbu	a3,0(a4)
    2280:	000fcf83          	lbu	t6,0(t6)
    2284:	000f4f03          	lbu	t5,0(t5)
    2288:	000ece83          	lbu	t4,0(t4)
    228c:	000e4e03          	lbu	t3,0(t3)
    2290:	00034303          	lbu	t1,0(t1)
    2294:	0008c883          	lbu	a7,0(a7)
    2298:	0003c383          	lbu	t2,0(t2)
    229c:	00084803          	lbu	a6,0(a6)
    22a0:	00054503          	lbu	a0,0(a0)
    22a4:	0005c583          	lbu	a1,0(a1)
    22a8:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    22ac:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    22b0:	9371                	srli	a4,a4,0x3c
    22b2:	8bbd                	andi	a5,a5,15
    22b4:	974e                	add	a4,a4,s3
    22b6:	97ce                	add	a5,a5,s3
    22b8:	005105a3          	sb	t0,11(sp)
    22bc:	01f10623          	sb	t6,12(sp)
    22c0:	01e106a3          	sb	t5,13(sp)
    22c4:	01d10723          	sb	t4,14(sp)
    22c8:	01c107a3          	sb	t3,15(sp)
    22cc:	00610823          	sb	t1,16(sp)
    22d0:	011108a3          	sb	a7,17(sp)
    22d4:	00710923          	sb	t2,18(sp)
    22d8:	010109a3          	sb	a6,19(sp)
    22dc:	00a10a23          	sb	a0,20(sp)
    22e0:	00b10aa3          	sb	a1,21(sp)
    22e4:	00110b23          	sb	ra,22(sp)
    22e8:	00d10ba3          	sb	a3,23(sp)
    22ec:	00810523          	sb	s0,10(sp)
    22f0:	00074703          	lbu	a4,0(a4)
    22f4:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    22f8:	002c                	addi	a1,sp,8
    22fa:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    22fc:	00e10c23          	sb	a4,24(sp)
    2300:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    2304:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    2308:	796000ef          	jal	ra,2a9e <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    230c:	00248513          	addi	a0,s1,2
        if (!*s)
    2310:	00054783          	lbu	a5,0(a0)
    2314:	e8079ae3          	bnez	a5,21a8 <printf+0x4a>
    }
    va_end(ap);
}
    2318:	70a6                	ld	ra,104(sp)
    231a:	7406                	ld	s0,96(sp)
    231c:	64e6                	ld	s1,88(sp)
    231e:	6946                	ld	s2,80(sp)
    2320:	69a6                	ld	s3,72(sp)
    2322:	6a06                	ld	s4,64(sp)
    2324:	7ae2                	ld	s5,56(sp)
    2326:	7b42                	ld	s6,48(sp)
    2328:	614d                	addi	sp,sp,176
    232a:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    232c:	00064783          	lbu	a5,0(a2)
    2330:	84b2                	mv	s1,a2
    2332:	01278963          	beq	a5,s2,2344 <printf+0x1e6>
    2336:	b549                	j	21b8 <printf+0x5a>
    2338:	0024c783          	lbu	a5,2(s1)
    233c:	0605                	addi	a2,a2,1
    233e:	0489                	addi	s1,s1,2
    2340:	e7279ce3          	bne	a5,s2,21b8 <printf+0x5a>
    2344:	0014c783          	lbu	a5,1(s1)
    2348:	ff2788e3          	beq	a5,s2,2338 <printf+0x1da>
        l = z - a;
    234c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    2350:	85aa                	mv	a1,a0
    2352:	8622                	mv	a2,s0
    2354:	4505                	li	a0,1
    2356:	748000ef          	jal	ra,2a9e <write>
        if (l)
    235a:	e60408e3          	beqz	s0,21ca <printf+0x6c>
    235e:	8526                	mv	a0,s1
    2360:	b581                	j	21a0 <printf+0x42>
        switch (s[1])
    2362:	07800713          	li	a4,120
    2366:	04e79963          	bne	a5,a4,23b8 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    236a:	6782                	ld	a5,0(sp)
    236c:	45c1                	li	a1,16
    236e:	4388                	lw	a0,0(a5)
    2370:	07a1                	addi	a5,a5,8
    2372:	e03e                	sd	a5,0(sp)
    2374:	b71ff0ef          	jal	ra,1ee4 <printint.constprop.0>
        s += 2;
    2378:	00248513          	addi	a0,s1,2
    237c:	bf51                	j	2310 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    237e:	6782                	ld	a5,0(sp)
    2380:	45a9                	li	a1,10
    2382:	4388                	lw	a0,0(a5)
    2384:	07a1                	addi	a5,a5,8
    2386:	e03e                	sd	a5,0(sp)
    2388:	b5dff0ef          	jal	ra,1ee4 <printint.constprop.0>
        s += 2;
    238c:	00248513          	addi	a0,s1,2
    2390:	b741                	j	2310 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    2392:	6782                	ld	a5,0(sp)
    2394:	6380                	ld	s0,0(a5)
    2396:	07a1                	addi	a5,a5,8
    2398:	e03e                	sd	a5,0(sp)
    239a:	c031                	beqz	s0,23de <printf+0x280>
            l = strnlen(a, 200);
    239c:	0c800593          	li	a1,200
    23a0:	8522                	mv	a0,s0
    23a2:	3fa000ef          	jal	ra,279c <strnlen>
    write(f, s, l);
    23a6:	0005061b          	sext.w	a2,a0
    23aa:	85a2                	mv	a1,s0
    23ac:	4505                	li	a0,1
    23ae:	6f0000ef          	jal	ra,2a9e <write>
        s += 2;
    23b2:	00248513          	addi	a0,s1,2
    23b6:	bfa9                	j	2310 <printf+0x1b2>
    return write(stdout, &byte, 1);
    23b8:	4605                	li	a2,1
    23ba:	002c                	addi	a1,sp,8
    23bc:	4505                	li	a0,1
    char byte = c;
    23be:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    23c2:	6dc000ef          	jal	ra,2a9e <write>
    char byte = c;
    23c6:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    23ca:	4605                	li	a2,1
    23cc:	002c                	addi	a1,sp,8
    23ce:	4505                	li	a0,1
    char byte = c;
    23d0:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    23d4:	6ca000ef          	jal	ra,2a9e <write>
        s += 2;
    23d8:	00248513          	addi	a0,s1,2
    23dc:	bf15                	j	2310 <printf+0x1b2>
                a = "(null)";
    23de:	845a                	mv	s0,s6
    23e0:	bf75                	j	239c <printf+0x23e>

00000000000023e2 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    23e2:	02000793          	li	a5,32
    23e6:	00f50663          	beq	a0,a5,23f2 <isspace+0x10>
    23ea:	355d                	addiw	a0,a0,-9
    23ec:	00553513          	sltiu	a0,a0,5
    23f0:	8082                	ret
    23f2:	4505                	li	a0,1
}
    23f4:	8082                	ret

00000000000023f6 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    23f6:	fd05051b          	addiw	a0,a0,-48
}
    23fa:	00a53513          	sltiu	a0,a0,10
    23fe:	8082                	ret

0000000000002400 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    2400:	02000613          	li	a2,32
    2404:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    2406:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    240a:	ff77869b          	addiw	a3,a5,-9
    240e:	04c78c63          	beq	a5,a2,2466 <atoi+0x66>
    2412:	0007871b          	sext.w	a4,a5
    2416:	04d5f863          	bgeu	a1,a3,2466 <atoi+0x66>
        s++;
    switch (*s)
    241a:	02b00693          	li	a3,43
    241e:	04d78963          	beq	a5,a3,2470 <atoi+0x70>
    2422:	02d00693          	li	a3,45
    2426:	06d78263          	beq	a5,a3,248a <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    242a:	fd07061b          	addiw	a2,a4,-48
    242e:	47a5                	li	a5,9
    2430:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    2432:	4e01                	li	t3,0
    while (isdigit(*s))
    2434:	04c7e963          	bltu	a5,a2,2486 <atoi+0x86>
    int n = 0, neg = 0;
    2438:	4501                	li	a0,0
    while (isdigit(*s))
    243a:	4825                	li	a6,9
    243c:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    2440:	0025179b          	slliw	a5,a0,0x2
    2444:	9fa9                	addw	a5,a5,a0
    2446:	fd07031b          	addiw	t1,a4,-48
    244a:	0017989b          	slliw	a7,a5,0x1
    while (isdigit(*s))
    244e:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    2452:	0685                	addi	a3,a3,1
    2454:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    2458:	0006071b          	sext.w	a4,a2
    245c:	feb870e3          	bgeu	a6,a1,243c <atoi+0x3c>
    return neg ? n : -n;
    2460:	000e0563          	beqz	t3,246a <atoi+0x6a>
}
    2464:	8082                	ret
        s++;
    2466:	0505                	addi	a0,a0,1
    2468:	bf79                	j	2406 <atoi+0x6>
    return neg ? n : -n;
    246a:	4113053b          	subw	a0,t1,a7
    246e:	8082                	ret
    while (isdigit(*s))
    2470:	00154703          	lbu	a4,1(a0)
    2474:	47a5                	li	a5,9
        s++;
    2476:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    247a:	fd07061b          	addiw	a2,a4,-48
    int n = 0, neg = 0;
    247e:	4e01                	li	t3,0
    while (isdigit(*s))
    2480:	2701                	sext.w	a4,a4
    2482:	fac7fbe3          	bgeu	a5,a2,2438 <atoi+0x38>
    2486:	4501                	li	a0,0
}
    2488:	8082                	ret
    while (isdigit(*s))
    248a:	00154703          	lbu	a4,1(a0)
    248e:	47a5                	li	a5,9
        s++;
    2490:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    2494:	fd07061b          	addiw	a2,a4,-48
    2498:	2701                	sext.w	a4,a4
    249a:	fec7e6e3          	bltu	a5,a2,2486 <atoi+0x86>
        neg = 1;
    249e:	4e05                	li	t3,1
    24a0:	bf61                	j	2438 <atoi+0x38>

00000000000024a2 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    24a2:	16060d63          	beqz	a2,261c <memset+0x17a>
    24a6:	40a007b3          	neg	a5,a0
    24aa:	8b9d                	andi	a5,a5,7
    24ac:	00778693          	addi	a3,a5,7
    24b0:	482d                	li	a6,11
    24b2:	0ff5f713          	zext.b	a4,a1
    24b6:	fff60593          	addi	a1,a2,-1
    24ba:	1706e263          	bltu	a3,a6,261e <memset+0x17c>
    24be:	16d5ea63          	bltu	a1,a3,2632 <memset+0x190>
    24c2:	16078563          	beqz	a5,262c <memset+0x18a>
    24c6:	00e50023          	sb	a4,0(a0)
    24ca:	4685                	li	a3,1
    24cc:	00150593          	addi	a1,a0,1
    24d0:	14d78c63          	beq	a5,a3,2628 <memset+0x186>
    24d4:	00e500a3          	sb	a4,1(a0)
    24d8:	4689                	li	a3,2
    24da:	00250593          	addi	a1,a0,2
    24de:	14d78d63          	beq	a5,a3,2638 <memset+0x196>
    24e2:	00e50123          	sb	a4,2(a0)
    24e6:	468d                	li	a3,3
    24e8:	00350593          	addi	a1,a0,3
    24ec:	12d78b63          	beq	a5,a3,2622 <memset+0x180>
    24f0:	00e501a3          	sb	a4,3(a0)
    24f4:	4691                	li	a3,4
    24f6:	00450593          	addi	a1,a0,4
    24fa:	14d78163          	beq	a5,a3,263c <memset+0x19a>
    24fe:	00e50223          	sb	a4,4(a0)
    2502:	4695                	li	a3,5
    2504:	00550593          	addi	a1,a0,5
    2508:	12d78c63          	beq	a5,a3,2640 <memset+0x19e>
    250c:	00e502a3          	sb	a4,5(a0)
    2510:	469d                	li	a3,7
    2512:	00650593          	addi	a1,a0,6
    2516:	12d79763          	bne	a5,a3,2644 <memset+0x1a2>
    251a:	00750593          	addi	a1,a0,7
    251e:	00e50323          	sb	a4,6(a0)
    2522:	481d                	li	a6,7
    2524:	00871693          	slli	a3,a4,0x8
    2528:	01071893          	slli	a7,a4,0x10
    252c:	8ed9                	or	a3,a3,a4
    252e:	01871313          	slli	t1,a4,0x18
    2532:	0116e6b3          	or	a3,a3,a7
    2536:	0066e6b3          	or	a3,a3,t1
    253a:	02071893          	slli	a7,a4,0x20
    253e:	02871e13          	slli	t3,a4,0x28
    2542:	0116e6b3          	or	a3,a3,a7
    2546:	40f60333          	sub	t1,a2,a5
    254a:	03071893          	slli	a7,a4,0x30
    254e:	01c6e6b3          	or	a3,a3,t3
    2552:	0116e6b3          	or	a3,a3,a7
    2556:	03871e13          	slli	t3,a4,0x38
    255a:	97aa                	add	a5,a5,a0
    255c:	ff837893          	andi	a7,t1,-8
    2560:	01c6e6b3          	or	a3,a3,t3
    2564:	98be                	add	a7,a7,a5
    2566:	e394                	sd	a3,0(a5)
    2568:	07a1                	addi	a5,a5,8
    256a:	ff179ee3          	bne	a5,a7,2566 <memset+0xc4>
    256e:	ff837893          	andi	a7,t1,-8
    2572:	011587b3          	add	a5,a1,a7
    2576:	010886bb          	addw	a3,a7,a6
    257a:	0b130663          	beq	t1,a7,2626 <memset+0x184>
    257e:	00e78023          	sb	a4,0(a5)
    2582:	0016859b          	addiw	a1,a3,1
    2586:	08c5fb63          	bgeu	a1,a2,261c <memset+0x17a>
    258a:	00e780a3          	sb	a4,1(a5)
    258e:	0026859b          	addiw	a1,a3,2
    2592:	08c5f563          	bgeu	a1,a2,261c <memset+0x17a>
    2596:	00e78123          	sb	a4,2(a5)
    259a:	0036859b          	addiw	a1,a3,3
    259e:	06c5ff63          	bgeu	a1,a2,261c <memset+0x17a>
    25a2:	00e781a3          	sb	a4,3(a5)
    25a6:	0046859b          	addiw	a1,a3,4
    25aa:	06c5f963          	bgeu	a1,a2,261c <memset+0x17a>
    25ae:	00e78223          	sb	a4,4(a5)
    25b2:	0056859b          	addiw	a1,a3,5
    25b6:	06c5f363          	bgeu	a1,a2,261c <memset+0x17a>
    25ba:	00e782a3          	sb	a4,5(a5)
    25be:	0066859b          	addiw	a1,a3,6
    25c2:	04c5fd63          	bgeu	a1,a2,261c <memset+0x17a>
    25c6:	00e78323          	sb	a4,6(a5)
    25ca:	0076859b          	addiw	a1,a3,7
    25ce:	04c5f763          	bgeu	a1,a2,261c <memset+0x17a>
    25d2:	00e783a3          	sb	a4,7(a5)
    25d6:	0086859b          	addiw	a1,a3,8
    25da:	04c5f163          	bgeu	a1,a2,261c <memset+0x17a>
    25de:	00e78423          	sb	a4,8(a5)
    25e2:	0096859b          	addiw	a1,a3,9
    25e6:	02c5fb63          	bgeu	a1,a2,261c <memset+0x17a>
    25ea:	00e784a3          	sb	a4,9(a5)
    25ee:	00a6859b          	addiw	a1,a3,10
    25f2:	02c5f563          	bgeu	a1,a2,261c <memset+0x17a>
    25f6:	00e78523          	sb	a4,10(a5)
    25fa:	00b6859b          	addiw	a1,a3,11
    25fe:	00c5ff63          	bgeu	a1,a2,261c <memset+0x17a>
    2602:	00e785a3          	sb	a4,11(a5)
    2606:	00c6859b          	addiw	a1,a3,12
    260a:	00c5f963          	bgeu	a1,a2,261c <memset+0x17a>
    260e:	00e78623          	sb	a4,12(a5)
    2612:	26b5                	addiw	a3,a3,13
    2614:	00c6f463          	bgeu	a3,a2,261c <memset+0x17a>
    2618:	00e786a3          	sb	a4,13(a5)
        ;
    return dest;
}
    261c:	8082                	ret
    261e:	46ad                	li	a3,11
    2620:	bd79                	j	24be <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    2622:	480d                	li	a6,3
    2624:	b701                	j	2524 <memset+0x82>
    2626:	8082                	ret
    2628:	4805                	li	a6,1
    262a:	bded                	j	2524 <memset+0x82>
    262c:	85aa                	mv	a1,a0
    262e:	4801                	li	a6,0
    2630:	bdd5                	j	2524 <memset+0x82>
    2632:	87aa                	mv	a5,a0
    2634:	4681                	li	a3,0
    2636:	b7a1                	j	257e <memset+0xdc>
    2638:	4809                	li	a6,2
    263a:	b5ed                	j	2524 <memset+0x82>
    263c:	4811                	li	a6,4
    263e:	b5dd                	j	2524 <memset+0x82>
    2640:	4815                	li	a6,5
    2642:	b5cd                	j	2524 <memset+0x82>
    2644:	4819                	li	a6,6
    2646:	bdf9                	j	2524 <memset+0x82>

0000000000002648 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    2648:	00054783          	lbu	a5,0(a0)
    264c:	0005c703          	lbu	a4,0(a1)
    2650:	00e79863          	bne	a5,a4,2660 <strcmp+0x18>
    2654:	0505                	addi	a0,a0,1
    2656:	0585                	addi	a1,a1,1
    2658:	fbe5                	bnez	a5,2648 <strcmp>
    265a:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    265c:	9d19                	subw	a0,a0,a4
    265e:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    2660:	0007851b          	sext.w	a0,a5
    2664:	bfe5                	j	265c <strcmp+0x14>

0000000000002666 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    2666:	ca15                	beqz	a2,269a <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    2668:	00054783          	lbu	a5,0(a0)
    if (!n--)
    266c:	167d                	addi	a2,a2,-1
    266e:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    2672:	eb99                	bnez	a5,2688 <strncmp+0x22>
    2674:	a815                	j	26a8 <strncmp+0x42>
    2676:	00a68e63          	beq	a3,a0,2692 <strncmp+0x2c>
    267a:	0505                	addi	a0,a0,1
    267c:	00f71b63          	bne	a4,a5,2692 <strncmp+0x2c>
    2680:	00054783          	lbu	a5,0(a0)
    2684:	cf89                	beqz	a5,269e <strncmp+0x38>
    2686:	85b2                	mv	a1,a2
    2688:	0005c703          	lbu	a4,0(a1)
    268c:	00158613          	addi	a2,a1,1
    2690:	f37d                	bnez	a4,2676 <strncmp+0x10>
        ;
    return *l - *r;
    2692:	0007851b          	sext.w	a0,a5
    2696:	9d19                	subw	a0,a0,a4
    2698:	8082                	ret
        return 0;
    269a:	4501                	li	a0,0
}
    269c:	8082                	ret
    return *l - *r;
    269e:	0015c703          	lbu	a4,1(a1)
    26a2:	4501                	li	a0,0
    26a4:	9d19                	subw	a0,a0,a4
    26a6:	8082                	ret
    26a8:	0005c703          	lbu	a4,0(a1)
    26ac:	4501                	li	a0,0
    26ae:	b7e5                	j	2696 <strncmp+0x30>

00000000000026b0 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    26b0:	00757793          	andi	a5,a0,7
    26b4:	cf89                	beqz	a5,26ce <strlen+0x1e>
    26b6:	87aa                	mv	a5,a0
    26b8:	a029                	j	26c2 <strlen+0x12>
    26ba:	0785                	addi	a5,a5,1
    26bc:	0077f713          	andi	a4,a5,7
    26c0:	cb01                	beqz	a4,26d0 <strlen+0x20>
        if (!*s)
    26c2:	0007c703          	lbu	a4,0(a5)
    26c6:	fb75                	bnez	a4,26ba <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    26c8:	40a78533          	sub	a0,a5,a0
}
    26cc:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    26ce:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    26d0:	6394                	ld	a3,0(a5)
    26d2:	00001597          	auipc	a1,0x1
    26d6:	afe5b583          	ld	a1,-1282(a1) # 31d0 <__clone+0x4fa>
    26da:	00001617          	auipc	a2,0x1
    26de:	afe63603          	ld	a2,-1282(a2) # 31d8 <__clone+0x502>
    26e2:	a019                	j	26e8 <strlen+0x38>
    26e4:	6794                	ld	a3,8(a5)
    26e6:	07a1                	addi	a5,a5,8
    26e8:	00b68733          	add	a4,a3,a1
    26ec:	fff6c693          	not	a3,a3
    26f0:	8f75                	and	a4,a4,a3
    26f2:	8f71                	and	a4,a4,a2
    26f4:	db65                	beqz	a4,26e4 <strlen+0x34>
    for (; *s; s++)
    26f6:	0007c703          	lbu	a4,0(a5)
    26fa:	d779                	beqz	a4,26c8 <strlen+0x18>
    26fc:	0017c703          	lbu	a4,1(a5)
    2700:	0785                	addi	a5,a5,1
    2702:	d379                	beqz	a4,26c8 <strlen+0x18>
    2704:	0017c703          	lbu	a4,1(a5)
    2708:	0785                	addi	a5,a5,1
    270a:	fb6d                	bnez	a4,26fc <strlen+0x4c>
    270c:	bf75                	j	26c8 <strlen+0x18>

000000000000270e <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    270e:	00757713          	andi	a4,a0,7
{
    2712:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    2714:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    2718:	cb19                	beqz	a4,272e <memchr+0x20>
    271a:	ce25                	beqz	a2,2792 <memchr+0x84>
    271c:	0007c703          	lbu	a4,0(a5)
    2720:	04b70e63          	beq	a4,a1,277c <memchr+0x6e>
    2724:	0785                	addi	a5,a5,1
    2726:	0077f713          	andi	a4,a5,7
    272a:	167d                	addi	a2,a2,-1
    272c:	f77d                	bnez	a4,271a <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    272e:	4501                	li	a0,0
    if (n && *s != c)
    2730:	c235                	beqz	a2,2794 <memchr+0x86>
    2732:	0007c703          	lbu	a4,0(a5)
    2736:	04b70363          	beq	a4,a1,277c <memchr+0x6e>
        size_t k = ONES * c;
    273a:	00001517          	auipc	a0,0x1
    273e:	aa653503          	ld	a0,-1370(a0) # 31e0 <__clone+0x50a>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    2742:	471d                	li	a4,7
        size_t k = ONES * c;
    2744:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    2748:	02c77a63          	bgeu	a4,a2,277c <memchr+0x6e>
    274c:	00001897          	auipc	a7,0x1
    2750:	a848b883          	ld	a7,-1404(a7) # 31d0 <__clone+0x4fa>
    2754:	00001817          	auipc	a6,0x1
    2758:	a8483803          	ld	a6,-1404(a6) # 31d8 <__clone+0x502>
    275c:	431d                	li	t1,7
    275e:	a029                	j	2768 <memchr+0x5a>
    2760:	1661                	addi	a2,a2,-8
    2762:	07a1                	addi	a5,a5,8
    2764:	02c37963          	bgeu	t1,a2,2796 <memchr+0x88>
    2768:	6398                	ld	a4,0(a5)
    276a:	8f29                	xor	a4,a4,a0
    276c:	011706b3          	add	a3,a4,a7
    2770:	fff74713          	not	a4,a4
    2774:	8f75                	and	a4,a4,a3
    2776:	01077733          	and	a4,a4,a6
    277a:	d37d                	beqz	a4,2760 <memchr+0x52>
{
    277c:	853e                	mv	a0,a5
    277e:	97b2                	add	a5,a5,a2
    2780:	a021                	j	2788 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    2782:	0505                	addi	a0,a0,1
    2784:	00f50763          	beq	a0,a5,2792 <memchr+0x84>
    2788:	00054703          	lbu	a4,0(a0)
    278c:	feb71be3          	bne	a4,a1,2782 <memchr+0x74>
    2790:	8082                	ret
    return n ? (void *)s : 0;
    2792:	4501                	li	a0,0
}
    2794:	8082                	ret
    return n ? (void *)s : 0;
    2796:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    2798:	f275                	bnez	a2,277c <memchr+0x6e>
}
    279a:	8082                	ret

000000000000279c <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    279c:	1101                	addi	sp,sp,-32
    279e:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    27a0:	862e                	mv	a2,a1
{
    27a2:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    27a4:	4581                	li	a1,0
{
    27a6:	e426                	sd	s1,8(sp)
    27a8:	ec06                	sd	ra,24(sp)
    27aa:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    27ac:	f63ff0ef          	jal	ra,270e <memchr>
    return p ? p - s : n;
    27b0:	c519                	beqz	a0,27be <strnlen+0x22>
}
    27b2:	60e2                	ld	ra,24(sp)
    27b4:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    27b6:	8d05                	sub	a0,a0,s1
}
    27b8:	64a2                	ld	s1,8(sp)
    27ba:	6105                	addi	sp,sp,32
    27bc:	8082                	ret
    27be:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    27c0:	8522                	mv	a0,s0
}
    27c2:	6442                	ld	s0,16(sp)
    27c4:	64a2                	ld	s1,8(sp)
    27c6:	6105                	addi	sp,sp,32
    27c8:	8082                	ret

00000000000027ca <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    27ca:	00a5c7b3          	xor	a5,a1,a0
    27ce:	8b9d                	andi	a5,a5,7
    27d0:	eb95                	bnez	a5,2804 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    27d2:	0075f793          	andi	a5,a1,7
    27d6:	e7b1                	bnez	a5,2822 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    27d8:	6198                	ld	a4,0(a1)
    27da:	00001617          	auipc	a2,0x1
    27de:	9f663603          	ld	a2,-1546(a2) # 31d0 <__clone+0x4fa>
    27e2:	00001817          	auipc	a6,0x1
    27e6:	9f683803          	ld	a6,-1546(a6) # 31d8 <__clone+0x502>
    27ea:	a029                	j	27f4 <strcpy+0x2a>
    27ec:	05a1                	addi	a1,a1,8
    27ee:	e118                	sd	a4,0(a0)
    27f0:	6198                	ld	a4,0(a1)
    27f2:	0521                	addi	a0,a0,8
    27f4:	00c707b3          	add	a5,a4,a2
    27f8:	fff74693          	not	a3,a4
    27fc:	8ff5                	and	a5,a5,a3
    27fe:	0107f7b3          	and	a5,a5,a6
    2802:	d7ed                	beqz	a5,27ec <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    2804:	0005c783          	lbu	a5,0(a1)
    2808:	00f50023          	sb	a5,0(a0)
    280c:	c785                	beqz	a5,2834 <strcpy+0x6a>
    280e:	0015c783          	lbu	a5,1(a1)
    2812:	0505                	addi	a0,a0,1
    2814:	0585                	addi	a1,a1,1
    2816:	00f50023          	sb	a5,0(a0)
    281a:	fbf5                	bnez	a5,280e <strcpy+0x44>
        ;
    return d;
}
    281c:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    281e:	0505                	addi	a0,a0,1
    2820:	df45                	beqz	a4,27d8 <strcpy+0xe>
            if (!(*d = *s))
    2822:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    2826:	0585                	addi	a1,a1,1
    2828:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    282c:	00f50023          	sb	a5,0(a0)
    2830:	f7fd                	bnez	a5,281e <strcpy+0x54>
}
    2832:	8082                	ret
    2834:	8082                	ret

0000000000002836 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    2836:	00a5c7b3          	xor	a5,a1,a0
    283a:	8b9d                	andi	a5,a5,7
    283c:	1a079863          	bnez	a5,29ec <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    2840:	0075f793          	andi	a5,a1,7
    2844:	16078463          	beqz	a5,29ac <strncpy+0x176>
    2848:	ea01                	bnez	a2,2858 <strncpy+0x22>
    284a:	a421                	j	2a52 <strncpy+0x21c>
    284c:	167d                	addi	a2,a2,-1
    284e:	0505                	addi	a0,a0,1
    2850:	14070e63          	beqz	a4,29ac <strncpy+0x176>
    2854:	1a060863          	beqz	a2,2a04 <strncpy+0x1ce>
    2858:	0005c783          	lbu	a5,0(a1)
    285c:	0585                	addi	a1,a1,1
    285e:	0075f713          	andi	a4,a1,7
    2862:	00f50023          	sb	a5,0(a0)
    2866:	f3fd                	bnez	a5,284c <strncpy+0x16>
    2868:	4805                	li	a6,1
    286a:	1a061863          	bnez	a2,2a1a <strncpy+0x1e4>
    286e:	40a007b3          	neg	a5,a0
    2872:	8b9d                	andi	a5,a5,7
    2874:	4681                	li	a3,0
    2876:	18061a63          	bnez	a2,2a0a <strncpy+0x1d4>
    287a:	00778713          	addi	a4,a5,7
    287e:	45ad                	li	a1,11
    2880:	18b76363          	bltu	a4,a1,2a06 <strncpy+0x1d0>
    2884:	1ae6eb63          	bltu	a3,a4,2a3a <strncpy+0x204>
    2888:	1a078363          	beqz	a5,2a2e <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    288c:	00050023          	sb	zero,0(a0)
    2890:	4685                	li	a3,1
    2892:	00150713          	addi	a4,a0,1
    2896:	18d78f63          	beq	a5,a3,2a34 <strncpy+0x1fe>
    289a:	000500a3          	sb	zero,1(a0)
    289e:	4689                	li	a3,2
    28a0:	00250713          	addi	a4,a0,2
    28a4:	18d78e63          	beq	a5,a3,2a40 <strncpy+0x20a>
    28a8:	00050123          	sb	zero,2(a0)
    28ac:	468d                	li	a3,3
    28ae:	00350713          	addi	a4,a0,3
    28b2:	16d78c63          	beq	a5,a3,2a2a <strncpy+0x1f4>
    28b6:	000501a3          	sb	zero,3(a0)
    28ba:	4691                	li	a3,4
    28bc:	00450713          	addi	a4,a0,4
    28c0:	18d78263          	beq	a5,a3,2a44 <strncpy+0x20e>
    28c4:	00050223          	sb	zero,4(a0)
    28c8:	4695                	li	a3,5
    28ca:	00550713          	addi	a4,a0,5
    28ce:	16d78d63          	beq	a5,a3,2a48 <strncpy+0x212>
    28d2:	000502a3          	sb	zero,5(a0)
    28d6:	469d                	li	a3,7
    28d8:	00650713          	addi	a4,a0,6
    28dc:	16d79863          	bne	a5,a3,2a4c <strncpy+0x216>
    28e0:	00750713          	addi	a4,a0,7
    28e4:	00050323          	sb	zero,6(a0)
    28e8:	40f80833          	sub	a6,a6,a5
    28ec:	ff887593          	andi	a1,a6,-8
    28f0:	97aa                	add	a5,a5,a0
    28f2:	95be                	add	a1,a1,a5
    28f4:	0007b023          	sd	zero,0(a5)
    28f8:	07a1                	addi	a5,a5,8
    28fa:	feb79de3          	bne	a5,a1,28f4 <strncpy+0xbe>
    28fe:	ff887593          	andi	a1,a6,-8
    2902:	9ead                	addw	a3,a3,a1
    2904:	00b707b3          	add	a5,a4,a1
    2908:	12b80863          	beq	a6,a1,2a38 <strncpy+0x202>
    290c:	00078023          	sb	zero,0(a5)
    2910:	0016871b          	addiw	a4,a3,1
    2914:	0ec77863          	bgeu	a4,a2,2a04 <strncpy+0x1ce>
    2918:	000780a3          	sb	zero,1(a5)
    291c:	0026871b          	addiw	a4,a3,2
    2920:	0ec77263          	bgeu	a4,a2,2a04 <strncpy+0x1ce>
    2924:	00078123          	sb	zero,2(a5)
    2928:	0036871b          	addiw	a4,a3,3
    292c:	0cc77c63          	bgeu	a4,a2,2a04 <strncpy+0x1ce>
    2930:	000781a3          	sb	zero,3(a5)
    2934:	0046871b          	addiw	a4,a3,4
    2938:	0cc77663          	bgeu	a4,a2,2a04 <strncpy+0x1ce>
    293c:	00078223          	sb	zero,4(a5)
    2940:	0056871b          	addiw	a4,a3,5
    2944:	0cc77063          	bgeu	a4,a2,2a04 <strncpy+0x1ce>
    2948:	000782a3          	sb	zero,5(a5)
    294c:	0066871b          	addiw	a4,a3,6
    2950:	0ac77a63          	bgeu	a4,a2,2a04 <strncpy+0x1ce>
    2954:	00078323          	sb	zero,6(a5)
    2958:	0076871b          	addiw	a4,a3,7
    295c:	0ac77463          	bgeu	a4,a2,2a04 <strncpy+0x1ce>
    2960:	000783a3          	sb	zero,7(a5)
    2964:	0086871b          	addiw	a4,a3,8
    2968:	08c77e63          	bgeu	a4,a2,2a04 <strncpy+0x1ce>
    296c:	00078423          	sb	zero,8(a5)
    2970:	0096871b          	addiw	a4,a3,9
    2974:	08c77863          	bgeu	a4,a2,2a04 <strncpy+0x1ce>
    2978:	000784a3          	sb	zero,9(a5)
    297c:	00a6871b          	addiw	a4,a3,10
    2980:	08c77263          	bgeu	a4,a2,2a04 <strncpy+0x1ce>
    2984:	00078523          	sb	zero,10(a5)
    2988:	00b6871b          	addiw	a4,a3,11
    298c:	06c77c63          	bgeu	a4,a2,2a04 <strncpy+0x1ce>
    2990:	000785a3          	sb	zero,11(a5)
    2994:	00c6871b          	addiw	a4,a3,12
    2998:	06c77663          	bgeu	a4,a2,2a04 <strncpy+0x1ce>
    299c:	00078623          	sb	zero,12(a5)
    29a0:	26b5                	addiw	a3,a3,13
    29a2:	06c6f163          	bgeu	a3,a2,2a04 <strncpy+0x1ce>
    29a6:	000786a3          	sb	zero,13(a5)
    29aa:	8082                	ret
            ;
        if (!n || !*s)
    29ac:	c645                	beqz	a2,2a54 <strncpy+0x21e>
    29ae:	0005c783          	lbu	a5,0(a1)
    29b2:	ea078be3          	beqz	a5,2868 <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    29b6:	479d                	li	a5,7
    29b8:	02c7ff63          	bgeu	a5,a2,29f6 <strncpy+0x1c0>
    29bc:	00001897          	auipc	a7,0x1
    29c0:	8148b883          	ld	a7,-2028(a7) # 31d0 <__clone+0x4fa>
    29c4:	00001817          	auipc	a6,0x1
    29c8:	81483803          	ld	a6,-2028(a6) # 31d8 <__clone+0x502>
    29cc:	431d                	li	t1,7
    29ce:	6198                	ld	a4,0(a1)
    29d0:	011707b3          	add	a5,a4,a7
    29d4:	fff74693          	not	a3,a4
    29d8:	8ff5                	and	a5,a5,a3
    29da:	0107f7b3          	and	a5,a5,a6
    29de:	ef81                	bnez	a5,29f6 <strncpy+0x1c0>
            *wd = *ws;
    29e0:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    29e2:	1661                	addi	a2,a2,-8
    29e4:	05a1                	addi	a1,a1,8
    29e6:	0521                	addi	a0,a0,8
    29e8:	fec363e3          	bltu	t1,a2,29ce <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    29ec:	e609                	bnez	a2,29f6 <strncpy+0x1c0>
    29ee:	a08d                	j	2a50 <strncpy+0x21a>
    29f0:	167d                	addi	a2,a2,-1
    29f2:	0505                	addi	a0,a0,1
    29f4:	ca01                	beqz	a2,2a04 <strncpy+0x1ce>
    29f6:	0005c783          	lbu	a5,0(a1)
    29fa:	0585                	addi	a1,a1,1
    29fc:	00f50023          	sb	a5,0(a0)
    2a00:	fbe5                	bnez	a5,29f0 <strncpy+0x1ba>
        ;
tail:
    2a02:	b59d                	j	2868 <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    2a04:	8082                	ret
    2a06:	472d                	li	a4,11
    2a08:	bdb5                	j	2884 <strncpy+0x4e>
    2a0a:	00778713          	addi	a4,a5,7
    2a0e:	45ad                	li	a1,11
    2a10:	fff60693          	addi	a3,a2,-1
    2a14:	e6b778e3          	bgeu	a4,a1,2884 <strncpy+0x4e>
    2a18:	b7fd                	j	2a06 <strncpy+0x1d0>
    2a1a:	40a007b3          	neg	a5,a0
    2a1e:	8832                	mv	a6,a2
    2a20:	8b9d                	andi	a5,a5,7
    2a22:	4681                	li	a3,0
    2a24:	e4060be3          	beqz	a2,287a <strncpy+0x44>
    2a28:	b7cd                	j	2a0a <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    2a2a:	468d                	li	a3,3
    2a2c:	bd75                	j	28e8 <strncpy+0xb2>
    2a2e:	872a                	mv	a4,a0
    2a30:	4681                	li	a3,0
    2a32:	bd5d                	j	28e8 <strncpy+0xb2>
    2a34:	4685                	li	a3,1
    2a36:	bd4d                	j	28e8 <strncpy+0xb2>
    2a38:	8082                	ret
    2a3a:	87aa                	mv	a5,a0
    2a3c:	4681                	li	a3,0
    2a3e:	b5f9                	j	290c <strncpy+0xd6>
    2a40:	4689                	li	a3,2
    2a42:	b55d                	j	28e8 <strncpy+0xb2>
    2a44:	4691                	li	a3,4
    2a46:	b54d                	j	28e8 <strncpy+0xb2>
    2a48:	4695                	li	a3,5
    2a4a:	bd79                	j	28e8 <strncpy+0xb2>
    2a4c:	4699                	li	a3,6
    2a4e:	bd69                	j	28e8 <strncpy+0xb2>
    2a50:	8082                	ret
    2a52:	8082                	ret
    2a54:	8082                	ret

0000000000002a56 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    2a56:	87aa                	mv	a5,a0
    2a58:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    2a5a:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    2a5e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    2a62:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    2a64:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    2a66:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    2a6a:	2501                	sext.w	a0,a0
    2a6c:	8082                	ret

0000000000002a6e <openat>:
    register long a7 __asm__("a7") = n;
    2a6e:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    2a72:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    2a76:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    2a7a:	2501                	sext.w	a0,a0
    2a7c:	8082                	ret

0000000000002a7e <fcntl>:
    register long a7 __asm__("a7") = n;
    2a7e:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2a80:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    2a84:	2501                	sext.w	a0,a0
    2a86:	8082                	ret

0000000000002a88 <close>:
    register long a7 __asm__("a7") = n;
    2a88:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    2a8c:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    2a90:	2501                	sext.w	a0,a0
    2a92:	8082                	ret

0000000000002a94 <read>:
    register long a7 __asm__("a7") = n;
    2a94:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2a98:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    2a9c:	8082                	ret

0000000000002a9e <write>:
    register long a7 __asm__("a7") = n;
    2a9e:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2aa2:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    2aa6:	8082                	ret

0000000000002aa8 <getpid>:
    register long a7 __asm__("a7") = n;
    2aa8:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    2aac:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    2ab0:	2501                	sext.w	a0,a0
    2ab2:	8082                	ret

0000000000002ab4 <getppid>:
    register long a7 __asm__("a7") = n;
    2ab4:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    2ab8:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    2abc:	2501                	sext.w	a0,a0
    2abe:	8082                	ret

0000000000002ac0 <sched_yield>:
    register long a7 __asm__("a7") = n;
    2ac0:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    2ac4:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    2ac8:	2501                	sext.w	a0,a0
    2aca:	8082                	ret

0000000000002acc <fork>:
    register long a7 __asm__("a7") = n;
    2acc:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    2ad0:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    2ad2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2ad4:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    2ad8:	2501                	sext.w	a0,a0
    2ada:	8082                	ret

0000000000002adc <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    2adc:	85b2                	mv	a1,a2
    2ade:	863a                	mv	a2,a4
    if (stack)
    2ae0:	c191                	beqz	a1,2ae4 <clone+0x8>
	stack += stack_size;
    2ae2:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    2ae4:	4781                	li	a5,0
    2ae6:	4701                	li	a4,0
    2ae8:	4681                	li	a3,0
    2aea:	2601                	sext.w	a2,a2
    2aec:	a2ed                	j	2cd6 <__clone>

0000000000002aee <exit>:
    register long a7 __asm__("a7") = n;
    2aee:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    2af2:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    2af6:	8082                	ret

0000000000002af8 <waitpid>:
    register long a7 __asm__("a7") = n;
    2af8:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    2afc:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    2afe:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    2b02:	2501                	sext.w	a0,a0
    2b04:	8082                	ret

0000000000002b06 <exec>:
    register long a7 __asm__("a7") = n;
    2b06:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    2b0a:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    2b0e:	2501                	sext.w	a0,a0
    2b10:	8082                	ret

0000000000002b12 <execve>:
    register long a7 __asm__("a7") = n;
    2b12:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2b16:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    2b1a:	2501                	sext.w	a0,a0
    2b1c:	8082                	ret

0000000000002b1e <times>:
    register long a7 __asm__("a7") = n;
    2b1e:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    2b22:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    2b26:	2501                	sext.w	a0,a0
    2b28:	8082                	ret

0000000000002b2a <get_time>:

int64 get_time()
{
    2b2a:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    2b2c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    2b30:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    2b32:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2b34:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    2b38:	2501                	sext.w	a0,a0
    2b3a:	ed09                	bnez	a0,2b54 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    2b3c:	67a2                	ld	a5,8(sp)
    2b3e:	3e800713          	li	a4,1000
    2b42:	00015503          	lhu	a0,0(sp)
    2b46:	02e7d7b3          	divu	a5,a5,a4
    2b4a:	02e50533          	mul	a0,a0,a4
    2b4e:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    2b50:	0141                	addi	sp,sp,16
    2b52:	8082                	ret
        return -1;
    2b54:	557d                	li	a0,-1
    2b56:	bfed                	j	2b50 <get_time+0x26>

0000000000002b58 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    2b58:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2b5c:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    2b60:	2501                	sext.w	a0,a0
    2b62:	8082                	ret

0000000000002b64 <time>:
    register long a7 __asm__("a7") = n;
    2b64:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    2b68:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    2b6c:	2501                	sext.w	a0,a0
    2b6e:	8082                	ret

0000000000002b70 <sleep>:

int sleep(unsigned long long time)
{
    2b70:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    2b72:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    2b74:	850a                	mv	a0,sp
    2b76:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    2b78:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    2b7c:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2b7e:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    2b82:	e501                	bnez	a0,2b8a <sleep+0x1a>
    return 0;
    2b84:	4501                	li	a0,0
}
    2b86:	0141                	addi	sp,sp,16
    2b88:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    2b8a:	4502                	lw	a0,0(sp)
}
    2b8c:	0141                	addi	sp,sp,16
    2b8e:	8082                	ret

0000000000002b90 <set_priority>:
    register long a7 __asm__("a7") = n;
    2b90:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    2b94:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    2b98:	2501                	sext.w	a0,a0
    2b9a:	8082                	ret

0000000000002b9c <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    2b9c:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    2ba0:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    2ba4:	8082                	ret

0000000000002ba6 <munmap>:
    register long a7 __asm__("a7") = n;
    2ba6:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2baa:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    2bae:	2501                	sext.w	a0,a0
    2bb0:	8082                	ret

0000000000002bb2 <wait>:

int wait(int *code)
{
    2bb2:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    2bb4:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    2bb8:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    2bba:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    2bbc:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    2bbe:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    2bc2:	2501                	sext.w	a0,a0
    2bc4:	8082                	ret

0000000000002bc6 <spawn>:
    register long a7 __asm__("a7") = n;
    2bc6:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    2bca:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    2bce:	2501                	sext.w	a0,a0
    2bd0:	8082                	ret

0000000000002bd2 <mailread>:
    register long a7 __asm__("a7") = n;
    2bd2:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2bd6:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    2bda:	2501                	sext.w	a0,a0
    2bdc:	8082                	ret

0000000000002bde <mailwrite>:
    register long a7 __asm__("a7") = n;
    2bde:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2be2:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    2be6:	2501                	sext.w	a0,a0
    2be8:	8082                	ret

0000000000002bea <fstat>:
    register long a7 __asm__("a7") = n;
    2bea:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2bee:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    2bf2:	2501                	sext.w	a0,a0
    2bf4:	8082                	ret

0000000000002bf6 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    2bf6:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    2bf8:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    2bfc:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    2bfe:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    2c02:	2501                	sext.w	a0,a0
    2c04:	8082                	ret

0000000000002c06 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    2c06:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    2c08:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    2c0c:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2c0e:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    2c12:	2501                	sext.w	a0,a0
    2c14:	8082                	ret

0000000000002c16 <link>:

int link(char *old_path, char *new_path)
{
    2c16:	87aa                	mv	a5,a0
    2c18:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    2c1a:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    2c1e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    2c22:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    2c24:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    2c28:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    2c2a:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    2c2e:	2501                	sext.w	a0,a0
    2c30:	8082                	ret

0000000000002c32 <unlink>:

int unlink(char *path)
{
    2c32:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    2c34:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    2c38:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    2c3c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2c3e:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    2c42:	2501                	sext.w	a0,a0
    2c44:	8082                	ret

0000000000002c46 <uname>:
    register long a7 __asm__("a7") = n;
    2c46:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    2c4a:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    2c4e:	2501                	sext.w	a0,a0
    2c50:	8082                	ret

0000000000002c52 <brk>:
    register long a7 __asm__("a7") = n;
    2c52:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    2c56:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    2c5a:	2501                	sext.w	a0,a0
    2c5c:	8082                	ret

0000000000002c5e <getcwd>:
    register long a7 __asm__("a7") = n;
    2c5e:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2c60:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    2c64:	8082                	ret

0000000000002c66 <chdir>:
    register long a7 __asm__("a7") = n;
    2c66:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    2c6a:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    2c6e:	2501                	sext.w	a0,a0
    2c70:	8082                	ret

0000000000002c72 <mkdir>:

int mkdir(const char *path, mode_t mode){
    2c72:	862e                	mv	a2,a1
    2c74:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    2c76:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    2c78:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    2c7c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    2c80:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    2c82:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2c84:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    2c88:	2501                	sext.w	a0,a0
    2c8a:	8082                	ret

0000000000002c8c <getdents>:
    register long a7 __asm__("a7") = n;
    2c8c:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2c90:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    2c94:	2501                	sext.w	a0,a0
    2c96:	8082                	ret

0000000000002c98 <pipe>:
    register long a7 __asm__("a7") = n;
    2c98:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    2c9c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2c9e:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    2ca2:	2501                	sext.w	a0,a0
    2ca4:	8082                	ret

0000000000002ca6 <dup>:
    register long a7 __asm__("a7") = n;
    2ca6:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    2ca8:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    2cac:	2501                	sext.w	a0,a0
    2cae:	8082                	ret

0000000000002cb0 <dup2>:
    register long a7 __asm__("a7") = n;
    2cb0:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    2cb2:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2cb4:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    2cb8:	2501                	sext.w	a0,a0
    2cba:	8082                	ret

0000000000002cbc <mount>:
    register long a7 __asm__("a7") = n;
    2cbc:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    2cc0:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    2cc4:	2501                	sext.w	a0,a0
    2cc6:	8082                	ret

0000000000002cc8 <umount>:
    register long a7 __asm__("a7") = n;
    2cc8:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    2ccc:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2cce:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    2cd2:	2501                	sext.w	a0,a0
    2cd4:	8082                	ret

0000000000002cd6 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    2cd6:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    2cd8:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    2cda:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    2cdc:	8532                	mv	a0,a2
	mv a2, a4
    2cde:	863a                	mv	a2,a4
	mv a3, a5
    2ce0:	86be                	mv	a3,a5
	mv a4, a6
    2ce2:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    2ce4:	0dc00893          	li	a7,220
	ecall
    2ce8:	00000073          	ecall

	beqz a0, 1f
    2cec:	c111                	beqz	a0,2cf0 <__clone+0x1a>
	# Parent
	ret
    2cee:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    2cf0:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    2cf2:	6522                	ld	a0,8(sp)
	jalr a1
    2cf4:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    2cf6:	05d00893          	li	a7,93
	ecall
    2cfa:	00000073          	ecall
