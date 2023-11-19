;Programa que escribe un letrero en un posicion determinada


CR    EQU 13         ;Retorno de carro
LF    EQU 10         ;Salto de Linea
POSX  EQU 5          ;Posicion x (0 a 79)
POSY  EQU 5         ;Posicion y (0, 24)


.DATA

texto db 'Esto esta escrito en la posicion (5, 5)', CR, LF, '$'


.STACK 64

.CODE

INICIO PROC NEAR

    PUSH DS       ;Guarda la posicion del segmento de pila
    SUB AX, AX    ;Aseguramos que AX= 0 restando AX de AX
    
    PUSH AX       ; Guarda en Pila AX (IP = 0)
    
    MOV DL, POSX  ;Muevo a DL la posicion X
    MOV DH, POSY  ;;Muevo a DL la posicion Y
    
    CALL POSICION  ; Subrutina para posicionar el cursor
    
   
    MOV AX,@DATA 
    MOV DS,AX           
    
    
    
    LEA DX,TEXTO  ; Carga la direccion efectiva del texto en DX
    
    CALL ESCRIBIR ; Subrutina para escribir el texto
    
    
    MOV AX,4C00H   ; funcion para terminar el proceso del programa.
    INT 21H        ; Ejecuta la interrupcion.
     

    
INICIO  ENDP
                 
                 
                 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Procedimiento para posicionar el cursor 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                 

POSICION PROC NEAR
    
    PUSH DX     ; Guardo registro DX en pila
    PUSH BX     ; Guardo registro BX
    PUSH AX     ; Guardo registro AX
    
    CMP DL, 0   ; Compara DL con 0   
    
                ;CMP destino, fuente

                ;Esta instrucción resta el operando fuente al operando destino 
                ;pero sin que éste almacene el resultado de la operación, 
                ;solo se afecta el estado de las banderas.
    
      JL FIN    ; Si es menor salta a fin (Si la bandera SF es 1 (NG= 1)
    
    CMP DL, 79  ; Compara DL con 79                                     
    
    
      JG FIN    ; Si es mayor salta a fin (Si la bandera ZF = 0 (NZ = 1) o SF = OF)
      
    
    CMP DH,24   ; Compara DH con 24
      JG FIN    ; Si es mayor salta a fin   (Si la bandera ZF = 0 (NZ = 1) o SF = OF)
      
    
    
    MOV BH, 0   ; Pagina 0 de la pantalla en modo texto
    MOV AH, 2   ; Funcion 2 posicionar cursor de la Bios
    INT 10H     ; Llamar a al interrupcion de Bios     
    
       ;    Posicionar el cursor
       ;       INT 10H AH = 02H

       ;  Entrada:  DH = fila (0-24)
       ;            DL = columna (0-79)
       ;            BH = número de página
    
    
FIN:

    POP AX      ;Recupera registros
    POP BX
    POP DX
    
    ret
    
POSICION ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Procedimiento para escribir caracteres en la pantalla

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                 



ESCRIBIR PROC NEAR
    
    PUSH AX    ;Guarda en pila AX
    MOV AH,9h  ;Guarda en AX la funcion 9h , de Salida de caracteres
    INT 21H    ;Llamada a interrupcion del DOS, con la funcion 9
    POP AX     ;Recupera el registro AX
    RET
    
ESCRIBIR ENDP