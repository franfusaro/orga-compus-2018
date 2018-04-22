#include <mips/regdef.h>
#include <sys/syscall.h>

## Tp1 Organizacion de Computadoras

###############
## CONSTANTS ##
###############
#define CUATRO 4.0
#define DOS 2.0

###################################
## SECTION DEFINES struct params ##
###################################

#define UL_RE 0
#define UL_IM 4
#define LR_RE 8
#define LR_IM 12
#define D_RE 16
#define D_IM 20
#define S_RE 24
#define S_IM 28
#define X_RES 32
#define Y_RES 36
#define SHADES 40
#define FPI 44

#################
## END SECTION ##
#################

###############################
## SECTION DEFINES for_loops ##
###############################

#define FORLOOPS_SFSIZE 

# SRA
#define FORLOOPS_RA 
#define FORLOOPS_FP 
#define FORLOOPS_GP 

# LA

#define FORLOOPS_CR 
#define FORLOOPS_CI 
#define FORLOOPS_ZR 
#define FORLOOPS_ZI 
#define FORLOOPS_X 
#define FORLOOPS_Y

# ABA
#define FORLOOPS_ARG0 
#define FORLOOPS_ARG1 
#define FORLOOPS_ARG2 

#################
## END SECTION ##
#################

####################################
## SECTION DEFINES calculo_brillo ##
####################################

# STACK FRAME SIZE

#define BRILLO_SFSIZE 56

# SRA
#define BRILLO_RA 48
#define BRILLO_FP 44
#define BRILLO_GP 40

# LA

#define BRILLO_ZR 16
#define BRILLO_ZI 20
#define BRILLO_TR 24
#define BRILLO_TI 28
#define BRILLO_C 32
#define BRILLO_ABSZ 36

# ABA
#define BRILLO_ARG0 56
#define BRILLO_ARG1 60
#define BRILLO_ARG2 64

#################
## END SECTION ##
#################


    .text
    .abicalls
    .align  2
    .globl  mips32_plot
    .ent    mips32_plot
mips32_plot:
    .frame  $fp, 32, ra
    .set    noreorder
    .cpload t9
    .set    reorder
    
    ## Create Stack Frame
    subu    sp, sp, 32 ## Moving sp pointer
    sw      ra, 24(sp)     ## Save ra in the Stack
    sw      $fp, 20(sp)    ## Save fp in the Stack
    .cprestore 16          ## sw gp, PLOT_GP(sp) ## Save gp in the Stack
    move    $fp, sp        ## $fp <- sp

    li.s $f12, 1.0
    li.s $f14, 2.0
    move a0, a0
    jal for_loops

end_mips32_plot:  
    move    sp, $fp                  ## move sp
    lw      gp, 16(sp)        ## load gp
    lw      $fp, 20(sp)       ## load fp
    lw      ra, 24(sp)        ## load ra
    addu    sp, sp, 32    ## Move the sp to callee position
    jr      ra                       ## jump to return address

    .end    mips32_plot

########################
## FUNCION CICLOS FOR ##
########################

    .text
    .abicalls
    .align  2
    .globl  for_loops
    .ent    for_loops

for_loops:
    .frame  $fp, FORLOOPS_SFSIZE, ra
    
    .set    noreorder
    .cpload t9
    .set    reorder
    
    ## Create Stack Frame
    subu    sp, sp, FORLOOPS_SFSIZE ## Moving sp pointer
    
    sw      ra, FORLOOPS_RA(sp)     ## Save ra in the Stack
    sw      $fp, FORLOOPS_FP(sp)    ## Save fp in the Stack
    
    .cprestore FORLOOPS_GP          
    
    move    $fp, sp               ## $fp <- sp    

    ## Load registers
    lw t0, PARAMS($fp) ## Loads struct params into t0

    l.s $f0, UL_IM(t0) ## loads UL_IM into $f0
    l.s $f2, UL_RE(t0) ## loads UL_RE into $f2
    l.s $f4, D_IM(t0)  ## loads D_IM into $f4
    l.s $f6, D_RE(t0)  ## loads D_RE into $f6

    lw t1, Y_RES(t0)   ## loads Y_RES into t1
    lw t2, X_RES(t0)   ## loads X_RES into t2

    add t3, zero, zero ## init y = 0
    add t4, zero, zero ## init x = 0

    ## Looping through y coordinate
for_y: 
    s.s $f8, D_IM(t0)  ## saves D_IM into f8; f8 = cr

    blt t3, t1, for_x  ## if (y < params->y_res) loop through x
    b end_for_y        ## else end looping through y

for_x:
    sw  zero,20($fp)
    l.s $f12,20($fp)
    l.s $f14,20($fp)
    add.s $f12,$f12,$f8   # $f12 = zr; assigns cr into zr
    add.s $f14,$f14,$f10   # $f14 = zi; assigns ci into zi

    blt t4, t2, call_calcular_brillo
    b end_for_x         

end_for_x:
    li t4,0            ## initializes x = 0 to loop again  
    addi t3,t3,1       # increment y
    sub $f8,$f8,$f8    # ci -= ci  

end_for_y:             ## returns to mips32_plot
    lw  gp,FORLOOPS_GP(sp)
    lw  $fp,FORLOOPS_FP(sp)
    lw  ra,FORLOOPS_RA(sp)
    addu sp,sp,FORLOOPS_SFSIZE
    jr  ra

call_calcular_brillo:
    jal calculo_brillo

.data
.align 2
buffer: .space 32


