#include  <stdlib.h>
#include <stdio.h>

#include "mcu_fatal.h"
#include "mcu_macros.h"
#include "mcu_readl.h"

int   mcu_wl()
{
  int   nb_line;
  int   i;
  int line[MAXLINE + 1] ;

  i = 0;
  nb_line = 0;
  while (i != -1)
  {
    i = readl(line);
    if (i == -1 && line[0] == 0)
    {
      printf("0\n");
      return 0;
    }
    nb_line++;
  }
  printf("%d\n", nb_line);
  return 0;
}

int   main()
{
  return (mcu_wl());
}
