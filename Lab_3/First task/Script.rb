require '../../utilities'

def read_from_file(path)
	people = []
	file = File.open(path)
	file.readlines.each do |human|
		temp = human.split("-")
		people << [temp[0], temp[1].chomp.to_i]
	end
	file.close
	people
end

def write_to_file(content, path)
	file = File.open(path, "w")
	content.each do |item|
		file.write "Name surname: #{item[0]}\t\tage: #{item[1]}\n"
	end
	file.close
end

def get_data_from_user
	message_out "Please enter age of student or \"-1\" for exit"
	gets.to_i
end

def main
	input_path = "./input.txt"
	output_path = "./result.txt"

	truth_people = []
	people = read_from_file(input_path)
	loop do
		age = get_data_from_user
		break if age == -1
		flag = false
		people.each do |human|
			if human[1] === age
				truth_people << human
				flag = true
			end
		end
		unless flag
			message_out "Don't have student with current age"
		end
	end

	write_to_file(truth_people, output_path)
	truth_people
end
