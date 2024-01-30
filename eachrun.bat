REM: Usage: eachrun.bat %1 %2
REM: %1: Collimator size
REM: %2: Source position

echo Calculating: Collimator size: %1 - Source position: %2

@echo off

SET PHITSBAT="c:\phits\bin\phits.bat"
SET OUTDIR="output"

copy collimator\%1.inp collimator.tmp
copy transform\%2.inp transform.tmp


call %PHITSBAT% LGK_MC_Auto.inp

move phits.out %OUTDIR%\%1-%2-phits.out
move dose.out %OUTDIR%\%1-%2-dose.out
move dose_err.out %OUTDIR%\%1-%2-dose_err.out
move dose.vtk %OUTDIR%\%1-%2-dose.vtk
move dose_err.vtk %OUTDIR%\%1-%2-dose_err.vtk
move dose.eps %OUTDIR%\%1-%2-dose.eps
move dose_err.eps %OUTDIR%\%1-%2-dose_err.eps

del collimator.tmp
del collimator.tmp
del batch.out


