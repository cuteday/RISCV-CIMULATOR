
ackerman.riscv：     文件格式 elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <_start>:
   100b0:	00002197          	auipc	gp,0x2
   100b4:	ea818193          	addi	gp,gp,-344 # 11f58 <__global_pointer$>
   100b8:	81818513          	addi	a0,gp,-2024 # 11770 <_edata>
   100bc:	86818613          	addi	a2,gp,-1944 # 117c0 <_end>
   100c0:	8e09                	sub	a2,a2,a0
   100c2:	4581                	li	a1,0
   100c4:	3e8000ef          	jal	ra,104ac <memset>
   100c8:	00000517          	auipc	a0,0x0
   100cc:	32e50513          	addi	a0,a0,814 # 103f6 <__libc_fini_array>
   100d0:	00000097          	auipc	ra,0x0
   100d4:	2f2080e7          	jalr	754(ra) # 103c2 <atexit>
   100d8:	00000097          	auipc	ra,0x0
   100dc:	36c080e7          	jalr	876(ra) # 10444 <__libc_init_array>
   100e0:	4502                	lw	a0,0(sp)
   100e2:	002c                	addi	a1,sp,8
   100e4:	4601                	li	a2,0
   100e6:	186000ef          	jal	ra,1026c <main>
   100ea:	00000317          	auipc	t1,0x0
   100ee:	2e630067          	jr	742(t1) # 103d0 <exit>

00000000000100f2 <_fini>:
   100f2:	8082                	ret

00000000000100f4 <deregister_tm_clones>:
   100f4:	6545                	lui	a0,0x11
   100f6:	67c5                	lui	a5,0x11
   100f8:	75850713          	addi	a4,a0,1880 # 11758 <__TMC_END__>
   100fc:	75878793          	addi	a5,a5,1880 # 11758 <__TMC_END__>
   10100:	00e78b63          	beq	a5,a4,10116 <deregister_tm_clones+0x22>
   10104:	00000337          	lui	t1,0x0
   10108:	00030313          	mv	t1,t1
   1010c:	00030563          	beqz	t1,10116 <deregister_tm_clones+0x22>
   10110:	75850513          	addi	a0,a0,1880
   10114:	8302                	jr	t1
   10116:	8082                	ret

0000000000010118 <register_tm_clones>:
   10118:	67c5                	lui	a5,0x11
   1011a:	6545                	lui	a0,0x11
   1011c:	75878593          	addi	a1,a5,1880 # 11758 <__TMC_END__>
   10120:	75850793          	addi	a5,a0,1880 # 11758 <__TMC_END__>
   10124:	8d9d                	sub	a1,a1,a5
   10126:	858d                	srai	a1,a1,0x3
   10128:	4789                	li	a5,2
   1012a:	02f5c5b3          	div	a1,a1,a5
   1012e:	c991                	beqz	a1,10142 <register_tm_clones+0x2a>
   10130:	00000337          	lui	t1,0x0
   10134:	00030313          	mv	t1,t1
   10138:	00030563          	beqz	t1,10142 <register_tm_clones+0x2a>
   1013c:	75850513          	addi	a0,a0,1880
   10140:	8302                	jr	t1
   10142:	8082                	ret

0000000000010144 <__do_global_dtors_aux>:
   10144:	8201c703          	lbu	a4,-2016(gp) # 11778 <completed.5184>
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
   10162:	a7c50513          	addi	a0,a0,-1412 # 10a7c <__EH_FRAME_BEGIN__>
   10166:	ffff0097          	auipc	ra,0xffff0
   1016a:	e9a080e7          	jalr	-358(ra) # 0 <_start-0x100b0>
   1016e:	4785                	li	a5,1
   10170:	82f18023          	sb	a5,-2016(gp) # 11778 <completed.5184>
   10174:	60a2                	ld	ra,8(sp)
   10176:	6402                	ld	s0,0(sp)
   10178:	0141                	addi	sp,sp,16
   1017a:	8082                	ret
   1017c:	8082                	ret

000000000001017e <frame_dummy>:
   1017e:	000007b7          	lui	a5,0x0
   10182:	00078793          	mv	a5,a5
   10186:	cf99                	beqz	a5,101a4 <frame_dummy+0x26>
   10188:	65c5                	lui	a1,0x11
   1018a:	6545                	lui	a0,0x11
   1018c:	1141                	addi	sp,sp,-16
   1018e:	78058593          	addi	a1,a1,1920 # 11780 <object.5189>
   10192:	a7c50513          	addi	a0,a0,-1412 # 10a7c <__EH_FRAME_BEGIN__>
   10196:	e406                	sd	ra,8(sp)
   10198:	ffff0097          	auipc	ra,0xffff0
   1019c:	e68080e7          	jalr	-408(ra) # 0 <_start-0x100b0>
   101a0:	60a2                	ld	ra,8(sp)
   101a2:	0141                	addi	sp,sp,16
   101a4:	f75ff06f          	j	10118 <register_tm_clones>

00000000000101a8 <ackerman>:
   101a8:	fd010113          	addi	sp,sp,-48
   101ac:	02113423          	sd	ra,40(sp)
   101b0:	02813023          	sd	s0,32(sp)
   101b4:	00913c23          	sd	s1,24(sp)
   101b8:	03010413          	addi	s0,sp,48
   101bc:	00050793          	mv	a5,a0
   101c0:	00058713          	mv	a4,a1
   101c4:	fcf42e23          	sw	a5,-36(s0)
   101c8:	00070793          	mv	a5,a4
   101cc:	fcf42c23          	sw	a5,-40(s0)
   101d0:	fdc42783          	lw	a5,-36(s0)
   101d4:	0007879b          	sext.w	a5,a5
   101d8:	00079a63          	bnez	a5,101ec <ackerman+0x44>
   101dc:	fd842783          	lw	a5,-40(s0)
   101e0:	0017879b          	addiw	a5,a5,1
   101e4:	0007879b          	sext.w	a5,a5
   101e8:	06c0006f          	j	10254 <ackerman+0xac>
   101ec:	fd842783          	lw	a5,-40(s0)
   101f0:	0007879b          	sext.w	a5,a5
   101f4:	02079263          	bnez	a5,10218 <ackerman+0x70>
   101f8:	fdc42783          	lw	a5,-36(s0)
   101fc:	fff7879b          	addiw	a5,a5,-1
   10200:	0007879b          	sext.w	a5,a5
   10204:	00100593          	li	a1,1
   10208:	00078513          	mv	a0,a5
   1020c:	f9dff0ef          	jal	ra,101a8 <ackerman>
   10210:	00050793          	mv	a5,a0
   10214:	0400006f          	j	10254 <ackerman+0xac>
   10218:	fdc42783          	lw	a5,-36(s0)
   1021c:	fff7879b          	addiw	a5,a5,-1
   10220:	0007849b          	sext.w	s1,a5
   10224:	fd842783          	lw	a5,-40(s0)
   10228:	fff7879b          	addiw	a5,a5,-1
   1022c:	0007871b          	sext.w	a4,a5
   10230:	fdc42783          	lw	a5,-36(s0)
   10234:	00070593          	mv	a1,a4
   10238:	00078513          	mv	a0,a5
   1023c:	f6dff0ef          	jal	ra,101a8 <ackerman>
   10240:	00050793          	mv	a5,a0
   10244:	00078593          	mv	a1,a5
   10248:	00048513          	mv	a0,s1
   1024c:	f5dff0ef          	jal	ra,101a8 <ackerman>
   10250:	00050793          	mv	a5,a0
   10254:	00078513          	mv	a0,a5
   10258:	02813083          	ld	ra,40(sp)
   1025c:	02013403          	ld	s0,32(sp)
   10260:	01813483          	ld	s1,24(sp)
   10264:	03010113          	addi	sp,sp,48
   10268:	00008067          	ret

