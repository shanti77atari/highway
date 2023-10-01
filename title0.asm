		;icl 'atari.hea'
		
;pom0	equ $50
;ntsc	equ $5e		
		
		org $2000
		.he 55,55,55,55,55,55,55,55
		
dlist0		dta $44,a(puste),$44,a(puste),$44,a(puste)
		dta $4e, a(spectrum_screen1+$0000)
		dta $4e, a(spectrum_screen1+$0200)
		dta $4e, a(spectrum_screen1+$0400)
		dta $4e, a(spectrum_screen1+$0600)
		dta $4e, a(spectrum_screen1+$0800)
		dta $4e, a(spectrum_screen1+$0a00)
		dta $4e, a(spectrum_screen1+$0c00)
		dta $4e, a(spectrum_screen1+$0e00)

		dta $4e, a(spectrum_screen1+$0000+$40)
		dta $4e, a(spectrum_screen1+$0200+$40)
		dta $4e, a(spectrum_screen1+$0400+$40)
		dta $4e, a(spectrum_screen1+$0600+$40)
		dta $4e, a(spectrum_screen1+$0800+$40)
		dta $4e, a(spectrum_screen1+$0a00+$40)
		dta $4e, a(spectrum_screen1+$0c00+$40)
		dta $4e, a(spectrum_screen1+$0e00+$40)

		dta $4e, a(spectrum_screen1+$0000+$80)
		dta $4e, a(spectrum_screen1+$0200+$80)
		dta $4e, a(spectrum_screen1+$0400+$80)
		dta $4e, a(spectrum_screen1+$0600+$80)
		dta $4e, a(spectrum_screen1+$0800+$80)
		dta $4e, a(spectrum_screen1+$0a00+$80)
		dta $4e, a(spectrum_screen1+$0c00+$80)
		dta $4e, a(spectrum_screen1+$0e00+$80)
		
		dta $4e, a(spectrum_screen1+$0000+$c0)
		dta $4e, a(spectrum_screen1+$0200+$c0)
		dta $4e, a(spectrum_screen1+$0400+$c0)
		dta $4e, a(spectrum_screen1+$0600+$c0)
		dta $4e, a(spectrum_screen1+$0800+$c0)
		dta $4e, a(spectrum_screen1+$0a00+$c0)
		dta $4e, a(spectrum_screen1+$0c00+$c0)
		dta $4e, a(spectrum_screen1+$0e00+$c0)
		
		dta $4e, a(spectrum_screen1+$0000+$100)
		dta $4e, a(spectrum_screen1+$0200+$100)
		dta $4e, a(spectrum_screen1+$0400+$100)
		dta $4e, a(spectrum_screen1+$0600+$100)
		dta $4e, a(spectrum_screen1+$0800+$100)
		dta $4e, a(spectrum_screen1+$0a00+$100)
		dta $4e, a(spectrum_screen1+$0c00+$100)
		dta $4e, a(spectrum_screen1+$0e00+$100)
		
		dta $4e, a(spectrum_screen1+$0000+$140)
		dta $4e, a(spectrum_screen1+$0200+$140)
		dta $4e, a(spectrum_screen1+$0400+$140)
		dta $4e, a(spectrum_screen1+$0600+$140)
		dta $4e, a(spectrum_screen1+$0800+$140)
		dta $4e, a(spectrum_screen1+$0a00+$140)
		dta $4e, a(spectrum_screen1+$0c00+$140)
		dta $4e, a(spectrum_screen1+$0e00+$140)
		
		dta $4e, a(spectrum_screen1+$0000+$180)
		dta $4e, a(spectrum_screen1+$0200+$180)
		dta $4e, a(spectrum_screen1+$0400+$180)
		dta $4e, a(spectrum_screen1+$0600+$180)
		dta $4e, a(spectrum_screen1+$0800+$180)
		dta $4e, a(spectrum_screen1+$0a00+$180)
		dta $4e, a(spectrum_screen1+$0c00+$180)
		dta $4e, a(spectrum_screen1+$0e00+$180)
	
		dta $4e, a(spectrum_screen1+$0000+$1c0)
		dta $4e, a(spectrum_screen1+$0200+$1c0)
		dta $4e, a(spectrum_screen1+$0400+$1c0)
		dta $4e, a(spectrum_screen1+$0600+$1c0)
		dta $4e, a(spectrum_screen1+$0800+$1c0)
		dta $4e, a(spectrum_screen1+$0a00+$1c0)
		dta $4e, a(spectrum_screen1+$0c00+$1c0)
		dta $4e, a(spectrum_screen1+$0e00+$1c0)

		dta $4e, a(spectrum_screen1+$1000)
		dta $4e, a(spectrum_screen1+$1200)
		dta $4e, a(spectrum_screen1+$1400)
		dta $4e, a(spectrum_screen1+$1600)
		dta $4e, a(spectrum_screen1+$1800)
		dta $4e, a(spectrum_screen1+$1a00)
		dta $4e, a(spectrum_screen1+$1c00)
		dta $4e, a(spectrum_screen1+$1e00)
		
		dta $4e, a(spectrum_screen1+$1000+$40)
		dta $4e, a(spectrum_screen1+$1200+$40)
		dta $4e, a(spectrum_screen1+$1400+$40)
		dta $4e, a(spectrum_screen1+$1600+$40)
		dta $4e, a(spectrum_screen1+$1800+$40)
		dta $4e, a(spectrum_screen1+$1a00+$40)
		dta $4e, a(spectrum_screen1+$1c00+$40)
		dta $4e, a(spectrum_screen1+$1e00+$40)
		
		dta $4e, a(spectrum_screen1+$1000+$80)
		dta $4e, a(spectrum_screen1+$1200+$80)
		dta $4e, a(spectrum_screen1+$1400+$80)
		dta $4e, a(spectrum_screen1+$1600+$80)
		dta $4e, a(spectrum_screen1+$1800+$80)
		dta $4e, a(spectrum_screen1+$1a00+$80)
		dta $4e, a(spectrum_screen1+$1c00+$80)
		dta $4e, a(spectrum_screen1+$1e00+$80)
		
		dta $4e, a(spectrum_screen1+$1000+$c0)
		dta $4e, a(spectrum_screen1+$1200+$c0)
		dta $4e, a(spectrum_screen1+$1400+$c0)
		dta $4e, a(spectrum_screen1+$1600+$c0)
		dta $4e, a(spectrum_screen1+$1800+$c0)
		dta $4e, a(spectrum_screen1+$1a00+$c0)
		dta $4e, a(spectrum_screen1+$1c00+$c0)
		dta $4e, a(spectrum_screen1+$1e00+$c0)
		
		dta $4e, a(spectrum_screen1+$1000+$100)
		dta $4e, a(spectrum_screen1+$1200+$100)
		dta $4e, a(spectrum_screen1+$1400+$100)
		dta $4e, a(spectrum_screen1+$1600+$100)
		dta $4e, a(spectrum_screen1+$1800+$100)
		dta $4e, a(spectrum_screen1+$1a00+$100)
		dta $4e, a(spectrum_screen1+$1c00+$100)
		dta $4e, a(spectrum_screen1+$1e00+$100)
		
		dta $4e, a(spectrum_screen1+$1000+$140)
		dta $4e, a(spectrum_screen1+$1200+$140)
		dta $4e, a(spectrum_screen1+$1400+$140)
		dta $4e, a(spectrum_screen1+$1600+$140)
		dta $4e, a(spectrum_screen1+$1800+$140)
		dta $4e, a(spectrum_screen1+$1a00+$140)
		dta $4e, a(spectrum_screen1+$1c00+$140)
		dta $4e, a(spectrum_screen1+$1e00+$140)
		
		dta $4e, a(spectrum_screen1+$1000+$180)
		dta $4e, a(spectrum_screen1+$1200+$180)
		dta $4e, a(spectrum_screen1+$1400+$180)
		dta $4e, a(spectrum_screen1+$1600+$180)
		dta $4e, a(spectrum_screen1+$1800+$180)
		dta $4e, a(spectrum_screen1+$1a00+$180)
		dta $4e, a(spectrum_screen1+$1c00+$180)
		dta $4e, a(spectrum_screen1+$1e00+$180)
		
		dta $4e, a(spectrum_screen1+$1000+$1c0)
		dta $4e, a(spectrum_screen1+$1200+$1c0)
		dta $4e, a(spectrum_screen1+$1400+$1c0)
		dta $4e, a(spectrum_screen1+$1600+$1c0)
		dta $4e, a(spectrum_screen1+$1800+$1c0)
		dta $4e, a(spectrum_screen1+$1a00+$1c0)
		dta $4e, a(spectrum_screen1+$1c00+$1c0)
		dta $4e, a(spectrum_screen1+$1e00+$1c0)

		dta $4e, a(spectrum_screen1+$2000)
		dta $4e, a(spectrum_screen1+$2200)
		dta $4e, a(spectrum_screen1+$2400)
		dta $4e, a(spectrum_screen1+$2600)
		dta $4e, a(spectrum_screen1+$2800)
		dta $4e, a(spectrum_screen1+$2a00)
		dta $4e, a(spectrum_screen1+$2c00)
		dta $4e, a(spectrum_screen1+$2e00)
		
		dta $4e, a(spectrum_screen1+$2000+$40)
		dta $4e, a(spectrum_screen1+$2200+$40)
		dta $4e, a(spectrum_screen1+$2400+$40)
		dta $4e, a(spectrum_screen1+$2600+$40)
		dta $4e, a(spectrum_screen1+$2800+$40)
		dta $4e, a(spectrum_screen1+$2a00+$40)
		dta $4e, a(spectrum_screen1+$2c00+$40)
		dta $4e, a(spectrum_screen1+$2e00+$40)
		
		dta $4e, a(spectrum_screen1+$2000+$80)
		dta $4e, a(spectrum_screen1+$2200+$80)
		dta $4e, a(spectrum_screen1+$2400+$80)
		dta $4e, a(spectrum_screen1+$2600+$80)
		dta $4e, a(spectrum_screen1+$2800+$80)
		dta $4e, a(spectrum_screen1+$2a00+$80)
		dta $4e, a(spectrum_screen1+$2c00+$80)
		dta $4e, a(spectrum_screen1+$2e00+$80)
		
		dta $4e, a(spectrum_screen1+$2000+$c0)
		dta $4e, a(spectrum_screen1+$2200+$c0)
		dta $4e, a(spectrum_screen1+$2400+$c0)
		dta $4e, a(spectrum_screen1+$2600+$c0)
		dta $4e, a(spectrum_screen1+$2800+$c0)
		dta $4e, a(spectrum_screen1+$2a00+$c0)
		dta $4e, a(spectrum_screen1+$2c00+$c0)
		dta $4e, a(spectrum_screen1+$2e00+$c0)
		
		dta $4e, a(spectrum_screen1+$2000+$100)
		dta $4e, a(spectrum_screen1+$2200+$100)
		dta $4e, a(spectrum_screen1+$2400+$100)
		dta $4e, a(spectrum_screen1+$2600+$100)
		dta $4e, a(spectrum_screen1+$2800+$100)
		dta $4e, a(spectrum_screen1+$2a00+$100)
		dta $4e, a(spectrum_screen1+$2c00+$100)
		dta $4e, a(spectrum_screen1+$2e00+$100)
		
		dta $4e, a(spectrum_screen1+$2000+$140)
		dta $4e, a(spectrum_screen1+$2200+$140)
		dta $4e, a(spectrum_screen1+$2400+$140)
		dta $4e, a(spectrum_screen1+$2600+$140)
		dta $4e, a(spectrum_screen1+$2800+$140)
		dta $4e, a(spectrum_screen1+$2a00+$140)
		dta $4e, a(spectrum_screen1+$2c00+$140)
		dta $4e, a(spectrum_screen1+$2e00+$140)
		
		dta $4e, a(spectrum_screen1+$2000+$180)
		dta $4e, a(spectrum_screen1+$2200+$180)
		dta $4e, a(spectrum_screen1+$2400+$180)
		dta $4e, a(spectrum_screen1+$2600+$180)
		dta $4e, a(spectrum_screen1+$2800+$180)
		dta $4e, a(spectrum_screen1+$2a00+$180)
		dta $4e, a(spectrum_screen1+$2c00+$180)
		dta $4e, a(spectrum_screen1+$2e00+$180)
		
		dta $4e, a(spectrum_screen1+$2000+$1c0)
		dta $4e, a(spectrum_screen1+$2200+$1c0)
		dta $4e, a(spectrum_screen1+$2400+$1c0)
		dta $4e, a(spectrum_screen1+$2600+$1c0)
		dta $4e,a(puste1),$4e,a(puste1),$4e,a(puste1)
		
		dta $44,a(puste),$44,a(puste),$44,a(puste)
		
		dta $41,a(dlist0) 	
		
