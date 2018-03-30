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
	nro_imaginario_t nroImg;
	int result;
	
	/* TESTS PARA CONVERTIR STRING A NUMERO IMAGINARIO */
	
	/* PRIMERO TESTEAMOS LOS CASOS BASE DE COMBINACIONES DE + Y - CON NUMEROS ENTEROS */
	printf(ANSI_COLOR_YELLOW "START TESTS: String a numero imaginario con enteros.\n");
	
	result = parseNroImg("3+3i",&nroImg);
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
	printf(ANSI_COLOR_GREEN "Test OK\n");
	
	result = parseNroImg("-8-4i",&nroImg);
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario: " ANSI_COLOR_WHITE "-8-4i\n");
	assertPropio(result == 0, "El parseo devolvió negativo");
	assertPropio(nroImg.real == -8, "La parte real debe ser -8");
	assertPropio(nroImg.img == -4 , "La parte imaginaria debe ser -4");
	printf(ANSI_COLOR_GREEN "Test OK\n");
	
	printf(ANSI_COLOR_YELLOW "END TESTS: string a numero imaginario con entero. STATUS: " ANSI_COLOR_GREEN "OK\n");
	
	/* TESTEAMOS LOS CASOS BASE DE COMBINACIONES DE + Y - CON NUMEROS DECIMALES */
	printf(ANSI_COLOR_YELLOW "START TESTS: String a numero imaginario con decimales.\n");
	
	result = parseNroImg("9.25+0.8i",&nroImg);
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario: " ANSI_COLOR_WHITE "9.25+0.8i\n");
	assertPropio(result == 0, "El parseo devolvió negativo");
	assertPropio(nroImg.real == 9.25, "La parte real debe ser 9.25");
	assertPropio(nroImg.img == 0.8, "La parte imaginaria debe ser 0.8");
	printf(ANSI_COLOR_GREEN "Test OK\n");
	
	result = parseNroImg("2.5-7.5i",&nroImg);
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario: " ANSI_COLOR_WHITE "2.5-7.5i\n");
	assertPropio(result == 0, "El parseo devolvió negativo");
	assertPropio(nroImg.real == 2.5, "La parte real debe ser 2.5");
	assertPropio(nroImg.img == -7.5, "La parte imaginaria debe ser -5");
	printf(ANSI_COLOR_GREEN "Test OK\n");
	
	result = parseNroImg("-2.25+4.5i",&nroImg);
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario: " ANSI_COLOR_WHITE "-2.25+4.5i\n");
	assertPropio(result == 0, "El parseo devolvió negativo");
	assertPropio(nroImg.real == -2.25, "La parte real debe ser -2.25");
	assertPropio(nroImg.img == 4.5, "La parte imaginaria debe ser 4.5");
	printf(ANSI_COLOR_GREEN "Test OK\n");
	
	result = parseNroImg("-8.75-4.25i",&nroImg);
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario: " ANSI_COLOR_WHITE "-8.75-4.25i\n");
	assertPropio(result == 0, "El parseo devolvió negativo");
	assertPropio(nroImg.real == -8.75, "La parte real debe ser -8.75");
	assertPropio(nroImg.img == -4.25, "La parte imaginaria debe ser -4.25");
	printf(ANSI_COLOR_GREEN "Test OK\n");
	
	printf(ANSI_COLOR_YELLOW "END TESTS: string a numero imaginario con decimales. STATUS: " ANSI_COLOR_GREEN "OK\n");
	
	/* TESTEAMOS LOS CASOS DE STRINGS INVALIDOS */
	printf(ANSI_COLOR_YELLOW "START TESTS: Strings inválidos.\n");
	
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario: " ANSI_COLOR_WHITE "'' (Vacio)\n");
	result = parseNroImg("",&nroImg);
	assertPropio(result == ERR_VACIO, "Deberia devolver la constante ERR_VACIO");
	
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario: " ANSI_COLOR_WHITE "'cualquiera'\n");
	result = parseNroImg("cualquiera",&nroImg);
	assertPropio(result == ERR_INVALID_CHARS, "Deberia devolver la constante ERR_INVALID_CHARS");
	
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario: " ANSI_COLOR_WHITE "3 +3i\n");
	result = parseNroImg("3 +3i",&nroImg);
	assertPropio(result == ERR_INVALID_CHARS, "Deberia devolver la constante ERR_INVALID_CHARS.");
	
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario: " ANSI_COLOR_WHITE "3i+3\n");
	result = parseNroImg("3i+3",&nroImg);
	assertPropio(result == ERR_INVALID_FORMAT, "Deberia devolver la constante ERR_INVALID_FORMAT.");
	
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario: " ANSI_COLOR_WHITE "+3+3i\n");
	result = parseNroImg("+3+3i",&nroImg);
	assertPropio(result == ERR_INVALID_FORMAT, "Deberia devolver la constante ERR_INVALID_FORMAT.");
	
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario: " ANSI_COLOR_WHITE "+3-3i\n");
	result = parseNroImg("+3+3i",&nroImg);
	assertPropio(result == ERR_INVALID_FORMAT, "Deberia devolver la constante ERR_INVALID_FORMAT.");
	
	
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario: " ANSI_COLOR_WHITE "0i\n");
	result = parseNroImg("0i",&nroImg);
	assertPropio(result == ERR_NO_REAL_PART, "Deberia devolver la constante ERR_NO_REAL_PART.");
	
	printf(ANSI_COLOR_YELLOW "Parseando nro imaginario: " ANSI_COLOR_WHITE "0\n");
	result = parseNroImg("0",&nroImg);
	assertPropio(result == ERR_NO_IMG_PART, "Deberia devolver la constante ERR_NO_IMG_PART.");
	
	printf(ANSI_COLOR_YELLOW "END TESTS: Strings inválidos. STATUS: " ANSI_COLOR_GREEN "OK\n");
}

