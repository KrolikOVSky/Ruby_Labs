require "../utilities"

def first_task
  def get_last_two_chars(string)
    string.to_s.reverse[0, 2].reverse
  end

  message_out "Enter some word"
  word = gets.to_s

  if get_last_two_chars(word) == "cs"
    message_out 2 ** word.length
  else
    message_out word.reverse
  end

end

def second_task
  message_out "Enter quantity of Pokemons"
  count = gets.to_i
  pokemons = []
  count.times do
    message_out "Enter name of Pokemon"
    name = gets.to_s
    message_out "Enter color of Pokemon"
    color = gets.to_s
    pokemons << { name => color }
  end
  message_out pokemons
  pokemons
end