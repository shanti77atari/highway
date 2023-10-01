; Host-dependent Spectrum functions

		icl 'atari.hea'

frame_counter	equ $14

VERSION_FOR_COMPARATOR = 0
SHOW_BUFOR = 0
NAPIS = 0

LD900   equ $1A00
LE900   equ LD900+$1000 

EKRAN1	equ $700	;$400+$300	;$DB00
EKRAN0	equ EKRAN1-$300
EKRAN2	equ LE900+$300	;$1700

PANEL		equ $DE80	;$F500

BUF1		equ $FF80	;$F480
DLITable	equ $FF00	;$F500	;128 bajtów
SPRITES		equ 0	;$F400
ShiftTable 	equ $f900	;do $f500 			$f800


L8D52		equ $F8A0		;$60 bajtów do F900


in_a_fe	lda skstat
		and #4
		bne nokey

		ldy hide
		lda kbcode
		cmp cheat_code+1,y
		beq @+1
		cmp cheat_code,y
		bne @+		;wyzeruj licznik
		dec hide
		bpl @+1		;jeszcze nie koniec
		lda #2		;wlacz cheat
		sta cheat_on
		sta colbak
@		mva #cheat_length hide		;zly znak wiec wyzeruj 
		
@		cpx kbcode
		beq *+4
nokey	lda #1
		rts
		
key_pressed lda skstat
			and #4
			beq kp1
			lda skstat
			and #8
			beq kp1
			lda trig0
kp1			rts
			
nmires 	equ $D40F		


		
		
nmi	bit nmist
		bpl @+
		sta nmires
dliv	equ *+1
		jmp dli0
nmi0	equ *		
@		inc frame_counter
		pha
		txa
		pha
		tya
		pha
		mva #0 dli_licznik
		
background_color	equ *+1		
		mva #0 colpf2
ink_color	equ *+1		
		mva #$0e colpf1
		
		ldx #3
@		lda tablecol0_pm,x
		sta colpm0,x
		lda tablepos0_pm,x
		sta hposp0,x
		lda tablepos0_pm+4,x
		sta hposm0,x
sprites_size equ *+1
		lda #1
		sta sizep0,x
		dex
		bpl @-
		lda tablecol0_pm+4
		sta colpf3
		lda tablecol0_pm+5
		sta gtiactl
		
		mva #%01010111 sizem

dliv1	equ *+1
dliv2	equ *+6		
@		mwa #dli1 dliv

czy_mryga	equ *+1		
		lda #$00				;czy mryga napis
		beq @+
		dec licznik_activ			
		bne @+
		mva #16 licznik_activ
		lda p1panel_pos
		eor #96
		sta p1panel_pos

music	equ *+1		
@		lda #0
		bmi @+
		lda ntsc
		beq mus1	;dla pal pomin
		
		inc licznik_ntsc
licznik_ntsc	equ *+1		
		lda #$00
		cmp #6
		bcc mus1
		lda #0
		sta licznik_ntsc
		beq @+	;pomin co 6 wywolanie
mus1	equ *		
		jsr rmt_play
		
@		equ *
		sta nmires
		pla
		tay
		pla
		tax
		pla

irq
		rti
		
dli1	pha					;pozycje i kolory bottom
		
		lda tablecol0_pm+6+2
		sta colpm0+2
		lda tablecol0_pm+6+3
		sta colpm0+3
		lda tablepos0_pm+8+2
		sta hposp0+2
		lda tablepos0_pm+8+3
		sta hposp0+3
		
		lda table_text0+4			;kolor pociskow, wszystkie w 1 kolorze
		sta colpf3
		lda #17
		sta gtiactl
		
		.rept 4, #
			lda table_text0+:1		;pozycja pociskow
			sta hposm0+:1
		.endr

		mwa #dli1a dliv

		pla
		rti
		
dli1a	pha
		
		lda tablecol0_pm+6+1
		sta colpm0+1
		lda tablepos0_pm+8+1
		sta hposp0+1
		
		mwa #dli2 dliv

		pla
		rti
		
		
dli2	pha
		
		lda tablecol0_pm+6
		sta colpm0
		
		lda tablepos0_pm+8
		sta hposp0
		

		lda tablecol0_pm+6+4
		sta colpf3
		lda tablecol0_pm+6+5
		sta gtiactl
		
		lda tablecol0_pm+12			;dodatkowa zmiana koloru 3 i 4 duszka
		sta colpm0+2
		lda tablecol0_pm+13
		sta colpm0+3
		lda tablepos0_pm+16
		sta hposp0+2
		
		mva #%11010101 sizem
		
		

		.rept 4, #
			lda tablepos0_pm+8+4+:1
			sta hposm0+:1
		.endr

		mwa #dli0 dliv

		pla
		rti
		
		
		
dli0	pha
		
		sta wsync
		mva #0 colpf1
		mva #$0f colpf2

		mva #160 hposp0		;score,hscore
		mva #3 sizep0
		mva #1 sizep2		;czas
p1panel_size	equ *+1		
		mva #0 sizep1
		mva #0 sizep3

		mva kolor4 colpm0		;zolty, sc,hs
p1panel_col	equ *+1		
		mva #$4a colpm1		;kolor zone

		

		mva kolor5 colpm3

		mva #16+1 gtiactl
p1panel_pos	equ *+1		
		mva #68 hposp1		;zone
		mva #76 hposp3
		
		mva kolor6 colpm2		;kolor zielony ,czas
		mva #140 hposp2
		
		;mva c_strzalka colpm3
		mva #$40 sizem
		mva kolor7 colpf3		;czerwony
		mva _strzalka hposm2
		eor #%110
		sta hposm1
		eor #%10
		sta hposm0
		
		mva #140 hposm3	;1 segment czasu i wsk strzalów
		pla
		rti	
;dliv		equ *-2

tablecol0_pm	dta 0,0,0,0,0,16+1			;kolory duszków
				dta 0,0,0,0,0,16+1
				dta 0,0					;kolory 3 i 4 duszka
tablepos0_pm	dta 0,0,0,0,0,0,0,0		;pozycje duszków i pocisków
				dta 0,0,0,0,0,0,0,0
				dta 0					;pozycja 3 duszka
				
table_text0		dta 0,0,0,0,$40				

cheat_length	equ 8



		