
current_zone	equ L8F00


last_top	dta b(0)
last_top_color	dta b(0)
top1		dta b(0)
bottom1		dta b(0)
nr_spr		dta b(0)

;opis góry poziomów $X0 - ksztalt,pozycja  $0X - kolory
top			dta $00,$b0,$c0,$c0,$c0,$c0,$c0,$d0,$00,$56		;30-21		;rodzaj podkolorowania u góry
			dta $67,$35,$35,$35,$78,$00,$00,$00,$43,$e2		;20-11
			dta $e2,$11,$11,$11,$11,$81,$24,$24,$24,$24		;10-01
			dta $94,$a0										;00-(-01)
		

;tabela pozycji duszków
top_pos0_table 	dta $40,$50,$60,$70,$8c,$88,$84,$80
				dta $40,$50,$60,$70,$8c,$89,$85,$81		;own_top2
				dta $40,$50,$6c,$7c,$64,$60,$70,$6c		;own_top3
				dta $40,$50,$60,$7c,0,$70,$74,$78		;own_top4
				dta $40,$50,$60,$70,0,0,0,0				;own_top5
				dta $40,0,0,0,0,0,0,0					;own_h00
				dta 0,0,0,0,0,0,0,0						;pusty
				dta $80,$90,$a0,$b0,$7c,$78,$74,$70		;level -01
				
		
				
;tabela z powtarzającymi się kształtami
top_table1	dta $0f,$1f,$3f,$7f,$fe,$fc,$f8,$f0,$e0,$c0,$80	;0-10 (11)
			dta 0,0,$01,$03,$07,$0f,$1f						;11-17 (8)
			dta $01,$03,$87,$cf,$ff,$ff,$ff,$7e,$3c,$18		;18-27 (10)
			dta $7f,$3f,$1f,$0f,$07,$03,$01					;28-34 (7)
			dta $fe,$f6,$f6,$f6,$e6,$60,$60,$60,$60		;35-43 (9)
			dta $f6,$f0,$f0,$f0,$60							;44-48 (5)
			dta $f7,$f0,$f0,$f0,$70							;49-53 (5)
			
	
			
;adres ksztaltu góry poziomu			
_top_adr	dta a(e_top1),a(e_top2),a(e_top3),a(e_top4),a(e_top5)
			dta a(own_top2),a(own_top3),a(own_top4),a(own_top5)
			dta a(own_h00),a(own_h00a),a(e_top1a),a(e_top1b)
			dta a(e_top1c),a(e_top1d)
			
_F			equ $c0		;fill
_S			equ $80		;Series

;opis ksztaltu levelu
;1 bajt = nr tablicy pozycji

;0 - next sprite
;_F+X,wartość -wypełnij X razy wartością
;_S+X,V0..Vx - wypełnij X wartościami od V0 do Vx
; ile (<128) , start - wypełnij ile wartościami z tabeli od start 

e_top1	dta 0				;$0
			dta _F+1,$e0,4,40,0
			dta _F+28,$ff,9,35,0
			dta _F+20,$ff,9,35,0
			dta _F+12,$ff,9,35,0
			dta _F+4,$ff,9,35,0			
			
e_top2		dta 0				;$1
			dta _F+2,$ff,_F+1,$fe,7,4,0
			dta _F+35,$ff,7,4,0
			dta _F+27,$ff,7,4,0
			dta _F+19,$ff,7,4,0
			dta _F+11,$ff,7,4,0
			
e_top3		dta 0				;$2
			dta 5,6,0
			dta _F+30,$ff,7,4,0
			dta _F+22,$ff,7,4,0
			dta _F+14,$ff,7,4,0
			dta _F+6,$ff,7,4,0
			
			
e_top4		dta 0				;$3
			dta 2,09,0
			dta _F+27,$ff,7,4,0
			dta _F+19,$ff,7,4,0
			dta _F+11,$ff,7,4,0
			dta _F+3,$ff,7,4,0

			
e_top5	dta 0				;$4
			dta 4,50,0
			dta _F+28,$ff,9,35,0
			dta _F+20,$ff,9,35,0
			dta _F+12,$ff,9,35,0
			dta _F+7,$ff,5,49,0
			
