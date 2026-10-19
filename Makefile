CC = gcc
CFLAGS = -std=c11 -Wall -Wextra -Wpedantic -g
CPPFLAGS = -DMAT_TEST_ALLOC

.PHONY: all test clean

test_ex1: test_ex1.c matrice.c matrice_alloc.c matrice.h matrice_alloc.h
	$(CC) $(CPPFLAGS) $(CFLAGS) test_ex1.c matrice.c matrice_alloc.c -o $@

test1: test_ex1
	./test_ex1

clean:
	rm -f test_ex1
	rm -r test_ex1.dSYM
