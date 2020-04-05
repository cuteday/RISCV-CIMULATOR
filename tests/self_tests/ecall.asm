
ecall.riscv：     文件格式 elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <_start>:
   100b0:	00002197          	auipc	gp,0x2
   100b4:	eb818193          	addi	gp,gp,-328 # 11f68 <__global_pointer$>
   100b8:	81818513          	addi	a0,gp,-2024 # 11780 <_edata>
   100bc:	86818613          	addi	a2,gp,-1944 # 117d0 <_end>
   100c0:	8e09                	sub	a2,a2,a0
   100c2:	4581                	li	a1,0
   100c4:	35c000ef          	jal	ra,10420 <memset>
   100c8:	00000517          	auipc	a0,0x0
   100cc:	2a250513          	addi	a0,a0,674 # 1036a <__libc_fini_array>
   100d0:	00000097          	auipc	ra,0x0
   100d4:	266080e7          	jalr	614(ra) # 10336 <atexit>
   100d8:	00000097          	auipc	ra,0x0
   100dc:	2e0080e7          	jalr	736(ra) # 103b8 <__libc_init_array>
   100e0:	4502                	lw	a0,0(sp)
   100e2:	002c                	addi	a1,sp,8
   100e4:	4601                	li	a2,0
   100e6:	112000ef          	jal	ra,101f8 <main>
   100ea:	00000317          	auipc	t1,0x0
   100ee:	25a30067          	jr	602(t1) # 10344 <exit>

00000000000100f2 <_fini>:
   100f2:	8082                	ret

00000000000100f4 <deregister_tm_clones>:
   100f4:	6545                	lui	a0,0x11
   100f6:	67c5                	lui	a5,0x11
   100f8:	76850713          	addi	a4,a0,1896 # 11768 <__TMC_END__>
   100fc:	76878793          	addi	a5,a5,1896 # 11768 <__TMC_END__>
   10100:	00e78b63          	beq	a5,a4,10116 <deregister_tm_clones+0x22>
   10104:	00000337          	lui	t1,0x0
   10108:	00030313          	mv	t1,t1
   1010c:	00030563          	beqz	t1,10116 <deregister_tm_clones+0x22>
   10110:	76850513          	addi	a0,a0,1896
   10114:	8302                	jr	t1
   10116:	8082                	ret

0000000000010118 <register_tm_clones>:
   10118:	67c5                	lui	a5,0x11
   1011a:	6545                	lui	a0,0x11
   1011c:	76878593          	addi	a1,a5,1896 # 11768 <__TMC_END__>
   10120:	76850793          	addi	a5,a0,1896 # 11768 <__TMC_END__>
   10124:	8d9d                	sub	a1,a1,a5
   10126:	858d                	srai	a1,a1,0x3
   10128:	4789                	li	a5,2
   1012a:	02f5c5b3          	div	a1,a1,a5
   1012e:	c991                	beqz	a1,10142 <register_tm_clones+0x2a>
   10130:	00000337          	lui	t1,0x0
   10134:	00030313          	mv	t1,t1
   10138:	00030563          	beqz	t1,10142 <register_tm_clones+0x2a>
   1013c:	76850513          	addi	a0,a0,1896
   10140:	8302                	jr	t1
   10142:	8082                	ret

0000000000010144 <__do_global_dtors_aux>:
   10144:	8201c703          	lbu	a4,-2016(gp) # 11788 <completed.5184>
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
   10162:	9f050513          	addi	a0,a0,-1552 # 109f0 <__EH_FRAME_BEGIN__>
   10166:	ffff0097          	auipc	ra,0xffff0
   1016a:	e9a080e7          	jalr	-358(ra) # 0 <_start-0x100b0>
   1016e:	4785                	li	a5,1
   10170:	82f18023          	sb	a5,-2016(gp) # 11788 <completed.5184>
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
   1018e:	79058593          	addi	a1,a1,1936 # 11790 <object.5189>
   10192:	9f050513          	addi	a0,a0,-1552 # 109f0 <__EH_FRAME_BEGIN__>
   10196:	e406                	sd	ra,8(sp)
   10198:	ffff0097          	auipc	ra,0xffff0
   1019c:	e68080e7          	jalr	-408(ra) # 0 <_start-0x100b0>
   101a0:	60a2                	ld	ra,8(sp)
   101a2:	0141                	addi	sp,sp,16
   101a4:	f75ff06f          	j	10118 <register_tm_clones>

00000000000101a8 <fact>:
   101a8:	fe010113          	addi	sp,sp,-32
   101ac:	00113c23          	sd	ra,24(sp)
   101b0:	00813823          	sd	s0,16(sp)
   101b4:	02010413          	addi	s0,sp,32
   101b8:	00050793          	mv	a5,a0
   101bc:	fef42623          	sw	a5,-20(s0)
   101c0:	fec42783          	lw	a5,-20(s0)
   101c4:	0007879b          	sext.w	a5,a5
   101c8:	00078e63          	beqz	a5,101e4 <fact+0x3c>
   101cc:	fec42783          	lw	a5,-20(s0)
   101d0:	fff7879b          	addiw	a5,a5,-1
   101d4:	0007879b          	sext.w	a5,a5
   101d8:	00078513          	mv	a0,a5
   101dc:	fcdff0ef          	jal	ra,101a8 <fact>
   101e0:	0080006f          	j	101e8 <fact+0x40>
   101e4:	00000013          	nop
   101e8:	01813083          	ld	ra,24(sp)
   101ec:	01013403          	ld	s0,16(sp)
   101f0:	02010113          	addi	sp,sp,32
   101f4:	00008067          	ret

00000000000101f8 <main>:
   101f8:	ff010113          	addi	sp,sp,-16
   101fc:	00113423          	sd	ra,8(sp)
   10200:	00813023          	sd	s0,0(sp)
   10204:	01010413          	addi	s0,sp,16
   10208:	00200513          	li	a0,2
   1020c:	00000097          	auipc	ra,0x0
   10210:	f9c080e7          	jalr	-100(ra) # 101a8 <fact>
   10214:	00000793          	li	a5,0
   10218:	00078513          	mv	a0,a5
   1021c:	00813083          	ld	ra,8(sp)
   10220:	00013403          	ld	s0,0(sp)
   10224:	01010113          	addi	sp,sp,16
   10228:	00008067          	ret
   1022c:	0000                	unimp
	...

