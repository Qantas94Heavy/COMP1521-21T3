#include <sys/stat.h>
#include <stdio.h>

int main(void) {

    struct stat file_info;

    if (stat("last_week", &file_info)) {
        perror("stat: last_week");
        return 1;
    }

    if (S_ISDIR(file_info.st_mode)) {
        printf("Is a directory\n");
    } else {
        printf("Is not a directory\n");
    }

    printf("%o\n", file_info.st_mode);

    return 0;
}
