;project title : BASIC QUIZ GAME
; M FASEH (54889) & MUHAMMAD SAAD (56578)
; BSCS-3b


.MODEL SMALL
.STACK 100H

.DATA
    
welcomeMsg DB '=====================================================', 0DH, 0AH
MSG1 DB '====================================================================', 0DH, 0AH
            DB '        *** WELCOME TO OUR BASIC QUIZ GAME PORTAL ***        ', 0DH, 0AH                
            DB '====================================================================', 0DH, 0AH, '$' 
MSG2 DB 'Here, We are going to ask some Basic Questions. Follow the Rules: $'  
MSG00 DB 'FIRSTLY TO PARTICPIATE THE GAME,ENTER YOUR PLAYER NAME AND ID.' , 0DH,0AH, '$'  

msgNameInput db 'Enter your name: $'
msgIDInput db 'Enter your ID: $'

msgRegister db 'YOU REGISTER SUCCESFULLY: $'  
msgWelcome DB '===============================================================================', 0DH, 0AH
            DB '                           *** WELCOME PLAYER ***        ', 0DH, 0AH                
            DB '===============================================================================', 0DH, 0AH, '$' 
            
msgName db 'Name: $'
msgID db 'ID: $'
userName db 30 DUP('$')  
userID db 20 DUP('$')   


MSG3 DB '1) For Every Correct answer you will get 1 point.$'
MSG4 DB '2) For Every Wrong answer 1 Point will cut from your total point.$'
MSG5 DB 'Press Enter to start the quiz : $'
MSG6 DB '--> CORRECT ANSWER.$'
MSG7 DB '--> WRONG ANSWER.$'
MSG8 DB 'Your Quiz is completed. Assessing your Score......$'
MSG9 DB '--> Total Score: $'
MSG10 DB 'Press 1 to Re-attempt quiz or 0 to Exit.$' 

MSG11 DB '                    ***Thank You Attempting Our Quiz***$'
MSG12 DB '--> Total Score: - $'
MSG13 DB '=> Result: $'
MSG14 DB '1> Correct Answers: $'
MSG15 DB '2> Incorrect Answers: $'  
  

Q1 DB '1. What color is a banana?: $'
QA1 DB '  a) Green b) Yellow c) Purple$'  

Q2 DB '2.  How many wheels does a bicycle have? $'
QA2 DB '   a) 2 b) 4 c) 3$'  

Q3 DB '3. What shape has three sides? $'
QA3 DB '  a) Circle b) Square c) Triangle$'

Q4 DB '4. What do you use to brush your teeth?$'
QA4 DB '  a) Fork b) Spoon c) Toothbrush$' 

Q5 DB '5. How many Continents are there in the world?$'
QA5 DB '   a) 7   b) 10   c) 4$'  

Q6 DB '6. Who was the first man to step on the moon?$'
QA6 DB '   a) Dracula  b) John Cena  c) Neil Armstrong$'

Q7 DB '7. A Scientist who studies Rock is called:$'
QA7 DB '   a) Writer  b) Geologist  c) Dentists$' 

Q8 DB '8. What is the opposite of hot?$'
QA8 DB '  a) Cold b) Warm c) Spicy$'

Q9 DB '9. What color is the sky?$'
QA9 DB '  a) Green b) Blue c) Red$'
'
Q10 DB '10. 56 divided by 8 is:$'
QA10 DB '   a) 7   b) 9   c) 6$'


.CODE  

MAIN PROC 
    
    MOV AX,@DATA
	MOV DS,AX
	
	CALL NL
    
	LEA DX,MSG1
	MOV AH,9
	INT 21H
	
	CALL NL
    
	LEA DX,MSG2
	MOV AH,9
	INT 21H
    
	CALL NL 
	call nl
    
	LEA DX,MSG3
	MOV AH,9
	INT 21H
    
    CALL NL  
    call nl
    
	LEA DX,MSG4
	MOV AH,9
	INT 21H  
	call nl
	 call nl
	 
	 call nl 
	
    LEA DX,MSG00
	MOV AH,9
	INT 21H  
	call nl
	
	lea dx, msgNameInput
mov ah, 09h
int 21h  

lea dx, userName
mov ah, 0Ah
int 21h 
call nl  
call nl


lea dx, msgIDInput
mov ah, 09h
int 21h   


