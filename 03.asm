assume cs:code

Calculate segment
        db '1.3/1=          '
	db '2.5+3=          '
        db '3.9-3=          '
        db '4.4+5=          '
Calculate ends

stack segment
	db 16 dup (0)
stack ends

code segment

s1:
mov cl,[bx+3]
sub cl,'-'
add cl,1
loop s2

;减法
mov dl,[bx+4]
sub dl,30h

mov al,[bx]
sub al,30h
sub al,dl
add al,30h
mov [bx+6],al

mov byte ptr [bx+7],'.'

mov al,[bx+2]
mov [bx+8],al

add bx,10h
pop cx
loop s

mov cx,1
loop s0

s2:
;除法
mov dl,[bx+4]
sub dl,30h

mov al,[bx]
sub al,30h
div dl
add al,30h
mov [bx+6],al

mov byte ptr [bx+7],'.'

mov ah,0
mov al,[bx+2]
sub al,30h
div dl
add al,30h
mov [bx+8],al

add bx,10h
pop cx
loop s

mov cx,1
loop s0

;程序入口
start:
mov ax,stack
mov ss,ax
mov sp,16
mov cx,4
mov bx,0
mov ax,Calculate
mov ds,ax
mov ah,0

s:
push cx
mov cl,[bx+3]
sub cl,'+'
add cl,1
loop s1

;加法
mov dl,[bx+4]
sub dl,30h

mov al,[bx]
sub al,30h
add al,dl
add al,30h
mov [bx+6],al

mov byte ptr [bx+7],'.'

mov al,[bx+2]
mov [bx+8],al

add bx,10h
pop cx
loop s

mov cx,1
loop s0

;打印结果
s0:
mov ax,Calculate 
mov ss,ax
mov sp,0
mov bx,0
mov ax,0b878h
mov ds,ax
mov dl,10111b
mov cx,4
s3:
pop ax
mov [bx],al
mov [bx+1],dl
mov [bx+2],ah
mov [bx+3],dl
pop ax
mov [bx+4],al
mov [bx+5],dl
mov [bx+6],ah
mov [bx+7],dl
pop ax
mov [bx+8],al
mov [bx+9],dl
mov [bx+10],ah
mov [bx+11],dl
pop ax
mov [bx+12],al
mov [bx+13],dl
mov [bx+14],ah
mov [bx+15],dl
pop ax
mov [bx+16],al
mov [bx+17],dl

pop ax
pop ax
pop ax
add bx,0a0h
loop s3

mov ax,4c00h
int 21h
code ends
end start
