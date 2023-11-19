CR EQU 13;
LF EQU 10

.DATA

TEXTO DB 'ESTE ES UN TEXTO DE PRUEBA',CR,LF,'$'

.STACK
    PILA DB 128 DUP('PILA')
    
.CODE
INICIO PROC FAR
        PUSH DS         ;guarda segmento en la pila (DS:AX direccion de retrono)
        SUB AX, AX      ;al realizar la resta guarda el contenido de AX en 0
        PUSH AX         ;guarda en la pila AX (IP = 0)
        
        MOV AX, @DATA   ;guarda el iniciodel segmento de datos en AX
        MOV DS, AX      ;iguala el registros DS con el registro AX
        LEA DX,TEXTO    ;DX, desplazamiento de texto
        CALL ESCRIBIR   ; llama a la subrutina de escribir texto
        
        ret
        
INICIO ENDP

ESCRIBIR PROC           ;procedimeinto ESCRIBIR
    PUSH AX             ;guarda en la pila AX
    MOV AH,9            ;AH = 9 funcion niemr
    INT 21h
    POP AX
    
    RET
    
ESCRIBIR ENDP

END