puste	equ *
		:48 .he 00
puste1	:48 .he 55
		
		;org $5000
		
sprites1	equ $2800			

		
cls		
		ldy #0
@		sta (203),y
		dey
		bne @-
		inc 204
		dex
		bne @-
		rts
		
ini		mwa #sprites1+$300 203
		ldx #5
		lda #0
		jsr cls
		
		mwa #$9000 203
		ldx #$30
		lda #$55
		jsr cls

		lda 20
@		cmp 20
		beq @-
		
		mwa #dlist0	560
		mwa #dlist0 dlptr
		mva #59 559
		
		mva #>$2000 756
		
		mva #$04 712	;tlo
		mva #$00 708
		mva #$0E 709
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
		
		mva #$08 704		;kolory duszków
		sta 705
		sta 706
		sta 707
		
		mva #>sprites1 pmbase			; enable PMGs
		mva #3 pmcntl
		mva #4 623
		
		lda 20
@		cmp 20
		beq @-
		
		rts
		
		ini ini

spectrum_screen1	equ $9000
		
		org spectrum_screen1
		ins 'title0.dat'
		
		org sprites1+$38A
		.he 0C 0C 0C 0C 0C 08 0C 0C 0C 0C 0C 0C 0C 0C 0C 0C
		.he 0C 0C 0C 0C 0C 0C 08 0C 08 08 0C 08 0C 0C 0C 0C 
		.he 0C 0C 0C 04 0C 04 00 00 00 C0 C0 C0 C0 C0 C0 
		
		org sprites1+$44B+$18
		.he 9F DF 9F 3F DF
		.he 3F DF 7F BF BF FF BF FF FF FF 7F FF FF FF 7F 7F
		.he 7F FF 3F 3F FF FF FF FF FF FF FF BF 00 00 00 00
		
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
		
		org $5000

init2			
		//ntsc_colors	
		mva #0 pom0
		sta ntsc
@		lda vcount
		cmp pom0
		beq @-
		bcc @+
		sta pom0
		bcs @-
@		lda pom0
		cmp #$90
		bcs @+
		
		
//ntsc		
		inc ntsc
		
		mva #$44 712	;tlo
		mva #$00 708
		mva #$1E 709
		mva #$0C 710
		
		mva #$C8 704		;kolory duszków
		mva #$38 705
		mva #$08 706
		mva #$06 707
		jmp @+1
	

//pal	
@		equ *
		mva #$32 712	;tlo
		mva #$00 708
		mva #$EE 709
		mva #$0C 710
		
		mva #$B8 704		;kolory duszków
		mva #$18 705
		mva #$08 706
		mva #$06 707
				
		
@		lda 20
		sbc #180
@		cmp 20
		bne @-

		rts
		
		ini init2