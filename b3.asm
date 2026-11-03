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
MOV BL, 02h;	


LEA SI, mang1;
MOV DX, 0;

LAP:
	CMP DX, 10;
	JE THOAT; // Den 10 thi thoat vong lap
	XOR AX, AX;
	MOV AL, [SI]; // AL chứa phần tử trong mảng, AL = a[i]
	DIV BL; // Tính a[i] % 2, AH chứa phần dư
	CMP AH, 0; // Nếu a[i] % 2 == 0 thì thực hiện cộng, không thì quay về đầu vòng lặp
	JNE SO_LE;
	ADD CL, [SI]; // Biến CL là tổng, tránh nhầm sang CX, vì nếu CX thì đó sẽ là cộng 2 phần từ liên tiếp

TIEP:
	INC SI;
	INC DX;
	JMP LAP;

SO_LE:
	JMP TIEP;


THOAT:
nop;

end