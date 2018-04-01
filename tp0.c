#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdint.h>
#include <ctype.h>
#include <unistd.h>
#include <poll.h>
#include <errno.h>
#include <getopt.h>
#include <float.h>
#include <assert.h>
#include <string.h>
#include "funciones.h"

typedef struct receivedParameters {
    char* path_to_output;
	resolution_t resolution;
	float width;
	float height;
	nro_imaginario_t center; 
	nro_imaginario_t seed;
    color_t color;
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
void showError(int);
void returnValidation(int);
void julia(parameters_t);
void writeHeader(parameters_t,FILE*);
parameters_t getParameters(int argc, char **argv);

parameters_t getParameters(int argc, char **argv){
    int ch;
    parameters_t receivedParameters;

    //valores por defecto
    receivedParameters.path_to_output = "output.pgm";
    receivedParameters.resolution.width = 640;
    receivedParameters.resolution.height = 480;
    receivedParameters.center.real = 0; 
    receivedParameters.center.img = 0;
    receivedParameters.width = 2;
    receivedParameters.height = 2; 
    receivedParameters.seed.real = -0.726895347709114071439;
    receivedParameters.seed.img = 0.188887129043845954792;
    receivedParameters.color.max = 255;
    receivedParameters.color.min = 0;

    //fin valores por defecto
    
    // loop over all of the options
    while ((ch = getopt_long(argc, argv, "hVo:c:r:H:w:s:", long_options, NULL)) != -1) {
        // check to see if a single character or long option came through
        switch (ch){
            case 'o':
                returnValidation(checkForOutputPath(optarg,&receivedParameters.path_to_output));
                break;
            case 'c':
                returnValidation(parseNroImg(optarg,&receivedParameters.center));
                break;
            case 'r':
                returnValidation(parseResolution(optarg,&receivedParameters.resolution));
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
                returnValidation(setHeight(optarg,&receivedParameters.height,receivedParameters.resolution.height));
            case 'w':
                returnValidation(setWidth(optarg,&receivedParameters.width,receivedParameters.resolution.width));
                break;
            case 's':
				returnValidation(parseNroImg(optarg,&receivedParameters.seed));
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

void returnValidation(int result){
    if (result < 0){
        showError(result);
        exit(1);
    }
}

void showHelp(){
    printf("%s\n", "TP0 Organizacion de computadoras - HELP");
    printf("%s\n", "Usage: ");
    printf("%s\n", "tp0 -h   Displays help and usage of the application");
    printf("%s\n", "tp0 -V   Displays version of the application");
    printf("%s\n", "tp0 Options:");
    printf("%s\n", "-r --resolution  Set bitmap resolution to WxH pixels");
    printf("%s\n", "-c --center      Set the center of the image");
    printf("%s\n", "-w --width       Set the width of the region to be spanned");
    printf("%s\n", "-H --height      Set the height of the region to be spanned");
    printf("%s\n", "-o --output      Set path to output file");
    printf("%s\n", "Examples: ");
    printf("%s\n", "  tp0 -r 1024x768 -o example.pgm");
    printf("%s\n", "  tp0 -c 0.282-0.007i -w 0.005 -H 0.005 -o example.pgm");
}

void showVersion(){
	printf("%s\n", "TP0 Organizacion de computadoras - VERSION: 1.0");
}

void showError(int errorCode) {
    if (errorCode == ERR_VACIO) {
        fprintf(stderr, "%s\n", "Parameter input is empty. Type 'tp0 -h' for help. Program terminated");
    }
    if (errorCode == ERR_INVALID_CHARS) {
        fprintf(stderr, "%s\n", "Argument has invalid characters. Type 'tp0 -h' for help. Program terminated");
    }
    if (errorCode == ERR_INVALID_FORMAT) {
        fprintf(stderr, "%s\n", "Invalid arguments. Type 'tp0 -h' for help. Program terminated");
    }
    if (errorCode == ERR_NO_REAL_PART) {
        fprintf(stderr, "%s\n", "Parameter has no real part. Type 'tp0 -h' for help. Program terminated");
    }
    if (errorCode == ERR_NO_IMG_PART) {
        fprintf(stderr, "%s\n", "Parameter has no immaginary part. Type 'tp0 -h' for help. Program terminated");
    }
    if (errorCode == ERR_INVALID_RESOLUTION) {
        fprintf(stderr, "%s\n", "Resolution input is invalid. Type 'tp0 -h' for help. Program terminated");
    }
    if (errorCode == ERR_INVALID_FILE_TYPE) {
        fprintf(stderr, "%s\n", "Output file type is invalid. Type 'tp0 -h' for help. Program terminated");
    }
    if (errorCode == ERR_INVALID_FILE_PATH) {
        fprintf(stderr, "%s\n", "Output file path is invalid. Type 'tp0 -h' for help. Program terminated");
    }
    if (errorCode == ERR_INVALID_PARAMETER) {
        fprintf(stderr, "%s\n", "Parameter input is invalid. Type 'tp0 -h' for help. Program terminated");
    }
}

void julia(parameters_t parameters){
    FILE * output;

    if(strcmp(parameters.path_to_output, "stdout") != 0){ // Abre el archivo y genera el header del archivo si la salida no es la estandar
        output = fopen(parameters.path_to_output, "w");
        writeHeader(parameters,output);
    } else {
        output = stdout;
    }

	//Calculo los incrementos en alto y ancho
	float stepWidth = parameters.width / parameters.resolution.width;
	float stepHeight = parameters.height / parameters.resolution.height;
	nro_imaginario_t currentPixel;
	//Calculo el primer pixel segun el centro
	nro_imaginario_t startPixel;
	startPixel.real = parameters.center.real - (parameters.width/2);
	startPixel.img = parameters.center.img + (parameters.height/2);
	int N = parameters.color.max;
	int brillo = parameters.color.min;
	int i;
	int j;
	//para cada pixel $p {
	for (i = 0; i < parameters.resolution.height; i++)
	{
		for (j = 0; j < parameters.resolution.width; j++)
		{
			//$f = complejo asociado a $p;
			currentPixel.real = startPixel.real + (stepWidth * j);
			currentPixel.img = startPixel.img - (stepHeight * i);
			//for ($i = 0; $i < $N - 1; ++$i) {
			for (brillo = 0; brillo < N; ++brillo) {
                //if (abs($f) > 2)
                if (getNroImgAbs(currentPixel) > 2) {
                    //break;
                    break;
                }
                //$f = $f * $f + $s;
                currentPixel = getNroImgSq(currentPixel);
                currentPixel.real = currentPixel.real + parameters.seed.real;
                currentPixel.img = currentPixel.img + parameters.seed.img;
            }
            //dibujar el punto p con brillo $i;
            if(fprintf(output,"%d ",brillo) < 0){
                fprintf(stderr, "There was an error while writing to output.\n");
                exit(1);
            };
		}
        fprintf(output,"\n");
	}

    if(strcmp(parameters.path_to_output, "stdout") != 0){
        if (fclose(output) != 0) {
            fprintf(stderr, "Unable to close output file.\n");
            exit(1);
        }
    }

}

void writeHeader(parameters_t parameters,FILE* output){
    // PGM Header - De acuerdo con la especificacion, el header de un archivo PGM debe contener:
    // El "numero magico" P2, el nombre del archivo con un '#' delante, el ancho de la imagen, el alto de la imagen
    // y el color mas oscuro que puede llegar a alcanzar (en este caso, el valor 255)
    fprintf(output,"P2\n");
    fprintf(output,"# %s\n",parameters.path_to_output);
    fprintf(output,"%u\n",(unsigned)parameters.resolution.width);
    fprintf(output,"%u\n",(unsigned)parameters.resolution.height);
    fprintf(output,"%u\n",(unsigned)parameters.color.max);
}

int main(int argc, char *argv[]){
    int result = 0;
    parameters_t receivedParameters = getParameters(argc,argv);
    julia(receivedParameters);
    return result;
}
