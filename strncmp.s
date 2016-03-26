[BITS 64]
	global strncmp
	section .text

strncmp:
	mov rcx, 0

loop:
	movzx rax, BYTE [rdi+rcx]
	movzx r8, BYTE [rsi+rcx]
	cmp rax, 0
	je end_test
	cmp r8, 0
	je end_test
	cmp rax, r8
	jne end_test
	cmp rcx, rdx
	je end_test
	inc rcx
	jmp loop
	
end_test:
	sub rax, r8
	ret
