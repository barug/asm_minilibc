[BITS 64]
	global memcpy
	section .text

memcpy:
	mov rcx, 0

loop:
	cmp rcx, rdx
	je return
	mov al, [rsi+rdx]
	mov [rdi+rcx], al
	inc rcx
	jmp loop

return:
	mov rax, rdi
	ret
