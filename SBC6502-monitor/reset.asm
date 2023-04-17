; ----------------- assembly instructions ---------------------------- 
;
;****************************************************************************
; Reset, Interrupt, & Break Handlers
;****************************************************************************
;               *= $FF00             ; put this in last page of ROM


;--------------Reset handler----------------------------------------------
Reset          SEI                     ; diable interupts
               CLD                     ; clear decimal mode                      
               LDX   #$FF              ;
               TXS                     ; init stack pointer
               jsr   ACIA1_init	       ; init the I/O devices

               CLI                     ; Enable interrupt system
               JMP  MonitorBoot        ; Monitor for cold reset                       
;
Interrupt:     PHA                     ; a
               TXA  	               ; 
               PHA                     ; X
		lda	ACIActl
		bpl	ACIA_end	; ACIA didn't call so go to end
		and	#$01		; check if data is there
		beq	ACIA_error	; no data - means an error conditon
		lda	ACIAdat		; ACIA has data
		LDX  WR_ptr             ; Start with A containing the byte to put in the buffer.
         	STA  SER_buf,X          ; Get the pointer value and store the data where it says,
         	INC  WR_ptr             ; then increment the pointer for the next write.
		lda  RD_ptr		; start with the read pointer 
		adc	#$e0		; add #e0  bytes - the permissible position of the WR_ptr
		cmp  WR_ptr		; subtract WR_ptr 
		bcc     IRQ_cleanup	; if positive then skip, if negative then we will set RTS high
                lda #%11010101  ; Rx int, no Tx int + RTS high, 8n1, /16
                sta ACIActl     ; will result in 19200 bps
		
ACIA_end:      TSX                     ; get stack pointer
               LDA   $0103,X           ; load INT-P Reg off stack
               AND   #$10              ; mask BRK
               BNE   BrkCmd            ; BRK CMD
ACIA_error:	bit	ACIAdat		; read the data to clear interrupt
IRQ_cleanup:   PLA                     ; x
               tax                     ; 		
               pla                     ; a
NMIjump        RTI                     ; Null Interrupt return
BrkCmd         pla                     ; X
               tax                     ;
               pla                     ; A
               jmp   BRKroutine        ; patch in user BRK routine

;
;  NMIjmp      =     $FFFA             
;  RESjmp      =     $FFFC             
;  INTjmp      =     $FFFE             

               *=    $FFFA
               .word  NMIjump
               .word  Reset 
               .word  Interrupt
;end of file
