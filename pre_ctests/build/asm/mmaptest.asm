
/root/oskernel2024-trustos/pre_ctests/build/riscv64/mmaptest:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	6990006f          	j	1e9a <__start_main>

0000000000001006 <err>:
  exit(0);
}

char *testname = "???";

void err(char *why) {
    1006:	1101                	add	sp,sp,-32
    1008:	ec06                	sd	ra,24(sp)
    100a:	e822                	sd	s0,16(sp)
    100c:	e426                	sd	s1,8(sp)
    100e:	842a                	mv	s0,a0
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1010:	00002497          	auipc	s1,0x2
    1014:	5b04b483          	ld	s1,1456(s1) # 35c0 <testname>
    1018:	265010ef          	jal	2a7c <getpid>
    101c:	86aa                	mv	a3,a0
    101e:	8622                	mv	a2,s0
    1020:	85a6                	mv	a1,s1
    1022:	00002517          	auipc	a0,0x2
    1026:	cb650513          	add	a0,a0,-842 # 2cd8 <__clone+0x2e>
    102a:	0ca010ef          	jal	20f4 <printf>
  exit(1);
}
    102e:	6442                	ld	s0,16(sp)
    1030:	60e2                	ld	ra,24(sp)
    1032:	64a2                	ld	s1,8(sp)
  exit(1);
    1034:	4505                	li	a0,1
}
    1036:	6105                	add	sp,sp,32
  exit(1);
    1038:	28b0106f          	j	2ac2 <exit>

000000000000103c <_v1>:

