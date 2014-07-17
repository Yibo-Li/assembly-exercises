assume cs:code,ds:data
data segment
	db 'h12E332l@L#O*&^!88nI@cE$% %$T1O m33E44E55t y77O88u!()'
	db '?'
data ends
stack segment
	dw 64 dup (0)
stack ends
code segment
start:
mov ax,data
mov ds,ax
mov si,0

mov ax,0b800h
mov es,ax
mov di,1440

mov ah,0
mov bh,0
s:mov al,ds:[si]
inc si

mov ah,0
mov dl,al
call zifu
jcxz xianshizifu
zf:mov ah,0
mov al,dl
call gan
jcxz xianshigan
gg:mov ah,0
mov al,dl
call kongge
jcxz xianshikong
kk:mov ah,0
mov al,dl
call wenhao
jcxz j

jmp short s
xianshizifu:
mov al,dl
mov ch,0 
add bh,1 
dec bh
dec bh
mov cl,bh
jcxz daxie
or al,00100000b
hh1:mov ah,00000001b
mov es:[di],ax
add di,2
jmp short zf

daxie:mov ch,0
mov cl,20h
da:dec al
loop da
mov bh,1
jmp short hh1
xianshigan:mov al,dl
mov ah,00000001b
mov es:[di],ax
add di,2
mov bh,0
jmp short gg
xianshikong:mov al,dl
mov ah,00000001b
mov  es:[di],ax
add di,2

jmp short kk

j:mov ax,4c00h
int 21h

zifu:
or al,00100000b
mov ch,0 
mov cl,60h
z1:dec al
loop z1
mov cl,26
z2:mov bl,cl
dec al
mov cl,al
jcxz z3
mov cl,bl
loop z2
jmp short z4

z3:add bh,1
z4:mov cl,al
ret

gan:mov ch,0 
mov cl,21h
g1:dec al
loop g1
mov cl,al
ret

kongge:mov ch,0 
mov cl,20h
kong1:dec al
loop kong1
mov cl,al
ret

wenhao:mov ch,0 
mov cl,3fh
w1:dec al
loop w1
mov cl,al
ret

code ends
end start