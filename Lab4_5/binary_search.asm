#implement binary search in assembly

#a0 contain element ot be search : recursive call and arguement is a0

.data
arr1: .byte -13 -12 -10 -8 -5 -3 -1 0 1 3 6 10 15 22 30 39 48 57 64 82

.text
# load data from data segment
auipc a1, 65536
addi a1, a1, 0

addi a2, a1, 19

jal x0, main

Bsearch: 
#a0 have element to be seearched , a1 have starting address and a2 have ending address9both including)
        #base case
        bge a2, a1, fu
        addi a0, x0, -1
        jalr x0, ra, 0
        fu:
        bne a1, a2, main_content
        #they are equal 
        #load the element in t2
        lb t2, 0(a1)
        #check
        bne t2, a0, neq
        eq:
            add a0, a1, x0
            jalr x0, ra, 0
        
        neq:
            addi a0, x0, -1
            jalr x0, ra, 0
    
    main_content:
        #let t6 be mid address
        #t6 = a1/2 + (a2-a1)/2
        addi t4, x0, 2
        add t6, a1, x0
        sub t5 , a2, a1
        div t5, t5, t4
        add t6, t6, t5                          # t6 = a1/2 + (a2-a1)/2
        
        lb t2, 0(t6)                            # t2 = element at t6
        
       
        # check and recursively call it
        addi sp, sp, -4
        sw ra, 0(sp)
        
        beq t2, a0, equal
        ble t2, a0, less
        bge t2, a0, great
        less:
            addi a1, t6, 1
            jal ra, Bsearch
            lw ra, 0(sp)
            addi sp, sp, 4
            jalr x0, ra, 0
            #exit since used jalr
        great:
            addi a2, t6, -1
            jal ra, Bsearch
            lw ra, 0(sp)
            addi sp, sp, 4
            jalr x0, ra, 0
            #exit since used jalr
        
        equal:
            #update a0
            add a0, x0, t6
            
            lw ra, 0(sp)
            addi sp, sp, 4
            jalr x0, ra, 0
        




main:
    
    addi a0, x0, 2
    jal ra, Bsearch
    ecall