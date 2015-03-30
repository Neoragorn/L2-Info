#include "monmalloc_infra.h"
#include "monmalloc_afaire.h"

void inserer(liste_t *list, liste_t cell)
{	
	liste_t *tmp = NULL;

	if (sizeof((*list)->userspacestop) - (sizeof((*list)->userspacestart))
		>= (sizeof(cell->userspacestop)) - (sizeof(cell->userspacestart)))
		printf("j'insere de suite\n");
	else
	{
		tmp = list;
		(*list) = (*list)->next;
		while ((*list)->next != NULL)
		{
			if (sizeof((*list)->userspacestop) - (sizeof((*list)->userspacestart))
				>= (sizeof(cell->userspacestop)) - (sizeof(cell->userspacestart)))
			{
				printf("j'insere là");
				break;
			}
			tmp = list;
			(*list) = (*list)->next;
		}
	}
}

liste_t extraire(liste_t *list, unsigned int size ) 
{
	while ((*list)->next != NULL)
	{
		if (sizeof((*list)->userspacestop) - (sizeof((*list)->userspacestart)) >= size)
			return (*list);
		(*list) = (*list)->next;
	}
	return 0;
}