#include <stdlib.h>
#include <stdio.h>
#include "mcu_macros.h"
#include "mcu_readl.h"

int variable = 0;

int     mcu_ww(void)
{
    int     i;
    int     y;
    int    str[MAXLINE + 1];
    char    c;

    i = 0;
    c = 0;
    int x = readl(str);
    
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
    variable += y;	
    return x;
}

int main(void)
{
	int stop = 0;
    while(stop != -1)
    {
	    stop = mcu_ww();
    } 
    printf("Number of word is %d\n",variable);
	return 0;
}