Setup:
		LDI		R16, 0xF0	; 11110000
		OUT		DDRD, R16	; RD7 al RD4 como salida y RD3 al RD0 como entrada
		LDI		R16, 0x1F	; 00011111
		OUT		DDRB, R16	; RB0 al RB4 como salida (leds)

Loop:
		;desactivar el PORTB
		LDI		R16, 0x00
		OUT		PORTB, R16	; apagamos los leds
		LDI		R17, 0x00
		LDI		R19, 0x00

		;comprobamos la suma
		SBI		PORTD, 7	; activo la fila del RD7 
		IN		R17, PIND   ; copiamos lo que esta en PIND a R17
		RCALL	Pausa_20ms	; esperamos que suelte el boton
		ANDI	R17, 0x08	; enmascaramiento al bit 3
		
		;comprobamos la resta
		SBI		PORTD, 7	; activo la fila del RD7
		IN		R19, PIND   ; copiamos lo que esta en PIND a R17
		RCALL	Pausa_20ms	; esperamos que suelte el boton
		ANDI	R19, 0x04	; enmascaramiento al bit 3

		; Comprobamos
		CBI		PORTD, 7
		SUB		R19, R17
		BREQ	Loop		; Si la resta es cero, volvemos a Loop
		BRBS	2, Sumar	; Si el bit 0 de la resta está activo, saltamos a Sumar
		JMP		Restar		; Si no, saltamos a Restar
		; R17 = 0x00	R18 = 0x00

Sumar:
		RCALL	LeerNumero
		IN		R27, PORTB
		RCALL	Pausa_20ms	; lees el primer numero

		RCALL	LeerNumero
		IN		R28, PORTB
		RCALL	Pausa_20ms  ; lees el segundo numero

		ADD		R27, R28    ; R26 = R26 + R27
		OUT		PORTB, R27
		RCALL	Pausa_1s

		RJMP	Loop

Restar:
		RCALL	LeerNumero
		IN		R27, PORTB
		RCALL	Pausa_20ms	; lees el primer numero

		RCALL	LeerNumero
		IN		R28, PORTB
		RCALL	Pausa_20ms  ; lees el segundo numero

		SUB		R27, R28    ; R26 = R26 - R27
		OUT		PORTB, R27
		RCALL	Pausa_1s

		RJMP	Loop