//
// check the content of the two mapped pages.
//
void _v1(char *p) {
    103c:	711d                	add	sp,sp,-96
    103e:	e0ca                	sd	s2,64(sp)
  int i;
  for (i = 0; i < PGSIZE * 2; i++) {
    if (i < PGSIZE + (PGSIZE / 2)) {
    1040:	6905                	lui	s2,0x1
void _v1(char *p) {
    1042:	e8a2                	sd	s0,80(sp)
    1044:	e4a6                	sd	s1,72(sp)
    1046:	fc4e                	sd	s3,56(sp)
    1048:	f852                	sd	s4,48(sp)
    104a:	f05a                	sd	s6,32(sp)
    104c:	ec5e                	sd	s7,24(sp)
    104e:	e862                	sd	s8,16(sp)
    1050:	e466                	sd	s9,8(sp)
    1052:	e06a                	sd	s10,0(sp)
    1054:	ec86                	sd	ra,88(sp)
    1056:	f456                	sd	s5,40(sp)
    1058:	84aa                	mv	s1,a0
  for (i = 0; i < PGSIZE * 2; i++) {
    105a:	4401                	li	s0,0
    if (i < PGSIZE + (PGSIZE / 2)) {
    105c:	7ff90913          	add	s2,s2,2047 # 17ff <mmap_test+0x5cb>
  for (i = 0; i < PGSIZE * 2; i++) {
    1060:	6c09                	lui	s8,0x2
               (uint64)(p + i));
        err("v1 mismatch (1)");
      }
    } else {
      if (p[i] != 0) {
        printf("mismatch at %d, wanted zero, got 0x%x\n", i, p[i]);
    1062:	00002d17          	auipc	s10,0x2
    1066:	ce6d0d13          	add	s10,s10,-794 # 2d48 <__clone+0x9e>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    106a:	00002b97          	auipc	s7,0x2
    106e:	556b8b93          	add	s7,s7,1366 # 35c0 <testname>
    1072:	00002c97          	auipc	s9,0x2
    1076:	cfec8c93          	add	s9,s9,-770 # 2d70 <__clone+0xc6>
    107a:	00002b17          	auipc	s6,0x2
    107e:	c5eb0b13          	add	s6,s6,-930 # 2cd8 <__clone+0x2e>
      if (p[i] != 'A') {
    1082:	04100a13          	li	s4,65
        printf("mismatch at %d,wanted 'A', got 0x%x,wrong addr=%p\n", i, p[i],
    1086:	00002997          	auipc	s3,0x2
    108a:	c7a98993          	add	s3,s3,-902 # 2d00 <__clone+0x56>
      if (p[i] != 'A') {
    108e:	0004c603          	lbu	a2,0(s1)
    if (i < PGSIZE + (PGSIZE / 2)) {
    1092:	02894f63          	blt	s2,s0,10d0 <_v1+0x94>
        printf("mismatch at %d,wanted 'A', got 0x%x,wrong addr=%p\n", i, p[i],
    1096:	86a6                	mv	a3,s1
    1098:	85a2                	mv	a1,s0
    109a:	854e                	mv	a0,s3
      if (p[i] != 'A') {
    109c:	03460463          	beq	a2,s4,10c4 <_v1+0x88>
        printf("mismatch at %d,wanted 'A', got 0x%x,wrong addr=%p\n", i, p[i],
    10a0:	054010ef          	jal	20f4 <printf>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    10a4:	000bba83          	ld	s5,0(s7)
    10a8:	1d5010ef          	jal	2a7c <getpid>
    10ac:	86aa                	mv	a3,a0
    10ae:	00002617          	auipc	a2,0x2
    10b2:	c8a60613          	add	a2,a2,-886 # 2d38 <__clone+0x8e>
    10b6:	855a                	mv	a0,s6
    10b8:	85d6                	mv	a1,s5
    10ba:	03a010ef          	jal	20f4 <printf>
  exit(1);
    10be:	4505                	li	a0,1
    10c0:	203010ef          	jal	2ac2 <exit>
  for (i = 0; i < PGSIZE * 2; i++) {
    10c4:	2405                	addw	s0,s0,1
    10c6:	0485                	add	s1,s1,1
      if (p[i] != 'A') {
    10c8:	0004c603          	lbu	a2,0(s1)
    if (i < PGSIZE + (PGSIZE / 2)) {
    10cc:	fc8955e3          	bge	s2,s0,1096 <_v1+0x5a>
      if (p[i] != 0) {
    10d0:	e21d                	bnez	a2,10f6 <_v1+0xba>
  for (i = 0; i < PGSIZE * 2; i++) {
    10d2:	2405                	addw	s0,s0,1
    10d4:	0485                	add	s1,s1,1
    10d6:	fb841ce3          	bne	s0,s8,108e <_v1+0x52>
        err("v1 mismatch (2)");
      }
    }
  }
}
    10da:	60e6                	ld	ra,88(sp)
    10dc:	6446                	ld	s0,80(sp)
    10de:	64a6                	ld	s1,72(sp)
    10e0:	6906                	ld	s2,64(sp)
    10e2:	79e2                	ld	s3,56(sp)
    10e4:	7a42                	ld	s4,48(sp)
    10e6:	7aa2                	ld	s5,40(sp)
    10e8:	7b02                	ld	s6,32(sp)
    10ea:	6be2                	ld	s7,24(sp)
    10ec:	6c42                	ld	s8,16(sp)
    10ee:	6ca2                	ld	s9,8(sp)
    10f0:	6d02                	ld	s10,0(sp)
    10f2:	6125                	add	sp,sp,96
    10f4:	8082                	ret
        printf("mismatch at %d, wanted zero, got 0x%x\n", i, p[i]);
    10f6:	85a2                	mv	a1,s0
    10f8:	856a                	mv	a0,s10
    10fa:	7fb000ef          	jal	20f4 <printf>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    10fe:	000bba83          	ld	s5,0(s7)
    1102:	17b010ef          	jal	2a7c <getpid>
    1106:	86aa                	mv	a3,a0
    1108:	8666                	mv	a2,s9
    110a:	855a                	mv	a0,s6
    110c:	85d6                	mv	a1,s5
    110e:	7e7000ef          	jal	20f4 <printf>
  exit(1);
    1112:	4505                	li	a0,1
    1114:	1af010ef          	jal	2ac2 <exit>
}
    1118:	bf6d                	j	10d2 <_v1+0x96>

000000000000111a <makefile>:

//
// create a file to be mapped, containing
// 1.5 pages of 'A' and half a page of zeros.
//
void makefile(const char *f) {
    111a:	7139                	add	sp,sp,-64
    111c:	fc06                	sd	ra,56(sp)
    111e:	f822                	sd	s0,48(sp)
    1120:	f426                	sd	s1,40(sp)
    1122:	842a                	mv	s0,a0
    1124:	f04a                	sd	s2,32(sp)
    1126:	ec4e                	sd	s3,24(sp)
    1128:	e852                	sd	s4,16(sp)
    112a:	e456                	sd	s5,8(sp)
    112c:	e05a                	sd	s6,0(sp)
  int i;
  int n = PGSIZE / BSIZE;

  unlink(f);
    112e:	2d9010ef          	jal	2c06 <unlink>
  int fd = open(f, O_WRONLY | O_CREATE);
    1132:	04100593          	li	a1,65
    1136:	8522                	mv	a0,s0
    1138:	0f3010ef          	jal	2a2a <open>
  if (fd == -1)
    113c:	57fd                	li	a5,-1
  int fd = open(f, O_WRONLY | O_CREATE);
    113e:	84aa                	mv	s1,a0
  if (fd == -1)
    1140:	08f50663          	beq	a0,a5,11cc <makefile+0xb2>
    err("open");
  memset(buf, 'A', BSIZE);
    1144:	40000613          	li	a2,1024
    1148:	04100593          	li	a1,65
    114c:	00002517          	auipc	a0,0x2
    1150:	05c50513          	add	a0,a0,92 # 31a8 <buf>
    1154:	2de010ef          	jal	2432 <memset>
    1158:	4419                	li	s0,6
  // write 1.5 page
  for (i = 0; i < n + n / 2; i++) {
    if (write(fd, buf, BSIZE) != BSIZE)
    115a:	00002917          	auipc	s2,0x2
    115e:	04e90913          	add	s2,s2,78 # 31a8 <buf>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1162:	00002b17          	auipc	s6,0x2
    1166:	45eb0b13          	add	s6,s6,1118 # 35c0 <testname>
    116a:	00002a97          	auipc	s5,0x2
    116e:	c1ea8a93          	add	s5,s5,-994 # 2d88 <__clone+0xde>
    1172:	00002a17          	auipc	s4,0x2
    1176:	b66a0a13          	add	s4,s4,-1178 # 2cd8 <__clone+0x2e>
    if (write(fd, buf, BSIZE) != BSIZE)
    117a:	40000613          	li	a2,1024
    117e:	85ca                	mv	a1,s2
    1180:	8526                	mv	a0,s1
    1182:	0f1010ef          	jal	2a72 <write>
    1186:	40000793          	li	a5,1024
    118a:	00f50f63          	beq	a0,a5,11a8 <makefile+0x8e>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    118e:	000b3983          	ld	s3,0(s6)
    1192:	0eb010ef          	jal	2a7c <getpid>
    1196:	86aa                	mv	a3,a0
    1198:	8656                	mv	a2,s5
    119a:	8552                	mv	a0,s4
    119c:	85ce                	mv	a1,s3
    119e:	757000ef          	jal	20f4 <printf>
  exit(1);
    11a2:	4505                	li	a0,1
    11a4:	11f010ef          	jal	2ac2 <exit>
  for (i = 0; i < n + n / 2; i++) {
    11a8:	347d                	addw	s0,s0,-1
    11aa:	f861                	bnez	s0,117a <makefile+0x60>
      err("write 0 makefile");
  }
  if (close(fd) == -1)
    11ac:	8526                	mv	a0,s1
    11ae:	0af010ef          	jal	2a5c <close>
    11b2:	57fd                	li	a5,-1
    11b4:	04f50263          	beq	a0,a5,11f8 <makefile+0xde>
    err("close");
}
    11b8:	70e2                	ld	ra,56(sp)
    11ba:	7442                	ld	s0,48(sp)
    11bc:	74a2                	ld	s1,40(sp)
    11be:	7902                	ld	s2,32(sp)
    11c0:	69e2                	ld	s3,24(sp)
    11c2:	6a42                	ld	s4,16(sp)
    11c4:	6aa2                	ld	s5,8(sp)
    11c6:	6b02                	ld	s6,0(sp)
    11c8:	6121                	add	sp,sp,64
    11ca:	8082                	ret
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    11cc:	00002417          	auipc	s0,0x2
    11d0:	3f443403          	ld	s0,1012(s0) # 35c0 <testname>
    11d4:	0a9010ef          	jal	2a7c <getpid>
    11d8:	86aa                	mv	a3,a0
    11da:	00002617          	auipc	a2,0x2
    11de:	ba660613          	add	a2,a2,-1114 # 2d80 <__clone+0xd6>
    11e2:	85a2                	mv	a1,s0
    11e4:	00002517          	auipc	a0,0x2
    11e8:	af450513          	add	a0,a0,-1292 # 2cd8 <__clone+0x2e>
    11ec:	709000ef          	jal	20f4 <printf>
  exit(1);
    11f0:	4505                	li	a0,1
    11f2:	0d1010ef          	jal	2ac2 <exit>
}
    11f6:	b7b9                	j	1144 <makefile+0x2a>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    11f8:	00002417          	auipc	s0,0x2
    11fc:	3c843403          	ld	s0,968(s0) # 35c0 <testname>
    1200:	07d010ef          	jal	2a7c <getpid>
    1204:	86aa                	mv	a3,a0
    1206:	85a2                	mv	a1,s0
    1208:	00002517          	auipc	a0,0x2
    120c:	ad050513          	add	a0,a0,-1328 # 2cd8 <__clone+0x2e>
    1210:	00002617          	auipc	a2,0x2
    1214:	b9060613          	add	a2,a2,-1136 # 2da0 <__clone+0xf6>
    1218:	6dd000ef          	jal	20f4 <printf>
}
    121c:	7442                	ld	s0,48(sp)
    121e:	70e2                	ld	ra,56(sp)
    1220:	74a2                	ld	s1,40(sp)
    1222:	7902                	ld	s2,32(sp)
    1224:	69e2                	ld	s3,24(sp)
    1226:	6a42                	ld	s4,16(sp)
    1228:	6aa2                	ld	s5,8(sp)
    122a:	6b02                	ld	s6,0(sp)
  exit(1);
    122c:	4505                	li	a0,1
}
    122e:	6121                	add	sp,sp,64
  exit(1);
    1230:	0930106f          	j	2ac2 <exit>

0000000000001234 <mmap_test>:

void mmap_test(void) {
    1234:	711d                	add	sp,sp,-96
  int fd;
  int i;
  const char *const f = "mmap.dur";
  printf("mmap_test starting\n");
    1236:	00002517          	auipc	a0,0x2
    123a:	b7250513          	add	a0,a0,-1166 # 2da8 <__clone+0xfe>
void mmap_test(void) {
    123e:	ec86                	sd	ra,88(sp)
    1240:	e4a6                	sd	s1,72(sp)
    1242:	e0ca                	sd	s2,64(sp)
    1244:	e8a2                	sd	s0,80(sp)
    1246:	fc4e                	sd	s3,56(sp)
    1248:	f852                	sd	s4,48(sp)
    124a:	f456                	sd	s5,40(sp)
    124c:	f05a                	sd	s6,32(sp)
    124e:	ec5e                	sd	s7,24(sp)
    1250:	e862                	sd	s8,16(sp)
  printf("mmap_test starting\n");
    1252:	6a3000ef          	jal	20f4 <printf>
  testname = "mmap_test";
    1256:	00002797          	auipc	a5,0x2
    125a:	b6a78793          	add	a5,a5,-1174 # 2dc0 <__clone+0x116>
  //
  // create a file with known content, map it into memory, check that
  // the mapped memory has the same bytes as originally written to the
  // file.
  //
  makefile(f);
    125e:	00002517          	auipc	a0,0x2
    1262:	b7250513          	add	a0,a0,-1166 # 2dd0 <__clone+0x126>
  testname = "mmap_test";
    1266:	00002497          	auipc	s1,0x2
    126a:	35a48493          	add	s1,s1,858 # 35c0 <testname>
    126e:	e09c                	sd	a5,0(s1)
  makefile(f);
    1270:	eabff0ef          	jal	111a <makefile>
  if ((fd = open(f, O_RDONLY)) == -1)
    1274:	4581                	li	a1,0
    1276:	00002517          	auipc	a0,0x2
    127a:	b5a50513          	add	a0,a0,-1190 # 2dd0 <__clone+0x126>
    127e:	7ac010ef          	jal	2a2a <open>
    1282:	57fd                	li	a5,-1
    1284:	892a                	mv	s2,a0
    1286:	74f50163          	beq	a0,a5,19c8 <mmap_test+0x794>
    err("open");

  printf("test mmap f\n");
    128a:	00002517          	auipc	a0,0x2
    128e:	b5650513          	add	a0,a0,-1194 # 2de0 <__clone+0x136>
    1292:	663000ef          	jal	20f4 <printf>
  // same file (of course in this case updates are prohibited
  // due to PROT_READ). the fifth argument is the file descriptor
  // of the file to be mapped. the last argument is the starting
  // offset in the file.
  //
  char *p = mmap(0, PGSIZE * 2, PROT_READ, MAP_PRIVATE, fd, 0);
    1296:	4781                	li	a5,0
    1298:	874a                	mv	a4,s2
    129a:	4689                	li	a3,2
    129c:	4605                	li	a2,1
    129e:	6589                	lui	a1,0x2
    12a0:	4501                	li	a0,0
    12a2:	0cf010ef          	jal	2b70 <mmap>
  if (p == MAP_FAILED)
    12a6:	57fd                	li	a5,-1
  char *p = mmap(0, PGSIZE * 2, PROT_READ, MAP_PRIVATE, fd, 0);
    12a8:	842a                	mv	s0,a0
  if (p == MAP_FAILED)
    12aa:	16f50ce3          	beq	a0,a5,1c22 <mmap_test+0x9ee>
    err("mmap (1)");
  _v1(p);
    12ae:	8522                	mv	a0,s0
    12b0:	d8dff0ef          	jal	103c <_v1>
  if (munmap(p, PGSIZE * 2) == -1)
    12b4:	6589                	lui	a1,0x2
    12b6:	8522                	mv	a0,s0
    12b8:	0c3010ef          	jal	2b7a <munmap>
    12bc:	57fd                	li	a5,-1
    12be:	68f50b63          	beq	a0,a5,1954 <mmap_test+0x720>
    err("munmap (1)");

  printf("test mmap f: OK\n");
    12c2:	00002517          	auipc	a0,0x2
    12c6:	b4e50513          	add	a0,a0,-1202 # 2e10 <__clone+0x166>
    12ca:	62b000ef          	jal	20f4 <printf>

  printf("test mmap private\n");
    12ce:	00002517          	auipc	a0,0x2
    12d2:	b5a50513          	add	a0,a0,-1190 # 2e28 <__clone+0x17e>
    12d6:	61f000ef          	jal	20f4 <printf>
  // should be able to map file opened read-only with private writable
  // mapping
  p = mmap(0, PGSIZE * 2, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0);
    12da:	4781                	li	a5,0
    12dc:	874a                	mv	a4,s2
    12de:	4689                	li	a3,2
    12e0:	460d                	li	a2,3
    12e2:	6589                	lui	a1,0x2
    12e4:	4501                	li	a0,0
    12e6:	08b010ef          	jal	2b70 <mmap>
  if (p == MAP_FAILED)
    12ea:	59fd                	li	s3,-1
  p = mmap(0, PGSIZE * 2, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0);
    12ec:	842a                	mv	s0,a0
  if (p == MAP_FAILED)
    12ee:	0f3504e3          	beq	a0,s3,1bd6 <mmap_test+0x9a2>
    err("mmap (2)");
  if (close(fd) == -1)
    12f2:	854a                	mv	a0,s2
    12f4:	768010ef          	jal	2a5c <close>
    12f8:	6f350c63          	beq	a0,s3,19f0 <mmap_test+0x7bc>
    err("close");
  _v1(p);
    12fc:	8522                	mv	a0,s0
    12fe:	d3fff0ef          	jal	103c <_v1>
  for (i = 0; i < PGSIZE * 2; i++)
    1302:	408006bb          	negw	a3,s0
    1306:	0076f793          	and	a5,a3,7
    130a:	70078f63          	beqz	a5,1a28 <mmap_test+0x7f4>
    p[i] = 'Z';
    130e:	05a00713          	li	a4,90
    1312:	00e40023          	sb	a4,0(s0)
  for (i = 0; i < PGSIZE * 2; i++)
    1316:	0066f613          	and	a2,a3,6
    131a:	0e060ee3          	beqz	a2,1c16 <mmap_test+0x9e2>
    p[i] = 'Z';
    131e:	00e400a3          	sb	a4,1(s0)
  for (i = 0; i < PGSIZE * 2; i++)
    1322:	4609                	li	a2,2
    1324:	12f679e3          	bgeu	a2,a5,1c56 <mmap_test+0xa22>
    p[i] = 'Z';
    1328:	00e40123          	sb	a4,2(s0)
  for (i = 0; i < PGSIZE * 2; i++)
    132c:	8a91                	and	a3,a3,4
    132e:	120689e3          	beqz	a3,1c60 <mmap_test+0xa2c>
    p[i] = 'Z';
    1332:	00e401a3          	sb	a4,3(s0)
  for (i = 0; i < PGSIZE * 2; i++)
    1336:	4691                	li	a3,4
    1338:	7ef6fd63          	bgeu	a3,a5,1b32 <mmap_test+0x8fe>
    p[i] = 'Z';
    133c:	00e40223          	sb	a4,4(s0)
  for (i = 0; i < PGSIZE * 2; i++)
    1340:	4695                	li	a3,5
    1342:	12d78ee3          	beq	a5,a3,1c7e <mmap_test+0xa4a>
    p[i] = 'Z';
    1346:	00e402a3          	sb	a4,5(s0)
  for (i = 0; i < PGSIZE * 2; i++)
    134a:	469d                	li	a3,7
    p[i] = 'Z';
    134c:	6589                	lui	a1,0x2
    134e:	14d792e3          	bne	a5,a3,1c92 <mmap_test+0xa5e>
    1352:	00e40323          	sb	a4,6(s0)
    1356:	15e5                	add	a1,a1,-7 # 1ff9 <printint.constprop.0+0x145>
    1358:	461d                	li	a2,7
    135a:	6509                	lui	a0,0x2
    135c:	9d1d                	subw	a0,a0,a5
    135e:	00002917          	auipc	s2,0x2
    1362:	e4290913          	add	s2,s2,-446 # 31a0 <__clone+0x4f6>
    1366:	0035571b          	srlw	a4,a0,0x3
    136a:	00093683          	ld	a3,0(s2)
    136e:	97a2                	add	a5,a5,s0
    1370:	070e                	sll	a4,a4,0x3
    1372:	973e                	add	a4,a4,a5
    1374:	e394                	sd	a3,0(a5)
  for (i = 0; i < PGSIZE * 2; i++)
    1376:	07a1                	add	a5,a5,8
    1378:	fee79ee3          	bne	a5,a4,1374 <mmap_test+0x140>
    137c:	ff857713          	and	a4,a0,-8
    1380:	00c706bb          	addw	a3,a4,a2
    1384:	891d                	and	a0,a0,7
    1386:	87b6                	mv	a5,a3
    1388:	40e5873b          	subw	a4,a1,a4
    138c:	c535                	beqz	a0,13f8 <mmap_test+0x1c4>
    p[i] = 'Z';
    138e:	00d40633          	add	a2,s0,a3
    1392:	05a00693          	li	a3,90
    1396:	00d60023          	sb	a3,0(a2)
  for (i = 0; i < PGSIZE * 2; i++)
    139a:	4585                	li	a1,1
    139c:	0017861b          	addw	a2,a5,1
    13a0:	04b70c63          	beq	a4,a1,13f8 <mmap_test+0x1c4>
    p[i] = 'Z';
    13a4:	9622                	add	a2,a2,s0
    13a6:	00d60023          	sb	a3,0(a2)
  for (i = 0; i < PGSIZE * 2; i++)
    13aa:	4589                	li	a1,2
    13ac:	0027861b          	addw	a2,a5,2
    13b0:	04b70463          	beq	a4,a1,13f8 <mmap_test+0x1c4>
    p[i] = 'Z';
    13b4:	9622                	add	a2,a2,s0
    13b6:	00d60023          	sb	a3,0(a2)
  for (i = 0; i < PGSIZE * 2; i++)
    13ba:	458d                	li	a1,3
    13bc:	0037861b          	addw	a2,a5,3
    13c0:	02b70c63          	beq	a4,a1,13f8 <mmap_test+0x1c4>
    p[i] = 'Z';
    13c4:	9622                	add	a2,a2,s0
    13c6:	00d60023          	sb	a3,0(a2)
  for (i = 0; i < PGSIZE * 2; i++)
    13ca:	4591                	li	a1,4
    13cc:	0047861b          	addw	a2,a5,4
    13d0:	02b70463          	beq	a4,a1,13f8 <mmap_test+0x1c4>
    p[i] = 'Z';
    13d4:	9622                	add	a2,a2,s0
    13d6:	00d60023          	sb	a3,0(a2)
  for (i = 0; i < PGSIZE * 2; i++)
    13da:	4595                	li	a1,5
    13dc:	0057861b          	addw	a2,a5,5
    13e0:	00b70c63          	beq	a4,a1,13f8 <mmap_test+0x1c4>
    p[i] = 'Z';
    13e4:	9622                	add	a2,a2,s0
    13e6:	00d60023          	sb	a3,0(a2)
  for (i = 0; i < PGSIZE * 2; i++)
    13ea:	4619                	li	a2,6
    13ec:	2799                	addw	a5,a5,6
    13ee:	00c70563          	beq	a4,a2,13f8 <mmap_test+0x1c4>
    p[i] = 'Z';
    13f2:	97a2                	add	a5,a5,s0
    13f4:	00d78023          	sb	a3,0(a5)
  if (munmap(p, PGSIZE * 2) == -1)
    13f8:	6589                	lui	a1,0x2
    13fa:	8522                	mv	a0,s0
    13fc:	77e010ef          	jal	2b7a <munmap>
    1400:	57fd                	li	a5,-1
    1402:	70f50463          	beq	a0,a5,1b0a <mmap_test+0x8d6>
    err("munmap (2)");

  printf("test mmap private: OK\n");
    1406:	00002517          	auipc	a0,0x2
    140a:	a5a50513          	add	a0,a0,-1446 # 2e60 <__clone+0x1b6>
    140e:	4e7000ef          	jal	20f4 <printf>

  printf("test mmap read-only\n");
    1412:	00002517          	auipc	a0,0x2
    1416:	a6650513          	add	a0,a0,-1434 # 2e78 <__clone+0x1ce>
    141a:	4db000ef          	jal	20f4 <printf>

  // check that mmap doesn't allow read/write mapping of a
  // file opened read-only.
  if ((fd = open(f, O_RDONLY)) == -1)
    141e:	4581                	li	a1,0
    1420:	00002517          	auipc	a0,0x2
    1424:	9b050513          	add	a0,a0,-1616 # 2dd0 <__clone+0x126>
    1428:	602010ef          	jal	2a2a <open>
    142c:	57fd                	li	a5,-1
    142e:	842a                	mv	s0,a0
    1430:	6af50863          	beq	a0,a5,1ae0 <mmap_test+0x8ac>
    err("open");
  p = mmap(0, PGSIZE * 3, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    1434:	4781                	li	a5,0
    1436:	8722                	mv	a4,s0
    1438:	4685                	li	a3,1
    143a:	460d                	li	a2,3
    143c:	658d                	lui	a1,0x3
    143e:	4501                	li	a0,0
    1440:	730010ef          	jal	2b70 <mmap>
  if (p != MAP_FAILED)
    1444:	57fd                	li	a5,-1
    1446:	02f50563          	beq	a0,a5,1470 <mmap_test+0x23c>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    144a:	0004b983          	ld	s3,0(s1)
    144e:	62e010ef          	jal	2a7c <getpid>
    1452:	86aa                	mv	a3,a0
    1454:	00002617          	auipc	a2,0x2
    1458:	a3c60613          	add	a2,a2,-1476 # 2e90 <__clone+0x1e6>
    145c:	00002517          	auipc	a0,0x2
    1460:	87c50513          	add	a0,a0,-1924 # 2cd8 <__clone+0x2e>
    1464:	85ce                	mv	a1,s3
    1466:	48f000ef          	jal	20f4 <printf>
  exit(1);
    146a:	4505                	li	a0,1
    146c:	656010ef          	jal	2ac2 <exit>
    err("mmap call should have failed");
  if (close(fd) == -1)
    1470:	8522                	mv	a0,s0
    1472:	5ea010ef          	jal	2a5c <close>
    1476:	57fd                	li	a5,-1
    1478:	64f50163          	beq	a0,a5,1aba <mmap_test+0x886>
    err("close");

  printf("test mmap read-only: OK\n");
    147c:	00002517          	auipc	a0,0x2
    1480:	a3450513          	add	a0,a0,-1484 # 2eb0 <__clone+0x206>
    1484:	471000ef          	jal	20f4 <printf>

  printf("test mmap read/write\n");
    1488:	00002517          	auipc	a0,0x2
    148c:	a4850513          	add	a0,a0,-1464 # 2ed0 <__clone+0x226>
    1490:	465000ef          	jal	20f4 <printf>
  //   char *p;
  // check that mmap does allow read/write mapping of a
  // file opened read/write.
  if ((fd = open(f, O_RDWR)) == -1)
    1494:	4589                	li	a1,2
    1496:	00002517          	auipc	a0,0x2
    149a:	93a50513          	add	a0,a0,-1734 # 2dd0 <__clone+0x126>
    149e:	58c010ef          	jal	2a2a <open>
    14a2:	57fd                	li	a5,-1
    14a4:	842a                	mv	s0,a0
    14a6:	5ef50663          	beq	a0,a5,1a92 <mmap_test+0x85e>
    err("open");
  p = mmap(0, PGSIZE * 3, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    14aa:	4781                	li	a5,0
    14ac:	8722                	mv	a4,s0
    14ae:	4685                	li	a3,1
    14b0:	460d                	li	a2,3
    14b2:	658d                	lui	a1,0x3
    14b4:	4501                	li	a0,0
    14b6:	6ba010ef          	jal	2b70 <mmap>
  if (p == MAP_FAILED)
    14ba:	59fd                	li	s3,-1
  p = mmap(0, PGSIZE * 3, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    14bc:	8c2a                	mv	s8,a0
  if (p == MAP_FAILED)
    14be:	6d350663          	beq	a0,s3,1b8a <mmap_test+0x956>
    err("mmap (3)");
  if (close(fd) == -1)
    14c2:	8522                	mv	a0,s0
    14c4:	598010ef          	jal	2a5c <close>
    14c8:	59350763          	beq	a0,s3,1a56 <mmap_test+0x822>
    err("close");

  // check that the mapping still works after close(fd).
  _v1(p);
    14cc:	8562                	mv	a0,s8
    14ce:	b6fff0ef          	jal	103c <_v1>

  // write the mapped memory.
  for (i = 0; i < PGSIZE * 2; i++)
    14d2:	418006bb          	negw	a3,s8
    14d6:	0076f793          	and	a5,a3,7
    14da:	5a078963          	beqz	a5,1a8c <mmap_test+0x858>
    p[i] = 'Z';
    14de:	05a00713          	li	a4,90
    14e2:	00ec0023          	sb	a4,0(s8) # 2000 <printint.constprop.0+0x14c>
  for (i = 0; i < PGSIZE * 2; i++)
    14e6:	0066f613          	and	a2,a3,6
    14ea:	6e060063          	beqz	a2,1bca <mmap_test+0x996>
    p[i] = 'Z';
    14ee:	00ec00a3          	sb	a4,1(s8)
  for (i = 0; i < PGSIZE * 2; i++)
    14f2:	4609                	li	a2,2
    14f4:	74f67c63          	bgeu	a2,a5,1c4c <mmap_test+0xa18>
    p[i] = 'Z';
    14f8:	00ec0123          	sb	a4,2(s8)
  for (i = 0; i < PGSIZE * 2; i++)
    14fc:	8a91                	and	a3,a3,4
    14fe:	76068663          	beqz	a3,1c6a <mmap_test+0xa36>
    p[i] = 'Z';
    1502:	00ec01a3          	sb	a4,3(s8)
  for (i = 0; i < PGSIZE * 2; i++)
    1506:	4691                	li	a3,4
    1508:	76f6f663          	bgeu	a3,a5,1c74 <mmap_test+0xa40>
    p[i] = 'Z';
    150c:	00ec0223          	sb	a4,4(s8)
  for (i = 0; i < PGSIZE * 2; i++)
    1510:	4695                	li	a3,5
    1512:	76d78b63          	beq	a5,a3,1c88 <mmap_test+0xa54>
    p[i] = 'Z';
    1516:	00ec02a3          	sb	a4,5(s8)
  for (i = 0; i < PGSIZE * 2; i++)
    151a:	469d                	li	a3,7
    p[i] = 'Z';
    151c:	6589                	lui	a1,0x2
    151e:	76d79f63          	bne	a5,a3,1c9c <mmap_test+0xa68>
    1522:	00ec0323          	sb	a4,6(s8)
    1526:	15e5                	add	a1,a1,-7 # 1ff9 <printint.constprop.0+0x145>
    1528:	461d                	li	a2,7
    152a:	6509                	lui	a0,0x2
    152c:	9d1d                	subw	a0,a0,a5
    152e:	0035571b          	srlw	a4,a0,0x3
    1532:	00093683          	ld	a3,0(s2)
    1536:	97e2                	add	a5,a5,s8
    1538:	070e                	sll	a4,a4,0x3
    153a:	973e                	add	a4,a4,a5
    153c:	e394                	sd	a3,0(a5)
  for (i = 0; i < PGSIZE * 2; i++)
    153e:	07a1                	add	a5,a5,8
    1540:	fee79ee3          	bne	a5,a4,153c <mmap_test+0x308>
    1544:	ff857713          	and	a4,a0,-8
    1548:	00c706bb          	addw	a3,a4,a2
    154c:	891d                	and	a0,a0,7
    154e:	87b6                	mv	a5,a3
    1550:	40e5873b          	subw	a4,a1,a4
    1554:	c535                	beqz	a0,15c0 <mmap_test+0x38c>
    p[i] = 'Z';
    1556:	00dc0633          	add	a2,s8,a3
    155a:	05a00693          	li	a3,90
    155e:	00d60023          	sb	a3,0(a2)
  for (i = 0; i < PGSIZE * 2; i++)
    1562:	4585                	li	a1,1
    1564:	0017861b          	addw	a2,a5,1
    1568:	04b70c63          	beq	a4,a1,15c0 <mmap_test+0x38c>
    p[i] = 'Z';
    156c:	9662                	add	a2,a2,s8
    156e:	00d60023          	sb	a3,0(a2)
  for (i = 0; i < PGSIZE * 2; i++)
    1572:	4589                	li	a1,2
    1574:	0027861b          	addw	a2,a5,2
    1578:	04b70463          	beq	a4,a1,15c0 <mmap_test+0x38c>
    p[i] = 'Z';
    157c:	9662                	add	a2,a2,s8
    157e:	00d60023          	sb	a3,0(a2)
  for (i = 0; i < PGSIZE * 2; i++)
    1582:	458d                	li	a1,3
    1584:	0037861b          	addw	a2,a5,3
    1588:	02b70c63          	beq	a4,a1,15c0 <mmap_test+0x38c>
    p[i] = 'Z';
    158c:	9662                	add	a2,a2,s8
    158e:	00d60023          	sb	a3,0(a2)
  for (i = 0; i < PGSIZE * 2; i++)
    1592:	4591                	li	a1,4
    1594:	0047861b          	addw	a2,a5,4
    1598:	02b70463          	beq	a4,a1,15c0 <mmap_test+0x38c>
    p[i] = 'Z';
    159c:	9662                	add	a2,a2,s8
    159e:	00d60023          	sb	a3,0(a2)
  for (i = 0; i < PGSIZE * 2; i++)
    15a2:	4595                	li	a1,5
    15a4:	0057861b          	addw	a2,a5,5
    15a8:	00b70c63          	beq	a4,a1,15c0 <mmap_test+0x38c>
    p[i] = 'Z';
    15ac:	9662                	add	a2,a2,s8
    15ae:	00d60023          	sb	a3,0(a2)
  for (i = 0; i < PGSIZE * 2; i++)
    15b2:	4619                	li	a2,6
    15b4:	2799                	addw	a5,a5,6
    15b6:	00c70563          	beq	a4,a2,15c0 <mmap_test+0x38c>
    p[i] = 'Z';
    15ba:	97e2                	add	a5,a5,s8
    15bc:	00d78023          	sb	a3,0(a5)

  // unmap just the first two of three pages of mapped memory.
  if (munmap(p, PGSIZE * 2) == -1)
    15c0:	6589                	lui	a1,0x2
    15c2:	8562                	mv	a0,s8
    15c4:	5b6010ef          	jal	2b7a <munmap>
    15c8:	57fd                	li	a5,-1
    15ca:	46f50363          	beq	a0,a5,1a30 <mmap_test+0x7fc>
    err("munmap (3)");

  printf("test mmap read/write: OK\n");
    15ce:	00002517          	auipc	a0,0x2
    15d2:	93a50513          	add	a0,a0,-1734 # 2f08 <__clone+0x25e>
    15d6:	31f000ef          	jal	20f4 <printf>

  printf("test mmap dirty\n");
    15da:	00002517          	auipc	a0,0x2
    15de:	94e50513          	add	a0,a0,-1714 # 2f28 <__clone+0x27e>
    15e2:	313000ef          	jal	20f4 <printf>

  // check that the writes to the mapped memory were
  // written to the file.
  if ((fd = open(f, O_RDWR)) == -1)
    15e6:	4589                	li	a1,2
    15e8:	00001517          	auipc	a0,0x1
    15ec:	7e850513          	add	a0,a0,2024 # 2dd0 <__clone+0x126>
    15f0:	43a010ef          	jal	2a2a <open>
    15f4:	57fd                	li	a5,-1
    15f6:	892a                	mv	s2,a0
    15f8:	3af50563          	beq	a0,a5,19a2 <mmap_test+0x76e>
  for (i = 0; i < PGSIZE * 2; i++)
    15fc:	6409                	lui	s0,0x2
    15fe:	80040413          	add	s0,s0,-2048 # 1800 <mmap_test+0x5cc>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1602:	00002b97          	auipc	s7,0x2
    1606:	93eb8b93          	add	s7,s7,-1730 # 2f40 <__clone+0x296>
    160a:	00001a17          	auipc	s4,0x1
    160e:	6cea0a13          	add	s4,s4,1742 # 2cd8 <__clone+0x2e>
    err("open");
  for (i = 0; i < PGSIZE + (PGSIZE / 2); i++) {
    char b;
    if (read(fd, &b, 1) != 1)
      err("read (1)");
    if (b != 'Z')
    1612:	05a00993          	li	s3,90
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1616:	00002b17          	auipc	s6,0x2
    161a:	93ab0b13          	add	s6,s6,-1734 # 2f50 <__clone+0x2a6>
    if (read(fd, &b, 1) != 1)
    161e:	4605                	li	a2,1
    1620:	00f10593          	add	a1,sp,15
    1624:	854a                	mv	a0,s2
    1626:	442010ef          	jal	2a68 <read>
    162a:	4785                	li	a5,1
    162c:	00f50f63          	beq	a0,a5,164a <mmap_test+0x416>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1630:	0004ba83          	ld	s5,0(s1)
    1634:	448010ef          	jal	2a7c <getpid>
    1638:	86aa                	mv	a3,a0
    163a:	865e                	mv	a2,s7
    163c:	8552                	mv	a0,s4
    163e:	85d6                	mv	a1,s5
    1640:	2b5000ef          	jal	20f4 <printf>
  exit(1);
    1644:	4505                	li	a0,1
    1646:	47c010ef          	jal	2ac2 <exit>
    if (b != 'Z')
    164a:	00f14783          	lbu	a5,15(sp)
    164e:	21378463          	beq	a5,s3,1856 <mmap_test+0x622>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1652:	0004ba83          	ld	s5,0(s1)
    1656:	426010ef          	jal	2a7c <getpid>
    165a:	86aa                	mv	a3,a0
    165c:	865a                	mv	a2,s6
    165e:	85d6                	mv	a1,s5
    1660:	8552                	mv	a0,s4
    1662:	293000ef          	jal	20f4 <printf>
  exit(1);
    1666:	4505                	li	a0,1
  for (i = 0; i < PGSIZE + (PGSIZE / 2); i++) {
    1668:	347d                	addw	s0,s0,-1
  exit(1);
    166a:	458010ef          	jal	2ac2 <exit>
  for (i = 0; i < PGSIZE + (PGSIZE / 2); i++) {
    166e:	f845                	bnez	s0,161e <mmap_test+0x3ea>
      err("file does not contain modifications");
  }
  if (close(fd) == -1)
    1670:	854a                	mv	a0,s2
    1672:	3ea010ef          	jal	2a5c <close>
    1676:	57fd                	li	a5,-1
    1678:	1ef50863          	beq	a0,a5,1868 <mmap_test+0x634>
    err("close");

  printf("test mmap dirty: OK\n");
    167c:	00002517          	auipc	a0,0x2
    1680:	8fc50513          	add	a0,a0,-1796 # 2f78 <__clone+0x2ce>
    1684:	271000ef          	jal	20f4 <printf>

  printf("test not-mapped unmap\n");
    1688:	00002517          	auipc	a0,0x2
    168c:	90850513          	add	a0,a0,-1784 # 2f90 <__clone+0x2e6>
    1690:	265000ef          	jal	20f4 <printf>

  // unmap the rest of the mapped memory.
  if (munmap(p + PGSIZE * 2, PGSIZE) == -1)
    1694:	6509                	lui	a0,0x2
    1696:	6585                	lui	a1,0x1
    1698:	9562                	add	a0,a0,s8
    169a:	4e0010ef          	jal	2b7a <munmap>
    169e:	57fd                	li	a5,-1
    16a0:	2cf50e63          	beq	a0,a5,197c <mmap_test+0x748>
    err("munmap (4)");

  printf("test not-mapped unmap: OK\n");
    16a4:	00002517          	auipc	a0,0x2
    16a8:	91450513          	add	a0,a0,-1772 # 2fb8 <__clone+0x30e>
    16ac:	249000ef          	jal	20f4 <printf>

  printf("test mmap two files\n");
    16b0:	00002517          	auipc	a0,0x2
    16b4:	92850513          	add	a0,a0,-1752 # 2fd8 <__clone+0x32e>
    16b8:	23d000ef          	jal	20f4 <printf>

  //
  // mmap two files at the same time.
  //
  int fd1;
  if ((fd1 = open("mmap1", O_RDWR | O_CREATE)) < 0)
    16bc:	04200593          	li	a1,66
    16c0:	00002517          	auipc	a0,0x2
    16c4:	93050513          	add	a0,a0,-1744 # 2ff0 <__clone+0x346>
    16c8:	362010ef          	jal	2a2a <open>
    16cc:	842a                	mv	s0,a0
    16ce:	24054f63          	bltz	a0,192c <mmap_test+0x6f8>
    err("open mmap1");
  if (write(fd1, "12345", 5) != 5)
    16d2:	4615                	li	a2,5
    16d4:	00002597          	auipc	a1,0x2
    16d8:	93458593          	add	a1,a1,-1740 # 3008 <__clone+0x35e>
    16dc:	8522                	mv	a0,s0
    16de:	394010ef          	jal	2a72 <write>
    16e2:	4795                	li	a5,5
    16e4:	02f50563          	beq	a0,a5,170e <mmap_test+0x4da>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    16e8:	0004b903          	ld	s2,0(s1)
    16ec:	390010ef          	jal	2a7c <getpid>
    16f0:	86aa                	mv	a3,a0
    16f2:	00002617          	auipc	a2,0x2
    16f6:	91e60613          	add	a2,a2,-1762 # 3010 <__clone+0x366>
    16fa:	00001517          	auipc	a0,0x1
    16fe:	5de50513          	add	a0,a0,1502 # 2cd8 <__clone+0x2e>
    1702:	85ca                	mv	a1,s2
    1704:	1f1000ef          	jal	20f4 <printf>
  exit(1);
    1708:	4505                	li	a0,1
    170a:	3b8010ef          	jal	2ac2 <exit>
    err("write mmap1");
  close(fd1);
    170e:	8522                	mv	a0,s0
    1710:	34c010ef          	jal	2a5c <close>
  fd1 = open("mmap1", O_RDWR);
    1714:	4589                	li	a1,2
    1716:	00002517          	auipc	a0,0x2
    171a:	8da50513          	add	a0,a0,-1830 # 2ff0 <__clone+0x346>
    171e:	30c010ef          	jal	2a2a <open>

  char *p1 = mmap(0, PGSIZE, PROT_READ, MAP_PRIVATE, fd1, 0);
    1722:	4781                	li	a5,0
    1724:	872a                	mv	a4,a0
  fd1 = open("mmap1", O_RDWR);
    1726:	89aa                	mv	s3,a0
  char *p1 = mmap(0, PGSIZE, PROT_READ, MAP_PRIVATE, fd1, 0);
    1728:	4689                	li	a3,2
    172a:	4605                	li	a2,1
    172c:	6585                	lui	a1,0x1
    172e:	4501                	li	a0,0
    1730:	440010ef          	jal	2b70 <mmap>

  if (p1 == MAP_FAILED)
    1734:	57fd                	li	a5,-1
  char *p1 = mmap(0, PGSIZE, PROT_READ, MAP_PRIVATE, fd1, 0);
    1736:	892a                	mv	s2,a0
  if (p1 == MAP_FAILED)
    1738:	42f50663          	beq	a0,a5,1b64 <mmap_test+0x930>
    err("mmap mmap1");

  int fd2;
  if ((fd2 = open("mmap2", O_RDWR | O_CREATE)) < 0)
    173c:	04200593          	li	a1,66
    1740:	00002517          	auipc	a0,0x2
    1744:	8f050513          	add	a0,a0,-1808 # 3030 <__clone+0x386>
    1748:	2e2010ef          	jal	2a2a <open>
    174c:	842a                	mv	s0,a0
    174e:	1a054b63          	bltz	a0,1904 <mmap_test+0x6d0>
    err("open mmap2");
  if (write(fd2, "67890", 5) != 5)
    1752:	4615                	li	a2,5
    1754:	00002597          	auipc	a1,0x2
    1758:	8f458593          	add	a1,a1,-1804 # 3048 <__clone+0x39e>
    175c:	8522                	mv	a0,s0
    175e:	314010ef          	jal	2a72 <write>
    1762:	4795                	li	a5,5
    1764:	02f50563          	beq	a0,a5,178e <mmap_test+0x55a>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1768:	0004ba03          	ld	s4,0(s1)
    176c:	310010ef          	jal	2a7c <getpid>
    1770:	86aa                	mv	a3,a0
    1772:	00002617          	auipc	a2,0x2
    1776:	8de60613          	add	a2,a2,-1826 # 3050 <__clone+0x3a6>
    177a:	00001517          	auipc	a0,0x1
    177e:	55e50513          	add	a0,a0,1374 # 2cd8 <__clone+0x2e>
    1782:	85d2                	mv	a1,s4
    1784:	171000ef          	jal	20f4 <printf>
  exit(1);
    1788:	4505                	li	a0,1
    178a:	338010ef          	jal	2ac2 <exit>
    err("write mmap2");
  close(fd2);
    178e:	8522                	mv	a0,s0
    1790:	2cc010ef          	jal	2a5c <close>
  fd2 = open("mmap2", O_RDWR);
    1794:	4589                	li	a1,2
    1796:	00002517          	auipc	a0,0x2
    179a:	89a50513          	add	a0,a0,-1894 # 3030 <__clone+0x386>
    179e:	28c010ef          	jal	2a2a <open>
  char *p2 = mmap(0, PGSIZE, PROT_READ, MAP_PRIVATE, fd2, 0);
    17a2:	4781                	li	a5,0
    17a4:	872a                	mv	a4,a0
  fd2 = open("mmap2", O_RDWR);
    17a6:	8a2a                	mv	s4,a0
  char *p2 = mmap(0, PGSIZE, PROT_READ, MAP_PRIVATE, fd2, 0);
    17a8:	4689                	li	a3,2
    17aa:	4605                	li	a2,1
    17ac:	6585                	lui	a1,0x1
    17ae:	4501                	li	a0,0
    17b0:	3c0010ef          	jal	2b70 <mmap>
  if (p2 == MAP_FAILED)
    17b4:	57fd                	li	a5,-1
  char *p2 = mmap(0, PGSIZE, PROT_READ, MAP_PRIVATE, fd2, 0);
    17b6:	842a                	mv	s0,a0
  if (p2 == MAP_FAILED)
    17b8:	38f50263          	beq	a0,a5,1b3c <mmap_test+0x908>
    err("mmap mmap2");

  if (strncmp(p1, "12345", 5) != 0) {
    17bc:	4615                	li	a2,5
    17be:	00002597          	auipc	a1,0x2
    17c2:	84a58593          	add	a1,a1,-1974 # 3008 <__clone+0x35e>
    17c6:	854a                	mv	a0,s2
    17c8:	623000ef          	jal	25ea <strncmp>
    17cc:	10051863          	bnez	a0,18dc <mmap_test+0x6a8>
    err("mmap1 mismatch");
  }
  close(fd1);
    17d0:	854e                	mv	a0,s3
    17d2:	28a010ef          	jal	2a5c <close>
  unlink("mmap1");
    17d6:	00002517          	auipc	a0,0x2
    17da:	81a50513          	add	a0,a0,-2022 # 2ff0 <__clone+0x346>
    17de:	428010ef          	jal	2c06 <unlink>
  if (strncmp(p2, "67890", 5) != 0)
    17e2:	4615                	li	a2,5
    17e4:	00002597          	auipc	a1,0x2
    17e8:	86458593          	add	a1,a1,-1948 # 3048 <__clone+0x39e>
    17ec:	8522                	mv	a0,s0
    17ee:	5fd000ef          	jal	25ea <strncmp>
    17f2:	e169                	bnez	a0,18b4 <mmap_test+0x680>
    err("mmap2 mismatch");

  munmap(p1, PGSIZE);
    17f4:	6585                	lui	a1,0x1
    17f6:	854a                	mv	a0,s2
    17f8:	382010ef          	jal	2b7a <munmap>
  if (strncmp(p2, "67890", 5) != 0)
    17fc:	4615                	li	a2,5
    17fe:	00002597          	auipc	a1,0x2
    1802:	84a58593          	add	a1,a1,-1974 # 3048 <__clone+0x39e>
    1806:	8522                	mv	a0,s0
    1808:	5e3000ef          	jal	25ea <strncmp>
    180c:	e149                	bnez	a0,188e <mmap_test+0x65a>
    err("mmap2 mismatch (2)");
  close(fd2);
    180e:	8552                	mv	a0,s4
    1810:	24c010ef          	jal	2a5c <close>
  munmap(p2, PGSIZE);
    1814:	6585                	lui	a1,0x1
    1816:	8522                	mv	a0,s0
    1818:	362010ef          	jal	2b7a <munmap>
  unlink("mmap2");
    181c:	00002517          	auipc	a0,0x2
    1820:	81450513          	add	a0,a0,-2028 # 3030 <__clone+0x386>
    1824:	3e2010ef          	jal	2c06 <unlink>

  printf("test mmap two files: OK\n");
    1828:	00002517          	auipc	a0,0x2
    182c:	88050513          	add	a0,a0,-1920 # 30a8 <__clone+0x3fe>
    1830:	0c5000ef          	jal	20f4 <printf>

  printf("mmap_test: ALL OK\n");
}
    1834:	6446                	ld	s0,80(sp)
    1836:	60e6                	ld	ra,88(sp)
    1838:	64a6                	ld	s1,72(sp)
    183a:	6906                	ld	s2,64(sp)
    183c:	79e2                	ld	s3,56(sp)
    183e:	7a42                	ld	s4,48(sp)
    1840:	7aa2                	ld	s5,40(sp)
    1842:	7b02                	ld	s6,32(sp)
    1844:	6be2                	ld	s7,24(sp)
    1846:	6c42                	ld	s8,16(sp)
  printf("mmap_test: ALL OK\n");
    1848:	00002517          	auipc	a0,0x2
    184c:	88050513          	add	a0,a0,-1920 # 30c8 <__clone+0x41e>
}
    1850:	6125                	add	sp,sp,96
  printf("mmap_test: ALL OK\n");
    1852:	0a30006f          	j	20f4 <printf>
  for (i = 0; i < PGSIZE + (PGSIZE / 2); i++) {
    1856:	347d                	addw	s0,s0,-1
    1858:	dc0413e3          	bnez	s0,161e <mmap_test+0x3ea>
  if (close(fd) == -1)
    185c:	854a                	mv	a0,s2
    185e:	1fe010ef          	jal	2a5c <close>
    1862:	57fd                	li	a5,-1
    1864:	e0f51ce3          	bne	a0,a5,167c <mmap_test+0x448>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1868:	6080                	ld	s0,0(s1)
    186a:	212010ef          	jal	2a7c <getpid>
    186e:	86aa                	mv	a3,a0
    1870:	00001617          	auipc	a2,0x1
    1874:	53060613          	add	a2,a2,1328 # 2da0 <__clone+0xf6>
    1878:	85a2                	mv	a1,s0
    187a:	00001517          	auipc	a0,0x1
    187e:	45e50513          	add	a0,a0,1118 # 2cd8 <__clone+0x2e>
    1882:	073000ef          	jal	20f4 <printf>
  exit(1);
    1886:	4505                	li	a0,1
    1888:	23a010ef          	jal	2ac2 <exit>
}
    188c:	bbc5                	j	167c <mmap_test+0x448>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    188e:	6084                	ld	s1,0(s1)
    1890:	1ec010ef          	jal	2a7c <getpid>
    1894:	86aa                	mv	a3,a0
    1896:	00001617          	auipc	a2,0x1
    189a:	7fa60613          	add	a2,a2,2042 # 3090 <__clone+0x3e6>
    189e:	85a6                	mv	a1,s1
    18a0:	00001517          	auipc	a0,0x1
    18a4:	43850513          	add	a0,a0,1080 # 2cd8 <__clone+0x2e>
    18a8:	04d000ef          	jal	20f4 <printf>
  exit(1);
    18ac:	4505                	li	a0,1
    18ae:	214010ef          	jal	2ac2 <exit>
}
    18b2:	bfb1                	j	180e <mmap_test+0x5da>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    18b4:	0004b983          	ld	s3,0(s1)
    18b8:	1c4010ef          	jal	2a7c <getpid>
    18bc:	86aa                	mv	a3,a0
    18be:	00001617          	auipc	a2,0x1
    18c2:	7c260613          	add	a2,a2,1986 # 3080 <__clone+0x3d6>
    18c6:	85ce                	mv	a1,s3
    18c8:	00001517          	auipc	a0,0x1
    18cc:	41050513          	add	a0,a0,1040 # 2cd8 <__clone+0x2e>
    18d0:	025000ef          	jal	20f4 <printf>
  exit(1);
    18d4:	4505                	li	a0,1
    18d6:	1ec010ef          	jal	2ac2 <exit>
}
    18da:	bf29                	j	17f4 <mmap_test+0x5c0>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    18dc:	0004ba83          	ld	s5,0(s1)
    18e0:	19c010ef          	jal	2a7c <getpid>
    18e4:	86aa                	mv	a3,a0
    18e6:	00001617          	auipc	a2,0x1
    18ea:	78a60613          	add	a2,a2,1930 # 3070 <__clone+0x3c6>
    18ee:	85d6                	mv	a1,s5
    18f0:	00001517          	auipc	a0,0x1
    18f4:	3e850513          	add	a0,a0,1000 # 2cd8 <__clone+0x2e>
    18f8:	7fc000ef          	jal	20f4 <printf>
  exit(1);
    18fc:	4505                	li	a0,1
    18fe:	1c4010ef          	jal	2ac2 <exit>
}
    1902:	b5f9                	j	17d0 <mmap_test+0x59c>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1904:	0004ba03          	ld	s4,0(s1)
    1908:	174010ef          	jal	2a7c <getpid>
    190c:	86aa                	mv	a3,a0
    190e:	00001617          	auipc	a2,0x1
    1912:	72a60613          	add	a2,a2,1834 # 3038 <__clone+0x38e>
    1916:	85d2                	mv	a1,s4
    1918:	00001517          	auipc	a0,0x1
    191c:	3c050513          	add	a0,a0,960 # 2cd8 <__clone+0x2e>
    1920:	7d4000ef          	jal	20f4 <printf>
  exit(1);
    1924:	4505                	li	a0,1
    1926:	19c010ef          	jal	2ac2 <exit>
}
    192a:	b525                	j	1752 <mmap_test+0x51e>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    192c:	0004b903          	ld	s2,0(s1)
    1930:	14c010ef          	jal	2a7c <getpid>
    1934:	86aa                	mv	a3,a0
    1936:	00001617          	auipc	a2,0x1
    193a:	6c260613          	add	a2,a2,1730 # 2ff8 <__clone+0x34e>
    193e:	85ca                	mv	a1,s2
    1940:	00001517          	auipc	a0,0x1
    1944:	39850513          	add	a0,a0,920 # 2cd8 <__clone+0x2e>
    1948:	7ac000ef          	jal	20f4 <printf>
  exit(1);
    194c:	4505                	li	a0,1
    194e:	174010ef          	jal	2ac2 <exit>
}
    1952:	b341                	j	16d2 <mmap_test+0x49e>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1954:	6080                	ld	s0,0(s1)
    1956:	126010ef          	jal	2a7c <getpid>
    195a:	86aa                	mv	a3,a0
    195c:	00001617          	auipc	a2,0x1
    1960:	4a460613          	add	a2,a2,1188 # 2e00 <__clone+0x156>
    1964:	85a2                	mv	a1,s0
    1966:	00001517          	auipc	a0,0x1
    196a:	37250513          	add	a0,a0,882 # 2cd8 <__clone+0x2e>
    196e:	786000ef          	jal	20f4 <printf>
  exit(1);
    1972:	4505                	li	a0,1
    1974:	14e010ef          	jal	2ac2 <exit>
}
    1978:	94bff06f          	j	12c2 <mmap_test+0x8e>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    197c:	6080                	ld	s0,0(s1)
    197e:	0fe010ef          	jal	2a7c <getpid>
    1982:	86aa                	mv	a3,a0
    1984:	00001617          	auipc	a2,0x1
    1988:	62460613          	add	a2,a2,1572 # 2fa8 <__clone+0x2fe>
    198c:	85a2                	mv	a1,s0
    198e:	00001517          	auipc	a0,0x1
    1992:	34a50513          	add	a0,a0,842 # 2cd8 <__clone+0x2e>
    1996:	75e000ef          	jal	20f4 <printf>
  exit(1);
    199a:	4505                	li	a0,1
    199c:	126010ef          	jal	2ac2 <exit>
}
    19a0:	b311                	j	16a4 <mmap_test+0x470>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    19a2:	6080                	ld	s0,0(s1)
    19a4:	0d8010ef          	jal	2a7c <getpid>
    19a8:	86aa                	mv	a3,a0
    19aa:	00001617          	auipc	a2,0x1
    19ae:	3d660613          	add	a2,a2,982 # 2d80 <__clone+0xd6>
    19b2:	85a2                	mv	a1,s0
    19b4:	00001517          	auipc	a0,0x1
    19b8:	32450513          	add	a0,a0,804 # 2cd8 <__clone+0x2e>
    19bc:	738000ef          	jal	20f4 <printf>
  exit(1);
    19c0:	4505                	li	a0,1
    19c2:	100010ef          	jal	2ac2 <exit>
  for (i = 0; i < PGSIZE + (PGSIZE / 2); i++) {
    19c6:	b91d                	j	15fc <mmap_test+0x3c8>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    19c8:	6080                	ld	s0,0(s1)
    19ca:	0b2010ef          	jal	2a7c <getpid>
    19ce:	86aa                	mv	a3,a0
    19d0:	00001617          	auipc	a2,0x1
    19d4:	3b060613          	add	a2,a2,944 # 2d80 <__clone+0xd6>
    19d8:	85a2                	mv	a1,s0
    19da:	00001517          	auipc	a0,0x1
    19de:	2fe50513          	add	a0,a0,766 # 2cd8 <__clone+0x2e>
    19e2:	712000ef          	jal	20f4 <printf>
  exit(1);
    19e6:	4505                	li	a0,1
    19e8:	0da010ef          	jal	2ac2 <exit>
}
    19ec:	89fff06f          	j	128a <mmap_test+0x56>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    19f0:	0004b903          	ld	s2,0(s1)
    19f4:	088010ef          	jal	2a7c <getpid>
    19f8:	86aa                	mv	a3,a0
    19fa:	00001617          	auipc	a2,0x1
    19fe:	3a660613          	add	a2,a2,934 # 2da0 <__clone+0xf6>
    1a02:	85ca                	mv	a1,s2
    1a04:	00001517          	auipc	a0,0x1
    1a08:	2d450513          	add	a0,a0,724 # 2cd8 <__clone+0x2e>
    1a0c:	6e8000ef          	jal	20f4 <printf>
  exit(1);
    1a10:	4505                	li	a0,1
    1a12:	0b0010ef          	jal	2ac2 <exit>
  _v1(p);
    1a16:	8522                	mv	a0,s0
    1a18:	e24ff0ef          	jal	103c <_v1>
  for (i = 0; i < PGSIZE * 2; i++)
    1a1c:	408006bb          	negw	a3,s0
    1a20:	0076f793          	and	a5,a3,7
    1a24:	8e0795e3          	bnez	a5,130e <mmap_test+0xda>
  _v1(p);
    1a28:	6589                	lui	a1,0x2
  for (i = 0; i < PGSIZE * 2; i++)
    1a2a:	4601                	li	a2,0
    1a2c:	92fff06f          	j	135a <mmap_test+0x126>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1a30:	6080                	ld	s0,0(s1)
    1a32:	04a010ef          	jal	2a7c <getpid>
    1a36:	86aa                	mv	a3,a0
    1a38:	00001617          	auipc	a2,0x1
    1a3c:	4c060613          	add	a2,a2,1216 # 2ef8 <__clone+0x24e>
    1a40:	85a2                	mv	a1,s0
    1a42:	00001517          	auipc	a0,0x1
    1a46:	29650513          	add	a0,a0,662 # 2cd8 <__clone+0x2e>
    1a4a:	6aa000ef          	jal	20f4 <printf>
  exit(1);
    1a4e:	4505                	li	a0,1
    1a50:	072010ef          	jal	2ac2 <exit>
}
    1a54:	bead                	j	15ce <mmap_test+0x39a>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1a56:	6080                	ld	s0,0(s1)
    1a58:	024010ef          	jal	2a7c <getpid>
    1a5c:	86aa                	mv	a3,a0
    1a5e:	00001617          	auipc	a2,0x1
    1a62:	34260613          	add	a2,a2,834 # 2da0 <__clone+0xf6>
    1a66:	85a2                	mv	a1,s0
    1a68:	00001517          	auipc	a0,0x1
    1a6c:	27050513          	add	a0,a0,624 # 2cd8 <__clone+0x2e>
    1a70:	684000ef          	jal	20f4 <printf>
  exit(1);
    1a74:	4505                	li	a0,1
    1a76:	04c010ef          	jal	2ac2 <exit>
  _v1(p);
    1a7a:	8562                	mv	a0,s8
    1a7c:	dc0ff0ef          	jal	103c <_v1>
  for (i = 0; i < PGSIZE * 2; i++)
    1a80:	418006bb          	negw	a3,s8
    1a84:	0076f793          	and	a5,a3,7
    1a88:	a4079be3          	bnez	a5,14de <mmap_test+0x2aa>
  _v1(p);
    1a8c:	6589                	lui	a1,0x2
  for (i = 0; i < PGSIZE * 2; i++)
    1a8e:	4601                	li	a2,0
    1a90:	bc69                	j	152a <mmap_test+0x2f6>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1a92:	0004b983          	ld	s3,0(s1)
    1a96:	7e7000ef          	jal	2a7c <getpid>
    1a9a:	86aa                	mv	a3,a0
    1a9c:	00001617          	auipc	a2,0x1
    1aa0:	2e460613          	add	a2,a2,740 # 2d80 <__clone+0xd6>
    1aa4:	85ce                	mv	a1,s3
    1aa6:	00001517          	auipc	a0,0x1
    1aaa:	23250513          	add	a0,a0,562 # 2cd8 <__clone+0x2e>
    1aae:	646000ef          	jal	20f4 <printf>
  exit(1);
    1ab2:	4505                	li	a0,1
    1ab4:	00e010ef          	jal	2ac2 <exit>
}
    1ab8:	bacd                	j	14aa <mmap_test+0x276>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1aba:	6080                	ld	s0,0(s1)
    1abc:	7c1000ef          	jal	2a7c <getpid>
    1ac0:	86aa                	mv	a3,a0
    1ac2:	00001617          	auipc	a2,0x1
    1ac6:	2de60613          	add	a2,a2,734 # 2da0 <__clone+0xf6>
    1aca:	85a2                	mv	a1,s0
    1acc:	00001517          	auipc	a0,0x1
    1ad0:	20c50513          	add	a0,a0,524 # 2cd8 <__clone+0x2e>
    1ad4:	620000ef          	jal	20f4 <printf>
  exit(1);
    1ad8:	4505                	li	a0,1
    1ada:	7e9000ef          	jal	2ac2 <exit>
}
    1ade:	ba79                	j	147c <mmap_test+0x248>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1ae0:	0004b983          	ld	s3,0(s1)
    1ae4:	799000ef          	jal	2a7c <getpid>
    1ae8:	86aa                	mv	a3,a0
    1aea:	00001617          	auipc	a2,0x1
    1aee:	29660613          	add	a2,a2,662 # 2d80 <__clone+0xd6>
    1af2:	85ce                	mv	a1,s3
    1af4:	00001517          	auipc	a0,0x1
    1af8:	1e450513          	add	a0,a0,484 # 2cd8 <__clone+0x2e>
    1afc:	5f8000ef          	jal	20f4 <printf>
  exit(1);
    1b00:	4505                	li	a0,1
    1b02:	7c1000ef          	jal	2ac2 <exit>
}
    1b06:	92fff06f          	j	1434 <mmap_test+0x200>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1b0a:	6080                	ld	s0,0(s1)
    1b0c:	771000ef          	jal	2a7c <getpid>
    1b10:	86aa                	mv	a3,a0
    1b12:	00001617          	auipc	a2,0x1
    1b16:	33e60613          	add	a2,a2,830 # 2e50 <__clone+0x1a6>
    1b1a:	85a2                	mv	a1,s0
    1b1c:	00001517          	auipc	a0,0x1
    1b20:	1bc50513          	add	a0,a0,444 # 2cd8 <__clone+0x2e>
    1b24:	5d0000ef          	jal	20f4 <printf>
  exit(1);
    1b28:	4505                	li	a0,1
    1b2a:	799000ef          	jal	2ac2 <exit>
}
    1b2e:	8d9ff06f          	j	1406 <mmap_test+0x1d2>
  for (i = 0; i < PGSIZE * 2; i++)
    1b32:	6589                	lui	a1,0x2
    1b34:	15f1                	add	a1,a1,-4 # 1ffc <printint.constprop.0+0x148>
    1b36:	4611                	li	a2,4
    1b38:	823ff06f          	j	135a <mmap_test+0x126>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1b3c:	0004ba83          	ld	s5,0(s1)
    1b40:	73d000ef          	jal	2a7c <getpid>
    1b44:	86aa                	mv	a3,a0
    1b46:	00001617          	auipc	a2,0x1
    1b4a:	51a60613          	add	a2,a2,1306 # 3060 <__clone+0x3b6>
    1b4e:	85d6                	mv	a1,s5
    1b50:	00001517          	auipc	a0,0x1
    1b54:	18850513          	add	a0,a0,392 # 2cd8 <__clone+0x2e>
    1b58:	59c000ef          	jal	20f4 <printf>
  exit(1);
    1b5c:	4505                	li	a0,1
    1b5e:	765000ef          	jal	2ac2 <exit>
}
    1b62:	b9a9                	j	17bc <mmap_test+0x588>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1b64:	6080                	ld	s0,0(s1)
    1b66:	717000ef          	jal	2a7c <getpid>
    1b6a:	86aa                	mv	a3,a0
    1b6c:	00001617          	auipc	a2,0x1
    1b70:	4b460613          	add	a2,a2,1204 # 3020 <__clone+0x376>
    1b74:	85a2                	mv	a1,s0
    1b76:	00001517          	auipc	a0,0x1
    1b7a:	16250513          	add	a0,a0,354 # 2cd8 <__clone+0x2e>
    1b7e:	576000ef          	jal	20f4 <printf>
  exit(1);
    1b82:	4505                	li	a0,1
    1b84:	73f000ef          	jal	2ac2 <exit>
}
    1b88:	be55                	j	173c <mmap_test+0x508>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1b8a:	0004b983          	ld	s3,0(s1)
    1b8e:	6ef000ef          	jal	2a7c <getpid>
    1b92:	86aa                	mv	a3,a0
    1b94:	00001617          	auipc	a2,0x1
    1b98:	35460613          	add	a2,a2,852 # 2ee8 <__clone+0x23e>
    1b9c:	85ce                	mv	a1,s3
    1b9e:	00001517          	auipc	a0,0x1
    1ba2:	13a50513          	add	a0,a0,314 # 2cd8 <__clone+0x2e>
    1ba6:	54e000ef          	jal	20f4 <printf>
  exit(1);
    1baa:	4505                	li	a0,1
    1bac:	717000ef          	jal	2ac2 <exit>
  if (close(fd) == -1)
    1bb0:	8522                	mv	a0,s0
    1bb2:	6ab000ef          	jal	2a5c <close>
    1bb6:	eaac00e3          	beq	s8,a0,1a56 <mmap_test+0x822>
  _v1(p);
    1bba:	557d                	li	a0,-1
    1bbc:	c80ff0ef          	jal	103c <_v1>
    p[i] = 'Z';
    1bc0:	05a00793          	li	a5,90
    1bc4:	00fc0023          	sb	a5,0(s8)
    1bc8:	4785                	li	a5,1
  for (i = 0; i < PGSIZE * 2; i++)
    1bca:	6709                	lui	a4,0x2
    1bcc:	fff70593          	add	a1,a4,-1 # 1fff <printint.constprop.0+0x14b>
    1bd0:	4605                	li	a2,1
    1bd2:	959ff06f          	j	152a <mmap_test+0x2f6>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1bd6:	0004b983          	ld	s3,0(s1)
    1bda:	6a3000ef          	jal	2a7c <getpid>
    1bde:	86aa                	mv	a3,a0
    1be0:	00001617          	auipc	a2,0x1
    1be4:	26060613          	add	a2,a2,608 # 2e40 <__clone+0x196>
    1be8:	85ce                	mv	a1,s3
    1bea:	00001517          	auipc	a0,0x1
    1bee:	0ee50513          	add	a0,a0,238 # 2cd8 <__clone+0x2e>
    1bf2:	502000ef          	jal	20f4 <printf>
  exit(1);
    1bf6:	4505                	li	a0,1
    1bf8:	6cb000ef          	jal	2ac2 <exit>
  if (close(fd) == -1)
    1bfc:	854a                	mv	a0,s2
    1bfe:	65f000ef          	jal	2a5c <close>
    1c02:	dea407e3          	beq	s0,a0,19f0 <mmap_test+0x7bc>
  _v1(p);
    1c06:	557d                	li	a0,-1
    1c08:	c34ff0ef          	jal	103c <_v1>
    p[i] = 'Z';
    1c0c:	05a00793          	li	a5,90
    1c10:	00f40023          	sb	a5,0(s0)
    1c14:	4785                	li	a5,1
  for (i = 0; i < PGSIZE * 2; i++)
    1c16:	6709                	lui	a4,0x2
    1c18:	fff70593          	add	a1,a4,-1 # 1fff <printint.constprop.0+0x14b>
    1c1c:	4605                	li	a2,1
    1c1e:	f3cff06f          	j	135a <mmap_test+0x126>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1c22:	0004b983          	ld	s3,0(s1)
    1c26:	657000ef          	jal	2a7c <getpid>
    1c2a:	86aa                	mv	a3,a0
    1c2c:	00001617          	auipc	a2,0x1
    1c30:	1c460613          	add	a2,a2,452 # 2df0 <__clone+0x146>
    1c34:	85ce                	mv	a1,s3
    1c36:	00001517          	auipc	a0,0x1
    1c3a:	0a250513          	add	a0,a0,162 # 2cd8 <__clone+0x2e>
    1c3e:	4b6000ef          	jal	20f4 <printf>
  exit(1);
    1c42:	4505                	li	a0,1
    1c44:	67f000ef          	jal	2ac2 <exit>
}
    1c48:	e66ff06f          	j	12ae <mmap_test+0x7a>
  for (i = 0; i < PGSIZE * 2; i++)
    1c4c:	6589                	lui	a1,0x2
    1c4e:	15f9                	add	a1,a1,-2 # 1ffe <printint.constprop.0+0x14a>
    1c50:	4609                	li	a2,2
    1c52:	8d9ff06f          	j	152a <mmap_test+0x2f6>
  for (i = 0; i < PGSIZE * 2; i++)
    1c56:	6589                	lui	a1,0x2
    1c58:	15f9                	add	a1,a1,-2 # 1ffe <printint.constprop.0+0x14a>
    1c5a:	4609                	li	a2,2
    1c5c:	efeff06f          	j	135a <mmap_test+0x126>
    1c60:	6589                	lui	a1,0x2
    1c62:	15f5                	add	a1,a1,-3 # 1ffd <printint.constprop.0+0x149>
    1c64:	460d                	li	a2,3
    1c66:	ef4ff06f          	j	135a <mmap_test+0x126>
  for (i = 0; i < PGSIZE * 2; i++)
    1c6a:	6589                	lui	a1,0x2
    1c6c:	15f5                	add	a1,a1,-3 # 1ffd <printint.constprop.0+0x149>
    1c6e:	460d                	li	a2,3
    1c70:	8bbff06f          	j	152a <mmap_test+0x2f6>
    1c74:	6589                	lui	a1,0x2
    1c76:	15f1                	add	a1,a1,-4 # 1ffc <printint.constprop.0+0x148>
    1c78:	4611                	li	a2,4
    1c7a:	8b1ff06f          	j	152a <mmap_test+0x2f6>
  for (i = 0; i < PGSIZE * 2; i++)
    1c7e:	6589                	lui	a1,0x2
    1c80:	15ed                	add	a1,a1,-5 # 1ffb <printint.constprop.0+0x147>
    1c82:	4615                	li	a2,5
    1c84:	ed6ff06f          	j	135a <mmap_test+0x126>
  for (i = 0; i < PGSIZE * 2; i++)
    1c88:	6589                	lui	a1,0x2
    1c8a:	15ed                	add	a1,a1,-5 # 1ffb <printint.constprop.0+0x147>
    1c8c:	4615                	li	a2,5
    1c8e:	89dff06f          	j	152a <mmap_test+0x2f6>
    p[i] = 'Z';
    1c92:	4799                	li	a5,6
  for (i = 0; i < PGSIZE * 2; i++)
    1c94:	15e9                	add	a1,a1,-6
    1c96:	4619                	li	a2,6
    1c98:	ec2ff06f          	j	135a <mmap_test+0x126>
    p[i] = 'Z';
    1c9c:	4799                	li	a5,6
  for (i = 0; i < PGSIZE * 2; i++)
    1c9e:	15e9                	add	a1,a1,-6
    1ca0:	4619                	li	a2,6
    1ca2:	889ff06f          	j	152a <mmap_test+0x2f6>

0000000000001ca6 <fork_test>:

//
// mmap a file, then fork.
// check that the child sees the mapped file.
//
void fork_test(void) {
    1ca6:	7139                	add	sp,sp,-64
  int fd;
  int pid;
  const char *const f = "mmap.dur";

  printf("fork_test starting\n");
    1ca8:	00001517          	auipc	a0,0x1
    1cac:	43850513          	add	a0,a0,1080 # 30e0 <__clone+0x436>
void fork_test(void) {
    1cb0:	fc06                	sd	ra,56(sp)
    1cb2:	f426                	sd	s1,40(sp)
    1cb4:	f04a                	sd	s2,32(sp)
    1cb6:	f822                	sd	s0,48(sp)
  printf("fork_test starting\n");
    1cb8:	43c000ef          	jal	20f4 <printf>
  testname = "fork_test";
    1cbc:	00001797          	auipc	a5,0x1
    1cc0:	43c78793          	add	a5,a5,1084 # 30f8 <__clone+0x44e>

  // mmap the file twice.
  makefile(f);
    1cc4:	00001517          	auipc	a0,0x1
    1cc8:	10c50513          	add	a0,a0,268 # 2dd0 <__clone+0x126>
  testname = "fork_test";
    1ccc:	00002917          	auipc	s2,0x2
    1cd0:	8f490913          	add	s2,s2,-1804 # 35c0 <testname>
    1cd4:	00f93023          	sd	a5,0(s2)
  makefile(f);
    1cd8:	c42ff0ef          	jal	111a <makefile>
  if ((fd = open(f, O_RDONLY)) == -1)
    1cdc:	4581                	li	a1,0
    1cde:	00001517          	auipc	a0,0x1
    1ce2:	0f250513          	add	a0,a0,242 # 2dd0 <__clone+0x126>
    1ce6:	545000ef          	jal	2a2a <open>
    1cea:	57fd                	li	a5,-1
    1cec:	84aa                	mv	s1,a0
    1cee:	10f50363          	beq	a0,a5,1df4 <fork_test+0x14e>
    err("open");
  char *p1 = mmap(0, PGSIZE * 2, PROT_READ, MAP_SHARED, fd, 0);
    1cf2:	4781                	li	a5,0
    1cf4:	8726                	mv	a4,s1
    1cf6:	4685                	li	a3,1
    1cf8:	4605                	li	a2,1
    1cfa:	6589                	lui	a1,0x2
    1cfc:	4501                	li	a0,0
    1cfe:	673000ef          	jal	2b70 <mmap>
  if (p1 == MAP_FAILED)
    1d02:	57fd                	li	a5,-1
  char *p1 = mmap(0, PGSIZE * 2, PROT_READ, MAP_SHARED, fd, 0);
    1d04:	842a                	mv	s0,a0
  if (p1 == MAP_FAILED)
    1d06:	14f50163          	beq	a0,a5,1e48 <fork_test+0x1a2>
    err("mmap (4)");
  char *p2 = mmap(0, PGSIZE * 2, PROT_READ, MAP_SHARED, fd, 0);
    1d0a:	4781                	li	a5,0
    1d0c:	8726                	mv	a4,s1
    1d0e:	4685                	li	a3,1
    1d10:	4605                	li	a2,1
    1d12:	6589                	lui	a1,0x2
    1d14:	4501                	li	a0,0
    1d16:	65b000ef          	jal	2b70 <mmap>
  if (p2 == MAP_FAILED)
    1d1a:	57fd                	li	a5,-1
  char *p2 = mmap(0, PGSIZE * 2, PROT_READ, MAP_SHARED, fd, 0);
    1d1c:	84aa                	mv	s1,a0
  if (p2 == MAP_FAILED)
    1d1e:	0ef50f63          	beq	a0,a5,1e1c <fork_test+0x176>
    err("mmap (5)");

  // read just 2nd page.
  if (*(p1 + PGSIZE) != 'A')
    1d22:	6785                	lui	a5,0x1
    1d24:	97a2                	add	a5,a5,s0
    1d26:	0007c703          	lbu	a4,0(a5) # 1000 <_start>
    1d2a:	04100793          	li	a5,65
    1d2e:	02f70763          	beq	a4,a5,1d5c <fork_test+0xb6>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1d32:	ec4e                	sd	s3,24(sp)
    1d34:	00093983          	ld	s3,0(s2)
    1d38:	545000ef          	jal	2a7c <getpid>
    1d3c:	86aa                	mv	a3,a0
    1d3e:	85ce                	mv	a1,s3
    1d40:	00001617          	auipc	a2,0x1
    1d44:	3e860613          	add	a2,a2,1000 # 3128 <__clone+0x47e>
    1d48:	00001517          	auipc	a0,0x1
    1d4c:	f9050513          	add	a0,a0,-112 # 2cd8 <__clone+0x2e>
    1d50:	3a4000ef          	jal	20f4 <printf>
  exit(1);
    1d54:	4505                	li	a0,1
    1d56:	56d000ef          	jal	2ac2 <exit>
    1d5a:	69e2                	ld	s3,24(sp)
    err("fork mismatch (1)");

  if ((pid = fork()) < 0)
    1d5c:	545000ef          	jal	2aa0 <fork>
    1d60:	06054663          	bltz	a0,1dcc <fork_test+0x126>
    err("fork");
  if (pid == 0) {
    1d64:	e919                	bnez	a0,1d7a <fork_test+0xd4>
    _v1(p1);
    1d66:	8522                	mv	a0,s0
    1d68:	ad4ff0ef          	jal	103c <_v1>
    munmap(p1, PGSIZE); // just the first page
    1d6c:	6585                	lui	a1,0x1
    1d6e:	8522                	mv	a0,s0
    1d70:	60b000ef          	jal	2b7a <munmap>
    exit(0);            // tell the parent that the mapping looks OK.
    1d74:	4501                	li	a0,0
    1d76:	54d000ef          	jal	2ac2 <exit>
  }

  int status = -1;
    1d7a:	57fd                	li	a5,-1
  wait(&status);
    1d7c:	0068                	add	a0,sp,12
  int status = -1;
    1d7e:	c63e                	sw	a5,12(sp)
  wait(&status);
    1d80:	607000ef          	jal	2b86 <wait>

  if (status != 0) {
    1d84:	47b2                	lw	a5,12(sp)
    1d86:	eb8d                	bnez	a5,1db8 <fork_test+0x112>
    printf("fork_test failed\n");
    exit(1);
  }

  // check that the parent's mappings are still there.
  _v1(p1);
    1d88:	8522                	mv	a0,s0
    1d8a:	ab2ff0ef          	jal	103c <_v1>
  _v1(p2);
    1d8e:	8526                	mv	a0,s1
    1d90:	aacff0ef          	jal	103c <_v1>
  unlink(f);
    1d94:	00001517          	auipc	a0,0x1
    1d98:	03c50513          	add	a0,a0,60 # 2dd0 <__clone+0x126>
    1d9c:	66b000ef          	jal	2c06 <unlink>

  printf("fork_test OK\n");
    1da0:	00001517          	auipc	a0,0x1
    1da4:	3c050513          	add	a0,a0,960 # 3160 <__clone+0x4b6>
    1da8:	34c000ef          	jal	20f4 <printf>
}
    1dac:	70e2                	ld	ra,56(sp)
    1dae:	7442                	ld	s0,48(sp)
    1db0:	74a2                	ld	s1,40(sp)
    1db2:	7902                	ld	s2,32(sp)
    1db4:	6121                	add	sp,sp,64
    1db6:	8082                	ret
    printf("fork_test failed\n");
    1db8:	00001517          	auipc	a0,0x1
    1dbc:	39050513          	add	a0,a0,912 # 3148 <__clone+0x49e>
    1dc0:	334000ef          	jal	20f4 <printf>
    exit(1);
    1dc4:	4505                	li	a0,1
    1dc6:	4fd000ef          	jal	2ac2 <exit>
    1dca:	bf7d                	j	1d88 <fork_test+0xe2>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1dcc:	00093903          	ld	s2,0(s2)
    1dd0:	4ad000ef          	jal	2a7c <getpid>
    1dd4:	86aa                	mv	a3,a0
    1dd6:	00001617          	auipc	a2,0x1
    1dda:	36a60613          	add	a2,a2,874 # 3140 <__clone+0x496>
    1dde:	85ca                	mv	a1,s2
    1de0:	00001517          	auipc	a0,0x1
    1de4:	ef850513          	add	a0,a0,-264 # 2cd8 <__clone+0x2e>
    1de8:	30c000ef          	jal	20f4 <printf>
  exit(1);
    1dec:	4505                	li	a0,1
    1dee:	4d5000ef          	jal	2ac2 <exit>
  if (pid == 0) {
    1df2:	b761                	j	1d7a <fork_test+0xd4>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1df4:	00093403          	ld	s0,0(s2)
    1df8:	485000ef          	jal	2a7c <getpid>
    1dfc:	86aa                	mv	a3,a0
    1dfe:	00001617          	auipc	a2,0x1
    1e02:	f8260613          	add	a2,a2,-126 # 2d80 <__clone+0xd6>
    1e06:	85a2                	mv	a1,s0
    1e08:	00001517          	auipc	a0,0x1
    1e0c:	ed050513          	add	a0,a0,-304 # 2cd8 <__clone+0x2e>
    1e10:	2e4000ef          	jal	20f4 <printf>
  exit(1);
    1e14:	4505                	li	a0,1
    1e16:	4ad000ef          	jal	2ac2 <exit>
}
    1e1a:	bde1                	j	1cf2 <fork_test+0x4c>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1e1c:	ec4e                	sd	s3,24(sp)
    1e1e:	00093983          	ld	s3,0(s2)
    1e22:	45b000ef          	jal	2a7c <getpid>
    1e26:	86aa                	mv	a3,a0
    1e28:	85ce                	mv	a1,s3
    1e2a:	00001617          	auipc	a2,0x1
    1e2e:	2ee60613          	add	a2,a2,750 # 3118 <__clone+0x46e>
    1e32:	00001517          	auipc	a0,0x1
    1e36:	ea650513          	add	a0,a0,-346 # 2cd8 <__clone+0x2e>
    1e3a:	2ba000ef          	jal	20f4 <printf>
  exit(1);
    1e3e:	4505                	li	a0,1
    1e40:	483000ef          	jal	2ac2 <exit>
    1e44:	69e2                	ld	s3,24(sp)
}
    1e46:	bdf1                	j	1d22 <fork_test+0x7c>
  printf("mmaptest: %s failed: %s, pid=%d\n", testname, why, getpid());
    1e48:	ec4e                	sd	s3,24(sp)
    1e4a:	00093983          	ld	s3,0(s2)
    1e4e:	42f000ef          	jal	2a7c <getpid>
    1e52:	86aa                	mv	a3,a0
    1e54:	85ce                	mv	a1,s3
    1e56:	00001617          	auipc	a2,0x1
    1e5a:	2b260613          	add	a2,a2,690 # 3108 <__clone+0x45e>
    1e5e:	00001517          	auipc	a0,0x1
    1e62:	e7a50513          	add	a0,a0,-390 # 2cd8 <__clone+0x2e>
    1e66:	28e000ef          	jal	20f4 <printf>
  exit(1);
    1e6a:	4505                	li	a0,1
    1e6c:	457000ef          	jal	2ac2 <exit>
    1e70:	69e2                	ld	s3,24(sp)
}
    1e72:	bd61                	j	1d0a <fork_test+0x64>

