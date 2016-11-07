masm
model small
.data
.stack
.code
main:
	mov ax, @data
	mov ds, ax
	
	mov ah, 01h   
	int 21h       
	sub al, 30h
	
	mov dl, al
	xor ax, ax
	
	mov ah, 01h   
	int 21h       
	sub al, 30h
	
	xor cx, cx
	mov cl, al
	
	mov ax, 1
cycl:	
	mul dl
	jnc	m1	
	adc	ah,0	 
m1:
	loop cycl

	
exit:
	mov	ax,4c00h	
	int	21h
end main