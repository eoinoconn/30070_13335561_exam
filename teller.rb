#class to model bank teller
require_relative 'bank'

class Teller

  attr_reader :processing_time

  def initialize name, processing_time
    @name, @processing_time, @processed_transactions = name, processing_time, 0
  end

  def processed_transaction
    @processed_transactions += 1
  end

  def time_to_process
    @processing_time*@processed_transactions
  end

  def to_s
    "Teller #{@name} completed #{@processed_transactions} transactions in #{time_to_process}\n"
  end
end