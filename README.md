Small utility to build binary microcode.bin from the Intel microcode.dat.

Download microcode.dat from Intel. At the time of this writing the latest version is available for download here: http://downloadcenter.intel.com/Detail_Desc.aspx?agr=Y&DwnldID=21925

Unpack it with:

    tar zxvf microcode-20120606-v2.tgz

and run:

    make

That should be enough to create microcode.bin. Requirements are sed, make and gcc.
