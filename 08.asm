assume cs:code
data segment
		db 'Welcome to the world assembly !'
data ends
code segment
start:
		mov cx,10
s5:		
	push cx
		mov ax,0b800h
		mov es,ax	
		mov di,1970	;di指向目的串首地址
		mov ax,data
		mov ds,ax	
		mov si,0	;si指向源串首址
		mov cx,31   ;字节串长31送cx
		
MOV AX, 7 ;产生从1到AX之间的随机数 
MOV DX, 41H ;用端口41H 
OUT DX, AX ;有这句话后，我发现就可以产生从1到AX之间的随机数了 
IN AL, DX ;产生的随机数AL
		add al,1
		mov ah,al	;字符串颜色
		
		;显示'Welcome to the world assembly !'
	s1:
		mov al,ds:[si]
		mov es:[di],al
		mov es:[di+1],ah
		inc si
		inc di
		inc di
        loop s1  
		
		;显示烟花
		;mov ax,0b800h
		;mov es,ax
		;mov di,160*7+50
		push ax
		push dx
MOV AX, 24 ;产生从1到AX之间的随机数 
MOV DX, 41H ;用端口41H 
OUT DX, AX ;有这句话后，我发现就可以产生从1到AX之间的随机数了 
IN AL, DX ;产生的随机数AL	
		pop dx
		mov dh,al
		push dx
MOV AX, 74 ;产生从1到AX之间的随机数 
MOV DX, 41H ;用端口41H 
OUT DX, AX ;有这句话后，我发现就可以产生从1到AX之间的随机数了 
IN AL, DX ;产生的随机数AL	
		pop dx
		mov dl,al
		pop ax
		mov al,2
		call track
		call fire
		mov ah,0b
		call fire
		
		pop cx
		loop s5
		;程序结束
		call over	
		
;程序结束		
over:
		mov ax,4c00h
		int 21h
		
;子程序“fire”
;功能：显示烟花爆炸的效果
;参数：	dh烟花中心位置行号
;		dl烟花中心位置列号
;		al烟花大小
;		ah烟花颜色
fire:	
		mov bl,'*'
		mov bh,ah
		mov cl,al
		mov ch,0
		mov al,1

		mov es:[di],bx	;绘制烟花中心点
	s4:
		push cx
		mov cl,al
		mov ch,0
		call s2
		inc al
		call delay
		pop cx
		loop s4
		ret

	s2:
		push di			;绘制烟花水平左
		sub di,cx
		sub di,cx
		mov es:[di],bx
		pop di
		
		push di			;绘制烟花水平右
		add di,cx
		add di,cx
		mov es:[di],bx
		pop di
		
		push di			;左上
		push ax
		mov ax,162
		mul cl
		sub di,ax
		mov es:[di],bx
		pop ax
		pop di
		
		push di			;左下
		push ax
		mov ax,158
		mul cl
		add di,ax
		mov es:[di],bx
		pop ax
		pop di
		
		push di			;右上
		push ax
		mov ax,158
		mul cl
		sub di,ax
		mov es:[di],bx
		pop ax
		pop di


		push di			;右下
		push ax
		mov ax,162
		mul cl
		add di,ax
		mov es:[di],bx
		pop ax
		pop di
		
		ret
        
;子程序“track”
;功能：显示烟花上升的轨迹
;参数：	es:di烟花中心位置地址
track:
		push ax			;计算di=160dh+2dl
		push dx
		mov ax,160
		mul dh
		mov dh,0
		add ax,dx
		add ax,dx
		mov di,ax
		pop dx
		pop ax
		
		push ax
		push dx
		push di		
		mov bl,'*'
		mov bh,ah
		mov dl,25
		sub dl,dh
		mov ax,160
		mul dl
		add di,ax
		mov cl,dl
		mov ch,0
	s3:	push es:[di]
		mov es:[di],bx
		call delay
		pop es:[di]
		sub di,160
		loop s3
		pop di
		pop dx
		pop ax
		
		ret
		
;子程序“delay”
;功能：延时
delay:
		push cx
		mov cx,0ffffh
		run1:
		push cx
		mov cx,0ffh
		run2:
		loop run2
		pop cx
		loop run1
		pop cx
		
		ret
	
	
code ends
end start