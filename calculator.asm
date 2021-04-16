INCLUDE Irvine32.inc

.data

; sentense will shows in the beging of the loop
first_sen BYTE "+ (a), - (s), * (m), / (d) and x for exit :   ", 0
inputChar BYTE ?

var1 DWORD ?
var2 DWORD ?

for_var1 BYTE "Enter var1: ", 0
for_var2 BYTE "Enter var2: ", 0
exit_var DWORD ?


.code
main PROC

; start loop
L1 :

; show first_sen
mov edx, OFFSET first_sen
call WriteString


; take char input from the user
call ReadChar
mov inputChar, al


; +
cmp inputChar, "a"
je add_d


; -
cmp inputChar, "s"
je min_m


; *
cmp inputChar, "m"
je mul_m


; /
cmp inputChar, "d"
je div_d

; x to exite the calculator
cmp inputChar, "x"
je exitGame

; x
exitGame :
exit

; a
add_d :
call take_nums
call add_dd
jmp L1

; s
min_m :
call take_nums
call min_dd
jmp L1

; m
mul_m :
call take_nums
call mul_dd
jmp L1

; d
div_d :
call take_nums
call div_dd
jmp L1

; end loop
loop L1

main ENDP

; to take the tow variables from the user
take_nums PROC
call Crlf 

; show for_var1
mov edx, OFFSET for_var1
call WriteString

call ReadDec
mov var1, eax

call Crlf
; show for_var2
mov edx, OFFSET for_var2
call WriteString

call ReadDec
mov var2, eax

ret
take_nums ENDP

; to add tow numbers
add_dd PROC

mov eax, var1
add eax, var2
call writeint
call crlf

ret
add_dd ENDP

; to minus tow numbers
min_dd PROC

mov eax, var1
sub eax, var2
call writeint
call crlf

ret
min_dd ENDP

; multible tow numbers
mul_dd PROC

mov eax, var1
imul eax, var2
call writeint
call crlf

ret
mul_dd ENDP


; divide tow numbers
div_dd PROC

mov edx, 0
mov eax, var1
mov ebx, var2
div ebx
call writeint
call crlf

ret
div_dd ENDP

; end
END main
