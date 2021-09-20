require '../utilities'

def first_task
	message_out "Please enter your Name"
	name = gets.chomp
	message_out "Please enter your Surname"
	surname = gets.chomp
	message_out "Please enter your Age"
	age = gets.to_i
	if age < 18
		message_out "Hello, #{name} #{surname}. You are less then 18 years, but starting programming is never early"
	else
		message_out "Hello, #{name} #{surname}. This time is nice for learning programming"
	end
end

def second_task
	message_out "Please enter first number: "
	first = gets.to_i
	message_out "Please enter second number: "
	second = gets.to_i

	if first == 20
		message_out "Result = #{second}"
		second
	elsif second == 20
		message_out "Result = #{first}"
		first
	else
		message_out "Result = #{first + second}"
		first + second
	end
end

first_task