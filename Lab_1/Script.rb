def first_task
	# puts "Please enter your Name"
	name = gets.to_s
	# puts "Please enter your Surname"
	surname = gets.to_s
	# puts "Please enter your Age"
	age = gets.to_i
	if age < 18
		# puts "Hello, #{name} #{surname}. You are less then 18 years, but starting programming is never early"
		"Hello, #{name} #{surname}. You are less then 18 years, but starting programming is never early"
	else
		# puts "Hello, #{name} #{surname}. This time is nice for learning programming"
		"Hello, #{name} #{surname}. This time is nice for learning programming"
	end
end

def second_task
	# puts "Please enter first number: "
	first = gets.to_i
	# puts "Please enter second number: "
	second = gets.to_i

	if first == 20 || second == 20
		# puts "Result = 20"
		20
	else
		# puts "Result = #{first + second}"
		first + second
	end
end