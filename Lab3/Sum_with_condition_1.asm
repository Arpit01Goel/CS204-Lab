.data
arrA: .word -40 , 0, 10, 20, 30, 40, 50, 60, 70, 80

.text
#to find sum of all numbers in t0
addi t0, x0, 0

#let t1 be address of current element
addi t1, x0, 1
slli t1, t1, 28                                         #note we need to slli 28 for main memory location
#t1 contain address of first element of array

addi t2, x0, 0
#t2 contain iterator i
addi x1, x0, 10
#x1 contain no of elements
addi t4, x0, 5
myloop:
    bge t2, x1, exit
    lw t5, 0(t1)
    bge t4, t5, pass
    add: 
        add t0, t0, t5  
    pass: 

    addi t1, t1, 4
    addi t2, t2, 1
    beq x0, x0, myloop
exit:
    add x0, x0, x0