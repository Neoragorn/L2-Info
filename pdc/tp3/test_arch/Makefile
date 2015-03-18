
all: ex_23 ex_24 ex_25 ex_26 ex_27

ex_27 : ex_27.c mcu_readl.o mcu_fatal.o
	gcc -o ex_27 ex_27.c mcu_readl.o mcu_fatal.o

ex_26 : ex_26.c mcu_readl.o mcu_fatal.o
	gcc -o ex_26 ex_26.c mcu_readl.o mcu_fatal.o

ex_25 : ex_25.c mcu_readl.o mcu_fatal.o
	gcc -o ex_25 ex_25.c mcu_readl.o mcu_fatal.o

ex_24 : ex_24.c mcu_readl.o mcu_fatal.o
	gcc -o ex_24 ex_24.c mcu_readl.o mcu_fatal.o

ex_23 : ex_23.c
	gcc -o ex_23 ex_23.c

mcu_readl.o: mcu_readl.c
	gcc -c mcu_readl.c

mcu_fatal.o: mcu_fatal.c
	gcc -c mcu_fatal.c

clean:
	-rm *.o

re:	clean all