;Sorting in ascending order
assume cs: code, ds: data

data segment
	arr db 06h, 05h, 04h, 03h, 02h, 01h
	org 0010h
	count db 06h
data ends

code segment
	org 0100h
start:  mov ax, data
	mov ds, ax

	mov cl, count 
	dec cl

label1:	mov si, offset arr
	mov ch, count
	dec ch
label2: mov al, [si]
	inc si
	cmp al, [si]
	jc label3
	xchg al, [si]
	dec si
	xchg al, [si]
	inc si
label3: dec ch
	jnz label2
	dec cl
	jnz label1

	mov ah, 4ch
	int 21h
	code ends
end start
end exit1