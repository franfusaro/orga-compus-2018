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
	nro_imaginario_t nroImg;
	int result = parseNroImg("3+3i",&nroImg);
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario:" ANSI_COLOR_WHITE "3+3i\n");
	assertPropio(result == 0, "El parseo devolvió negativo");
	assertPropio(nroImg.real == 3, "La parte real debe ser 3");
	assertPropio(nroImg.real == 3, "La parte real debe ser 3");
	assertPropio(nroImg.img == 3, "La parte imaginaria debe ser 3");
	printf(ANSI_COLOR_GREEN "Test OK\n");
	result = parseNroImg("2-5i",&nroImg);
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario:" ANSI_COLOR_WHITE "2-5i\n");
	assertPropio(result == 0, "El parseo devolvió negativo");
	assertPropio(nroImg.real == 2, "La parte real debe ser 2");
	assertPropio(nroImg.img == -5, "La parte imaginaria debe ser -5");
	printf(ANSI_COLOR_GREEN "Test OK\n");
	result = parseNroImg("-2+4i",&nroImg);
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario:" ANSI_COLOR_WHITE "-2+4i\n");
	assertPropio(result == 0, "El parseo devolvió negativo");
	assertPropio(nroImg.real == -2, "La parte real debe ser -2");
	assertPropio(nroImg.img == 4, "La parte imaginaria debe ser 4");	
	printf("Test OK\n");
	result = parseNroImg("-8-4i",&nroImg);
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario: " ANSI_COLOR_WHITE "-8-4i\n");
	assertPropio(result == 0, "El parseo devolvió negativo");
	assertPropio(nroImg.real == -8, "La parte real debe ser -8");
	assertPropio(nroImg.img == -4 , "La parte imaginaria debe ser -4");
	printf(ANSI_COLOR_GREEN "Test OK\n");
	printf(ANSI_COLOR_YELLOW "END TESTS: string a numero imaginario con entero. STATUS: " ANSI_COLOR_GREEN "OK\n");
	
	/* DESPUES TESTEAMOS LOS CASOS BASE DE COMBINACIONES DE + Y - CON NUMEROS DECIMALES */
	printf(ANSI_COLOR_YELLOW "START TESTS: String a numero imaginario con decimales.\n");
	result = parseNroImg("9.25+0.9i",&nroImg);
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario: " ANSI_COLOR_WHITE "9.25+0.9i\n");
	assertPropio(result == 0, "El parseo devolvió negativo");
	assertPropio(nroImg.real == 9.25, "La parte real debe ser 9.25");
	assertPropio(nroImg.img == 0.9, "La parte imaginaria debe ser 0.9");
	printf(ANSI_COLOR_GREEN "Test OK\n");
	result = parseNroImg("2.3-7.5i",&nroImg);
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario: " ANSI_COLOR_WHITE "2.3-7.5i\n");
	assertPropio(result == 0, "El parseo devolvió negativo");
	assertPropio(nroImg.real == 2.3, "La parte real debe ser 2.3");
	assertPropio(nroImg.img == -5, "La parte imaginaria debe ser -5");
	printf(ANSI_COLOR_GREEN "Test OK\n");
	result = parseNroImg("-2+4i",&nroImg);
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario: " ANSI_COLOR_WHITE "-2+4i\n");
	assertPropio(result == 0, "El parseo devolvió negativo");
	assertPropio(nroImg.real == -2, "La parte real debe ser -2");
	assertPropio(nroImg.img == 4, "La parte imaginaria debe ser 4");
	printf(ANSI_COLOR_GREEN "Test OK\n");
	result = parseNroImg("-8-4i",&nroImg);
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario: " ANSI_COLOR_WHITE "-8-4i\n");
	assertPropio(result == 0, "El parseo devolvió negativo");
	assertPropio(nroImg.real == -8, "La parte real debe ser -4");
	assertPropio(nroImg.img == -4, "La parte imaginaria debe ser -8");
	printf(ANSI_COLOR_GREEN "Test OK\n");
	printf(ANSI_COLOR_YELLOW "END TESTS: string a numero imaginario con decimales. STATUS: " ANSI_COLOR_GREEN "OK\n");
	
	printf(ANSI_COLOR_YELLOW "START TESTS: Strings inválidos.\n");
	printf(ANSI_COLOR_YELLOW "END TESTS: Strings inválidos. STATUS: " ANSI_COLOR_GREEN "OK\n");
	
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
