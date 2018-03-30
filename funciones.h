
typedef struct nro_imaginario
{
	long double real;
	long double img;
} nro_imaginario_t;

char** str_split(char* a_str, const char a_delim);
int stringContainsChar(char* string, const char* ch);
nro_imaginario_t parseNroImg(char* nro);