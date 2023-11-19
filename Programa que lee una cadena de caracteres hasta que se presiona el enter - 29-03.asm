; Programa que lee una cadena de caracteres en ciclo hasta que se utilice la tecla enter

.data

.code

inicio:
  mov ah,01h
  int 21h
  cmp al,0dh
  jne inicio ;Unica diferencia, si no es un Enter salta a la etiqueta inicio.
  mov ah,02h
  mov dl,al
  int 21h   
  
  
  mov ah,04ch ;Al terminar finaliza el programa.
  int 21h


end