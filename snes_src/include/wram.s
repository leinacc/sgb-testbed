.ramsection "LowRam" bank 0 slot 0

w00:
    ds $c21

wCurrMenuCursorX: ; $c21
    db

wCurrMenuCursorY: ; $c22
    db

wc23:
    ds $f3a-$c23

; currently polled
wCurrMouseRLbits: ; $f3a
    ds 2

.ends
