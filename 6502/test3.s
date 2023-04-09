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

    jsr lcd_wait

    lda #%00000010 ; set 4 bit operation
    sta prtb
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb


    lda #%00101000 ; set 4 bit operation with 2 line display
    jsr lcd_inst

    lda #%00000001 ; clear screen
    jsr lcd_inst 

    lda #%00001110 ; turn on display and cursor
    jsr lcd_inst

    lda #%00000110 ; 
    jsr lcd_inst

    ldy #$ff	; delay loop to see screen empty
k1: ldx #$ff
k2: nop
    nop
    nop
    nop
    dex
    bne k2
    dey
    bne k1
 
    lda #$48		; H 48
    jsr lcd_data

    lda #$65		; e 65
    jsr lcd_data

    lda #$6c ; l 6c
    jsr lcd_data

    lda #$6c ; l 6c
    jsr lcd_data
    
    lda #$6f ; o 6f
    jsr lcd_data

    lda #$2c ; , 2c
    jsr lcd_data

    lda #$20 ; " " 20
    jsr lcd_data

    lda #$57 ; W 57
    jsr lcd_data

    lda #$6f ; o 6f
    jsr lcd_data

    lda #$72 ; r 72
    jsr lcd_data

    lda #$6c ; l 6c
    jsr lcd_data
    
    lda #$64 ; d 64
    jsr lcd_data
    
    lda #$21 ; ! 21
    jsr lcd_data


    rts ; back to monitor

lcd_data:
    ; data is in A register
    pha	; save copy for 2nd nibble
    jsr lcd_wait	; wait for lcd to be ready
    lsr
    lsr
    lsr
    lsr
    ora #(RS)
    sta prtb
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb
    jsr lcd_wait
    pla
    and #$0f ; clear top nibble
    ora #(RS)
    sta prtb
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb
    rts

lcd_inst:
    ; data is in A register
    pha	; save copy for 2nd nibble
    jsr lcd_wait	; wait for lcd to be ready
    lsr
    lsr
    lsr
    lsr
    sta prtb
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb
    jsr lcd_wait
    pla
    and #$0f ; clear top nibble
    sta prtb
    ora #(E)
    sta prtb
    and #(~E)
    sta prtb
    rts

lcd_wait:
    pha ; save a
    lda #%11110000 ; set db7 pin to input
    sta ddrb
lcd_wait_loop:
    lda #RW ; read busy flag	; 2 cycles
    sta prtb			; 4 cycles
    lda #(RW | E)		; 2 cycles
    sta prtb			; 4 cycles
    lda #RW
    sta prtb
    lda prtb	
    and #%00001000 ; check if zero
    bne lcd_wait_loop
    lda #%11111111 ; return to all output
    sta ddrb
    pla ; restore a
    rts

