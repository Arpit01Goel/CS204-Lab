#write a assembly program to count the no of 1 in a word

.data
word: .word 0xF0F0F0F0      #save word at start of memory

.text
.globl main

main:
    add t0, x0, x0      #store answer in t0
    addi t2, x0, 1      #get address of word in t2
    slli t2, t2, 28
    lw x1, 0(t2)        #load word in resistor

    loop: 
        beq x1, x0 , exit   # condition to exit loop
        addi t1, x0, 1      # and with 1 to check if last digit is one in binary
        and t1, t1,x1       
        add t0, t0, t1  
        srli x1,x1, 1       # shift right and considering last digit
        beq x0, x0, loop    # continue the loop
    exit:
