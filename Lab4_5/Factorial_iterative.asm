#to find afct of a0 using iteration

.text

addi a0 , x0, 8

#store answer in s0
addi s0, x0,1


loop:
    beq x0, a0, exit

    mul s0, s0, a0
    addi a0, a0, -1
    beq x0, x0, loop


exit:
ecall
