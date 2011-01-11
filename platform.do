exec >&2

PLATS="aix ansi bsd freebsd generic linux macosx mingw posix solaris"

echo "Unset platform type. Please do"
echo "   echo PLATFORM > platform && redo"
echo "where PLATFORM is one of these:"
echo "   $PLATS"
exit 1
