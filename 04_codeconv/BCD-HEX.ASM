;BCD to Hexadecimal

assume cs: code, ds: data

data segment
        bcd db 12h
	unpack1 db 00h
	unpack2 db 00h
	hex dw 0000h
data ends

code segment
	org 0100h

start:  mov ax, data
	mov ds, ax

	;separating each value
	mov dl, bcd       
	mov al, bcd
	mov cl, 04h
	shr al, cl        ; al contains upper nibble
	and dl, 0Fh       ; dl contains lower nibble

	mov unpack1, al
	mov unpack2, dl   
	mov bl, 0ah
	mul bl            ;first number x OA

	mov dh, 00h
	add ax, dx        ;adding second number
	mov hex, ax

	mov ah, 4ch
	int 21h

	code ends
end start