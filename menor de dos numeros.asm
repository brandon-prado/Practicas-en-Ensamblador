include 'emu8086.inc'

org  100h; set location counter to 100h

jmp CodeStart

DataStart:
	promptMsg db "enter a number> ", 0
	minMsg db "the smallest number is ", 0
	promptMsgtwo db "enter the second number> ", 0
	newline db 13, 10, 0
	num1 dw ?
	num2 dw ?
	numSmall dw ?

CodeStart:
  
  ; prompt user to enter in a number
	mov si, offset promptMsg
	call print_string
  
  ; read in the number into cx
	call scan_num
  
  ; move the number to a variable
	mov num1, cx
  
  ; advance cursor to the next line
	mov si, offset newline
	call print_string

  ; prompt user to enter in a number
	mov si, offset promptMsgtwo
	call print_string
  
  ; read in the number into cx
	call scan_num
  
  ; move the number to a variable
	mov num2, cx
  
  ; advance cursor to the next line
	mov si, offset newline
	call print_string

  ; print min message
	mov si, offset minMsg
	call print_string

  ;copy num1 in BX so we can compare
   mov bx, num1 ;I used bx here with random thought
  ;it is not necessary that you should use same register.
  
  ;compare values
	CMP bx, num2
  ;I think this will set CF in flags if num1 is less than num2,
  ; I am not sure, it can be exactly reverse also, you just need to
  ; change your print statement in that case

   JB minnum1			 
   
	mov ax, num2 ;it is here because num1 is greater than num2
	JMP printnum  ; go to print minimum number

minnum1:
	mov ax, num1 ;it is here because num1 is smaller than num2

printnum:
	call print_num  
  
	EndLabel:
	ret
  
DEFINE_PRINT_STRING  
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS


