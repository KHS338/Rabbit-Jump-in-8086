

;---------------------------------------------------
;		DrawTriangle(Color,position x ,position y )
;		range => i (0,199) , range => j(0,339)  ,range => color(0,255)
;		[bp+8]--->color
;		[bp+6]--->i
;		[bp+4]--->j
;---------------------------------------------------

drawTriangle:		;(i,j,color)
	push bp
	mov bp,sp
	sub sp,4		;Local ariables for storing local values for loops
	push ax
	push bx
	push cx
	push dx
	;-----------------
	mov ax,[bp+6]    ;Calculating Starting position given i and j
	mov cx,320
	mul cx
	add ax,[bp+4]
	mov di,ax		;Moving the starting position of triangle in di
	;------------------
	mov ax,0a000h		;Pointing to graphics memory video base
	mov es,ax
	;-----------------
	mov ax,[bp+8]
	mov dx,0
	mov cx,66
	sub cx,[bp+6]
	mov [bp-2],di		;Moving the starting position in local varibales for constant offset 
	mov [es:di],al
	mov dx,0
	mov word[bp-4],1	;For inner loop counter
DrawTriangleLoop1:
	add dx,1
	add word[bp-4],1
	add word[bp-2],320		;Outer loop for going down or moving along edges
	mov di,word[bp-2]		;Inner loop for filling the raingle from one edge to other
	sub di,dx				;the pixel placement is in order number
							;1-->3-->5-->7-->9-->11-->.....
	;------------------------------
	push dx					
	push cx					;Saving value of cx for outer loop usage
	mov cx,dx				;The inner loop will run in odd numbers which is taken care off by dx and [bp-4]
	add cx,[bp-4]
	;------------------------------
	DrawTriangleLoop2:
		rep stosb
		; mov byte[es:di],al		;Moving al beacuse each pixel is 1 byte only so take pass the color value in ax but take the al part only
		; add di,1				;Filling the  trinagle from one edge to other or filling up a row of triangle
		; loop DrawTriangleLoop2
	;--------------------------------
	;Getting original values of cx and dx back
	pop cx
	pop dx
	loop DrawTriangleLoop1
	
	
	pop dx
	pop cx
	pop bx
	pop ax
	add sp,4
	mov sp,bp
	pop bp
	ret 6
	
	
;---------------------------------------------------
;		DrawCar(position x,position y ,color1 ,color2 )
;		range => i (0,199) , range => j(0,339)  ,range => color(0,255)
;		[bp+10]--->i
;		[bp+8]--->j
;		[bp+6]--->color1(Body Upper Part)
;		[bp+4]--->color2(Body Lower Part)
;---------------------------------------------------



drawCar:
	push bp
	mov bp,sp
	;--------------------------------------------------
	;Drawing car body Lower part
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,5	;size_x
	push ax
	mov ax,15	;size_y
	push ax
	mov ax,[bp+6]	;color
	push ax
	call drawRect
	;--------------------------------------------------
	;Drawing car body Lower part
	mov ax,[bp+10]
	add ax,5	;i
	push ax
	mov ax,[bp+8]
	sub ax,5	;j
	push ax
	mov ax,5
	push ax		;size_x
	mov ax,25
	push ax		;size_y
	mov ax,[bp+4]
	push ax		;color
	call drawRect
	;--------------------------------------------------
	;Drawing car tyres
	mov cx,2
	mov bx,0
	mov ax,7
	add ax,[bp+10]
	mov dx,ax
	add dx,1
	car_tires:
		mov ax,dx
		push ax
		mov ax,[bp+8]
		add ax,bx
		push ax
		mov ax,4
		push ax
		mov ax,4
		push ax
		mov ax,0
		push ax
		call drawRect
		add bx,10
		loop car_tires
	mov sp,bp
	pop bp
	ret 8

;15 30 15 5 06 02 
;---------------------------------------------------
;		DrawHelic(position x,position y )
;		range => i (0,199) , range => j(0,339)
;		[bp+6]--->i
;		[bp+4]--->j
;		;Draws a somewhat helicopter looking things  :/
;---------------------------------------------------


