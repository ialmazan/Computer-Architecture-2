	addi	$1, $0, 5	# $1 = 5
	ori	$2, $1, 3	# $2 = 7
	andi	$3, $2, -1	# $3 = 7
	add	$4, $3, $1	# $4 = 5 + 7 = 12
	sub	$5, $2, $3	# $5 = 7 - 7 = 0
	and	$6, $1, $4	# $6 = 12 & 5 = 4 
	sw	$4, 100($5)	# memory[100] = 12
	lw	$7, 100($0)	# $7 = memory[100] = 12
	slt	$8, $1, $2	# $8 = $1 < $2 = 5 < 7 = 1
	sll	$9, $6, 10	# $9 = 4096
	srl	$10, $9, 5	# $10 = 128
back:	beq	$8, $0, forward	# branch not taken the first time but taken the second
	slt	$8, $2, $1	# $8 = $2 < $1 = 7 < 5 = 0
	or	$11, $1, $4	# $11 = 5 | 12 = 13
	xor	$12, $3, $7	# $12 = 11
	beq	$8, $0, back	# jump to back
forward:	jal	close	# $31 = 68
	addi	$13, $0, 1	# should not execute
done:	j	done	# infinite loop to mark that we are done
close:	addi	$31, $31, 4	# $31 = 72
	jr	$31	# jump to "done"
	addi	$14, $0, 1	# should not execute
bad:	j	bad	# should not execute