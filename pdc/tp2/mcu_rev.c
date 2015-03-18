#include "mcu_macros.h"
#include "mcu_fatal.h"
#include "mcu_readl.h"
#include "string.h"
#include "stdio.h"

int   mcu_rev()
{
  int   i;
  int   j;
  int   x;
  int line[MAXLINE + 1] ;

  i = readl(line);
  j = i - 1;
  if (i == -1)
    j = strlen((char*)line);
  fatal(i > MAXLINE,"Error",1);
  while (line[j])
  {
    putchar(line[j]);
    j--;
  }
  return i;
}

int   main()
{
  int stop;

  stop = 0;
  while (stop != -1)
  {
      if (stop != 0)
        putchar('\n');
      stop = mcu_rev();
    }
  return 0;
}
