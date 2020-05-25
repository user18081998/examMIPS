# Program File: td4ex1-2.asm
# Author: Ahmed Mustapha Ghanmi
# Purpose: TD4EX1 Question2 et 3
#####################################################
.data

#####################################################
.text
main:

	#set initial variables
	#the value 0x12345678 is a 32-bit constant 
	lui $s1,0x1234		#loading upper 16 bits,		 $s1=0x12340000
	ori $s1,$s1,0x5678	#inserting the lower 16 bits	 $s1=0x12345678
	#same for 0xFFFF9A00 
	lui $s2,0xFFFF		#loading upper 16 bits,		 $s2=0xFFFF0000	
	ori $s2,$s2,0x9A00	#inserting the lower 16 bits	 $s2=0xFFFF9A00
	
	and $s3,$s1,$s2 # $s3 = 0x12341200
	or $s4,$s1,$s2  # $s4 = 0xffffde78
	xor $s5,$s1,$s2 # $s5 = 0xedcbcc78
	nor $s6,$s1,$s2 # $s6 = 0x00002187