LeerNumero:
		SBI		PORTD, 4
		CBI		PORTD, 5
		CBI		PORTD, 6
		CBI		PORTD, 7
		LDI		R16, 0x00
		OUT		PORTB, R16	; apagamos los leds
		LDI		R25, 0x00	
		IN		R25, PIND 
		RCALL	Pausa_20ms
		ANDI	R25, 0x01	; comprobamos el 7
		SUBI	R25, 0x01
		BRNE	M1
		RJMP	siete
	M1:	
		SBI		PORTD, 4
		CBI		PORTD, 5
		CBI		PORTD, 6
		CBI		PORTD, 7
		LDI		R25, 0x00
		IN		R25, PIND 
		RCALL	Pausa_20ms
		ANDI	R25, 0x02	; comprobamos el 8
		SUBI	R25, 0x02
		BRNE	M2
		RJMP	ocho
	M2:
		SBI		PORTD, 4
		CBI		PORTD, 5
		CBI		PORTD, 6
		CBI		PORTD, 7
		LDI		R25, 0x00
		IN		R25, PIND 
		RCALL	Pausa_20ms
		ANDI	R25, 0x04	; comprobamos el 9
		SUBI	R25, 0x04
		BRNE	M3
		RJMP	nueve
	M3:
		CBI		PORTD, 4
		SBI		PORTD, 5
		CBI		PORTD, 6
		CBI		PORTD, 7
		LDI		R25, 0x00
		IN		R25, PIND 
		RCALL	Pausa_20ms
		ANDI	R25, 0x01	; comprobamos el 4
		SUBI	R25, 0x01
		BRNE	M4
		RJMP	cuatro
	M4:	
		CBI		PORTD, 4
		SBI		PORTD, 5
		CBI		PORTD, 6
		CBI		PORTD, 7
		LDI		R25, 0x00
		IN		R25, PIND 
		RCALL	Pausa_20ms
		ANDI	R25, 0x02	; comprobamos el 5
		SUBI	R25, 0x02
		BRNE	M5
		RJMP	cinco
	M5:
		CBI		PORTD, 4
		SBI		PORTD, 5
		CBI		PORTD, 6
		CBI		PORTD, 7
		LDI		R25, 0x00
		IN		R25, PIND 
		RCALL	Pausa_20ms
		ANDI	R25, 0x04	; comprobamos el 6
		SUBI	R25, 0x04
		BRNE	M6
		RJMP	seis
	M6:
		CBI		PORTD, 4
		CBI		PORTD, 5
		SBI		PORTD, 6
		CBI		PORTD, 7
		LDI		R25, 0x00
		IN		R25, PIND 
		RCALL	Pausa_20ms
		ANDI	R25, 0x01	; comprobamos el 1
		SUBI	R25, 0x01
		BRNE	M7
		RJMP	uno
	M7:
		CBI		PORTD, 4
		CBI		PORTD, 5
		SBI		PORTD, 6
		CBI		PORTD, 7
		LDI		R25, 0x00
		IN		R25, PIND 
		RCALL	Pausa_20ms
		ANDI	R25, 0x02	; comprobamos el 2
		SUBI	R25, 0x02
		BRNE	M8
		RJMP	dos
	M8:
		CBI		PORTD, 4
		CBI		PORTD, 5
		SBI		PORTD, 6
		CBI		PORTD, 7
		LDI		R25, 0x00
		IN		R25, PIND 
		RCALL	Pausa_20ms
		ANDI	R25, 0x04	; comprobamos el 3
		SUBI	R25, 0x04
		BRNE	M9
		RJMP	tres
	M9:
		CBI		PORTD, 4
		CBI		PORTD, 5
		CBI		PORTD, 6
		SBI		PORTD, 7
		LDI		R25, 0x00
		IN		R25, PIND 
		RCALL	Pausa_20ms
		ANDI	R25, 0x02	; comprobamos el 0
		SUBI	R25, 0x02
		BRNE	MX
		RJMP	cero

	MX:
		RJMP	LeerNumero

	M10:
		RET

Pausa_20ms:
		LDI	 R20, 65
		LDI  R21, 235
	L1: 
		DEC  r21
		BRNE L1
		DEC  r20
		BRNE L1
		NOP
		RET

Pausa_1s:
		ldi  r22, 16
		ldi  r23, 57
		ldi  r24, 11
	L2: 
		dec  r24
		brne L2
		dec  r23
		brne L2
		dec  r22
		brne L2
		RET

siete:
		LDI		R26, 0x07
		OUT		PORTB, R26
		RCALL	Pausa_1s
		RJMP	M10
	
ocho:
		LDI		R26, 0x08
		OUT		PORTB, R26
		RCALL	Pausa_1s
		RJMP	M10

nueve:
		LDI		R26, 0x09
		OUT		PORTB, R26
		RCALL	Pausa_1s
		RJMP	M10

cuatro:
		LDI		R26, 0x04
		OUT		PORTB, R26
		RCALL	Pausa_1s
		RJMP	M10

cinco:
		LDI		R26, 0x05
		OUT		PORTB, R26
		RCALL	Pausa_1s
		RJMP	M10

seis:
		LDI		R26, 0x06
		OUT		PORTB, R26
		RCALL	Pausa_1s
		RJMP	M10

uno:
		LDI		R26, 0x01
		OUT		PORTB, R26
		RCALL	Pausa_1s
		RJMP	M10

dos:
		LDI		R26, 0x02
		OUT		PORTB, R26
		RCALL	Pausa_1s
		RJMP	M10

tres:
		LDI		R26, 0x03
		OUT		PORTB, R26
		RCALL	Pausa_1s
		RJMP	M10

cero:
		LDI		R26, 0x00
		OUT		PORTB, R26
		RCALL	Pausa_1s
		RJMP	M10