#include <avr/io.h>

int main(void)
{
	//Entradas y Salidas
    DDRB = (1 << 0);	//0x00
	DDRD = (0 << 0);	//0x01
	
	//PORT
	PORTB = (0 << 0);
	PORTD = (0 << 0);
	
    while (1) 
    {
		PORTB = PIND;	
    }
}

