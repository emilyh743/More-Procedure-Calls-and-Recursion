.text
.globl NchooseK

NchooseK:
	addi    $sp, $sp, -8        # Make room on stack for saving $ra and $fp
	sw      $ra, 4($sp)         # Save $ra
	sw      $fp, 0($sp)         # Save $fp

	addi    $fp, $sp, 4         # Set $fp to the start of proc1's stack frame

                                    # From now on:
                                    #     0($fp) --> $ra's saved value
                                    #    -4($fp) --> caller's $fp's saved value
                    

    # =============================================================
    # Save any $sx registers that proc1 will modify
                                # Save any of the $sx registers that proc1 modifies
	addi    $sp, $sp, -12       # e.g., $s0, $s1, $s2, $s3
	sw      $s0, 8($sp)         # Save $s0
	sw	$s1, 4($sp)
	sw	$s2, 0($sp)
                                # From now on:
                                #    -8($fp) --> $s0's saved value
    # =============================================================

	
	# base case
	addi $v0, $0, 1
	add $s0, $0, $a0
	add $s1, $0, $a1
	
	beq $s1, $0, endofNCK	# k == 0? then return 1
	beq $s0, $s1, endofNCK	# n == k? then return 1
	addi $a0, $a0, -1	# $a0-1
	addi $a1, $a1, -1	# $a1-1
	jal NchooseK
	add $s2, $v0, $0	#so 2nd jal won't destroy
	#call NchooseK(n-1, k)
	addi $a0, $s0, -1
	addi $a1, $s1, 0
	jal NchooseK
	add $v0, $v0, $s2	# NchooseK(n-1,k-1) + NchooseK(n-1,k)
	
	

	
endofNCK:

	lw $s0, -8($fp)         # Restore $s0
	lw $s1, -12($fp)         # Restore $s1
	lw $s2, -16($fp)		# Restore $s2
	
	addi    $sp, $fp, 4     # Restore $sp
        lw      $ra, 0($fp)     # Restore $ra
        lw      $fp, -4($fp)    # Restore $fp
        jr      $ra             # Return from procedure

    # =============================================================

	
