defmodule Country do
	defstruct name: "", population: ""

	def set_name(user, name) do
	  %{user | name: name}
	end
	
	def set_population(user, population) do
	  %{user | population: population}
	end
end

defmodule Data2Table do
  def run do
    c1 = %Country{name: "USA", population: "350 million"}
	c2 = %Country{name: "China", population: "1.4 billion"}
	c3 = %Country{name: "Russia", population: "145 million"}
	countries = [ c1, c2, c3 ]
	
	IO.puts ""
	IO.puts "DUMP:"
	IO.puts "["
	Enum.each countries, fn(country) ->
		IO.puts "\t{\"name\":\"" <> country.name <> "\", \"population\":\"" <> country.population <> "\"}"
	end
	IO.puts "]"
	
	IO.puts ""
	IO.puts "SANITIZED:"
	IO.puts "["
	Enum.each countries, fn(country) ->
		IO.puts "\t{:name =>\"" <> country.name <> "\", :population => \"" <> country.population <> "\"}"
	end
	IO.puts "]"
	
	IO.puts ""
	IO.puts "TABLE:"
	IO.puts "Countries | Population"
	IO.puts String.duplicate("-", String.length("Countries | Population"))
	Enum.each countries, fn(country) ->
		ws = String.length("Countries ") - String.length(country.name)
		IO.puts country.name <> String.duplicate(" ", ws) <> "|" <> country.population
	end
  end
end

Data2Table.run