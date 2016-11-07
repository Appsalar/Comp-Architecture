masm
model small
.stack 100h
.data
text  db 50 dup (" ")
handler db 0
filename db "name.TXT"
point_fname	dd	filename
point_text	dd	text
.code  
main:        
	mov ax, @data
	mov ds, ax
	xor ax, ax
	xor dx, dx
	xor bx, bx
	xor cx, cx
	
	mov ah,3dh
	mov cl,2
	lds dx, point_fname
	int 21h
	mov  handler, al
	
	mov ah, 3fh
	mov cl, 15
	mov bl, handler 
	lds dx, point_text
	int 21h
	
	mov ah,09
	lea dx, text
	int 21h
	

	mov ax, 4c00h
	int 21h  
  
 end main