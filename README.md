# bare-metal-programming


arm gnu tool chain
https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads

 .c --preprocessor--> .i --code generator--> .s --assembler--> .o 
 multiple.o file + linker file -> elf and map file
 
 -> create header files
	function defination, variables
 
 -> create c file
	can add new secions

 
 -> create obj file/ assemle file(.s)
 -c = stop linking
 arm-none-eabi-gcc -c -mcpu=cortex-m4 -mthumb -std=gnu11 -O0 -o main.o main.c
 -S = stop at assemble stage, generate assemnly file
 arm-none-eabi-gcc -S -mcpu=cortex-m4 -mthumb -std=gnu11 -O0 -o main.s main.c
 -mcpu = This specifies the name of the target ARM processor. 
  https://gcc.gnu.org/onlinedocs/gcc-13.2.0/gcc/ARM-Options.html
 -mthumb/-marm
 -std = std use is GNU 11
 -O(capital O) = optimization
 -o(small o) = output file
 
 https://gcc.gnu.org/onlinedocs/
 https://gcc.gnu.org/onlinedocs/gcc-5.2.0/gcc/Link-Options.html

 
 arm-none-eabi-gcc -c -mcpu=cortex-m4 -mthumb -std=gnu11 -O0 -o hello_world.o hello_world.c
 
 -> analyse object file (reloactable)
arm-none-eabi-objdump.exe -h main.o-> help dump content of obj file, Display the contents of the section headers
arm-none-eabi-objdump.exe -s main.o > main_log-> help dump content of obj file, Display the full contents of all sections requested
arm-none-eabi-objdump.exe -D main.o > main_log-> help dump content of obj file, Display assembler contents of all sections

object file doesn't have bss section

->create linker file
	linker commands https://ftp.gnu.org/old-gnu/Manuals/ld-2.9.1/html_chapter/ld_3.html

-> generate map and elf file
arm-none-eabi-gcc -nostdlib -T stm32_ls.ld -Wl,-Map=final.map -o final.elf main.o led.o stm32_startup.o
	- nostdlib = no std lif file like printf
	-T = linker file
	-Wl = tells gcc compiler that following this is a linker command
	-Map = map file
	-o = output file
	arm-none-eabi-gcc -nostdlib -T stm32_ls.ld -Wl,-Map=hello_world.map -o hello_world.elf hello_world.o
	
-> analyse map and elf file
	open .map in notepad++
	
 -> make file
 
