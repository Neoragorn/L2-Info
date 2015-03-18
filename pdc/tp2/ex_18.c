#include "mcu_macros.h"

int main (void)
{
	int line[MAXLINE + 1] ;
	int i,j ;

	i = readl(line) ;
	j=0 ;
	while(line[j]) putchar(line[j++]) ;
	putchar('\n') ;
	affiche_entier(i) ;
	putchar('\n') ;
	fatal(1==1,"1==1 is true\n",2) ;
	return 0;
}