0000000000001e74 <main>:
int main(int argc, char *argv[]) {
    1e74:	1141                	add	sp,sp,-16
    1e76:	e406                	sd	ra,8(sp)
  mmap_test();
    1e78:	bbcff0ef          	jal	1234 <mmap_test>
  fork_test();
    1e7c:	e2bff0ef          	jal	1ca6 <fork_test>
  printf("mmaptest: all tests succeeded\n");
    1e80:	00001517          	auipc	a0,0x1
    1e84:	2f050513          	add	a0,a0,752 # 3170 <__clone+0x4c6>
    1e88:	26c000ef          	jal	20f4 <printf>
  exit(0);
    1e8c:	4501                	li	a0,0
    1e8e:	435000ef          	jal	2ac2 <exit>
}
    1e92:	60a2                	ld	ra,8(sp)
    1e94:	4501                	li	a0,0
    1e96:	0141                	add	sp,sp,16
    1e98:	8082                	ret

0000000000001e9a <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1e9a:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1e9c:	4108                	lw	a0,0(a0)
{
    1e9e:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    1ea0:	05a1                	add	a1,a1,8 # 1008 <err+0x2>
{
    1ea2:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1ea4:	fd1ff0ef          	jal	1e74 <main>
    1ea8:	41b000ef          	jal	2ac2 <exit>
	return 0;
}
    1eac:	60a2                	ld	ra,8(sp)
    1eae:	4501                	li	a0,0
    1eb0:	0141                	add	sp,sp,16
    1eb2:	8082                	ret

0000000000001eb4 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1eb4:	7179                	add	sp,sp,-48
    1eb6:	f406                	sd	ra,40(sp)
    1eb8:	0005081b          	sext.w	a6,a0
    1ebc:	4881                	li	a7,0
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1ebe:	00055563          	bgez	a0,1ec8 <printint.constprop.0+0x14>
        x = -xx;
    1ec2:	40a0083b          	negw	a6,a0
    if (sign && (sign = xx < 0))
    1ec6:	4885                	li	a7,1

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1ec8:	02b8763b          	remuw	a2,a6,a1
    1ecc:	00001697          	auipc	a3,0x1
    1ed0:	6dc68693          	add	a3,a3,1756 # 35a8 <digits>
    buf[16] = 0;
    1ed4:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1ed8:	0005871b          	sext.w	a4,a1
    1edc:	1602                	sll	a2,a2,0x20
    1ede:	9201                	srl	a2,a2,0x20
    1ee0:	9636                	add	a2,a2,a3
    1ee2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1ee6:	02b8553b          	divuw	a0,a6,a1
        buf[i--] = digits[x % base];
    1eea:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1eee:	10b86c63          	bltu	a6,a1,2006 <printint.constprop.0+0x152>
        buf[i--] = digits[x % base];
    1ef2:	02e5763b          	remuw	a2,a0,a4
    1ef6:	1602                	sll	a2,a2,0x20
    1ef8:	9201                	srl	a2,a2,0x20
    1efa:	9636                	add	a2,a2,a3
    1efc:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1f00:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1f04:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1f08:	10e56863          	bltu	a0,a4,2018 <printint.constprop.0+0x164>
        buf[i--] = digits[x % base];
    1f0c:	02e5f63b          	remuw	a2,a1,a4
    1f10:	1602                	sll	a2,a2,0x20
    1f12:	9201                	srl	a2,a2,0x20
    1f14:	9636                	add	a2,a2,a3
    1f16:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1f1a:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1f1e:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1f22:	10e5e463          	bltu	a1,a4,202a <printint.constprop.0+0x176>
        buf[i--] = digits[x % base];
    1f26:	02e5763b          	remuw	a2,a0,a4
    1f2a:	1602                	sll	a2,a2,0x20
    1f2c:	9201                	srl	a2,a2,0x20
    1f2e:	9636                	add	a2,a2,a3
    1f30:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1f34:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1f38:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1f3c:	10e56063          	bltu	a0,a4,203c <printint.constprop.0+0x188>
        buf[i--] = digits[x % base];
    1f40:	02e5f63b          	remuw	a2,a1,a4
    1f44:	1602                	sll	a2,a2,0x20
    1f46:	9201                	srl	a2,a2,0x20
    1f48:	9636                	add	a2,a2,a3
    1f4a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1f4e:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1f52:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1f56:	0ee5ec63          	bltu	a1,a4,204e <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    1f5a:	02e5763b          	remuw	a2,a0,a4
    1f5e:	1602                	sll	a2,a2,0x20
    1f60:	9201                	srl	a2,a2,0x20
    1f62:	9636                	add	a2,a2,a3
    1f64:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1f68:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1f6c:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1f70:	08e56263          	bltu	a0,a4,1ff4 <printint.constprop.0+0x140>
        buf[i--] = digits[x % base];
    1f74:	02e5f63b          	remuw	a2,a1,a4
    1f78:	1602                	sll	a2,a2,0x20
    1f7a:	9201                	srl	a2,a2,0x20
    1f7c:	9636                	add	a2,a2,a3
    1f7e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1f82:	02e5d53b          	divuw	a0,a1,a4
        buf[i--] = digits[x % base];
    1f86:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1f8a:	0ce5eb63          	bltu	a1,a4,2060 <printint.constprop.0+0x1ac>
        buf[i--] = digits[x % base];
    1f8e:	02e5763b          	remuw	a2,a0,a4
    1f92:	1602                	sll	a2,a2,0x20
    1f94:	9201                	srl	a2,a2,0x20
    1f96:	9636                	add	a2,a2,a3
    1f98:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1f9c:	02e555bb          	divuw	a1,a0,a4
        buf[i--] = digits[x % base];
    1fa0:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1fa4:	0ce56763          	bltu	a0,a4,2072 <printint.constprop.0+0x1be>
        buf[i--] = digits[x % base];
    1fa8:	02e5f63b          	remuw	a2,a1,a4
    1fac:	1602                	sll	a2,a2,0x20
    1fae:	9201                	srl	a2,a2,0x20
    1fb0:	9636                	add	a2,a2,a3
    1fb2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1fb6:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1fba:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    1fbe:	0ce5e363          	bltu	a1,a4,2084 <printint.constprop.0+0x1d0>
        buf[i--] = digits[x % base];
    1fc2:	1782                	sll	a5,a5,0x20
    1fc4:	9381                	srl	a5,a5,0x20
    1fc6:	96be                	add	a3,a3,a5
    1fc8:	0006c783          	lbu	a5,0(a3)

    if (sign)
        buf[i--] = '-';
    i++;
    1fcc:	4599                	li	a1,6
        buf[i--] = digits[x % base];
    1fce:	00f10723          	sb	a5,14(sp)
    if (sign)
    1fd2:	00088763          	beqz	a7,1fe0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1fd6:	02d00793          	li	a5,45
    1fda:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1fde:	4595                	li	a1,5
    write(f, s, l);
    1fe0:	003c                	add	a5,sp,8
    1fe2:	4641                	li	a2,16
    1fe4:	9e0d                	subw	a2,a2,a1
    1fe6:	4505                	li	a0,1
    1fe8:	95be                	add	a1,a1,a5
    1fea:	289000ef          	jal	2a72 <write>
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1fee:	70a2                	ld	ra,40(sp)
    1ff0:	6145                	add	sp,sp,48
    1ff2:	8082                	ret
    i++;
    1ff4:	45a9                	li	a1,10
    if (sign)
    1ff6:	fe0885e3          	beqz	a7,1fe0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1ffa:	02d00793          	li	a5,45
    1ffe:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    2002:	45a5                	li	a1,9
    2004:	bff1                	j	1fe0 <printint.constprop.0+0x12c>
    i++;
    2006:	45bd                	li	a1,15
    if (sign)
    2008:	fc088ce3          	beqz	a7,1fe0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    200c:	02d00793          	li	a5,45
    2010:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    2014:	45b9                	li	a1,14
    2016:	b7e9                	j	1fe0 <printint.constprop.0+0x12c>
    i++;
    2018:	45b9                	li	a1,14
    if (sign)
    201a:	fc0883e3          	beqz	a7,1fe0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    201e:	02d00793          	li	a5,45
    2022:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    2026:	45b5                	li	a1,13
    2028:	bf65                	j	1fe0 <printint.constprop.0+0x12c>
    i++;
    202a:	45b5                	li	a1,13
    if (sign)
    202c:	fa088ae3          	beqz	a7,1fe0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    2030:	02d00793          	li	a5,45
    2034:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    2038:	45b1                	li	a1,12
    203a:	b75d                	j	1fe0 <printint.constprop.0+0x12c>
    i++;
    203c:	45b1                	li	a1,12
    if (sign)
    203e:	fa0881e3          	beqz	a7,1fe0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    2042:	02d00793          	li	a5,45
    2046:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    204a:	45ad                	li	a1,11
    204c:	bf51                	j	1fe0 <printint.constprop.0+0x12c>
    i++;
    204e:	45ad                	li	a1,11
    if (sign)
    2050:	f80888e3          	beqz	a7,1fe0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    2054:	02d00793          	li	a5,45
    2058:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    205c:	45a9                	li	a1,10
    205e:	b749                	j	1fe0 <printint.constprop.0+0x12c>
    i++;
    2060:	45a5                	li	a1,9
    if (sign)
    2062:	f6088fe3          	beqz	a7,1fe0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    2066:	02d00793          	li	a5,45
    206a:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    206e:	45a1                	li	a1,8
    2070:	bf85                	j	1fe0 <printint.constprop.0+0x12c>
    i++;
    2072:	45a1                	li	a1,8
    if (sign)
    2074:	f60886e3          	beqz	a7,1fe0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    2078:	02d00793          	li	a5,45
    207c:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    2080:	459d                	li	a1,7
    2082:	bfb9                	j	1fe0 <printint.constprop.0+0x12c>
    i++;
    2084:	459d                	li	a1,7
    if (sign)
    2086:	f4088de3          	beqz	a7,1fe0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    208a:	02d00793          	li	a5,45
    208e:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    2092:	4599                	li	a1,6
    2094:	b7b1                	j	1fe0 <printint.constprop.0+0x12c>

0000000000002096 <getchar>:
{
    2096:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    2098:	00f10593          	add	a1,sp,15
    209c:	4605                	li	a2,1
    209e:	4501                	li	a0,0
{
    20a0:	ec06                	sd	ra,24(sp)
    char byte = 0;
    20a2:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    20a6:	1c3000ef          	jal	2a68 <read>
}
    20aa:	60e2                	ld	ra,24(sp)
    20ac:	00f14503          	lbu	a0,15(sp)
    20b0:	6105                	add	sp,sp,32
    20b2:	8082                	ret

00000000000020b4 <putchar>:
{
    20b4:	1101                	add	sp,sp,-32
    20b6:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    20b8:	00f10593          	add	a1,sp,15
    20bc:	4605                	li	a2,1
    20be:	4505                	li	a0,1
{
    20c0:	ec06                	sd	ra,24(sp)
    char byte = c;
    20c2:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    20c6:	1ad000ef          	jal	2a72 <write>
}
    20ca:	60e2                	ld	ra,24(sp)
    20cc:	2501                	sext.w	a0,a0
    20ce:	6105                	add	sp,sp,32
    20d0:	8082                	ret

00000000000020d2 <puts>:
{
    20d2:	1141                	add	sp,sp,-16
    20d4:	e406                	sd	ra,8(sp)
    20d6:	e022                	sd	s0,0(sp)
    20d8:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    20da:	55a000ef          	jal	2634 <strlen>
    20de:	862a                	mv	a2,a0
    20e0:	85a2                	mv	a1,s0
    20e2:	4505                	li	a0,1
    20e4:	18f000ef          	jal	2a72 <write>
}
    20e8:	60a2                	ld	ra,8(sp)
    20ea:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    20ec:	957d                	sra	a0,a0,0x3f
    return r;
    20ee:	2501                	sext.w	a0,a0
}
    20f0:	0141                	add	sp,sp,16
    20f2:	8082                	ret

00000000000020f4 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    20f4:	7131                	add	sp,sp,-192
    20f6:	e4d6                	sd	s5,72(sp)
    20f8:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    20fa:	6aa1                	lui	s5,0x8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    20fc:	013c                	add	a5,sp,136
{
    20fe:	f0ca                	sd	s2,96(sp)
    2100:	ecce                	sd	s3,88(sp)
    2102:	e8d2                	sd	s4,80(sp)
    2104:	e0da                	sd	s6,64(sp)
    2106:	fc5e                	sd	s7,56(sp)
    2108:	fc86                	sd	ra,120(sp)
    210a:	f8a2                	sd	s0,112(sp)
    210c:	f4a6                	sd	s1,104(sp)
    210e:	e52e                	sd	a1,136(sp)
    2110:	e932                	sd	a2,144(sp)
    2112:	ed36                	sd	a3,152(sp)
    2114:	f13a                	sd	a4,160(sp)
    2116:	f942                	sd	a6,176(sp)
    2118:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    211a:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    211c:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    2120:	07300a13          	li	s4,115
    2124:	07800b93          	li	s7,120
    2128:	06400b13          	li	s6,100
    buf[i++] = '0';
    212c:	830a8a93          	add	s5,s5,-2000 # 7830 <testname+0x4270>
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    2130:	00001997          	auipc	s3,0x1
    2134:	47898993          	add	s3,s3,1144 # 35a8 <digits>
        if (!*s)
    2138:	00054783          	lbu	a5,0(a0)
    213c:	16078863          	beqz	a5,22ac <printf+0x1b8>
    2140:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    2142:	19278063          	beq	a5,s2,22c2 <printf+0x1ce>
    2146:	00164783          	lbu	a5,1(a2)
    214a:	0605                	add	a2,a2,1
    214c:	fbfd                	bnez	a5,2142 <printf+0x4e>
    214e:	84b2                	mv	s1,a2
        l = z - a;
    2150:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    2154:	85aa                	mv	a1,a0
    2156:	8622                	mv	a2,s0
    2158:	4505                	li	a0,1
    215a:	119000ef          	jal	2a72 <write>
        if (l)
    215e:	18041763          	bnez	s0,22ec <printf+0x1f8>
        if (s[1] == 0)
    2162:	0014c783          	lbu	a5,1(s1)
    2166:	14078363          	beqz	a5,22ac <printf+0x1b8>
        switch (s[1])
    216a:	19478f63          	beq	a5,s4,2308 <printf+0x214>
    216e:	18fa6163          	bltu	s4,a5,22f0 <printf+0x1fc>
    2172:	1b678e63          	beq	a5,s6,232e <printf+0x23a>
    2176:	07000713          	li	a4,112
    217a:	1ce79463          	bne	a5,a4,2342 <printf+0x24e>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    217e:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    2180:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    2184:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    2186:	631c                	ld	a5,0(a4)
    2188:	0721                	add	a4,a4,8
    218a:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    218c:	00479293          	sll	t0,a5,0x4
    2190:	00879f93          	sll	t6,a5,0x8
    2194:	00c79f13          	sll	t5,a5,0xc
    2198:	01079e93          	sll	t4,a5,0x10
    219c:	01479e13          	sll	t3,a5,0x14
    21a0:	01879313          	sll	t1,a5,0x18
    21a4:	01c79893          	sll	a7,a5,0x1c
    21a8:	02479813          	sll	a6,a5,0x24
    21ac:	02879513          	sll	a0,a5,0x28
    21b0:	02c79593          	sll	a1,a5,0x2c
    21b4:	03079693          	sll	a3,a5,0x30
    21b8:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    21bc:	03c7d413          	srl	s0,a5,0x3c
    21c0:	01c7d39b          	srlw	t2,a5,0x1c
    21c4:	03c2d293          	srl	t0,t0,0x3c
    21c8:	03cfdf93          	srl	t6,t6,0x3c
    21cc:	03cf5f13          	srl	t5,t5,0x3c
    21d0:	03cede93          	srl	t4,t4,0x3c
    21d4:	03ce5e13          	srl	t3,t3,0x3c
    21d8:	03c35313          	srl	t1,t1,0x3c
    21dc:	03c8d893          	srl	a7,a7,0x3c
    21e0:	03c85813          	srl	a6,a6,0x3c
    21e4:	9171                	srl	a0,a0,0x3c
    21e6:	91f1                	srl	a1,a1,0x3c
    21e8:	92f1                	srl	a3,a3,0x3c
    21ea:	9371                	srl	a4,a4,0x3c
    21ec:	974e                	add	a4,a4,s3
    21ee:	944e                	add	s0,s0,s3
    21f0:	92ce                	add	t0,t0,s3
    21f2:	9fce                	add	t6,t6,s3
    21f4:	9f4e                	add	t5,t5,s3
    21f6:	9ece                	add	t4,t4,s3
    21f8:	9e4e                	add	t3,t3,s3
    21fa:	934e                	add	t1,t1,s3
    21fc:	98ce                	add	a7,a7,s3
    21fe:	93ce                	add	t2,t2,s3
    2200:	984e                	add	a6,a6,s3
    2202:	954e                	add	a0,a0,s3
    2204:	95ce                	add	a1,a1,s3
    2206:	96ce                	add	a3,a3,s3
    2208:	00074083          	lbu	ra,0(a4)
    220c:	0002c283          	lbu	t0,0(t0)
    2210:	000fcf83          	lbu	t6,0(t6)
    2214:	000f4f03          	lbu	t5,0(t5)
    2218:	000ece83          	lbu	t4,0(t4)
    221c:	000e4e03          	lbu	t3,0(t3)
    2220:	00034303          	lbu	t1,0(t1)
    2224:	0008c883          	lbu	a7,0(a7)
    2228:	0003c383          	lbu	t2,0(t2)
    222c:	00084803          	lbu	a6,0(a6)
    2230:	00054503          	lbu	a0,0(a0)
    2234:	0005c583          	lbu	a1,0(a1)
    2238:	0006c683          	lbu	a3,0(a3)
    223c:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    2240:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    2244:	9371                	srl	a4,a4,0x3c
    2246:	8bbd                	and	a5,a5,15
    2248:	974e                	add	a4,a4,s3
    224a:	97ce                	add	a5,a5,s3
    224c:	005105a3          	sb	t0,11(sp)
    2250:	01f10623          	sb	t6,12(sp)
    2254:	01e106a3          	sb	t5,13(sp)
    2258:	01d10723          	sb	t4,14(sp)
    225c:	01c107a3          	sb	t3,15(sp)
    2260:	00610823          	sb	t1,16(sp)
    2264:	011108a3          	sb	a7,17(sp)
    2268:	00710923          	sb	t2,18(sp)
    226c:	010109a3          	sb	a6,19(sp)
    2270:	00a10a23          	sb	a0,20(sp)
    2274:	00b10aa3          	sb	a1,21(sp)
    2278:	00d10b23          	sb	a3,22(sp)
    227c:	00110ba3          	sb	ra,23(sp)
    2280:	00810523          	sb	s0,10(sp)
    2284:	00074703          	lbu	a4,0(a4)
    2288:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    228c:	002c                	add	a1,sp,8
    228e:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    2290:	00e10c23          	sb	a4,24(sp)
    2294:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    2298:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    229c:	7d6000ef          	jal	2a72 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    22a0:	00248513          	add	a0,s1,2
        if (!*s)
    22a4:	00054783          	lbu	a5,0(a0)
    22a8:	e8079ce3          	bnez	a5,2140 <printf+0x4c>
    }
    va_end(ap);
}
    22ac:	70e6                	ld	ra,120(sp)
    22ae:	7446                	ld	s0,112(sp)
    22b0:	74a6                	ld	s1,104(sp)
    22b2:	7906                	ld	s2,96(sp)
    22b4:	69e6                	ld	s3,88(sp)
    22b6:	6a46                	ld	s4,80(sp)
    22b8:	6aa6                	ld	s5,72(sp)
    22ba:	6b06                	ld	s6,64(sp)
    22bc:	7be2                	ld	s7,56(sp)
    22be:	6129                	add	sp,sp,192
    22c0:	8082                	ret
    22c2:	84b2                	mv	s1,a2
    22c4:	a039                	j	22d2 <printf+0x1de>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    22c6:	0024c783          	lbu	a5,2(s1)
    22ca:	0605                	add	a2,a2,1
    22cc:	0489                	add	s1,s1,2
    22ce:	e92791e3          	bne	a5,s2,2150 <printf+0x5c>
    22d2:	0014c783          	lbu	a5,1(s1)
    22d6:	ff2788e3          	beq	a5,s2,22c6 <printf+0x1d2>
        l = z - a;
    22da:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    22de:	85aa                	mv	a1,a0
    22e0:	8622                	mv	a2,s0
    22e2:	4505                	li	a0,1
    22e4:	78e000ef          	jal	2a72 <write>
        if (l)
    22e8:	e6040de3          	beqz	s0,2162 <printf+0x6e>
    22ec:	8526                	mv	a0,s1
    22ee:	b5a9                	j	2138 <printf+0x44>
        switch (s[1])
    22f0:	05779963          	bne	a5,s7,2342 <printf+0x24e>
            printint(va_arg(ap, int), 16, 1);
    22f4:	6782                	ld	a5,0(sp)
    22f6:	45c1                	li	a1,16
    22f8:	4388                	lw	a0,0(a5)
    22fa:	07a1                	add	a5,a5,8
    22fc:	e03e                	sd	a5,0(sp)
    22fe:	bb7ff0ef          	jal	1eb4 <printint.constprop.0>
        s += 2;
    2302:	00248513          	add	a0,s1,2
    2306:	bf79                	j	22a4 <printf+0x1b0>
            if ((a = va_arg(ap, char *)) == 0)
    2308:	6782                	ld	a5,0(sp)
    230a:	6380                	ld	s0,0(a5)
    230c:	07a1                	add	a5,a5,8
    230e:	e03e                	sd	a5,0(sp)
    2310:	cc21                	beqz	s0,2368 <printf+0x274>
            l = strnlen(a, 200);
    2312:	0c800593          	li	a1,200
    2316:	8522                	mv	a0,s0
    2318:	44e000ef          	jal	2766 <strnlen>
    write(f, s, l);
    231c:	0005061b          	sext.w	a2,a0
    2320:	85a2                	mv	a1,s0
    2322:	4505                	li	a0,1
    2324:	74e000ef          	jal	2a72 <write>
        s += 2;
    2328:	00248513          	add	a0,s1,2
    232c:	bfa5                	j	22a4 <printf+0x1b0>
            printint(va_arg(ap, int), 10, 1);
    232e:	6782                	ld	a5,0(sp)
    2330:	45a9                	li	a1,10
    2332:	4388                	lw	a0,0(a5)
    2334:	07a1                	add	a5,a5,8
    2336:	e03e                	sd	a5,0(sp)
    2338:	b7dff0ef          	jal	1eb4 <printint.constprop.0>
        s += 2;
    233c:	00248513          	add	a0,s1,2
    2340:	b795                	j	22a4 <printf+0x1b0>
    return write(stdout, &byte, 1);
    2342:	4605                	li	a2,1
    2344:	002c                	add	a1,sp,8
    2346:	4505                	li	a0,1
    char byte = c;
    2348:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    234c:	726000ef          	jal	2a72 <write>
    char byte = c;
    2350:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    2354:	4605                	li	a2,1
    2356:	002c                	add	a1,sp,8
    2358:	4505                	li	a0,1
    char byte = c;
    235a:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    235e:	714000ef          	jal	2a72 <write>
        s += 2;
    2362:	00248513          	add	a0,s1,2
    2366:	bf3d                	j	22a4 <printf+0x1b0>
                a = "(null)";
    2368:	00001417          	auipc	s0,0x1
    236c:	e3040413          	add	s0,s0,-464 # 3198 <__clone+0x4ee>
    2370:	b74d                	j	2312 <printf+0x21e>

0000000000002372 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    2372:	02000793          	li	a5,32
    2376:	00f50663          	beq	a0,a5,2382 <isspace+0x10>
    237a:	355d                	addw	a0,a0,-9
    237c:	00553513          	sltiu	a0,a0,5
    2380:	8082                	ret
    2382:	4505                	li	a0,1
}
    2384:	8082                	ret

