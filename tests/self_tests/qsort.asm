
qsort.riscv：     文件格式 elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <_start>:
   100b0:	00002197          	auipc	gp,0x2
   100b4:	ea818193          	addi	gp,gp,-344 # 11f58 <__global_pointer$>
   100b8:	81818513          	addi	a0,gp,-2024 # 11770 <_edata>
   100bc:	00002617          	auipc	a2,0x2
   100c0:	6a460613          	addi	a2,a2,1700 # 12760 <_end>
   100c4:	8e09                	sub	a2,a2,a0
   100c6:	4581                	li	a1,0
   100c8:	68c000ef          	jal	ra,10754 <memset>
   100cc:	00000517          	auipc	a0,0x0
   100d0:	5d250513          	addi	a0,a0,1490 # 1069e <__libc_fini_array>
   100d4:	00000097          	auipc	ra,0x0
   100d8:	596080e7          	jalr	1430(ra) # 1066a <atexit>
   100dc:	00000097          	auipc	ra,0x0
   100e0:	610080e7          	jalr	1552(ra) # 106ec <__libc_init_array>
   100e4:	4502                	lw	a0,0(sp)
   100e6:	002c                	addi	a1,sp,8
   100e8:	4601                	li	a2,0
   100ea:	39a000ef          	jal	ra,10484 <main>
   100ee:	00000317          	auipc	t1,0x0
   100f2:	58a30067          	jr	1418(t1) # 10678 <exit>

00000000000100f6 <_fini>:
   100f6:	8082                	ret

00000000000100f8 <deregister_tm_clones>:
   100f8:	6545                	lui	a0,0x11
   100fa:	67c5                	lui	a5,0x11
   100fc:	75850713          	addi	a4,a0,1880 # 11758 <__TMC_END__>
   10100:	75878793          	addi	a5,a5,1880 # 11758 <__TMC_END__>
   10104:	00e78b63          	beq	a5,a4,1011a <deregister_tm_clones+0x22>
   10108:	00000337          	lui	t1,0x0
   1010c:	00030313          	mv	t1,t1
   10110:	00030563          	beqz	t1,1011a <deregister_tm_clones+0x22>
   10114:	75850513          	addi	a0,a0,1880
   10118:	8302                	jr	t1
   1011a:	8082                	ret

000000000001011c <register_tm_clones>:
   1011c:	67c5                	lui	a5,0x11
   1011e:	6545                	lui	a0,0x11
   10120:	75878593          	addi	a1,a5,1880 # 11758 <__TMC_END__>
   10124:	75850793          	addi	a5,a0,1880 # 11758 <__TMC_END__>
   10128:	8d9d                	sub	a1,a1,a5
   1012a:	858d                	srai	a1,a1,0x3
   1012c:	4789                	li	a5,2
   1012e:	02f5c5b3          	div	a1,a1,a5
   10132:	c991                	beqz	a1,10146 <register_tm_clones+0x2a>
   10134:	00000337          	lui	t1,0x0
   10138:	00030313          	mv	t1,t1
   1013c:	00030563          	beqz	t1,10146 <register_tm_clones+0x2a>
   10140:	75850513          	addi	a0,a0,1880
   10144:	8302                	jr	t1
   10146:	8082                	ret

0000000000010148 <__do_global_dtors_aux>:
   10148:	8201c703          	lbu	a4,-2016(gp) # 11778 <completed.5184>
   1014c:	eb15                	bnez	a4,10180 <__do_global_dtors_aux+0x38>
   1014e:	1141                	addi	sp,sp,-16
   10150:	e022                	sd	s0,0(sp)
   10152:	e406                	sd	ra,8(sp)
   10154:	843e                	mv	s0,a5
   10156:	fa3ff0ef          	jal	ra,100f8 <deregister_tm_clones>
   1015a:	000007b7          	lui	a5,0x0
   1015e:	00078793          	mv	a5,a5
   10162:	cb81                	beqz	a5,10172 <__do_global_dtors_aux+0x2a>
   10164:	6545                	lui	a0,0x11
   10166:	d2450513          	addi	a0,a0,-732 # 10d24 <__EH_FRAME_BEGIN__>
   1016a:	ffff0097          	auipc	ra,0xffff0
   1016e:	e96080e7          	jalr	-362(ra) # 0 <_start-0x100b0>
   10172:	4785                	li	a5,1
   10174:	82f18023          	sb	a5,-2016(gp) # 11778 <completed.5184>
   10178:	60a2                	ld	ra,8(sp)
   1017a:	6402                	ld	s0,0(sp)
   1017c:	0141                	addi	sp,sp,16
   1017e:	8082                	ret
   10180:	8082                	ret

0000000000010182 <frame_dummy>:
   10182:	000007b7          	lui	a5,0x0
   10186:	00078793          	mv	a5,a5
   1018a:	cf99                	beqz	a5,101a8 <frame_dummy+0x26>
   1018c:	65c5                	lui	a1,0x11
   1018e:	6545                	lui	a0,0x11
   10190:	1141                	addi	sp,sp,-16
   10192:	78058593          	addi	a1,a1,1920 # 11780 <object.5189>
   10196:	d2450513          	addi	a0,a0,-732 # 10d24 <__EH_FRAME_BEGIN__>
   1019a:	e406                	sd	ra,8(sp)
   1019c:	ffff0097          	auipc	ra,0xffff0
   101a0:	e64080e7          	jalr	-412(ra) # 0 <_start-0x100b0>
   101a4:	60a2                	ld	ra,8(sp)
   101a6:	0141                	addi	sp,sp,16
   101a8:	f75ff06f          	j	1011c <register_tm_clones>

