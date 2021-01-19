;Searching a byte in a string and outputting zero if the given byte is not found in the string or else its index of first occurrence

assume cs: code, ds: data, es: extra

data segment
	count dw 0006h
	org 0010h
	str1 db 55h
	org 0020h
	index dw 0000h
data ends

extra segment
	str2 db 11h, 22h, 33h, 44h, 55h
extra ends

code segment
	org 0100h
start:  mov ax, data
	mov ds, ax
	mov ax, extra
	mov es, ax

	mov cx, count

	mov al, str1
	mov di, offset str2

	cld

	repne scasb

	mov index, cx

	mov ah, 4ch
	int 21h
code ends

end start