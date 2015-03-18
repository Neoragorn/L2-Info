//exo 14
/*

La fonction getchar attend qu'un caractère soit donné à l'entrée standard et le renvoie
comme un unsigned char

La fonction putchar prend un int en parametre et l'affiche sur la sortie standard, casté en unsigned char.
*/ 

#include <stdio.h>

int main()
{
  int	carac;

  carac = getchar();
  putchar(carac);
  putchar('\n');
  return (1);
}
