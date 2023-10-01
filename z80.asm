; spectrum stuff
; adresses
z80_regs equ $00
z80_f	equ $00
z80_a	equ $01
z80_af	equ z80_f
z80_c	equ $02
z80_b	equ $03
z80_bc	equ z80_c
z80_e	equ $04
z80_d	equ $05
z80_de	equ z80_e
z80_l	equ $06
z80_h	equ $07
z80_hl	equ z80_l
z80_ix	equ $08
z80_iy	equ $0a
z80_fp	equ $0c
z80_ap	equ $0d
z80_cp	equ $0e
z80_bp	equ $0f
z80_bcp	equ z80_cp
z80_ep	equ $10
z80_dp	equ $11
z80_dep	equ z80_ep
z80_lp	equ $12
z80_hp	equ $13
z80_hlp	equ z80_lp
z80_sp  equ $14
z80_reg0 equ $16
z80_reg1 equ $17
z80_reg2 equ $18
z80_reg3 equ $19
z80_reg4 equ $1a
z80_reg5 equ $1b
z80_reg6 equ $1c
z80_reg7 equ $1d
z80_reg8 equ $1e
z80_reg9 equ $1f
	
_bitmem0	equ $20
_bitmem1	equ $21
_bitmem2	equ $22
_bitmem3	equ $23
_bitmem4	equ $24
_bitmem5	equ $25
_bitmem6	equ $26
_bitmem7	equ $27

z80vm_fetch	equ $28	; 9 bytes
z80_pc		equ $29
z80vm_reg0	equ $31
z80vm_reg1	equ $32
z80vm_s		equ $33

z80_free_zp	equ $38
	
; constants	
_bitvalue0	equ $01	
_bitvalue1	equ $02	
_bitvalue2	equ $04	
_bitvalue3	equ $08	
_bitvalue4	equ $10	
_bitvalue5	equ $20	
_bitvalue6	equ $40	
_bitvalue7	equ $80	

_notbitvalue0	equ $fe	
_notbitvalue1	equ $fd	
_notbitvalue2	equ $fb	
_notbitvalue3	equ $f7	
_notbitvalue4	equ $ef	
_notbitvalue5	equ $df	
_notbitvalue6	equ $bf	
_notbitvalue7	equ $7f	


add_hl_bc
		lda z80_l
		clc
		adc z80_c
		sta z80_l
		lda z80_h
		adc z80_b
		sta z80_h
		rts

;add_hl_sp
;		lda z80_l
;		clc
;		adc z80_sp
;		sta z80_l
;		lda z80_h
;		adc z80_sp+1
;		sta z80_h
;		rts
		
add_ix_de
		lda z80_ix
		clc
		adc z80_e
		sta z80_ix
		lda z80_ix+1
		adc z80_d
		sta z80_ix+1
		rts
		
add_ix_bc
		lda z80_ix
		clc
		adc z80_c
		sta z80_ix
		lda z80_ix+1
		adc z80_b
		sta z80_ix+1
		rts
		
				
/*add_iy_de
		lda z80_iy
		clc
		adc z80_e
		sta z80_iy
		lda z80_iy+1
		adc z80_d
		sta z80_iy+1
		rts */
		
add_hl_e
		clc
		lda z80_l
		adc z80_e
		sta z80_l
		bcc *+4
		inc z80_h
		rts		
add_hl_de
		clc
adc_hl_de
		lda z80_l
		adc z80_e
		sta z80_l
		lda z80_h
		adc z80_d
		sta z80_h
		rts

;add_iy_bc
;		lda z80_iy
;		clc
;		adc z80_c
;		sta z80_iy
;		lda z80_iy+1
;		adc z80_b
;		sta z80_iy+1
;		rts
		
sbc_hl_de
		lda z80_l
		sbc z80_e
		sta z80_l
		lda z80_h
		sbc z80_d
		sta z80_h
		rts

