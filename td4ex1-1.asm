# Program File: td4ex1-1.asm
# Author: Ahmed Mustapha Ghanmi
# Purpose: TD4EX1 Question1
#	   demande l'utilisateur de saisir A et B puis calcule A+2B-5 
#####################################################
.data 
promptA: .asciiz "Please enter your integer A : "
promptB: .asciiz "\nPlease enter your integer B : "
output: .asciiz "\nA+2B-5="
#####################################################

.text
main:
	# Prompt for the integer to enter A
	li $v0, 4		# Load 4 into $v0 to indicate a print string
	la $a0, promptA		#load the address of promptA into a0 
	syscall
	# Read the integer and save it in $t0
	li $v0, 5 		#load 5 into $v0 to indicate a load integer
	syscall
	move $t0, $v0		#move the integer to from v0 to t0
	
	# Prompt for the integer to enter B
	li $v0, 4		# Load 4 into $v0 to indicate a print string
	la $a0, promptB		#load the address of promptB into a0 
	syscall
	# Read the integer and save it in $t1
	li $v0, 5		#load 5 into $v0 to indicate a load integer
	syscall
	move $t1, $v0		#move the integer to from v0 to t1
	
	#perform the calculations
	sll $t1,$t1,1 		#shift t1 to the left, *t1=*t1 *2
	addu $t2,$t1,$t0 	#*t2=*t1+*t0
	sub $t2,$t2,5	 	#*t2=*t2-5
	
	# Output text
	li $v0, 4		# Load 4 into $v0 to indicate a print string
	la $a0, output		#load the address of output into a0 
	syscall
	
	#output result
	li $v0, 1		# Load 1 into $v0 to indicate a print integer
	move $a0, $t2		#move contents of t2 into a0 to print them
	syscall 
	
	# Exit program
	li $v0, 10		# Load 10 into $v0 to indicate exit
	syscall
