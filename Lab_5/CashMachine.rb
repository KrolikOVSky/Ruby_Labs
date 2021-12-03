class CashMachine

	def initialize
		@balance = File.read("./wallet.bin").to_i
	end

	def balance
		@balance
	end

	def deposit(value)
		value = value.to_i
		if value >= 0
			@balance = @balance + value
			write_to_file
			0
		else
			-1
		end
	end

	def withdraw(value)
		value = value.to_i
		if value <= @balance
			@balance = @balance - value
			write_to_file
			0
		else
			-1
		end
	end

	private

		def write_to_file
			File.write("./wallet.bin", @balance, mode: "w")
		end
end
