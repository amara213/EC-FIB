	.data
V:	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 

	.text
	.globl main
main:
	li	$t0, 0		                   
	li	$t1, 0		
	li	$t2, 10		
bucle:
	slt	$t3, $t1, $t2
	beq	$t3, $zero, end_ 
	la	$t3, V 		
	sll	$t4, $t1, 2	# $t4 = 4*i
	addu	$t3, $t3, $t4	# @V[i]
	lw	$t3, 0($t3)	#  $t3 = V[i]
	addu	$t0, $t0, $t3	#suma = suma + V[i]
	addiu	$t1, $t1, 1	# i++
	b	bucle		                
end_:

	li	$t3, 0		# Posem $t3 a 0 (quocient suma/i)  
bucle2:
	slt	$t4, $t0, $t1
	bne	$t4, $zero, end_2
	subu	$t0, $t1, $t0
	addiu	$t3, $t3, 1
	b	bucle2
end_2:
	jr	$ra		# Retorna


