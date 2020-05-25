# Program File: td5ex1.asm
# Author: Ahmed Mustapha Ghanmi
# Purpose: TD5EX1 absolute value
#####################################################
.data
A: .word -1
####################################################
.text
main:

	#Obtenir A
	lui $10, 0x1000 	# Initialiser le registre de base
	lw $8, 0($10) 		# charger A
	sll $0, $0, 0 		# no-op
	
	# A est-il négatif?
	srl $9, $8,31 		# décaler bit de signe à position 0
	beq $9,$zero, fin 	# bit de signe == zero, va à fin
	sll $0, $0, 0 		# no-op
	
	# Enregistrer -A
	subu $8,$zero,$8 	# calculer -A
	sw $8, 0($8) 		# le sauvegarder
	
fin: 
	sll $0,$0,0		#ne rien faire
