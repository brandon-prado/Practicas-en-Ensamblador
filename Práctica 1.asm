; pRACTICA 1 DIRECCIONAMIENTOS
; eL ALUMNO COMPRENDERA LOS DIFERENTES TIPOS DE DIRECCIONAMIENTOS EN ENSAMBLADRO

.stack 64
.data  ; Variables y valores iniciales
   DDDD DW 0    ;0
   DDDW DW 300  ;12c
   DDDX DW 200  ;c8
   DDDY DW 150  ;96
   DDDZ DW 125  ;7d
   DDDQ DW 100  ;64
   DDDR DW 80   ;50
   DDDS DW 70   ;46
   DDDJ DW 60   ;3c
   DDDU DW 50   ;32
   dato db 0
   mens db 'PAUSA...', '$'          
   
;;;;;;;;;;;;;;;;;;;;;;;

; DB (Define Byte) Reservar datos de tamaño byte (8 bits)
; DW (Define Word) Reservar datos de tipo palabra (16 bits)
; DD (Define Doubleword) Reservar datos de tipo doble palabra (32 bits)
; DQ (Define Quadword) Reservar datos de tipo quádruple palabra (64 bits)
; DT (Define Terabyte) Reservar datos de tipo terabyte (80 bits o 10 bytes)  



; La directiva EQU asigna un nombre simbolico al valor de una expresion. El
; compilador, cuando encuentre en el codigo dicho nombre simbolico, lo
; sustituira por el valor de la expresion. La expresion indicada puede ser:

; 1. Una constante numerica.
; 2. Una referencia de direccion (cualquier modo de direccionamiento).
; 3. Cualquier combinacion de simbolos y operaciones que generen un valor numerico.
; 4. Otro nombre simbolico.

   
;;;;;;;;;;;;;;;;;;;;;;;   
     
.code

inicio:

; asignamos la direccion del segmento data a ax
 mov ax, @data
 mov ds,ax
; direccionamiento directo 
 
     mov ax, DDDW     
 
     mov ah, 09h
     lea dx, mens 
     int 21h 
        

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; OFFSET <variable>
; OFFSET <etiqueta>    

; Devuelve el OFFSET (desplazamiento) de la variable o etiqueta especificada.
; El desplazamiento es la posición desde el principio del segmento hasta la
; expresión indicada.  

; MOV DX,OFFSET TEXTO ; Mover a DX el desplazamiento posicion de la variable TEXTO 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;direccionamiento indirecto 
 MOV BX, OFFSET DDDX
 MOV AX, [BX]   
 
     mov ah, 09h
     lea dx, mens 
     int 21h 
 ; direccionamiento relativo a la base    
 
 
 MOV AX, [BX+2]  
 
     mov ah, 09h
     lea dx, mens 
     int 21h     
     
 ; direccionamiento indexado directo
 
 
 MOV SI,2
 MOV AX, DDDX[SI]
 
     mov ah, 09h
     lea dx, mens 
     int 21h 
 
 
 ; direccionamiento indexado de base 
 
 
 MOV BX, OFFSET DDDW
 MOV SI, 8
 MOV AX, [BX] [SI +2]    
 
     mov ah, 09h
     lea dx, mens 
     int 21h 
 
end
