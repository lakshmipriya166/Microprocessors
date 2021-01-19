;Dividing two 16 bit numbers

assume cs: code, ds: data

data segment
	opr1 dw 0FFFFh
	opr2 dw 2222h
	result dw 0000h
	rem dw 0000h
data ends

code segment
	org 0100h
start:  mov ax, data
	mov ds, ax
	mov dx, 0000h
	mov ax, opr1
	mov bx, opr2
	div bx

	mov result, ax
	mov rem, dx
	mov ah, 4ch
	int 21h
	code ends

end start