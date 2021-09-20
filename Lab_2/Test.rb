require '../utilities'
$stage = "test"
require './Script'
require 'rspec'

RSpec.describe "Main" do
	it "#first_task first_solution" do
		allow_any_instance_of(Kernel).to receive(:gets).and_return("Socks")
		expect(first_task).to eq("skcoS")
	end

	it "#first_task second_solution" do
		allow_any_instance_of(Kernel).to receive(:gets).and_return("Socs")
		expect(first_task).to eq(16)
	end

	it "#second_task" do
		allow_any_instance_of(Kernel).to receive(:gets).and_return(2, "Pikachu", "Yellow", "Misha", "Red")
		expect(second_task).to eq([{ "Pikachu" => "Yellow" }, { "Misha" => "Red" }])
	end

end
