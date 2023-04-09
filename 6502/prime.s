q		equ 	$00	; main loop variable
d		equ 	$04	; divisor - 2 bytes
dmax		equ	$06
mult1		equ     $08
mult2		equ     $18
dividend	equ	$10
divisor		equ	$14
remainder	equ 	$16
dividend10	equ 	$20
ptr		equ	$24


	org $1000

main:	
	lda #$20
	sta ptr+1		; set the page for storing primes	
	lda #5
	sta q		; start q loop at 5
	lda #3
	sta dmax
	lda #0
	sta ptr
	tay		; using for pointer of primes
	sta q+1
q_loop:			; q is 16 bits here
	lda #3
	sta d		; init d loop
	lda dmax	; figure out if dmax * dmax > q
	sta mult1
	sta mult2
	jsr mul16
	sta mult2	; store a here 
	stx mult1	; store x here		
	lda q		; compute q-dmax*dmax
	sbc mult1
	lda q+1
	sbc mult2	; need dmax*dmax >=q
	bmi d_loop
	inc dmax
d_loop:	
	lda q
	sta dividend
	lda q+1
	sta dividend+1
	lda d
	sta divisor
	jsr div16	; divide q by d, remainder in a
	cmp #0
	beq composite
	clc
	lda #02
	adc d
	sta d
	lda dmax
	sbc d
	bpl d_loop
prime:
	lda q
	sta (ptr),y
	iny
	lda q+1
	sta (ptr),y
	iny
	bne composite
	inc ptr+1	; move to next page if y=0
composite:	; we had a remainder of zero, therefore the number is composite
	lda #2	; increment q
	clc
	adc q
	sta q
	lda #0
	adc q+1
	sta q+1
	bcc q_loop	; continue on if not overflow 16 bit

	rts

; 16 bit divide wit 8 bit quotient - result in dividend
div16:
	lda #0
	sta remainder
	ldx #16
div16loop:
	asl dividend
	rol dividend+1
	rol remainder
	lda remainder
	sec
	sbc divisor
	bcc div16_skip
	sta remainder
	inc dividend
div16_skip:
	dex
	bne div16loop
	rts

; 32 bit divide with 16 bit quotient
div32:
	lda #0
	sta remainder
	sta remainder+1
	ldx #32
div32loop:
	asl dividend	; dividend *2, msb -> carry
	rol dividend+1
	rol dividend+2
	rol dividend+3
	rol remainder	; remainder *2 + msb from carry
	rol remainder+1
	lda remainder
	sec
	sbc divisor	; subtract divisor to see if it fits in
	tay		; lb -> y, for we may need it later
	lda remainder+1
	sbc divisor+1	; hb in a
	bcc div32_skip
	sta remainder+1
	sty remainder
	inc dividend	; result in dividend 2 low bytes
div32_skip:
	dex
	bne div32loop
	rts

; 32 bit divide by 10
div32_10:
	lda #0
	sta remainder
	ldx #32
div32_10_loop:
	asl dividend10	; dividend *2, msb -> carry
	rol dividend10+1
	rol dividend10+2
	rol dividend10+3
	rol remainder	; remainder *2 + msb from carry
	lda remainder
	sec
	sbc #10		; subtract divisor to see if it fits in
	bcc div32_10_skip
	sta remainder
	inc dividend	; result in dividend 2 low bytes
div32_10_skip:
	dex
	bne div32_10_loop
	rts

; multiplication routine
; factors in mult1 and mult2
; result is A * 256 + X (AX)
mul16:
	lda #$00
	ldx #$08
	clc
mul16_1:bcc mul16_2
	clc
	adc mult2
mul16_2:ror
	ror mult1
	dex
	bpl mul16_1
	ldx mult1
	rts
