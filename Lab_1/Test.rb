require '../utilities'
$stage = "test"
require 'rspec'
require_relative './Script'


RSpec.describe "Main" do
	name = "Alex"
	surname = "Berton"

	it "#first_task first_solution" do
		allow_any_instance_of(Kernel).to receive(:gets).and_return(name, surname, 15)
		expect(first_task).to eq("Hello, #{name} #{surname}. You are less then 18 years, but starting programming is never early")
	end

	it "#first_task second_solution" do
		allow_any_instance_of(Kernel).to receive(:gets).and_return(name, surname, 20)
		expect(first_task).to eq("Hello, #{name} #{surname}. This time is nice for learning programming")
	end

	it "#second_task first_solution" do
		allow_any_instance_of(Kernel).to receive(:gets).and_return(10, 30)
		expect(second_task).to eq(40)
	end

	it "#second_task second_solution" do
		allow_any_instance_of(Kernel).to receive(:gets).and_return(20, 30)
		expect(second_task).to eq(30)
	end

	it "#second_task third_solution" do
		allow_any_instance_of(Kernel).to receive(:gets).and_return(30, 20)
		expect(second_task).to eq(30)
	end

end