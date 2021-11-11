#include <stdio.h>
#include <sys/stat.h>


int main(int argc, char **argv) {

    struct stat file_info;

    if (stat(argv[1], &file_info)) {
        perror("stat");
        return 1;
    }

    // If the file was publicly writable
    if (file_info.st_mode & S_IWOTH) {
        // Make it not publicly writable
        mode_t mode = file_info.st_mode & ~S_IWOTH;

        if (chmod(argv[1], mode)) {
            // oh no, an error happened
            perror("chmod");
            return 1;
        }
    } else {
        printf("File was not publicly writable\n");
    }

    return 0;
}

