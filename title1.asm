		icl 'atari.hea'
		org $2000

init		
		lda #0
		tax
@		sta sprites1+$300,x
		sta sprites1+$400,x
		sta sprites1+$500,x
		sta sprites1+$600,x
		sta sprites1+$700,x
		dex
		bne @-
		rts
		
		ini init
		
		org $2000
		ins 'title1.dat'
		
		org sprites1+$38A
		.he 0C 0C 0C 0C 0C 08 0C 0C 0C 0C 0C 0C 0C 0C 0C 0C
		.he 0C 0C 0C 0C 0C 0C 08 0C 08 08 0C 08 0C 0C 0C 0C 
		.he 0C 0C 0C 04 0C 04 00 00 00 C0 C0 C0 C0 C0 C0  
		
		org sprites1+$44B+$18
		.he 9F DF 9F 3F DF
		.he 3F DF 7F BF BF FF BF FF FF FF 7F FF FF FF 7F 7F
		.he 7F FF 3F 3F FF FF FF FF FF FF FF BF 
		
		org sprites1+$559+$18
		.he FF FF BF BF FF FF FF
		.he FF FF 3F FF FF FF FF FF FF FF FF FF FF FE FE FE
		.he FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
		.he FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
		.he FF FF FF FF FF FF FF FF FF FF FF FF FF FF DF DF
		.he 9F 3F FF DF FF
		
		org sprites1+$630+$18
		.he FD FF FF FF FF FF FF FF 7F 3F BF DF CF EF FF FF
		.he FF FF FF FF FF FF FF FF FF F7 9F 7F FF FF FF FF
		.he FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
		.he FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
		.he F7 EF EF FF FF FF FF DF DF BF BF BF BF 7F 7F 7F
		.he 7F FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
		.he FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
		.he FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
		.he FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
		.he FF FF FF FF 
		
		org sprites1+$735+$18
		.he FF FD FD FD F5 FF E3 EC FD FF EE
		.he FF EF FF FE DE DF FF FF FF FF DF FF DF FF DF FF
		.he FF FF FF FF DF FF FF FF FF FF FF FE FE FF FF FF
		.he FF FF FC F3 F7 FB FB FF FF FF FF FF FF FF FF FF
		.he FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
		.he FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
		.he FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
		.he FF FF FF FF FF FF FF FF FF FF FF FF FE FE FE FE
		.he FE FE FF FF FF FF FF FF FE FE FE FE FE FE FE FF
		.he FF FF FF FF  
		
		
spectrum_screen	equ $4000
pom1	equ 203
pom2	equ 205
sprites1 equ $6000

		org $6000
dlist		dta $70,$70,$70
		dta $4e, a(spectrum_screen+$0000)
		dta $4e, a(spectrum_screen+$0100)
		dta $4e, a(spectrum_screen+$0200)
		dta $4e, a(spectrum_screen+$0300)
		dta $4e, a(spectrum_screen+$0400)
		dta $4e, a(spectrum_screen+$0500)
		dta $4e, a(spectrum_screen+$0600)
		dta $4e, a(spectrum_screen+$0700)

		dta $4e, a(spectrum_screen+$0000+$20)
		dta $4e, a(spectrum_screen+$0100+$20)
		dta $4e, a(spectrum_screen+$0200+$20)
		dta $4e, a(spectrum_screen+$0300+$20)
		dta $4e, a(spectrum_screen+$0400+$20)
		dta $4e, a(spectrum_screen+$0500+$20)
		dta $4e, a(spectrum_screen+$0600+$20)
_40		dta $4e, a(spectrum_screen+$0700+$20)

		dta $4e, a(spectrum_screen+$0000+$40)
		dta $4e, a(spectrum_screen+$0100+$40)
		dta $4e, a(spectrum_screen+$0200+$40)
		dta $4e, a(spectrum_screen+$0300+$40)
		dta $4e, a(spectrum_screen+$0400+$40)
		dta $4e, a(spectrum_screen+$0500+$40)
		dta $4e, a(spectrum_screen+$0600+$40)