helic:
	push bp
	mov bp,sp
	;-----------------------------------------------------
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax				;Draw Body of Helicpoter
	mov ax,12
	push ax
	mov ax,20
	push ax
	mov ax,4
	push ax
	call drawRect
	;------------------------------------
	mov ax,[bp+6]
	add ax,2
	push ax
	mov ax,[bp+4]
	add ax,10			;Draw Window or CockPit
	push ax
	mov ax,6
	push ax
	mov ax,12
	push ax
	mov ax,8
	push ax
	call drawRect
	;---------------------------------------
	mov ax,[bp+6]
	add ax,4
	push ax
	mov ax,[bp+4]
	sub ax,35			;Draw tail	of HElicopter
	push ax
	mov ax,3
	push ax
	mov ax,35
	push ax
	mov ax,8
	push ax
	call drawRect
	;-----------------------------------------
	mov ax,[bp+6]
	sub ax,2
	push ax
	mov ax,[bp+4]
	add ax,8		;Draw Main rotor
	push ax
	mov ax,2
	push ax
	mov ax,6
	push ax
	mov ax,8
	push ax
	call drawRect
	;---------------------------------------------
	mov ax,[bp+6]
	sub ax,4
	push ax
	mov ax,[bp+4]
	sub ax,20
	push ax			;Draw Main rotor Blade
	mov ax,2
	push ax
	mov ax,60
	push ax
	mov ax,8
	push ax
	call drawRect
	;----------------------------------------------
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	sub ax,35			;Draw Rudder
	push ax				;The T thingy on tail of helicopter
	mov ax,4
	push ax
	mov ax,3
	push ax
	mov ax,8
	push ax
	call drawRect
	;----------------------------------------------------------
	mov ax,[bp+6]
	add ax,15
	push ax
	mov ax,[bp+4]		;Landing Skits
	sub ax,2			;For landing else it will crash ;)
	push ax
	mov ax,2
	push ax
	mov ax,24
	push ax
	mov ax,8
	push ax
	call drawRect
	;-------------------------------------------------------
	mov bx,[bp+6]
	add bx,12
	mov cx,2			;Landing skits Handles
	xor dx,dx			;Part of Landing Gear
	mov dx,5			;Part of Landing Gear
	Helic_loop:
		push bx
		mov ax,[bp+4]
		add ax,dx
		push ax
		push 3
		push 1
		push 8
		call drawRect
		add dx,10
		loop Helic_loop
	mov sp,bp
	pop bp
	ret 4 







;----------------------------------
;  	getPos(poisiton i,position j)
;	range => i (0,199) , range => j(0,319)
;		[bp+i]--->i
;		[bp+4]--->j	
;	Given a point x and y coodrinate return the position of that point on screen
;-----------------------------------

getPos:
	push bp
	mov bp,sp
	push dx
	push cx
	mov ax,[bp+6]		;i -- coordinate
	mov cx,320
	mul cx
	add ax,[bp+4]		;j --  coordinate
	mov sp,bp
	pop cx
	pop dx
	mov sp,bp
	pop bp
	ret 4
	
;---------------------------------------------------
;		DrawRect(position x,position y,size_x,size_y ,color )
;		range => i (0,199) , range => j(0,339)  ,range => color(0,255)
;		[bp+12]--->i
;		[bp+10]--->j
;		[bp+8]--->Horizontal size / Width
;		[bp+6]--->Vertical size  / Height
;		[bp+4]--->Color
;---------------------------------------------------


drawRect:
	push bp
	mov bp,sp
	push es
	push ax
	push bx
	push cx
	push dx
	;---------------------------
	mov ax,0a000h
	mov es,ax
	;----------------------------
	mov ax,[bp+12]
	push ax
	mov ax,[bp+10]
	push ax
	call getPos
	;-----------------------------
	mov di,ax
	xor ax,ax
	mov ax,[bp+4]
	mov cx,[bp+8]
	mov dx,[bp+6]
	mov bx,di
rect_l1:	
	push cx		;Outer loop for Moving from one row down
	mov cx,dx
	rect_l2:
		rep stosb
		; mov byte[es:di],al		;Inner loop for Filling the triangle with color
		; add di,1
		; loop rect_l2
	pop cx
	add bx,320
	mov di,bx
	loop rect_l1
	
	
	pop dx
	pop cx
	pop bx
	pop ax
	pop es
	mov sp,bp
	pop bp
	ret 10



;-------------------------------------------------
;		shiftLeft(row_number i)
;		range => i (0,199)
;		[bp+4]---> row number
;		Given a row number shifts that row left by one unit
;------------------------------------------------	
shiftLeft:
	push bp
	mov bp,sp
	push ax
	push bx
	push cx
	push dx
	;-----------------------
	mov ax,[bp+4]
	push ax
	mov ax,0
	push ax
	call getPos
	;-----------------------
	mov di,ax
	mov ax,0a000h
	mov es,ax
	mov al,byte[es:di]
	push ax			;Saves the value of row last pixel and pushes it on stack
	mov cx,319
	mov si,di
	add si,1
shiftLeftLoop:
		mov al,byte[es:si]
		mov byte[es:di],al
		add si,1
		add di,1
		loop shiftLeftLoop
	pop ax		;Restores the pushed value from stack and put it in video memory
	mov byte[es:di],al
	pop dx
	pop cx
	pop bx
	pop ax
	mov sp,bp
	pop bp
	ret 2
	
	

	
;-------------------------------------------------
;		shiftRight(row_number i)
;		range => i (0,199)
;		[bp+4]---> row number
;		Given a row number shifts that row Right by one unit
;------------------------------------------------	

shiftRight:
	push bp
	mov bp,sp
	push ax
	push bx
	push cx
	push dx
	;-----------------------
	mov ax,[bp+4] ; row number 
	push ax
	mov ax,319 ; column number 
	push ax
	call getPos ; getting last cell of the row 
	;-----------------------
	mov di,ax
	mov ax,0a000h
	mov es,ax
	mov al,byte[es:di]
	push ax			;Saves the value of row first pixel and pushes it on stack
	mov cx,319
	mov si,di
	sub si,1
	;std
shiftRightLoop:
		;rep movsb
		mov al,byte[es:si]
		mov byte[es:di],al
		sub si,1
		sub di,1
		loop shiftRightLoop
	pop ax			;Restores the pushed value from stack and put it in video memory
	mov byte[es:di],al
	pop dx
	pop cx
	pop bx
	pop ax
	mov sp,bp
	pop bp
	ret 2


