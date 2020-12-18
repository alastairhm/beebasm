build:
			beebasm -i ${CODE}.asm -do ${CODE}.ssd -boot MyCode -v
			cp ${CODE}.ssd ${JSBEEB}/discs/test.ssd
			open ${CODE}.ssd
clean:
			rm -f ${CODE}.ssd

cleanall:
			rm -f *.ssd
