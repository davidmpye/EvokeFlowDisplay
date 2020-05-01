make && arm-none-eabi-objcopy -O binary main.elf main.bin && st-flash --reset write main.bin 0x8000000
#&& stm32flash -w main.hex -g 0x8000000 /dev/ttyUSB0