;---------------------------------------------------
;		DrawTree(position x,position y )
;		range => i (0,199) , range => j(0,339)
;		[bp+4]--->j
;		
;	 
;		
;---------------------------------------------------
drawTree:
	push bp
	mov bp,sp
	push dx 
	push cx 	
	push bx 
	push si 
	;--------------------------------------------------
	;Drawing tree Lower part
	mov dx, 52;i 52 
	push dx
	mov ax, [bp+4]; j 30
	push ax
	mov ax,15	;size_x 15
	push ax
	mov ax,5	;size_y 5
	push ax
	mov ax,06	;color 
	push ax
	call drawRect
	
	
	;--------------------------------------------------
	mov cx, 4
	;Drawing tree upper part
	mov bx, [bp+4]
	sub bx, 7 
	mov si, 20 
treelower:
	sub dx, 3 ;i 
	push dx
	add bx, 2 ; j 
	push bx 
	mov ax, 3	;size_x
	push ax
	sub si, 4	;size_y
	push si  
	mov ax,02	;color
	push ax
	call drawRect
	loop treelower
	

	pop si 
	pop bx 
	pop cx 
	pop dx 
	mov sp,bp
	pop bp
	ret 2


drawGameBackground:
	push bp
	mov bp,sp
	mov ax,130
	push ax
	mov ax,0
	push ax
	mov ax,73
	push ax
	mov ax,320
	push ax
	mov ax,54
	push ax
	call drawRect
	;call MoveInfinitely
	mov sp,bp
	pop bp
	ret



	printTitleScreen:
		push bp
		mov bp,sp
		push ax
		push bx
		push cx
		push dx
		push si
		push di
		push es
		push ds
		
		push ds		;Dont touch this Else Game error
		pop es		;Dont touch this Else Game error
		
		; push 0
		; push 0
		; push 200
		; push 320
		; push 16
		; call drawRect
		push bp		;Dont touch this Else Game error
		
		mov ah,13h
		mov al,01h
		mov bh,1
		mov bl,23
		
		
		mov cx,11
		mov dh,2
		mov dl,13
		mov bp,gametitle
		int 10h
		
		mov cx,23
		mov dh,4
		mov dl,8
		mov bp,intro1
		int 10h
		
		mov cx,30
		mov dh,6
		mov dl,3
		mov bp,intro2
		int 10h
		
		mov cx,34
		mov dh,8
		mov dl,2
		mov bp,intro3
		int 10h
		
		mov cx,35
		mov dh,10
		mov dl,2
		mov bp,intro4
		int 10h
		
		mov cx,27
		mov dh,12
		mov dl,5
		mov bp,intro5
		int 10h
		
		mov cx,35
		mov dh,14
		mov dl,2
		mov bp,intro6
		int 10h
		
		mov cx,29
		mov dh,16
		mov dl,4
		mov bp,intro8
		int 10h
		
		mov cx,15
		mov dh,18
		mov dl,7
		mov bp,intro7
		int 10h
		
		pop bp		;Dont touch this Else Game error
			
		titleWaitLoop:
			mov ah,01h
			int 16h
			jz titleWaitLoop
			mov ah,00h
			int 16h
			cmp al,0xD
			jne titleWaitLoop
			
		
	printTitleScreenEnd:
		
		pop ds
		pop es
		pop di
		pop si
		pop dx
		pop cx
		pop bx
		pop ax
		mov sp,bp
		pop bp
		ret
	
	endScreenPrint:
		push bp
		mov bp,sp
		push ax
		push bx
		push cx
		push dx
		push si
		push di
		push es
		push ds
		
		;push bp
		
		push 0
		push 0
		push 200
		push 320
		push 0
		call drawRect
		
		
		
		;pop bp
		
		; push ds
		; pop es
		mov ax,ds
		mov es,ax
		
		;push bp		;Dont touch this Else Game error
		push bp
		
		mov ah,13h
		mov al,01h
		mov bh,1
		mov bl,23
		
		mov cx,16
		mov dh,10
		mov dl,7
		mov bp,end1
		int 10h
		
		pop bp
		
		
		push 23
		push 10
		push word[score]
		call printnum
		push bp
		
		mov cx,15
		mov dh,18
		mov dl,12
		mov bp,end2
		int 10h
		
		mov cx,27
		mov dh,20
		mov dl,6
		mov bp,mem1
		int 10h
		
		
		mov cx,23
		mov dh,22
		mov dl,8
		mov bp,mem2
		int 10h
		
		pop bp

		pop ds
		pop es
		pop di
		pop si
		pop dx
		pop cx
		pop bx
		pop ax
		mov sp,bp
		pop bp
		ret
	
drawRabbit:
	push bp
	mov bp,sp
	mov ax,[rabbitPosX]
	push ax
	mov ax,[rabbitPosY]
	push ax
	mov ax,15
	push ax
	mov ax,15
	push ax
	mov ax,0xf
	push ax
	call drawRect
	mov sp,bp
	pop bp
	ret
	
	
	
	drawCarrots:
		push bp
		mov bp,sp
		push ax
		
		carrot1Draw:
			cmp word[carrotState],1
			jne drawCarrotsEnd
			mov ax,[carrotPosX]
			push ax
			mov ax,[carrotPosY]
			push ax
			call drawCarrotSprite
		drawCarrotsEnd:
			pop ax
			mov sp,bp
			pop bp
			ret
	
	
	
	
	
	
