#!/usr/bin/make

NMFE = /Users/rob/Projects/NMfE/nm_lib/
LIBNMFE = /Users/rob/Projects/NMfE/nm_lib/nm_lib.a

all: first second
	
first:	nm21 nm22 nm23 nm24 nm25 nm26 nm27 nm28 nm29
second: nm210 nm211 nm212 nm213 nm214 nm215 nm216
	
nm21: nm21.f95
	gfortran -arch x86_64 -g -O3 -fPIC -I $(NMFE) $(LIBNMFE) nm21.f95 -o nm21
	@chmod a+x ./nm21

run21: nm21
	@./nm21 nm21
	@cat nm21.res

nm22: nm22.f95
	gfortran -arch x86_64 -g -O3 -fPIC -I $(NMFE) $(LIBNMFE) nm22.f95 -o nm22
	@chmod a+x ./nm22

run22: nm22
	@./nm22 nm22
	@cat nm22.res

nm23: nm23.f95
	gfortran -arch x86_64 -g -O3 -fPIC -I $(NMFE) $(LIBNMFE) nm23.f95 -o nm23
	@chmod a+x ./nm23

run23: nm23
	@./nm23 nm23
	@cat nm23.res

nm24: nm24.f95
	gfortran -arch x86_64 -g -O3 -fPIC -I $(NMFE) $(LIBNMFE) nm24.f95 -o nm24
	@chmod a+x ./nm24

run24: nm24
	@./nm24 nm24
	@cat nm24.res

nm25: nm25.f95
	gfortran -arch x86_64 -g -O3 -fPIC -I $(NMFE) $(LIBNMFE) nm25.f95 -o nm25
	@chmod a+x ./nm25

run25: nm25
	@./nm25 nm25
	@cat nm25.res

nm26: nm26.f95
	gfortran -arch x86_64 -g -O3 -fPIC -I $(NMFE) $(LIBNMFE) nm26.f95 -o nm26
	@chmod a+x ./nm26

run26: nm26
	@./nm26 nm26
	@cat nm26.res

nm27: nm27.f95
	gfortran -arch x86_64 -g -O3 -fPIC -I $(NMFE) $(LIBNMFE) nm27.f95 -o nm27
	@chmod a+x ./nm27

run27: nm27
	@./nm27 nm27
	@cat nm27.res

nm28: nm28.f95
	gfortran -arch x86_64 -g -O3 -fPIC -I $(NMFE) $(LIBNMFE) nm28.f95 -o nm28
	@chmod a+x ./nm28

run28: nm28
	@./nm28 nm28
	@cat nm28.res

nm29: nm29.f95
	gfortran -arch x86_64 -g -O3 -fPIC -I $(NMFE) $(LIBNMFE) nm29.f95 -o nm29
	@chmod a+x ./nm29

run29: nm29
	@./nm29 nm29
	@cat nm29.res

nm210: nm210.f95
	gfortran -arch x86_64 -g -O3 -fPIC -I $(NMFE) $(LIBNMFE) nm210.f95 -o nm210
	@chmod a+x ./nm210

run210: nm210
	@./nm210 nm210
	@cat nm210.res

nm211: nm211.f95
	gfortran -arch x86_64 -g -O3 -fPIC -I $(NMFE) $(LIBNMFE) nm211.f95 -o nm211
	@chmod a+x ./nm211

run211: nm211
	@./nm211 nm211
	@cat nm211.res

nm212: nm212.f95
	gfortran -arch x86_64 -g -O3 -fPIC -I $(NMFE) $(LIBNMFE) nm212.f95 -o nm212
	@chmod a+x ./nm212

run212: nm212
	@./nm212 nm212
	@cat nm212.res

nm213: nm213.f95
	gfortran -arch x86_64 -g -O3 -fPIC -I $(NMFE) $(LIBNMFE) nm213.f95 -o nm213
	@chmod a+x ./nm213

run213: nm213
	@./nm213 nm213
	@cat nm213.res

nm214: nm214.f95
	gfortran -arch x86_64 -g -O3 -fPIC -I $(NMFE) $(LIBNMFE) nm214.f95 -o nm214
	@chmod a+x ./nm214

run214: nm214
	@./nm214 nm214
	@cat nm214.res

nm215: nm215.f95
	gfortran -arch x86_64 -g -O3 -fPIC -I $(NMFE) $(LIBNMFE) nm215.f95 -o nm215
	@chmod a+x ./nm215

run215: nm215
	@./nm215 nm215
	@cat nm215.res

nm216: nm216.f95
	gfortran -arch x86_64 -g -O3 -fPIC -I $(NMFE) $(LIBNMFE) nm216.f95 -o nm216
	@chmod a+x ./nm216

run216: nm216
	@./nm216 nm216
	@cat nm216.res

clean:
	rm *.res nm21 nm22 nm23 nm24 nm25 nm26 nm27 nm28 nm29 nm210 nm211 nm212 nm213 nm214 nm215 nm216

cleanall: clean
	rm -rf *.dSYM

PHONY: all