000000000001026c <main>:
   1026c:	fe010113          	addi	sp,sp,-32
   10270:	00113c23          	sd	ra,24(sp)
   10274:	00813823          	sd	s0,16(sp)
   10278:	02010413          	addi	s0,sp,32
   1027c:	00700593          	li	a1,7
   10280:	00300513          	li	a0,3
   10284:	00000097          	auipc	ra,0x0
   10288:	f24080e7          	jalr	-220(ra) # 101a8 <ackerman>
   1028c:	00050793          	mv	a5,a0
   10290:	fef42623          	sw	a5,-20(s0)
   10294:	fec42783          	lw	a5,-20(s0)
   10298:	00078513          	mv	a0,a5
   1029c:	04c000ef          	jal	ra,102e8 <Printd>
   102a0:	00000793          	li	a5,0
   102a4:	00078513          	mv	a0,a5
   102a8:	01813083          	ld	ra,24(sp)
   102ac:	01013403          	ld	s0,16(sp)
   102b0:	02010113          	addi	sp,sp,32
   102b4:	00008067          	ret
   102b8:	0000                	unimp
	...

00000000000102bc <Printc>:
   102bc:	fe010113          	addi	sp,sp,-32
   102c0:	00813c23          	sd	s0,24(sp)
   102c4:	02010413          	addi	s0,sp,32
   102c8:	00050793          	mv	a5,a0
   102cc:	fef407a3          	sb	a5,-17(s0)
   102d0:	00100893          	li	a7,1
   102d4:	00000073          	ecall
   102d8:	00000013          	nop
   102dc:	01813403          	ld	s0,24(sp)
   102e0:	02010113          	addi	sp,sp,32
   102e4:	00008067          	ret

00000000000102e8 <Printd>:
   102e8:	fe010113          	addi	sp,sp,-32
   102ec:	00813c23          	sd	s0,24(sp)
   102f0:	02010413          	addi	s0,sp,32
   102f4:	00050793          	mv	a5,a0
   102f8:	fef42623          	sw	a5,-20(s0)
   102fc:	00200893          	li	a7,2
   10300:	00000073          	ecall
   10304:	00000013          	nop
   10308:	01813403          	ld	s0,24(sp)
   1030c:	02010113          	addi	sp,sp,32
   10310:	00008067          	ret

0000000000010314 <Prints>:
   10314:	fe010113          	addi	sp,sp,-32
   10318:	00813c23          	sd	s0,24(sp)
   1031c:	02010413          	addi	s0,sp,32
   10320:	fea43423          	sd	a0,-24(s0)
   10324:	00300893          	li	a7,3
   10328:	00000073          	ecall
   1032c:	00000013          	nop
   10330:	01813403          	ld	s0,24(sp)
   10334:	02010113          	addi	sp,sp,32
   10338:	00008067          	ret

000000000001033c <Getc>:
   1033c:	fe010113          	addi	sp,sp,-32
   10340:	00813c23          	sd	s0,24(sp)
   10344:	02010413          	addi	s0,sp,32
   10348:	00400893          	li	a7,4
   1034c:	00000073          	ecall
   10350:	00050793          	mv	a5,a0
   10354:	fef407a3          	sb	a5,-17(s0)
   10358:	fef44783          	lbu	a5,-17(s0)
   1035c:	00078513          	mv	a0,a5
   10360:	01813403          	ld	s0,24(sp)
   10364:	02010113          	addi	sp,sp,32
   10368:	00008067          	ret

000000000001036c <Getd>:
   1036c:	fe010113          	addi	sp,sp,-32
   10370:	00813c23          	sd	s0,24(sp)
   10374:	02010413          	addi	s0,sp,32
   10378:	00500893          	li	a7,5
   1037c:	00000073          	ecall
   10380:	00050793          	mv	a5,a0
   10384:	fef42623          	sw	a5,-20(s0)
   10388:	fec42783          	lw	a5,-20(s0)
   1038c:	00078513          	mv	a0,a5
   10390:	01813403          	ld	s0,24(sp)
   10394:	02010113          	addi	sp,sp,32
   10398:	00008067          	ret

000000000001039c <Exit>:
   1039c:	ff010113          	addi	sp,sp,-16
   103a0:	00813423          	sd	s0,8(sp)
   103a4:	01010413          	addi	s0,sp,16
   103a8:	00000893          	li	a7,0
   103ac:	00000073          	ecall
   103b0:	00000013          	nop
   103b4:	00813403          	ld	s0,8(sp)
   103b8:	01010113          	addi	sp,sp,16
   103bc:	00008067          	ret
	...

00000000000103c2 <atexit>:
   103c2:	85aa                	mv	a1,a0
   103c4:	4681                	li	a3,0
   103c6:	4601                	li	a2,0
   103c8:	4501                	li	a0,0
   103ca:	18c0006f          	j	10556 <__register_exitproc>
	...

