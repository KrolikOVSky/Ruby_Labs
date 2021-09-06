puts "Please enter your Name"
name = gets.to_s
puts "Please enter your Surname"
surname = gets.to_s
puts "Please enter your Age"
age = gets.to_i
if age < 18
  puts "Hello, #{name} #{surname}. You are less then 18 years, but starting programming is never early"
else
  puts "Hello, #{name} #{surname}. This time is nice for learning programming"
end