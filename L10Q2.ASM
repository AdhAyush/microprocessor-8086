TITLE
;--------------------------
    .MODEL SMALL
    .STACK 32
    .DATA
 NUM DB 0

;---------------------------
    .CODE
MAIN PROC FAR
    MOV AX,@DATA
    MOV DS,AX

UP:  MOV AH,01
    INT 21H
    CMP AL, 0DH
    JE DOWN
    SUB AL, 30H
    PUSH AX
    MOV AL, 10
    MUL NUM
    POP AX
    ADD NUM, AL
    JMP UP

    MOV AL, 01

 DOWN: MOV CL, NUM
    MOV CH, 00H
    MOV BX, 00h
    MOV DL, 02
    MOV DH, 02H
MUL_LOOP:  MOV AL, DL
    MUL DL
    MUL DH

    ADD BX, AX
    INC DL
    LOOP MUL_LOOP

; DECIMAL CONVERSION
    MOV AX, BX
    MOV BX, 00h
    MOV CX, 10

DECIMAL:   MOV DX, 00h
    DIV  CX
    PUSH DX
    INC BX
    CMP AX, 00h
    JNE DECIMAL


;convert digit to ascii
    MOV CX, BX
ASCII:    POP DX
    ADD DL, 30H
    MOV AH, 02
    INT 21H
    LOOP ASCII

    MOV AX, 4C00H
    INT 21H
MAIN ENDP
      END MAIN