gain_analysis.so: gain_analysis.c gain_analysis.h
	$(CC) -o gain_analysis.so --shared gain_analysis.c

install:
	cp gain_analysis.so /usr/local/lib
