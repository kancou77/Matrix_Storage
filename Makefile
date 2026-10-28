CC = gcc
CFLAGS = -std=c11 -Wall -Wextra -Wpedantic -g
CPPFLAGS =
TEST_CPPFLAGS = -DMAT_TEST_ALLOC

COMMON = matrice.c matrice_alloc.c
HEADERS = matrice.h matrice_alloc.h matrice_io.h matrice_calcul.h
PROGRAMMES = test_ex1 test_ex2 test_ex3 demo_matrices

.PHONY: all test test1 test2 test3 clean

all: $(PROGRAMMES)

test_ex1: test_ex1.c $(COMMON) $(HEADERS)
	$(CC) $(CPPFLAGS) $(TEST_CPPFLAGS) $(CFLAGS) test_ex1.c $(COMMON) -o $@

test_ex2: test_ex2.c $(COMMON) matrice_io.c $(HEADERS)
	$(CC) $(CPPFLAGS) $(TEST_CPPFLAGS) $(CFLAGS) test_ex2.c $(COMMON) matrice_io.c -o $@

test_ex3: test_ex3.c $(COMMON) matrice_calcul.c $(HEADERS)
	$(CC) $(CPPFLAGS) $(TEST_CPPFLAGS) $(CFLAGS) test_ex3.c $(COMMON) matrice_calcul.c -o $@

demo_matrices: main.c $(COMMON) matrice_io.c matrice_calcul.c $(HEADERS)
	$(CC) $(CPPFLAGS) $(CFLAGS) main.c $(COMMON) matrice_io.c matrice_calcul.c -o $@

test1: test_ex1
	./test_ex1

test2: test_ex2
	./test_ex2

test3: test_ex3
	./test_ex3

test: test1 test2 test3

clean:
	rm -f $(PROGRAMMES) test_ex2_sortie.txt 
	rm -rf $(PROGRAMMES:%=%.dSYM)

