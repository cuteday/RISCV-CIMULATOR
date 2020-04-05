
mat-mul.riscv：     文件格式 elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <_start>:
   100b0:	00002197          	auipc	gp,0x2
   100b4:	f7818193          	addi	gp,gp,-136 # 12028 <__global_pointer$>
   100b8:	81818513          	addi	a0,gp,-2024 # 11840 <_edata>
   100bc:	8d018613          	addi	a2,gp,-1840 # 118f8 <_end>
   100c0:	8e09                	sub	a2,a2,a0
   100c2:	4581                	li	a1,0
   100c4:	548000ef          	jal	ra,1060c <memset>
   100c8:	00000517          	auipc	a0,0x0
   100cc:	48e50513          	addi	a0,a0,1166 # 10556 <__libc_fini_array>
   100d0:	00000097          	auipc	ra,0x0
   100d4:	452080e7          	jalr	1106(ra) # 10522 <atexit>
   100d8:	00000097          	auipc	ra,0x0
   100dc:	4cc080e7          	jalr	1228(ra) # 105a4 <__libc_init_array>
   100e0:	4502                	lw	a0,0(sp)
   100e2:	002c                	addi	a1,sp,8
   100e4:	4601                	li	a2,0
   100e6:	256000ef          	jal	ra,1033c <main>
   100ea:	00000317          	auipc	t1,0x0
   100ee:	44630067          	jr	1094(t1) # 10530 <exit>

00000000000100f2 <_fini>:
   100f2:	8082                	ret

00000000000100f4 <deregister_tm_clones>:
   100f4:	6549                	lui	a0,0x12
   100f6:	67c9                	lui	a5,0x12
   100f8:	82850713          	addi	a4,a0,-2008 # 11828 <__TMC_END__>
   100fc:	82878793          	addi	a5,a5,-2008 # 11828 <__TMC_END__>
   10100:	00e78b63          	beq	a5,a4,10116 <deregister_tm_clones+0x22>
   10104:	00000337          	lui	t1,0x0
   10108:	00030313          	mv	t1,t1
   1010c:	00030563          	beqz	t1,10116 <deregister_tm_clones+0x22>
   10110:	82850513          	addi	a0,a0,-2008
   10114:	8302                	jr	t1
   10116:	8082                	ret

0000000000010118 <register_tm_clones>:
   10118:	67c9                	lui	a5,0x12
   1011a:	6549                	lui	a0,0x12
   1011c:	82878593          	addi	a1,a5,-2008 # 11828 <__TMC_END__>
   10120:	82850793          	addi	a5,a0,-2008 # 11828 <__TMC_END__>
   10124:	8d9d                	sub	a1,a1,a5
   10126:	858d                	srai	a1,a1,0x3
   10128:	4789                	li	a5,2
   1012a:	02f5c5b3          	div	a1,a1,a5
   1012e:	c991                	beqz	a1,10142 <register_tm_clones+0x2a>
   10130:	00000337          	lui	t1,0x0
   10134:	00030313          	mv	t1,t1
   10138:	00030563          	beqz	t1,10142 <register_tm_clones+0x2a>
   1013c:	82850513          	addi	a0,a0,-2008
   10140:	8302                	jr	t1
   10142:	8082                	ret

0000000000010144 <__do_global_dtors_aux>:
   10144:	8201c703          	lbu	a4,-2016(gp) # 11848 <completed.5184>
   10148:	eb15                	bnez	a4,1017c <__do_global_dtors_aux+0x38>
   1014a:	1141                	addi	sp,sp,-16
   1014c:	e022                	sd	s0,0(sp)
   1014e:	e406                	sd	ra,8(sp)
   10150:	843e                	mv	s0,a5
   10152:	fa3ff0ef          	jal	ra,100f4 <deregister_tm_clones>
   10156:	000007b7          	lui	a5,0x0
   1015a:	00078793          	mv	a5,a5
   1015e:	cb81                	beqz	a5,1016e <__do_global_dtors_aux+0x2a>
   10160:	6545                	lui	a0,0x11
   10162:	bdc50513          	addi	a0,a0,-1060 # 10bdc <__EH_FRAME_BEGIN__>
   10166:	ffff0097          	auipc	ra,0xffff0
   1016a:	e9a080e7          	jalr	-358(ra) # 0 <_start-0x100b0>
   1016e:	4785                	li	a5,1
   10170:	82f18023          	sb	a5,-2016(gp) # 11848 <completed.5184>
   10174:	60a2                	ld	ra,8(sp)
   10176:	6402                	ld	s0,0(sp)
   10178:	0141                	addi	sp,sp,16
   1017a:	8082                	ret
   1017c:	8082                	ret

000000000001017e <frame_dummy>:
   1017e:	000007b7          	lui	a5,0x0
   10182:	00078793          	mv	a5,a5
   10186:	cf99                	beqz	a5,101a4 <frame_dummy+0x26>
   10188:	65c9                	lui	a1,0x12
   1018a:	6545                	lui	a0,0x11
   1018c:	1141                	addi	sp,sp,-16
   1018e:	85058593          	addi	a1,a1,-1968 # 11850 <object.5189>
   10192:	bdc50513          	addi	a0,a0,-1060 # 10bdc <__EH_FRAME_BEGIN__>
   10196:	e406                	sd	ra,8(sp)
   10198:	ffff0097          	auipc	ra,0xffff0
   1019c:	e68080e7          	jalr	-408(ra) # 0 <_start-0x100b0>
   101a0:	60a2                	ld	ra,8(sp)
   101a2:	0141                	addi	sp,sp,16
   101a4:	f75ff06f          	j	10118 <register_tm_clones>

