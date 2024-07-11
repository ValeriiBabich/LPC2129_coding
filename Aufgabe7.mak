all: \
  Output/Debug/Obj/Aufgabe7\
  Output/Debug/Exe\
  Output/Debug/Exe/Aufgabe7.elf\

Output/Debug/Obj/Aufgabe7:
	mkdir -p "Output/Debug/Obj/Aufgabe7"
Output/Debug/Exe:
	mkdir -p "Output/Debug/Exe"

-include Output/Debug/Obj/Aufgabe7/Aufgabe7_1.d
Output/Debug/Obj/Aufgabe7/Aufgabe7_1.o:Source/Aufgabe7_1.c
	D:/gcc/arm-none-eabi/bin/cc1.exe -fmessage-length=0 -fdiagnostics-color=never -fdiagnostics-show-caret -std=gnu99 -mcpu=arm7tdmi-s -mlittle-endian -mfloat-abi=soft -mthumb -mthumb-interwork -mno-unaligned-access -mtp=soft -mfp16-format=ieee -nostdinc -isystemD:/include -I. -D__ARM_ARCH_4T__ -D__SES_ARM -D__HEAP_SIZE__=2048 -D__GNU_LINKER -D__SES_VERSION=81400 -DDEBUG -MD "C:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Output/Debug/Obj/Aufgabe7/Aufgabe7_1.d" -MQ Output/Debug/Obj/Aufgabe7/Aufgabe7_1.o -quiet -gdwarf-4 -g3 -gpubnames -fomit-frame-pointer -ffunction-sections -fdata-sections -fshort-enums -fno-common "C:\Users\valer\OneDrive\Рабочий стол\DigitalLabor-master\Source\Aufgabe7_1.c" -o "C:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Output/Debug/Obj/Aufgabe7/Aufgabe7_1.asm" -Wuninitialized
	D:/gcc/arm-none-eabi/bin/as.exe --traditional-format -I. -march=armv4t -mlittle-endian -mfloat-abi=soft -mthumb -mthumb-interwork "C:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Output/Debug/Obj/Aufgabe7/Aufgabe7_1.asm" -o Output/Debug/Obj/Aufgabe7/Aufgabe7_1.o
	D:/bin/rm.exe -f "C:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Output/Debug/Obj/Aufgabe7/Aufgabe7_1.asm"

-include Output/Debug/Obj/Aufgabe7/Aufgabe7_2.d
Output/Debug/Obj/Aufgabe7/Aufgabe7_2.o:Source/Aufgabe7_2.c
	D:/gcc/arm-none-eabi/bin/cc1.exe -fmessage-length=0 -fdiagnostics-color=never -fdiagnostics-show-caret -std=gnu99 -mcpu=arm7tdmi-s -mlittle-endian -mfloat-abi=soft -mthumb -mthumb-interwork -mno-unaligned-access -mtp=soft -mfp16-format=ieee -nostdinc -isystemD:/include -I. -D__ARM_ARCH_4T__ -D__SES_ARM -D__HEAP_SIZE__=2048 -D__GNU_LINKER -D__SES_VERSION=81400 -DDEBUG -MD "C:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Output/Debug/Obj/Aufgabe7/Aufgabe7_2.d" -MQ Output/Debug/Obj/Aufgabe7/Aufgabe7_2.o -quiet -gdwarf-4 -g3 -gpubnames -fomit-frame-pointer -ffunction-sections -fdata-sections -fshort-enums -fno-common "C:\Users\valer\OneDrive\Рабочий стол\DigitalLabor-master\Source\Aufgabe7_2.c" -o "C:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Output/Debug/Obj/Aufgabe7/Aufgabe7_2.asm" -Wuninitialized
	D:/gcc/arm-none-eabi/bin/as.exe --traditional-format -I. -march=armv4t -mlittle-endian -mfloat-abi=soft -mthumb -mthumb-interwork "C:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Output/Debug/Obj/Aufgabe7/Aufgabe7_2.asm" -o Output/Debug/Obj/Aufgabe7/Aufgabe7_2.o
	D:/bin/rm.exe -f "C:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Output/Debug/Obj/Aufgabe7/Aufgabe7_2.asm"

