INCLUDE Irvine32.inc
INCLUDE macros.inc

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;DATA;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.data

;get console input data
inputCounter dd ?

;screen data
maxX=119
maxY=29

;boundary data
boundary1 db maxX-1 DUP('-'),0
boundary2 db '|',0

;===============mainMenu data=================
mainMenuX=47
mainMenuY=12

;texts
BYTE 100 dup(0)
welcomeMsg BYTE " _____________________________________________________________________________ ", 0
BYTE "|                                                                             |", 0
BYTE "|             +=====+   | |  | |  |===  ===|       /====\                     |", 0
BYTE "|                 / /   | |  | |  |   \/   |      / ____ \                    |", 0
BYTE "|                / /    | |  | |  | |    | |     / /____\ \                   |", 0
BYTE "|               / /     | |__| |  | |    | |    / /      \ \                  |", 0
BYTE "|              +=====+   \____/   |=|    |=|   /=/        \=\                 |", 0
BYTE "|                                                                             |", 0
BYTE "|                                                                             |", 0
BYTE "|                                                                             |", 0
BYTE "|                                                                             |", 0
BYTE "|                                                                             |", 0
BYTE "|                                                                             |", 0
BYTE "|                                                                             |", 0
BYTE "|                                                                             |", 0
BYTE "|      *************************************************************          |", 0
BYTE "|      *   Welcome to the Game of Zuma, where precision is key!   *           |", 0
BYTE "|      *************************************************************          |", 0
BYTE "|                                                                             |", 0
BYTE "|                                                                             |", 0
BYTE "|                                                                             |", 0
BYTE 100 dup(0)
BYTE 100 dup(0)
BYTE 100 dup(0)
BYTE 100 dup(0)



maxNameSize=20
welcomeEnterNameTxt db "Please enter your name: ",0
userNameTxt db maxNameSize+1 DUP(?)

; Counter variables for loops
counter1 db 0
counter2 db 0


MenuArt     BYTE "                                                                                                                       ", 0ah   
            BYTE "                            _____        _____   ___________  _____       ___  _          _                            ", 0ah
            BYTE "                            | |\ \      / /| |  |  _________| | |\ \      | | | |        | |                           ", 0ah
            BYTE "                            | | \ \    / / | |  | |           | | \ \     | | | |        | |                           ", 0ah
            BYTE "                            | |  \ \__/ /  | |  | |______     | |  \ \    | | | |        | |                           ", 0ah
            BYTE "                            | |   \____/   | |  |  ______|    | |   \ \   | | | |        | |                           ", 0ah
            BYTE "                            | |            | |  | |           | |    \ \  | | | |        | |                           ", 0ah
            BYTE "                            | |            | |  | |_________  | |     \ \ | |  \ \______/ /                            ", 0ah
            BYTE "                            |_|            |_|  |___________| |_|      \_\|_|   \________/                             ", 0ah
            BYTE "                                                                                                                       ", 0

; Menu Screem
menuOption1 BYTE "1. Display Instructions", 0
menuOption2 BYTE "2. Display High Score", 0
menuOption3 BYTE "3. Start Game", 0

instMsg BYTE " _____________________________________________________________________________ ", 0
BYTE "|The goal of Zuma is to clear all the balls from the screen before they reach |", 0
BYTE "|the skull at the end of the path.. Players aim to match groups of three or   |", 0
BYTE "|more balls of the same color to make them disappear,preventing them from     |", 0
BYTE "|too close to the skull.                                                      |", 0
BYTE "|                                                                             |", 0
BYTE "|Upon starting the game, you will see a track with balls continuously moving  |", 0
BYTE "|along it. Your objective is to prevent them from reaching the skull          |", 0
BYTE "|at the end of the track.                                                     |", 0
BYTE "|                                                                             |", 0
BYTE "|                                                                             |", 0
BYTE "|Use the mouse or arrow keys to aim the frog.                                 |", 0
BYTE "|Click or press the shoot button to fire the ball from the frog.              |", 0
BYTE "|The ball will travel along a path and stop where it collides with other balls|", 0
BYTE "|                                                                             |", 0
BYTE "|To clear balls from the track, you must form groups of three or more balls   |", 0
BYTE "|with the same color                                                          |", 0
BYTE "|                                                                             |", 0
BYTE "|As you progress through the levels, the speed of the balls will increase and |", 0
BYTE "| and the patterns will become more complex.                                  |", 0
BYTE "|                                                                             |", 0
BYTE "|Do you dare to play?                                                         |", 0
BYTE 100 dup(0)

BYTE 100 dup(0)
BYTE 100 dup(0)

L1Art       BYTE "                                                                                                                       ", 0ah   
            BYTE "              ___              ___________  ___        ___  ___________  ___                   ___                     ", 0ah
            BYTE "              | |             |  _________| | |        | | |  _________| | |                  /   |                    ", 0ah
            BYTE "              | |             | |           | |        | | | |           | |                 / /| |                    ", 0ah
            BYTE "              | |             | |______     | |        | | | |______     | |                /_/ | |                    ", 0ah
            BYTE "              | |             |  ______|     \ \      / /  |  ______|    | |                    | |                    ", 0ah
            BYTE "              | |             | |             \ \    / /   | |           | |                    | |                    ", 0ah
            BYTE "              | |___________  | |_________     \ \__/ /    | |_________  | |___________      ___| |___                 ", 0ah
            BYTE "              |_____________| |___________|     \____/     |___________| |_____________|    |_________|                ", 0ah
            BYTE "                                                                                                                       ", 0


mainMenuTxt db "======= MAIN MENU =======",0
mainMenuStartGameTxt db "Play game",0
mainMenuInstructionsTxt db "Instructions",0
mainMenuScoreboardTxt db "Scoreboard",0
mainMenuExitGameTxt db "Quit",0
mainMenuTextArray dd mainMenuStartGameTxt, mainMenuInstructionsTxt, mainMenuScoreboardTxt, mainMenuExitGameTxt
mainMenuSelectedOption db 0
mainMenuIsEnterPressed db 0


;path
mainMenuMaxX=94
mainMenuMinX=25
mainMenuMaxY=24
mainMenuMinY=6
mainMenuPathX db mainMenuMaxX-mainMenuMinX DUP (?), mainMenuMaxY-mainMenuMinY DUP(?), mainMenuMaxX-mainMenuMinX DUP (?), mainMenuMaxY-mainMenuMinY DUP(?)
mainMenuPathY db mainMenuMaxX-mainMenuMinX DUP (?), mainMenuMaxY-mainMenuMinY DUP(?), mainMenuMaxX-mainMenuMinX DUP (?), mainMenuMaxY-mainMenuMinY DUP(?)
mainMenuPathBlocks=$-mainMenuPathY

;balls
mainMenuBallsX db 26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,25
mainMenuBallsY db 20 DUP(mainMenuMinY)
mainMenuBallsPathIndex db 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,10
mainMenuBallsColor db 'M','R','G','G','B','R','R', 'Y', 'Y', 'G','M','R','G','G','B','R','R', 'Y', 'Y','G'
mainMenuBallsCount=$-mainMenuBallsColor
mainMenuBallsAlive db mainMenuBallsCount DUP(0)
mainMenuCurrentlySelectedBallIndex db 0
mainMenuCurrentlySelectedPathIndex db 1

mainMenuBallsLastUpdateTime DWORD 0

                                            
;================================== MAIN GAME DATA =========================================

;balls 
ballChar db '@'
ballSpeed=150

;PLAYER
playerX db 60
playerY db 19
playerChar db 'X'
playerDir db 1			;1=north, 2=northeast, 3=east, 4=southeast,5=south, 6=southwest, 7=west, 8=northwest
playerColor=lightCyan

;AIM
aimChar db '*'
aim1X db 0
aim1Y db 0
aim2X db 0
aim2Y db 0
updatePlayer db 0

;BULLETS
bulletSpeed=20
bulletLastUpdateTime DWORD 0

bulletsDisplayX=59
bulletsDisplayY=1
bulletChar db '@'
updateBulletShowcase db 0

bullet1X db ?
bullet1Y db ?
bullet1Color db ?
bulletDir db ?
bullet1Exists db 0

bullet2Color db ?

;GAME
wonGame db 0
lostGame db 0
pressAnyButtonTxt db "Press any button to continue...",0
returnToMainMenu db 0
startNextLevel db 0

levelTxtX=110
levelTxtY=1
levelTxt db "LVL: ",0
levelNo db 1

scoreTxtX=3
scoreTxtY=1
score dw 0
scoreTxt db "Score: ",0
updateScore db 0
scoreMultiplier db 1

youLostTxt \
db "		   ___    ___ ________  ___  ___          ___       ________  ________  _________    ",0Ah
db "		   |\  \  /  /|\   __  \|\  \|\  \        |\  \     |\   __  \|\   ____\|\___   ___\ ",0Ah
db "		   \ \  \/  / | \  \|\  \ \  \\\  \       \ \  \    \ \  \|\  \ \  \___|\|___ \  \_| ",0Ah
db "		    \ \    / / \ \  \\\  \ \  \\\  \       \ \  \    \ \  \\\  \ \_____  \   \ \  \  ",0Ah
db "		     \/  /  /   \ \  \\\  \ \  \\\  \       \ \  \____\ \  \\\  \|____|\  \   \ \  \ ",0Ah
db "		   __/  / /      \ \_______\ \_______\       \ \_______\ \_______\____\_\  \   \ \__\",0Ah
db "		  |\___/ /        \|_______|\|_______|        \|_______|\|_______|\_________\   \|__|",0Ah
db "		  \|___|/                                                        \|_________|        ",0Ah,0

levelCompletedTxt1\
db "		       _______   ________   __    __   ______    _           ________   _________   ________  ",0Ah
db "		      |  _____| |  _____ | |  \	 /	| |	  _  \	| |			| _______| |___	  ___| | _______| ",0Ah
db "		      | |       | |	   | | |   \/   | |  |_|  | | |         | |____        | |	   | |____	  ",0Ah
db "		      | |       | |	   | | | |\	 /|	| |	 ____/	| |			|  ____|	   | |	   |  ____|	  ",0Ah
db "		      | |       | |    | | | | \/ | | | |       | |         | |            | |	   | |		  ",0Ah
db "		      | |_____  | |____| | | |    | | | |       | |_______  | |_______     | |	   | |_______ ",0Ah
db "		      |_______| |________| |_|    |_| |_|       |_________| |_________|    |_|	   |_________|",0Ah,0

pausedTxt db  "Paused",0

                                                                    

;====================================== LEVELS ============================================

;================= LEVEL 1 ================


;======== path setup =======

pathColor = lightgray+(lightgray*16)


level1MinX=40
level1MinY=8
level1MaxX=79
level1maxY=27

level1PathX db 126 DUP(?)
level1PathBlocks=$-level1PathX
level1PathY db level1PathBlocks DUP (?)

;========== balls ===========
level1BallsSpeed=500
level1StartingBallsLength=15

level1BallsProductionFinished db 0
level1BallsCount db 1
level1BallsLastUpdateTime DWORD 0

level1BallsColor db level1PathBlocks DUP (?)
level1BallsX db level1PathBlocks DUP (?)
level1BallsY db level1PathBlocks DUP (?)
level1BallsExists db level1PathBlocks DUP (?)
level1BallsPathIndex db level1PathBlocks DUP(?)



;================ LEVEL 2 ==================

;===== path ======
level2MinX=40
level2MinY=2
level2MaxX=80
level2maxY=30

level2PathBlocks=190
level2PathX db level2PathBlocks DUP(?)
level2PathY db level2PathBlocks DUP (?)

;== temp initializers ==
level2PathCurrX db level2MinX
level2PathCurrY db level2MinY
level2PathXSideSize db level2MaxX-level2MinX-4
level2PathYSideSize db level2MaxY-level2MinY-2

;========== balls ===========
level2BallsSpeed dd 350
level2StartingBallsLength=20

level2BallsProductionFinished db 0
level2BallsCount db 1
level2BallsLastUpdateTime DWORD 0

level2BallsColor db level2PathBlocks DUP (?)
level2BallsX db level2PathBlocks DUP (?)
level2BallsY db level2PathBlocks DUP (?)
level2BallsExists db level2PathBlocks DUP (?)
level2BallsPathIndex db level2PathBlocks DUP(?)
level2BallsSlowDownBalls db level2PathBlocks DUP(0)

;========= slow down balls logic ==============
slowDownBallChar db 'S'
gameIsSlow db 0
gameIsSlowLastUpdateTime dd 0
gameIsSlowTimeLimit=7000

;========= explosion balls logic ==============
explosionBallChar db 'E'


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;CODE;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.code

DrawWelcome PROC
; Clear the screen
call clrscr

; Set text color to Light Green on Black
mov eax, LightGreen + (Black * 16)
call SetTextColor

; Display Welcome Message
mov dl, 19
mov dh, 2
call Gotoxy
mov edx, OFFSET welcomeMsg
call WriteString

; Set text color for walls
mov eax, Gray + (Black * 16)
call SetTextColor

; Initialize wall - drawing logic
mov esi, offset WelcomeMsg; Point to the wall data
mov counter1, 50; Number of rows to print
mov counter2, 80; Characters per row
mov dl, 19; Initial column position
mov dh, 6; Start wall drawing below welcome message
call Gotoxy; Move cursor to starting position

