# !/bin/bash

#you execute it with the sh command.

mvt = ... # Name of the train sites source map

etiqueta = ... # label 2

nk = ... # Number of land cover classes

for i in 'seq   1 $nk'

do

   echo $${mvt}_${etiqueta}_$i''clase'=0 | r.mapcalc$

done

read pausa

for i in 'seq   1 $nk'

    do

      echo  $''${mvt}_${etiqueta}_$i''clase'=if(${mvt}_${etiqueta}_$i''suma'!=0,$i)'  |r.mapcalc $

done