0000000000010230 <Printc>:
   10230:	fe010113          	addi	sp,sp,-32
   10234:	00813c23          	sd	s0,24(sp)
   10238:	02010413          	addi	s0,sp,32
   1023c:	00050793          	mv	a5,a0
   10240:	fef407a3          	sb	a5,-17(s0)
   10244:	00100893          	li	a7,1
   10248:	00000073          	ecall
   1024c:	00000013          	nop
   10250:	01813403          	ld	s0,24(sp)
   10254:	02010113          	addi	sp,sp,32
   10258:	00008067          	ret

000000000001025c <Printd>:
   1025c:	fe010113          	addi	sp,sp,-32
   10260:	00813c23          	sd	s0,24(sp)
   10264:	02010413          	addi	s0,sp,32
   10268:	00050793          	mv	a5,a0
   1026c:	fef42623          	sw	a5,-20(s0)
   10270:	00200893          	li	a7,2
   10274:	00000073          	ecall
   10278:	00000013          	nop
   1027c:	01813403          	ld	s0,24(sp)
   10280:	02010113          	addi	sp,sp,32
   10284:	00008067          	ret

0000000000010288 <Prints>:
   10288:	fe010113          	addi	sp,sp,-32
   1028c:	00813c23          	sd	s0,24(sp)
   10290:	02010413          	addi	s0,sp,32
   10294:	fea43423          	sd	a0,-24(s0)
   10298:	00300893          	li	a7,3
   1029c:	00000073          	ecall
   102a0:	00000013          	nop
   102a4:	01813403          	ld	s0,24(sp)
   102a8:	02010113          	addi	sp,sp,32
   102ac:	00008067          	ret

00000000000102b0 <Getc>:
   102b0:	fe010113          	addi	sp,sp,-32
   102b4:	00813c23          	sd	s0,24(sp)
   102b8:	02010413          	addi	s0,sp,32
   102bc:	00400893          	li	a7,4
   102c0:	00000073          	ecall
   102c4:	00050793          	mv	a5,a0
   102c8:	fef407a3          	sb	a5,-17(s0)
   102cc:	fef44783          	lbu	a5,-17(s0)
   102d0:	00078513          	mv	a0,a5
   102d4:	01813403          	ld	s0,24(sp)
   102d8:	02010113          	addi	sp,sp,32
   102dc:	00008067          	ret

00000000000102e0 <Getd>:
   102e0:	fe010113          	addi	sp,sp,-32
   102e4:	00813c23          	sd	s0,24(sp)
   102e8:	02010413          	addi	s0,sp,32
   102ec:	00500893          	li	a7,5
   102f0:	00000073          	ecall
   102f4:	00050793          	mv	a5,a0
   102f8:	fef42623          	sw	a5,-20(s0)
   102fc:	fec42783          	lw	a5,-20(s0)
   10300:	00078513          	mv	a0,a5
   10304:	01813403          	ld	s0,24(sp)
   10308:	02010113          	addi	sp,sp,32
   1030c:	00008067          	ret

0000000000010310 <Exit>:
   10310:	ff010113          	addi	sp,sp,-16
   10314:	00813423          	sd	s0,8(sp)
   10318:	01010413          	addi	s0,sp,16
   1031c:	00000893          	li	a7,0
   10320:	00000073          	ecall
   10324:	00000013          	nop
   10328:	00813403          	ld	s0,8(sp)
   1032c:	01010113          	addi	sp,sp,16
   10330:	00008067          	ret
	...

0000000000010336 <atexit>:
   10336:	85aa                	mv	a1,a0
   10338:	4681                	li	a3,0
   1033a:	4601                	li	a2,0
   1033c:	4501                	li	a0,0
   1033e:	18c0006f          	j	104ca <__register_exitproc>
	...

0000000000010344 <exit>:
   10344:	1141                	addi	sp,sp,-16
   10346:	4581                	li	a1,0
   10348:	e022                	sd	s0,0(sp)
   1034a:	e406                	sd	ra,8(sp)
   1034c:	842a                	mv	s0,a0
   1034e:	1e4000ef          	jal	ra,10532 <__call_exitprocs>
   10352:	67c5                	lui	a5,0x11
   10354:	7707b503          	ld	a0,1904(a5) # 11770 <_global_impure_ptr>
   10358:	6d3c                	ld	a5,88(a0)
   1035a:	c391                	beqz	a5,1035e <exit+0x1a>
   1035c:	9782                	jalr	a5
   1035e:	8522                	mv	a0,s0
   10360:	00000097          	auipc	ra,0x0
   10364:	66e080e7          	jalr	1646(ra) # 109ce <_exit>
	...

000000000001036a <__libc_fini_array>:
   1036a:	7179                	addi	sp,sp,-48
   1036c:	67c5                	lui	a5,0x11
   1036e:	6745                	lui	a4,0x11
   10370:	f022                	sd	s0,32(sp)
   10372:	00870713          	addi	a4,a4,8 # 11008 <__init_array_end>
   10376:	01078413          	addi	s0,a5,16 # 11010 <__fini_array_end>
   1037a:	8c19                	sub	s0,s0,a4
   1037c:	ec26                	sd	s1,24(sp)
   1037e:	e84a                	sd	s2,16(sp)
   10380:	e44e                	sd	s3,8(sp)
   10382:	f406                	sd	ra,40(sp)
   10384:	840d                	srai	s0,s0,0x3
   10386:	4481                	li	s1,0
   10388:	01078913          	addi	s2,a5,16
   1038c:	59e1                	li	s3,-8
   1038e:	00941c63          	bne	s0,s1,103a6 <__libc_fini_array+0x3c>
   10392:	7402                	ld	s0,32(sp)
   10394:	70a2                	ld	ra,40(sp)
   10396:	64e2                	ld	s1,24(sp)
   10398:	6942                	ld	s2,16(sp)
   1039a:	69a2                	ld	s3,8(sp)
   1039c:	6145                	addi	sp,sp,48
   1039e:	00000317          	auipc	t1,0x0
   103a2:	d5430067          	jr	-684(t1) # 100f2 <_fini>
   103a6:	033487b3          	mul	a5,s1,s3
   103aa:	0485                	addi	s1,s1,1
   103ac:	97ca                	add	a5,a5,s2
   103ae:	ff87b783          	ld	a5,-8(a5)
   103b2:	9782                	jalr	a5
   103b4:	bfe9                	j	1038e <__libc_fini_array+0x24>
	...

