.MODEL SMALL
.STACK 100H    

.DATA
	str DB 80 DUP ?
	MSG DB "ENTER A LETTER STRING WITH SAME CASE: $"
	RES DB "Ascending Order: $" 
.CODE   
    MAIN PROC
    MOV AX, @DATA
	MOV DS, AX
	
	MOV AH,9
	LEA DX, MSG
	INT 21H
	
	MOV AH,1
	
NEXT:
	INT 21H
	CMP AL,0DH
	JZ EXIT
	
	MOV str[SI], AL
	
	INC SI
    JMP NEXT
	
	EXIT:
	;DEC SI
	MOV CX, SI
	;sorting
	
LOP1:
	DEC SI
	MOV DI,SI
	;INC SI
LOP2:
    DEC DI
	MOV BL, str[SI]
	CMP BL, str[DI]
	JG SKIP
	XCHG BL, str[DI]
	MOV str[SI],BL
	
SKIP:
    CMP DI,0
    ;JE S2
	;DEC DI
	JNE LOP2
S2:	;DEC SI
    CMP SI,1
	JG LOP1
	 
	 
;print a new line

	MOV AH, 2
	MOV DL, 0AH
	INT 21H
	MOV DL, 0DH
	INT 21H
	
	MOV AH,9
	LEA DX, RES
	INT 21H
;Output

	MOV DI, 0
	MOV AH,2
NEXT2:
	MOV DL, str[DI]
	INT 21H
	INC DI
	CMP DI,CX
	JB NEXT2
	
	MOV AH,4CH
	MAIN ENDP
	END MAIN
    
    