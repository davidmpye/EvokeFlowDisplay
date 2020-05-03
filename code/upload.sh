make && arm-none-eabi-objcopy -O binary main.elf main.bin && st-flash --reset write main.bin 0x8000000
