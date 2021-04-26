#include <stdint.h>
#include <stdlib.h>

#include "riscv.h"
#include "reg.h"
#include "top_defines.h"
#include "lib.h"

//#define REVERSE_DIR

void wait_led_cycle(int ms)
{
    if (REG_RD_FIELD(STATUS, SIMULATION) == 1){
        // Wait for a much shorter time when simulation...
        wait_cycles(100);
    }
    else{
        wait_ms(ms);
    }
}

int main() 
{
    while(1){
        int wait_time = REG_RD_FIELD(STATUS, BUTTON) ? 200 : 100;
#ifdef REVERSE_DIR
        REG_WR(LED_CONFIG, 0x04);
        wait_led_cycle(wait_time);

        REG_WR(LED_CONFIG, 0x02);
        wait_led_cycle(wait_time);

        REG_WR(LED_CONFIG, 0x01);
        wait_led_cycle(wait_time);
#else
        REG_WR(LED_CONFIG, 0x01);
        wait_led_cycle(wait_time);

        REG_WR(LED_CONFIG, 0x02);
        wait_led_cycle(wait_time);

        REG_WR(LED_CONFIG, 0x04);
        wait_led_cycle(wait_time);
#endif
    }
}
