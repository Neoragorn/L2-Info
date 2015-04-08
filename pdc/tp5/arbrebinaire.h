#ifndef ARBREBINAIRE_H_
# define ARBREBINAIRE_H_

typedef struct noeud_m
{
	int		val;
	char	letter;
	struct node *left;
	struct node *right;
}			noeud_t;

typedef struct arbrebinaire_s
{
	noeud_m		*arbre;
}			arbrebinaire_t;

#endif /* ARBREBINAIRE_H_ */