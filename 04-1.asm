assume cs:code
data segment
    dw 2,15,0
data ends
stack segment
    dw 8 dup (0)
stack ends
code segment
start:
;使用mul计算乘方
mov ax,stack
mov ss,ax
mov sp,16
mov ax,data
mov ds,ax
mov bx,0
mov cx,[bx+2]
mov dl,[bx]
mov bx,dx
mov al,1
mov ah,0
s1:
mul bx
loop s1
mov dx,ax

;显示结果
mov ax,0b878h
mov ds,ax
mov bx,288h
mov ax,dx
mov dx,0
mov cx,5
s5:
push cx
mov cx,10
div cx
add dl,30h
mov [bx],dl
sub bx,2
mov dx,0
pop cx
loop s5

mov bx,8h
mov ax,data
mov ss,ax
mov sp,0
pop ax
mov dx,0
mov cx,5
s3:
push cx
mov cx,10
div cx
add dl,30h
mov [bx],dl
sub bx,2
mov dx,0
pop cx
loop s3

mov bx,0a0h
mov byte ptr [bx],'^'

mov bx,148h
pop ax
mov dx,0
mov cx,5
s4:
push cx
mov cx,10
div cx
add dl,30h
mov [bx],dl
sub bx,2
mov dx,0
pop cx
loop s4

mov bx,1e0h
mov byte ptr [bx+0h],'-'
mov byte ptr [bx+2h],'-'
mov byte ptr [bx+4h],'-'
mov byte ptr [bx+6h],'-'
mov byte ptr [bx+8h],'-'

mov ax,4c00h
int 21h
code ends
end start