redo-ifchange $1.c deps ../buildconfig

TR_FN=$(echo $1 | tr a-z A-Z)_C
. ./deps
DEPS=$(eval echo '$'$TR_FN)
redo-ifchange $DEPS

. ../buildconfig
$CC $CFLAGS -c -o $3 $1.c