00000000000101a8 <matmul>:
   101a8:	fc010113          	addi	sp,sp,-64
   101ac:	02813c23          	sd	s0,56(sp)
   101b0:	04010413          	addi	s0,sp,64
   101b4:	fca43c23          	sd	a0,-40(s0)
   101b8:	fcb43823          	sd	a1,-48(s0)
   101bc:	fcc43423          	sd	a2,-56(s0)
   101c0:	fe042623          	sw	zero,-20(s0)
   101c4:	1580006f          	j	1031c <matmul+0x174>
   101c8:	fe042423          	sw	zero,-24(s0)
   101cc:	1340006f          	j	10300 <matmul+0x158>
   101d0:	fec42703          	lw	a4,-20(s0)
   101d4:	00070793          	mv	a5,a4
   101d8:	00279793          	slli	a5,a5,0x2
   101dc:	00e787b3          	add	a5,a5,a4
   101e0:	00279793          	slli	a5,a5,0x2
   101e4:	00078713          	mv	a4,a5
   101e8:	fc843783          	ld	a5,-56(s0)
   101ec:	00e78733          	add	a4,a5,a4
   101f0:	fe842783          	lw	a5,-24(s0)
   101f4:	00279793          	slli	a5,a5,0x2
   101f8:	00f707b3          	add	a5,a4,a5
   101fc:	0007a023          	sw	zero,0(a5) # 0 <_start-0x100b0>
   10200:	fe042223          	sw	zero,-28(s0)
   10204:	0e00006f          	j	102e4 <matmul+0x13c>
   10208:	fec42703          	lw	a4,-20(s0)
   1020c:	00070793          	mv	a5,a4
   10210:	00279793          	slli	a5,a5,0x2
   10214:	00e787b3          	add	a5,a5,a4
   10218:	00279793          	slli	a5,a5,0x2
   1021c:	00078713          	mv	a4,a5
   10220:	fc843783          	ld	a5,-56(s0)
   10224:	00e78733          	add	a4,a5,a4
   10228:	fe842783          	lw	a5,-24(s0)
   1022c:	00279793          	slli	a5,a5,0x2
   10230:	00f707b3          	add	a5,a4,a5
   10234:	0007a583          	lw	a1,0(a5)
   10238:	fec42703          	lw	a4,-20(s0)
   1023c:	00070793          	mv	a5,a4
   10240:	00279793          	slli	a5,a5,0x2
   10244:	00e787b3          	add	a5,a5,a4
   10248:	00279793          	slli	a5,a5,0x2
   1024c:	00078713          	mv	a4,a5
   10250:	fd843783          	ld	a5,-40(s0)
   10254:	00e78733          	add	a4,a5,a4
   10258:	fe442783          	lw	a5,-28(s0)
   1025c:	00279793          	slli	a5,a5,0x2
   10260:	00f707b3          	add	a5,a4,a5
   10264:	0007a683          	lw	a3,0(a5)
   10268:	fe442703          	lw	a4,-28(s0)
   1026c:	00070793          	mv	a5,a4
   10270:	00279793          	slli	a5,a5,0x2
   10274:	00e787b3          	add	a5,a5,a4
   10278:	00279793          	slli	a5,a5,0x2
   1027c:	00078713          	mv	a4,a5
   10280:	fd043783          	ld	a5,-48(s0)
   10284:	00e78733          	add	a4,a5,a4
   10288:	fe842783          	lw	a5,-24(s0)
   1028c:	00279793          	slli	a5,a5,0x2
   10290:	00f707b3          	add	a5,a4,a5
   10294:	0007a783          	lw	a5,0(a5)
   10298:	02f687bb          	mulw	a5,a3,a5
   1029c:	0007861b          	sext.w	a2,a5
   102a0:	fec42703          	lw	a4,-20(s0)
   102a4:	00070793          	mv	a5,a4
   102a8:	00279793          	slli	a5,a5,0x2
   102ac:	00e787b3          	add	a5,a5,a4
   102b0:	00279793          	slli	a5,a5,0x2
   102b4:	00078713          	mv	a4,a5
   102b8:	fc843783          	ld	a5,-56(s0)
   102bc:	00e786b3          	add	a3,a5,a4
   102c0:	00c587bb          	addw	a5,a1,a2
   102c4:	0007871b          	sext.w	a4,a5
   102c8:	fe842783          	lw	a5,-24(s0)
   102cc:	00279793          	slli	a5,a5,0x2
   102d0:	00f687b3          	add	a5,a3,a5
   102d4:	00e7a023          	sw	a4,0(a5)
   102d8:	fe442783          	lw	a5,-28(s0)
   102dc:	0017879b          	addiw	a5,a5,1
   102e0:	fef42223          	sw	a5,-28(s0)
   102e4:	fe442783          	lw	a5,-28(s0)
   102e8:	0007871b          	sext.w	a4,a5
   102ec:	00400793          	li	a5,4
   102f0:	f0e7dce3          	ble	a4,a5,10208 <matmul+0x60>
   102f4:	fe842783          	lw	a5,-24(s0)
   102f8:	0017879b          	addiw	a5,a5,1
   102fc:	fef42423          	sw	a5,-24(s0)
   10300:	fe842783          	lw	a5,-24(s0)
   10304:	0007871b          	sext.w	a4,a5
   10308:	00400793          	li	a5,4
   1030c:	ece7d2e3          	ble	a4,a5,101d0 <matmul+0x28>
   10310:	fec42783          	lw	a5,-20(s0)
   10314:	0017879b          	addiw	a5,a5,1
   10318:	fef42623          	sw	a5,-20(s0)
   1031c:	fec42783          	lw	a5,-20(s0)
   10320:	0007871b          	sext.w	a4,a5
   10324:	00400793          	li	a5,4
   10328:	eae7d0e3          	ble	a4,a5,101c8 <matmul+0x20>
   1032c:	00000013          	nop
   10330:	03813403          	ld	s0,56(sp)
   10334:	04010113          	addi	sp,sp,64
   10338:	00008067          	ret

000000000001033c <main>:
   1033c:	fe010113          	addi	sp,sp,-32
   10340:	00113c23          	sd	ra,24(sp)
   10344:	00813823          	sd	s0,16(sp)
   10348:	02010413          	addi	s0,sp,32
   1034c:	000127b7          	lui	a5,0x12
   10350:	89078613          	addi	a2,a5,-1904 # 11890 <RES>
   10354:	000117b7          	lui	a5,0x11
   10358:	01078593          	addi	a1,a5,16 # 11010 <__fini_array_end>
   1035c:	000117b7          	lui	a5,0x11
   10360:	07878513          	addi	a0,a5,120 # 11078 <B>
   10364:	00000097          	auipc	ra,0x0
   10368:	e44080e7          	jalr	-444(ra) # 101a8 <matmul>
   1036c:	fe042623          	sw	zero,-20(s0)
   10370:	0800006f          	j	103f0 <main+0xb4>
   10374:	fe042423          	sw	zero,-24(s0)
   10378:	0500006f          	j	103c8 <main+0x8c>
   1037c:	000126b7          	lui	a3,0x12
   10380:	fe842603          	lw	a2,-24(s0)
   10384:	fec42703          	lw	a4,-20(s0)
   10388:	00070793          	mv	a5,a4
   1038c:	00279793          	slli	a5,a5,0x2
   10390:	00e787b3          	add	a5,a5,a4
   10394:	00c787b3          	add	a5,a5,a2
   10398:	00279713          	slli	a4,a5,0x2
   1039c:	89068793          	addi	a5,a3,-1904 # 11890 <RES>
   103a0:	00f707b3          	add	a5,a4,a5
   103a4:	0007a783          	lw	a5,0(a5)
   103a8:	00078513          	mv	a0,a5
   103ac:	09c000ef          	jal	ra,10448 <Printd>
   103b0:	02000513          	li	a0,32
   103b4:	00000097          	auipc	ra,0x0
   103b8:	068080e7          	jalr	104(ra) # 1041c <Printc>
   103bc:	fe842783          	lw	a5,-24(s0)
   103c0:	0017879b          	addiw	a5,a5,1
   103c4:	fef42423          	sw	a5,-24(s0)
   103c8:	fe842783          	lw	a5,-24(s0)
   103cc:	0007871b          	sext.w	a4,a5
   103d0:	00400793          	li	a5,4
   103d4:	fae7d4e3          	ble	a4,a5,1037c <main+0x40>
   103d8:	00a00513          	li	a0,10
   103dc:	00000097          	auipc	ra,0x0
   103e0:	040080e7          	jalr	64(ra) # 1041c <Printc>
   103e4:	fec42783          	lw	a5,-20(s0)
   103e8:	0017879b          	addiw	a5,a5,1
   103ec:	fef42623          	sw	a5,-20(s0)
   103f0:	fec42783          	lw	a5,-20(s0)
   103f4:	0007871b          	sext.w	a4,a5
   103f8:	00400793          	li	a5,4
   103fc:	f6e7dce3          	ble	a4,a5,10374 <main+0x38>
   10400:	00000793          	li	a5,0
   10404:	00078513          	mv	a0,a5
   10408:	01813083          	ld	ra,24(sp)
   1040c:	01013403          	ld	s0,16(sp)
   10410:	02010113          	addi	sp,sp,32
   10414:	00008067          	ret
   10418:	0000                	unimp
	...

000000000001041c <Printc>:
   1041c:	fe010113          	addi	sp,sp,-32
   10420:	00813c23          	sd	s0,24(sp)
   10424:	02010413          	addi	s0,sp,32
   10428:	00050793          	mv	a5,a0
   1042c:	fef407a3          	sb	a5,-17(s0)
   10430:	00100893          	li	a7,1
   10434:	00000073          	ecall
   10438:	00000013          	nop
   1043c:	01813403          	ld	s0,24(sp)
   10440:	02010113          	addi	sp,sp,32
   10444:	00008067          	ret

0000000000010448 <Printd>:
   10448:	fe010113          	addi	sp,sp,-32
   1044c:	00813c23          	sd	s0,24(sp)
   10450:	02010413          	addi	s0,sp,32
   10454:	00050793          	mv	a5,a0
   10458:	fef42623          	sw	a5,-20(s0)
   1045c:	00200893          	li	a7,2
   10460:	00000073          	ecall
   10464:	00000013          	nop
   10468:	01813403          	ld	s0,24(sp)
   1046c:	02010113          	addi	sp,sp,32
   10470:	00008067          	ret

