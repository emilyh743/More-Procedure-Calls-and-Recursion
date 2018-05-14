.text
.globl do_task
do_task:			# void do_task(int a, int b) {

  addi	$sp, $sp, -8        	# Set up stack
  sw	$ra, 4($sp)
  sw	$fp, 0($sp)
  addi  $fp, $sp, 4             # Set $fp to the start of do_task's stack frame

  # Your code here	
  # int n, k, result;
  # n = a+b;
  # k = a;
  add $sp, $sp -4		# 2 words
  sw $s1, 0($sp)		# store on stack; $a0 is n
  
  add $s1, $0, $a1		# save b as $s1
  
  add $t0, $a0, $a1    # check later. maybe don't use $a0; $t0 = n
  add $t1, $a0, $0	#$t1 = k
	  	  #sw $a1, 4($sp)		# store on stack; $a1 is k
	  #add $a0, $a0, $a1
	  #lw $a1, 0($sp)
	  #jal do_task
  move $a0, $t0
  move $a1, $t1
  # result = NchooseK(n, k);
  # print_it(result);
  jal NchooseK			# call NchooseK
  move $a0, $v0
  jal print_it
  #add $sp, $sp, -4		# 1 word for "result"
  #sw $a2, 8($sp)		# store on stack; $a2 has "result"
  
  # result = Fibonacci(b);
  # print_it(result);
  move $a0, $s1
  jal Fibonacci
  move $a0, $v0
  jal print_it
  
exit_from_do_task: 			# }
  lw $s1, -8($fp)
  
  addi	$sp, $fp, 4 		# restore $ra, $fp and $sp
  lw	$ra, 0($fp)
  lw	$fp, -4($fp)
  jr	$ra             	# return from procedure
end_of_do_task:
