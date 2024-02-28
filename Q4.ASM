TITLE READPRINT[EXE]
;-----------------------------------
        .MODEL SMALL
        .STACK 32
        .DATA
STRING DB 10 DUP('$')
NEWLINE DB 0AH, '$'

;------------------------------------
        .CODE
MAIN PROC FAR
        MOV AX, @DATA
        MOV DS, AX
        MOV CX, 5
        MOV BX,00
        
NEXT1:  MOV AH, 01H
        INT 21H
        MOV STRING[BX], AL
        INC BX
        LOOP NEXT1

        LEA DX, NEWLINE
        MOV AH, 09H
        INT 21H

        MOV CX, 5
        MOV BX, 00H
NEXT2:  MOV DL, STRING[BX]
        MOV AH, 02H
        INT 21H
        INC BX
        LOOP NEXT2

        MOV AX, 4C00H
        INT 21H
MAIN ENDP
      END MAIN
