.model tiny
.code
org 100h

;;PASSWORD: The samurai has no goal, only a path  

start:
    mov cx, 0
    jmp COMPARE1

COMPARE1:
    mov ah, 1h
    int 21h

    mov bx, cx
    add bx, offset msg1

    mov dl, byte ptr [bx]
    cmp al, dl
    lahf
    and ah, 01000000b
    shr ah, 6

    inc cx
    mov bx, cx
    shl bx, 1
    add bx, offset jmp_table_msg1
    
    push ax
    push dx
    mov al, ah
    mov ah, 0 
    mul bx
    mov bx, ax
    pop dx
    pop ax

    push ax
    push dx
    mov al, ah
    mov ah, 0  
    not al
    and al, 00000001b
    mov dx, 0
    mov di, offset jmp_table_fail
    mul di
    mov di, ax
    pop dx
    pop ax

    add bx, di
    jmp [bx]

PREP_COMPARE3:
    mov cx, 0
    jmp COMPARE3



COMPARE6:
    mov ah, 1h
    int 21h

    mov bx, cx
    add bx, offset msg6

    mov dl, byte ptr [bx]
    cmp al, dl
    lahf
    and ah, 01000000b
    shr ah, 6

    inc cx
    mov bx, cx
    shl bx, 1
    add bx, offset jmp_table_msg6
    
    push ax
    push dx
    mov al, ah
    mov ah, 0 
    mul bx
    mov bx, ax
    pop dx
    pop ax

    push ax
    push dx
    mov al, ah
    mov ah, 0  
    not al
    and al, 00000001b
    mov dx, 0
    mov di, offset jmp_table_fail
    mul di
    mov di, ax
    pop dx
    pop ax

    add bx, di
    jmp [bx]

PREP_COMPARE7:
    mov cx, 0
    jmp COMPARE7

jmp_table_msg2 dw 8 dup(COMPARE2), PREP_COMPARE3
msg6 db "only "

COMPARE4:
    mov ah, 1h
    int 21h

    mov bx, cx
    add bx, offset msg4

    mov dl, byte ptr [bx]
    cmp al, dl
    lahf
    and ah, 01000000b
    shr ah, 6

    inc cx
    mov bx, cx
    shl bx, 1
    add bx, offset jmp_table_msg4
    
    push ax
    push dx
    mov al, ah
    mov ah, 0 
    mul bx
    mov bx, ax
    pop dx
    pop ax

    push ax
    push dx
    mov al, ah
    mov ah, 0  
    not al
    and al, 00000001b
    mov dx, 0
    mov di, offset jmp_table_fail
    mul di
    mov di, ax
    pop dx
    pop ax

    add bx, di
    jmp [bx]

msg2 db "samurai "
jmp_table_msg7 dw 2 dup(COMPARE7), PREP_COMPARE8

COMPARE5:
    mov ah, 1h
    int 21h

    mov bx, cx
    add bx, offset msg5

    mov dl, byte ptr [bx]
    cmp al, dl
    lahf
    and ah, 01000000b
    shr ah, 6

    inc cx
    mov bx, cx
    shl bx, 1
    add bx, offset jmp_table_msg5
    
    push ax
    push dx
    mov al, ah
    mov ah, 0 
    mul bx
    mov bx, ax
    pop dx
    pop ax

    push ax
    push dx
    mov al, ah
    mov ah, 0  
    not al
    and al, 00000001b
    mov dx, 0
    mov di, offset jmp_table_fail
    mul di
    mov di, ax
    pop dx
    pop ax

    add bx, di
    jmp [bx]


PREP_COMPARE2:
    mov cx, 0
    jmp COMPARE2

msg3 db "has "

COMPARE2:
    mov ah, 1h
    int 21h

    mov bx, cx
    add bx, offset msg2

    mov dl, byte ptr [bx]
    cmp al, dl
    lahf
    and ah, 01000000b
    shr ah, 6

    inc cx
    mov bx, cx
    shl bx, 1
    add bx, offset jmp_table_msg2
    
    push ax
    push dx
    mov al, ah
    mov ah, 0 
    mul bx
    mov bx, ax
    pop dx
    pop ax

    push ax
    push dx
    mov al, ah
    mov ah, 0  
    not al
    and al, 00000001b
    mov dx, 0
    mov di, offset jmp_table_fail
    mul di
    mov di, ax
    pop dx
    pop ax

    add bx, di
    jmp [bx]

COMPARE3:
    mov ah, 1h
    int 21h

    mov bx, cx
    add bx, offset msg3

    mov dl, byte ptr [bx]
    cmp al, dl
    lahf
    and ah, 01000000b
    shr ah, 6

    inc cx
    mov bx, cx
    shl bx, 1
    add bx, offset jmp_table_msg3
    
    push ax
    push dx
    mov al, ah
    mov ah, 0 
    mul bx
    mov bx, ax
    pop dx
    pop ax

    push ax
    push dx
    mov al, ah
    mov ah, 0  
    not al
    and al, 00000001b
    mov dx, 0
    mov di, offset jmp_table_fail
    mul di
    mov di, ax
    pop dx
    pop ax

    add bx, di
    jmp [bx]


