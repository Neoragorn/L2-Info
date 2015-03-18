#include <stddef.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "mcu_readl.h"
#include "mcu_macros.h"
#include "mcu_fatal.h"

int     offset = 10;
int     check = 0;

int     mcu_xxd()
{
  int   i;
  int   y;
  int   x;
  int   z;
  int   line[MAXLINE + 1] ;

  y = 0;
   x = 0;
  z = 0;
  i = readl(line);
  fatal(i > MAXLINE,"buffer overload",3);
  while (line[y])
  {
    if (x == 16)
    {
      while (line[z])
      {
        printf("%c", line[z]);
        z++;
      }
      printf("\n");
      printf("%d\t", offset);
      offset += 10;
      z = 0;
      x = 0;
    }
    printf("%x", line[y]);
    y++;
    x++;
    check++;
    if (check % 2 == 0)
      printf(" ");
  }
  if (i== EOF)
  {
    printf("\t");
    while (line[z])
    {
      printf("%c", line[z]);
      z++;
    } 
  }
    return i;
}

int   main()
{
  int stop;

  stop = 0;
  printf("0000000\t");
  while (stop != -1)
    {
       stop = mcu_xxd();
    }
    putchar('\n');
  return 0;
}