prtb = $c000
prta = $c001
ddrb = $c002
ddra = $c003
ier  = $c00e
loc  = $c004
hoc  = $c005
lol  = $c006
hol  = $c007
acr  = $c00b
E =  %01000000
RS = %00100000
RW = %00010000



    .org $2000

        lda #0b01111111
        sta ier         ; disable interrupts for all functions

        lda #0xff
        sta ddrb        ; set all pins on portb to output

	lda #0b11000000
        sta acr         ; set timer 1 to square wave mode with int disabled

        lda #06
        sta loc         ; set the value to 6 for the low order latch

        lda #0x00
        sta hoc         ; set high order latch to 0 - should start timer

	rts

