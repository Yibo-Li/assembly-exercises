assume cs:code
data segment
  db 1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1
  db 1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1
  db 1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1
  db 1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
  db 1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
  db 1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
  db 1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1
  db 1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1
  db 0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  db 0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  db 0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0
  db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  db 0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0
  db 0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0
  db 0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1
  db 1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1,1
  db 1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1
  db 1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1
  db 1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1
  db 1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1
  db 1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1
  db 1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1
  db 0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
  db 0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
  db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
data ends
code segment
start:
     mov ax,data
     mov es,ax
     mov ax,0b800h
     mov ds,ax
     mov cx,26
     mov bx,0
     mov bp,0
     s:
      push cx
      mov di,0
      mov si,158
      mov cx,40
      s1:
        mov al,es:[bp]
        cmp al,0
        je lu
        mov word ptr ds:[bx+di],4020h
        mov word ptr ds:[bx+si],4020h
        jmp s_next
     lu:mov word ptr ds:[bx][di],0
        mov word ptr ds:[bx][si],0 
  s_next:inc bp
        add di,2
        sub si,2
      loop s1
      add bx,160
      pop cx
    loop s

  mov word ptr ds:[160*15+158],0611h
  mov word ptr ds:[160*11+158],2241h
  mov dh,15
  mov dl,79
  mov di,160*15+158
  mov cx,800
  sss:
  call delay_time

  cmp byte ptr ds:[di],17
  je zuo_0
 
  cmp byte ptr ds:[di],16
  je you_0

  cmp byte  ptr ds:[di],30
  je shang_0
 
  cmp byte  ptr ds:[di],31
  je xia_0

you_0:add di,2
  inc dl
  call right_go
jmp sss_end

shang_0:sub di,160
  dec dh
  call right_go
jmp sss_end

zuo_0:sub di,2
  dec dl
  call left_go
jmp sss_end
  
xia_0:add di,160
  inc dh
  call left_go
jmp sss_end

sss_end:

  loop sss

finish:  
mov ax,4c00h
int 21h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;左走
;;;;;;;;右箭头=16;左箭头=17;上箭头=30;下箭头=31;
left_go:;dh+dl=当前位置
  cmp byte ptr ds:[di],41h
  je finish

  sub di,160

  cmp dl,79
  je zuo_xia

  cmp word ptr ds:[di+162],0
  je you_1

zuo_xia:cmp word ptr ds:[di+320],0
  je xia_1

  cmp dl,0
  je shang_1

  cmp word ptr ds:[di+158],0
  je zuo_1

  cmp word ptr ds:[di],0
  je shang_1

  jmp finish
;===========;
  you_1:
  mov ds:[di+160],0610h
  jmp left_ok_1 

  xia_1:
  mov ds:[di+160],061fh
  jmp left_ok_1
;===========;
  zuo_1:
  mov ds:[di+160],0611h
  jmp left_ok_1
 
  shang_1:mov ds:[di+160],061eh
  jmp left_ok_1

left_ok_1: add di,160
     ret
;;向右走;;;;;;;右箭头=16;左箭头=17;上箭头=30;下箭头=31;
right_go:

  cmp byte ptr ds:[di],41h
  je finish
  sub di,160

  cmp dl,0
  je you_shang

  cmp word ptr ds:[di+158],0
  je zuo_2

 you_shang: cmp word ptr ds:[di],0
  je shang_2

  cmp dl,79
  je xia_2

  cmp word ptr ds:[di+162],0
  je you_2

  cmp word ptr ds:[di+320],0
  je xia_2

  jmp finish
;===========;
  you_2:
  mov ds:[di+160],0610h
  jmp left_ok_2 

  xia_2:
  mov ds:[di+160],061fh
  jmp left_ok_2
;===========;
  zuo_2:
  mov ds:[di+160],0611h
  jmp left_ok_2
 
  shang_2:mov ds:[di+160],061eh
  jmp left_ok_2

left_ok_2:add di,160

ret
;;;;;;;;;;;;;;;;延时函数
delay_time:
push cx
 mov cx,0fffh
   dn1:push cx
     mov cx,0ffh 
     dn2:loop dn2
     pop cx 
   loop dn1
 pop cx
ret

code ends
end start