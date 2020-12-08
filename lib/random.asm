	lda seed+1
	tay
	lsr A
	lsr A
	lsr A
	sta seed+1
	lsr A
	eor seed+1
	lsr A
	eor seed+1
	eor seed+0
	sta seed+1
	tya
	sta seed+0
	asl A
	eor seed+0
	asl A
	eor seed+0
	asl A
	asl A
	asl A
	eor seed+0
	sta seed+0
	rts
