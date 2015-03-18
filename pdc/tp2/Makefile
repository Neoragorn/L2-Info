
all: mcu_rev mcu_wc mcu_ww mcu_wl mcu_uniq mcu_xxd

mcu_xxd: mcu_xxd.c mcu_readl.o mcu_fatal.o
	gcc -o mcu_xxd mcu_xxd.c mcu_readl.o mcu_fatal.o

mcu_uniq: mcu_uniq.c mcu_readl.o mcu_fatal.o
	gcc -o mcu_uniq mcu_uniq.c mcu_readl.o mcu_fatal.o

mcu_wl: mcu_wl.c mcu_readl.o mcu_fatal.o
	gcc -o mcu_wl mcu_wl.c mcu_readl.o mcu_fatal.o

mcu_ww: mcu_ww.c mcu_readl.o mcu_fatal.o
	gcc -o mcu_ww mcu_ww.c mcu_readl.o mcu_fatal.o

mcu_rev: mcu_rev.c mcu_readl.o mcu_fatal.o
	gcc -o mcu_rev mcu_rev.c mcu_readl.o mcu_fatal.o

mcu_wc: mcu_wc.c mcu_readl.o mcu_fatal.o
	gcc -o mcu_wc mcu_wc.c mcu_readl.o mcu_fatal.o

mcu_readl.o: mcu_readl.c
	gcc -c mcu_readl.c

mcu_fatal.o: mcu_fatal.c
	gcc -c mcu_fatal.c

clean:
	-rm *.o

re:	clean all