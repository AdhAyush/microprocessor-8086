TITLE
;--------------------------
    .MODEL SMALL
    .STACK 32
    .DATA
ASK DB "ENTER THE NUMBER (N): $"
RESULT DB "THE SUM OF NUMBERS FROM 1 TO N IS: $"
NEWLINE DB 0AH, '$'
;---------------------------
    .CODE

    MOV AX,@DATA
    MOV DS,AX

    MOV AH,01
    INT 21H

    SUB AL,30H ;ASCII TO DIGIT
    MOV CX, AX

    MOV AX, 0000H
SUM: ADD AX, CX
    DAA
    LOOP SUM



    

