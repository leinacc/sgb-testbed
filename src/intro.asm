
INCLUDE "defines.asm"

SECTION "Intro", ROMX

Intro::
	call SGBDelay
	call SGBDelay

	ld hl, MouseInner
rept 6
	call SendPackets
endr

	ld hl, MouseHook
	call SendPackets

	jr @


MouseHook:
	sgb_packet DATA_SND, 1, $08,$08,$00,$03,$4c,$00,$09


MouseInner:
	sgb_packet DATA_SND, 1, $00,$09,$00,$0b,$4b,$f4,$0a,$09,$f4,$f3,$d7,$5c,$fb,$d7,$01
	sgb_packet DATA_SND, 1, $0b,$09,$00,$0b,$20,$b0,$d1,$20,$d5,$cf,$ad,$21,$0c,$8f,$05
	sgb_packet DATA_SND, 1, $16,$09,$00,$0b,$60,$00,$ad,$22,$0c,$8f,$06,$60,$00,$ad,$3b
	sgb_packet DATA_SND, 1, $21,$09,$00,$0b,$0f,$8f,$07,$60,$00,$a2,$00,$af,$db,$ff,$00
	sgb_packet DATA_SND, 1, $2c,$09,$00,$0b,$f0,$08,$20,$a0,$bc,$68,$68,$4c,$aa,$ba,$20
	sgb_packet DATA_SND, 1, $37,$09,$00,$07,$a3,$bc,$68,$68,$4c,$ad,$ba
