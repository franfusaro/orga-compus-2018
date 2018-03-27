#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <ctype.h>
#include <unistd.h>
#include <poll.h>
#include <errno.h>
#include <getopt.h>

#define BUFFER 100
#define ERROR_INVALID_PARAMETERS 0
#define ERROR_INVALID_INPUT_FILE 1
#define ERROR_EMPTY_INPUT_FILE 2
#define ERROR_INVALID_OUTPUT_FILE 3
#define ERROR_NO_TEXT_GIVEN 4


typedef struct receivedParameters {
	char* input;
	char* output;
	int inputBufferByteCount;
	int outputBufferByteCount;
} parameters_t;

static struct option long_options[] =
{
	{"output",required_argument,NULL,'o'},
	{"input",required_argument,NULL,'i'},
	{"help",no_argument,NULL,'h'},
	{"version",no_argument,NULL,'V'},
	{"ibuf-bytes",required_argument,NULL,'I'},
	{"obuf-bytes",required_argument,NULL,'O'},
    {NULL, 0, NULL, 0}
};

/* Declaracion de funciones */

void showVersion();
void showHelp();
parameters_t getParameters(int argc, char **argv);

/* ------------------------ */

parameters_t getParameters(int argc, char **argv){

    int ch;
    parameters_t receivedParameters;

    receivedParameters.input = NULL;
    receivedParameters.output = NULL;
    receivedParameters.inputBufferByteCount = 1; //valores por defecto
    receivedParameters.outputBufferByteCount = 1; //valores por defecto

    // loop over all of the options
    while ((ch = getopt_long(argc, argv, "hVi:o:I:O:", long_options, NULL)) != -1) {
        // check to see if a single character or long option came through
        switch (ch){
            case 'o':
                receivedParameters.output = optarg;
                break;
            case 'i':
                receivedParameters.input = optarg;
                break;
            case 'V':
                showVersion();
                exit(0);
                break;
            case 'h':
                showHelp();
                exit(0);
                break;
            case 'I':
                receivedParameters.inputBufferByteCount = atoi(optarg);
                break;
            case 'O':
                receivedParameters.outputBufferByteCount = atoi(optarg);
                break;
            case '?':
                if (optopt == 'i' || optopt == 'o' || optopt == 'I' || optopt == 'O') {
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

int main(int argc, char *argv[]){

    FILE* input;
    FILE* output;

	int result;

	parameters_t receivedParameters = getParameters(argc,argv);
	
	if ((((receivedParameters.input == NULL) && (receivedParameters.output == NULL))) && (argc > 1)) {
        return 0;
    }
    return result;
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
