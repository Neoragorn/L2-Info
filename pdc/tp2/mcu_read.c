#include "mcu_macros.h"

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
      i++;
      if ((c=='\n') || (c == EOF))
        break;
      line[i] = c;      
    }
    line[i] = 0;
/*  if (line[i - 1] == '\n') 
    line[i - 1] = '\0';
  else
    line[i] = '\0'; */
  if (c == EOF)
    return EOF;
  else
    return (i);
}
