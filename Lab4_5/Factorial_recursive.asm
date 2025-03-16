#to find factorial of a numebr using recursion

.data 

.text

addi a0, x0, 5
jal ra, fact
beq x0, x0, exit
fact:
    #this function takes argument a0 and store fact of it in a0

    #a0 is n
    beq a0, x0, end

    addi sp, sp, -8
    sw ra, 4(sp)
    sw a0, 0(sp)

    addi a0, a0, -1
    jal ra, fact

    #now a0 have fact of n-1
    #t0 = n
    lw t0, 0(sp)

    mul a0, a0, t0
    lw ra, 4(sp)
    addi sp, sp ,8

    jalr x0, ra, 0
    



    end:
        addi a0, x0, 1
        jalr x0, ra, 0

exit: 
ecall