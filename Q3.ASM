TITLE READSTR[EXE]
;------------------------------
        .MODEL SMALL
        .STACK 32
;------------------------------
        .DATA
        MAX_LEN DB 20
        ACT_LEN DB ?
        STRING DB 20 DUP('$')
        NEWLINE DB 0AH, '$'
;------------------------------
        .CODE
MAIN PROC FAR
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 0AH
        LEA DX, MAX_LEN
        INT 21H

        LEA DX, NEWLINE
        MOV AH, 09H
        INT 21H
        LEA DX, STRING
        MOV AH,09H
        INT 21H
     
        MOV AX, 4C00H
        INT 21H

        MAIN ENDP
END MAIN
