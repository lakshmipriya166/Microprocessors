;Moving a string of bytes

assume cs: code, ds: data, es: extra

data segment
	count dw 0005h
	str1 db 11h, 22h, 33h, 44h, 55h
data ends

extra segment
	str2 db 5 dup(0)
extra ends

code segment
	org 0100h
start:  mov ax, data
	mov ds, ax
	mov ax, extra
	mov es, ax

	mov cx, count

	mov si, offset str1
	mov di, offset str2

	cld

	rep movsb

	mov ah, 4ch
	int 21h
code ends

end start