0000000000010474 <Prints>:
   10474:	fe010113          	addi	sp,sp,-32
   10478:	00813c23          	sd	s0,24(sp)
   1047c:	02010413          	addi	s0,sp,32
   10480:	fea43423          	sd	a0,-24(s0)
   10484:	00300893          	li	a7,3
   10488:	00000073          	ecall
   1048c:	00000013          	nop
   10490:	01813403          	ld	s0,24(sp)
   10494:	02010113          	addi	sp,sp,32
   10498:	00008067          	ret

000000000001049c <Getc>:
   1049c:	fe010113          	addi	sp,sp,-32
   104a0:	00813c23          	sd	s0,24(sp)
   104a4:	02010413          	addi	s0,sp,32
   104a8:	00400893          	li	a7,4
   104ac:	00000073          	ecall
   104b0:	00050793          	mv	a5,a0
   104b4:	fef407a3          	sb	a5,-17(s0)
   104b8:	fef44783          	lbu	a5,-17(s0)
   104bc:	00078513          	mv	a0,a5
   104c0:	01813403          	ld	s0,24(sp)
   104c4:	02010113          	addi	sp,sp,32
   104c8:	00008067          	ret

00000000000104cc <Getd>:
   104cc:	fe010113          	addi	sp,sp,-32
   104d0:	00813c23          	sd	s0,24(sp)
   104d4:	02010413          	addi	s0,sp,32
   104d8:	00500893          	li	a7,5
   104dc:	00000073          	ecall
   104e0:	00050793          	mv	a5,a0
   104e4:	fef42623          	sw	a5,-20(s0)
   104e8:	fec42783          	lw	a5,-20(s0)
   104ec:	00078513          	mv	a0,a5
   104f0:	01813403          	ld	s0,24(sp)
   104f4:	02010113          	addi	sp,sp,32
   104f8:	00008067          	ret

00000000000104fc <Exit>:
   104fc:	ff010113          	addi	sp,sp,-16
   10500:	00813423          	sd	s0,8(sp)
   10504:	01010413          	addi	s0,sp,16
   10508:	00000893          	li	a7,0
   1050c:	00000073          	ecall
   10510:	00000013          	nop
   10514:	00813403          	ld	s0,8(sp)
   10518:	01010113          	addi	sp,sp,16
   1051c:	00008067          	ret
	...

0000000000010522 <atexit>:
   10522:	85aa                	mv	a1,a0
   10524:	4681                	li	a3,0
   10526:	4601                	li	a2,0
   10528:	4501                	li	a0,0
   1052a:	18c0006f          	j	106b6 <__register_exitproc>
	...

0000000000010530 <exit>:
   10530:	1141                	addi	sp,sp,-16
   10532:	4581                	li	a1,0
   10534:	e022                	sd	s0,0(sp)
   10536:	e406                	sd	ra,8(sp)
   10538:	842a                	mv	s0,a0
   1053a:	1e4000ef          	jal	ra,1071e <__call_exitprocs>
   1053e:	67c9                	lui	a5,0x12
   10540:	8307b503          	ld	a0,-2000(a5) # 11830 <_global_impure_ptr>
   10544:	6d3c                	ld	a5,88(a0)
   10546:	c391                	beqz	a5,1054a <exit+0x1a>
   10548:	9782                	jalr	a5
   1054a:	8522                	mv	a0,s0
   1054c:	00000097          	auipc	ra,0x0
   10550:	66e080e7          	jalr	1646(ra) # 10bba <_exit>
	...

0000000000010556 <__libc_fini_array>:
   10556:	7179                	addi	sp,sp,-48
   10558:	67c5                	lui	a5,0x11
   1055a:	6745                	lui	a4,0x11
   1055c:	f022                	sd	s0,32(sp)
   1055e:	00870713          	addi	a4,a4,8 # 11008 <__init_array_end>
   10562:	01078413          	addi	s0,a5,16 # 11010 <__fini_array_end>
   10566:	8c19                	sub	s0,s0,a4
   10568:	ec26                	sd	s1,24(sp)
   1056a:	e84a                	sd	s2,16(sp)
   1056c:	e44e                	sd	s3,8(sp)
   1056e:	f406                	sd	ra,40(sp)
   10570:	840d                	srai	s0,s0,0x3
   10572:	4481                	li	s1,0
   10574:	01078913          	addi	s2,a5,16
   10578:	59e1                	li	s3,-8
   1057a:	00941c63          	bne	s0,s1,10592 <__libc_fini_array+0x3c>
   1057e:	7402                	ld	s0,32(sp)
   10580:	70a2                	ld	ra,40(sp)
   10582:	64e2                	ld	s1,24(sp)
   10584:	6942                	ld	s2,16(sp)
   10586:	69a2                	ld	s3,8(sp)
   10588:	6145                	addi	sp,sp,48
   1058a:	00000317          	auipc	t1,0x0
   1058e:	b6830067          	jr	-1176(t1) # 100f2 <_fini>
   10592:	033487b3          	mul	a5,s1,s3
   10596:	0485                	addi	s1,s1,1
   10598:	97ca                	add	a5,a5,s2
   1059a:	ff87b783          	ld	a5,-8(a5)
   1059e:	9782                	jalr	a5
   105a0:	bfe9                	j	1057a <__libc_fini_array+0x24>
	...

00000000000105a4 <__libc_init_array>:
   105a4:	1101                	addi	sp,sp,-32
   105a6:	e822                	sd	s0,16(sp)
   105a8:	e426                	sd	s1,8(sp)
   105aa:	6445                	lui	s0,0x11
   105ac:	64c5                	lui	s1,0x11
   105ae:	00048793          	mv	a5,s1
   105b2:	00040413          	mv	s0,s0
   105b6:	8c1d                	sub	s0,s0,a5
   105b8:	e04a                	sd	s2,0(sp)
   105ba:	ec06                	sd	ra,24(sp)
   105bc:	840d                	srai	s0,s0,0x3
   105be:	00048493          	mv	s1,s1
   105c2:	4901                	li	s2,0
   105c4:	02891963          	bne	s2,s0,105f6 <__libc_init_array+0x52>
   105c8:	64c5                	lui	s1,0x11
   105ca:	00000097          	auipc	ra,0x0
   105ce:	b28080e7          	jalr	-1240(ra) # 100f2 <_fini>
   105d2:	6445                	lui	s0,0x11
   105d4:	00048793          	mv	a5,s1
   105d8:	00840413          	addi	s0,s0,8 # 11008 <__init_array_end>
   105dc:	8c1d                	sub	s0,s0,a5
   105de:	840d                	srai	s0,s0,0x3
   105e0:	00048493          	mv	s1,s1
   105e4:	4901                	li	s2,0
   105e6:	00891d63          	bne	s2,s0,10600 <__libc_init_array+0x5c>
   105ea:	60e2                	ld	ra,24(sp)
   105ec:	6442                	ld	s0,16(sp)
   105ee:	64a2                	ld	s1,8(sp)
   105f0:	6902                	ld	s2,0(sp)
   105f2:	6105                	addi	sp,sp,32
   105f4:	8082                	ret
   105f6:	609c                	ld	a5,0(s1)
   105f8:	0905                	addi	s2,s2,1
   105fa:	04a1                	addi	s1,s1,8
   105fc:	9782                	jalr	a5
   105fe:	b7d9                	j	105c4 <__libc_init_array+0x20>
   10600:	609c                	ld	a5,0(s1)
   10602:	0905                	addi	s2,s2,1
   10604:	04a1                	addi	s1,s1,8
   10606:	9782                	jalr	a5
   10608:	bff9                	j	105e6 <__libc_init_array+0x42>
	...