0000000000002386 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    2386:	fd05051b          	addw	a0,a0,-48
}
    238a:	00a53513          	sltiu	a0,a0,10
    238e:	8082                	ret

0000000000002390 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    2390:	02000713          	li	a4,32
    2394:	4611                	li	a2,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    2396:	00054683          	lbu	a3,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    239a:	ff76879b          	addw	a5,a3,-9
    239e:	06e68063          	beq	a3,a4,23fe <atoi+0x6e>
    23a2:	0006859b          	sext.w	a1,a3
    23a6:	04f67c63          	bgeu	a2,a5,23fe <atoi+0x6e>
        s++;
    switch (*s)
    23aa:	02b00793          	li	a5,43
    23ae:	06f68563          	beq	a3,a5,2418 <atoi+0x88>
    23b2:	02d00793          	li	a5,45
    23b6:	04f69663          	bne	a3,a5,2402 <atoi+0x72>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    23ba:	00154683          	lbu	a3,1(a0)
    23be:	47a5                	li	a5,9
        s++;
    23c0:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    23c4:	fd06869b          	addw	a3,a3,-48
    23c8:	8636                	mv	a2,a3
    while (isdigit(*s))
    23ca:	04d7e563          	bltu	a5,a3,2414 <atoi+0x84>
        neg = 1;
    23ce:	4885                	li	a7,1
    int n = 0, neg = 0;
    23d0:	4501                	li	a0,0
    while (isdigit(*s))
    23d2:	4825                	li	a6,9
    23d4:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    23d8:	0025179b          	sllw	a5,a0,0x2
    23dc:	9fa9                	addw	a5,a5,a0
    23de:	0017979b          	sllw	a5,a5,0x1
    return (unsigned)c - '0' < 10;
    23e2:	fd06869b          	addw	a3,a3,-48
        n = 10 * n - (*s++ - '0');
    23e6:	85b2                	mv	a1,a2
    23e8:	40c7853b          	subw	a0,a5,a2
    23ec:	0705                	add	a4,a4,1
    return (unsigned)c - '0' < 10;
    23ee:	8636                	mv	a2,a3
    while (isdigit(*s))
    23f0:	fed872e3          	bgeu	a6,a3,23d4 <atoi+0x44>
    return neg ? n : -n;
    23f4:	02089163          	bnez	a7,2416 <atoi+0x86>
    23f8:	40f5853b          	subw	a0,a1,a5
    23fc:	8082                	ret
        s++;
    23fe:	0505                	add	a0,a0,1
    2400:	bf59                	j	2396 <atoi+0x6>
    while (isdigit(*s))
    2402:	fd05859b          	addw	a1,a1,-48
    2406:	47a5                	li	a5,9
    2408:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    240a:	4881                	li	a7,0
    240c:	fd06861b          	addw	a2,a3,-48
    while (isdigit(*s))
    2410:	fcb7f0e3          	bgeu	a5,a1,23d0 <atoi+0x40>
    return neg ? n : -n;
    2414:	4501                	li	a0,0
}
    2416:	8082                	ret
    while (isdigit(*s))
    2418:	00154683          	lbu	a3,1(a0)
    241c:	47a5                	li	a5,9
        s++;
    241e:	00150713          	add	a4,a0,1
    return (unsigned)c - '0' < 10;
    2422:	fd06869b          	addw	a3,a3,-48
    2426:	8636                	mv	a2,a3
    int n = 0, neg = 0;
    2428:	4881                	li	a7,0
    while (isdigit(*s))
    242a:	fad7f3e3          	bgeu	a5,a3,23d0 <atoi+0x40>
    return neg ? n : -n;
    242e:	4501                	li	a0,0
    2430:	8082                	ret

