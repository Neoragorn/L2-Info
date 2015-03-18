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
    int x = 0;

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
        variable += y;
    }
    printf("%d\n", variable);
    return x;
}