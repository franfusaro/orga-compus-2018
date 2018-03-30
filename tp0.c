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

#define ERROR_INVALID_PARAMETERS 0
#define ERROR_INVALID_INPUT_FILE 1
#define ERROR_EMPTY_INPUT_FILE 2
#define ERROR_INVALID_OUTPUT_FILE 3
#define ERROR_NO_TEXT_GIVEN 4


typedef struct resolution {
	int width;
	int height;
} resolution_t;

typedef struct receivedParameters {
	char* output;
	resolution_t resolution; //queda string hasta que piense una mejor forma de representar la resolucion (con una struct quizas??)
	int width;
	int height;
	nro_imaginario_t center; //queda string hasta que piense una mejor forma de representar un numero complejo (con una struct quizas??)
	nro_imaginario_t seed; //queda string hasta que piense una mejor forma de representar un numero complejo (con una struct quizas??)
} parameters_t;

static struct option long_options[] =
{
	{"resolution",required_argument,NULL,'r'},
	{"center",required_argument,NULL,'c'},
	{"width",required_argument,NULL,'w'},
	{"height",required_argument,NULL,'H'},
	{"seed",required_argument,NULL,'s'},
	{"output",required_argument,NULL,'o'},
	{"help",no_argument,NULL,'h'},
	{"version",no_argument,NULL,'V'},
    {NULL, 0, NULL, 0}
};

/* Declaracion de funciones */

void showVersion(void);
void showHelp();
parameters_t getParameters(int argc, char **argv);
resolution_t parseResolution(char* resolution);



resolution_t parseResolution(char* resolution)
{
	char** res = str_split(resolution,'x');
	resolution_t resol;
	if (res)
    {
		resol.width = (intptr_t)*(res);
		resol.height = (intptr_t)*(res + 1);
        free(res);
    }
    return resol;
}

parameters_t getParameters(int argc, char **argv){

    int ch;
    parameters_t receivedParameters;

    //valores por defecto
    receivedParameters.output = NULL;
    receivedParameters.resolution.width = 640; 
    receivedParameters.resolution.height = 480;
    receivedParameters.center.real = 0; 
    receivedParameters.center.img = 0;
    receivedParameters.width = 2;
    receivedParameters.height = 2; 
    receivedParameters.seed.real = -0.726895347709114071439;
    receivedParameters.seed.img = 0.188887129043845954792; 
    //fin valores por defecto
    
    // loop over all of the options
    while ((ch = getopt_long(argc, argv, "hVi:o:I:O:", long_options, NULL)) != -1) {
        // check to see if a single character or long option came through
        switch (ch){
            case 'o':
                receivedParameters.output = optarg;
                break;
            case 'c':
                receivedParameters.center = parseNroImg(optarg);
                break;
            case 'r':
                receivedParameters.resolution = parseResolution(optarg);
                break;
            case 'V':
                showVersion();
                exit(0);
                break;
            case 'h':
                showHelp();
                exit(0);
                break;
            case 'H':
				receivedParameters.height = atoi(optarg);
            case 'w':
                receivedParameters.width = atoi(optarg);
                break;
            case 's':
				receivedParameters.seed = parseNroImg(optarg);
                break;
            case '?':
                if (optopt == 'o' || optopt == 'c' || optopt == 'H' || optopt == 'w' || optopt == 's') {
                    fprintf (stderr, "No arguments provided for option -%c .\n", optopt);
                } else if (isprint (optopt)) {
                    fprintf (stderr, "Unknown option `-%c'.\n", optopt);
                } else {
                    fprintf (stderr, "Unknown option `\\x%x'.\n", optopt);
                } //Ya se escribió un error a stderr (lo hizo la funcion getopt_long.
            default:
                showHelp();
                exit(1);
        }
    }
    return receivedParameters;

}


void showHelp(){
	printf("%s\n", "TP0 Organizacion de computadoras - HELP");
	printf("%s\n", "Usage: ");
	printf("%s\n", "tp0 -h");
	printf("%s\n", "tp0 -V");
	printf("%s\n", "tp0 [options] file");
	printf("%s\n", "tp0 Options:");
	printf("%s\n", "-V --version	Print version and quit");
	printf("%s\n", "-h --help		Print this information");
	printf("%s\n", "-o --output		Path to output file");
	printf("%s\n", "-i --input		Path to input file");
	printf("%s\n", "Examples: ");
	printf("%s\n", "tp0 -q -i input.txt -o output.txt");
}

void showVersion(){
	printf("%s\n", "TP0 Organizacion de computadoras - VERSION: 1.0");
}

void showError(int errorCode){
	if(errorCode == ERROR_INVALID_INPUT_FILE){
		fprintf(stderr,"%s\n","Invalid input file. Type 'tp0 -h' for help. Program terminated");
	}
	if(errorCode == ERROR_EMPTY_INPUT_FILE){
		fprintf(stderr,"%s\n", "Input file is empty. Type 'tp0 -h' for help. Program terminated");
	}
	if(errorCode == ERROR_INVALID_OUTPUT_FILE){
		fprintf(stderr,"%s\n", "Invalid output file, check path. Type 'tp0 -h' for help. Program terminated");
	}
	if(errorCode == ERROR_INVALID_PARAMETERS){
		fprintf(stderr,"%s\n","Invalid arguments. Type 'tp0 -h' for help. Program terminated");
	}
    if(errorCode == ERROR_NO_TEXT_GIVEN){
        fprintf(stderr,"%s\n", "No text passed to verify");
    }
}

int main(int argc, char *argv[]){
	int result = 0;
	parameters_t receivedParameters = getParameters(argc,argv);
	printf("RESOLUTION WIDTH: %d\n", receivedParameters.resolution.width);
	printf("RESOLUTION HEIGHT: %d\n", receivedParameters.resolution.height);
	//printf("SEED: %s\n", receivedParameters.seed);
	//printf("CENTER: %s\n",receivedParameters.center);
	printf("%.16Lf\n", receivedParameters.seed.real);
	printf("%.16Lf\n", receivedParameters.seed.img);
	printf("WIDTH: %d\n", receivedParameters.width);
	printf("HEIGHT: %d\n", receivedParameters.height);
    return result;
}
