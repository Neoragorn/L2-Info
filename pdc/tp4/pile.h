#ifndef PILE_H_
# define PILE_H_

#include <stdlib.h>

typedef struct Pile_s
{
     int            valeur;
     struct Pile_s    *prec;
} Pile_t;


#endif /* PILE_H_ */