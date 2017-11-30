require_relative 'bank'

class Teller

  def initialize name, processing_time
    @name, @processing_time, @processed_transactions = name, processing_time, 0
  end

  def processed_transaction
    @processed_transactions += 1
  end

  def processing_time
    @processing_time*@processed_transactions
  end

  def to_s
    "Teller #{@name} completed #{@processed_transactions} transactions in #{processing_time}\n"
  end
end