	.file	1 "funciones.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"funciones.c\000"
	.align	2
$LC1:
	.ascii	"str_split\000"
	.align	2
$LC2:
	.ascii	"idx < count\000"
	.align	2
$LC3:
	.ascii	"idx == count - 1\000"
	.text
	.align	2
	.globl	str_split
	.ent	str_split
str_split:
	.frame	$fp,80,$ra		# vars= 40, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,80
	.cprestore 16
	sw	$ra,72($sp)
	sw	$fp,68($sp)
	sw	$gp,64($sp)
	move	$fp,$sp
	sw	$a0,80($fp)
	move	$v0,$a1
	sb	$v0,24($fp)
	sw	$zero,28($fp)
	sw	$zero,32($fp)
	lw	$v0,80($fp)
	sw	$v0,36($fp)
	sw	$zero,40($fp)
	lbu	$v0,24($fp)
	sb	$v0,48($fp)
	sb	$zero,49($fp)
$L18:
	lw	$v0,36($fp)
	lb	$v0,0($v0)
	bne	$v0,$zero,$L20
	b	$L19
$L20:
	lw	$v0,36($fp)
	lb	$v1,24($fp)
	lb	$v0,0($v0)
	bne	$v1,$v0,$L21
	lw	$v0,32($fp)
	addu	$v0,$v0,1
	sw	$v0,32($fp)
	lw	$v0,36($fp)
	sw	$v0,40($fp)
$L21:
	lw	$v0,36($fp)
	addu	$v0,$v0,1
	sw	$v0,36($fp)
	b	$L18
$L19:
	lw	$a0,80($fp)
	la	$t9,strlen
	jal	$ra,$t9
	move	$v1,$v0
	lw	$v0,80($fp)
	addu	$v0,$v1,$v0
	addu	$v1,$v0,-1
	lw	$v0,40($fp)
	sltu	$v0,$v0,$v1
	lw	$v1,32($fp)
	addu	$v0,$v0,$v1
	sw	$v0,32($fp)
	lw	$v0,32($fp)
	addu	$v0,$v0,1
	sw	$v0,32($fp)
	lw	$v0,32($fp)
	sll	$v0,$v0,2
	move	$a0,$v0
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v0,28($fp)
	beq	$v0,$zero,$L22
	sw	$zero,56($fp)
	addu	$v0,$fp,48
	lw	$a0,80($fp)
	move	$a1,$v0
	la	$t9,strtok
	jal	$ra,$t9
	sw	$v0,60($fp)
$L23:
	lw	$v0,60($fp)
	bne	$v0,$zero,$L25
	b	$L24
