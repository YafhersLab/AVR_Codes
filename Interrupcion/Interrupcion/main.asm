		RJMP	Setup
		.ORG	0x0002
		RJMP	RSI_0
		.ORG	0x0004
		RJMP	RSI_1

Setup:
		SEI					; habilita las interrupciones globales
		LDI		R16, 0xFF	; 
		OUT		DDRB, R16	; configura puerto B como salida
		SBI		PORTD, 2
		SBI		PORTD, 3	; activar pull up en INTO y INT1
		LDI		R17, 0x08
		OUT		SPL, R16
		OUT		SPH, R17	; iniciar pila
		LDI		R18, 0x03
		OUT		EIMSK, R18	; habilita INT0 e INT1
		LDI		R19, 0x0F	
		STS		EICRA, R19  ; configura flancos de subida

Loop:	
		RJMP	Loop

RSI_0:
		LDI		R20, 0x3F
		OUT		PORTB, R20	; muestra el valor 0
		RCALL	Mseg
		LDI		R20, 0x06
		OUT		PORTB, R20	; muestra el valor 1
		RCALL	Mseg
		LDI		R20, 0x5B	
		OUT		PORTB, R20	; muestra el valor 2
		RCALL	Mseg		
		LDI		R20, 0x4F
		OUT		PORTB, R20  ; muestra el valor 3
		RCALL	Mseg
		LDI		R20, 0x66
		OUT		PORTB, R20	; muestra el valor 4
		RCALL	Mseg
		LDI		R20, 0x06D
		OUT		PORTB, R20	; muestra el valor 5
		RCALL	Mseg
		LDI		R20, 0x00
		OUT		PORTB, R20	; apaga el display
		RETI

RSI_1:
		LDI		R20, 0x06D
		OUT		PORTB, R20	; muestra el valor 5
		RCALL	Mseg
		LDI		R20, 0x66
		OUT		PORTB, R20	; muestra el valor 4
		RCALL	Mseg
		LDI		R20, 0x4F
		OUT		PORTB, R20  ; muestra el valor 3
		RCALL	Mseg
		LDI		R20, 0x5B	
		OUT		PORTB, R20	; muestra el valor 2
		RCALL	Mseg	
		LDI		R20, 0x06
		OUT		PORTB, R20	; muestra el valor 1
		RCALL	Mseg
		LDI		R20, 0x3F
		OUT		PORTB, R20	; muestra el valor 0
		RCALL	Mseg
		LDI		R20, 0x00
		OUT		PORTB, R20	; apaga el display
		RETI

Mseg:
		LDI		R21, 3	
		LDI		R22, 138
		LDI		R23, 84
	L1:	
		DEC		R23
		BRNE	L1
		DEC		R22
		BRNE	L1
		DEC		R21
		BRNE	L1
		NOP
		RET