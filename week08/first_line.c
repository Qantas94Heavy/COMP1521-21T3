#include <stdio.h>
#include <errno.h>

int main(void) {
    FILE *file = fopen("first_adfafdjajfsddsaline.c", "r");

    if (file == NULL) {
        // There's been some error opening the file
        // printf("%d\n", errno);
        perror("file opening");
        return 0;
    }

    char line[100];
    fgets(line, 100, file);

    fputs(line, stdout);

    fclose(file);

    return 0;
}