00000000000103b8 <__libc_init_array>:
   103b8:	1101                	addi	sp,sp,-32
   103ba:	e822                	sd	s0,16(sp)
   103bc:	e426                	sd	s1,8(sp)
   103be:	6445                	lui	s0,0x11
   103c0:	64c5                	lui	s1,0x11
   103c2:	00048793          	mv	a5,s1
   103c6:	00040413          	mv	s0,s0
   103ca:	8c1d                	sub	s0,s0,a5
   103cc:	e04a                	sd	s2,0(sp)
   103ce:	ec06                	sd	ra,24(sp)
   103d0:	840d                	srai	s0,s0,0x3
   103d2:	00048493          	mv	s1,s1
   103d6:	4901                	li	s2,0
   103d8:	02891963          	bne	s2,s0,1040a <__libc_init_array+0x52>
   103dc:	64c5                	lui	s1,0x11
   103de:	00000097          	auipc	ra,0x0
   103e2:	d14080e7          	jalr	-748(ra) # 100f2 <_fini>
   103e6:	6445                	lui	s0,0x11
   103e8:	00048793          	mv	a5,s1
   103ec:	00840413          	addi	s0,s0,8 # 11008 <__init_array_end>
   103f0:	8c1d                	sub	s0,s0,a5
   103f2:	840d                	srai	s0,s0,0x3
   103f4:	00048493          	mv	s1,s1
   103f8:	4901                	li	s2,0
   103fa:	00891d63          	bne	s2,s0,10414 <__libc_init_array+0x5c>
   103fe:	60e2                	ld	ra,24(sp)
   10400:	6442                	ld	s0,16(sp)
   10402:	64a2                	ld	s1,8(sp)
   10404:	6902                	ld	s2,0(sp)
   10406:	6105                	addi	sp,sp,32
   10408:	8082                	ret
   1040a:	609c                	ld	a5,0(s1)
   1040c:	0905                	addi	s2,s2,1
   1040e:	04a1                	addi	s1,s1,8
   10410:	9782                	jalr	a5
   10412:	b7d9                	j	103d8 <__libc_init_array+0x20>
   10414:	609c                	ld	a5,0(s1)
   10416:	0905                	addi	s2,s2,1
   10418:	04a1                	addi	s1,s1,8
   1041a:	9782                	jalr	a5
   1041c:	bff9                	j	103fa <__libc_init_array+0x42>
	...

0000000000010420 <memset>:
   10420:	483d                	li	a6,15
   10422:	872a                	mv	a4,a0
   10424:	02c87163          	bleu	a2,a6,10446 <memset+0x26>
   10428:	00f77793          	andi	a5,a4,15
   1042c:	e3c1                	bnez	a5,104ac <memset+0x8c>
   1042e:	e1bd                	bnez	a1,10494 <memset+0x74>
   10430:	ff067693          	andi	a3,a2,-16
   10434:	8a3d                	andi	a2,a2,15
   10436:	96ba                	add	a3,a3,a4
   10438:	e30c                	sd	a1,0(a4)
   1043a:	e70c                	sd	a1,8(a4)
   1043c:	0741                	addi	a4,a4,16
   1043e:	fed76de3          	bltu	a4,a3,10438 <memset+0x18>
   10442:	e211                	bnez	a2,10446 <memset+0x26>
   10444:	8082                	ret
   10446:	40c806b3          	sub	a3,a6,a2
   1044a:	068a                	slli	a3,a3,0x2
   1044c:	00000297          	auipc	t0,0x0
   10450:	9696                	add	a3,a3,t0
   10452:	00a68067          	jr	10(a3)
   10456:	00b70723          	sb	a1,14(a4)
   1045a:	00b706a3          	sb	a1,13(a4)
   1045e:	00b70623          	sb	a1,12(a4)
   10462:	00b705a3          	sb	a1,11(a4)
   10466:	00b70523          	sb	a1,10(a4)
   1046a:	00b704a3          	sb	a1,9(a4)
   1046e:	00b70423          	sb	a1,8(a4)
   10472:	00b703a3          	sb	a1,7(a4)
   10476:	00b70323          	sb	a1,6(a4)
   1047a:	00b702a3          	sb	a1,5(a4)
   1047e:	00b70223          	sb	a1,4(a4)
   10482:	00b701a3          	sb	a1,3(a4)
   10486:	00b70123          	sb	a1,2(a4)
   1048a:	00b700a3          	sb	a1,1(a4)
   1048e:	00b70023          	sb	a1,0(a4)
   10492:	8082                	ret
   10494:	0ff5f593          	andi	a1,a1,255
   10498:	00859693          	slli	a3,a1,0x8
   1049c:	8dd5                	or	a1,a1,a3
   1049e:	01059693          	slli	a3,a1,0x10
   104a2:	8dd5                	or	a1,a1,a3
   104a4:	02059693          	slli	a3,a1,0x20
   104a8:	8dd5                	or	a1,a1,a3
   104aa:	b759                	j	10430 <memset+0x10>
   104ac:	00279693          	slli	a3,a5,0x2
   104b0:	00000297          	auipc	t0,0x0
   104b4:	9696                	add	a3,a3,t0
   104b6:	8286                	mv	t0,ra
   104b8:	fa2680e7          	jalr	-94(a3)
   104bc:	8096                	mv	ra,t0
   104be:	17c1                	addi	a5,a5,-16
   104c0:	8f1d                	sub	a4,a4,a5
   104c2:	963e                	add	a2,a2,a5
   104c4:	f8c871e3          	bleu	a2,a6,10446 <memset+0x26>
   104c8:	b79d                	j	1042e <memset+0xe>

