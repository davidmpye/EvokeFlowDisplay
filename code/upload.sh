make && arm-none-eabi-objcopy -O binary main.elf main.bin && st-flash --reset write main.bin 0x8000000 
[ $? -ne 0 ]  && echo "Failed to program - trying to unlock" && openocd -d0 -f stlink-v2.cfg -f stm32f1x.cfg -f ocd-unlock.cfg && echo "Trying to reprogram" &&  st-flash --reset write main.bin 0x8000000
[ $? -ne 0 ] && echo "Still failed to program - aborting" && exit 1
echo "Program successful - Locking"
openocd -d0 -f stlink-v2.cfg -f stm32f1x.cfg -f ocd-lock.cfg

[ $? -eq 0 ] && echo "Lock returned successfully"
