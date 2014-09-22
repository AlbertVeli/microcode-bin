Small utility to build binary microcode.bin from the Intel microcode.dat.

Download microcode.dat from Intel. At the time of this writing the latest version is available for download here: https://downloadcenter.intel.com/Detail_Desc.aspx?agr=Y&DwnldID=24290

Unpack it with:

    tar zxvf microcode-20140913.tgz

and run:

    make

That should be enough to create microcode.bin. Requirements are sed, make and gcc.

To create ucode.cpio for early microcode loading, run:

    make ucode.cpio

Additional requirement for this rule is the cpio command.

For instructions on early microcode loading, see:

http://albertveli.wordpress.com/2013/03/05/aes-ni-enabled/