void test_resolucion(){
	printf(ANSI_COLOR_YELLOW "START TESTS: RESOLUCION.\n");
    resolution_t resol;
    int result;

    result= parseResolution("800x600",&resol);
	printf(ANSI_COLOR_YELLOW "Parseando resolucion:" ANSI_COLOR_WHITE "800x600\n");
	assertPropio(result == 0, "El parseo fue correcto");
    printf(ANSI_COLOR_GREEN "Test OK\n");

    result = parseResolution("1480x1970",&resol);
    printf(ANSI_COLOR_YELLOW "Parseando resolucion:" ANSI_COLOR_WHITE "1480x1970\n");
    assertPropio(result == 0, "El parseo fue correcto");
	printf(ANSI_COLOR_GREEN "Test OK\n");

    result = parseResolution("aaaaaaaa",&resol);
    printf(ANSI_COLOR_YELLOW "Parseando resolucion:" ANSI_COLOR_WHITE "aaaaaaaa\n");
    assertPropio(result == ERR_INVALID_RESOLUTION, "El parseo fue correcto");
    printf(ANSI_COLOR_GREEN "Test OK\n");

    result = parseResolution("aaaaxaaaa",&resol);
    printf(ANSI_COLOR_YELLOW "Parseando resolucion:" ANSI_COLOR_WHITE "aaaaxaaaa\n");
    assertPropio(result == ERR_INVALID_RESOLUTION, "El parseo fue correcto");
    printf(ANSI_COLOR_GREEN "Test OK\n");

    result = parseResolution("-123x456i",&resol);
    printf(ANSI_COLOR_YELLOW "Parseando resolucion:" ANSI_COLOR_WHITE "-123x456i\n");
    assertPropio(result == ERR_INVALID_RESOLUTION, "El parseo fue correcto");
    printf(ANSI_COLOR_GREEN "Test OK\n");

    result = parseResolution("12354528",&resol);
    printf(ANSI_COLOR_YELLOW "Parseando resolucion:" ANSI_COLOR_WHITE "12354528\n");
    assertPropio(result == ERR_INVALID_RESOLUTION, "El parseo fue correcto");
    printf(ANSI_COLOR_GREEN "Test OK\n");

    result = parseResolution("\\00x\\00",&resol);
    printf(ANSI_COLOR_YELLOW "Parseando resolucion:" ANSI_COLOR_WHITE "\\00x\\00\n");
    assertPropio(result == ERR_INVALID_RESOLUTION, "El parseo fue correcto");
    printf(ANSI_COLOR_GREEN "Test OK\n");
}

