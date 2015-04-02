#include "monmalloc_infra.h"
#include "monmalloc_afaire.h"

void inserer(liste_t *list, liste_t cell)
{	
	while ((*list) != NULL)
	{
		if ((char*)((*list)->userspacestop) - ((char*)((*list)->userspacestart))
			>= ((char*)(cell->userspacestop)) - ((char*)(cell->userspacestart)))
			break;
		(*list) = (*list)->next;
	}
	cell->next = *list;
	*list = cell;
}

liste_t extraire(liste_t *list, unsigned int size ) 
{
	while ((*list) != NULL)
	{
		if ((char*)(*list)->userspacestop
			- (char*)(*list)->userspacestart >= size)
			return (*list);
		(*list) = (*list)->next;
	}
	return 0;
}