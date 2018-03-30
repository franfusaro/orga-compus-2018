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
    char** result    = 0;
    size_t count     = 0;
    char* tmp        = a_str;
    char* last_comma = 0;
    char delim[2];
    delim[0] = a_delim;
    delim[1] = 0;

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

    /* Add space for trailing token. */
    count += last_comma < (a_str + strlen(a_str) - 1);

    /* Add space for terminating null string so caller
       knows where the list of returned strings ends. */
    count++;

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
    char* nroImg = strdup(nro);
	char** nroSpliteado;
	if (stringContainsChar(nroImg, "+") == 0)
	{
		nroSpliteado = str_split(nroImg,'+');
	}
	else if (stringContainsChar(nroImg, "-") == 0)
	{
		nroSpliteado = str_split(nroImg,'-');
	}
	if (nroSpliteado){
		nro_img->real = strtold(*(nroSpliteado), NULL);
		nro_img->img = strtold(*(nroSpliteado + 1), NULL);
	}
	return 0;
}

int parseResolution(char* resolstr, resolution_t* resolution) {
    int width, height;
    char separator, rest;

    if (sscanf(resolstr, "%d%c%d %c", &width, &separator, &height, &rest) != 3 || width <= 0 || separator != 'x' || height <= 0){
        return ERR_INVALID_RESOLUTION;
    }

    resolution->width = width;
    resolution->height = height;
    return 0;
}

int checkForOutputPath(char* path, FILE* file){
    if (path == NULL) return ERR_VACIO; // Chequea que el path no sea nulo

    if(checkForBadCharacters(path) == -1) return ERR_INVALID_CHARS;

    if(strcmp(getFileExtension(path), ".pgm") != 0) return ERR_INVALID_FILE_TYPE;

    if (strcmp(path, "-") == 0) file = stdout; // Si el nombre del archivo es "-" se utilizara la salida estandar
    else if (!(file = fopen(path, "w"))) return ERR_INVALID_FILE_PATH;
    return 0;
}

char* getFileExtension(char *path) {
    char *ext = strrchr(path, '.');
    return (ext && ext != path) ? ext : (path + strlen(path));
}

int checkForBadCharacters(char* path){
    char bad_chars[] = "!@%^*~|";
    int i;
    for (i = 0; i < strlen(bad_chars); ++i) {
        if (strchr(path, bad_chars[i]) != NULL) {
            return -1;
        }
    }
    return 0;
}

int setValue(char* strvalue, float* value_to_set){
    float value;
    if (sscanf(strvalue,"%f",&value) != 1 || value < 0) return ERR_INVALID_PARAMETER;
    value_to_set = &value;
    return 0;
}