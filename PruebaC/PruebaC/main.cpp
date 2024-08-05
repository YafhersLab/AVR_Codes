#include "avr/io.h"

int main(void)
{
	DDRB = 0x00;
	PORTB = 0xFF;
	
	while (1)
	{
	}
}