############################
## FUNCION CALCULO BRILLO ##
############################
    .text
    .abicalls
    .align  2
    .globl  calculo_brillo
    .ent    calculo_brillo
calculo_brillo:
    .frame  $fp, BRILLO_SFSIZE, ra
    .set    noreorder
    .cpload t9
    .set    reorder
    
    ## Create Stack Frame
    subu    sp, sp, BRILLO_SFSIZE ## Moving sp pointer
    sw      ra, BRILLO_RA(sp)     ## Save ra in the Stack
    sw      $fp, BRILLO_FP(sp)    ## Save fp in the Stack
    .cprestore BRILLO_GP          ## sw gp, PLOT_GP(sp) ## Save gp in the Stack
    move    $fp, sp               ## $fp <- sp    

    ## ARGS TO ABA
    s.s     $f12, BRILLO_ARG0($fp)
    s.s     $f14, BRILLO_ARG1($fp)
    sw      a0, BRILLO_ARG2($fp)

    s.s     $f12, BRILLO_ZR($fp)    ## zr = cr
    s.s     $f14, BRILLO_ZI($fp)    ## zi = ci
    sw      zero, BRILLO_C($fp)     ## c = 0
loop_brillo:
    l.s     $f4, BRILLO_ZR($fp)     ## f4 <- zr
    mul.s   $f6, $f4, $f4           ## f6 <- zr * zr
    l.s     $f8, BRILLO_ZI($fp)     ## f8 <- zi
    mul.s   $f10, $f8, $f8          ## f10 <- zi * zi
    add.s   $f16, $f6, $f10         ## f16 <- zr * zr + zi * zi 
    s.s     $f16, BRILLO_ABSZ($fp)  ## absz = zr * zr + zi * zi
    li.s    $f18, CUATRO
    c.lt.s	$f16,$f18	              ## if absz < 4.0 --> code = 1; else --> code = 0
    bc1f    print_brillo            ## if code == 0 --> break;
    sub.s   $f16, $f6, $f10         ## f16 <- zf*zf - zi*zi
    lw      t0, BRILLO_ARG2($fp)    ## t0 <- *params
    l.s     $f18, S_RE(t0)          ## f18 <- params->s_re
    add.s   $f16, $f18, $f16        ## f16 <- params->s_re + zr * zr - zi * zi
    s.s     $f16, BRILLO_TR($fp)    ## tr = params->s_re + zr * zr - zi * zi
    mul.s   $f16, $f4, $f8          ## f16 <- zr * zi
    li.s    $f18, DOS
    mul.s   $f16, $f16, $f18        ## f16 <- zr * zi * 2.0
    lw      t0, BRILLO_ARG2($fp)    ## t0 <- *params
    l.s     $f18, S_IM(t0)          ## f18 <- params->s_im
    add.s   $f16, $f18, $f16        ## f16 <- s_im + zr * zi * 2
    s.s     $f16, BRILLO_TI($fp)    ## ti = s_im + zr * zi * 2
    l.s     $f4, BRILLO_TR($fp)     ## f4 <- tr
    s.s     $f4, BRILLO_ZR($fp)     ## zr = tr
    l.s     $f8, BRILLO_TI($fp)     ## f4 <- ti
    s.s     $f4, BRILLO_ZI($fp)     ## zi = ti
    lw      t0, BRILLO_C($fp)       ## t0 <- c
    add     t0, t0, 1               ## ++c
    sw      t0, BRILLO_C($fp)       ## save c in stack
    lw      t1, BRILLO_ARG2($fp)    ## t1 <- *params
    lw      t1, SHADES(t1)          ## t1 <- params->shades
    bge     t1, t0, loop_brillo     ## if (c > shades) break;
    
print_brillo:
    lw t4, BRILLO_C($fp)
    jal itoa
    li      a0, 1         ## itoa returns addr of buffer in a1 and number of bytes in a2
    li      v0, SYS_write
    syscall
    b end_calculo_brillo

itoa:
    # receives parameter in t3
    la      t0, buffer    ## load buf
    add     t0, t0, 30    ## seek the end
    sb      zero, 1(t0)   ## null-terminated str
    li      t5, 1         ## start bytes counter
    li      t1, '0'
    sb      t1, (t0)      ## init. with ascii 0
    li      t2, 10        ## preload 10
    beq     t3, 0, iend   ## end if arg is 0
loop:
    div     t3, t2        ## a /= 10
    mflo    t3
    mfhi    t4            ## get remainder
    add     t4, t4, t1    ## convert to ASCII digit
    sb      t4, (t0)      ## store it
    sub     t0, t0, 1     ## dec. buf ptr
    add     t5, t5, 1     ## bytes counter++
    bne     t3, 0, loop   ## if not zero, loop
iend:
    move    a1, t0        ## return the addr of the string
    move    a2, t5        ## return the number of bytes written
    jr      ra    

end_calculo_brillo:
    ## aca deberia ir el incremento de x y de cr
    # addi t6,t6,1          ## increment x
    # add.s $f20,$f20,$f20 ## cr += cr

    move    sp, $fp                  ## move sp
    lw      gp, BRILLO_GP(sp)        ## load gp
    lw      $fp, BRILLO_FP(sp)       ## load fp
    lw      ra, BRILLO_RA(sp)        ## load ra
    addu    sp, sp, BRILLO_SFSIZE    ## Move the sp to callee position
    jr      ra                       ## jump to return address

    .end    calculo_brillo

.data
.align 2
buffer: .space 32
