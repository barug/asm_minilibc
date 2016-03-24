[BITS 64]
	global strchr

	section .text

strchr:
	push rbp
	mov rbp, rsp
	
	mov rcx, -1
	mov rdx, 0
	
loop_chr:
	inc rcx
	mov dl, [rdi+rcx]
	cmp rdx, rsi
	je found_character
	cmp dl, 0
	jne loop_chr

	mov rax, 0
	jmp return


found_character:
	mov rax, rdi
	add rax, rcx
	jmp return

return:
	mov rsp, rbp
	pop rbp
	ret
