#code to detect if a given string is palindrome or not

.data 

NO:
.asciiz "No"
YES:
.asciiz "Yes"
st: .asciiz "abcddcbz"
.text
#find if palindrome using recursion

#store string value in a0

auipc s8, 65536
addi s8, s8, 0
auipc s7, 65536
addi s7, s7, -5
auipc a0, 65536
addi a0, a0 ,-9



lui s9, 0x10000
addi s9, s9, 0x100
#store yes / no answer in s9

#let s8 have vlaue no
#let s7 have value yes


add a1, a0, x0
add t2, x0, x0

jal ra, while
#a1 have length of string 
#a0 have strating address
add x0, x0, x0
check_palindrome:
    #starting address is in a0
    #t0 is first letter
    lb t0, 0(a0)
    
    #t1 is last letter
    add t1, a1, a0
    addi t5, x0, 1
    sub t1, t1, t5
    lb t1, 0(t1)
    
    bne t1, t0, no
    # if equal then reduce length by two and increasea address by 4
    addi t0, x0, 3
    ble a1, t0, yes
    
    #a1-=2
    addi t0, x0, 2
    sub a1, a1, t0
    
    #a0+=4
    addi a0, a0, 1
    jal x0, check_palindrome
    
 yes: 
    lw s7, 0(s7)
    sw s7, 0(s9)
   
    jal x0, exit
 no:
    lw s7, 0(s7)
    sw s7, 0(s9)
   
    jal x0, exit
 
    
 
 #write a function to find the length of string if starting address is in a1, save the length in a1. only use temp resistors in process ( but keep t2 = 0 before calling this)
 while:
    lb t0, 0(a1)
    addi t1 , x0, 0x00
    beq t1, t0, found
    addi t2, t2, 1
    addi a1, a1, 1
    
    jal x0, while
    
    found:
        add a1, t2, x0
        #return to ra
        jalr x0, ra, 0
 
exit: 
    add x0, x0, x0
    
    
    