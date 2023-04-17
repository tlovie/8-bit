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
VIA_loc = $c004		; 0x01  cycle is 2 clocks longer than counter
VIA_hoc = $c005		; 0x00	
WR_ptr = $ff		; read and write buffer positons
RD_ptr = $fe		; zero page
SER_buf = $0200		; ring buffer for serial 

;WR_BUF:  LDX  WR_ptr     ; Start with A containing the byte to put in the buffer.
;         STA  SER_buf,X   ; Get the pointer value and store the data where it says,
;         INC  WR_ptr     ; then increment the pointer for the next write.
;         RTS
;-------------
RD_BUF:  lda WR_ptr
	 sbc RD_ptr	; count of buffer in a
	 cmp #$a0	; compare with #a0
	 bcs RD_BUF1	; if its positive then leave the flow off
         lda #%10010101  ; Rx int, no Tx int + RTS low, 8n1, /16
         sta ACIActl     ; will result in 19200 bps
RD_BUF1: LDX  RD_ptr     ; Ends with A containing the byte just read from buffer.
         LDA  SER_buf,X   ; Get the pointer value and read the data it points to.
         INC  RD_ptr     ; Then increment the pointer for the next read.
         RTS
;-------------

ACIA1_init:
		lda RD_ptr	; initialize write pointer
		sta WR_ptr	; equal to read pointer
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
		lda #%10010101	; Rx int, no Tx int, 8n1, /16
		sta ACIActl	; will result in 19200 bps
		rts

ACIA1_Input:	clc	; wait for a character on rx
		lda RD_ptr
ACIA1_cmp:	cmp WR_ptr
		beq ACIA1_cmp	; wait for a character to be ready
		jsr RD_BUF	; read the character
		rts

Get_Chr:
ACIA1_Scan:	; check if a character is waiting and get it
		clc		; clear carry flag
		lda WR_ptr	; load the WR position
		cmp RD_ptr	; compare the RD position
		beq ACIA_noscan ; no character is waiting so return
		jsr RD_BUF	; read the character
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