own_top2	dta 0				;$5
			dta _F+2,$ff,_F+2,$fe,3,$05,_F+1,$20,0		;zone21
			dta _F+28,$ff,9,35,0
			dta _F+20,$ff,9,35,0
			dta _F+12,$ff,9,35,0
			dta _F+8,$f0,_F+1,$e0,_F+4,$60,0	
			
own_top3	dta 2				;$6		
			dta _F+8,$0c,_F+1,$0c,_F+2,$0e,_S+8,$0f,$8f,$cf,$ef,$ff,$ef,$cf,$8f,_F+2,$0f,_F+3,$0e,_S+2,$0c,$08,0		;zone20
			dta _F+35,$ff,7,4,0
			dta _F+27,$ff,7,4,0
			dta _F+5,$ff,_S+4,$fe,$fc,$78,$30,0
			dta _S+4,$f0,$e0,$c0,$80,0
			
own_top4	dta 3			;$7
			dta _F+6,$fc,_S+4,$7c,$6c,$4c,$08,0
			dta _F+27,$ff,7,4,0
			dta _F+19,$ff,7,4,0
			dta _F+11,$ff,7,4,0
			dta _F+1,$f8,_F+3,$d8,_F+1,$98,_F+4,$80,0
			
own_top5	dta 0				;$8
			dta _F+4,0,_S+2,$80,$c0,3,8,0									;zone5
			dta _F+35,$ff,7,4,0
			dta _F+27,$ff,7,4,0
			dta _F+19,$ff,7,4,0
			dta _F+1,$fe,_F+1,$fc,_F+1,$fe,_F+8,$ff,7,4,0
			
own_h00		dta 5				;$9
			dta 0
			dta _F+30,$ff,7,4,0
			dta 0,0,0
			
own_h00a	dta 7				;$a
			dta 7,28,0
			dta _F+8,$ff,7,28,0
			dta _F+16,$ff,7,28,0
			dta _F+24,$ff,7,28,0
			dta _F+32,$ff,7,28,0
			
e_top1a	dta 0				;$a
			dta _S+5,$f0,$f0,$f0,$f0,$60,0
			dta _F+28,$ff,9,35,0
			dta _F+20,$ff,9,35,0
			dta _F+12,$ff,9,35,0
			dta _F+8,$ff,5,44,0		

e_top1b	dta 0				;$c
			dta _S+5,$f0,$f0,$f0,$f0,$60,0
			dta _F+32,$ff,5,44,0
			dta _F+24,$ff,5,44,0
			dta _F+16,$ff,5,44,0
			dta _F+8,$ff,5,44,0	

e_top1c	dta 0				;$d
			dta _F+1,$e0,4,40,0
			dta _F+32,$ff,5,44,0
			dta _F+24,$ff,5,44,0
			dta _F+2,$f3,_F+2,$fc,_F+12,$ff,5,44,0
			dta _F+1,$ff,_F+3,$6f,_F+1,$6e,_F+2,$c6,_F+2,$f6,_F+3,$f0,_F+1,$60,0	

e_top1d	dta 0				;$e	
			dta 4,50,0
			dta _F+31,$ff,5,49,0
			dta _F+23,$ff,5,49,0
			dta _F+15,$ff,5,49,0
			dta _F+7,$ff,5,49,0
			
;///
;opisy dołu poziomów			
bottom		dta $00,$00,$00,$00,$00,$01,$02,$02,$02,$03	;30-21
			dta $04,$05,$05,$06,$07,$07,$08,$09,$09,$09	;20-11
			dta $0a,$0b,$0c,$0d,$0e,$0f,$10,$11,$11,$11	;10-01
			dta $12,$13					;00- (-01)

bottom_pos0_table	dta $80,$90,$a0,$b0,0,0,0,0				;e_bottom1	
				dta $80,$90,$a0,$b0,$7c,$78,$74,$6c		;e_bottom2_yellow
				dta $a0,$b0,$a0,$b0,$9c,0,0,0			;own_bottom4
				dta $a0,$b0,$90,$a9,$8c,$0,$0,$b8		;e_bottom4
				dta $a0,$b0,$90,$b0,$8c,$0,$0,$a9		;own_bottom5
				dta $7e,$90,$a0,$b0,0,0,0,0				;own_bottom8
				dta $60,$70,$80,$90,0,0,0,0				;own_bottom_he0
				dta $80,$90,$a0,$b0,$7c,$78,$74,0		;own_bottom7