msg4 db "no "
jmp_table_msg8 dw 4 dup(COMPARE8), END_COMPARE

PREP_COMPARE5:
    mov cx, 0
    jmp COMPARE5

COMPARE7:
    mov ah, 1h
    int 21h

    mov bx, cx
    add bx, offset msg7

    mov dl, byte ptr [bx]
    cmp al, dl
    lahf
    and ah, 01000000b
    shr ah, 6

    inc cx
    mov bx, cx
    shl bx, 1
    add bx, offset jmp_table_msg7
    
    push ax
    push dx
    mov al, ah
    mov ah, 0 
    mul bx
    mov bx, ax
    pop dx
    pop ax

    push ax
    push dx
    mov al, ah
    mov ah, 0  
    not al
    and al, 00000001b
    mov dx, 0
    mov di, offset jmp_table_fail
    mul di
    mov di, ax
    pop dx
    pop ax

    add bx, di
    jmp [bx]

PREP_COMPARE6:
    mov cx, 0
    jmp COMPARE6

jmp_table_msg3 dw 4 dup(COMPARE3), PREP_COMPARE4
msg7 db "a "

COMPARE8:
    mov ah, 1h
    int 21h

    mov bx, cx
    add bx, offset msg8

    mov dl, byte ptr [bx]
    cmp al, dl
    lahf
    and ah, 01000000b
    shr ah, 6

    inc cx
    mov bx, cx
    shl bx, 1
    add bx, offset jmp_table_msg8
    
    push ax
    push dx
    mov al, ah
    mov ah, 0 
    mul bx
    mov bx, ax
    pop dx
    pop ax

    push ax
    push dx
    mov al, ah
    mov ah, 0  
    not al
    and al, 00000001b
    mov dx, 0
    mov di, offset jmp_table_fail
    mul di
    mov di, ax
    pop dx
    pop ax

    add bx, di
    jmp [bx]

PREP_COMPARE8:
    mov cx, 0
    jmp COMPARE8

jmp_table_msg1 dw 4 dup(COMPARE1), PREP_COMPARE2
msg8 db "path"

END_COMPARE:
    mov cx, 0
    jmp Print_success

PREP_COMPARE4:
    mov cx, 0
    jmp COMPARE4

END_PROG:
    mov ax, 4c00h
    int 21h

msg1 db "The "
jmp_table_msg4 dw 3 dup(COMPARE4), PREP_COMPARE5
jmp_table_msg5 dw 6 dup(COMPARE5), PREP_COMPARE6

success db "0a417574686f72697a6174696f6e20776173207375636365737366756c212121"
           ; "Authorization was successful!!!" len = 31

Prep_success:
    mov cx, 1
    mov bx, cx
    shl bx, 1
    add bx, offset jmp_table_success
    jmp [bx]

Prep_fail:
    mov cx, 1
    mov bx, cx
    shl bx, 1
    add bx, offset jmp_table_fail
    jmp [bx]

jmp_table_msg6 dw 5 dup(COMPARE6), PREP_COMPARE7
msg5 db "goal, "

Print_success:
    mov bx, cx

    shl bx, 1
    add bx, offset success
    mov ax, 0
    mov al, byte ptr [bx]
    sub al, 30h
    
    mov bx, ax
    mov al, byte ptr [offset system + bx]
    shl ax, 4

    push ax
    mov bx, cx
    shl bx, 1
    add bx, offset success
    mov al, byte ptr [bx + 1]
    sub al, 30h
    
    mov bx, ax
    mov al, byte ptr [offset system + bx]
    
    pop bx
    add ax, bx

    mov dl, al
    mov ah, 02h
    int 21h

    inc cx
    mov bx, cx
    shl bx, 1
    add bx, offset jmp_table_success
    jmp [bx]

Print_fail:
    mov bx, cx

    shl bx, 1
    add bx, offset fail
    mov ax, 0
    mov al, byte ptr [bx]
    sub al, 30h
    
    mov bx, ax
    mov al, byte ptr [offset system + bx]
    shl ax, 4

    push ax
    mov bx, cx
    shl bx, 1
    add bx, offset fail
    mov al, byte ptr [bx + 1]
    sub al, 30h
    
    mov bx, ax
    mov al, byte ptr [offset system + bx]
    
    pop bx
    add ax, bx

    mov dl, al
    mov ah, 02h
    int 21h

    inc cx
    mov bx, cx
    shl bx, 1
    add bx, offset jmp_table_fail
    jmp [bx]

fail    db "0a0a417574686f72697a6174696f6e20776173206661696c6564"
           ;"Authorization was failed" len = 25;
system  db 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 96 - 57 dup (0), 10, 11, 12, 13, 14, 15

jmp_table_success:    dw Prep_success, 31 dup(Print_success), END_PROG
jmp_table_fail:       dw Prep_fail,    25 dup(Print_fail),    END_PROG

end start

