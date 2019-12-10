.MODEL SMALL
.STACK 100H
.DATA
MSG DB "ENTER A STRING:$"

.CODE

MAIN PROC
MOV AX, @DATA
	MOV DS, AX
	
	MOV AH,9
	LEA DX, MSG
	INT 21H
;input a character
MOV AH, 1
INT 21H
MOV BL,AL  ; storing input into temporary register

;print a new line

MOV AH, 2
MOV DL, 0AH
INT 21H
MOV DL, 0DH
INT 21H

;comparing
L1: CMP BL,'A'
    JL L
    CMP BL,'Z'
    JG L2
    ADD BL, 32
    JMP L
L2: CMP BL,'a'
    JL L
    CMP BL,'z'
    JG L
    SUB BL, 32
L: MOV DL, BL
INT 21H
MOV AH, 4CH
INT 21H


MOV AH,4CH
MAIN ENDP
END MAIN


