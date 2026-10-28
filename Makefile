CC = gcc
CFLAGS = -std=c11 -Wall -Wextra -Wpedantic -g
CPPFLAGS = -DMAT_TEST_ALLOC

.PHONY: all test test1 test2 test3 clean

all: test_ex1 test_ex2 test_ex3

test_ex%: test_ex%.c matrice.c matrice_alloc.c matrice_calcul.c matrice_io.c matrice.h matrice_alloc.h
	$(CC) $(CPPFLAGS) $(CFLAGS) $< matrice.c matrice_alloc.c matrice_calcul.c matrice_io.c -o $@

test1: test_ex1
	./test_ex1

test2: test_ex2
	./test_ex2

test3: test_ex3
	./test_ex3

test: test1 test2 test3

clean:
	rm -f test_ex1 test_ex2 test_ex3
	rm -rf test_ex1.dSYM test_ex2.dSYM test_ex3.dSYM
