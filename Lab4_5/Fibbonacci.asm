#to write a recursive function to get fibb 
#store seed values

.data
val1: .word 0
val2: .word 1

.text
# la s5, val1
auipc s5, 65536
addi s5,s5, 0
# la s6, val2
auipc s6, 65536
addi s6,s6, -4
lw s5, 0(s5)
lw s6, 0(s6)

addi a0, x0, 10

add x0, x0, x0
jal ra, fibb


jal x0, exit
fibb:
    # this will calc the a0th fibb number and store the answer in a0 itself
    
    #store all ra and saved values
    addi sp, sp, -32
    sw ra, 28(sp)
    sw s0, 24(sp)
    sw s1, 20(sp)
    sw s2, 16(sp)
    sw s3, 12(sp)
    sw s4, 8(sp)
    sw s5, 4(sp)
    sw s6, 0(sp)
    

    #main code

        #base case
        beq a0, x0, zer
        addi t0, x0, 1
        beq t0, a0, one

        #find recursively the fibb of a0-1 and a0-2

        add s0, x0, a0
        addi a0, a0, -1

        jal ra, fibb
        add s1, a0, x0

        addi a0, s0, -2
        jal ra, fibb
        add s1, a0, s1

        add a0, s1, x0



    end: 
    #load things
    lw ra, 28(sp)
    lw s0, 24(sp)
    lw s1, 20(sp)
    lw s2, 16(sp)
    lw s3, 12(sp)
    lw s4, 8(sp)
    lw s5, 4(sp)
    lw s6, 0(sp)
    addi sp, sp, 32

    jalr x0, ra, 0

    zer:
        add a0, x0, s5
        jal x0, end
    
    one:
        add a0, x0, s6
        jal x0, end


exit:
ecall
    