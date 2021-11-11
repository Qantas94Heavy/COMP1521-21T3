#include <stdio.h>

int main(int argc, char **argv) {
    FILE *fp = fopen(argv[1], "r");

    if (fp == NULL) {
        perror("example");
        return 1;
    }

    fseek(fp, 25, SEEK_SET);

    char str[100];
    fgets(str, 100, fp);
    printf("%s", str);

    fseek(fp, 0, SEEK_SET);

    fgets(str, 100, fp);
    printf("%s", str);
    fclose(fp);

    return 0;
}

/*

a. offset = 10000 bytes
b. offset = 10000 - 1000 = 9000
c. offset = 0
d. offset = 0 (function error)
e. offset = 1000
f. offset = 1000 + 1000 = 2000

*/
