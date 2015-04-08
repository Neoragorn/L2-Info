#include <stdio.h>
#include <stdlib.h>

typedef float freq_t[1<<8];

void	display_freq(freq_t tab)
{
	int	i;
	int	nb_carac;

	nb_carac = 0;
	for (i = 0;i != 1<<8; i++)
		nb_carac += tab[i];
	for (i = 0;i != 1<<8; i++)
	{
		if (tab[i] != 0)
			printf("%c : %.1f / Frequence: %f\n", i, tab[i], tab[i] / nb_carac);
	}
}

void	frequence(freq_t tab, FILE *fd)
{
	char	*line;
	char	c;
	int		i;

	if ((line = malloc(sizeof(char) * 4096)) == NULL)
		exit(-1);
	while (fread(line, sizeof(line), 4096, fd))
	{
		i = 0;
		while (line[i])
		{
			c = line[i];
			tab[c]++;
			i++;
		}
	}
}

void	open_file(char *file)
{
	FILE	*fd;
	freq_t	tab;
	int 	i;

	if ((fd = fopen(file, "r")) == NULL)
	{
		printf("Error on file");
		exit(-1);
	}
	for (i = 0; i != 1<<8;i++)
		tab[i] = 0;
	frequence(tab, fd);
	display_freq(tab);
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