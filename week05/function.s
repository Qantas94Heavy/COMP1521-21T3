.text
main:
main__prologue:
        # the stack, save stuff that we need to keep for later
        addi    $sp, $sp, -4    # give us space to store 4 bytes
        sw      $ra, ($sp)      # store the old $ra into the stack

        li      $s0, 25
        li      $s1, 45

        move    $a0, $s0
        jal     print_int       # run the function print_int with value $t0

        move    $a0, $s1
        jal     print_int

main__epilogue:
        lw      $ra, ($sp)      # load the original $ra back from the stack
        addi    $sp, $sp, 4     # change stack pointer back to original value

        jr      $ra


# FUNCTION: print_int
# $a0: the number you want to print
print_int:
print_int__prologue:
        # the stack, save stuff that we need to keep for later
        addi    $sp, $sp, -8    # give us space to store 8 bytes
        sw      $ra, 0($sp)     # store the old $ra into the stack
        sw      $s1, 4($sp)

print_int__body:
        addi    $s1, $a0, 5
        move    $a0, $s1

        li      $v0, 1
        # it's already in $a0
        syscall                 # prints $t0 as an int
        
        li      $v0, 11
        li      $a0, '\n'
        syscall                 # prints a new line

print_int__epilogue:
        lw      $ra, 0($sp)     # store the old $ra into the stack
        lw      $s1, 4($sp)
        addi    $sp, $sp, 8

        # end of the function!
        jr      $ra             # jump to the address in register $a1