00000000000104ca <__register_exitproc>:
   104ca:	67c5                	lui	a5,0x11
   104cc:	7707b703          	ld	a4,1904(a5) # 11770 <_global_impure_ptr>
   104d0:	832a                	mv	t1,a0
   104d2:	1f873783          	ld	a5,504(a4)
   104d6:	e789                	bnez	a5,104e0 <__register_exitproc+0x16>
   104d8:	20070793          	addi	a5,a4,512
   104dc:	1ef73c23          	sd	a5,504(a4)
   104e0:	4798                	lw	a4,8(a5)
   104e2:	487d                	li	a6,31
   104e4:	557d                	li	a0,-1
   104e6:	04e84463          	blt	a6,a4,1052e <__register_exitproc+0x64>
   104ea:	02030a63          	beqz	t1,1051e <__register_exitproc+0x54>
   104ee:	00371813          	slli	a6,a4,0x3
   104f2:	983e                	add	a6,a6,a5
   104f4:	10c83823          	sd	a2,272(a6)
   104f8:	3107a883          	lw	a7,784(a5)
   104fc:	4605                	li	a2,1
   104fe:	00e6163b          	sllw	a2,a2,a4
   10502:	00c8e8b3          	or	a7,a7,a2
   10506:	3117a823          	sw	a7,784(a5)
   1050a:	20d83823          	sd	a3,528(a6)
   1050e:	4689                	li	a3,2
   10510:	00d31763          	bne	t1,a3,1051e <__register_exitproc+0x54>
   10514:	3147a683          	lw	a3,788(a5)
   10518:	8e55                	or	a2,a2,a3
   1051a:	30c7aa23          	sw	a2,788(a5)
   1051e:	0017069b          	addiw	a3,a4,1
   10522:	0709                	addi	a4,a4,2
   10524:	070e                	slli	a4,a4,0x3
   10526:	c794                	sw	a3,8(a5)
   10528:	97ba                	add	a5,a5,a4
   1052a:	e38c                	sd	a1,0(a5)
   1052c:	4501                	li	a0,0
   1052e:	8082                	ret
	...

0000000000010532 <__call_exitprocs>:
   10532:	715d                	addi	sp,sp,-80
   10534:	67c5                	lui	a5,0x11
   10536:	f44e                	sd	s3,40(sp)
   10538:	7707b983          	ld	s3,1904(a5) # 11770 <_global_impure_ptr>
   1053c:	f052                	sd	s4,32(sp)
   1053e:	ec56                	sd	s5,24(sp)
   10540:	e85a                	sd	s6,16(sp)
   10542:	e486                	sd	ra,72(sp)
   10544:	e0a2                	sd	s0,64(sp)
   10546:	fc26                	sd	s1,56(sp)
   10548:	f84a                	sd	s2,48(sp)
   1054a:	e45e                	sd	s7,8(sp)
   1054c:	8aaa                	mv	s5,a0
   1054e:	8a2e                	mv	s4,a1
   10550:	4b05                	li	s6,1
   10552:	1f89b403          	ld	s0,504(s3)
   10556:	c801                	beqz	s0,10566 <__call_exitprocs+0x34>
   10558:	4404                	lw	s1,8(s0)
   1055a:	34fd                	addiw	s1,s1,-1
   1055c:	00349913          	slli	s2,s1,0x3
   10560:	9922                	add	s2,s2,s0
   10562:	0004dd63          	bgez	s1,1057c <__call_exitprocs+0x4a>
   10566:	60a6                	ld	ra,72(sp)
   10568:	6406                	ld	s0,64(sp)
   1056a:	74e2                	ld	s1,56(sp)
   1056c:	7942                	ld	s2,48(sp)
   1056e:	79a2                	ld	s3,40(sp)
   10570:	7a02                	ld	s4,32(sp)
   10572:	6ae2                	ld	s5,24(sp)
   10574:	6b42                	ld	s6,16(sp)
   10576:	6ba2                	ld	s7,8(sp)
   10578:	6161                	addi	sp,sp,80
   1057a:	8082                	ret
   1057c:	000a0963          	beqz	s4,1058e <__call_exitprocs+0x5c>
   10580:	21093783          	ld	a5,528(s2)
   10584:	01478563          	beq	a5,s4,1058e <__call_exitprocs+0x5c>
   10588:	34fd                	addiw	s1,s1,-1
   1058a:	1961                	addi	s2,s2,-8
   1058c:	bfd9                	j	10562 <__call_exitprocs+0x30>
   1058e:	441c                	lw	a5,8(s0)
   10590:	01093683          	ld	a3,16(s2)
   10594:	37fd                	addiw	a5,a5,-1
   10596:	02979663          	bne	a5,s1,105c2 <__call_exitprocs+0x90>
   1059a:	c404                	sw	s1,8(s0)
   1059c:	d6f5                	beqz	a3,10588 <__call_exitprocs+0x56>
   1059e:	31042703          	lw	a4,784(s0)
   105a2:	009b163b          	sllw	a2,s6,s1
   105a6:	00842b83          	lw	s7,8(s0)
   105aa:	8f71                	and	a4,a4,a2
   105ac:	2701                	sext.w	a4,a4
   105ae:	ef09                	bnez	a4,105c8 <__call_exitprocs+0x96>
   105b0:	9682                	jalr	a3
   105b2:	4418                	lw	a4,8(s0)
   105b4:	1f89b783          	ld	a5,504(s3)
   105b8:	f9771de3          	bne	a4,s7,10552 <__call_exitprocs+0x20>
   105bc:	fcf406e3          	beq	s0,a5,10588 <__call_exitprocs+0x56>
   105c0:	bf49                	j	10552 <__call_exitprocs+0x20>
   105c2:	00093823          	sd	zero,16(s2)
   105c6:	bfd9                	j	1059c <__call_exitprocs+0x6a>
   105c8:	31442783          	lw	a5,788(s0)
   105cc:	11093583          	ld	a1,272(s2)
   105d0:	8ff1                	and	a5,a5,a2
   105d2:	2781                	sext.w	a5,a5
   105d4:	e781                	bnez	a5,105dc <__call_exitprocs+0xaa>
   105d6:	8556                	mv	a0,s5
   105d8:	9682                	jalr	a3
   105da:	bfe1                	j	105b2 <__call_exitprocs+0x80>
   105dc:	852e                	mv	a0,a1
   105de:	9682                	jalr	a3
   105e0:	bfc9                	j	105b2 <__call_exitprocs+0x80>
	...

