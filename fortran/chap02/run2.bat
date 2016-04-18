echo off 
rem  ******EDIT THE NEXT TWO LINES IF NECESSARY******
set ED2=c:\NM
set G95=c:\g95
rem  ************************************************
set NML=%ED2%\nm_lib
set PATH=%G95%\BIN
g95 %1.f95 -o %1.exe -I %NML%  %NML%\nm_lib.a
copy %2.dat nm95.dat
%1
move nm95.dat %2.dat
move nm95.res %2.res
del %1.exe nm95.dat 







