require_relative 'teller.rb'
require 'test/unit'

class TellerTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @teller = Teller.new("Sam", 5)
  end

  def fake_transactions
    10.times do
      @teller.processed_transaction
    end
  end

  def test_to_s
    fake_transactions
    string = @teller.to_s
    correct_string = "Teller Sam completed 10 transactions in 50\n"
    assert_equal(correct_string, string, "Error in Teller: to_s method")
  end

  def test_time_to_process
    fake_transactions
    time_to_process = @teller.time_to_process
    assert_equal(50, time_to_process, "Error with Teller: time_to_process method")
  end
end