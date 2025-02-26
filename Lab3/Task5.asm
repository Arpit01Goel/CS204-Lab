#to fill array B as B[i] = m* A[i] + c
#you are only given starting address of A,B and values of m,c

.data 
arrA: .byte 0,1,2,3,4,5,6,7,8,9
arrB: .byte 0,0,0,0,0,0,0,0,0,0

.text
#let m be stored in a0 and c in a1
addi a0, x0, 3
addi a1, x0, 4

#get starting address of A nd B in s1 and s2 respectively
lui s1, 0x10000
addi s2, s1, 10

addi s0, x0, 0        #let s0 be iterator
addi t6, x0, 10    #let t6 have no of elements in array
loop: 
    bge s0, t6, exit
    lb t0, 0(s1)
    mul t0, t0, a0
    add t0, t0, a1

    addi s0, s0, 1
    sb t0, 0(s2)

    addi s1, s1, 1
    addi s2, s2, 1

    beq x0, x0, loop


exit: