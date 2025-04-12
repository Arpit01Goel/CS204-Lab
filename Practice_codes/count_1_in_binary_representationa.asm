.text
addi x5 , x0, 1024
addi x1 x0 1
addi x2 x0 0
loop:beq x5 x0 exit
and x3 x1, x5
add x2, x2, x3

srli x5, x5, 1
beq x0 x0 loop
exit: 