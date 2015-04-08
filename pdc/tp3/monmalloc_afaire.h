#include <stdlib.h>

#define USS(a) (((char *)((a)->userspacestop))-((char *)((a)->userspacestart))) 

void inserer(liste_t*, liste_t) ;
liste_t extraire(liste_t *, unsigned int) ;

/*#ifndef MONMALLOC_AFAIRE_H_
# define MONMALLOC_AFAIRE_H_



#endif /* MONMALLOC_AFAIRE_H_ */