movzx ecx, counter1; Outer loop : number of rows
printcolumn :
mov counter1, cl; Save row counter
movzx ecx, counter2; Inner loop : characters per row
printrow :
mov al, [esi]; Load one character from walls
call WriteChar; Print character
inc esi; Move to next character in walls
loop printrow; Repeat for all characters in the row

; Move to the next line
dec counter1; Decrement row counter
movzx ecx, counter1; Load updated row counter
mov dl, 19; Reset column to the starting position
inc dh; Move to the next row
call Gotoxy; Set cursor position
loop printcolumn; Repeat for all rows

mov dl, 34
inc dl
mov dh, 24
inc dh
call gotoxy
mov edx, offset welcomeEnterNameTxt
call WriteString

mov edx, offset userNameTxt
mov ecx, maxNameSize
call ReadString
call clrscr

ret
DrawWelcome ENDP

MENU PROC

first:
    CALL Clrscr
    mov eax, cyan ; set text color to cyan
    call SetTextColor

    ; Draw Pacman
    mov dl, 100 
    mov dh, 5 
    call Gotoxy

    mov edx, OFFSET menuArt
    call WriteString

    mov dl, 30 
    mov dh, 17
    call Gotoxy
    mov edx, OFFSET menuOption1
    call WriteString

    mov dl, 30 ; position for option 2
    mov dh, 19
    call Gotoxy
    mov edx, OFFSET menuOption2
    call WriteString

    mov dl, 30 ; position for option 3
    mov dh, 21
    call Gotoxy
    mov edx, OFFSET menuOption3
    call WriteString

    Choice:
        call ReadChar
        cmp al, '1'
        je RandomInstructions
        cmp al, '2'
        je DisplayHighScore
        cmp al, '3'
        je out1
        jmp Choice ; invalid choice, read Again
    
RandomInstructions:
    CALL DisplayInstructions
    jmp first
	ret

DisplayHighScore:
    jmp first
	ret

    out1:
		mov al, 0
        ret
MENU ENDP

DisplayInstructions PROC
; Clear the screen
call clrscr

; Set text color to Light Green on Black
mov eax, LightGreen + (Black * 16)
call SetTextColor 

; Display Welcome Message
mov dl, 19
mov dh, 2
call Gotoxy
mov edx, OFFSET instMsg
call WriteString

; Set text color for walls
;mov eax, Gray + (Black * 16)
;call SetTextColor

call clrscr

; Initialize wall - drawing logic
mov esi, offset instMsg; Point to the wall data
mov counter1, 50; Number of rows to print
mov counter2, 80; Characters per row
mov dl, 19; Initial column position
mov dh, 6; Start wall drawing below welcome message
call Gotoxy; Move cursor to starting position

movzx ecx, counter1; Outer loop : number of rows
printcolumn :
mov counter1, cl; Save row counter
movzx ecx, counter2; Inner loop : characters per row
printrow :
mov al, [esi]; Load one character from walls
call WriteChar; Print character
inc esi; Move to next character in walls
loop printrow; Repeat for all characters in the row

; Move to the next line
dec counter1; Decrement row counter
movzx ecx, counter1; Load updated row counter
mov dl, 19; Reset column to the starting position
inc dh; Move to the next row
call Gotoxy; Set cursor position
loop printcolumn; Repeat for all rows

call readChar
ret
DisplayInstructions ENDP


;=====================MAIN======================
main PROC

	call randomize
	call DrawWelcome
	mainLoop:

		call MENU

		;start game
		cmp al, 0
		jne dontStartGame
			call startGame
		dontStartGame:
	jmp mainLoop
	exitMainLoop:

ret
main endp
;===================ENDMAIN====================

startGame PROC
	call clrscr
	call level1
	cmp startNextLevel,1
	jne notLevel2
		mov startNextLevel,0
		call level2
	notLevel2:
	ret
startGame endp

;=================================================== GAME MECHANICS ========================================================

;================set player aim according to player direction==============
setAim PROC
		;preserve all registers
		pushad


		;if we're not calling this proc for the first time, print empty space where the previous aim was
		cmp aim1X,0
		je firstIteration

			;print ' ' at (aim1X, aim1Y)
			mov dl, aim1X
			mov dh, aim1Y
			call gotoxy
			mov al, ' '
			call writeChar

			;print ' ' at (aim2X, aim2Y)
			mov dl, aim2X
			mov dh, aim2Y
			call gotoxy
			mov al, ' '
			call writeChar

		firstIteration:


		;(dl,dh)=(x,y) of player
		mov dl, playerX
		mov dh, playerY

		;set base coords for aim
		mov aim1X, dl
		mov aim2X, dl

		mov aim1Y, dh
		mov aim2Y, dh
		
		;==== find player direction and set aim ====

		;North
		cmp playerDir, 1
		jne notNorth
			sub aim1Y,1
			sub aim2Y,2
		notNorth:

		;NorthEast
		cmp playerDir, 2
		jne notNorthEast
			sub aim1Y,1
			sub aim2Y,2
			add aim1X,1
			add aim2X,2
		notNorthEast:

		;NorthWest
		cmp playerDir, 8
		jne notNorthWest
			sub aim1Y,1
			sub aim2Y,2
			sub aim1X,1
			sub aim2X,2
		notNorthWest:

		;South
		cmp playerDir, 5
		jne notSouth
			add aim1Y,1
			add aim2Y,2
		notSouth:

		;SouthWest
		cmp playerDir, 6
		jne notSouthWest
			add aim1Y,1
			add aim2Y,2
			sub aim1X,1
			sub aim2X,2
		notSouthWest:

		;SouthEast
		cmp playerDir, 4
		jne notSouthEast
			add aim1Y,1
			add aim2Y,2
			add aim1X,1
			add aim2X,2
		notSouthEast:

		;East
		cmp playerDir, 3
		jne notEast
			add aim1X,2
			add aim2X,4
		notEast:

		;West
		cmp playerDir, 7
		jne notWest
			sub aim1X,2
			sub aim2X,4
		notWest:
		
		popad
		ret
setAim endp


;================drawPlayer===============
drawPlayer PROC
	;preserve all registers
	pushad

	;drawPlayer
	mov dl, playerX
	mov dh, playerY
	call gotoxy			;position player

	mov eax, playerColor
	call setTextColor	;color Player

	mov al,playerChar
	call WriteChar		;draw player

	call resetColor		;reset color

	;drawing Aim1
	mov dl, aim1X
	mov dh, aim1Y
	call gotoxy		;position aim 1

	mov al, aimChar
	call writeChar	;draw aim 1

	;drawing Aim1
	mov dl, aim2X
	mov dh, aim2Y
	call gotoxy		;position aim 2

	mov al, aimChar
	call writeChar	;draw aim 1

	popad
	ret
drawPlayer endp

;============= read player input =============
readPlayerInput PROC

		;preserve register values
		pushAD

		;see if key has been pressed
		call readKey
		jz keyNotPressed
		
				;=== Move player up ===
				cmp al, 'w'
				jne dontMoveUp
				
						cmp playerY, 7
						jbe dontMoveUp
							mov updatePlayer,1

							mov dl, playerX
							mov dh, playerY
							call gotoxy
							mov al, ' '
							call writeChar
							dec playerY

							mov dl, aim1X
							mov dh, aim1Y
							call gotoxy
							mov al, ' '
							call writeChar
							dec aim1Y

							mov dl, aim2X
							mov dh, aim2Y
							call gotoxy
							mov al, ' '
							call writeChar
							dec aim2Y

							jmp keyNotPressed

				dontMoveUp:
				;=== rotate player left ===
				cmp al, 'a'
				jne dontMoveLeft

						mov updatePlayer,1
						dec playerDir
						cmp playerDir,0
						jne dontLoopToMaxValue
							mov playerDir,8
						dontLoopToMaxValue:
						
				dontMoveLeft:

				;=== Move player down ===
				cmp al, 's'
				jne dontMovedown
				
						cmp playerY, 21
						jae dontMovedown
							mov updatePlayer,1

							mov dl, playerX
							mov dh, playerY
							call gotoxy
							mov al, ' '
							call writeChar
							inc playerY

							mov dl, aim1X
							mov dh, aim1Y
							call gotoxy
							mov al, ' '
							call writeChar
							inc aim1Y

							mov dl, aim2X
							mov dh, aim2Y
							call gotoxy
							mov al, ' '
							call writeChar
							inc aim2Y
						
							jmp keyNotPressed

				dontMovedown:
				;=== Move player Right ===
				cmp al, 'd'
				jne dontMoveRight
				
						mov updatePlayer,1
						inc playerDir
						cmp playerDir,9
						jne dontLoopToMinValue
							mov playerDir,1
						dontLoopToMinValue:

				dontMoveRight:


				;=== Switch selected bullet ===
				cmp al, 'c'
				jne dontSwitchBullet
						call switchBullet
				dontSwitchBullet:

				;==== fire bullet ====
				cmp al, ' '
				jne dontFireBullet
						call fireBullet
				dontFireBullet:

				;===== pause ========
				cmp al, 27
				jne notPause
					
						pauseLoop:
							call pauseGame

							cmp al, 0
							jne notStartGame
									call drawBoundary		
									call setAim	
									call drawPlayer
									call showCaseBullets
									call drawLevelTxt
									call drawScoreTxt	
									cmp levelNo,1
									jne NotLevel1
									call drawLevelBalls
									call drawLevel1Path
									NotLevel1:
									cmp levelNo,2
									jne NotLevel2
									call drawLevel2Balls
									call drawLevel2Path
									NotLevel2:

									jmp keyNotPressed
							notStartGame:

							cmp al,12
							jne notEnd
								mov returnToMainMenu,1
								mov mainMenuSelectedOption,0
								jmp notPause
							notEnd:

						jmp pauseLoop

				notPause:

		keyNotPressed:
		popad
		ret
	
readPlayerInput endp

;============= fire bullet ==============
fireBullet PROC
	
	cmp bullet1Exists,1
	je bulletAlreadyExists

			mov bullet1Exists,1		;exists=true

			mov al, aim2X
			mov bullet1X, al		;x coord
			
			mov al, aim2Y
			mov bullet1Y, al		;y coord
	
			mov al, playerDir	
			mov bulletDir, al		;direction

	bulletAlreadyExists:
	ret
fireBullet endp

;============== move Bullet =============
;push offset pathX			[ebp+16]
;push offset pathY			[ebp+12]
;push dword noOfPathBlocks	[ebp+8]

moveBullet PROC

	push ebp
	mov ebp,esp

	;return if bullet doesn't exist
	cmp bullet1Exists,1
	jne dontMove

	; Check if 50 milliseconds have elapsed since the last movement
	call getMSeconds
    mov ecx, eax                              
    sub eax, bulletLastUpdateTime     
    cmp eax, bulletSpeed               
    jl dontMove      

			; Update the lastUpdateTime to the current time
			mov bulletLastUpdateTime, ecx

			;====== print space/aimChar where the bullet was previously =======
			mov dl, bullet1X
			mov dh, bullet1Y
			call gotoxy

			cmp dl, aim2X
			jne checkPath
				cmp dh, aim2Y
				jne checkPath

					mov al, aimChar
					call writeChar				;if first iteration (bullet is at aim2) print aimChar
					jmp doneCoveringFootsteps

			;====== print path char if bullet crosses path ======
			checkPath:
			mov esi, [ebp+16]		;esi= &pathX
			mov edi, [ebp+12]		;edi= &pathY
			mov ecx, [ebp+8]		;ecx= noOfPathBlocks
			pathCheck:
					cmp byte ptr [esi], dl
					jne endPathCheckLoop
						cmp byte ptr [edi], dh
						jne endPathCheckLoop
								mov eax,pathColor
								call setTextColor
								mov al,' '
								call writeChar
								call resetColor
								jmp doneCoveringFootsteps

			endPathCheckLoop:
			inc esi
			inc edi
			loop pathCheck

			printSpace:


				mov al, ' '
				call writeChar					;else print space

			doneCoveringFootsteps:

		
			;==== find bullet direction and move in that direction ====

			;North
			cmp bulletDir, 1
			jne notNorth
				sub bullet1Y,1
			notNorth:

			;NorthEast
			cmp bulletDir, 2
			jne notNorthEast
				sub bullet1Y,1
				add bullet1X,1
			notNorthEast:

			;NorthWest
			cmp bulletDir, 8
			jne notNorthWest
				sub bullet1Y,1
				sub bullet1X,1
			notNorthWest:

			;South
			cmp bulletDir, 5
			jne notSouth
				add bullet1Y,1
			notSouth:

			;SouthWest
			cmp bulletDir, 6
			jne notSouthWest
				add bullet1Y,1
				sub bullet1X,1
			notSouthWest:

			;SouthEast
			cmp bulletDir, 4
			jne notSouthEast
				add bullet1Y,1
				add bullet1X,1
			notSouthEast:

			;East
			cmp bulletDir, 3
			jne notEast
				add bullet1X,1
			notEast:

			;West
			cmp bulletDir, 7
			jne notWest
				sub bullet1X,1
			notWest:


			;==== see if bullet reached terminating point ====
				
			cmp bullet1X, maxX-1;right boundary
			jne notAtMaxX

					call destroyBullet			;destroy bullet
					mov dl, bullet1X
					mov dh, bullet1Y
					call gotoxy
					mov al, ' '	
					call WriteChar				;print space where bullet was
					
			notAtMaxX:

			cmp bullet1Y, maxY-1;bottom boundary
			jne notAtMaxY
					
					call destroyBullet			;destroy bullet
					mov dl, bullet1X
					mov dh, bullet1Y
					call gotoxy
					mov al, ' '	
					call WriteChar				;print space where bullet was
			notAtMaxY:

			cmp bullet1X, 1	;left boundary
			jne notAtMinX
					
					call destroyBullet			;destroy bullet
					mov dl, bullet1X
					mov dh, bullet1Y
					call gotoxy
					mov al, ' '	
					call WriteChar				;print space where bullet was
			notAtMinX:

			cmp bullet1Y, 1	;top boundary
			jne notAtMinY
					
					call destroyBullet			;destroy bullet
					mov dl, bullet1X
					mov dh, bullet1Y
					call gotoxy
					mov al, ' '	
					call WriteChar				;print space where bullet was
			notAtMinY:

	dontMove:
	pop ebp
	ret 12
