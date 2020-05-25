# Program File: td4ex2.asm
# Author: Ahmed Mustapha Ghanmi
# Purpose: TD4EX2 char case swapping 
#	   demander a l'utilisateur de saisir un caractere alphabetique puis 
#	   puis afficher le caractere en switchant de maj en min ou min a maj
#####################################################
.data
prompt: .asciiz "Please enter a character : "
output: .asciiz "\nThe character swapped is : "

#####################################################
.text
main:
	# prompt the user to enter a character
	li $v0, 4		# Load 4 into $v0 to indicate a print string
	la $a0, prompt		#load the address of prompt into a0
	syscall
	# Read the character and save it in $t0
	li $v0, 12 		#load 12 into $v0 to indicate a read character
	syscall
	move $t0, $v0		#move the char to from v0 to t0
	
	#if(*t0<='Z') then upper, else lower 
	slti $t1, $t0, 91
	li $t2, 1
	beq $t1, $t2, upper 
	bne $t1, $t2, lower
	
upper:
	addi $t0, $t0, 32 	#adds 32 to the character value to lowercase it
	j done

lower:
	addi $t0, $t0, -32 	#subtracts 32 from the character value to capitalize it
	j done
	
done:
	
	#output message
	li $v0, 4		# Load 4 into $v0 to indicate a print string
	la $a0, output		#load the address of output into a0
	syscall
	
	#printing the character
	li $v0, 11		# Load 11 into $v0 to indicate a character print
	move $a0, $t0		#moving t0 into a0 to print it
	syscall 
	
	#halt
	li $v0, 10		# Load 10 into $v0 to indicate exit
	syscall