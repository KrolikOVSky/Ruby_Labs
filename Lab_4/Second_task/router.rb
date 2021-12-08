require '../../Lab_4/Second_task/Post_controller'
require '../../Lab_4/Second_task/Comments_controller'

class Router
	def initialize
		@routes = {}
	end

	def init
		resources(PostsController, 'posts')
		resources(CommentsController, 'comments')

		loop do
			print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
			choice = gets.chomp

			PostsController.connection(@routes['posts']) if choice == '1'
			CommentsController.connection(@routes['comments']) if choice == '2'
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

router = Router.new
router.init