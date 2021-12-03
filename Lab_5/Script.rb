require "socket"
require 'rack'
require './CashMachine'

server = TCPServer.new('localhost', 3000)

def array_to_hash(array)
	result = {}
	array.each do |item|
		key = item.split("=")[0]
		value = item.split("=")[1]
		result[key] = value
	end
	result
end

class App
	def call(env)
		req = Rack::Request.new(env)
		params = env["QUERY_PARAMS"]
		cash = CashMachine.new
		case req.path
			when "/"
				[200, { "Content-Type" => "text/html" }, ["Hello first page\r\n"]]
			when "/deposit"
				if params.nil? || params["value"].nil?
					[401, { "Content-Type" => "text/html" }, ["You are not enter value for deposit\r\n"]]
				else
					if cash.deposit(params["value"]) == 0
						[200, { "Content-Type" => "text/html" }, ["You are deposited $#{params["value"]}\nYour Balance is $#{cash.balance}\r\n"]]
					else
						[403, { "Content-Type" => "text/html" }, ["You are inserted value less than 0\r\n"]]
					end
				end
			when "/withdraw"
				if params.nil? || params["value"].nil?
					[402, { "Content-Type" => "text/html" }, ["You are not enter value for withdraw\r\n"]]
				else
					if cash.withdraw(params["value"]) == 0
						[200, { "Content-Type" => "text/html" }, ["You are withdrew $#{params["value"]}\r\nYour Balance is $#{cash.balance}\r\n"]]
					else
						[403, { "Content-Type" => "text/html" }, ["You are entered value bigger than you have\r\n"]]
					end
				end
			when "/balance"
				[200, { "Content-Type" => "text/html" }, ["Your balance is $#{cash.balance}", "\r\n"]]
			else
				[404, { "Content-Type" => "text/html" }, ["Not Found this page\r\n"]]
		end
	end
end

app = App.new

while (connection = server.accept)
	request = connection.gets
	method, full_path, http_ver = request.split(' ')
	path, params = full_path.split('?')
	status, headers, body = app.call({
										 'REQUEST_METHOD' => method,
										 'PATH_INFO' => path,
										 'QUERY_PARAMS' => params != nil ? array_to_hash(params.split('&')) : nil
									 })
	connection.print "#{http_ver} #{status} \r\n"
	headers.each do |key, value|
		connection.print "#{key}: #{value}\r\n"
	end
	connection.print "\r\n"
	body.each do |part|
		connection.print part
	end
	connection.close
end