/*
** ex_19.c for ex in /home/casier_s/pdc/tp2
**
** Made by sofian casier
** Login   <casier_s@epitech.net>
**
** Started on  lun. janv.  26 23:09:56 2015 sofian casier
** Last update mar. janv.  27 12:47:00 2015 sofian casier
*/

#include <stdio.h>
#include "mcu_macros.h"

int		mcu_wc()
{
	int		i;
	char	c;

	i = 0;
	while (1)
	{
		c = getchar();
		if (c == EOF)
			break;
		i++;
	}
	printf("%d\n", i);
	return 0;
}

int		main()
{
	return (mcu_wc());
}