00000000000101ac <Qsort>:
   101ac:	fd010113          	addi	sp,sp,-48
   101b0:	02113423          	sd	ra,40(sp)
   101b4:	02813023          	sd	s0,32(sp)
   101b8:	03010413          	addi	s0,sp,48
   101bc:	fca43c23          	sd	a0,-40(s0)
   101c0:	00058793          	mv	a5,a1
   101c4:	00060713          	mv	a4,a2
   101c8:	fcf42a23          	sw	a5,-44(s0)
   101cc:	00070793          	mv	a5,a4
   101d0:	fcf42823          	sw	a5,-48(s0)
   101d4:	fd442703          	lw	a4,-44(s0)
   101d8:	fd042783          	lw	a5,-48(s0)
   101dc:	0007071b          	sext.w	a4,a4
   101e0:	0007879b          	sext.w	a5,a5
   101e4:	28f75663          	ble	a5,a4,10470 <Qsort+0x2c4>
   101e8:	fd442783          	lw	a5,-44(s0)
   101ec:	00279793          	slli	a5,a5,0x2
   101f0:	fd843703          	ld	a4,-40(s0)
   101f4:	00f707b3          	add	a5,a4,a5
   101f8:	0007a783          	lw	a5,0(a5) # 0 <_start-0x100b0>
   101fc:	fef42223          	sw	a5,-28(s0)
   10200:	fd442783          	lw	a5,-44(s0)
   10204:	fef42623          	sw	a5,-20(s0)
   10208:	fd042783          	lw	a5,-48(s0)
   1020c:	fef42423          	sw	a5,-24(s0)
   10210:	1480006f          	j	10358 <Qsort+0x1ac>
   10214:	fe842783          	lw	a5,-24(s0)
   10218:	fff7879b          	addiw	a5,a5,-1
   1021c:	fef42423          	sw	a5,-24(s0)
   10220:	fec42703          	lw	a4,-20(s0)
   10224:	fe842783          	lw	a5,-24(s0)
   10228:	0007071b          	sext.w	a4,a4
   1022c:	0007879b          	sext.w	a5,a5
   10230:	02f75a63          	ble	a5,a4,10264 <Qsort+0xb8>
   10234:	fe842783          	lw	a5,-24(s0)
   10238:	00279793          	slli	a5,a5,0x2
   1023c:	fd843703          	ld	a4,-40(s0)
   10240:	00f707b3          	add	a5,a4,a5
   10244:	0007a703          	lw	a4,0(a5)
   10248:	fe442783          	lw	a5,-28(s0)
   1024c:	0007879b          	sext.w	a5,a5
   10250:	fcf752e3          	ble	a5,a4,10214 <Qsort+0x68>
   10254:	0100006f          	j	10264 <Qsort+0xb8>
   10258:	fec42783          	lw	a5,-20(s0)
   1025c:	0017879b          	addiw	a5,a5,1
   10260:	fef42623          	sw	a5,-20(s0)
   10264:	fec42703          	lw	a4,-20(s0)
   10268:	fe842783          	lw	a5,-24(s0)
   1026c:	0007071b          	sext.w	a4,a4
   10270:	0007879b          	sext.w	a5,a5
   10274:	02f75263          	ble	a5,a4,10298 <Qsort+0xec>
   10278:	fec42783          	lw	a5,-20(s0)
   1027c:	00279793          	slli	a5,a5,0x2
   10280:	fd843703          	ld	a4,-40(s0)
   10284:	00f707b3          	add	a5,a4,a5
   10288:	0007a703          	lw	a4,0(a5)
   1028c:	fe442783          	lw	a5,-28(s0)
   10290:	0007879b          	sext.w	a5,a5
   10294:	fce7d2e3          	ble	a4,a5,10258 <Qsort+0xac>
   10298:	fec42703          	lw	a4,-20(s0)
   1029c:	fe842783          	lw	a5,-24(s0)
   102a0:	0007071b          	sext.w	a4,a4
   102a4:	0007879b          	sext.w	a5,a5
   102a8:	0af75863          	ble	a5,a4,10358 <Qsort+0x1ac>
   102ac:	fec42783          	lw	a5,-20(s0)
   102b0:	00279793          	slli	a5,a5,0x2
   102b4:	fd843703          	ld	a4,-40(s0)
   102b8:	00f707b3          	add	a5,a4,a5
   102bc:	0007a683          	lw	a3,0(a5)
   102c0:	fe842783          	lw	a5,-24(s0)
   102c4:	00279793          	slli	a5,a5,0x2
   102c8:	fd843703          	ld	a4,-40(s0)
   102cc:	00f707b3          	add	a5,a4,a5
   102d0:	0007a703          	lw	a4,0(a5)
   102d4:	fec42783          	lw	a5,-20(s0)
   102d8:	00279793          	slli	a5,a5,0x2
   102dc:	fd843603          	ld	a2,-40(s0)
   102e0:	00f607b3          	add	a5,a2,a5
   102e4:	00e6c733          	xor	a4,a3,a4
   102e8:	0007071b          	sext.w	a4,a4
   102ec:	00e7a023          	sw	a4,0(a5)
   102f0:	0007a683          	lw	a3,0(a5)
   102f4:	fe842783          	lw	a5,-24(s0)
   102f8:	00279793          	slli	a5,a5,0x2
   102fc:	fd843703          	ld	a4,-40(s0)
   10300:	00f707b3          	add	a5,a4,a5
   10304:	0007a703          	lw	a4,0(a5)
   10308:	fe842783          	lw	a5,-24(s0)
   1030c:	00279793          	slli	a5,a5,0x2
   10310:	fd843603          	ld	a2,-40(s0)
   10314:	00f607b3          	add	a5,a2,a5
   10318:	00e6c733          	xor	a4,a3,a4
   1031c:	0007071b          	sext.w	a4,a4
   10320:	00e7a023          	sw	a4,0(a5)
   10324:	0007a683          	lw	a3,0(a5)
   10328:	fec42783          	lw	a5,-20(s0)
   1032c:	00279793          	slli	a5,a5,0x2
   10330:	fd843703          	ld	a4,-40(s0)
   10334:	00f707b3          	add	a5,a4,a5
   10338:	0007a703          	lw	a4,0(a5)
   1033c:	fec42783          	lw	a5,-20(s0)
   10340:	00279793          	slli	a5,a5,0x2
   10344:	fd843603          	ld	a2,-40(s0)
   10348:	00f607b3          	add	a5,a2,a5
   1034c:	00e6c733          	xor	a4,a3,a4
   10350:	0007071b          	sext.w	a4,a4
   10354:	00e7a023          	sw	a4,0(a5)
   10358:	fec42703          	lw	a4,-20(s0)
   1035c:	fe842783          	lw	a5,-24(s0)
   10360:	0007071b          	sext.w	a4,a4
   10364:	0007879b          	sext.w	a5,a5
   10368:	eaf74ce3          	blt	a4,a5,10220 <Qsort+0x74>
   1036c:	fec42703          	lw	a4,-20(s0)
   10370:	fd442783          	lw	a5,-44(s0)
   10374:	0007071b          	sext.w	a4,a4
   10378:	0007879b          	sext.w	a5,a5
   1037c:	0ae7d863          	ble	a4,a5,1042c <Qsort+0x280>
   10380:	fec42783          	lw	a5,-20(s0)
   10384:	00279793          	slli	a5,a5,0x2
   10388:	fd843703          	ld	a4,-40(s0)
   1038c:	00f707b3          	add	a5,a4,a5
   10390:	0007a683          	lw	a3,0(a5)
   10394:	fd442783          	lw	a5,-44(s0)
   10398:	00279793          	slli	a5,a5,0x2
   1039c:	fd843703          	ld	a4,-40(s0)
   103a0:	00f707b3          	add	a5,a4,a5
   103a4:	0007a703          	lw	a4,0(a5)
   103a8:	fec42783          	lw	a5,-20(s0)
   103ac:	00279793          	slli	a5,a5,0x2
   103b0:	fd843603          	ld	a2,-40(s0)
   103b4:	00f607b3          	add	a5,a2,a5
   103b8:	00e6c733          	xor	a4,a3,a4
   103bc:	0007071b          	sext.w	a4,a4
   103c0:	00e7a023          	sw	a4,0(a5)
   103c4:	0007a683          	lw	a3,0(a5)
   103c8:	fd442783          	lw	a5,-44(s0)
   103cc:	00279793          	slli	a5,a5,0x2
   103d0:	fd843703          	ld	a4,-40(s0)
   103d4:	00f707b3          	add	a5,a4,a5
   103d8:	0007a703          	lw	a4,0(a5)
   103dc:	fd442783          	lw	a5,-44(s0)
   103e0:	00279793          	slli	a5,a5,0x2
   103e4:	fd843603          	ld	a2,-40(s0)
   103e8:	00f607b3          	add	a5,a2,a5
   103ec:	00e6c733          	xor	a4,a3,a4
   103f0:	0007071b          	sext.w	a4,a4
   103f4:	00e7a023          	sw	a4,0(a5)
   103f8:	0007a683          	lw	a3,0(a5)
   103fc:	fec42783          	lw	a5,-20(s0)
   10400:	00279793          	slli	a5,a5,0x2
   10404:	fd843703          	ld	a4,-40(s0)
   10408:	00f707b3          	add	a5,a4,a5
   1040c:	0007a703          	lw	a4,0(a5)
   10410:	fec42783          	lw	a5,-20(s0)
   10414:	00279793          	slli	a5,a5,0x2
   10418:	fd843603          	ld	a2,-40(s0)
   1041c:	00f607b3          	add	a5,a2,a5
   10420:	00e6c733          	xor	a4,a3,a4
   10424:	0007071b          	sext.w	a4,a4
   10428:	00e7a023          	sw	a4,0(a5)
   1042c:	fec42783          	lw	a5,-20(s0)
   10430:	fff7879b          	addiw	a5,a5,-1
   10434:	0007871b          	sext.w	a4,a5
   10438:	fd442783          	lw	a5,-44(s0)
   1043c:	00070613          	mv	a2,a4
   10440:	00078593          	mv	a1,a5
   10444:	fd843503          	ld	a0,-40(s0)
   10448:	d65ff0ef          	jal	ra,101ac <Qsort>
   1044c:	fec42783          	lw	a5,-20(s0)
   10450:	0017879b          	addiw	a5,a5,1
   10454:	0007879b          	sext.w	a5,a5
   10458:	fd042703          	lw	a4,-48(s0)
   1045c:	00070613          	mv	a2,a4
   10460:	00078593          	mv	a1,a5
   10464:	fd843503          	ld	a0,-40(s0)
   10468:	d45ff0ef          	jal	ra,101ac <Qsort>
   1046c:	0080006f          	j	10474 <Qsort+0x2c8>
   10470:	00000013          	nop
   10474:	02813083          	ld	ra,40(sp)
   10478:	02013403          	ld	s0,32(sp)
   1047c:	03010113          	addi	sp,sp,48
   10480:	00008067          	ret

