.model tiny
.code
org 100h

;PASSWORD: Only ashes know what it means to burn to the ground

start:

    mov cx, 0
    mov si, 0
    mov ax, 0
    mov dx, 0

    mov bx, offset buffer

    jmp Input 

After_input:

    mov cx, 0
    mov si, 0
    mov ax, 0
    mov bx, 0
    mov dx, 0

    mov di, offset password_table
    push cx
    mov cl, ch 
    mov ch, 0

    add di, cx
    add di, cx
    mov bx, [di]

    mov di, offset len_table
    add di, cx
    pop cx
    mov cl, byte ptr [di]

    mov si, offset buffer

Next_char:
    
    mov al, byte ptr [si]
    mov dl, byte ptr [bx]

    jmp COMPARE_CHAR

;===================================================
Shift:
    inc bx
    inc si
    dec cx
    
    jmp COMPARE_SHIFT
;==================================================

msg7 db "burn to "

;===================================================
Input:
    mov ah, 01h
    int 21h

    cmp al, 08h
    je Back

    cmp al, 0dh
    je After_input

    mov byte ptr [bx], al
    inc bx
    
    jmp Input
;==================================================
Back:
    dec bx

    jmp Input
;==================================================
PRINT_FAIL:
    mov dx, offset fail
    mov ah, 09h
    int 21h
    jmp END_PROG
;==================================================

msg2 db "ashes "

;==================================================
PRINT_SUCCESS:
    mov dx, offset success
    mov ah, 09h
    int 21h
    jmp END_PROG
;==================================================

msg4 db "what "

;==================================================
END_PROG:
    mov ax, 4c00h
    int 21h
;==================================================

msg3 db "know "

;==================================================
COMPARE_CHAR:
mov di, 1
cmp di, 0
jne COMPARE_CHAR_2_PART

cmp al, dl
jne EQUAL_CHAR_1_PART

jmp PRINT_FAIL

EQUAL_CHAR_1_PART:
jmp Shift

COMPARE_CHAR_2_PART:
cmp al, dl
jne EQUAL_CHAR_2_PART

jmp Shift

EQUAL_CHAR_2_PART:
jmp PRINT_FAIL
;==================================================

msg8 db "the ground"

;==================================================
COMPARE_SHIFT:
    mov di, 1
    cmp di, 0
    jne COMPARE_SHIFT_2_PART 

    cmp cl, 0
    jne EQUAL_SHIFT_1_PART

    jmp Next_char

EQUAL_SHIFT_1_PART:

    inc ch
    jmp COMPARE_SUCCESS

COMPARE_SHIFT_2_PART:

    cmp cl, 0

    jne EQUAL_SHIFT_2_PART

    inc ch
    jmp COMPARE_SUCCESS

EQUAL_SHIFT_2_PART:
    jmp Next_char
;======================================================

msg6 db "means to "

;======================================================
CONTINUE_INPUT:
    push cx
    mov cl, ch
    mov ch, 0
    mov di, cx
    pop cx

    mov cl, byte ptr [offset len_table + di]
    shl di, 1
    add di, offset password_table
    mov bx, [di]
    jmp Next_char
;=====================================================

len_table      db 5, 6, 5, 5, 3, 9, 8, 10

;====================================================
COMPARE_SUCCESS:
    mov di, 1
    cmp di, 0
    jne COMPARE_SUCCESS_2_PART

    cmp ch, 8
    jne EQUAL_SUCCESS_1_PART

    jmp CONTINUE_INPUT

EQUAL_SUCCESS_1_PART:
    jmp PRINT_SUCCESS

COMPARE_SUCCESS_2_PART:
    cmp ch, 8
    jne EQUAL_SUCCESS_2_PART

    jmp PRINT_SUCCESS

EQUAL_SUCCESS_2_PART:
    jmp CONTINUE_INPUT
;====================================================
msg5 db "it "

success db 0ah, "Authorization was successful!!!!$"
msg1    db "Only "
fail    db 0ah, "Authorization was failed!!!$"

password_table dw msg1, msg2, msg3, msg4, msg5, msg6, msg7, msg8

buffer db 100 dup(0)

end start 