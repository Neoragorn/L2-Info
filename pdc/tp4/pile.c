#include "pile.h"

void	pile_push(Pile_t **pile, int val)
{
	Pile_t *p_new = malloc(sizeof *p_new);
	if (p_new != NULL)
	{
		p_new->valeur = val;
		p_new->prec = *pile;
		*pile = p_new;
	} 
}

int		pile_pop(Pile_t **pile)
{
	int	ret;

	ret = -1;
	if (*pile != NULL)
	{
		Pile_t *tmp = (*pile)->prec;
		ret = (*pile)->valeur;
		free(*pile), *pile = NULL;
		*pile = tmp;
	}
	return ret;
}

