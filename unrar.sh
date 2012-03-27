#!/bin/sh

for i in $( ls );
do rar_static x "$i";
done

