#To write the asm recursive code for Fibonacci

addi a0, x0, 10
jal ra, fibb
beq x0, x0, exit

fibb: 
    #this function return a0 th fibb number using recursion
    addi t3, x0, 1
    ble a0, t1, return 

    #let t0 and t1 be free along with ra
    addi sp, sp, -12
    sw t0, 8(sp)
    sw t1, 4(sp)
    sw ra, 0(sp)
    addi sp, sp, -4
    sw a1, 0(sp)

    add a1, a0, x0

    #store fibb of a0-1 in t0 and a0-2 in t1
    addi a0, a1, -1
    jal ra, fibb
    add t0, a0, x0
    addi a0, a1, -2
    jal ra, fibb
    add t1, a0, x0

    add a0, t0, t1
    lw a1, 0(sp)
    addi sp, sp, 4
    
    lw ra, 0(sp)
    lw t1, 4(sp)
    lw t0, 8(sp)
    addi sp, sp, 12

    return:
    jalr x0, ra, 0

exit:

