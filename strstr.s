[BITS 64]
	global strstr
	section .text

strstr:
	mov rcx, -1

main_loop:
	inc rcx
	mov rax, 0
	movzx r8, byte [rdi+rcx]
	cmp r8, 0
	je return_not_found
	movzx r9, byte [rsi]
	cmp r8, r9
	je equal_test
	jmp main_loop

equal_test:
	mov rax, rdi
	add rax, rcx
	mov r10, rcx
	mov rdx, 0
test_loop:	
	movzx r8, byte [rdi+r10]
	cmp r8, 0
	je return_not_found
	movzx r9, byte [rsi+rdx]
	cmp r9, 0
	je return_found
	cmp r8, r9
	jne main_loop
	inc r10
	inc rdx
	jmp test_loop
	
return_not_found:
	mov rax, 0
	ret

return_found:
	ret