_48		dta $4e, a(spectrum_screen+$0700+$40)
		
		dta $4e, a(spectrum_screen+$0000+$60)
		dta $4e, a(spectrum_screen+$0100+$60)
		dta $4e, a(spectrum_screen+$0200+$60)
		dta $4e, a(spectrum_screen+$0300+$60)
		dta $4e, a(spectrum_screen+$0400+$60)
		dta $4e, a(spectrum_screen+$0500+$60)
		dta $4e, a(spectrum_screen+$0600+$60)
_56		dta $4e, a(spectrum_screen+$0700+$60)
		
		dta $4e, a(spectrum_screen+$0000+$80)
		dta $4e, a(spectrum_screen+$0100+$80)
		dta $4e, a(spectrum_screen+$0200+$80)
		dta $4e, a(spectrum_screen+$0300+$80)
		dta $4e, a(spectrum_screen+$0400+$80)
		dta $4e, a(spectrum_screen+$0500+$80)
		dta $4e, a(spectrum_screen+$0600+$80)
_64		dta $4e, a(spectrum_screen+$0700+$80)
		
		dta $4e, a(spectrum_screen+$0000+$a0)
		dta $4e, a(spectrum_screen+$0100+$a0)
		dta $4e, a(spectrum_screen+$0200+$a0)
		dta $4e, a(spectrum_screen+$0300+$a0)
		dta $4e, a(spectrum_screen+$0400+$a0)
		dta $4e, a(spectrum_screen+$0500+$a0)
		dta $4e, a(spectrum_screen+$0600+$a0)
		dta $4e, a(spectrum_screen+$0700+$a0)
		
		dta $4e, a(spectrum_screen+$0000+$c0)
		dta $4e, a(spectrum_screen+$0100+$c0)
		dta $4e, a(spectrum_screen+$0200+$c0)
		dta $4e, a(spectrum_screen+$0300+$c0)
		dta $4e, a(spectrum_screen+$0400+$c0)
		dta $4e, a(spectrum_screen+$0500+$c0)
		dta $4e, a(spectrum_screen+$0600+$c0)
_80		dta $4e, a(spectrum_screen+$0700+$c0)
	
		dta $4e, a(spectrum_screen+$0000+$e0)
		dta $4e, a(spectrum_screen+$0100+$e0)
		dta $4e, a(spectrum_screen+$0200+$e0)
		dta $4e, a(spectrum_screen+$0300+$e0)
		dta $4e, a(spectrum_screen+$0400+$e0)
		dta $4e, a(spectrum_screen+$0500+$e0)
		dta $4e, a(spectrum_screen+$0600+$e0)
		dta $4e, a(spectrum_screen+$0700+$e0)
	
		dta $4e, a(spectrum_screen+$0800)
		dta $4e, a(spectrum_screen+$0900)
		dta $4e, a(spectrum_screen+$0a00)
		dta $4e, a(spectrum_screen+$0b00)
		dta $4e, a(spectrum_screen+$0c00)
		dta $4e, a(spectrum_screen+$0d00)
		dta $4e, a(spectrum_screen+$0e00)
_96		dta $4e, a(spectrum_screen+$0f00)

		dta $4e, a(spectrum_screen+$0800+$20)
		dta $4e, a(spectrum_screen+$0900+$20)
		dta $4e, a(spectrum_screen+$0a00+$20)
		dta $4e, a(spectrum_screen+$0b00+$20)
		dta $4e, a(spectrum_screen+$0c00+$20)
		dta $4e, a(spectrum_screen+$0d00+$20)
		dta $4e, a(spectrum_screen+$0e00+$20)
_104		dta $4e, a(spectrum_screen+$0f00+$20)
		
		dta $4e, a(spectrum_screen+$0800+$40)
		dta $4e, a(spectrum_screen+$0900+$40)
		dta $4e, a(spectrum_screen+$0a00+$40)
		dta $4e, a(spectrum_screen+$0b00+$40)
		dta $4e, a(spectrum_screen+$0c00+$40)
		dta $4e, a(spectrum_screen+$0d00+$40)
		dta $4e, a(spectrum_screen+$0e00+$40)
_112		dta $4e, a(spectrum_screen+$0f00+$40)
		
		dta $4e, a(spectrum_screen+$0800+$60)
		dta $4e, a(spectrum_screen+$0900+$60)
		dta $4e, a(spectrum_screen+$0a00+$60)
		dta $4e, a(spectrum_screen+$0b00+$60)
