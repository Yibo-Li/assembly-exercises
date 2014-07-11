assume cs:code
;定义数据段
OriginalStr segment
    db 'Hello world!'
OriginalStr ends

EncryStr segment    
    db 12 dup (00h)
EncryStr ends

DecryStr segment
    db 12 dup (00h)
DecryStr ends

;定义栈段
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
mov bx,0
mov cl,1110010b
mov byte ptr [bx],'T'
mov [bx+1],cl
mov byte ptr [bx+2],'h'
mov [bx+3],cl
mov byte ptr [bx+4],'e'
mov [bx+5],cl
mov byte ptr [bx+6],' '
mov [bx+7],cl
mov byte ptr [bx+8],'o'
mov [bx+9],cl
mov byte ptr [bx+10],'r'
mov [bx+11],cl
mov byte ptr [bx+12],'i'
mov [bx+13],cl
mov byte ptr [bx+14],'g'
mov [bx+15],cl
mov byte ptr [bx+16],'i'
mov [bx+17],cl
mov byte ptr [bx+18],'n'
mov [bx+19],cl
mov byte ptr [bx+20],'a'
mov [bx+21],cl
mov byte ptr [bx+22],'l'
mov [bx+23],cl
mov byte ptr [bx+24],' '
mov [bx+25],cl
mov byte ptr [bx+26],'s'
mov [bx+27],cl
mov byte ptr [bx+28],'t'
mov [bx+29],cl
mov byte ptr [bx+30],'r'
mov [bx+31],cl
mov byte ptr [bx+32],'i'
mov [bx+33],cl
mov byte ptr [bx+34],'n'
mov [bx+35],cl
mov byte ptr [bx+36],'g'
mov [bx+37],cl
mov byte ptr [bx+38],' '
mov [bx+39],cl
mov byte ptr [bx+40],'i'
mov [bx+41],cl
mov byte ptr [bx+42],'s'
mov [bx+43],cl
mov byte ptr [bx+44],':'
mov [bx+45],cl
mov ax,OriginalStr
mov ss,ax
mov sp,0
pop ax
mov [bx+46],al
mov [bx+47],cl
mov [bx+48],ah
mov [bx+49],cl
pop ax
mov [bx+50],al
mov [bx+51],cl
mov [bx+52],ah
mov [bx+53],cl
pop ax
mov [bx+54],al
mov [bx+55],cl
mov [bx+56],ah
mov [bx+57],cl
pop ax
mov [bx+58],al
mov [bx+59],cl
mov [bx+60],ah
mov [bx+61],cl
pop ax
mov [bx+62],al
mov [bx+63],cl
mov [bx+64],ah
mov [bx+65],cl
pop ax
mov [bx+66],al
mov [bx+67],cl
mov [bx+68],ah
mov [bx+69],cl

