PATH = "./input.txt"
RECOVER = "./input.txt.bak"
BUFFER = "./buffer.txt"

def write_to_file
	File.delete(PATH)
	File.foreach(BUFFER) { |item| File.write(PATH, item, mode: "a") }
	File.delete(BUFFER) if File.exist? BUFFER
end

def index
	File.foreach(PATH).with_index { |item, index| puts "#{index} |=> #{item}" }
end

def find(id)
	puts "\nfind start"
	id = gets.to_i
	File.foreach(PATH).with_index do |string, index|
		puts string if index == id
	end
	puts "find end\n"
end

def where(pattern)
	puts "Where start"
	pattern = gets.chomp
	File.foreach(PATH).with_index do |string, s_index|
		puts "#{s_index} |=> #{string}" if string.include? pattern
	end
	puts "Where end"
end

def update(id, text)
	puts "Update start"
	id = gets.to_i
	text = gets

	File.foreach(PATH).with_index do |string, index|
		if index == id
			File.write(BUFFER, text, mode: "a")
		else
			File.write(BUFFER, string, mode: "a")
		end
	end
	write_to_file
	puts "Update end"
end

def delete(id)
	puts "Delete start"
	id = gets.to_i
	File.foreach(PATH).with_index {|string, index| File.write(BUFFER, string, mode: "a") if index != id}
	write_to_file
	puts "Delete end"
end

def recover
	File.write(PATH, File.read(RECOVER), mode: "w")
end







loop do
	puts "loop start"
	command = gets.gsub("\n", '')
	case command
		when "i"
			index
		when "f"
			find(1)
		when "w"
			where(44)
		when "u"
			update(1, "")
		when "d"
			delete(8)
		when "r"
			recover
		when "q"
			recover
			break
		else
			puts "Please try again"
	end
	puts "loop end"
end