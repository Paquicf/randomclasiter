# !/bin/bash

#you execute it with the sh command.


mvt = ... # Name of the train sites source map

etiqueta = ... # label 2 

permutaciones = ... # Number of classifications to be performed

nk = ... # Number of land cover classes


for i in `seq  1 $nk`
do
   echo ${mvt}_${etiqueta}_$i'suma'=0  | r.mapcalc

done

read pausa

for i in `seq   1 $nk`
do
 for j in `seq -w 1 $permutaciones`
         do
         echo i j
         echo  "${mvt}_${etiqueta}_$i"suma"=${mvt}_${etiqueta}_$i"suma"+if(${mvt}${j}_${etiqueta}==$i)" |r.mapcalc
  done
done
