#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 
#define LEN 10
 
void affiche(int *tab, size_t sz) {
    int i;
    for (i = 0; i < sz; i++)
        printf("%d ", tab[i]);
    putchar('\n');
}
 
int compar(const void *n1, const void *n2)
{
    int *a = (int*) n1;
    int *b = (int*) n2;

    if (*a < *b)
        return -1;
    else if (*a == *b)
        return 0;
    return 1;
}

void swap_Qsort(void *gauche, void *droite, size_t size)
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
 
void quicksort(void *tab, size_t size, size_t nelem, int (*compar)(const void *arg1, const void *arg2))
{
    void *pivot = tab;
    void *fin = (char *) tab + (size - 1) * nelem;
    void *gauche = tab;
    void *droite = fin;
     
    if (tab >= fin)
        return;
    while (gauche < droite) 
    {
        while (gauche < droite && compar(pivot, droite) < 0)
            droite = droite - nelem;
        swap_Qsort(gauche, droite, nelem);
        pivot = droite;
         
        while (gauche < droite && compar(pivot, gauche) >= 0)
            gauche = gauche + nelem;
        swap_Qsort(gauche, droite, nelem);
        pivot = gauche;
         
    }     
    quicksort(tab, (gauche - tab) / nelem, nelem, compar);
    quicksort(gauche + nelem, (fin - gauche) / nelem, nelem, compar);
}
 
int main(void)
{
    int tab[LEN] = { 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 };
     
    affiche(tab, LEN);
    quicksort(tab, LEN, sizeof(int), compar);
    affiche(tab, LEN);
     
    return EXIT_SUCCESS;
}