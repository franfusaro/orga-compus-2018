#include <mips/regdef.h>
#include <sys/syscall.h>

## Tp1 Organizacion de Computadoras

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



####################################
## SECTION DEFINES calculo_brillo ##
####################################

# STACK FRAME SIZE

#define BRILLO_SFSIZE 80

# SRA
#define BRILLO_RA 72
#define BRILLO_FP 68
#define BRILLO_GP 64

# LA

#define BRILLO_ZR 16
#define BRILLO_ZI 20
#define BRILLO_TR 24
#define BRILLO_TI 28
#define BRILLO_C 32
#define BRILLO_ABSZ 36

# FRA

#define BRILLO_F20 40
#define BRILLO_F21 44
#define BRILLO_F22 48
#define BRILLO_F23 52
#define BRILLO_F24 56
#define BRILLO_F25 60

# ABA
#define BRILLO_ARG0 80
#define BRILLO_ARG1 84
#define BRILLO_ARG2 88

#################
## END SECTION ##
#################

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

    move t0, a0
    jal itoa
    
    li      a0, 1         ## itoa returns addr of buffer in a1 and number of bytes in a2
    li      v0, SYS_write
    syscall
    b end_calculo_brillo

itoa:
    la      t0, buffer    ## load buf
    add     t0, t0, 30    ## seek the end
    sb      zero, 1(t0)   ## null-terminated str
    li      t5, 1         ## start bytes counter
    li      t1, '0'
    sb      t1, (t0)      ## init. with ascii 0
    li      t2, 10        ## preload 10
    beq     a0, 0, iend   ## end if arg is 0
    move    t3, a0
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
    move sp, $fp                  ## move sp
    lw gp, BRILLO_GP(sp)          ## load gp
    lw $fp, BRILLO_FP(sp)         ## load fp
    lw ra, BRILLO_RA(sp)          ## load ra
    addu sp, sp, BRILLO_SFSIZE    ## Move the sp to callee position
    jr ra                         ## jump to return address

    .end    calculo_brillo

.data
.align 2
buffer: .space 32