drawCarrotSprite:
	push bp
	mov bp,sp
	sub sp,2
	push ax
	push bx
	push cx
	
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	call getPos
	mov di,ax
	mov word[bp-2],di
	
	
	mov ax,0xA000
	mov es,ax
	

	; mov bx,rabbit
	mov bx,0
	mov si,0
	mov cx,100
	mov dx,0
	carrotSpriteLoop:
			mov al,byte[carrot+bx]
			cmp al,0x08
			je carrotdrawskip
			mov byte[es:di],al
		
	carrotdrawskip:	
			add di,1
			add si,1
			cmp si,10
			jne carrotContinue
	carrotNextline:	
			mov si,0
			add word[bp-2],320
			mov di,word[bp-2]

	carrotContinue:
		add bx,1
		loop carrotSpriteLoop
		
		
	pop cx
	pop bx
	pop ax
	add sp,2
	mov sp,bp
	pop bp
	ret 4
	
	
drawRabbitSprite:
	push bp
	mov bp,sp
	sub sp,2
	push ax
	push bx
	push cx
	
	mov ax,word[rabbitPosX]
	push ax
	mov ax,[rabbitPosY]
	push ax
	call getPos
	mov di,ax
	mov word[bp-2],di
	
	
	mov ax,0xA000
	mov es,ax
	

	; mov bx,rabbit
	mov bx,0
	mov si,0
	mov cx,256
	mov dx,0
	rabbitSpriteLoop:
			mov al,byte[rabbit+bx]
			cmp al,0x08
			je drawskip
			mov byte[es:di],al
		
	drawskip:	
			add di,1
			add si,1
			cmp si,16
			jne continue
	nextline:	
			mov si,0
			add word[bp-2],320
			mov di,word[bp-2]

	continue:
		add bx,1
		loop rabbitSpriteLoop
		
		
	pop cx
	pop bx
	pop ax
	add sp,2
	mov sp,bp
	pop bp
	ret
	
