# More-Procedure-Calls-and-Recursion

Computer Organization course assignment in C and MIPS.

This excercise dealt with writing MIPS assembly code using multiple files, one procedure per file. By specifying such a decomposition, the idea was to give more practice with writing modular code. The exercise involves assembly coding of 5 distinct procedures. Task was to write the other three assembly procedures in a robust manner, following calling conventions and with appropriate stack management.

Procedure main repeatedly reads a pair of integers (a, b) from the terminal, and then calls do_task(a, b). If a value of 0 was read for a by main, then it terminates the program without reading b. The procedure do_task(a, b) computes two mathematical functions and prints their results. First, it calls NchooseK(n, k) but with n = a+b and k = a, i.e., NchooseK(a+b, a), and prints its result. Next, it calls Fibonacci(b), and prints its result. To print both these results, procedure print_it() is used.

NchooseK: has recursive implementation of this function

Fibonacci: has recursive implementation of a function that computes the N-th Fibonacci number, i.e., Fibonacci(N)

do_task: assembly code for the do_task procedure

main: In addition to performing the tasks described, implementation of main "stress tests" code by reading in initial values of registers $s0-$s7 before calling your functions. At the end, it prints the final values of registers $s0-$s7. These final values is the same as the initial values because none of the procedures should tamper with the values of these saved registers, i.e., if the procedures modify any of these registers, they will save and restore them by appropriately using the stack.

print_it: prints. This procedure also "stress tests" the code by destroying the values of temporary registers: $a0-$a3, $v0-$v1, and $t0-$t9.
