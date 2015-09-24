#define EXT_PROG_START_ADDRESS	0x8000
#define JMP_TABL_START_ADDRESS	0x7800

enum root_functions
  {
  FT_DUMMY = 0,
  FT_BOOT_FUNC_1,
  FT_BOOT_FUNC_2,

  FT_LAST
  };

extern code int (*root_func_tab []) (int) reentrant;

#define EXT_dummy	(*root_func_tab [FT_DUMMY])
#define EXT_boot_func_1 (*root_func_tab [FT_BOOT_FUNC_1])
#define EXT_boot_func_2 (*root_func_tab [FT_BOOT_FUNC_2])


