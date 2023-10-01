; Highway Encounter Atari 8bit port

;zmienne pomocnicze
pom0	equ $50
pom0a	equ $51
pom0b	equ $52
pom0c	equ $53
pom0d	equ $54
pom0e	equ $55
bufx	equ $56
ramka	equ $57
demo_mode	equ $58
ile_obiektow	equ $59
draw	equ $5a
_strzalka	equ $5b
zapas		equ $5c		;zmienna używana przez irq sfx2
nuta		equ $5d		;zmienna do dzwiekow
ntsc		equ $5e
hide		equ $5f
cheat_on	equ $60
licznik_activ	equ $61
music1		equ $62
fx			equ $63
;dli		equ $5f

BCOLOR					= 1
SPECTRUM_ATTRIBUTE_RAM 	= 1
;SPECTRUM_BEEPER			= 2
SPECTRUM_KEYBOARD		= 1
SPECTRUM_MUSIC			= 1

spectrum_screen				equ $e000 ; length $1800
L4000					equ spectrum_screen
.if SPECTRUM_ATTRIBUTE_RAM == 1
spectrum_attributes			equ $F500	;$d800
;L5800					equ spectrum_attributes
.endif
;L7000					equ $d800 ; length $0400
;L7D00					equ $dc00
.if SPECTRUM_ATTRIBUTE_RAM == 1
L5E00					equ $dc00
.endif
;L8800					equ $f800 ; length $0020
;L8820					equ $f820 ; length $0180
;L7D00					equ $dd00 ; length $0201 ; high address must be %01 (like 7D)
;L8AA0					equ $fa00 ; length $0065
;L8CD0					equ $0080 ; variables on zeropage
;L6000					equ $c000 ; length $1000
;ShiftTable				equ $b200 ; length $0E00
L4800 					equ L4000+$800

;		org $0600
;		lda #$ff
;		sta $d301
;		rts
;		ini $0600

		icl 'title0.asm'


		org $d800,$4000

