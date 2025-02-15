.data 
#here data will be initialized
message: .asciiz "Hello, World!"

.text
    #here the instruction will be written
    main: 
        addi x5, x0, 10
        add x6, x5, x0
    j main
    #j main is a jump statement to main. This code is infinite loop