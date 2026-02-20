# Makefile

# Compiler and flags
CC = riscv64-unknown-elf-gcc
CFLAGS = -Wall -Werror -march=rv64im -mabi=lp64 -O2

# Test targets
hsm_tests: hsm_tests.c
	$(CC) $(CFLAGS) -o hsm_tests hsm_tests.c

atomics_tests: atomics_tests.c
	$(CC) $(CFLAGS) -o atomics_tests atomics_tests.c

locks_tests: locks_tests.c
	$(CC) $(CFLAGS) -o locks_tests locks_tests.c

smp_tests: smp_tests.c
	$(CC) $(CFLAGS) -o smp_tests smp_tests.c

# All-in-one build
all: hsm_tests atomics_tests locks_tests smp_tests

.PHONY: all hsm_tests atomics_tests locks_tests smp_tests
