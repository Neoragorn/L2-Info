/*
** ex_17.c for exo17 in /home/casier_s/pdc/tp1
** 
** Made by sofian casier
** Login   <casier_s@epitech.net>
** 
** Started on  Mon Jan 26 18:49:42 2015 sofian casier
** Last update lun. janv.  26 21:44:16 2015 sofian casier
*/

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

void		decode_file(char *file)
{
	FILE*	fd;
  char  *str;
  bool  check;
  int   i;

  check = true;
  fd = fopen(file, "r");
  str = malloc(4096 * sizeof(char));
  while ((str = fgets(str, 4096, fd)) != NULL)
  {
    i = 0;
    while (str[i])
    {
      if (str[i + 1])
      {
        if (str[i] == '/' && str[i + 1] == '*')
          check = false;
        if (str[i] == '*' && str[i + 1] == '/')
        {
          check = true;
          i = i + 2;
        }
      }
      if (check == true && str[i] != '\n')
        printf("%c", str[i]);
      if (str[i])
        i++;
    }
    printf("\n");
  }
  fclose(fd);
}
	
int		main(int argc, char **argv)
{
  decode_file(argv[1]);
  return (1);
}
  