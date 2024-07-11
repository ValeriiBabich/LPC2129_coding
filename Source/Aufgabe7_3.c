#include <stdint.h>
#include "LPC21XX.h"

// Define the hardware register addresses and bit masks
#define IODIR1      (*(volatile uint32_t*) 0xE0028018)
#define IOSET1      (*(volatile uint32_t*) 0xE0028014)
#define IOCLR1      (*(volatile uint32_t*) 0xE002801C)
#define IOPIN0      (*(volatile uint32_t*) 0xE0028000)

#define LED_MASK    0x00FF0000
#define LED_0_bm    (1 << 16)

#define BUTTON_0_bm (1 << 10)  // Start
#define BUTTON_1_bm (1 << 11)  // Stop
#define BUTTON_2_bm (1 << 12)  // Pause / Continue
#define BUTTON_3_bm (1 << 13)  // Reset

// Function to introduce a delay
void delay(uint32_t count) {
    while (count--);
}

// Function to check the button states with edge detection
int processKeys() {
    static uint32_t lastButtonState = 0;   // Static variable to store the last button state
    uint32_t buttonState = IOPIN0 & (BUTTON_0_bm | BUTTON_1_bm | BUTTON_2_bm | BUTTON_3_bm);
    int action = 0;  // Variable to store the detected action

    // Detect rising edge (button press)
    if ((buttonState & BUTTON_0_bm) && !(lastButtonState & BUTTON_0_bm)) {
        if ((buttonState & BUTTON_1_bm) && !(lastButtonState & BUTTON_1_bm)) {
            lastButtonState |= BUTTON_0_bm | BUTTON_1_bm;
            action = 5;   // Button 0 & 1 pressed simultaneously
        } else {
            lastButtonState |= BUTTON_0_bm;
            action = 1;   // Button 0 pressed
        }
    } else if ((buttonState & BUTTON_1_bm) && !(lastButtonState & BUTTON_1_bm)) {
        if ((buttonState & BUTTON_0_bm) && !(lastButtonState & BUTTON_0_bm)) {
            lastButtonState |= BUTTON_0_bm | BUTTON_1_bm;
            action = 5;   // Button 0 & 1 pressed simultaneously
        } else {
            lastButtonState |= BUTTON_1_bm;
            action = 2;   // Button 1 pressed
        }
    } else if ((buttonState & BUTTON_2_bm) && !(lastButtonState & BUTTON_2_bm)) {
        lastButtonState |= BUTTON_2_bm;
        action = 3;   // Button 2 pressed
    } else if ((buttonState & BUTTON_3_bm) && !(lastButtonState & BUTTON_3_bm)) {
        lastButtonState |= BUTTON_3_bm;
        action = 4;   // Button 3 pressed
    }

    // Detect falling edge (button release)
    if (!(buttonState & BUTTON_0_bm)) {
        lastButtonState &= ~BUTTON_0_bm;
    }
    if (!(buttonState & BUTTON_1_bm)) {
        lastButtonState &= ~BUTTON_1_bm;
    }
    if (!(buttonState & BUTTON_2_bm)) {
        lastButtonState &= ~BUTTON_2_bm;
    }
    if (!(buttonState & BUTTON_3_bm)) {
        lastButtonState &= ~BUTTON_3_bm;
    }

    return action;   // Return detected action (0 if no action)
}

// Function to set the state of a single LED in normal running light pattern
void runningLight(uint32_t* currentMask) {
    IOSET1 = *currentMask;
    *currentMask <<= 1;
    if (*currentMask > LED_MASK) {
        *currentMask = LED_0_bm;
    }
    IOCLR1 = ~(*currentMask);
}

// Function to set the state of a single LED in alternative running light pattern
void alternativeRunningLight(uint32_t* currentMask) {
    IOSET1 = *currentMask;
    *currentMask >>= 1;
    if (*currentMask < LED_0_bm) {
        *currentMask = LED_MASK;
    }
    IOCLR1 = ~(*currentMask);
}

int main() {
    IODIR1 |= LED_MASK;  // Set LEDs as output
    IOCLR1 = LED_MASK;   // Turn off all LEDs initially

    uint32_t time_on = 0x80000;
    uint32_t time_off = 0x10000;

    int isRunning = 0;   // 0 for stopped, 1 for running
    int isPaused = 0;    // 0 for running, 1 for paused
    int alternativeMode = 0;  // 0 for normal mode, 1 for alternative mode

    uint32_t currentMask = LED_0_bm;  // Start with the first LED

    while (1) {
        int key = processKeys();
        switch (key) {
            case 1:  // Button 0 pressed (Start)
                isRunning = 1;
                isPaused = 0;
                break;
            case 2:  // Button 1 pressed (Stop)
                isRunning = 0;
                IOCLR1 = LED_MASK;  // Turn off all LEDs
                break;
            case 3:  // Button 2 pressed (Pause/Continue)
                if (isRunning) {
                    isPaused = !isPaused;  // Toggle pause state
                }
                break;
            case 4:  // Button 3 pressed (Reset)
                isRunning = 0;
                isPaused = 0;
                alternativeMode = 0;
                IOCLR1 = LED_MASK;  // Turn off all LEDs
                currentMask = LED_0_bm;  // Reset LED position
                break;
            case 5:  // Button 0 & 2 pressed simultaneously
                if (isRunning) {
                    alternativeMode = !alternativeMode;  // Toggle alternative mode
                }
                break;
            default:
                break;
        }

        if (isRunning && !isPaused) {
            if (alternativeMode) {
                alternativeRunningLight(&currentMask);  // Run alternative light pattern
            } else {
                runningLight(&currentMask);  // Run normal light pattern
            }
            delay(time_on);  // On time delay
            IOCLR1 = LED_MASK;  // Turn off all LEDs
            delay(time_off);  // Off time delay
        } else {
            delay(time_on + time_off);  // Maintain the delay cycle even if paused
        }
    }

    return 0;
}
