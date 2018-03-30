#define ERR_VACIO -1
#define ERR_INVALID_CHARS -2
#define ERR_INVALID_FORMAT -3
#define ERR_NO_REAL_PART -4
#define ERR_NO_IMG_PART -5

typedef struct nro_imaginario
{
	long double real;
	long double img;
} nro_imaginario_t;

typedef struct resolution {
	int width;
	int height;
} resolution_t;

char** str_split(char* a_str, const char a_delim);
int stringContainsChar(char* string, const char* ch);
int parseNroImg(char* nro, nro_imaginario_t* nro_img);
int parseResolution(char* resolstr, resolution_t* resolution);