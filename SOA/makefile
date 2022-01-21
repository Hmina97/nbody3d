all: nbody.g nbody.i

nbody.g: nbody.c
	gcc -march=native -mavx2 -Ofast -fopt-info-all=nbody.gcc.optrpt $< -o $@ -lm -fopenmp

#nbody.i: nbody.c
#	icc -xhost -Ofast -qopt-report $< -o $@ -qmkl -qopenmp

#nbodySOA.i: nbodySOA.c
#	gcc -march=native -mavx2 -Ofast -fopt-info-all=nbody.gcc.optrpt $< -o $@ -lm -fopenmp
	
nbodySOA.g: nbodySOA.c
	gcc -march=native -mavx2 -Ofast -fopt-info-all=nbody.gcc.optrpt $< -o $@ -lm -fopenmp
clean:
	rm -Rf *~ nbody.g nbody.i nbodySOA.g : *.optrpt *.dat out.png


run: nbody.g   nbodySOA.g
	sudo taskset -c 1 ./nbody.g > outAOSgcc.dat
	#sudo taskset -c 1 ./nbody.i > outAOsicc.dat
	
	sudo taskset -c 1 ./nbodySOA.g > outSOAgcc.dat
	#sudo taskset -c 1 ./nbodySOA.g > outSOAicc.dat
	gnuplot ./plot.gp > out.png
