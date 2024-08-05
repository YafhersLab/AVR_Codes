#define F_CPU 1000000UL
#include <avr/io.h>
#include <util/delay.h>

//Mis Variables
uint8_t cont_unidad = 0;
uint8_t cont_decena = 0;

int main(void)
{
    DDRB = 0x00;									// puerto B como salida
	PORTB = 0x00;									// apagar todo el puerto B
	cont_unidad = 0;								// inicio el contador en 0
	cont_decena = 0;								// inicio el contador en 0
	
    while (1) 
    {
		if(cont_unidad <= 9){
			cont_unidad++;
			PORTB = cont_unidad | (cont_decena << 4);					// los 4 primeros bits son unidad
			_delay_ms(1000);
		}
		else if (cont_unidad > 9){
			cont_unidad = 0;
			cont_decena++;							
			while(cont_decena == 6){
				PORTB = 0xFF;
			}
		}		
    }
}