00000000000103d0 <exit>:
   103d0:	1141                	addi	sp,sp,-16
   103d2:	4581                	li	a1,0
   103d4:	e022                	sd	s0,0(sp)
   103d6:	e406                	sd	ra,8(sp)
   103d8:	842a                	mv	s0,a0
   103da:	1e4000ef          	jal	ra,105be <__call_exitprocs>
   103de:	67c5                	lui	a5,0x11
   103e0:	7607b503          	ld	a0,1888(a5) # 11760 <_global_impure_ptr>
   103e4:	6d3c                	ld	a5,88(a0)
   103e6:	c391                	beqz	a5,103ea <exit+0x1a>
   103e8:	9782                	jalr	a5
   103ea:	8522                	mv	a0,s0
   103ec:	00000097          	auipc	ra,0x0
   103f0:	66e080e7          	jalr	1646(ra) # 10a5a <_exit>
	...

00000000000103f6 <__libc_fini_array>:
   103f6:	7179                	addi	sp,sp,-48
   103f8:	67c5                	lui	a5,0x11
   103fa:	6745                	lui	a4,0x11
   103fc:	f022                	sd	s0,32(sp)
   103fe:	00870713          	addi	a4,a4,8 # 11008 <__init_array_end>
   10402:	01078413          	addi	s0,a5,16 # 11010 <__fini_array_end>
   10406:	8c19                	sub	s0,s0,a4
   10408:	ec26                	sd	s1,24(sp)
   1040a:	e84a                	sd	s2,16(sp)
   1040c:	e44e                	sd	s3,8(sp)
   1040e:	f406                	sd	ra,40(sp)
   10410:	840d                	srai	s0,s0,0x3
   10412:	4481                	li	s1,0
   10414:	01078913          	addi	s2,a5,16
   10418:	59e1                	li	s3,-8
   1041a:	00941c63          	bne	s0,s1,10432 <__libc_fini_array+0x3c>
   1041e:	7402                	ld	s0,32(sp)
   10420:	70a2                	ld	ra,40(sp)
   10422:	64e2                	ld	s1,24(sp)
   10424:	6942                	ld	s2,16(sp)
   10426:	69a2                	ld	s3,8(sp)
   10428:	6145                	addi	sp,sp,48
   1042a:	00000317          	auipc	t1,0x0
   1042e:	cc830067          	jr	-824(t1) # 100f2 <_fini>
   10432:	033487b3          	mul	a5,s1,s3
   10436:	0485                	addi	s1,s1,1
   10438:	97ca                	add	a5,a5,s2
   1043a:	ff87b783          	ld	a5,-8(a5)
   1043e:	9782                	jalr	a5
   10440:	bfe9                	j	1041a <__libc_fini_array+0x24>
	...

0000000000010444 <__libc_init_array>:
   10444:	1101                	addi	sp,sp,-32
   10446:	e822                	sd	s0,16(sp)
   10448:	e426                	sd	s1,8(sp)
   1044a:	6445                	lui	s0,0x11
   1044c:	64c5                	lui	s1,0x11
   1044e:	00048793          	mv	a5,s1
   10452:	00040413          	mv	s0,s0
   10456:	8c1d                	sub	s0,s0,a5
   10458:	e04a                	sd	s2,0(sp)
   1045a:	ec06                	sd	ra,24(sp)
   1045c:	840d                	srai	s0,s0,0x3
   1045e:	00048493          	mv	s1,s1
   10462:	4901                	li	s2,0
   10464:	02891963          	bne	s2,s0,10496 <__libc_init_array+0x52>
   10468:	64c5                	lui	s1,0x11
   1046a:	00000097          	auipc	ra,0x0
   1046e:	c88080e7          	jalr	-888(ra) # 100f2 <_fini>
   10472:	6445                	lui	s0,0x11
   10474:	00048793          	mv	a5,s1
   10478:	00840413          	addi	s0,s0,8 # 11008 <__init_array_end>
   1047c:	8c1d                	sub	s0,s0,a5
   1047e:	840d                	srai	s0,s0,0x3
   10480:	00048493          	mv	s1,s1
   10484:	4901                	li	s2,0
   10486:	00891d63          	bne	s2,s0,104a0 <__libc_init_array+0x5c>
   1048a:	60e2                	ld	ra,24(sp)
   1048c:	6442                	ld	s0,16(sp)
   1048e:	64a2                	ld	s1,8(sp)
   10490:	6902                	ld	s2,0(sp)
   10492:	6105                	addi	sp,sp,32
   10494:	8082                	ret
   10496:	609c                	ld	a5,0(s1)
   10498:	0905                	addi	s2,s2,1
   1049a:	04a1                	addi	s1,s1,8
   1049c:	9782                	jalr	a5
   1049e:	b7d9                	j	10464 <__libc_init_array+0x20>
   104a0:	609c                	ld	a5,0(s1)
   104a2:	0905                	addi	s2,s2,1
   104a4:	04a1                	addi	s1,s1,8
   104a6:	9782                	jalr	a5
   104a8:	bff9                	j	10486 <__libc_init_array+0x42>
	...

