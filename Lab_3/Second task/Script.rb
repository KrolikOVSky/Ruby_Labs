require '../../utilities'

DEFAULT_VALUE = 100

def read_from_keyboard
  message_out "---------------------------------"
  message_out "What you want to do?\n- For get your balance enter \"B\"\n- For deposit money enter \"D\"\n- For withdraw any money enter \"W\" \n- Enter \"Q\" for exit"
  command = gets.chomp("\n").to_s.downcase
  message_out "---------------------------------"
  command
end

def get_balance_from_file(path)
  if File.exist?(path)
    File.read(path).chomp("\n")
  else
    DEFAULT_VALUE
  end
end

def write_to_file(path, value)
  File.write(path, value, mode: "w")
  message_out "Good bye"
end

def wrong_request
  message_out "Wrong command, please enter again"
end

def balance(value)
  message_out "Your balance is #{value}"
end

def deposit(value)
  value = value.to_i

  def get_money(value)
    balance(value)
    message_out "How much you want to deposit"
    inserted = gets.to_i
    if inserted > 0
      inserted
    else
      message_out "Wrong number please try again"
      get_money(value)
    end
  end

  inserted = get_money(value)
  message_out "You deposited #{inserted}, your balance became #{value + inserted}"
  (value + inserted)
end

def withdraw(value)
  value = value.to_i

  def get_value(value)
    balance(value)
    message_out "How much money you want to withdraw?"
    entered = gets.to_i
    if entered > value
      message_out "You want to withdraw more than you have"
      message_out "Please try again"
      get_value(value)
    else
      entered
    end
  end

  entered = get_value(value)
  message_out "You withdraw #{entered}, your balance became #{value - entered}"
  value - entered
end

def main
  path = "/home/alex/RubymineProjects/Ruby_Labs/Lab_3/Second task/balance.txt"
  command = "b"
  money = get_balance_from_file(path)
  while command != "q"
    if command == "b"
      balance(money)
    else
      if command == "d"
        money = deposit(money)
      else
        if command == "w"
          money = withdraw(money)
        else
          wrong_request
        end
      end
    end
    command = read_from_keyboard
  end
  write_to_file(path, money)
  money
end

# main