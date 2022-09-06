bcc
===

Simple tool to convert any file into a C or C++ array for direct inclusion into
the source code.

Note: C23 introduced the `#embed` feature which can be used rather than this
      utility unless your toolchain doesn't support it.

Quick usage
-----------

Example: convert a image for embedding.

	bcc -sc mario.png mario > mario.h

Now, you can include mario.h file and use `mario` C array, `sizeof (mario)` is
also possible.

Documentation
-------------

See bcc(1) manual page.

Author
------

David Demelier <markand@malikania.fr>