000000000001060c <memset>:
   1060c:	483d                	li	a6,15
   1060e:	872a                	mv	a4,a0
   10610:	02c87163          	bleu	a2,a6,10632 <memset+0x26>
   10614:	00f77793          	andi	a5,a4,15
   10618:	e3c1                	bnez	a5,10698 <memset+0x8c>
   1061a:	e1bd                	bnez	a1,10680 <memset+0x74>
   1061c:	ff067693          	andi	a3,a2,-16
   10620:	8a3d                	andi	a2,a2,15
   10622:	96ba                	add	a3,a3,a4
   10624:	e30c                	sd	a1,0(a4)
   10626:	e70c                	sd	a1,8(a4)
   10628:	0741                	addi	a4,a4,16
   1062a:	fed76de3          	bltu	a4,a3,10624 <memset+0x18>
   1062e:	e211                	bnez	a2,10632 <memset+0x26>
   10630:	8082                	ret
   10632:	40c806b3          	sub	a3,a6,a2
   10636:	068a                	slli	a3,a3,0x2
   10638:	00000297          	auipc	t0,0x0
   1063c:	9696                	add	a3,a3,t0
   1063e:	00a68067          	jr	10(a3)
   10642:	00b70723          	sb	a1,14(a4)
   10646:	00b706a3          	sb	a1,13(a4)
   1064a:	00b70623          	sb	a1,12(a4)
   1064e:	00b705a3          	sb	a1,11(a4)
   10652:	00b70523          	sb	a1,10(a4)
   10656:	00b704a3          	sb	a1,9(a4)
   1065a:	00b70423          	sb	a1,8(a4)
   1065e:	00b703a3          	sb	a1,7(a4)
   10662:	00b70323          	sb	a1,6(a4)
   10666:	00b702a3          	sb	a1,5(a4)
   1066a:	00b70223          	sb	a1,4(a4)
   1066e:	00b701a3          	sb	a1,3(a4)
   10672:	00b70123          	sb	a1,2(a4)
   10676:	00b700a3          	sb	a1,1(a4)
   1067a:	00b70023          	sb	a1,0(a4)
   1067e:	8082                	ret
   10680:	0ff5f593          	andi	a1,a1,255
   10684:	00859693          	slli	a3,a1,0x8
   10688:	8dd5                	or	a1,a1,a3
   1068a:	01059693          	slli	a3,a1,0x10
   1068e:	8dd5                	or	a1,a1,a3
   10690:	02059693          	slli	a3,a1,0x20
   10694:	8dd5                	or	a1,a1,a3
   10696:	b759                	j	1061c <memset+0x10>
   10698:	00279693          	slli	a3,a5,0x2
   1069c:	00000297          	auipc	t0,0x0
   106a0:	9696                	add	a3,a3,t0
   106a2:	8286                	mv	t0,ra
   106a4:	fa2680e7          	jalr	-94(a3)
   106a8:	8096                	mv	ra,t0
   106aa:	17c1                	addi	a5,a5,-16
   106ac:	8f1d                	sub	a4,a4,a5
   106ae:	963e                	add	a2,a2,a5
   106b0:	f8c871e3          	bleu	a2,a6,10632 <memset+0x26>
   106b4:	b79d                	j	1061a <memset+0xe>

00000000000106b6 <__register_exitproc>:
   106b6:	67c9                	lui	a5,0x12
   106b8:	8307b703          	ld	a4,-2000(a5) # 11830 <_global_impure_ptr>
   106bc:	832a                	mv	t1,a0
   106be:	1f873783          	ld	a5,504(a4)
   106c2:	e789                	bnez	a5,106cc <__register_exitproc+0x16>
   106c4:	20070793          	addi	a5,a4,512
   106c8:	1ef73c23          	sd	a5,504(a4)
   106cc:	4798                	lw	a4,8(a5)
   106ce:	487d                	li	a6,31
   106d0:	557d                	li	a0,-1
   106d2:	04e84463          	blt	a6,a4,1071a <__register_exitproc+0x64>
   106d6:	02030a63          	beqz	t1,1070a <__register_exitproc+0x54>
   106da:	00371813          	slli	a6,a4,0x3
   106de:	983e                	add	a6,a6,a5
   106e0:	10c83823          	sd	a2,272(a6)
   106e4:	3107a883          	lw	a7,784(a5)
   106e8:	4605                	li	a2,1
   106ea:	00e6163b          	sllw	a2,a2,a4
   106ee:	00c8e8b3          	or	a7,a7,a2
   106f2:	3117a823          	sw	a7,784(a5)
   106f6:	20d83823          	sd	a3,528(a6)
   106fa:	4689                	li	a3,2
   106fc:	00d31763          	bne	t1,a3,1070a <__register_exitproc+0x54>
   10700:	3147a683          	lw	a3,788(a5)
   10704:	8e55                	or	a2,a2,a3
   10706:	30c7aa23          	sw	a2,788(a5)
   1070a:	0017069b          	addiw	a3,a4,1
   1070e:	0709                	addi	a4,a4,2
   10710:	070e                	slli	a4,a4,0x3
   10712:	c794                	sw	a3,8(a5)
   10714:	97ba                	add	a5,a5,a4
   10716:	e38c                	sd	a1,0(a5)
   10718:	4501                	li	a0,0
   1071a:	8082                	ret
	...

000000000001071e <__call_exitprocs>:
   1071e:	715d                	addi	sp,sp,-80
   10720:	67c9                	lui	a5,0x12
   10722:	f44e                	sd	s3,40(sp)
   10724:	8307b983          	ld	s3,-2000(a5) # 11830 <_global_impure_ptr>
   10728:	f052                	sd	s4,32(sp)
   1072a:	ec56                	sd	s5,24(sp)
   1072c:	e85a                	sd	s6,16(sp)
   1072e:	e486                	sd	ra,72(sp)
   10730:	e0a2                	sd	s0,64(sp)
   10732:	fc26                	sd	s1,56(sp)
   10734:	f84a                	sd	s2,48(sp)
   10736:	e45e                	sd	s7,8(sp)
   10738:	8aaa                	mv	s5,a0
   1073a:	8a2e                	mv	s4,a1
   1073c:	4b05                	li	s6,1
   1073e:	1f89b403          	ld	s0,504(s3)
   10742:	c801                	beqz	s0,10752 <__call_exitprocs+0x34>
   10744:	4404                	lw	s1,8(s0)
   10746:	34fd                	addiw	s1,s1,-1
   10748:	00349913          	slli	s2,s1,0x3
   1074c:	9922                	add	s2,s2,s0
   1074e:	0004dd63          	bgez	s1,10768 <__call_exitprocs+0x4a>
   10752:	60a6                	ld	ra,72(sp)
   10754:	6406                	ld	s0,64(sp)
   10756:	74e2                	ld	s1,56(sp)
   10758:	7942                	ld	s2,48(sp)
   1075a:	79a2                	ld	s3,40(sp)
   1075c:	7a02                	ld	s4,32(sp)
   1075e:	6ae2                	ld	s5,24(sp)
   10760:	6b42                	ld	s6,16(sp)
   10762:	6ba2                	ld	s7,8(sp)
   10764:	6161                	addi	sp,sp,80
   10766:	8082                	ret
   10768:	000a0963          	beqz	s4,1077a <__call_exitprocs+0x5c>
   1076c:	21093783          	ld	a5,528(s2)
   10770:	01478563          	beq	a5,s4,1077a <__call_exitprocs+0x5c>
   10774:	34fd                	addiw	s1,s1,-1
   10776:	1961                	addi	s2,s2,-8
   10778:	bfd9                	j	1074e <__call_exitprocs+0x30>
   1077a:	441c                	lw	a5,8(s0)
   1077c:	01093683          	ld	a3,16(s2)
   10780:	37fd                	addiw	a5,a5,-1
   10782:	02979663          	bne	a5,s1,107ae <__call_exitprocs+0x90>
   10786:	c404                	sw	s1,8(s0)
   10788:	d6f5                	beqz	a3,10774 <__call_exitprocs+0x56>
   1078a:	31042703          	lw	a4,784(s0)
   1078e:	009b163b          	sllw	a2,s6,s1
   10792:	00842b83          	lw	s7,8(s0)
   10796:	8f71                	and	a4,a4,a2
   10798:	2701                	sext.w	a4,a4
   1079a:	ef09                	bnez	a4,107b4 <__call_exitprocs+0x96>
   1079c:	9682                	jalr	a3
   1079e:	4418                	lw	a4,8(s0)
   107a0:	1f89b783          	ld	a5,504(s3)
   107a4:	f9771de3          	bne	a4,s7,1073e <__call_exitprocs+0x20>
   107a8:	fcf406e3          	beq	s0,a5,10774 <__call_exitprocs+0x56>
   107ac:	bf49                	j	1073e <__call_exitprocs+0x20>
   107ae:	00093823          	sd	zero,16(s2)
   107b2:	bfd9                	j	10788 <__call_exitprocs+0x6a>
   107b4:	31442783          	lw	a5,788(s0)
   107b8:	11093583          	ld	a1,272(s2)
   107bc:	8ff1                	and	a5,a5,a2
   107be:	2781                	sext.w	a5,a5
   107c0:	e781                	bnez	a5,107c8 <__call_exitprocs+0xaa>
   107c2:	8556                	mv	a0,s5
   107c4:	9682                	jalr	a3
   107c6:	bfe1                	j	1079e <__call_exitprocs+0x80>
   107c8:	852e                	mv	a0,a1
   107ca:	9682                	jalr	a3
   107cc:	bfc9                	j	1079e <__call_exitprocs+0x80>
	...

