;Lenguajes de interfaz
;Brandon Alexis Prado Castro - 19051178

.model small   
.stack 64
.data

 u db 0  ;Unidades
 d db 0  ;Decenas
 
 msjnBienv db 8,10, "*PROGRAMA*",'$','$'
 msjnNum db 8,10, "NUMERO: ", '$'
 msjnMayor db 8,10, "NUMERO MAYOR: ",'$'
                                     
 biggerNum db 0 

 vector db dup 5 (0)

.code                             

start: 

    mov ax,@data
    mov ds,ax       
    mov ah,09       
    lea dx,msjnBienv
    int 21h           
                                    
    mov al,5
    mov cl,al
    mov si,0    
    
fill:    
    
    mov ah,09h
    lea dx,msjnNum
    int 21h
            
    mov ah,01h      
    int 21h         
    sub al,30h     
    mov d,al  
    
    mov ah,01h      
    int 21h         
    sub al,30h    
    mov u,al  
    
    mov al,d    
    mov bl,10   
    mul bl          
    add al,u    
    mov vector[SI],al 
    inc si  
    
LOOP fill
                               
    mov al,5 
    mov cl,al  
    mov si,0
    mov al,vector[si]
    mov biggerNum, al              
                    
counting:  
                                   
    mov si,cx
    dec si
    mov dl,vector[si]
    cmp dl,biggerNum
    jng next:
    mov biggerNum,dl

next:
 
    loop counting

    mov ah,09h
     lea dx,msjnMayor
     int 21h
     mov ah,00   
     mov al,biggerNum
     AAM
     
     mov bx,ax
     mov ah,02h
     mov dl,bh
     add dl,30h
     int 21h
        
     mov ah,02h
     mov dl,bl
     add dl,30h
     int 21h  
    
    mov ah,4ch
    int 21h
    
end