;LENGUAJES DE INTERFAZ 13-14 HRS

;ALUMNO: BRANDON ALEXIS PRADO CASTRO
;NO. CTRL: 19051178

;TRABAJO FINAL - PROGRAMA EN ENSAMBLADOR QUE MUESTRE
;LA TABLA DE MULTIPLICAR DE NUMERO DE UNA CIFRA

imprime macro numero
    mov ah,02h
    mov dl,numero
    add dl,30h
    int 21h  
endm

.model small
.stack 64 

.data
    numero db 0 
    msjnBien db 10,13,"BIENVENID@ A LA TABLA DE MULTIPLICAR ",'$'
    msjnIni db 10,13,10,13,"INGRESA EL NUMERO: ",'$'
    msjnSal db 10,13,10,13,"ESA ES TU TABLA DE MULTIPLICAR",'$'
    N db ?
.code

.startup
    ;Bienvenida
    mov ax,@data
    mov ds,ax
    mov ah,09
    lea dx,msjnBien
    int 21h
    sub al,30h
      
    ;Pide numero a multiplicar
    mov ax,@data
    mov ds,ax
    mov ah,09
    lea dx,msjnIni
    int 21h
    sub al,30h
    mov numero,al
    
    ;Tabla
    mov ah,01h
    int 21h
    sub al,30h
    mov N,al
    mov cl,01h  
        
operaciones:
    mov al,N
    mul cl
    aam
    mov bx,ax
    
    mov ah,02h
    mov dl,0xA
    int 21h
    
    mov ah,02h
    mov dl,0xD
    int 21h
    
    mov ah,02h
    mov dl,N
    add dl,30h
    int 21h
    
    mov ah,02h
    mov dl,'X'
    int 21h
    
    cmp cl,10
    je convert
    imprime cl
    
    mov ah,02h
    mov dl,'='
    int 21h
    
    mov ah,02h
    mov dl,bh
    add dl,30h
    int 21h
    
    mov ah,02h
    mov dl,bl
    add dl,30h
    int 21h
    
    inc cl
    cmp cl,11
    je salir
    
    jne operaciones
    
convert:
    mov ah,02h
    mov dl,'1' 
    int 21h
    mov ah,02h
    mov dl,21h
    int 21h
    mov ah,02h
    mov dl,'='
    int 21h
    mov ah,02h
    mov dl,bh
    add dl,30h
    int 21h
    mov ah,02h
    mov dl,bl
    add dl,30h
    int 21h  
    
fin:
    mov ax,@data
    mov ds,ax
    mov ah,09
    lea dx,msjnSal
    int 21h
    sub al,30h
    
salir:
    mov ah,4ch
    int 21h
    jne fin ah,4ch
    int 21h
    jne fin
        