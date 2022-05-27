
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

welcomeMessage:
    mov al, 1
	mov bh, 0
	mov bl, 1011b
	mov cx, pressEnter - offset msg ; calculate message size. 
	mov dl, 0
	mov dh, 0
	push cs
	pop es
	mov bp, offset msg
	mov ah, 13h
	int 10h
	jmp pressEnter
	msg db " Welcome To the OS"
	

pressEnter:
    mov ah, 1
	int 21h

welcomeMessage2:    
    mov al, 1
	mov bh, 0
	mov bl, 1011b
	mov cx, break - offset msg2 ; calculate message size. 
	mov dl, 0
	mov dh, 0
	push cs
	pop es
	mov bp, offset msg2
	mov ah, 13h
	int 10h
	jmp break
	msg2 db " Changed your mind?" 


break:
   mov ah, 1
   int 21h

askName:    
    mov al, 1
	mov bh, 0
	mov bl, 1011b
	mov cx, msgEnd - offset msg3 ; calculate message size. 
	mov dl, 0
	mov dh, 0
	push cs
	pop es
	mov bp, offset msg3
	mov ah, 13h
	int 10h
	jmp msgEnd
	msg3 db " Please Enter Your name: " 

msgEnd:
	
          

getName:
    mov ah, 1
	int 21h

    
    

ret




