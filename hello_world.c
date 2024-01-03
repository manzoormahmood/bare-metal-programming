#include <stdio.h>
#include <stdint.h>

uint8_t var1 = 1; //data section
uint32_t var2 = 0; //bss section, not visiabe in .o, but shown in .map file
const uint32_t var3 = 100; //rodata

int main(void);

void Reset_Handler(void);


int main() {
   // printf() displays the string inside quotation
   //printf("Hello, World!");
   return 0;
}

void Reset_Handler(void)
{
	
	
	main();
	
}