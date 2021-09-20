require '../../utilities'

class CashMachine
	DEFAULT_VALUE = 100

	attr_reader :balance
	def initialize(path)
		@balance = get_balance_from_file(path).to_i
	end

	private

		def get_money
			get_balance
			message_out "How much you want to deposit"
			inserted = gets.to_i
			if inserted > 0
				inserted
			else
				message_out "Wrong number please try again"
				get_money
			end
		end

		def get_value
			get_balance
			message_out "How much money you want to withdraw?"
			entered = gets.to_i
			if entered > @balance
				message_out "You want to withdraw more than you have"
				message_out "Please try again"
				get_value
			else
				entered
			end
		end

		def get_balance_from_file(path)
			if File.exist?(path)
				File.read(path).chomp("\n")
			else
				DEFAULT_VALUE
			end
		end

	public

		def write_to_file(path)
			File.write(path, @balance, mode: "w")
			message_out "Good bye"
		end

		def read_from_keyboard
			message_out "---------------------------------"
			message_out "What you want to do?\n- For get your balance enter \"B\"\n- For deposit money enter \"D\"\n- For withdraw any money enter \"W\" \n- Enter \"Q\" for exit"
			command = gets.to_s.downcase
			message_out "---------------------------------"
			command
		end

		def get_balance
			message_out "Your balance is #{@balance}"
		end

		def deposit
			inserted = get_money
			message_out "You deposited #{inserted}, your balance became #{@balance + inserted}"
			@balance += inserted
		end

		def withdraw
			entered = get_value
			message_out "You withdraw #{entered}, your balance became #{@balance - entered}"
			@balance -= entered
		end

		def wrong_request
			message_out "Wrong command, please enter again"
		end
end

class Main
	def self.init
		input_path = "./balance.txt"
		atm = CashMachine.new(input_path)

		loop do
			command = atm.read_from_keyboard
			break if command == "q"
			case command
				when "b"
					atm.get_balance
				when "d"
					atm.deposit
				when "w"
					atm.withdraw
				else
					atm.wrong_request
			end
		end
		atm.write_to_file input_path
		atm.balance
	end
end

# Main.init