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



  # Fake test
  def test_to_s
    @bank.deposit(1, 500)
    @bank.deposit(2, 500)
    @bank.withdraw(1, 300)
    @bank.deposit(4, 500)

    string = @bank.to_s
    correct_string = "Account 1 has balance €200
Account 2 has balance €500
Account 3 has balance €0
Account 4 has balance €500\n"

    assert_equal(correct_string, string, "Error in bank class")
  end



end