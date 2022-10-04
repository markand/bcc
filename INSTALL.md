bcc INSTALL
===========

Installation instructions.

Requirements
------------

- C99, a C99 compiler (GCC, Clang),
- Standard make.

Basic installation
------------------

Quick install.

	$ bsdtar -xf bcc-x.y.z.tar.xz
	$ cd bcc-x.y.z
	$ make
	# sudo make install

Embedding bcc
-------------

You can easily embed `bcc` directly into your project as long as you use a host
C compiler in case of cross-compilation. To do that, simply carry out the two
files `bcc.c` and `arg.h` into your project.
