	.data
V:	.word -1, -2, -3, -4, -5, -6, -7, -8, -9, -10  # vector

	.text
	.globl main
main:
	li	$t0, 0		
	li	$t1, 0	
	li	$t2, 10		
bucle:
	slt	$t3, $t1, $t2
	beq	$t3, $zero, fi_	
	la	$t3, V		
	sll	$t4, $t1, 2	
	addu	$t3, $t3, $t4	
	lw	$t3, 0($t3)
	addu	$t0, $t0, $t3	
	addiu	$t1, $t1, 1
	b bucle		               
fi_:
	jr	$ra		# Retorna


