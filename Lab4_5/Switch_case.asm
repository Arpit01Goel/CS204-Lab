.data

jump_table:
    .word case1
    .word case2
    .word case3
    .word default 
.text
_start:
    lui x1, 0x10000

    addi x3, x0, 2
    slli x3, x3, 2
    add x1, x1, x3
    lw x1, 0(x1)
    jalr x0, x1, 0

case1:
    addi x10, x0, 5
    jal x0, exit

case2:
    addi x10, x0, 6
    jal x0, exit


case3:
    addi x10, x0, 8
    jal x0, exit

default:
    addi x10, x0, -1
    jal x0, exit
exit:
ecall