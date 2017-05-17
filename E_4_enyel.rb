def contarElementos()
	a_tienda = File.open("Tienda_1.txt","r")
	contenedor_Tienda = a_tienda.readlines()
	a_tienda.close()
	return contenedor_Tienda.length
end

def cantidad_Producto(name_Producto)
	a_tienda = File.open("Tienda_1.txt","r")
	contenido=[]

	a_tienda.each_line do |x|
		contenido.push(x.chomp.split(", ")) 
	end
	a_tienda.close()

	i=0
	while(i<contenido.length)
		if(contenido[i][0].upcase.eql? name_Producto.upcase)
			puts "El articulo #{name_Producto} posee la cantidad de =#{contenido[i][1]}"
			return contenido[i][1]	
		end
		i+=1
	end
	puts "No se encuentra el producto #{name_Producto}"
	return
end

def mostrar_cantidad_Menor(num)
	a_tienda = File.open("Tienda_1.txt","r")
	contenido=[]

	a_tienda.each_line do |x|
		contenido.push(x.chomp.split(", ")) 
	end
	a_tienda.close()

	i=0
	while(i<contenido.length)
		if(contenido[i][1].to_i < num)
			puts "#{contenido[i][0]} posee la cantidad de :#{contenido[i][1]}"
			return contenido[i][0]	
		end
		i+=1
	end
	puts "No esta el producto #{name_Producto}"
	return
end

opcion=0
while(opcion != 4)
	puts "##########################MENU##########################"
	puts "1: Contador de cantidad de productos"
	puts "2: Cantidad de cierto producto"
	puts "3: Cantidad de productos bajo 5 unidades"
	puts "4: Salir"
	opcion = gets.chomp.to_i

	if (opcion >= 1 && opcion <= 4)
		case opcion
		when 1
			puts "Actualmente hay #{contarElementos()} productos"
		when 2
			puts "Ingrese nombre de producto"
			name_Producto=gets.chomp
			cantidad_Producto(name_Producto)
		when 3
			puts "Los productos que poseen una cantidad maxima de 5 unidades son"
			mostrar_cantidad_Menor(5)
		when 4
			puts"Cerrando Sesión, el programa ha finalizado correctamente."
		end
	else
		puts "opción inválida, por favor, intente nuevamente."
	end

end