drawTiles:
	;call MoveInfinitely
	push bp
	mov bp,sp
	mov ax,[upperTileX]
	push ax
	mov ax,[upperTileY]
	push ax
	mov ax,5
	push ax
	mov ax,40
	push ax
	mov ax,word[upperTileColor]
	push ax
	call drawRect
	
	mov ax,[middleTileX]
	push ax
	mov ax,[middleTileY]
	push ax
	mov ax,5
	push ax
	mov ax,40
	push ax
	mov ax,word[MidTileColor]
	push ax
	call drawRect
	
	
	mov ax,[lowerTileX]
	push ax
	mov ax,[lowerTileY]
	push ax
	mov ax,5
	push ax
	mov ax,40
	push ax
	mov ax,word[LowerTileColor]
	push ax
	call drawRect
	
	;call MoveInfinitely
	mov sp,bp
	pop bp
	ret
	
	
	shiftTiles:
		push bp
		mov bp,sp
		push ax
		;call MoveInfinitely
		shiftTile1:
						cmp word[upperTileState],2
						je 	shiftUpperTile
						mov word[upperTileShift],0
		
		shiftTile2:
						
						cmp word[middleTileState],2
						je  shiftMiddleTile 
						mov word[middleTileShift],0
		
		shiftTile3: 
						cmp word[lowerTileState],2
						je 	shiftLowerTile
						mov word[lowerTileShift],0
		
		
		jmp updateTilePos
		
		shiftUpperTile:
			
			cmp word[upperTileDir],-1
			jne UpperTileRightBound
			
			UpperTileLeftBound:
				mov word[upperTileShift],-1
				cmp word[upperTileY],70
				jg shiftTile2
				mov word[upperTileShift],1
				mov word[upperTileDir],1
				jmp shiftTile2
				
				
			UpperTileRightBound:
				mov word[upperTileShift],1
				cmp word[upperTileY],170
				jl shiftTile2
				mov word[middleTileShift],-1
				mov word[upperTileDir],-1
				jmp shiftTile2
				
		shiftMiddleTile:
			
			
			cmp word[middleTileDir],-1
			jne middleTileRightBound
			
			middleTileLeftBound:
				
				mov word[middleTileShift],-1
				cmp word[middleTileY],70
				jg shiftTile3
				mov word[middleTileShift],1
				mov word[middleTileDir],1
				jmp shiftTile3
				
				
			middleTileRightBound:
				mov word[middleTileShift],1
				cmp word[middleTileY],170
				jl shiftTile3
				mov word[middleTileShift],-1
				mov word[middleTileDir],-1
				jmp shiftTile3
		
		
		
		shiftLowerTile:
			
			cmp word[lowerTileDir],-1
			jne lowerTileRightBound
			
			lowerTileLeftBound:
				mov word[lowerTileShift],-1
				cmp word[lowerTileY],70
				jg updateTilePos
				mov word[lowerTileShift],1
				mov word[lowerTileDir],1
				jmp updateTilePos
				
				
			lowerTileRightBound:
				mov word[lowerTileShift],1
				cmp word[lowerTileY],170
				jl updateTilePos
				mov word[lowerTileShift],-1
				mov word[lowerTileDir],-1
				
	
		
		updateTilePos:
			
			mov ax,word[upperTileShift]
			add word[upperTileY],ax
			
			mov ax,word[middleTileShift]
			add word[middleTileY],ax
			
			mov ax,word[lowerTileShift]
			add word[lowerTileY],ax
	
	
	
		;call MoveInfinitely
		pop ax
		mov sp,bp
		pop bp
		ret
	
	
	shiftRabbit:
		push bp
		mov bp,sp
		;call MoveInfinitely
		
		cmp word[lowerTileState],2
		jne shiftRabbitEnd 
		
		cmp word[lowerTileDir],1
		je rabbitRightShift
		

		mov word[rabbitShiftOffset],-1
		jmp UpdateRabbitPos
		
		rabbitRightShift:
			mov word[rabbitShiftOffset],1
		
		
	
	UpdateRabbitPos:
		mov ax,word[rabbitShiftOffset]
		add word[rabbitPosY],ax
	
	;call MoveInfinitely
	shiftRabbitEnd:
		mov sp,bp
		pop bp
		ret
	
	
	
	
	
	moveTilesDown:
		push bp
		mov bp,sp
		add word[upperTileX],1
		add word[middleTileX],1
		;add word[lowerTileX],1
		mov sp,bp
		pop bp
		ret
	
	
	RestorePositions:
		push bp
		mov bp,sp
		mov word[middleTileX],160
		mov word[lowerTileX],190
		mov word[upperTileX],130
		mov sp,bp
		pop bp
		ret
	
	
	
	moveDown:
		
		push bp
		mov bp,sp
		push ax
		push bx
		;add word[rabbitPosX],25
		; add word[MidTileX],25
		; add word[upperTileX],25
		
		
		tileInit:
		mov ax,word[MidTileColor]
		mov word[LowerTileColor],ax
		mov ax,word[upperTileColor]
		mov word[MidTileColor],ax
		
		
		mov ax,word[middleTileState]
		mov word[lowerTileState],ax
		mov ax,word[upperTileState]
		mov word[middleTileState],ax
		
		
		mov ax,word[middleTileY]
		mov word[lowerTileY],ax
		mov ax,word[upperTileY]
		mov word[middleTileY],ax
		
		mov ax,word[middleTileDir]
		mov word[lowerTileDir],ax
		mov ax,word[upperTileDir]
		mov word[middleTileDir],ax
		;;Adding Random Posiitons For Next tiles,carrots posiitons and states
		; For Upper Tile
		
		colorGen:
		mov ax,0
		push ax
		mov bx,3
		push bx			;Random Color Generation  
		call randomNumGen
		cmp ax,1
		je blueTileInit
		

		;mov bx,tileColors
		mov bx,ax
		mov al,[tileColors+bx]
		mov word[upperTileColor],ax
		
		stateGen:
		mov ax,1
		push ax
		mov bx,2
		push bx
		call randomNumGen		;Random State Generation
		mov word[upperTileState],ax
		
		
		shiftDirGen:
		mov ax,0
		push ax
		mov bx,2
		push bx
		call randomNumGen
		mov word[upperTileDir],ax
		jmp moveDownEnd
		
		blueTileInit:		
			mov word[upperTileColor],32
			mov word[upperTileState],3
			mov word[upperTileDir],0
			mov word[upperTileShift],0
		
		
		
		moveDownEnd:
		pop bx
		pop ax
		mov sp,bp
		pop bp
		ret


	
		
		



rabbitFall:

	; Simple Falling down Check mechanics After Each Jump
	; Rabbit Vertical Size is 15 px so it checks at rabbitPosx+16 pos of any coloured tile/pixel is present
	; If yes then rabbit isnt falling if no then rabbit is falling down
	push bp
	mov bp,sp
	push bx
	push cx
	push di
	;call MoveInfinitely
	
	mov bx,[rabbitPosX]
	
	add bx,16
	push bx
	mov bx,[rabbitPosY]
	add bx,3
	push bx
	call getPos
	mov di,ax
	mov cx,10
	mov word[gameEndFlag],1
	rabbitFallLoop:
			cmp byte[es:di],41
			je rabbitNotFalling
			cmp byte[es:di],43
			je rabbitNotFalling
			cmp byte[es:di],32
			je rabbitNotFalling
			cmp byte[es:di],02
			je rabbitNotFalling
			add di,1
			loop rabbitFallLoop


		jmp rabbitFallEnd


	rabbitNotFalling:
		mov word[gameEndFlag],0
		
	rabbitFallEnd:
		;call MoveInfinitely
		pop di
		pop cx
		pop bx
		mov sp,bp
		pop bp
		ret
	
	printScore:
		push bp
		mov bp,sp
		push 35
		push 17
		push word[score]
		call printnum
		mov sp,bp
		pop bp
		ret
	
	
	isOnBlueTile:
		push bp
		mov bp,sp
		
		mov ax,[rabbitPosX]
		add ax,17
		push ax
		mov ax,[rabbitPosY]
		push ax
		call getPos
		mov di,ax
		
		mov word[onBlueTile],0
		mov cx,15
		isOnBlueTileLoop:
			cmp byte[es:di],32	;IF Rabbit is on blue tile
			je BlueTileFlag
			;add di,1
			loop isOnBlueTileLoop
		jmp isOnBlueTileEnd
		
		BlueTileFlag:
			mov word[onBlueTile],1
		
			
		isOnBlueTileEnd:
			mov sp,bp
			pop bp
			ret

