exec >&2

case "$1" in
  aix)
    CC="xlc"
    CFLAGS="-O2 -DLUA_USE_POSIX -DLUA_USE_DLOPEN"
    MYLIBS="-ldl"
    MYLDFLAGS="-brtl -bexpall"
    ;;
  ansi)
    MYCFLAGS="-DLUA_ANSI"
    ;;
  bsd)
	  MYCFLAGS="-DLUA_USE_POSIX -DLUA_USE_DLOPEN"
    MYLIBS="-Wl,-E"
    ;;
  freebsd)
	  MYCFLAGS="-DLUA_USE_LINUX"
    MYLIBS="-Wl,-E -lreadline"
    ;;
  generic)
    MYCFLAGS=""
    ;;
  linux)
	  MYCFLAGS="-DLUA_USE_LINUX"
    MYLIBS="-Wl,-E -ldl -lreadline -lhistory -lncurses"
    ;;
  macosx)
	  MYCFLAGS="-DLUA_USE_LINUX"
    MYLIBS="-lreadline"
    ;;
  mingw)
    echo "mingw not supported yet"
    exit 1
    ;;
  posix)
    MYCFLAGS=-DLUA_USE_POSIX
    ;;
  solaris)
    MYCFLAGS="-DLUA_USE_POSIX -DLUA_USE_DLOPEN"
    MYLIBS="-ldl"
    ;;
  *)
    echo "Unrecognised platform type"
    exit 1
    ;;
esac

echo "building for platform $1"

: ${CC="gcc"}
: ${CFLAGS="-O2 -Wall $MYCFLAGS"}
: ${AR="ar rcu"}
: ${RANLIB="ranlib"}
: ${LIBS="-lm $MYLIBS"}

echo "\
PLAT=\"$1\"
CC=\"$CC\"
CFLAGS=\"$CFLAGS\"
AR=\"$AR\"
RANLIB=\"$RANLIB\"
LIBS=\"$LIBS\"
MYCFLAGS=\"$MYCFLAGS\"
MYLDFLAGS=\"$MYLDFLAGS\"
MYLIBS=\"$MYLIBS\"" > buildconfig