bottom_table1	dta $3f,$3f,$3f,$3f,$33,$03,$03,$03,$03		;0-8	   (9)
				dta $fc,$fc,$f0,$f0,$c0,$c0					;9-14  (6)
				dta $7f,$7f,$3f,$3f,$3f,$07,$03,$03,$03		;15-23 (9)
				dta $7f,$3f,$1f,$0f,$07,$03,$01				;24-30 (7)
				dta $80,$c0,$e0,$f0,$f8,$fc,$fe				;31-37 (7)
				dta $ff,$fe,$fc,$f8,$f0,$e0,$c0,$80			;38-45 (8)
				dta $70,$70,$30,$30,$10						;46-50 (5)
				dta $07,$07,$03,$03,$01						;51-55 (5)
				dta $00,$01,$03,$07,$0f,$1f,$3f,$7f			;56-63 (8)

_bottom_adr	dta a(e_bottom1),a(own_bottom1),a(e_bottom2_yellow),a(own_bottom2),a(own_bottom3),a(e_bottom3),a(own_bottom4),a(e_bottom4)
			dta a(own_bottom5),a(e_bottom2_green),a(e_bottom2_green1),a(own_bottom6),a(own_bottom7),a(own_bottom8),a(own_bottom9),a(own_bottom10)
			dta a(own_bottom11),a(e_bottom2_red),a(own_bottom_he00),a(own_bottom_he00a)

			
;ksztalty poziomów	
;podobnie jak góra, różnica w pierwszych 3,4 bajtach
;pierwszy bajt to nr tablicy pozycji
;drugi bajt to nr ostatniego bajtu koloru z tablicy kolorów =NRwiersza*6+5
;trzeci >0 to 3 bajt kolor3duszek,4 bajt pozycja3duszek,5 bajt kolor4duszek
		
e_bottom1	dta 0,5,0			;0*6+5		;$0
			dta 0
			dta 8,1,0
			dta _F+7,$ff,9,0,0
			dta _F+15,$ff,9,0,0
			dta _F+23,$ff,9,0,0
			
own_bottom1	dta 0,59,$b0,$a0,$b0		;pozycja,kolory,kolor3duszek,pozycja3duszek,kolor4duszek	;9*6+5		;$1
			dta 0
			dta 8,1,0
			dta _F+7,$ff,9,0,0
			dta _F+9,$ff,6,9,_F+15,$00,_S+3,$01,$03,$07,_F+3,$03,0
			dta 6,9,_F+16,$00,7,57,_F+6,$ff,9,15,0
			
e_bottom2_yellow	dta 1,17,0	;2*6+5				;$2								;poziomy od 24 do 22
			dta _F+4,$ff,_F+4,$3f,4,20,0
			dta _F+11,$ff,9,15,0
			dta _F+19,$ff,9,15,0
			dta _F+27,$ff,9,15,0
			dta _F+35,$ff,9,15,0
			
own_bottom2	dta 1,17,0				;$3									;level21 podobny do 24-22
			dta _F+4,$ff,_F+4,$3f,4,20,0
			dta _F+11,$ff,9,15,0
			dta _F+19,$ff,9,15,0
			dta _F+27,$ff,9,15,0
			dta _F+28,$ff,_F+3,$fc,_F+1,$f0,_F+3,$c0,0
			
own_bottom3	dta 0,11,0			;$4
			dta 0
			dta _F+3,$ff,7,24,0
			dta _F+11,$ff,7,24,0
			dta _F+11,$ff,_S+3,$f7,$f3,$f1,_F+7,$f0,_F+2,$70,_F+2,$30,_F+1,$10,0
			dta _F+13,$ff,_S+2,$9f,$0f,3,28,0
			
e_bottom3	dta 0,11,0				;$5						;poziomy 19,18
			dta 0
			dta 0
			dta 2,29,0
			dta _F+3,$ff,7,24,0
			dta _F+11,$ff,7,24,0
			
own_bottom4	dta 2,65,0						;$06
			dta 2,29,0
			dta _F+3,$ff,3,24,_F+3,$0f,0
			dta _F+10,$ff,7,24,0
			dta _F+8,0,_F+8,$0f,_F+4,$03,0
			dta _F+9,0,7,31,_F+4,$ff,_F+4,$3f,_F+4,$03,0
			
