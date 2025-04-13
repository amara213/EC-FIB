	.data

w:        .asciiz "8754830094826456674949263746929"
resultat: .byte 0

	.text
	.globl main
main:
	addiu	$sp, $sp, -4	
	sw	$ra, 0($sp)
	la	$a0, w			
	li	$a1, 31
	jal	moda		
	la	$s0, resultat		
	sb	$v0, 0($s0)		
	move	$a0, $v0		
	li	$v0, 11
	syscall			
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	jr 	$ra		

nofares:
	jr	$ra	


moda:
	addi $sp, $sp, -60		
	sw $s0, 40($sp)			
	sw $s1, 44($sp)
	sw $s2, 48($sp)
	sw $s3, 52($sp)
	sw $ra, 56($sp)

	li $t0, 0			
	li $t1, 10
	move $t2, $sp		
for:	beq $t0, $t1, fi	
	sw $zero, 0($t2)
	addi $t2, $t2, 4
	addi $t0, $t0, 1
	b for

fi:	move $s0, $a0		
	move $s1, $a1
	li $s2, 0		
	li $s3, '0'
	
for_2:	bge $s2, $s1, fi_2		
	
	move $a0, $sp			
	add $t0, $s0, $s2
	lb $t0, 0($t0)
	addi $a1, $t0, -48		
	addi $a2, $s3, -48
	
	jal	update
	
	addi $s3, $v0, '0'		
	addi $s2, $s2, 1
	b for_2

fi_2:	move $v0, $s3

	lw $s0, 40($sp)
	lw $s1, 44($sp)
	lw $s2, 48($sp)
	lw $s3, 52($sp)
	lw $ra, 56($sp)
	addi	$sp, $sp, 60
	
	jr 	$ra

update:
	addi	$sp, $sp, -16		# Inici update
	sw $s0, 0($sp)	
	sw $s1, 4($sp)		
	sw $s2, 8($sp)
	sw $ra, 12($sp)
	
	move $s0, $a0			# segurs
	move $s2, $a2
	move $s1, $a1


	jal nofares
	
	sll $t0, $s1, 2			
	add $t0, $s0, $t0
	lw $t1, 0($t0)			# $t1 = h[i]
	addi $t1, $t1, 1		# $t1 += 1
	sw $t1, 0($t0)			# h[i] = $t1

	sll $t0, $s2, 2			
	add $t0, $s0, $t0
	lw $t0, 0($t0)			
	
	ble $t1, $t0, else
	move $v0, $s1			# return i
	b fi_3
	
else:	move $v0, $s2			# return imax

fi_3:	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $ra, 12($sp)
	addi	$sp, $sp, 16
	
	jr $ra