0000000000002432 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    2432:	16060f63          	beqz	a2,25b0 <memset+0x17e>
    2436:	40a006b3          	neg	a3,a0
    243a:	0076f793          	and	a5,a3,7
    243e:	00778813          	add	a6,a5,7
    2442:	48ad                	li	a7,11
    2444:	0ff5f713          	zext.b	a4,a1
    2448:	fff60593          	add	a1,a2,-1
    244c:	17186363          	bltu	a6,a7,25b2 <memset+0x180>
    2450:	1705eb63          	bltu	a1,a6,25c6 <memset+0x194>
    2454:	16078163          	beqz	a5,25b6 <memset+0x184>
    2458:	00e50023          	sb	a4,0(a0)
    245c:	0066f593          	and	a1,a3,6
    2460:	14058e63          	beqz	a1,25bc <memset+0x18a>
    2464:	00e500a3          	sb	a4,1(a0)
    2468:	4589                	li	a1,2
    246a:	00250813          	add	a6,a0,2
    246e:	04f5f663          	bgeu	a1,a5,24ba <memset+0x88>
    2472:	00e50123          	sb	a4,2(a0)
    2476:	8a91                	and	a3,a3,4
    2478:	00350813          	add	a6,a0,3
    247c:	458d                	li	a1,3
    247e:	ce95                	beqz	a3,24ba <memset+0x88>
    2480:	00e501a3          	sb	a4,3(a0)
    2484:	4691                	li	a3,4
    2486:	00450813          	add	a6,a0,4
    248a:	4591                	li	a1,4
    248c:	02f6f763          	bgeu	a3,a5,24ba <memset+0x88>
    2490:	00e50223          	sb	a4,4(a0)
    2494:	4695                	li	a3,5
    2496:	00550813          	add	a6,a0,5
    249a:	4595                	li	a1,5
    249c:	00d78f63          	beq	a5,a3,24ba <memset+0x88>
    24a0:	00e502a3          	sb	a4,5(a0)
    24a4:	469d                	li	a3,7
    24a6:	00650813          	add	a6,a0,6
    24aa:	4599                	li	a1,6
    24ac:	00d79763          	bne	a5,a3,24ba <memset+0x88>
    24b0:	00750813          	add	a6,a0,7
    24b4:	00e50323          	sb	a4,6(a0)
    24b8:	459d                	li	a1,7
    24ba:	00871693          	sll	a3,a4,0x8
    24be:	01071313          	sll	t1,a4,0x10
    24c2:	8ed9                	or	a3,a3,a4
    24c4:	01871893          	sll	a7,a4,0x18
    24c8:	0066e6b3          	or	a3,a3,t1
    24cc:	0116e6b3          	or	a3,a3,a7
    24d0:	02071313          	sll	t1,a4,0x20
    24d4:	02871893          	sll	a7,a4,0x28
    24d8:	0066e6b3          	or	a3,a3,t1
    24dc:	40f60e33          	sub	t3,a2,a5
    24e0:	03071313          	sll	t1,a4,0x30
    24e4:	0116e6b3          	or	a3,a3,a7
    24e8:	0066e6b3          	or	a3,a3,t1
    24ec:	03871893          	sll	a7,a4,0x38
    24f0:	97aa                	add	a5,a5,a0
    24f2:	ff8e7313          	and	t1,t3,-8
    24f6:	0116e6b3          	or	a3,a3,a7
    24fa:	00f308b3          	add	a7,t1,a5
    24fe:	e394                	sd	a3,0(a5)
    2500:	07a1                	add	a5,a5,8
    2502:	ff179ee3          	bne	a5,a7,24fe <memset+0xcc>
    2506:	006806b3          	add	a3,a6,t1
    250a:	00b307bb          	addw	a5,t1,a1
    250e:	0bc30b63          	beq	t1,t3,25c4 <memset+0x192>
    2512:	00e68023          	sb	a4,0(a3)
    2516:	0017859b          	addw	a1,a5,1
    251a:	08c5fb63          	bgeu	a1,a2,25b0 <memset+0x17e>
    251e:	00e680a3          	sb	a4,1(a3)
    2522:	0027859b          	addw	a1,a5,2
    2526:	08c5f563          	bgeu	a1,a2,25b0 <memset+0x17e>
    252a:	00e68123          	sb	a4,2(a3)
    252e:	0037859b          	addw	a1,a5,3
    2532:	06c5ff63          	bgeu	a1,a2,25b0 <memset+0x17e>
    2536:	00e681a3          	sb	a4,3(a3)
    253a:	0047859b          	addw	a1,a5,4
    253e:	06c5f963          	bgeu	a1,a2,25b0 <memset+0x17e>
    2542:	00e68223          	sb	a4,4(a3)
    2546:	0057859b          	addw	a1,a5,5
    254a:	06c5f363          	bgeu	a1,a2,25b0 <memset+0x17e>
    254e:	00e682a3          	sb	a4,5(a3)
    2552:	0067859b          	addw	a1,a5,6
    2556:	04c5fd63          	bgeu	a1,a2,25b0 <memset+0x17e>
    255a:	00e68323          	sb	a4,6(a3)
    255e:	0077859b          	addw	a1,a5,7
    2562:	04c5f763          	bgeu	a1,a2,25b0 <memset+0x17e>
    2566:	00e683a3          	sb	a4,7(a3)
    256a:	0087859b          	addw	a1,a5,8
    256e:	04c5f163          	bgeu	a1,a2,25b0 <memset+0x17e>
    2572:	00e68423          	sb	a4,8(a3)
    2576:	0097859b          	addw	a1,a5,9
    257a:	02c5fb63          	bgeu	a1,a2,25b0 <memset+0x17e>
    257e:	00e684a3          	sb	a4,9(a3)
    2582:	00a7859b          	addw	a1,a5,10
    2586:	02c5f563          	bgeu	a1,a2,25b0 <memset+0x17e>
    258a:	00e68523          	sb	a4,10(a3)
    258e:	00b7859b          	addw	a1,a5,11
    2592:	00c5ff63          	bgeu	a1,a2,25b0 <memset+0x17e>
    2596:	00e685a3          	sb	a4,11(a3)
    259a:	00c7859b          	addw	a1,a5,12
    259e:	00c5f963          	bgeu	a1,a2,25b0 <memset+0x17e>
    25a2:	00e68623          	sb	a4,12(a3)
    25a6:	27b5                	addw	a5,a5,13
    25a8:	00c7f463          	bgeu	a5,a2,25b0 <memset+0x17e>
    25ac:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    25b0:	8082                	ret
    25b2:	482d                	li	a6,11
    25b4:	bd71                	j	2450 <memset+0x1e>
    char *p = dest;
    25b6:	882a                	mv	a6,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    25b8:	4581                	li	a1,0
    25ba:	b701                	j	24ba <memset+0x88>
    25bc:	00150813          	add	a6,a0,1
    25c0:	4585                	li	a1,1
    25c2:	bde5                	j	24ba <memset+0x88>
    25c4:	8082                	ret
    char *p = dest;
    25c6:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    25c8:	4781                	li	a5,0
    25ca:	b7a1                	j	2512 <memset+0xe0>

