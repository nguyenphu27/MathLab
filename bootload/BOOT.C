#include "boot.h"

/*------------------------------------------------
This is a "BOOT" EPROM function that may be called
from the BOOT code (directly) and from EXT ROM.
------------------------------------------------*/
int boot_func_1 (int a) reentrant
{
return (a * 2);
}

/*------------------------------------------------
This is another "BOOT" EPROM function that may be
called from the BOOT code (directly) and from
EXT ROM.
------------------------------------------------*/
int boot_func_2 (int b) reentrant
{
return (b * 3);
}

/*------------------------------------------------
Call the dummy function then transfer control to
the EXTERNAL program.
------------------------------------------------*/
void main (void)
{
EXT_dummy (0);			/* Call the DUMMY Function (thru the jump table) */

((void (code *) (void)) EXT_PROG_START_ADDRESS) ();	/* Jump to EXT ROM Program */

while (1);  /* This should NEVER happen.  The Above should NEVER return. */
}


