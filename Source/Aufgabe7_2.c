/*
 * Aufgabe_7_2.c
 *
 * SoSe 2024
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *  Aufgabe : GPIO in C
 */
#include <stdint.h>


#define IODIR1   (*(volatile uint32_t *)0xE0028018)   
#define IOSET1   (*(volatile uint32_t *)0xE0028014)   
#define IOCLR1   (*(volatile uint32_t *)0xE002801C)   

#define LED_MASK 0x00FF0000  
#define LED_0_bm (1<<16)    


void delay(uint32_t count);

int main(void) 
{
    
    IODIR1 = LED_MASK;

    uint32_t led = LED_0_bm;  
    uint32_t on_delay = 0x800000;  
    uint32_t off_delay = 0x100000; 
    int loops = 8;

    while (1)
    {
        for (int i = 0; i < loops; i++)
        {
            IOSET1 = led; 
            delay(on_delay); 

            IOCLR1 = led;
            delay(off_delay); 

            led <<= 1; 
            if (led > (1 << 23))
            {
                led = LED_0_bm;
            }
        }
    }

    return 0;
}

void delay(uint32_t count)
{
    while (count--)
    {
        __asm__("nop");
    }
}
