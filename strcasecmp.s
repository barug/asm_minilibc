[BITS 64]
	global strcasecmp
	section .text

strcasecmp:
	mov rcx, 0
	mov r8, rdi

loop:
	movzx rdi, BYTE [r8+rcx]
	call check_case
	mov r9, rax
	movzx rdi, BYTE [rsi+rcx]
	call check_case
	mov rdx, rax
	cmp r9 , 0
	je end_test
	cmp rdx, 0
	je end_test
	cmp rdx, r9
	jne end_test
	inc rcx
	jmp loop
	
end_test:
	sub r9, rdx
	mov rax, r9
	ret

	
check_case:
	cmp rdi, 65
	jge condition_1_maj
	jmp case_return
	
condition_1_maj:		
	cmp rdi, 90
	jle to_lowercase
	jmp case_return
	
to_lowercase:
	add rdi, 32
	jmp case_return

case_return:
	mov rax, rdi
	ret
	
