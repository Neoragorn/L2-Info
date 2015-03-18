
#ifndef MCU_AFFICHE_ENTIER_H_
# define MCU_AFFICHE_ENTIER_H_

#include "mcu_macros.h"

void affiche_entier(int ent)
{
  int tmp;
  int i;
  int tab[3];

  i = 0;
  while (ent != 0)
    {
      tmp = ent % 10;
      tmp = tmp + '0';
      tab[i] = tmp;
      ent = ent / 10;
      i++;
    }
  i--;
  while (i >= 0)
    {
      putchar(tab[i]);
      i--;
    }
}

#endif /* MCU_AFFICHE_ENTIER_H_ */