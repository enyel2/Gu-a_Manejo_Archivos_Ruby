def sumaTotal()
	archivoAlmacen = File.open("Tienda_2.txt","r")
	contenido=[]

	archivoAlmacen.each_line do |line|
		contenido.push(line.chomp.split(", ")) 
	end
	archivoAlmacen.close()

	# print contenido

	sumaTotal=0
	i,j=0
	while(i<contenido.length)
		j=1
		while(j<contenido[i].length)
			if(contenido[i][j]!="NR")				
				sumaTotal+=contenido[i][j].to_i
			end
			j+=1
		end
		i+=1
	end

	# puts sumaTotal
	return sumaTotal
end


def stockTotalProducto(nombreProducto)
	archivoAlmacen = File.open("Tienda_2.txt","r")
	contenido=[]

	archivoAlmacen.each_line do |line|
		contenido.push(line.chomp.split(", ")) 
	end
	archivoAlmacen.close()

	i,j=0
	stockTotal=0
	while(i<contenido.length)
		if(contenido[i][0].upcase.eql? nombreProducto.upcase)
			j=1
			while(j<contenido[i].length)
				stockTotal = stockTotal+ contenido[i][j].to_i
				j+=1
			end	

			puts "El articulo #{nombreProducto} posee en total un Stock=#{stockTotal}"
			return stockTotal	
		end
		i+=1
	end
	puts "No se encuentra el producto #{nombreProducto}"
	return
end


def productosPorRegistrar()
	archivoAlmacen = File.open("Tienda_2.txt","r")
	contenido=[]

	archivoAlmacen.each_line do |line|
		contenido.push(line.chomp.split(", ")) 
	end
	archivoAlmacen.close()

	i=0
	while(i<contenido.length)
		j=1
		while(j<contenido[i].length)
			if(contenido[i][j].eql? "NR")
				puts "El producto #{contenido[i][0]} no se encuentra registrado en la tienda Numero #{j}"	
			end
			j+=1
		end	

		i+=1
	end
	return
end


def agregarProducto(nombre,stock1,stock2,stock3)
	archivoAlmacen = File.open("Tienda_2.txt","r")
	contenido=[]

	archivoAlmacen.each_line do |line|
		contenido.push(line.chomp.split(", ")) 
	end
	archivoAlmacen.close()

	# print contenido

	sumaTotal=0
	i,j=0
	while(i<contenido.length)
		if(contenido[i][0].upcase.eql?nombre.upcase)
			puts "El stock #{contenido[i][0]} ya se encuentra registrado, intente con otro."
			return
		end
		i+=1
	end
	archivoAlmacen = File.open("Tienda_2.txt","a")
	archivoAlmacen.puts("")
	archivoAlmacen.puts("#{nombre}, #{stock1}, #{stock2}, #{stock3}")
	archivoAlmacen.close()
	return
end




# sumaTotal()
#stockTotalProducto("Producto1")
#productosPorRegistrar()
#agregarProducto("nombre","stock1","stock2","stock3")


opcion=0
while(opcion != 5)
	puts "##########################MENU##########################"
	puts "1: Suma total de los productos en todas las bodegas"
	puts "2: Cantidad de Stock en cada bodega de cierto producto"
	puts "3: Productos por registrar"
	puts "4: Registrar producto"
	puts "5: Salir"
	opcion = gets.chomp.to_i

	if (opcion >= 1 && opcion <= 5)
		case opcion
		when 1
			puts "Actualmente hay #{sumaTotal()} productos"
		when 2
			puts "ingrese nombre de producto"
			nombreProducto=gets.chomp
			stockTotalProducto(nombreProducto)
		when 3
			productosPorRegistrar()
		when 4
			puts "Ingrese el nombre del producto"
			nombre=gets.chomp
			puts "Ingrese el stock de la bodega 1"
			bodega1=gets.chomp
			puts "Ingrese el stock de la bodega 2"
			bodega2=gets.chomp
			puts "Ingrese el stock de la bodega 3"
			bodega3=gets.chomp
			agregarProducto(nombre,bodega1,bodega2,bodega3)
		when 5
			puts "Cerrando Sesión, el programa ha finalizado correctamente."
		end
	else
		puts "opción inválida, por favor, intente nuevamente."
	end

end