00000000000025cc <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    25cc:	00054783          	lbu	a5,0(a0)
    25d0:	0005c703          	lbu	a4,0(a1)
    25d4:	00e79863          	bne	a5,a4,25e4 <strcmp+0x18>
    25d8:	0505                	add	a0,a0,1
    25da:	0585                	add	a1,a1,1
    25dc:	fbe5                	bnez	a5,25cc <strcmp>
    25de:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    25e0:	9d19                	subw	a0,a0,a4
    25e2:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    25e4:	0007851b          	sext.w	a0,a5
    25e8:	bfe5                	j	25e0 <strcmp+0x14>

00000000000025ea <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    25ea:	ca15                	beqz	a2,261e <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    25ec:	00054783          	lbu	a5,0(a0)
    if (!n--)
    25f0:	167d                	add	a2,a2,-1
    25f2:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    25f6:	eb99                	bnez	a5,260c <strncmp+0x22>
    25f8:	a815                	j	262c <strncmp+0x42>
    25fa:	00a68e63          	beq	a3,a0,2616 <strncmp+0x2c>
    25fe:	0505                	add	a0,a0,1
    2600:	00f71b63          	bne	a4,a5,2616 <strncmp+0x2c>
    2604:	00054783          	lbu	a5,0(a0)
    2608:	cf89                	beqz	a5,2622 <strncmp+0x38>
    260a:	85b2                	mv	a1,a2
    260c:	0005c703          	lbu	a4,0(a1)
    2610:	00158613          	add	a2,a1,1
    2614:	f37d                	bnez	a4,25fa <strncmp+0x10>
        ;
    return *l - *r;
    2616:	0007851b          	sext.w	a0,a5
    261a:	9d19                	subw	a0,a0,a4
    261c:	8082                	ret
        return 0;
    261e:	4501                	li	a0,0
}
    2620:	8082                	ret
    return *l - *r;
    2622:	0015c703          	lbu	a4,1(a1)
    2626:	4501                	li	a0,0
    2628:	9d19                	subw	a0,a0,a4
    262a:	8082                	ret
    262c:	0005c703          	lbu	a4,0(a1)
    2630:	4501                	li	a0,0
    2632:	b7e5                	j	261a <strncmp+0x30>

