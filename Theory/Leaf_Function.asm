addi a0, x0 , 64
   
#main program here
addi t0, x0, 1
jal x1, square
beq x0, x0, exit

#to find its square and store in a0
square:
    #to find sq of a0 and store in a0
    addi sp, sp, -4
    sw t0, 0(sp)
    mul t0, a0, a0
    add a0, x0, t0
    
    #load value of t0
    lw t0, 0(sp)
    addi sp, sp, 4
    jalr x0, x1, 0
    
exit: 