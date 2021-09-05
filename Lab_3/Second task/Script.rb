def read_from_keyboard
  puts "---------------------------------"
  puts "What you want to do?\n- For get your balance enter \"B\"\n- For deposit money enter \"D\"\n- For withdraw any money enter \"W\" \n- Enter \"Q\" for exit"
  command = gets.chomp("\n").to_s.downcase
  puts "---------------------------------"
  return command
end

def get_balance_from_file(path)
  if File.exist?(path)
    return File.read(path).chomp("\n")
  else
    return 100.0
  end
end

def write_to_file(path, value)
  File.write(path, value, mode: "w")
  puts "Good bye"
end

def wrong_request
  puts "Wrong command, please enter again"
end

def balance(value)
  puts "Your balance is #{value}"
end

def deposit(value)
  value = value.to_i

  def get_money(value)
    balance(value)
    puts "How much you want to deposit"
    inserted = gets.chomp("\n").to_i
    if inserted > 0
      return inserted
    else
      puts "Wrong number please try again"
      return get_money(value)
    end
  end

  inserted = get_money(value)
  puts "You deposited #{inserted}, your balance became #{value + inserted}"
  return value + inserted
end

def withdraw(value)
  value = value.to_i
  def get_value(value)
    balance(value)
    puts "How much money you want to withdraw?"
    entered = gets.to_i
    if entered > value
      puts "You want to withdraw more than you have"
      puts "Please try again"
      get_value(value)
    else
      return entered
    end

  end
  entered = get_value(value)
  puts "You withdraw #{entered}, your balance became #{value - entered}"
  return value - entered
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
end

main