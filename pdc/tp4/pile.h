#ifndef PILE_H_
# define PILE_H_

#include <stdio.h>
#include <stdlib.h>


typedef struct Element Element;
struct Element
{
    int nombre;
    Element *suivant;
};

typedef struct Pile_s
{
    Element *premier;
}Pile_t;


Pile_t* initialiser(void);

#endif /* PILE_H_ */