00000000000107d0 <conv_stat>:
   107d0:	619c                	ld	a5,0(a1)
   107d2:	00f51023          	sh	a5,0(a0)
   107d6:	659c                	ld	a5,8(a1)
   107d8:	00f51123          	sh	a5,2(a0)
   107dc:	499c                	lw	a5,16(a1)
   107de:	c15c                	sw	a5,4(a0)
   107e0:	49dc                	lw	a5,20(a1)
   107e2:	00f51423          	sh	a5,8(a0)
   107e6:	4d9c                	lw	a5,24(a1)
   107e8:	00f51523          	sh	a5,10(a0)
   107ec:	4ddc                	lw	a5,28(a1)
   107ee:	00f51623          	sh	a5,12(a0)
   107f2:	719c                	ld	a5,32(a1)
   107f4:	00f51723          	sh	a5,14(a0)
   107f8:	799c                	ld	a5,48(a1)
   107fa:	e91c                	sd	a5,16(a0)
   107fc:	61bc                	ld	a5,64(a1)
   107fe:	e93c                	sd	a5,80(a0)
   10800:	5d9c                	lw	a5,56(a1)
   10802:	e53c                	sd	a5,72(a0)
   10804:	65bc                	ld	a5,72(a1)
   10806:	ed1c                	sd	a5,24(a0)
   10808:	6dbc                	ld	a5,88(a1)
   1080a:	f51c                	sd	a5,40(a0)
   1080c:	75bc                	ld	a5,104(a1)
   1080e:	fd1c                	sd	a5,56(a0)
   10810:	8082                	ret

0000000000010812 <__syscall_error>:
   10812:	1141                	addi	sp,sp,-16
   10814:	e022                	sd	s0,0(sp)
   10816:	e406                	sd	ra,8(sp)
   10818:	842a                	mv	s0,a0
   1081a:	00000097          	auipc	ra,0x0
   1081e:	3ba080e7          	jalr	954(ra) # 10bd4 <__errno>
   10822:	408007bb          	negw	a5,s0
   10826:	60a2                	ld	ra,8(sp)
   10828:	6402                	ld	s0,0(sp)
   1082a:	c11c                	sw	a5,0(a0)
   1082c:	557d                	li	a0,-1
   1082e:	0141                	addi	sp,sp,16
   10830:	8082                	ret

0000000000010832 <__internal_syscall>:
   10832:	88aa                	mv	a7,a0
   10834:	852e                	mv	a0,a1
   10836:	85b2                	mv	a1,a2
   10838:	8636                	mv	a2,a3
   1083a:	86ba                	mv	a3,a4
   1083c:	00000073          	ecall
   10840:	00055663          	bgez	a0,1084c <__internal_syscall+0x1a>
   10844:	00000317          	auipc	t1,0x0
   10848:	fce30067          	jr	-50(t1) # 10812 <__syscall_error>
   1084c:	8082                	ret

000000000001084e <open>:
   1084e:	1141                	addi	sp,sp,-16
   10850:	86b2                	mv	a3,a2
   10852:	4701                	li	a4,0
   10854:	862e                	mv	a2,a1
   10856:	85aa                	mv	a1,a0
   10858:	40000513          	li	a0,1024
   1085c:	e406                	sd	ra,8(sp)
   1085e:	00000097          	auipc	ra,0x0
   10862:	fd4080e7          	jalr	-44(ra) # 10832 <__internal_syscall>
   10866:	60a2                	ld	ra,8(sp)
   10868:	2501                	sext.w	a0,a0
   1086a:	0141                	addi	sp,sp,16
   1086c:	8082                	ret

000000000001086e <openat>:
   1086e:	1141                	addi	sp,sp,-16
   10870:	8736                	mv	a4,a3
   10872:	86b2                	mv	a3,a2
   10874:	862e                	mv	a2,a1
   10876:	85aa                	mv	a1,a0
   10878:	03800513          	li	a0,56
   1087c:	e406                	sd	ra,8(sp)
   1087e:	fb5ff0ef          	jal	ra,10832 <__internal_syscall>
   10882:	60a2                	ld	ra,8(sp)
   10884:	2501                	sext.w	a0,a0
   10886:	0141                	addi	sp,sp,16
   10888:	8082                	ret

000000000001088a <lseek>:
   1088a:	86b2                	mv	a3,a2
   1088c:	4701                	li	a4,0
   1088e:	862e                	mv	a2,a1
   10890:	85aa                	mv	a1,a0
   10892:	03e00513          	li	a0,62
   10896:	00000317          	auipc	t1,0x0
   1089a:	f9c30067          	jr	-100(t1) # 10832 <__internal_syscall>

000000000001089e <read>:
   1089e:	86b2                	mv	a3,a2
   108a0:	4701                	li	a4,0
   108a2:	862e                	mv	a2,a1
   108a4:	85aa                	mv	a1,a0
   108a6:	03f00513          	li	a0,63
   108aa:	f89ff06f          	j	10832 <__internal_syscall>

00000000000108ae <write>:
   108ae:	86b2                	mv	a3,a2
   108b0:	4701                	li	a4,0
   108b2:	862e                	mv	a2,a1
   108b4:	85aa                	mv	a1,a0
   108b6:	04000513          	li	a0,64
   108ba:	00000317          	auipc	t1,0x0
   108be:	f7830067          	jr	-136(t1) # 10832 <__internal_syscall>

00000000000108c2 <fstat>:
   108c2:	7135                	addi	sp,sp,-160
   108c4:	e526                	sd	s1,136(sp)
   108c6:	860a                	mv	a2,sp
   108c8:	84ae                	mv	s1,a1
   108ca:	4701                	li	a4,0
   108cc:	85aa                	mv	a1,a0
   108ce:	4681                	li	a3,0
   108d0:	05000513          	li	a0,80
   108d4:	ed06                	sd	ra,152(sp)
   108d6:	e922                	sd	s0,144(sp)
   108d8:	f5bff0ef          	jal	ra,10832 <__internal_syscall>
   108dc:	842a                	mv	s0,a0
   108de:	858a                	mv	a1,sp
   108e0:	8526                	mv	a0,s1
   108e2:	eefff0ef          	jal	ra,107d0 <conv_stat>
   108e6:	0004051b          	sext.w	a0,s0
   108ea:	60ea                	ld	ra,152(sp)
   108ec:	644a                	ld	s0,144(sp)
   108ee:	64aa                	ld	s1,136(sp)
   108f0:	610d                	addi	sp,sp,160
   108f2:	8082                	ret

