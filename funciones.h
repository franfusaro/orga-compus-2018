#define ERR_VACIO -1
#define ERR_INVALID_CHARS -2
#define ERR_INVALID_FORMAT -3
#define ERR_NO_REAL_PART -4
#define ERR_NO_IMG_PART -5
#define ERR_INVALID_RESOLUTION -6
#define ERR_INVALID_FILE_TYPE -7
#define ERR_INVALID_FILE_PATH -8
#define ERR_INVALID_PARAMETER -9

typedef struct nro_imaginario
{
	long double real;
	long double img;
} nro_imaginario_t;

typedef struct resolution {
	int width;
	int height;
} resolution_t;

typedef struct color {
    int max;
    int min;
}color_t;

char** str_split(char* a_str, const char a_delim);
int stringContainsChar(char* string, const char* ch);
int parseNroImg(char* nro, nro_imaginario_t* nro_img);
int parseResolution(char* resolstr, resolution_t* resolution);
int checkForOutputPath(char* path, char** path_to_save);
char* getFileExtension(char *path);
int checkForBadCharacters(char* path);
int setValue(char* strvalue, float* value_to_set);
long double getNroImgAbs(nro_imaginario_t nro);
nro_imaginario_t getNroImgSq(nro_imaginario_t nro);