0000000000002634 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    2634:	00757793          	and	a5,a0,7
    2638:	cf89                	beqz	a5,2652 <strlen+0x1e>
    263a:	87aa                	mv	a5,a0
    263c:	a029                	j	2646 <strlen+0x12>
    263e:	0785                	add	a5,a5,1
    2640:	0077f713          	and	a4,a5,7
    2644:	cb01                	beqz	a4,2654 <strlen+0x20>
        if (!*s)
    2646:	0007c703          	lbu	a4,0(a5)
    264a:	fb75                	bnez	a4,263e <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    264c:	40a78533          	sub	a0,a5,a0
}
    2650:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    2652:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    2654:	feff05b7          	lui	a1,0xfeff0
    2658:	eff58593          	add	a1,a1,-257 # fffffffffefefeff <testname+0xfffffffffefec93f>
    265c:	f0101637          	lui	a2,0xf0101
    2660:	05c2                	sll	a1,a1,0x10
    2662:	0612                	sll	a2,a2,0x4
    2664:	6394                	ld	a3,0(a5)
    2666:	eff58593          	add	a1,a1,-257
    266a:	10160613          	add	a2,a2,257 # fffffffff0101101 <testname+0xfffffffff00fdb41>
    266e:	05c2                	sll	a1,a1,0x10
    2670:	0642                	sll	a2,a2,0x10
    2672:	eff58593          	add	a1,a1,-257
    2676:	10160613          	add	a2,a2,257
    267a:	00b68733          	add	a4,a3,a1
    267e:	063e                	sll	a2,a2,0xf
    2680:	fff6c693          	not	a3,a3
    2684:	8f75                	and	a4,a4,a3
    2686:	08060613          	add	a2,a2,128
    268a:	8f71                	and	a4,a4,a2
    268c:	eb11                	bnez	a4,26a0 <strlen+0x6c>
    268e:	6794                	ld	a3,8(a5)
    2690:	07a1                	add	a5,a5,8
    2692:	00b68733          	add	a4,a3,a1
    2696:	fff6c693          	not	a3,a3
    269a:	8f75                	and	a4,a4,a3
    269c:	8f71                	and	a4,a4,a2
    269e:	db65                	beqz	a4,268e <strlen+0x5a>
    for (; *s; s++)
    26a0:	0007c703          	lbu	a4,0(a5)
    26a4:	d745                	beqz	a4,264c <strlen+0x18>
    26a6:	0017c703          	lbu	a4,1(a5)
    26aa:	0785                	add	a5,a5,1
    26ac:	d345                	beqz	a4,264c <strlen+0x18>
    26ae:	0017c703          	lbu	a4,1(a5)
    26b2:	0785                	add	a5,a5,1
    26b4:	fb6d                	bnez	a4,26a6 <strlen+0x72>
    26b6:	bf59                	j	264c <strlen+0x18>

00000000000026b8 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    26b8:	00757713          	and	a4,a0,7
{
    26bc:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    26be:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    26c2:	cb19                	beqz	a4,26d8 <memchr+0x20>
    26c4:	ce59                	beqz	a2,2762 <memchr+0xaa>
    26c6:	0007c703          	lbu	a4,0(a5)
    26ca:	00b70963          	beq	a4,a1,26dc <memchr+0x24>
    26ce:	0785                	add	a5,a5,1
    26d0:	0077f713          	and	a4,a5,7
    26d4:	167d                	add	a2,a2,-1
    26d6:	f77d                	bnez	a4,26c4 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    26d8:	4501                	li	a0,0
    if (n && *s != c)
    26da:	c649                	beqz	a2,2764 <memchr+0xac>
    26dc:	0007c703          	lbu	a4,0(a5)
    26e0:	06b70663          	beq	a4,a1,274c <memchr+0x94>
        size_t k = ONES * c;
    26e4:	01010737          	lui	a4,0x1010
    26e8:	10170713          	add	a4,a4,257 # 1010101 <testname+0x100cb41>
    26ec:	0742                	sll	a4,a4,0x10
    26ee:	10170713          	add	a4,a4,257
    26f2:	0742                	sll	a4,a4,0x10
    26f4:	10170713          	add	a4,a4,257
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    26f8:	469d                	li	a3,7
        size_t k = ONES * c;
    26fa:	02e58533          	mul	a0,a1,a4
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    26fe:	04c6f763          	bgeu	a3,a2,274c <memchr+0x94>
    2702:	f0101837          	lui	a6,0xf0101
    2706:	feff08b7          	lui	a7,0xfeff0
    270a:	0812                	sll	a6,a6,0x4
    270c:	eff88893          	add	a7,a7,-257 # fffffffffefefeff <testname+0xfffffffffefec93f>
    2710:	10180813          	add	a6,a6,257 # fffffffff0101101 <testname+0xfffffffff00fdb41>
    2714:	08c2                	sll	a7,a7,0x10
    2716:	0842                	sll	a6,a6,0x10
    2718:	eff88893          	add	a7,a7,-257
    271c:	10180813          	add	a6,a6,257
    2720:	08c2                	sll	a7,a7,0x10
    2722:	083e                	sll	a6,a6,0xf
    2724:	eff88893          	add	a7,a7,-257
    2728:	08080813          	add	a6,a6,128
    272c:	431d                	li	t1,7
    272e:	a029                	j	2738 <memchr+0x80>
    2730:	1661                	add	a2,a2,-8
    2732:	07a1                	add	a5,a5,8
    2734:	02c37663          	bgeu	t1,a2,2760 <memchr+0xa8>
    2738:	6398                	ld	a4,0(a5)
    273a:	8f29                	xor	a4,a4,a0
    273c:	011706b3          	add	a3,a4,a7
    2740:	fff74713          	not	a4,a4
    2744:	8f75                	and	a4,a4,a3
    2746:	01077733          	and	a4,a4,a6
    274a:	d37d                	beqz	a4,2730 <memchr+0x78>
        s = (const void *)w;
    274c:	853e                	mv	a0,a5
    274e:	a019                	j	2754 <memchr+0x9c>
    for (; n && *s != c; s++, n--)
    2750:	0505                	add	a0,a0,1
    2752:	ca01                	beqz	a2,2762 <memchr+0xaa>
    2754:	00054783          	lbu	a5,0(a0)
    2758:	167d                	add	a2,a2,-1
    275a:	feb79be3          	bne	a5,a1,2750 <memchr+0x98>
    275e:	8082                	ret
    2760:	f675                	bnez	a2,274c <memchr+0x94>
    return n ? (void *)s : 0;
    2762:	4501                	li	a0,0
}
    2764:	8082                	ret

0000000000002766 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    2766:	1101                	add	sp,sp,-32
    2768:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    276a:	862e                	mv	a2,a1
{
    276c:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    276e:	4581                	li	a1,0
{
    2770:	e426                	sd	s1,8(sp)
    2772:	ec06                	sd	ra,24(sp)
    2774:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    2776:	f43ff0ef          	jal	26b8 <memchr>
    return p ? p - s : n;
    277a:	c519                	beqz	a0,2788 <strnlen+0x22>
}
    277c:	60e2                	ld	ra,24(sp)
    277e:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    2780:	8d05                	sub	a0,a0,s1
}
    2782:	64a2                	ld	s1,8(sp)
    2784:	6105                	add	sp,sp,32
    2786:	8082                	ret
    2788:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    278a:	8522                	mv	a0,s0
}
    278c:	6442                	ld	s0,16(sp)
    278e:	64a2                	ld	s1,8(sp)
    2790:	6105                	add	sp,sp,32
    2792:	8082                	ret

0000000000002794 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    2794:	00b547b3          	xor	a5,a0,a1
    2798:	8b9d                	and	a5,a5,7
    279a:	efb1                	bnez	a5,27f6 <strcpy+0x62>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    279c:	0075f793          	and	a5,a1,7
    27a0:	ebb5                	bnez	a5,2814 <strcpy+0x80>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    27a2:	feff0637          	lui	a2,0xfeff0
    27a6:	eff60613          	add	a2,a2,-257 # fffffffffefefeff <testname+0xfffffffffefec93f>
    27aa:	f01016b7          	lui	a3,0xf0101
    27ae:	0642                	sll	a2,a2,0x10
    27b0:	0692                	sll	a3,a3,0x4
    27b2:	6198                	ld	a4,0(a1)
    27b4:	eff60613          	add	a2,a2,-257
    27b8:	10168693          	add	a3,a3,257 # fffffffff0101101 <testname+0xfffffffff00fdb41>
    27bc:	0642                	sll	a2,a2,0x10
    27be:	06c2                	sll	a3,a3,0x10
    27c0:	eff60613          	add	a2,a2,-257
    27c4:	10168693          	add	a3,a3,257
    27c8:	00c707b3          	add	a5,a4,a2
    27cc:	fff74813          	not	a6,a4
    27d0:	06be                	sll	a3,a3,0xf
    27d2:	0107f7b3          	and	a5,a5,a6
    27d6:	08068693          	add	a3,a3,128
    27da:	8ff5                	and	a5,a5,a3
    27dc:	ef89                	bnez	a5,27f6 <strcpy+0x62>
    27de:	05a1                	add	a1,a1,8
    27e0:	e118                	sd	a4,0(a0)
    27e2:	6198                	ld	a4,0(a1)
    27e4:	0521                	add	a0,a0,8
    27e6:	00c707b3          	add	a5,a4,a2
    27ea:	fff74813          	not	a6,a4
    27ee:	0107f7b3          	and	a5,a5,a6
    27f2:	8ff5                	and	a5,a5,a3
    27f4:	d7ed                	beqz	a5,27de <strcpy+0x4a>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    27f6:	0005c783          	lbu	a5,0(a1)
    27fa:	00f50023          	sb	a5,0(a0)
    27fe:	c785                	beqz	a5,2826 <strcpy+0x92>
    2800:	0015c783          	lbu	a5,1(a1)
    2804:	0505                	add	a0,a0,1
    2806:	0585                	add	a1,a1,1
    2808:	00f50023          	sb	a5,0(a0)
    280c:	fbf5                	bnez	a5,2800 <strcpy+0x6c>
        ;
    return d;
}
    280e:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    2810:	0505                	add	a0,a0,1
    2812:	db41                	beqz	a4,27a2 <strcpy+0xe>
            if (!(*d = *s))
    2814:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    2818:	0585                	add	a1,a1,1
    281a:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    281e:	00f50023          	sb	a5,0(a0)
    2822:	f7fd                	bnez	a5,2810 <strcpy+0x7c>
}
    2824:	8082                	ret
    2826:	8082                	ret

