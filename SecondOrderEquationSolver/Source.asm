Title Second Order Equation Solver
INCLUDE Irvine32.inc

.data
; x^2 + 3x - 4 = 0
; a = 1, b = 3, c = -4
; x = (-b + sqrt(b^2 - 4ac)) / 2a
; x = (-b - sqrt(b^2 - 4ac)) / 2a
; x = (-3 + sqrt(9 + 16)) / 2
; x = (-3 - sqrt(9 + 16)) / 2
; x = (-3 + 5) / 2
; x = (-3 - 5) / 2
; x = 2 / 2
; x = -8 / 2
; x = 1
; x = -4
a REAL4 1.0
b REAL4 4.0
cc REAL4 -4.0
x1 REAL4 ?
x2 REAL4 ?
four REAL4 4.0
zero REAL4 0.0
discriminant REAL4 ?
message1 BYTE "The discriminant is positive",0
message2 BYTE "The discriminant is zero",0
message3 BYTE "The discriminant is negative",0
message4 BYTE "The roots are ",0
message5 BYTE " and ",0
.code
main PROC

; Calculate the discriminant
fld b
fmul b
fld a
fmul cc
fmul four
fsub st(0),st(1)
fchs
fsqrt
fst discriminant

fcom zero

fnstsw ax
sahf
jb negative
je identity
positive:
mov edx,OFFSET message1
call WriteString
mov edx,OFFSET message4
call WriteString

; Calculate the roots
fld b
fchs
fadd discriminant
fld a
fadd a
fdiv
fst x1
call WriteFloat

mov edx,OFFSET message5
call WriteString

fld b
fchs
fsub discriminant
fld a
fadd a
fdiv
fst x2
call WriteFloat

jmp theend
identity:
mov edx,OFFSET message2
call WriteString

; Calculate the root
fld b
fchs
fld a
fadd a
fdiv
fst x1
mov edx,OFFSET message4
call WriteString
call WriteFloat


jmp theend
negative:
; Impossible the negative sign on the discriminant
mov edx,OFFSET message3
call WriteString

theend:
exit
main ENDP
END main
 


