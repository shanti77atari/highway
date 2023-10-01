//obsługa dzwiekow 	

_volume		equ $0c+2

music_off
			lda #0
			sta music
			sta audc3
			sta audc4
			rts
			
sfx1	
			sta nuta
			lda fx
			bne *+3
			rts
			
			;sta nuta
			sei
			nop
			mwa #irq1 irqvec
			mva #0 audc2
			sta irqen
			jsr music_off
			mva #1 audctl		;15khz

			;cli
			
			mva #%11100000+_volume audc1
			
			mva #4 audf2			;wymus przerwanie
			sta stimer
			mva #2 irqen
			cli
			rts
			
asm_AND	equ $29
asm_ORA	equ $09

//C dlugosc,D dzwiek,E ile dzwiekow
//@@64 ; C=05,D=07,E=09,asm_ORA
//@@65	; C=0A,D=3F,E=08,asm_AND
//@@66	; C=02,D=CC,E=0C,asm_AND
//@@181 ;C=0A,D=7F,E=14,asm_AND			
			
sfx2		equ *
			sta nuta
			lda fx
			bne *+3
			rts
			
			stx maska2
			sty maska1
			;sta nuta
			;mva #8 nuta		;ile dzwiekow	E	@@65
			;mva #$3f maska1	;maska dzwieku D
			;mva #$0A	maska2	;maska dlugosci dzwieku  C
			;mva #asm_AND  maska1-1  

			
			sei
			;nop
			mwa #irq2 irqvec
			mva #0 audctl		;64khz
			sta audc2
			sta irqen
			jsr music_off

			;cli
			
			mva #%11100000+_volume audc1
			
			mva #4 audf2			;wymus przerwanie
			sta stimer
			;sta irqen
			mva #2 irqen
			cli
			
			rts			

			
			
irq1		equ *
			bit nmist		;zabezpieczenie przed jednoczesnym wystąpieniem przerwań nmi i irq	
			bmi @+
			bvc irq1a
@			bit nmist
			bmi @+
			bvc irq1a
			jmp nmi0			;vblk
@			jmp nmi+5			;dli

irq1a		equ *			
			pha
			txa
			pha
			ldx nuta
			lda dane,x
			cmp #255
			bne @+
			mva #0 irqen
			lda #%11100000
			sta audc1
			mva music1 music
			pla
			tax
			pla
			rti
			
@			sta audf1
			lda dane+1,x
			sta audf2
			sta stimer
			mva #0 irqen
			mva #2 irqen
			inc nuta
			inc nuta
			pla
			tax
			pla
			rti
			
irq2		equ *
			bit nmist		;zabezpieczenie przed jednoczesnym wystąpieniem przerwań nmi i irq	
			bmi @+
			bvc irq2a
@			bit nmist
			bmi @+
			bvc irq2a
			jmp nmi0			;vblk
@			jmp nmi+5			;dli

irq2a		equ *	
			pha
			dec nuta
			bne @+
			mva #0 irqen
			lda #%11100000
			sta audc1
			mva music1 music
			pla
			rti
@			txa
			pha	
			lda random
maska2	equ *+1			
			and #$ff
			tax
			lda tab1,x
			sta mnoznik
			
			lda random
maska1	equ *+1
			and #$ff
			lsr
			adc #0
			;tax
			sta audf1
			sta zapas
mnoznik	equ *+1			
			bcc *+2		;jmp
			asl		;x2
			jmp @+
			asl
			adc zapas
			jmp @+		
			:2 asl
			adc zapas
			jmp @+
			asl
			sta mn1
			asl
mn1		equ *+1			
			adc #$ff		;x6
			jmp @+		
			:3 asl
			adc zapas
			jmp @+
			asl
			sta mn2
			:2 asl
mn2		equ *+1
			adc #$ff
			adc zapas
			jmp @+
			:2 asl
			sta mn3
			asl
mn3		equ *+1
			adc #$ff		;x13
			adc zapas
@			equ *
			bcc *+4
			lda #255
			sta audf2
			sta stimer
			mva #0 irqen
			mva #2 irqen
			pla
			tax
			pla
			rti	


sfx3		equ *
			sta nuta

			jsr wait_vbl
			mva #255 music
			jsr rmt_silence
			
			sei
			mwa #irq3 irqvec
			mva #0 audctl		;64khz
			sta fx_len
			sta audc2
			cli
			
			mva #$f0 audc1			
			
@			ldy nuta
			sty audf2
			sty stimer
			mvy #2 irqen		;wymus przerwanie
			dec nuta
@			cpy #0
			bne @-
			
			eor #_volume
			sta audc1
fx_len		equ *+1			
			ldy #0		;1 takt
			sty audf2
			sty stimer
			mvy #2 irqen
			inc fx_len
@			cpy #0
			bne @-
			eor #_volume
			sta audc1
	
			dex
			bne @-2
			jsr rmt_silence
			mva #0 music
			ldx #10
			jsr wait
			rts		
			
			
irq3		mvy #0 irqen
			rti			
			
dane		dta 2,15,24,125,19,98,14,72,8,45,3,19,255		;@@70 beczka
			dta 6,29,7,32,8,72,9,39,10,88,11,47,255	;L9AEF  +13
			dta 2,46,1,39,0,15		;LA694 +26
			dta 26,218,26,214,26,105,25,206,25,205,24,202
			dta 24,198,24,98,23,194,23,190,23,93,22,185,22,182
			dta 21,179,255
			
/*dane1		dta 0,1,1,2,3,4,5,6,7,7,8,9,10,11,12,13,14,14,15,16,17,18,19,20,20,21,22,23,24,25,26,27
			dta 27,28,29,30,31,32,33,34,34,35,36,37,38,39,40,40,41,42,43,44,45,46,47,47,48,49,50,51,52,53,53,54
			dta 55,56,57,58,59,60,60,61,62,63,64,65,66,67,67,68,69,70,71,72,73,73,74,85,76,77,78,79,80,80,81,82
			dta 83,84,85,86,86,87,88,89,90,91,92,93,93,94,95,96,97,98,99,100,100,101,102,103,104,105,106,106,107,108,109,110 */
	
tab1		dta 58,0,4,99,10,17,99,99,27,99,35,99,48				
		
