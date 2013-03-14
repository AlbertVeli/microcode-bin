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

ucode.cpio: microcode.bin
	mkdir -p initrd/kernel/x86/microcode/
	cp microcode.bin initrd/kernel/x86/microcode/GenuineIntel.bin
	cd initrd; find . | cpio -o -H newc > ../ucode.cpio
	@echo "ucode.cpio created"

.PHONY: clean

clean:
	rm -rf microcode.bin microcode.h microcode $(OBJS) initrd