-include Output/Debug/Obj/Aufgabe7/Aufgabe7_3.d
Output/Debug/Obj/Aufgabe7/Aufgabe7_3.o:Source/Aufgabe7_3.c
	D:/gcc/arm-none-eabi/bin/cc1.exe -fmessage-length=0 -fdiagnostics-color=never -fdiagnostics-show-caret -std=gnu99 -mcpu=arm7tdmi-s -mlittle-endian -mfloat-abi=soft -mthumb -mthumb-interwork -mno-unaligned-access -mtp=soft -mfp16-format=ieee -nostdinc -isystemD:/include -I. -D__ARM_ARCH_4T__ -D__SES_ARM -D__HEAP_SIZE__=2048 -D__GNU_LINKER -D__SES_VERSION=81400 -DDEBUG -MD "C:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Output/Debug/Obj/Aufgabe7/Aufgabe7_3.d" -MQ Output/Debug/Obj/Aufgabe7/Aufgabe7_3.o -quiet -gdwarf-4 -g3 -gpubnames -fomit-frame-pointer -ffunction-sections -fdata-sections -fshort-enums -fno-common "C:\Users\valer\OneDrive\Рабочий стол\DigitalLabor-master\Source\Aufgabe7_3.c" -o "C:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Output/Debug/Obj/Aufgabe7/Aufgabe7_3.asm" -Wuninitialized
	D:/gcc/arm-none-eabi/bin/as.exe --traditional-format -I. -march=armv4t -mlittle-endian -mfloat-abi=soft -mthumb -mthumb-interwork "C:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Output/Debug/Obj/Aufgabe7/Aufgabe7_3.asm" -o Output/Debug/Obj/Aufgabe7/Aufgabe7_3.o
	D:/bin/rm.exe -f "C:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Output/Debug/Obj/Aufgabe7/Aufgabe7_3.asm"

-include Output/Debug/Obj/Aufgabe7/ARM_Startup_Hardware.d
Output/Debug/Obj/Aufgabe7/ARM_Startup_Hardware.o:System/ARM_Startup_Hardware.s
	D:/gcc/arm-none-eabi/bin/cc1.exe -fmessage-length=0 -lang-asm -fdiagnostics-color=never -fdiagnostics-show-caret -E -march=armv4t -mlittle-endian -mfloat-abi=soft -mthumb -mthumb-interwork -mno-unaligned-access -nostdinc -isystemD:/include -I. -D__ARM_ARCH_4T__ -D__SES_ARM -D__HEAP_SIZE__=2048 -D__GNU_LINKER -D__SES_VERSION=81400 -DDEBUG -MD "C:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Output/Debug/Obj/Aufgabe7/ARM_Startup_Hardware.d" -MQ Output/Debug/Obj/Aufgabe7/ARM_Startup_Hardware.o -quiet "C:\Users\valer\OneDrive\Рабочий стол\DigitalLabor-master\System\ARM_Startup_Hardware.s" -o "C:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Output/Debug/Obj/Aufgabe7/ARM_Startup_Hardware_PP.s"
	D:/gcc/arm-none-eabi/bin/as.exe --traditional-format -I. -march=armv4t -mlittle-endian -mfloat-abi=soft -mthumb -mthumb-interwork "C:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Output/Debug/Obj/Aufgabe7/ARM_Startup_Hardware_PP.s" -o Output/Debug/Obj/Aufgabe7/ARM_Startup_Hardware.o -g -gdwarf-4
	D:/bin/rm.exe -f "C:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Output/Debug/Obj/Aufgabe7/ARM_Startup_Hardware_PP.s"

