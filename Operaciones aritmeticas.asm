; Programa que muestra las operaciones artimeticas
.model small


.stack 64
.data

;declarando variables globales

numero1 db 0
numero2 db 0

suma db 0
resta db 0
multiplicacion db 0
division db 0
modulo db 0


msjn1 db 10,13, "Ingrese el primer numero= ",'$';ingrese n1
msjn2 db 10,13, "Ingrese el segundo numero= ",'$';ingrese n2


;mensaje para mostrar los resultados

msjnS db 10,13, "La suma es= ",'$'
msjnR db 10,13, "La resta= ",'$'
msjnM db 10,13, "La Multiplicacion es= ",'$'
msjnD db 10,13, "La division es = ",'$'
msjnMod db 10,13, "El modulo es = ",'$'

.code
begin:

;direccionamiento del procedimiento
mov ax, @data
mov ds,ax

;solicitar del teclado numero 1

mov ah, 09       ;funcion para la impresion de cadena de caracteres
lea dx, msjn1
int 21h           ; Interrupicion de DOS
mov ah, 01
int 21h

; Lo que estas leyendo no es un entero, es un caracter en ASCII, el caracter '0'
;esta en la posicion 48, o 30H. Asi que para convertir un caracter correspondiente a un
;digito decimal (caracteres entre 48 y 57) en un digito decimal, se le resta 48 o 30h como
;en este caso. (Obviamente solo funciona con numeros)

sub al, 30h
mov numero1,al    ; Guarda el numero convertido en la variable numero1

;solicitar del teclado numero 2

mov ah, 09
lea dx, msjn2
int 21h
mov ah, 01
int 21h
sub al, 30h
mov numero2,al

;operaciones aritmeticas

;SUMA
mov al,numero1
add al,numero2    ; Suma  al al nuemro2 y lo guarda en AL
mov suma,al       ; mueve el resultado de AL a la variable suma

;RESTA
mov al,numero1
sub al,numero2    ;Resta numero2 al contenido de AL ( En este caso es el valor de Numero1 )
mov resta,al      ;Mueve el resultado de AL a la variable resta

;MULTIPLICACION
mov al,numero1    ;
mul numero2       ; Multiplica por default la fuente (numero2) con el contenido de AL
mov multiplicacion,al  ;EL resultado lo guarda en AL

;DIVISION
mov al,numero1
div numero2       ; Divide por default el contenido de AL por EL divisor la fuente ( Numero2)
mov division,al   ; El resultado lo guarda en AL

;MODULO
mov modulo,ah     ; Y el residuo en AH



;Mostrar los mensajes de los resultados

;mostrando la suma


mov ah, 09h
lea dx, msjns
int 21h

mov al, suma
AAM  ;Corrige el resultado en Ax del producto de dos numeros
;decimales desempaquetados a uno solo valor decimal.
; la logica es :  ah= al/10   --- al: al mod 10

mov bx, ax  ;El resultado coregido lo mueve a  bx
mov ah, 02h ; Mueve la funcion de salida a ah  (Se apoya con DL)
mov dl, bh  ; Mueve el contenido de BH a DL para mostrarlo en pantalla
add dl, 30h ; a DL le suma el 30h para  mostrarlo en decimal
int 21h     ; Ejecuta la interrupcion de salida.

mov ah, 02h ; Mueve la funcion de salida a ah  (Se apoya con DL)
mov dl, bl  ; Mueve el contenido de BL a DL para mostrarlo en pantalla
add dl, 30h ; a DL le suma el 30h para  mostrarlo en decimal
int 21h     ; Ejecuta la interrupcion de salida.

;mostrando la resta
mov ah, 09h
lea dx, msjnR
int 21h

mov al, resta
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

;mostrando la multiplicacion
mov ah, 09h
lea dx, msjnM
int 21h

mov al, multiplicacion
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


;mostrando la division
mov ah, 09h
lea dx, msjnD
int 21h

mov al, division
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


;mostrando el modulo
mov ah, 09h
lea dx, msjnmod
int 21h

mov al, modulo
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