e_bottom4	dta 3,71,0				;$07
			dta _F+4,$c3,_F+8,$c0,0
			dta 4,34,_F+8,$ff,_F+4,$3f,_F+4,$03,0
			dta _F+5,0,6,31,_F+9,$ff,_F+4,$3f,_F+4,$03,0
			dta _F+4,$ff,_F+4,$3f,_F+4,$03,0
			dta _F+12,$ff,0
			
own_bottom5	dta 4,77,$d8,$90,$74			;$08
			dta _F+4,$c3,_F+5,$c0,0
			dta 4,34,_F+8,$ff,_F+4,$3f,_F+3,$03,_F+1,$02,0
			dta _F+5,0,3,31,_F+3,$ff,7,39,0
			dta _F+4,$ff,_F+4,$3f,_F+4,$03,0
			dta _F+9,$ff,_F+18,0,3,57,_F+2,$0f,_S+5,$07,$03,$03,$03,$01,0
					
e_bottom2_green	dta 1,5,0			;$09
				dta _F+4,$03,0
				dta _F+4,$ff,8,16,0
				dta _F+12,$ff,8,16,0
				dta _F+20,$ff,8,16,0
				dta _F+28,$ff,8,16,0
				
e_bottom2_green1	dta 1,5,0			;$0a		poziom 10
				dta _F+4,$03,0
				dta _F+4,$ff,8,16,0
				dta _F+12,$ff,8,16,0
				dta _F+20,$ff,8,16,0
				dta _F+28,$ff,_S+5,$7f,$3c,$3c,$3c,$04,0	

own_bottom6		dta 0,11,0			;$0b
				dta 0
				dta _F+3,$ff,7,24,0
				dta _F+11,$ff,7,24,0
				dta _S+4,$ff,$f7,$f3,$f1,_F+17,$f0,_F+2,$70,_F+2,$30,_F+1,$10,0
				dta _F+27,$ff,7,24,0
				
own_bottom7		dta 7,11,0		;$0c
				dta _F+1,$0f,5,51,0
				dta _F+7,$0f,3,28,0
				dta _F+11,$ff,7,24,0
				dta _F+19,$ff,_S+3,$7f,$3f,$1f,_F+3,$0f,5,51,0
				dta _F+5,$ff,3,24,_F+23,$0f,3,28,0
				
own_bottom8		dta 5,11,0		;0d
				dta 0
				dta _F+2,$f8,_F+3,$78,_F+2,$38,_F+2,$18,_F+1,$08,0
				dta _F+11,$ff,7,24,0
				dta _F+19,$ff,7,24,0
				dta _F+9,$ff,_S+3,$f7,$f3,$f1,_F+17,$f0,5,46,0
				
own_bottom9		dta 1,11,0		;0e
				dta _F+2,$01,0
				dta _F+3,$ff,_S+3,$7f,$3f,$1f,_F+3,$0f,5,51,0
				dta _F+15,$0f,3,28,0
				dta _F+19,$ff,7,24,0
				dta _F+27,$ff,_S+3,$7f,$3f,$1f,_F+3,$0f,5,51,0
				
own_bottom10	dta 1,11,0		;$0f
				dta 2,29,0
				dta _F+3,$ff,7,24,0
				dta _F+11,$ff,7,24,0
				dta _S+4,$ff,$f7,$f3,$f1,_F+17,$f0,5,46,0
				dta _F+5,$ff,3,24,_F+27,$0f,_S+3,$0e,$0c,$08,0
				
own_bottom11	dta 1,29,0		;$10
				dta 6,56,6,25,0
				dta _F+13,$ff,7,24,0
				dta _F+21,$ff,7,24,0
				dta _F+29,$ff,7,24,0
				dta _F+37,$ff,7,24,0
				
e_bottom2_red	dta 1,29,0		;$11
				dta _F+3,$ff,_F+1,$7f,2,24,6,25,0
				dta _F+13,$ff,7,24,0
				dta _F+21,$ff,7,24,0
				dta _F+29,$ff,7,24,0
				dta _F+37,$ff,7,24,0
				
own_bottom_he00	dta 6,29,0		;$12
				dta 0
				dta 4,27,0
				dta _F+5,$ff,7,24,0
				dta _F+8,$ff,5,38,_F+1,$60,0
				dta 8,38,0
				
