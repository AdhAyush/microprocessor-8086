TITLE SUM16BIT[EXE]
;-----------------
    .MODEL SMALL
    .STACK 32
;----------------
    .DATA
    ARRAY DW 10 DUP(1)
;-----------------
    .CODE

MAIN PROC FAR
    MOV AX, @DATA
    MOV DS, AX
    MOV BX, 00

    MOV AX, 0000H
    MOV CX, 0AH

NEXT:ADD AX, ARRAY[BX]
    INC BX
    INC BX
    LOOP NEXT

    MOV AX, 4C00H
    INT 21H
    MAIN ENDP
END MAIN
