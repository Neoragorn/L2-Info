//exo 15

#include <stdlib.h>
#include <stdio.h>

/*Je n'ai pas compris exactement ce qu'était la clé de chiffrement dans l'exercice.
  J'ai donc mis une valeur à 42, faute de savoir, pour l'encrypter/decrypter  */

int	main()
{
  FILE*	fd;
  char	c;
  int	key;

  fd = fopen("crypto2.txt", "r");
  key = 42;
  if (fd != NULL)
    {
      while ((c = fgetc(fd)) != EOF)
	{
	  c = c^key;
	  putchar(c);
	}
    }
  else
    printf("Error on file texte.txt\n");  
  fclose(fd);
}
