#include <stdio.h>
#include <stdlib.h>

void	open_file(char *file)
{
	FILE	*fd;
	char	*line;

	if ((fd = fopen(file, "r")) == NULL)
	{
		printf("Error on file");
		exit(-1);
	}
	if ((line = malloc(sizeof(char) * 4096)) == NULL)
		exit(-1);
	while (fread(line, sizeof(line), 4096, fd))
		printf("%s", line);
	rewind(fd);
	putchar('\n');
	while (fread(line, sizeof(line), 4096, fd))
		printf("%s", line);
	putchar('\n');
	fclose(fd);
}

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