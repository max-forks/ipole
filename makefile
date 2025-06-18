#
# h5cc compiles for linking with HDF5 library
#
CC = h5cc -DH5_USE_16_API -lhdf5_hl
CFLAGS =  -fopenmp -I/usr/include -I$(GSL_HOME)/include -O3 -w
LDFLAGS = -L$(GSL_HOME)/lib -lm -lgsl -lgslcblas 
# CFLAGS = -I/opt/homebrew/opt/libomp/include -O3 -w
# LDFLAGS = -L/opt/homebrew/opt/libomp/lib -lomp -lm -lgsl -lgslcblas

SRCIPO = \
main.c image.c geodesics.c radiation.c tetrads.c ipolarray.c geometry.c \
model_tetrads.c model_radiation.c model_geodesics.c \
model_harm3d.c
#model_NT.c


OBJIPO = \
main.o image.o geodesics.o radiation.o tetrads.o ipolarray.o geometry.o \
model_tetrads.o model_radiation.o model_geodesics.o \
model_harm3d.o defs.o
#model_NT.o


ipole: $(OBJIPO) makefile 
	$(CC) $(CFLAGS) -o ipole $(OBJIPO) $(LDFLAGS)

$(OBJIPO) : makefile decs.h constants.h

clean:
	rm *.o 
cleanup:
	rm ipole*.ppm ipole.dat



