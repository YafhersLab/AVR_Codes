		LDI		R16, 0x02
		OUT		DDRB, R16		; configurar PB1 como salida
		LDI		R23, 0x00
		OUT		DDRD, R23		; configurar puerto D como entrada
		LDI		R24, 0xFF
		OUT		PORTD, R24		; activar pull up del puerto D
		SBI		PORTB, 0		; activar pull up en PB0
		LDI		R17, 0x82
		STS		TCCR1A, R17		; salida PWM por PB1, seleccion del modo Fast PWM
		LDI		R18, 0x1A
		STS		TCCR1B, R18		; valor de preescalamiento, seleccion del modo Fast PWM
		LDI		R19, 0x01
		STS		ICR1H, R19		; valor de TOP, 8 bits mas significativos
		LDI		R20, 0xF4		
		STS		ICR1L, R20		; valor de TOP, 8 bits menos significativos

Datos:
		IN		R21, PINB
		ANDI	R21, 0x01
		STS		OCR1AH, R21		; ciclo de trabajo, 8 bits mas significativos
		IN		R22, PIND
		STS		OCR1AL, R22		; ciclo de trabajo, 8 bits menos significativos
		RJMP	Datos