model small
.stack 256
.data
cnt db 0
delim dw 5
.code
main:
	mov ax, @data
	mov ds, ax
	
	xor cx, cx    ;занулява cx
	mov cx, 10    ;брояч на цикъла 
input:
	mov ah, 01h   ;казва му да чете
	int 21h       ;прекъсва
	sub al, 30h   ;прави го на число а не ASCII код
	mov ah, 0     ;нулира ah за да пушне само al
	push ax       ;пушва целия регистър
	
	loop input

	xor cx, cx   ;отново нулира брояча
	mov cx, 10   ; дава ст-ст на брояча
counting:
	pop dx
	cmp dx, delim
	jle m1
	loop counting
	
	jcxz exit	;jump ако cx е нула за да е сигурно че няма безкраен цикъл
m1: 
	inc cnt
	
	loop counting
exit:
	add cnt, 30h
	
	mov dl, cnt
	mov ah, 02h
	int 21h
	
	mov	ax,4c00h
	int	21h
end main
