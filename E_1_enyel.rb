def html(d1, d2, arreglo, color)
	file = File.open("index.html", "w")
	file.puts "<html><body>"
	file.puts "<style>"
	file.puts "p{background-color:#{color}}"
	file.puts "</style>"
	file.puts "<p>#{d1}</p>"
	file.puts "<p>#{d2}</p>"
	file.puts "<ol>"
	arreglo.each do |x|
		file.puts "<li>#{x}</li>"
	end
	file.puts "</ol>"	
	file.puts "</body></html>"
	file.close
	return nil
end


html("hola", "mundo",["blaa","bloo"] ,"blue")