0000000000010484 <main>:
   10484:	fe010113          	addi	sp,sp,-32
   10488:	00113c23          	sd	ra,24(sp)
   1048c:	00813823          	sd	s0,16(sp)
   10490:	02010413          	addi	s0,sp,32
   10494:	06400793          	li	a5,100
   10498:	fef42623          	sw	a5,-20(s0)
   1049c:	0380006f          	j	104d4 <main+0x50>
   104a0:	06400713          	li	a4,100
   104a4:	fec42783          	lw	a5,-20(s0)
   104a8:	40f707bb          	subw	a5,a4,a5
   104ac:	0007871b          	sext.w	a4,a5
   104b0:	000117b7          	lui	a5,0x11
   104b4:	fec42683          	lw	a3,-20(s0)
   104b8:	00269693          	slli	a3,a3,0x2
   104bc:	7c078793          	addi	a5,a5,1984 # 117c0 <a>
   104c0:	00f687b3          	add	a5,a3,a5
   104c4:	00e7a023          	sw	a4,0(a5)
   104c8:	fec42783          	lw	a5,-20(s0)
   104cc:	fff7879b          	addiw	a5,a5,-1
   104d0:	fef42623          	sw	a5,-20(s0)
   104d4:	fec42783          	lw	a5,-20(s0)
   104d8:	0007879b          	sext.w	a5,a5
   104dc:	fc07d2e3          	bgez	a5,104a0 <main+0x1c>
   104e0:	06400613          	li	a2,100
   104e4:	00000593          	li	a1,0
   104e8:	000117b7          	lui	a5,0x11
   104ec:	7c078513          	addi	a0,a5,1984 # 117c0 <a>
   104f0:	00000097          	auipc	ra,0x0
   104f4:	cbc080e7          	jalr	-836(ra) # 101ac <Qsort>
   104f8:	fe042423          	sw	zero,-24(s0)
   104fc:	03c0006f          	j	10538 <main+0xb4>
   10500:	000117b7          	lui	a5,0x11
   10504:	fe842703          	lw	a4,-24(s0)
   10508:	00271713          	slli	a4,a4,0x2
   1050c:	7c078793          	addi	a5,a5,1984 # 117c0 <a>
   10510:	00f707b3          	add	a5,a4,a5
   10514:	0007a783          	lw	a5,0(a5)
   10518:	00078513          	mv	a0,a5
   1051c:	074000ef          	jal	ra,10590 <Printd>
   10520:	02000513          	li	a0,32
   10524:	00000097          	auipc	ra,0x0
   10528:	040080e7          	jalr	64(ra) # 10564 <Printc>
   1052c:	fe842783          	lw	a5,-24(s0)
   10530:	0017879b          	addiw	a5,a5,1
   10534:	fef42423          	sw	a5,-24(s0)
   10538:	fe842783          	lw	a5,-24(s0)
   1053c:	0007871b          	sext.w	a4,a5
   10540:	06400793          	li	a5,100
   10544:	fae7dee3          	ble	a4,a5,10500 <main+0x7c>
   10548:	00000793          	li	a5,0
   1054c:	00078513          	mv	a0,a5
   10550:	01813083          	ld	ra,24(sp)
   10554:	01013403          	ld	s0,16(sp)
   10558:	02010113          	addi	sp,sp,32
   1055c:	00008067          	ret
   10560:	0000                	unimp
	...

0000000000010564 <Printc>:
   10564:	fe010113          	addi	sp,sp,-32
   10568:	00813c23          	sd	s0,24(sp)
   1056c:	02010413          	addi	s0,sp,32
   10570:	00050793          	mv	a5,a0
   10574:	fef407a3          	sb	a5,-17(s0)
   10578:	00100893          	li	a7,1
   1057c:	00000073          	ecall
   10580:	00000013          	nop
   10584:	01813403          	ld	s0,24(sp)
   10588:	02010113          	addi	sp,sp,32
   1058c:	00008067          	ret

0000000000010590 <Printd>:
   10590:	fe010113          	addi	sp,sp,-32
   10594:	00813c23          	sd	s0,24(sp)
   10598:	02010413          	addi	s0,sp,32
   1059c:	00050793          	mv	a5,a0
   105a0:	fef42623          	sw	a5,-20(s0)
   105a4:	00200893          	li	a7,2
   105a8:	00000073          	ecall
   105ac:	00000013          	nop
   105b0:	01813403          	ld	s0,24(sp)
   105b4:	02010113          	addi	sp,sp,32
   105b8:	00008067          	ret

00000000000105bc <Prints>:
   105bc:	fe010113          	addi	sp,sp,-32
   105c0:	00813c23          	sd	s0,24(sp)
   105c4:	02010413          	addi	s0,sp,32
   105c8:	fea43423          	sd	a0,-24(s0)
   105cc:	00300893          	li	a7,3
   105d0:	00000073          	ecall
   105d4:	00000013          	nop
   105d8:	01813403          	ld	s0,24(sp)
   105dc:	02010113          	addi	sp,sp,32
   105e0:	00008067          	ret

00000000000105e4 <Getc>:
   105e4:	fe010113          	addi	sp,sp,-32
   105e8:	00813c23          	sd	s0,24(sp)
   105ec:	02010413          	addi	s0,sp,32
   105f0:	00400893          	li	a7,4
   105f4:	00000073          	ecall
   105f8:	00050793          	mv	a5,a0
   105fc:	fef407a3          	sb	a5,-17(s0)
   10600:	fef44783          	lbu	a5,-17(s0)
   10604:	00078513          	mv	a0,a5
   10608:	01813403          	ld	s0,24(sp)
   1060c:	02010113          	addi	sp,sp,32
   10610:	00008067          	ret

0000000000010614 <Getd>:
   10614:	fe010113          	addi	sp,sp,-32
   10618:	00813c23          	sd	s0,24(sp)
   1061c:	02010413          	addi	s0,sp,32
   10620:	00500893          	li	a7,5
   10624:	00000073          	ecall
   10628:	00050793          	mv	a5,a0
   1062c:	fef42623          	sw	a5,-20(s0)
   10630:	fec42783          	lw	a5,-20(s0)
   10634:	00078513          	mv	a0,a5
   10638:	01813403          	ld	s0,24(sp)
   1063c:	02010113          	addi	sp,sp,32
   10640:	00008067          	ret

0000000000010644 <Exit>:
   10644:	ff010113          	addi	sp,sp,-16
   10648:	00813423          	sd	s0,8(sp)
   1064c:	01010413          	addi	s0,sp,16
   10650:	00000893          	li	a7,0
   10654:	00000073          	ecall
   10658:	00000013          	nop
   1065c:	00813403          	ld	s0,8(sp)
   10660:	01010113          	addi	sp,sp,16
   10664:	00008067          	ret
	...

000000000001066a <atexit>:
   1066a:	85aa                	mv	a1,a0
   1066c:	4681                	li	a3,0
   1066e:	4601                	li	a2,0
   10670:	4501                	li	a0,0
   10672:	18c0006f          	j	107fe <__register_exitproc>
	...

0000000000010678 <exit>:
   10678:	1141                	addi	sp,sp,-16
   1067a:	4581                	li	a1,0
   1067c:	e022                	sd	s0,0(sp)
   1067e:	e406                	sd	ra,8(sp)
   10680:	842a                	mv	s0,a0
   10682:	1e4000ef          	jal	ra,10866 <__call_exitprocs>
   10686:	67c5                	lui	a5,0x11
   10688:	7607b503          	ld	a0,1888(a5) # 11760 <_global_impure_ptr>
   1068c:	6d3c                	ld	a5,88(a0)
   1068e:	c391                	beqz	a5,10692 <exit+0x1a>
   10690:	9782                	jalr	a5
   10692:	8522                	mv	a0,s0
   10694:	00000097          	auipc	ra,0x0
   10698:	66e080e7          	jalr	1646(ra) # 10d02 <_exit>
	...

