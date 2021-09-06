def read_from_file(path)
  people = []
  file = File.open(path)
  file.readlines.each do |human|
    temp = human.split("-")
    people << [temp[0], temp[1].chomp("\n")]
  end
  file.close
  return people
end

def rrr

end

def write_to_file(content, path)
  file = File.open(path, "w")
  content.each do |item|
    file.write "Name surname: #{item[0]}\t\tage: #{item[1]}\n"
  end
  file.close
end

def get_data_from_user
  puts "Please enter age of student or \"-1\" for exit"
  return gets.chomp("\n").to_i
end

input_path = "/home/alex/RubymineProjects/Ruby_Labs/Lab_3/First task/input.txt"
output_path = "/home/alex/RubymineProjects/Ruby_Labs/Lab_3/First task/result.txt"

age = get_data_from_user
truth_people = []
people = read_from_file(input_path)
while age != -1 do
  flag = false
  people.each do |human|
    if human[1] === age.to_s
      truth_people << human
      flag = true
    end
  end
  unless flag
    puts "Don't have student with current age"
  end
  age = get_data_from_user
end

write_to_file(truth_people, output_path)