def contarAparicionesFile(fileName, str)
	file=File.open(fileName,"r")
	contenido = file.read()
	contenido = contenido.split(" ")
	puts "Cantidad de palabras #{contenido.length}"
	puts "Palabra a buscar cuantes veces se repite ---> #{str}"
	contador = 0
	i=0
	while(i<contenido.length)
		
		# Es necesario cortar la palabra obtenida en el texto, ya que puede contener basura (ex. punto final)
		if(contenido[i][0...str.length].eql? str)
			contador+=1
		end
		i+=1
	end
	return "Cantidad de repeticiones #{contador}"
end

puts contarAparicionesFile("Escrito.txt","Lorem")
