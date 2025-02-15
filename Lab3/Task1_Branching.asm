addi t0, x0, 1
#t0 store which case it is

addi t5, x0, 1
beq t0, t5, case1
addi t5, x0, 2

beq t0, t5, case2
addi t5, x0, 3

beq t0, t5, case3

default: 
    addi x4, x0, -1
    beq x0, x0, exit

case1:
    addi x1, x0, 1
    beq x0, x0, exit

case2:
    addi x2, x0, 2
    beq x0, x0, exit

case3: 
    addi x3, x0, 3
    beq x0, x0, exit

exit: 

