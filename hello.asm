global _start 				
					
section .data				
	hello_str db "hello, world!"		
	str_len equ $ - hello_str	
					
	err_str db "Error"		
	err_len equ $ - err_str 	
					
section .text				
_start:					
	mov rax, 1			
	mov rdi, 1			
	mov rsi, hello_str		
	mov rdx, str_len 		
	syscall				
					
	cmp rax, rdx			
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
