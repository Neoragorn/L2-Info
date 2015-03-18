/*
** ex_25.c for exo 25 in /home/casier_s/pdc/tp2
**
** Made by sofian casier
** Login   <casier_s@epitech.net>
**
** Started on  mer. janv.  28 18:22:22 2015 sofian casier
** Last update ven. mars  13 23:09:28 2015 sofian casier
*/

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
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
	char	nationality[30];
	char	gender;
}	t_nomine;

int		ConstruireTableaux(t_nomine *nomi)
{
	int		i;
	char	tmp[500];
	char	*token;

	i =  0;
	while (fgets(tmp, sizeof(tmp), stdin) && i != MAXTAB)
	{
		token = strtok(tmp, ",");
		nomi[i].nobel_date = atoi(token);
		token = strtok(NULL, ",");
		nomi[i].domain = atoi(token);
		token = strtok(NULL, ",");
		strcpy(nomi[i].name, token);
		token = strtok(NULL, ",");
		nomi[i].day = atoi(token);
		token = strtok(NULL, ",");
		nomi[i].month = atoi(token);
		token = strtok(NULL, ",");
		nomi[i].year = atoi(token);
		token = strtok(NULL, ",");
		if (token == NULL)
			strcpy(nomi[i].nationality, "Unknown");
		else
			strcpy(nomi[i].nationality, token);
		token = strtok(NULL, ",");
		/* le token renvoyé par strtok étant un char*, j'ai été obligé
		de mettre différentes conditions pour pouvoir remplir un simple
		char au lieu d'un char* pour le genre. */
		if (token == NULL)
			nomi[i].gender = '\0';
		else if (strcmp(token,"M\n") == 0)
			nomi[i].gender = 'M';
		else if (strcmp(token, "F\n") == 0)
			nomi[i].gender = 'F';
		else
			nomi[i].gender = 'O';
		i++;
	}
	return (i);
}

int	CompareNomineParDateDeNaissance(t_nomine *nomi1, t_nomine *nomi2)
{
	if (nomi1->day == nomi2->day
		&& nomi1->month == nomi2->month
	&& nomi1->year == nomi2->year)
		return 0;
	if (nomi1->year > nomi2->year)
	{
		if (nomi1->month > nomi2->month)
		{
			if (nomi1->day > nomi2->day)
				return 1;
			return 1;
		}
		return 1;
	}
	return -1;
}

int	main() 
{
	int	i;

	t_nomine tab[MAXTAB];

	i = ConstruireTableaux(tab);
	printf("Nbr de celulles créees : %d\n", i);

	i = CompareNomineParDateDeNaissance(&(tab[0]), &(tab[0]));
	printf ("Comparaison entre une même cellule => %d\n\n", i);	

	i = CompareNomineParDateDeNaissance(&(tab[0]), &(tab[1]));
	printf("Date de Naissance Cellule 0 => %d %d %d\n", tab[0].day, tab[0].month, tab[0].year);
	printf("Date de Naissance Cellule 1 => %d %d %d\n", tab[1].day, tab[1].month, tab[1].year);
	printf ("Comparaison des dates entre les cellules [0] et [1] => %d\n\n", i);

	i = CompareNomineParDateDeNaissance(&(tab[1]), &(tab[2]));
	printf("Date de Naissance Cellule 1 => %d %d %d\n", tab[1].day, tab[1].month, tab[1].year);
	printf("Date de Naissance Cellule 2 => %d %d %d\n", tab[2].day, tab[2].month, tab[2].year);
	printf ("Comparaison entre cellule [2] et cellule [1] est %d\n", i);
}
