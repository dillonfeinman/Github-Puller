CFLAGS = -Wall -Wextra -DDEBUG -g -pedantic -std=c++14

all: program

program: repo_splitter.o
	g++ $(CFLAGS) repo_splitter.o -o repo_splitter

object: repo_splitter.cpp
	g++ $(CFLAGS) -c repo_splitter.cpp -o repo_splitter.o

clean: 
	rm *.o
	rm repo_splitter
	rm *.txt