00000000000104ac <memset>:
   104ac:	483d                	li	a6,15
   104ae:	872a                	mv	a4,a0
   104b0:	02c87163          	bleu	a2,a6,104d2 <memset+0x26>
   104b4:	00f77793          	andi	a5,a4,15
   104b8:	e3c1                	bnez	a5,10538 <memset+0x8c>
   104ba:	e1bd                	bnez	a1,10520 <memset+0x74>
   104bc:	ff067693          	andi	a3,a2,-16
   104c0:	8a3d                	andi	a2,a2,15
   104c2:	96ba                	add	a3,a3,a4
   104c4:	e30c                	sd	a1,0(a4)
   104c6:	e70c                	sd	a1,8(a4)
   104c8:	0741                	addi	a4,a4,16
   104ca:	fed76de3          	bltu	a4,a3,104c4 <memset+0x18>
   104ce:	e211                	bnez	a2,104d2 <memset+0x26>
   104d0:	8082                	ret
   104d2:	40c806b3          	sub	a3,a6,a2
   104d6:	068a                	slli	a3,a3,0x2
   104d8:	00000297          	auipc	t0,0x0
   104dc:	9696                	add	a3,a3,t0
   104de:	00a68067          	jr	10(a3)
   104e2:	00b70723          	sb	a1,14(a4)
   104e6:	00b706a3          	sb	a1,13(a4)
   104ea:	00b70623          	sb	a1,12(a4)
   104ee:	00b705a3          	sb	a1,11(a4)
   104f2:	00b70523          	sb	a1,10(a4)
   104f6:	00b704a3          	sb	a1,9(a4)
   104fa:	00b70423          	sb	a1,8(a4)
   104fe:	00b703a3          	sb	a1,7(a4)
   10502:	00b70323          	sb	a1,6(a4)
   10506:	00b702a3          	sb	a1,5(a4)
   1050a:	00b70223          	sb	a1,4(a4)
   1050e:	00b701a3          	sb	a1,3(a4)
   10512:	00b70123          	sb	a1,2(a4)
   10516:	00b700a3          	sb	a1,1(a4)
   1051a:	00b70023          	sb	a1,0(a4)
   1051e:	8082                	ret
   10520:	0ff5f593          	andi	a1,a1,255
   10524:	00859693          	slli	a3,a1,0x8
   10528:	8dd5                	or	a1,a1,a3
   1052a:	01059693          	slli	a3,a1,0x10
   1052e:	8dd5                	or	a1,a1,a3
   10530:	02059693          	slli	a3,a1,0x20
   10534:	8dd5                	or	a1,a1,a3
   10536:	b759                	j	104bc <memset+0x10>
   10538:	00279693          	slli	a3,a5,0x2
   1053c:	00000297          	auipc	t0,0x0
   10540:	9696                	add	a3,a3,t0
   10542:	8286                	mv	t0,ra
   10544:	fa2680e7          	jalr	-94(a3)
   10548:	8096                	mv	ra,t0
   1054a:	17c1                	addi	a5,a5,-16
   1054c:	8f1d                	sub	a4,a4,a5
   1054e:	963e                	add	a2,a2,a5
   10550:	f8c871e3          	bleu	a2,a6,104d2 <memset+0x26>
   10554:	b79d                	j	104ba <memset+0xe>

0000000000010556 <__register_exitproc>:
   10556:	67c5                	lui	a5,0x11
   10558:	7607b703          	ld	a4,1888(a5) # 11760 <_global_impure_ptr>
   1055c:	832a                	mv	t1,a0
   1055e:	1f873783          	ld	a5,504(a4)
   10562:	e789                	bnez	a5,1056c <__register_exitproc+0x16>
   10564:	20070793          	addi	a5,a4,512
   10568:	1ef73c23          	sd	a5,504(a4)
   1056c:	4798                	lw	a4,8(a5)
   1056e:	487d                	li	a6,31
   10570:	557d                	li	a0,-1
   10572:	04e84463          	blt	a6,a4,105ba <__register_exitproc+0x64>
   10576:	02030a63          	beqz	t1,105aa <__register_exitproc+0x54>
   1057a:	00371813          	slli	a6,a4,0x3
   1057e:	983e                	add	a6,a6,a5
   10580:	10c83823          	sd	a2,272(a6)
   10584:	3107a883          	lw	a7,784(a5)
   10588:	4605                	li	a2,1
   1058a:	00e6163b          	sllw	a2,a2,a4
   1058e:	00c8e8b3          	or	a7,a7,a2
   10592:	3117a823          	sw	a7,784(a5)
   10596:	20d83823          	sd	a3,528(a6)
   1059a:	4689                	li	a3,2
   1059c:	00d31763          	bne	t1,a3,105aa <__register_exitproc+0x54>
   105a0:	3147a683          	lw	a3,788(a5)
   105a4:	8e55                	or	a2,a2,a3
   105a6:	30c7aa23          	sw	a2,788(a5)
   105aa:	0017069b          	addiw	a3,a4,1
   105ae:	0709                	addi	a4,a4,2
   105b0:	070e                	slli	a4,a4,0x3
   105b2:	c794                	sw	a3,8(a5)
   105b4:	97ba                	add	a5,a5,a4
   105b6:	e38c                	sd	a1,0(a5)
   105b8:	4501                	li	a0,0
   105ba:	8082                	ret
	...

00000000000105be <__call_exitprocs>:
   105be:	715d                	addi	sp,sp,-80
   105c0:	67c5                	lui	a5,0x11
   105c2:	f44e                	sd	s3,40(sp)
   105c4:	7607b983          	ld	s3,1888(a5) # 11760 <_global_impure_ptr>
   105c8:	f052                	sd	s4,32(sp)
   105ca:	ec56                	sd	s5,24(sp)
   105cc:	e85a                	sd	s6,16(sp)
   105ce:	e486                	sd	ra,72(sp)
   105d0:	e0a2                	sd	s0,64(sp)
   105d2:	fc26                	sd	s1,56(sp)
   105d4:	f84a                	sd	s2,48(sp)
   105d6:	e45e                	sd	s7,8(sp)
   105d8:	8aaa                	mv	s5,a0
   105da:	8a2e                	mv	s4,a1
   105dc:	4b05                	li	s6,1
   105de:	1f89b403          	ld	s0,504(s3)
   105e2:	c801                	beqz	s0,105f2 <__call_exitprocs+0x34>
   105e4:	4404                	lw	s1,8(s0)
   105e6:	34fd                	addiw	s1,s1,-1
   105e8:	00349913          	slli	s2,s1,0x3
   105ec:	9922                	add	s2,s2,s0
   105ee:	0004dd63          	bgez	s1,10608 <__call_exitprocs+0x4a>
   105f2:	60a6                	ld	ra,72(sp)
   105f4:	6406                	ld	s0,64(sp)
   105f6:	74e2                	ld	s1,56(sp)
   105f8:	7942                	ld	s2,48(sp)
   105fa:	79a2                	ld	s3,40(sp)
   105fc:	7a02                	ld	s4,32(sp)
   105fe:	6ae2                	ld	s5,24(sp)
   10600:	6b42                	ld	s6,16(sp)
   10602:	6ba2                	ld	s7,8(sp)
   10604:	6161                	addi	sp,sp,80
   10606:	8082                	ret
   10608:	000a0963          	beqz	s4,1061a <__call_exitprocs+0x5c>
   1060c:	21093783          	ld	a5,528(s2)
   10610:	01478563          	beq	a5,s4,1061a <__call_exitprocs+0x5c>
   10614:	34fd                	addiw	s1,s1,-1
   10616:	1961                	addi	s2,s2,-8
   10618:	bfd9                	j	105ee <__call_exitprocs+0x30>
   1061a:	441c                	lw	a5,8(s0)
   1061c:	01093683          	ld	a3,16(s2)
   10620:	37fd                	addiw	a5,a5,-1
   10622:	02979663          	bne	a5,s1,1064e <__call_exitprocs+0x90>
   10626:	c404                	sw	s1,8(s0)
   10628:	d6f5                	beqz	a3,10614 <__call_exitprocs+0x56>
   1062a:	31042703          	lw	a4,784(s0)
   1062e:	009b163b          	sllw	a2,s6,s1
   10632:	00842b83          	lw	s7,8(s0)
   10636:	8f71                	and	a4,a4,a2
   10638:	2701                	sext.w	a4,a4
   1063a:	ef09                	bnez	a4,10654 <__call_exitprocs+0x96>
   1063c:	9682                	jalr	a3
   1063e:	4418                	lw	a4,8(s0)
   10640:	1f89b783          	ld	a5,504(s3)
   10644:	f9771de3          	bne	a4,s7,105de <__call_exitprocs+0x20>
   10648:	fcf406e3          	beq	s0,a5,10614 <__call_exitprocs+0x56>
   1064c:	bf49                	j	105de <__call_exitprocs+0x20>
   1064e:	00093823          	sd	zero,16(s2)
   10652:	bfd9                	j	10628 <__call_exitprocs+0x6a>
   10654:	31442783          	lw	a5,788(s0)
   10658:	11093583          	ld	a1,272(s2)
   1065c:	8ff1                	and	a5,a5,a2
   1065e:	2781                	sext.w	a5,a5
   10660:	e781                	bnez	a5,10668 <__call_exitprocs+0xaa>
   10662:	8556                	mv	a0,s5
   10664:	9682                	jalr	a3
   10666:	bfe1                	j	1063e <__call_exitprocs+0x80>
   10668:	852e                	mv	a0,a1
   1066a:	9682                	jalr	a3
   1066c:	bfc9                	j	1063e <__call_exitprocs+0x80>
	...