DLIST1		equ *
			:24 dta $00
			.rept 144,#
			 .if #==53 .or #==68 .or #==102 
				dta $cf,a(EKRAN1+#*$20)	
			 .else
				dta $4f,a(EKRAN1+#*$20)
			 .endif
			.endr
			:7 dta $4f,a(PANEL+34*$20)
			dta $cf,a(PANEL+34*$20)
			:34 dta $4f,a(PANEL+#*$20)
			dta $41,a(DLIST1)
				
DLIST		dta $70,$70,$70
			dta $4f,a(EKRAN0)
			:61 dta $f
			dta $8f		;dli1
			:33 dta $f	;:95 dta $f
			dta $4f,a(EKRAN0+$C00)
			:6 dta $f
			dta $8f		;dli2
			:36 dta $f	;:95 dta $f
			dta $8f	;dli3
			:40 dta $f
			dta $8f	;dli4
			:10 dta $f
			dta $41,a(DLIST)			
			

			
		org $dc00,$4400	
		
DLIST2	equ *
			:24 dta $00
			.rept 144,#
			 .if #==53 .or #==68 .or #==102 
				dta $cf,a(EKRAN2+#*$20)	
			 .else
				dta $4f,a(EKRAN2+#*$20)
			 .endif
			.endr
			:7 dta $4f,a(PANEL+34*$20)
			dta $cf,a(PANEL+34*$20)	
			:34 dta $4f,a(PANEL+#*$20)
			dta $41,a(DLIST2)	

		org $E300,$4700
		icl 'sprites.asm'
		
		org $5d00
		icl 'panel.asm'
			
	
		;org $7000
		
ram2rom	equ *
		sei
		mva #0 nmien
		mva #%11111110 portb
		
		ldx #0
@		equ *		
		.rept 4,#*$100		;dlist1,dlist
		lda $4000+:1,x
		sta DLIST1+:1,x
		.endr
		dex
		bne @-		

@		equ *		
		.rept 3,#*$100		;dlist2
		lda $4400+:1,x
		sta DLIST2+:1,x
		.endr
		dex
		bne @-		

		;ldx #0
@		equ *		
		.rept $16,#*$100			;sprites
		lda $4700+:1,x
		sta $e300+:1,x
		.endr
		dex
		jne @-
		
		ldx #0
@		equ *		
		.rept 4,#
		lda $5d00+$100*:1,x		;kopiuje panel
		sta PANEL+$100*:1,x
		.endr
		dex
		bne @-
		
		ldx #$3f
@		lda $5d00+$400,x
		sta PANEL+$400,x
		dex
		bpl @-
		
		ldx #0
@		equ *		
		.rept 16,#
		lda muzyka_l+$100*:1,x		;kopiuj muzyke na wlasciwe miejsce
		sta $c000+$100*:1,x
		.endr
		dex
		bne @-

		mva #%11111111 portb
		mva #%01000000 nmien
		cli
		
		rts
		
		;org $8000
muzyka_l	equ *		
		ins	'h.rmt'
		
		ini ram2rom

		
		; code
		org $4000 
		
tab_chc	.he 00,10,40,42,50,50,60,90,90,90,B0,C0,C0,10,E0,F0		
change_color	equ *
		pha
		and #$0f
		sta _chc1
		pla
		:4 lsr
		tay
		lda tab_chc,y
_chc1	equ *+1		
		ora #$ff
		rts
		
_main	
/*		mva #100 20		
@		jsr key_pressed
		beq @+
		lda 20
		bne @-
@		equ * */
		
		sei
		cld
		ldx #$7f
		txs
//z80_init		
		ldx #$00
		lda #$01
z80_init_loop		
		sta _bitmem0,x
		inx
		asl @
		bne z80_init_loop
		
//spectrum_init

		; init ANTIC + interrupts
		sei
		lda #0
		sta nmien	; disable interrupts
		sta irqen
		sta dmactl	; disable screen
		sta demo_mode
		sta cheat_on
		
		mva #cheat_length hide
		
		
		sta frame_counter
		lda #%11111110
		sta portb

		lda #<nmi
		sta $fffa
		lda #>nmi
		sta $fffb
		lda #<irq
		sta $fffe
		lda #>irq
		sta $ffff


		mva #$c0 nmien			; moved to title screen draw proc

		; init POKEY
		ldx #$08
		lda #$00
		sta skctl
clear	sta $d200,x
		dex
		bpl clear
		lda #$03
		sta skctl
		
		
		; init GTIA
		ldx #$0f
		lda #$00
cleargtia	sta $d000,x
		dex
		bpl cleargtia
		; colors
		;lda #$00
		sta colbak
		sta colpf1
		sta color2
		sta _strzalka
		sta ramka
		sta bufx

		mva >sprites pmbase			; enable PMGs
		mva #3 pmcntl
		mva #16+1 gtiactl
		;mva #0 _strzalka
				
		
		

		mva #57-16 dmactl
		;mva #0 ramka
		;sta bufx
		
		
		
//BuildShiftTable
		lda #$00 ; LD L,00
        sta z80_l
@@426   lda #$00 ; LD D,00
        sta z80_d
        lda z80_l ; LD E,L
        sta z80_e
        ;lda #$FF ; LD H,FF ; lookup table address
        lda #>[ShiftTable+$600-$100]
        sta z80_h
        lda #$03 ; LD B,03
        sta z80_b
@@427   asl z80_e ; SLA E
        rol z80_d ; RL D
        asl z80_e ; SLA E
        rol z80_d ; RL D
        lda z80_e ; LD (HL),E
        ldy #$00
        sta (z80_hl),y
        dec z80_h ; DEC H
        lda z80_d ; LD (HL),D
        ldy #$00
        sta (z80_hl),y
        dec z80_h ; DEC H
        dec z80_b ; DJNZ @@427
        jne @@427
        inc z80_l ; INC L
        jne @@426 ; JR NZ,@@426
		
		lda ntsc
		beq _pal

		ldx #85+2
@		lda table_top_color,x
		jsr change_color
		sta table_top_color,x
		dex
		bpl @-
		
		
		
		mva #$30 tab_chc+2
		ldx #0
@		lda dli_tablica,x
		inx
		cmp #$12
		bcc @+
		cmp #$ff
		beq @+1
		lda dli_tablica,x
		jsr change_color
		sta dli_tablica,x
@		inx
@		cpx #75
		bne @-2
		
		lda own_bottom1+2
		jsr change_color
		sta own_bottom1+2
		lda own_bottom1+4
		jsr change_color
		sta own_bottom1+4
		lda own_bottom5+2
		jsr change_color
		sta own_bottom5+2
		lda own_bottom5+4
		jsr change_color
		sta own_bottom5+4
		mva #$50 table_text0+4
		
		mva #7 vcount_plus
		mva #125 vcount_minus
		mva #131 vcount_max
		mva #97 vcount_delay

_pal	equ *		
@		lda #0
		ldy #$1F			;wyczyść linie pomiedzy ekranem i panelem
@		sta PANEL+34*$20,y
		dey
		bpl @-
		
		;lda #0
		ldx #127
@		sta DLITable,x			;czysc tabele
		dex
		bpl @-

		
		stx DLITable+65
		stx DLITable+66		
		stx DLITable+67		;VCOUNT=$43
		
		
		stx DLITable+48
		stx DLITable+49
		stx DLITable+50		;VCOUNT=$32
		
		
		stx DLITable+40
		stx DLITable+41		
		stx DLITable+42		;VCOUNT=$2a
		
		stx DLITable+89
		stx DLITable+90			;w których liniach nie przelaczac ekranów
		stx DLITable+91		;vcount=$5B
		
		
		stx DLITable+106	;czekaj na koniec ekranu
		stx DLITable+107
		stx DLITable+108
		
		
		jmp Main
		
		org $4200
		
		icl 'spectrum_atari.asm'

		icl 'z80.asm'
		
.if BCOLOR == 1		
		icl 'bcolor.asm'
.endif		

		icl 'highwayencounter_6502.asm'

		icl 'rmtplayr.asm'

;-----------------------------
		run _main		
;-----------------------------