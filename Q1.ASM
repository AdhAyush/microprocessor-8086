TITLE PRINT09[EXE]
;----------------------------------
        .MODEL SMALL
        .STACK 32H
;----------------------------------
        .DATA
STRING DB 'PROGRAMMING IS FUN$'
;----------------------------------
        .CODE
MAIN PROC FAR
        MOV AX, @DATA
        MOV DS, AX
        LEA DX, STRING
        MOV AH, 09
        INT 21H
        MOV AX, 04C00H
        INT 21H

        MAIN ENDP
END MAIN
