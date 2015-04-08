#include "arbrebinaire.h"
int		main(int argc, char **argv)
{
	if (argc != 2)
	{
		printf("Need a filename as a first argument\n");
		return -1;
	}
	open_file(argv[1]);
	return 0;
}