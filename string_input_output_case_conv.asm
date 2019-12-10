.MODEL SMALL
.STACK 100H
.DATA
	X DB 30 DUP ('\n')
	MSG DB "ENTER A STRING:$"

.CODE
MAIN PROC
	MOV AX, @DATA
	MOV DS, AX
	
	MOV AH,9
	LEA DX, MSG
	INT 21H
	
	MOV SI,0
	MOV AH,1
NEXT:
	INT 21H
	CMP AL,0DH
	JZ EXIT
	
	MOV X[SI], AL
	INC SI
	JMP NEXT
EXIT:
;print a new line

	MOV AH, 2
	MOV DL, 0AH
	INT 21H
	MOV DL, 0DH
	INT 21H
	
;comparing
	MOV DI, 0
LEVEL:
L1: CMP X[DI],'A'
    JL L
    CMP X[DI],'Z'
    JG L2
    ADD X[DI], 32
    JMP L
L2: CMP X[DI],'a'
    JL L
    CMP X[DI],'z'
    JG L
    SUB X[DI], 32
L:  INC DI
	CMP DI,SI
	JB LEVEL
	
;Output
	MOV DI, 0
	MOV AH,2
NEXT2:
	MOV DL, X[DI]
	INT 21H
	INC DI
	CMP DI,SI
	JB NEXT2
	
;Output 
DEC SI
;print a new line

	MOV AH, 2
	MOV DL, 0AH
	INT 21H
	MOV DL, 0DH
	INT 21H
	;MOV DI, 0
	MOV AH,2
NEXT3:
	MOV DL, X[SI]
	INT 21H
	DEC SI
	CMP SI,-1
	JG NEXT3
	
	MOV AH,4CH
	MAIN ENDP
	END MAIN
	
	
	
	