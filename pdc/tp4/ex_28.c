#include <stdio.h>
#include <stdlib.h>
#include "mcu_macros.h"
#include "mcu_readl.h"

int mot = 0;
int carac = 0;
int ligne = 0;

void		check_wc(char *str)
{
	if (strcmp(str, "-l") == 0)
		mcu_wl();
	else if (strcmp(str, "-c") == 0)
		mcu_wc();
	else if (strcmp(str, "-w") == 0)
		mcu_ww();
	else
	{
		printf("wc: illegal option -- %c", str[1]);
		printf("\nusage: wc [-clw]\n");
	}
}

void		mcu_wc_all()
{
	int     i;
    int     y;
    int    str[MAXLINE + 1];
    int 	x;

    x = 0;
    while (x != -1)
    {
        x = readl(str);
        i = 0;
        y = 0;
        while (str[i] == ' ' && str[i] == '\t' && str[i] == ',' && str[i])
            i++;
        while (str[i] != '\0')
        {
            if (str[i] == ' ' && (str[i + 1] != ' ' && str[i + 1] != '\t' && str[i + 1] != ',' && str[i + 1] != '.'))
                y++;
            else if (str[i] == ',' && (str[i + 1] != ' ' && str[i + 1] != '\t' && str[i + 1] != ',' && str[i + 1] != '.'))
                y++;
            else if (str[i] == '-' && (str[i + 1] != ' ' && str[i + 1] != '\t' && str[i + 1] != ',' && str[i + 1] != '.'))
                y++;
            else if (str[i] == '.' && (str[i + 1] != ' ' && str[i + 1] != '\t' && str[i + 1] != ',' && str[i + 1] != '.'))
                y++;
            else if (str[i] != ' ' && str[i] != '.' && str[i] != '\t' && str[i] != '-' && str[i] != ',' && str[i + 1] == '\n')
                y++;
            else if (str[i] != ' ' && str[i] != '.' && str[i] != '\t' && str[i] != '-' && str[i] != ',' && str[i + 1] == '\0')
                y++;
            i++;
        }
        carac += i;
        mot += y;
        ligne += 1;
    }
    ligne -= 1;
    if (ligne == -1)
    	ligne = 0;
    carac += ligne;
    printf("%d %d %d\n", ligne, mot, carac);
    return;
}

int 		main(int argc, char **argv) 
{
	if (argc == 1)
		mcu_wc_all();
	else
		check_wc(argv[1]);
	return 0;
}