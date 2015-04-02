#include <stdio.h>
#include "monmalloc.h"


int main(void)
{
	char *tmp ;
	int i;
	char c = 'a';
	tmp = monmalloc(10 * sizeof(char));
	for (i = 0; i < 25; i++)
	{
		tmp[i] = c;
		c++;
		i++;
	}

	write(1, &tmp[1111111150], 1);

	return 0 ;
}
	
