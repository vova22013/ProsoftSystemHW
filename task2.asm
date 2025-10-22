global _start

section .data
	fileName db "fileHello.txt", 0
	
	msg db "Hello, World!"
	len_msg equ $ - msg
		
	err_str db "Error"		
	err_len equ $ - err_str 
	
section .text
_start:
	mov rax, 2
	mov rdi, fileName
	mov rsi, 1h
	mov rdx, 0666q			;admin
	syscall
	
	cmp rax, 0
	jl _error
	
	mov rbx, rax			 
	mov rax, 1			
	mov rdi, rbx			
	mov rsi, msg		
	mov rdx, len_msg 		
	syscall		
	
	cmp rax, rdx				
	jnz _error
	
	mov rax, 3
	mov rdi, rbx
	syscall
	
	cmp rax, 0				
	jz _exit

_error:					
	mov rax, 1			
	mov rdi, 1			
	mov rsi, err_str		
	mov rdx, err_len		
	syscall		

_exit:					
	mov rax, 60			
	mov rdi, 0			
	syscall				
	
