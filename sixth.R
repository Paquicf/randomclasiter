# You execute it with the source command in R.

mapa.base<- ... # Label names of previous maps separated by '_' (label1_label2_)

clases   <- ... # Number of classes

copia.mapa<-function(mapa,mapa.out){
calc<-NULL
calc[1]<-paste ("g.copy --o rast=",mapa,"suma," ,mapa.out,"suma",sep="")
calc[2]<-paste ("g.copy --o rast=",mapa,"clase,",mapa.out,"clase",sep="")


for (i in calc){
system(i)
print(i)}

}


sintetiza.mapa<-function(mapa.in,a,b,mapa.out){

A<-paste(mapa.in,a,sep="")
B<-paste(mapa.in,b,sep="")

calc<-NULL
calc[1]<-paste ("r.mapcalc '",mapa.out,"suma= if(",A,"suma>",B,"suma,",A,"suma, ",B,"suma )'",sep="")
calc[2]<-paste ("r.mapcalc '",mapa.out,"clase=if(",A,"suma>",B,"suma,",A,"clase,",B,"clase)'",sep="")

for (i in calc){
system(i)
print(i)}
}

maps.i<-1:clases
print("====")
print(maps.i)
k<-1
print("====")

while(length(maps.i)>1){
print("voy por la vuelta: ");print (k)
   impar<-length(maps.i)%%2==1
   maps.o<-matrix(0,ceiling(length(maps.i)/2),2)
   for (i in seq(1,length(maps.i),2))
      if(i+1<=length(maps.i)){
         maps.o[(i+1)/2,1]<-maps.i[i]
         maps.o[(i+1)/2,2]<-maps.i[i+1]
          }
      else {
         maps.o[(i+1)/2]<-maps.i[i]
         maps.o[(i+1)/2]<-maps.i[i]}


   mapprov.i<-paste(mapa.base,maps.i[length(maps.i)],sep="")
   maps.i<-NULL
   print(maps.o)

   for (i in 1:nrow(maps.o)) {
      maps.i[i]<-paste(mapa.base,k,i,sep="")
      if (maps.o[i,2]!=0) sintetiza.mapa(
                             mapa.base,
                             paste(k-1,maps.o[i,1],sep=""),
                             paste(k-1,maps.o[i,2],sep=""),
                             maps.i[i])
      else copia.mapa(
                      paste(mapa.base,k-1,maps.o[i,1],sep=""), 
                      paste(mapa.base,k,nrow(maps.o),sep="") )
      }


print (paste("vuelta",k))
   print(maps.i)
   maps.i<-1:nrow(maps.o)
   k<-k+1
}
