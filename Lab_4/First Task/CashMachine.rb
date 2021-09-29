class CashMachine
	def initialize(path)
		@balance = get_balance_from_file(path).to_i
	end

	private

		def get_money
			get_balance
			puts "How much you want to deposit"
			inserted = gets.to_i
			if inserted > 0
				inserted
			else
				puts "Wrong number please try again"
				get_money
			end
		end

		def get_value
			get_balance
			puts "How much money you want to withdraw?"
			entered = gets.to_i
			if entered > @balance
				puts "You want to withdraw more than you have"
				puts "Please try again"
				get_value
			else
				entered
			end
		end

		def get_balance_from_file(path)
			if File.exist?(path)
				File.read(path).chomp("\n")
			else
				100.0
			end
		end

	public

		def write_to_file(path)
			File.write(path, @balance, mode: "w")
			puts "Good bye"
		end

		def read_from_keyboard
			puts "---------------------------------"
			puts "What you want to do?\n- For get your balance enter \"B\"\n- For deposit money enter \"D\"\n- For withdraw any money enter \"W\" \n- Enter \"Q\" for exit"
			command = gets.chomp("\n").to_s.downcase
			puts "---------------------------------"
			command
		end

		def get_balance
			puts "Your balance is #{@balance}"
		end

		def deposit
			inserted = get_money
			puts "You deposited #{inserted}, your balance became #{@balance + inserted}"
			@balance += inserted
		end

		def withdraw
			entered = get_value
			puts "You withdraw #{entered}, your balance became #{@balance - entered}"
			@balance -= entered
		end

end

class App
	def self.init
		input_path = "./balance.txt"
		atm = CashMachine.new(input_path)
		command = "b"
		while command != "q"
			if command == "b"
				atm.get_balance
			else
				if command == "d"
					atm.deposit
				else
					if command == "w"
						atm.withdraw
					else
						atm.wrong_request
					end
				end
			end
			command = atm.read_from_keyboard
		end
		atm.write_to_file(input_path)

	end
end

App.init