moveBullet endp

;============= destroy bullet ==============
destroyBullet PROC
	
			mov bullet1Exists,0		;destroy bullet

			mov al, bullet2Color
			mov bullet1Color,al		;update bullet1 color from bullet 2 color

			call setRandomColor
			mov bullet2Color,al
			call resetColor
			mov updateBulletShowcase,1	;get new random color for bullet 2

	ret
destroyBullet endp

;============= draw bullet =================
drawBullet PROC
	
	pushad

	;====== if it exists, draw bullet ========
	cmp bullet1Exists,1
	jne dontDraw
			mov dl, bullet1X
			mov dh, bullet1Y
			call gotoxy				;positioning

			movzx eax, bullet1Color
			push eax
			call setColor			;coloring

			mov al, bulletChar
			call writeChar			;draw

			call resetColor			;reset Color

	dontDraw:

	popad
	ret
drawBullet endp

;============= initialize bullets(colors) ===============
initBullets PROC

	;set both bullets colors
	call setRandomColor
	mov bullet1Color, al
	call setRandomColor
	mov bullet2Color, al
	
	call resetColor

	ret
initBullets endp

;================ swtich selected bullet =================
switchBullet PROC
		
		push eax

		mov al, bullet1Color
		mov bl, bullet2Color
		mov bullet2Color,al
		mov bullet1Color, bl
		mov updateBulletShowcase,1

		pop eax

	ret
switchBullet endp

;=========== show which bullets are currently available on top of screen =========
showCaseBullets PROC
	
	;position bullet 2
	mov ax, bulletsDisplayX
	mov dl,al
	mov ax, bulletsDisplayY
	mov dh,al
	call gotoxy

	;set color bullet 2
	mov eax, 0
	mov al, bullet2Color
	push eax
	call setColor

	;draw bullet 2
	mov al, bulletChar
	call writeChar

	;reset color
	call resetColor
	
	;position bullet 1
	mov ax, bulletsDisplayX+2
	mov dl,al
	mov ax, bulletsDisplayY
	mov dh,al
	call gotoxy

	;set color bullet 1
	mov eax, 0
	mov al, bullet1Color
	push eax
	call setColor

	;draw bullet 1
	mov al, bulletChar
	call writeChar

	;reset color
	call resetColor
		
	ret
showCaseBullets endp

;========== check collision in bullet and balls ==============
;--- ARGUMENTS: ---
;push dword  ballsCount		[ebp+16]
;push offset ballsX			[ebp+12]
;push offset ballsY			[ebp+8]

;--- RETURN: ---
;al = IndexOfBall if collision
;al =-1 if no collision

checkCollision PROC
	push ebp
	mov ebp,esp

	mov al,-1
	cmp bullet1Exists,1
	jne leaveFunction			;if bullet doesn't exist, dont check
			
			mov esi, [ebp+12]	;esi = &ballsX[0]
			mov edi, [ebp+8]	;edi = &ballsY[0]
			mov ecx, 0
			checkCollisionLoop:

					cmp ecx, [ebp+16]				;while(ecx != ballsCount)
					je exitCheckCollision	
	
						mov dl, bullet1X
						mov dh, bullet1Y
						cmp byte ptr [esi], dl		;cmp ballX[ecx], bullet1X
						jne endOfLoop
								cmp byte ptr [edi], dh		;cmp ballY[ecx], bullet1Y
								jne endOfLoop
									mov al, cl
									jmp exitCheckCollision	; if both x and y coords match, mov index into al and exit

			endOfLoop:
			inc esi
			inc edi
			inc ecx
			jmp checkCollisionLoop
			exitCheckCollision:
					

	leaveFunction:

	pop ebp
	ret 12
checkCollision endp

;======= initialize balls ==========
;arguments:
;push offset pathX						[ebp+32]
;push offset pathY						[ebp+28]
;push offset level1BallsColor			[ebp+24]
;push offset level1BallsX				[ebp+20]
;push offset level1BallsY				[ebp+16]
;push offset level1BallsExists			[ebp+12]
;push offset level1BallsPathIndex		[ebp+8]	
initBalls PROC
	push ebp
	mov ebp, esp
		
	push esi
	push edi
	mov esi,0

	;path index
	add esi,[ebp+8]
	mov byte ptr [esi], 0
	sub esi, [ebp+8]

	;ballsExists
	add esi,[ebp+12]
	mov byte ptr [esi], 1
	sub esi, [ebp+12]


	mov edi, [ebp+28]
	mov al, [edi]
	;Balls Y
	add esi,[ebp+16]
	mov [esi], al
	sub esi, [ebp+16]

	mov edi, [ebp+32]
	mov al, [edi]
	;BallsX
	add esi,[ebp+20]
	mov [esi], al
	sub esi, [ebp+20]

	;BallsColor
	add esi,[ebp+24]
	call setRandomColor
	mov byte ptr [esi], al
	call resetColor
	sub esi, [ebp+24]

	pop edi
	pop esi
	pop ebp
	ret	28
initBalls endp

;========== shift balls when new ball added ==========
;arguments:
;push offset pathX				[ebp+40]
;push offset pathY				[ebp+36]
;push dword  ballsCount			[ebp+32]
;push dword  startingIndex		[ebp+28]
;push offset ballsColor			[ebp+24]
;push offset ballsX				[ebp+20]
;push offset ballsY				[ebp+16]
;push offset ballsExists		[ebp+12]
;push offset ballsPathIndex		[ebp+8]
shiftBallsRight PROC
	push ebp
	mov ebp,esp

		;===== increment each ball's path index =====
		mov esi, [ebp+8]
		add esi, [ebp+28]		;esi= & ballsPathIndex[startingIndex]

		mov ecx, [ebp+28]		;ecx = startingIndex
		pathIndexLoop:

			cmp ecx, [ebp+32]	;while(ecx != ballsCount)
			je exitPathIndexLoop

			inc byte ptr [esi]	;ballsPathIndex[ecx]++

		inc esi
		inc ecx
		jmp pathIndexLoop
		exitPathIndexLoop:

		;===== set the new x,y coordinates =====
		
		;==== x coords =====
		mov ecx, [ebp+28]			;ecx = startingIndex
		incrementXCoordsLoop:
			
			cmp ecx, [ebp+32]		;while(ecx != ballsCount)
			je exitIncrementXCoordsLoop

			mov esi, [ebp+8]
			add esi, ecx			;esi = &pathIndex[ecx]
			mov al, [esi]
			movzx edi, al			;edi = pathIndex[ecx]

			mov esi, [ebp+40]
			add esi, edi			;esi = &pathX[pathIndex]
			mov al, [esi]			;al= pathX[pathIndex]

			mov esi, [ebp+20]		;esi= &ballsX
			add esi, ecx			;esi= &ballsX[ecx]
			mov [esi], al			;ballsX[ecx]= pathX[pathIndex]
		
		inc ecx
		jmp incrementXCoordsLoop
		exitIncrementXCoordsLoop:

		;==== y coords =====
		mov ecx, [ebp+28]			;ecx = startingIndex
		incrementYCoordsLoop:
			
			cmp ecx, [ebp+32]		;while(ecx != ballsCount)
			je exitIncrementYCoordsLoop

			mov esi, [ebp+8]
			add esi, ecx			;esi = &pathIndex[ecx]
			mov al, [esi]
			movzx edi, al			;edi = pathIndex[ecx]

			mov esi, [ebp+36]
			add esi, edi			;esi = &pathY[pathIndex]
			mov al, [esi]			;al= pathY[pathIndex]

			mov esi, [ebp+16]		;esi= &ballsY
			add esi, ecx			;esi= &ballsY[ecx]
			mov [esi], al			;ballsY[ecx]= pathY[pathIndex]
		
		inc ecx
		jmp incrementYCoordsLoop
		exitIncrementYCoordsLoop:

		;============== shift all arrays rightwards and make space for new ball at starting index ===============

		;shift pathIndex
		push dword ptr [ebp+8]
		push dword ptr [ebp+28]
		push dword ptr [ebp+32]
		call shiftRight

		;shift exists
		push dword ptr [ebp+12]
		push dword ptr [ebp+28]
		push dword ptr [ebp+32]
		call shiftRight

		;shift ballsY
		push dword ptr [ebp+16]
		push dword ptr [ebp+28]
		push dword ptr [ebp+32]
		call shiftRight

		;shift ballsX
		push dword ptr [ebp+20]
		push dword ptr [ebp+28]
		push dword ptr [ebp+32]
		call shiftRight

		;shift ballsColor
		push dword ptr [ebp+24]
		push dword ptr [ebp+28]
		push dword ptr [ebp+32]
		call shiftRight

		;shift powerups
		;lvl 2
		cmp levelNo,2
		jne notLevel2
			push offset level2BallsSlowDownBalls
			push dword ptr [ebp+28]
			push dword ptr [ebp+32]
			call shiftRight
		notLevel2:

	pop ebp
	ret 36

shiftBallsRight endp

;========== shift balls when ball destroyed ==========
;arguments:
;push offset pathX				[ebp+40]
;push offset pathY				[ebp+36]
;push dword  ballsCount			[ebp+32]
;push dword  startingIndex		[ebp+28]
;push offset ballsColor			[ebp+24]
;push offset ballsX				[ebp+20]
;push offset ballsY				[ebp+16]
;push offset ballsExists		[ebp+12]
;push offset ballsPathIndex		[ebp+8]
shiftBallsLeft PROC
	push ebp
	mov ebp,esp

		;===== print space where last ball is =====
		mov esi, [ebp+32]	;ballsCount
		dec esi
		add esi, [ebp+20]	;x[ballsCount-1]
		mov dl, [esi]
		sub esi,[ebp+20]
		add esi, [ebp+16]	;x[ballsCount-1]
		mov dh, [esi]
		sub esi,[ebp+16]

		call gotoxy
		mov eax, pathColor
		call setTextColor
		mov al,' '
		call writeChar
		call resetColor

		;===== decrement each ball's path index =====
		mov esi, [ebp+8]
		add esi, [ebp+28]		;esi= & ballsPathIndex[startingIndex]

		mov ecx, [ebp+28]		;ecx = startingIndex
		pathIndexLoop:

			cmp ecx, [ebp+32]	;while(ecx != ballsCount)
			je exitPathIndexLoop

			dec byte ptr [esi]	;ballsPathIndex[ecx]--

		inc esi
		inc ecx
		jmp pathIndexLoop
		exitPathIndexLoop:

		;===== set the new x,y coordinates =====
		
		;==== x coords =====
		mov ecx, [ebp+28]			;ecx = startingIndex
		incrementXCoordsLoop:
			
			cmp ecx, [ebp+32]		;while(ecx != ballsCount)
			je exitIncrementXCoordsLoop

			mov esi, [ebp+8]
			add esi, ecx			;esi = &pathIndex[ecx]
			mov al, [esi]
			movzx edi, al			;edi = pathIndex[ecx]

			mov esi, [ebp+40]
			add esi, edi			;esi = &pathX[pathIndex]
			mov al, [esi]			;al= pathX[pathIndex]

			mov esi, [ebp+20]		;esi= &ballsX
			add esi, ecx			;esi= &ballsX[ecx]
			mov [esi], al			;ballsX[ecx]= pathX[pathIndex]
		
		inc ecx
		jmp incrementXCoordsLoop
		exitIncrementXCoordsLoop:

		;==== y coords =====
		mov ecx, [ebp+28]			;ecx = startingIndex
		incrementYCoordsLoop:
			
			cmp ecx, [ebp+32]		;while(ecx != ballsCount)
			je exitIncrementYCoordsLoop

			mov esi, [ebp+8]
			add esi, ecx			;esi = &pathIndex[ecx]
			mov al, [esi]
			movzx edi, al			;edi = pathIndex[ecx]

			mov esi, [ebp+36]
			add esi, edi			;esi = &pathY[pathIndex]
			mov al, [esi]			;al= pathY[pathIndex]

			mov esi, [ebp+16]		;esi= &ballsY
			add esi, ecx			;esi= &ballsY[ecx]
			mov [esi], al			;ballsY[ecx]= pathY[pathIndex]
		
		inc ecx
		jmp incrementYCoordsLoop
		exitIncrementYCoordsLoop:

		;============== shift all arrays leftwards  ===============

		;shift pathIndex
		push dword ptr [ebp+8]
		push dword ptr [ebp+28]
		push dword ptr [ebp+32]
		call shiftLeft

		;shift exists
		push dword ptr [ebp+12]
		push dword ptr [ebp+28]
		push dword ptr [ebp+32]
		call shiftLeft

		;shift ballsY
		push dword ptr [ebp+16]
		push dword ptr [ebp+28]
		push dword ptr [ebp+32]
		call shiftLeft

		;shift ballsX
		push dword ptr [ebp+20]
		push dword ptr [ebp+28]
		push dword ptr [ebp+32]
		call shiftLeft

		;shift ballsColor
		push dword ptr [ebp+24]
		push dword ptr [ebp+28]
		push dword ptr [ebp+32]
		call shiftLeft

		;shift powerups
		;lvl2
		cmp levelNo,2
		jne notLevel2
			push offset level2BallsSlowDownBalls
			push dword ptr [ebp+28]
			push dword ptr [ebp+32]
			call shiftLeft
		notLevel2:

	pop ebp
	ret 36

