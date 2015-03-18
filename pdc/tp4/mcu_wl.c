#include  <stdlib.h>
#include <stdio.h>
#include <string.h>

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
  i = readl(line);
  while (i != -1)
  {
    nb_line++;
    i = readl(line);
  }
  if (nb_line == 0)
    printf("0\n");
  else
    printf("%d\n", nb_line);
  return 0;
}