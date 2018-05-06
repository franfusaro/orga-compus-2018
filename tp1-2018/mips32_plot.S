#include <mips/regdef.h>
#include <sys/syscall.h>

## Tp1 Organizacion de Computadoras

###############
## CONSTANTS ##
###############
#define CUATRO 4.0
#define DOS 2.0
#define SIZE_HEADER 2
#define SIZE_SEP 1
#define STDOUT 2
#define SIZE_MSG_ERR 11

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

#define OFFSET_FD 14

#################
## END SECTION ##
#################


#################################
## SECTION DEFINES mips32_plot ##
#################################

# STACK FRAME SIZE

#define PLOT_SFSIZE 32

# SRA
#define PLOT_RA 24
#define PLOT_FP 20
#define PLOT_GP 16

# ABA
#define PLOT_ARG0 32

#################
## END SECTION ##
#################

##################################
## SECTION DEFINES imprimir_sep ##
##################################

#define SEP_SFSIZE 32

# SRA
#define SEP_RA 24
#define SEP_FP 20
#define SEP_GP 16

# ABA
#define SEP_ARG0 32

#################
## END SECTION ##
#################

##################################
## SECTION DEFINES imprimir_nro ##
##################################

#define IMPRIMIR_NRO_SFSIZE 32

# SRA
#define IMPRIMIR_NRO_S0 28
#define IMPRIMIR_NRO_RA 24
#define IMPRIMIR_NRO_FP 20
#define IMPRIMIR_NRO_GP 16

# ABA
#define IMPRIMIR_NRO_ARG0 32
#define IMPRIMIR_NRO_ARG1 36

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

###############################
## SECTION DEFINES for_loops ##
###############################

#define FORLOOPS_SFSIZE 56

# SRA
#define FORLOOPS_RA 48
#define FORLOOPS_FP 44
#define FORLOOPS_GP 40

# LA

#define FORLOOPS_CR 16
#define FORLOOPS_CI 20
#define FORLOOPS_XRES 24
#define FORLOOPS_YRES 28
#define FORLOOPS_X 32
#define FORLOOPS_Y 36

# ABA
#define FORLOOPS_ARG0 56

#################
## END SECTION ##
#################

    .text
    .abicalls
    .align  2
    .globl  mips32_plot
    .ent    mips32_plot
mips32_plot:
    .frame  $fp, PLOT_SFSIZE, ra
    .set    noreorder
    .cpload t9
    .set    reorder
    
    ## Create Stack Frame
    subu    sp, sp, PLOT_SFSIZE     ## Moving sp pointer
    sw      ra, PLOT_RA(sp)         ## Save ra in the Stack
    sw      $fp, PLOT_FP(sp)        ## Save fp in the Stack
    .cprestore PLOT_GP              ## sw gp, PLOT_GP(sp) ## Save gp in the Stack
    move    $fp, sp                 ## $fp <- sp

    ## ARGS TO ABA
    sw      a0, PLOT_ARG0($fp)
    
    ## Imprimir cabecera
    lw      t0, PLOT_ARG0($fp)
    lw      t0, FPI(t0)
    lh      a0, OFFSET_FD(t0)
    la      a1, header
    li      a2, SIZE_HEADER
    li      v0, SYS_write
    syscall

    # Chequeo de errores (a3 != 0?)
    bne     a3, zero, error_header    ## valido error en escritura 
    beq     v0, SIZE_HEADER, no_error ## Verifico que se hayan imprimido la cantidad de bytes que pedi

error_header:
    li      a0, STDOUT
    la      a1, msg_error
    li      a2, SIZE_MSG_ERR
    li      v0, SYS_write
    syscall

    # exit program
    li      a0,1
    li      v0, SYS_exit
    syscall                      ## Exit the program with status = 1

no_error:    
    lw      a0, PLOT_ARG0($fp)
    jal     imprimir_sep

    lw      a0, PLOT_ARG0($fp)
    lw      t0, PLOT_ARG0($fp)
    lw      a1, X_RES(t0)
    jal     imprimir_numero  

    lw      a0, PLOT_ARG0($fp)
    jal     imprimir_sep

    lw      a0, PLOT_ARG0($fp)
    lw      t0, PLOT_ARG0($fp)
    lw      a1, Y_RES(t0)
    jal     imprimir_numero  

    lw      a0, PLOT_ARG0($fp)
    jal     imprimir_sep

    lw      a0, PLOT_ARG0($fp)
    lw      t0, PLOT_ARG0($fp)
    lw      a1, SHADES(t0)
    sub     a1,a1,1
    jal     imprimir_numero  

    lw      a0, PLOT_ARG0($fp)
    jal     imprimir_sep

    lw a0, PLOT_ARG0($fp)
    jal     for_loops

end_mips32_plot:  
    move    sp, $fp                 ## move sp
    lw      gp, PLOT_GP(sp)         ## load gp
    lw      $fp, PLOT_FP(sp)        ## load fp
    lw      ra, PLOT_RA(sp)         ## load ra
    addu    sp, sp, PLOT_SFSIZE     ## Move the sp to callee position
    jr      ra                      ## jump to return address

    .end    mips32_plot


    .text
    .abicalls
    .align  2
    .globl  imprimir_sep
    .ent    imprimir_sep