00000000000105e4 <conv_stat>:
   105e4:	619c                	ld	a5,0(a1)
   105e6:	00f51023          	sh	a5,0(a0)
   105ea:	659c                	ld	a5,8(a1)
   105ec:	00f51123          	sh	a5,2(a0)
   105f0:	499c                	lw	a5,16(a1)
   105f2:	c15c                	sw	a5,4(a0)
   105f4:	49dc                	lw	a5,20(a1)
   105f6:	00f51423          	sh	a5,8(a0)
   105fa:	4d9c                	lw	a5,24(a1)
   105fc:	00f51523          	sh	a5,10(a0)
   10600:	4ddc                	lw	a5,28(a1)
   10602:	00f51623          	sh	a5,12(a0)
   10606:	719c                	ld	a5,32(a1)
   10608:	00f51723          	sh	a5,14(a0)
   1060c:	799c                	ld	a5,48(a1)
   1060e:	e91c                	sd	a5,16(a0)
   10610:	61bc                	ld	a5,64(a1)
   10612:	e93c                	sd	a5,80(a0)
   10614:	5d9c                	lw	a5,56(a1)
   10616:	e53c                	sd	a5,72(a0)
   10618:	65bc                	ld	a5,72(a1)
   1061a:	ed1c                	sd	a5,24(a0)
   1061c:	6dbc                	ld	a5,88(a1)
   1061e:	f51c                	sd	a5,40(a0)
   10620:	75bc                	ld	a5,104(a1)
   10622:	fd1c                	sd	a5,56(a0)
   10624:	8082                	ret

0000000000010626 <__syscall_error>:
   10626:	1141                	addi	sp,sp,-16
   10628:	e022                	sd	s0,0(sp)
   1062a:	e406                	sd	ra,8(sp)
   1062c:	842a                	mv	s0,a0
   1062e:	00000097          	auipc	ra,0x0
   10632:	3ba080e7          	jalr	954(ra) # 109e8 <__errno>
   10636:	408007bb          	negw	a5,s0
   1063a:	60a2                	ld	ra,8(sp)
   1063c:	6402                	ld	s0,0(sp)
   1063e:	c11c                	sw	a5,0(a0)
   10640:	557d                	li	a0,-1
   10642:	0141                	addi	sp,sp,16
   10644:	8082                	ret

0000000000010646 <__internal_syscall>:
   10646:	88aa                	mv	a7,a0
   10648:	852e                	mv	a0,a1
   1064a:	85b2                	mv	a1,a2
   1064c:	8636                	mv	a2,a3
   1064e:	86ba                	mv	a3,a4
   10650:	00000073          	ecall
   10654:	00055663          	bgez	a0,10660 <__internal_syscall+0x1a>
   10658:	00000317          	auipc	t1,0x0
   1065c:	fce30067          	jr	-50(t1) # 10626 <__syscall_error>
   10660:	8082                	ret

0000000000010662 <open>:
   10662:	1141                	addi	sp,sp,-16
   10664:	86b2                	mv	a3,a2
   10666:	4701                	li	a4,0
   10668:	862e                	mv	a2,a1
   1066a:	85aa                	mv	a1,a0
   1066c:	40000513          	li	a0,1024
   10670:	e406                	sd	ra,8(sp)
   10672:	00000097          	auipc	ra,0x0
   10676:	fd4080e7          	jalr	-44(ra) # 10646 <__internal_syscall>
   1067a:	60a2                	ld	ra,8(sp)
   1067c:	2501                	sext.w	a0,a0
   1067e:	0141                	addi	sp,sp,16
   10680:	8082                	ret

0000000000010682 <openat>:
   10682:	1141                	addi	sp,sp,-16
   10684:	8736                	mv	a4,a3
   10686:	86b2                	mv	a3,a2
   10688:	862e                	mv	a2,a1
   1068a:	85aa                	mv	a1,a0
   1068c:	03800513          	li	a0,56
   10690:	e406                	sd	ra,8(sp)
   10692:	fb5ff0ef          	jal	ra,10646 <__internal_syscall>
   10696:	60a2                	ld	ra,8(sp)
   10698:	2501                	sext.w	a0,a0
   1069a:	0141                	addi	sp,sp,16
   1069c:	8082                	ret

000000000001069e <lseek>:
   1069e:	86b2                	mv	a3,a2
   106a0:	4701                	li	a4,0
   106a2:	862e                	mv	a2,a1
   106a4:	85aa                	mv	a1,a0
   106a6:	03e00513          	li	a0,62
   106aa:	00000317          	auipc	t1,0x0
   106ae:	f9c30067          	jr	-100(t1) # 10646 <__internal_syscall>

00000000000106b2 <read>:
   106b2:	86b2                	mv	a3,a2
   106b4:	4701                	li	a4,0
   106b6:	862e                	mv	a2,a1
   106b8:	85aa                	mv	a1,a0
   106ba:	03f00513          	li	a0,63
   106be:	f89ff06f          	j	10646 <__internal_syscall>

00000000000106c2 <write>:
   106c2:	86b2                	mv	a3,a2
   106c4:	4701                	li	a4,0
   106c6:	862e                	mv	a2,a1
   106c8:	85aa                	mv	a1,a0
   106ca:	04000513          	li	a0,64
   106ce:	00000317          	auipc	t1,0x0
   106d2:	f7830067          	jr	-136(t1) # 10646 <__internal_syscall>

00000000000106d6 <fstat>:
   106d6:	7135                	addi	sp,sp,-160
   106d8:	e526                	sd	s1,136(sp)
   106da:	860a                	mv	a2,sp
   106dc:	84ae                	mv	s1,a1
   106de:	4701                	li	a4,0
   106e0:	85aa                	mv	a1,a0
   106e2:	4681                	li	a3,0
   106e4:	05000513          	li	a0,80
   106e8:	ed06                	sd	ra,152(sp)
   106ea:	e922                	sd	s0,144(sp)
   106ec:	f5bff0ef          	jal	ra,10646 <__internal_syscall>
   106f0:	842a                	mv	s0,a0
   106f2:	858a                	mv	a1,sp
   106f4:	8526                	mv	a0,s1
   106f6:	eefff0ef          	jal	ra,105e4 <conv_stat>
   106fa:	0004051b          	sext.w	a0,s0
   106fe:	60ea                	ld	ra,152(sp)
   10700:	644a                	ld	s0,144(sp)
   10702:	64aa                	ld	s1,136(sp)
   10704:	610d                	addi	sp,sp,160
   10706:	8082                	ret