0000000000010670 <conv_stat>:
   10670:	619c                	ld	a5,0(a1)
   10672:	00f51023          	sh	a5,0(a0)
   10676:	659c                	ld	a5,8(a1)
   10678:	00f51123          	sh	a5,2(a0)
   1067c:	499c                	lw	a5,16(a1)
   1067e:	c15c                	sw	a5,4(a0)
   10680:	49dc                	lw	a5,20(a1)
   10682:	00f51423          	sh	a5,8(a0)
   10686:	4d9c                	lw	a5,24(a1)
   10688:	00f51523          	sh	a5,10(a0)
   1068c:	4ddc                	lw	a5,28(a1)
   1068e:	00f51623          	sh	a5,12(a0)
   10692:	719c                	ld	a5,32(a1)
   10694:	00f51723          	sh	a5,14(a0)
   10698:	799c                	ld	a5,48(a1)
   1069a:	e91c                	sd	a5,16(a0)
   1069c:	61bc                	ld	a5,64(a1)
   1069e:	e93c                	sd	a5,80(a0)
   106a0:	5d9c                	lw	a5,56(a1)
   106a2:	e53c                	sd	a5,72(a0)
   106a4:	65bc                	ld	a5,72(a1)
   106a6:	ed1c                	sd	a5,24(a0)
   106a8:	6dbc                	ld	a5,88(a1)
   106aa:	f51c                	sd	a5,40(a0)
   106ac:	75bc                	ld	a5,104(a1)
   106ae:	fd1c                	sd	a5,56(a0)
   106b0:	8082                	ret

00000000000106b2 <__syscall_error>:
   106b2:	1141                	addi	sp,sp,-16
   106b4:	e022                	sd	s0,0(sp)
   106b6:	e406                	sd	ra,8(sp)
   106b8:	842a                	mv	s0,a0
   106ba:	00000097          	auipc	ra,0x0
   106be:	3ba080e7          	jalr	954(ra) # 10a74 <__errno>
   106c2:	408007bb          	negw	a5,s0
   106c6:	60a2                	ld	ra,8(sp)
   106c8:	6402                	ld	s0,0(sp)
   106ca:	c11c                	sw	a5,0(a0)
   106cc:	557d                	li	a0,-1
   106ce:	0141                	addi	sp,sp,16
   106d0:	8082                	ret

00000000000106d2 <__internal_syscall>:
   106d2:	88aa                	mv	a7,a0
   106d4:	852e                	mv	a0,a1
   106d6:	85b2                	mv	a1,a2
   106d8:	8636                	mv	a2,a3
   106da:	86ba                	mv	a3,a4
   106dc:	00000073          	ecall
   106e0:	00055663          	bgez	a0,106ec <__internal_syscall+0x1a>
   106e4:	00000317          	auipc	t1,0x0
   106e8:	fce30067          	jr	-50(t1) # 106b2 <__syscall_error>
   106ec:	8082                	ret

00000000000106ee <open>:
   106ee:	1141                	addi	sp,sp,-16
   106f0:	86b2                	mv	a3,a2
   106f2:	4701                	li	a4,0
   106f4:	862e                	mv	a2,a1
   106f6:	85aa                	mv	a1,a0
   106f8:	40000513          	li	a0,1024
   106fc:	e406                	sd	ra,8(sp)
   106fe:	00000097          	auipc	ra,0x0
   10702:	fd4080e7          	jalr	-44(ra) # 106d2 <__internal_syscall>
   10706:	60a2                	ld	ra,8(sp)
   10708:	2501                	sext.w	a0,a0
   1070a:	0141                	addi	sp,sp,16
   1070c:	8082                	ret

000000000001070e <openat>:
   1070e:	1141                	addi	sp,sp,-16
   10710:	8736                	mv	a4,a3
   10712:	86b2                	mv	a3,a2
   10714:	862e                	mv	a2,a1
   10716:	85aa                	mv	a1,a0
   10718:	03800513          	li	a0,56
   1071c:	e406                	sd	ra,8(sp)
   1071e:	fb5ff0ef          	jal	ra,106d2 <__internal_syscall>
   10722:	60a2                	ld	ra,8(sp)
   10724:	2501                	sext.w	a0,a0
   10726:	0141                	addi	sp,sp,16
   10728:	8082                	ret

000000000001072a <lseek>:
   1072a:	86b2                	mv	a3,a2
   1072c:	4701                	li	a4,0
   1072e:	862e                	mv	a2,a1
   10730:	85aa                	mv	a1,a0
   10732:	03e00513          	li	a0,62
   10736:	00000317          	auipc	t1,0x0
   1073a:	f9c30067          	jr	-100(t1) # 106d2 <__internal_syscall>