imprimir_sep:
    .frame  $fp, SEP_SFSIZE, ra
    
    .set    noreorder
    .cpload t9
    .set    reorder
    
    ## Create Stack Frame
    subu    sp, sp, SEP_SFSIZE   ## Moving sp pointer
    
    sw      ra, SEP_RA(sp)       ## Save ra in the Stack
    sw      $fp, SEP_FP(sp)      ## Save fp in the Stack
    
    .cprestore SEP_GP          
    
    move    $fp, sp              ## $fp <- sp    
    
    ## ARGS TO ABA
    sw      a0, SEP_ARG0($fp)

    ## Salto de linea   
    lw      t0, SEP_ARG0($fp)    ## t0 <- *params
    lw      t0, FPI(t0)          ## loads file into t0
    lh      a0, OFFSET_FD(t0)    ## a0 = FD
    la      a1, sep
    li      a2,SIZE_SEP
    li      v0,SYS_write
    syscall
    # Chequeo de errores (a3 != 0?)
    bne     a3, zero, error_sep      ## valido error en escritura 
    beq     v0, SIZE_SEP, end_imprimir_sep ## Verifico que se hayan imprimido la cantidad de bytes que pedi

error_sep:
    li      a0, STDOUT
    la      a1, msg_error
    li      a2, SIZE_MSG_ERR
    li      v0, SYS_write
    syscall

    # exit program
    li      a0,1
    li      v0, SYS_exit
    syscall                      ## Exit the program with status = 1


end_imprimir_sep:
    lw      gp,SEP_GP(sp)
    lw      $fp,SEP_FP(sp)
    lw      ra,SEP_RA(sp)
    addu    sp,sp,SEP_SFSIZE
    jr      ra

    .end    imprimir_sep

    .text
    .abicalls
    .align  2
    .globl  imprimir_numero
    .ent    imprimir_numero
imprimir_numero:
    .frame  $fp, IMPRIMIR_NRO_SFSIZE, ra
    
    .set    noreorder
    .cpload t9
    .set    reorder
    
    ## Create Stack Frame
    subu    sp, sp, IMPRIMIR_NRO_SFSIZE ## Moving sp pointer
    
    sw      ra, IMPRIMIR_NRO_RA(sp)     ## Save ra in the Stack
    sw      $fp, IMPRIMIR_NRO_FP(sp)    ## Save fp in the Stack
    
    .cprestore IMPRIMIR_NRO_GP          
    
    move    $fp, sp                     ## $fp <- sp    
    ## SAVE SRA
    sw      s0, IMPRIMIR_NRO_S0($fp)        ## Guardo el s0 en el SRA

    ## ARGS TO ABA
    sw      a0, IMPRIMIR_NRO_ARG0($fp)
    sw      a1, IMPRIMIR_NRO_ARG1($fp)

itoa:
    lw      t3, IMPRIMIR_NRO_ARG1($fp)  ## t3 numero a imprimir
    la      t0, buffer                  ## load buf
    add     t0, t0, 30                  ## seek the end
    sb      zero, 1(t0)                 ## null-terminated str
    li      t5, 1                       ## start bytes counter
    li      t1, '0'
    sb      t1, (t0)                    ## init. with ascii 0
    li      t2, 10                      ## preload 10
    beq     t3, 0, endi                 ## end if arg is 0
loop:
    div     t3, t2                      ## a /= 10
    mflo    t3
    mfhi    t4                          ## get remainder
    add     t4, t4, t1                  ## convert to ASCII digit
    sb      t4, (t0)                    ## store it
    sub     t0, t0, 1                   ## dec. buf ptr
    add     t5, t5, 1                   ## bytes counter++
    bne     t3, 0, loop                 ## if not zero, loop
    add     t0, t0, 1                   ## dec. buf ptr
endi:
    move    a1, t0                      ## addr of the string
    move    a2, t5                      ## number of bytes written
    move    s0, t5                      ## load for later check

    lw      t0, IMPRIMIR_NRO_ARG0($fp)  ## t0 <- *params
    lw      t0, FPI(t0)                 ## t0 <- *FILE
    lh      a0, OFFSET_FD(t0)           ## a0 <- fd
    li      v0, SYS_write
    syscall
    # Chequeo de errores (a3 != 0?)
    bne     a3, zero, error             ## valido error en escritura 
    beq     v0, s0, end_imprimir_numero ## Verifico que se hayan imprimido la cantidad de bytes que pedi

error:
    li      a0,STDOUT
    la      a1, msg_error
    li      a2, SIZE_MSG_ERR
    li      v0, SYS_write
    syscall

    # exit program
    li      a0,1
    li      v0, SYS_exit
    syscall                             ## Exit the program with status = 1

