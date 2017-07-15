# 汇编程序设计项目

## 程序设计项目1

```assembly
data segment
dw ?
data ends
end
```
要求：只在定义的数据段‘?’中加入相关的内容，使得上面的程序可以在屏幕中间显示一个绿色的字符‘A’。

## 程序设计项目2

对字符串进行加密和解密。

算法设计：原字符串放在OriginalStr段，加密的字符串放在EncryStr段，解密的字符串放在DecryStr段。

加密方法：取OriginalStr段的每个字符的ASCII值与该字符后面的字符的ASCII值之和的一半。字符串的最后一个字符的加密方法为取该字符的ASCII值与20H之和的一半。(加密过程中的余数需要进行存储)
　　
解密方法：根据加密方法自己设计解密方法，并实现。

实现要求：将OriginalStr段的数据按照加密方法进行加密，将加密后的数据放在EncryStr段；将EncryStr段的数据按照解密方法进行解密，将解密后的数据放在DecryStr段。然后把原字符串、加密之后的字符串以及解密之后的字符串分别以白底绿字、白底红字、白底蓝字方式显示到屏幕中间。

![demo2](https://raw.githubusercontent.com/Yibo-Li/assembly-language-exercises/master/demo/demo2.png)

密文和明文的数据段定义如下：

```assembly
OriginalStr segment
db 'Hello world!'
OriginalStr ends

EncryStr segment
db 2*12 dup (' ')
EncryStr ends

DecryStr segment
db 12 dup (' ')
DecryStr ends
```

## 程序设计项目3

加、减、除三则运算。

要求：

1. 读取字符串的内容，判断第四个字符是‘+’、‘-’或‘/’，然后按照相应的符号进行运算，并把运算结果转换为字符串存放在等号后面，最后把算式显示到屏幕中间，白底蓝字。
2. 注意数字字符的ASCII与数字的对应关系，数字的数值加30H为这个数字的字符所对应的ASCII码。
3. 数据段定义如下：

```assembly
Calculate segment
db '1.3/1=         '
db '2.5+3=         '
db '3.9-3=         '
db '4.4+5=         '
Calculate ends
```

## 程序设计项目4

编程计算x(x>2)的y(y>2)次方。使用两种方式实现：
　　
1. 只使用add指令实现。
2. 只使用mul指令实现。

并将计算式显示在屏幕中央。

例如：计算4的3次方。在屏幕中央显示格式如下：

```assembly
4
^
3
-----
64
```

注意：结果不能超过16位寄存器可存储的最大值。

## 程序设计项目5

定义一个数据段如下：

```assembly
data segment
db 'h12E332l@L#O*&^!88nI@cE$% %$T1O m33E44E55t y77O88u!()'
db '?'
data ends
```

注意：第一行字符串为待处理的数据，‘?’为字符串结束符号。

设计程序完成如下操作：

1. 去掉除字母、空格、‘!’之外的字符。
2. 通过内存间的数据交换，将数据段中的字符串修改为‘Hello!Nice to meet you!’。
3. 在屏幕正中打印处理好后的数据。

完成程序后思考：

1. 如何设计程序，程序代码量最少。
2. 如何设计程序，程序执行速度最快。
3. 如何设计程序，使得程序具有通用性。

提示：

1. ‘?'、‘!'和空格分别假定为字符串的结束符、一句话的最后的标点和单词间的间隔符，都不属于干扰符号。
2. 这里的通用性是指：任意带有其他符号干扰的一组字符串都能够通过程序被处理为具有如下特点的英文段落：段落中只包含字母、空格、‘!’三种符号。段落中的每句话都是以开头字母为大写，‘!’为结束标点的句子。

## 程序设计项目6

在屏幕中间显示：“中华”两个字。

![demo6](https://raw.githubusercontent.com/Yibo-Li/assembly-language-exercises/master/demo/demo6.png)　　

提示：通过字模提取工具，可以提取字的显示信息。

## 程序设计项目7

在屏幕上动态演示六边形多次变大的过程。

要求：每次变大的过程，用不同颜色区分。

![demo7](https://github.com/Yibo-Li/assembly-language-exercises/blob/master/demo/demo7.gif?raw=true)

## 程序设计项目8

在屏幕中间显示一个‘Welcome to the world assembly !’字符串，同时显示模拟烟花效果。

其中，字符串的颜色为随机颜色，烟花的颜色也为随机颜色。

![demo8](https://raw.githubusercontent.com/Yibo-Li/assembly-language-exercises/master/demo/demo8.gif)
　　
进阶：
　　
1. 实现同时多个烟花同时升起，且位置、高度、颜色随机。
2. 实现多个烟花升起时间、位置、高度、颜色、速度均随机。

提示：利用41h号端口的读写，实现随机数。

## 程序设计项目9

在屏幕上实现矩形的缩放。

要求：
　　
1. 矩形缩放过程中，当矩形上下边重合时，矩形的宽度加10个字符；当矩形宽度为80个字符重合时，矩形宽度变为10个字符。
2. 开始矩形上下边用字符‘a’显示，当矩形上下边重合时，上下边变为‘b’显示，下一次上下边重合变为‘c’显示，依次类推。当用‘z’显示上下边重合时，上下边重新变为用‘a’显示。
3. 缩放过程中，矩形缩放到上下顶点时，上下边改变颜色。

![demo9](https://raw.githubusercontent.com/Yibo-Li/assembly-language-exercises/master/demo/demo9.gif)

## 程序设计项目10

在屏幕上动态画出一棵七彩圣诞树。

![demo10](https://raw.githubusercontent.com/Yibo-Li/assembly-language-exercises/master/demo/demo10.gif)

## 程序设计项目11

设计实现字符雨程序。

![demo11](https://raw.githubusercontent.com/Yibo-Li/assembly-language-exercises/master/demo/demo11.gif)

提示：
　　
1. 每列是一个单独的单元，在数据段中定义的数据要保证各列要显示的字符和开始显示的时机不一样。
2. 每一滴雨完全移出屏幕后，该雨滴所在列生成一个新的雨滴。

## 程序设计项目12

设计实现简单游戏“谁来买单”。

好友们一起出去玩，玩游戏决定谁来买单。人数为n（编号1、2、3...n）站成一个圆圈。首先从编号为m+1的人开始报数，数到k的人出列。接着，从下一个人开始报数，数到k的人出列。这个过程沿着圆圈一直进行，直到最终只剩下一个人，由这个人来买单。

![demo12](https://raw.githubusercontent.com/Yibo-Li/assembly-language-exercises/master/demo/demo12.gif)

提示：涉及到循环单链表。

## 程序设计项目13

在屏幕上动态演示：冒泡法排序。

![demo13](https://raw.githubusercontent.com/Yibo-Li/assembly-language-exercises/master/demo/demo13.gif)

示例说明：
　　
1. 无箭头指向的红色数据为已经排序好的数据，红色箭头指向的红色数据为正在进行排序的数据，蓝色数据为未排序的数据。
2. 数据表格右边的‘>’和‘<’为两个数据的比较结果，若结果为‘>’，则将数据进行对换，取上方表格单元中的数据继续排序；若结果为‘<’(相等默认为‘<’)，则直接取上方表格单元中的数据继续进行排序。

提示：需进行排序的数据大小随机产生，可利用41h端口实现。

## 程序设计项目14

在屏幕上动态演示：左手逃生法则。

![demo14](https://raw.githubusercontent.com/Yibo-Li/assembly-language-exercises/master/demo/demo14.gif)

提示：

1. 地图中只有三种元素：墙、通道、出口。设计地图时，要给不同的元素赋予不同的编码。
2. 什么情况下改变行进的方向。遇到这些情况后根据当前方向决定下一步方向变化的规律是什么。
3. 左手逃生法则简述：在一个有出入口，没有回路的迷宫中，一直保持左手贴着墙壁向前走，总能找到迷宫出口。

## 程序设计项目15

在屏幕上动态演示：汉诺塔算法。

![demo15](https://raw.githubusercontent.com/Yibo-Li/assembly-language-exercises/master/demo/demo15.gif)

注意：

1. 注意体验以栈的方式处理数据。
2. 用递归方式实现的子程序，注意参数的传递。

## 程序设计项目16

在屏幕上动态演示：朴素的字符串匹配算法。

![demo16](https://raw.githubusercontent.com/Yibo-Li/assembly-language-exercises/master/demo/demo16.gif)

要求：能基本展现字符串匹配过程。

扩展：

1. 接收键盘输入构建关键字符串（模式串）。
2. 利用读取相关端口数据，产生随机字符，构建待匹配字符串（文本串）。

涉及知识点提示：

1. 标志寄存器中cmp指令和有条件转移。
2. int 指令中BIOS中断例程应用，应用int 10h中断例程设置光标位置。
3. 端口中对端口的读写。
4. 直接定址表中数据标号在其他段中的使用以及程序入口地址的直接定址。
5. 使用BIOS进行键盘输入和磁盘读写中使用int 16h中断例程读取键盘缓冲区以及字符串的输入。

朴素的字符串匹配算法说明：关键字符串（模式串）中各个字符分别与待匹配字符串（文本串）中的各个字符按顺序进行比较。

## 程序设计项目17

在屏幕上动态演示：农夫、狼、羊、草过河问题。

![demo17](https://raw.githubusercontent.com/Yibo-Li/assembly-language-exercises/master/demo/demo17.gif)

说明：农夫、狼、羊、草过河，但是狼和羊不能同时在岸边，羊和草不能同时在岸边，除非有农夫在场。农夫要通过一只小船将它们都运送到对岸，且小船一次只能运送一种物品（农夫除外），将全部的物品成功的运送到河对岸。

## 程序设计项目18

设计实现游戏“五子棋”。

![demo18](https://raw.githubusercontent.com/Yibo-Li/assembly-language-exercises/master/demo/demo18.gif)

基础要求：显示棋盘，棋盘上显示光标，光标可以用键盘进行上下左右控制，按空格键可以下棋子，两种颜色的棋子交替下，当五子连珠时提示获胜的颜色。

涉及知识点提示：
　　
1. 标志寄存器中cmp指令和有条件转移。
2. 本程序需要用到键盘输入。

进阶要求：
　　
1. 用户误操作处理，在原有的棋子上下子，在棋盘外下子等。
2. 提示信息，当前光标的位置，当前该谁下子等。
3. 增加控制，例如游戏结束可以选择重新开始还是退出游戏，按Esc键可以退出等。
4. 增加悔棋功能。

## 程序设计项目19

设计实现游戏“2048”。

![demo19](https://raw.githubusercontent.com/Yibo-Li/assembly-language-exercises/master/demo/demo19.gif)

游戏规则：

玩家需要在16格方块的范围中凑出“2048”这个数字。

选择上下左右其中一个方向滑动，每滑动一次，所有的数字方块都往滑动的方向靠拢，系统在空白的方块随机出现一个数字（2或4），相同数字的方块在靠拢时会相加。

设计建议：

1. 向上、向下、向左、向右四个方向键控制方块移动。
2. 字母q键退出游戏。

涉及知识点提示：

1. 标志寄存器中cmp指令和有条件转移。
2. 本程序需要用到键盘输入。

## 程序设计项目20

设计实现游戏“像素鸟”。

![demo20](https://raw.githubusercontent.com/Yibo-Li/assembly-language-exercises/master/demo/demo20.gif)

基础要求：

1. 用一个笑脸来代替下落的鸟，用一个按键控制小鸟上升。（建议：小鸟每次落下两行或三行，按键使小鸟上升一行。）
2. 小鸟碰到上下边界游戏结束。
3. 小鸟撞到柱子游戏结束。

涉及知识点提示：

1. 标志寄存器中cmp指令和有条件转移。
2. 本程序涉及到中断程序的一个子程序：

```assembly
push ax
　　
mov ah,1
int 16h  ;16h号中断的1号功能，读出键盘缓冲区的数据，al接收ASCII码，				;并且根据读出键盘缓冲区的情况修改相应的标志位。
je CNend ;若键盘缓冲区没有数据则跳到子程序结束位置。

cmp al,' ';与空格比较。
jne CNend ;不相等则跳到子程序结束位置。

;/////这里添加你的功能代码，上面比较的是空格，按一次空格执行的代码。

mov ah,7;21h号中断的7号功能，读出键盘缓冲区不回显。
int 21h

CNend:
pop ax
ret
```

进阶要求：

1. 给小鸟增加重力加速度效果，没有按键，小鸟会自由落体。（建议：可以用一些数据模拟，然后缩小100倍作为实际移动的距离。例如，小鸟活动范围为上下21行，可以模拟为2100米，显示的时候缩小一百倍确定小鸟实际显示位置）
2. 按键会减小小鸟的下落速度，并一定程度的让小鸟向上位移一段距离。
3. 增加控制，例如游戏失败可以选择重新开始还是退出游戏，可以重新开始的次数（生命数），通过多少柱子可以过一关，过关提升难度（提升水平速度，减小柱子空挡等）。
4. 显示一些参数，比如通过的柱子数，当前生命剩余数，小鸟当前下落速度等。
