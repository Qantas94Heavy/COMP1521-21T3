#include <stdio.h>
#include <string.h>

#define MAX_SIZE 131072

int main(int argc, char **argv) {

    if (argc < 3) {
        fprintf(stderr, "Usage: %s <search term> <file>\n", argv[0]);
        return 1;
    }

    // argv[1]: search
    // argv[2]: file

    FILE *search_file = fopen(argv[2], "r");
    if (search_file == NULL) {
        perror(argv[2]);
        return 1;
    }

    // search the file for a word
    char line[MAX_SIZE];

    // Go through each line
    while (fgets(line, MAX_SIZE, search_file) != NULL) {
        // search for the input in our line
        if (strstr(line, argv[1]) != NULL) {
            // print the whole line
            fputs(line, stdout);
        }
    }

    fclose(search_file);

    return 0;
}
