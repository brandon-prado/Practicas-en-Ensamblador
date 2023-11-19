; Programa que muestra el uso de un ciclo


;Declaracion de datos

.data ;En.data se declaran variables y cadenas a usar en el programa
  mensaje db 13, 10,"Hola: ", "$" ;Declaramos una cadena.    
 
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
loop ciclo ;Se repite desde nuestra etiqueta ciclo.

   mov ah,04ch ;Al terminar finaliza el programa.
  int 21h
  
main endp

end main