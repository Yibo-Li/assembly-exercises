assume cs:code
code segment
		num dw ' 1',' 2',' 3',' 4',' 5',' 6',' 7',' 8',' 9','10','11','12','13','14','15','16'
		off dw -160*3,4, 8,4, 8,4, 8,4, 8,4, 160*3,4, 160*3,4, 160*3,4, 160*3,4, -8,4, -8,4, -8,4, -8,4, -160*3,4, -160*3,4, -160*3,-15*4
start:
		mov al,16	;总人数N=16
		mov ah,5	;开始报数M=5
		mov bl,4	;每隔K=4去掉一人
		
		call draw	;绘制初始界面
		
		call circle	;选人过程
		
		mov ax,4c00h
		int 21h

;子程序：绘制初始界面
draw:
		push bx
		push cx
		push dx
		mov dh,00100111b
		
		push ax				
		mov ax,0b800h
		mov es,ax
		mov di,160*3+34	;es:[di]指向屏幕位置		
		pop ax
		
		push ax
		mov byte ptr es:[di],'N'
		mov byte ptr es:[di+1],dh
		add di,2
		mov byte ptr es:[di],'='
		mov byte ptr es:[di+1],dh
		add di,2
		mov ah,dh
		call draw_num		
		pop ax
				
		mov cx,4		
	draw_1:
		mov es:[di+1],dh
		add di,2
		loop draw_1
		
		push ax
		mov byte ptr es:[di],'M'
		mov byte ptr es:[di+1],dh
		add di,2
		mov byte ptr es:[di],'='
		mov byte ptr es:[di+1],dh
		add di,2
		mov al,ah
		mov ah,dh
		call draw_num		
		pop ax
		
		mov cx,4
	draw_2:
		mov es:[di+1],dh
		add di,2
		loop draw_2
		
		push ax
		mov byte ptr es:[di],'K'
		mov byte ptr es:[di+1],dh
		add di,2
		mov byte ptr es:[di],'='
		mov byte ptr es:[di+1],dh
		add di,2
		mov al,bl
		mov ah,dh
		call draw_num		
		pop ax
		
		push ax
		mov cx,16
		mov si,0
		mov dh,10b
		mov di,160*7+34
	draw_3:		
		push si
		push bx
		mov ax,si
		mov bl,2
		mul bl
		mov ah,0		
		mov si,ax
		mov ax,off[si]
		add di,ax
		pop bx
		pop si
		mov ax,num[si]		
		mov es:[di],ah
		mov es:[di+1],dh
		mov es:[di+2],al
		mov es:[di+3],dh
		add si,2
		loop draw_3
		pop ax
		
		pop dx
		pop cx
		pop bx
		
		ret
		
;选人过程		
circle:
		mov di,160*4+66	;es:[di]指向屏幕位置		
		mov si,1;标志1/2/3/4
		mov bx,20
	circle_1:
		add di,off[bx]
		cmp byte ptr es:[di+1],1b
		je circle_3
		cmp cx,di
		je circle_ret
		or byte ptr es:[di+1],10000000b
		or byte ptr es:[di+3],10000000b
		call delay
		cmp si,4
		jne circle_2
		mov si,0
		mov byte ptr es:[di+1],1b
		mov byte ptr es:[di+3],1b
	circle_2:
		add si,1
		and byte ptr es:[di+1],01111111b
		and byte ptr es:[di+3],01111111b
		mov cx,di
	circle_3:
		push di
		mov di,160*10+52
		mov ax,si
		add al,30h
		mov es:[di],al
		mov byte ptr es:[di+1],10b
		pop di
		add bx,off[bx+2]		
		jmp circle_1
	circle_ret:		
		ret

		
;延时
delay:
		push cx
		mov cx,03fffh
		run1:
		push cx
		mov cx,0fffh
		run2:
		loop run2
		pop cx
		loop run1
		pop cx
		ret
		
;子程序：打印数字值
;参数：	al需要打印的数 
;		ah字体颜色
;		es:[di]指向打印位置
draw_num:
		push ax
		push bx
		push cx
		push dx
		mov bh,ah
		mov bl,10
		mov cx,0
	draw_num_1:
		mov ah,0
		div bl
		mov dl,ah
		add dl,30h
		mov dh,0
		push dx
		inc cx
		cmp al,0		
		jnz draw_num_1
	draw_num_2:			
		pop ax
		mov es:[di],al
		mov es:[di+1],bh
		add di,2
		loop draw_num_2
		pop dx
		pop cx
		pop bx
		pop ax
		ret

code ends
end start