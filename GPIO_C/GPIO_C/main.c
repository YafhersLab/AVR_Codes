#include <avr/io.h>

int main(void)
{
	DDRD = 0x00;
	PORTD = 0xFF;
	
	DDRB = 0xFF;
	PORTB = 0x00;
	
	while (1)
	{
		PORTB = PIND;
	}
}

