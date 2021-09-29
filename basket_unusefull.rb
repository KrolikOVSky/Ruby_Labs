def math(num)
	num = num.to_i
	ok = num
	i = 1
	result = []

	num.times do
		i += 1
		if num % i == 0
			result << i
			num /= i
			i = 1
		end
	end
	# print "#{ok} "
	result << 1
end

def nod(num1, num2)
	num1 = num1.to_i
	num2 = num2.to_i
	res1 = math num1
	res2 = math num2
	result = (res1 & res2).sort[-1]
	puts "Number #{num1} = #{res1}"
	puts "Number #{num2} = #{res2}"
	puts "#{num1} & #{num2} = #{res1 & res2}"

	puts "Nod(#{num1}, #{num2}) = #{result}"
	result
end

def all_divides(num)
	num = num.to_i
	result = []
	i = 1
	num.times do
		result << i if num % i == 0
		i += 1
	end
	puts "All divides of number #{num} = #{result} : #{result.length}"
	result
end

nod(1024, 65536)
puts ""
all_divides 65536

