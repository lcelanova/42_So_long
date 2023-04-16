# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lmunoz-f <lmunoz-f@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/16 14:25:48 by lmunoz-f          #+#    #+#              #
#    Updated: 2023/04/16 14:25:49 by lmunoz-f         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ------------------------------ Sources ------------------------------

# Files
SOLONG		=	so_long.c

LIBFT		=	cd libft && make

LIB			=	libft/libft.a

# Sources and objects
SOLONG_SRC	=	$(SOLONG)

SOLONG_OBJS	=	$(SOLONG_SRC:.c=.o)


OBJS		=	$(SOLONG_OBJS)

# ------------------------------ Constant strings ------------------------------

GCC			=	gcc

FLAGS		=	-Wall -Wextra -Werror

INCLUDE		=	-I include

NAME		=	solong

# ------------------------------ Colors ------------------------------

BOLD_PURPLE	=	\033[1;35m

BOLD_CYAN	=	\033[1;36m

BOLD_YELLOW	=	\033[1;33m

NO_COLOR	=	\033[0m

# ------------------------------ Messages ------------------------------

COMP_START	=	echo "\n🚧 $(BOLD_YELLOW)Make: $(NO_COLOR)Starting the compilation...\n"

SOLONG_READY	=	echo "\n🎮 $(NO_COLOR) So long ready !\n"

CLEANED		=	echo "\n💧 $(BOLD_YELLOW)Clean: $(NO_COLOR)Removed all the \".o\" files \n"

FCLEANED	=	echo "\n🧼 $(BOLD_YELLOW)Fclean: $(NO_COLOR)Removed the executables \n"

# ------------------------------ Rules ------------------------------

all: $(NAME)

$(NAME): libft solong

libft:
	@$(COMP_START)
	@$(LIBFT)

solong: $(SO_LONG_OBJS)
	@$(GCC) $(FLAGS) $(SO_LONG_OBJS) $(LIB) -o $(NAME)
	@$(SOLONG_READY)

clean:
	@rm -rf $(OBJS)
	@cd libft && make clean
	@$(CLEANED)

fclean: clean
	@rm -rf $(NAME)
	@cd libft && make fclean
	@$(FCLEANED)

.c.o:
	@${GCC} ${FLAGS} $(INCLUDE) -c $< -o ${<:.c=.o}

re:	fclean all

.PHONY: all solong clean fclean re libft