printnum:
				push bp
				mov bp, sp
				push es
				push ax
				push bx
				push cx
				push dx
				push di

				mov ax, [bp+4]		; load number in ax= 4529
				mov bx, 10			; use base 10 for division
                mov cx, 0			; initialize count of digits

nextdigit:		mov dx, 0			; zero upper half of dividend
				div bx				; divide by 10 AX/BX --> Quotient --> AX, Remainder --> DX ..... 
				add dl, 0x30		; convert digit into ascii value
				push dx				; save ascii value on stack

				inc cx				; increment count of values
				cmp ax, 0			; is the quotient zero
				jnz nextdigit		; if no divide it again


				mov dl,byte[bp+8]
                mov dh,byte[bp+6]
                mov ah,02h
                int 10h
                ; lea dx,scoreString
                ; mov ah,09h
                ; int 21h
				mov ah,0Eh
				mov bh,3
				mov bl,45
nextpos:
				pop dx				; remove a digit from the stack
				mov al,dl
				int 10h
				loop nextpos		; repeat for all digits on stack
				

				pop di
				pop dx
				pop cx
				pop bx
				pop ax
				pop es
				mov sp,bp
				pop bp
				ret 6
	

	
	TimeDiff:
		push bp
		mov bp,sp
		push dx
		push cx
		push ax
		cmp word[onBlueTile],1
		jne TimeDiffEnd
		
		mov ax,word[onBlueTileTimer]
		cmp ax,75
		jl TimeDiffEnd
		mov word[gameEndFlag],1
		;jmp rabbitFallingAnim
		
		
		TimeDiffEnd:
			
			pop ax
			pop cx
			pop dx
			mov sp,bp
			pop bp
			ret
			
			
			
	
	carrotCollect:
		push bp
		mov bp,sp
		sub sp,2
		push bx
		push cx
		push di
		mov ax,[rabbitPosX]
		push ax
		mov ax,[rabbitPosY]
		push ax
		call getPos
		
		mov di,ax
		mov word[bp-2],di
		mov word[carrotCollected],0
		mov bx,0
		mov cx,256
		carrotCollectLoop:
		
			cmp byte[es:di],42
			je carrotFound
			cmp byte[es:di],0x02
			je carrotFound
			
			add di,1
			add bx,1
			
			cmp bx,16
			jne carrCollcontinue
			mov bx,0
			add word[bp-2],320
			mov di,word[bp-2]
			
		carrCollcontinue:
			loop carrotCollectLoop
			
			
		jmp carrotCollectEnd
		
		carrotFound:
			mov word[carrotCollected],1
			mov word[carrotState],0
			add word[score],100
			
			
		carrotCollectEnd:
			pop di
			pop cx
			pop bx
			add sp,2
			mov sp,bp
			pop bp
			ret
		
		
	carrotsUpdate:
		push bp
		mov bp,sp
		push ax
		push bx
		carrotupdate:
			cmp word[carrotState],1
			jne carrotUpdateEnd
			add word[carrotPosX],30
			cmp word[carrotPosX],200
			jl carrotUpdateEnd
			carrotShow:
				mov word[carrotState],0
			
	carrotUpdateEnd:
		pop bx
		pop ax
		mov sp,bp
		pop bp
		ret
		
		
	randomCarrotInit:
		push bp
		mov bp,sp
		push ax
		push bx
		carrotRandomInit:
			cmp word[carrotState],0
			jne randomCarrotInitEnd
			mov ax,80
			push ax
			mov ax,160
			push ax
			call randomNumGen
			mov word[carrotPosY],ax
			mov ax,135
			mov word[carrotPosX],ax
			mov ax,1
			push ax
			mov ax,1
			push ax
			call randomNumGen
			mov word[carrotState],ax
	randomCarrotInitEnd:
		pop bx
		pop ax
		mov sp,bp
		pop bp
		ret
		
	randomNumGen:         ; generate a rand no using the system time
			push bp
			mov bp,sp
			sub sp,4
			push bx
			push cx
			push dx
			mov ax,[bp+4]  ;end    2		max
			mov bx,[bp+6]	;start 0		min
	
			sub ax,bx	;end-start
			mov word[bp-2],ax
			add word[bp-2],1
			
			;mov ah,00h  ; interrupts to get system time        
			;int 1Ah   ; cx:dx now hold number of clock ticks since midnight   
			rdtsc
			mov word[bp-4],ax
			;mov  ax, dx
			xor  dx, dx
			mov  cx, word[bp-2]
			div  cx       ; here dx contains the remainder of the division - from 0 to 9
			
			add dx,bx
			mov ax,dx
			
			pop dx
			pop cx
			pop bx
			add sp,4
			mov sp,bp
			pop bp
			ret 4

	
tone:
	; call MoveInfinitely
	; mov bp,sp
	; mov al,182
	; out 43h,al
	; ;mov cx,12