000000000001069e <__libc_fini_array>:
   1069e:	7179                	addi	sp,sp,-48
   106a0:	67c5                	lui	a5,0x11
   106a2:	6745                	lui	a4,0x11
   106a4:	f022                	sd	s0,32(sp)
   106a6:	00870713          	addi	a4,a4,8 # 11008 <__init_array_end>
   106aa:	01078413          	addi	s0,a5,16 # 11010 <__fini_array_end>
   106ae:	8c19                	sub	s0,s0,a4
   106b0:	ec26                	sd	s1,24(sp)
   106b2:	e84a                	sd	s2,16(sp)
   106b4:	e44e                	sd	s3,8(sp)
   106b6:	f406                	sd	ra,40(sp)
   106b8:	840d                	srai	s0,s0,0x3
   106ba:	4481                	li	s1,0
   106bc:	01078913          	addi	s2,a5,16
   106c0:	59e1                	li	s3,-8
   106c2:	00941c63          	bne	s0,s1,106da <__libc_fini_array+0x3c>
   106c6:	7402                	ld	s0,32(sp)
   106c8:	70a2                	ld	ra,40(sp)
   106ca:	64e2                	ld	s1,24(sp)
   106cc:	6942                	ld	s2,16(sp)
   106ce:	69a2                	ld	s3,8(sp)
   106d0:	6145                	addi	sp,sp,48
   106d2:	00000317          	auipc	t1,0x0
   106d6:	a2430067          	jr	-1500(t1) # 100f6 <_fini>
   106da:	033487b3          	mul	a5,s1,s3
   106de:	0485                	addi	s1,s1,1
   106e0:	97ca                	add	a5,a5,s2
   106e2:	ff87b783          	ld	a5,-8(a5)
   106e6:	9782                	jalr	a5
   106e8:	bfe9                	j	106c2 <__libc_fini_array+0x24>
	...

00000000000106ec <__libc_init_array>:
   106ec:	1101                	addi	sp,sp,-32
   106ee:	e822                	sd	s0,16(sp)
   106f0:	e426                	sd	s1,8(sp)
   106f2:	6445                	lui	s0,0x11
   106f4:	64c5                	lui	s1,0x11
   106f6:	00048793          	mv	a5,s1
   106fa:	00040413          	mv	s0,s0
   106fe:	8c1d                	sub	s0,s0,a5
   10700:	e04a                	sd	s2,0(sp)
   10702:	ec06                	sd	ra,24(sp)
   10704:	840d                	srai	s0,s0,0x3
   10706:	00048493          	mv	s1,s1
   1070a:	4901                	li	s2,0
   1070c:	02891963          	bne	s2,s0,1073e <__libc_init_array+0x52>
   10710:	64c5                	lui	s1,0x11
   10712:	00000097          	auipc	ra,0x0
   10716:	9e4080e7          	jalr	-1564(ra) # 100f6 <_fini>
   1071a:	6445                	lui	s0,0x11
   1071c:	00048793          	mv	a5,s1
   10720:	00840413          	addi	s0,s0,8 # 11008 <__init_array_end>
   10724:	8c1d                	sub	s0,s0,a5
   10726:	840d                	srai	s0,s0,0x3
   10728:	00048493          	mv	s1,s1
   1072c:	4901                	li	s2,0
   1072e:	00891d63          	bne	s2,s0,10748 <__libc_init_array+0x5c>
   10732:	60e2                	ld	ra,24(sp)
   10734:	6442                	ld	s0,16(sp)
   10736:	64a2                	ld	s1,8(sp)
   10738:	6902                	ld	s2,0(sp)
   1073a:	6105                	addi	sp,sp,32
   1073c:	8082                	ret
   1073e:	609c                	ld	a5,0(s1)
   10740:	0905                	addi	s2,s2,1
   10742:	04a1                	addi	s1,s1,8
   10744:	9782                	jalr	a5
   10746:	b7d9                	j	1070c <__libc_init_array+0x20>
   10748:	609c                	ld	a5,0(s1)
   1074a:	0905                	addi	s2,s2,1
   1074c:	04a1                	addi	s1,s1,8
   1074e:	9782                	jalr	a5
   10750:	bff9                	j	1072e <__libc_init_array+0x42>
	...

0000000000010754 <memset>:
   10754:	483d                	li	a6,15
   10756:	872a                	mv	a4,a0
   10758:	02c87163          	bleu	a2,a6,1077a <memset+0x26>
   1075c:	00f77793          	andi	a5,a4,15
   10760:	e3c1                	bnez	a5,107e0 <memset+0x8c>
   10762:	e1bd                	bnez	a1,107c8 <memset+0x74>
   10764:	ff067693          	andi	a3,a2,-16
   10768:	8a3d                	andi	a2,a2,15
   1076a:	96ba                	add	a3,a3,a4
   1076c:	e30c                	sd	a1,0(a4)
   1076e:	e70c                	sd	a1,8(a4)
   10770:	0741                	addi	a4,a4,16
   10772:	fed76de3          	bltu	a4,a3,1076c <memset+0x18>
   10776:	e211                	bnez	a2,1077a <memset+0x26>
   10778:	8082                	ret
   1077a:	40c806b3          	sub	a3,a6,a2
   1077e:	068a                	slli	a3,a3,0x2
   10780:	00000297          	auipc	t0,0x0
   10784:	9696                	add	a3,a3,t0
   10786:	00a68067          	jr	10(a3)
   1078a:	00b70723          	sb	a1,14(a4)
   1078e:	00b706a3          	sb	a1,13(a4)
   10792:	00b70623          	sb	a1,12(a4)
   10796:	00b705a3          	sb	a1,11(a4)
   1079a:	00b70523          	sb	a1,10(a4)
   1079e:	00b704a3          	sb	a1,9(a4)
   107a2:	00b70423          	sb	a1,8(a4)
   107a6:	00b703a3          	sb	a1,7(a4)
   107aa:	00b70323          	sb	a1,6(a4)
   107ae:	00b702a3          	sb	a1,5(a4)
   107b2:	00b70223          	sb	a1,4(a4)
   107b6:	00b701a3          	sb	a1,3(a4)
   107ba:	00b70123          	sb	a1,2(a4)
   107be:	00b700a3          	sb	a1,1(a4)
   107c2:	00b70023          	sb	a1,0(a4)
   107c6:	8082                	ret
   107c8:	0ff5f593          	andi	a1,a1,255
   107cc:	00859693          	slli	a3,a1,0x8
   107d0:	8dd5                	or	a1,a1,a3
   107d2:	01059693          	slli	a3,a1,0x10
   107d6:	8dd5                	or	a1,a1,a3
   107d8:	02059693          	slli	a3,a1,0x20
   107dc:	8dd5                	or	a1,a1,a3
   107de:	b759                	j	10764 <memset+0x10>
   107e0:	00279693          	slli	a3,a5,0x2
   107e4:	00000297          	auipc	t0,0x0
   107e8:	9696                	add	a3,a3,t0
   107ea:	8286                	mv	t0,ra
   107ec:	fa2680e7          	jalr	-94(a3)
   107f0:	8096                	mv	ra,t0
   107f2:	17c1                	addi	a5,a5,-16
   107f4:	8f1d                	sub	a4,a4,a5
   107f6:	963e                	add	a2,a2,a5
   107f8:	f8c871e3          	bleu	a2,a6,1077a <memset+0x26>
   107fc:	b79d                	j	10762 <memset+0xe>

