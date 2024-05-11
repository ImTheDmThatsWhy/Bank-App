require 'yaml'

# Algorthim / pseudo code
# 1. Give display a welcome message and have user input name
# 2. retrieve the user input and store it in a variable for later use
# 3. display hellouser name and provide further instuctions
# 4. Get the user to choose one of the menu items
# 5. based on user selection
# 6. if user selected 'D', ask how much they would like to deposit and update balance
# 7. if the user selected 'W', ask how much they would like to withdraw and deduct from balance
# 8. if the user selected 'B', show the balance

# flowchart:
all_balances = YAML.load_file('bank of hell.rb')
puts 'Welcome to the bank of hell, Please Enter your name'
name = gets.chomp
if all_balances.include?(name.downcase)
  puts 'Welcome back lets get started'
  balance = all_balances [name]
else
  balance = 0
end
user_input = ''
while user_input != 'E'
  puts "Hello #{name}, please choose from the options below
D - deposit
W - withdraw
B - show balance
E - Exit
"

  user_input = gets.chomp.capitalize
  # conditional statement" if else logic to take different path based on whether the condition was evaluated as true
  if user_input == 'D'
    puts 'Please enter your deposit amount'
    amount = gets.chomp.to_i
    if amount > 0
      balance += amount
      puts "Thanks you have succesfully deposited $#{amount}, your balance is now #{balance}"
    else
      puts 'invalid amount'
    end
  elsif user_input == 'W'
    puts 'how much would you like to withdraw?'
    amount = gets.chomp.to_i
    balance -= amount
    puts "You have succesfully withdrawn $#{amount}, take the cash, your balance is now #{balance}"
  elsif user_input == 'B'
    puts "your balance is #{balance}"
  elsif user_input == 'E'
    puts 'Goodbye'
  else
    puts 'invalid entry please go back and try again'
  end
end
all_balances[name.downcase] = balance
File.write('bank of hell.rb', all_balances.to_yaml)
