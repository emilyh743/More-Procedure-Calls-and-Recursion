.text
.globl Fibonacci
Fibonacci:
    addi    $sp, $sp, -8        # Make room on stack for saving $ra and $fp
    sw      $ra, 4($sp)         # Save $ra
    sw      $fp, 0($sp)         # Save $fp

    addi    $fp, $sp, 4         # Set $fp to the start of Fibonacci's stack frame

                                # From now on:
                                #     0($fp) --> $ra's saved value
                                #    -4($fp) --> caller's $fp's saved value
    addi $sp, $sp, -8
    sw $s0, 4($sp)
    sw $s1, 0($sp)
    #int Fibonacci(int i) {
    #  if((i==0) || (i==1))
    #    return i;
    #  else
    #    return Fibonacci(i-1) + Fibonacci(i-2);
    #}
    
    # Your code here: 
    # base case
    #beq $a0, 0, returni
    #beq $a0, 1, returni
    #jal Fibonacci1
    
    
        add $v0, $0, $a0	# input in $a0
        add $s0, $a0, $0
	#add $s0, $0, $a0
	#add $s1, $0, $a1
	beq $a0, 0, exit_from_Fibonacci
	beq $a0, 1, exit_from_Fibonacci	
	addi $a0, $a0, -1	
	jal Fibonacci
	add $s1, $v0, $0	
	addi $a0, $s0, -2
	jal Fibonacci
	add $v0, $v0, $s1
	
	
	
    #returni:
    #add $v0, $0, $a0
    #ori $v0, $0, 1		# print i
    #j exit_from_Fibonacci
    
    #Fibonacci1:
    #add $sp, $sp, -4   # 1 word
    #sw $a0, 0($sp)     # put on stack - pointing to bottom most allocated word
    #addi $a0, $a0, -1  # Fibonacci(i-1)
    #jal to Fibonacci, store return value $v0 on stack, restore $a0 (so it saved)
    #jal Fibonacci
    #add $sp, $sp, -4
    #sw $v0, 0($sp)     # store $v0 on stack
    #lw $a0, 4($sp)   # restore $a0
    #addi $a0, $a0, -2  # Fibonacci(i-2)
    #jal Fibonacci
    # deallocate stack (clean up stack); don't need to worry about storing $a0
    #lw $t0, 0($sp)     # gives the temp value of $v0
    #add $sp, $sp, 8    # clean up stack (deallocate)
    #add $v0, $v0, $t0 # Fibonacci(i-1) + Fibonacci(i-2)
    
exit_from_Fibonacci:
    # =============================================================
    # Restore $fp, $ra, and shrink stack back to how we found it,
    #   and return to caller.
    lw $s0, -8($fp)
    lw $s1, -12($fp)
    
    addi    $sp, $fp, 4     # Restore $sp
    lw      $ra, 0($fp)     # Restore $ra
    lw      $fp, -4($fp)    # Restore $fp
    jr	    $ra
end_of_Fibonacci:
    
