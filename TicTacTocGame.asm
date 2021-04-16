INCLUDE Irvine32.inc

; use to print c in x and y position
printChar MACRO xPos, yPos, c

mov dl, xPos 
mov dh, yPos
call Gotoxy
mov al, c
call WriteChar

ENDM

; use to print line in x and y position
printLine MACRO xPos, yPos, line

mov dl, xPos
mov dh, yPos
call Gotoxy
mov edx, OFFSET line
call WriteString 

ENDM


.data
line BYTE "---------------------------------", 0

char1 BYTE "1"
char2 BYTE "2"
char3 BYTE "3"
char4 BYTE "4"
char5 BYTE "5"
char6 BYTE "6"
char7 BYTE "7"
char8 BYTE "8"
char9 BYTE "9"

inputNum BYTE ?
inputNum2 BYTE ?

line1 BYTE "  Player, enter your position : ", 0

cChar BYTE "X"

winner BYTE "n"

gameEnd BYTE " Game end ", 0

xwinner BYTE " Player X has win ", 0
ywinner BYTE " Player Y has win ", 0

endGameLine BYTE " Press any key to get out of the game ", 0
endGameChar BYTE ?

developer BYTE " TicTacToc game by Yousuf Almandhari ", 0

.code
main PROC

printLine 2, 0, developer 

LL1 :

; check if their is winner
call check_winner

call who_winner

; check if the game ends
call check_game_end

; draw the shape
call draw_shap

; write the letter of the player
printChar 2, 21, cChar

; line asks the user for input
printLine 3, 21, line1

; take the input
call ReadChar
mov inputNum, al


call comparation
jmp LL1


loop LL1

INVOKE ExitProcess, 0
main ENDP

comparation PROC

; 1
.IF(inputNum == "1")
call case1
.ENDIF


; 2
.IF(inputNum == "2")
call case2
.ENDIF

; 3
.IF(inputNum == "3")
call case3
.ENDIF

; 4
.IF(inputNum == "4")
call case4
.ENDIF

; 5
.IF(inputNum == "5")
call case5
.ENDIF

; 6
.IF(inputNum == "6")
call case6
.ENDIF

; 7
.IF(inputNum == "7")
call case7
.ENDIF

; 8
.IF(inputNum == "8")
call case8
.ENDIF

; 9
.IF(inputNum == "9")
call case9
.ENDIF

ret
comparation ENDP

case1 PROC
; check if the position is available
.IF(char1 == "1")

; change the number to the player char
mov al, cChar
mov char1, al

; flip the letter of cChar
.IF(char1 == "X")
mov al, "Y"
mov cChar, al
.ENDIF

.IF(char1 == "Y")
mov al, "X"
mov cChar, al
.ENDIF

.ENDIF
ret
case1 ENDP

case2 PROC
; check if the position is available
.IF(char2 == "2")

; change the number to the player char
mov al, cChar
mov char2, al

; flip the letter of cChar
.IF(char2 == "X")
mov al, "Y"
mov cChar, al
.ENDIF

.IF(char2 == "Y")
mov al, "X"
mov cChar, al
.ENDIF

.ENDIF
ret
case2 ENDP

case3 PROC
; check if the position is available
.IF(char3 == "3")

; change the number to the player char
mov al, cChar
mov char3, al

; flip the letter of cChar
.IF(char3 == "X")
mov al, "Y"
mov cChar, al
.ENDIF

.IF(char3 == "Y")
mov al, "X"
mov cChar, al
.ENDIF

.ENDIF
ret
case3 ENDP


case4 PROC
; check if the position is available
.IF(char4 == "4")

; change the number to the player char
mov al, cChar
mov char4, al

; flip the letter of cChar
.IF(char4 == "X")
mov al, "Y"
mov cChar, al
.ENDIF

.IF(char4 == "Y")
mov al, "X"
mov cChar, al
.ENDIF

.ENDIF
ret
case4 ENDP


case5 PROC
; check if the position is available
.IF(char5 == "5")

; change the number to the player char
mov al, cChar
mov char5, al

; flip the letter of cChar
.IF(char5 == "X")
mov al, "Y"
mov cChar, al
.ENDIF

.IF(char5 == "Y")
mov al, "X"
mov cChar, al
.ENDIF

.ENDIF
ret
case5 ENDP


case6 PROC
; check if the position is available
.IF(char6 == "6")

; change the number to the player char
mov al, cChar
mov char6, al

; flip the letter of cChar
.IF(char6 == "X")
mov al, "Y"
mov cChar, al
.ENDIF

.IF(char6 == "Y")
mov al, "X"
mov cChar, al
.ENDIF

.ENDIF
ret
case6 ENDP

case7 PROC
; check if the position is available
.IF(char7 == "7")

; change the number to the player char
mov al, cChar
mov char7, al

; flip the letter of cChar
.IF(char7 == "X")
mov al, "Y"
mov cChar, al
.ENDIF

.IF(char7 == "Y")
mov al, "X"
mov cChar, al
.ENDIF

.ENDIF
ret
case7 ENDP

case8 PROC
; check if the position is available
.IF(char8 == "8")

; change the number to the player char
mov al, cChar
mov char8, al

; flip the letter of cChar
.IF(char8 == "X")
mov al, "Y"
mov cChar, al
.ENDIF

.IF(char8 == "Y")
mov al, "X"
mov cChar, al
.ENDIF

.ENDIF
ret
case8 ENDP

case9 PROC
; check if the position is available
.IF(char9 == "9")

; change the number to the player char
mov al, cChar
mov char9, al

; flip the letter of cChar
.IF(char9 == "X")
mov al, "Y"
mov cChar, al
.ENDIF

.IF(char9 == "Y")
mov al, "X"
mov cChar, al
.ENDIF

.ENDIF
ret
case9 ENDP

who_winner PROC

.IF(winner == "w")
printLine 7, 25, xwinner
call end_of_game

.ENDIF

.IF(winner == "p")
printLine 7, 25, ywinner
call end_of_game

.ENDIF

ret
who_winner ENDP

check_game_end PROC

.IF(char1 != "1") && (char2 != "2") && (char3 != "3")
.IF(char4 != "4") && (char5 != "5") && (char6 != "6")
.IF(char7 != "7") && (char8 != "8") && (char9 != "9")

printLine 2, 25, gameEnd
call end_of_game 

.ENDIF
.ENDIF
.ENDIF

ret
check_game_end ENDP

end_of_game PROC

; draw the shape
call draw_shap

printLine 2, 27, endGameLine

call ReadChar
mov endGameChar, al 
exit 

ret
end_of_game ENDP

check_winner PROC

.IF(char1 == "X") && (char2 == "X") && (char3 == "X")
mov al, "w"
mov winner, al
.ENDIF

.IF(char4 == "X") && (char5 == "X") && (char6 == "X")
mov al, "w"
mov winner, al
.ENDIF

.IF(char7 == "X") && (char8 == "X") && (char9 == "X")
mov al, "w"
mov winner, al
.ENDIF

.IF(char1 == "X") && (char4 == "X") && (char7 == "X")
mov al, "w"
mov winner, al
.ENDIF

.IF(char2 == "X") && (char5 == "X") && (char8 == "X")
mov al, "w"
mov winner, al
.ENDIF

.IF(char3 == "X") && (char6 == "X") && (char9 == "X")
mov al, "w"
mov winner, al
.ENDIF

.IF(char1 == "X") && (char5 == "X") && (char9 == "X")
mov al, "w"
mov winner, al
.ENDIF

.IF(char3 == "X") && (char5 == "X") && (char7 == "X")
mov al, "w"
mov winner, al
.ENDIF


.IF(char1 == "Y") && (char2 == "Y") && (char3 == "Y")
mov al, "p"
mov winner, al
.ENDIF

.IF(char4 == "Y") && (char5 == "Y") && (char6 == "Y")
mov al, "p"
mov winner, al
.ENDIF

.IF(char7 == "Y") && (char8 == "Y") && (char9 == "Y")
mov al, "p"
mov winner, al
.ENDIF

.IF(char1 == "Y") && (char4 == "Y") && (char7 == "Y")
mov al, "p"
mov winner, al
.ENDIF

.IF(char2 == "Y") && (char5 == "Y") && (char8 == "Y")
mov al, "p"
mov winner, al
.ENDIF

.IF(char3 == "Y") && (char6 == "Y") && (char9 == "Y")
mov al, "p"
mov winner, al
.ENDIF

.IF(char1 == "Y") && (char5 == "Y") && (char9 == "Y") 
mov al, "p"
mov winner, al
.ENDIF

.IF(char3 == "Y") && (char5 == "Y") && (char7 == "Y")
mov al, "p"
mov winner, al
.ENDIF

ret
check_winner ENDP

; draw the shap 
draw_shap PROC

printLine 0, 7, line
printLine 0, 14, line


printChar 10, 3, "-"
printChar 10, 4, "-"
printChar 10, 5, "-"
printChar 10, 6, "-"
printChar 10, 7, "-"
printChar 10, 8, "-"
printChar 10, 9, "-"
printChar 10, 10, "-"
printChar 10, 11, "-"
printChar 10, 12, "-"
printChar 10, 13, "-"
printChar 10, 14, "-"
printChar 10, 15, "-"
printChar 10, 16, "-"
printChar 10, 17, "-"
printChar 10, 18, "-"

printChar 20, 3, "-"
printChar 20, 4, "-"
printChar 20, 5, "-"
printChar 20, 6, "-"
printChar 20, 7, "-"
printChar 20, 8, "-"
printChar 20, 9, "-"
printChar 20, 10, "-"
printChar 20, 11, "-"
printChar 20, 12, "-"
printChar 20, 13, "-"
printChar 20, 14, "-"
printChar 20, 15, "-"
printChar 20, 16, "-"
printChar 20, 17, "-"
printChar 20, 18, "-"

printChar 5, 5, char1
printChar 5, 10, char4
printChar 5, 16, char7

printChar 15, 5, char2
printChar 15, 10, char5
printChar 15, 16, char8

printChar 25, 5, char3
printChar 25, 10, char6
printChar 25, 16, char9

ret
draw_shap ENDP

END main
