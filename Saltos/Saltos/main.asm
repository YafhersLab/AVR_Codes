Setup:
		LDI		R16, 0XFF
		OUT		DDRB, R16	; configurar puerto B como salida
		LDI		R17, 0X08
		OUT		SPL, R16
		OUT		SPH, R17	; iniciar pila
		LDI		R18, 0X01
		OUT		PORTB, R18	; activar PB0
		RCALL	delay

Izquierda:
		ROL		R18
		OUT		PORTB, R18	; desplaza el bit activo hacia la izquierda
		RCALL	delay
		BRCC	Izquierda	; salta si el bit C es 0

Derecha:
		ROR		R18
		OUT		PORTB, R18	; desplaza el bit activo a la derecha
		RCALL	delay
		BRCC	Derecha
		RJMP	Izquierda

delay:
		LDI		R19, 2
		LDI		R20, 134
		LDI		R21, 154
	L1:
		DEC		R21
		BRNE	L1
		DEC		R20
		BRNE	L1
		DEC		R19
		BRNE	L1
		RET