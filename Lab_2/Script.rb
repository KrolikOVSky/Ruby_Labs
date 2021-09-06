def first_task
  def get_last_two_chars(string)
    return string.to_s.reverse[0, 2].reverse
  end

  puts "Enter some word"
  word = gets.chomp("\n").to_s

  if get_last_two_chars(word) == "cs"
    puts (2 ** word.length).to_s
  else
    puts word.reverse
  end

end

def second_task
  puts "Enter quantity of Pokemons"
  count = gets.to_i
  pokemons = []
  count.times do
    puts "Enter name of Pokemon"
    name = gets.chomp("\n").to_s
    puts "Enter color of Pokemon"
    color = gets.chomp("\n").to_s
    pokemons << { name => color }
  end
  puts pokemons
end

puts "------------FIRST TASK------------"
first_task
puts "----------------------------------"

puts "------------SECOND TASK------------"
second_task
puts "----------------------------------"
