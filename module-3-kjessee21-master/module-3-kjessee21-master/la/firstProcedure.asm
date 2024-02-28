#Author: Kaden Jessee
#desc: Create first procedures

.globl main, hello_world, hello_msg, add_two	#name of "functions

.data
hi: .asciiz "Hello from procedure\n"
hola: .asciiz "Hola desde el procedure\n"

.text
main:
	jal hello_world	# HelloWorld();

	la $a0, hi	#Set parameter
	jal hello_msg	#HelloMsg();

	la $a0, hola	#Set parameter
	jal hello_msg	#HelloMsg();
	
	# Call add_two(10,30)
	# print("%d\n", add_two(10,30);
	li $a0, 10	#load n1
	li $a1, 30	#load n2
	jal add_two	#result in $v0
	move $s0, $v0
	#print result
	li $v0, 1
	move $a0, $s0
	syscall

end_main:
	li $v0, 10 #exit code
	syscall
	
# Procedure: void HelloWorld()
# 	print hi message
# Reigster mapping:
# None
hello_world:
	li $v0, 4	#print string
	la $a0, hi
	syscall
	
end_hello_world:
	jr $ra
	
# Procedure: void HelloMsg(string msg)
# 	print msg string
# Reigster mapping:
#	$a0, string to print
# 	Returns: None
hello_msg:
	li $v0, 4	#print string
	#la $a0, hi	#set by caller
	syscall
	
end_hello_msg:
	jr $ra
	
# Procedure: int AddTwo(int n1, int n2)
# 	int total = n1 + n2;
#	return total;
# Reigster mapping:
#	$a0, first parameter (n1)
#	$a1, second parameter (n2)
#	Returns: $v0: total
add_two:
	move $t0, $a0
	move $t1, $a1
	add $v0, $t0, $t1
end_add_two:
	jr $ra