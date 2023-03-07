#BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I HAVE PERFORMED ALL 
##O ASSISTANCE FROM ANY PERSON OTHER THAN THE INSTRUCTOR OF THIS COURSE 
#OR ONE OF OUR UNDERGRADUATE GRADERS. .  I UNDERSTAND THAT TO DO OTHERWISE
#IS A VIOLATION OF OHIO STATE UNIVERSITY’S ACADEMIC INTEGRITY POLICY.
#Name: Jason Fong Shen Yik

.file "sum.s"
.section	.rodata.str1.1,"aMS",@progbits,1
PR_1:
	.string "\nSize of the array: %i\n"
Result:
	.string "\nThe max is: %i"
	
PInt:
	.string "%i "
	
.data
.align 8
array:
	.quad 1
	.quad 2
	.quad 3
	.quad 4
	.quad 5
	.quad 6
	.quad 7
	.quad 8
	.quad 9
	.quad 10

.globl sum
	.type	sum, @function
.text
sum:
	pushq %rbp		# stack frame management
	movq %rsp, %rbp	# stack frame management

	pushq %rax 		# return value
	pushq %rdi 		# array values
	pushq %rsi 		# value 10
	
	movq $PR_1, %rdi
	movq $0, %rax
	call printf
	
	popq %rsi 		# get values back so my loop still works
	movq $array, %rdi 		# Note that the pop instructions are in the opposite order of the pushes
	popq %rax

	movq $0, %rax
loop:
	decq %rsi
	jl exit
	addq (%rdi,%rsi,8), %rax
	jmp loop
exit:
	movq %rax, %rsi

	movq $Result, %rdi		#address of string " The sum.." to rdi
	movq $0,%rax			#set return value to 0
	call printf
	movq $array, %rdi		#restore the array values
	movq $10, %rsi 			#restore the input value

	leave
	ret
.size sum,.-sum
