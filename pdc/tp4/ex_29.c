#include "ex_29.h"

int compar(void const *a, void const *b)
{
   char const *const *pa = a;
   char const *const *pb = b;
 
   return strcmp (*pa, *pb);
}

int rechercheDicho(char **tab, int nb_mots, char *val)
{
     int i;
     int j = TAILLE_DICO;
     int comp;
     int k;

     i = 0;
     j = nb_mots;
     while (i < j)
     {
      k = (i + j) / 2;
      comp = strcmp(val, dico[k]);
      if (comp < 0)
        j = k;
      else
        i = k + 1;
   }
   if (comp == 0)
    return(k);
  else
   return(-1);
}

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

void      CreeMatriceAdjacence(MatriceAdjacence_t mat)
{
     int       i;
     int       y;

     i = 0;
     while (dico[i])
     {
          y = 0;
          while (dico[y])
          {
            if (y != i)
              mat[i][y] = comparer_mot_dico(dico[i], dico[y]);
            y++;
          }
          i++;
     }
}

int       ConvertionMotIndice(char *mot, char *dico_trie[TAILLE_DICO])
{
     int  i;

     i = rechercheDicho(dico_trie, TAILLE_DICO - 1, mot);
     return i;
}

void      afficher_mot(MatriceAdjacence_t mat, int mot)
{
     int       i;
     int       y;

     i = 0;
     printf("mot choisi : %s\n", dico[mot]);
     while (i != TAILLE_DICO - 1)
     {
          if (mat[mot][i] == 1)
               printf("%s ", dico[i]);
          i++;
     }
     putchar('\n');

}

int       chemin(int sommetcourant, int sommetdestination, MatriceAdjacence_t mat,
                  Pile_t *parcours, int dejaparcouru[TAILLE_DICO])
{
  if (sommetcourant == sommetdestination)
    return 1;

}

int       check_argv(char **argv)
{
  if (strlen(argv[1]) != 4 || strlen(argv[2]) != 4)
    return -1;
  return 0;
}

int 		  main(int argc, char **argv)
{
  if (argc != 3)
  {
    printf("Argument 1 et 2 necessaires pour lancer le programme\n");
    return (-1);
  }
  if (check_argv(argv) == -1)
  {
    printf("Erreur. Les mots doivent être de longueur 4\n");
    return (-1);
  }
  int  mot;

  MatriceAdjacence_t mat;
  qsort(dico, sizeof(dico) / sizeof(*dico), sizeof(*dico), compar);
  CreeMatriceAdjacence(mat);
  mot = ConvertionMotIndice(argv[1], dico);
  if (mot != -1)
      afficher_mot(mat, mot);
    else
      printf("Mot inexistant dans le dictionnaire\n");
    return 0;
}