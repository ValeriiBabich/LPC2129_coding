.text
.code 32
.global led_init
.global led_on
.global led_off
.global led_toggle
.global key_init
.global is_pressed
.global delay

.equ    IODIR1,  0xE0028018   
.equ    IOSET1,  0xE0028014   
.equ    IOCLR1, 0xE002801C    
.equ    IO0DIR, 0xE0028008    
.equ    IO0SET, 0xE0028004    
.equ    IO0CLR, 0xE002800C    
.equ    IO0PIN, 0xE0028000   


.equ    LED_MASK, 0x00FF0000  
.equ    LED_0_bm, (1<<16)    

led_init:
    ldr r0, =IODIR1
    ldr r1, =LED_MASK
    str r1, [r0]
    bx lr

led_on:
    ldr r1, =IOSET1
    str r0, [r1]
    bx lr

led_off:
    ldr r1, =IOCLR1
    str r0, [r1]
    bx lr

led_toggle:
    ldr r1, =IO0PIN
    ldr r2, [r1]
    and r2, r2, r0
    cmp r2, #0
    beq led_on_branch
led_off_branch:
    ldr r1, =IOCLR1
    str r0, [r1]
    bx lr
led_on_branch:
    ldr r1, =IOSET1
    str r0, [r1]
    bx lr

key_init:
    ldr r1, =IO0DIR
    ldr r2, [r1]
    bic r2, r2, r0
    str r2, [r1]
    bx lr

is_pressed:
    ldr r1, =IO0PIN
    ldr r2, [r1]
    and r2, r2, r0
    mov r0, #0
    cmp r2, #0
    beq not_pressed
    mov r0, #1
not_pressed:
    bx lr

delay:
    push {r0}
delay_loop:
    subs r0, r0, #1
    bne delay_loop
    pop {r0}
    bx lr

.end
