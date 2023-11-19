;Programa que calcula la potencia de un numero
 .model small


.stack 64
.data
  
;declarando variables globales
pote db 0



;mensaje para mostrar los resultados
 
msjn db 10,13, "La Potencia es= ",'$'


.code
begin: 
    
    ;direccionamiento del procedimiento
    mov ax, @data
    mov ds,ax
    

    ;Potencia
    
        MOV CX, 2 
        MOV BX, 1 
        
        comienzo:  
            MOV DL, 5
            MOV Al, Bl
            MUL Dl
            MOV Bl, Al  
            MOV pote, al
        LOOP comienzo  
         
 
   
       
    ;Mostrar los mensajes de los resultados 
    
    ;mostrando la potencia
    mov ah, 09h
     lea dx, msjn
     int 21h
        
     mov al, pote
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