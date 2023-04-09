prtb = $c000
prta = $c001
ddrb = $c002
ddra = $c003
E =  %01000000
RS = %00100000
RW = %00010000

delay1 = $3d
delay2 = $3e	; zero page variables for delay loop
REG = $3f	; put in here active register to use

    org $1000

; could never get the read busy flag to work in 4 bit mode consistently
; examined lots of code libraries for arduino, etc, 
; and they're all using fixed delays

main:
    lda ddrb	   ; get current state of pins
    ora #%01111111 ; set bottom 7 pins to output
    sta ddrb

    lda #$0c
    jsr delay_long
    lda #%00000011 ; for lcd reset - delay 4100 us
    jsr lcd_ate
    
    lda #$0c		; will loop ~1250 times...
    jsr delay_long	; one ZP dec + bne = 8 cycles = (3.8 us)
    lda #%00000011      ; for lcd reset - delay 100 us
    jsr lcd_ate

    lda #$02	; loop ~500 times
    jsr delay_long	
    lda #%00000011 ; for lcd reset
    jsr lcd_ate	; now should be good, should be able to read from the busy flag

    lda #$02
    jsr delay_long
    lda #%00000010 ; set 4 bit operation - currently 8 bit, completes in 1 ins
    jsr lcd_ate 

    lda #0
    sta REG	; doing instructions now

    lda #%00101000	; set 4 bit operation with 2 line display 5x8 font
    jsr lcd_dat 

    lda #%00000001	; clear screen
    jsr lcd_dat 
    lda #$06
    jsr delay_long
    
    lda #%00001110	; turn on display and cursor
    jsr lcd_dat 
    lda #$06
    jsr delay_long

    lda #%00000110	; set increment to the address and cursor shift right
    jsr lcd_dat 

    lda #(RS) 	; now use data register
    sta REG
    
    ldx #$0
    lda string,x
print:
    jsr lcd_dat
    inx
    lda string,x
    bne print
    

    rts

lcd_dat:	; data comes in a
    pha	; save a
    lsr
    lsr	; get top 4 bits
    lsr
    lsr
    ora REG	; select register to use 
    jsr lcd_ate
    pla	; restore a
    and #%00001111 ; get low bits
    ora REG   ; select register to use
    jsr lcd_ate
    lda #10
    jsr delay
    rts

lcd_ate:	; A is loaded with data, store it and toggle enable
    sta prtb
    nop
    ora #(E)
    sta prtb
    nop
    and #(~E)
    sta prtb
    nop
    rts

delay:
    sta delay1
delay_loop:
    dec delay1
    bne delay_loop
    rts

delay_long:
    sta delay1
    sta delay2
delay_long_loop:
    dec delay1
    bne delay_long_loop
    dec delay2
    bne delay_long_loop
    rts 

string:
    dfb "Hello, World!",0
