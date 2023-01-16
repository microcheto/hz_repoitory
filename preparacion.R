j <- "wuu"

for (i in 1:5) {
  print ("a")
}

simpsons  <- c("Homer", "Bart", "Maggie", "Marge", "Liza")

for (i in simpsons) {
  print (paste("Hola", i))
}

fila <- c ("Abi", "Vale")
animal <- c ("Tardigrado", "zebra")

for (animal in fila) {
  print (paste("Hola", fila, "tu animal favorito es lx", animal))
}

# pero lo imprime muchas veces

## ahora este si es el que funciona 

for (i in 1:length(fila)){
  print (paste ("Hola", fila[i], "tu animal favorito es lx", animal[i]))  
}

for (i in 1:3)
{
  for (j in 1:i)
  {
    print(i * j)
  }
}

for (x in 1:10) {
  print(x)
}

fruits <- list("apple", "banana", "cherry")

for (x in fruits) {
  print(x)
}

for (x in fruits) {
  if (x == "banana") {
    break
  }
  print(x)
}
