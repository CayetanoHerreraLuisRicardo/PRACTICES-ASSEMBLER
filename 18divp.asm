; 	AUTHOR: 		CAYETANO HERRERA LUIS RICARDO
;	DESCRIPTION:	OPERATION (/) IN ASSEMBLER
;	FECHA:			ABRIL 2014
.model small
.stack
.DATA
cad1 db "numero1: $"
cad2 db "numero2: $"
res db "resultado: $"
numero1 db ?,"$"
numero2 db ?,"$"
resultado db ? ,"$"

.code
myproc:
mov ax,@data 
mov ds,ax

mov ah,00	;selecciona el modo de video
mov al,00
int 10h

mov ah,02h	; seleccionas la posicion del cursor
mov dx, 0100h
mov bh,00h
int 10h

lea dx,cad1; 
mov ah,09h 	;despliega la cadena de caracteres
int 21h

mov ah,02h; seleccionas la posicion del cursor
mov dx, 010ch
mov bh,00h
int 10h

mov ah,01h;lee el teclado
int 21h

sub al,30h
mov numero1,al
mov ah,02h	; seleccionas la posicion del cursor
mov dx,0200h
mov bh,00h
int 10h

lea dx,cad2
mov ah,09h	;despliega la cadena de caracteres
int 21h

mov ah,02h	;seleccionas la posicion del cursor
mov dx, 020ch
mov bh,00h
int 10h

mov ah,01h	;lee el teclado
int 21h

sub al,30h
mov numero2,al
call divide
mov ah,02h	; seleccionas la posicion del cursor
mov dx, 0300h
mov bh,00h
int 10h

lea dx,res
mov ah,09	;despliega la cadena de caracteres
int 21h

mov ah,02h	;seleccionas la posicion del cursor
mov dx, 030ch
mov bh,00h
int 10h

lea dx,resultado	;despliega la cadena de caracteres
mov ah,09h
int 21h

mov ax,4c00h	;termina el programa
int 21h

divide proc near
sub ax,ax
mov al,numero1
div numero2

;mov al,numero1
;mov bl,numero2
;div bl
;mov dl,al

add al,30h	;sumar 30h para volverlo un caracter imprimible
mov resultado,al
RET
divide endp

END myproc

;add - sumar
;sub - resta
;mul - multiplicar
;div - dividir


;sub ax,ax		;limpiamos el registro
;mov al, num1
;mov ch, num2
;div ch

