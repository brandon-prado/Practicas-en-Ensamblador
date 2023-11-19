;Programa que determina el numero de 5 numeros de 2 digitos
;Luz Angelica Reyna Bautista
;Num control: 19051187
;Clase 14:00-15:00

.model small

;un areglo se puede acceder a travez de []    

.stack 64
.data

 unidad db 0 
 decena db 0
 
 
 msjn0 db 10,13, "Dato = ", '$'
 msjn1 db 10,13, "Procesando... ",'$';
 msjn2 db 10,13, "El mayor es = ",'$'
 
 mayor db 0 


 vector db dup 5 (0)
                                   


.code                             

inicio: 

    mov ax, @data
    mov ds,ax       
    mov ah, 09       ;funcion para la impresion de cadena de caracteres
    lea dx, msjn1
    int 21h           ; Interrupicion de DOS
                                 

; Llenar arreglo    
    mov al,5
    mov cl,al
    mov si, 0 
    
    
LLENADO:    
    
    mov ah, 09h
    lea dx, msjn0
    int 21h
            
    mov ah,01h      ;Capturar numeros
    int 21h         
    sub al, 30h     
    mov decena, al  ;Lo que se encuentra en al se mueve a decena
    
    mov ah,01h      ;Captura
    int 21h         
    sub al, 30h     ;Se hace el ajuste
    mov unidad, al  ;Lo que se encuentra en al se mueve a unidad
    
    mov al,decena     ;decena a al
    mov bl, 10        ;El 10 se va a bl para poder multiplicar
    mul bl            ;al * bl y el resultado se guarda en al
    add al,unidad     ;Se suma a al las unidades
    mov vector[SI],al 
    inc si
LOOP LLENADO



 ;inicializa los                                
    mov al,5  ;cuantos elementos voy a recorrer
    mov cl, al  ; movemos al contador el tamaño del arreglo
    mov si, 0
    mov al, vector[si]
    mov mayor, al
                    
                    
conteo:  
                                   
    mov si, cx
    dec si
    mov dl, vector[si]
    cmp dl, mayor
        jng siguiente:
    mov mayor,dl

siguiente:
 
    loop conteo

;Mostrar los mensajes de los resultados 
    
    ;mostrando el mayor
    mov ah, 09h
     lea dx, msjn2
     int 21h
     mov ah,00   
     mov al, mayor
     AAM  ;Corrige el resultado en Ax del producto de dos numeros
          ;decimales desempaquetados a uno solo valor decimal. 
          ; la logica es :  ah= al/10   --- al: al mod 10
     mov bx, ax
     mov ah, 02h
     mov dl, bh
     add dl, 30h
     int 21h
        
     mov ah, 02h
     mov dl, bl
     add dl, 30h
     int 21h  
    
     
    ;cierre del programa
    mov ah,4ch
    int 21h
    
end