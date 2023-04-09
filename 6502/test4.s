prtb = $c000
prta = $c001
ddrb = $c002
ddra = $c003
E =  %01000000
RS = %00100000
RW = %00010000

delay1 = $3d
delay2 = $3e	; zero page variables for delay loop

    org $1000

reset:
    lda #%11111111 ; set all pins to output
    sta ddrb

    lda #%00000011 ; for lcd reset - delay 4100 us
    sta prtb
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb
    lda #$06	; will loop ~1500 times...
    jsr delay	; one ZP dec + bne = 7 cycles = (3.8 us)

    lda #%00000011 ; for lcd reset - delay 100 us
    sta prtb
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb
    lda #$02	; loop ~250 times
    jsr delay	

    lda #%00000011 ; for lcd reset
    sta prtb
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb
	; now should be good, should be able to read from the busy flag


    jsr lcd_wait
    lda #%00000010 ; set 4 bit operation - currently 8 bit, completes in 1 ins
    sta prtb
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00000010 ; set 4 bit operation with 2 line display 5x8 font (2 instructions)
    sta prtb
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00001000 ; continued above instruction
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00000000 ; clear screen
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00000001 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb
    
    ldy #$ff
k1: ldx #$ff
k2: nop
    nop
    nop
    nop
    dex
    bne k2
    dey
    bne k1
 

    jsr lcd_wait
    lda #%00000000 ; turn on display and cursor
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00001110 ; turn on display and cursor
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00000000 ; set increment to the address and cursor shift right
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00000110 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb
    
    jsr lcd_wait
    lda #%00100100 ; H 48
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00101000 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00100110 ; e 65
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00100101 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00100110 ; l 6c
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00101100 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00100110 ; l 6c
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00101100 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb
    
    jsr lcd_wait
    lda #%00100110 ; o 6f
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00101111 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00100010 ; , 2c
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00101100 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00100010 ; " " 20
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00100000 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00100101 ; W 57
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00100111 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00100110 ; o 6f
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00101111 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00100111 ; r 72
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00100010 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00100110 ; l 6c
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00101100 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb
    
    jsr lcd_wait
    lda #%00100110 ; d 64
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00100100 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb
    
    jsr lcd_wait
    lda #%00100010 ; ! 21
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    jsr lcd_wait
    lda #%00100001 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb


	rts

lcd_wait:
    lda #$00
    sta delay1
    sta delay2
    lda #%11110000 ; set db7-4 pin to input - connected to low 4 bits
    sta ddrb
lcd_wait_loop:
    dec delay1
    beq lcd_wait_exit:	; bail out if 256 times
    lda #RW 	; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda #RW
    sta prtb
    nop
    lda prtb	
    and #%00001000 ; check if zero
    bne lcd_wait_loop
lcd_wait_exit:
    lda #%11111111 ; return to all output
    sta ddrb
    rts

delay:
    sta delay1
    sta delay2
delay_loop:
    dec delay1
    bne delay_loop
    dec delay2
    bne delay_loop
    rts 

