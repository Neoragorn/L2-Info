#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include "ArbreBinaire.h"

#define max(a,b) ((a)>(b)?(a):(b))

int   cpt = 0;
/* Manipulation d'arbres binaires */

Noeud_t arbre1 (void)
{
   Noeud_t arbre,tmp;

   arbre = CreerNoeud(12) ;
   tmp = CreerNoeud(9) ;
   AjouterFilsGauche(arbre,tmp);
   tmp = CreerNoeud(8) ;
   AjouterFilsDroit(arbre,tmp);
   return arbre;
}

Noeud_t arbre2 (void)
{
  Noeud_t arbre, tmp, tmp2;

  arbre = CreerNoeud(12);
  tmp = CreerNoeud(9);
  AjouterAuNoeud(arbre,tmp, 'g');
  tmp = CreerNoeud(5);
  tmp2 = FilsGauche(arbre);
  AjouterAuNoeud(tmp2, tmp, 'd');
  tmp2 = FilsDroit(tmp2);
  tmp = CreerNoeud(7);
  AjouterAuNoeud(tmp2,tmp, 'g');
  return arbre;
}

Noeud_t arbre3 (void)
{
 Noeud_t arbre, tmp, tmp2, tmp3;

 arbre = CreerNoeud(12);
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
 return arbre;
}

void imprimer(Noeud_t a)
{
   if (a != NULL)
   {
    imprimer(FilsGauche(a));
    printf("%d\n", (int)ValeurDuNoeud(a));
    imprimer(FilsDroit(a));
   }
}

int taille (Noeud_t a)
{
   if (EstVide(a) == -1)
      return 0;
   else if (EstFeuille(a))
      return 1;
   else
      return (taille(FilsGauche(a)) + 1 + taille(FilsDroit(a)));
}

int hauteur (Noeud_t a)
{
   if (a == NULL)
      return -1;
   else
      return (1 + max(hauteur(FilsGauche(a)), hauteur(FilsDroit(a))));
}

int nbFeuilles(Noeud_t a)
{
   if (a == NULL)
      return 0;
   else if (EstFeuille(a))
      return 1;
   else
     return (nbFeuilles(FilsGauche(a)) + nbFeuilles(FilsDroit(a)));
}


/* Comptage d'arbres */

int nbArbres(int n)
{
   if (n == 0 || n == 1)
   return 1;
   else
   {
      int sum = 0;
      int left = 0;
      int right = 0;
      int k;
      for (k = 1; k <= n; k++)
      {
         left = nbArbres(k - 1);
         right = nbArbres(n - k);
         sum += left * right;
      }
      return (sum);
   }
}

void nbArbres_iteratif(int n)
{
   int  i;
   int  k;
   int  *tab;

   tab = malloc(sizeof(int) * (n + 1));
   i = 1;
   tab[0] = 1;
   printf("Resultat du calcul iteratif : %d\n", tab[0]);
   while (i != n)
   {
     k = 0;
     tab[i] = 0;
     while (k < i)
     {
      tab[i] = tab[i] + tab[k] * tab[(i - k - 1)];
      k++;
    }
    printf("Resultat du calcul iteratif : %d\n", tab[i]);
    i++;
  }
} 

/* Manipulation d'arbres binaires de recherche */

Noeud_t abr1 ()
{
   Noeud_t arbre,tmp, tmp2, tmp3;

   arbre = CreerNoeud(6);
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
   return arbre;
}

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

Noeud_t abr2 (void)
{
  Noeud_t arbre;

  arbre = CreerNoeud(5);
  arbre = ajouter(4, arbre);
  arbre = ajouter(2, arbre);
  arbre = ajouter(7, arbre);
  arbre = ajouter(6, arbre);
  arbre = ajouter(1, arbre);
  return arbre;
}

