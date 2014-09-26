assume cs:code
data segment
	dw 201,2, 205,2, 205,2, 205,2, 205,2, 187,160-10, 186,10, 186,160-10
	dw 8 dup (204,2, 205,2, 205,2, 205,2, 205,2, 185,160-10, 186,10, 186,160-10)	
	dw 200,2, 205,2, 205,2, 205,2, 205,2, 188,160-10
	dw '$'
data ends
code segment
start:
		mov ax,0b800h
		mov es,ax
		mov di,160*3+64
		mov ax,data
		mov ds,ax
		mov si,0
		
		call draw
		
		mov di,160*4+68
		mov cx,9
	s1:
		call num
		mov ah,1b
		call draw_num
		add di,160*2
		loop s1
		
		mov cx,8
	s2:
		call sort
		loop s2
		
		mov di,160*20+62
		mov byte ptr es:[di+6+1],100b
		mov byte ptr es:[di+8+1],100b
		
	over:		
		mov ax,4c00h
		int 21h
	
;绘制图框
draw:
	draw_start:
		cmp word ptr ds:[si],'$'
		je draw_ret
		mov ax,ds:[si]
		mov es:[di],al
		mov byte ptr es:[di+1],10b
		add di,ds:[si+2]
		add si,4
		jmp draw_start
	draw_ret:
		ret

;生成随机数al
num:	
	MOV AX, 90 ;产生从1到AX之间的随机数 
	MOV DX, 41H ;用端口41H 
	OUT DX, AX ;有这句话后，我发现就可以产生从1到AX之间的随机数了 
	IN AL, DX ;产生的随机数AL
	ADD AL,9
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
		push di
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
		pop di
		pop dx
		pop cx
		pop bx
		pop ax
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

;子程序：排序
;参数：		
sort:
		push cx
		mov di,160*20+62
		mov cx,0
	sort_4:
		push cx
		mov byte ptr es:[di],16
		mov byte ptr es:[di+1],100b
		mov byte ptr es:[di+7],100b
		mov byte ptr es:[di+9],100b
		
		mov bl,10
		mov al,es:[di+6]
		sub al,30h
		mul bl
		add al,es:[di+8]
		sub al,30h
		mov cl,al		
		mov al,es:[di+6-2*160]
		sub al,30h
		mul bl
		add al,es:[di+8-2*160]
		sub al,30h
		mov ch,al
		
		cmp ch,cl
		jna sort_2
		mov byte ptr es:[di+14-160],62
		mov byte ptr es:[di+14-160+1],100b
		call delay
		mov byte ptr es:[di+14-160],0
		push cx
		mov cx,7
		mov bx,0
		sort_5:
			mov ax,es:[di+bx]
			mov dx,es:[di+bx-160*2]
			mov es:[di+bx],dx
			mov es:[di+bx-160*2],ax
			add bx,2
		loop sort_5		
		pop cx
		jmp sort_3
	sort_2:
		mov byte ptr es:[di+14-160],60
		mov byte ptr es:[di+14-160+1],100b
		call delay
	sort_3:
		mov byte ptr es:[di+14-160],0
		mov byte ptr es:[di],0
		mov byte ptr es:[di+7],1b
		mov byte ptr es:[di+9],1b
		
		sub di,160*2
		pop cx
		add cx,1		
		cmp cx,8
		je sort_over
		cmp byte ptr es:[di+7-2*160],100b
		je sort_over
		jmp sort_4
	sort_over:
		mov byte ptr es:[di],0
		pop cx
		ret
		
code ends
end start