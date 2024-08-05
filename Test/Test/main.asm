Setup:
		LDI		R16, 0XFF
		OUT		DDRB, R16		; configurar puerto B como salida
		LDI		R17, 0X08
		OUT		SPL, R16
		OUT		SPH, R17		; inicializar el puntero de pilo
	
Loop:
		SBI		PORTB, 2		; activar led verde
		RCALL	Tseg
		CBI		PORTB, 2		; desactivar led verde
		RCALL	blink
		RCALL	blink
		RCALL	blink
		SBI		PORTB, 1		; activar led amarillo
		RCALL	Tseg
		CBI		PORTB, 1		; desactivar led amarillo
		SBI		PORTB, 0		; activar led rojo
		RCALL	Tseg
		RCALL	Tseg
		CBI		PORTB, 0		; desactivar led rojo
		RJMP	loop

blink:
		SBI		PORTB, 2
		RCALL	Mseg
		CBI		PORTB, 2
		RCALL	Mseg
		RET

; retardo de medio segundo
Mseg:
		LDI		R18, 3
		LDI		R19, 138
		LDI		R20, 84
	L1:
		DEC		R20
		BRNE	L1
		DEC		R19
		BRNE	L1
		DEC		R18
		BRNE	L1
		NOP
		RET

; retardo de un segundo
Tseg:
		LDI		R18, 16
		LDI		R19, 57
		LDI		R20, 12
	L2:
		DEC		R20
		BRNE	L2
		DEC		R19
		BRNE	L2
		DEC		R18
		BRNE	L2
		NOP
		RET