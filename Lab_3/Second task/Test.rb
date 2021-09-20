require '../../utilities'
$stage = "test"
require './Script'

RSpec.describe "Main" do

	it "#balance" do
		expect(balance(1500)).to eq("Your balance is 1500")
	end

	it "#withdraw" do
		allow_any_instance_of(Kernel).to receive(:gets).and_return(500)
		expect(withdraw(1500)).to eq(1000)
	end

	it "#deposit" do
		allow_any_instance_of(Kernel).to receive(:gets).and_return(500)
		expect(deposit(1500)).to eq(2000)
	end

	it "#main" do
		allow_any_instance_of(Kernel).to receive(:gets).and_return("b", "d", 500, "w", 500, "q")
		expect(main).to eq(1500)
	end
end