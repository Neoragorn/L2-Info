#include "mcu_macros.h"
#include <stdio.h>

int	readl(int line[])
{
  int		i;
  int		c;

  i = 0;
  c = 0;
  while (1)
    {
      fatal(i>MAXLINE,"buffer overload",3) ;    
      c = getchar();
      if ((c=='\n') || (c == EOF))
        break;
      line[i] = c;      
      i++;
    }
    line[i] = 0;
  if (c == EOF)
    return EOF;
  else
    return (i);
}
