; Programa: Programa que esribe un texto en pantalla usando la funcion 09H del DOS

; Delcaracion de constantes

CR EQU 13  ; Retorno de carro 
LF EQU 10  ; Salto de linea   

; Declaracion de datos o variables

.DATA
 
 
 TEXTO DB 'Este es un texto de prueba ',CR,LF,'$'; TEXTO Y $ DELIMITADOR DE FIN DE TEXTO


.STACK

  PILA DB 128 DUP('PILA')
     
.CODE

INICIO PROC FAR   
    PUSH DS        ;guarda segmento en pila (DS:AX direccion de retorno
    SUB AX, AX     ;al realizar la resta queda el contenido de AX en 0  
    PUSH AX        ; Guarda en ila AX (IP = 0)
    
    MOV AX, @DATA  ; Guarda el inicio del segmento de datos en AX
    MOV DS, AX     ; iguala el registros DS con el registro AX
    LEA DX,TEXTO   ; DX,  desplazamiento de texto
    CALL ESCRIBIR  ; llama a la subrutina de escribir texto   
    
    ret
    
INICIO  ENDP


ESCRIBIR PROC     ; Procedimiento ESCRIBIR
    PUSH AX        ; Guarda en pila AX
    MOV AH,9       ; AH = 9  Funcion numero 9 Salida de caracteres
    INT 21h        ; Llamada a interrupciondel DOS, con funcion 9
    POP AX         ; Recupera el registro 
    
    RET
    
ESCRIBIR ENDP

END