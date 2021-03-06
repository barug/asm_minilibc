##
## Makefile for lib_asm in /home/barthe_g/rendu/tek2/asm/asm_minilibc
## 
## Made by Barthelemy Gouby
## Login   <barthe_g@epitech.net>
## 
## Started on  Wed Mar 23 14:48:38 2016 Barthelemy Gouby
## Last update Sun Mar 27 16:02:05 2016 Barthelemy Gouby
##

RM = rm -rf

AS = nasm

ASFLAGS += -f elf64 -F dwarf

CC = gcc

LDFLAGS += -shared -fPIC -g

SRCS = 	strlen.s	\
	strchr.s	\
	memset.s	\
	memcpy.s	\
	strcmp.s	\
	memmove.s	\
	strncmp.s	\
	strcasecmp.s	\
	rindex.s	\
	strstr.s

OBJS = $(SRCS:.s=.o)

NAME = libasm.so

%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(OBJS) -o $(NAME) $(LDFLAGS)

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: clean fclean re all
