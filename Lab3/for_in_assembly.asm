#for (expr1;expr2;expr3) {
# statements
# }

#to learn it , we will find the sum of first 10 numbers using loop like in assembly and store it in t0

add t0, x0, x0
addi t1, x0, 1      # t1 is i (iterator)

addi t2, x0, 10     # t2 is end point
loop:
    bge t1, t2, exit
    add t0, t0, t1
    addi t1, t1, 1
    beq x0, x0, loop

exit:
    add x0, x0, x0
    