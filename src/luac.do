redo-ifchange ../buildconfig
. ../buildconfig
redo-ifchange luac.o print.o $LUA_A

$CC -o $3 $MYLDFLAGS luac.o print.o $LUA_A $LIBS
