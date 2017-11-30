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
  bank_2.add_account(line)
end