shiftBallsLeft endp


;=========== explode balls when combination of same color >=3 ==============
;arguments:
;push offset pathX					[ebp+40]
;push offset pathY					[ebp+36]
;push offset ballsExists			[ebp+32]
;push offset ballsPathIndex			[ebp+28]
;push offset ballsX					[ebp+24]
;push offset ballsY					[ebp+20]
;push offset ballCount				[ebp+16]
;push dword	 indexOfCollision		[ebp+12]
;push offset ballsColor				[ebp+8]
explodeBalls PROC
	push ebp
	mov ebp,esp

		mov esi, [ebp+8]
		add esi, [ebp+12]		;esi= &ballsColor[newBall]

		mov bl, [esi]			;bl = ball Color

		;while(index && color[index-1] == bl) index--;
		goBackwardsLoop:

				cmp esi,[ebp+8]
				je exitGoBackwardsLoop		;if index of esi=0, we are at leftMost index of color

				cmp [esi-1], bl
				jne exitGoBackwardsLoop		;if color[index-1] != bl, we are at end of combination
			
				dec esi

		jmp goBackWardsLoop
		exitGoBackWardsLoop:

		mov edi,esi
		sub edi, [ebp+8]					;convert address to index
		push edi							;preserve startIndex (index of starting ball of that color)
		
		;endIndex=startIndex
		;( esi = &startIndex )

		;while(endIndex + 1 < ballsCount && color[endIndex+1]==al)
		;endIndex++

		mov eax, [ebp+8]
		push esi
		mov esi, [ebp+16]			;esi=offset balls count
		push ecx
		mov ecx,0
		mov cl, [esi]
		add eax, ecx				;eax = &ballsColor[ballsCount]	(end check)
		pop ecx
		pop esi

		getEndIndexLoop:
				
			mov edx, esi
			inc edx
			cmp edx, eax			;cmp [index+1], ballsCount
			jae exitGetEndIndexLoop
				cmp [esi+1], bl
				jne exitGetEndIndexLoop

				inc esi

		jmp getEndIndexLoop
		exitGetEndIndexLoop:


		sub esi, [ebp+8]	;convert address to end index
		pop edi				;retrieve start index

		;esi = last index of the color
		;edi= first index of the color

		mov eax, esi
		sub eax, edi
		inc eax
		cmp eax,3		;eax = difference between indexes + 1
		jb exitFunc		;if less than 3 balls have that color, return



		;=========== use special abilities if level>=2 ==============

		;==== level 2======
		cmp levelno, 2
		jne notLevel2
			push eax
			push esi
			push edi
			slowBallsLoop:
				cmp level2BallsSlowDownBalls[edi], 1
				jne notSlowDownBall
					mov gameIsSlow,1
					call getMSeconds
					mov gameIsSlowLastUpdateTime, eax
				notSlowDownBall:
			inc edi
			cmp edi,esi
			jbe slowBallsLoop

			pop edi
			pop esi
			pop eax
		notLevel2:
		;scoring
		push ebx
		push eax							;eax = noOfBallsDestroyed
		mov bl, scoreMultiplier
		mul bl
		add score, ax
		inc scoreMultiplier
		mov updateScore, 1
		pop eax
		pop ebx
		
		push edi
		printExplosionLoop:

				cmp edi,esi
				ja exitprintExplosionLoop	;while( edi <= esi)
				add edi, [ebp+24]			;x coord
				mov dl, [edi]
				sub edi, [ebp+24]

				add edi, [ebp+20]			;y coord
				mov dh, [edi]
				sub edi, [ebp+20]
				call gotoxy

				mov eax, brown (brown*16)
				call setTextColor
				mov al, ' '
				call writeChar				;draw explosion
				call resetColor
			
		inc edi
		jmp printExplosionLoop
		exitprintExplosionLoop:
		pop edi

		mov eax, 750
		call delay							;delay to display exploding
		
		mov ecx, esi
		sub ecx, edi
		inc ecx

		shiftBallsLeftLoop:
			push ecx		;preserve counter
			push edi		;preserve startingIndex
			
			push esi
			mov esi,[ebp+16]
			mov eax,0
			mov al, [esi]		;convert offset ball count to dword ball count
			pop esi

			push [ebp+40]			
			push [ebp+36]
			push eax
			push edi
			push [ebp+8]		
			push [ebp+24]			
			push [ebp+20]
			push [ebp+32]		
			push [ebp+28]		
			call shiftBallsLeft 

			pop edi			;retreieve starting index
			
			push esi
			mov esi,[ebp+16]
			dec byte ptr [esi]		;decrement BallCount
			pop esi

			pop ecx			;retreieve counter
		loop shiftBallsLeftLoop

		push edi			;preserve starting index

		cmp levelNo,1
		jne NotLevel11
		call drawLevelBalls
		NotLevel11:
		cmp levelNo,2
		jne NotLevel22
		call drawLevel2Balls

		NotLevel22:
		pop edi				;retreieve starting index
		mov eax, 100
		call delay

		;check if explosion again

		mov eax, edi		;eax = start index of explosion

		push esi
		mov esi,[ebp+16]
		mov ebx,0
		mov bl, [esi]		;ebx= ballsCount
		pop esi

		cmp eax, ebx
		je dontCheckAgain
			dec eax
			push [ebp+40]
			push [ebp+36]
			push [ebp+32]
			push [ebp+28]
			push [ebp+24]
			push [ebp+20]
			push [ebp+16]
			push eax
			push [ebp+8]
			call explodeBalls
		dontCheckAgain:	

exitFunc:
pop ebp
mov scoreMultiplier,1
ret 36
explodeBalls endp

;========== move balls ===========
moveLevelBalls PROC

	; Check if 100 milliseconds have elapsed since the last movement
	call getMSeconds
    mov ecx, eax                              
    sub eax, level1BallsLastUpdateTime     
    cmp eax, level1BallsSpeed               
    jl dontMove      

			; Update the lastUpdateTime to the current time
			mov level1BallsLastUpdateTime, ecx

			;================== move balls logic ======================
			;print space at newly emptied area
			mov edi, 0
			cmp level1BallsExists[edi],1
			jne dontMove					;if last ball doesn't exist, dont move

			mov dl, level1BallsX[edi]
			mov dh, level1BallsY[edi]
			call gotoxy			;positioning

			mov eax, pathColor
			call setTextColor	;set color

			mov al, '.'
			call WriteChar		;print space

			call resetColor		;reset color

			;=================== move loop =======================

			mov edi,0
			move:

				
				cmp level1BallsExists[edi], 1			;dont move if ball doesn't exist
				jne dontMove

				
				inc byte ptr level1BallsPathIndex[edi]	;point to the next path block
				movzx eax, level1BallsPathIndex[edi]
				cmp eax, level1PathBlocks	
				jb didntLoseGame
						mov eax,500
						call delay
						mov lostGame,1
						jmp dontMove
				didntLoseGame:
				movzx esi, level1BallsPathIndex[edi]
				mov al, level1PathX[esi]
				mov level1BallsX[edi], al				;set x to new path block X
				mov al, level1PathY[esi]
				mov level1BallsY[edi],al						;set y to new path block Y

			inc edi
			movzx eax, level1BallsCount
			cmp edi, eax
			jne move

			;================= if level just started, add more balls till it reaches startingBalls ==================
			cmp level1BallsProductionFinished,1
			je dontAddABall
					
					;========== shift all ball arrays to the right and make space for new ball at 0 index ============
					push offset level1BallsColor
					mov eax, 0
					push eax
					movzx eax, level1BallsCount
					push eax
					call shiftRight

					push offset level1BallsX
					mov eax, 0
					push eax
					movzx eax, level1BallsCount
					push eax
					call shiftRight

					push offset level1BallsY
					mov eax, 0
					push eax
					movzx eax, level1BallsCount
					push eax
					call shiftRight

					push offset level1BallsExists
					mov eax, 0
					push eax
					movzx eax, level1BallsCount
					push eax
					call shiftRight

					push offset level1BallsPathIndex
					mov eax, 0
					push eax
					movzx eax, level1BallsCount
					push eax
					call shiftRight

					;======= set new ball attributes =========
					mov edi,0
					movzx eax, level1PathX[edi]
					mov level1BallsX[edi], al		;x coord

					movzx eax, level1PathY[edi]
					mov level1BallsY[edi], al		;y coord

					mov level1BallsExists[edi], 1	;exists

					mov level1BallsPathIndex[edi], 0;path index

					call setRandomColor
					mov level1BallsColor[edi], al	;color
					call resetColor

					;======= increment number of balls created =======
					inc byte ptr level1BallsCount	

					;===== if no of balls = min balls, stop production ====
					mov eax, level1StartingBallsLength
					cmp al, level1BallsCount
					ja notDoneProduction
						mov level1BallsProductionFinished,1
					notDoneProduction:

			dontAddABall:

	;al=true if balls been updated
	mov al,1
	jmp endFunc
	dontMove:

	;al=false if not updated
	mov al,0
	endFunc:
	ret
moveLevelBalls endp

;=================== draw balls =========================
drawLevelBalls PROC
	
	mov edi, 0
	draw:
		movzx eax, level1BallsCount
		cmp edi, eax
		je exitLoop
		
		mov dl, level1BallsX[edi]
		mov dh, level1BallsY[edi]
		call gotoxy					;position

		movzx eax, level1BallsColor[edi]
		push eax
		call setColor				;color

		mov al, ballChar
		call writeChar				;draw

		call resetColor				;resetColor

	inc edi
	jmp draw
	exitLoop:

	ret
drawLevelBalls endp
;================================================================================================================= LEVEL 2 =================================================================================================================
level2 PROC

	;preserve all registers
	pushad

	;intial setup
	push score
	call reset
	pop score
	mov levelNo, 2
	call level2screen
	call drawBoundary		
	call setAim	
	call drawPlayer
	call initBullets
	call showCaseBullets
	call initLevel2Path
	call drawLevel2Path
	call drawLevelTxt
	call drawScoreTxt
	push offset level2pathX						
	push offset level2pathY						
	push offset level2BallsColor			
	push offset level2BallsX				
	push offset level2BallsY				
	push offset level2BallsExists			
	push offset level2BallsPathIndex	
	call initBalls
	call drawLevel2Balls


	;================ GAME LOOP ================
	gameLoop:
		
		
		mov eax, 16
		call delay				;short delay to match framerate

		call readPlayerInput	;read playerInput

		cmp returnToMainMenu,1	;return to main menu
		jne dontReturn
			call reset
			mov returnToMainMenu,0
			jmp exitGameLoop
			
		dontReturn:

		;============ updating ===============

		;----- player updated? -----
		cmp updatePlayer,1
		jne DontUpdatePlayer

				mov updatePlayer,0	;reset state
				call setAim			;adjust aim according to player's direction
				call drawPlayer		;draw player and his new aim

		DontUpdatePlayer:

		;----- bullet showcase updated? -----
		cmp updateBulletShowcase,1
		jne DontUpdateBulletShowcase

				mov updateBulletShowcase,0		;reset state
				call showCaseBullets			;draw bullet showcase at top of screen

		DontUpdateBulletShowcase:

		;----- move bullet if it exists ------
		push offset level2PathX
		push offset level2PathY
		mov eax, level2PathBlocks
		push eax
		call moveBullet
		call drawBullet

		;------ move and draw balls --------
		call moveLevel2Balls
		cmp al,1
		jne ballsNotMoved
			call drawLevel2Balls
		ballsNotMoved:

		;------- lost game? -------
		cmp lostGame, 1
		jne didntLoseGame
				mov lostGame,0
				call youLostScreen
				popad
				ret
		didntLoseGame:
		;------- collision check -----------
		movzx eax, level2BallsCount
		push eax
		push offset level2BallsX
		push offset level2BallsY
		call checkCollision

		cmp al, -1
		je noCollision

				;collision detected:
				mov cl, al
				movzx eax, cl
				push eax					;preserve ball index of collision
				
				push offset level2PathX
				push offset level2PathY
				movzx ebx, level2BallsCount
				push ebx					;ending index	(last ball)
				push eax					;starting index(index where collision occured)
				push offset level2BallsColor			
				push offset level2BallsX				
				push offset level2BallsY				
				push offset level2BallsExists		
				push offset level2BallsPathIndex		
				call shiftBallsRight		;make space for new ball
				
				pop esi						;retrieve index of collision
				
				;add new ball with (x,y,color)= bullet(x,y,color)
				mov al,  bullet1X
				mov level2BallsX[esi], al
				mov al,  bullet1Y
				mov level2BallsY[esi], al
				mov al, bullet1Color
				mov level2BallsColor[esi],al
				mov level2BallsExists[esi],1
				mov edi, esi
				inc edi
				mov al, level2BallsPathIndex[edi]
				dec al
				mov level2BallsPathIndex[esi], al
				
				inc level2BallsCount

				
				call destroyBullet
				call drawLevel2Balls

				;check if explosion occurs
				push offset level2PathX					
				push offset level2PathY					
				push offset level2BallsExists			
				push offset level2BallsPathIndex			
				push offset level2BallsX
				push offset level2BallsY
				push offset level2BallsCount
				push esi
				push offset level2BallsColor
 				call explodeBalls
				
		noCollision:

		;------------- slow down balls -------------
		cmp gameIsSlow,1
		jne notSlow
			mov level2BallsSpeed,800
			call resetBallSpeed
			cmp al,1
			jne dontResetBallSpeed
				mov level2BallsSpeed, 350
			dontResetBallSpeed:
		notSlow:
		;------------- draw score --------------
		cmp updateScore,1
		jne dontUpdateScore
					mov updateScore,0
					call drawScoreTxt
		dontUpdateScore:

		;------------ did player win ------------
		cmp level2BallsCount,0
		jne didntWin
			call youWonScreen
			popad
			ret
		didntWin:

	jmp gameLoop
	exitGameLoop:

	popad
	ret