00000000000107fe <__register_exitproc>:
   107fe:	67c5                	lui	a5,0x11
   10800:	7607b703          	ld	a4,1888(a5) # 11760 <_global_impure_ptr>
   10804:	832a                	mv	t1,a0
   10806:	1f873783          	ld	a5,504(a4)
   1080a:	e789                	bnez	a5,10814 <__register_exitproc+0x16>
   1080c:	20070793          	addi	a5,a4,512
   10810:	1ef73c23          	sd	a5,504(a4)
   10814:	4798                	lw	a4,8(a5)
   10816:	487d                	li	a6,31
   10818:	557d                	li	a0,-1
   1081a:	04e84463          	blt	a6,a4,10862 <__register_exitproc+0x64>
   1081e:	02030a63          	beqz	t1,10852 <__register_exitproc+0x54>
   10822:	00371813          	slli	a6,a4,0x3
   10826:	983e                	add	a6,a6,a5
   10828:	10c83823          	sd	a2,272(a6)
   1082c:	3107a883          	lw	a7,784(a5)
   10830:	4605                	li	a2,1
   10832:	00e6163b          	sllw	a2,a2,a4
   10836:	00c8e8b3          	or	a7,a7,a2
   1083a:	3117a823          	sw	a7,784(a5)
   1083e:	20d83823          	sd	a3,528(a6)
   10842:	4689                	li	a3,2
   10844:	00d31763          	bne	t1,a3,10852 <__register_exitproc+0x54>
   10848:	3147a683          	lw	a3,788(a5)
   1084c:	8e55                	or	a2,a2,a3
   1084e:	30c7aa23          	sw	a2,788(a5)
   10852:	0017069b          	addiw	a3,a4,1
   10856:	0709                	addi	a4,a4,2
   10858:	070e                	slli	a4,a4,0x3
   1085a:	c794                	sw	a3,8(a5)
   1085c:	97ba                	add	a5,a5,a4
   1085e:	e38c                	sd	a1,0(a5)
   10860:	4501                	li	a0,0
   10862:	8082                	ret
	...

0000000000010866 <__call_exitprocs>:
   10866:	715d                	addi	sp,sp,-80
   10868:	67c5                	lui	a5,0x11
   1086a:	f44e                	sd	s3,40(sp)
   1086c:	7607b983          	ld	s3,1888(a5) # 11760 <_global_impure_ptr>
   10870:	f052                	sd	s4,32(sp)
   10872:	ec56                	sd	s5,24(sp)
   10874:	e85a                	sd	s6,16(sp)
   10876:	e486                	sd	ra,72(sp)
   10878:	e0a2                	sd	s0,64(sp)
   1087a:	fc26                	sd	s1,56(sp)
   1087c:	f84a                	sd	s2,48(sp)
   1087e:	e45e                	sd	s7,8(sp)
   10880:	8aaa                	mv	s5,a0
   10882:	8a2e                	mv	s4,a1
   10884:	4b05                	li	s6,1
   10886:	1f89b403          	ld	s0,504(s3)
   1088a:	c801                	beqz	s0,1089a <__call_exitprocs+0x34>
   1088c:	4404                	lw	s1,8(s0)
   1088e:	34fd                	addiw	s1,s1,-1
   10890:	00349913          	slli	s2,s1,0x3
   10894:	9922                	add	s2,s2,s0
   10896:	0004dd63          	bgez	s1,108b0 <__call_exitprocs+0x4a>
   1089a:	60a6                	ld	ra,72(sp)
   1089c:	6406                	ld	s0,64(sp)
   1089e:	74e2                	ld	s1,56(sp)
   108a0:	7942                	ld	s2,48(sp)
   108a2:	79a2                	ld	s3,40(sp)
   108a4:	7a02                	ld	s4,32(sp)
   108a6:	6ae2                	ld	s5,24(sp)
   108a8:	6b42                	ld	s6,16(sp)
   108aa:	6ba2                	ld	s7,8(sp)
   108ac:	6161                	addi	sp,sp,80
   108ae:	8082                	ret
   108b0:	000a0963          	beqz	s4,108c2 <__call_exitprocs+0x5c>
   108b4:	21093783          	ld	a5,528(s2)
   108b8:	01478563          	beq	a5,s4,108c2 <__call_exitprocs+0x5c>
   108bc:	34fd                	addiw	s1,s1,-1
   108be:	1961                	addi	s2,s2,-8
   108c0:	bfd9                	j	10896 <__call_exitprocs+0x30>
   108c2:	441c                	lw	a5,8(s0)
   108c4:	01093683          	ld	a3,16(s2)
   108c8:	37fd                	addiw	a5,a5,-1
   108ca:	02979663          	bne	a5,s1,108f6 <__call_exitprocs+0x90>
   108ce:	c404                	sw	s1,8(s0)
   108d0:	d6f5                	beqz	a3,108bc <__call_exitprocs+0x56>
   108d2:	31042703          	lw	a4,784(s0)
   108d6:	009b163b          	sllw	a2,s6,s1
   108da:	00842b83          	lw	s7,8(s0)
   108de:	8f71                	and	a4,a4,a2
   108e0:	2701                	sext.w	a4,a4
   108e2:	ef09                	bnez	a4,108fc <__call_exitprocs+0x96>
   108e4:	9682                	jalr	a3
   108e6:	4418                	lw	a4,8(s0)
   108e8:	1f89b783          	ld	a5,504(s3)
   108ec:	f9771de3          	bne	a4,s7,10886 <__call_exitprocs+0x20>
   108f0:	fcf406e3          	beq	s0,a5,108bc <__call_exitprocs+0x56>
   108f4:	bf49                	j	10886 <__call_exitprocs+0x20>
   108f6:	00093823          	sd	zero,16(s2)
   108fa:	bfd9                	j	108d0 <__call_exitprocs+0x6a>
   108fc:	31442783          	lw	a5,788(s0)
   10900:	11093583          	ld	a1,272(s2)
   10904:	8ff1                	and	a5,a5,a2
   10906:	2781                	sext.w	a5,a5
   10908:	e781                	bnez	a5,10910 <__call_exitprocs+0xaa>
   1090a:	8556                	mv	a0,s5
   1090c:	9682                	jalr	a3
   1090e:	bfe1                	j	108e6 <__call_exitprocs+0x80>
   10910:	852e                	mv	a0,a1
   10912:	9682                	jalr	a3
   10914:	bfc9                	j	108e6 <__call_exitprocs+0x80>
	...

0000000000010918 <conv_stat>:
   10918:	619c                	ld	a5,0(a1)
   1091a:	00f51023          	sh	a5,0(a0)
   1091e:	659c                	ld	a5,8(a1)
   10920:	00f51123          	sh	a5,2(a0)
   10924:	499c                	lw	a5,16(a1)
   10926:	c15c                	sw	a5,4(a0)
   10928:	49dc                	lw	a5,20(a1)
   1092a:	00f51423          	sh	a5,8(a0)
   1092e:	4d9c                	lw	a5,24(a1)
   10930:	00f51523          	sh	a5,10(a0)
   10934:	4ddc                	lw	a5,28(a1)
   10936:	00f51623          	sh	a5,12(a0)
   1093a:	719c                	ld	a5,32(a1)
   1093c:	00f51723          	sh	a5,14(a0)
   10940:	799c                	ld	a5,48(a1)
   10942:	e91c                	sd	a5,16(a0)
   10944:	61bc                	ld	a5,64(a1)
   10946:	e93c                	sd	a5,80(a0)
   10948:	5d9c                	lw	a5,56(a1)
   1094a:	e53c                	sd	a5,72(a0)
   1094c:	65bc                	ld	a5,72(a1)
   1094e:	ed1c                	sd	a5,24(a0)
   10950:	6dbc                	ld	a5,88(a1)
   10952:	f51c                	sd	a5,40(a0)
   10954:	75bc                	ld	a5,104(a1)
   10956:	fd1c                	sd	a5,56(a0)
   10958:	8082                	ret

000000000001095a <__syscall_error>:
   1095a:	1141                	addi	sp,sp,-16
   1095c:	e022                	sd	s0,0(sp)
   1095e:	e406                	sd	ra,8(sp)
   10960:	842a                	mv	s0,a0
   10962:	00000097          	auipc	ra,0x0
   10966:	3ba080e7          	jalr	954(ra) # 10d1c <__errno>
   1096a:	408007bb          	negw	a5,s0
   1096e:	60a2                	ld	ra,8(sp)
   10970:	6402                	ld	s0,0(sp)
   10972:	c11c                	sw	a5,0(a0)
   10974:	557d                	li	a0,-1
   10976:	0141                	addi	sp,sp,16
   10978:	8082                	ret

