PATH = "./input.txt"
BUFFER = "./buffer.txt"

def save_to_file(path)
	File.write(path, "w")
end

def index
	File.foreach(PATH) { |item| puts "|=> #{item}" }
end

def find(id)
	puts "find"
	File.foreach(PATH) { |string| File.write(BUFFER, string, mode: "a") }
end

def where(pattern)
	puts "Where"
end

def update(id, text)
	puts "Update"
end

def delete(id)
	puts "Delete"
end

loop do
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
		when "q"
			break
		else
			puts "Please try again"
	end
end