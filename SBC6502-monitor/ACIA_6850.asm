; ----------------- assembly instructions ---------------------------- 
;
; this is a subroutine library only
; it must be included in an executable source file
;
;
;*** I/O Locations *******************************
; define the i/o address of the ACIA1 chip
;*** 68B50 ACIA ************************
;    68B50 is at $e000   $e000 Control/Status    $e001 Transmit/Receive
;    
ACIActl = $e000
ACIAdat = $e001
VIA_ier = $c00e		; 0b01111111
VIA_acr = $c00b		; 0b11000000
VIA_ddrb = $c002	; 0b11111111
VIA_loc = $c004		; 0x06  cycle is 2 clocks longer than counter
VIA_hoc = $c005		; 0x00	

ACIA1_init:
		lda #%01111111
		sta VIA_ier	; disable interrupts on VIA
		lda #%11000000  
		sta VIA_acr	; set to free running mode on timer 1
		lda #%11111111  
		sta VIA_ddrb	; set all pins to output
		lda #$01
		sta VIA_loc	; count to 1 - will be 3 ticks
		lda #$00
		sta VIA_hoc	; and start the counter by loading hoc
		lda #%00000011 	; CR1 and CR0 bits master reset
		sta ACIActl
		lda #%00010101	; no Rx int, no Tx int, 8n1, /16
		sta ACIActl	; will result in 19200 bps
		rts

ACIA1_Input:	; wait for a character on rx
		lda ACIActl
		and #$01	; check if Receive register is full
		beq ACIA1_Input	; wait for a character to be ready
		lda ACIAdat	; read the character
		rts

Get_Chr:
ACIA1_Scan:	; check if a character is waiting and get it
		clc		; clear carry flag
		lda ACIActl
		and #$01	; check if Receive register is full
		beq ACIA_noscan ; no character is waiting so return
		lda ACIAdat	; read the character
		sec		; set carry flag if we read a character
ACIA_noscan:	rts

Put_Chr:
ACIA1_Output:	; send character to output port
		pha
ACIA_Out1:	lda ACIActl
		and #$02	; check if Transmit is empty
		beq ACIA_Out1   ; wait until transmit is empty
		pla
		sta ACIAdat	; put character into tx buffer
		rts
