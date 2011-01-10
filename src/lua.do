redo-ifchange ../buildconfig

. ../buildconfig
redo-ifchange lua.o $LUA_A

$CC -o $3 $MYLDFLAGS lua.o $LUA_A $LIBS
