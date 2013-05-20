#!/bin/bash

#you do execute this script with './'

mvt = ... # Name of the train sites source map

etiqueta = ... # label 1

nmpu = (0 ...) # vector of numbers of train areas to be randomly selected from each land cover class for each classification (separated by spaces).

grupo = ... # Name of the group of raster maps to be used for classification (see i.group GRASS command)

subgrupo = ... # Name of the subgroup of raster maps to be used for classification (see i.group GRASS command)

permutaciones = ... # Number of classifications to be performed

nk = ... # Number of land cover classes


for i in 'seq 1 $nk'

do

   r.mapcalc $mvt$i'=if(' $mvt'=='$i')'

   r.clump --o $mvt$i output=$mvt${i}c

   nmanchas[i]='r.stats -n $mvt${i}c |tail -1'


done

echo ---------------------------------------------------


for i in 'seq -w 1 $permutaciones'

do
   r.mapcalc 'vtpc=0'

   for j in 'seq 1 $nk'

   do


      echo 'write(sample(1:'${nmanchas[$j]}'),''sorteo.dat')'|R  - -vanilla -q



      fmt -1 sorteo.dat | awk -v verdad=${nmpu[$j]} '{if(NR<=verdad)print $1 '' =1';else print $1 '' = 0'}' 
|sort -n >reglas.dat

      echo fin del sorteo ------------------------------------ $1 de la clase $j

	cat reglas.dat

        cat sorteo.dat


      cat reglas.dat|r.reclass - -o $mvt${j}c output=eligiendo
     
      r.mapcalc elegidos=eligiendo

      r.null -c elegidos
     

      r.mapcalc vtpc'=vtpc+elegidos*'$j

     
   done

  r.null -r vtpc

  i.gensig trainingmap=vtpc group=$grupo subgroup=$subgrupo signaturefile=${mvtr}$i

  i.maxlik - -o group=$grupo subgroup=$subgrupo sigfile=$mvtr$i class=${mvt}${i}_$etiqueta

   g.remove rast=eligiendo,elegidos,vtpc

done
