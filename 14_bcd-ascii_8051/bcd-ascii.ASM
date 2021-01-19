; BCD to ASCII conversion

MOV A, R0
ANL A, #0F0h
SWAP A    ; swaps lower-order and higher-order nibbles
ADD A, #30H
MOV R1, A

MOV A, R0
ANL A, #0Fh
ADD A, #30H
MOV R2, A
