$stage = ""

def message_out(message)
	puts message if $stage != "test"
	message
end