add bx,0a0h
add bx,0a0h
mov cl,1110100b
mov byte ptr [bx],'T'
mov [bx+1],cl
mov byte ptr [bx+2],'h'
mov [bx+3],cl
mov byte ptr [bx+4],'e'
mov [bx+5],cl
mov byte ptr [bx+6],' '
mov [bx+7],cl
mov byte ptr [bx+8],'e'
mov [bx+9],cl
mov byte ptr [bx+10],'n'
mov [bx+11],cl
mov byte ptr [bx+12],'c'
mov [bx+13],cl
mov byte ptr [bx+14],'r'
mov [bx+15],cl
mov byte ptr [bx+16],'y'
mov [bx+17],cl
mov byte ptr [bx+18],'p'
mov [bx+19],cl
mov byte ptr [bx+20],'t'
mov [bx+21],cl
mov byte ptr [bx+22],'i'
mov [bx+23],cl
mov byte ptr [bx+24],'o'
mov [bx+25],cl
mov byte ptr [bx+26],'n'
mov [bx+27],cl
mov byte ptr [bx+28],' '
mov [bx+29],cl
mov byte ptr [bx+30],'s'
mov [bx+31],cl
mov byte ptr [bx+32],'t'
mov [bx+33],cl
mov byte ptr [bx+34],'r'
mov [bx+35],cl
mov byte ptr [bx+36],'i'
mov [bx+37],cl
mov byte ptr [bx+38],'n'
mov [bx+39],cl
mov byte ptr [bx+40],'g'
mov [bx+41],cl
mov byte ptr [bx+42],' '
mov [bx+43],cl
mov byte ptr [bx+44],'i'
mov [bx+45],cl
mov byte ptr [bx+46],'s'
mov [bx+47],cl
mov byte ptr [bx+48],':'
mov [bx+49],cl
mov ax,EncryStr
mov ss,ax
mov sp,0
pop ax
mov [bx+46],al
mov [bx+47],cl
mov [bx+48],ah
mov [bx+49],cl
pop ax
mov [bx+50],al
mov [bx+51],cl
mov [bx+52],ah
mov [bx+53],cl
pop ax
mov [bx+54],al
mov [bx+55],cl
mov [bx+56],ah
mov [bx+57],cl
pop ax
mov [bx+58],al
mov [bx+59],cl
mov [bx+60],ah
mov [bx+61],cl
pop ax
mov [bx+62],al
mov [bx+63],cl
mov [bx+64],ah
mov [bx+65],cl
pop ax
mov [bx+66],al
mov [bx+67],cl
mov [bx+68],ah
mov [bx+69],cl

add bx,0a0h
add bx,0a0h
mov cl,1110001b
mov byte ptr [bx],'T'
mov [bx+1],cl
mov byte ptr [bx+2],'h'
mov [bx+3],cl
mov byte ptr [bx+4],'e'
mov [bx+5],cl
mov byte ptr [bx+6],' '
mov [bx+7],cl
mov byte ptr [bx+8],'d'
mov [bx+9],cl
mov byte ptr [bx+10],'e'
mov [bx+11],cl
mov byte ptr [bx+12],'c'
mov [bx+13],cl
mov byte ptr [bx+14],'r'
mov [bx+15],cl
mov byte ptr [bx+16],'y'
mov [bx+17],cl
mov byte ptr [bx+18],'p'
mov [bx+19],cl
mov byte ptr [bx+20],'t'
mov [bx+21],cl
mov byte ptr [bx+22],'i'
mov [bx+23],cl
mov byte ptr [bx+24],'o'
mov [bx+25],cl
mov byte ptr [bx+26],'n'
mov [bx+27],cl
mov byte ptr [bx+28],' '
mov [bx+29],cl
mov byte ptr [bx+30],'s'
mov [bx+31],cl
mov byte ptr [bx+32],'t'
mov [bx+33],cl
mov byte ptr [bx+34],'r'
mov [bx+35],cl
mov byte ptr [bx+36],'i'
mov [bx+37],cl
mov byte ptr [bx+38],'n'
mov [bx+39],cl
mov byte ptr [bx+40],'g'
mov [bx+41],cl
mov byte ptr [bx+42],' '
mov [bx+43],cl
mov byte ptr [bx+44],'i'
mov [bx+45],cl
mov byte ptr [bx+46],'s'
mov [bx+47],cl
mov byte ptr [bx+48],':'
mov [bx+49],cl
mov ax,DecryStr
mov ss,ax
mov sp,0
pop ax
mov [bx+46],al
mov [bx+47],cl
mov [bx+48],ah
mov [bx+49],cl
pop ax
mov [bx+50],al
mov [bx+51],cl
mov [bx+52],ah
mov [bx+53],cl
pop ax
mov [bx+54],al
mov [bx+55],cl
mov [bx+56],ah
mov [bx+57],cl
pop ax
mov [bx+58],al
mov [bx+59],cl
mov [bx+60],ah
mov [bx+61],cl
pop ax
mov [bx+62],al
mov [bx+63],cl
mov [bx+64],ah
mov [bx+65],cl
pop ax
mov [bx+66],al
mov [bx+67],cl
mov [bx+68],ah
mov [bx+69],cl

mov ax,4c00h
int 21h
code ends
end start