; musicLoop:
	; mov bx,word[cs:musicArrayIndex]
	; mov ax,[cs:musicArray+bx]
	; add word[cs:musicArrayIndex],2
	; cmp word[cs:musicArrayIndex],24
	; jne musicContinue
	; mov word[cs:musicArrayIndex],0
	; ; mov bx,0
	; ; mov ax,bx
	; ; add bx,2
	; ; cmp bx,24
	; ; jne continue
	; ; mov bx,0

; musicContinue:	
	; out 42h,al
	; mov al,ah
	; out 42h,al
	
	; in al,61h
	; or al,03
	; out 61h,al
	; call delay
	; call delay
	; call delay
	; call delay
	; call delay
	; call delay
	; ;loop musicLoop
	
	; in al,61h
	; and al,0xfc
	; out 61h,al
	
	; jmp tone
	; tone:
	
	
		
		; mov si,0
	; next_note:
		
		; ; mov dx, 388h
		; ; mov di,si
		; ; add di,music_data
		; ; mov al, [di+0]
		; ; out dx, al
		
		; ; ; 4) the second byte is the data need to
		; ; ;    be sent through the port 389h
		; ; mov dx, 389h
		; ; mov di,si
		; ; add di,music_data
		; ; mov al, [di+ 1]
		; ; out dx, al
		
		; ; ; 5) the last 2 bytes form a word
		; ; ;    and indicate the number of waits (delay)
		; ; mov di,si
		; ; add di,music_data
		; ; mov bx, [di+ 2]
		cmp word[cs:exitFlag],1
		je repeatMusic
	next_note:
		
		mov dx, 388h
		mov al, [cs:music_data+si+0 ]
		out dx, al
		
		; 4) the second byte is the data need to
		;    be sent through the port 389h
		mov dx, 389h
		mov al, [cs:music_data+si + 1]
		out dx, al
		
		; 5) the last 2 bytes form a word
		;    and indicate the number of waits (delay)
		mov bx, [cs:music_data+si + 2]
		
		; 6) then we can move to next 4 bytes
		add si, 4
		
		; 7) now let's implement the delay
		
	.repeat_delay:	
		mov cx, 15000 ; <- change this value according to the speed
		              ;    of your computer / emulator
	.delay:
		loop .delay
		
		dec bx
		jg .repeat_delay
		
		; 8) let's send all content of music_data
		cmp si, [cs:music_length]
		jb next_note
		
	repeatMusic:
		mov si,0
		jmp tone

hookKeyBoard:
	push ax
	push es
	push 0x0000
	pop es
	
	mov ax,word[es:9*4]
	mov word[oldKey],ax
	
	mov ax,word[es:9*4+2]
	mov word[oldKey+2],ax
	
	cli
	mov word[es:9*4],keyBoard
	mov [es:9*4+2],cs
	sti
	
	pop es
	pop ax
	ret

unHookKeyBoard:
	push ax
	push bx
	push es
	push 0x0000
	pop es
	
	mov ax,word[oldKey]
	mov bx,word[oldKey+2]
	
	cli 
	mov word[es:9*4],ax
	;mov ax,[oldKey+2]
	mov word[es:9*4+2],bx
	sti
	
	pop es
	pop bx
	pop ax
	ret
	
keyBoard:
		push ax
		in al,0x60
		
		cmp word[cs:exitFlag],1
		je noMatch
		cmp al,0x39
		jne nextComp
		mov word[cs:jmpFlag],1
		; jmp exit
		jmp noMatch
		
	nextComp:
		cmp al,01h
		jne noMatch
		mov word[cs:exitFlag],1
		mov word[cs:jmpFlag],0
		jmp noMatch
		;call ExitConfirmScreen
		
	resetExitFlag:
		
	resetJmpFlag:
		mov word[cs:jmpFlag],0
	
	; exit:	
		; pop ax
		; iret
		noMatch:
			pop ax
			jmp far [cs:oldKey]
	
hooktimer:
	push ax
	push es
		
	push 0x0000
	pop	es
			
	mov	ax,word[es:8*4]						; saving offset and segment of old timer handler
	mov	word[oldTMR], ax
			
	mov	ax, word[es:8*4+2]
	mov	word[oldTMR+2], ax
			
	cli
	mov	word[es:8*4],timer			; hooking our own timer
	mov	word[es:8*4+2], cs			
	sti

	pop	es
	pop ax	
	
	ret
unHookTimer:
	push ax 
	push bx
	push es
	push 0x0000
	pop es
	
	mov ax,word[oldTMR]
	mov bx,word[oldTMR+2]
	
	cli 
	mov word[es:8*4],ax
	mov word[es:8*4+2],bx
	sti
	
	
	pop es
	pop bx
	pop ax
	ret
	
	
	
	

