	.data
V:	.word -1, -2, -3, -4, -5, -6, -7, -8, -9, -10 

	.text
	.globl main
main:
	li	$t0, 0		                  
	li	$t1, 9		
	la	$t3, V	
bucle:
	sll	$t4, $t1, 2	
	addu	$t4, $t3, $t4
	lw	$t4, 0($t4)
	addu	$t0, $t0, $t4	
	addiu	$t1, $t1, -1	# i--
	bne	$t1, $zero, bucle
fibucle:
	jr	$ra		# Retorna


