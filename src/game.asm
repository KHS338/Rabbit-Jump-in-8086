[org 0x0100]
jmp start


;-----------------------------------------------
;   Data Segment
;-----------------------------------------------

;------------Sprite Data---------------------


rabbit:db 0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08     ;  0
       db 0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08     ;  1
       db 0x08,0x08,0x08,0x08,0x08,0x00,0x00,0x0F,0x00,0x00,0x08,0x08,0x08,0x08,0x08,0x08     ;  2
       db 0x08,0x08,0x08,0x08,0x00,0x0F,0x0F,0x00,0x0F,0x0F,0x00,0x08,0x08,0x08,0x08,0x08     ;  3
       db 0x08,0x08,0x08,0x08,0x00,0x0F,0x07,0x00,0x0F,0x07,0x00,0x08,0x08,0x08,0x08,0x08     ;  4
       db 0x08,0x08,0x08,0x08,0x00,0x0F,0x07,0x00,0x0F,0x07,0x00,0x08,0x08,0x08,0x08,0x08     ;  5
       db 0x08,0x08,0x08,0x08,0x00,0x0F,0x07,0x00,0x0F,0x07,0x00,0x08,0x08,0x08,0x08,0x08     ;  6
       db 0x08,0x08,0x08,0x00,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x00,0x08,0x08,0x08,0x08     ;  7
       db 0x08,0x08,0x08,0x00,0x0F,0x0F,0x00,0x0F,0x0F,0x00,0x0F,0x00,0x08,0x08,0x08,0x08     ;  8
       db 0x08,0x08,0x00,0x00,0x0F,0x0F,0x00,0x0F,0x0F,0x00,0x0F,0x00,0x08,0x08,0x08,0x08     ;  9
       db 0x08,0x00,0x0F,0x00,0x0F,0x0F,0x0F,0x0F,0x00,0x0F,0x0F,0x00,0x08,0x08,0x08,0x08     ; 10
       db 0x08,0x00,0x00,0x0F,0x00,0x0F,0x0F,0x0F,0x0F,0x0F,0x00,0x08,0x08,0x08,0x08,0x08     ; 11
       db 0x08,0x00,0x0F,0x0F,0x0F,0x00,0x00,0x00,0x00,0x00,0x08,0x08,0x08,0x08,0x08,0x08    ; 12
       db 0x08,0x00,0x0F,0x0F,0x00,0x0F,0x0F,0x00,0x0F,0x00,0x08,0x08,0x08,0x08,0x08,0x08     ; 13
       db 0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x08,0x08,0x08,0x08,0x08,0x08     ; 14
       db 0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08     ; 15

carrot:db 0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x00,0x08,0x08;  0
       db 0x08,0x08,0x08,0x08,0x08,0x08,0x00,0x02,0x00,0x08;  1
       db 0x08,0x08,0x08,0x08,0x00,0x00,0x02,0x00,0x02,0x00;  2
       db 0x08,0x08,0x08,0x00,0x2A,0x2A,0x00,0x02,0x00,0x08;  3
       db 0x08,0x08,0x00,0x2A,0x00,0x2A,0x2A,0x00,0x08,0x08;  4
       db 0x08,0x00,0x2A,0x2A,0x2A,0x2A,0x2A,0x00,0x08,0x08;  5
       db 0x08,0x00,0x2A,0x2A,0x00,0x2A,0x00,0x08,0x08,0x08;  6
       db 0x00,0x2A,0x00,0x2A,0x2A,0x00,0x08,0x08,0x08,0x08;  7
       db 0x00,0x2A,0x2A,0x00,0x00,0x08,0x08,0x08,0x08,0x08;  8
       db 0x08,0x00,0x00,0x08,0x08,0x08,0x08,0x08,0x08,0x08;
;----------------------------------------------------------------------------
gametitle: db "Rabbit Jump",0
intro1: db "Hello ! And Welcome !!!",0
intro2: db "PLay this Game using space key",0
intro3: db "Rabbit Jumps When space is pressed",0
intro4: db "Collect as many carrots as possible",0
intro5: db "But WatchOut for Blue Tile.",0
intro6: db "BlueTiles breakDown after some time"
intro7: db "     Enjoy!!!!     "
intro8: db "Press Enter to Start the Game",0

end1: db"Your Score is : "
end2: db "Developed By : "
mem1: db "ol kijuhyg aqertd(12A-9089)"
mem2: db "Hamza Sajjad (22L-6773)"



;--------------------------------------------
exit1: db "Are you sure you want to Exit",29
exit2: db "Yes(y)                No(n)"

;------------------------------------------------------------------------------------------
magicNumberColor: dw 0
magicNumberPos: dw 0
magicNumberState : dw 0
;-----------------------
;Shifting for Rabbit
rabbitShiftOffset : dw 2

