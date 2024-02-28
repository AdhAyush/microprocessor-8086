TITLE
;--------------------------
    .MODEL SMALL
    .STACK 32
    .DATA
ASK DB "ENTER THE NUMBER (N): $"
RESULT DB "THE SUM OF NUMBERS FROM 1 TO N IS: $"
RES DW 00H 
NEWLINE DB 0AH, '$'
;---------------------------
    .CODE

    MOV AX,@DATA
    MOV DS,AX

    MOV AH,01
    INT 21H
    SUB AL,30H ;ASCII TO DIGIT
    MOV CX, AX

    MOV BL 02
SUM: MOV AL, BL
    MUL AL
    AAM
    MUL 02H
    AAM
    ADD RES, AX
    DAA
    INC BL
    LOOP SUM

MOV CX,04
MOV AL,RES
MOV AH,0
MOV BX,0
;Find each decimal digit of the number and store in stack

L4: MOV DX,0
DIV CX ;Divide by 10
ADD DX,30H ;Convert the digit to characters
PUSH DX ;Store the decimal digit in the stack

INC BX
CMP AX,0 ;Stop if the number is <= 0
JA L4
;Get characters from stack and display as decimal number
MOV AH,02
MOV CX,BX
DISP: POP DX
INT 21H ;Display the character
LOOP DISP

    MOV AX, 4C00H
    INT 21H
MAIN ENDP
      END MAIN