ORG    100h    ; instruct compiler to make simple single segment .com file.

_read:



mov ah, 1
int 21h


CMP al, 13
JE _newLine




CMP al, 8 ; check if backspace pressed
JE call _remove



jmp _read


_remove:
mov ah, 0ah
mov al, ' '
int 10h

mov ah, 03h
int 10h
cmp dl, 0
JE _backLine

call _read

_newLine:

; getting cursor position

mov preLinePos, dl

inc scPos
mov ah, 2
mov dh, scPos
mov dl, 0
int 10h




call _read


_backLine:
dec scPos
mov ah, 2
mov dh, scPos
mov dl, preLinePos

int 10h
call _read


_end:
ret               ; returns to operating system.


data:
scPos db 0
preLinePos db 0
nextLinePos db 0



; [SOURCE]: C:\emu8086\MySource\textEditor.asm