_117		dta $4e, a(spectrum_screen+$0c00+$60)
		dta $4e, a(spectrum_screen+$0d00+$60)
		dta $4e, a(spectrum_screen+$0e00+$60)
		dta $4e, a(spectrum_screen+$0f00+$60)
		
		dta $4e, a(spectrum_screen+$0800+$80)
		dta $4e, a(spectrum_screen+$0900+$80)
		dta $4e, a(spectrum_screen+$0a00+$80)
		dta $4e, a(spectrum_screen+$0b00+$80)
		dta $4e, a(spectrum_screen+$0c00+$80)
		dta $4e, a(spectrum_screen+$0d00+$80)
		dta $4e, a(spectrum_screen+$0e00+$80)
_128		dta $4e, a(spectrum_screen+$0f00+$80)
		
		dta $4e, a(spectrum_screen+$0800+$a0)
		dta $4e, a(spectrum_screen+$0900+$a0)
		dta $4e, a(spectrum_screen+$0a00+$a0)
		dta $4e, a(spectrum_screen+$0b00+$a0)
		dta $4e, a(spectrum_screen+$0c00+$a0)
		dta $4e, a(spectrum_screen+$0d00+$a0)
		dta $4e, a(spectrum_screen+$0e00+$a0)
		dta $4e, a(spectrum_screen+$0f00+$a0)
		
		dta $4e, a(spectrum_screen+$0800+$c0)
		dta $4e, a(spectrum_screen+$0900+$c0)
		dta $4e, a(spectrum_screen+$0a00+$c0)
		dta $4e, a(spectrum_screen+$0b00+$c0)
		dta $4e, a(spectrum_screen+$0c00+$c0)
		dta $4e, a(spectrum_screen+$0d00+$c0)
		dta $4e, a(spectrum_screen+$0e00+$c0)
_144		dta $4e, a(spectrum_screen+$0f00+$c0)
	
		dta $4e, a(spectrum_screen+$0800+$e0)
		dta $4e, a(spectrum_screen+$0900+$e0)
		dta $4e, a(spectrum_screen+$0a00+$e0)
		dta $4e, a(spectrum_screen+$0b00+$e0)
		dta $4e, a(spectrum_screen+$0c00+$e0)
		dta $4e, a(spectrum_screen+$0d00+$e0)
		dta $4e, a(spectrum_screen+$0e00+$e0)
_152		dta $4e, a(spectrum_screen+$0f00+$e0)

		dta $4e, a(spectrum_screen+$1000)		;152
		dta $4e, a(spectrum_screen+$1100)
		dta $4e, a(spectrum_screen+$1200)
		dta $4e, a(spectrum_screen+$1300)
		dta $4e, a(spectrum_screen+$1400)
		dta $4e, a(spectrum_screen+$1500)
		dta $4e, a(spectrum_screen+$1600)
		dta $4e, a(spectrum_screen+$1700)

		dta $4e, a(spectrum_screen+$1000+$20)
		dta $4e, a(spectrum_screen+$1100+$20)
		dta $4e, a(spectrum_screen+$1200+$20)
		dta $4e, a(spectrum_screen+$1300+$20)
		dta $4e, a(spectrum_screen+$1400+$20)
		dta $4e, a(spectrum_screen+$1500+$20)
		dta $4e, a(spectrum_screen+$1600+$20)
_168		dta $4e, a(spectrum_screen+$1700+$20)
		
		dta $4e, a(spectrum_screen+$1000+$40)		;168
		dta $4e, a(spectrum_screen+$1100+$40)
		dta $4e, a(spectrum_screen+$1200+$40)
		dta $4e, a(spectrum_screen+$1300+$40)
		dta $4e, a(spectrum_screen+$1400+$40)
		dta $4e, a(spectrum_screen+$1500+$40)
		dta $4e, a(spectrum_screen+$1600+$40)