lea dx, userID
mov ah, 0Ah
int 21h  
 call nl  
 call nl

lea dx, msgRegister
mov AH, 09h
int 21h   

call nl 
call nl
lea dx, msgWelcome
mov AH, 09h
int 21h


	call nl  
	
	START:
	
   MOV BL, 0
   MOV CL, 0  
        
   CALL NL
   CALL NL
   LEA DX,MSG5
   MOV AH,9
   INT 21H
   CALL NL
      
	     
   MOV AH, 1
   INT 21H  
   call nl
	   
 
     CALL NL

 CMP AL, 0DH
JE QSN1
JNE START
call nl 
	    

	
	QSN1:
	    CALL NL
    
	    LEA DX,Q1
	    MOV AH,9
	    INT 21H
	
	    CALL NL
    
	    LEA DX,QA1
	    MOV AH,9
	    INT 21H
	
	    CALL NL 
	    call nl
        
	    MOV AH, 1
	    INT 21H
	    CMP AL, 'b'
	    JE QSN2
        JNE QSNW2
	
	QSN2:
	    CALL NL
    
	    LEA DX,MSG6
	    MOV AH,9
	    INT 21H
	
	    INC BL
	    CALL NL
    
	    CALL QN2 
	    call input
	
	    CMP AL, 'c'
	    JE QSN3
	    JNE QSNW3
	
	QSNW2:
	   CALL NL
    
	   LEA DX,MSG7
	   MOV AH,9
	  INT 21H
	
	    INC CL
	    CALL NL
    
	    CALL QN2 
	    CALL INPUT
	
	    CMP AL, 'c'
	    JE QSN3 
	  JNE QSNW3
	
	
	QSN3:
	    CALL NL
    
	    LEA DX,MSG6
	    MOV AH,9
	    INT 21H
	
	    INC BL
	    CALL NL    

    
	    CALL QN3 
	    CALL INPUT
	
	    CMP AL, 'c'
	    JE QSN4
	    JNE QSNW4
	
	QSNW3:
	    CALL NL
    
	    LEA DX,MSG7
	    MOV AH,9
	    INT 21H
	
	    INC CL
	    CALL NL
    
	    CALL QN3
	    CALL INPUT
	
	    CMP AL, 'c'
	    JE QSN4 
	    JNE QSNW4
	
	QSN4:
	    CALL NL
    
	    LEA DX,MSG6
	    MOV AH,9
	    INT 21H
	
	    INC BL
	    CALL NL
    
	    CALL QN4 
	    CALL INPUT
	
	    CMP AL, 'c'
	    JE QSN5
	    JNE QSNW5
	    
	QSNW4:
	    CALL NL
    
	    LEA DX,MSG7
	    MOV AH,9
	    INT 21H
	
	    INC CL
	    CALL NL
    
	    CALL QN4 
	    CALL INPUT
	
	    CMP AL, 'c'
	    JE QSN5 
	    JNE QSNW5
	
	QSN5:
	    CALL NL
    
	    LEA DX,MSG6
    	MOV AH,9
	    INT 21H
	
	    INC BL
	    CALL NL
    
	    CALL QN5 
	
	    CALL INPUT
	
	    CMP AL, 'a'
	    JE QSN6
	    JNE QSNW6
	
	QSNW5:
	    CALL NL
    
    	LEA DX,MSG7
	    MOV AH,9
	    INT 21H
	
	    INC CL
	    CALL NL
    
	    CALL QN5 
	    CALL INPUT
	
	    CMP AL, 'a'
	    JE QSN6 
	    JNE QSNW6
	
	QSN6:
	    CALL NL
    
	    LEA DX,MSG6
	    MOV AH,9
	    INT 21H
	
	    INC BL
	    CALL NL
    
	    CALL QN6 
	
	    CALL INPUT
	
	    CMP AL, 'c'
	    JE QSN7
	    JNE QSNW7
	    
	QSNW6:
	    CALL NL
    
	    LEA DX,MSG7
	    MOV AH,9
    	INT 21H
	
	    INC CL
    	CALL NL
    
	    CALL QN6 
	    CALL INPUT
	
	    CMP AL, 'c'
	    JE QSN7 
	    JNE QSNW7
	
	QSN7:
	    CALL NL
    
	    LEA DX,MSG6
	    MOV AH,9
	    INT 21H
	
	    INC BL
	    CALL NL
    
	    CALL QN7
	    CALL INPUT
	
	    CMP AL, 'b'
	    JE QSN8
	    JNE QSNW8
	
	QSNW7:
    	CALL NL
    
	    LEA DX,MSG7
	    MOV AH,9
	    INT 21H
	
	    INC CL
	    CALL NL
      
	    CALL QN7 
	    CALL INPUT
	
	    CMP AL, 'b'
	    JE QSN8 
	    JNE QSNW8
	
	QSN8:
	    CALL NL
     
	    LEA DX,MSG6
	    MOV AH,9
	    INT 21H
	    
	    INC BL
	    CALL NL
    
	    CALL QN8 
	    CALL INPUT
    	
    	CMP AL, 'a'
	    JE QSN9
	    JNE QSNW9
	
    	QSNW8:
	    CALL NL
    
	    LEA DX,MSG7
        MOV AH,9
    	INT 21H
	
	    INC CL
	    CALL NL
    
	    CALL QN8 
	    CALL INPUT
	
	    CMP AL, 'a'
	    JE QSN9 
	    JNE QSNW9
	
	QSN9:
	    CALL NL
    
	    LEA DX,MSG6
	    MOV AH,9
	   ; INT 21H
	
	    INC BL
	    CALL NL
    
	    CALL QN9 
	    CALL INPUT
	
	    CMP AL, 'b'
	    JE QSN10
	    JNE QSNW10
	
	QSNW9:
	    CALL NL
    
	    LEA DX,MSG7
	    MOV AH,9
	    INT 21H
	
	    INC CL
	    CALL NL
    
    	CALL QN9 
	    CALL INPUT
	
	    CMP AL, 'b'
	    JE QSN10 
	    JNE QSNW10
	
	QSN10:
	    CALL NL
    
	    LEA DX,MSG6
	    MOV AH,9
	    INT 21H
	
	    INC BL
	    CALL NL
    
	    CALL QN10 
	    CALL INPUT
	
	    CMP AL, 'a'
	    JE EXIT
	    JNE EXITW
	
	QSNW10:
	    CALL NL
    
	    LEA DX,MSG7
	    MOV AH,9
	    INT 21H
	
	    INC CL
    	CALL NL
    
	    CALL QN10 
	    CALL INPUT
	
    	CMP AL, 'a'
	    JE EXIT 
	    JNE EXITW
	
	EXIT:
    	CALL NL 
    
	    LEA DX,MSG6
	    MOV AH,9
	    INT 21H
	
	    INC BL 
	    
	    CALL NL
	    CALL NL
	    
        
        LEA DX,MSG8
	    MOV AH,9
	    INT 21H
	    
	    CALL NL
	    CALL NL 
	    
	    
	    
	    LEA DX,MSG13
	    MOV AH,9
	    INT 21H
	    
	    CALL NL
	    
	    LEA DX,MSG14
	    MOV AH,9
	    INT 21H
	    
	    ADD BL, 48
	
        CMP BL,57
        
        JG TEN1

        MOV AH, 2
        MOV DL, BL
	    INT 21H
	    
 NEXT1: CALL NL 
	    
        LEA DX,MSG15
	    MOV AH,9
	    INT 21H
	    
	    ADD CL, 48
	
        CMP CL,57
        
        JG TEN1

        MOV AH, 2
        MOV DL, CL
	    INT 21H
	    
        CMP BL,CL
	    JC NEGATIVE
	    JNC POSITIVE
	
	EXITW:
	    CALL NL
    
    	LEA DX,MSG7
    	MOV AH,9
	    INT 21H
	
    	INC CL
	    CALL NL
	    CALL NL
	    
	    LEA DX,MSG8
	    MOV AH,9
	    INT 21H
	    
	    CALL NL
	    CALL NL
	    
	    LEA DX,MSG13
	    MOV AH,9
	    INT 21H
	    
	    
	    CALL NL
	    
	    LEA DX,MSG14
	    MOV AH,9
	    INT 21H
	    
	    ADD BL, 48
	
        CMP BL,57
        
        JG TEN2

        MOV AH, 2
        MOV DL, BL
	    INT 21H
	    
	    CALL NL 
	    
	    LEA DX,MSG15
	    MOV AH,9
	    INT 21H
	    
	    ADD CL, 48
	
        CMP CL,57
        
        JG TEN2

        MOV AH, 2
        MOV DL, CL
	    INT 21H
	
  NEXT2:CMP BL,CL
	    JC NEGATIVE
	    JNC POSITIVE
	    
	
	NL: 
	    MOV AH,2
	    MOV DL, 0AH
	    INT 21H   
        MOV DL, 0DH
        INT 21H
        RET 
    
    QN2:
        CALL NL
        LEA DX,Q2
	    MOV AH,9
	    INT 21H
	
	    CALL NL
    
	    LEA DX,QA2
	    MOV AH,9
	    INT 21H
	    RET 
	
	QN3:
	    CALL NL
        LEA DX,Q3
	    MOV AH,9
	    INT 21H
	
	    CALL NL
    
	    LEA DX,QA3
	    MOV AH,9
	    INT 21H
	    RET
	
	QN4:
	    CALL NL
        LEA DX,Q4
	    MOV AH,9
	    INT 21H
	
	    CALL NL
    
	    LEA DX,QA4
	    MOV AH,9
	    INT 21H
	    RET
	
	QN5:
	    CALL NL
        LEA DX,Q5
	    MOV AH,9
	    INT 21H
	    
	    CALL NL
    
	    LEA DX,QA5
	    MOV AH,9
	    INT 21H
	    RET 
	
	QN6:
	    CALL NL
        LEA DX,Q6
	    MOV AH,9
	    INT 21H
	
	    CALL NL
    
	    LEA DX,QA6
	    MOV AH,9
	    INT 21H
	    RET
	
	QN7:
	    CALL NL
        LEA DX,Q7
	    MOV AH,9
	    INT 21H
	
	    CALL NL
    
	    LEA DX,QA7
	    MOV AH,9
	    INT 21H
	    RET 
	
	QN8:
	    CALL NL
        LEA DX,Q8
	    MOV AH,9
	    INT 21H
	
	    CALL NL
    
	    LEA DX,QA8
	    MOV AH,9
	    INT 21H
	    RET  
	
	QN9:
	    CALL NL
        LEA DX,Q9
	    MOV AH,9
	    INT 21H
	
	    CALL NL
    
	    LEA DX,QA9
	    MOV AH,9
	    INT 21H
	    RET 
	
	QN10:
	    CALL NL
        LEA DX,Q10
	    MOV AH,9
	    INT 21H
	
	    CALL NL
    
	    LEA DX,QA10
	    MOV AH,9
	    INT 21H
	    RET  
	
	INPUT:
	    CALL NL
    
	    MOV AH, 1
	    INT 21H
	    RET
	
	
	EXIT1: 
	    CALL NL 
	    CALL NL
	
	    LEA DX,MSG10
	    MOV AH,9
	    INT 21H
	
	    MOV AH,1
	    INT 21H
	
	    CMP AL,'1'
	    JE START 
	
	    CALL NL
	    CALL NL
	
	    LEA DX,MSG11
	    MOV AH,9
	    INT 21H
	
	    MOV AH, 4CH
	    INT 21H
	 
	 TENEXIT:
	    MOV AH,2
	    MOV DL,"1"
    	INT 21H  
	    MOV DL,"0"
	    INT 21H
	    JMP EXIT1
	    
	 TEN1:
	    MOV AH,2
	    MOV DL,"1"
    	INT 21H  
	    MOV DL,"0"
	    INT 21H
	    JMP NEXT1
	     
	 TEN2:
	    MOV AH,2
	    MOV DL,"1"
    	INT 21H  
	    MOV DL,"0"
	    INT 21H
	    JMP NEXT2
	
	
	NEGATIVE:
	    CALL NL
	    
	    LEA DX,MSG12
	    MOV AH,9
	    INT 21H
	    SUB CL,BL
	    
	    ADD CL, 48
	
        CMP CL,57
        
        JG TENEXIT

        MOV AH, 2
        MOV DL, CL
        INT 21H
	    
	    JMP EXIT1
	
	
	POSITIVE:
	    CALL NL
	    LEA DX,MSG9
	    MOV AH,9
	    INT 21H
	    SUB BL,CL
	    
	    ADD BL, 48
	
        CMP BL,57
        
        JG TENEXIT

        MOV AH, 2
        MOV DL, BL
	    INT 21H
	    
	    JMP EXIT1
	
	MAIN ENDP
END MAIN