level2 endp

;============== slow down balls ===============
resetBallSpeed PROC

	call getMSeconds
	mov ecx, eax
	sub eax, gameIsSlowLastUpdateTime
	cmp eax, gameIsSlowTimeLimit
	jl dontChange
		mov gameIsSlow,0
		mov gameIsSlowLastUpdateTime,0
		mov al, 1
		jmp exitFunc
	dontChange:
	mov al, 0
	exitFunc:
ret
resetBallSpeed endp

;========== move balls ===========
moveLevel2Balls PROC

	; Check if 100 milliseconds have elapsed since the last movement
	call getMSeconds
    mov ecx, eax                              
    sub eax, level2BallsLastUpdateTime     
    cmp eax, level2BallsSpeed               
    jl dontMove      

			; Update the lastUpdateTime to the current time
			mov level2BallsLastUpdateTime, ecx

			;================== move balls logic ======================
			;print space at newly emptied area
			mov edi, 0
			cmp level2BallsExists[edi],1
			jne dontMove					;if last ball doesn't exist, dont move

			mov dl, level2BallsX[edi]
			mov dh, level2BallsY[edi]
			call gotoxy			;positioning

			mov eax, pathColor
			call setTextColor	;set color

			mov al, '.'
			call WriteChar		;print space

			call resetColor		;reset color

			;=================== move loop =======================

			mov edi,0
			move:

				
				cmp level2BallsExists[edi], 1			;dont move if ball doesn't exist
				jne dontMove

				
				inc byte ptr level2BallsPathIndex[edi]	;point to the next path block
				movzx eax, level2BallsPathIndex[edi]
				cmp eax, level2PathBlocks	
				jb didntLoseGame
						mov eax,500
						call delay
						mov lostGame,1
						jmp dontMove
				didntLoseGame:
				movzx esi, level2BallsPathIndex[edi]
				mov al, level2PathX[esi]
				mov level2BallsX[edi], al				;set x to new path block X
				mov al, level2PathY[esi]
				mov level2BallsY[edi],al						;set y to new path block Y

			inc edi
			movzx eax, level2BallsCount
			cmp edi, eax
			jne move

			;================= if level just started, add more balls till it reaches startingBalls ==================
			cmp level2BallsProductionFinished,1
			je dontAddABall
					
					;========== shift all ball arrays to the right and make space for new ball at 0 index ============
					push offset level2BallsSlowDownBalls
					mov eax, 0
					push eax
					movzx eax, level2BallsCount
					push eax
					call shiftRight

					push offset level2BallsColor
					mov eax, 0
					push eax
					movzx eax, level2BallsCount
					push eax
					call shiftRight

					push offset level2BallsX
					mov eax, 0
					push eax
					movzx eax, level2BallsCount
					push eax
					call shiftRight

					push offset level2BallsY
					mov eax, 0
					push eax
					movzx eax, level2BallsCount
					push eax
					call shiftRight

					push offset level2BallsExists
					mov eax, 0
					push eax
					movzx eax, level2BallsCount
					push eax
					call shiftRight

					push offset level2BallsPathIndex
					mov eax, 0
					push eax
					movzx eax, level2BallsCount
					push eax
					call shiftRight

					;======= set new ball attributes =========
					mov edi,0
					movzx eax, level2PathX[edi]
					mov level2BallsX[edi], al		;x coord

					movzx eax, level2PathY[edi]
					mov level2BallsY[edi], al		;y coord

					mov level2BallsExists[edi], 1	;exists

					mov level2BallsPathIndex[edi], 0;path index

					call setRandomColor
					mov level2BallsColor[edi], al	;color
					call resetColor

					call level2BallsSetPowerUp
					mov level2BallsSlowDownBalls[edi], al

					;======= increment number of balls created =======
					inc byte ptr level2BallsCount	

					;===== if no of balls = min balls, stop production ====
					mov eax, level2StartingBallsLength
					cmp al, level2BallsCount
					ja notDoneProduction
						mov level2BallsProductionFinished,1
					notDoneProduction:

			dontAddABall:

	;al=true if balls been updated
	mov al,1
	jmp endFunc
	dontMove:

	;al=false if not updated
	mov al,0
	endFunc:
	ret
moveLevel2Balls endp

;=================== set random power up =====================
level2BallsSetPowerUp PROC

	mov eax, 7
	call randomRange
	cmp eax,1
	jne normal
		mov al,1
		jmp exitFunc
	normal:
	mov al,0
	exitFunc:
ret
level2BallsSetPowerUp endp

;=================== draw balls =========================
drawLevel2Balls PROC
	
	mov edi, 0
	draw:
		movzx eax, level2BallsCount
		cmp edi, eax
		je exitLoop
		
		mov dl, level2BallsX[edi]
		mov dh, level2BallsY[edi]
		call gotoxy					;position

		movzx eax, level2BallsColor[edi]
		push eax
		call setColor				;color

		;draw ball different if slow down ball
		cmp level2BallsSlowDownBalls[edi], 1
		jne normal
			mov al, slowDownBallChar
			call writeChar			;draw slow down ball
			jmp slowDownBall
		normal:

		mov al, ballChar
		call writeChar				;draw

		slowDownBall:

		call resetColor				;resetColor

	inc edi
	jmp draw
	exitLoop:

	ret
drawLevel2Balls endp



initLevel2Path PROC
	pushad

	mov esi, 0
	
	initialize:
		mov al, level2PathCurrX
		mov level2PathX[esi], al
		mov al, level2PathCurrY
		mov level2PathY[esi], al
		inc esi
			cmp esi, level2PathBlocks
			jae exitInit
		inc level2PathCurrX

		sub level2PathXSideSize,4
		movzx ecx, level2PathXSideSize
		topPart:
			mov al, level2PathCurrX
			mov level2PathX[esi], al
			mov al, level2PathCurrY
			mov level2PathY[esi], al
			inc esi
			inc level2PathCurrX
			cmp esi, level2PathBlocks
			jae exitInit
		loop topPart

		sub level2PathYSideSize,2
		movzx ecx, level2PathYSideSize
		rightPart:
			mov al, level2PathCurrX
			mov level2PathX[esi], al
			mov al, level2PathCurrY
			mov level2PathY[esi], al
			inc esi
			inc level2PathCurrY
			cmp esi, level2PathBlocks
			jae exitInit
		loop rightPart

		sub level2PathXSideSize,4
		movzx ecx, level2PathXSideSize
		bottomPart:
			mov al, level2PathCurrX
			mov level2PathX[esi], al
			mov al, level2PathCurrY
			mov level2PathY[esi], al
			inc esi
			dec level2PathCurrX
			cmp esi, level2PathBlocks
			jae exitInit
		loop bottomPart

		sub level2PathYSideSize,2
		movzx ecx, level2PathYSideSize
		leftPart:
			mov al, level2PathCurrX
			mov level2PathX[esi], al
			mov al, level2PathCurrY
			mov level2PathY[esi], al
			inc esi
			dec level2PathCurrY
			cmp esi, level2PathBlocks
			jae exitInit

		loop leftPart

		
	

	cmp esi, level2PathBlocks
	jb initialize
	exitInit:

	popad
	ret
initLevel2Path endp

;===================== draw level 2 path =================
drawLevel2Path PROC

	pushad

			mov ecx, level2PathBlocks
			mov esi,0
			draw:

				mov eax, pathColor
				call setTextColor		;set color

				mov dl, level2PathX[esi]
				mov dh, level2PathY[esi]
				call gotoxy				;position

				mov al, ' '
				call writeChar			;draw

				call resetColor			;reset color

			inc esi
			loop draw

			;======== draw start and end of path =========
			mov esi, 0
			mov dl, level2Pathx[esi]
			mov dh, level2PathY[esi]
			dec dl
			call gotoxy
			mov eax, Black (lightblue*16)
			call setTextColor
			mov al, '+'
			call writeChar			;draw start
			call resetColor

			mov esi, level2PathBlocks
			dec esi
			mov dl, level2Pathx[esi]
			mov dh, level2PathY[esi]
			dec dh
			call gotoxy
			mov eax, black (lightRed*16)
			call setTextColor
			mov al, '-'
			call writeChar			;draw end
			call resetColor
			
	popad
	ret
drawLevel2Path endp

;================================================================================================================== LEVEL 1 ===============================================================================================================
level1 PROC

	;preserve all registers
	pushad

	;intial setup
	call level1screen
	call drawBoundary		
	call setAim	
	call drawPlayer
	call initBullets
	call showCaseBullets
	call initLevel1Path
	call drawLevel1Path
	call drawLevelTxt
	call drawScoreTxt
	push offset level1pathX						
	push offset level1pathY						
	push offset level1BallsColor			
	push offset level1BallsX				
	push offset level1BallsY				
	push offset level1BallsExists			
	push offset level1BallsPathIndex	
	call initBalls
	call drawLevelBalls


	;================ GAME LOOP ================
	gameLoop:
		
		
		mov eax, 16
		call delay				;short delay to match framerate

		call readPlayerInput	;read playerInput

		cmp returnToMainMenu,1	;return to main menu
		jne dontReturn
			call reset
			mov returnToMainMenu,0
			jmp exitGameLoop
			
		dontReturn:

		;============ updating ===============

		;----- player updated? -----
		cmp updatePlayer,1
		jne DontUpdatePlayer

				mov updatePlayer,0	;reset state
				call setAim			;adjust aim according to player's direction
				call drawPlayer		;draw player and his new aim

		DontUpdatePlayer:

		;----- bullet showcase updated? -----
		cmp updateBulletShowcase,1
		jne DontUpdateBulletShowcase

				mov updateBulletShowcase,0		;reset state
				call showCaseBullets			;draw bullet showcase at top of screen

		DontUpdateBulletShowcase:

		;----- move bullet if it exists ------
		push offset level1PathX
		push offset level1PathY
		mov eax, level1PathBlocks
		push eax
		call moveBullet
		call drawBullet

		;------ move and draw balls --------
		call moveLevelBalls
		cmp al,1
		jne ballsNotMoved
			call drawLevelBalls
		ballsNotMoved:

		;------- lost game? -------
		cmp lostGame, 1
		jne didntLoseGame
				mov lostGame,0
				call youLostScreen
				popad
				ret
		didntLoseGame:
		;------- collision check -----------
		movzx eax, level1BallsCount
		push eax
		push offset level1BallsX
		push offset level1BallsY
		call checkCollision

		cmp al, -1
		je noCollision

				;collision detected:
				mov cl, al
				movzx eax, cl
				push eax					;preserve ball index of collision
				
				push offset level1PathX
				push offset level1PathY
				movzx ebx, level1BallsCount
				push ebx					;ending index	(last ball)
				push eax					;starting index(index where collision occured)
				push offset level1BallsColor			
				push offset level1BallsX				
				push offset level1BallsY				
				push offset level1BallsExists		
				push offset level1BallsPathIndex		
				call shiftBallsRight		;make space for new ball
				
				pop esi						;retrieve index of collision
				
				;add new ball with (x,y,color)= bullet(x,y,color)
				mov al,  bullet1X
				mov level1BallsX[esi], al
				mov al,  bullet1Y
				mov level1BallsY[esi], al
				mov al, bullet1Color
				mov level1BallsColor[esi],al
				mov level1BallsExists[esi],1
				mov edi, esi
				inc edi
				mov al, level1BallsPathIndex[edi]
				dec al
				mov level1BallsPathIndex[esi], al
				
				inc level1BallsCount

				
				call destroyBullet
				call drawLevelBalls

				;check if explosion occurs
				push offset level1PathX					
				push offset level1PathY					
				push offset level1BallsExists			
				push offset level1BallsPathIndex			
				push offset level1BallsX
				push offset level1BallsY
				push offset level1BallsCount
				push esi
				push offset level1BallsColor
 				call explodeBalls
				
		noCollision:


		;------------- draw score --------------
		cmp updateScore,1
		jne dontUpdateScore
					mov updateScore,0
					call drawScoreTxt
		dontUpdateScore:

		;------------ did player win ------------
		cmp level1BallsCount,0
		jne didntWin
			call youWonScreen
			popad
			ret
		didntWin:

	jmp gameLoop
	exitGameLoop:

	popad
	ret
