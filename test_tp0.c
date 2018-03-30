#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include "funciones.h"
#define ANSI_COLOR_RED     "\x1b[31m"
#define ANSI_COLOR_GREEN   "\x1b[32m"
#define ANSI_COLOR_YELLOW  "\x1b[33m"
#define ANSI_COLOR_BLUE    "\x1b[34m"
#define ANSI_COLOR_MAGENTA "\x1b[35m"
#define ANSI_COLOR_CYAN    "\x1b[36m"
#define ANSI_COLOR_WHITE    "\x1b[37m"
#define ANSI_COLOR_RESET   "\x1b[0m"

void assertPropio(int condition, char* msg);

void test_chars_validos_nro_imaginario()
{
	/* TESTS PARA CONVERTIR STRING A NUMERO IMAGINARIO */
	
	/* PRIMERO TESTEAMOS LOS CASOS BASE DE COMBINACIONES DE + Y - CON NUMEROS ENTEROS */
	printf(ANSI_COLOR_YELLOW "START TESTS: String a numero imaginario con enteros.\n");
	nro_imaginario_t nroImg = parseNroImg("3+3i");
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario:" ANSI_COLOR_WHITE "3+3i\n");
	assertPropio(nroImg.real == 3, "La parte real debe ser 3");
	assertPropio(nroImg.real == 3, "La parte real debe ser 3");
	assertPropio(nroImg.img == 3, "La parte imaginaria debe ser 3");
	printf(ANSI_COLOR_GREEN "Tests OK\n");
	nroImg = parseNroImg("2-5i\n");
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario:" ANSI_COLOR_WHITE "2-5i\n");
	assertPropio(nroImg.real == 2, "La parte real debe ser 2");
	assertPropio(nroImg.img == -5, "La parte imaginaria debe ser -5");
	printf(ANSI_COLOR_GREEN "Tests OK\n");
	nroImg = parseNroImg("-2+4i");
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario:" ANSI_COLOR_WHITE "-2+4i\n");
	assertPropio(nroImg.real == -2, "La parte real debe ser -2");
	assertPropio(nroImg.img == 4, "La parte imaginaria debe ser 4");	
	printf("Tests OK\n");
	nroImg = parseNroImg("-8-4i");
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario: " ANSI_COLOR_WHITE "-8-4i\n");
	assertPropio(nroImg.real == -8, "La parte real debe ser -8");
	assertPropio(nroImg.img == -4 , "La parte imaginaria debe ser -4");
	printf(ANSI_COLOR_GREEN "Tests OK\n");
	printf("END TESTS: string a numero imaginario con entero.\n");
	
	printf("START TESTS: string a numero imaginario con decimales.\n");
	nroImg = parseNroImg("9.25+0.9i");
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario: " ANSI_COLOR_WHITE "9.25+0.9i\n");
	assertPropio(nroImg.real == 9.25, "La parte real debe ser 9.25");
	assertPropio(nroImg.img == 0.9, "La parte imaginaria debe ser 0.9");
	nroImg = parseNroImg("2.3-7.5i");
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario: " ANSI_COLOR_WHITE "2.3-7.5i\n");
	assertPropio(nroImg.real == 2.3, "La parte real debe ser 2.3");
	assertPropio(nroImg.img == -5, "La parte imaginaria debe ser -5");
	nroImg = parseNroImg("-2+4i");
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario: " ANSI_COLOR_WHITE "-2+4i\n");
	assertPropio(nroImg.real == -2, "La parte real debe ser -2");
	assertPropio(nroImg.img == 4, "La parte imaginaria debe ser 4");	
	nroImg = parseNroImg("-8-4i");
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario: " ANSI_COLOR_WHITE "-8-4i\n");
	assertPropio(nroImg.real == -8, "La parte real debe ser -4");
	assertPropio(nroImg.img == -4, "La parte imaginaria debe ser -8");
	printf("END TESTS: string a numero imaginario con decimales ");
	
}

void assertPropio(int condition, char* msg)
{
	if (!condition) {
		printf(ANSI_COLOR_RED "ASSERT ERROR: %s\n", msg);
		exit(7);
	}
}

int main(int argc, char *argv[]){
	test_chars_validos_nro_imaginario();
    return 0;
}
