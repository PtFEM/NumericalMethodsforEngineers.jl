echo off

rem  ******EDIT THE NEXT LINE IF NECESSARY***********

set G95=c:\g95

rem  *****************************************************

set PATH=%G95%\bin

rem  BUILD LIBRARIES**************************************

del *.a *.mod
g95 -c precision.f95
g95 -c *.f95
ar -r nm_lib.a *.o
del *.o

