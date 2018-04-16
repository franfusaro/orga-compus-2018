	.file	1 "tp0.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"resolution\000"
	.align	2
$LC1:
	.ascii	"center\000"
	.align	2
$LC2:
	.ascii	"width\000"
	.align	2
$LC3:
	.ascii	"height\000"
	.align	2
$LC4:
	.ascii	"seed\000"
	.align	2
$LC5:
	.ascii	"output\000"
	.align	2
$LC6:
	.ascii	"help\000"
	.align	2
$LC7:
	.ascii	"version\000"
	.data
	.align	2
	.type	long_options, @object
	.size	long_options, 144
long_options:
	.word	$LC0
	.word	1
	.word	0
	.word	114
	.word	$LC1
	.word	1
	.word	0
	.word	99
	.word	$LC2
	.word	1
	.word	0
	.word	119
	.word	$LC3
	.word	1
	.word	0
	.word	72
	.word	$LC4
	.word	1
	.word	0
	.word	115
	.word	$LC5
	.word	1
	.word	0
	.word	111
	.word	$LC6
	.word	0
	.word	0
	.word	104
	.word	$LC7
	.word	0
	.word	0
	.word	86
	.word	0
	.word	0
	.word	0
	.word	0
	.globl	memcpy
	.rdata
	.align	2
$LC8:
	.ascii	"output.pgm\000"
	.align	2
$LC12:
	.ascii	"hVo:c:r:H:w:s:\000"
	.align	2
$LC13:
	.ascii	"No arguments provided for option -%c .\n\000"
	.align	2
$LC14:
	.ascii	"Unknown option `-%c'.\n\000"
	.align	2
$LC15:
	.ascii	"Unknown option `\\x%x'.\n\000"
	.align	2
$LC9:
	.word	1073741824
	.align	3
$LC10:
	.word	138464867
	.word	-1075363142
	.align	3
$LC11:
	.word	351303579
	.word	1070083444
	.text
	.align	2
	.globl	getParameters
	.ent	getParameters
getParameters:
	.frame	$fp,128,$ra		# vars= 80, regs= 3/0, args= 24, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,128
	.cprestore 24
	sw	$ra,120($sp)
	sw	$fp,116($sp)
	sw	$gp,112($sp)
	move	$fp,$sp
	sw	$a0,128($fp)
	sw	$a1,132($fp)
	sw	$a2,136($fp)
	sw	$zero,40($fp)
	la	$v0,$LC8
	sw	$v0,44($fp)
	li	$v0,640			# 0x280
	sw	$v0,48($fp)
	li	$v0,480			# 0x1e0
	sw	$v0,52($fp)
	sw	$zero,64($fp)
	sw	$zero,68($fp)
	sw	$zero,72($fp)
	sw	$zero,76($fp)
	l.s	$f0,$LC9
	s.s	$f0,56($fp)
	l.s	$f0,$LC9
	s.s	$f0,60($fp)
	l.d	$f0,$LC10
	s.d	$f0,80($fp)
	l.d	$f0,$LC11
	s.d	$f0,88($fp)
	li	$v0,255			# 0xff
	sw	$v0,96($fp)
	sw	$zero,100($fp)