own_bottom_he00a dta 0,5,0		;$13 pusty dol
				dta 0,0,0,0,0
				
				
;tabela kolorów duszków, ostani bajt =17 5duszek =1 4 duszki+4pociski
table_top_color	dta $b0,$b0,$b0,$b0,$b0,17		;top1
				dta $74,$74,$74,$74,$74,17		;top2,own_top5
				dta $d0,$d0,$d0,$d0,$d0,17		;top1_green
				dta $b0,$b0,$b0,$d0,$d0,17		;top5
				dta $20,$20,$20,$20,$20,17		;top3,h00
				dta $d2,$d2,$d2,$d2,$d2,17		;top4
				dta $b0,$b0,$b0,$b0,$74,17		;own_top2
				dta $74,$74,$d2,$d2,$74,17		;own_top3
				dta $d2,$d2,$d2,$b0,$00,1		;own_top4
				
				dta $b0,$b0,$d0,$d0,$00,1		;own_bottom1
				dta $74,$74,$d0,$d0,$00,1		;own_bottom4
				dta $d8,$d8,$d8,$74,$00,1		;e_bottom4
				dta $d8,$d8,$d8,$b0,$00,1		;own_bottom5
				
kolor0			dta $30			;zakonczenie Dema
kolor1			dta $a0			;Title
kolor2			dta $b0			;Zone<00
kolor3			dta $d0			;INFO	
kolor4			dta $ec			;score,hiscore
kolor5			dta $4a			;kolor ZONE
kolor6			dta $a8			;CZAS
kolor7			dta $36			;strzałka i wskaźniki 
kolor8			dta $80
kolor9			dta $40
				
				
tab_message		dta 104,148,92,160		;pause	
				dta 0,0,88,164			;end_of_game
				dta 92,156,0,0			;abort_game
				dta 104,148,88,164		;too late
				dta 100,148,100,148		;all_vortons_destroyed
				


				
;podkoloruj komunikat				
message_print	equ *
			mva #$0e sprites+$1b0
			sta sprites+$1b1
			sta sprites+$1b2
			sta sprites+$1b3
			
			mva #$f0 sprites+$1b4
			sta sprites+$1b5
			sta sprites+$1b6
			sta sprites+$1b7

			ldx #3
@			lda tab_message,y
			sta table_text0,x
			dey
			dex
			bpl @-
			rts
			
;wyłącz podkolorowanie komunikatu			
message_delete	equ *
			ldx #3
			lda #0
@			sta table_text0,x
			dex
			bpl @-
			rts
				
init_bcolor	equ *
			mva #$ff last_top
			sta last_top_color
			sta top1
			sta bottom1
			mva #$80 tab_high
			sta tab_high+2
			sta tab_high+4
			mva #0 tab_high+1
			sta tab_high+3
			sta nr_spr
			mva #$d7 tab_bottom
			sta tab_bottom+2
			sta tab_bottom+4
			mva #$57 tab_bottom+1
			sta tab_bottom+3
			
			mva kolor5 p1panel_col

			rts
			
end_tab		dta $01,$03,$03,$07,$0c,$18,$70,$60,$c0
			dta $18,$3c,$7c,$fc,$fc,$fc,$f8,$e0,$60
			dta $10,$30,$70,$70,$70,$70,$60,$40,$00
			
draw_zone	equ *
			lda L8F1C
			cmp #$23
			bcc dz1
			beq dz0
			
			lda #0
			ldx #$1c
@			sta sprites+$210,x
			sta sprites+$290,x
			sta sprites+$310,x
			dex
			bpl @-
			
			
			mva #$6d tablepos0_pm
			mva #$7c tablepos0_pm+1
			mva #$d0 tablecol0_pm	
			sta tablecol0_pm+1
			mva #16+1 tablecol0_pm+5
			mva #$88 tablepos0_pm+8+2
			mva #$80 tablecol0_pm+6+2
			ldx #8
@			lda end_tab,x
			sta sprites+$21d,x
			lda end_tab+9,x
			sta sprites+$299,x
			lda end_tab+18,x
			sta sprites+$32c,x
			dex
			bpl @-			
			rts
			
dz0			lda #0
			ldx #4
