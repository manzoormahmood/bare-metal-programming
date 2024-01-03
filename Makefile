CC=arm-none-eabi-gcc
MACH=cortex-m4
CFLAGS= -c -mcpu=$(MACH) -mthumb -std=gnu11 -O0
LDFLAGS= -nostdlib -T hello_world.ld -Wl,-Map=hello_world.map
#target:dependency @->target ^->dependency

all:hello_world.o hello_world.elf

hello_world.o:hello_world.c
	$(CC) $(CFLAGS) -o $@ $^

hello_world.elf: hello_world.o 
	$(CC) $(LDFLAGS) -o $@ $^
	
clean:
	del *.o *.elf