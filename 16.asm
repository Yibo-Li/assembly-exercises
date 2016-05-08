assume cs:code,ds:data
data segment
	biaoti db 'String    Matching','$'
	subste db 'Substr:___________________','$'
	string db 'String:',0ah,0dh,'$'
	tips db	'tips:',0ah,0dh
		 db	'  1.Maximum length of substring is 10 .',0ah,0dh
		 db	'  2.Enter = Begin to match ; Backspace = Deldte one char ; Esc = Quit .','$'
	match db 'This match is successful .','$'		
data ends
code segment
start:
;-----------------------------------
;绘制屏界面
;-----------------------------------
		;清除屏幕
		mov al,00h
		mov ah,06h
		mov bh,20h
		mov cx,0000h
		mov dx,184fh
		int 10h		
		mov al,00h
		mov ah,06h
		mov bh,07h
		mov cx,0101h
		mov dx,174eh
		int 10h
		
		;设置光标位置
		mov ah,2
		mov bx,0
		mov dx,031eh
		int 10h
		;将数据段送到dx
		mov	ax,data		
		mov	ds,ax
		mov	ah,09h
		mov	dx,offset biaoti
		int	21h
		
		;设置光标位置
		mov ah,2
		mov bx,0
		mov dx,0508h
		int 10h
		;将数据段送到dx
		mov	ax,data		
		mov	ds,ax
		mov	ah,09h
		mov	dx,offset subste
		int	21h
		
		;设置光标位置
		mov ah,2
		mov bx,0
		mov dx,0708h
		int 10h
		;将数据段送到dx
		mov	ax,data		
		mov	ds,ax
		mov	ah,09h
		mov	dx,offset string
		int	21h
		
		;设置光标位置
		mov ah,2
		mov bx,0
		mov dx,0121ah
		int 10h
		;将数据段送到dx
		mov	ax,data		
		mov	ds,ax
		mov	ah,09h
		mov	dx,offset match
		int	21h
		
		;设置光标位置
		mov ah,2
		mov bx,0
		mov dx,1501h
		int 10h
		;将数据段送到dx
		mov	ax,data		
		mov	ds,ax
		mov	ah,09h
		mov	dx,offset tips
		int	21h

;-----------------------------------		
;生成随机字母
;-----------------------------------
		;设置光标位置
		mov ah,2
		mov bx,0
		mov dx,080fh
		int 10h	
		mov cx,25
	s1:
		mov ax, 12h ;产生从1到ax之间的随机数 
		mov dx, 41h ;用端口41h 
		out dx, ax ;有这句话后，我发现就可以产生从1到ax之间的随机数了 
		in al, dx ;产生的随机数al
call delay
		add 	al,97
		;输出字母
		mov ah,2
		mov dl,al
		int 21h
		mov ah,2
		mov dl,' '
		int 21h
		loop s1
		
		;设置光标位置
		mov ah,2
		mov bx,0
		mov dx,0b0fh
		int 10h
		mov cx,25
	s2:
		mov ax,36 ;产生从0到ax之间的随机数 
		mov dx,41h ;用端口41h 
		out dx,ax ;有这句话后，我发现就可以产生从1到ax之间的随机数了 
		in 	al,dx ;产生的随机数al
		add al,97
		;输出字母
		mov ah,2
		mov dl,al
		int 21h
		mov ah,2
		mov dl,' '
		int 21h
		loop s2
		
		;设置光标位置
		mov ah,2
		mov bx,0
		mov dx,0e0fh
		int 10h
		mov cx,25
	s3:
		mov ax,36 ;产生从0到ax之间的随机数 
		mov dx,41h ;用端口41h 
		out dx,ax ;有这句话后，我发现就可以产生从1到ax之间的随机数了 
		in 	al,dx ;产生的随机数al
		add al,97
		;输出字母
		mov ah,2
		mov dl,al
		int 21h
		mov ah,2
		mov dl,' '
		int 21h
		loop s3
		
		mov ax,4c00h
		int 21h
		
;子程序“delay”
;功能：延时
delay:
		push cx
		mov cx,04ffh
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