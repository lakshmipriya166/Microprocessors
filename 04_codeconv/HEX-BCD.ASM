;Hexadecimal to BCD

assume cs: code, ds: data

data segment
	hex db 0ffh
	bcd2 db 00h
	bcd1 db 00h
	bcd0 db 00h
	rem db 00h
	org 0010h
	loc1 db 00h
	loc2 db 00h
data ends

code segment
	org 0100h

start:  mov ax, data
	mov ds, ax

	mov ah, 00h
	mov al, hex
	mov bl, 64h
	div bl          ;diving by 100d to get hundreds digit

	mov bcd2, al
	mov loc1, al
	mov rem, ah

	mov ah, 00h
	mov al,rem
	mov bl, 0ah     ;diving by 10d to get tens digit
	div bl

	mov bcd1, al
	mov bcd0, ah    ;remainder is ones digit

	mov cl, 04h
	shl al, cl      

	;bcd1 in al, bcd0 in ah
	or al, ah       ;ORing to get lower byte

	mov loc2, al

	mov ah, 4ch
	int 21h

	code ends
end start