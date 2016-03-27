[BITS 64]
	global strlen
	section .text

strlen:
	mov rax, -1

loop:
	inc rax
	mov dl, [rdi+rax]
	cmp dl, 0
	jne loop

	ret
