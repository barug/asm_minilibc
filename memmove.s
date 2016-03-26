[BITS 64]
	global memmove
	section .text

memmove:
	mov rcx, rdx
	sub rcx, 1
	
loop_save:
	cmp rcx, -1
	je make_copy
	movzx r8, byte [rsi+rcx]
	push r8
	dec rcx
	jmp loop_save

make_copy:	
	mov rcx, 0
	
loop_copy:
	cmp rcx, rdx
	je return
	pop rax
	mov [rdi+rcx], al
	inc rcx
	jmp loop_copy
	
return:
	mov rax, rdi
	ret
