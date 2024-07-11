/*
 * Aufgabe_6.S
 *
 * SoSe 2024
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 * Aufgabe : Softwareinterrupt
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */

.equ SWI_LED_INIT, 0
.equ SWI_LED_ON, 1
.equ SWI_LED_OFF, 2
.equ SWI_LED_TOGGLE, 3
.equ SWI_KEY_INIT, 4
.equ SWI_IS_PRESSED, 5

.equ LED_0_bm, (1 << 16)
.equ LED_1_bm, (1 << 17)
.equ LED_2_bm, (1 << 18)
.equ LED_3_bm, (1 << 19)
.equ LED_4_bm, (1 << 20)
.equ LED_5_bm, (1 << 21)
.equ LED_6_bm, (1 << 22)
.equ LED_7_bm, (1 << 23)
.equ LED_ALL, (LED_0_bm | LED_1_bm | LED_2_bm | LED_3_bm | LED_4_bm | LED_5_bm | LED_6_bm | LED_7_bm)

.equ BUTTON_0_bm, (1 << 10)
.equ BUTTON_1_bm, (1 << 11)
.equ BUTTON_2_bm, (1 << 12)
.equ BUTTON_3_bm, (1 << 13)
.equ BUTTON_ALL, (BUTTON_0_bm | BUTTON_1_bm | BUTTON_2_bm | BUTTON_3_bm)

.equ IOPIN0,  0xE0028000
.equ IOPIN1,  0xE002801C  /* IOSET1, IOCLR1 */
.equ IODIR1,  0xE0028018
.equ IOSET1,  0xE0028014
.equ IOCLR1,  0xE002801C
.equ LED_MASK, 0x00FF0000

.section .text
.code 32
.global main
.global swi_handler

/* SWI Handler */
swi_handler:
    STMFD R13!, {R0-R3, LR}   /* Save working registers */
    LDR R3, [LR, #-4]         /* Load SWI instruction */
    BIC R3, R3, #0xFF000000   /* Clear SWI opcode bits */

    LDR R1, =EntryTable
    LDR R2, [R1, R3, LSL #2]  /* Load function pointer from table */

    MOV R0, R3                /* Pass SWI ID as parameter */
    BX R2                     /* Branch and link to function via function pointer */

swi_end:
    LDMFD R13!, {R0-R3, PC}^  /* Restore working registers and return */

/* LED functions */
LED_INIT:
    ldr r0, =IODIR1
    ldr r1, [r0]
    orr r1, r1, #LED_MASK
    str r1, [r0]
    b swi_end               /* Return from function */

LED_ON:
    mov r1, #LED_MASK
    ldr r0, =IOSET1
    str r1, [r0]
    b swi_end               /* Return from function */

LED_OFF:
    mov r1, #LED_MASK
    ldr r0, =IOCLR1
    str r1, [r0]
    b swi_end               /* Return from function */

LED_TOGGLE:
    ldr r0, =IOPIN1          /* Load the address of IOPIN1 into r0 */
    ldr r1, [r0]             /* Load the current state of IOPIN1 into r1 */
    ldr r2, =LED_MASK        /* Load the LED_MASK into r2 */
    tst r1, r2               /* Test the current state of the LEDs */
    beq toggle_on            /* If LEDs are off, go to toggle_on */
    ldr r0, =IOCLR1          /* If LEDs are on, clear them */
    str r2, [r0]
    b swi_end                /* Return from function */

toggle_on:
    ldr r0, =IOSET1          /* If LEDs are off, set them */
    str r2, [r0]
    b swi_end                /* Return from function */

/* Key functions */
KEY_INIT:
    ldr r0, =IODIR1
    ldr r1, [r0]
    bic r1, r1, #BUTTON_ALL
    str r1, [r0]
    b swi_end               /* Return from function */

IS_PRESSED:
    ldr r0, =IOPIN0
    ldr r1, [r0]
    and r0, r1, #BUTTON_0_bm
    mov r0, r0, LSR #10     /* Shift to get the bit value (0 or 1) */
    b swi_end               /* Return from function */

/* Function Table */
EntryTable:
    .word LED_INIT
    .word LED_ON
    .word LED_OFF
    .word LED_TOGGLE
    .word KEY_INIT
    .word IS_PRESSED

/* Example usage in main */
main:
    swi SWI_LED_INIT    /* Initialize LEDs with immediate parameter */
    swi SWI_LED_ON      /* Turn on LEDs with immediate parameter */
    bl delay            /* Delay */
    swi SWI_LED_OFF     /* Turn off LEDs with immediate parameter */
    bl delay            /* Delay */
    swi SWI_LED_ON      /* Turn on LEDs with immediate parameter */
    bl delay  
    swi SWI_KEY_INIT    /* Initialize buttons with immediate parameter */
    bl delay            /* Delay */
    
    /* Example of checking button state */
check_button:
    swi SWI_IS_PRESSED  /* Check if Button 0 is pressed */
    CMP R0, #0          /* Compare result of button press */
    BEQ toggleLEDs      /* Branch if button is pressed */

    B check_button      /* Loop to check button state */

toggleLEDs:
    swi SWI_LED_TOGGLE  /* Toggle LEDs with immediate parameter */
    B check_button      /* Loop to check button state */

/* Delay function */
delay:
    PUSH {LR}           /* Preserve LR */
    LDR R0, =10000000   /* Load delay count (adjust as needed for your clock speed) */
delay_loop:
    SUBS R0, R0, #1     /* Decrement delay counter */
    BNE delay_loop      /* Loop until delay counter is zero */
    POP {LR}            /* Restore LR */
    BX LR               /* Return from function */
