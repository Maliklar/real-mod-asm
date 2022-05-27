
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
        
_initial:
    mov al, 13h
	mov ah, 0
	int 10h     ; set graphics video mode.
	
	
_event:
     
	    
	
	mov ah, 00h
	int 16h
	
	CMP al, 'd'
	JE _moveRight
	
	CMP al, 'w'
	JE _moveUp
	
	CMP al, 'a'
	JE _moveLeft
	
	CMP al, 's'
	JE _moveDown
	
	
	
	
	jmp _event


_moveRight:
    
    
    
    INC xP
    mov al, 1100b
	mov cx, xP
	mov dx, yP
	mov ah, 0ch
	int 10h     ; set pixel
	
	jmp _event
	
	
	
_moveUp:
    
    
    CMP yP, 0
    JE _event
    DEC yP
    mov al, 1100b
	mov cx, xP
	mov dx, yP
	mov ah, 0ch
	int 10h     ; set pixel
	
	jmp _event
	
	
_moveDown:
    
    
    
    INC yP
    mov al, 1100b
	mov cx, xP
	mov dx, yP
	mov ah, 0ch
	int 10h     ; set pixel
	
	jmp _event
	

_moveLeft:
    
    
    CMP xP, 0
    JE _event
    DEC xP
    mov al, 1100b
	mov cx, xP
	mov dx, yP
	mov ah, 0ch
	int 10h     ; set pixel
	
	jmp _event


	
data:
    xP dw 0
    yP dw 0

ret




