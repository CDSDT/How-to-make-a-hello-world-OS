[BITS 16]	;Tells the assembler that its a 16 bit code
[ORG 0x7C00]	;Origin, tell the assembler that where the code will
	;be in memory after it is been loaded

jmp main        ;os main

MOV AL, 'h'
CALL Printchar

MOV AL, 'h'
CALL Printchar

JMP $ 		;Infinite loop


Printchar:	;Procedure to print character on screen
MOV AH, 0x0E	;Tell BIOS that we need to print one charater on screen.
MOV BH, 0x00	;
INT 0x10	;video interrupt
RET		;

TIMES 510 - ($ - $$) db 0	;Fill the rest of sector with 0
DW 0xAA55			;boot signature
