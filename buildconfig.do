exec >&2

PLATS="aix ansi bsd freebsd generic linux macosx mingw posix solaris"

if [ ! -f platform ]; then
  echo "Unset platform type. Please do"
  echo "   echo PLATFORM > platform && redo"
  echo "where PLATFORM is one of these:"
  echo "   $PLATS"
  exit 1
fi

redo-ifchange platform

PLAT=$(cat platform)

case "$PLAT" in
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
    LUA_A="lua51.dll"
    AR="$CC -shared -o"
    RANLIB="strip --strip-unneeded"
    MYCFLAGS="-DLUA_BUILD_AS_DLL"
    MYLIBS=""
    MYLDFLAGS="-s"
    ;;
  posix)
    MYCFLAGS=-DLUA_USE_POSIX
    ;;
  solaris)
    MYCFLAGS="-DLUA_USE_POSIX -DLUA_USE_DLOPEN"
    MYLIBS="-ldl"
    ;;
  *)
    echo "Unrecognised platform. Re-edit the platform file to contain one of:"
    echo "   $PLATS"
    exit 1
    ;;
esac

echo "building for platform $PLAT"

: ${CC="gcc"}
: ${CFLAGS="-O2 -Wall $MYCFLAGS"}
: ${AR="ar rcu"}
: ${RANLIB="ranlib"}
: ${LUA_A="liblua.a"}
: ${LIBS="-lm $MYLIBS"}

echo "\
CC=\"$CC\"
CFLAGS=\"$CFLAGS\"
AR=\"$AR\"
RANLIB=\"$RANLIB\"
LUA_A=\"$LUA_A\"
LIBS=\"$LIBS\"
MYCFLAGS=\"$MYCFLAGS\"
MYLDFLAGS=\"$MYLDFLAGS\"
MYLIBS=\"$MYLIBS\"" > $3

redo-stamp < $3
redo-always
