def cuenta_lineas(docu)
	file = File.open(docu, "r")
	contens = file.readlines
	return contens.length
end

puts cuenta_lineas("Escrito.txt")