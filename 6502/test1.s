
prtb = $c000
prta = $c001
ddrb = $c002
ddra = $c003
E =  %01000000
RS = %00100000
RW = %00010000

    org $1000

reset:
    lda #%11111111 ; set all pins to output
    sta ddrb

    lda #%00000010 ; set 4 bit operation
    sta prtb
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00000010 ; set 4 bit operation with 2 line display
    sta prtb       ; 00101000
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00001000 ; continued above instruction
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00000000 ; clear screen
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00000001 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb
    
    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

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
 

    lda #%00000000 ; turn on display and cursor
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00001110 ; turn on display and cursor
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00000000 ; set increment to the address and cursor shift right
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00000110 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb
    
    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00100100 ; H 48
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00101000 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00100110 ; e 65
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00100101 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00100110 ; l 6c
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00101100 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00100110 ; l 6c
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00101100 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb
    
    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00100110 ; o 6f
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00101111 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00100010 ; , 2c
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00101100 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00100010 ; " " 20
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00100000 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00100101 ; W 57
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00100111 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00100110 ; o 6f
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00101111 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00100111 ; r 72
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00100010 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00100110 ; l 6c
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00101100 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb
    
    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00100110 ; d 64
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00100100 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb
    
    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00100010 ; ! 21
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb

    lda #%11110000 ; set db7 pin to input
    sta ddrb
    lda #RW ; read busy flag
    sta prtb
    lda #(RW | E)
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne *-15
    lda #RW
    sta prtb
    lda #%11111111 ; return to all output
    sta ddrb

    lda #%00100001 ; 
    sta prtb ;8421  
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb


	rts


