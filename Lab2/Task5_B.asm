#implement if and else using bne

addi t1, x0, 5
addi t2, x0, 4

bne t1, t2, else

if :
    addi x1, x0, 1
    beq x0, x0 , exit

else :
    addi x2, x0, 2

exit:

