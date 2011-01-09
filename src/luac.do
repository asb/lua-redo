redo-ifchange luac.o print.o liblua.a ../buildconfig
. ../buildconfig

$CC -o $3 $MYLDFLAGS luac.o print.o liblua.a $LIBS
