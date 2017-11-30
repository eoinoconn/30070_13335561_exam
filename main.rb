require_relative 'bank.rb'
require_relative 'teller.rb'

bank_1 = Bank.new

3.times do |x|
  bank_1.add_account(x)
  bank_1.deposit(x, (200*x + 300))
  bank_1.withdraw(x, (120*x + 150))
end

puts bank_1.to_s

bank_2 = Bank.new


IO.foreach('accounts.txt') do |line|
  bank_2.add_account(line.to_i)
end

IO.foreach('transactions.txt') do |line|
  data = line.split
  id = data[0].to_i
  transaction = data[1].to_f
  if transaction > 0.0
    bank_2.deposit(id, transaction)
  elsif transaction < 0.0
    bank_2.withdraw(id, -transaction)
  end
end

puts bank_2.to_s

max = bank_2.max


total_balance = bank_2.inject(0) { |sum, account| sum += account.balance }
average_balance = total_balance/bank_2.size

puts "\nMax account balance in bank is: €#{'%.02f' % max.balance}"
puts "average account balance in bank is: €#{'%.02f' % average_balance}"
puts "total amount of funds in bank is: €#{'%.02f' % total_balance}"

bank_3 = Bank.new
IO.foreach('accounts.txt') do |line|
  bank_3.add_account(line.to_i)
end

transactions = []

IO.foreach('transactions.txt') do |line|
  data = line.split
  id = data[0].to_i
  transaction = data[1].to_f
  transactions.push([id, transaction])
end

bank_3.add_teller(Teller.new("Jack", 1))
bank_3.add_teller(Teller.new("Emma", 2))
bank_3.add_teller(Teller.new("Paul", 3))

bank_3.process_transactions_randomly(transactions)
puts "\n"
puts bank_3.teller_state

bank_4 = Bank.new
IO.foreach('accounts.txt') do |line|
  bank_4.add_account(line.to_i)
end

transactions = []

IO.foreach('transactions.txt') do |line|
  data = line.split
  id = data[0].to_i
  transaction = data[1].to_f
  transactions.push([id, transaction])
end

bank_4.add_teller(Teller.new("Jack", 1))
bank_4.add_teller(Teller.new("Emma", 2))
bank_4.add_teller(Teller.new("Paul", 3))

bank_4.process_smart_2(transactions)
puts bank_4.teller_state