level1 endp

;========== write level number at top of screen =======
drawLevelTxt PROC
	push eax
	push edx

	mov eax, levelTxtX
	mov dl,al
	mov eax, levelTxtY
	mov dh, al
	call gotoxy
	
	mov eax, lightCyan
	call setTextColor
	
	mov edx, offset levelTxt
	call writeString

	mov al, levelNo
	call writeDec
	call resetColor

	pop edx
	pop eax
ret 
drawLevelTxt endp

;========== draw score ===============
drawScoreTxt PROC
	push eax
	push edx

	mov eax, scoreTxtX
	mov dl,al
	mov eax, scoreTxtY
	mov dh, al
	call gotoxy
	
	mov edx, offset scoreTxt
	call writeString

	mov ax,score
	call writeDec
	call resetColor

	pop edx
	pop eax
ret 
drawScoreTxt endp

;========== set coordinates of level 1 path ===========
initLevel1Path PROC
    pushad                      ; Save registers

    mov esi, 0                  ; Start from the beginning of the arrays
    mov al, 30                  ; Initial value for level1PathX
    mov bl, level1maxY          ; Set initial value for level1PathY

    ;=== Curve 1 ===
    ; 20 steps, mainly horizontal
    mov ecx, 20
    curve1:
        mov level1PathX[esi], al        ; Set X coordinate
        mov level1PathY[esi], bl        ; Set Y coordinate
        dec bl                          ; Move up by 1 on Y-axis
        inc esi
        loop curve1

    ;=== Curve 2 ===
    ; 18 steps, increasing X with a slight curve upwards
    mov ecx, 18
    curve2:
        mov level1PathX[esi], al        ; Set X coordinate
        mov level1PathY[esi], bl        ; Set Y coordinate
        inc al                          ; Move right by 1 on X-axis
        inc esi
        loop curve2

    ;=== Curve 3 ===
    ; 18 steps, gradual upward movement in Y, while X stays steady
    mov ecx, 18
    curve3:
        mov level1PathX[esi], al        ; Set X coordinate
        mov level1PathY[esi], bl        ; Set Y coordinate
        inc bl                          ; Move Y up
        inc esi
        loop curve3

    ;=== Curve 4 ===
    ; 20 steps, X increases with a slight curve to the right
    mov ecx, 20
    curve4:
        mov level1PathX[esi], al        ; Set X coordinate
        mov level1PathY[esi], bl        ; Set Y coordinate
        inc al                          ; Move right by 1 on X-axis
        inc esi
        loop curve4

    ;=== Curve 5 ===
    ; 17 steps, horizontal movement, and decrease in Y
    add al, 3                      ; Add 3 to the initial X value
    mov ecx, 17
    curve5:
        mov level1PathX[esi], al        ; Set X coordinate
        mov level1PathY[esi], bl        ; Set Y coordinate
        dec bl                          ; Move down by 1 on Y-axis
        inc esi
        loop curve5

    ;=== Curve 6 ===
    ; 15 steps, gradual upward curve in Y with horizontal motion in X
    mov ecx, 15
    curve6:
        mov level1PathX[esi], al        ; Set X coordinate
        mov level1PathY[esi], bl        ; Set Y coordinate
        inc al                          ; Move right by 1 on X-axis
        inc esi
        loop curve6

    ;=== Curve 7 ===
    ; 18 steps, gradual increase in Y with steady movement in X
    mov ecx, 18
    curve7:
        mov level1PathX[esi], al        ; Set X coordinate
        mov level1PathY[esi], bl        ; Set Y coordinate
        inc bl                          ; Move Y up
        inc esi
        loop curve7

    ;=== Adjustments ===
    ; Fine-tune the path with slight shifts
    mov esi, 1                     ; Start adjustment from the second point
    ; Curve 1 adjustments: Small left and right movements
    mov ecx, 3
    adjc11:
        add level1PathX[esi], -1      ; Shift X to the left
        add level1PathY[esi], 0       ; No change in Y
        inc esi
        loop adjc11

    ; Curve 2 adjustments: Small upward movement
    mov ecx, 3
    adjc12:
        add level1PathX[esi], 0       ; No change in X
        add level1PathY[esi], 1       ; Move Y up
        inc esi
        loop adjc12

    ; Final cleanup and return
    popad                        ; Restore registers
    ret

initLevel1Path ENDP

;===================== draw level 1 path =================
drawLevel1Path PROC

	pushad

			mov ecx, level1PathBlocks
			mov esi,0
			draw:

				mov eax, pathColor
				call setTextColor		;set color

				mov dl, level1PathX[esi]
				mov dh, level1PathY[esi]
				call gotoxy				;position

				mov al, ' '
				call writeChar			;draw

				call resetColor			;reset color

			inc esi
			loop draw

			;======== draw start and end of path =========
			mov esi, 0
			mov dl, level1Pathx[esi]
			mov dh, level1PathY[esi]
			inc dh
			call gotoxy
			mov eax, Black (lightblue*16)
			call setTextColor
			mov al, '+'
			call writeChar			;draw start
			call resetColor

			mov esi, level1PathBlocks
			dec esi
			mov dl, level1Pathx[esi]
			mov dh, level1PathY[esi]
			inc dh
			call gotoxy
			mov eax, black (lightRed*16)
			call setTextColor
			mov al, '-'
			call writeChar			;draw end
			call resetColor
			
			
			
	popad
	ret
drawLevel1Path endp

;======================= pause screen ===========================
pauseGame PROC
	
	;preserve registers
	pushAD

	;clear screen
	call clrscr

	;write main menu texts
	call writePauseText

	;draw boundaries
	call drawBoundary
	
	mainMenuLoop:

		;short delay to match framerate
		mov eax, 24
		call delay
		
		;read input to navigate menu(up or down)
		call readPauseInput

		;enter is pressed(take action accordingly)
		cmp mainMenuIsEnterPressed, 1
		je breakMainLoop

	jmp mainMenuLoop

	breakMainLoop:
	mov mainMenuIsEnterPressed,0

	;clear screen
	call clrscr

	popad
	mov al, mainMenuSelectedOption
	ret
pauseGame endp


;==================Write pause texts==================
writePauseText PROC
	
	;preserve register values
	pushAD

	;==== PAUSED =====
	mov dl, 0
	mov dh, 6
	call gotoxy
	mov eax, lightCyan
	call setTextColor
	mov edx, offset pausedTxt
	call writeString
	call resetColor

	;===========selectable texts=============
	;to traverse Texts array
	mov esi,0

	;==== Start game ====
	mov dl, mainMenuX
	mov dh, mainMenuY
	add dh,1
	add dl,7
	call gotoxy			
	mov edx, mainMenuTextArray[esi]
	add esi,type mainMenuTextArray
	call WriteString
	
	;===== Instructions =====
	mov dl, mainMenuX
	mov dh, mainMenuY
	add dh,2
	add dl,7
	call gotoxy
	mov edx, mainMenuTextArray[esi]
	add esi,type mainMenuTextArray
	call WriteString
	
	;===== Scoreboard =====
	mov dl, mainMenuX
	mov dh, mainMenuY
	add dh,3
	add dl,7
	call gotoxy
	mov edx, mainMenuTextArray[esi]
	add esi,type mainMenuTextArray
	call WriteString
	
	;======= exit =======
	mov dl, mainMenuX
	mov dh, mainMenuY
	add dh,4
	add dl,7
	call gotoxy
	mov edx, mainMenuTextArray[esi]
	add esi,type mainMenuTextArray
	call WriteString

	;change the color of the selected option text
	movzx edi, mainMenuSelectedOption
	mov dl, mainMenuX
	mov dh, mainMenuY
	add dh,1
	mov eax, edi
	mov bl,type mainMenuTextArray
	div bl
	add dh,al
	add dl,7
	call gotoxy			;positioning
	mov eax, lightGreen
	call setTextColor	;set color
	mov edx, mainMenuTextArray[edi]
	call WriteString	;write string
	mov eax, white
	call setTextColor	;reset color to default
	
	popad
	ret
writePauseText endp

;==================Read Input In Main Menu==================
readPauseInput PROC

		;preserve register values
		pushAD

		;see if key has been pressed
		call readKey
		jz keyNotPressed  
		
			;Move up
			cmp al, 'w'
			jne dontMoveUp
				cmp mainMenuSelectedOption, 0	;boundary check
				je dontMoveUp
					sub mainMenuSelectedOption, type mainMenuTextArray
			dontMoveUp:

			;Move down
			cmp al,'s'
			jne dontMoveDown
				mov al, sizeOf MainMenuTextArray
				sub al, type MainMenuTextArray
				cmp mainMenuSelectedOption, al	;boundary check
				je dontMoveDown
					add mainMenuSelectedOption, type mainMenuTextArray
			dontMoveDown:

			;enter
			cmp al, 13
			jne notEnter
				mov mainMenuIsEnterPressed, 1	;allow main menu to take action accordingly if enter is pressed
			notEnter:
		
			;write main menu texts
			call writePauseText

		keyNotPressed:
		popad
		ret
readPauseInput endp


;=====================================MAIN MENU========================================
mainMenu PROC
	
	;preserve registers
	pushAD

	;clear screen
	call clrscr

	;initialize path
	call initMainMenuPath
	call drawMainMenuPath


	;draw boundaries
	call drawBoundary

	
	;draw patterns 
	call drawMenuBalls
	call drawButtons 
	
	mainMenuLoop:

		;short delay to match framerate
		mov eax, 24
		call delay
		
		;read input to navigate menu(up or down)
		call readMainMenuInput

		;enter is pressed(take action accordingly)
		cmp mainMenuIsEnterPressed, 1
		je breakMainLoop


		;move background balls
		call moveMenuBalls
		
		;draw background balls
		call drawMenuBalls

	jmp mainMenuLoop

	breakMainLoop:
	mov mainMenuIsEnterPressed,0

	;clear screen
	call clrscr

	popad
	mov al, mainMenuSelectedOption
	ret
mainMenu endp

;================ draw main menu path ========================
drawMainMenuPath PROC

	;preserve registers
	pushad

	mov esi,0
	drawLoop:
		
		mov dl, mainMenuPathX[esi]
		mov dh, mainMenuPathY[esi]
		call gotoxy					;positioning

		mov eax, lightgray (lightgray*16)
		call setTextColor			;set color to gray background

		mov al, '.'
		call writeChar				;draw

		mov eax, white (black*16)
		call setTextColor			;reset color

	inc esi
	cmp esi, mainMenuPathBlocks
	jl drawLoop
	
	popad
	ret
drawMainMenuPath endp

