;Adding two 8 bit numbers

	MOV R3, #00
	MOV A, R1 	;input1
	ADD A, R2 	;input2
	JNC LABEL
	INC R3
LABEL: 	MOV R4, A