;Subtracting two 8 bit numbers

	MOV R3, #00
	CLR C
	MOV A, R1
	SUBB A, R2
	JNC LABEL
	INC R3
	CPL A
	INC A
LABEL: 	MOV R4, A