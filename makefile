#第一种方法
#main: main.c test.c
#	gcc main.c test.c -o main

#第二种方法
# main: main.o test.o
# 	gcc main.o test.o -o main
# main.o: main.c
# 	gcc -c main.c -o main.o
# test.o: test.c
# 	gcc -c test.c -o test.o

#第三种方法
# obj = main.o test.o
# target = main
# CC = gcc

# $(target): $(obj)
# 	$(CC) $(obj) -o $(target)

# %.o: %.c
# 	$(CC) -c $< -o $@

#第四种方法
src = $(wildcard ./*.c)
obj = $(src:%.c=%.o)
target= main
CC = gcc

$(target): $(obj)
	$(CC) $(obj) -o $(target)

%.o: %.c
	$(CC) -c $< -o $@

.PHONY: clean
clean:
	rm -rf $(obj) $(target)