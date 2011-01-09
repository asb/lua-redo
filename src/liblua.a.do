CORE_O="lapi.o lcode.o ldebug.o ldo.o ldump.o lfunc.o lgc.o llex.o lmem.o \
	lobject.o lopcodes.o lparser.o lstate.o lstring.o ltable.o ltm.o  \
	lundump.o lvm.o lzio.o"
LIB_O="lauxlib.o lbaselib.o ldblib.o liolib.o lmathlib.o loslib.o ltablib.o \
	lstrlib.o loadlib.o linit.o"

redo-ifchange ../buildconfig $CORE_O $LIB_O
. ../buildconfig
$AR $3 $CORE_O $LIB_O
$RANLIB $3
