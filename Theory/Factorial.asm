#to find fibb of n using recursion in asm
#store n in a0
addi a0, x0, 10

jal ra, fibb
beq x0, x0, exit



#make recursive function to find fibb
fibb:
    addi a1, x0, 1
    ble a0, a1, return 
    #to save fibb of a0 in a0 itself
    addi sp, sp, -4
    sw t0, 0(sp)

    add t0, x0, a0
    #recall fibb
    addi sp, sp, -4
    sw ra, 0(sp)
    addi a0, a0, -1
    jal ra, fibb

    lw ra, 0(sp)
    addi sp, sp, 4

    mul a0, a0, t0

    #recover t0
    lw t0, 0(sp)
    addi sp, sp, 4

    jalr x0, ra, 0

    return : 
    addi a0, x0, 1
    jalr x0, ra, 0

        


exit: 