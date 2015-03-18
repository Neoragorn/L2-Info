/*
** ex_25.c for exo 25 in /home/casier_s/pdc/tp2
**
** Made by sofian casier
** Login   <casier_s@epitech.net>
**
** Started on  mer. janv.  28 18:22:22 2015 sofian casier
** Last update mer. janv.  28 18:27:20 2015 sofian casier
*/

#include "mcu_readl.h"

#define MAXTAB 100

typedef struct nomine_s
{
	int		nobel_date;
	int		domain;
	char	name[50];
	int		day;
	int		month;
	int		year;
	char	*nationality;
	char	gender;
}	t_nomine;

int	ConstruireTableaux(t_nomine *nomi)
{
	int	line[200];
	int	i;
	int	x;

	x = 0;
	i = readl(line);
	while (line[x])
	{
		putchar(line[x]);
		x++;
	}
	putchar('\n');
}

int	CompareNomineParDateDeNaissance(t_nomine *nomi1, t_nomine *nomi2)
{
	if (nomi1->day == nomi2->day && nomi1->month == nomi2->month && nomi1->year == nomi2->year)
		return 0;
	else if (nomi1->day > nomi2->day && nomi1->month > nomi2->month && nomi1->year > nomi2->year)
		return 1;
	else
		return -1;
}

int	main() 
{
//	t_nomine tab[MAXTAB];
//	ConstruireTableaux(tab);
	printf("finished\n");
}