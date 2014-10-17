# Author:Leno Hou<houstar@foxmail.com>
# Date: Oct 13,2014

SHELL=/bin/bash
CROSS_COMPILE :=arm-none-linux-gnueabi-g++
CPPFLAG=-Wall -O2 -g    
CFLAG=-g
LIBS=
LDFLAGS= -lpthread -lrt
KERNEL_DIR=/home/houstar/ezsdk/board-support/linux-2.6.37-psp04.04.00.01/
INCLUDE= -I$(KERNEL_DIR)/include -I$(KERNEL_DIR)/arch/arm/include/

TARGET = bin/Hzcat 
SRC = $(wildcard *.cpp *.o)  
SRC +=$(wildcard utils/*.cpp utils/*.o)
SRC +=$(wildcard core/*.cpp core/*.o)
OBJ = $(patsubst %.cpp, %.o, $(SRC)) 

$(TARGET) : $(OBJ)  
	$(CROSS_COMPILE) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $(LIBS)   $(INCLUDE) $(LIB) $^ -o $@ 
%.o:%.cpp 
	$(CROSS_COMPILE) -c $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $(LIBS) $<  $(INCLUDE) $(LIB) -o $@  
.PHONY: clean  
clean:  
	$(RM)  $(TARGET) $(OBJ) 
