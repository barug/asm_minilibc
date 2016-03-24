[BITS 64]
	global memset
	section .text

memset:
	mov rcx, 0
	mov rax, rsi
loop:
	cmp rdx, 0
	je return
	mov [rdi+rcx], al
	dec rdx
	inc rcx
	jmp loop

return:	
	mov rax, rdi
	ret
