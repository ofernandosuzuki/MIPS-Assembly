.text
.globl main

main:
	li	$a0, 2			# base 
	li	$a1, 10			# potencia
	jal 	pot
	
	move	$a0, $v0	
	li	$v0, 1
	syscall
	
	li	$v0, 10
	syscall
	
	
	
pot:	
	bne 	$a1, $zero, rec		# se a potencia ($a1) for maior que 1, entao --> rec
	li	$v0, 1			# se nao, retorna 1
	jr	$ra
	
	

rec:	
	addiu 	$sp, $sp, -4		
	sw	$ra, 0 ($sp)		# armazena o endereço de retorna da pilha
	addi	$a1, $a1, -1		# potencia - 1
	
	jal 	pot			# chama a função "pot" com outro argumento
	mul	$v0, $a0, $v0		
	lw	$ra, 0 ($sp)	
	addi	$sp, $sp, 4		
	
	jr	$ra			# retorna para a função de chamada