0000000000010708 <stat>:
   10708:	7135                	addi	sp,sp,-160
   1070a:	e526                	sd	s1,136(sp)
   1070c:	860a                	mv	a2,sp
   1070e:	84ae                	mv	s1,a1
   10710:	4701                	li	a4,0
   10712:	85aa                	mv	a1,a0
   10714:	4681                	li	a3,0
   10716:	40e00513          	li	a0,1038
   1071a:	ed06                	sd	ra,152(sp)
   1071c:	e922                	sd	s0,144(sp)
   1071e:	00000097          	auipc	ra,0x0
   10722:	f28080e7          	jalr	-216(ra) # 10646 <__internal_syscall>
   10726:	842a                	mv	s0,a0
   10728:	858a                	mv	a1,sp
   1072a:	8526                	mv	a0,s1
   1072c:	00000097          	auipc	ra,0x0
   10730:	eb8080e7          	jalr	-328(ra) # 105e4 <conv_stat>
   10734:	0004051b          	sext.w	a0,s0
   10738:	60ea                	ld	ra,152(sp)
   1073a:	644a                	ld	s0,144(sp)
   1073c:	64aa                	ld	s1,136(sp)
   1073e:	610d                	addi	sp,sp,160
   10740:	8082                	ret

0000000000010742 <lstat>:
   10742:	7135                	addi	sp,sp,-160
   10744:	e526                	sd	s1,136(sp)
   10746:	860a                	mv	a2,sp
   10748:	84ae                	mv	s1,a1
   1074a:	4701                	li	a4,0
   1074c:	85aa                	mv	a1,a0
   1074e:	4681                	li	a3,0
   10750:	40f00513          	li	a0,1039
   10754:	ed06                	sd	ra,152(sp)
   10756:	e922                	sd	s0,144(sp)
   10758:	eefff0ef          	jal	ra,10646 <__internal_syscall>
   1075c:	842a                	mv	s0,a0
   1075e:	858a                	mv	a1,sp
   10760:	8526                	mv	a0,s1
   10762:	e83ff0ef          	jal	ra,105e4 <conv_stat>
   10766:	0004051b          	sext.w	a0,s0
   1076a:	60ea                	ld	ra,152(sp)
   1076c:	644a                	ld	s0,144(sp)
   1076e:	64aa                	ld	s1,136(sp)
   10770:	610d                	addi	sp,sp,160
   10772:	8082                	ret

0000000000010774 <fstatat>:
   10774:	7135                	addi	sp,sp,-160
   10776:	e526                	sd	s1,136(sp)
   10778:	8736                	mv	a4,a3
   1077a:	84b2                	mv	s1,a2
   1077c:	868a                	mv	a3,sp
   1077e:	862e                	mv	a2,a1
   10780:	85aa                	mv	a1,a0
   10782:	04f00513          	li	a0,79
   10786:	ed06                	sd	ra,152(sp)
   10788:	e922                	sd	s0,144(sp)
   1078a:	00000097          	auipc	ra,0x0
   1078e:	ebc080e7          	jalr	-324(ra) # 10646 <__internal_syscall>
   10792:	842a                	mv	s0,a0
   10794:	858a                	mv	a1,sp
   10796:	8526                	mv	a0,s1
   10798:	00000097          	auipc	ra,0x0
   1079c:	e4c080e7          	jalr	-436(ra) # 105e4 <conv_stat>
   107a0:	0004051b          	sext.w	a0,s0
   107a4:	60ea                	ld	ra,152(sp)
   107a6:	644a                	ld	s0,144(sp)
   107a8:	64aa                	ld	s1,136(sp)
   107aa:	610d                	addi	sp,sp,160
   107ac:	8082                	ret

00000000000107ae <access>:
   107ae:	1141                	addi	sp,sp,-16
   107b0:	862e                	mv	a2,a1
   107b2:	4701                	li	a4,0
   107b4:	85aa                	mv	a1,a0
   107b6:	4681                	li	a3,0
   107b8:	40900513          	li	a0,1033
   107bc:	e406                	sd	ra,8(sp)
   107be:	e89ff0ef          	jal	ra,10646 <__internal_syscall>
   107c2:	60a2                	ld	ra,8(sp)
   107c4:	2501                	sext.w	a0,a0
   107c6:	0141                	addi	sp,sp,16
   107c8:	8082                	ret

00000000000107ca <faccessat>:
   107ca:	1141                	addi	sp,sp,-16
   107cc:	8736                	mv	a4,a3
   107ce:	86b2                	mv	a3,a2
   107d0:	862e                	mv	a2,a1
   107d2:	85aa                	mv	a1,a0
   107d4:	03000513          	li	a0,48
   107d8:	e406                	sd	ra,8(sp)
   107da:	00000097          	auipc	ra,0x0
   107de:	e6c080e7          	jalr	-404(ra) # 10646 <__internal_syscall>
   107e2:	60a2                	ld	ra,8(sp)
   107e4:	2501                	sext.w	a0,a0
   107e6:	0141                	addi	sp,sp,16
   107e8:	8082                	ret

00000000000107ea <close>:
   107ea:	1141                	addi	sp,sp,-16
   107ec:	85aa                	mv	a1,a0
   107ee:	4701                	li	a4,0
   107f0:	4681                	li	a3,0
   107f2:	4601                	li	a2,0
   107f4:	03900513          	li	a0,57
   107f8:	e406                	sd	ra,8(sp)
   107fa:	e4dff0ef          	jal	ra,10646 <__internal_syscall>
   107fe:	60a2                	ld	ra,8(sp)
   10800:	2501                	sext.w	a0,a0
   10802:	0141                	addi	sp,sp,16
   10804:	8082                	ret

0000000000010806 <link>:
   10806:	1141                	addi	sp,sp,-16
   10808:	862e                	mv	a2,a1
   1080a:	4701                	li	a4,0
   1080c:	85aa                	mv	a1,a0
   1080e:	4681                	li	a3,0
   10810:	40100513          	li	a0,1025
   10814:	e406                	sd	ra,8(sp)
   10816:	00000097          	auipc	ra,0x0
   1081a:	e30080e7          	jalr	-464(ra) # 10646 <__internal_syscall>
   1081e:	60a2                	ld	ra,8(sp)
   10820:	2501                	sext.w	a0,a0
   10822:	0141                	addi	sp,sp,16
   10824:	8082                	ret

0000000000010826 <unlink>:
   10826:	1141                	addi	sp,sp,-16
   10828:	85aa                	mv	a1,a0
   1082a:	4701                	li	a4,0
   1082c:	4681                	li	a3,0
   1082e:	4601                	li	a2,0
   10830:	40200513          	li	a0,1026
   10834:	e406                	sd	ra,8(sp)
   10836:	e11ff0ef          	jal	ra,10646 <__internal_syscall>
   1083a:	60a2                	ld	ra,8(sp)
   1083c:	2501                	sext.w	a0,a0
   1083e:	0141                	addi	sp,sp,16
   10840:	8082                	ret

0000000000010842 <execve>:
   10842:	1141                	addi	sp,sp,-16
   10844:	e406                	sd	ra,8(sp)
   10846:	00000097          	auipc	ra,0x0
   1084a:	1a2080e7          	jalr	418(ra) # 109e8 <__errno>
   1084e:	60a2                	ld	ra,8(sp)
   10850:	47b1                	li	a5,12
   10852:	c11c                	sw	a5,0(a0)
   10854:	557d                	li	a0,-1
   10856:	0141                	addi	sp,sp,16
   10858:	8082                	ret

000000000001085a <fork>:
   1085a:	1141                	addi	sp,sp,-16
   1085c:	e406                	sd	ra,8(sp)
   1085e:	18a000ef          	jal	ra,109e8 <__errno>
   10862:	60a2                	ld	ra,8(sp)
   10864:	47ad                	li	a5,11
   10866:	c11c                	sw	a5,0(a0)
   10868:	557d                	li	a0,-1
   1086a:	0141                	addi	sp,sp,16
   1086c:	8082                	ret

000000000001086e <getpid>:
   1086e:	4505                	li	a0,1
   10870:	8082                	ret

0000000000010872 <kill>:
   10872:	1141                	addi	sp,sp,-16
   10874:	e406                	sd	ra,8(sp)
   10876:	172000ef          	jal	ra,109e8 <__errno>
   1087a:	60a2                	ld	ra,8(sp)
   1087c:	47d9                	li	a5,22
   1087e:	c11c                	sw	a5,0(a0)
   10880:	557d                	li	a0,-1
   10882:	0141                	addi	sp,sp,16
   10884:	8082                	ret

0000000000010886 <wait>:
   10886:	1141                	addi	sp,sp,-16
   10888:	e406                	sd	ra,8(sp)
   1088a:	00000097          	auipc	ra,0x0
   1088e:	15e080e7          	jalr	350(ra) # 109e8 <__errno>
   10892:	60a2                	ld	ra,8(sp)
   10894:	47a9                	li	a5,10
   10896:	c11c                	sw	a5,0(a0)
   10898:	557d                	li	a0,-1
   1089a:	0141                	addi	sp,sp,16
   1089c:	8082                	ret

000000000001089e <isatty>:
   1089e:	7119                	addi	sp,sp,-128
   108a0:	002c                	addi	a1,sp,8
   108a2:	fc86                	sd	ra,120(sp)
   108a4:	e33ff0ef          	jal	ra,106d6 <fstat>
   108a8:	57fd                	li	a5,-1
   108aa:	00f50663          	beq	a0,a5,108b6 <isatty+0x18>
   108ae:	4532                	lw	a0,12(sp)
   108b0:	40d5551b          	sraiw	a0,a0,0xd
   108b4:	8905                	andi	a0,a0,1
   108b6:	70e6                	ld	ra,120(sp)
   108b8:	6109                	addi	sp,sp,128
   108ba:	8082                	ret

00000000000108bc <gettimeofday>:
   108bc:	1141                	addi	sp,sp,-16
   108be:	85aa                	mv	a1,a0
   108c0:	4701                	li	a4,0
   108c2:	4681                	li	a3,0
   108c4:	4601                	li	a2,0
   108c6:	0a900513          	li	a0,169
   108ca:	e406                	sd	ra,8(sp)
   108cc:	00000097          	auipc	ra,0x0
   108d0:	d7a080e7          	jalr	-646(ra) # 10646 <__internal_syscall>
   108d4:	60a2                	ld	ra,8(sp)
   108d6:	2501                	sext.w	a0,a0
   108d8:	0141                	addi	sp,sp,16
   108da:	8082                	ret

00000000000108dc <times>:
   108dc:	7179                	addi	sp,sp,-48
   108de:	f022                	sd	s0,32(sp)
   108e0:	842a                	mv	s0,a0
   108e2:	8581b783          	ld	a5,-1960(gp) # 117c0 <t0.2574>
   108e6:	ec26                	sd	s1,24(sp)
   108e8:	f406                	sd	ra,40(sp)
   108ea:	85818493          	addi	s1,gp,-1960 # 117c0 <t0.2574>
   108ee:	eb81                	bnez	a5,108fe <times+0x22>
   108f0:	4581                	li	a1,0
   108f2:	85818513          	addi	a0,gp,-1960 # 117c0 <t0.2574>
   108f6:	00000097          	auipc	ra,0x0
   108fa:	fc6080e7          	jalr	-58(ra) # 108bc <gettimeofday>
   108fe:	850a                	mv	a0,sp
   10900:	4581                	li	a1,0
   10902:	00000097          	auipc	ra,0x0
   10906:	fba080e7          	jalr	-70(ra) # 108bc <gettimeofday>
   1090a:	6098                	ld	a4,0(s1)
   1090c:	6782                	ld	a5,0(sp)
   1090e:	6494                	ld	a3,8(s1)
   10910:	00043823          	sd	zero,16(s0)
   10914:	8f99                	sub	a5,a5,a4
   10916:	000f4737          	lui	a4,0xf4
   1091a:	24070713          	addi	a4,a4,576 # f4240 <__global_pointer$+0xe22d8>
   1091e:	02e787b3          	mul	a5,a5,a4
   10922:	6722                	ld	a4,8(sp)
   10924:	00043c23          	sd	zero,24(s0)
   10928:	00043423          	sd	zero,8(s0)
   1092c:	8f15                	sub	a4,a4,a3
   1092e:	70a2                	ld	ra,40(sp)
   10930:	64e2                	ld	s1,24(sp)
   10932:	557d                	li	a0,-1
   10934:	97ba                	add	a5,a5,a4
   10936:	e01c                	sd	a5,0(s0)
   10938:	7402                	ld	s0,32(sp)
   1093a:	6145                	addi	sp,sp,48
   1093c:	8082                	ret