@			sta tablecol0_pm,x
			sta tablecol0_pm+6,x
			dex
			bpl @-
			mva #1 tablecol0_pm+5
			sta tablecol0_pm+11
			rts
			
dz1			jsr _check_top
			jmp _check_bottom
			
			
_check_bottom	equ *
			ldx current_zone
			lda bottom-1,x
			cmp bottom1
			bne *+3
			rts			;ten sam ksztalt i kolor
			
			jmp _shape_bottom
			
		
hide_sprites	equ *
			ldx #16
			lda #0
@			sta tablepos0_pm,x
			dex
			bpl @-
			rts
			
_check_top	equ *	
			ldx current_zone
			lda top-1,x
			cmp top1
			bne *+3
			rts			;ten sam ksztalt i kolor
			
			sta top1
			and #%11110000
			cmp last_top
			sta last_top
			beq @+		;ten sam ksztalt
			jsr _shape_top
			jsr drawDemo0
@			equ *		;sprawdz kolory
			lda top1
			and #%1111
			cmp last_top_color
			bne *+3
			rts			;te same kolory
			sta last_top_color
			jmp _color_top
			
drawDemo0	equ *
			lda demo_mode
			bne *+3
			rts
			
			ldx #$00
			ldy #$ff
			lda top1
			and #$f0
			cmp #$60
			bne *+6
			ldx #$3f
			ldy #$f3
			
			stx _dd0+1
			sty _dd1+1
			
			ldx #3
@			lda #$c0
			sta sprites+$214,x
			lda #0
			sta sprites+$294,x
			lda sprites+$314,x
_dd0		and #$00
			sta sprites+$314,x
			lda sprites+$194,x
_dd1		and #$ff
			sta sprites+$194,x
			dex
			bpl @-
					
			rts
			
_shape_top	equ *
			:3 lsr
			tay
			lda _top_adr,y
			sta pom0
			lda _top_adr+1,y
			sta pom0+1				;adres tablicy dla danego levelu
			
			mwa #(sprites+$180+$10) pom0b		;adres pocisków

			ldy #0
			lda (pom0),y
			:3 asl
			tay
			ldx #0
@			lda top_pos0_table,y
			sta tablepos0_pm,x
			inx
			iny
			cpx #8
			bcc @-
			
			ldy #0
sht1		iny
			lda (pom0),y
			bne @+
			jmp _next_top_sprite
@			bmi @+1
			jmp _fill_top_table
@			cmp #$c0
			bcc @+			
			jmp _fill_top_repeat
			
@			equ *
			and #$3f
			tax				;ile wartości
			
@			iny
			lda (pom0),y	;zrodlo
			sty pom0e
			ldy #0
			sta (pom0b),y	;cel
			inc pom0b
			ldy pom0e
			dex
			bne @-
		
			jmp sht1
			
tab_high	dta $80,$00,$80,$00,$80
			
_next_top_sprite	equ *
			sty pom0e
			lda pom0b
			pha
			ldx nr_spr
@			cmp tab_high,x
			bcs @+
			lda #0
			tay
			sta (pom0b),y
			inc pom0b
			lda pom0b
			jmp @-
@			pla
			sta tab_high,x
			inc nr_spr
			ldy pom0e

			lda pom0b				;next sprite
			and #128
			bpl *+4
			inc pom0b+1
			eor #$90
			sta pom0b
			
			lda pom0b+1
			cmp #>(sprites+$400)
			bcc @+
			
			mva #0 nr_spr
			rts					;już wszystkie duszki
			
@			jmp sht1
			
_fill_top_table	equ *
			sta ftt_plus+1
			iny
			lda (pom0),y
			tax			;start
			clc
ftt_plus	adc #$ff
			sta ftt_end+1	;end
			sty pom0e
		
			ldy #0
@			lda top_table1,x
			sta (pom0b),y
			iny
			inx
ftt_end		cpx #$ff
			bne @-
			
			tya
			clc
			adc pom0b
			sta pom0b
			
			ldy pom0e
			jmp sht1
					
_fill_top_repeat	equ *		;wypelnij ile x Value
			and #$3f
			sta _ft_ile+1		;ile
			iny
			lda (pom0),y		;Value
			sty pom0e
			ldy #0
			
@			sta (pom0b),y
			iny
