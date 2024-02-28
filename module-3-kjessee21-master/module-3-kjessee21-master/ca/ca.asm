# Author: Kaden Jessee
# Date: 8 Feb 2022
# Description: Convert binary to decimal

.globl binary_to_dec, main			# Do not remove this line

# Data for the program goes here
.data
prompt: .asciiz "Enter a binary number: "
bin_num: .space 16 #store up to 15 + NewLine Character
equiv: .asciiz "Equivalent decimal number is: "

# Code goes here
.text
main:


	#print prompt label
	la $a0, prompt
	li $v0, 4
	syscall
	
	#collect user input, save it in bin_num
	li $v0, 8		#take input
	
	la $a0, bin_num		#load byte space into address
	li $a1, 16		#allot byte space for string
	syscall

	
	la $a0,	bin_num		#1. t4 = 0; Set up register as accumulator
	jal binary_to_dec	#2. start loop binary_to_dec()
	
	move $t4, $v0		#return string into $v0 -- copy value from $v0 to $t4
	
	la $a0, equiv		#prints equivalent line
	li $v0, 4
	syscall
	
	
	li $v0, 1		#Syscall for printing the integer
	move $a0, $t4
	syscall
	
end_main:
	li $v0, 10		# 10 is the exit program syscall
	syscall			# execute call

## end of ca.asm

###############################################################
# Convert ascii string of binary digits to integer
#
# $a0 - input, pointer to null-terminated string of 1's and 0's (requried)
# $v0 - output, integer form of binary string (required)
# $t0 - ascii value of the char pointed to (optional)
# $t1 - integer value (0 or 1) of the char pointed to (optional)

binary_to_dec:
	li $v0, 0				#initializing v0
	
loop:
	lb $t0, 0($a0)				#3. load first byte from input
	beq $t0, $zero, end_binary_to_dec	#4/5 if t0 = 0 || t0 = 0xa, end loop
	beq $t0, 0xa, end_binary_to_dec
	sll $v0, $v0, 1				#6 v0 <<
	sub $t0, $t0, 0x30			#7 t0 = 0x30, 1 in decimal
	or $v0, $v0, $t0			#8 OR v0, v0, t0 -- stores return value of v0
	addi $a0, $a0, 1			#move to next byte in a0
	j loop

end_binary_to_dec:
        jr $ra
