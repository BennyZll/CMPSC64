# maximum.asm program
# CS 64, Z.Matni
#
# Get 3 integer inputs from the user (std.in)
# Reveal the maximum absolute value (e.g., entering -3, 2, 1 will give the answer 3)
# See assignment description for details

#Data Area (i.e. memory setup directive)
.data
	# TODO: Complete these incomplete declarations / initializations

message:	.asciiz "Enter the next number:\n"
max:        .asciiz "Maximum: "
newline:    .asciiz "\n"

#Text Area (i.e. instructions/code directive)
.text

main:

	# TODO: Write your code here
    # You can have other labels expressed here, if you need to
	li $v0, 4
	la $a0, message
	syscall

	li $v0, 5
	syscall
	move $t0, $v0
	srl $t4, $t0, 31
	bne $t4, $zero, abs1
	j store1

	abs1:
		nor $t0, $t0, $zero
		addi $t0, $t0, 1
		j store1
	store1:
    	move $t1, $t0

	li $v0, 4
	la $a0, message
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	srl $t4, $t0, 31
	bne $t4, $zero, abs2
	j store2

	abs2:
		nor $t0, $t0, $zero
		addi $t0, $t0, 1
		j store2
	store2:
    	move $t2, $t0

	li $v0, 4
	la $a0, message
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	srl $t4, $t0, 31
	bne $t4, $zero, abs3
	j store3

	abs3:
		nor $t0, $t0, $zero
		addi $t0, $t0, 1
		j store3
	store3:
    	move $t3, $t0

#compare
	move $t4, $t1
	bgt $t2, $t4, set_b
	j check_c

set_b:
	move $t4, $t2

check_c:
	bgt $t3, $t4, set_c
	j done

set_c:
	move $t4, $t3

done:
	la $a0, max
	li $v0, 4
	syscall
	move $a0, $t4
	li $v0, 1
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	j exit


exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall
