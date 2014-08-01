assume cs:code

code segment
;程序开始
start:
		mov ax,0b800h
		mov es,ax
		mov di,2000		;es:[di]指向显示器中央
		
		mov dl,5		;矩形半宽度
		mov dh,12		;矩形半高度
		mov bl,'a'		;上下边字符
		mov bh,001b		;颜色
		mov cx,8
	s3:
		push cx
		
		push dx
		push bx
		
		mov cl,dh
		add cl,1
		mov ch,0
		s5:
			push cx
			push bx
			
			call rectangle	;绘制矩形
			call delay		
			mov bh,0b		
			call rectangle	;擦除矩形
			
			dec dh
			pop bx
			pop cx
		loop s5
		
		pop bx
		pop dx
		
		add dl,10			;加长
		add bl,1
		add bh,1
		
		push dx
		push bx
		
		mov cl,dh
		add cl,1
		mov ch,0
		mov dh,0
		s6:
			push cx
			push bx
			call rectangle	;绘制矩形
			call delay		
			mov bh,0b		
			call rectangle	;擦除矩形
			
			inc dh
			pop bx
			pop cx
		loop s6
		
		pop bx
		pop dx
		pop cx
		loop s3
		
		;程序结束
		call over

		
;程序结束		
over:
		mov ax,4c00h
		int 21h
		
;子程序返回
back:
		ret
	
;子程序“rectangle”
;功能：绘制矩形
;参数：	es:[di]指向显示器中央
;		dl矩形半宽度
; 		dh矩形半高度
;		bl上下边字符
;		bh左上颜色
rectangle:
		mov al,dl
		mov ah,0
		mov cl,40
		div cl
		mov dl,ah
		
		;绘制矩形左右边
		mov cl,dh
		add cl,1
		mov ch,0
		push di
		mov al,dl
		mov ah,0
		sub di,ax
		sub di,ax
		mov al,'\'
		mov ah,bh
		mov es:[di],ax
		pop di
		push di
		mov al,dl
		mov ah,0
		add di,ax
		add di,ax
		mov al,'/'
		mov ah,bh
		mov es:[di],ax
		pop di
	s2:
		push cx
		dec cx
		push di			;左上
		mov al,dl
		mov ah,0
		sub di,ax
		sub di,ax
		mov al,160
		mov ah,0
		mul cl
		sub di,ax
		mov al,'\'
		mov ah,bh
		mov es:[di],ax
		pop di
		
		push di			;左下
		mov al,dl
		mov ah,0
		sub di,ax
		sub di,ax
		mov al,160
		mov ah,0
		mul cl
		add di,ax
		mov al,'\'
		mov ah,bh
		mov es:[di],ax
		pop di
		
		push di			;右上
		mov al,dl
		mov ah,0
		add di,ax
		add di,ax
		mov al,160
		mov ah,0
		mul cl
		sub di,ax
		mov al,'/'
		mov ah,bh
		jz s7
		add ah,1
		s7:
		mov es:[di],ax
		pop di
		
		push di			;右下
		mov al,dl
		mov ah,0
		add di,ax
		add di,ax
		mov al,160
		mov ah,0
		mul cl
		add di,ax
		mov al,'/'
		mov ah,bh
		jz s8
		add ah,1
		s8:
		mov es:[di],ax
		pop di
		
		pop cx
		loop s2
		
		;绘制矩形上下边
		mov cl,dl
		mov ch,0
		push di
		mov al,160
		mov ah,0
		mul dh
		sub di,ax
		mov es:[di],bx
		pop di
		push di
		mov al,160
		mov ah,0
		mul dh
		add di,ax
		mov al,bl
		mov ah,bh
		cmp ah,0
		jnz s11
		mov ah,-1
		s11:
		add ah,1
		mov es:[di],ax
		pop di
	s1:	
		push di			;左上
		sub di,cx
		sub di,cx
		mov al,160
		mov ah,0
		mul dh
		sub di,ax
		mov al,bl
		mov ah,bh
		mov es:[di],ax
		pop di
		
		push di			;右上
		add di,cx
		add di,cx
		mov al,160
		mov ah,0
		mul dh
		sub di,ax
		mov al,bl
		mov ah,bh
		mov es:[di],ax
		pop di
		
		push di			;右下
		add di,cx
		add di,cx
		mov al,160
		mov ah,0
		mul dh
		add di,ax
		mov al,bl
		mov ah,bh
		cmp ah,0
		jnz s9
		mov ah,-1
		s9:
		add ah,1
		mov es:[di],ax
		pop di
		
		push di			;左下
		sub di,cx
		sub di,cx
		mov al,160
		mov ah,0
		mul dh
		add di,ax
		mov al,bl
		mov ah,bh
		cmp ah,0
		jnz s10
		mov ah,-1
		s10:		
		add ah,1
		mov es:[di],ax
		pop di
				
		loop s1
		
		ret
		
;子程序“delay”
;功能：延时
delay:
		push cx
		mov cx,0ffh
		run1:
		push cx
		mov cx,0affh
		run2:
		loop run2
		pop cx
		loop run1
		pop cx
		ret
		
code ends
end start