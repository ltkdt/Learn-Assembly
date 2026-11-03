; Cuối kì 2025.2
; Dịch chương trình sau sang asm;
; int sum = 0;
; for (int i = 0; i < 10; i++) {
;     if (a[i] % 2 == 0) {
;         sum += a[i];
;     }
; } 


.model small
.stack 100h
.data
mang1 DB 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

; Output : CX = 1Eh
.code
XOR BX, BX;
XOR AX, AX; 
XOR CX, CX;

LEA SI, mang1;
MOV CL, 10;
MOV BL, 02h;

LAP:
	MOV AL, [SI]; // AL = a[i]
	DIV BL; // AH = a[i] % 2, AL = kqua phep chia
	CMP AH, 0; 
	JNE TIEP;
	ADD DL, [SI];
	JMP TIEP;


TIEP:
	INC SI;
	LOOP LAP;

end