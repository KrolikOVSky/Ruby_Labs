def first_task
	puts "Please enter your Name"
	name = gets.chomp.to_s
	puts "Please enter your Surname"
	surname = gets.chomp.to_s
	puts "Please enter your Age"
	age = gets.to_i
	if age < 18
		puts "Hello, #{name} #{surname}. You are less then 18 years, but starting programming is never early"
	else
		puts "Hello, #{name} #{surname}. This time is nice for learning programming"
	end
end

def second_task
	print "Please enter first number: "
	first = gets.to_i
	print "Please enter second number: "
	second = gets.to_i

	if first == 20 || second == 20
		puts 20
	else
		puts first + second
	end
end

loop do
	puts "----------------------------------------"
	puts "Please enter number of task"
	input = gets.to_i
	case input
		when 1
			puts "----------------------------------------"
			first_task
		when 2
			puts "----------------------------------------"
			second_task
		when -1
			break
		else
			puts "Wrong number, try again"
	end

end

