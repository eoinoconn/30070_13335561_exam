require_relative 'bank.rb'
require 'test/unit'

class BankTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @bank = Bank.new
    @bank.add_account(1)
    @bank.add_account(2)
    @bank.add_account(3)
    @bank.add_account(4)
  end

  def fake_deposits
    @bank.deposit(1, 10)
    @bank.deposit(2, 20)
    @bank.deposit(3, 30)
    @bank.deposit(4, 40)
  end

  def test_each
    fake_deposits
    i = 1
    @bank.each do |account|
      assert_equal(i*10, account.balance, 'Error with each iterator')
      i += 1
    end
  end

  # Fake test
  def test_to_s
    @bank.deposit(1, 500)
    @bank.deposit(2, 500)
    @bank.withdraw(1, 300)
    @bank.deposit(4, 500)

    string = @bank.to_s
    correct_string = "Account 1 has balance €200.00
Account 2 has balance €500.00
Account 3 has balance €0.00
Account 4 has balance €500.00\n"

    assert_equal(correct_string, string, "Error in bank class")
  end



end