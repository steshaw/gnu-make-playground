subdirs := foo bar

all: echo-foo cflags xy $(subdirs) space foos

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

FOO1 ?= foo1 # If used with `make FOO1=hello`, FOO1 will be 'hello'.
FOO2 :=
FOO2 ?= foo2 # Will not be set to foo2 as already has an empty value.
FOO3 := foo3
FOO3 ?= foo3_muhaha # Not set because already has a value.

foos:
	@echo FOO1=${FOO1}
	@echo FOO2=${FOO2}
	@echo FOO3=${FOO3}