;Shift Direction for the three tiles 
; 1  --> for RightShift  ,  -1 --> for LeftShift , 0 -->  no shift

;--------------------
upperTileShift: dw 0
middleTileShift: dw 0
lowerTileShift: dw 0

; 0  --> no shifting  , 1 --> LeftShifting  , 2---> RightShifting
upperTileDir: dw 1
middleTileDir: dw -1
lowerTileDir: dw 1

;Tiles States
;  1  --> normal  ,  2  -->  moving/shifting  ,  3--> break
upperTileState : dw 2
middleTileState :dw 1
lowerTileState : dw 2
;Tile colors . 
upperTileColor: dw 41
MidTileColor: dw 32
LowerTileColor: dw 43

;-----------------------------
;  GLobal Variables for rabbit Position
rabbitPosX : dw 175
rabbitPosY : dw 135

;-------------------------------------
;    Carrots
;  State 1 --> Show 0--> Dont Show
;carrot 1
carrotState: dw 1
carrotPosX: dw 165
carrotPosY:dw 160
carrotCollected: dw 0
;--------------------------------------
;    Tiles Colors Array
tileColors : db 41,32,43,02
;			red,blue,yellow,green
;-----------------------------
;Global variables for Tiles Position 

upperTileX :dw 130
upperTileY : dw 100

middleTileX:	dw 160
middleTileY:	dw 130

lowerTileX : dw 190
lowerTileY : dw 125

;------------------------------
shiftL : dw 0
shiftR : dw 68

;---------------------------
score : dw 0
;--------------------------
; Flag Set For Blue tiles
;  1  --> rabbit on blue tile  0 --> rabbit not on blue tile
onBlueTile : dw 0
;--------------------
;tick counts for using in timer function_2
onBlueTileTimer: dw 0

;------------------------
jmpFlag: dw 0
exitFlag:dw 0
gameEndFlag: dw 0
;-----------------------------------------------------
;musicArray: dw 2415,4061,2711,4061,2711,3416,6087,1809,3619,2873,2711,4061
size: dw 12

; PCB layout:
; ax,bx,cx,dx,si,di,bp,sp,ip,cs,ds,ss,es,flags,next,dummy
; 0, 2, 4, 6, 8,10,12,14,16,18,20,22,24, 26 , 28 , 30
pcb: times 4*16 dw 0 ; space for 3 PCBs
stack: times 4*32 dw 0 ; space for 3 32 byte stacks
nextpcb: dw 1 ; index of next free pcb  0  -->  1  -->  2  -->   repeat 
current: dw 0 ; index of current pcb	0  -->  1  --> 2
oldTMR : dd 0
oldKey : dd 0
musicArrayIndex: dw 0

pauseScreen:times 10880 dw 0

music_length: dw 24576
music_data: incbin "pacman.imf"
;-----------------------------------------------------















drawtriangles:
	mov ax,10
	mov bx,55
	mov dx,50
	mov cx,5
drawing_loop:
	push dx
	push ax
	push bx
	add bx,50	;i[bp+6]
	add dx,2
	call drawTriangle
	loop drawing_loop
	mov ax,20
	mov bx,77
	mov dx,80
	mov cx,8
drawing_loop_2:
	push dx
	push ax
	push bx
	add bx,30	;i[bp+6]
	add dx,2
	call drawTriangle
	loop drawing_loop_2
	ret
drawCars:
	mov ax,85
	push ax
	mov ax,200
	push ax
	mov ax,00
	push ax
	mov ax,42
	push ax
	call drawCar
	mov ax,75	;i --cordinate	[bp+10]
	push ax
	mov ax,120	;j--cordinate	[bp+8]
	push ax
	mov ax,18 ;color-1		[bp+6]
	push ax
	mov ax,32 ;color-2		[bp+4]
	push ax
	call drawCar
	mov ax,100	;i --cordinate	[bp+10]
	push ax
	mov ax,120	;j--cordinate	[bp+8]
	push ax
	mov ax,18 ;color-1		[bp+6]
	push ax
	mov ax,32 ;color-2		[bp+4]
	push ax
	call drawCar
	ret

drawHeli:
	mov ax,85
	push ax
	mov ax,50
	push ax
	call helic
	ret
Backgrounds:
	mov ax,0
	mov bx,0
	mov cx,66
	mov dx,320 
	push ax
	push bx
	push cx
	push dx
	mov ax,1
	push ax
	call drawRect
	mov ax,67
	mov bx,0
	mov cx,63
	mov dx,320
	push ax
	push bx
	push cx
	push dx
	mov ax,19
	push ax
	call drawRect
	ret



rabbitFallingAnim:

	call delay
	mov cx,15
	FallingLoop:
		add word[rabbitPosX],1
		call renderGame
		;call delay
		loop FallingLoop
	
	mov cx,50
	beforeExitDelay:
		call delay
		loop beforeExitDelay
	jmp gameEnd

	
