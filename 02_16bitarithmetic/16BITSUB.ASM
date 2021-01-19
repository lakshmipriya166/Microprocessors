;Subtracting two 16 bit numbers

assume cs: code, ds: data

data segment
	opr1 dw 1111h
	opr2 dw 0F999h
	result dw 00h
	carry db 00h
data ends

code segment
	org 0100h
start:  mov ax, data
	mov ds, ax
	mov ax, opr1
	mov bx, opr2
	mov ch, 00h
	sub ax, bx
	jnc here
	neg ax
	inc ch

here:   mov result, ax
	mov carry, ch
	mov ah, 4ch
	int 21h
	code ends

end start