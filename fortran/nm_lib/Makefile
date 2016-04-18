#!/usr/bin/make

all: clean nmfe

nmfe: 
	rm -f nm_lib.a *.mod *.o
	gfortran -c precision.f95
	gfortran -arch x86_64 -c -O2 -fPIC -c *.f95
	ar -cr nm_lib.a *.o
	ar -tv nm_lib.a
	rm *.o 

clean:
	rm -f *.o *.a *.mod

cleanall: clean
	
PHONY: all
