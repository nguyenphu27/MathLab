#include "boot.h"
#include <stdio.h>
#include <reg51.h>

void main (void)
{
    SCON  = 0x50;		/* SCON: mode 1, 8-bit UART, enable rcvr */
    TMOD |= 0x20;               /* TMOD: timer 1, mode 2, 8-bit reload */
    TH1   = 221;                /* TH1:  reload value for 1200 baud @ 16MHz */
    TR1   = 1;                  /* TR1:  timer 1 run */
    TI    = 1;                  /* TI:   set TI to send first char of UART */

while (1)
  {
  printf ("Sent 0x1111 to Func 1\n");
  printf ("Func 1 returns %X\n", EXT_boot_func_1 (0x1111));

  printf ("Sent 0x2222 to Func 2\n");
  printf ("Func 2 returns %X\n", EXT_boot_func_2 (0x2222));
  }
}