00000000000108f4 <stat>:
   108f4:	7135                	addi	sp,sp,-160
   108f6:	e526                	sd	s1,136(sp)
   108f8:	860a                	mv	a2,sp
   108fa:	84ae                	mv	s1,a1
   108fc:	4701                	li	a4,0
   108fe:	85aa                	mv	a1,a0
   10900:	4681                	li	a3,0
   10902:	40e00513          	li	a0,1038
   10906:	ed06                	sd	ra,152(sp)
   10908:	e922                	sd	s0,144(sp)
   1090a:	00000097          	auipc	ra,0x0
   1090e:	f28080e7          	jalr	-216(ra) # 10832 <__internal_syscall>
   10912:	842a                	mv	s0,a0
   10914:	858a                	mv	a1,sp
   10916:	8526                	mv	a0,s1
   10918:	00000097          	auipc	ra,0x0
   1091c:	eb8080e7          	jalr	-328(ra) # 107d0 <conv_stat>
   10920:	0004051b          	sext.w	a0,s0
   10924:	60ea                	ld	ra,152(sp)
   10926:	644a                	ld	s0,144(sp)
   10928:	64aa                	ld	s1,136(sp)
   1092a:	610d                	addi	sp,sp,160
   1092c:	8082                	ret

000000000001092e <lstat>:
   1092e:	7135                	addi	sp,sp,-160
   10930:	e526                	sd	s1,136(sp)
   10932:	860a                	mv	a2,sp
   10934:	84ae                	mv	s1,a1
   10936:	4701                	li	a4,0
   10938:	85aa                	mv	a1,a0
   1093a:	4681                	li	a3,0
   1093c:	40f00513          	li	a0,1039
   10940:	ed06                	sd	ra,152(sp)
   10942:	e922                	sd	s0,144(sp)
   10944:	eefff0ef          	jal	ra,10832 <__internal_syscall>
   10948:	842a                	mv	s0,a0
   1094a:	858a                	mv	a1,sp
   1094c:	8526                	mv	a0,s1
   1094e:	e83ff0ef          	jal	ra,107d0 <conv_stat>
   10952:	0004051b          	sext.w	a0,s0
   10956:	60ea                	ld	ra,152(sp)
   10958:	644a                	ld	s0,144(sp)
   1095a:	64aa                	ld	s1,136(sp)
   1095c:	610d                	addi	sp,sp,160
   1095e:	8082                	ret

0000000000010960 <fstatat>:
   10960:	7135                	addi	sp,sp,-160
   10962:	e526                	sd	s1,136(sp)
   10964:	8736                	mv	a4,a3
   10966:	84b2                	mv	s1,a2
   10968:	868a                	mv	a3,sp
   1096a:	862e                	mv	a2,a1
   1096c:	85aa                	mv	a1,a0
   1096e:	04f00513          	li	a0,79
   10972:	ed06                	sd	ra,152(sp)
   10974:	e922                	sd	s0,144(sp)
   10976:	00000097          	auipc	ra,0x0
   1097a:	ebc080e7          	jalr	-324(ra) # 10832 <__internal_syscall>
   1097e:	842a                	mv	s0,a0
   10980:	858a                	mv	a1,sp
   10982:	8526                	mv	a0,s1
   10984:	00000097          	auipc	ra,0x0
   10988:	e4c080e7          	jalr	-436(ra) # 107d0 <conv_stat>
   1098c:	0004051b          	sext.w	a0,s0
   10990:	60ea                	ld	ra,152(sp)
   10992:	644a                	ld	s0,144(sp)
   10994:	64aa                	ld	s1,136(sp)
   10996:	610d                	addi	sp,sp,160
   10998:	8082                	ret

000000000001099a <access>:
   1099a:	1141                	addi	sp,sp,-16
   1099c:	862e                	mv	a2,a1
   1099e:	4701                	li	a4,0
   109a0:	85aa                	mv	a1,a0
   109a2:	4681                	li	a3,0
   109a4:	40900513          	li	a0,1033
   109a8:	e406                	sd	ra,8(sp)
   109aa:	e89ff0ef          	jal	ra,10832 <__internal_syscall>
   109ae:	60a2                	ld	ra,8(sp)
   109b0:	2501                	sext.w	a0,a0
   109b2:	0141                	addi	sp,sp,16
   109b4:	8082                	ret

00000000000109b6 <faccessat>:
   109b6:	1141                	addi	sp,sp,-16
   109b8:	8736                	mv	a4,a3
   109ba:	86b2                	mv	a3,a2
   109bc:	862e                	mv	a2,a1
   109be:	85aa                	mv	a1,a0
   109c0:	03000513          	li	a0,48
   109c4:	e406                	sd	ra,8(sp)
   109c6:	00000097          	auipc	ra,0x0
   109ca:	e6c080e7          	jalr	-404(ra) # 10832 <__internal_syscall>
   109ce:	60a2                	ld	ra,8(sp)
   109d0:	2501                	sext.w	a0,a0
   109d2:	0141                	addi	sp,sp,16
   109d4:	8082                	ret

00000000000109d6 <close>:
   109d6:	1141                	addi	sp,sp,-16
   109d8:	85aa                	mv	a1,a0
   109da:	4701                	li	a4,0
   109dc:	4681                	li	a3,0
   109de:	4601                	li	a2,0
   109e0:	03900513          	li	a0,57
   109e4:	e406                	sd	ra,8(sp)
   109e6:	e4dff0ef          	jal	ra,10832 <__internal_syscall>
   109ea:	60a2                	ld	ra,8(sp)
   109ec:	2501                	sext.w	a0,a0
   109ee:	0141                	addi	sp,sp,16
   109f0:	8082                	ret

00000000000109f2 <link>:
   109f2:	1141                	addi	sp,sp,-16
   109f4:	862e                	mv	a2,a1
   109f6:	4701                	li	a4,0
   109f8:	85aa                	mv	a1,a0
   109fa:	4681                	li	a3,0
   109fc:	40100513          	li	a0,1025
   10a00:	e406                	sd	ra,8(sp)
   10a02:	00000097          	auipc	ra,0x0
   10a06:	e30080e7          	jalr	-464(ra) # 10832 <__internal_syscall>
   10a0a:	60a2                	ld	ra,8(sp)
   10a0c:	2501                	sext.w	a0,a0
   10a0e:	0141                	addi	sp,sp,16
   10a10:	8082                	ret

0000000000010a12 <unlink>:
   10a12:	1141                	addi	sp,sp,-16
   10a14:	85aa                	mv	a1,a0
   10a16:	4701                	li	a4,0
   10a18:	4681                	li	a3,0
   10a1a:	4601                	li	a2,0
   10a1c:	40200513          	li	a0,1026
   10a20:	e406                	sd	ra,8(sp)
   10a22:	e11ff0ef          	jal	ra,10832 <__internal_syscall>
   10a26:	60a2                	ld	ra,8(sp)
   10a28:	2501                	sext.w	a0,a0
   10a2a:	0141                	addi	sp,sp,16
   10a2c:	8082                	ret

0000000000010a2e <execve>:
   10a2e:	1141                	addi	sp,sp,-16
   10a30:	e406                	sd	ra,8(sp)
   10a32:	00000097          	auipc	ra,0x0
   10a36:	1a2080e7          	jalr	418(ra) # 10bd4 <__errno>
   10a3a:	60a2                	ld	ra,8(sp)
   10a3c:	47b1                	li	a5,12
   10a3e:	c11c                	sw	a5,0(a0)
   10a40:	557d                	li	a0,-1
   10a42:	0141                	addi	sp,sp,16
   10a44:	8082                	ret

0000000000010a46 <fork>:
   10a46:	1141                	addi	sp,sp,-16
   10a48:	e406                	sd	ra,8(sp)
   10a4a:	18a000ef          	jal	ra,10bd4 <__errno>
   10a4e:	60a2                	ld	ra,8(sp)
   10a50:	47ad                	li	a5,11
   10a52:	c11c                	sw	a5,0(a0)
   10a54:	557d                	li	a0,-1
   10a56:	0141                	addi	sp,sp,16
   10a58:	8082                	ret

