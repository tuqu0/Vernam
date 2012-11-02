CC=gcc
EXEC=vernam
FILES= ./src/vernam.c
CFLAGS= -ggdb -O0 -Wall
OBJS=$(FILES:.c=.o)
DIST= puydoyeux_vincent-Vernam

Vernam: $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) -o ./bin/$(EXEC) $(OBJS) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf ./src/*.o
	rm -f ./bin/$(EXEC)
	
dist: clean
	mkdir ../$(DIST)
	cp -r ../$(EXEC)/*  ../$(DIST)
	rm -rf ../$(DIST).tar.gz 2>/dev/null
	tar cvfj ../$(DIST).tar.gz ../$(DIST) 
	rm -rf ../$(DIST)