000000000001073e <read>:
   1073e:	86b2                	mv	a3,a2
   10740:	4701                	li	a4,0
   10742:	862e                	mv	a2,a1
   10744:	85aa                	mv	a1,a0
   10746:	03f00513          	li	a0,63
   1074a:	f89ff06f          	j	106d2 <__internal_syscall>

000000000001074e <write>:
   1074e:	86b2                	mv	a3,a2
   10750:	4701                	li	a4,0
   10752:	862e                	mv	a2,a1
   10754:	85aa                	mv	a1,a0
   10756:	04000513          	li	a0,64
   1075a:	00000317          	auipc	t1,0x0
   1075e:	f7830067          	jr	-136(t1) # 106d2 <__internal_syscall>

0000000000010762 <fstat>:
   10762:	7135                	addi	sp,sp,-160
   10764:	e526                	sd	s1,136(sp)
   10766:	860a                	mv	a2,sp
   10768:	84ae                	mv	s1,a1
   1076a:	4701                	li	a4,0
   1076c:	85aa                	mv	a1,a0
   1076e:	4681                	li	a3,0
   10770:	05000513          	li	a0,80
   10774:	ed06                	sd	ra,152(sp)
   10776:	e922                	sd	s0,144(sp)
   10778:	f5bff0ef          	jal	ra,106d2 <__internal_syscall>
   1077c:	842a                	mv	s0,a0
   1077e:	858a                	mv	a1,sp
   10780:	8526                	mv	a0,s1
   10782:	eefff0ef          	jal	ra,10670 <conv_stat>
   10786:	0004051b          	sext.w	a0,s0
   1078a:	60ea                	ld	ra,152(sp)
   1078c:	644a                	ld	s0,144(sp)
   1078e:	64aa                	ld	s1,136(sp)
   10790:	610d                	addi	sp,sp,160
   10792:	8082                	ret

0000000000010794 <stat>:
   10794:	7135                	addi	sp,sp,-160
   10796:	e526                	sd	s1,136(sp)
   10798:	860a                	mv	a2,sp
   1079a:	84ae                	mv	s1,a1
   1079c:	4701                	li	a4,0
   1079e:	85aa                	mv	a1,a0
   107a0:	4681                	li	a3,0
   107a2:	40e00513          	li	a0,1038
   107a6:	ed06                	sd	ra,152(sp)
   107a8:	e922                	sd	s0,144(sp)
   107aa:	00000097          	auipc	ra,0x0
   107ae:	f28080e7          	jalr	-216(ra) # 106d2 <__internal_syscall>
   107b2:	842a                	mv	s0,a0
   107b4:	858a                	mv	a1,sp
   107b6:	8526                	mv	a0,s1
   107b8:	00000097          	auipc	ra,0x0
   107bc:	eb8080e7          	jalr	-328(ra) # 10670 <conv_stat>
   107c0:	0004051b          	sext.w	a0,s0
   107c4:	60ea                	ld	ra,152(sp)
   107c6:	644a                	ld	s0,144(sp)
   107c8:	64aa                	ld	s1,136(sp)
   107ca:	610d                	addi	sp,sp,160
   107cc:	8082                	ret

00000000000107ce <lstat>:
   107ce:	7135                	addi	sp,sp,-160
   107d0:	e526                	sd	s1,136(sp)
   107d2:	860a                	mv	a2,sp
   107d4:	84ae                	mv	s1,a1
   107d6:	4701                	li	a4,0
   107d8:	85aa                	mv	a1,a0
   107da:	4681                	li	a3,0
   107dc:	40f00513          	li	a0,1039
   107e0:	ed06                	sd	ra,152(sp)
   107e2:	e922                	sd	s0,144(sp)
   107e4:	eefff0ef          	jal	ra,106d2 <__internal_syscall>
   107e8:	842a                	mv	s0,a0
   107ea:	858a                	mv	a1,sp
   107ec:	8526                	mv	a0,s1
   107ee:	e83ff0ef          	jal	ra,10670 <conv_stat>
   107f2:	0004051b          	sext.w	a0,s0
   107f6:	60ea                	ld	ra,152(sp)
   107f8:	644a                	ld	s0,144(sp)
   107fa:	64aa                	ld	s1,136(sp)
   107fc:	610d                	addi	sp,sp,160
   107fe:	8082                	ret

0000000000010800 <fstatat>:
   10800:	7135                	addi	sp,sp,-160
   10802:	e526                	sd	s1,136(sp)
   10804:	8736                	mv	a4,a3
   10806:	84b2                	mv	s1,a2
   10808:	868a                	mv	a3,sp
   1080a:	862e                	mv	a2,a1
   1080c:	85aa                	mv	a1,a0
   1080e:	04f00513          	li	a0,79
   10812:	ed06                	sd	ra,152(sp)
   10814:	e922                	sd	s0,144(sp)
   10816:	00000097          	auipc	ra,0x0
   1081a:	ebc080e7          	jalr	-324(ra) # 106d2 <__internal_syscall>
   1081e:	842a                	mv	s0,a0
   10820:	858a                	mv	a1,sp
   10822:	8526                	mv	a0,s1
   10824:	00000097          	auipc	ra,0x0
   10828:	e4c080e7          	jalr	-436(ra) # 10670 <conv_stat>
   1082c:	0004051b          	sext.w	a0,s0
   10830:	60ea                	ld	ra,152(sp)
   10832:	644a                	ld	s0,144(sp)
   10834:	64aa                	ld	s1,136(sp)
   10836:	610d                	addi	sp,sp,160
   10838:	8082                	ret

000000000001083a <access>:
   1083a:	1141                	addi	sp,sp,-16
   1083c:	862e                	mv	a2,a1
   1083e:	4701                	li	a4,0
   10840:	85aa                	mv	a1,a0
   10842:	4681                	li	a3,0
   10844:	40900513          	li	a0,1033
   10848:	e406                	sd	ra,8(sp)
   1084a:	e89ff0ef          	jal	ra,106d2 <__internal_syscall>
   1084e:	60a2                	ld	ra,8(sp)
   10850:	2501                	sext.w	a0,a0
   10852:	0141                	addi	sp,sp,16
   10854:	8082                	ret