_176		dta $4e, a(spectrum_screen+$1700+$40)
		
		dta $4e, a(spectrum_screen+$1000+$60)		;176
		dta $4e, a(spectrum_screen+$1100+$60)
		dta $4e, a(spectrum_screen+$1200+$60)
		dta $4e, a(spectrum_screen+$1300+$60)
		dta $4e, a(spectrum_screen+$1400+$60)
		dta $4e, a(spectrum_screen+$1500+$60)
		dta $4e, a(spectrum_screen+$1600+$60)
		dta $4e, a(spectrum_screen+$1700+$60)
		
		dta $4e, a(spectrum_screen+$1000+$80)
		dta $4e, a(spectrum_screen+$1100+$80)
		dta $4e, a(spectrum_screen+$1200+$80)
		dta $4e, a(spectrum_screen+$1300+$80)
		dta $4e, a(spectrum_screen+$1400+$80)
		dta $4e, a(spectrum_screen+$1500+$80)
		dta $4e, a(spectrum_screen+$1600+$80)
		dta $4e, a(spectrum_screen+$1700+$80)
		
		dta $4e, a(spectrum_screen+$1000+$a0)
		dta $4e, a(spectrum_screen+$1100+$a0)
		dta $4e, a(spectrum_screen+$1200+$a0)
		dta $4e, a(spectrum_screen+$1300+$a0)
		dta $4e, a(spectrum_screen+$1400+$a0)
		dta $4e, a(spectrum_screen+$1500+$a0)
		dta $4e, a(spectrum_screen+$1600+$a0)
_200		dta $4e, a(spectrum_screen+$1700+$a0)
		
		dta $4e, a(spectrum_screen+$1000+$c0)		;200
		dta $4e, a(spectrum_screen+$1100+$c0)
		dta $4e, a(spectrum_screen+$1200+$c0)
		dta $4e, a(spectrum_screen+$1300+$c0)
		dta $4e, a(spectrum_screen+$1400+$c0)
		dta $4e, a(spectrum_screen+$1500+$c0)
		dta $4e, a(spectrum_screen+$1600+$c0)
_208		dta $4e, a(spectrum_screen+$1700+$c0)
	
		dta $4e, a(spectrum_screen+$1000+$e0)		; 208
		dta $4e, a(spectrum_screen+$1100+$e0)
		dta $4e, a(spectrum_screen+$1200+$e0)
		dta $4e, a(spectrum_screen+$1300+$e0)
		
		dta $41,a(dlist) 		
		
		org $8000

tab		equ *		
		.rept 8,#
		:8 dta #*8+:1
		.endr
		
		.rept 8,#
		:8 dta 64+#*8+:1
		.endr
		
		.rept 8,#
		:8 dta 128+#*8+:1
		.endr

		
		
run		
		ldx #0
@		ldy tab,x
		
		lda #1		;$20/32
		sta pom1+1
		lda #2		;$40/32
		sta pom2+1
		txa
		asl
		rol pom1+1
		asl
		rol pom1+1
		asl
		rol pom1+1
		asl
		rol pom1+1
		asl
		rol pom1+1
		sta pom1
		
		tya
		asl
		rol pom2+1
		asl
		rol pom2+1
		asl
		rol pom2+1
		asl
		rol pom2+1
		asl
		rol pom2+1
		sta pom2
		
		ldy #31
@		lda (pom1),y
		sta (pom2),y
		dey
		bpl @-
		
		inx
		cpx #188
		jne @-1
		
		
		lda 20
@		cmp 20
		beq @-
		
		mwa #dlist	560
		mwa #dlist dlptr
		mva #41+16 559
		
		mva #$44 712	;tlo
		mva #$00 708
		mva #$EE 709
		mva #$0C 710
		
		mva #$54 hposp0
		mva #$88 hposp1
		mva #$50 hposp2
		mva #$70 hposp3
		mva #$A8 hposm1
		mva #$8C hposm3
		
		mva #3 sizep0
		sta sizep1
		sta sizep2
		sta sizep3
		mva #$ff sizem
		
		mva #$B8 704		;kolory duszków
		mva #$18 705
		mva #$08 706
		mva #$06 707
		
		mva #>sprites1 pmbase			; enable PMGs
		mva #3 pmcntl
		mva #4 623
		
		
		jmp *
		
		
		



		
		run run
		
		
		
		
		
		
		