$L25:
	lw	$v0,56($fp)
	lw	$v1,32($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L27
	la	$a0,$LC0
	li	$a1,55			# 0x37
	la	$a2,$LC1
	la	$a3,$LC2
	la	$t9,__assert13
	jal	$ra,$t9
$L27:
	lw	$a0,60($fp)
	la	$t9,strdup
	jal	$ra,$t9
	move	$a2,$v0
	addu	$a1,$fp,56
	lw	$v1,0($a1)
	move	$v0,$v1
	sll	$a0,$v0,2
	lw	$v0,28($fp)
	addu	$v0,$a0,$v0
	sw	$a2,0($v0)
	addu	$v1,$v1,1
	sw	$v1,0($a1)
	addu	$v0,$fp,48
	move	$a0,$zero
	move	$a1,$v0
	la	$t9,strtok
	jal	$ra,$t9
	sw	$v0,60($fp)
	b	$L23
$L24:
	lw	$v0,32($fp)
	addu	$v1,$v0,-1
	lw	$v0,56($fp)
	beq	$v0,$v1,$L29
	la	$a0,$LC0
	li	$a1,59			# 0x3b
	la	$a2,$LC1
	la	$a3,$LC3
	la	$t9,__assert13
	jal	$ra,$t9
$L29:
	lw	$v0,56($fp)
	sll	$v1,$v0,2
	lw	$v0,28($fp)
	addu	$v0,$v1,$v0
	sw	$zero,0($v0)
$L22:
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,72($sp)
	lw	$fp,68($sp)
	addu	$sp,$sp,80
	j	$ra
	.end	str_split
	.size	str_split, .-str_split
	.align	2
	.globl	stringContainsChar
	.ent	stringContainsChar
stringContainsChar:
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	sw	$a1,60($fp)
	lw	$a0,56($fp)
	la	$t9,strlen
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$a0,56($fp)
	lw	$a1,60($fp)
	la	$t9,strcspn
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v0,28($fp)
	bne	$v0,$zero,$L31
	li	$v0,1			# 0x1
	sw	$v0,32($fp)
	b	$L30
$L31:
	lw	$v1,24($fp)
	lw	$v0,28($fp)
	beq	$v1,$v0,$L32
	sw	$zero,32($fp)
	b	$L30
$L32:
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,32($fp)
$L30:
	lw	$v0,32($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	stringContainsChar
	.size	stringContainsChar, .-stringContainsChar
	.rdata
	.align	2
$LC4:
	.ascii	"\000"
	.align	2
$LC5:
	.ascii	"0123456789.+-\000"
	.align	2
$LC6:
	.ascii	" \000"
	.align	2
$LC7:
	.ascii	"%Lf%Lf%c\000"
	.text
	.align	2
	.globl	parseNroImg
	.ent	parseNroImg
parseNroImg:
	.frame	$fp,72,$ra		# vars= 24, regs= 3/0, args= 24, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,72
	.cprestore 24
	sw	$ra,64($sp)
	sw	$fp,60($sp)
	sw	$gp,56($sp)
	move	$fp,$sp
	sw	$a0,72($fp)
	sw	$a1,76($fp)
	lw	$a0,72($fp)
	la	$a1,$LC4
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L35
	lw	$v0,72($fp)
	bne	$v0,$zero,$L34
$L35:
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,52($fp)
	b	$L33
$L34:
	lw	$a0,72($fp)
	la	$a1,$LC5
	la	$t9,stringContainsChar
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,-1			# 0xffffffffffffffff
	beq	$v1,$v0,$L37
	lw	$a0,72($fp)
	la	$a1,$LC6
	la	$t9,stringContainsChar
	jal	$ra,$t9
	bne	$v0,$zero,$L36
$L37:
	li	$v0,-2			# 0xfffffffffffffffe
	sw	$v0,52($fp)
	b	$L33
$L36:
	addu	$v1,$fp,40
	addu	$v0,$fp,48
	sw	$v0,16($sp)
	lw	$a0,72($fp)
	la	$a1,$LC7
	addu	$a2,$fp,32
	move	$a3,$v1
	la	$t9,sscanf
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,3			# 0x3
	bne	$v1,$v0,$L39
	lb	$v1,48($fp)
	li	$v0,105			# 0x69
	bne	$v1,$v0,$L39
	b	$L38
$L39:
	li	$v0,-3			# 0xfffffffffffffffd
	sw	$v0,52($fp)
	b	$L33
$L38:
	lw	$v0,76($fp)
	l.d	$f0,32($fp)
	s.d	$f0,0($v0)
	lw	$v0,76($fp)
	l.d	$f0,40($fp)
	s.d	$f0,8($v0)
	sw	$zero,52($fp)
$L33:
	lw	$v0,52($fp)
	move	$sp,$fp
	lw	$ra,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$ra
	.end	parseNroImg
	.size	parseNroImg, .-parseNroImg
	.rdata
	.align	2
$LC8:
	.ascii	"%d%c%d %c\000"
	.text
	.align	2
	.globl	parseResolution
	.ent	parseResolution
parseResolution:
	.frame	$fp,64,$ra		# vars= 16, regs= 3/0, args= 24, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 24
	sw	$ra,56($sp)
	sw	$fp,52($sp)
	sw	$gp,48($sp)
	move	$fp,$sp
	sw	$a0,64($fp)
	sw	$a1,68($fp)
	addu	$v1,$fp,40
	addu	$v0,$fp,36
	sw	$v0,16($sp)
	addu	$v0,$fp,41
	sw	$v0,20($sp)
	lw	$a0,64($fp)
	la	$a1,$LC8
	addu	$a2,$fp,32
	move	$a3,$v1
	la	$t9,sscanf
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,3			# 0x3
	bne	$v1,$v0,$L42
	lw	$v0,32($fp)
	blez	$v0,$L42
	lb	$v1,40($fp)
	li	$v0,120			# 0x78
	bne	$v1,$v0,$L42
	lw	$v0,36($fp)
	blez	$v0,$L42
	b	$L41
$L42:
	li	$v0,-6			# 0xfffffffffffffffa
	sw	$v0,44($fp)
	b	$L40
$L41:
	lw	$v1,68($fp)
	lw	$v0,32($fp)
	sw	$v0,0($v1)
	lw	$v1,68($fp)
	lw	$v0,36($fp)
	sw	$v0,4($v1)
	sw	$zero,44($fp)
$L40:
	lw	$v0,44($fp)
	move	$sp,$fp
	lw	$ra,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$ra
	.end	parseResolution
	.size	parseResolution, .-parseResolution
	.rdata
	.align	2
$LC9:
	.ascii	".pgm\000"
	.align	2
$LC10:
	.ascii	"-\000"
	.align	2
$LC11:
	.ascii	"w\000"
	.text
	.align	2
	.globl	checkForOutputPath
	.ent	checkForOutputPath
checkForOutputPath:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	sw	$a2,56($fp)
	lw	$v0,48($fp)
	bne	$v0,$zero,$L44
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,24($fp)
	b	$L43
$L44:
	lw	$a0,48($fp)
	la	$t9,checkForBadCharacters
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L45
	li	$v0,-2			# 0xfffffffffffffffe
	sw	$v0,24($fp)
	b	$L43
$L45:
	lw	$a0,48($fp)
	la	$t9,getFileExtension
	jal	$ra,$t9
	move	$a0,$v0
	la	$a1,$LC9
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L46
	li	$v0,-7			# 0xfffffffffffffff9
	sw	$v0,24($fp)
	b	$L43
$L46:
	lw	$a0,48($fp)
	la	$a1,$LC10
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L47
	la	$v0,__sF+88
	sw	$v0,52($fp)
	b	$L48
$L47:
	lw	$a0,48($fp)
	la	$a1,$LC11
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,52($fp)
	lw	$v0,52($fp)
	bne	$v0,$zero,$L48
	li	$v0,-8			# 0xfffffffffffffff8
	sw	$v0,24($fp)
	b	$L43
$L48:
	lw	$v1,56($fp)
	lw	$v0,48($fp)
	sw	$v0,0($v1)
	sw	$zero,24($fp)
$L43:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	checkForOutputPath
	.size	checkForOutputPath, .-checkForOutputPath
	.align	2
	.globl	getFileExtension
	.ent	getFileExtension
getFileExtension:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	lw	$a0,48($fp)
	li	$a1,46			# 0x2e
	la	$t9,strrchr
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	beq	$v0,$zero,$L53
	lw	$v1,24($fp)
	lw	$v0,48($fp)
	beq	$v1,$v0,$L53
	b	$L51
$L53:
	lw	$a0,48($fp)
	la	$t9,strlen
	jal	$ra,$t9
	move	$v1,$v0
	lw	$v0,48($fp)
	addu	$v1,$v1,$v0
	sw	$v1,28($fp)
	b	$L52
$L51:
	lw	$v0,24($fp)
	sw	$v0,28($fp)
$L52:
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	getFileExtension
	.size	getFileExtension, .-getFileExtension
	.rdata
	.align	2
$LC12:
	.ascii	"!@%^*~|\000"
	.text
	.align	2
	.globl	checkForBadCharacters
	.ent	checkForBadCharacters
checkForBadCharacters:
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	lw	$v0,$LC12
	sw	$v0,24($fp)
	lw	$v0,$LC12+4
	sw	$v0,28($fp)
	sw	$zero,32($fp)
$L55:
	addu	$a0,$fp,24
	la	$t9,strlen
	jal	$ra,$t9
	lw	$v1,32($fp)
	sltu	$v0,$v1,$v0
	bne	$v0,$zero,$L58
	b	$L56
$L58:
	lw	$v1,32($fp)
	addu	$v0,$fp,24
	addu	$v0,$v0,$v1
	lb	$v0,0($v0)
	lw	$a0,56($fp)
	move	$a1,$v0
	la	$t9,strchr
	jal	$ra,$t9
	beq	$v0,$zero,$L57
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,36($fp)
	b	$L54
$L57:
	lw	$v0,32($fp)
	addu	$v0,$v0,1
	sw	$v0,32($fp)
	b	$L55
$L56:
	sw	$zero,36($fp)
$L54:
	lw	$v0,36($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	checkForBadCharacters
	.size	checkForBadCharacters, .-checkForBadCharacters
	.rdata
	.align	2
$LC13:
	.ascii	"%f\000"
	.text
	.align	2
	.globl	setValue
	.ent	setValue
setValue:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	lw	$a0,48($fp)
	la	$a1,$LC13
	addu	$a2,$fp,24
	la	$t9,sscanf
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L62
	l.s	$f2,24($fp)
	mtc1	$zero,$f0
	c.lt.s	$f2,$f0
	bc1t	$L62
	b	$L61
$L62:
	li	$v0,-9			# 0xfffffffffffffff7
	sw	$v0,28($fp)
	b	$L60
$L61:
	lw	$v0,52($fp)
	l.s	$f0,24($fp)
	s.s	$f0,0($v0)
	sw	$zero,28($fp)
$L60:
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	setValue
	.size	setValue, .-setValue
	.align	2
	.globl	getNroImgAbs
	.ent	getNroImgAbs
getNroImgAbs:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
	sw	$a1,44($fp)
	sw	$a2,48($fp)
	sw	$a3,52($fp)
	l.d	$f2,40($fp)
	l.d	$f0,40($fp)
	mul.d	$f4,$f2,$f0
	l.d	$f2,48($fp)
	l.d	$f0,48($fp)
	mul.d	$f0,$f2,$f0
	add.d	$f0,$f4,$f0
	mov.d	$f12,$f0
	la	$t9,sqrt
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	getNroImgAbs
	.size	getNroImgAbs, .-getNroImgAbs
	.align	2
	.globl	getNroImgSq
	.ent	getNroImgSq
getNroImgSq:
	.frame	$fp,32,$ra		# vars= 16, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,32
	.cprestore 0
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	move	$v1,$a0
	sw	$a2,40($fp)
	sw	$a3,44($fp)
	l.d	$f2,40($fp)
	l.d	$f0,40($fp)
	mul.d	$f4,$f2,$f0
	l.d	$f2,48($fp)
	l.d	$f0,48($fp)
	mul.d	$f0,$f2,$f0
	sub.d	$f0,$f4,$f0
	s.d	$f0,8($fp)
	l.d	$f0,40($fp)
	add.d	$f2,$f0,$f0
	l.d	$f0,48($fp)
	mul.d	$f0,$f2,$f0
	s.d	$f0,16($fp)
	lw	$v0,8($fp)
	sw	$v0,0($v1)
	lw	$v0,12($fp)
	sw	$v0,4($v1)
	lw	$v0,16($fp)
	sw	$v0,8($v1)
	lw	$v0,20($fp)
	sw	$v0,12($v1)
	move	$v0,$v1
	move	$sp,$fp
	lw	$fp,28($sp)
	addu	$sp,$sp,32
	j	$ra
	.end	getNroImgSq
	.size	getNroImgSq, .-getNroImgSq
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
