TITLE PRINTCHAR[EXE]
;------------------------------------
        .MODEL SMALL
        .STACK 32
        .DATA
STRING DB 'PROGRAMMING IS FUN'
LEN DW $-STRING
;------------------------------------
        .CODE
MAIN PROC FAR
        MOV AX, @DATA
        MOV DS, AX
        MOV CX, LEN
        MOV BX, OFFSET STRING   ;MOV BX,00
        
NEXT1:  MOV DL, [BX]   ;MOV DL, STRING[BX]
        MOV AH, 02H
        INT 21H
        INC BX
        LOOP NEXT1

        MOV AX, 4C00H
        INT 21H
MAIN ENDP
      END MAIN

