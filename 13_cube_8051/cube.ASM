;Cube of 8-bit number between 0 - F

MOV A, R0
MOV B, R0
MUL AB ;(BA = A x B)
MOV B, R0
MUL AB ;(BA = A x B)
MOV R2, B
MOV R3, A