000000000001097a <__internal_syscall>:
   1097a:	88aa                	mv	a7,a0
   1097c:	852e                	mv	a0,a1
   1097e:	85b2                	mv	a1,a2
   10980:	8636                	mv	a2,a3
   10982:	86ba                	mv	a3,a4
   10984:	00000073          	ecall
   10988:	00055663          	bgez	a0,10994 <__internal_syscall+0x1a>
   1098c:	00000317          	auipc	t1,0x0
   10990:	fce30067          	jr	-50(t1) # 1095a <__syscall_error>
   10994:	8082                	ret

0000000000010996 <open>:
   10996:	1141                	addi	sp,sp,-16
   10998:	86b2                	mv	a3,a2
   1099a:	4701                	li	a4,0
   1099c:	862e                	mv	a2,a1
   1099e:	85aa                	mv	a1,a0
   109a0:	40000513          	li	a0,1024
   109a4:	e406                	sd	ra,8(sp)
   109a6:	00000097          	auipc	ra,0x0
   109aa:	fd4080e7          	jalr	-44(ra) # 1097a <__internal_syscall>
   109ae:	60a2                	ld	ra,8(sp)
   109b0:	2501                	sext.w	a0,a0
   109b2:	0141                	addi	sp,sp,16
   109b4:	8082                	ret

00000000000109b6 <openat>:
   109b6:	1141                	addi	sp,sp,-16
   109b8:	8736                	mv	a4,a3
   109ba:	86b2                	mv	a3,a2
   109bc:	862e                	mv	a2,a1
   109be:	85aa                	mv	a1,a0
   109c0:	03800513          	li	a0,56
   109c4:	e406                	sd	ra,8(sp)
   109c6:	fb5ff0ef          	jal	ra,1097a <__internal_syscall>
   109ca:	60a2                	ld	ra,8(sp)
   109cc:	2501                	sext.w	a0,a0
   109ce:	0141                	addi	sp,sp,16
   109d0:	8082                	ret

00000000000109d2 <lseek>:
   109d2:	86b2                	mv	a3,a2
   109d4:	4701                	li	a4,0
   109d6:	862e                	mv	a2,a1
   109d8:	85aa                	mv	a1,a0
   109da:	03e00513          	li	a0,62
   109de:	00000317          	auipc	t1,0x0
   109e2:	f9c30067          	jr	-100(t1) # 1097a <__internal_syscall>

00000000000109e6 <read>:
   109e6:	86b2                	mv	a3,a2
   109e8:	4701                	li	a4,0
   109ea:	862e                	mv	a2,a1
   109ec:	85aa                	mv	a1,a0
   109ee:	03f00513          	li	a0,63
   109f2:	f89ff06f          	j	1097a <__internal_syscall>

00000000000109f6 <write>:
   109f6:	86b2                	mv	a3,a2
   109f8:	4701                	li	a4,0
   109fa:	862e                	mv	a2,a1
   109fc:	85aa                	mv	a1,a0
   109fe:	04000513          	li	a0,64
   10a02:	00000317          	auipc	t1,0x0
   10a06:	f7830067          	jr	-136(t1) # 1097a <__internal_syscall>

0000000000010a0a <fstat>:
   10a0a:	7135                	addi	sp,sp,-160
   10a0c:	e526                	sd	s1,136(sp)
   10a0e:	860a                	mv	a2,sp
   10a10:	84ae                	mv	s1,a1
   10a12:	4701                	li	a4,0
   10a14:	85aa                	mv	a1,a0
   10a16:	4681                	li	a3,0
   10a18:	05000513          	li	a0,80
   10a1c:	ed06                	sd	ra,152(sp)
   10a1e:	e922                	sd	s0,144(sp)
   10a20:	f5bff0ef          	jal	ra,1097a <__internal_syscall>
   10a24:	842a                	mv	s0,a0
   10a26:	858a                	mv	a1,sp
   10a28:	8526                	mv	a0,s1
   10a2a:	eefff0ef          	jal	ra,10918 <conv_stat>
   10a2e:	0004051b          	sext.w	a0,s0
   10a32:	60ea                	ld	ra,152(sp)
   10a34:	644a                	ld	s0,144(sp)
   10a36:	64aa                	ld	s1,136(sp)
   10a38:	610d                	addi	sp,sp,160
   10a3a:	8082                	ret

0000000000010a3c <stat>:
   10a3c:	7135                	addi	sp,sp,-160
   10a3e:	e526                	sd	s1,136(sp)
   10a40:	860a                	mv	a2,sp
   10a42:	84ae                	mv	s1,a1
   10a44:	4701                	li	a4,0
   10a46:	85aa                	mv	a1,a0
   10a48:	4681                	li	a3,0
   10a4a:	40e00513          	li	a0,1038
   10a4e:	ed06                	sd	ra,152(sp)
   10a50:	e922                	sd	s0,144(sp)
   10a52:	00000097          	auipc	ra,0x0
   10a56:	f28080e7          	jalr	-216(ra) # 1097a <__internal_syscall>
   10a5a:	842a                	mv	s0,a0
   10a5c:	858a                	mv	a1,sp
   10a5e:	8526                	mv	a0,s1
   10a60:	00000097          	auipc	ra,0x0
   10a64:	eb8080e7          	jalr	-328(ra) # 10918 <conv_stat>
   10a68:	0004051b          	sext.w	a0,s0
   10a6c:	60ea                	ld	ra,152(sp)
   10a6e:	644a                	ld	s0,144(sp)
   10a70:	64aa                	ld	s1,136(sp)
   10a72:	610d                	addi	sp,sp,160
   10a74:	8082                	ret

0000000000010a76 <lstat>:
   10a76:	7135                	addi	sp,sp,-160
   10a78:	e526                	sd	s1,136(sp)
   10a7a:	860a                	mv	a2,sp
   10a7c:	84ae                	mv	s1,a1
   10a7e:	4701                	li	a4,0
   10a80:	85aa                	mv	a1,a0
   10a82:	4681                	li	a3,0
   10a84:	40f00513          	li	a0,1039
   10a88:	ed06                	sd	ra,152(sp)
   10a8a:	e922                	sd	s0,144(sp)
   10a8c:	eefff0ef          	jal	ra,1097a <__internal_syscall>
   10a90:	842a                	mv	s0,a0
   10a92:	858a                	mv	a1,sp
   10a94:	8526                	mv	a0,s1
   10a96:	e83ff0ef          	jal	ra,10918 <conv_stat>
   10a9a:	0004051b          	sext.w	a0,s0
   10a9e:	60ea                	ld	ra,152(sp)
   10aa0:	644a                	ld	s0,144(sp)
   10aa2:	64aa                	ld	s1,136(sp)
   10aa4:	610d                	addi	sp,sp,160
   10aa6:	8082                	ret

0000000000010aa8 <fstatat>:
   10aa8:	7135                	addi	sp,sp,-160
   10aaa:	e526                	sd	s1,136(sp)
   10aac:	8736                	mv	a4,a3
   10aae:	84b2                	mv	s1,a2
   10ab0:	868a                	mv	a3,sp
   10ab2:	862e                	mv	a2,a1
   10ab4:	85aa                	mv	a1,a0
   10ab6:	04f00513          	li	a0,79
   10aba:	ed06                	sd	ra,152(sp)
   10abc:	e922                	sd	s0,144(sp)
   10abe:	00000097          	auipc	ra,0x0
   10ac2:	ebc080e7          	jalr	-324(ra) # 1097a <__internal_syscall>
   10ac6:	842a                	mv	s0,a0
   10ac8:	858a                	mv	a1,sp
   10aca:	8526                	mv	a0,s1
   10acc:	00000097          	auipc	ra,0x0
   10ad0:	e4c080e7          	jalr	-436(ra) # 10918 <conv_stat>
   10ad4:	0004051b          	sext.w	a0,s0
   10ad8:	60ea                	ld	ra,152(sp)
   10ada:	644a                	ld	s0,144(sp)
   10adc:	64aa                	ld	s1,136(sp)
   10ade:	610d                	addi	sp,sp,160
   10ae0:	8082                	ret