rabbitJump:
	push bp
	mov bp,sp
	push cx
	push ax
	mov cx,30
	; When space is pressed move rabbit by one pixel
	; and render scene at each position change
	; Give effect Of Rabbit Jumping
	mov word[onBlueTileTimer],0
	sub word[rabbitPosX],8
	call carrotCollect
rabbitJumpLoop:
	
	call moveTilesDown
	
	call delay
	call renderGame
	loop rabbitJumpLoop
	
	
	call moveDown
	call RestorePositions
	call renderGame
	
	cmp word[carrotCollected],1
	je newCarrots
	call carrotsUpdate
	
	
	newCarrots:
		call randomCarrotInit
		jmp restoreRabbitPos
		
	
	
	
	restoreRabbitPos:
	add word[rabbitPosX],8
	call renderGame
	
	call isOnBlueTile
	call rabbitFall
	
rabbitJumpEnd:
	mov word[jmpFlag],0
;---------------------------
	;Before exiting we check if rabbit is falling down 
	;  ax -> 0 not falling down  ax -> 1 falling down and do falling animation
	;---------------------------
	;After Jump is successful wait and then move the scene downwards
	; Changing Pixels and Colors was easy than scroll down
	pop ax
	pop cx
	mov sp,bp
	pop bp
	ret
	

;Event Loop 
; Checks if any keyboard key is pressed ,If yes then check if space is pressed
; If yes then jumps 

eventLoop:
	push bp
	mov bp,sp
	push ax
	
	
	
	; mov ah,01h	;Interrupt to check if any key is pressed
	; int 16h
	; jz eventLoopEnd	; If not do some other work
	; mov ah,00h		; Else if Pressed Get which was pressed
	; int 16h
	; cmp al,0x20		;  Was space pressed.
	; jne eventLoopEnd	
	cmp word[exitFlag],1
	jne jmpComp
	call ExitConfirmScreen
	jmp eventLoopEnd
	
	
jmpComp:
	cmp word[jmpFlag],1
	jne eventLoopEnd
	call rabbitJump
	;call MoveInfinitely

eventLoopEnd:
	call TimeDiff
	call shiftingObjects
	pop ax
	mov sp,bp
	pop bp
	ret
	
	
shiftingObjects:
	push bp
	mov bp,sp
	call shiftRabbit
	call shiftTiles
	mov sp,bp
	pop bp
	ret
	
;Randers each object in game scene
renderGame:	
	push bp
	mov bp,sp
	;  Some slowing down bcuz of infinite shift so keep it commented for now
	;;;call MoveInfinitely
	call drawGameBackground
	call drawTiles
	call drawCarrots
	call drawRabbitSprite
	;;call MoveInfinitely
	call printScore
	
	mov sp,bp
	pop bp
	ret
	
	
MoveInfinitely:
	push word[shiftL]
	call shiftLeft
	add word[shiftL],1
	cmp word[shiftL],68
	jne u1
	mov word[shiftL],0
u1:	
	push word[shiftR]
	call shiftRight
	add word[shiftR],1
	cmp word[shiftR],120
	jne u2
	mov word[shiftR],68
u2:
	ret


drawTrees:
	push bp
	mov bp, sp 
	push dx 
	push cx 
	
	mov cx, 10
	mov dx, 30
	
tloop: 
	push dx 
	call drawTree
	add dx, 30
	loop tloop
	
	pop cx 
	pop dx 
	pop bp 
	ret 

delay:     
			push cx
			mov cx, 0xFFFF
loop1:		
			loop loop1
			mov cx, 0xFFFF
loop2:		
			loop loop2

			pop cx
			ret





start:
	mov ax,13h
	int 0x10
	
	call printTitleScreen
	
	
	push cs
	push tone
	call initPCB
	
	push cs
	push shiftInfintite
	call initPCB

	call hooktimer
	call hookKeyBoard
	
	
	
	call Backgrounds
	call drawtriangles
	call drawTrees	
	call drawCars
	call drawHeli
	call drawGameBackground
	
	
GameLoop:
	cmp word[gameEndFlag],1 
	je rabbitFallingAnim
	call eventLoop
	;--------------------
	; Loop for slowing things down
	;Higher value of cx more slow game and vice versa
	
	mov cx,1
delayloop:
		call delay
		loop delayloop
	call renderGame
		
	jmp GameLoop
	
	


	
gameEnd:

	call unHookTimer
	call unHookKeyBoard
	call endScreenPrint
	
LastKey:
	mov ah,01h
	int 16h
	jz LastKey
	mov ah,00h
	int 16h
	cmp al,0xD
	jnz LastKey
	mov ax,0003h
	int 10h
	mov ax,0x4c00
	int 0x21


%include 'function.asm'




