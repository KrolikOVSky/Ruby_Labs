require '../../utilities'
$stage = "test"
require './Script'

RSpec.describe "Main" do
	it "#first_task first_solution" do
		allow_any_instance_of(Kernel).to receive(:gets).and_return(36, 19, 20, 37, 21, -1)
		expect(main).to eq([["Alex Berton", 36], ["Akulov Michail", 19], ["Shestakov Andrey", 19], ["Klinikov Rostislav", 20]])
	end
end
