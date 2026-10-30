;Viết đoạn chương trình Assembly để tính cho hàm 𝐴(𝑛, 𝑘) = 𝑛(𝑛 − 1)(𝑛 − 2) … (𝑛 − 𝑘 + 1), với
;'1≤ 𝑘 < 𝑛 ≤ 9; 𝑛, 𝑘 được nhập vào từ bàn phím ?

; Nhap k = 3, n = 9
; Ouput 9*8*7 = 504 = 01F8h trong thanh ghi AX

.model small
.stack 100h
.data
strk DB "Nhap so k: $"
strn DB "NHAP SO n: $"
CRLF DB 13, 10, '$'

.code
mov ax,@data
mov ds, ax

; here your program starts

MOV AH, 9;
LEA DX, strk;
INT 21H; Lấy số K trước thay vì lấy N vì K chính là số lần lặp 

MOV AH, 1;
INT 21H;

SUB AL, 30h; // Chuyển ASCII sang số nguyên
MOV CL, AL; // LOOP sử dụng biến đếm là thanh ghi CX

MOV AH, 9;
LEA DX, CRLF; // Xuống dòng
INT 21H;

MOV AH, 9;
LEA DX, strn;
INT 21H;

MOV AH, 1;
INT 21H; Lay chu so N sau

XOR AH, AH;
SUB AL, 30h;

MOV BX, AX; BX = N
MOV AX, 1; 

LAP: 
	MUL BX;
	DEC BX; // Thực hiện nhân N*(N-1)*(N-2)*...*(N-K+1). Giá trị ouput lưu vào thanh ghi AX và do đó thanh ghi AX ban đầu = 1
	LOOP LAP; 

; here your program ends

end