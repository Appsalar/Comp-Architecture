masm
model small
.stack 100h
.data

text db 100 dup(?)
len_string db 0
handler dw ?
filename db "name.txt",0
point_fname	dd	filename
point_text	dd	text
.code  
main:        
	mov  ax,@data
	mov  ds,ax
	
	lea si, text
	mov cl, 0
	
LoopReadMainString:
    mov ah, 01h 
    int 21h 

    cmp al, 0dh              
    mov len_string, cl     
    je next                 
    mov [si], al             
    inc si                  
    inc cl                  
    jmp LoopReadMainString
	
next:
	xor ax, ax
	xor dx, dx
	xor bx, bx
	xor cx, cx

	mov  ah, 3ch
	mov  cx, 00h
	lds  dx, point_fname 
	int  21h  
	mov  handler, ax

	mov  ah, 40h
	mov  bx, handler
	mov  cl, len_string  
	lds	 dx, point_text 
	int  21h

	mov  ah, 3eh
	mov  bx, handler
	int  21h      

	mov  ax, 4c00h
	int  21h  
  
 end main