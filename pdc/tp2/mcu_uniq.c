/*
** ex_21.c for sof in /home/casier_s/pdc/tp2
**
** Made by sofian casier
** Login   <casier_s@epitech.net>
**
** Started on  mar. janv.  27 12:47:19 2015 sofian casier
** Last update Tue Feb 10 21:42:10 2015 sofian casier
*/

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "mcu_readl.h"
#include "mcu_macros.h"
#include "mcu_fatal.h"

int	mcu_uniq()
{
  int line[MAXLINE + 1];
  int line2[MAXLINE + 1];
  int i,j,x = 0;

  i = readl(line);
  if (i > MAXLINE)
  	return (putc(1, stderr));
  j = readl(line2);
  while (line[x])
  	putchar(line[x++]); 
  x = 0;
  while (i != -1)
  {
    putchar('\n');
  	x = 0;
  		if (strcmp((char*)line, (char*)line2) != 0)
  		{
  			while (line2[x])
  				putchar(line2[x++]);
        putchar('\n');
  			i = readl(line);
  			j = readl(line2);
  			if (j == -1)
  			{
  				x = 0;
  				while (line[x])
  					putchar(line[x++]);
  				putchar('\n');
  			}
  		} 
  		j = readl(line2);
  		if (j == -1)
  			return 0;
  }
  return 0;
}

int		main()
{
	return (mcu_uniq());
}
