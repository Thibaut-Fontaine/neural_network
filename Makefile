# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tfontain <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/03 21:09:36 by tfontain          #+#    #+#              #
#    Updated: 2017/08/05 01:21:44 by tfontain         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = neural_network.out

CFLAGS = -Wall -Wextra -Wpedantic -Werror -O3

CC = clang

INCLUDES_PATH = includes/

SRCS_PATH = srcs/

SRCS_NAME = main.c\

SRCS = $(addprefix $(SRCS_PATH), $(SRCS_NAME))

OBJS_PATH = objs/

OBJS_NAME = $(SRCS_NAME:.c=.o)

OBJS = $(addprefix $(OBJS_PATH), $(OBJS_NAME))

LIBRARY_PATH = libft/

LIBRARY = -lm -L $(LIBRARY_PATH) -lft -lncurses

MFLAGS = -j

all: odir
	@$(MAKE) $(MFLAGS) $(NAME)

$(NAME): $(OBJS)
	@Make $(MFLAGS) -C $(LIBRARY_PATH)
	@echo " - Making $(NAME)"
	@$(CC) $(CFLAGS) -o $(NAME) $^ $(LIBRARY)

$(OBJS_PATH)%.o: $(SRCS_PATH)%.c
	@echo " - Compiling $<"
	@$(CC) $(CFLAGS) -o $@ -c $< -I$(INCLUDES_PATH)

odir:
	@mkdir -p $(OBJS_PATH)

clean:
	@Make clean -C $(LIBRARY_PATH)
	@echo " - Cleaning objs"
	@rm -f $(OBJS)

fclean: clean
	@Make fclean -C $(LIBRARY_PATH)
	@echo " - Cleaning executable"
	@rm -f $(NAME)

re: fclean all

.PHONY: clean fclean re odir
