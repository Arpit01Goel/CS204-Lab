.data 
arrA: .word 0, 10, 20, 30, 40, 50, 60, 70, 80, 90
arrB: .word -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

.text
addi x10, x0, 0x100
slli x10, x10, 20           #starting address of A
addi x20, x10, 40           #starting address of B

addi x16, x0, 0             #variable x
addi x17, x0, 10            #number of elements to copy

myloop: 
    bge x16, x17, exit      #end condition
    lw x18, 0, x10          #get a[i]
    sw x18, 0, x20          #write to b[i]
    addi x10, x10, 4        #next element of a[i]
    addi x20, x20, 4        #next element of b
    addi x16, x16, 1        #x++
    beq x0, x0, myloop
exit: 
add x0, x0, x0
