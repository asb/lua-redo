redo-ifchange platform

if [ $(cat platform) = 'mingw' ]; then
  redo-ifchange src/lua51.dll src/lua.exe src/luac.exe
else
  redo-ifchange src/lua src/luac src/liblua.a
fi
