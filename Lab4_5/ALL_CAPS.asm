.data
var1: .asciiz "I am Arpit"

.text

auipc x13, 65536
addi x13,x13, 0

# x13 has the starting address of string 
add a0, x0, x0
addi t4, x0, 0x00
ALLCAPS :
    add t0, x13, a0
    lb t1, 0(t0)
    beq t1, t4, exit

    addi t2, x0, 96    
    ble t1, t2, continue

    addi t1, t1, -32
    sb t1, 0(t0)

    continue:
    addi a0, a0, 1
    jal x0, ALLCAPS

exit:
    ecall
