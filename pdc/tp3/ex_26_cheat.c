#include <stdio.h>
#include <stdlib.h>
//#include "generique.h"
 
void memswap(void* s1, void* s2, size_t size)
{
  char tmp;
  char* p=s1;
  char* q=s2;
 
  while (--size)
  {
    tmp = *p;
    *p = *q;
    *q = tmp;    
    ++p;
    ++q;
  }
}
 

size_t partition(void* base, size_t nmemb, size_t size, int (*compar)(const void*, const void*))
 
//base -> adresse du premier élément du tableau
//nmemb -> nombre d'éléments du tableau
//size -> taille des éléments
//compar -> pointeur vers la fonction de comparaison
 
{ 
  void *pivot = base; //pivot = premiere case
  void *fin  = (char *) base + (nmemb-1) * size; //fin = dernière case
  void *q = base;
 
    while (q < fin)
    {
      if (compar(q, fin) < 0)
      {
        memswap (pivot, q, size);
 
        pivot = (char *) pivot + size;
      }
 
      q = (char *) q + size;
 
    }
   
  memswap (pivot, fin, size);
 
  return (((char *) pivot - (char *) base) / size );
}
 
void tri (void* base, size_t nmemb, size_t size, int (*compar)(const void*, const void*))
{
   
  if (nmemb - 1 > 1u)
  {
    size_t pivot = partition(base, nmemb, size, compar);
    tri(base, pivot, size, compar);
    tri((char *)base + size * (pivot + 1u), ( nmemb - (pivot - 1u)), size, compar);
  }
}
 
void affiche(int *tableau, size_t size)
{
  int i;
   
  for (i = 0; i < size; i++)
  {
    printf("%d ", tableau[i]);
  }
}

int compar(const void* n1, const void* n2) // comparaison des éléments
{
  int* nb1 = (int*) n1;
  int* nb2 = (int*) n2;
 
  return *nb1 - *nb2;
}
 
int main(void)
{
  int t[30] = {6, 3, 1, 4,2,5};
  tri(t, 6, sizeof(int), compar);
  //qsort(t, 5, sizeof(int), compar);
  affiche(t, 6);
    return EXIT_SUCCESS;
}
 