void test_archivo_salida(){
    printf(ANSI_COLOR_YELLOW "START TESTS: ARCHIVO SALIDA.\n");
    int result;
    FILE* outputFile = NULL;

    result = checkForOutputPath("file.pgm",outputFile);
    printf(ANSI_COLOR_YELLOW "Parseando archivo de salida:" ANSI_COLOR_WHITE "file.pgm\n");
    assertPropio(result == 0, "El parseo fue correcto");
    printf(ANSI_COLOR_GREEN "Test OK\n");

    result = checkForOutputPath("/dir/file.pgm",outputFile);
    printf(ANSI_COLOR_YELLOW "Parseando archivo de salida:" ANSI_COLOR_WHITE "/dir/file.pgm\n");
    assertPropio(result == ERR_INVALID_FILE_PATH, "El archivo de salida es invalido");
    printf(ANSI_COLOR_GREEN "Test OK\n");

    result = checkForOutputPath(NULL,outputFile);
    printf(ANSI_COLOR_YELLOW "Parseando archivo de salida:" ANSI_COLOR_WHITE "NULL\n");
    assertPropio(result == ERR_VACIO, "El archivo de salida es nulo");
    printf(ANSI_COLOR_GREEN "Test OK\n");

    result = checkForOutputPath("aa*",outputFile);
    printf(ANSI_COLOR_YELLOW "Parseando archivo de salida:" ANSI_COLOR_WHITE "aa*\n");
    assertPropio(result == ERR_INVALID_CHARS, "El archivo de salida tiene caracteres invalidos");
    printf(ANSI_COLOR_GREEN "Test OK\n");

    result = checkForOutputPath("archivo.jpg",outputFile);
    printf(ANSI_COLOR_YELLOW "Parseando archivo de salida:" ANSI_COLOR_WHITE "archivo.jpg\n");
    assertPropio(result == ERR_INVALID_FILE_TYPE, "El archivo de salida tiene una extension invalida");
    printf(ANSI_COLOR_GREEN "Test OK\n");
}

void test_ancho_alto(){
    printf(ANSI_COLOR_YELLOW "START TESTS: VALIDACION DE ANCHO/ALTO.\n");
    int result;
    float value;

    result = setValue("",&value);
    printf(ANSI_COLOR_YELLOW "Validando:" ANSI_COLOR_WHITE "\n");
    assertPropio(result == ERR_INVALID_PARAMETER, "No se ingreso ningun valor");
    printf(ANSI_COLOR_GREEN "Test OK\n");

    result = setValue("2",&value);
    printf(ANSI_COLOR_YELLOW "Validando:" ANSI_COLOR_WHITE "2\n");
    assertPropio(result == 0, "El parseo fue correcto");
    printf(ANSI_COLOR_GREEN "Test OK\n");

    result = setValue("0.0005",&value);
    printf(ANSI_COLOR_YELLOW "Validando:" ANSI_COLOR_WHITE "0.0005\n");
    assertPropio(result == 0, "El parseo fue correcto");
    printf(ANSI_COLOR_GREEN "Test OK\n");

    result = setValue("aaaaaa",&value);
    printf(ANSI_COLOR_YELLOW "Validando:" ANSI_COLOR_WHITE "aaaaaa\n");
    assertPropio(result == ERR_INVALID_PARAMETER, "Se ingreso un valor alfabetico");
    printf(ANSI_COLOR_GREEN "Test OK\n");

    result = setValue("\\00x\\00",&value);
    printf(ANSI_COLOR_YELLOW "Validando:" ANSI_COLOR_WHITE "\\00x\\00\n");
    assertPropio(result == ERR_INVALID_PARAMETER, "Se ingreso un caracter invalido");
    printf(ANSI_COLOR_GREEN "Test OK\n");

    result = setValue("****",&value);
    printf(ANSI_COLOR_YELLOW "Validando:" ANSI_COLOR_WHITE "****\n");
    assertPropio(result == ERR_INVALID_PARAMETER, "Se ingreso un caracter invalido");
    printf(ANSI_COLOR_GREEN "Test OK\n");
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
	test_resolucion();
	test_archivo_salida();
    test_ancho_alto();
    return 0;
}
