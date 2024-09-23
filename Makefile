NAME   =  raycasting
RM     = rm -fr
CFLAGS  = -Wall -Werror -Wextra
#-g -fsanitize=address
MLX    = -framework Cocoa -framework OpenGL -framework IOKit

USER   = $(shell whoami)
MLX42_REPO = https://github.com/codam-coding-college/MLX42.git
LIBMLX = MLX42/build/libmlx42.a -Iinclude -lglfw -L"/Users/$(USER)/homebrew/opt/glfw/lib"
# MLX_INC = -Iinclude -lglfw -L "/Users/$(USER)/homebrew/opt/glfw/lib"




CC     = gcc

MLX42_DIR = MLX42
MLX42_BUILD_DIR = $(MLX42_DIR)/build
SRCS   = src/main.c 

OBJS   = $(SRCS:.c=.o)


all : mlx42 $(NAME)

$(NAME) : $(OBJS)
	$(CC) $(OBJS) $(CFLAGS) $(LIBMLX) -o $@

%.o : %.c
	$(CC) $(CFLAGS) -o $@ -c $^

clean :
	$(RM) $(OBJS)

fclean : clean
	$(RM) $(NAME)

re : fclean all

mlx42 :
	@git clone $(MLX42_REPO) $(MLX42_DIR)
	@cd $(MLX42_DIR) && cmake -B build
	@cd $(MLX42_DIR) && cmake --build build -j4