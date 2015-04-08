#include <stdlib.h>
#include <stdio.h>

struct cell_m
{
  int val;
  struct cell_m *next;
}

typedef *pool_t;

pool_t initialisation()
{
  return (pool_t) NULL;
}

void push(int ptr, pool_t *p)
{
  pool_t tmp;

  tmp = malloc(sizeof(struct cell_m));
  tmp->val = ptr;
  tmp->next = *p;
  *p = tmp;
}

int	pop(pool_t *pile)
{
  int	res;
  pool_t tmp;
  
  if (pile == NULL)
    exit(-1);
  tmp = *pile;
  res = tmp->val;
  *pile = tmp->next;
  free(tmp);
  return res;
}

void display_pile(pool_t pile)
{
  int res;

  while (pile) 
    {
      res = pop(&(pile));
      printf("%d\n", res);
    }
  
}

int	main()
{
  pool_t pile;

  push((int)10,(&(pile)));
  push((int)1,(&(pile)));
  push((int)5, (&(pile)));
  push((int)4, (&(pile)));
  push((int)3, (&(pile)));

  display_pile(pile);
}