end_imprimir_numero:
    ## RESTORE SRA
    lw      s0, IMPRIMIR_NRO_S0($fp)        ## Restore el s0
    lw      gp,IMPRIMIR_NRO_GP(sp)
    lw      $fp,IMPRIMIR_NRO_FP(sp)
    lw      ra,IMPRIMIR_NRO_RA(sp)
    addu    sp,sp,IMPRIMIR_NRO_SFSIZE
    jr      ra

    .end    imprimir_numero

.data
.align 2
buffer: .space 32

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
    
    ## ARGS TO ABA
    sw      a0, FORLOOPS_ARG0($fp)

    lw      t0, FORLOOPS_ARG0($fp)    ## t0 <- *params

    l.s     $f4,UL_IM(t0)
    s.s     $f4,FORLOOPS_CI($fp) #ci = UL_IM

    l.s     $f4,UL_RE(t0)
    s.s     $f4,FORLOOPS_CR($fp) #cr = UL_RE

    lw      t1, Y_RES(t0)   ## loads Y_RES into t1
    sw      t1, FORLOOPS_YRES($fp)

    lw      t2, X_RES(t0)   ## loads X_RES into t2
    sw      t2, FORLOOPS_XRES($fp)

    lw      t3, FORLOOPS_Y(t0)
    add     t3, zero, zero ## init y = 0
    sw      t3, FORLOOPS_Y($fp)

    lw      t4, FORLOOPS_X(t0)
    add     t4, zero, zero ## init x = 0
    sw      t4, FORLOOPS_X($fp)

    ## Looping through y coordinate
for_y: 
    lw      t3,FORLOOPS_Y($fp)
    lw      t1,FORLOOPS_YRES($fp)

    addi    t3,t3,1       # increment y
    sw      t3,FORLOOPS_Y($fp)

    blt     t1,t3,end_for_y
    
for_x:    
    l.s     $f12, FORLOOPS_CR($fp)
    l.s     $f14, FORLOOPS_CI($fp)

    lw      a0,FORLOOPS_ARG0($fp)

    jal     calculo_brillo

    lw      t0, FORLOOPS_ARG0($fp)
    l.s     $f4,D_RE(t0)
    l.s     $f6,FORLOOPS_CR($fp)
    add.s   $f6,$f6,$f4 ## cr += D_RE 
    s.s     $f6,FORLOOPS_CR($fp)

    lw      t2,FORLOOPS_X($fp)
    lw      t4,FORLOOPS_XRES($fp)

    addi    t2,t2,1  ## increment x  
    sw      t2,FORLOOPS_X($fp)

    blt     t2, t4, for_x         

end_for_x:
    li      t2,0
    sw      t2,FORLOOPS_X($fp)           ## initializes x = 0 to loop again 
    lw      t0, FORLOOPS_ARG0($fp)    ## t0 <- *params
    l.s     $f4,UL_RE(t0)
    s.s     $f4,FORLOOPS_CR($fp)      ## Reset cr to UL_RE

    lw      t0, FORLOOPS_ARG0($fp)
    l.s     $f4,D_IM(t0)
    l.s     $f6,FORLOOPS_CI($fp)
    sub.s   $f6,$f6,$f4    # ci -= D_IM  
    s.s     $f6,FORLOOPS_CI($fp)  
    
    b       for_y

end_for_y:             ## returns to mips32_plot
    lw      gp,FORLOOPS_GP(sp)
    lw      $fp,FORLOOPS_FP(sp)
    lw      ra,FORLOOPS_RA(sp)
    addu    sp,sp,FORLOOPS_SFSIZE
    jr      ra

    .end    for_loops

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
    c.lt.s	$f16,$f18	            ## if absz < 4.0 --> code = 1; else --> code = 0
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
    l.s     $f8, BRILLO_TI($fp)     ## f8 <- ti
    s.s     $f8, BRILLO_ZI($fp)     ## zi = ti
    lw      t0, BRILLO_C($fp)       ## t0 <- c
    add     t0, t0, 1               ## ++c
    sw      t0, BRILLO_C($fp)       ## save c in stack
    lw      t1, BRILLO_ARG2($fp)    ## t1 <- *params
    lw      t1, SHADES(t1)          ## t1 <- params->shades
    sub     t1, t1, 1
    bgt     t1, t0, loop_brillo     ## if (c > shades) break;
    
print_brillo:
    lw      a0, BRILLO_ARG2($fp)
    lw      a1, BRILLO_C($fp)
    jal imprimir_numero
    lw      a0, BRILLO_ARG2($fp)
    jal imprimir_sep

end_calculo_brillo:
    move    sp, $fp                  ## move sp
    lw      gp, BRILLO_GP(sp)        ## load gp
    lw      $fp, BRILLO_FP(sp)       ## load fp
    lw      ra, BRILLO_RA(sp)        ## load ra
    addu    sp, sp, BRILLO_SFSIZE    ## Move the sp to callee position
    jr      ra                       ## jump to return address

    .end    calculo_brillo

.rdata          # segmento read-only data

    .align 2
sep: .ascii "\n"
header:     .asciiz "P2"
msg_error: .asciiz  "i/o error.\n"
