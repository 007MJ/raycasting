#include "../raycasting.h"

int main(){
    char *map[] = {  "11111\n",
                    "10001\n",
                    "10001\n",
                    "10001\n",
                    "10001\n",
                    "10001\n",
                    "11111\n",
                    NULL
    };

    for (int i = 0; map[i] != NULL; i++)
    {
        printf("%s", map[i]);
    }
}