assume cs:code
OriginalStr segment
    db 'Hello world!'
OriginalStr ends

EncryStr segment    
    db 12 dup (00h)
EncryStr ends

DecryStr segment
    db 12 dup (00h)
DecryStr ends

words segment
    db "The original string is:"
	db "The encryption string :"
	db "The decryption string :"
words ends

stack segment
    db 12 dup (00h)
stack ends

code segment
start:
	;加密过程
	mov ax,stack
	mov ss,ax
	mov sp,16
	mov ax,OriginalStr
	mov ds,ax
	mov bx,0
	mov cx,11
	mov dl,2
s1:
	mov al,[bx]
	add al,[bx+1]
	mov ah,0
	div dl
	mov [bx+10h],al
	inc bx
	push ax
	loop s1
	mov al,[bx]
	add al,20h
	mov ah,0
	div dl
	mov [bx+10h],al
	push ax

	;解密过程
	mov ax,EncryStr
	mov ds,ax
	mov bx,11
	mov cx,12
	mov dl,2
	pop ax
	mov al,ah
	add al,[bx]
	add al,[bx]
	sub al,20h
	mov [bx+10h],al
	dec bx
s2:
	pop ax
	mov al,ah
	add al,[bx]
	add al,[bx]
	sub al,[bx+11h]
	mov [bx+10h],al
	dec bx
	loop s2

	;屏幕显示
	mov ax,0b878h
	mov ds,ax
	mov ax,words
	mov es,ax
	mov bx,0
	mov ah,1110010b;
	mov cx,23
s3:
	mov al,es:[bx]
	mov si,bx
	add si,bx
	mov [si],al
	mov [si+1],ah
	inc bx
	loop s3
	mov ax,OriginalStr
	mov es,ax
	mov cx,12
	mov bx,0
	mov ah,1110010b;
s6:
	mov al,es:[bx]
	mov si,46
	add si,bx 
	add si,bx
	mov [si],al
	mov [si+1],ah
	inc bx
	loop s6

	mov ax,0b88ch
	mov ds,ax
	mov ax,words
	mov es,ax
	mov bx,0
	mov ah,1110100b;
	mov cx,23
s4:
	mov al,es:[bx]
	mov si,bx
	add si,bx
	mov [si],al
	mov [si+1],ah
	inc bx
	loop s4
	mov ax,EncryStr
	mov es,ax
	mov cx,12
	mov bx,0
	mov ah,1110100b;
s7:
	mov al,es:[bx]
	mov si,46
	add si,bx 
	add si,bx
	mov [si],al
	mov [si+1],ah
	inc bx
	loop s7

	mov ax,0b8a0h
	mov ds,ax
	mov ax,words
	mov es,ax
	mov bx,0
	mov ah,1110001b;
	mov cx,23
s5:
	mov al,es:[bx]
	mov si,bx
	add si,bx
	mov [si],al
	mov [si+1],ah
	inc bx
	loop s5
	mov ax,DecryStr
	mov es,ax
	mov cx,12
	mov bx,0
	mov ah,1110001b;
s8:
	mov al,es:[bx]
	mov si,46
	add si,bx 
	add si,bx
	mov [si],al
	mov [si+1],ah
	inc bx
	loop s8

	mov ax,4c00h
	int 21h
code ends
end start