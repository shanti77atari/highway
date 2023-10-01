		icl	'atari.hea'

CHBAS	equ $02F4		
pom0	equ 203
pom1	equ 205		
		
sprites1 equ $2000		
ekran	equ sprites1+$c00
znaki 	equ sprites1+$800
		
		org $4000
		ins 'title2.dat'
		
		org $2000
dlist	equ *
		dta $70,$70,$70
		dta $4e,a(sprites1+$C00)
		:31 dta $0e
		dta $4e,a(sprites1+$1000)
		:35 dta $0e
		:4 dta $04
		:88 dta $0e
		dta $41,a(dlist)
		
init1	lda #0
		tax
@		equ *		
		.rept 5,#
		sta sprites1+$300+$100*:1,x
		.endr
		dex
		bne @-
		rts
		
		ini init1
		
YTAB	:8 dta #*$20
tabNeg	dta 8,9,10,11,12,13
		dta 40,41,42,43,44,45
		dta 72,73,74,75,76,77
		dta 104,105,106,107,108	;,109
		
		org sprites1+$300+$18
missiles
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 03 03 03 03 03 03
	.he 03 03 03 03 03 03 03 03 03 03 03 03 03 03 03 03
	.he 03 03 03 03 03 03 03 03 03 03 03 03 03 03 03 03
	.he 03 03 03 03 03 03 03 03 03 03 03 03 03 03 03 03
	.he 03 03 03 03 03 03 03 00 00 00 00 00 00 00 00 00
	.he 00 00 0C 0C 0C 0C 0C 08 0C 0C 0C 0C 0C 0C 0C 0C
	.he 0C 0C 0C 0C 0C 0C 0C 0C 08 0C 08 08 0C 08 0C 0C
	.he 0C 0C 0C 0C 0C 04 0C 04 00 00 00 C0 C0 C0 C0 C0
	.he C0 C0 C0 80 C0 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
player0
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
	.he FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF 7F
	.he 7F 7F 7F 7F 7F FF FF FF FF FF FF FF FF FF FF FF
	.he FF FF FF FF FF FF FF FF FF FE FF FF FF FF FF FF
	.he FF FF FF FF FF FE FE FE FF FF FF FF FF FF 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
player1
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 FF FF BF BF FF FF FF
	.he FF FF 3F FF FF FF FF FF FF FF FF FF FF FE FE FE
	.he FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
	.he FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
	.he FF FF FF FF FF FF FF FF FF FF FF FF FF FF DF DF
	.he 9F 3F FF DF 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
player2
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he FD FF FF FF FF FF FF FF 7F 3F BF DF CF EF FF FF
	.he FF FF FF FF FF FF FF FF FF F7 9F 7F FF FF FF FE
	.he FE FE FE FE F3 F3 F3 F3 F3 F3 F3 F3 F3 F3 F7 FF
	.he FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
	.he F7 EF EF FF FF FF FF DF DF BF BF BF BF 7F 7F 7F
	.he 7F FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
	.he FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
	.he FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
	.he FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
	.he FF FF FF FF 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
player3
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 FF FD FD FD F5 FF E3 EC FD FF EE
	.he FF EF FF FE DE DF FF FF FF FF DF FF DF FF DF FF
	.he 7F FF 7F 7F 5F FF FF FF FF FF FF FE FE FF FF FF
	.he FF FF FC F3 F7 FB FB FF FF FF FF FF FF FF FF FF
	.he FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
	.he FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
	.he FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
	.he FF FF FF FF FF FF FF FF FF FF FF FF FE FE FE FE
	.he FE FE FF FF FF FF FF FF FE FE FE FE FE FE FE FF
	.he FF FF FF FF 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00	
		
		
		org $6000
start		
/*		lda #0
		tax
@		equ *		
		.rept 5,#
		sta sprites1+$300+$100*:1,x			;czysc duszki
		.endr
		dex
		bne @-  */



		ldx #0
@		equ *		
		.rept 8,#
		lda $4000+$100*:1,x
		sta ekran+$100*:1,x			;kopiuje linie do trybu znakowego
		.endr
		dex
		jne @-
		
		ldx #127
@		lda $4800,x
		sta ekran+$800,x
		dex
		bpl @-
		
		
		
		
		ldx #0
@		equ *		
		.rept 11,#
		lda $4C80+$100*:1,x
		sta ekran+$900+$100*:1,x		;kopiuje linie za trybem znakowym
		.endr
		dex
		jne @-
		
		mwa #sprites1+$800 znaki
		mwa #$4880 pom0
		jsr przepisz_znak

		mwa #$4980 pom0
		jsr przepisz_znak
	
		mwa #$4A80 pom0
		jsr przepisz_znak
	
		mwa #$4B80 pom0
		jsr przepisz_znak
		
		ldx #127
@		txa
		sta ekran+$880,x
		dex
		bpl @-
		
		ldy #31-1
@		ldx tabNeg,y
		lda ekran+$880,x
		eor #128
		sta ekran+$880,x
		dey
		bpl @-
		
		

		
		
		lda 20
@		cmp 20
		beq @-
		
		mwa #dlist	560
		mwa #dlist dlptr
		mva #41+16 559
		
		mva #$34 712	;tlo
		mva #$00 708
		mva #$EE 709
		mva #$0C 710
		mva #$A6 711
		
		mva #$70 hposp0
		mva #$8A hposp1
		mva #$52 hposp2
		mva #$72 hposp3
		mva #$90 hposm0
		mva #$aa hposm1 
		mva #$8e hposm3
		
		mva #3 sizep0
		sta sizep1
		sta sizep2
		sta sizep3
		mva #$ff sizem
		
		mva #$1c 704		;kolory duszków
		mva #$88 705
		mva #$08 706
		mva #$06 707
		
		mva #>znaki chbas
		
		mva #>sprites1 pmbase			; enable PMGs
		mva #3 pmcntl
		mva #4 623
		
		jmp *
		
		
przepisz_znak	equ *	
		mva #32 pom1
@		ldx #7
@		ldy YTab,x
		lda (pom0),y
_znaki	equ *+1		
		sta znaki,x
		dex
		bpl @-
		inc pom0
		bne *+4
		inc pom0+1
		clc
		lda _znaki
		adc #8
		sta _znaki
		bcc *+5
		inc _znaki+1
		dec pom1
		bne @-1
		rts		
		
		run start