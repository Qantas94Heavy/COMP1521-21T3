.text
main:
        la      $t0, v7         # load address of v7 into $t0

        li      $t1, 234        # $t1 = 234
        sw      $t1, 0($t0)     # v7.x = 234

        li      $t1, 456        # $t1 = 456
        sw      $t1, 4($t0)     # v7.y = 456

        lw      $t2, 0($t0)     # $t2 = v7.x
        lw      $t3, 4($t0)     # $t3 = v7.y


        li      $v0, 1
        move    $a0, $t2
        syscall

        li      $v0, 11
        li      $a0, '\n'
        syscall                 # print $t2

        li      $v0, 1
        move    $a0, $t3
        syscall

        li      $v0, 11
        li      $a0, '\n'
        syscall                 # print $t3


        jr      $ra

#struct my_type {
    #int x; # offset 0
    #int y; # offset 4
#};

.data
# struct my_type v7;
v7:
        .space 8


# struct my_type v8[4];
# (array of structs)
v8:
        .space 32


# struct my_type *v9[4];
# (array of pointers)
v9:
        .space 16