timer:
	push ds
	
	push bx

	push cs
	pop ds
	
	cmp word[cs:exitFlag],1
	je pcbTimer
	cmp word[cs:onBlueTile],1
	jne resetBlueTileTimer
	add word[cs:onBlueTileTimer],1
	
	jmp pcbTimer
	resetBlueTileTimer:
		mov word[cs:onBlueTileTimer],0
	
	pcbTimer:
	
	mov bx,[current]
	
	shl bx,5
	
	mov [pcb+bx+0],ax
	mov [pcb+bx+4],cx
	mov [pcb+bx+6],dx
	mov [pcb+bx+8],si
	mov [pcb+bx+10],di
	mov [pcb+bx+12],bp
	mov [pcb+bx+24],es
	
	pop ax ; read original bx from stack
	mov [pcb+bx+2], ax ; save bx in current pcb
	pop ax ; read original ds from stack
	mov [pcb+bx+20], ax ; save ds in current pcb
	pop ax ; read original ip from stack
	mov [pcb+bx+16], ax ; save ip in current pcb
	pop ax ; read original cs from stack
	mov [pcb+bx+18], ax ; save cs in current pcb
	pop ax ; read original flags from stack
	mov [pcb+bx+26], ax ; save cs in current pcb
	mov [pcb+bx+22], ss ; save ss in current pcb
	mov [pcb+bx+14], sp ; save sp in current pcb
			
	mov bx, [pcb+bx+28] ; read next pcb of this pcb
	mov [current], bx ; update current to new pcb
	mov cl, 5
	shl bx, cl ; multiply by 32 for pcb start


	mov cx, [pcb+bx+4] ; read cx of new process
	mov dx, [pcb+bx+6] ; read dx of new process
	mov si, [pcb+bx+8] ; read si of new process
	mov di, [pcb+bx+10] ; read diof new process
	mov bp, [pcb+bx+12] ; read bp of new process
	mov es, [pcb+bx+24] ; read es of new process
	mov ss, [pcb+bx+22] ; read ss of new process
	mov sp, [pcb+bx+14] ; read sp of new process
	push word [pcb+bx+26] ; push flags of new process
	push word [pcb+bx+18] ; push cs of new process
	push word [pcb+bx+16] ; push ip of new process
	push word [pcb+bx+20] ; push ds of new process
	
	;read ds of new process
	mov al,0x20
	out 0x20,al
	mov ax, [pcb+bx+0] ; read ax of new process
	mov bx, [pcb+bx+2] ; read bx of new process
	pop ds 
	jmp far[cs:oldTMR]
	
	
	
	;iret
	
	
	
	
	
	
	
	
	
	initPCB:
	push bp
	mov bp,sp
	push ax
	push bx
	push cx
	push si
	
	mov bx,[nextpcb]
	mov cl,5
	shl bx,cl
	
	mov ax,[bp+6]
	mov [pcb+bx+18],ax
	
	mov ax,[bp+4]
	mov [pcb+bx+16],ax
	
	mov [pcb+bx+22],ds
	mov si,[nextpcb]
	;mov si,1
	
	mov cl,6
	shl si,cl
	
	add si,32*2+stack
	
	mov [pcb+bx+14],si
	
	mov word[pcb+bx+26],0x200
	
	
	mov ax,[pcb+28]
	mov [pcb+bx+28],ax
	mov ax,[nextpcb]
	mov [pcb+28],ax
	inc word [nextpcb]
	;mov word[pcb+bx+28],0
	
	pop si
	pop cx
	pop bx
	pop ax
	mov sp,bp
	pop bp
	ret 4
	
	
	
	
	
	
shiftInfintite:
	cmp word[cs:exitFlag],1
	je shi2
	push word[cs:shiftL]
	call shiftLeft
	add word[cs:shiftL],1
	cmp word[cs:shiftL],68
	jne shi1
	mov word[cs:shiftL],0
shi1:	
	push word[cs:shiftR]
	call shiftRight
	add word[cs:shiftR],1
	cmp word[cs:shiftR],120
	jne shi2
	mov word[cs:shiftR],68
shi2:
	jmp shiftInfintite
	
	
	
ExitConfirmScreen:
	push bp
	mov bp,sp
	push ax
	push bx
	push cx
	push dx
	push es
	push ds
	push si
	push di
	
	push ds
	pop es
	
	push 0xa000
	pop ds
	xor si,si
	mov si,320*68
	mov cx,10880
	mov di,pauseScreen
	cld
	rep movsw
	
	
	push 68
	push 0
	push 67
	push 320
	push 0
	call drawRect
	
	
	push bp
	
	mov ah,13h
	mov al,01h
	mov bh,1
	mov bl,15
	
	mov cx,29
	mov dh,9
	mov dl,5
	mov bp,exit1
	int 10h
	
	mov cx,27
	mov dh,14
	mov dl,3
	mov bp,exit2
	int 10h
	
	pop bp
	
	
	;  y  ---> 0x79  n --->0x6e
	exitConfirmKeys:
		mov ah,01h
		int 16h
		jz exitConfirmKeys
		mov ah,00h
		int 16h
		cmp al,0x6e
		je restorePosAndExit
		cmp al,0x79
		je exitGame
		jmp exitConfirmKeys
	
	exitGame:
		
		;mov word[exitFlag],1
		mov word[cs:gameEndFlag],1
		jmp ExitConfirmScreenEnd
	
	
	restorePosAndExit:
		push es
		pop ds
		push 0xa000
		pop es
		xor di,di
		mov di,320*68
		mov si,pauseScreen
		mov cx,10880
		cld
		rep movsw
		mov word[exitFlag],0
		jmp ExitConfirmScreenEnd
	
	
	
	ExitConfirmScreenEnd:
		pop di
		pop si
		pop ds
		pop es
		pop dx
		pop cx
		pop bx
		pop ax
		mov sp,bp
		pop bp
		ret
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	