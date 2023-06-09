/***************************************************************************
 *                                                                         *
 *    THAMES: Partial ISIS-II emulator                                     *
 *    Copyright (C) 2011 John Elliott <jce@seasip.demon.co.uk>             *
 *                                                                         *
 *    This library is free software; you can redistribute it and/or        *
 *    modify it under the terms of the GNU Library General Public          *
 *    License as published by the Free Software Foundation; either         *
 *    version 2 of the License, or (at your option) any later version.     *
 *                                                                         *
 *    This library is distributed in the hope that it will be useful,      *
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of       *
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU    *
 *    Library General Public License for more details.                     *
 *                                                                         *
 *    You should have received a copy of the GNU Library General Public    *
 *    License along with this library; if not, write to the Free           *
 *    Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,      *
 *    MA 02111-1307, USA                                                   *
 *                                                                         *
 ***************************************************************************/

#include "config.h"

/* System include files */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdarg.h>
#include <ctype.h>
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef HAVE_SYS_STAT_H
#include <sys/stat.h>
#endif
#ifdef HAVE_FCNTL_H
#include <fcntl.h>
#endif
#ifdef HAVE_UNISTD_H
#include <unistd.h>
#endif
#ifdef HAVE_ERRNO_H
#include <errno.h>
#endif
#ifdef __MSDOS
#include <dos.h>
#endif

#define DEBUG 0
/* Library includes */

#ifdef HAVE_LIMITS_H
#include <limits.h>
#else
#define PATH_MAX 256	/* For want of anything better */
#endif

typedef unsigned char byte;	/* Must be exactly 8 bits */
typedef unsigned short word;	/* Must be exactly 16 bits */

/* Prototypes */

void ed_fe  (byte *a, byte *b, byte *c, byte *d, byte *e, byte *f,
             byte *h, byte *l, word *pc, word *ix, word *iy, word *sp);
void dump_regs(FILE *fp, byte a, byte b, byte c, byte d, byte e, byte f, 
             byte h, byte l, word pc, word ix, word iy);
void message(const char *s, ...);
int thames_term(void);
void thames_exit(int code);
void capitals(char *s); /* Make a string uppercase */
void trim(char *s);	/* Remove trailing whitespace from a string */

/* Global variables */

extern char *progname;
extern char **argv;
extern int argc;
extern byte RAM[65536]; /* The Z80's address space */
extern int trace;	/* Trace level */

/* ISIS support */
#include "isis.h"
#include "isisfile.h"
#include "isisload.h"

/* Z80 CPU emulation */
#include "z80.h"