_ft_ile		cpy #$ff
			bne @-
			
			tya
			clc
			adc pom0b		;przesuń pozycję rysowania w spritach
			sta pom0b
			
			ldy pom0e
			jmp sht1
			

			
_color_top	equ *
			asl
			sta pom0e
			asl
			adc pom0e		;x6
			tay
			ldx #0
@			lda table_top_color,y
			sta tablecol0_pm,x
			iny
			inx
			cpx #6
			bne @-

			rts

//dol			
_shape_bottom	equ *
			asl
			tay
			lda _bottom_adr,y
			sta pom0
			lda _bottom_adr+1,y
			sta pom0+1				;adres tablicy dla danego levelu
			
			mwa #(sprites+$200-41) pom0b		;adres pocisków

			ldy #0
			lda (pom0),y
			:3 asl
			tay
			ldx #0
@			lda bottom_pos0_table,y
			sta tablepos0_pm+8,x
			inx
			iny
			cpx #8
			bcc @-
					
			ldy #1
			lda (pom0),y
			tay				;y=nr color table *6 +5
			
			ldx #5
@			lda table_top_color,y
			sta tablecol0_pm+6,x
			dey
			dex
			bpl @-
			
			
			lda tablepos0_pm+8
			
			ldy #2
			lda (pom0),y
			bne @+
			lda tablepos0_pm+8+2
			pha
			ldx tablecol0_pm+6+2
			lda tablecol0_pm+6+3
			jmp @+1

@			tax
			iny
			lda (pom0),y
			pha
			iny
			lda (pom0),y
			
@			stx tablecol0_pm+12
			sta tablecol0_pm+13	
			pla
			sta tablepos0_pm+16
			
shd1		iny
			lda (pom0),y
			bne @+
			jmp _next_bottom_sprite
@			bmi @+1
			jmp _fill_bottom_table
@			cmp #$c0
			bcc @+
			jmp _fill_bottom_repeat
			
@			equ *
			and #$3f
			tax				;ile wartości
			
@			iny
			lda (pom0),y	;zrodlo
			sty pom0e
			ldy #0
			sta (pom0b),y	;cel
			dec pom0b
			ldy pom0e
			dex
			bne @-
		
			jmp shd1
			
tab_bottom	dta $df,$5f,$df,$5f,$df
			
_next_bottom_sprite	equ *
			sty pom0e
			lda pom0b
			pha
			ldx nr_spr
@			cmp tab_bottom,x		
			bcc @+
			lda #0
			tay
			sta (pom0b),y
			dec pom0b
			lda pom0b
			jmp @-
@			pla
			sta tab_bottom,x		
			inc nr_spr
			ldy pom0e

			lda pom0b				;next sprite
			and #128
			bpl *+4
			inc pom0b+1
			eor #$D7
			sta pom0b
			
			lda pom0b+1
			cmp #>(sprites+$400)
			bcc @+
			
			mva #0 nr_spr		;?
			rts					;już wszystkie duszki
			
@			jmp shd1
			
_fill_bottom_table	equ *
			sta	fdt_plus+1
			iny
			lda (pom0),y		;start
			tax
			clc
fdt_plus	adc #$ff
			sta fdt_end+1	;end
			sty pom0e
		
			ldy #0
@			lda bottom_table1,x
			sta (pom0b),y
			dec pom0b
			inx
fdt_end		cpx #$ff
			bne @-
			
			ldy pom0e
			jmp shd1
					
_fill_bottom_repeat	equ *		;wypelnij ile x Value
			and #$3f
			tax					;ile
			iny
			lda (pom0),y		;Value
			sty pom0e
			ldy #0
			
@			sta (pom0b),y
			dec pom0b
			dex
			bne @-
			
			ldy pom0e
			jmp shd1
			
//przerwania tittle i info
dli_irq	equ *
			pha
			txa
			pha
			tya
			pha
					
			ldx dli_licznik
			inc dli_licznik
			ldy dli_pozycja,x
			
@			lda dli_tablica,y
			bmi @+
			tax
			iny
			lda dli_tablica,y
			sta $D000,x
			iny
			bne @-
			
@			pla
			tay
			pla
			tax
			pla
			rti			

