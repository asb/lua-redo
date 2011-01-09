redo-ifchange lua.o liblua.a ../buildconfig
. ../buildconfig

$CC -o $3 $MYLDFLAGS lua.o liblua.a $LIBS
