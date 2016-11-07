.model small
.stack
print macro exp
	lea dx, exp
	mov ah, 09h
	int 21h
endm
.data
	m1 db 0ah, 0dh,"Enter the String:$"
	m2 db 0ah, 0dh,"Enter the Substring:$"
	m3 db 0ah, 0dh,"String Found$"
	m4 db 0ah, 0dh,"String not Found$"
	a db 20h dup("$");
	b db 20h dup("$");
	lenA dw 0
	lenB db 0
.code
main:
	mov ax, @data
	mov ds, ax
	mov es, ax
	mov si, 0
	mov di, 0
	print m1

LoopReadString:  
	mov ah, 01h
	int  21h
	mov a[si], al
	inc si
	inc lenA
	cmp al, 0dh
	jne LoopReadString
   
	print m2

LoopReadSubString:  
	mov ah, 01h
	int  21h
	mov b[di], al
	inc di
	inc cl
	cmp al, 0dh
	jne LoopReadSubString

	mov lenB, cl
	mov si, 0
	mov di, 0
	mov ax, 0

loop3:  
	mov bh, a[si]
	mov bl, b[di]
	inc si
	inc di
	cmp bh, bl
	jne l1
	loop loop3
	jmp l2

l1:        
	inc ax
	mov si, ax
	mov cl, lenB
	mov di, 0
	mov bx, lenA
	cmp ax, bx
	jl loop3
	jmp l3

l2:       
	print m3
	jmp exit

l3: 
	print m4

exit:        
	mov ah, 4ch
	int 21h
end main