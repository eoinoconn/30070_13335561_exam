require_relative 'bank.rb'

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
puts "\nAccount with max balance is:"
puts max.to_s

total_balance = bank_2.inject(0) { |sum, account| sum += account.balance }
average_balance = total_balance/bank_2.size

puts "\nAvergae balance"
puts average_balance

puts "\nTotal money in accounts:"
puts total_balance