-include Output/Debug/Obj/Aufgabe7/crt0.d
Output/Debug/Obj/Aufgabe7/crt0.o:System/crt0.s
	D:/gcc/arm-none-eabi/bin/cc1.exe -fmessage-length=0 -lang-asm -fdiagnostics-color=never -fdiagnostics-show-caret -E -march=armv4t -mlittle-endian -mfloat-abi=soft -mthumb -mthumb-interwork -mno-unaligned-access -nostdinc -isystemD:/include -I. -D__ARM_ARCH_4T__ -D__SES_ARM -D__HEAP_SIZE__=2048 -D__GNU_LINKER -D__SES_VERSION=81400 -DDEBUG -MD "C:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Output/Debug/Obj/Aufgabe7/crt0.d" -MQ Output/Debug/Obj/Aufgabe7/crt0.o -quiet "C:\Users\valer\OneDrive\Рабочий стол\DigitalLabor-master\System\crt0.s" -o "C:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Output/Debug/Obj/Aufgabe7/crt0_PP.s"
	D:/gcc/arm-none-eabi/bin/as.exe --traditional-format -I. -march=armv4t -mlittle-endian -mfloat-abi=soft -mthumb -mthumb-interwork "C:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Output/Debug/Obj/Aufgabe7/crt0_PP.s" -o Output/Debug/Obj/Aufgabe7/crt0.o -g -gdwarf-4
	D:/bin/rm.exe -f "C:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Output/Debug/Obj/Aufgabe7/crt0_PP.s"

Output/Debug/Exe/Aufgabe7.elf:\
  Output/Debug/Obj/Aufgabe7/Aufgabe7_1.o\
  Output/Debug/Obj/Aufgabe7/Aufgabe7_2.o\
  Output/Debug/Obj/Aufgabe7/Aufgabe7_3.o\
  Output/Debug/Obj/Aufgabe7/ARM_Startup_Hardware.o\
  Output/Debug/Obj/Aufgabe7/crt0.o\
  Setup/sram_placement.xml
	D:/bin/mkld.exe -target arm -memory-map-segments "FLASH1 RX 0x00000000 0x0003e000;RAM1 RWX 0x40000000 0x00004000;" -section-placement-file "C:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Setup/sram_placement.xml" -check-segment-overflow -check-section-overflow -symbols __STACKSIZE__=2048;__STACKSIZE_IRQ__=0;__STACKSIZE_FIQ__=0;__STACKSIZE_SVC__=0;__STACKSIZE_ABT__=0;__STACKSIZE_UND__=0;__HEAPSIZE__=2048;__SEGGER_RTL_vfprintf=__SEGGER_RTL_vfprintf_int_nwp;__SEGGER_RTL_vfscanf=__SEGGER_RTL_vfscanf_int "C:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Output/Debug/Obj/Aufgabe7/Aufgabe7.ld"
	D:/gcc/arm-none-eabi/bin/ld.exe -X --omagic -eReset_Handler -EL --gc-sections "-TC:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Output/Debug/Obj/Aufgabe7/Aufgabe7.ld" -Map "C:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Output/Debug/Exe/Aufgabe7.map" -u_vectors -o "C:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Output/Debug/Exe/Aufgabe7.elf" --emit-relocs --start-group Output/Debug/Obj/Aufgabe7/Aufgabe7_1.o Output/Debug/Obj/Aufgabe7/Aufgabe7_2.o Output/Debug/Obj/Aufgabe7/Aufgabe7_3.o Output/Debug/Obj/Aufgabe7/ARM_Startup_Hardware.o Output/Debug/Obj/Aufgabe7/crt0.o D:/lib/libc_v4t_t_le_eabi_balanced.a D:/lib/heapops_basic_v4t_t_le_eabi_balanced.a D:/lib/heapops_disable_interrupts_locking_v4t_t_le_eabi_balanced.a D:/lib/strops_v4t_t_le_eabi_balanced.a D:/lib/mbops_timeops_v4t_t_le_eabi_balanced.a --end-group
	D:/gcc/arm-none-eabi/bin/objcopy.exe Output/Debug/Exe/Aufgabe7.elf "C:/Users/valer/OneDrive/Рабочий стол/DigitalLabor-master/Output/Debug/Exe/Aufgabe7.hex" -Oihex