

main : main.o v1_lib.o v2_lib.o
	gcc -o main main.o v1_lib.o v2_lib.o

tmp1_lib.o : lib.c
	gcc -DASTRING=\"1\" -o tmp1_lib.o -c lib.c

tmp2_lib.o : lib.c
	gcc -DASTRING=\"2\" -o tmp2_lib.o -c lib.c

conversions1.txt : conversions_tmpl.txt
	sed 's/PREFIX/v1/' conversions_tmpl.txt > conversions1.txt 

conversions2.txt : conversions_tmpl.txt
	sed 's/PREFIX/v2/' conversions_tmpl.txt > conversions2.txt 

v1_lib.o : tmp1_lib.o conversions1.txt
	objcopy --redefine-syms conversions1.txt tmp1_lib.o v1_lib.o

v2_lib.o : tmp2_lib.o conversions2.txt
	objcopy --redefine-syms conversions2.txt tmp2_lib.o v2_lib.o

main.o : main.c v1_lib.h v2_lib.h
	gcc -c main.c

clean:
	rm -f main *.o conversions?.txt
