Setup:
		LDI	R16, 0xFF  ; (11110000)
		OUT	DDRD, R16   ; PORTD como salida
		LDI R17, 0x00
		OUT	PORTD, R17	; apagar todos los leds
		LDI R18, 0x00
		LDI R19, 0x06	; ponemos un numero de mas al que quiero llegar

Loop:
		OUT PORTD, R18
		Call Esperar
		INC R18
		CP R18, R19
		BRBS 1, Final	; si el bit Z es True ir a Final
		RJMP Loop


Final:
		RJMP Final

; espera de 1 segundo
Esperar:
	    LDI  r20, 6
		LDI  r21, 19
		LDI  r22, 172
	L1: 
		DEC  r22
		BRNE L1
		DEC  r21
		BRNE L1
		DEC  r20
		BRNE L1
		NOP
		RET