000000000001093e <ftime>:
   1093e:	00051423          	sh	zero,8(a0)
   10942:	00053023          	sd	zero,0(a0)
   10946:	4501                	li	a0,0
   10948:	8082                	ret

000000000001094a <utime>:
   1094a:	557d                	li	a0,-1
   1094c:	8082                	ret

000000000001094e <chown>:
   1094e:	557d                	li	a0,-1
   10950:	8082                	ret

0000000000010952 <chmod>:
   10952:	557d                	li	a0,-1
   10954:	8082                	ret

0000000000010956 <chdir>:
   10956:	557d                	li	a0,-1
   10958:	8082                	ret

000000000001095a <getcwd>:
   1095a:	4501                	li	a0,0
   1095c:	8082                	ret

000000000001095e <sysconf>:
   1095e:	4789                	li	a5,2
   10960:	00f50463          	beq	a0,a5,10968 <sysconf+0xa>
   10964:	557d                	li	a0,-1
   10966:	8082                	ret
   10968:	000f4537          	lui	a0,0xf4
   1096c:	24050513          	addi	a0,a0,576 # f4240 <__global_pointer$+0xe22d8>
   10970:	8082                	ret

0000000000010972 <sbrk>:
   10972:	1101                	addi	sp,sp,-32
   10974:	e822                	sd	s0,16(sp)
   10976:	8181b783          	ld	a5,-2024(gp) # 11780 <_edata>
   1097a:	e426                	sd	s1,8(sp)
   1097c:	ec06                	sd	ra,24(sp)
   1097e:	84aa                	mv	s1,a0
   10980:	e785                	bnez	a5,109a8 <sbrk+0x36>
   10982:	4701                	li	a4,0
   10984:	4681                	li	a3,0
   10986:	4601                	li	a2,0
   10988:	4581                	li	a1,0
   1098a:	0d600513          	li	a0,214
   1098e:	cb9ff0ef          	jal	ra,10646 <__internal_syscall>
   10992:	57fd                	li	a5,-1
   10994:	00f51863          	bne	a0,a5,109a4 <sbrk+0x32>
   10998:	557d                	li	a0,-1
   1099a:	60e2                	ld	ra,24(sp)
   1099c:	6442                	ld	s0,16(sp)
   1099e:	64a2                	ld	s1,8(sp)
   109a0:	6105                	addi	sp,sp,32
   109a2:	8082                	ret
   109a4:	80a1bc23          	sd	a0,-2024(gp) # 11780 <_edata>
   109a8:	8181b583          	ld	a1,-2024(gp) # 11780 <_edata>
   109ac:	4701                	li	a4,0
   109ae:	4681                	li	a3,0
   109b0:	95a6                	add	a1,a1,s1
   109b2:	4601                	li	a2,0
   109b4:	0d600513          	li	a0,214
   109b8:	c8fff0ef          	jal	ra,10646 <__internal_syscall>
   109bc:	8181b783          	ld	a5,-2024(gp) # 11780 <_edata>
   109c0:	94be                	add	s1,s1,a5
   109c2:	fc951be3          	bne	a0,s1,10998 <sbrk+0x26>
   109c6:	80a1bc23          	sd	a0,-2024(gp) # 11780 <_edata>
   109ca:	853e                	mv	a0,a5
   109cc:	b7f9                	j	1099a <sbrk+0x28>

00000000000109ce <_exit>:
   109ce:	1141                	addi	sp,sp,-16
   109d0:	85aa                	mv	a1,a0
   109d2:	4701                	li	a4,0
   109d4:	4681                	li	a3,0
   109d6:	4601                	li	a2,0
   109d8:	05d00513          	li	a0,93
   109dc:	e406                	sd	ra,8(sp)
   109de:	00000097          	auipc	ra,0x0
   109e2:	c68080e7          	jalr	-920(ra) # 10646 <__internal_syscall>
   109e6:	a001                	j	109e6 <_exit+0x18>

00000000000109e8 <__errno>:
   109e8:	8101b503          	ld	a0,-2032(gp) # 11778 <_impure_ptr>
   109ec:	8082                	ret
	...

Disassembly of section .eh_frame:

00000000000109f0 <__EH_FRAME_BEGIN__>:
   109f0:	0000                	unimp
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

0000000000011010 <s>:
   11010:	6568                	ld	a0,200(a0)
   11012:	6c6c                	ld	a1,216(s0)
   11014:	77202c6f          	jal	s8,13786 <__global_pointer$+0x181e>
   11018:	646c726f          	jal	tp,d865e <__global_pointer$+0xc66f6>
   1101c:	0021                	c.addi	zero,8
	...

0000000000011020 <impure_data>:
	...
   11028:	1558                	addi	a4,sp,676
   1102a:	0001                	nop
   1102c:	0000                	unimp
   1102e:	0000                	unimp
   11030:	1608                	addi	a0,sp,800
   11032:	0001                	nop
   11034:	0000                	unimp
   11036:	0000                	unimp
   11038:	16b8                	addi	a4,sp,872
   1103a:	0001                	nop
	...
   11108:	0001                	nop
   1110a:	0000                	unimp
   1110c:	0000                	unimp
   1110e:	0000                	unimp
   11110:	330e                	fld	ft6,224(sp)
   11112:	abcd                	j	11704 <impure_data+0x6e4>
   11114:	1234                	addi	a3,sp,296
   11116:	e66d                	bnez	a2,11200 <impure_data+0x1e0>
   11118:	deec                	sw	a1,124(a3)
   1111a:	0005                	c.addi	zero,1
   1111c:	0000000b          	0xb
	...

Disassembly of section .sdata:

0000000000011768 <__TMC_END__>:
	...

0000000000011770 <_global_impure_ptr>:
   11770:	1020                	addi	s0,sp,40
   11772:	0001                	nop
   11774:	0000                	unimp
	...

0000000000011778 <_impure_ptr>:
   11778:	1020                	addi	s0,sp,40
   1177a:	0001                	nop
   1177c:	0000                	unimp
	...

Disassembly of section .sbss:

0000000000011780 <__bss_start>:
	...

Disassembly of section .bss:

0000000000011788 <completed.5184>:
	...

0000000000011790 <object.5189>:
	...

00000000000117c0 <t0.2574>:
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
