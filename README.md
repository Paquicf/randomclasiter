randomclasiter
==============

Iterative random selection of train sites for supervised classification of image using GRASS GIS and R

# Authors

Maria Francisca Carreño (mariafra # um.es), Jose Antonio Palazon (palazon # um.es), Juan Carlos Gonzalez Rojas (jcgonzalezr # gmail.com) and Javier Martinez-Lopez (javier.martinez # um.es).

*Ecology and Hydrology Department* - *University of Murcia (Spain)*

<a rel="license" href="http://creativecommons.org/licenses/by/3.0/deed.en_US"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by/3.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/deed.en_US">Creative Commons Attribution 3.0 Unported License</a>.

# Description

Plain text scripts used for the iterative train selection classification procedure (in order of execution). Tested under Linux. The # symbol appear before comments and '...' stands for input variables.

# Protocol

## Step 1

This first Step  is executed under the GRASS GIS environment in order to generate several subsets of random train areas and the corresponding supervised classification maps. Train sites map is used as input, together with the number of train areas to be randomly selected from each land cover class for each classification.

## Step 2

The second script is executed under the GRASS GIS environment in order to create assignation frequency maps for each class and pixel in the map.

## Step 3

This third script is executed under the GRASS GIS environment in order to assign the most frequent land cover class to each pixel.

## Step 4

The fourth script is an intermediate step executed under the GRASS GIS environment in order to rename maps to avoid overwriting.

## Step 5

The fifth script is an intermediate step executed under the GRASS GIS environment in order to delete null values from the class and frequency maps in order to read them properly with R.

## Step 6

The sixth and last script is executed under the R environment (within the GRASS GIS environment) in order to obtain a final classification map in with each pixel has been assigned the class with highest assignment frequency.

