/*
** ex_23.c for 23 in /home/casier_s/pdc/tp2
**
** Made by sofian casier
** Login   <casier_s@epitech.net>
**
** Started on  mer. janv.  28 16:21:31 2015 sofian casier
** Last update Sun Mar 15 22:29:51 2015 sofian casier
*/

#include <stdlib.h>
#include <stdio.h>
#define TABSIZE 1000

int		main()
{
	int	alea;
	int tab[TABSIZE];
	int	i;

	i = 0;
	srand(time(NULL));
	while (i != TABSIZE)
	{
		alea = ((rand()% RAND_MAX));
		tab[i] = alea;
		printf("%d\n", tab[i]);
		i++;
	}
	return (1);
}
