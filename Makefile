#
# Makefile -- basic Makefile for bcc
#
# Copyright (c) 2020-2022 David Demelier <markand@malikania.fr>
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#

.POSIX:

# User options.
CC=             cc
CFLAGS=         -DNDEBUG -O3

# Installation paths.
PREFIX=         /usr/local
BINDIR=         ${PREFIX}/bin
MANDIR=         ${PREFIX}/share/man

VERSION=        2.0.0
SRCS=           bcc.c
OBJS=           ${SRCS:.c=.o}

.SUFFIXES:
.SUFFIXES: .o .c

all: bcc

.c.o:
	${CC} ${CFLAGS} -c $< -o $@

bcc: ${OBJS}
	${CC} -o $@ ${OBJS}${LDFLAGS}

dist: clean
	mkdir bcc-${VERSION}
	cp CHANGES.md INSTALL.md LICENSE.md Makefile README.md bcc.1 bcc.c bcc-${VERSION}
	tar -cJf bcc-${VERSION}.tar.xz bcc-${VERSION}
	rm -rf bcc-${VERSION}

install:
	mkdir -p ${DESTDIR}${BINDIR}
	cp bcc ${DESTDIR}${BINDIR}
	mkdir -p ${DESTDIR}${MANDIR}/man1
	cp bcc.1 ${DESTDIR}${MANDIR}/man1

clean:
	rm -f bcc ${OBJS} bcc-${VERSION}.tar.xz

.PHONY: all clean dist install
