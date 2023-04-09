;      *= $8002			; create exact 32k bin image

;
; prefill 32k block from $8002-$ffff with 'FF'
;
;      .rept 2047
;         .byte  $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff ;
;      .next 
;      .byte  $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff  ;

;
; compile the sections of the OS
;
; vasm command:  vasm6502_oldstyle -nocase -dotdir -Fbin -L sbc.lst sbc.asm

	*=$F800

      	.include ACIA_6850.asm	   ; ACIA init (115200,n,8,1)

 	.include xmodem-rec.asm	   ; xmodem command
	
	.include SbcOS.asm         ; OS
 
	.include reset.asm         ; Reset & IRQ handler