0000000000010a5a <getpid>:
   10a5a:	4505                	li	a0,1
   10a5c:	8082                	ret

0000000000010a5e <kill>:
   10a5e:	1141                	addi	sp,sp,-16
   10a60:	e406                	sd	ra,8(sp)
   10a62:	172000ef          	jal	ra,10bd4 <__errno>
   10a66:	60a2                	ld	ra,8(sp)
   10a68:	47d9                	li	a5,22
   10a6a:	c11c                	sw	a5,0(a0)
   10a6c:	557d                	li	a0,-1
   10a6e:	0141                	addi	sp,sp,16
   10a70:	8082                	ret

0000000000010a72 <wait>:
   10a72:	1141                	addi	sp,sp,-16
   10a74:	e406                	sd	ra,8(sp)
   10a76:	00000097          	auipc	ra,0x0
   10a7a:	15e080e7          	jalr	350(ra) # 10bd4 <__errno>
   10a7e:	60a2                	ld	ra,8(sp)
   10a80:	47a9                	li	a5,10
   10a82:	c11c                	sw	a5,0(a0)
   10a84:	557d                	li	a0,-1
   10a86:	0141                	addi	sp,sp,16
   10a88:	8082                	ret

0000000000010a8a <isatty>:
   10a8a:	7119                	addi	sp,sp,-128
   10a8c:	002c                	addi	a1,sp,8
   10a8e:	fc86                	sd	ra,120(sp)
   10a90:	e33ff0ef          	jal	ra,108c2 <fstat>
   10a94:	57fd                	li	a5,-1
   10a96:	00f50663          	beq	a0,a5,10aa2 <isatty+0x18>
   10a9a:	4532                	lw	a0,12(sp)
   10a9c:	40d5551b          	sraiw	a0,a0,0xd
   10aa0:	8905                	andi	a0,a0,1
   10aa2:	70e6                	ld	ra,120(sp)
   10aa4:	6109                	addi	sp,sp,128
   10aa6:	8082                	ret

0000000000010aa8 <gettimeofday>:
   10aa8:	1141                	addi	sp,sp,-16
   10aaa:	85aa                	mv	a1,a0
   10aac:	4701                	li	a4,0
   10aae:	4681                	li	a3,0
   10ab0:	4601                	li	a2,0
   10ab2:	0a900513          	li	a0,169
   10ab6:	e406                	sd	ra,8(sp)
   10ab8:	00000097          	auipc	ra,0x0
   10abc:	d7a080e7          	jalr	-646(ra) # 10832 <__internal_syscall>
   10ac0:	60a2                	ld	ra,8(sp)
   10ac2:	2501                	sext.w	a0,a0
   10ac4:	0141                	addi	sp,sp,16
   10ac6:	8082                	ret

0000000000010ac8 <times>:
   10ac8:	7179                	addi	sp,sp,-48
   10aca:	f022                	sd	s0,32(sp)
   10acc:	842a                	mv	s0,a0
   10ace:	8581b783          	ld	a5,-1960(gp) # 11880 <t0.2574>
   10ad2:	ec26                	sd	s1,24(sp)
   10ad4:	f406                	sd	ra,40(sp)
   10ad6:	85818493          	addi	s1,gp,-1960 # 11880 <t0.2574>
   10ada:	eb81                	bnez	a5,10aea <times+0x22>
   10adc:	4581                	li	a1,0
   10ade:	85818513          	addi	a0,gp,-1960 # 11880 <t0.2574>
   10ae2:	00000097          	auipc	ra,0x0
   10ae6:	fc6080e7          	jalr	-58(ra) # 10aa8 <gettimeofday>
   10aea:	850a                	mv	a0,sp
   10aec:	4581                	li	a1,0
   10aee:	00000097          	auipc	ra,0x0
   10af2:	fba080e7          	jalr	-70(ra) # 10aa8 <gettimeofday>
   10af6:	6098                	ld	a4,0(s1)
   10af8:	6782                	ld	a5,0(sp)
   10afa:	6494                	ld	a3,8(s1)
   10afc:	00043823          	sd	zero,16(s0)
   10b00:	8f99                	sub	a5,a5,a4
   10b02:	000f4737          	lui	a4,0xf4
   10b06:	24070713          	addi	a4,a4,576 # f4240 <__global_pointer$+0xe2218>
   10b0a:	02e787b3          	mul	a5,a5,a4
   10b0e:	6722                	ld	a4,8(sp)
   10b10:	00043c23          	sd	zero,24(s0)
   10b14:	00043423          	sd	zero,8(s0)
   10b18:	8f15                	sub	a4,a4,a3
   10b1a:	70a2                	ld	ra,40(sp)
   10b1c:	64e2                	ld	s1,24(sp)
   10b1e:	557d                	li	a0,-1
   10b20:	97ba                	add	a5,a5,a4
   10b22:	e01c                	sd	a5,0(s0)
   10b24:	7402                	ld	s0,32(sp)
   10b26:	6145                	addi	sp,sp,48
   10b28:	8082                	ret

0000000000010b2a <ftime>:
   10b2a:	00051423          	sh	zero,8(a0)
   10b2e:	00053023          	sd	zero,0(a0)
   10b32:	4501                	li	a0,0
   10b34:	8082                	ret

0000000000010b36 <utime>:
   10b36:	557d                	li	a0,-1
   10b38:	8082                	ret

0000000000010b3a <chown>:
   10b3a:	557d                	li	a0,-1
   10b3c:	8082                	ret

0000000000010b3e <chmod>:
   10b3e:	557d                	li	a0,-1
   10b40:	8082                	ret

0000000000010b42 <chdir>:
   10b42:	557d                	li	a0,-1
   10b44:	8082                	ret

0000000000010b46 <getcwd>:
   10b46:	4501                	li	a0,0
   10b48:	8082                	ret

0000000000010b4a <sysconf>:
   10b4a:	4789                	li	a5,2
   10b4c:	00f50463          	beq	a0,a5,10b54 <sysconf+0xa>
   10b50:	557d                	li	a0,-1
   10b52:	8082                	ret
   10b54:	000f4537          	lui	a0,0xf4
   10b58:	24050513          	addi	a0,a0,576 # f4240 <__global_pointer$+0xe2218>
   10b5c:	8082                	ret

0000000000010b5e <sbrk>:
   10b5e:	1101                	addi	sp,sp,-32
   10b60:	e822                	sd	s0,16(sp)
   10b62:	8181b783          	ld	a5,-2024(gp) # 11840 <_edata>
   10b66:	e426                	sd	s1,8(sp)
   10b68:	ec06                	sd	ra,24(sp)
   10b6a:	84aa                	mv	s1,a0
   10b6c:	e785                	bnez	a5,10b94 <sbrk+0x36>
   10b6e:	4701                	li	a4,0
   10b70:	4681                	li	a3,0
   10b72:	4601                	li	a2,0
   10b74:	4581                	li	a1,0
   10b76:	0d600513          	li	a0,214
   10b7a:	cb9ff0ef          	jal	ra,10832 <__internal_syscall>
   10b7e:	57fd                	li	a5,-1
   10b80:	00f51863          	bne	a0,a5,10b90 <sbrk+0x32>
   10b84:	557d                	li	a0,-1
   10b86:	60e2                	ld	ra,24(sp)
   10b88:	6442                	ld	s0,16(sp)
   10b8a:	64a2                	ld	s1,8(sp)
   10b8c:	6105                	addi	sp,sp,32
   10b8e:	8082                	ret
   10b90:	80a1bc23          	sd	a0,-2024(gp) # 11840 <_edata>
   10b94:	8181b583          	ld	a1,-2024(gp) # 11840 <_edata>
   10b98:	4701                	li	a4,0
   10b9a:	4681                	li	a3,0
   10b9c:	95a6                	add	a1,a1,s1
   10b9e:	4601                	li	a2,0
   10ba0:	0d600513          	li	a0,214
   10ba4:	c8fff0ef          	jal	ra,10832 <__internal_syscall>
   10ba8:	8181b783          	ld	a5,-2024(gp) # 11840 <_edata>
   10bac:	94be                	add	s1,s1,a5
   10bae:	fc951be3          	bne	a0,s1,10b84 <sbrk+0x26>
   10bb2:	80a1bc23          	sd	a0,-2024(gp) # 11840 <_edata>
   10bb6:	853e                	mv	a0,a5
   10bb8:	b7f9                	j	10b86 <sbrk+0x28>

