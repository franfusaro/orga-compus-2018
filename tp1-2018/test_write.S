#include <mips/regdef.h>
#include <sys/syscall.h>

    .text
    .align  2
    .globl  test_write
    .ent    test_write
test_write:
    .frame  $fp, 32, ra
    .set    noreorder
    .cpload t9
    .set    reorder
    
    ## Create Stack Frame
    subu    sp, sp, 40    ## Moving sp pointer
    sw      ra, 32(sp)    ## Save ra in the Stack
    sw      $fp, 28(sp)   ## Save fp in the Stack
    .cprestore 24         ## sw gp, PLOT_GP(sp) ## Save gp in the Stack
    move    $fp, sp       ## $fp <- sp

    li      a0, 35
    jal     itoa
    
    li      a0, 1         ## itoa returns addr of buffer in a1 and number of bytes in a2
    li      v0, SYS_write
    syscall
    
    li      a0, 0
    jal     itoa
    
    li      a0, 1         ## itoa returns addr of buffer in a1 and number of bytes in a2
    li      v0, SYS_write
    syscall
    
    li      a0, 115
    jal     itoa
    
    li      a0, 1         ## itoa returns addr of buffer in a1 and number of bytes in a2
    li      v0, SYS_write
    syscall
    
    li      a0, 255
    jal     itoa
    
    li      a0, 1         ## itoa returns addr of buffer in a1 and number of bytes in a2
    li      v0, SYS_write
    syscall
    
    bnez    a3, errorWrite ## a3 != 0 -> error read syscall
    b       end_test_write
    
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
    

errorWrite:
    li a0, 1
    la a1, name_test
    li a2, 4
    li v0, SYS_write
    syscall    
    
end_test_write:
    move    sp, $fp       ## move sp
    lw      gp, 24(sp)    ## load gp
    lw      $fp, 28(sp)   ## load fp
    lw      ra, 32(sp)    ## load ra
    addu    sp, sp, 40    ## Move the sp to callee position
    jr ra                 ## jump to return address

    .end    test_write
  
    
.data
name_test: .asciiz "cero"
.align 2
buffer: .space 32
