# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dacortes <dacortes@student.42barcelona.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/08 10:25:51 by dacortes          #+#    #+#              #
#    Updated: 2023/02/08 11:04:38 by dacortes         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# =============================== VARIABLES ================================== #

NAME	=	libftprintf.a
CC		=	gcc
RM		=	rm -rf
FLAGS	=	-Wall -Wextra -Werror
LIBC	=	ar -rcs

# =========================== SOURCES ======================================== #

SRCS  = ft_printf.c ft_type_cs.c\
		ft_type_idupxX.c

# =========================== DIRECTORIES ==================================== #

D_OBJ = obj
#.o
OBJ = $(addprefix $(D_OBJ)/, $(SRCS:.c=.o))
DEP = $(addprefix $(D_OBJ)/, $(SRCS:.c=.d))
#Bonus .o
B_OBJ = $(addprefix $(D_OBJ)/, $(BONUS:.c=.o))
B_DEP = $(addprefix $(D_OBJ)/, $(BONUS:.c=.d))

# =========================== BOLD COLORS ==================================== #

E = \033[m
R = \033[31m
G = \033[32m
Y = \033[33m
B = \033[34m
#Font
ligth = \033[1m
dark = \033[2m
italic = \033[3m

# ========================== MAKE RULES ===================================== #
all:	dir $(NAME)
-include $(DEP)
-include $(B_DEP)
dir: 
	@mkdir -p $(D_OBJ)
$(D_OBJ)/%.o:%.c
	@printf "$(ligth)$(Y)\r $@$(E)"
	@$(CC) -MMD $(FLAGS) -c $< -o $@
$(NAME):	${OBJ}
	@$(LIBC) $(NAME) $(OBJ)
	@touch $(NAME)
	@echo -e "\n$(B)$(ligth)-->$(G) ==== Project libft compiled! ==== ✅$(E)"
bonus:	dir ${B_OBJ} $(NAME)
	@if [ -f bonus ]; then\
		echo -e "$(B)$(ligth)--> make:$(E)$(ligth) 'bonus' is up to date.$(E)";\
	else\
		$(LIBC) $(NAME) $(OBJ) $(B_OBJ);\
		touch bonus;\
		echo -e "$(B)$(ligth)-->$(G)Bonus created OK$(E)";\
	fi
# ========================== CLEAN   ===================================== #
.PHONY: clean fclean re
clean:
	@$(RM) $(D_OBJ) bonus
	@echo -e "$(B)$(ligth)-->$(E)$(ligth) ==== Libft object files cleaned! ==== ✅$(E)"
fclean: clean
	@$(RM) $(NAME)
	@echo -e "$(B)$(ligth)-->$(E)$(ligth) ==== Libft executable files and name cleaned! ==== ✅$(E)"
re: fclean all
