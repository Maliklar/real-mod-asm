
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h 

 mov ax, 1
	int 16     ; set graphics video mode.
	
    mov ax, 0
    int 33h  
    
mov ax, 1
int 33h

	mov ah, 0eh
	mov al, 'n'
	int 10h
	

call _main
	
_main:

 
    mov ax, 0
    int 33h
    
    
    
    CMP ax, 0
    JE _notset
    
    mov ax, 0003
    int 33h
    
    CMP bx, 1
    JE _click      
	
	
	
	jmp _main
	
	
_click:
    mov ah, 0eh
	mov al, 'c'
	int 10h
	
	jmp _main
	
	
_notset:
   mov ah, 0eh
	mov al, 'o'
	int 10h
	
	jmp _main


