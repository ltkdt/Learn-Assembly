;Viết chương trình triển khai thuật toán Eculid 
;while (b != 0) {
;    int temp = b;
;    b = a % b;
;    a = temp;
;}

.model small
.stack 100h
.data

a db 08h;
b db 04h;

.code
mov al, a;
mov bl, b;

LAP:
	CMP BL, 00h;
	JE thoat;
	
	MOV AH, 00h;
	MOV DL, BL; temp 
	DIV BL; // Thuc hien phep chia a%b, so du luu vao ah

	MOV BL, AH; B = a % b
	MOV AL, DL; // al = temp
	JMP LAP;
	
THOAT:
nop;

end