;数据段的定义
;--------------------------------------------------
datarea  segment
;主页菜单显示
mess db '	**************************************************************************',0ah,0dh
	 db '	*		   welcome you! 												 *',0ah,0dh
	 db '	*		   this is hanoi game											 *',0ah,0dh
	 db '	*		   you can know how many times when you play this game			 *',0ah,0dh
	 db '	*		   the case by HE RUIRUI										 *',0ah,0dh
	 db '	*		   XueHao is 41012186											 *',0ah,0dh
	 db '	**************************************************************************','$';
bin   dw 0	;将bin初始化为0
chnum db 10 dup('0'),'$';给chnum分配存储空间
one   dw 'A'    ;三个塔座
two   dw 'B'
three dw 'C'
strshow  db '-->$'   ;连接符号
chline	 db 0dh,0ah,'$'
prompt	 db 'Please input the plate number(1-99):$';提示语句
chtimes1 db 0dh,0ah,'You have moved $';提示语句
chtimes2 db 'times',0dh,0ah,'$'
inputlist	label byte
maxlen	 db 3
actlen	 db 0
chinput  db 3 dup ('0'),'$'
multfact dw 1
datarea ends

;-----------------------------------------------------
;代码段的定义
code  segment

main  proc far			;主函数
assume	 cs:code,ds:datarea
start:
	  mov	ax,datarea	;将数据段送到dx
	  mov	ds,ax
	  lea	dx, mess	;输出mess
	  mov	ah,09h
	  int	21h
loopagain:
	  
   	  mov dl,0dh		;换行指令
      mov ah,2
      int 21h
      mov dl,0ah
      mov ah,2
	  int 21h
	  lea	dx,prompt	;输出prompt
	  mov	ah,09h
	  int	21h
	  lea	dx,inputlist	;输出inputlist
	  mov	ah,0ah
	  int	21h
	  call	asctobin	;调用asctobin
	  mov	ax,1		;把一送到ax
	  cmp	ax,bin		;比较bin与ax
	  ja	loopagain	;如果大于跳转到loopagain
	  mov	ax,99		;把99送到ax
	  cmp	bin,ax		;比较ax与bin
	  ja	loopagain	;如果大于跳转到loopagain
	  push	bin			;压栈操作
	  push	one
	  push	two
	  push	three
	  lea	dx,chline	;将chline送入dx
	  mov	ah,09h		;输出指令
	  int	21h
	  call	hanoi		;调用Hanoi
	  lea	dx,chtimes1	;送chtimes并输出
	  mov	ah,09h
	  int	21h
	  mov	cx,0010		;把10送到cx
	  lea	si,chnum	;把chnum送到si
shownum:			;输入
	  cmp	byte ptr [si],'0'
	  je	notadd
	  add	byte ptr [si],48
notadd:
	  inc	si
	  loop	shownum
	  lea	dx,chnum
	  mov	ah,09h
	  int	21h
	  lea	dx,chtimes2
	  mov	ah,09h
	  int	21h
	  mov	bin,0
	  mov	actlen,0
	  mov	[chinput],'0'
	  mov	[chinput+1],'0'
	  mov	cx,0010
	  lea	si,chnum
put0:
	  mov	byte ptr [si],'0'
	  inc	si
	  loop	put0
	  jmp	loopagain
loopend:
	  mov	ah,4ch
	  int	21h
	  main	endp
	  
	  
asctobin proc  near		;子程序
	  push	ax
	  push	cx
	  cmp	actlen,0
	  je	loopend
	  cmp	actlen,1
	  je	l2
	  jmp	l3
l2:			;若一个数执行
	  xor	ah,ah
	  mov	al,[chinput]
	  sub	al,48
	  add	bin,ax
	  jmp	out1
l3:			;若输入俩个数执行
	  xor	ah,ah
	  mov	al,[chinput+1]
	  sub	al,48
	  add	bin,ax
	  mov	al,[chinput]
	  sub	al,48
	  mov	cl,10
	  mul	cl
	  add	bin,ax
out1:
	  pop	cx
	  pop	ax
	  ret
	  asctobin	endp
	  
	  
hanoi proc	near		;汉诺塔
	  push	ax
	  push	dx
	  push	bp
	  mov	bp,sp
	  mov	ax,1
	  cmp	ax,word ptr [bp+14]
	  je	equal
	  jmp	unequal
equal:
	  lea	si,chnum+10
loopnum0:		;输出过程的程序
	  xor	ah,ah
	  dec	si
	  mov	al,[si]
	  add	al,1
	  aaa
	  mov	[si],al
	  cmp	ah,1
	  je	loopnum0
	  mov	dx,word ptr[bp+12]
	  mov	ah,2
	  int	21h
	  lea	dx,strshow
	  mov	ah,09h
	  int	21h
	  mov	dx,word ptr [bp+8]
	  mov	ah,02h
	  int	21h
	  lea	dx,chline
	  mov	ah,09h
	  int	21h
	  jmp	exit
unequal:		;若不相等执行
	  mov	ax,[bp+14]
	  sub	ax,1
	  push	ax
	  push	[bp+12]
	  push	[bp+8]
	  push	[bp+10]
	  call	hanoi
	  lea	si,chnum+10
loopnum1:	;输入俩位数时执行
	  xor	ah,ah
	  dec	si
	  mov	al,[si]
	  add	al,1
	  aaa
	  mov	[si],al
	  cmp	ah,1
	  je	loopnum1
	  mov	dx,word ptr [bp+12]
	  mov	ah,2
	  int	21h
	  lea	dx,strshow
	  mov	ah,09h
	  int	21h
	  mov	dx,word ptr [bp+8]
	  mov	ah,02h
	  int	21h
	  lea	dx,chline
	  mov	ah,09h
	  int	21h
	  mov	ax,[bp+14]
	  sub	ax,1
	  push	ax
	  push	[bp+10]
	  push	[bp+12]
	  push	[bp+8]
	  call	hanoi
exit:
	  pop	bp
	  pop	dx
	  pop	ax
	  ret	8
	  hanoi endp
	  
	  code	ends
;---------------------------------------
			end   start
