# arithmetic.asm program
# CS 64, Z.Matni
#
# 1. Prompt the user for 3 inputs: a, b, c
# 2. Calculate 8*( a - 5*b) + 64*c using only one mult instruction
# 3. Print out the result

.text
main:
	# TODO: Write your code here!
	#assign a, b, c with value
	li $v0, 5
	syscall
	move $t0, $v0
	li $v0, 5
	syscall
	move $t1, $v0
	li $v0, 5
	syscall
	move $t2, $v0
	
	#doing Calculate
	li $t3, 5
	mult $t3, $t1
	mflo $t4
	sub $t5, $t0, $t4
	sll $t6, $t5, 3
	sll $t7, $t2, 6
	add $t8, $t6, $t7

	#print out
	move $a0, $t8
	li $v0, 1
	syscall
	
exit:
	# Exit SPIM: Write your code here!
	li $v0, 10
	syscall