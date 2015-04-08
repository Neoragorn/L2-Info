/*
** ex_24.c for exo 24 in /home/casier_s/pdc/tp2
**
** Made by sofian casier
** Login   <casier_s@epitech.net>
**
** Started on  mer. janv.  28 16:39:08 2015 sofian casier
** Last update Wed Apr  8 12:07:38 2015 sofian casier
*/

#include <time.h>
#include <stdlib.h>
#include <stdio.h>
#define TABSIZE 100

void *monmalloc(int);

void swap(int *a, int *b)
{
    int tmp = *a;

    *a = *b;
    *b = tmp;
}


int		*create_tab(int alea)
{
	int *tab;
	int	i;
	int	nb;

	(tab) = monmalloc(alea * sizeof(int));
	i = 0;
	while (i != alea)
	{
		nb = ((rand()));
		tab[i] = nb;
		i++;
	}
	return (tab);
}

void quickSort(int* a, int lim, int nelem)
{
	int pivot;
	int i;
	int j;

	if (lim >= nelem)
		return;
	pivot = a[nelem];
	i = lim - 1;
	j = nelem;
	while (i < j)
	{
		while (a[++i] < pivot);
		while (j >= lim && a[--j] > pivot);
		if (i < j)
			swap(&a[i],&a[j]);
	}
	swap(&a[i], &a[nelem]);
	quickSort(a, lim, i-1);
	quickSort(a, i+1, nelem);
}

void quicksort_int(int *tab, unsigned int nelem)
{
	quickSort(tab, 0, nelem);
}


int mycompar(const void* a, const void *b)
{
  int *aa = (int*) a ; int *bb =(int*)b ;
  return *aa>*bb ;
}

int	main()
{
	int		*tab;
	int		alea;
	int		i;

	i = 0;
	srand(time(NULL));
	alea = rand() % TABSIZE;
	alea = 100 ;
	tab = create_tab(alea);
	qsort(tab, alea,sizeof(int),mycompar);
	while (i != alea)
	{
		printf("%d\n", tab[i]);
		i++;
	}
	return (1);
}
