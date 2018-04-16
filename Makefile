cCC := gcc
CFLAGS := -g -Wall

tp0: tp0.c funciones.o
	$(CC) $(CFLAGS) $(OBJS) $^ -o $@ -lm

test_tp0: test_tp0.c funciones.o
	$(CC) $(CFLAGS) $(OBJS) $^ -o $@ -lm
funciones: funciones.c
	$(CC) $(CFLAGS) $(OBJS) $^ -o $@ -lm

clean:
	rm -f tp0 *.o core *.asm
	rm -f test_tp0 *.o core *.asm
	rm -f *.pgm

.PHONY: clean
