#to write a assembly program to learn NOT operator in assembly
addi x3 x0 102
#not is a pseudo instruction
#use xori with 1 to apply not
xori x5, x3, -1
not x4, x3
sw x4, 0(x5)
