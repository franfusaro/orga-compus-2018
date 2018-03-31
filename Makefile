CC := gcc
CFLAGS := -g -Wall

tp0: tp0.c funciones.o
	$(CC) $(CFLAGS) $(OBJS) $^ -o $@ -lm

test_tp0: test_tp0.c funciones.o
	$(CC) $(CFLAGS) $(OBJS) $^ -o $@
funciones: funciones.c
	$(CC) $(CFLAGS) $(OBJS) $^ -o $@ 

clean:
	rm -f tp0 *.o core *.asm
	rm -f test_tp0 *.o core *.asm

.PHONY: clean
