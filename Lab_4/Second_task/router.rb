module Resource
	def connection(routes)
		if routes.nil?
			puts "No route matches for #{self}"
			return
		end

		loop do
			print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
			verb = gets.chomp
			break if verb == 'q'

			action = nil

			if verb == 'GET'
				print 'Choose action (index/show) / q to exit: '
				action = gets.chomp
				break if action == 'q'
			end

			action.nil? ? routes[verb].call : routes[verb][action].call
		end
	end
end

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
			# puts "|> ID = #{key}; Post = \"#{value}\""
			puts output_format(key, value)
		end
		puts "-------------------------------"
	end

	def show(id)
		if @posts.length - 1 < id || id < 0
			puts "Out of range"
		else
			puts output_format(id, @posts[id])
		end
	end

	def create(value)
		@posts << value
	end

	def update(id, new_value)
		if @posts.length - 1 < id || id < 0
			puts "Out of range"
		else
			@posts.each.each_with_index do |value, key|
				@posts[id] = new_value if key == id
			end
		end
	end

	def destroy(id)
		if @posts.length - 1 < id || id < 0
			puts "Out of range"
		else
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

class Router
	def initialize
		@routes = {}
	end

	def init
		resources(PostsController, 'posts')

		loop do
			print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
			choice = gets.chomp

			PostsController.connection(@routes['posts']) if choice == '1'
			break if choice == 'q'
		end

		puts 'Good bye!'
	end

	def resources(klass, keyword)
		controller = klass.new
		@routes[keyword] = {
			'GET' => {
				'index' => controller.method(:index),
				'show' => controller.method(:show)
			},
			'POST' => controller.method(:create),
			'PUT' => controller.method(:update),
			'DELETE' => controller.method(:destroy)
		}
	end
end

app = PostsController.new

app.index
app.create(456)
app.create(433)
app.index
app.update(0, 777)
app.update(2, 9999)
app.index
app.destroy(10)
app.destroy(11)
app.index

# router = Router.new
# router.init