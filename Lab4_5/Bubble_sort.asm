#impelemnt bubble sort
.data 
arr1: .byte 60 50 40 30 20 10 9 8 7 6 5 4 3 2 1
.text
auipc a1, 65536
addi a1, a1, 0
addi a2, a1, 15
jal x0, main

Bsort:
    #given starting address in a1, edning in a2 , sort the array
    bge a2, a1, fu
    jalr x0, ra, 0
    fu:
        bne a1, a2, nq
            # if equal then return (single element is sorted)
            jalr x0, ra, 0
        nq:
            #let iterator be in t3 (address iterator)
            add t3, x0, a1
            
            while:
                beq t3, a2, endWhile
                #get element at t3 a to t0 and element in t3+1 to t1
                lb t0 , 0(t3)
                
                lb t1, 1(t3)
                blt t0, t1, not_swap
                sb t0, 1(t3)
                sb t1, 0(t3)
                
                not_swap:
                addi t3, t3, 1
                beq x0, x0, while
            endWhile:  
                #recall with one element less
                addi sp, sp, -4
                sw ra, 0(sp)
                addi a2, a2, -1
                jal ra, Bsort
                lw ra, 0(sp)
                addi sp, sp, 4
                jalr x0, ra, 0
            
main:
    jal ra, Bsort
    ecall
    