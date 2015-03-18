all: ex_28 ex_29

ex_29 : ex_29.c mcu_readl.o mcu_fatal.o mcu_wl.o mcu_ww.o mcu_wc.o
	gcc -o ex_29 ex_29.c pile.c mcu_readl.o mcu_fatal.o mcu_wl.o mcu_ww.o mcu_wc.o

ex_28 : ex_28.c mcu_readl.o mcu_fatal.o mcu_wl.o mcu_ww.o mcu_wc.o
	gcc -o ex_28 ex_28.c mcu_readl.o mcu_fatal.o mcu_wl.o mcu_ww.o mcu_wc.o

mcu_wl.o: mcu_wl.c
	gcc -c mcu_wl.c

mcu_ww.o: mcu_ww.c
	gcc -c mcu_ww.c

mcu_wc.o: mcu_wc.c
	gcc -c mcu_wc.c

mcu_readl.o: mcu_readl.c
	gcc -c mcu_readl.c

mcu_fatal.o: mcu_fatal.c
	gcc -c mcu_fatal.c

clean:
	-rm *.o

re:	clean all