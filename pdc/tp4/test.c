/*
** test.c for test in /home/casier_s/pdc/tp4
** 
** Made by sofian casier
** Login   <casier_s@epitech.net>
** 
** Started on  Tue Mar 17 14:08:49 2015 sofian casier
** Last update Tue Mar 17 14:14:32 2015 sofian casier
*/

int       comparer_mot_dico(char *str1, char *str2)
{
  int  i;
  int  check;

  i = 0;
  check = 0;
  while (str1[i])
    {
      if (str1[i] != str2[i])
	check++;
      i++;
    }
  if (check != 1)
    return 0;
  return 1;
}

int main()
{
  char str[] = "fiom";
  char str2[] = "pion";
  printf("%d\n", comparer_mot_dico(str, str2));
  printf("str normal : %d\n", strcmp(str, str2));
}
