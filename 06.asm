assume cs:code
data segment
;--  文字:  中  --
;--  宋体15;  此字体下对应的点阵为：宽x高=20x20   --
;--  高度不是8的倍数，现调整为：宽度x高度=20x24  --;
DB  000H,000H,000H,000H,030H,000H,000H,03CH,000H,000H,038H,000H,000H,038H,000H,000H  
DB  038H,000H,038H,038H,01CH,03FH,0FFH,0FCH,018H,038H,038H,018H,038H,038H,018H,038H  
DB  038H,018H,038H,038H,018H,038H,038H,018H,038H,038H,03FH,0FFH,0F8H,038H,038H,038H  
DB  000H,038H,000H,000H,038H,000H,000H,038H,000H,000H,038H,000H,000H,038H,000H,000H  
DB  038H,000H,000H,038H,000H,000H,000H,000H  

;--  文字:  华  --
;--  宋体15;  此字体下对应的点阵为：宽x高=20x20   --
;--  高度不是8的倍数，现调整为：宽度x高度=20x24  --;
DB  000H,000H,000H,000H,008H,000H,003H,08EH,000H,003H,0CCH,018H,007H,00CH,03CH,00EH  
DB  00CH,0FCH,00FH,00DH,0E0H,01FH,00FH,080H,03FH,00EH,00CH,077H,03CH,00CH,067H,0ECH  
DB  00EH,007H,08CH,00EH,007H,00FH,0FEH,007H,038H,000H,000H,03CH,000H,000H,038H,00CH  
DB  0FFH,0FFH,0FEH,000H,038H,003H,000H,038H,000H,000H,038H,000H,000H,038H,000H,000H  
DB  038H,000H,000H,038H,000H,000H,000H,000H  
data ends

  
;下面一部分是将16进制数据转换为二进制显示.用来比较清楚的明白点阵情况  
;因为点阵的宽高比,相当于3*8个为一行,可以隐约看到中字的尖  
;00000000 00000000 00000000  
;00000000 00110000 00000000  
;00000000 00111100 00000000  
  
code segment  
start:  
    mov ax,0b800h  
    mov es,ax  
    mov ax,data  
    mov ds,ax  
    ;mov bx,0  
    mov si,0  
    mov bh,100b ;黑底红字  
    mov bl,03h  ;心形  
    mov ah,0    ;用ax存点阵  
    mov dh,0    ;用于计数判定3字每行循环  
    mov di,180  ;"中"起始位置  
    jmp read  
  
;子程序  
over:   mov ax,4c00h  
    int 21h  
  
;hua:  
;   mov di,92  
;   ret  
check:  cmp si,72  
    jne next2         
    mov di,136  ;"华"起始位置;为什么是这个位置,而不是我算的中间偏右的位置开始才对?  
  next2:cmp si,144  
    je over  
    cmp dh,3  
    jne read  
    mov dh,0  
    add di,112  ;换行  
    jmp read  
  
read:     
    mov al,ds:[si]  
    inc si  
    inc dh  
    jmp div2  
  
;show:  mov es:[di],bx  
;   ret  
doom:  
    mov cx,8  
  s1:  
    pop ax  
    cmp ah,1  
    jne next  
    mov es:[di],bx  
  next: add di,2  
    loop s1  
    jmp check  
      
  
;16进制转化为2进制,并入栈存储  
div2:     
    mov cx,8  
   s0:  mov dl,2  
    div dl  
    mov dl,al   ;商暂存于dl中  
    mov al,0  
    push ax     ;余数入栈  
    mov al,dl   ;上次除法的商恢复到ax中  
  loop  s0  
    jmp doom  
  
code ends  
end start  