0000000000010bba <_exit>:
   10bba:	1141                	addi	sp,sp,-16
   10bbc:	85aa                	mv	a1,a0
   10bbe:	4701                	li	a4,0
   10bc0:	4681                	li	a3,0
   10bc2:	4601                	li	a2,0
   10bc4:	05d00513          	li	a0,93
   10bc8:	e406                	sd	ra,8(sp)
   10bca:	00000097          	auipc	ra,0x0
   10bce:	c68080e7          	jalr	-920(ra) # 10832 <__internal_syscall>
   10bd2:	a001                	j	10bd2 <_exit+0x18>

0000000000010bd4 <__errno>:
   10bd4:	8101b503          	ld	a0,-2032(gp) # 11838 <_impure_ptr>
   10bd8:	8082                	ret
	...

Disassembly of section .eh_frame:

0000000000010bdc <__EH_FRAME_BEGIN__>:
   10bdc:	0000                	unimp
	...

Disassembly of section .init_array:

0000000000011000 <__frame_dummy_init_array_entry>:
   11000:	017e                	slli	sp,sp,0x1f
   11002:	0001                	nop
   11004:	0000                	unimp
	...

Disassembly of section .fini_array:

0000000000011008 <__do_global_dtors_aux_fini_array_entry>:
   11008:	0144                	addi	s1,sp,132
   1100a:	0001                	nop
   1100c:	0000                	unimp
	...

Disassembly of section .data:

0000000000011010 <A>:
   11010:	0001                	nop
   11012:	0000                	unimp
   11014:	0002                	0x2
   11016:	0000                	unimp
   11018:	00000003          	lb	zero,0(zero) # 0 <_start-0x100b0>
   1101c:	0004                	addi	s1,sp,0
   1101e:	0000                	unimp
   11020:	0005                	c.addi	zero,1
   11022:	0000                	unimp
   11024:	0001                	nop
   11026:	0000                	unimp
   11028:	0002                	0x2
   1102a:	0000                	unimp
   1102c:	00000003          	lb	zero,0(zero) # 0 <_start-0x100b0>
   11030:	0004                	addi	s1,sp,0
   11032:	0000                	unimp
   11034:	0005                	c.addi	zero,1
   11036:	0000                	unimp
   11038:	0001                	nop
   1103a:	0000                	unimp
   1103c:	0002                	0x2
   1103e:	0000                	unimp
   11040:	00000003          	lb	zero,0(zero) # 0 <_start-0x100b0>
   11044:	0004                	addi	s1,sp,0
   11046:	0000                	unimp
   11048:	0005                	c.addi	zero,1
   1104a:	0000                	unimp
   1104c:	0001                	nop
   1104e:	0000                	unimp
   11050:	0002                	0x2
   11052:	0000                	unimp
   11054:	00000003          	lb	zero,0(zero) # 0 <_start-0x100b0>
   11058:	0004                	addi	s1,sp,0
   1105a:	0000                	unimp
   1105c:	0005                	c.addi	zero,1
   1105e:	0000                	unimp
   11060:	0001                	nop
   11062:	0000                	unimp
   11064:	0002                	0x2
   11066:	0000                	unimp
   11068:	00000003          	lb	zero,0(zero) # 0 <_start-0x100b0>
   1106c:	0004                	addi	s1,sp,0
   1106e:	0000                	unimp
   11070:	0005                	c.addi	zero,1
   11072:	0000                	unimp
   11074:	0000                	unimp
	...

0000000000011078 <B>:
   11078:	0001                	nop
   1107a:	0000                	unimp
   1107c:	0002                	0x2
   1107e:	0000                	unimp
   11080:	00000003          	lb	zero,0(zero) # 0 <_start-0x100b0>
   11084:	0004                	addi	s1,sp,0
   11086:	0000                	unimp
   11088:	0005                	c.addi	zero,1
   1108a:	0000                	unimp
   1108c:	0006                	0x6
   1108e:	0000                	unimp
   11090:	00000007          	0x7
   11094:	0008                	addi	a0,sp,0
   11096:	0000                	unimp
   11098:	0009                	c.addi	zero,2
   1109a:	0000                	unimp
   1109c:	000a                	0xa
   1109e:	0000                	unimp
   110a0:	0001                	nop
   110a2:	0000                	unimp
   110a4:	0002                	0x2
   110a6:	0000                	unimp
   110a8:	00000003          	lb	zero,0(zero) # 0 <_start-0x100b0>
   110ac:	0004                	addi	s1,sp,0
   110ae:	0000                	unimp
   110b0:	0005                	c.addi	zero,1
   110b2:	0000                	unimp
   110b4:	0006                	0x6
   110b6:	0000                	unimp
   110b8:	00000007          	0x7
   110bc:	0008                	addi	a0,sp,0
   110be:	0000                	unimp
   110c0:	0009                	c.addi	zero,2
   110c2:	0000                	unimp
   110c4:	000a                	0xa
   110c6:	0000                	unimp
   110c8:	0001                	nop
   110ca:	0000                	unimp
   110cc:	0002                	0x2
   110ce:	0000                	unimp
   110d0:	00000003          	lb	zero,0(zero) # 0 <_start-0x100b0>
   110d4:	0004                	addi	s1,sp,0
   110d6:	0000                	unimp
   110d8:	0005                	c.addi	zero,1
   110da:	0000                	unimp
   110dc:	0000                	unimp
	...

00000000000110e0 <impure_data>:
	...
   110e8:	1618                	addi	a4,sp,800
   110ea:	0001                	nop
   110ec:	0000                	unimp
   110ee:	0000                	unimp
   110f0:	16c8                	addi	a0,sp,868
   110f2:	0001                	nop
   110f4:	0000                	unimp
   110f6:	0000                	unimp
   110f8:	1778                	addi	a4,sp,940
   110fa:	0001                	nop
	...
   111c8:	0001                	nop
   111ca:	0000                	unimp
   111cc:	0000                	unimp
   111ce:	0000                	unimp
   111d0:	330e                	fld	ft6,224(sp)
   111d2:	abcd                	j	117c4 <impure_data+0x6e4>
   111d4:	1234                	addi	a3,sp,296
   111d6:	e66d                	bnez	a2,112c0 <impure_data+0x1e0>
   111d8:	deec                	sw	a1,124(a3)
   111da:	0005                	c.addi	zero,1
   111dc:	0000000b          	0xb
	...

Disassembly of section .sdata:

0000000000011828 <__TMC_END__>:
	...

0000000000011830 <_global_impure_ptr>:
   11830:	10e0                	addi	s0,sp,108
   11832:	0001                	nop
   11834:	0000                	unimp
	...

0000000000011838 <_impure_ptr>:
   11838:	10e0                	addi	s0,sp,108
   1183a:	0001                	nop
   1183c:	0000                	unimp
	...

Disassembly of section .sbss:

0000000000011840 <__bss_start>:
	...

Disassembly of section .bss:

0000000000011848 <completed.5184>:
	...

0000000000011850 <object.5189>:
	...

0000000000011880 <t0.2574>:
	...

0000000000011890 <RES>:
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3720                	fld	fs0,104(a4)
   c:	312e                	fld	ft2,232(sp)
   e:	312e                	fld	ft2,232(sp)
  10:	3220                	fld	fs0,96(a2)
  12:	3130                	fld	fa2,96(a0)
  14:	30353037          	lui	zero,0x30353
  18:	0039                	c.addi	zero,14
