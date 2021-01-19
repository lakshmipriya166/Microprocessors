;Matrix subtraction
assume cs: code, ds: data

data segment
	m1 dw 0006h, 0005h, 0004h, 0003h, 0002h, 0001h  
	org 0010h
	m2 dw 0001h, 0002h, 0003h, 0004h, 0005h, 0006h
	org 0020h
	r1 db 03h
	c1 db 02h
	r2 db 03h
	c2 db 02h
data ends

code segment
	org 0100h
start:  mov ax, data
	mov ds, ax
	mov al, r1
	mov bl, r2
	cmp al, bl
	jnz exit1

	mov al, c1
	mov bl, c2
	cmp al, bl
	jnz exit1
	mov si, offset m1
	mov di, offset m2
	mov al, r1
	mov bl, c1
	mul bl
	mov cx, ax

lstart: mov al, [si]
	mov bl, [di]
	mov ah, 00h
	mov bh, 00h
	sub ax, bx
	jnc here
	mov [si + 0041h], 01h

here:   mov [si + 0030h], al
	inc si
	mov [si + 0030h], ah
	inc si
	inc di
	inc di
	loop lstart 

exit1:	mov ah, 4ch
	int 21h
	code ends
end start
end exit1