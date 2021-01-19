;Subtracting two 8 bit BCD numbers

assume cs: code, ds: data

data segment
	opr1 db 23h
	opr2 db 54h
	result db 00h
	carry db 00h
data ends

code segment
	org 0100h
start:  mov ax, data
	mov ds, ax
	mov al, opr1
	mov bl, opr2
	mov ch, 00h
	sub al, bl
	das
	jnc here
	neg al
	das
	inc ch

here:   mov result, al
	mov carry, ch
	mov ah, 4ch
	int 21h
	code ends

end start