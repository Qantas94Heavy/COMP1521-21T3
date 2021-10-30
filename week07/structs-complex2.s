MY_TYPE_SIZE = 12

.text
main:
main__prologue:
        addi    $sp, $sp, -4
        sw      $ra, 0($sp)

main__body:
        la      $a0, array
        li      $a1, 3
        jal     max_x           # max_x(array, 3);
        move    $t0, $v0        # $t0 = $v0


        # $t0 is the start address
        # of the struct with the max x value
        lb      $a0, 9($t0)     # get result->b
        li      $v0, 1
        syscall                 # print result->b

        li      $a0, '\n'
        li      $v0, 11
        syscall                 # print '\n'


main__epilogue:
        lw      $ra, 0($sp)
        addi    $sp, $sp, 4
        jr      $ra             # return from main


# $a0 = array of my_type structs, $a1 = length
max_x:
max_x__prologue:
        addi    $sp, $sp, -8    # requesting 4 bytes of memory from the stack
        sw      $ra, 0($sp)
        sw      $s0, 4($sp)

max_x__body:
        move    $s0, $a0        # first_element

        bne     $a1, 1, max_x__find_max

        move    $v0, $s0        # return value = first_element
        j       max_x__epilogue # return

max_x__find_max:
        addi    $a0, $s0, MY_TYPE_SIZE
        addi    $a1, $a1, -1
        jal     max_x       # max_x(&a[1], length - 1)
        move    $t0, $v0        # $t0 = ret val (i.e. max_so_far)

        lw      $t1, 0($s0)     # $t1 = first_element->x
        lw      $t2, 0($t0)     # $t2 = max_so_far->x

        ble     $t1, $t2, max_x__return_max_so_far

        move    $t0, $s0        # max_so_far = first_element

max_x__return_max_so_far:
        move    $v0, $t0        # ret val = $t0 (max_so_far)

max_x__epilogue:
        lw      $ra, 0($sp)
        lw      $s0, 4($sp)
        addi    $sp, $sp, 8     # releasing 4 bytes of memory back to the stack

        jr      $ra             # return



.data
array:
        .word 1, 0      # array[0]
        .byte 20, 40

        .word 2, 5      # array[1]
        .byte 20, 50

        .word 3, 6      # array[2]
        .byte 20, 60


