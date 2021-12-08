require '../../Lab_4/Second_task/resource'

class PostsController
	extend Resource

	def initialize
		@posts = []
		i = 60
		10.times do
			@posts << i
			i = i + 1
		end
	end

	def index
		puts "-------------------------------"
		@posts.each.each_with_index do |value, key|
			puts output_format(key, value)
		end
		puts "-------------------------------"
	end

	def show
		print "Please enter id of element: "
		id = gets.chomp.to_i
		if @posts.length - 1 < id || id < 0
			puts "Out of range, try again"
		else
			puts output_format(id, @posts[id])
		end
	end

	def create
		print "Please enter text of the post: "
		value = gets.chomp
		@posts << value
		puts output_format @posts.length - 1, @posts[@posts.length - 1]
	end

	def update
		index
		print "Please enter id of editing element: "
		id = gets.to_i
		if @posts.length - 1 < id || id < 0
			puts "Out of range, try again"
		else
			puts output_format id, @posts[id]
			print "Enter new text of element: "
			new_value = gets.chomp
			@posts.each.each_with_index do |value, key|
				@posts[id] = new_value if key == id
			end
			puts output_format id, @posts[id]
		end
	end

	def destroy
		index
		print "Please enter id of removing element: "
		id = gets.to_i
		if @posts.length - 1 < id || id < 0
			puts "Out of range, please try"
		else
			puts "Element \"#{output_format id, @posts[id]}\" deleted"
			@posts.each.each_with_index do |value, key|
				@posts.delete_at(id) if key == id
			end
		end
	end

	private

		def output_format(key, value)
			"|> ID = #{key}; Post = \"#{value}\""
		end
end