# !/bin/bash

# you execute it wiht the sh command.

mvt = ... # Name of the train sites source map

etiqueta = ... # label of resulting maps

nk = ... # Number of land cover classes


for i in 'seq   1 $nk'

    do

    r.null map=${mvt}_${etiqueta}_0$i'clase' null=0

    r.null map=${mvt}_${etiqueta}_0$i'suma' null=0 

done

