#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 
#define LEN 10
 
void affiche(int *tab, size_t sz)
{
    int i;

    for (i = 0; i < sz; i++)
        printf("%d ", tab[i]);
    putchar('\n');
}

int compar(const void *n1, const void *n2)
{
      char *a = (char*)n1;
      char *b = (char*)n2;

      return (strcmp(a, b));
}

void my_swap(void *gauche, void *droite, size_t size)
{
    char tmp;
    char *p;
    char *q;
 
    p = gauche;
    q = droite;
    while (size)
    {
        tmp = *p;
        *p = *q;
        *q = tmp;   
        p++;
        q++;
        size--;
    }
}
 
void quicksort(void *base, int nelem, int size, int (*compar)(const void *elem1, const void *elem2))
{
    void *pivot = base;
    void *fin = (char *) base + (size - 1) * nelem;
    void *gauche = base;
    void *droite = fin;
     
    if (base >= fin)
        return;
    while (gauche < droite) 
    {
        while (gauche < droite && compar(pivot, droite) < 0)
            droite = droite - nelem;
        my_swap(gauche, droite, nelem);
        pivot = droite;
         
        while (gauche < droite && compar(pivot, gauche) >= 0)
            gauche = gauche + nelem;
        my_swap(gauche, droite, nelem);
        pivot = gauche;
    }
    quicksort(base, nelem, (gauche - base) / nelem, compar);
    quicksort(gauche + nelem, nelem, (fin - gauche) / nelem, compar);
}
 
int main(void)
{
    int tab[LEN] = { 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 };

    affiche(tab, LEN);
    quicksort(tab, sizeof(int), LEN, compar);
    affiche(tab, LEN);
    return EXIT_SUCCESS;
}