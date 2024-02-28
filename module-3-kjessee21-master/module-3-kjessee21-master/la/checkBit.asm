#Author: Kaden Jessee
#desc: play with bitwise operations

.globl main	#name of "functions

.data

.text
main:

li $t0, 0xDB	# 1101 1011
		# 0110 0000 = 0x60
#psuedocode
# is bit 5,6 (index notation) ON in t0?
andi $t1, $t0, 0x60
srl $t2, $t1, 5

li $v0, 1	#print  integer
move $a0, $t2
syscall

end_main:
	li $v0, 10 #exit code
	syscall