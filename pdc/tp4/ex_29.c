#include "ex_29.h"

int       check_mot(int mot, int mot2)
{
  if (mot == -1)
  {
    printf("Mot 1 inexistant dans le dictionnaire\n");
    return -1;
  }
  if (mot2 == -1)
  {
    printf("Mot 2 inexistant dans le dictionnaire\n");
    return -1;
  }
  return 0;
}

int       check_argv(char **argv, int argc)
{
  if (argc != 3)
  {
    printf("Argument 1 et 2 necessaires pour lancer le programme\n");
    return (-1);
  }
  if (strlen(argv[1]) != 4 || strlen(argv[2]) != 4)
  {
   printf("Erreur. Les mots doivent être de longueur 4\n");
    return -1;
  }
  return 0;
}

int compar(void const *a, void const *b)
{
   char const *const *pa = a;
   char const *const *pb = b;
 
   return strcmp (*pa, *pb);
}

int rechercheDicho(char **dico_trie, int nbMots, char *mot)
{
    int i = 0;      
    int j = nbMots; 
    int k = 0;      
    int trouve = 1 ;
 
    while ((trouve == 1) && (i <= j))
    {
         k = (i + j) / 2;
         if (strcmp (dico_trie[k], mot) == 0) 
             trouve = 0;
         if (strcmp (dico_trie[k], mot) > 0)
             j = k - 1;
         else
           i = k + 1; 
    }
    if (trouve == 0)
        return (i);
    else
        return (-1);  
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
     int i;

     i = rechercheDicho(dico_trie, TAILLE_DICO, mot);
     if (i == -1)
      return -1;
     return i - 1;
}

void      afficher_mot(MatriceAdjacence_t mat, int mot)
{
     int       i;
     int       y;

     i = 0;
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
  int   i;

  i = 0;
  if (sommetcourant == sommetdestination)
    return 0;
  while (i != TAILLE_DICO)
  {
    if (mat[sommetcourant][i] == 1 && dejaparcouru[i] != 1)
    {
      empiler(parcours, i);
      dejaparcouru[i] = 1;
      if (chemin(i, sommetdestination, mat, parcours, dejaparcouru) == 0)
        return 0;
      else
        depiler(parcours);
    }
    i++;
  }
  return 1;
}

void       remplir_parcouru(int *str)
{
  int       i;

  i = 0;
  while (i != TAILLE_DICO)
  {
    str[i] = 0;
    i++;
  }
}

void      afficherParcours(Pile_t *pile)
{
  if (pile == NULL)
  {
    exit(EXIT_FAILURE);
  }
  Element *actuel = pile->premier;
  printf("chemin => ");
  while (actuel != NULL)
    {
      printf("%s <- ", dico[actuel->nombre]);
      actuel = actuel->suivant;
    }
}

int 		  main(int argc, char **argv)
{
  if (check_argv(argv, argc) == -1)
     return (-1);
  MatriceAdjacence_t mat; 
  int   mot;
  int   mot2;
  int   tab[TAILLE_DICO];
  
  qsort(dico, sizeof(dico) / sizeof(*dico), sizeof(*dico), compar);
  CreeMatriceAdjacence(mat);
  mot = ConvertionMotIndice(argv[1], dico);
  mot2 = ConvertionMotIndice(argv[2], dico);
  if (check_mot(mot, mot2) == -1)
    return -1;
 // afficher_mot(mat, mot);
  //afficher_mot(mat, mot2);
  Pile_t *pile = initialiser();
  empiler(pile, mot);
  remplir_parcouru(tab);
  chemin(mot, mot2, mat, pile,tab); 
  afficherParcours(pile);
  return 0;
}