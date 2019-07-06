subdirs := foo bar

default: echo-foo cflags xy $(subdirs) space

foo = $(bar)
bar = $(ugh)
ugh = Huh?

echo-foo:;@echo foo = $(foo)

CFLAGS = $(include_dirs) -O
include_dirs = -Ifoo -Ibar

cflags:;@echo CFLAGS = ${CFLAGS}

x := foo
y := ${x} bar
x := later

xy:;@echo x=${x} y=${y}

ifeq (0, ${MAKELEVEL})
whoami := $(shell whoami)
host-type := $(shell arch)
MAKE := ${MAKE} host-type=${host-type} whoami=${whoami}
endif

.PHONY: ${subdirs}
${subdirs}:
	${MAKE} -C $@ all

empty_string :=
space := ${empty_string} # end of the line

space:;@echo space=«${space}»
