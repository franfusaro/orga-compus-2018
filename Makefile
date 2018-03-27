CC := gcc
CFLAGS := -g -Wall

tp0: tp0.c
	$(CC) $(CFLAGS) $(OBJS) $^ -o $@ 

clean:
	rm -f tp0 *.o core *.asm

.PHONY: clean
