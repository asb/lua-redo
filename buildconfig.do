exec >&2

if [ -f $1 ]; then
  echo "using existing buildconfig file"
  exit 0
fi

PLATS="aix ansi bsd freebsd generic linux macosx mingw posix solaris"

echo "Please do"
echo "   redo PLATFORM"
echo "where PLATFORM is one of these:"
echo "   $PLATS"

exit 1
