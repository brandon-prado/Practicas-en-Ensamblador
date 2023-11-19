.stack 64
.data
    DDDD1 DW 1500
    DDDD2 DW 3200
    DDDD3 DW 1200
    DDDD4 DW 3600
    DDDD5 DW 6400
    DDDD6 DW 7200
    DDDD7 DW 1200
    DDDD8 DW 5400
    DDDD9 DW 800
    DDDD10 DW 1600
    
.code

inicio:

    mov ax, @data
    mov ds, ax
    
    mov BX,2
    MOV AX, [BX]
    MOV CX, DDDD6
    SUB AX,CX
        
        
    MOV SI, 6
    MOV AX,[BX][SI]    
    ADD AX,DDDD9
    
    MOV AX, [BX][SI+8]
    SUB AX,DDDD9
    
    MOV AX, 7200
    MOV BX,4
    MOV CX,[BX][SI+6]
    SUB AX,CX
    
 end
    