;=================== Initialize main menu path =====================
initMainMenuPath PROC
		
	;preserve registers
	pushad

	;top part of path
	mov ecx, mainMenuMinX
	mov esi, 0
	topPart:
		mov mainMenuPathX[esi], cl	;variable x coord(left to right)
		mov eax, mainMenuMinY	
		mov mainMenuPathY[esi], al	;constant y coord(min Y)
		inc esi
	inc ecx
	cmp ecx, mainMenuMaxX
	jne topPart

	;right part of path
	mov ecx, mainMenuMinY
	rightPart:
		mov mainMenuPathY[esi], cl	;variable y coord(top to down)
		mov eax, mainMenuMaxX	
		mov mainMenuPathX[esi], al	;constant x coord(max X)
		inc esi
	inc ecx
	cmp ecx, mainMenuMaxY
	jne rightPart

	;bottom part of path
	mov ecx, mainMenuMaxX
	bottomPart:
		mov mainMenuPathX[esi], cl	;variable x coord(right to left)
		mov eax, mainMenuMaxY	
		mov mainMenuPathY[esi], al	;constant y coord(max Y)
		inc esi
	dec ecx
	cmp ecx, mainMenuMinX
	jne bottomPart

	;left part of path
	mov ecx, mainMenuMaxY
	leftPart:
		mov mainMenuPathY[esi], cl	;variable y coord(down to top)
		mov eax, mainMenuMinX	
		mov mainMenuPathX[esi], al	;constant x coord(min X)
		inc esi
	dec ecx
	cmp ecx, mainMenuMinY
	jne leftPart

	;==================== adjustments to bring in curves =================

	;===== first curve =====
	;adj1
	mov esi, 21
	mov ecx, 4
	adjustment11:
		
		add mainMenuPathY[esi],1
	inc esi
	loop adjustment11

	;adj2
	mov ecx,4
	adjustment12:
		add mainMenuPathY[esi],2
	inc esi
	loop adjustment12

	;adj3
	mov ecx,10
	adjustment13:
		add mainMenuPathY[esi],3
	inc esi
	loop adjustment13

	;adj 4
	mov ecx,4
	adjustment14:
		add mainMenuPathY[esi],2
	inc esi
	loop adjustment14

	;adj 5
	mov ecx,4
	adjustment15:
		add mainMenuPathY[esi],1
	inc esi
	loop adjustment15

	;======= second curve =======

	mov esi, 71
	;adj1
	mov ecx,2
	adjustment21:
		add mainMenuPathX[esi],1
	inc esi
	loop adjustment21

	;adj2
	mov ecx,2
	adjustment22:
		add mainMenuPathX[esi],2
	inc esi
	loop adjustment22

	;adj3
	mov ecx,2
	adjustment23:
		add mainMenuPathX[esi],3
	inc esi
	loop adjustment23

	;adj4
	mov ecx,2
	adjustment24:
		add mainMenuPathX[esi],4
	inc esi
	loop adjustment24

	;adj5
	mov ecx,2
	adjustment25:
		add mainMenuPathX[esi],3
	inc esi
	loop adjustment25

	;adj6
	mov ecx,2
	adjustment26:
		add mainMenuPathX[esi],2
	inc esi
	loop adjustment26

	;adj7
	mov ecx,2
	adjustment27:
		add mainMenuPathX[esi],1
	inc esi
	loop adjustment27

	;=================== third curve ===================
	 mov esi, 89

	 add mainMenuPathY[esi],1
	 inc esi
	 add mainMenuPathY[esi],2
	 inc esi
	 add mainMenuPathY[esi],3
	 inc esi
	 add mainMenuPathY[esi],3
	 inc esi
	 add mainMenuPathY[esi],3
	 inc esi
	 add mainMenuPathY[esi],2
	 inc esi
	 add mainMenuPathY[esi],1
	 inc esi
	 inc esi

	 ;================= fourth curve ================
	 sub mainMenuPathY[esi],1
	 inc esi
	 sub mainMenuPathY[esi],1
	 inc esi
	 sub mainMenuPathY[esi],2
	 inc esi
	 sub mainMenuPathY[esi],2
	 inc esi
	 sub mainMenuPathY[esi],3
	 inc esi
	 sub mainMenuPathY[esi],3
	 inc esi
	 sub mainMenuPathY[esi],4
	 inc esi
	 sub mainMenuPathY[esi],4
	 inc esi
	 sub mainMenuPathY[esi],4
	 inc esi
	 sub mainMenuPathY[esi],4
	 inc esi
	 sub mainMenuPathY[esi],4
	 inc esi
	 sub mainMenuPathY[esi],4
	 inc esi
	 sub mainMenuPathY[esi],3
	 inc esi
	 sub mainMenuPathY[esi],3
	 inc esi
	 sub mainMenuPathY[esi],2
	 inc esi
	 sub mainMenuPathY[esi],2
	 inc esi
	 sub mainMenuPathY[esi],2
	 inc esi
	 sub mainMenuPathY[esi],2
	 inc esi
	  sub mainMenuPathY[esi],2
	 inc esi

	 ;=============== fifth curve ================
	 sub mainMenuPathY[esi],2
	 inc esi
	 sub mainMenuPathY[esi],2
	 inc esi
	 sub mainMenuPathY[esi],2
	 inc esi
	 sub mainMenuPathY[esi],2
	 inc esi
	 sub mainMenuPathY[esi],2
	 inc esi
	 sub mainMenuPathY[esi],2
	 inc esi
	 sub mainMenuPathY[esi],2
	 inc esi
	 sub mainMenuPathY[esi],2
	 inc esi
	 sub mainMenuPathY[esi],2
	 inc esi
	 sub mainMenuPathY[esi],2
	 inc esi
	 sub mainMenuPathY[esi],2
	 inc esi
	 sub mainMenuPathY[esi],2
	 inc esi
	

	  ;================= sixth curve ================
	 sub mainMenuPathY[esi],2
	 inc esi
	 sub mainMenuPathY[esi],2
	 inc esi
	 sub mainMenuPathY[esi],2
	 inc esi
	 sub mainMenuPathY[esi],2
	 inc esi
	 sub mainMenuPathY[esi],2
	 inc esi
	 sub mainMenuPathY[esi],3
	 inc esi
	 sub mainMenuPathY[esi],3
	 inc esi
	 sub mainMenuPathY[esi],4
	 inc esi
	 sub mainMenuPathY[esi],4
	 inc esi
	 sub mainMenuPathY[esi],4
	 inc esi
	 sub mainMenuPathY[esi],4
	 inc esi
	 sub mainMenuPathY[esi],4
	 inc esi
	 sub mainMenuPathY[esi],4
	 inc esi
	 sub mainMenuPathY[esi],3
	 inc esi
	 sub mainMenuPathY[esi],3
	 inc esi
	 sub mainMenuPathY[esi],2
	 inc esi
	 sub mainMenuPathY[esi],2
	 inc esi
	 sub mainMenuPathY[esi],1
	 inc esi
	 sub mainMenuPathY[esi],1
	 inc esi
	 inc esi

	 ;============== seventh curve ===============
	  add mainMenuPathY[esi],1
	 inc esi
	 add mainMenuPathY[esi],2
	 inc esi
	 add mainMenuPathY[esi],3
	 inc esi
	 add mainMenuPathY[esi],3
	 inc esi
	 add mainMenuPathY[esi],3
	 inc esi
	 add mainMenuPathY[esi],2
	 inc esi
	 add mainMenuPathY[esi],1
	 inc esi
	 inc esi

	;======= eighth curve =======
	mov esi, 159

	;adj1
	mov ecx,2
	adjustment81:
		sub mainMenuPathX[esi],1
	inc esi
	loop adjustment81

	;adj2
	mov ecx,2
	adjustment82:
		sub mainMenuPathX[esi],2
	inc esi
	loop adjustment82

	;adj3
	mov ecx,2
	adjustment83:
		sub mainMenuPathX[esi],3
	inc esi
	loop adjustment83

	;adj4
	mov ecx,2
	adjustment84:
		sub mainMenuPathX[esi],4
	inc esi
	loop adjustment84

	;adj5
	mov ecx,2
	adjustment85:
		sub mainMenuPathX[esi],3
	inc esi
	loop adjustment85

	;adj6
	mov ecx,2
	adjustment86:
		sub mainMenuPathX[esi],2
	inc esi
	loop adjustment86

	;adj7
	mov ecx,2
	adjustment87:
		sub mainMenuPathX[esi],1
	inc esi
	loop adjustment87

	;adj 8
	mov esi, 0
	add mainMenuPathY[esi],1
	add mainMenuPathX[esi],1

	popad
	ret
initMainMenuPath endp

;================moving menu balls ===============
moveMenuBalls PROC

	;preserve registers
	pushad

	; Get current time
    call getMSeconds
    mov ecx, eax               

    ; Check if 100 milliseconds have elapsed since the last movement
    mov eax, ecx               
    sub eax, mainMenuBallsLastUpdateTime     
    cmp eax, ballSpeed               
    jl timeOutNotExceeded      

		; Update the lastUpdateTime to the current time
		mov mainMenuBallsLastUpdateTime, ecx
	
		;================== move balls logic ======================
		;print space at newly emptied area
		mov edi, 0
		mov dl, mainMenuBallsX[edi]
		mov dh, mainMenuBallsY[edi]
		call gotoxy			;positioning

		mov eax, lightgray (lightgray*16)
		call setTextColor	;set color

		mov al, '.'
		call WriteChar		;print space

		mov eax, white (black*16)
		call setTextColor	;reset color

		;============== main loop ================
		mov edi,0
		moveBallsLoop:
			
			inc BYTE PTR mainMenuBallsPathIndex[edi];make the currently selected ball point to the next path block

			mov eax, mainMenuPathBlocks
			cmp mainMenuBallsPathIndex[edi], al;if the next path block goes out of range, reset to zero
			jne inRange
				mov mainMenuBallsPathIndex[edi],0
			inRange:

			movzx esi, mainMenuBallsPathIndex[edi]	;store the next path block's index in esi
			
			;set x and y coordinates according to the next path block
			mov al,  mainMenuPathX[esi]
			mov mainMenuBallsX[edi], al
			mov al,  mainMenuPathY[esi]
			mov mainMenuBallsY[edi], al

		inc edi
		cmp edi, mainMenuBallsCount
		jl moveBallsLoop
		
	timeOutNotExceeded:

	popad
	ret
moveMenuBalls endp

;==================Draw balls in menu ================
drawMenuBalls PROC 

	;preserve register values
	pushAD

	mov esi, 0
	mov ecx, mainMenuBallsCount
	drawBallsLoop:

		;positioning
		mov dl, mainMenuBallsX[esi]
		mov dh, mainMenuBallsY[esi]
		call gotoxy

		;coloring
		movzx eax, BYTE PTR mainMenuBallsColor[esi]
		push eax	;send color char as parameter
		call setColor

		;drawing
		mov al, '@'
		call WriteChar

		;reset color
		mov eax, white (black*16)
		call setTextColor

		inc esi
	loop drawBallsLoop

	popAD
	ret
drawMenuBalls endp


;==================Read Input In Main Menu==================
readMainMenuInput PROC

		;preserve register values
		pushAD

		;see if key has been pressed
		call readKey
		jz keyNotPressed  
		
			;Move up
			cmp al, 'w'
			jne dontMoveUp
				cmp mainMenuSelectedOption, 0	;boundary check
				je dontMoveUp
					sub mainMenuSelectedOption, type mainMenuTextArray
			dontMoveUp:

			;Move down
			cmp al,'s'
			jne dontMoveDown
				mov al, sizeOf MainMenuTextArray
				sub al, type MainMenuTextArray
				cmp mainMenuSelectedOption, al	;boundary check
				je dontMoveDown
					add mainMenuSelectedOption, type mainMenuTextArray
			dontMoveDown:

			;enter
			cmp al, 13
			jne notEnter
				mov mainMenuIsEnterPressed, 1	;allow main menu to take action accordingly if enter is pressed
			notEnter:


		keyNotPressed:
		popad
		ret
readMainMenuInput endp


;================Draw all boundaries===============
drawBoundary PROC

	;preserve register values
	pushAD

	;====== set boundary color ======
	mov eax, lightCyan (black*16)
	call setTextColor

	;====== draw upper boundary ======
	mov dx,1
	call gotoxy
	mov edx, offset boundary1
	call WriteString

	;====== draw left boundary ======
	mov ecx, maxY
	dec ecx
	leftBoundaryLoop:
		mov dl,0
		mov dh, cl
		call gotoxy

		mov edx, offset boundary2
		call WriteString
	loop leftBoundaryLoop

	;====== draw right boundary ======
	mov ecx, maxY
	dec ecx
	rightBoundaryLoop:
		mov dl,maxX
		mov dh, cl
		call gotoxy

		mov edx, offset boundary2
		call WriteString	
	loop rightBoundaryLoop

	;====== draw lower boundary ======
	mov dl,1
	mov dh, maxY
	call gotoxy
	mov edx, offset boundary1
	call WriteString

	;====== reset text color ======
	mov eax, white (black*16)
	call setTextColor

	popad
	ret
drawBoundary endp


;======= draw buttons =========
drawButtons PROC

	;preserve registers
	pushAD	

	;yellow
	mov dl, 85
	mov dh, 9
	call gotoxy
	mov eax, brown (brown*16)
	call setTextColor
	mov al, ' '
	call WriteChar
	mov dl, 86
	mov dh, 9
	call gotoxy
	mov eax, brown (brown*16)
	call setTextColor
	mov al, ' '
	call WriteChar

	;red
	mov dl, 89
	mov dh, 11
	call gotoxy
	mov eax, red (red*16)
	call setTextColor
	mov al, ' '
	call WriteChar
	mov dl, 90
	mov dh, 11
	call gotoxy
	mov eax, red (red*16)
	call setTextColor
	mov al, ' '
	call WriteChar

	;green
	mov dl, 85
	mov dh, 13
	call gotoxy
	mov eax, green (green*16)
	call setTextColor
	mov al, ' '
	call WriteChar
	mov dl, 86
	mov dh, 13
	call gotoxy
	mov eax, green (green*16)
	call setTextColor
	mov al, ' '
	call WriteChar

	;blue
	mov dl, 81
	mov dh, 11
	call gotoxy
	mov eax, blue (blue*16)
	call setTextColor
	mov al, ' '
	call WriteChar
	mov dl, 82
	mov dh, 11
	call gotoxy
	mov eax, blue (blue*16)
	call setTextColor
	mov al, ' '
	call WriteChar


	;====== reset text color ======
	mov eax, white (black*16)
	call setTextColor

	mov dl, 35
	mov dh, 9
	call gotoxy
	mov al, 'W'
	call WriteChar

	mov dl, 31
	mov dh, 11
	call gotoxy
	mov al, 'A'
	call WriteChar

	mov dl, 39
	mov dh, 11
	call gotoxy
	mov al, 'D'
	call WriteChar

	mov dl, 35
	mov dh, 13
	call gotoxy
	mov al, 'S'
	call WriteChar

	popad
	ret
drawButtons endp

