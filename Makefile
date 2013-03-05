OBJS = microcode.o
CFLAGS = -W -Wall -O2 -march=native

microcode.bin: microcode
	./microcode

microcode: microcode.h microcode.o
	$(CC) -o $@ $(CFLAGS) $(OBJS)

microcode.h: microcode.dat
	echo "#include <stdio.h>" > $@
	echo "#include <stdint.h>" >> $@
	echo "" >> $@
	echo "uint32_t ucode[] = {" >> $@
	sed -n '/^\//!p' $< >> $@
	echo "};" >> $@

.PHONY: clean

clean:
	rm -f microcode.bin microcode.h microcode $(OBJS)

