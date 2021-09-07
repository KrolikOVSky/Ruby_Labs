def first_task
  def get_last_two_chars(string)
    string.to_s.reverse[0, 2].reverse
  end

  # puts "Enter some word"
  word = gets.to_s

  if get_last_two_chars(word) == "cs"
    # puts (2 ** word.length).to_s
    (2 ** word.length)
  else
    # puts word.reverse
    word.reverse
  end

end

def second_task
  # puts "Enter quantity of Pokemons"
  count = gets.to_i
  pokemons = []
  count.times do
    # puts "Enter name of Pokemon"
    name = gets.chomp("\n").to_s
    # puts "Enter color of Pokemon"
    color = gets.chomp("\n").to_s
    pokemons << { name => color }
  end
  pokemons
end