//fragment przeniesiony do pliku highwayencounter_6502.asm ->L7A00
/*			
dli_licznik	dta 0	
info_tab	.he 34,3D,6,	46		;pozycje startu dla przerwań DLI, ekran INFO
info_tab1	.he 50,AC,60,94		;pozycje poczatkowe pociskow
title_tab	.he 00,07,14,27		;pozycje startu dla przerwań DLI, ekran TITLE
title_tab1	.he 9C,7C,5C		;pozycje duszkow 1,2,3 po vbl
dli_pozycja	.he 00,07,14,27
//TITLE
dli_tablica	.he 12,00,02,9C,14,20,FF		;title1
			.he 12,D0,13,D0,02,78,14,00,03,78,15,40,FF					;title2
			.he 12,00,13,00,14,00,02,5c,04,60,05,A0,06,58,07,84,19,B0,FF					;title3
			.he 02,5C,03,3C,04,40,05,BC,15,00,19,80,FF
//INFO			
			.he 04,70,05,98,06,44,07,74,FF	
			.he 04,90,05,B4,06,4C,07,80,FF
			.he 07,B0,19,80,FF
			
;1 bajt= ksztalt
;2 bajt , gorna polowka to liczba linii, dolna nr duszka 1-pociski,2-duszek0 itd 		
;3 bajt pozycja w pionie	
;0 konczy ciąg
//PANEL TITLE			
table_box	.he ff,e5,0f,ff,f5,1d,0							;title_logo
			.he fe,42,14,ff,43,14,0f,44,14,ff,41,14			;title_napisy
			.he 7f,42,40-1,80,44,40-1							;OPTIONS
			.he ff,82,48,e0,42,50,07,43,48,1f,43,4c,7f,43,50,08,44,48,20,44,4c,80,44,50,04,45,48,10,45,4c,40,45,50					;1,2,3
			.he f0,42,58,80,42,5c,ff,83,58,0f,44,58,3f,44,5c,0f,41,5c,f0,41,60				;credits
			.he ff,42,6c,ff,43,6c,ff,44,6c,3f,45,6c,0f,41,6c
			.he ff,44,60,c0,43,60,0
//PANEL INFO			
tbx1		equ *-table_box
			.he c0,42,10,f0,42,14,ff,83,10,ff,84,10,03,45,14						;first line
			.he 7f,84,24,ff,83,24,c0,42,24,f0,42,28,3f,44,20,fc,43,20				;auto_vortons
			.he 03,44,30,fe,43,30,07,84,34,ff,83,34,e0,82,34						;lasertron
			.he 1f,45,40,fc,44,40,3f,85,44,fe,44,44,ff,44,48,c0,43,48				;main vorton
			.he 03,43,44,fc,42,44,07,43,4c,8f,82,4c,ff,42,54,80,42,58,fc,42,5c		;controls
			.he 07,45,50,ff,44,50,87,43,50,0f,c5,54,ff,c4,54,87,43,54,c7,83,58		; your mission
			.he f8,42,6c,ff,43,6c,ff,44,6c,07,45,6c			;stopka
			.he 0f,41,14,f0,41,20,0f,41,30,f0,41,40				;pociski
			.he 0f,41,44,f0,41,50,f0,41,6c,0
tbx2		equ *
			.he 07,42,24,1f,82,28,7f,42,30,0f,42,34,ff,42,3c
			.he fe,43,24,ff,83,28,ff,83,30,ff,43,3c,
			.he 80,84,28,e0,44,30,f0,44,3c,0  */
			
			
			
			
init_print_box	equ *
			ldx #<table_box
			ldy #>table_box
init_print_box1	equ *			
			stx _pb1
			stx _pb2
			stx _pb3
			sty _pb1+1
			sty _pb2+1
			sty _pb3+1
			rts
;rysuje prostokaty z duszków
print_box	equ *
_pb1		equ *+1
			lda table_box,x
			bne *+3
			rts
			sta pom0b
			inx
_pb2		equ *+1			
			lda table_box,x
			sta pom0c
			inx
_pb3		equ *+1			
			ldy table_box,x
			inx
			stx pom0d

			mva #0 pom0
			lda pom0c
			and #$0F
			lsr
			ror pom0
			;clc
			adc #1
			sta pom0+1
			lda pom0c
			and #$f0
			:4 lsr
			tax
			lda pom0b
@			sta (pom0),y
			iny
			dex
			bne @-
			ldx pom0d
			bne print_box		;jmp
				
					
			
			
			
