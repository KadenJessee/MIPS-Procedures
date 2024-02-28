#Author: Kaden Jessee
# Desc: Play with bitwise operations

.globl main	#name of "functions"

.data

.text
main:

li $t0, 10
li $t1, 12
# Pseudocode
# c = (a < b) || ((a+b) == 10)
# Register mapping:
# a = t0, b = t1, c = t2
add $t3, $t0, $t1	# (a+b)
li $t4, 10		# load immediate: 10
seq $t3, $t3, $t4	# if($t3 == $t4), then $t3
slt $t2, $t0, $t1	# t2 = a < b
or $t2, $t2, $t3	# c = c | temp


end_main:
	li $v0, 10	# exit code
	syscall