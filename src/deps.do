for fn in l*.c print.c; do
  TR_FN=$(echo $fn | tr a-z. A-Z_)
  DEPS=$(gcc -MM $fn | sed -e "s/^${fn%.c}.o: //" -e 's/\\//g')
  echo "$TR_FN=\"$DEPS\""
done

redo-ifchange l*.c print.c