0000000000010ae2 <access>:
   10ae2:	1141                	addi	sp,sp,-16
   10ae4:	862e                	mv	a2,a1
   10ae6:	4701                	li	a4,0
   10ae8:	85aa                	mv	a1,a0
   10aea:	4681                	li	a3,0
   10aec:	40900513          	li	a0,1033
   10af0:	e406                	sd	ra,8(sp)
   10af2:	e89ff0ef          	jal	ra,1097a <__internal_syscall>
   10af6:	60a2                	ld	ra,8(sp)
   10af8:	2501                	sext.w	a0,a0
   10afa:	0141                	addi	sp,sp,16
   10afc:	8082                	ret

0000000000010afe <faccessat>:
   10afe:	1141                	addi	sp,sp,-16
   10b00:	8736                	mv	a4,a3
   10b02:	86b2                	mv	a3,a2
   10b04:	862e                	mv	a2,a1
   10b06:	85aa                	mv	a1,a0
   10b08:	03000513          	li	a0,48
   10b0c:	e406                	sd	ra,8(sp)
   10b0e:	00000097          	auipc	ra,0x0
   10b12:	e6c080e7          	jalr	-404(ra) # 1097a <__internal_syscall>
   10b16:	60a2                	ld	ra,8(sp)
   10b18:	2501                	sext.w	a0,a0
   10b1a:	0141                	addi	sp,sp,16
   10b1c:	8082                	ret

0000000000010b1e <close>:
   10b1e:	1141                	addi	sp,sp,-16
   10b20:	85aa                	mv	a1,a0
   10b22:	4701                	li	a4,0
   10b24:	4681                	li	a3,0
   10b26:	4601                	li	a2,0
   10b28:	03900513          	li	a0,57
   10b2c:	e406                	sd	ra,8(sp)
   10b2e:	e4dff0ef          	jal	ra,1097a <__internal_syscall>
   10b32:	60a2                	ld	ra,8(sp)
   10b34:	2501                	sext.w	a0,a0
   10b36:	0141                	addi	sp,sp,16
   10b38:	8082                	ret

0000000000010b3a <link>:
   10b3a:	1141                	addi	sp,sp,-16
   10b3c:	862e                	mv	a2,a1
   10b3e:	4701                	li	a4,0
   10b40:	85aa                	mv	a1,a0
   10b42:	4681                	li	a3,0
   10b44:	40100513          	li	a0,1025
   10b48:	e406                	sd	ra,8(sp)
   10b4a:	00000097          	auipc	ra,0x0
   10b4e:	e30080e7          	jalr	-464(ra) # 1097a <__internal_syscall>
   10b52:	60a2                	ld	ra,8(sp)
   10b54:	2501                	sext.w	a0,a0
   10b56:	0141                	addi	sp,sp,16
   10b58:	8082                	ret

0000000000010b5a <unlink>:
   10b5a:	1141                	addi	sp,sp,-16
   10b5c:	85aa                	mv	a1,a0
   10b5e:	4701                	li	a4,0
   10b60:	4681                	li	a3,0
   10b62:	4601                	li	a2,0
   10b64:	40200513          	li	a0,1026
   10b68:	e406                	sd	ra,8(sp)
   10b6a:	e11ff0ef          	jal	ra,1097a <__internal_syscall>
   10b6e:	60a2                	ld	ra,8(sp)
   10b70:	2501                	sext.w	a0,a0
   10b72:	0141                	addi	sp,sp,16
   10b74:	8082                	ret

0000000000010b76 <execve>:
   10b76:	1141                	addi	sp,sp,-16
   10b78:	e406                	sd	ra,8(sp)
   10b7a:	00000097          	auipc	ra,0x0
   10b7e:	1a2080e7          	jalr	418(ra) # 10d1c <__errno>
   10b82:	60a2                	ld	ra,8(sp)
   10b84:	47b1                	li	a5,12
   10b86:	c11c                	sw	a5,0(a0)
   10b88:	557d                	li	a0,-1
   10b8a:	0141                	addi	sp,sp,16
   10b8c:	8082                	ret

0000000000010b8e <fork>:
   10b8e:	1141                	addi	sp,sp,-16
   10b90:	e406                	sd	ra,8(sp)
   10b92:	18a000ef          	jal	ra,10d1c <__errno>
   10b96:	60a2                	ld	ra,8(sp)
   10b98:	47ad                	li	a5,11
   10b9a:	c11c                	sw	a5,0(a0)
   10b9c:	557d                	li	a0,-1
   10b9e:	0141                	addi	sp,sp,16
   10ba0:	8082                	ret

0000000000010ba2 <getpid>:
   10ba2:	4505                	li	a0,1
   10ba4:	8082                	ret

0000000000010ba6 <kill>:
   10ba6:	1141                	addi	sp,sp,-16
   10ba8:	e406                	sd	ra,8(sp)
   10baa:	172000ef          	jal	ra,10d1c <__errno>
   10bae:	60a2                	ld	ra,8(sp)
   10bb0:	47d9                	li	a5,22
   10bb2:	c11c                	sw	a5,0(a0)
   10bb4:	557d                	li	a0,-1
   10bb6:	0141                	addi	sp,sp,16
   10bb8:	8082                	ret

0000000000010bba <wait>:
   10bba:	1141                	addi	sp,sp,-16
   10bbc:	e406                	sd	ra,8(sp)
   10bbe:	00000097          	auipc	ra,0x0
   10bc2:	15e080e7          	jalr	350(ra) # 10d1c <__errno>
   10bc6:	60a2                	ld	ra,8(sp)
   10bc8:	47a9                	li	a5,10
   10bca:	c11c                	sw	a5,0(a0)
   10bcc:	557d                	li	a0,-1
   10bce:	0141                	addi	sp,sp,16
   10bd0:	8082                	ret

0000000000010bd2 <isatty>:
   10bd2:	7119                	addi	sp,sp,-128
   10bd4:	002c                	addi	a1,sp,8
   10bd6:	fc86                	sd	ra,120(sp)
   10bd8:	e33ff0ef          	jal	ra,10a0a <fstat>
   10bdc:	57fd                	li	a5,-1
   10bde:	00f50663          	beq	a0,a5,10bea <isatty+0x18>
   10be2:	4532                	lw	a0,12(sp)
   10be4:	40d5551b          	sraiw	a0,a0,0xd
   10be8:	8905                	andi	a0,a0,1
   10bea:	70e6                	ld	ra,120(sp)
   10bec:	6109                	addi	sp,sp,128
   10bee:	8082                	ret

0000000000010bf0 <gettimeofday>:
   10bf0:	1141                	addi	sp,sp,-16
   10bf2:	85aa                	mv	a1,a0
   10bf4:	4701                	li	a4,0
   10bf6:	4681                	li	a3,0
   10bf8:	4601                	li	a2,0
   10bfa:	0a900513          	li	a0,169
   10bfe:	e406                	sd	ra,8(sp)
   10c00:	00000097          	auipc	ra,0x0
   10c04:	d7a080e7          	jalr	-646(ra) # 1097a <__internal_syscall>
   10c08:	60a2                	ld	ra,8(sp)
   10c0a:	2501                	sext.w	a0,a0
   10c0c:	0141                	addi	sp,sp,16
   10c0e:	8082                	ret

