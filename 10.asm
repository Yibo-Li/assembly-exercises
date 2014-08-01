assume cs:code
data segment
dw 1 dup (80)
dw 7 dup (156)
dw 6 dup (4)
dw 10 dup (156)
dw 10 dup (4)
dw 7 dup (160)
dw 3 dup (4)
dw 7 dup (-160)
dw 10 dup (4)
dw 10 dup (-164)
dw 6 dup (4)
dw 7 dup (-164)
data ends
code segment
;程序开始
start:
		mov ax,0b800h
		mov es,ax	;显存段地址
			
		mov cx,25
		mov dh,0
		mov di,0
	s2:			
		call letter
		;add di,160
		call delay
		loop s2
		
	
		mov ax,data
		mov ds,ax  	;点阵数据源 
		call draw
		
		call over
		
;程序结束
over:
		mov ax,4c00h
		int 21h
		
;子程序“letter”		
;功能：绘制字母
;参数：	es:[dh]指向显示行
letter:
		push cx
		push dx
		
		mov bl,'A'
		mov bh,010b		
		mov cx,20
	s1:
		mov es:[di],bx
		add bl,2	
		add di,8
		loop s1
		
		mov bl,'B'
		mov bh,010b
		mov cx,20
		mov ax,4000
		sub ax,di
		mov si,ax
		add si,4
	s3:
		mov es:[si],bx
		add bl,2	
		add si,8
		loop s3
		
		pop dx
		pop cx
		ret

;子程序
;参数：无
draw:
		mov si,0
		mov di,0
		mov cx,84
		mov bl,1
	
	s4:	mov ax,ds:[si]
		add di,ax	

MOV AX, 256 ;产生从1到AX之间的随机数 
MOV DX, 41H ;用端口41H 
OUT DX, AX ;有这句话后，我发现就可以产生从1到AX之间的随机数了 
IN AL, DX ;产生的随机数AL	
		add al,20
		mov bh,al
		mov es:[di],bx
		add si,2
		call delay		
		loop s4
	
		ret
		
		
;子程序“delay”
;功能：延时
delay:
		push cx
		mov cx,0ffh
		run1:
		push cx
		mov cx,08ffh
		run2:
		loop run2
		pop cx
		loop run1
		pop cx
		ret
		
code ends
end start