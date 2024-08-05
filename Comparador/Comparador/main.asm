Setup:
		LDI		R16, 0x00
		OUT		DDRD, R16	; configurar puerto D como entrada
		LDI		R17, 0xFF
		OUT		PORTD, R17	; configurar puerto D como pull up
		OUT		DDRB, R17	; configurar puerto B como salida

Loop:
		IN		R18, PIND
		ANDI	R18, 0x0F
		IN		R19, PIND
		SWAP	R19			; intercambio de nibbles
		ANDI	R19, 0x0F
		CP		R19, R18	; compara registros
		BRBS	1, Igual	; salta si son iguales
		BRCC	NAlto		; salta si nibble alto es mayor
		OUT		PORTB, R18  ; muestra nibble bajo si no salta
		RJMP	Loop

NAlto:
		OUT		PORTB, R19
		RJMP	Loop

Igual:
		LDI		R20, 0x80
		OUT		PORTB, R20
		RJMP	Loop