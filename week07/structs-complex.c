#include <stdio.h>

struct my_type {
    int x;
    int y;
    char a;
    char b;
};

struct my_type *max_x(struct my_type a[], int length) {
    struct my_type *first_element = &a[0];
    if (length == 1) {
        return first_element;
    } else {
        // find max value in rest of array
        struct my_type *max_so_far = max_x(&a[1], length - 1);
        if (first_element->x > max_so_far->x) {
            max_so_far = first_element;
        }
        return max_so_far;
    }
}

int main(void) {
    struct my_type array[3];
    array[0].x = 1;
    array[0].y = 0;
    array[0].a = 20;
    array[0].b = 40;

    array[1].x = 2;
    array[1].y = 5;
    array[1].a = 20;
    array[1].b = 50;

    array[2].x = 3;
    array[2].y = 6;
    array[2].a = 20;
    array[2].b = 60;

    struct my_type *result = max_x(array, 3);
    printf("%d\n", result->b);
    return 0;
}