0000000000010856 <faccessat>:
   10856:	1141                	addi	sp,sp,-16
   10858:	8736                	mv	a4,a3
   1085a:	86b2                	mv	a3,a2
   1085c:	862e                	mv	a2,a1
   1085e:	85aa                	mv	a1,a0
   10860:	03000513          	li	a0,48
   10864:	e406                	sd	ra,8(sp)
   10866:	00000097          	auipc	ra,0x0
   1086a:	e6c080e7          	jalr	-404(ra) # 106d2 <__internal_syscall>
   1086e:	60a2                	ld	ra,8(sp)
   10870:	2501                	sext.w	a0,a0
   10872:	0141                	addi	sp,sp,16
   10874:	8082                	ret

0000000000010876 <close>:
   10876:	1141                	addi	sp,sp,-16
   10878:	85aa                	mv	a1,a0
   1087a:	4701                	li	a4,0
   1087c:	4681                	li	a3,0
   1087e:	4601                	li	a2,0
   10880:	03900513          	li	a0,57
   10884:	e406                	sd	ra,8(sp)
   10886:	e4dff0ef          	jal	ra,106d2 <__internal_syscall>
   1088a:	60a2                	ld	ra,8(sp)
   1088c:	2501                	sext.w	a0,a0
   1088e:	0141                	addi	sp,sp,16
   10890:	8082                	ret

0000000000010892 <link>:
   10892:	1141                	addi	sp,sp,-16
   10894:	862e                	mv	a2,a1
   10896:	4701                	li	a4,0
   10898:	85aa                	mv	a1,a0
   1089a:	4681                	li	a3,0
   1089c:	40100513          	li	a0,1025
   108a0:	e406                	sd	ra,8(sp)
   108a2:	00000097          	auipc	ra,0x0
   108a6:	e30080e7          	jalr	-464(ra) # 106d2 <__internal_syscall>
   108aa:	60a2                	ld	ra,8(sp)
   108ac:	2501                	sext.w	a0,a0
   108ae:	0141                	addi	sp,sp,16
   108b0:	8082                	ret

00000000000108b2 <unlink>:
   108b2:	1141                	addi	sp,sp,-16
   108b4:	85aa                	mv	a1,a0
   108b6:	4701                	li	a4,0
   108b8:	4681                	li	a3,0
   108ba:	4601                	li	a2,0
   108bc:	40200513          	li	a0,1026
   108c0:	e406                	sd	ra,8(sp)
   108c2:	e11ff0ef          	jal	ra,106d2 <__internal_syscall>
   108c6:	60a2                	ld	ra,8(sp)
   108c8:	2501                	sext.w	a0,a0
   108ca:	0141                	addi	sp,sp,16
   108cc:	8082                	ret

00000000000108ce <execve>:
   108ce:	1141                	addi	sp,sp,-16
   108d0:	e406                	sd	ra,8(sp)
   108d2:	00000097          	auipc	ra,0x0
   108d6:	1a2080e7          	jalr	418(ra) # 10a74 <__errno>
   108da:	60a2                	ld	ra,8(sp)
   108dc:	47b1                	li	a5,12
   108de:	c11c                	sw	a5,0(a0)
   108e0:	557d                	li	a0,-1
   108e2:	0141                	addi	sp,sp,16
   108e4:	8082                	ret

00000000000108e6 <fork>:
   108e6:	1141                	addi	sp,sp,-16
   108e8:	e406                	sd	ra,8(sp)
   108ea:	18a000ef          	jal	ra,10a74 <__errno>
   108ee:	60a2                	ld	ra,8(sp)
   108f0:	47ad                	li	a5,11
   108f2:	c11c                	sw	a5,0(a0)
   108f4:	557d                	li	a0,-1
   108f6:	0141                	addi	sp,sp,16
   108f8:	8082                	ret

00000000000108fa <getpid>:
   108fa:	4505                	li	a0,1
   108fc:	8082                	ret

00000000000108fe <kill>:
   108fe:	1141                	addi	sp,sp,-16
   10900:	e406                	sd	ra,8(sp)
   10902:	172000ef          	jal	ra,10a74 <__errno>
   10906:	60a2                	ld	ra,8(sp)
   10908:	47d9                	li	a5,22
   1090a:	c11c                	sw	a5,0(a0)
   1090c:	557d                	li	a0,-1
   1090e:	0141                	addi	sp,sp,16
   10910:	8082                	ret

0000000000010912 <wait>:
   10912:	1141                	addi	sp,sp,-16
   10914:	e406                	sd	ra,8(sp)
   10916:	00000097          	auipc	ra,0x0
   1091a:	15e080e7          	jalr	350(ra) # 10a74 <__errno>
   1091e:	60a2                	ld	ra,8(sp)
   10920:	47a9                	li	a5,10
   10922:	c11c                	sw	a5,0(a0)
   10924:	557d                	li	a0,-1
   10926:	0141                	addi	sp,sp,16
   10928:	8082                	ret

000000000001092a <isatty>:
   1092a:	7119                	addi	sp,sp,-128
   1092c:	002c                	addi	a1,sp,8
   1092e:	fc86                	sd	ra,120(sp)
   10930:	e33ff0ef          	jal	ra,10762 <fstat>
   10934:	57fd                	li	a5,-1
   10936:	00f50663          	beq	a0,a5,10942 <isatty+0x18>
   1093a:	4532                	lw	a0,12(sp)
   1093c:	40d5551b          	sraiw	a0,a0,0xd
   10940:	8905                	andi	a0,a0,1
   10942:	70e6                	ld	ra,120(sp)
   10944:	6109                	addi	sp,sp,128
   10946:	8082                	ret

0000000000010948 <gettimeofday>:
   10948:	1141                	addi	sp,sp,-16
   1094a:	85aa                	mv	a1,a0
   1094c:	4701                	li	a4,0
   1094e:	4681                	li	a3,0
   10950:	4601                	li	a2,0
   10952:	0a900513          	li	a0,169
   10956:	e406                	sd	ra,8(sp)
   10958:	00000097          	auipc	ra,0x0
   1095c:	d7a080e7          	jalr	-646(ra) # 106d2 <__internal_syscall>
   10960:	60a2                	ld	ra,8(sp)
   10962:	2501                	sext.w	a0,a0
   10964:	0141                	addi	sp,sp,16
   10966:	8082                	ret

