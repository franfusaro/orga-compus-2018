#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <ctype.h>
#include <unistd.h>
#include <poll.h>
#include <errno.h>
#include <getopt.h>
#include <float.h>
#include <assert.h>
#include "funciones.h"

/* -----------------------------
	FUNCIONES AUXILIARES 
------------------------------*/	 
char** str_split(char* a_str, const char a_delim)
{
    printf("heeeeeey");

    char** result    = 0;
    size_t count     = 0;
    char* tmp        = a_str;
    char* last_comma = 0;
    char delim[2];
    delim[0] = a_delim;
    delim[1] = 0;

    printf("now got here");

    /* Count how many elements will be extracted. */
    while (*tmp)
    {
        if (a_delim == *tmp)
        {
            count++;
            last_comma = tmp;
        }
        tmp++;
    }

    printf("got here");

    /* Add space for trailing token. */
    count += last_comma < (a_str + strlen(a_str) - 1);

    /* Add space for terminating null string so caller
       knows where the list of returned strings ends. */
    count++;

    printf("and now got here");

    result = malloc(sizeof(char*) * count);

    if (result)
    {
        size_t idx  = 0;
        char* token = strtok(a_str, delim);

        while (token)
        {
            assert(idx < count);
            *(result + idx++) = strdup(token);
            token = strtok(0, delim);
        }
        assert(idx == count - 1);
        *(result + idx) = 0;
    }

    printf("about to return");
    return result;
}

int stringContainsChar(char* string, const char* ch)
{
	size_t len = strlen(string);
	size_t spn = strcspn(string, ch);
	if (len != spn){
		return 0; //si son diferentes quiere decir que lo contiene
	}
	return -1; //si no son diferentes no lo contiene
}

int parseNroImg(char* nro, nro_imaginario_t* nro_img){
	nro_img->real = 3;
	nro_img->img = 3;
	return 0;
}

int parseResolution(char* resolstr, resolution_t* resolution) {
    int width, height;
    char separator, rest;

    if (sscanf(resolstr, "%d%c%d %c", &width, &separator, &height, &rest) != 3 || width <= 0 || separator != 'x' || height <= 0){
        return -1;
    }

    resolution->width = width;
    resolution->height = height;
    return 0;
}
