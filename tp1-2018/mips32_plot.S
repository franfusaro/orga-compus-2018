#include <mips/regdef.h>
#include <sys/syscall.h>

## Tp1 Organizacion de Computadoras

## SECTION DEFINES mips32_plot 

# STACK FRAME SIZE

#define PLOT_SFSIZE

# SRA
#define PLOT_RA_OFFSET 48
#define PLOT_FP_OFFSET 44
#define PLOT_GP_OFFSET 40

# LA


# ABA
#define PLOT_ARG0 

## END SECTION

    .text
    .align  2
    .globl  mips32_plot
    .ent    mips32_plot
mips32_plot:
    .frame $fp, PLOT_SFSIZE, ra
    .set  noreorder
    .cpload t9
    .set  reorder
    ## Create Stack Frame
    subu sp, sp, PLOT_SFSIZE    ## Moving sp pointer
    sw ra, PLOT_RA_OFFSET(sp)      ## Save ra in the Stack
    sw $fp, PLOT_FP_OFFSET(sp)     ## Save fp in the Stack
    .cprestore PLOT_GP_OFFSET      ## sw gp, PLOT_GP_OFFSET(sp) ## Save gp in the Stack
    move $fp, sp                ## $fp <- sp
    
    
end_mips32_plot:
    move sp, $fp                ## move sp
    lw gp, PLOT_GP_OFFSET(sp)      ## load gp
    lw $fp, PLOT_FP_OFFSET(sp)     ## load fp
    lw ra, PLOT_RA_OFFSET(sp)      ## load ra
    addu sp, sp, PLOT_SFSIZE    ## Move the sp to callee position
    jr ra                       ## jump to return address

    .end    mips32_plot