0000000000002828 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    2828:	00b547b3          	xor	a5,a0,a1
    282c:	8b9d                	and	a5,a5,7
    282e:	efbd                	bnez	a5,28ac <strncpy+0x84>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    2830:	0075f793          	and	a5,a1,7
    2834:	1c078563          	beqz	a5,29fe <strncpy+0x1d6>
    2838:	ea11                	bnez	a2,284c <strncpy+0x24>
    283a:	8082                	ret
    283c:	0585                	add	a1,a1,1
    283e:	0075f793          	and	a5,a1,7
    2842:	167d                	add	a2,a2,-1
    2844:	0505                	add	a0,a0,1
    2846:	1a078c63          	beqz	a5,29fe <strncpy+0x1d6>
    284a:	ca3d                	beqz	a2,28c0 <strncpy+0x98>
    284c:	0005c783          	lbu	a5,0(a1)
    2850:	00f50023          	sb	a5,0(a0)
    2854:	f7e5                	bnez	a5,283c <strncpy+0x14>
            ;
        if (!n || !*s)
    2856:	0005c783          	lbu	a5,0(a1)
    285a:	c7a5                	beqz	a5,28c2 <strncpy+0x9a>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    285c:	479d                	li	a5,7
    285e:	04c7f863          	bgeu	a5,a2,28ae <strncpy+0x86>
    2862:	f01016b7          	lui	a3,0xf0101
    2866:	feff0837          	lui	a6,0xfeff0
    286a:	0692                	sll	a3,a3,0x4
    286c:	eff80813          	add	a6,a6,-257 # fffffffffefefeff <testname+0xfffffffffefec93f>
    2870:	10168693          	add	a3,a3,257 # fffffffff0101101 <testname+0xfffffffff00fdb41>
    2874:	0842                	sll	a6,a6,0x10
    2876:	06c2                	sll	a3,a3,0x10
    2878:	eff80813          	add	a6,a6,-257
    287c:	10168693          	add	a3,a3,257
    2880:	0842                	sll	a6,a6,0x10
    2882:	06be                	sll	a3,a3,0xf
    2884:	eff80813          	add	a6,a6,-257
    2888:	08068693          	add	a3,a3,128
    288c:	431d                	li	t1,7
    288e:	6198                	ld	a4,0(a1)
    2890:	010707b3          	add	a5,a4,a6
    2894:	fff74893          	not	a7,a4
    2898:	0117f7b3          	and	a5,a5,a7
    289c:	8ff5                	and	a5,a5,a3
    289e:	eb81                	bnez	a5,28ae <strncpy+0x86>
            *wd = *ws;
    28a0:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    28a2:	1661                	add	a2,a2,-8
    28a4:	05a1                	add	a1,a1,8
    28a6:	0521                	add	a0,a0,8
    28a8:	fec363e3          	bltu	t1,a2,288e <strncpy+0x66>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    28ac:	ca11                	beqz	a2,28c0 <strncpy+0x98>
    28ae:	0005c783          	lbu	a5,0(a1)
    28b2:	0585                	add	a1,a1,1
    28b4:	00f50023          	sb	a5,0(a0)
    28b8:	c789                	beqz	a5,28c2 <strncpy+0x9a>
    28ba:	167d                	add	a2,a2,-1
    28bc:	0505                	add	a0,a0,1
    28be:	fa65                	bnez	a2,28ae <strncpy+0x86>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    28c0:	8082                	ret
    28c2:	40a00733          	neg	a4,a0
    28c6:	00777793          	and	a5,a4,7
    28ca:	00778693          	add	a3,a5,7
    28ce:	482d                	li	a6,11
    28d0:	fff60593          	add	a1,a2,-1
    28d4:	1106ef63          	bltu	a3,a6,29f2 <strncpy+0x1ca>
    28d8:	12d5ee63          	bltu	a1,a3,2a14 <strncpy+0x1ec>
    28dc:	12078563          	beqz	a5,2a06 <strncpy+0x1de>
    for (int i = 0; i < n; ++i, *(p++) = c)
    28e0:	00050023          	sb	zero,0(a0)
    28e4:	00677693          	and	a3,a4,6
    28e8:	12068263          	beqz	a3,2a0c <strncpy+0x1e4>
    28ec:	000500a3          	sb	zero,1(a0)
    28f0:	4689                	li	a3,2
    28f2:	12f6f463          	bgeu	a3,a5,2a1a <strncpy+0x1f2>
    28f6:	00050123          	sb	zero,2(a0)
    28fa:	8b11                	and	a4,a4,4
    28fc:	cf6d                	beqz	a4,29f6 <strncpy+0x1ce>
    28fe:	000501a3          	sb	zero,3(a0)
    2902:	4711                	li	a4,4
    2904:	00450693          	add	a3,a0,4
    2908:	02f77363          	bgeu	a4,a5,292e <strncpy+0x106>
    290c:	00050223          	sb	zero,4(a0)
    2910:	4715                	li	a4,5
    2912:	00550693          	add	a3,a0,5
    2916:	00e78c63          	beq	a5,a4,292e <strncpy+0x106>
    291a:	000502a3          	sb	zero,5(a0)
    291e:	471d                	li	a4,7
    2920:	10e79163          	bne	a5,a4,2a22 <strncpy+0x1fa>
    2924:	00750693          	add	a3,a0,7
    2928:	00050323          	sb	zero,6(a0)
    292c:	471d                	li	a4,7
    292e:	40f608b3          	sub	a7,a2,a5
    2932:	ff88f813          	and	a6,a7,-8
    2936:	97aa                	add	a5,a5,a0
    2938:	010785b3          	add	a1,a5,a6
    293c:	0007b023          	sd	zero,0(a5)
    2940:	07a1                	add	a5,a5,8
    2942:	feb79de3          	bne	a5,a1,293c <strncpy+0x114>
    2946:	00e807bb          	addw	a5,a6,a4
    294a:	01068733          	add	a4,a3,a6
    294e:	0b088b63          	beq	a7,a6,2a04 <strncpy+0x1dc>
    2952:	00070023          	sb	zero,0(a4)
    2956:	0017869b          	addw	a3,a5,1
    295a:	f6c6f3e3          	bgeu	a3,a2,28c0 <strncpy+0x98>
    295e:	000700a3          	sb	zero,1(a4)
    2962:	0027869b          	addw	a3,a5,2
    2966:	f4c6fde3          	bgeu	a3,a2,28c0 <strncpy+0x98>
    296a:	00070123          	sb	zero,2(a4)
    296e:	0037869b          	addw	a3,a5,3
    2972:	f4c6f7e3          	bgeu	a3,a2,28c0 <strncpy+0x98>
    2976:	000701a3          	sb	zero,3(a4)
    297a:	0047869b          	addw	a3,a5,4
    297e:	f4c6f1e3          	bgeu	a3,a2,28c0 <strncpy+0x98>
    2982:	00070223          	sb	zero,4(a4)
    2986:	0057869b          	addw	a3,a5,5
    298a:	f2c6fbe3          	bgeu	a3,a2,28c0 <strncpy+0x98>
    298e:	000702a3          	sb	zero,5(a4)
    2992:	0067869b          	addw	a3,a5,6
    2996:	f2c6f5e3          	bgeu	a3,a2,28c0 <strncpy+0x98>
    299a:	00070323          	sb	zero,6(a4)
    299e:	0077869b          	addw	a3,a5,7
    29a2:	f0c6ffe3          	bgeu	a3,a2,28c0 <strncpy+0x98>
    29a6:	000703a3          	sb	zero,7(a4)
    29aa:	0087869b          	addw	a3,a5,8
    29ae:	f0c6f9e3          	bgeu	a3,a2,28c0 <strncpy+0x98>
    29b2:	00070423          	sb	zero,8(a4)
    29b6:	0097869b          	addw	a3,a5,9
    29ba:	f0c6f3e3          	bgeu	a3,a2,28c0 <strncpy+0x98>
    29be:	000704a3          	sb	zero,9(a4)
    29c2:	00a7869b          	addw	a3,a5,10
    29c6:	eec6fde3          	bgeu	a3,a2,28c0 <strncpy+0x98>
    29ca:	00070523          	sb	zero,10(a4)
    29ce:	00b7869b          	addw	a3,a5,11
    29d2:	eec6f7e3          	bgeu	a3,a2,28c0 <strncpy+0x98>
    29d6:	000705a3          	sb	zero,11(a4)
    29da:	00c7869b          	addw	a3,a5,12
    29de:	eec6f1e3          	bgeu	a3,a2,28c0 <strncpy+0x98>
    29e2:	00070623          	sb	zero,12(a4)
    29e6:	27b5                	addw	a5,a5,13
    29e8:	ecc7fce3          	bgeu	a5,a2,28c0 <strncpy+0x98>
    29ec:	000706a3          	sb	zero,13(a4)
}
    29f0:	8082                	ret
    29f2:	46ad                	li	a3,11
    29f4:	b5d5                	j	28d8 <strncpy+0xb0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    29f6:	00350693          	add	a3,a0,3
    29fa:	470d                	li	a4,3
    29fc:	bf0d                	j	292e <strncpy+0x106>
        if (!n || !*s)
    29fe:	e4061ce3          	bnez	a2,2856 <strncpy+0x2e>
}
    2a02:	8082                	ret
    2a04:	8082                	ret
    char *p = dest;
    2a06:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    2a08:	4701                	li	a4,0
    2a0a:	b715                	j	292e <strncpy+0x106>
    2a0c:	00150693          	add	a3,a0,1
    2a10:	4705                	li	a4,1
    2a12:	bf31                	j	292e <strncpy+0x106>
    char *p = dest;
    2a14:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    2a16:	4781                	li	a5,0
    2a18:	bf2d                	j	2952 <strncpy+0x12a>
    2a1a:	00250693          	add	a3,a0,2
    2a1e:	4709                	li	a4,2
    2a20:	b739                	j	292e <strncpy+0x106>
    2a22:	00650693          	add	a3,a0,6
    2a26:	4719                	li	a4,6
    2a28:	b719                	j	292e <strncpy+0x106>

0000000000002a2a <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    2a2a:	87aa                	mv	a5,a0
    2a2c:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    2a2e:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    2a32:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    2a36:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    2a38:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    2a3a:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    2a3e:	2501                	sext.w	a0,a0
    2a40:	8082                	ret

0000000000002a42 <openat>:
    register long a7 __asm__("a7") = n;
    2a42:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    2a46:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    2a4a:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    2a4e:	2501                	sext.w	a0,a0
    2a50:	8082                	ret

0000000000002a52 <fcntl>:
    register long a7 __asm__("a7") = n;
    2a52:	48e5                	li	a7,25
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2a54:	00000073          	ecall
int fcntl(int fd,int cmd,int arg){
    return syscall(SYS_fcntl,fd,cmd,arg);
}
    2a58:	2501                	sext.w	a0,a0
    2a5a:	8082                	ret

0000000000002a5c <close>:
    register long a7 __asm__("a7") = n;
    2a5c:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    2a60:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    2a64:	2501                	sext.w	a0,a0
    2a66:	8082                	ret

0000000000002a68 <read>:
    register long a7 __asm__("a7") = n;
    2a68:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2a6c:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    2a70:	8082                	ret

0000000000002a72 <write>:
    register long a7 __asm__("a7") = n;
    2a72:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2a76:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    2a7a:	8082                	ret

0000000000002a7c <getpid>:
    register long a7 __asm__("a7") = n;
    2a7c:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    2a80:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    2a84:	2501                	sext.w	a0,a0
    2a86:	8082                	ret

0000000000002a88 <getppid>:
    register long a7 __asm__("a7") = n;
    2a88:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    2a8c:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    2a90:	2501                	sext.w	a0,a0
    2a92:	8082                	ret

0000000000002a94 <sched_yield>:
    register long a7 __asm__("a7") = n;
    2a94:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    2a98:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    2a9c:	2501                	sext.w	a0,a0
    2a9e:	8082                	ret

0000000000002aa0 <fork>:
    register long a7 __asm__("a7") = n;
    2aa0:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    2aa4:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    2aa6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2aa8:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    2aac:	2501                	sext.w	a0,a0
    2aae:	8082                	ret

0000000000002ab0 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    2ab0:	85b2                	mv	a1,a2
    2ab2:	863a                	mv	a2,a4
    if (stack)
    2ab4:	c191                	beqz	a1,2ab8 <clone+0x8>
	stack += stack_size;
    2ab6:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    2ab8:	4781                	li	a5,0
    2aba:	4701                	li	a4,0
    2abc:	4681                	li	a3,0
    2abe:	2601                	sext.w	a2,a2
    2ac0:	a2ed                	j	2caa <__clone>

0000000000002ac2 <exit>:
    register long a7 __asm__("a7") = n;
    2ac2:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    2ac6:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    2aca:	8082                	ret

0000000000002acc <waitpid>:
    register long a7 __asm__("a7") = n;
    2acc:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    2ad0:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    2ad2:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    2ad6:	2501                	sext.w	a0,a0
    2ad8:	8082                	ret

0000000000002ada <exec>:
    register long a7 __asm__("a7") = n;
    2ada:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    2ade:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    2ae2:	2501                	sext.w	a0,a0
    2ae4:	8082                	ret

0000000000002ae6 <execve>:
    register long a7 __asm__("a7") = n;
    2ae6:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2aea:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    2aee:	2501                	sext.w	a0,a0
    2af0:	8082                	ret

0000000000002af2 <times>:
    register long a7 __asm__("a7") = n;
    2af2:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    2af6:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    2afa:	2501                	sext.w	a0,a0
    2afc:	8082                	ret

0000000000002afe <get_time>:

int64 get_time()
{
    2afe:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    2b00:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    2b04:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    2b06:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2b08:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    2b0c:	2501                	sext.w	a0,a0
    2b0e:	ed09                	bnez	a0,2b28 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    2b10:	67a2                	ld	a5,8(sp)
    2b12:	3e800713          	li	a4,1000
    2b16:	00015503          	lhu	a0,0(sp)
    2b1a:	02e7d7b3          	divu	a5,a5,a4
    2b1e:	02e50533          	mul	a0,a0,a4
    2b22:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    2b24:	0141                	add	sp,sp,16
    2b26:	8082                	ret
        return -1;
    2b28:	557d                	li	a0,-1
    2b2a:	bfed                	j	2b24 <get_time+0x26>

0000000000002b2c <sys_get_time>:
    register long a7 __asm__("a7") = n;
    2b2c:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2b30:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    2b34:	2501                	sext.w	a0,a0
    2b36:	8082                	ret

0000000000002b38 <time>:
    register long a7 __asm__("a7") = n;
    2b38:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    2b3c:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    2b40:	2501                	sext.w	a0,a0
    2b42:	8082                	ret

0000000000002b44 <sleep>:

int sleep(unsigned long long time)
{
    2b44:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    2b46:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    2b48:	850a                	mv	a0,sp
    2b4a:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    2b4c:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    2b50:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2b52:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    2b56:	e501                	bnez	a0,2b5e <sleep+0x1a>
    return 0;
    2b58:	4501                	li	a0,0
}
    2b5a:	0141                	add	sp,sp,16
    2b5c:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    2b5e:	4502                	lw	a0,0(sp)
}
    2b60:	0141                	add	sp,sp,16
    2b62:	8082                	ret

0000000000002b64 <set_priority>:
    register long a7 __asm__("a7") = n;
    2b64:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    2b68:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    2b6c:	2501                	sext.w	a0,a0
    2b6e:	8082                	ret

0000000000002b70 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    2b70:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    2b74:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    2b78:	8082                	ret

0000000000002b7a <munmap>:
    register long a7 __asm__("a7") = n;
    2b7a:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2b7e:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    2b82:	2501                	sext.w	a0,a0
    2b84:	8082                	ret

0000000000002b86 <wait>:

int wait(int *code)
{
    2b86:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    2b88:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    2b8c:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    2b8e:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    2b90:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    2b92:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    2b96:	2501                	sext.w	a0,a0
    2b98:	8082                	ret

0000000000002b9a <spawn>:
    register long a7 __asm__("a7") = n;
    2b9a:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    2b9e:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    2ba2:	2501                	sext.w	a0,a0
    2ba4:	8082                	ret

0000000000002ba6 <mailread>:
    register long a7 __asm__("a7") = n;
    2ba6:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2baa:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    2bae:	2501                	sext.w	a0,a0
    2bb0:	8082                	ret

0000000000002bb2 <mailwrite>:
    register long a7 __asm__("a7") = n;
    2bb2:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2bb6:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    2bba:	2501                	sext.w	a0,a0
    2bbc:	8082                	ret

0000000000002bbe <fstat>:
    register long a7 __asm__("a7") = n;
    2bbe:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2bc2:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    2bc6:	2501                	sext.w	a0,a0
    2bc8:	8082                	ret

0000000000002bca <sys_linkat>:
    register long a4 __asm__("a4") = e;
    2bca:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    2bcc:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    2bd0:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    2bd2:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    2bd6:	2501                	sext.w	a0,a0
    2bd8:	8082                	ret

0000000000002bda <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    2bda:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    2bdc:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    2be0:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2be2:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    2be6:	2501                	sext.w	a0,a0
    2be8:	8082                	ret

0000000000002bea <link>:

int link(char *old_path, char *new_path)
{
    2bea:	87aa                	mv	a5,a0
    2bec:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    2bee:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    2bf2:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    2bf6:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    2bf8:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    2bfc:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    2bfe:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    2c02:	2501                	sext.w	a0,a0
    2c04:	8082                	ret

0000000000002c06 <unlink>:

int unlink(char *path)
{
    2c06:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    2c08:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    2c0c:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    2c10:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2c12:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    2c16:	2501                	sext.w	a0,a0
    2c18:	8082                	ret

0000000000002c1a <uname>:
    register long a7 __asm__("a7") = n;
    2c1a:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    2c1e:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    2c22:	2501                	sext.w	a0,a0
    2c24:	8082                	ret

0000000000002c26 <brk>:
    register long a7 __asm__("a7") = n;
    2c26:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    2c2a:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    2c2e:	2501                	sext.w	a0,a0
    2c30:	8082                	ret

0000000000002c32 <getcwd>:
    register long a7 __asm__("a7") = n;
    2c32:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2c34:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    2c38:	8082                	ret

0000000000002c3a <chdir>:
    register long a7 __asm__("a7") = n;
    2c3a:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    2c3e:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    2c42:	2501                	sext.w	a0,a0
    2c44:	8082                	ret

0000000000002c46 <mkdir>:

int mkdir(const char *path, mode_t mode){
    2c46:	862e                	mv	a2,a1
    2c48:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    2c4a:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    2c4c:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    2c50:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    2c54:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    2c56:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2c58:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    2c5c:	2501                	sext.w	a0,a0
    2c5e:	8082                	ret

0000000000002c60 <getdents>:
    register long a7 __asm__("a7") = n;
    2c60:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2c64:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    2c68:	2501                	sext.w	a0,a0
    2c6a:	8082                	ret

0000000000002c6c <pipe>:
    register long a7 __asm__("a7") = n;
    2c6c:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    2c70:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2c72:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    2c76:	2501                	sext.w	a0,a0
    2c78:	8082                	ret

0000000000002c7a <dup>:
    register long a7 __asm__("a7") = n;
    2c7a:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    2c7c:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    2c80:	2501                	sext.w	a0,a0
    2c82:	8082                	ret

0000000000002c84 <dup2>:
    register long a7 __asm__("a7") = n;
    2c84:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    2c86:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2c88:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    2c8c:	2501                	sext.w	a0,a0
    2c8e:	8082                	ret

0000000000002c90 <mount>:
    register long a7 __asm__("a7") = n;
    2c90:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    2c94:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    2c98:	2501                	sext.w	a0,a0
    2c9a:	8082                	ret

0000000000002c9c <umount>:
    register long a7 __asm__("a7") = n;
    2c9c:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    2ca0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2ca2:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    2ca6:	2501                	sext.w	a0,a0
    2ca8:	8082                	ret

0000000000002caa <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    2caa:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    2cac:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    2cae:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    2cb0:	8532                	mv	a0,a2
	mv a2, a4
    2cb2:	863a                	mv	a2,a4
	mv a3, a5
    2cb4:	86be                	mv	a3,a5
	mv a4, a6
    2cb6:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    2cb8:	0dc00893          	li	a7,220
	ecall
    2cbc:	00000073          	ecall

	beqz a0, 1f
    2cc0:	c111                	beqz	a0,2cc4 <__clone+0x1a>
	# Parent
	ret
    2cc2:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    2cc4:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    2cc6:	6522                	ld	a0,8(sp)
	jalr a1
    2cc8:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    2cca:	05d00893          	li	a7,93
	ecall
    2cce:	00000073          	ecall
