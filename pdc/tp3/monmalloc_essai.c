#include <stdio.h>
#include "monmalloc.h"


int main(void)
{
	void *tmp ;
	int i;
	char c = 'a';
	tmp = monmalloc(100);
	return 0 ;
}
	