;================= you Won screen ===============
youWonScreen PROC
		pushad


		call clrscr
		call drawBoundary

		mov ecx, 6
		mov esi,1
		mov edi,-1
		blinkLoop:

			mov dl, 0
			mov dh, 3
			call gotoxy
			cmp esi, 1
			jne whiteText
				mov eax, lightCyan
				jmp notWhite
			whiteText:
			;mov eax, white
			notWhite:
			call setTextColor
			xchg esi,edi
			mov edx, offset levelCompletedTxt1
			call writeString
			mov dl, 0
			mov dh, 3
			add dh, 7
			call gotoxy
			mov edx, offset levelCompletedTxt1
			call writeString

			call resetColor
			mov eax, 400
			call delay

		loop blinkLoop
		
		mov dl, 54
		mov dh, 21
		call gotoxy
		mov edx, offset scoreTxt
		call writeString
		mov ax, score
		call writeDec

		mov dl, 42
		inc dl
		mov dh, 23
		inc dh
		call gotoxy

		mov edx, offset pressAnyButtonTxt
		call writeString
		call readChar
		call clrscr


		movzx eax, score
		push eax
		;reset all attributes
		call reset
		pop eax
		mov score,ax
		mov startNextLevel,1

popad
ret
youWonScreen endp
;================= you lost screen ===============
youLostScreen PROC	
		
		call clrscr
		call drawBoundary
		mov dl, 0
		mov dh, maxY/4
		call gotoxy
		
		mov eax, lightCyan
		call setTextColor
		mov edx, offset youLostTxt
		call writeString
		call resetColor

		mov dl, 54
		mov dh, 18
		call gotoxy

		mov edx, offset scoreTxt
		call writeString
		mov al,byte ptr score
		call writeDec

		mov eax,1000
		call delay
		
		mov dl, 42
		inc dl
		mov dh, 20
		inc dh
		call gotoxy

		mov edx, offset pressAnyButtonTxt
		call writeString
		call readChar
		call clrscr

		;reset all attributes
		call reset

ret
youLostScreen endp

;================= reset all attributes =============
reset PROC
		mov playerX, 60
		mov playerY, 19
		mov playerDir, 1	
		mov updatePlayer,0
		mov bulletLastUpdateTime,0
		mov updateBulletShowcase,0
		mov bullet1X,0
		mov bullet1Y,0
		mov bullet1Color,0
		mov bulletDir,0
		mov bullet1Exists,0
		mov bullet2Color,0
		mov wonGame,0
		mov lostGame,0
		mov returnToMainMenu,0
		mov score, 0
		mov updateScore,0
		mov scoreMultiplier,1

		mov level1BallsProductionFinished ,0
		mov level1BallsCount ,1
		mov level1BallsLastUpdateTime ,0

		mov ecx,level1PathBlocks
		mov esi,0
		resetLoop1:
			mov level1BallsColor[esi] ,0
			mov level1BallsX[esi] ,0
			mov level1BallsY[esi] ,0
			mov level1BallsExists[esi] ,0
			mov level1BallsPathIndex[esi] ,0
			inc esi
		loop resetLoop1

		mov level2PathCurrX, level2MinX
		mov level2PathCurrY, level2MinY
		mov level2PathXSideSize, level2MaxX-level2MinX-4
		mov level2PathYSideSize, level2MaxY-level2MinY-2
		mov level2BallsProductionFinished ,0
		mov level2BallsCount ,1
		mov level2BallsLastUpdateTime ,0

		mov ecx,level2PathBlocks
		mov esi,0
		resetLoop2:
			mov level2BallsColor[esi] ,0
			mov level2BallsX[esi] ,0
			mov level2BallsY[esi] ,0
			mov level2BallsExists[esi] ,0
			mov level2BallsPathIndex[esi] ,0
			mov level2BallsSlowDownBalls[esi],0
			inc esi
		loop resetLoop2

			
ret
reset endp

;================== LEVEL 1 SCREEN ================
level1Screen PROC

	;preserve registers
	pushAD

	;draw boundaries
	;call drawBoundary

	
;============== write LVL 1 ===================
	mov edx, OFFSET l1Art
	mov eax, cyan
    CALL SetTextColor



    CALL WriteString


	mov eax,3000
	call delay

	call clrscr
	popad
	ret
level1Screen endp

;================== LEVEL 2 SCREEN ================
level2Screen PROC

	;preserve registers
	pushAD

	;draw boundaries
	call drawBoundary

	
	;============== write LVL 2 ===================
	;--- L ---
	mov ecx,15
	LLoop1:
		mov eax, lightcyan (lightcyan*16)
		call setTextColor
		mov dl,25
		mov dh, 5
		add dh,cl
		call gotoxy
		mov al, ' '
		call WriteChar
		mov eax, white (black*16)
		call setTextColor
	loop LLoop1
	mov ecx,12
	LLoop2:
		mov eax, lightcyan (lightcyan*16)
		call setTextColor
		mov dl,25
		mov dh, 20
		add dl,cl
		call gotoxy
		mov al, ' '
		call WriteChar
		mov eax, white (black*16)
		call setTextColor
	loop LLoop2

	;--- V ---
	mov ecx,15
	VLoop1:
		mov eax, lightcyan (lightcyan*16)
		call setTextColor
		mov dl,33
		mov dh, 5
		add dh,cl
		add dl,cl
		call gotoxy
		mov al, ' '
		call WriteChar
		mov eax, white (black*16)
		call setTextColor
	loop VLoop1
	mov ecx,15
	VLoop2:
		mov eax, lightcyan (lightcyan*16)
		call setTextColor
		mov dl,63
		mov dh, 5
		sub dl,cl
		add dh,cl
		call gotoxy
		mov al, ' '
		call WriteChar
		mov eax, white (black*16)
		call setTextColor
	loop VLoop2

	;--- L ---
	mov ecx,15
	L1Loop1:
		mov eax, lightcyan (lightcyan*16)
		call setTextColor
		mov dl,65
		mov dh, 5
		add dh,cl
		call gotoxy
		mov al, ' '
		call WriteChar
		mov eax, white (black*16)
		call setTextColor
	loop L1Loop1
	mov ecx,12
	L1Loop2:
		mov eax, lightcyan (lightcyan*16)
		call setTextColor
		mov dl,65
		mov dh, 20
		add dl,cl
		call gotoxy
		mov al, ' '
		call WriteChar
		mov eax, white (black*16)
		call setTextColor
	loop L1Loop2

	
	;--- 2 ---
	mov dl,81
	mov dh, 9
	mov ecx,3
	oneLoop1:	
		mov eax, lightcyan (lightcyan*16)
		call setTextColor
		inc dl
		dec dh
		call gotoxy
		mov al, ' '
		call WriteChar
		mov eax, white (black*16)
		call setTextColor
	loop oneLoop1

	mov ecx,9
	oneLoop11:	
		mov eax, lightcyan (lightcyan*16)
		call setTextColor
		inc dl
		call gotoxy
		mov al, ' '
		call WriteChar
		mov eax, white (black*16)
		call setTextColor
	loop oneLoop11

		mov ecx,3
	oneLoop111:	
		mov eax, lightcyan (lightcyan*16)
		call setTextColor
		inc dl
		inc dh
		call gotoxy
		mov al, ' '
		call WriteChar
		mov eax, white (black*16)
		call setTextColor
	loop oneLoop111


	mov ecx,11
	oneLoop2:	
		mov eax, lightcyan (lightcyan*16)
		call setTextColor
		dec dl
		inc dh
		call gotoxy
		mov al, ' '
		call WriteChar
		mov eax, white (black*16)
		call setTextColor
	loop oneLoop2

	mov ecx,11
	oneLoop23:	
		mov eax, lightcyan (lightcyan*16)
		call setTextColor
		inc dl
		call gotoxy
		mov al, ' '
		call WriteChar
		mov eax, white (black*16)
		call setTextColor
	loop oneLoop23

	mov eax,3500
	call delay

	call clrscr
	popad
	ret
level2Screen endp


;======================================================= COLORING =============================================================

;========== reset color to default ==========
resetColor PROC
	push eax

	mov eax, white (black*16)
	call setTextColor

	pop eax
	ret
resetColor endp


;================= set color based on argument character ==================
;arguments:
;push DWORD (color char: G/B/Y/R/M)
setColor PROC

	push ebp
	mov ebp, esp

	mov al, [ebp+8]					;character that tells color


	;;;;;;;setting color;;;;;;

	;yellow
	cmp al, 'Y'
	jne notYellow
		mov eax, brown (black* 16)
		call setTextColor
		jmp colorHasBeenSet
	notYellow:

	;blue
	cmp al, 'B'
	jne notBlue
		mov eax, blue (black* 16)
		call setTextColor
		jmp colorHasBeenSet
	notBlue:

	;green
	cmp al, 'G'
	jne notGreen
		mov eax, lightgreen (black* 16)
		call setTextColor
		jmp colorHasBeenSet
	notGreen:

	;red
	cmp al, 'R'
	jne notRed
		mov eax, red (black* 16)
		call setTextColor
		jmp colorHasBeenSet
	notRed:

	;Magenta
	cmp al, 'M'
	jne notMagenta
		mov eax, lightmagenta (black* 16)
		call setTextColor
		jmp colorHasBeenSet
	notMagenta:

	colorHasBeenSet: 

	pop ebp

	ret 4
setColor endp

;================ set random Color ================
;sets random color
;returns the color's character in al
;e.g if color==green, al='G'
setRandomColor PROC
	
		
		mov eax, 5
		call randomRange

		;lightmagenta
		cmp al,0
		jne notLightMagenta
			mov eax, lightMagenta (black* 16)
			mov al, 'M'
			jmp doneChoosingColor
		notLightMagenta:

		;blue
		cmp al,1
		jne notBlue
			mov eax, blue (black* 16)
			mov al,'B'
			jmp doneChoosingColor
		notBlue:

		;yellow
		cmp al,2
		jne notYellow
			mov eax, brown (black* 16)
			mov al,'Y'
			jmp doneChoosingColor
		notYellow:

		;red
		cmp al, 3
		jne notRed
			mov eax, red (black* 16)
			mov al, 'R'
			jmp doneChoosingColor
		notRed:

		;lightGreen
		cmp al,4
		jne notLightGreen
			mov eax, lightGreen (black* 16)
			mov al, 'G'
			jmp doneChoosingColor
		notLightGreen:


		doneChoosingColor:
		call setTextColor
	ret
setRandomColor endp


;============== function that shifts byte array right from [startIndex] to [endIndex] (overwrites end index)(empties start index) ============;
; arguments:
; push offset BYTE array
; push dword starting index
; push dword ending index
shiftRight PROC

	push ebp
	mov ebp, esp
		
		mov edi, [ebp+16]		;mov edi, offset array
		add edi, [ebp+8]		;add edi, endIndex
		mov esi, edi
		dec esi					;esi = edi - 1

		mov edx, [ebp+16]
		add edx, [ebp+12]

		shift:
			cmp edi, edx		;esi == startingIndex ?
			je exitLoop
					
				mov al, [esi]
				mov [edi],al
				
			dec esi
			dec edi
		jmp shift
		exitLoop:

		mov byte ptr [edi],0	;empty starting index

	pop ebp
	ret 12
shiftRight endp
; arguments:
; push offset WORD array
; push dword starting index
; push dword ending index
shiftRightWord PROC

	push ebp
	mov ebp, esp
		
		mov eax, [ebp+8]
		shl eax,1
		mov edi, [ebp+16]		;mov edi, offset array
		add edi, eax		    ;add edi, endIndex

		mov esi, edi
		sub esi,2
					
		mov eax, [ebp+12]
		shl eax,1
		mov edx, [ebp+16]		;edx=offset array
		add edx, eax		    ;add edx, startIndex

		shift:
			cmp edi, edx		;esi == startingIndex ?
			jle exitLoop
					
				mov ax, [esi]
				mov [edi],ax
				
			sub esi,2
			sub edi,2
		jmp shift
		exitLoop:

		mov word ptr [edi],0	;empty starting index

	pop ebp
	ret 12
shiftRightWord endp
; arguments:
; push offset DWORD array
; push dword starting index
; push dword ending index
shiftRightDWord PROC

	push ebp
	mov ebp, esp
		
		mov edi, [ebp+16]		;mov edi, offset array
		mov eax, [ebp+8]
		shl eax,2
		add edi, eax		    ;add edi, endIndex

		mov esi, edi
		sub esi,4
					
		mov eax, [ebp+12]
		shl eax,2
		mov edx, [ebp+16]		;edx=offset array
		add edx, eax		    ;add edx, startIndex

		shift:
			cmp edi, edx		;esi == startingIndex ?
			jle exitLoop
					
				mov eax, [esi]
				mov [edi],eax
				
			sub esi,4
			sub edi,4
		jmp shift
		exitLoop:

		mov dword ptr [edi],0	;empty starting index

	pop ebp
	ret 12
shiftRightDWord endp



;============== function that shifts byte array left from [endIndex] to [startIndex] (overwrites start index)(empties end index) ============;
; arguments:
; push offset array					16
; push dword starting index			12
; push dword ending index			8
shiftLeft PROC

	push ebp
	mov ebp, esp
		
		mov edi, [ebp+16]		;mov edi, offset array
		add edi, [ebp+12]		;add edi, startIndex

		mov esi, edi
		inc esi					;esi = edi + 1

		mov edx, [ebp+16]
		add edx, [ebp+8]

		shift:
			cmp edi, edx		;edi == endingIndex ?
			je exitLoop
					
				mov al, [esi]
				mov [edi],al
				
			inc esi
			inc edi
		jmp shift
		exitLoop:

		mov byte ptr [edi],0	;empty ending index

	pop ebp
	ret 12
shiftLeft endp
end main