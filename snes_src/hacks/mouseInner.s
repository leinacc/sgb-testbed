.org $900

SendGamepadAndMouseToGB:
    phk
    pea @jslrtsreturn-1
    pea $d7f4-1 ; Known bank 1 rtl
; Call 3 mouse-related routines
    jml $01d7fb ; UpdateMenuCursorPosWithMouse
@jslrtsreturn:
    jsr $d1b0 ; AnimateMainMenuCursor
    jsr $cfd5 ; UpdateMenuCursorShadowOam

; Send over mouse details
    lda wCurrMenuCursorX ; Mouse X to P2
    sta ICD2P2.l
    lda wCurrMenuCursorY ; Mouse Y to P3
    sta ICD2P3.l
    lda wCurrMouseRLbits+1 ; P2 mouse RL bits to P4
    sta ICD2P4.l

; P1 controls and skipping normal input send routine is revision-specific
    ldx #$00
    lda CART_VERSION.l
    beq @ver0

    jsr $bca0 ; Send1JoypadsInputsToGB
    pla
    pla
    jmp $baaa ; Skip SendInputsToGB

@ver0:
    jsr $bca3 ; Send1JoypadsInputsToGB
    pla
    pla
    jmp $baad ; Skip SendInputsToGB
