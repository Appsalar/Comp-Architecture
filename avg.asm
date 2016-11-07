masm
model small
.data
mas db 1, 2, 3, 114, 125, 105, 6, 40, 4, 5
len db 10
.code
main:
	mov ax, @data
	mov ds, ax
	
	mov cx, 10	
	xor ax, ax
	xor si, si

cycl:	
	add	al,mas[si]
	jnc	m1	
	adc	ah,0	 
m1:
	inc si
	loop cycl
	
	div len
	
exit:
	mov	ax,4c00h	
	int	21h
end main