#include <string.h>
#include <stdio.h>

#include "mcu_macros.h"
#include "mcu_fatal.h"
#include "mcu_readl.h"

#define NMAXLINE 80
#define NMAXCHAR 100

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

void     display_tab(char str[NMAXLINE][NMAXCHAR], int x)
{
  int   i;

  i = 0;
  while (i != x)
  {
    printf("%s", str[i]);
    if (i + 1 != x)
      putchar('\n');
    i++;
  }
}

void		   msort()
{
  int   i;
  int   j;
  int 	line[NMAXCHAR + 1] ;
  int   files[NMAXLINE][NMAXCHAR];
  char  str[NMAXLINE][NMAXCHAR];
  int   x;

  x = 0;
  while (i != -1)
  {
    fatal(x > NMAXLINE, "Error on nb line\n", 1);
    j = 0;
    i = readl(line);
    fatal(i > NMAXCHAR,"Error on nb char\n",1);
    while (line[j])
    {
      str[x][j] = line[j];
      j++;
    }
    x++;
  }
  quicksort(str, NMAXCHAR, x - 1, compar);
  display_tab(str, x);
  return;
}

int		main()
{
  msort();
  return 0;
}