.macro acc16
	rep #$20
	.accu 16
.endm

.macro idx16
	rep #$10
	.index 16
.endm

.macro accidx16
	rep #$30
	.accu 16
	.index 16
.endm

.macro acc8
	sep #$20
	.accu 8
.endm

.macro idx8
	sep #$10
	.index 8
.endm

.macro accidx8
	sep #$30
	.accu 8
	.index 8
.endm
