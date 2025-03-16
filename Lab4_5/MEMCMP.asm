.data
arr1:
    .byte 1 2 68 45 12 56 32 69 89 78 74 0 -4
    .byte 2 1 3  4  5  12 41 90 4  32 48 68 79
    

.text
auipc x5, 65536
addi x5, x5, 0
auipc x6, 65536
addi x6, x6, 5
addi x10, x0, 13
#first addess is x5, second is x6, length in x10
# answer in x11

add x11, x0, x0
calc:
    beq x10, x0, exit
    lb s0, 0(x5)
    lb s1, 0(x6)

    beq s0, s1, continue
    addi x11, x11, 1
    continue:
        addi x5, x5, 1
        addi x6, x6, 1
        addi x10, x10, -1
        jal x0, calc
exit:
ecall