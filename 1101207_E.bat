@echo off
call setenv.bat

"%jred%\java" -jar SallDLL.jar "%sysd%\SY-1101207_E\buildsal\sall.dll" "1101207-E" %1 out.c err

type err

"%gccd%\arm-none-eabi-gcc" -D_SAL_ -I"%sysd%\SY-1101207_E\buildsal" --specs=nosys.specs -march=armv7-a -mlittle-endian -Ttext 0 -O3 -N -e calcmain -nostartfiles -nostdlib -fno-inline -falign-functions=4 -marm -T ldscript "%sysd%\SY-1101207_E\buildsal\go_scd6000.c" out.c -o %~n1.elf