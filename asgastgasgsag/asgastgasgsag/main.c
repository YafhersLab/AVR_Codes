#define F_CPU 1000000UL
#include <avr/io.h>
#include <util/delay.h>

int flag = 0;

int main(void)
{
	DDRB = 0x00;				//puerto B como salida
	DDRC = 0x00;				//puerto C como salida
	PORTB = 0x00;				//apago el puerto B
	PORTC = 0x00;				//apago el puerto C
	
	while (1)
	{
		//primer estado
		if(flag == 0){
			PORTB = (1<<0);			//encender el rojo
			PORTC = (1<<2);			//encender el verde
			_delay_ms(1000);
			flag = 1;
		}
		//segundo estado
		else if(flag == 1){
			PORTB = (1<<0);			//encender el rojo
			PORTC = (1<<1);			//encender el amarillo
			_delay_ms(300);
			flag = 2;
		}
		//tercer estado
		else if(flag == 2){
			PORTB = (1<<2);			//encender el verde
			PORTC = (1<<0);			//encender el rojo
			_delay_ms(1000);
			flag = 3;
		}
		//cuarto estado
		else if(flag == 3){
			PORTB = (1<<1);			//encender el amarillo
			PORTC = (1<<0);			//encender el rojo
			_delay_ms(300);
			flag = 0;
		}
	}
}