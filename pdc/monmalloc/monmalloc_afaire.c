#include "monmalloc_infra.h"
#include "monmalloc_afaire.h"

/*Version recursive*/

void inserer(liste_t *list, liste_t cell)
{	
	if (*list == NULL)
	{
		*list = cell;
		return;
	}
	if (USS(*list) >= USS(cell))
	{
		inserer(&(*list)->next, cell);
	return;
	}
	cell->next = *list;
	*list = cell;
	return;
}


liste_t extraire(liste_t *list, unsigned int size ) 
{
	liste_t tmp;

	if (*list == NULL)
		return 0;	
	if (USS(*list) >= size)
	{
		tmp = *list ;
		*list = (tmp)->next;
		return tmp;
	}
    extraire(&((*list)->next),size) ;
}

/* Version iterative */

/*void inserer(liste_t *list, liste_t cell)
{	
    liste_t tmp, tmp2;
    tmp = *list;
    tmp2 = *list;
    if (*list == NULL)
	{
		cell->next = NULL;
		*list = cell;
		return;
	}
	if (USS(tmp) >= USS(cell))
    {
    	cell->next = (*tmp);
    	(*tmp) = cell;
        return;
    } 
    while ((tmp->next) != NULL)
    {
    	if (USS(tmp) >= USS(cell))
            break;
        tmp2 = tmp;
        tmp = (tmp)->next;
    }
    cell->next = tmp2;
    tmp2 = cell;
}

liste_t extraire(liste_t *list, unsigned int size ) 
{
	liste_t *tmp, *tmp2;

	if (*list == NULL)
		return 0;
	*tmp = *list;
	if (USS(*tmp) >= size)
	{
		*list = (*tmp)->next;
		return *tmp;
	}
	while ((tmp) != NULL)
	{
		if (USS(*tmp) >= size)
		{
			(*tmp2)->next = (*tmp)->next;
			return (*tmp);
		}
		*tmp2 = *tmp;		
		(*tmp) = (*tmp)->next;
	}
	return 0;
} */
