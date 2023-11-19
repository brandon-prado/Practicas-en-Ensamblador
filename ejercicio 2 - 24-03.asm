; Programa que muestra el uso de un ciclo


;Declaracion de datos

.data ;En.data se declaran variables y cadenas a usar en el programa
  mensaje db 13, 10,"Hola: ", "$" ;Declaramos una cadena.  
      
NUMEROS DB 1,2,3,4,5    
    
    
 
; Inicio de Codigo
 
.code

main proc

inicio:  
  
  mov cx, 0005 ;numero de veces a repetir el ciclo

ciclo:
  mov ax,@data
  mov ds,ax
  mov dx,offset mensaje ;lee la cadena desde nuestro segmento de datos
  mov ah, 09h
  int 21h 
  
     
 
;;;;;;;;;;;IMPRIMIR EN ORDEN ;;;;;;;;;;;;;;;;;;  
      
 ;    MOV AX,5
 ;    SUB AX,CX 

;;;;;;;;;;;; IMPRIMIR A LA INVERSA  ;;;;;;;;;;
     MOV AX,CX
     SUB AX,1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


     MOV SI, AX 
     mov al, NUMEROS[SI]
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

 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
  
  
  
  
loop ciclo ;Se repite desde nuestra etiqueta ciclo.
                   
   mov ah,04ch ;Al terminar finaliza el programa.
  int 21h
  
main endp

end main