0000000000010c10 <times>:
   10c10:	7179                	addi	sp,sp,-48
   10c12:	f022                	sd	s0,32(sp)
   10c14:	842a                	mv	s0,a0
   10c16:	8581b783          	ld	a5,-1960(gp) # 117b0 <t0.2574>
   10c1a:	ec26                	sd	s1,24(sp)
   10c1c:	f406                	sd	ra,40(sp)
   10c1e:	85818493          	addi	s1,gp,-1960 # 117b0 <t0.2574>
   10c22:	eb81                	bnez	a5,10c32 <times+0x22>
   10c24:	4581                	li	a1,0
   10c26:	85818513          	addi	a0,gp,-1960 # 117b0 <t0.2574>
   10c2a:	00000097          	auipc	ra,0x0
   10c2e:	fc6080e7          	jalr	-58(ra) # 10bf0 <gettimeofday>
   10c32:	850a                	mv	a0,sp
   10c34:	4581                	li	a1,0
   10c36:	00000097          	auipc	ra,0x0
   10c3a:	fba080e7          	jalr	-70(ra) # 10bf0 <gettimeofday>
   10c3e:	6098                	ld	a4,0(s1)
   10c40:	6782                	ld	a5,0(sp)
   10c42:	6494                	ld	a3,8(s1)
   10c44:	00043823          	sd	zero,16(s0)
   10c48:	8f99                	sub	a5,a5,a4
   10c4a:	000f4737          	lui	a4,0xf4
   10c4e:	24070713          	addi	a4,a4,576 # f4240 <_end+0xe1ae0>
   10c52:	02e787b3          	mul	a5,a5,a4
   10c56:	6722                	ld	a4,8(sp)
   10c58:	00043c23          	sd	zero,24(s0)
   10c5c:	00043423          	sd	zero,8(s0)
   10c60:	8f15                	sub	a4,a4,a3
   10c62:	70a2                	ld	ra,40(sp)
   10c64:	64e2                	ld	s1,24(sp)
   10c66:	557d                	li	a0,-1
   10c68:	97ba                	add	a5,a5,a4
   10c6a:	e01c                	sd	a5,0(s0)
   10c6c:	7402                	ld	s0,32(sp)
   10c6e:	6145                	addi	sp,sp,48
   10c70:	8082                	ret

0000000000010c72 <ftime>:
   10c72:	00051423          	sh	zero,8(a0)
   10c76:	00053023          	sd	zero,0(a0)
   10c7a:	4501                	li	a0,0
   10c7c:	8082                	ret

0000000000010c7e <utime>:
   10c7e:	557d                	li	a0,-1
   10c80:	8082                	ret

0000000000010c82 <chown>:
   10c82:	557d                	li	a0,-1
   10c84:	8082                	ret

0000000000010c86 <chmod>:
   10c86:	557d                	li	a0,-1
   10c88:	8082                	ret

0000000000010c8a <chdir>:
   10c8a:	557d                	li	a0,-1
   10c8c:	8082                	ret

0000000000010c8e <getcwd>:
   10c8e:	4501                	li	a0,0
   10c90:	8082                	ret

0000000000010c92 <sysconf>:
   10c92:	4789                	li	a5,2
   10c94:	00f50463          	beq	a0,a5,10c9c <sysconf+0xa>
   10c98:	557d                	li	a0,-1
   10c9a:	8082                	ret
   10c9c:	000f4537          	lui	a0,0xf4
   10ca0:	24050513          	addi	a0,a0,576 # f4240 <_end+0xe1ae0>
   10ca4:	8082                	ret

0000000000010ca6 <sbrk>:
   10ca6:	1101                	addi	sp,sp,-32
   10ca8:	e822                	sd	s0,16(sp)
   10caa:	8181b783          	ld	a5,-2024(gp) # 11770 <_edata>
   10cae:	e426                	sd	s1,8(sp)
   10cb0:	ec06                	sd	ra,24(sp)
   10cb2:	84aa                	mv	s1,a0
   10cb4:	e785                	bnez	a5,10cdc <sbrk+0x36>
   10cb6:	4701                	li	a4,0
   10cb8:	4681                	li	a3,0
   10cba:	4601                	li	a2,0
   10cbc:	4581                	li	a1,0
   10cbe:	0d600513          	li	a0,214
   10cc2:	cb9ff0ef          	jal	ra,1097a <__internal_syscall>
   10cc6:	57fd                	li	a5,-1
   10cc8:	00f51863          	bne	a0,a5,10cd8 <sbrk+0x32>
   10ccc:	557d                	li	a0,-1
   10cce:	60e2                	ld	ra,24(sp)
   10cd0:	6442                	ld	s0,16(sp)
   10cd2:	64a2                	ld	s1,8(sp)
   10cd4:	6105                	addi	sp,sp,32
   10cd6:	8082                	ret
   10cd8:	80a1bc23          	sd	a0,-2024(gp) # 11770 <_edata>
   10cdc:	8181b583          	ld	a1,-2024(gp) # 11770 <_edata>
   10ce0:	4701                	li	a4,0
   10ce2:	4681                	li	a3,0
   10ce4:	95a6                	add	a1,a1,s1
   10ce6:	4601                	li	a2,0
   10ce8:	0d600513          	li	a0,214
   10cec:	c8fff0ef          	jal	ra,1097a <__internal_syscall>
   10cf0:	8181b783          	ld	a5,-2024(gp) # 11770 <_edata>
   10cf4:	94be                	add	s1,s1,a5
   10cf6:	fc951be3          	bne	a0,s1,10ccc <sbrk+0x26>
   10cfa:	80a1bc23          	sd	a0,-2024(gp) # 11770 <_edata>
   10cfe:	853e                	mv	a0,a5
   10d00:	b7f9                	j	10cce <sbrk+0x28>

0000000000010d02 <_exit>:
   10d02:	1141                	addi	sp,sp,-16
   10d04:	85aa                	mv	a1,a0
   10d06:	4701                	li	a4,0
   10d08:	4681                	li	a3,0
   10d0a:	4601                	li	a2,0
   10d0c:	05d00513          	li	a0,93
   10d10:	e406                	sd	ra,8(sp)
   10d12:	00000097          	auipc	ra,0x0
   10d16:	c68080e7          	jalr	-920(ra) # 1097a <__internal_syscall>
   10d1a:	a001                	j	10d1a <_exit+0x18>

0000000000010d1c <__errno>:
   10d1c:	8101b503          	ld	a0,-2032(gp) # 11768 <_impure_ptr>
   10d20:	8082                	ret
	...

Disassembly of section .eh_frame:

0000000000010d24 <__EH_FRAME_BEGIN__>:
   10d24:	0000                	unimp
	...

Disassembly of section .init_array:

0000000000011000 <__frame_dummy_init_array_entry>:
   11000:	0182                	slli	gp,gp,0x0
   11002:	0001                	nop
   11004:	0000                	unimp
	...

Disassembly of section .fini_array:

0000000000011008 <__do_global_dtors_aux_fini_array_entry>:
   11008:	0148                	addi	a0,sp,132
   1100a:	0001                	nop
   1100c:	0000                	unimp
	...

Disassembly of section .data:

0000000000011010 <impure_data>:
	...
   11018:	1548                	addi	a0,sp,676
   1101a:	0001                	nop
   1101c:	0000                	unimp
   1101e:	0000                	unimp
   11020:	15f8                	addi	a4,sp,748
   11022:	0001                	nop
   11024:	0000                	unimp
   11026:	0000                	unimp
   11028:	16a8                	addi	a0,sp,872
   1102a:	0001                	nop
	...
   110f8:	0001                	nop
   110fa:	0000                	unimp
   110fc:	0000                	unimp
   110fe:	0000                	unimp
   11100:	330e                	fld	ft6,224(sp)
   11102:	abcd                	j	116f4 <impure_data+0x6e4>
   11104:	1234                	addi	a3,sp,296
   11106:	e66d                	bnez	a2,111f0 <impure_data+0x1e0>
   11108:	deec                	sw	a1,124(a3)
   1110a:	0005                	c.addi	zero,1
   1110c:	0000000b          	0xb
	...

Disassembly of section .sdata:

0000000000011758 <__TMC_END__>:
	...

0000000000011760 <_global_impure_ptr>:
   11760:	1010                	addi	a2,sp,32
   11762:	0001                	nop
   11764:	0000                	unimp
	...

0000000000011768 <_impure_ptr>:
   11768:	1010                	addi	a2,sp,32
   1176a:	0001                	nop
   1176c:	0000                	unimp
	...

Disassembly of section .sbss:

0000000000011770 <__bss_start>:
	...

Disassembly of section .bss:

0000000000011778 <completed.5184>:
	...

0000000000011780 <object.5189>:
	...

00000000000117b0 <t0.2574>:
	...

00000000000117c0 <a>:
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
