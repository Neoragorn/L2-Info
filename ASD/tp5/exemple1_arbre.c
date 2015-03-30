#include "ArbreBinaire.h"
#include "Affichage.h"
#include <stdlib.h>

Noeud_t ajouter(value_t v, Noeud_t a)
{
  if (a == NULL)
  {
    Noeud_t tmp;
    return tmp = CreerNoeud(v);
  }
  if (v < a->val)
    a->filsgauche = ajouter(v, a->filsgauche);
  else if (v > a->val)
    a->filsdroit = ajouter(v, a->filsdroit);
  return a;
}

Noeud_t construitArbreEntierMysterieux (value_t i, value_t j)
{ 
  Noeud_t arbre, tmp;
  int	  div = 2;
  int     x =  (i + j) / div;

  arbre = CreerNoeud(x);
  while (x > i)
  {
  	arbre = ajouter(x, arbre);
  	x = ((j + i ) / 2 ) / div;
  	div *= 2; 
  }
  div = 4;
  int     z = j - (j / div);
  while (z < j)
  {
  	arbre = ajouter(z, arbre);
  	div *= 2; 
  	z = (j - (j / div));
  }
  arbre = ajouter(j, arbre);
  x = i;
  while (x != j)
  {
  	arbre = ajouter(x, arbre);
  	x++;  	
  }
  return arbre;
}

int main(void)
{

	Noeud_t arbre, tmp, tmp2, tmp3;
/*	arbre = CreerNoeud(12) ;
	tmp = CreerNoeud(9) ;
	AjouterFilsGauche(arbre,tmp);
	tmp = CreerNoeud(8) ;
	AjouterFilsDroit(arbre,tmp);
		  SauverArbreDansFichier(arbre,"exemple1"); 

	  arbre = CreerNoeud(12);
	  tmp = CreerNoeud(9);
	  AjouterAuNoeud(arbre,tmp, 'g');
	  tmp = CreerNoeud(5);
	  tmp2 = FilsGauche(arbre);
	  AjouterAuNoeud(tmp2, tmp, 'd');
	  tmp2 = FilsDroit(tmp2);
	  tmp = CreerNoeud(7);
	  AjouterAuNoeud(tmp2,tmp, 'g');
	  	  SauverArbreDansFichier(arbre,"exemple2"); 
*/



/* arbre = CreerNoeud(12);
 tmp = CreerNoeud(9);
 AjouterFilsGauche(arbre,tmp);
 tmp = CreerNoeud(8);
 AjouterFilsDroit(arbre,tmp);
 tmp3 = FilsGauche(arbre);
 tmp2 = FilsDroit(arbre);
 tmp = CreerNoeud(1);
 AjouterFilsGauche(tmp3,tmp);
 tmp = CreerNoeud(5);
 AjouterFilsDroit(tmp3,tmp);
 tmp = CreerNoeud(4);
 AjouterFilsDroit(tmp2, tmp);
 tmp = CreerNoeud(7);
 tmp2 = FilsDroit(tmp2);
 AjouterFilsGauche(tmp2, tmp);
 tmp = CreerNoeud(6);
 AjouterFilsDroit(tmp2, tmp);
 SauverArbreDansFichier(arbre,"exemple3"); */

/*   arbre = CreerNoeud(6);
   tmp = CreerNoeud(4);
   AjouterFilsGauche(arbre,tmp);
   tmp = CreerNoeud(2);
   tmp2 = FilsGauche(arbre);
   AjouterFilsGauche(tmp2, tmp);
   tmp3 = FilsGauche(tmp2);
   tmp = CreerNoeud(7);
   AjouterFilsDroit(arbre, tmp);
   tmp = CreerNoeud(5);
   AjouterFilsDroit(tmp2, tmp);
   tmp = CreerNoeud(1);
   AjouterFilsGauche(tmp3, tmp);
    SauverArbreDansFichier(arbre,"exemple4");*/

   arbre = construitArbreEntierMysterieux(1, 100);
   SauverArbreDansFichier(arbre,"exemple5");
	return 0 ;
}
