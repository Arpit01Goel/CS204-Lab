lui t0, 0x00100

lui t1, 0xdeadb
lui t2, 0xeef
srli t2,t2 12

add t1, t1, t2

sw t1, 0(t0)
lw t2, 0(t0)
