#import <stdio.h>

int main(int argc, char *argv[])
{
    int i = 0;

    if (argc == 2) {
        printf("One argument.\n");
    } else if (argc > 2 && argc < 4) {
        printf("Args: ");
        for (i = 1; i < argc; i++) {
            printf("%s ", argv[i]);
        }
        printf("\n");
    } else {
        printf("Too many arguments.\n");
    }
}
