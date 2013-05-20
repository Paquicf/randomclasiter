# !/bin/bash

# you execute it wiht the sh command.

mvt = ... # Name of the train sites source map

etiqueta = ... # label 2 

nk = ... # Number of land cover classes


for i in 'seq   1 $nk'

    do

 g.rename - -o rast=${mvt}_${etiqueta}_$i''suma',${mvt}_${etiqueta}_0$i''suma'

 g.rename - -o rast=${mvt}_${etiqueta}_$i''suma',${mvt}_${etiqueta}_0$i''clase'  
 
done

