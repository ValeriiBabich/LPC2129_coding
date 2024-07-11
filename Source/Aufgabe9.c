#include <stdint.h>
#include <stdio.h>
#include "LPC21XX.h"

// Define a mask for LED control
#define MASK_LED 0x00FF0000

// Function prototypes for interrupt handlers
void FIQ_Handler(void) __attribute__((interrupt("FIQ")));
void IRQ(void) __attribute__((interrupt("IRQ")));

// Setup function to initialize peripherals
void setup() {
    // Configure pin for ADC input (P0.27 as AD0.0)
    PINSEL1 &= ~(3 << 22);
    PINSEL1 |= (1 << 22);

    // Configure ADC: 
    // - Select channel 0 (AD0.0)
    // - Set ADC clock divider to 5
    // - No burst mode, no power down
    // - Enable ADC
    // - Start conversion
    ADCR = (1 << 0)
         | (5 << 8)
         | (0 << 16)
         | (1 << 21)
         | (1 << 24);

    // Configure LEDs on P1.16 to P1.23 as outputs
    IODIR1 = MASK_LED;
}

// Function to read analog value from ADC
unsigned int readAnalog() {
    // Start A/D conversion
    ADCR |= (1 << 24);

    // Wait until conversion is complete
    while (!(ADDR & (1 << 31)));

    // Return the 10-bit result
    return (ADDR >> 6) & 0x3FF;
}

// Function to display value on LEDs
void showOnLED(unsigned int value) {
    unsigned int ledsMask = 0;

    // Calculate the number of LEDs to light up based on ADC value
    int count = value / 128;

    // Set the corresponding bits in ledsMask
    for (int i = 0; i <= count; i++) {
        ledsMask |= (1 << i);
    }

    // Shift bits to align with LED positions
    ledsMask <<= 16;

    // Clear all LED bits, then set the required LED bits
    IOCLR1 = ~ledsMask;
    IOSET1 = IOSET1 | ledsMask;
}

// Function to initialize UART0 for communication
void UART0_Init() {
    // Configure P0.0 and P0.1 for UART0 (TXD0, RXD0)
    PINSEL0 = PINSEL0 & ~0x0000000f;
    PINSEL0 |= 0x0000005;

    // Configure UART0: 8 data bits, no parity, 1 stop bit
    U0LCR = 0x83;
    U0DLM = 0;
    U0DLL = 120; // Set baud rate to 9600
    U0LCR = 0x03;
}

// Function to send a character via UART0
void UART_SendChar(char ch) {
    while (!(U0LSR & 0x20));
    U0THR = ch;
}

// Function to send a string via UART0
void UART_SendString(char* str) {
    while (*str) {
        UART_SendChar(*str++);
    }
}

// Function to convert an integer to a hex string
void toHex(unsigned int value, char* str) {
    const char hexDigits[] = "0123456789ABCDEF";
    str[0] = '0';
    str[1] = 'X';
    str[2] = hexDigits[(value >> 8) & 0xF];
    str[3] = hexDigits[(value >> 4) & 0xF];
    str[4] = hexDigits[value & 0xF];
    str[5] = '\0';
    str[6] = '\n';
}


void execute() {
    while (1) {
        // Read the analog value from ADC
        unsigned int valueADC = readAnalog();
        showOnLED(valueADC);

        // Convert the value to hex and send via UART0
        char hex[7];
        toHex(valueADC, hex);
        UART_SendString(hex);
        UART_SendChar('\n');
        UART_SendChar('\r');
    }
}

int main(void) {
    setup();
    UART0_Init();
    execute();
}
