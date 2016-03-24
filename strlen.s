[BITS 64]
	global strlen
	section .text

strlen:
	push rbp
	mov rbp, rsp
	mov rax, -1

loop:
	inc rax
	mov dl, [rdi+rax]
	cmp dl, 0
	jne loop

	mov rsp, rbp
	pop rbp
	ret
