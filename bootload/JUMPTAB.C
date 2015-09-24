/*------------------------------------------------
------------------------------------------------*/
static void dummy_func (int junk) reentrant
{
junk = 0;	/* To Avoid Compiler Warnings */
}

/*------------------------------------------------
------------------------------------------------*/
extern void boot_func_1 (int) reentrant;
extern void boot_func_2 (int) reentrant;

/*------------------------------------------------
------------------------------------------------*/
code void (*root_func_tab []) (int) reentrant =
  {
  dummy_func,
  boot_func_1,
  boot_func_2,
  };