$L18:
	sw	$zero,16($sp)
	lw	$a0,132($fp)
	lw	$a1,136($fp)
	la	$a2,$LC12
	la	$a3,long_options
	la	$t9,getopt_long
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v1,32($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L20
	b	$L19
$L20:
	lw	$v0,32($fp)
	addu	$v0,$v0,-63
	sw	$v0,104($fp)
	lw	$v1,104($fp)
	sltu	$v0,$v1,57
	beq	$v0,$zero,$L36
	lw	$v0,104($fp)
	sll	$v1,$v0,2
	la	$v0,$L37
	addu	$v0,$v1,$v0
	lw	$v0,0($v0)
	.cpadd	$v0
	j	$v0
	.rdata
	.align	2
$L37:
	.gpword	$L30
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L27
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L25
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L23
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L26
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L22
	.gpword	$L36
	.gpword	$L36
	.gpword	$L24
	.gpword	$L29
	.gpword	$L36
	.gpword	$L36
	.gpword	$L36
	.gpword	$L28
	.text
$L22:
	addu	$v0,$fp,40
	addu	$v0,$v0,4
	lw	$a0,optarg
	lw	$a1,40($fp)
	move	$a2,$v0
	la	$t9,checkForOutputPath
	jal	$ra,$t9
	move	$a0,$v0
	la	$t9,returnValidation
	jal	$ra,$t9
	b	$L18
$L23:
	addu	$v0,$fp,40
	addu	$v0,$v0,24
	lw	$a0,optarg
	move	$a1,$v0
	la	$t9,parseNroImg
	jal	$ra,$t9
	move	$a0,$v0
	la	$t9,returnValidation
	jal	$ra,$t9
	b	$L18
$L24:
	addu	$v0,$fp,40
	addu	$v0,$v0,8
	lw	$a0,optarg
	move	$a1,$v0
	la	$t9,parseResolution
	jal	$ra,$t9
	move	$a0,$v0
	la	$t9,returnValidation
	jal	$ra,$t9
	b	$L18
$L25:
	la	$t9,showVersion
	jal	$ra,$t9
	move	$a0,$zero
	la	$t9,exit
	jal	$ra,$t9
$L26:
	la	$t9,showHelp
	jal	$ra,$t9
	move	$a0,$zero
	la	$t9,exit
	jal	$ra,$t9
$L27:
	addu	$v0,$fp,40
	addu	$v0,$v0,20
	lw	$a0,optarg
	move	$a1,$v0
	la	$t9,setValue
	jal	$ra,$t9
	move	$a0,$v0
	la	$t9,returnValidation
	jal	$ra,$t9
$L28:
	addu	$v0,$fp,40
	addu	$v0,$v0,16
	lw	$a0,optarg
	move	$a1,$v0
	la	$t9,setValue
	jal	$ra,$t9
	move	$a0,$v0
	la	$t9,returnValidation
	jal	$ra,$t9
	b	$L18
$L29:
	addu	$v0,$fp,40
	addu	$v0,$v0,40
	lw	$a0,optarg
	move	$a1,$v0
	la	$t9,parseNroImg
	jal	$ra,$t9
	move	$a0,$v0
	la	$t9,returnValidation
	jal	$ra,$t9
	b	$L18
$L30:
	lw	$v1,optopt
	li	$v0,111			# 0x6f
	beq	$v1,$v0,$L32
	lw	$v1,optopt
	li	$v0,99			# 0x63
	beq	$v1,$v0,$L32
	lw	$v1,optopt
	li	$v0,72			# 0x48
	beq	$v1,$v0,$L32
	lw	$v1,optopt
	li	$v0,119			# 0x77
	beq	$v1,$v0,$L32
	lw	$v1,optopt
	li	$v0,115			# 0x73
	beq	$v1,$v0,$L32
	b	$L31
$L32:
	la	$a0,__sF+176
	la	$a1,$LC13
	lw	$a2,optopt
	la	$t9,fprintf
	jal	$ra,$t9
	b	$L36
$L31:
	lw	$v1,_ctype_
	lw	$v0,optopt
	addu	$v0,$v1,$v0
	addu	$v0,$v0,1
	lbu	$v0,0($v0)
	andi	$v0,$v0,0x97
	beq	$v0,$zero,$L34
	la	$a0,__sF+176
	la	$a1,$LC14
	lw	$a2,optopt
	la	$t9,fprintf
	jal	$ra,$t9
	b	$L36
$L34:
	la	$a0,__sF+176
	la	$a1,$LC15
	lw	$a2,optopt
	la	$t9,fprintf
	jal	$ra,$t9
$L36:
	la	$t9,showHelp
	jal	$ra,$t9
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
$L19:
	lw	$v0,128($fp)
	addu	$v1,$fp,40
	move	$a0,$v0
	move	$a1,$v1
	li	$a2,64			# 0x40
	la	$t9,memcpy
	jal	$ra,$t9
	lw	$v0,128($fp)
	move	$sp,$fp
	lw	$ra,120($sp)
	lw	$fp,116($sp)
	addu	$sp,$sp,128
	j	$ra
	.end	getParameters
	.size	getParameters, .-getParameters
	.align	2
	.globl	returnValidation
	.ent	returnValidation
returnValidation:
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
	lw	$v0,40($fp)
	bgez	$v0,$L38
	lw	$a0,40($fp)
	la	$t9,showError
	jal	$ra,$t9
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
$L38:
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	returnValidation
	.size	returnValidation, .-returnValidation
	.rdata
	.align	2
$LC16:
	.ascii	"%s\n\000"
	.align	2
$LC17:
	.ascii	"TP0 Organizacion de computadoras - HELP\000"
	.align	2
$LC18:
	.ascii	"Usage: \000"
	.align	2
$LC19:
	.ascii	"tp0 -h   Displays help and usage of the application\000"
	.align	2
$LC20:
	.ascii	"tp0 -V   Displays version of the application\000"
	.align	2
$LC21:
	.ascii	"tp0 Options:\000"
	.align	2
$LC22:
	.ascii	"-r --resolution  Set bitmap resolution to WxH pixels\000"
	.align	2
$LC23:
	.ascii	"-c --center      Set the center of the image\000"
	.align	2
$LC24:
	.ascii	"-w --width       Set the width of the region to be spann"
	.ascii	"ed\000"
	.align	2
$LC25:
	.ascii	"-H --height      Set the height of the region to be span"
	.ascii	"ned\000"
	.align	2
$LC26:
	.ascii	"-o --output      Set path to output file\000"
	.align	2
$LC27:
	.ascii	"Examples: \000"
	.align	2
$LC28:
	.ascii	"  tp0 -r 1024x768 -o example.pgm\000"
	.align	2
$LC29:
	.ascii	"  tp0 -c 0.282-0.007i -w 0.005 -H 0.005 -o example.pgm\000"
	.text
	.align	2
	.globl	showHelp
	.ent	showHelp
showHelp:
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
	la	$a0,$LC16
	la	$a1,$LC17
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC16
	la	$a1,$LC18
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC16
	la	$a1,$LC19
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC16
	la	$a1,$LC20
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC16
	la	$a1,$LC21
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC16
	la	$a1,$LC22
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC16
	la	$a1,$LC23
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC16
	la	$a1,$LC24
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC16
	la	$a1,$LC25
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC16
	la	$a1,$LC26
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC16
	la	$a1,$LC27
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC16
	la	$a1,$LC28
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC16
	la	$a1,$LC29
	la	$t9,printf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	showHelp
	.size	showHelp, .-showHelp
	.rdata
	.align	2
$LC30:
	.ascii	"TP0 Organizacion de computadoras - VERSION: 1.0\000"
	.text
	.align	2
	.globl	showVersion
	.ent	showVersion
showVersion:
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
	la	$a0,$LC16
	la	$a1,$LC30
	la	$t9,printf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	showVersion
	.size	showVersion, .-showVersion
	.rdata
	.align	2
$LC31:
	.ascii	"Parameter input is empty. Type 'tp0 -h' for help. Progra"
	.ascii	"m terminated\000"
	.align	2
$LC32:
	.ascii	"Argument has invalid characters. Type 'tp0 -h' for help."
	.ascii	" Program terminated\000"
	.align	2
$LC33:
	.ascii	"Invalid arguments. Type 'tp0 -h' for help. Program termi"
	.ascii	"nated\000"
	.align	2
$LC34:
	.ascii	"Parameter has no real part. Type 'tp0 -h' for help. Prog"
	.ascii	"ram terminated\000"
	.align	2
$LC35:
	.ascii	"Parameter has no immaginary part. Type 'tp0 -h' for help"
	.ascii	". Program terminated\000"
	.align	2
$LC36:
	.ascii	"Resolution input is invalid. Type 'tp0 -h' for help. Pro"
	.ascii	"gram terminated\000"
	.align	2
$LC37:
	.ascii	"Output file type is invalid. Type 'tp0 -h' for help. Pro"
	.ascii	"gram terminated\000"
	.align	2
$LC38:
	.ascii	"Output file path is invalid. Type 'tp0 -h' for help. Pro"
	.ascii	"gram terminated\000"
	.align	2
$LC39:
	.ascii	"Parameter input is invalid. Type 'tp0 -h' for help. Prog"
	.ascii	"ram terminated\000"
	.text
	.align	2
	.globl	showError
	.ent	showError
showError:
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
	lw	$v1,40($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L43
	la	$a0,__sF+176
	la	$a1,$LC16
	la	$a2,$LC31
	la	$t9,fprintf
	jal	$ra,$t9
$L43:
	lw	$v1,40($fp)
	li	$v0,-2			# 0xfffffffffffffffe
	bne	$v1,$v0,$L44
	la	$a0,__sF+176
	la	$a1,$LC16
	la	$a2,$LC32
	la	$t9,fprintf
	jal	$ra,$t9
$L44:
	lw	$v1,40($fp)
	li	$v0,-3			# 0xfffffffffffffffd
	bne	$v1,$v0,$L45
	la	$a0,__sF+176
	la	$a1,$LC16
	la	$a2,$LC33
	la	$t9,fprintf
	jal	$ra,$t9
$L45:
	lw	$v1,40($fp)
	li	$v0,-4			# 0xfffffffffffffffc
	bne	$v1,$v0,$L46
	la	$a0,__sF+176
	la	$a1,$LC16
	la	$a2,$LC34
	la	$t9,fprintf
	jal	$ra,$t9
$L46:
	lw	$v1,40($fp)
	li	$v0,-5			# 0xfffffffffffffffb
	bne	$v1,$v0,$L47
	la	$a0,__sF+176
	la	$a1,$LC16
	la	$a2,$LC35
	la	$t9,fprintf
	jal	$ra,$t9
$L47:
	lw	$v1,40($fp)
	li	$v0,-6			# 0xfffffffffffffffa
	bne	$v1,$v0,$L48
	la	$a0,__sF+176
	la	$a1,$LC16
	la	$a2,$LC36
	la	$t9,fprintf
	jal	$ra,$t9
$L48:
	lw	$v1,40($fp)
	li	$v0,-7			# 0xfffffffffffffff9
	bne	$v1,$v0,$L49
	la	$a0,__sF+176
	la	$a1,$LC16
	la	$a2,$LC37
	la	$t9,fprintf
	jal	$ra,$t9
$L49:
	lw	$v1,40($fp)
	li	$v0,-8			# 0xfffffffffffffff8
	bne	$v1,$v0,$L50
	la	$a0,__sF+176
	la	$a1,$LC16
	la	$a2,$LC38
	la	$t9,fprintf
	jal	$ra,$t9
$L50:
	lw	$v1,40($fp)
	li	$v0,-9			# 0xfffffffffffffff7
	bne	$v1,$v0,$L42
	la	$a0,__sF+176
	la	$a1,$LC16
	la	$a2,$LC39
	la	$t9,fprintf
	jal	$ra,$t9
$L42:
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	showError
	.size	showError, .-showError
	.globl	memcpy
	.rdata
	.align	2
$LC40:
	.ascii	"w\000"
	.align	2
$LC43:
	.ascii	"%d \000"
	.align	2
$LC44:
	.ascii	"There was an error while writing to output.\n\000"
	.align	2
$LC45:
	.ascii	"\n\000"
	.align	2
$LC46:
	.ascii	"Unable to close output file.\n\000"
	.align	2
$LC41:
	.word	1073741824
	.align	3
$LC42:
	.word	0
	.word	1073741824
	.text
	.align	2
	.globl	julia
	.ent	julia
julia:
	.frame	$fp,144,$ra		# vars= 56, regs= 3/0, args= 64, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,144
	.cprestore 64
	sw	$ra,136($sp)
	sw	$fp,132($sp)
	sw	$gp,128($sp)
	move	$fp,$sp
	sw	$a0,144($fp)
	sw	$a1,148($fp)
	sw	$a2,152($fp)
	sw	$a3,156($fp)
	lw	$a0,148($fp)
	la	$a1,$LC40
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,144($fp)
	addu	$v0,$sp,16
	addu	$v1,$fp,160
	move	$a0,$v0
	move	$a1,$v1
	li	$a2,48			# 0x30
	la	$t9,memcpy
	jal	$ra,$t9
	lw	$a0,144($fp)
	lw	$a1,148($fp)
	lw	$a2,152($fp)
	lw	$a3,156($fp)
	la	$t9,writeHeader
	jal	$ra,$t9
	l.s	$f0,152($fp)
	cvt.s.w	$f2,$f0
	l.s	$f0,160($fp)
	div.s	$f0,$f0,$f2
	s.s	$f0,72($fp)
	l.s	$f0,156($fp)
	cvt.s.w	$f2,$f0
	l.s	$f0,164($fp)
	div.s	$f0,$f0,$f2
	s.s	$f0,76($fp)
	l.s	$f2,160($fp)
	l.s	$f0,$LC41
	div.s	$f0,$f2,$f0
	cvt.d.s	$f2,$f0
	l.d	$f0,168($fp)
	sub.d	$f0,$f0,$f2
	s.d	$f0,96($fp)
	l.s	$f2,164($fp)
	l.s	$f0,$LC41
	div.s	$f0,$f2,$f0
	cvt.d.s	$f2,$f0
	l.d	$f0,176($fp)
	add.d	$f0,$f0,$f2
	s.d	$f0,104($fp)
	lw	$v0,200($fp)
	sw	$v0,112($fp)
	lw	$v0,204($fp)
	sw	$v0,116($fp)
	sw	$zero,120($fp)
$L53:
	lw	$v0,120($fp)
	lw	$v1,156($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L56
	b	$L54
$L56:
	sw	$zero,124($fp)
$L57:
	lw	$v0,124($fp)
	lw	$v1,152($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L60
	b	$L58
$L60:
	l.s	$f0,124($fp)
	cvt.s.w	$f2,$f0
	l.s	$f0,72($fp)
	mul.s	$f0,$f2,$f0
	cvt.d.s	$f2,$f0
	l.d	$f0,96($fp)
	add.d	$f0,$f0,$f2
	s.d	$f0,80($fp)
	l.s	$f0,120($fp)
	cvt.s.w	$f2,$f0
	l.s	$f0,76($fp)
	mul.s	$f0,$f2,$f0
	cvt.d.s	$f2,$f0
	l.d	$f0,104($fp)
	sub.d	$f0,$f0,$f2
	s.d	$f0,88($fp)
	sw	$zero,116($fp)
$L61:
	lw	$v0,116($fp)
	lw	$v1,112($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L64
	b	$L62
$L64:
	lw	$a0,80($fp)
	lw	$a1,84($fp)
	lw	$a2,88($fp)
	lw	$a3,92($fp)
	la	$t9,getNroImgAbs
	jal	$ra,$t9
	mov.d	$f2,$f0
	l.d	$f0,$LC42
	c.lt.d	$f0,$f2
	bc1t	$L62
	addu	$v1,$fp,80
	lw	$v0,88($fp)
	sw	$v0,16($sp)
	lw	$v0,92($fp)
	sw	$v0,20($sp)
	lw	$a2,80($fp)
	lw	$a3,84($fp)
	move	$a0,$v1
	la	$t9,getNroImgSq
	jal	$ra,$t9
	l.d	$f2,80($fp)
	l.d	$f0,184($fp)
	add.d	$f0,$f2,$f0
	s.d	$f0,80($fp)
	l.d	$f2,88($fp)
	l.d	$f0,192($fp)
	add.d	$f0,$f2,$f0
	s.d	$f0,88($fp)
	lw	$v0,116($fp)
	addu	$v0,$v0,1
	sw	$v0,116($fp)
	b	$L61
$L62:
	lw	$a0,144($fp)
	la	$a1,$LC43
	lw	$a2,116($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	bgez	$v0,$L59
	la	$a0,__sF+176
	la	$a1,$LC44
	la	$t9,fprintf
	jal	$ra,$t9
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
$L59:
	lw	$v0,124($fp)
	addu	$v0,$v0,1
	sw	$v0,124($fp)
	b	$L57
$L58:
	lw	$a0,144($fp)
	la	$a1,$LC45
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$v0,120($fp)
	addu	$v0,$v0,1
	sw	$v0,120($fp)
	b	$L53
$L54:
	lw	$a0,144($fp)
	la	$t9,fclose
	jal	$ra,$t9
	beq	$v0,$zero,$L52
	la	$a0,__sF+176
	la	$a1,$LC46
	la	$t9,fprintf
	jal	$ra,$t9
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
$L52:
	move	$sp,$fp
	lw	$ra,136($sp)
	lw	$fp,132($sp)
	addu	$sp,$sp,144
	j	$ra
	.end	julia
	.size	julia, .-julia
	.rdata
	.align	2
$LC47:
	.ascii	"P2\n\000"
	.align	2
$LC48:
	.ascii	"# %s\n\000"
	.align	2
$LC49:
	.ascii	"%u\n\000"
	.text
	.align	2
	.globl	writeHeader
	.ent	writeHeader
writeHeader:
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
	lw	$a0,40($fp)
	la	$a1,$LC47
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$a0,40($fp)
	la	$a1,$LC48
	lw	$a2,44($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$a0,40($fp)
	la	$a1,$LC49
	lw	$a2,48($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$a0,40($fp)
	la	$a1,$LC49
	lw	$a2,52($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$a0,40($fp)
	la	$a1,$LC49
	lw	$a2,96($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	writeHeader
	.size	writeHeader, .-writeHeader
	.globl	memcpy
	.rdata
	.align	2
$LC50:
	.ascii	"RESOLUTION WIDTH: %d\n\000"
	.align	2
$LC51:
	.ascii	"RESOLUTION HEIGHT: %d\n\000"
	.align	2
$LC52:
	.ascii	"SEED: %.16Lf\n\000"
	.align	2
$LC53:
	.ascii	"WIDTH: %f\n\000"
	.align	2
$LC54:
	.ascii	"HEIGHT: %f\n\000"
	.align	2
$LC55:
	.ascii	"OUTPUT PATH: %s\n\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,160,$ra		# vars= 72, regs= 3/0, args= 64, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,160
	.cprestore 64
	sw	$ra,152($sp)
	sw	$fp,148($sp)
	sw	$gp,144($sp)
	move	$fp,$sp
	sw	$a0,160($fp)
	sw	$a1,164($fp)
	sw	$zero,72($fp)
	addu	$v0,$fp,80
	move	$a0,$v0
	lw	$a1,160($fp)
	lw	$a2,164($fp)
	la	$t9,getParameters
	jal	$ra,$t9
	la	$a0,$LC50
	lw	$a1,88($fp)
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC51
	lw	$a1,92($fp)
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC52
	lw	$a2,120($fp)
	lw	$a3,124($fp)
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC52
	lw	$a2,128($fp)
	lw	$a3,132($fp)
	la	$t9,printf
	jal	$ra,$t9
	l.s	$f0,96($fp)
	cvt.d.s	$f0,$f0
	la	$a0,$LC53
	mfc1	$a2,$f0
	mfc1	$a3,$f1
	la	$t9,printf
	jal	$ra,$t9
	l.s	$f0,100($fp)
	cvt.d.s	$f0,$f0
	la	$a0,$LC54
	mfc1	$a2,$f0
	mfc1	$a3,$f1
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC55
	lw	$a1,84($fp)
	la	$t9,printf
	jal	$ra,$t9
	addu	$v0,$sp,16
	addu	$v1,$fp,96
	move	$a0,$v0
	move	$a1,$v1
	li	$a2,48			# 0x30
	la	$t9,memcpy
	jal	$ra,$t9
	lw	$a0,80($fp)
	lw	$a1,84($fp)
	lw	$a2,88($fp)
	lw	$a3,92($fp)
	la	$t9,julia
	jal	$ra,$t9
	lw	$v0,72($fp)
	move	$sp,$fp
	lw	$ra,152($sp)
	lw	$fp,148($sp)
	addu	$sp,$sp,160
	j	$ra
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
