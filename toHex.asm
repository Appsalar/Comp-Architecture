masm
model small
.stack
.data
a	db 0
ten db 10
.code
main:
	mov ax, @data
	mov ds, ax
	
	mov ah, 01h   
	int 21h       
	sub al, 30h   
	mov ah, 0
	mul ten
	mov a, al
	xor ax, ax
	
	mov ah, 01h   
	int 21h       
	sub al, 30h   
	mov ah, 0
	
	add al, a
	mov a, al
	
printNewLine:
	mov dl, 10
	xor ax, ax
	mov ah, 02h
	int 21h
	
	xor ax, ax
	mov al, a
	
	shr al, 4
	cmp al, 0
	je printsecond
	
	add al, 30h
	mov dl ,al
	xor ax, ax
	mov ah, 02h
	int 21h

	
printsecond:

	mov al, a
	
	shl al, 4
	mov ah, 0
	shr al, 4
	
	cmp al, 10
	
	jl lessThanTen 
	;case >= 10
	add al, 57h
	jmp print
	
lessThanTen:
	add al, 30h

print:	
	mov dl, al
	xor ax, ax
	mov ah, 02h
	int 21h
	
	
	mov dl, 10
	xor ax, ax
	mov ah, 02h
	int 21h
	
binpart:
	xor ax, ax
	mov al, a
	
	;mov dl, 0
	xor cx, cx    ;занулява cx
	mov cx, 8    ;брояч на цикъла 
	
	
cycle:
	shl a, 1
	mov al, 30h
	jnb continue
	inc al
continue:
	mov dl, al
	xor ax, ax
	mov ah, 02h
	int 21h
	
	loop cycle
	
	
	mov ax, 4c00h
	int 21h
end main
	