sbc_hl_bc
		lda z80_l
		sbc z80_c
		sta z80_l
		lda z80_h
		sbc z80_b
		sta z80_h
		rts

;cmp_hl_bc
;		lda z80_l
;		cmp z80_c
;		bne cmp_hl_bc_end
;		lda z80_h
;		cmp z80_b
;cmp_hl_bc_end
;		rts
		
;cmp_iy_ix
;		lda z80_iy
;		cmp z80_ix
;		bne cmp_iy_ix_end
;		lda z80_iy+1
;		cmp z80_ix+1
;cmp_iy_ix_end
;		rts
		
dec_hl
		lda z80_l
		bne dec_hl_no_dec_h
		dec z80_h
dec_hl_no_dec_h
		dec z80_l
		rts
	
/*dec_ix
		lda z80_ix
		bne dec_ix_no_dec_h
		dec z80_ix+1
dec_ix_no_dec_h
		dec z80_ix
		rts */
		
dec_bc	
		lda z80_c
		bne dec_bc_no_dec_b
		dec z80_b
dec_bc_no_dec_b
		dec z80_c
		rts
	
dec_de
		lda z80_e
		bne dec_de_no_dec_d
		dec z80_d
dec_de_no_dec_d
		dec z80_e
		rts
		
;dec_sp
;		lda z80_sp
;		bne dec_sp_no_dec_sp_1
;		dec z80_sp+1
;dec_sp_no_dec_sp_1
;		dec z80_sp
;		rts

/*ex_de_hl
		lda z80_e
		ldx z80_l
		stx z80_e
		sta z80_l
		lda z80_d
		ldx z80_h
		stx z80_d
		sta z80_h
		rts */

/*ld_hl_de
		lda z80_e
		sta z80_l
		lda z80_d
		sta z80_h
		rts */
		
;exx
;		ldx #$00
;exx_loop		
;		lda z80_c,x
;		ldy z80_cp,x
;		sty z80_c,x
;		sta z80_cp,x
;		inx
;		cpx #$06
;		bne exx_loop
;		rts

/*exx		lda z80_c
		ldx z80_cp
		stx z80_c
		sta z80_cp
		lda z80_b
		ldx z80_bp
		stx z80_b
		sta z80_bp
		lda z80_e
		ldx z80_ep
		stx z80_e
		sta z80_ep
		lda z80_d
		ldx z80_dp
		stx z80_d
		sta z80_dp		
		lda z80_l
		ldx z80_lp
		stx z80_l
		sta z80_lp
		lda z80_h
		ldx z80_hp
		stx z80_h
		sta z80_hp
		rts */
		
/*ex_sp_hl
		tsx
		lda $0103,x
		ldy z80_h
		sta z80_h
		tya
		sta $0103,x
		lda $0104,x
		ldy z80_l
		sta z80_l
		tya
		sta $104,x
		rts */
		
ldir
		ldy #$00
		ldx z80_b
		beq ldir_last_page
ldir_loop		
		lda (z80_hl),y
		sta (z80_de),y
		iny
		bne ldir_loop
		inc z80_h
		inc z80_d
		dex
		bne ldir_loop
ldir_last_page
		lda z80_c
		beq ldir_end
ldir_last_page_loop		
		lda (z80_hl),y
		sta (z80_de),y
		iny
		cpy z80_c
		bne ldir_last_page_loop
ldir_end		
		stx z80_c
		stx z80_b
		tya
		clc
		adc z80_l
		sta z80_l
		bcc *+4
		inc z80_h
		tya
		clc
		adc z80_e
		sta z80_e
		bcc *+4
		inc z80_d
		rts
		
/*lddr	ldy #$00
lddr_loop
		lda (z80_hl),y
		sta (z80_de),y
		jsr dec_hl
		jsr dec_de
		jsr dec_bc
		lda z80_b
		ora z80_c
		bne lddr_loop
		rts */

		

		


		