Noeud_t abr3 (void)
{
  Noeud_t arbre;

  arbre = CreerNoeud(7);
  arbre = ajouter(1, arbre);
  arbre = ajouter(4, arbre);
  arbre = ajouter(5, arbre);
  arbre = ajouter(6, arbre);
  arbre = ajouter(2, arbre);
  return arbre;
}

int appartient (value_t v, Noeud_t a)
{
  cpt += 1;
  if (a == NULL)
    return -1;
  if (v == a->val)
    return 1;
  if (v < a->val)
    return appartient(v, a->filsgauche);
  if (v > a->val)
    return appartient(v, a->filsdroit);
  return -1;
}

int valeur_minimale (Noeud_t abr)
{
  Noeud_t tmp = malloc(sizeof(Noeud_t*));
  while (abr != NULL)
  {
    tmp = abr;
    abr = abr->filsgauche;
  }
   return tmp->val;
}

int valeur_maximale (Noeud_t abr)
{
 Noeud_t tmp = malloc(sizeof(Noeud_t*));
  while (abr != NULL)
  {
    tmp = abr;
    abr = abr->filsdroit;
  }
   return tmp->val;
}

/* Entier mysterieux */

Noeud_t construitArbreEntierMysterieux (value_t i, value_t j)
{ 
  Noeud_t arbre;
  int   div = 2;
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

void jouer (int n)
{
  Noeud_t arbre;
  srand(time(NULL));
  int     nb_alea = rand()%(n - 1) + 1;
  int     cpt = 0;
  int     div = 2;

  printf("Nombre choisi : %d\n", nb_alea);
  arbre = construitArbreEntierMysterieux(0, n);
  n = n / div;
  while (arbre)
  {
    if (arbre->val == nb_alea)
    {
      printf("Chiffre trouvé ! : %d\n", (int)arbre->val);
      printf("Nbr de tours : %d\n", cpt);
      return;
    }
    if (nb_alea < arbre->val)
      arbre = arbre->filsgauche;
    if (nb_alea > arbre->val)
      arbre = arbre->filsdroit;
    div += 2;
    n = n / div;
    cpt++;
  }
  return;
}

/* Tests sur les arbres binaires */

void testArbreBinaire(Noeud_t a) {
   imprimer(a); printf("\n");
   printf("Taille     = %d\n",(taille(a)));
   printf("Hauteur    = %d\n",(hauteur(a)));
   printf("nbFeuilles = %d\n",(nbFeuilles(a))); 
}

/* Tests sur les arbres binaires de recherche */
void testABR (Noeud_t a) {
   int i;
   imprimer(a); printf("\n");
   printf("Taille     = %d\n",(taille(a)));
   printf("Hauteur    = %d\n",(hauteur(a)));
   printf("nbFeuilles = %d\n",(nbFeuilles(a)));
   printf("Valeurs présentes dans l'arbre :\n");
   for (i = 0; i <= 10; i++)
   {
    if (appartient(i,a) == 1)
       printf("chiffre trouve : %d cmp : %d\n",i, cpt);
     else
     printf("chiffre non trouve : %d Cmp: %d\n",i , cpt);
     cpt = 0;
   }
   printf("Valeur minimale : %d\n", valeur_minimale(a));
   printf("Valeur maximale : %d\n", valeur_maximale(a));
   printf("\n");
}
  
/* Programme principal */
int main (int argc, char **argv)
{
  int	i;

   testArbreBinaire(arbre1());
   testArbreBinaire(arbre2());
   testArbreBinaire(arbre3());
   for (i = 0; i <= 19; i++) {
      printf("Le nombre d'arbres à %d noeuds est %d\n",i,(nbArbres(i))); 
   }
   printf("\n\n\n"); 
   nbArbres_iteratif(19);
   testABR(abr1());
   testABR(abr2());
   testABR(abr3());

   printf("Arbre mysterieux entre 12 et 24:\n");
   imprimer(construitArbreEntierMysterieux(12,24));
   printf("\n");
  
   jouer(100);
   return 0;   
}
