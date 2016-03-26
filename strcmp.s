[BITS 64]
	global strcmp
	section .text

strcmp:
	mov rcx, 0

loop:
	movzx rax, BYTE [rdi+rcx]
	movzx rdx, BYTE [rsi+rcx]
	cmp rax, 0
	je end_test
	cmp rdx, 0
	je end_test
	cmp dl, al
	jne end_test
	inc rcx
	jmp loop
	
end_test:
	sub rax, rdx
	ret
