;Multiplying two 16 bit numbers

assume cs: code, ds: data

data segment
	opr1 dw 1111h
	opr2 dw 0F999h
	result dd 00000000h
data ends

code segment
	org 0100h
start:  mov ax, data
	mov ds, ax
	mov ax, opr1
	mov bx, opr2
	mul bx
	mov word ptr result, ax
	mov word ptr result+2, dx
	mov ah, 4ch
	int 21h
	code ends

end start