0000000000010968 <times>:
   10968:	7179                	addi	sp,sp,-48
   1096a:	f022                	sd	s0,32(sp)
   1096c:	842a                	mv	s0,a0
   1096e:	8581b783          	ld	a5,-1960(gp) # 117b0 <t0.2574>
   10972:	ec26                	sd	s1,24(sp)
   10974:	f406                	sd	ra,40(sp)
   10976:	85818493          	addi	s1,gp,-1960 # 117b0 <t0.2574>
   1097a:	eb81                	bnez	a5,1098a <times+0x22>
   1097c:	4581                	li	a1,0
   1097e:	85818513          	addi	a0,gp,-1960 # 117b0 <t0.2574>
   10982:	00000097          	auipc	ra,0x0
   10986:	fc6080e7          	jalr	-58(ra) # 10948 <gettimeofday>
   1098a:	850a                	mv	a0,sp
   1098c:	4581                	li	a1,0
   1098e:	00000097          	auipc	ra,0x0
   10992:	fba080e7          	jalr	-70(ra) # 10948 <gettimeofday>
   10996:	6098                	ld	a4,0(s1)
   10998:	6782                	ld	a5,0(sp)
   1099a:	6494                	ld	a3,8(s1)
   1099c:	00043823          	sd	zero,16(s0)
   109a0:	8f99                	sub	a5,a5,a4
   109a2:	000f4737          	lui	a4,0xf4
   109a6:	24070713          	addi	a4,a4,576 # f4240 <__global_pointer$+0xe22e8>
   109aa:	02e787b3          	mul	a5,a5,a4
   109ae:	6722                	ld	a4,8(sp)
   109b0:	00043c23          	sd	zero,24(s0)
   109b4:	00043423          	sd	zero,8(s0)
   109b8:	8f15                	sub	a4,a4,a3
   109ba:	70a2                	ld	ra,40(sp)
   109bc:	64e2                	ld	s1,24(sp)
   109be:	557d                	li	a0,-1
   109c0:	97ba                	add	a5,a5,a4
   109c2:	e01c                	sd	a5,0(s0)
   109c4:	7402                	ld	s0,32(sp)
   109c6:	6145                	addi	sp,sp,48
   109c8:	8082                	ret

00000000000109ca <ftime>:
   109ca:	00051423          	sh	zero,8(a0)
   109ce:	00053023          	sd	zero,0(a0)
   109d2:	4501                	li	a0,0
   109d4:	8082                	ret

00000000000109d6 <utime>:
   109d6:	557d                	li	a0,-1
   109d8:	8082                	ret

00000000000109da <chown>:
   109da:	557d                	li	a0,-1
   109dc:	8082                	ret

00000000000109de <chmod>:
   109de:	557d                	li	a0,-1
   109e0:	8082                	ret

00000000000109e2 <chdir>:
   109e2:	557d                	li	a0,-1
   109e4:	8082                	ret

00000000000109e6 <getcwd>:
   109e6:	4501                	li	a0,0
   109e8:	8082                	ret

00000000000109ea <sysconf>:
   109ea:	4789                	li	a5,2
   109ec:	00f50463          	beq	a0,a5,109f4 <sysconf+0xa>
   109f0:	557d                	li	a0,-1
   109f2:	8082                	ret
   109f4:	000f4537          	lui	a0,0xf4
   109f8:	24050513          	addi	a0,a0,576 # f4240 <__global_pointer$+0xe22e8>
   109fc:	8082                	ret

00000000000109fe <sbrk>:
   109fe:	1101                	addi	sp,sp,-32
   10a00:	e822                	sd	s0,16(sp)
   10a02:	8181b783          	ld	a5,-2024(gp) # 11770 <_edata>
   10a06:	e426                	sd	s1,8(sp)
   10a08:	ec06                	sd	ra,24(sp)
   10a0a:	84aa                	mv	s1,a0
   10a0c:	e785                	bnez	a5,10a34 <sbrk+0x36>
   10a0e:	4701                	li	a4,0
   10a10:	4681                	li	a3,0
   10a12:	4601                	li	a2,0
   10a14:	4581                	li	a1,0
   10a16:	0d600513          	li	a0,214
   10a1a:	cb9ff0ef          	jal	ra,106d2 <__internal_syscall>
   10a1e:	57fd                	li	a5,-1
   10a20:	00f51863          	bne	a0,a5,10a30 <sbrk+0x32>
   10a24:	557d                	li	a0,-1
   10a26:	60e2                	ld	ra,24(sp)
   10a28:	6442                	ld	s0,16(sp)
   10a2a:	64a2                	ld	s1,8(sp)
   10a2c:	6105                	addi	sp,sp,32
   10a2e:	8082                	ret
   10a30:	80a1bc23          	sd	a0,-2024(gp) # 11770 <_edata>
   10a34:	8181b583          	ld	a1,-2024(gp) # 11770 <_edata>
   10a38:	4701                	li	a4,0
   10a3a:	4681                	li	a3,0
   10a3c:	95a6                	add	a1,a1,s1
   10a3e:	4601                	li	a2,0
   10a40:	0d600513          	li	a0,214
   10a44:	c8fff0ef          	jal	ra,106d2 <__internal_syscall>
   10a48:	8181b783          	ld	a5,-2024(gp) # 11770 <_edata>
   10a4c:	94be                	add	s1,s1,a5
   10a4e:	fc951be3          	bne	a0,s1,10a24 <sbrk+0x26>
   10a52:	80a1bc23          	sd	a0,-2024(gp) # 11770 <_edata>
   10a56:	853e                	mv	a0,a5
   10a58:	b7f9                	j	10a26 <sbrk+0x28>

0000000000010a5a <_exit>:
   10a5a:	1141                	addi	sp,sp,-16
   10a5c:	85aa                	mv	a1,a0
   10a5e:	4701                	li	a4,0
   10a60:	4681                	li	a3,0
   10a62:	4601                	li	a2,0
   10a64:	05d00513          	li	a0,93
   10a68:	e406                	sd	ra,8(sp)
   10a6a:	00000097          	auipc	ra,0x0
   10a6e:	c68080e7          	jalr	-920(ra) # 106d2 <__internal_syscall>
   10a72:	a001                	j	10a72 <_exit+0x18>

0000000000010a74 <__errno>:
   10a74:	8101b503          	ld	a0,-2032(gp) # 11768 <_impure_ptr>
   10a78:	8082                	ret
	...

Disassembly of section .eh_frame:

0000000000010a7c <__EH_FRAME_BEGIN__>:
   10a7c:	0000                	unimp
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
