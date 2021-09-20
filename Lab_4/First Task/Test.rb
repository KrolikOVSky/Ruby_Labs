require '../../utilities'
$stage = "test"
require '../First Task/CashMachine'

RSpec.describe "Main" do

	atm = CashMachine.new "./balance.txt"
	it ".get_balance" do
		expect(atm.get_balance).to eq("Your balance is 2000")
	end

	it ".withdraw" do
		allow_any_instance_of(Kernel).to receive(:gets).and_return(500)
		expect(atm.withdraw).to eq(1500)
	end

	it ".deposit" do
		allow_any_instance_of(Kernel).to receive(:gets).and_return(500)
		expect(atm.deposit).to eq(2000)
	end

	it "#Main.init" do
		allow_any_instance_of(Kernel).to receive(:gets).and_return("b", "d", 500, "w", 500, "q")
		expect(Main.init).to eq(2000)
	end
end