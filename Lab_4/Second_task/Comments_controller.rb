require '../../Lab_4/Second_task/resource'

class CommentsController
	extend Resource

	def initialize
		@comments = []
		i = 125
		15.times do
			@comments << i
			i = i + 1
		end
	end

	def index
		puts "-------------------------------"
		@comments.each.each_with_index do |value, key|
			puts output_format(key, value)
		end
		puts "-------------------------------"
	end

	def show
		print "Please enter id of comment: "
		id = gets.chomp.to_i
		if @comments.length - 1 < id || id < 0
			puts "Out of range, try again"
		else
			puts output_format(id, @comments[id])
		end
	end

	def create
		print "Please enter text of the comment: "
		value = gets.chomp
		@comments << value
		puts output_format @comments.length - 1, @comments[@comments.length - 1]
	end

	def update
		index
		print "Please enter id of editing comment: "
		id = gets.to_i
		if @comments.length - 1 < id || id < 0
			puts "Out of range, try again"
		else
			puts output_format id, @comments[id]
			print "Enter new text of comment: "
			new_value = gets.chomp
			@comments.each.each_with_index do |value, key|
				@comments[id] = new_value if key == id
			end
			puts output_format id, @comments[id]
		end
	end

	def destroy
		index
		print "Please enter id of removing comment: "
		id = gets.to_i
		if @comments.length - 1 < id || id < 0
			puts "Out of range, please try"
		else
			puts "Comment \"#{output_format id, @comments[id]}\" deleted"
			@comments.each.each_with_index do |value, key|
				@comments.delete_at(id) if key == id
			end
		end
	end

	private

		def output_format(key, value)
			"|> ID = #{key}; Comment = \"#{value}\""
		end
end
